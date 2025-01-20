NSUInteger NSIntersectionRangeInclusive(NSRange a1, NSRange range1)
{
  if (a1.location != range1.location + range1.length)
  {
    if (a1.location + a1.length == range1.location) {
      a1.location = range1.location;
    }
    else {
      a1.location = NSIntersectionRange(a1, range1).location;
    }
  }
  return a1.location;
}

double TSURound(double a1)
{
  return round(a1);
}

uint64_t TSUDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (objc_opt_isKindOfClass()) {
    return a2;
  }
  return 0;
}

uint64_t TSUDeviceRGBColorSpace()
{
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  }
  return TSUDeviceRGBColorSpace_sDeviceRGBColorSpace;
}

uint64_t TSUDeviceGrayColorSpace()
{
  if (TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1) {
    dispatch_once(&TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return TSUDeviceGrayColorSpace_sDeviceGrayColorSpace;
}

uint64_t TSUDeviceCMYKColorSpace()
{
  if (TSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce != -1) {
    dispatch_once(&TSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce, &__block_literal_global_2);
  }
  return TSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace;
}

uint64_t TSUHasCJKLanguage(uint64_t result)
{
  if (result)
  {
    v1 = (void *)result;
    if (([(id)result hasPrefix:@"ja"] & 1) != 0
      || ([v1 hasPrefix:@"zh"] & 1) != 0)
    {
      return 1;
    }
    else
    {
      return [v1 hasPrefix:@"ko"];
    }
  }
  return result;
}

CGColorSpaceRef __TSUDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  TSUDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

CGColorSpaceRef __TSUDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  TSUDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

CGColorSpaceRef __TSUDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceCMYK();
  TSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

void sub_22281668C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222816C68(_Unwind_Exception *a1)
{
  MEMORY[0x223C9EE80](v1, 0x1080C40DCAC275BLL);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromMemoryLevel(unsigned int a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_26462A080[a1];
  }
}

void sub_222817E0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222817EA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222817FD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22281806C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUFlushableObjectInfo::TSUFlushableObjectInfo(uint64_t a1, void *a2)
{
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 8) = 1;
  if (objc_opt_respondsToSelector()) {
    *(_DWORD *)(a1 + 8) = [a2 reloadCost];
  }
  *(_DWORD *)(a1 + 12) = 1;
  if (objc_opt_respondsToSelector()) {
    *(_DWORD *)(a1 + 12) = [a2 flushCost];
  }
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 1;
  return a1;
}

void std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy(a1, *a2);
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>(uint64_t **a1, uint64_t a2, uint64_t *a3)
{
  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    unsigned int v7 = *(_DWORD *)(*(void *)a2 + 20);
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        unsigned int v9 = *(_DWORD *)(v5[4] + 20);
        if (v7 >= v9) {
          break;
        }
        v5 = *v8;
        v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  CGColorSpaceRef result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unsigned int v9 = (uint64_t **)a2[2];
          }
          else
          {
            unsigned int v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unsigned int v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>(uint64_t **a1, const TSUFlushableObjectInfo **a2)
{
  v3 = (uint64_t *)std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::find<TSUFlushableObjectInfo *>((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3) {
    return 0;
  }
  v4 = v3;
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__remove_node_pointer(a1, v3);
  operator delete(v4);
  return 1;
}

uint64_t std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::find<TSUFlushableObjectInfo *>(uint64_t a1, const TSUFlushableObjectInfo **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 8;
  do
  {
    uint64_t v6 = TSUFlushableObjectInfo::compareFlushingOrder(*(TSUFlushableObjectInfo **)(v3 + 32), *a2);
    uint64_t v7 = (uint64_t *)(v3 + 8);
    if (v6 != -1)
    {
      uint64_t v7 = (uint64_t *)v3;
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v5 == v2
    || TSUFlushableObjectInfo::compareFlushingOrder((TSUFlushableObjectInfo *)*a2, *(const TSUFlushableObjectInfo **)(v5 + 32)) == -1)
  {
    return v2;
  }
  return v5;
}

uint64_t TSUFlushableObjectInfo::compareFlushingOrder(TSUFlushableObjectInfo *this, const TSUFlushableObjectInfo *a2)
{
  if (this == a2) {
    return 0;
  }
  int var3 = this->var3;
  int v3 = a2->var3;
  if (var3 > v3) {
    return -1;
  }
  if (var3 < v3) {
    return 1;
  }
  int var1 = this->var1;
  float v5 = 1.0;
  if (var1 == 1) {
    float v6 = 1.5;
  }
  else {
    float v6 = 1.0;
  }
  if (!var1) {
    float v6 = 2.0;
  }
  if (!this->var2) {
    float v6 = v6 * 1.5;
  }
  int v7 = a2->var1;
  if (v7 == 1) {
    float v5 = 1.5;
  }
  if (!v7) {
    float v5 = 2.0;
  }
  if (!a2->var2) {
    float v5 = v5 * 1.5;
  }
  float v8 = v6 * (float)this->var4[1];
  float v9 = v5 * (float)a2->var4[1];
  if (v8 < v9) {
    return -1;
  }
  if (v8 > v9) {
    return 1;
  }
  float v11 = v6 * (float)this->var4[0];
  float v12 = v5 * (float)a2->var4[0];
  if (v11 >= v12) {
    return v11 > v12;
  }
  else {
    return -1;
  }
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      int v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  float v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      int v3 = a2;
      goto LABEL_7;
    }
    do
    {
      int v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  float v6 = (uint64_t **)v3[2];
  int v7 = *v6;
  if (*v6 == v3)
  {
    *float v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      int v7 = 0;
      CGColorSpaceRef result = (uint64_t *)v2;
    }
    else
    {
      int v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      CGColorSpaceRef result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        CGColorSpaceRef result = v7;
      }
      int v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *int v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    int v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      CGColorSpaceRef result = v7;
    }
    int v7 = *(uint64_t **)v12;
  }
  v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>(uint64_t **a1, uint64_t a2)
{
  int v3 = std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::find<TSUFlushableObjectInfo *>((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3) {
    return 0;
  }
  v4 = v3;
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__remove_node_pointer(a1, v3);
  operator delete(v4);
  return 1;
}

void *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::find<TSUFlushableObjectInfo *>(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 8);
  uint64_t v2 = (void *)(a1 + 8);
  int v3 = v4;
  if (!v4) {
    return v2;
  }
  unsigned int v5 = *(_DWORD *)(*(void *)a2 + 20);
  float v6 = v2;
  do
  {
    unsigned int v7 = *(_DWORD *)(v3[4] + 20);
    BOOL v8 = v7 >= v5;
    if (v7 >= v5) {
      uint64_t v9 = v3;
    }
    else {
      uint64_t v9 = v3 + 1;
    }
    if (v8) {
      float v6 = v3;
    }
    int v3 = (void *)*v9;
  }
  while (*v9);
  if (v6 == v2 || v5 < *(_DWORD *)(v6[4] + 20)) {
    return v2;
  }
  return v6;
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>(uint64_t **a1, TSUFlushableObjectInfo **a2, uint64_t *a3)
{
  unsigned int v5 = std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__find_equal<TSUFlushableObjectInfo *>((uint64_t)a1, &v9, a2);
  float v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    unsigned int v7 = (uint64_t **)v5;
    float v6 = (uint64_t *)operator new(0x28uLL);
    v6[4] = *a3;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__insert_node_at(a1, v9, v7, v6);
  }
  return v6;
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__find_equal<TSUFlushableObjectInfo *>(uint64_t a1, void *a2, TSUFlushableObjectInfo **a3)
{
  unsigned int v5 = (uint64_t *)(a1 + 8);
  v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        unsigned int v7 = v4;
        if (TSUFlushableObjectInfo::compareFlushingOrder(*a3, (const TSUFlushableObjectInfo *)v4[4]) != -1) {
          break;
        }
        v4 = (uint64_t *)*v7;
        unsigned int v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (TSUFlushableObjectInfo::compareFlushingOrder((TSUFlushableObjectInfo *)v7[4], *a3) != -1) {
        break;
      }
      unsigned int v5 = v7 + 1;
      v4 = (uint64_t *)v7[1];
    }
    while (v4);
  }
  else
  {
    unsigned int v7 = (uint64_t *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t TSUSupportsTextInteraction()
{
  if (TSUSupportsTextInteraction_onceToken != -1) {
    dispatch_once(&TSUSupportsTextInteraction_onceToken, &__block_literal_global);
  }
  return TSUSupportsTextInteraction_supportTextInteraction;
}

uint64_t __TSUSupportsTextInteraction_block_invoke()
{
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = (void *)TSUDynamicCast(v0, objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"TSUTextInteraction"));
  if (v1) {
    uint64_t result = [v1 BOOLValue];
  }
  else {
    uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.iBooks") ^ 1;
  }
  TSUSupportsTextInteraction_supportTextInteraction = result;
  return result;
}

void *TSUFindFirstResponderView(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v2 = [a1 isFirstResponder];
  if (!v1 || (v2 & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    int v3 = objc_msgSend(v1, "subviews", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t ResponderView = TSUFindFirstResponderView(*(void *)(*((void *)&v10 + 1) + 8 * i));
          if (ResponderView) {
            return (void *)ResponderView;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v1 = 0;
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

BOOL TSUPhoneUI()
{
  if (p_TSUIdiom_sIdiomInitialized == 1)
  {
    uint64_t v0 = p_TSUIdiom_sIdiom;
  }
  else
  {
    uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
    p_TSUIdiom_sIdiom = v0;
    p_TSUIdiom_sIdiomInitialized = 1;
  }
  return v0 == 0;
}

BOOL TSUPadUI()
{
  if (p_TSUIdiom_sIdiomInitialized == 1)
  {
    uint64_t v0 = p_TSUIdiom_sIdiom;
  }
  else
  {
    uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
    p_TSUIdiom_sIdiom = v0;
    p_TSUIdiom_sIdiomInitialized = 1;
  }
  return v0 == 1;
}

BOOL TSUPhoneUI568H()
{
  if (p_TSUIdiom_sIdiomInitialized == 1)
  {
    if (p_TSUIdiom_sIdiom) {
      return 0;
    }
  }
  else
  {
    p_TSUIdiom_sIdiom = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
    p_TSUIdiom_sIdiomInitialized = 1;
    if (p_TSUIdiom_sIdiom) {
      return 0;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  return v1 == 568.0;
}

BOOL TSUPhoneUI480H()
{
  if (p_TSUIdiom_sIdiomInitialized == 1)
  {
    if (p_TSUIdiom_sIdiom) {
      return 0;
    }
  }
  else
  {
    p_TSUIdiom_sIdiom = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
    p_TSUIdiom_sIdiomInitialized = 1;
    if (p_TSUIdiom_sIdiom) {
      return 0;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  return v1 == 480.0;
}

uint64_t TSUPadIsFirstGen()
{
  if ((TSUPadIsFirstGen_sIsFirstGenInitialized & 1) == 0)
  {
    size_t size = 0;
    sysctlbyname("hw.machine", 0, &size, 0, 0);
    uint64_t v0 = malloc_type_malloc(size, 0x8E4D8B2BuLL);
    sysctlbyname("hw.machine", v0, &size, 0, 0);
    double v1 = (void *)[NSString stringWithUTF8String:v0];
    free(v0);
    if ([v1 isEqualToString:@"iPad1,1"]) {
      TSUPadIsFirstGen_sIsFirstGen = 1;
    }
    TSUPadIsFirstGen_sIsFirstGenInitialized = 1;
  }
  return TSUPadIsFirstGen_sIsFirstGen;
}

double TSUStatusBarHeight()
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "windowScene"), "statusBarManager"), "statusBarFrame");
  float v1 = v0;
  float v3 = v2;
  return fminf(v1, v3);
}

void TSUScreenScale()
{
  if (*(double *)&TSUScreenScale_screenScale < 0.0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen", *(double *)&TSUScreenScale_screenScale), "scale");
    TSUScreenScale_screenScale = v0;
  }
}

__CFString *NSStringFromUIGestureRecognizerState(unint64_t a1)
{
  if (a1 < 5) {
    return off_26462A0C0[a1];
  }
  if (a1 == 5) {
    return @"UIGestureRecognizerStateFailed";
  }
  return @"#Unknown UIGestureRecognizerState#";
}

uint64_t NSStringFromCATransform3D(void *a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"[ %f %f %f %f; %f %f %f %f; %f %f %f %f; %f %f %f %f ]",
           *a1,
           a1[1],
           a1[2],
           a1[3],
           a1[4],
           a1[5],
           a1[6],
           a1[7],
           a1[8],
           a1[9],
           a1[10],
           a1[11],
           a1[12],
           a1[13],
           a1[14],
           a1[15],
           0);
}

BOOL TSUStatusBarIsLandscape()
{
  return (unint64_t)(objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation")- 3) < 2;
}

double TSUMaxTextureSize()
{
  if (TSUMaxTextureSize_s_maxTextureSizeOnce != -1) {
    dispatch_once(&TSUMaxTextureSize_s_maxTextureSizeOnce, &__block_literal_global_39);
  }
  return *(double *)&TSUMaxTextureSize_s_maxTextureSize;
}

uint64_t __TSUMaxTextureSize_block_invoke()
{
  uint64_t result = TSUPadIsFirstGen();
  double v1 = 4096.0;
  if (result) {
    double v1 = 2048.0;
  }
  TSUMaxTextureSize_s_maxTextureSize = *(void *)&v1;
  return result;
}

void *TSUBuildIndexFromBuildVersion(void *a1)
{
  uint64_t v16 = 0;
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AE8], "regularExpressionWithPattern:options:error:", @"([0-9]+)([A-Za-z])([0-9]+)([A-Za-z])?", 1, &v16), "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  if (result)
  {
    float v3 = result;
    uint64_t v4 = [result rangeAtIndex:1];
    uint64_t v6 = (int)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v4, v5), "intValue");
    uint64_t v7 = [v3 rangeAtIndex:2];
    uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v7, v8), "uppercaseString"), "characterAtIndex:", 0);
    uint64_t v10 = [v3 rangeAtIndex:3];
    uint64_t v12 = (int)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v10, v11), "intValue");
    uint64_t v13 = [v3 rangeAtIndex:4];
    uint64_t v15 = 0;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v13, v14), "uppercaseString"), "characterAtIndex:", 0)- 64;
    }
    return (void *)(v15 | (32 * (((v9 << 14) - 0x100000) | (v6 << 19) | v12)));
  }
  return result;
}

void *TSUBuildIndexSetFromString(void *a1)
{
  uint64_t v21 = 0;
  double v2 = (void *)[MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([0-9A-Za-z]+)([-,])? *" options:1 error:&v21];
  uint64_t v3 = [a1 length];
  v20 = (void *)[MEMORY[0x263F089C8] indexSet];
  if (!v3) {
    return v20;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = objc_msgSend(v2, "firstMatchInString:options:range:", a1, 0, v4, v3, v20);
    if (!v6) {
      break;
    }
    uint64_t v7 = v6;
    uint64_t v8 = [v6 rangeAtIndex:1];
    uint64_t v10 = objc_msgSend(a1, "substringWithRange:", v8, v9);
    uint64_t v11 = [v7 rangeAtIndex:2];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([0 isEqualToString:@"-"]) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v13 = objc_msgSend(a1, "substringWithRange:", v11, v12);
      if ([v13 isEqualToString:@"-"])
      {
LABEL_8:
        if (!v5) {
          uint64_t v5 = v10;
        }
        goto LABEL_21;
      }
      if (v13 && ![v13 isEqualToString:@","]) {
        goto LABEL_21;
      }
    }
    if (v5)
    {
      uint64_t v15 = TSUBuildIndexFromBuildVersion(v5);
      uint64_t v16 = TSUBuildIndexFromBuildVersion(v10);
      uint64_t v5 = 0;
      if (!v15 || !v16 || v16 < v15) {
        goto LABEL_21;
      }
      objc_msgSend(v20, "addIndexesInRange:", v15, v16 - v15 + 1);
    }
    else
    {
      uint64_t v14 = TSUBuildIndexFromBuildVersion(v10);
      if (v14) {
        [v20 addIndex:v14];
      }
    }
    uint64_t v5 = 0;
LABEL_21:
    [v7 rangeAtIndex:0];
    v4 += v17;
    v3 -= v17;
  }
  while (v3);
  if (v5)
  {
    uint64_t v18 = TSUBuildIndexFromBuildVersion(v5);
    if (v18) {
      objc_msgSend(v20, "addIndexesInRange:", v18, 0x7FFFFFFFFFFFFFFELL - (void)v18);
    }
  }
  return v20;
}

uint64_t TSUProductBuildVersion()
{
  return [NSString stringWithFormat:@"%@", objc_msgSend((id)objc_msgSend(NSDictionary, "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundlePath"), "stringByAppendingPathComponent:", @"../../CoreServices/SystemVersion.plist", "stringByStandardizingPath")), "objectForKey:", @"ProductBuildVersion"];
}

uint64_t TSUProductName()
{
  return [NSString stringWithFormat:@"%@", objc_msgSend((id)objc_msgSend(NSDictionary, "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundlePath"), "stringByAppendingPathComponent:", @"../../CoreServices/SystemVersion.plist", "stringByStandardizingPath")), "objectForKey:", @"ProductName"];
}

void *TSUProductBuildIndex()
{
  uint64_t result = (void *)TSUProductBuildIndex_s_buildIndex;
  if (!TSUProductBuildIndex_s_buildIndex)
  {
    double v1 = (void *)TSUProductBuildVersion();
    uint64_t result = TSUBuildIndexFromBuildVersion(v1);
    TSUProductBuildIndex_s_buildIndex = (uint64_t)result;
  }
  return result;
}

uint64_t TSUValidPlatformTags()
{
  uint64_t result = TSUValidPlatformTags_validPlatforms;
  if (!TSUValidPlatformTags_validPlatforms)
  {
    TSUValidPlatformTags_validPlatforms = [MEMORY[0x263EFF9C0] setWithObject:@"ios"];
    p_appendPlatformComponent((void *)TSUValidPlatformTags_validPlatforms, @"-arm");
    double v1 = (void *)TSUValidPlatformTags_validPlatforms;
    uint64_t v2 = TSUScreenScale_screenScale;
    if (*(double *)&TSUScreenScale_screenScale < 0.0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen", *(double *)&TSUScreenScale_screenScale), "scale");
      TSUScreenScale_screenScale = v2;
    }
    if (*(double *)&v2 == 2.0) {
      uint64_t v3 = @"@2x";
    }
    else {
      uint64_t v3 = @"@1x";
    }
    p_appendPlatformComponent(v1, (uint64_t)v3);
    [(id)TSUValidPlatformTags_validPlatforms addObject:@"default"];
    id v4 = (id)TSUValidPlatformTags_validPlatforms;
    return TSUValidPlatformTags_validPlatforms;
  }
  return result;
}

uint64_t p_appendPlatformComponent(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a1);
        }
        [v4 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@%@", *(void *)(*((void *)&v10 + 1) + 8 * v8++), a2)];
      }
      while (v6 != v8);
      uint64_t v6 = [a1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return [a1 unionSet:v4];
}

__CFString *TSUPlatformTag()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v0 = (void *)TSUValidPlatformTags();
  uint64_t v1 = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v1) {
    return &stru_26D4F03D0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)v10;
  id v4 = &stru_26D4F03D0;
  do
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if (*(void *)v10 != v3) {
        objc_enumerationMutation(v0);
      }
      uint64_t v6 = *(__CFString **)(*((void *)&v9 + 1) + 8 * i);
      if (([(__CFString *)v6 isEqualToString:@"default", (void)v9] & 1) == 0)
      {
        unint64_t v7 = [(__CFString *)v6 length];
        if (v7 > [(__CFString *)v4 length]) {
          id v4 = v6;
        }
      }
    }
    uint64_t v2 = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v2);
  return v4;
}

uint64_t TSUPlatformSpecificStringForBuildIndex(void *a1, uint64_t a2)
{
  uint64_t v28 = 0;
  id v4 = (void *)[MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?:\\[(ios|ios-sim|ios-sim@1x|ios-sim@2x|ios-arm|ios@2x|mac|mac32|mac64|default)(?:\\:([^\\]]*))?\\])?([^\\[]*)" options:1 error:&v28];
  uint64_t v5 = [a1 length];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = objc_msgSend(v4, "firstMatchInString:options:range:", a1, 0, v7, v6);
      if (!v8) {
        break;
      }
      long long v9 = v8;
      uint64_t v10 = [v8 rangeAtIndex:1];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v10;
      }
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v11;
      }
      uint64_t v14 = objc_msgSend(a1, "substringWithRange:", v12, v13);
      uint64_t v15 = [v9 rangeAtIndex:2];
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = v15;
      }
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = v16;
      }
      v19 = objc_msgSend(a1, "substringWithRange:", v17, v18);
      uint64_t v20 = [v9 rangeAtIndex:3];
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = v20;
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = v21;
      }
      uint64_t v24 = objc_msgSend(a1, "substringWithRange:", v22, v23);
      if (![v14 length]
        || [(id)TSUValidPlatformTags() containsObject:v14])
      {
        if (![v19 length]) {
          return v24;
        }
        uint64_t v25 = TSUBuildIndexSetFromString(v19);
        if (v25)
        {
          if ([v25 containsIndex:a2]) {
            return v24;
          }
        }
      }
      [v9 rangeAtIndex:0];
      v7 += v26;
      v6 -= v26;
    }
    while (v6);
  }
  return 0;
}

uint64_t TSUPlatformSpecificString(void *a1)
{
  uint64_t v2 = TSUProductBuildIndex();
  return TSUPlatformSpecificStringForBuildIndex(a1, (uint64_t)v2);
}

unint64_t NSExpandedRange(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v5 = a4 + a5;
  if (a4 + a3 >= a1) {
    unint64_t v6 = a4;
  }
  else {
    unint64_t v6 = a1 - a3;
  }
  if (a1 + a2 + a3 < v5) {
    unint64_t v5 = a1 + a2 + a3;
  }
  if (v6 >= v5) {
    return v5;
  }
  else {
    return v6;
  }
}

uint64_t TSUCompareWithComparators(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(a3);
      }
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))();
      if (result) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t result = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v5 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t SFUBundle()
{
  if (SFUBundle_onceToken != -1) {
    dispatch_once(&SFUBundle_onceToken, &__block_literal_global_0);
  }
  return SFUBundle_sSFUBundle;
}

uint64_t __SFUBundle_block_invoke()
{
  uint64_t result = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  SFUBundle_sSFUBundle = result;
  return result;
}

uint64_t SFUMainBundle()
{
  uint64_t result = SFUMainBundle_sMainBundle;
  if (!SFUMainBundle_sMainBundle)
  {
    uint64_t result = [MEMORY[0x263F086E0] mainBundle];
    SFUMainBundle_sMainBundle = result;
  }
  return result;
}

uint64_t TSUHash(char *a1, uint64_t a2)
{
  for (uint64_t result = 0xCBF29CE484222325; a2; --a2)
  {
    uint64_t v4 = *a1++;
    uint64_t result = 0x100000001B3 * (result ^ v4);
  }
  return result;
}

uint64_t TSUHashWithSeed(char *a1, uint64_t a2, uint64_t a3)
{
  for (; a2; --a2)
  {
    uint64_t v3 = *a1++;
    a3 = 0x100000001B3 * (a3 ^ v3);
  }
  return a3;
}

void sub_22281A8E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22281AA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t TSUMemoryUsed()
{
  MEMORY[0x270FA5388]();
  uint64_t v36 = *MEMORY[0x263EF8340];
  task_name_t v0 = *MEMORY[0x263EF8960];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  memset(task_info_out, 0, sizeof(task_info_out));
  mach_msg_type_number_t task_info_outCnt = 10;
  mach_error_t v1 = task_info(v0, 0x12u, task_info_out, &task_info_outCnt);
  if (!v1) {
    return *(void *)&task_info_out[3];
  }
  uint64_t v2 = mach_error_string(v1);
  NSLog((NSString *)@"Unable to get task information: %s", v2);
  return 0;
}

uint64_t TSUMemoryUsedVirtual()
{
  MEMORY[0x270FA5388]();
  uint64_t v37 = *MEMORY[0x263EF8340];
  task_name_t v0 = *MEMORY[0x263EF8960];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)task_info_out = 0u;
  long long v6 = 0u;
  mach_msg_type_number_t task_info_outCnt = 10;
  mach_error_t v1 = task_info(v0, 0x12u, task_info_out, &task_info_outCnt);
  if (!v1) {
    return *(void *)&task_info_out[1];
  }
  uint64_t v2 = mach_error_string(v1);
  NSLog((NSString *)@"Unable to get task information: %s", v2);
  return 0;
}

vm_size_t TSUMemoryFree()
{
  host_t v0 = MEMORY[0x223C9F420]();
  vm_size_t v7 = 0;
  mach_msg_type_number_t host_info_outCnt = 15;
  host_page_size(v0, &v7);
  long long v5 = 0u;
  memset(v6, 0, sizeof(v6));
  *(_OWORD *)host_info_out = 0u;
  mach_error_t v1 = host_statistics(v0, 2, host_info_out, &host_info_outCnt);
  if (!v1) {
    return v7 * host_info_out[0];
  }
  uint64_t v2 = mach_error_string(v1);
  NSLog((NSString *)@"Unable to get information: %s", v2);
  return 0;
}

uint64_t localReader(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *a4 = a2;
  return 0;
}

void processPointer(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (a5)
  {
    uint64_t v5 = 0;
    long long v6 = (void *)a2[1];
    vm_size_t v7 = (uint64_t *)a2[2];
    uint64_t v8 = a2[5];
    long long v9 = (void *)a2[6];
    uint64_t v11 = a2[3];
    uint64_t v10 = a2[4];
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = a2[3];
    }
    uint64_t v13 = a5;
    do
    {
      long long v14 = (uint64_t **)(a4 + 16 * v5);
      uint64_t v15 = **v14;
      if (v15)
      {
        uint64_t v16 = (uint64_t)v14[1];
        BOOL v17 = v16 < 33 || v15 < v10;
        BOOL v18 = !v17 && v15 <= v8;
        if (v18 && v11 >= 1)
        {
          long long v20 = v6;
          long long v21 = v7;
          uint64_t v22 = v12;
          do
          {
            if (v15 == *v20 && v16 >= *v21) {
              *v9 += (int)v16;
            }
            ++v21;
            ++v20;
            --v22;
          }
          while (v22);
        }
      }
      ++v5;
    }
    while (v5 != v13);
  }
}

malloc_zone_t *TSULeaksOnCommonClasses()
{
  v12[7] = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  uint64_t result = malloc_default_zone();
  if (result)
  {
    mach_error_t v1 = result;
    if (result->introspect)
    {
      introspect = result->introspect;
      uint64_t v3 = 0;
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      do
      {
        Class = objc_getClass((&TSULeaksOnCommonClasses_interestingNames)[v3]);
        *(void *)&v11[v3 * 8] = Class;
        if (Class)
        {
          if ((uint64_t)v4 > (uint64_t)Class || v4 == 0) {
            uint64_t v4 = Class;
          }
          if ((uint64_t)v5 < (uint64_t)Class || v5 == 0) {
            uint64_t v5 = Class;
          }
          Class = (objc_class *)class_getInstanceSize(Class);
        }
        *(void *)&v10[v3 * 8] = Class;
        ++v3;
      }
      while (v3 != 18);
      v12[0] = &TSULeaksOnCommonClasses_interestingNames;
      v12[1] = v11;
      v12[2] = v10;
      v12[3] = 18;
      v12[4] = v4;
      v12[5] = v5;
      v12[6] = &v9;
      ((void (*)(void, void *, uint64_t, malloc_zone_t *, uint64_t (*)(uint64_t, uint64_t, uint64_t, void *), void (*)(uint64_t, void *, uint64_t, uint64_t, unsigned int)))introspect->enumerator)(*MEMORY[0x263EF8960], v12, 1, v1, localReader, processPointer);
      return (malloc_zone_t *)v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void TSUDateFormatterInit()
{
  if ((dateFormatterIsInitted & 1) == 0)
  {
    sDateFormatterCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
    sDateFormatterLocale = (uint64_t)TSUCopyCurrentLocaleWithGregorianCalendar();
    dateFormatterIsInitted = 1;
  }
}

CFLocaleRef TSUCopyCurrentLocaleWithGregorianCalendar()
{
  CFLocaleRef v0 = CFLocaleCopyCurrent();
  mach_error_t v1 = (const void *)*MEMORY[0x263EFFCA0];
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(v0, (CFLocaleKey)*MEMORY[0x263EFFCA0]);
  uint64_t v3 = (const void *)*MEMORY[0x263EFFC90];
  CFComparisonResult v4 = CFStringCompare(Value, (CFStringRef)*MEMORY[0x263EFFC90], 0);
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v6 = (const __CFString *)MEMORY[0x223C9E410](v0);
  if (v4)
  {
    CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v5, v6);
    MutableCopy = CFDictionaryCreateMutableCopy(v5, 0, ComponentsFromLocaleIdentifier);
    CFDictionarySetValue(MutableCopy, v1, v3);
    CFStringRef LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(v5, MutableCopy);
    CFLocaleRef v10 = CFLocaleCreate(v5, LocaleIdentifierFromComponents);
    CFRelease(v0);
    CFRelease(ComponentsFromLocaleIdentifier);
    CFRelease(MutableCopy);
    CFLocaleRef v0 = (const __CFLocale *)LocaleIdentifierFromComponents;
  }
  else
  {
    CFLocaleRef v10 = CFLocaleCreate(v5, v6);
  }
  CFRelease(v0);
  return v10;
}

void TSUDateFormatterShutdown()
{
  if (dateFormatterIsInitted == 1)
  {

    CFRelease((CFTypeRef)sDateFormatterLocale);
    dateFormatterIsInitted = 0;
  }
}

id TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(const __CFLocale *a1)
{
  CFLocaleRef v2 = a1;
  if (!a1) {
    CFLocaleRef v2 = CFLocaleCopyCurrent();
  }
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v4 = (const __CFString *)MEMORY[0x223C9E410](v2);
  CanonicalLocaleIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLocaleIdentifierFromString(v3, v4);
  CFIndex Length = [(__CFString *)CanonicalLocaleIdentifierFromString rangeOfString:@"@"];
  if (Length == 0x7FFFFFFFFFFFFFFFLL) {
    CFIndex Length = CFStringGetLength(CanonicalLocaleIdentifierFromString);
  }
  uint64_t v7 = [(__CFString *)CanonicalLocaleIdentifierFromString substringToIndex:Length];
  uint64_t v8 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 pathForResource:v7 ofType:@"plist" inDirectory:@"DateTimeFormats"];
  CFRelease(CanonicalLocaleIdentifierFromString);
  if (!v9)
  {
    CFStringRef v10 = (const __CFString *)MEMORY[0x223C9E410](v2);
    uint64_t v9 = [v8 pathForResource:objc_msgSend(NSString, "stringWithFormat:", @"fallback-%@", off_26462A110[TSUDateComponentOrderingForLocale(v10)]), @"plist", @"DateTimeFormats" ofType inDirectory];
    if (!v9)
    {
      id v11 = +[TSUAssertionHandler currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"CFDictionaryRef TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(CFLocaleRef)"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateFormatter.m"), 124, @"Unable to find path for plist containing date time formats!");
    }
  }
  id v13 = (id)[NSDictionary dictionaryWithContentsOfFile:v9];
  if (!a1) {
    CFRelease(v2);
  }
  return v13;
}

uint64_t TSUDateComponentOrderingForLocale(CFLocaleIdentifier localeIdentifier)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFLocaleRef v2 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], localeIdentifier);
  CFAllocatorRef v3 = CFDateFormatterCreate(v1, v2, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  CFRelease(v2);
  CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(v1, @"en_US");
  CFLocaleRef v5 = CFLocaleCreate(v1, CanonicalLocaleIdentifierFromString);
  CFRelease(CanonicalLocaleIdentifierFromString);
  CFStringRef v6 = CFDateFormatterCreate(v1, v5, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFRelease(v5);
  CFStringRef Format = CFDateFormatterGetFormat(v3);
  CFDateFormatterSetFormat(v6, Format);
  CFRelease(v3);
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFC10];
  CFTimeZoneRef v9 = TSUGetGMTTimeZone();
  CFDateFormatterSetProperty(v6, v8, v9);
  *(void *)&v18.year = 0x402000007CFLL;
  v18.second = 0.0;
  CFAbsoluteTime AbsoluteTime = CFGregorianDateGetAbsoluteTime(v18, 0);
  StringWithCFAbsoluteTime AbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v1, v6, AbsoluteTime);
  CFRelease(v6);
  unint64_t v12 = [(__CFString *)StringWithAbsoluteTime rangeOfString:@"99"];
  unint64_t v13 = [(__CFString *)StringWithAbsoluteTime rangeOfString:@"2"];
  unint64_t v14 = [(__CFString *)StringWithAbsoluteTime rangeOfString:@"4"];
  CFRelease(StringWithAbsoluteTime);
  if (v13 >= v12)
  {
    if (v14 < v12) {
      return 1;
    }
    BOOL v16 = v14 > v13;
    unsigned int v17 = 4;
  }
  else
  {
    if (v14 < v13) {
      return 0;
    }
    BOOL v16 = v14 > v12;
    unsigned int v17 = 2;
  }
  if (v16) {
    return v17 + 1;
  }
  else {
    return v17;
  }
}

CFStringRef TSUDateFormatterCreateStringFromDateWithISO8601Format(const __CFDate *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFLocaleRef v3 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"en_US");
  CFStringRef v4 = CFDateFormatterCreate(v2, v3, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFRelease(v3);
  CFDateFormatterSetFormat(v4, @"yyyy-MM-dd'T'HH:mm:ssZZ");
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFC10];
  CFTimeZoneRef v6 = TSUGetGMTTimeZone();
  CFDateFormatterSetProperty(v4, v5, v6);
  CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(v2, v4, a1);
  CFRelease(v4);
  return StringWithDate;
}

CFTimeZoneRef TSUGetGMTTimeZone()
{
  CFTimeZoneRef result = (CFTimeZoneRef)TSUGetGMTTimeZone_sGMTTimeZone;
  if (!TSUGetGMTTimeZone_sGMTTimeZone)
  {
    CFTimeZoneRef result = CFTimeZoneCreateWithTimeIntervalFromGMT((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0);
    TSUGetGMTTimeZone_sGMTTimeZone = (uint64_t)result;
    if (!result)
    {
      id v1 = +[TSUAssertionHandler currentHandler];
      uint64_t v2 = [NSString stringWithUTF8String:"CFTimeZoneRef TSUGetGMTTimeZone(void)"];
      objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateFormatter.m"), 268, @"GMTTimeZone() couldn't create time zone");
      return (CFTimeZoneRef)TSUGetGMTTimeZone_sGMTTimeZone;
    }
  }
  return result;
}

CFDateRef TSUDateFormatterCreateDateFromStringWithISO8601Format(const __CFString *a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFLocaleRef v3 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"en_US");
  CFStringRef v4 = CFDateFormatterCreate(v2, v3, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFRelease(v3);
  CFDateFormatterSetFormat(v4, @"yyyy-MM-dd'T'HH:mm:ssZZ");
  CFIndex Length = CFStringGetLength(a1);
  v11.location = 0;
  v11.length = Length;
  CFDateRef v6 = CFDateFormatterCreateDateFromString(v2, v4, a1, &v11);
  CFRelease(v4);
  if (v6) {
    BOOL v7 = v11.location == 0;
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = v7;
  int v9 = v8 & (v11.length == Length);
  if (v9) {
    CFDateRef result = v6;
  }
  else {
    CFDateRef result = 0;
  }
  if ((v9 & 1) == 0)
  {
    if (v6)
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

__CFString *TSUDateFormatterCopyFormatStringForDateAndTimeStyles(CFDateFormatterStyle a1, CFDateFormatterStyle a2)
{
  CFLocaleRef v4 = TSUCopyCurrentLocaleWithGregorianCalendar();
  CFStringRef v5 = CFDateFormatterCreate(0, v4, a1, kCFDateFormatterNoStyle);
  CFDateRef v6 = CFDateFormatterCreate(0, v4, kCFDateFormatterNoStyle, a2);
  CFRelease(v4);
  Mutable = CFStringCreateMutable(0, 200);
  CFStringRef Format = CFDateFormatterGetFormat(v5);
  CFStringRef v9 = CFDateFormatterGetFormat(v6);
  CFStringAppend(Mutable, Format);
  if (CFStringGetLength(Format) >= 1 && CFStringGetLength(v9) >= 1) {
    CFStringAppend(Mutable, @" ");
  }
  CFStringAppend(Mutable, v9);
  CFRelease(v5);
  CFRelease(v6);
  return Mutable;
}

CFStringRef TSUDateFormatterStringFromDateWithFormat(const __CFDate *a1, const __CFString *a2)
{
  CFLocaleRef v4 = (void *)sDateFormatterCache;
  objc_sync_enter((id)sDateFormatterCache);
  CFStringRef v5 = (__CFDateFormatter *)[(id)sDateFormatterCache objectForKey:a2];
  if (!v5)
  {
    CFStringRef v5 = CFDateFormatterCreate(0, (CFLocaleRef)sDateFormatterLocale, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFTimeZoneRef v6 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(v5, (CFStringRef)*MEMORY[0x263EFFC10], v6);
    CFDateFormatterSetFormat(v5, a2);
    [(id)sDateFormatterCache setObject:v5 forKey:a2];
    CFRelease(v5);
  }
  CFStringRef v7 = (id)CFDateFormatterCreateStringWithDate(0, v5, a1);
  objc_sync_exit(v4);
  return v7;
}

void sub_22281C510(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFStringRef TSUShortestCompleteDateTimeFormat()
{
  CFStringRef result = (CFStringRef)TSUShortestCompleteDateTimeFormat_sFormat;
  if (!TSUShortestCompleteDateTimeFormat_sFormat)
  {
    CFStringRef result = CFDateFormatterCreateDateFormatFromTemplate(0, @"yMdjms", 0, (CFLocaleRef)sDateFormatterLocale);
    TSUShortestCompleteDateTimeFormat_sCFStringRef Format = (uint64_t)result;
  }
  return result;
}

CFStringRef TSUShortestCompleteDateOnlyFormat()
{
  CFStringRef result = (CFStringRef)TSUShortestCompleteDateOnlyFormat_sFormat;
  if (!TSUShortestCompleteDateOnlyFormat_sFormat)
  {
    CFStringRef result = CFDateFormatterCreateDateFormatFromTemplate(0, @"yMd", 0, (CFLocaleRef)sDateFormatterLocale);
    TSUShortestCompleteDateOnlyFormat_sCFStringRef Format = (uint64_t)result;
  }
  return result;
}

uint64_t TSUDefaultDateTimeFormat()
{
  uint64_t result = TSUDefaultDateTimeFormat_sFormat;
  if (!TSUDefaultDateTimeFormat_sFormat)
  {
    id v1 = objc_opt_class();
    objc_sync_enter(v1);
    if (!TSUDefaultDateTimeFormat_sFormat)
    {
      CFAllocatorRef v2 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
      __dmb(0xBu);
      TSUDefaultDateTimeFormat_sCFStringRef Format = (uint64_t)v2;
    }
    objc_sync_exit(v1);
    return TSUDefaultDateTimeFormat_sFormat;
  }
  return result;
}

void sub_22281C610(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUGregorianUnitsPresentInFormatString(void *a1)
{
  uint64_t v2 = [a1 rangeOfString:@"y"] != 0x7FFFFFFFFFFFFFFFLL;
  if ([a1 rangeOfString:@"M"] != 0x7FFFFFFFFFFFFFFFLL) {
    v2 |= 2uLL;
  }
  if ([a1 rangeOfString:@"d"] != 0x7FFFFFFFFFFFFFFFLL) {
    v2 |= 4uLL;
  }
  if ([a1 rangeOfString:@"h" options:1] != 0x7FFFFFFFFFFFFFFFLL
    || [a1 rangeOfString:@"k" options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 |= 8uLL;
  }
  if ([a1 rangeOfString:@"m"] != 0x7FFFFFFFFFFFFFFFLL) {
    v2 |= 0x10uLL;
  }
  if ([a1 rangeOfString:@"s"] == 0x7FFFFFFFFFFFFFFFLL) {
    return v2;
  }
  else {
    return v2 | 0x20;
  }
}

CFDateRef TSUCreateDateWithGregorianUnitsSetToDefaultValue(uint64_t a1, void *a2)
{
  CFTimeZoneRef v4 = CFTimeZoneCopyDefault();
  CFAbsoluteTime v5 = MEMORY[0x223C9E280](a1);
  CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(v5, 0);
  uint64_t v7 = HIDWORD(*(void *)&GregorianDate.year);
  uint64_t v8 = *(void *)&GregorianDate.year >> 40;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  unint64_t v10 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(Current, v4);
  unint64_t v11 = TSUGregorianUnitsPresentInFormatString(a2);
  char v12 = ~(_BYTE)v11;
  if ((v11 & 7) != 0)
  {
    if (v11) {
      unsigned int year = GregorianDate.year;
    }
    else {
      unsigned int year = v10;
    }
    if ((~(_BYTE)v11 & 2) != 0) {
      LOBYTE(v7) = 1;
    }
    if ((~(_BYTE)v11 & 4) != 0) {
      LOBYTE(v8) = 1;
    }
  }
  else if (v11 >= 8)
  {
    if (v11) {
      unsigned int year = GregorianDate.year;
    }
    else {
      unsigned int year = v10;
    }
    if ((~(_BYTE)v11 & 2) != 0) {
      uint64_t v7 = HIDWORD(v10);
    }
    if ((~(_BYTE)v11 & 4) != 0) {
      uint64_t v8 = v10 >> 40;
    }
  }
  else
  {
    id v14 = +[TSUAssertionHandler currentHandler];
    uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", "CFDateRef TSUCreateDateWithGregorianUnitsSetToDefaultValue(CFDateRef, CFStringRef)");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateFormatter.m"), 380, @"this line must not be reached");
    unsigned int year = GregorianDate.year;
  }
  unint64_t v16 = *(void *)&GregorianDate.year & 0xFF00000000000000;
  uint64_t v17 = *(void *)&GregorianDate.year & 0xFF000000000000;
  if ((v12 & 0x10) != 0) {
    unint64_t v16 = 0;
  }
  if ((v12 & 0x20) != 0) {
    v18.second = 0.0;
  }
  else {
    v18.second = GregorianDate.second;
  }
  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if ((v12 & 8) != 0) {
    uint64_t v17 = 0;
  }
  *(void *)&v18.unsigned int year = (v16 | v17) & 0xFFFF000000000000 | year | ((unint64_t)v7 << 32) & 0xFFFF00FFFFFFFFFFLL | ((unint64_t)v8 << 40);
  CFAbsoluteTime AbsoluteTime = CFGregorianDateGetAbsoluteTime(v18, 0);
  CFDateRef v21 = CFDateCreate(v19, AbsoluteTime);
  CFRelease(v4);
  return v21;
}

uint64_t TSUDateComponentOrderingForCurrentLocale()
{
  CFLocaleRef v0 = CFLocaleCopyCurrent();
  CFStringRef v1 = (const __CFString *)MEMORY[0x223C9E410]();
  uint64_t v2 = TSUDateComponentOrderingForLocale(v1);
  CFRelease(v0);
  return v2;
}

uint64_t TSUDateComponentOrderingForNonCachedCurrentLocale()
{
  id v0 = (id)[MEMORY[0x263EFF960] currentLocale];
  CFStringRef v1 = (const __CFString *)MEMORY[0x223C9E410]();
  uint64_t v2 = TSUDateComponentOrderingForLocale(v1);
  CFRelease(v0);
  return v2;
}

id TSUCreateArrayOfDateFormatStringsForLocale(const __CFLocale *a1)
{
  id v1 = TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(a1);
  id v2 = (id)[v1 objectForKey:TSUDateFormatterDateTimeFormatInfoAcceptedDateFormats];

  return v2;
}

id TSUCreateArrayOfTimeFormatStringsForLocale(const __CFLocale *a1)
{
  id v1 = TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(a1);
  id v2 = (id)[v1 objectForKey:TSUDateFormatterDateTimeFormatInfoAcceptedTimeFormats];

  return v2;
}

uint64_t TSUCreateDateFromStringWithPreferredFormat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    CFStringRef v9 = [[TSUDateParser alloc] initWithLocale:a2];
    uint64_t v10 = [(TSUDateParser *)v9 newDateFromString:a1 preferredFormatString:a3 successfulFormatString:a4 tryAggressiveFormats:a5];
  }
  else
  {
    unint64_t v11 = objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "checkoutDateParser");
    uint64_t v10 = [v11 newDateFromString:a1 preferredFormatString:a3 successfulFormatString:a4 tryAggressiveFormats:a5];
    objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "returnDateParser:", v11);
  }
  return v10;
}

uint64_t TSUCreateDateFromString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TSUCreateDateFromStringWithPreferredFormat(a1, a2, 0, a3, 0);
}

void sub_22281E5F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUDurationFormatterStringFromTimeIntervalWithFormat(void *a1, double a2)
{
  return TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(a1, 0, 0, a2);
}

uint64_t TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(void *a1, double *a2, int *a3, _DWORD *a4, int a5)
{
  LODWORD(v5) = a5;
  char v62 = 0;
  id v10 = objc_alloc_init(MEMORY[0x263F086B0]);
  unint64_t v11 = TSUDurationFormatterTokensFromString(a1, &v62);
  id v12 = v11;

  if (!v11 || ![v11 count])
  {
LABEL_38:

    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (v62)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v13 = [v11 count];
    uint64_t v14 = v13;
    v59 = a2;
    if (v13)
    {
      uint64_t v15 = 0;
      char v16 = 0;
      unsigned int v17 = 0;
      uint64_t v18 = v13 - 2;
      do
      {
        CFAllocatorRef v19 = (void *)[v11 objectAtIndex:v15];
        objc_opt_class();
        v17 += objc_opt_isKindOfClass() & 1;
        char v20 = [v19 isEqual:@"."];
        if (v18 == v15) {
          char v21 = v20;
        }
        else {
          char v21 = 0;
        }
        v16 |= v21;
        ++v15;
      }
      while (v14 != v15);
    }
    else
    {
      unsigned int v17 = 0;
      char v16 = 0;
    }
    int v35 = v17 - (v16 & 1);
    a2 = v59;
    uint64_t v5 = v5;
    if (v35 > 5) {
      goto LABEL_38;
    }
    int v37 = 5;
    if ((int)v5 <= 7)
    {
      if (v5 == 2)
      {
        int v37 = 4;
      }
      else if (v5 == 4)
      {
        int v37 = 3;
      }
    }
    else
    {
      switch(v5)
      {
        case 8:
          int v37 = 2;
          break;
        case 0x10:
          int v37 = 1;
          break;
        case 0x20:
          int v37 = 0;
          break;
      }
    }
    if (v5 && v17 <= v37 + (v16 & 1u))
    {
      if (v14)
      {
LABEL_54:
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        double v26 = 0.0;
        v40 = @"-";
        unint64_t v41 = 0x264629000uLL;
        double v27 = 0.0;
        double v28 = 0.0;
        double v29 = 0.0;
        double v30 = 0.0;
        double v24 = 0.0;
        while (1)
        {
          v42 = (void *)[v11 objectAtIndex:v38];
          if ([(__CFString *)v40 isEqual:v42])
          {
            uint64_t v39 = 1;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              double v61 = 0.0;
              objc_msgSend((id)objc_msgSend(v42, "first"), "doubleValue");
              double v61 = v43;
              if (v38
                && objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v38 - 1), "isEqual:", @"."))
              {
                v44 = (__CFString *)[v42 second];
                if ((unint64_t)[(__CFString *)v44 length] <= 2)
                {
                  if ([(__CFString *)v44 length] == 1) {
                    v44 = (__CFString *)[(__CFString *)v44 stringByAppendingString:@"00"];
                  }
                  if ([(__CFString *)v44 length] == 2) {
                    v44 = (__CFString *)[(__CFString *)v44 stringByAppendingString:@"0"];
                  }
                  TSUGetNumberValueAndTypeFromString(v44, 0, (uint64_t)&v61, 0, 0, 0);
                }
                double v26 = v61;
                if (!a3) {
                  goto LABEL_86;
                }
                int v45 = *a3 | 0x20;
              }
              else
              {
                switch((int)v5)
                {
                  case 1:
                    double v24 = v61;
                    if (a3) {
                      *a3 |= 1u;
                    }
                    uint64_t v5 = 2;
                    goto LABEL_86;
                  case 2:
                    double v30 = v61;
                    if (a3) {
                      *a3 |= 2u;
                    }
                    uint64_t v5 = 4;
                    goto LABEL_86;
                  case 3:
                  case 5:
                  case 6:
                  case 7:
                    goto LABEL_76;
                  case 4:
                    double v29 = v61;
                    if (a3) {
                      *a3 |= 4u;
                    }
                    uint64_t v5 = 8;
                    goto LABEL_86;
                  case 8:
                    double v28 = v61;
                    if (a3) {
                      *a3 |= 8u;
                    }
                    uint64_t v5 = 16;
                    goto LABEL_86;
                  default:
                    if (v5 != 16)
                    {
LABEL_76:
                      id v58 = +[TSUAssertionHandler currentHandler];
                      uint64_t v46 = v5;
                      uint64_t v47 = v39;
                      v48 = v40;
                      v49 = a2;
                      unint64_t v50 = v41;
                      uint64_t v51 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(NSString *, NSTimeInterval *, TSUDurationUnits *, TSUDurationStyle *, TSUDurationUnits)");
                      uint64_t v52 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"];
                      uint64_t v53 = v51;
                      unint64_t v41 = v50;
                      a2 = v49;
                      v40 = v48;
                      uint64_t v39 = v47;
                      uint64_t v5 = v46;
                      [v58 handleFailureInFunction:v53 file:v52 lineNumber:604 description:@"Unexpected duration unit!"];
                      goto LABEL_86;
                    }
                    double v27 = v61;
                    uint64_t v5 = 0;
                    if (!a3) {
                      goto LABEL_86;
                    }
                    int v45 = *a3 | 0x10;
                    break;
                }
              }
              *a3 = v45;
            }
          }
LABEL_86:
          if (v14 == ++v38) {
            goto LABEL_93;
          }
        }
      }
    }
    else
    {
      unsigned int v54 = v35 - 1;
      if (v54 >= 5)
      {
        id v55 = +[TSUAssertionHandler currentHandler];
        uint64_t v56 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(NSString *, NSTimeInterval *, TSUDurationUnits *, TSUDurationStyle *, TSUDurationUnits)");
        objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 554, @"Unexpected duration unit count!");
        uint64_t v5 = 0;
        if (v14) {
          goto LABEL_54;
        }
      }
      else
      {
        uint64_t v5 = dword_222874C48[v54];
        if (v14) {
          goto LABEL_54;
        }
      }
    }
    LOBYTE(v39) = 0;
    double v24 = 0.0;
    double v30 = 0.0;
    double v29 = 0.0;
    double v28 = 0.0;
    double v27 = 0.0;
    double v26 = 0.0;
LABEL_93:
    unsigned int v23 = v39 & 1;
  }
  else
  {
    if (a4) {
      *a4 = 1;
    }
    unint64_t v22 = [v11 count];
    unsigned int v23 = objc_msgSend(@"-", "isEqual:", objc_msgSend(v11, "objectAtIndex:", 0));
    double v24 = 0.0;
    if (v22 > v23)
    {
      uint64_t v25 = 0;
      double v26 = 0.0;
      double v27 = 0.0;
      double v28 = 0.0;
      double v29 = 0.0;
      double v30 = 0.0;
      while (1)
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v23 + v25), "first"), "doubleValue");
        double v32 = v31;
        uint64_t v33 = [v11 objectAtIndex:v23 + v25 + 1];
        int v60 = 1;
        int v34 = TSUDurationFormatterDurationUnitFromString(v33, &v60);
        if (a4 && !v25) {
          *a4 = v60;
        }
        switch(v34)
        {
          case 1:
            double v24 = v32;
            goto LABEL_32;
          case 2:
            double v30 = v32;
            goto LABEL_32;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_38;
          case 4:
            double v29 = v32;
            goto LABEL_32;
          case 8:
            double v28 = v32;
            goto LABEL_32;
          default:
            if (v34 == 16)
            {
              double v27 = v32;
LABEL_32:
              double v32 = v26;
              if (a3) {
                goto LABEL_33;
              }
            }
            else
            {
              if (v34 != 32) {
                goto LABEL_38;
              }
              double v26 = v32;
              if (a3)
              {
LABEL_33:
                *a3 |= v34;
                double v26 = v32;
              }
            }
            v25 += 2;
            if ((unint64_t)v23 + v25 >= v22) {
              goto LABEL_94;
            }
            break;
        }
      }
    }
    double v30 = 0.0;
    double v29 = 0.0;
    double v28 = 0.0;
    double v27 = 0.0;
    double v26 = 0.0;
  }
LABEL_94:
  if (a2)
  {
    double v57 = v27 + v30 * 86400.0 + v24 * 604800.0 + v29 * 3600.0 + v28 * 60.0 + v26 / 1000.0;
    *a2 = v57;
    if (v23) {
      *a2 = -v57;
    }
  }

  return 1;
}

uint64_t TSUDurationFormatterDurationUnitFromString(uint64_t a1, int *a2)
{
  SFTDurationFormatterInitializeStrings();
  if (([(id)sWeekLongSingularString isEqualToString:a1] & 1) != 0
    || [(id)sWeekLongPluralString isEqualToString:a1])
  {
    uint64_t result = 1;
    if (!a2) {
      return result;
    }
    goto LABEL_4;
  }
  if (([(id)sWeekMediumSingularString isEqualToString:a1] & 1) != 0
    || [(id)sWeekMediumPluralString isEqualToString:a1])
  {
    uint64_t result = 1;
    if (!a2) {
      return result;
    }
    goto LABEL_8;
  }
  if (![(id)sWeekShortString isEqualToString:a1])
  {
    if (([(id)sDayLongSingularString isEqualToString:a1] & 1) != 0
      || [(id)sDayLongPluralString isEqualToString:a1])
    {
      int v5 = 2;
      uint64_t result = 2;
      if (a2) {
        goto LABEL_9;
      }
      return result;
    }
    if (([(id)sDayMediumSingularString isEqualToString:a1] & 1) != 0
      || [(id)sDayMediumPluralString isEqualToString:a1])
    {
      uint64_t result = 2;
      if (!a2) {
        return result;
      }
      goto LABEL_8;
    }
    if ([(id)sDayShortString isEqualToString:a1])
    {
      uint64_t result = 2;
      if (!a2) {
        return result;
      }
      goto LABEL_24;
    }
    if (([(id)sHourLongSingularString isEqualToString:a1] & 1) != 0
      || [(id)sHourLongPluralString isEqualToString:a1])
    {
      uint64_t result = 4;
      if (!a2) {
        return result;
      }
      goto LABEL_4;
    }
    if (([(id)sHourMediumSingularString isEqualToString:a1] & 1) != 0
      || [(id)sHourMediumPluralString isEqualToString:a1])
    {
      uint64_t result = 4;
      if (!a2) {
        return result;
      }
      goto LABEL_8;
    }
    if ([(id)sHourShortString isEqualToString:a1])
    {
      uint64_t result = 4;
      if (!a2) {
        return result;
      }
      goto LABEL_24;
    }
    if (([(id)sMinuteLongSingularString isEqualToString:a1] & 1) != 0
      || [(id)sMinuteLongPluralString isEqualToString:a1])
    {
      uint64_t result = 8;
      if (!a2) {
        return result;
      }
      goto LABEL_4;
    }
    if (([(id)sMinuteMediumSingularString isEqualToString:a1] & 1) != 0
      || [(id)sMinuteMediumPluralString isEqualToString:a1])
    {
      uint64_t result = 8;
      if (!a2) {
        return result;
      }
      goto LABEL_8;
    }
    if ([(id)sMinuteShortString isEqualToString:a1])
    {
      uint64_t result = 8;
      if (!a2) {
        return result;
      }
      goto LABEL_24;
    }
    if (([(id)sSecondLongSingularString isEqualToString:a1] & 1) != 0
      || [(id)sSecondLongPluralString isEqualToString:a1])
    {
      uint64_t result = 16;
      if (!a2) {
        return result;
      }
      goto LABEL_4;
    }
    if (([(id)sSecondMediumSingularString isEqualToString:a1] & 1) != 0
      || [(id)sSecondMediumPluralString isEqualToString:a1])
    {
      uint64_t result = 16;
      if (!a2) {
        return result;
      }
LABEL_8:
      int v5 = 3;
      goto LABEL_9;
    }
    if ([(id)sSecondShortString isEqualToString:a1])
    {
      uint64_t result = 16;
      if (!a2) {
        return result;
      }
    }
    else
    {
      if (([(id)sMillisecondLongSingularString isEqualToString:a1] & 1) != 0
        || [(id)sMillisecondLongPluralString isEqualToString:a1])
      {
        uint64_t result = 32;
        if (!a2) {
          return result;
        }
LABEL_4:
        int v5 = 2;
LABEL_9:
        *a2 = v5;
        return result;
      }
      uint64_t result = [(id)sMillisecondShortString isEqualToString:a1];
      if (!result) {
        return result;
      }
      uint64_t result = 32;
      if (!a2) {
        return result;
      }
    }
LABEL_24:
    int v5 = 1;
    goto LABEL_9;
  }
  int v5 = 1;
  uint64_t result = 1;
  if (a2) {
    goto LABEL_9;
  }
  return result;
}

void SFTDurationFormatterInitializeStrings()
{
  if ((sStringsInitialized & 1) == 0)
  {
    id v0 = objc_opt_class();
    objc_sync_enter(v0);
    sWeekLongSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"week" value:&stru_26D4F03D0 table:@"TSUtility"];
    sWeekLongPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"weeks" value:&stru_26D4F03D0 table:@"TSUtility"];
    sWeekMediumSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"wk" value:&stru_26D4F03D0 table:@"TSUtility"];
    sWeekMediumPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"wks" value:&stru_26D4F03D0 table:@"TSUtility"];
    sWeekShortString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"w" value:&stru_26D4F03D0 table:@"TSUtility"];
    sDayLongSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"day" value:&stru_26D4F03D0 table:@"TSUtility"];
    sDayLongPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"days" value:&stru_26D4F03D0 table:@"TSUtility"];
    sDayMediumSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"day" value:&stru_26D4F03D0 table:@"TSUtility"];
    sDayMediumPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"days" value:&stru_26D4F03D0 table:@"TSUtility"];
    sDayShortString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"d" value:&stru_26D4F03D0 table:@"TSUtility"];
    sHourLongSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"hour" value:&stru_26D4F03D0 table:@"TSUtility"];
    sHourLongPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"hours" value:&stru_26D4F03D0 table:@"TSUtility"];
    sHourMediumSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"hr" value:&stru_26D4F03D0 table:@"TSUtility"];
    sHourMediumPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"hrs" value:&stru_26D4F03D0 table:@"TSUtility"];
    sHourShortString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"h" value:&stru_26D4F03D0 table:@"TSUtility"];
    sMinuteLongSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"minute" value:&stru_26D4F03D0 table:@"TSUtility"];
    sMinuteLongPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"minutes" value:&stru_26D4F03D0 table:@"TSUtility"];
    sMinuteMediumSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"min" value:&stru_26D4F03D0 table:@"TSUtility"];
    sMinuteMediumPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"mins" value:&stru_26D4F03D0 table:@"TSUtility"];
    sMinuteShortString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"m" value:&stru_26D4F03D0 table:@"TSUtility"];
    sSecondLongSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"second" value:&stru_26D4F03D0 table:@"TSUtility"];
    sSecondLongPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"seconds" value:&stru_26D4F03D0 table:@"TSUtility"];
    sSecondMediumSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"sec" value:&stru_26D4F03D0 table:@"TSUtility"];
    sSecondMediumPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"secs" value:&stru_26D4F03D0 table:@"TSUtility"];
    sSecondShortString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"s" value:&stru_26D4F03D0 table:@"TSUtility"];
    sMillisecondLongSingularString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"millisecond" value:&stru_26D4F03D0 table:@"TSUtility"];
    sMillisecondLongPluralString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"milliseconds" value:&stru_26D4F03D0 table:@"TSUtility"];
    sMillisecondShortString = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@"ms" value:&stru_26D4F03D0 table:@"TSUtility"];
    __dmb(0xBu);
    sStringsInitialized = 1;
    objc_sync_exit(v0);
  }
}

void sub_22282052C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *TSUDurationFormatterUnitString(int a1, int a2, double a3)
{
  return TSUDurationSingularPluralFormatterUnitString(a1, a2, 0, a3);
}

__CFString *TSUDurationSingularPluralFormatterUnitString(int a1, int a2, int a3, double a4)
{
  SFTDurationFormatterInitializeStrings();
  if (a4 == 1.0) {
    int v8 = 1;
  }
  else {
    int v8 = a3;
  }
  uint64_t result = &stru_26D4F03D0;
  switch(a1)
  {
    case 1:
      switch(a2)
      {
        case 3:
          id v10 = &sWeekMediumSingularString;
          unint64_t v11 = &sWeekMediumPluralString;
          goto LABEL_42;
        case 2:
          id v10 = &sWeekLongSingularString;
          unint64_t v11 = &sWeekLongPluralString;
          goto LABEL_42;
        case 1:
          return (__CFString *)sWeekShortString;
      }
      return result;
    case 2:
      switch(a2)
      {
        case 3:
          id v10 = &sDayMediumSingularString;
          unint64_t v11 = &sDayMediumPluralString;
          goto LABEL_42;
        case 2:
          id v10 = &sDayLongSingularString;
          unint64_t v11 = &sDayLongPluralString;
          goto LABEL_42;
        case 1:
          return (__CFString *)sDayShortString;
      }
      return result;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      switch(a2)
      {
        case 3:
          id v10 = &sHourMediumSingularString;
          unint64_t v11 = &sHourMediumPluralString;
          goto LABEL_42;
        case 2:
          id v10 = &sHourLongSingularString;
          unint64_t v11 = &sHourLongPluralString;
          goto LABEL_42;
        case 1:
          return (__CFString *)sHourShortString;
      }
      return result;
    case 8:
      switch(a2)
      {
        case 3:
          id v10 = &sMinuteMediumSingularString;
          unint64_t v11 = &sMinuteMediumPluralString;
          goto LABEL_42;
        case 2:
          id v10 = &sMinuteLongSingularString;
          unint64_t v11 = &sMinuteLongPluralString;
          goto LABEL_42;
        case 1:
          return (__CFString *)sMinuteShortString;
      }
      return result;
    default:
      if (a1 != 16)
      {
        if (a1 != 32) {
          return result;
        }
        if (a2 == 3) {
          return (__CFString *)sMillisecondShortString;
        }
        if (a2 != 2)
        {
          if (a2 != 1) {
            return result;
          }
          return (__CFString *)sMillisecondShortString;
        }
        id v10 = &sMillisecondLongSingularString;
        unint64_t v11 = &sMillisecondLongPluralString;
        goto LABEL_42;
      }
      switch(a2)
      {
        case 3:
          id v10 = &sSecondMediumSingularString;
          unint64_t v11 = &sSecondMediumPluralString;
LABEL_42:
          if (v8) {
            id v12 = v10;
          }
          else {
            id v12 = v11;
          }
          return (__CFString *)*v12;
        case 2:
          id v10 = &sSecondLongSingularString;
          unint64_t v11 = &sSecondLongPluralString;
          goto LABEL_42;
        case 1:
          return (__CFString *)sSecondShortString;
      }
      return result;
  }
}

__CFString *TSUDurationSingularFormatterUnitString(int a1, int a2, double a3)
{
  return TSUDurationSingularPluralFormatterUnitString(a1, a2, 1, a3);
}

uint64_t TSUDurationFormatterTimeIntervalFromString(void *a1, double *a2, int *a3, _DWORD *a4)
{
  return TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(a1, a2, a3, a4, 0);
}

void *TSUDurationFormatterTokensFromString(void *a1, unsigned char *a2)
{
  TSUDurationFormatterInitializeConstantSets();
  CFTimeZoneRef v4 = (void *)[a1 stringByTrimmingCharactersInSet:sWhitespaceAndNewlineCharacterSet];
  int v5 = (void *)[MEMORY[0x263F08B08] scannerWithString:v4];
  [v5 setCharactersToBeSkipped:sEmptyCharacterSet];
  unint64_t v22 = 0;
  if ([v5 isAtEnd])
  {
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    id v10 = 0;
    goto LABEL_3;
  }
  CFAllocatorRef v19 = a2;
  int v6 = 0;
  int v20 = 0;
  int v8 = 0;
  int v9 = 0;
  id v10 = 0;
  int v11 = -1;
  do
  {
    if (!v10) {
      id v10 = (void *)[MEMORY[0x263EFF980] array];
    }
    uint64_t v12 = objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v5, "scanLocation", v19));
    if ([(id)sAlphabeticCharacterSet characterIsMember:v12])
    {
      if ((v8 | v6)) {
        return 0;
      }
      uint64_t v13 = [v10 count];
      uint64_t result = 0;
      if ((v11 & 0xFFFFFFFD) == 1 || !v13) {
        return result;
      }
      [v5 scanCharactersFromSet:sAlphabeticCharacterSet intoString:&v22];
      [v10 addObject:v22];
      int v11 = 1;
    }
    else
    {
      if (v8)
      {
        if (([(id)sDecimalDigitCharacterSet characterIsMember:v12] & 1) == 0) {
          goto LABEL_19;
        }
      }
      else if (![(id)sDecimalDigitAndSeperatorsCharacterSet characterIsMember:v12])
      {
LABEL_19:
        if (![(id)sMinusSignCharacterSet characterIsMember:v12]
          || [v10 count])
        {
          return 0;
        }
        [v5 scanCharactersFromSet:sMinusSignCharacterSet intoString:0];
        [v10 addObject:@"-"];
        int v11 = 3;
        int v20 = 1;
        goto LABEL_28;
      }
      if (!v11) {
        return 0;
      }
      uint64_t v15 = &sDecimalDigitCharacterSet;
      if ((v8 & 1) == 0) {
        uint64_t v15 = &sDecimalDigitAndSeperatorsCharacterSet;
      }
      [v5 scanCharactersFromSet:*v15 intoString:&v22];
      double v21 = 0.0;
      if (!TSUGetNumberValueAndTypeFromString(v22, 0, (uint64_t)&v21, 0, 0, 0)) {
        return 0;
      }
      v9 |= trunc(v21) != v21;
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithDouble:");
      objc_msgSend(v10, "addObject:", +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:", v16, v22));
      int v11 = 0;
    }
LABEL_28:
    [v5 scanCharactersFromSet:sWhitespaceCharacterSet intoString:0];
    int v17 = [v5 scanCharactersFromSet:sSeparatorPunctuationCharacterSet intoString:&v22];
    char v18 = v17;
    if (v17)
    {
      if (([v10 count] == 0) | v6 & 1) {
        return 0;
      }
      [v10 addObject:v22];
      int v6 = [(__CFString *)v22 isEqualToString:@"."];
      v8 |= v6 ^ 1;
      int v11 = 2;
    }
    [v5 scanCharactersFromSet:sWhitespaceCharacterSet intoString:0];
  }
  while (![v5 isAtEnd]);
  a2 = v19;
  int v7 = v20;
  if (v18) {
    return 0;
  }
LABEL_3:
  if (a2) {
    *a2 = (v6 | v8) & 1;
  }
  if (v8 & v9) {
    return 0;
  }
  if ((v8 | v6))
  {
    if (!(v8 & 1 | ((v6 & 1) == 0))) {
      return 0;
    }
  }
  else if (((v7 ^ (([v10 count] & 1) == 0)) & 1) == 0)
  {
    return 0;
  }
  if ((v7 & 1) != 0 && (unint64_t)[v10 count] < 2) {
    return 0;
  }
  else {
    return v10;
  }
}

uint64_t TSUDurationFormatterMaxValuesForCompactStyleDurationWithMaxUnit(int a1, int a2)
{
  if (a1 == 32) {
    int v2 = 0;
  }
  else {
    int v2 = 5;
  }
  if (a1 == 16) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (a1 == 8) {
    int v4 = 2;
  }
  else {
    int v4 = v3;
  }
  if (a1 == 4) {
    int v5 = 3;
  }
  else {
    int v5 = 5;
  }
  if (a1 == 2) {
    int v5 = 4;
  }
  if (a1 > 7) {
    int v5 = v4;
  }
  return (v5 + a2);
}

void TSUDurationFormatterInitializeConstantSets()
{
  if ((sSetsInitialized & 1) == 0)
  {
    id v0 = objc_opt_class();
    objc_sync_enter(v0);
    if ((sSetsInitialized & 1) == 0)
    {
      sEmptyCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:&stru_26D4F03D0];
      sSeparatorPunctuationCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@":."];
      sMinusSignCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"-"];
      sAlphabeticCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] letterCharacterSet];
      sDecimalDigitCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] decimalDigitCharacterSet];
      id v1 = (id)[MEMORY[0x263F089C0] decimalDigitCharacterSet];
      sDecimalDigitAndSeperatorsCharacterSet = (uint64_t)v1;
      int v2 = (void *)[MEMORY[0x263EFF960] currentLocale];
      objc_msgSend(v1, "addCharactersInString:", objc_msgSend(v2, "objectForKey:", *MEMORY[0x263EFF4E8]));
      int v3 = (void *)sDecimalDigitAndSeperatorsCharacterSet;
      int v4 = (void *)[MEMORY[0x263EFF960] currentLocale];
      objc_msgSend(v3, "addCharactersInString:", objc_msgSend(v4, "objectForKey:", *MEMORY[0x263EFF4F8]));
      sWhitespaceCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] whitespaceCharacterSet];
      sWhitespaceAndNewlineCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      sSpecialDurationFormatCharacters = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"wdhmsf"];
      __dmb(0xBu);
      sSetsInitialized = 1;
    }
    objc_sync_exit(v0);
  }
}

void sub_222820D30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUDurationFormatterStringFromTimeIntervalWithFormatAndRounding(void *a1, double a2)
{
  return TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(a1, 0, 0, a2);
}

uint64_t TSUDurationSingularFormatterStringFromTimeIntervalWithFormat(void *a1, double a2)
{
  return TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(a1, 1, 1, a2);
}

uint64_t TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(void *a1, int a2, int a3, double a4)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  TSUDurationFormatterInitializeConstantSets();
  unint64_t v6 = [a1 length];
  int v7 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:v6];
  int v8 = v7;
  if (a4 < 0.0)
  {
    [v7 appendString:@"-"];
    a4 = fabs(a4);
  }
  v81 = v8;
  if (!v6)
  {
    int v35 = 0;
    char v85 = 0;
    int v9 = 0;
    LOBYTE(v11) = 0;
    BOOL v30 = 1;
    double v36 = 2.22507386e-308;
    double v33 = 2.22507386e-308;
    double v32 = 2.22507386e-308;
    double v34 = 2.22507386e-308;
    goto LABEL_51;
  }
  char v85 = 0;
  int v9 = 0;
  unint64_t v10 = 0;
  LODWORD(v11) = 0;
  do
  {
    uint64_t v12 = [a1 characterAtIndex:v10];
    uint64_t v13 = v12;
    unint64_t v14 = v10 + 1;
    if (v10 + 1 >= v6)
    {
      if (v12 == 39) {
        goto LABEL_45;
      }
    }
    else
    {
      int v15 = [a1 characterAtIndex:v10 + 1];
      if (v13 == 39)
      {
        if (v15 == 39)
        {
          [v8 appendString:@"'"];
          unint64_t v14 = v10 + 2;
          goto LABEL_45;
        }
        while (1)
        {
          unsigned int v16 = [a1 characterAtIndex:v14];
          unsigned int v17 = v16;
          if (v14 + 1 >= v6) {
            break;
          }
          int v18 = [a1 characterAtIndex:v14 + 1];
          if (v17 != 39) {
            goto LABEL_14;
          }
          if (v18 != 39) {
            goto LABEL_30;
          }
          [v8 appendString:@"'"];
          v14 += 2;
LABEL_15:
          if (v14 >= v6) {
            goto LABEL_45;
          }
        }
        if (v16 == 39)
        {
LABEL_30:
          ++v14;
          goto LABEL_45;
        }
LABEL_14:
        objc_msgSend(v8, "appendFormat:", @"%C", v17);
        ++v14;
        goto LABEL_15;
      }
    }
    if (![(id)sSpecialDurationFormatCharacters characterIsMember:v13])
    {
      objc_msgSend(v8, "appendFormat:", @"%C", v13);
      goto LABEL_45;
    }
    int v83 = v9;
    int v19 = v9 + 1;
    if ((v9 + 1) >= 7)
    {
      id v20 = +[TSUAssertionHandler currentHandler];
      int v21 = v11;
      uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
      int v8 = v81;
      uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"];
      uint64_t v23 = v11;
      LODWORD(v11) = v21;
      [v20 handleFailureInFunction:v23 file:v22 lineNumber:850 description:@"Too many placeholders in duration format string!"];
    }
    uint64_t v24 = [v8 length];
    if (v14 >= v6)
    {
      int v27 = 0;
    }
    else
    {
      int v25 = v6 - v10;
      int v26 = 1;
      while ([a1 characterAtIndex:v14] == v13)
      {
        ++v26;
        if (v6 == ++v14)
        {
          unint64_t v14 = v6;
          int v26 = v25;
          break;
        }
      }
      int v27 = 0;
      switch(v26)
      {
        case 1:
          break;
        case 2:
          int v27 = 1;
          break;
        case 3:
          int v27 = 2;
          break;
        case 5:
          int v27 = 2;
          goto LABEL_35;
        case 6:
          int v27 = 4;
LABEL_35:
          char v85 = 1;
          break;
        default:
          int v27 = 3;
          break;
      }
    }
    int v28 = 0;
    switch((int)v13)
    {
      case 'd':
        int v28 = 2;
        break;
      case 'e':
      case 'g':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
        break;
      case 'f':
        int v28 = 32;
        break;
      case 'h':
        int v28 = 4;
        break;
      case 'm':
        int v28 = 8;
        break;
      default:
        int v28 = v13 == 119;
        if (v13 == 115) {
          int v28 = 16;
        }
        break;
    }
    double v29 = &v86[v83];
    *(void *)double v29 = v24;
    LODWORD(v11) = v28 | v11;
    *((_DWORD *)v29 + 2) = v28;
    *((_DWORD *)v29 + 3) = v27;
    int v9 = v19;
LABEL_45:
    unint64_t v10 = v14;
  }
  while (v14 < v6);
  BOOL v30 = (v11 & 1) == 0;
  if (v11)
  {
    double v32 = floor(a4 / 604800.0);
    a4 = a4 + v32 * -604800.0;
    int v31 = 1;
    if ((v11 & 2) == 0) {
      goto LABEL_55;
    }
LABEL_48:
    double v33 = floor(a4 / 86400.0);
    a4 = a4 + v33 * -86400.0;
    if ((v11 & 4) != 0) {
      goto LABEL_49;
    }
LABEL_56:
    double v34 = 2.22507386e-308;
  }
  else
  {
    int v31 = 0;
    double v32 = 2.22507386e-308;
    if ((v11 & 2) != 0) {
      goto LABEL_48;
    }
LABEL_55:
    double v33 = 2.22507386e-308;
    if ((v11 & 4) == 0) {
      goto LABEL_56;
    }
LABEL_49:
    double v34 = floor(a4 / 3600.0);
    a4 = a4 + v34 * -3600.0;
  }
  BOOL v38 = (v11 & 8) == 0;
  if ((v11 & 8) != 0)
  {
    double v36 = floor(a4 / 60.0);
    a4 = a4 + v36 * -60.0;
    if ((v11 & 0x10) == 0) {
      goto LABEL_66;
    }
LABEL_59:
    double v40 = trunc(a4);
    a4 = a4 - v40;
    if ((v11 & 0x20) != 0) {
      double v39 = a4 * 1000.0;
    }
    else {
      double v39 = 2.22507386e-308;
    }
    int v37 = 16;
    if ((v11 & 0x20) != 0) {
      int v35 = 32;
    }
    else {
      int v35 = 16;
    }
    goto LABEL_74;
  }
  double v36 = 2.22507386e-308;
  if ((v11 & 0x10) != 0) {
    goto LABEL_59;
  }
LABEL_66:
  if ((v11 & 0x20) != 0)
  {
    int v37 = v11 & 0x20;
    double v39 = a4 * 1000.0;
    int v35 = 32;
    double v40 = 2.22507386e-308;
    goto LABEL_74;
  }
  if ((v11 & 8) != 0)
  {
    BOOL v38 = 0;
    int v37 = 0;
    int v35 = 8;
    goto LABEL_53;
  }
  if ((v11 & 2) != 0) {
    int v35 = 2;
  }
  else {
    int v35 = v31;
  }
  if ((v11 & 4) == 0)
  {
LABEL_51:
    int v37 = 0;
    goto LABEL_52;
  }
  int v37 = 0;
  int v35 = 4;
LABEL_52:
  BOOL v38 = 1;
LABEL_53:
  double v39 = 2.22507386e-308;
  double v40 = 2.22507386e-308;
LABEL_74:
  if (a2)
  {
    switch(v35)
    {
      case 1:
        if (round(a4 / 604800.0) >= 1.0) {
          double v32 = v32 + 1.0;
        }
        goto LABEL_106;
      case 2:
        if (round(a4 / 86400.0) >= 1.0) {
          double v33 = v33 + 1.0;
        }
        goto LABEL_106;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_83;
      case 4:
        if (round(a4 / 3600.0) >= 1.0) {
          double v34 = v34 + 1.0;
        }
        goto LABEL_106;
      case 8:
        if (round(a4 / 60.0) >= 1.0) {
          double v36 = v36 + 1.0;
        }
        goto LABEL_106;
      default:
        if (v35 == 16)
        {
          if (round(a4) >= 1.0) {
            double v40 = v40 + 1.0;
          }
          goto LABEL_106;
        }
        if (v35 == 32) {
          goto LABEL_86;
        }
LABEL_83:
        id v41 = +[TSUAssertionHandler currentHandler];
        char v42 = v11;
        uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
        int v8 = v81;
        uint64_t v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"];
        v44 = v41;
        uint64_t v45 = v11;
        LOBYTE(v11) = v42;
        uint64_t v46 = 1000;
        break;
    }
  }
  else
  {
    switch(v35)
    {
      case 1:
        double v32 = v32 + a4 / 604800.0;
        goto LABEL_106;
      case 2:
        double v33 = v33 + a4 / 86400.0;
        goto LABEL_106;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_87;
      case 4:
        double v34 = v34 + a4 / 3600.0;
        goto LABEL_106;
      case 8:
        double v36 = v36 + a4 / 60.0;
        goto LABEL_106;
      default:
        if (v35 == 16)
        {
          double v40 = v40 + a4;
          goto LABEL_106;
        }
        if (v35 == 32)
        {
LABEL_86:
          double v39 = round(v39);
          goto LABEL_106;
        }
LABEL_87:
        id v47 = +[TSUAssertionHandler currentHandler];
        char v48 = v11;
        uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
        int v8 = v81;
        uint64_t v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"];
        v44 = v47;
        uint64_t v45 = v11;
        LOBYTE(v11) = v48;
        uint64_t v46 = 1024;
        break;
    }
  }
  [v44 handleFailureInFunction:v45 file:v43 lineNumber:v46 description:@"Unknown minimum unit!"];
LABEL_106:
  if (v30) {
    int v49 = 2;
  }
  else {
    int v49 = 1;
  }
  if ((v11 & 3) == 0) {
    int v49 = 4;
  }
  if (v38) {
    int v50 = v37;
  }
  else {
    int v50 = 8;
  }
  if ((v11 & 7) != 0) {
    int v51 = v49;
  }
  else {
    int v51 = v50;
  }
  if (v51 != v35)
  {
    while (2)
    {
      switch(v35)
      {
        case 1:
          break;
        case 2:
          if (v33 >= 7.0)
          {
            double v32 = v32 + 1.0;
            int v35 = 1;
            double v33 = 0.0;
            goto LABEL_132;
          }
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_125;
        case 4:
          if (v34 < 24.0) {
            break;
          }
          double v33 = v33 + 1.0;
          int v35 = 2;
          double v34 = 0.0;
          goto LABEL_132;
        case 8:
          if (v36 < 60.0) {
            break;
          }
          double v34 = v34 + 1.0;
          int v35 = 4;
          double v36 = 0.0;
          goto LABEL_132;
        default:
          if (v35 == 16)
          {
            if (v40 < 60.0) {
              break;
            }
            double v36 = v36 + 1.0;
            int v35 = 8;
            double v40 = 0.0;
          }
          else if (v35 == 32)
          {
            if (v39 < 1000.0) {
              break;
            }
            double v40 = v40 + 1.0;
            int v35 = 16;
            double v39 = 0.0;
          }
          else
          {
LABEL_125:
            id v52 = +[TSUAssertionHandler currentHandler];
            uint64_t v53 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
            int v8 = v81;
            objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1088, @"Unknown unit!");
          }
LABEL_132:
          if (v51 == v35) {
            break;
          }
          continue;
      }
      break;
    }
  }
  int v54 = a2;
  if (v9)
  {
    uint64_t v55 = 0;
    char v56 = 0;
    int v57 = 0;
    int v84 = a2 ^ 1;
    do
    {
      id v58 = &v86[v55];
      uint64_t v59 = *(void *)v58;
      int v61 = *((_DWORD *)v58 + 2);
      int v60 = *((_DWORD *)v58 + 3);
      int v62 = 0;
      double v63 = v32;
      switch(v61)
      {
        case 1:
          break;
        case 2:
          int v62 = 0;
          double v63 = v33;
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_140;
        case 4:
          int v62 = 0;
          double v63 = v34;
          break;
        case 8:
          int v62 = 0;
          double v63 = v36;
          break;
        default:
          if (v61 == 16)
          {
            int v62 = 0;
            double v63 = v40;
          }
          else if (v61 == 32)
          {
            int v62 = 1;
            double v63 = v39;
          }
          else
          {
LABEL_140:
            id v64 = +[TSUAssertionHandler currentHandler];
            uint64_t v65 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
            int v8 = v81;
            uint64_t v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"];
            uint64_t v67 = v65;
            int v54 = a2;
            [v64 handleFailureInFunction:v67 file:v66 lineNumber:1125 description:@"Unknown duration unit!"];
            int v62 = 0;
            double v63 = 0.0;
          }
          break;
      }
      if ((v85 & (v63 == 0.0)) == 1 && v56 & 1 | (v55 + 1 != v9))
      {
        int v68 = -1;
        ++v55;
      }
      else
      {
        if (v54) {
          unsigned __int16 v69 = 0;
        }
        else {
          unsigned __int16 v69 = kTSUNumberFormatterDecimalPlacesAsManyAsNecessary;
        }
        switch(v60)
        {
          case 0:
            if (v62) {
              v70 = @"000";
            }
            else {
              v70 = @"0";
            }
            goto LABEL_160;
          case 1:
            if (v62) {
              v70 = @"000";
            }
            else {
              v70 = @"00";
            }
LABEL_160:
            v72 = TSUNumberFormatterStringFromDoubleWithFormat(v70, v84, 0, v69, 0, 0, 0, v63);
            goto LABEL_163;
          case 2:
            v71 = TSUDurationSingularPluralFormatterUnitString(v61, 1, a3, v63);
            v72 = (__CFString *)[NSString stringWithFormat:@"%@%@", TSUNumberFormatterStringFromDoubleWithFormat(@"0", v84, 0, v69, 0, 0, 0, v63), v71];
            goto LABEL_163;
          case 3:
            double v73 = v63;
            int v74 = v61;
            int v75 = 2;
            goto LABEL_162;
          case 4:
            double v73 = v63;
            int v74 = v61;
            int v75 = 3;
LABEL_162:
            v77 = TSUDurationSingularPluralFormatterUnitString(v74, v75, a3, v73);
            v72 = (__CFString *)[NSString stringWithFormat:@"%@ %@", TSUNumberFormatterStringFromDoubleWithFormat(@"0", v84, 0, v69, 0, 0, 0, v63), v77];
LABEL_163:
            v76 = v72;
            break;
          default:
            v76 = 0;
            break;
        }
        [v8 insertString:v76 atIndex:v59 + v57];
        int v68 = [(__CFString *)v76 length];
        ++v55;
        char v56 = 1;
      }
      v57 += v68;
    }
    while (v55 != v9);
  }
  if ((v85 & 1) == 0) {
    return (uint64_t)v8;
  }
  uint64_t v78 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  return [v8 stringByTrimmingCharactersInSet:v78];
}

uint64_t TSUDurationUnroundedFormatterStringFromTimeIntervalWithFormat(void *a1, double a2)
{
  return TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(a1, 0, 0, a2);
}

uint64_t TSUDurationFormatterMinDurationUnitInUnits(char a1)
{
  int v1 = a1 & 1;
  if ((a1 & 2) != 0) {
    int v1 = 2;
  }
  if ((a1 & 4) != 0) {
    int v2 = 4;
  }
  else {
    int v2 = v1;
  }
  if ((a1 & 8) != 0) {
    int v3 = 8;
  }
  else {
    int v3 = v2;
  }
  if ((a1 & 0x10) != 0) {
    unsigned int v4 = 16;
  }
  else {
    unsigned int v4 = v3;
  }
  if ((a1 & 0x20) != 0) {
    return 32;
  }
  else {
    return v4;
  }
}

uint64_t TSUDurationFormatterMaxDurationUnitInUnits(char a1)
{
  int v1 = a1 & 0x20;
  if ((a1 & 0x10) != 0) {
    int v1 = 16;
  }
  if ((a1 & 8) != 0) {
    int v2 = 8;
  }
  else {
    int v2 = v1;
  }
  if ((a1 & 4) != 0) {
    int v3 = 4;
  }
  else {
    int v3 = v2;
  }
  if ((a1 & 2) != 0) {
    unsigned int v4 = 2;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a1) {
    return 1;
  }
  else {
    return v4;
  }
}

uint64_t TSUDurationFormatterDurationUnitsInFormat(void *a1)
{
  unsigned int v2 = 0;
  TSUDurationFormatterGetFormatInfo(a1, &v2, 0);
  return v2;
}

uint64_t TSUDurationFormatterGetFormatInfo(void *a1, _DWORD *a2, int *a3)
{
  TSUDurationFormatterInitializeConstantSets();
  if (a2) {
    *a2 = 0;
  }
  uint64_t result = [a1 length];
  if (result)
  {
    unint64_t v7 = result;
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t result = [a1 characterAtIndex:v8];
      uint64_t v9 = result;
      unint64_t v10 = v8 + 1;
      if (v8 + 1 < v7) {
        break;
      }
      if (result == 39) {
        goto LABEL_31;
      }
      uint64_t result = [(id)sSpecialDurationFormatCharacters characterIsMember:result];
      ++v8;
      if (result) {
        goto LABEL_25;
      }
LABEL_44:
      if (v8 >= v7) {
        return result;
      }
    }
    uint64_t result = [a1 characterAtIndex:v8 + 1];
    if (v9 == 39)
    {
      if (result == 39)
      {
        v8 += 2;
      }
      else
      {
        do
        {
          uint64_t result = [a1 characterAtIndex:v10];
          int v11 = result;
          unint64_t v8 = v10 + 1;
          if (v10 + 1 >= v7)
          {
            if (result == 39) {
              goto LABEL_44;
            }
          }
          else
          {
            uint64_t result = [a1 characterAtIndex:v10 + 1];
            if (v11 == 39)
            {
              if (result != 39) {
                goto LABEL_44;
              }
              unint64_t v8 = v10 + 2;
            }
          }
          unint64_t v10 = v8;
        }
        while (v8 < v7);
      }
      goto LABEL_44;
    }
    uint64_t result = [(id)sSpecialDurationFormatCharacters characterIsMember:v9];
    if (result)
    {
      int v12 = v7 - v8;
      int v13 = 1;
      while (1)
      {
        uint64_t result = [a1 characterAtIndex:v10];
        if (result != v9) {
          break;
        }
        ++v13;
        if (v7 == ++v10)
        {
          unint64_t v10 = v7;
          int v13 = v12;
          break;
        }
      }
      if ((v13 - 1) < 2)
      {
LABEL_25:
        if (a3)
        {
          int v14 = 0;
          goto LABEL_27;
        }
LABEL_28:
        unint64_t v8 = v10;
        int v15 = 0;
        switch((int)v9)
        {
          case 'd':
            int v15 = 2;
            if (a2) {
              goto LABEL_43;
            }
            goto LABEL_44;
          case 'e':
          case 'g':
          case 'i':
          case 'j':
          case 'k':
          case 'l':
            goto LABEL_42;
          case 'f':
            int v15 = 32;
            if (!a2) {
              goto LABEL_44;
            }
            goto LABEL_43;
          case 'h':
            int v15 = 4;
LABEL_42:
            if (a2) {
              goto LABEL_43;
            }
            goto LABEL_44;
          case 'm':
            int v15 = 8;
            if (!a2) {
              goto LABEL_44;
            }
            goto LABEL_43;
          default:
            int v15 = v9 == 119;
            if (v9 == 115) {
              int v15 = 16;
            }
            if (!a2) {
              goto LABEL_44;
            }
LABEL_43:
            *a2 |= v15;
            break;
        }
        goto LABEL_44;
      }
      if (v13 == 3)
      {
        if (!a3) {
          goto LABEL_28;
        }
        int v14 = 1;
      }
      else
      {
        if (!a3) {
          goto LABEL_28;
        }
        int v14 = 2;
      }
LABEL_27:
      *a3 = v14;
      goto LABEL_28;
    }
LABEL_31:
    ++v8;
    goto LABEL_44;
  }
  return result;
}

uint64_t TSUDurationFormatterDurationUnitCountInUnits(unsigned int a1)
{
  return (unsigned __int16)(vaddv_s16((int16x4_t)vand_s8((int8x8_t)vshl_u16((uint16x4_t)vdup_n_s16(a1), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL), (int8x8_t)0x1000100010001))+ (a1 & 1)+ ((a1 >> 5) & 1));
}

void *TSUDurationFormatterFormatFromDurationUnits(unsigned int a1, unsigned int a2, int a3)
{
  unint64_t v6 = (void *)[MEMORY[0x263F089D8] string];
  int16x4_t v7 = (int16x4_t)vand_s8((int8x8_t)vshl_u16((uint16x4_t)vdup_n_s16(a1), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL), (int8x8_t)0x1000100010001);
  v7.i16[0] = vaddv_s16(v7);
  unsigned __int32 v8 = v7.i32[0] + (a1 & 1) + ((a1 >> 5) & 1);
  if (v7.i16[0] + (a1 & 1) + ((a1 >> 5) & 1))
  {
    if ((a1 & 1) == 0)
    {
LABEL_3:
      if ((a1 & 2) == 0)
      {
        int v9 = 0;
        unsigned __int32 v10 = v8;
        if ((a1 & 4) != 0) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      int v14 = 1;
      unsigned __int32 v13 = v8;
      goto LABEL_18;
    }
  }
  else
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUDurationFormatterFormatFromDurationUnits(TSUDurationUnits, TSUDurationStyle, BOOL)");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1358, @"No units passed to TSUDurationFormatterFormatFromDurationUnits()!");
    if ((a1 & 1) == 0) {
      goto LABEL_3;
    }
  }
  if (a2 <= 3) {
    [v6 appendString:off_26462A190[a2]];
  }
  unsigned __int32 v13 = v8 - 1;
  if ((a1 & 2) != 0)
  {
    int v14 = 1;
  }
  else
  {
    int v14 = 0;
    if ((_WORD)v8 == 1 && a3 == 0)
    {
      unsigned __int32 v10 = 0;
      goto LABEL_21;
    }
  }
LABEL_18:
  if (a2 <= 3) {
    [v6 appendString:off_26462A1B0[a2]];
  }
  unsigned __int32 v10 = v13 - v14;
LABEL_21:
  int v9 = 1;
  if ((a1 & 4) != 0) {
    goto LABEL_26;
  }
LABEL_22:
  if ((_WORD)v10) {
    int v16 = 1;
  }
  else {
    int v16 = a3;
  }
  if ((v9 & v16) != 1)
  {
    if ((a1 & 8) == 0)
    {
      if (!v9)
      {
        if ((a1 & 0x10) == 0)
        {
          int v19 = 0;
          goto LABEL_63;
        }
        goto LABEL_44;
      }
      goto LABEL_29;
    }
LABEL_38:
    __int16 v18 = 1;
    goto LABEL_39;
  }
LABEL_26:
  if (a2 < 4) {
    [v6 appendString:off_26462A1D0[a2]];
  }
  v10 -= (a1 & 4) >> 2;
  if ((a1 & 8) != 0) {
    goto LABEL_38;
  }
LABEL_29:
  if ((_WORD)v10) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = a3 == 0;
  }
  if (v17)
  {
    LOWORD(v10) = 0;
    if ((a1 & 0x10) == 0) {
      goto LABEL_49;
    }
LABEL_44:
    __int16 v21 = 1;
LABEL_53:
    uint64_t v23 = @"sss ";
    switch(a2)
    {
      case 0u:
        if ((v8 & 0xFFFE) != 0) {
          uint64_t v23 = @"ss:";
        }
        else {
          uint64_t v23 = @"s:";
        }
        goto LABEL_60;
      case 1u:
        goto LABEL_60;
      case 2u:
        uint64_t v23 = @"ssss ";
        goto LABEL_60;
      case 3u:
        uint64_t v23 = @"ssssss ";
LABEL_60:
        [v6 appendString:v23];
        break;
      default:
        break;
    }
    LOWORD(v10) = v10 - v21;
    goto LABEL_62;
  }
  __int16 v18 = 0;
LABEL_39:
  id v20 = @"mmm ";
  switch(a2)
  {
    case 0u:
      if ((v8 & 0xFFFE) != 0) {
        id v20 = @"mm:";
      }
      else {
        id v20 = @"m:";
      }
      goto LABEL_47;
    case 1u:
      goto LABEL_47;
    case 2u:
      id v20 = @"mmmm ";
      goto LABEL_47;
    case 3u:
      id v20 = @"mmmmmm ";
LABEL_47:
      [v6 appendString:v20];
      break;
    default:
      break;
  }
  LOWORD(v10) = v10 - v18;
  if ((a1 & 0x10) != 0) {
    goto LABEL_44;
  }
LABEL_49:
  __int16 v21 = 0;
  if ((_WORD)v10) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = a3 == 0;
  }
  if (!v22) {
    goto LABEL_53;
  }
  LOWORD(v10) = 0;
LABEL_62:
  int v19 = 1;
LABEL_63:
  if (!(_WORD)v10) {
    int v19 = 0;
  }
  if ((v19 | ((a1 & 0x20) >> 5)) == 1 && a2 <= 3) {
    [v6 appendString:off_26462A1F0[a2]];
  }
  if ([v6 length]) {
    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
  }
  return v6;
}

uint64_t TSUDurationFormatterDurationUnitsNecessaryToFullyDisplayDuration(uint64_t result, int a2, double a3)
{
  if (a3 == 0.0) {
    return result;
  }
  double v3 = fabs(a3);
  int v4 = result;
  while (2)
  {
    uint64_t v5 = v4 | result;
    int v6 = 2;
    double v7 = 604800.0;
    switch(v4)
    {
      case 1:
        goto LABEL_9;
      case 2:
        int v6 = 4;
        double v7 = 86400.0;
        goto LABEL_9;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_18;
      case 4:
        int v6 = 8;
        double v7 = 3600.0;
        goto LABEL_9;
      case 8:
        int v6 = 16;
        double v7 = 60.0;
        goto LABEL_9;
      default:
        if (v4 == 16)
        {
          double v7 = 1.0;
          int v6 = 32;
LABEL_9:
          double v8 = floor(v3 / v7);
          double v3 = v3 - v8 * v7;
          if (v8 == 0.0) {
            int v9 = a2;
          }
          else {
            int v9 = 1;
          }
          unsigned int v10 = result & ~v4;
          if (v9) {
            uint64_t result = v5;
          }
          else {
            uint64_t result = v10;
          }
          int v4 = v6;
          if (v3 <= 0.0) {
            return result;
          }
          continue;
        }
        if (v4 != 32)
        {
LABEL_18:
          id v11 = +[TSUAssertionHandler currentHandler];
          uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "TSUDurationUnits TSUDurationFormatterDurationUnitsNecessaryToFullyDisplayDuration(NSTimeInterval, TSUDurationUnits, BOOL)");
          objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1521, @"Unknown duration unit!");
        }
        return v5;
    }
  }
}

double TSUDurationFormatterSecondsInDurationUnit(char a1)
{
  if (a1) {
    return 604800.0;
  }
  if ((a1 & 2) != 0) {
    return 86400.0;
  }
  if ((a1 & 4) != 0) {
    return 3600.0;
  }
  if ((a1 & 8) != 0) {
    return 60.0;
  }
  double result = 1.0;
  if ((a1 & 0x10) == 0)
  {
    if ((a1 & 0x20) != 0)
    {
      return 0.001;
    }
    else
    {
      id v2 = +[TSUAssertionHandler currentHandler];
      uint64_t v3 = [NSString stringWithUTF8String:"double TSUDurationFormatterSecondsInDurationUnit(TSUDurationUnits)"];
      objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1584, @"Unknown duration unit in TSUDurationFormatterSecondsInDurationUnit!");
      return -1.0;
    }
  }
  return result;
}

void sub_2228224C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSURegisterLocaleChangeObserver(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = [v2 addObserverForName:*MEMORY[0x263EFFCC8] object:0 queue:0 usingBlock:a1];
  uint64_t v4 = [v2 addObserverForName:*MEMORY[0x263EFF458] object:0 queue:0 usingBlock:a1];
  return objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, v4, 0);
}

uint64_t TSURemoveLocaleChangeObserver(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(a1);
        }
        [v2 removeObserver:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t result = [a1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t TSUGetCurrentLocale()
{
  id v0 = +[TSUSharedLocale sharedLocale];
  return [v0 currentLocale];
}

uint64_t TSUIsLocaleISO(const __CFLocale *a1)
{
  CFStringRef Value = (void *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x263EFFCB0]);
  if ([Value isEqualToString:@"US"]) {
    return 0;
  }
  else {
    return [Value isEqualToString:@"CA"] ^ 1;
  }
}

__CFString *TSUNumberFormatStringFromDouble(int a1, unsigned __int16 a2, unsigned __int16 a3, int a4, __CFString *a5, __CFString *a6, uint64_t a7, void *a8, double a9, double a10, void *a11, uint64_t a12, unsigned __int8 a13, char a14, unsigned __int16 a15, unsigned __int16 a16, unsigned __int8 a17, char a18, __int16 a19, unsigned __int8 a20,unsigned __int16 a21,unsigned __int8 a22,unsigned int a23)
{
  double v29 = a9;
  if (__fpclassifyd(a9) == 3) {
    double v29 = 0.0;
  }
  if ((a7 & 1) == 0)
  {
    a3 = TSUNumberOfDecimalPlacesInValue(v29);
    a2 = a3;
  }
  double v30 = v29 * a10;
  if (a14)
  {
    int v31 = @"#,##0";
    double v32 = v30;
    int v33 = 1;
    unsigned int v34 = 2;
    uint64_t v35 = 2;
    int v36 = 1;
LABEL_7:
    int v37 = 0;
    int v38 = 0;
LABEL_8:
    return TSUNumberFormatterStringFromDoubleWithFormat(v31, v33, v34, v35, v36, v37, v38, v32);
  }
  int v40 = a15 ^ 1;
  if ((v40 & 1) == 0 && (a15 & 0x100) == 0)
  {
    return (__CFString *)TSUNumberFormatterStringByUnescapingFormatString(a5);
  }
  int v38 = a4 | a13;
  if (BYTE1(a12) | a12 || (a16 & HIBYTE(a16) & 1) != 0 || a8)
  {
    double v44 = trunc(v30);
    if ((a16 & HIBYTE(a16)) != 0) {
      double v45 = v44;
    }
    else {
      double v45 = v30;
    }
    uint64_t v46 = TSUNumberFormatterStringFromDoubleWithFormat(a5, v40, a3, a2, a17, a6, v38, v45);
    if (BYTE1(a12) | a12)
    {
      double v47 = fabs(v45);
      unint64_t v48 = HIWORD(a12);
      if (v47 >= 1.0) {
        unint64_t v49 = (unint64_t)log10(v47) + 1;
      }
      else {
        unint64_t v49 = 0;
      }
      int v50 = (a16 & HIBYTE(a16));
      if (v49 <= BYTE2(a12)) {
        unint64_t v51 = BYTE2(a12);
      }
      else {
        unint64_t v51 = v49;
      }
      if ((uint64_t)(a12 - v51) >= 1)
      {
        id v52 = (void *)[(__CFString *)v46 mutableCopy];
        unint64_t v53 = TSUNumberOfDecimalPlacesInValue(v30);
        uint64_t v54 = [(__CFString *)v46 length];
        if (BYTE5(a12) == BYTE4(a12) && v53 == 0) {
          uint64_t v56 = v54 + ~(v51 + HIWORD(a12)) + 1;
        }
        else {
          uint64_t v56 = v54 + ~(v51 + HIWORD(a12));
        }
        uint64_t v57 = v53 - (BYTE5(a12) - BYTE4(a12));
        if (v57 <= 0) {
          int v58 = BYTE4(a12);
        }
        else {
          int v58 = BYTE4(a12) - v57;
        }
        uint64_t v59 = v56 + v58;
        if (v53 < BYTE5(a12)) {
          unint64_t v60 = v59;
        }
        else {
          unint64_t v60 = v54 + ~(v51 + HIWORD(a12));
        }
        if (a17 && (unsigned int v61 = TSUNumberFormatterGroupingSizeForLocale(0)) != 0)
        {
          uint64_t v62 = vcvtpd_s64_f64((double)v51 / (double)v61);
          if (v62 <= 1) {
            uint64_t v62 = 1;
          }
          uint64_t v63 = v62 - 1;
        }
        else
        {
          uint64_t v63 = 0;
        }
        uint64_t v64 = v60 - v63;
        if (v64 >= 0)
        {
          unsigned int v65 = 0;
          do
          {
            if (v64 >= (int)[v52 length]) {
              break;
            }
            int v66 = [v52 characterAtIndex:v64];
            if (v66 == 48) {
              ++v65;
            }
            if ((v66 - 58) <= 0xFFFFFFF6) {
              objc_msgSend(v52, "replaceCharactersInRange:withString:", v64, 1, @" ");
            }
            if ((uint64_t)(a12 - v51) <= v65) {
              break;
            }
            BOOL v67 = v64-- <= 0;
          }
          while (!v67);
        }
        int v68 = BYTE1(a12) - BYTE3(a12);
        if (BYTE1(a12) <= (int)BYTE3(a12)) {
          goto LABEL_80;
        }
        if (v52)
        {
LABEL_75:
          uint64_t v69 = [(__CFString *)v46 length];
          int64_t v70 = BYTE3(a12) - (unint64_t)HIWORD(a12) + v69 + 1;
          if (v70 + v68 <= [(__CFString *)v46 length])
          {
            int64_t v71 = v69 + v68 + BYTE3(a12) - HIWORD(a12);
            do
            {
              if ([v52 characterAtIndex:v71] != 48) {
                break;
              }
              objc_msgSend(v52, "replaceCharactersInRange:withString:", v71, 1, @" ");
              BOOL v67 = v71-- <= v70;
            }
            while (!v67);
          }
LABEL_80:
          int v50 = (a16 & HIBYTE(a16));
          id v41 = v46;
          if (v52)
          {
            v72 = v52;
            int v50 = (a16 & HIBYTE(a16));
            id v41 = v72;
          }
          goto LABEL_82;
        }
LABEL_74:
        id v52 = (void *)[(__CFString *)v46 mutableCopy];
        goto LABEL_75;
      }
      int v68 = BYTE1(a12) - BYTE3(a12);
      id v41 = v46;
      if (v68 >= 1) {
        goto LABEL_74;
      }
    }
    else
    {
      id v41 = 0;
      unint64_t v48 = HIWORD(a12);
      int v50 = (a16 & HIBYTE(a16));
    }
LABEL_82:
    if (a8)
    {
      v100 = v46;
      if (v41) {
        double v73 = v41;
      }
      else {
        double v73 = v46;
      }
      id v41 = (__CFString *)[MEMORY[0x263F089D8] string];
      v99 = (void *)[MEMORY[0x263F08708] decimalDigitCharacterSet];
      uint64_t v74 = [(__CFString *)v73 length];
      uint64_t v75 = [a11 firstIndex];
      if (v74 - 1 < 0)
      {
        int v79 = 0;
      }
      else
      {
        uint64_t v76 = v75;
        unint64_t v77 = v48;
        unint64_t v78 = 0;
        int v79 = 0;
        int v80 = 0;
        do
        {
          if (v76 == v80 && v76 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[__CFString insertString:atIndex:](v41, "insertString:atIndex:", [a8 objectAtIndex:v79], 0);
            uint64_t v76 = [a11 indexGreaterThanIndex:v76];
            ++v79;
          }
          unsigned int v81 = [(__CFString *)v73 characterAtIndex:--v74];
          uint64_t v82 = [(__CFString *)v100 characterAtIndex:v74];
          -[__CFString insertString:atIndex:](v41, "insertString:atIndex:", objc_msgSend(NSString, "stringWithFormat:", @"%C", v81), 0);
          if (v78 >= v77) {
            v80 += [v99 characterIsMember:v82];
          }
          ++v78;
        }
        while (v74 > 0);
      }
      if (v79 >= (int)[a8 count])
      {
        int v50 = (a16 & HIBYTE(a16));
        uint64_t v46 = v100;
      }
      else
      {
        uint64_t v46 = v100;
        if ([a8 count] > (unint64_t)v79)
        {
          unint64_t v83 = v79;
          do
            -[__CFString insertString:atIndex:](v41, "insertString:atIndex:", [a8 objectAtIndex:v83++], 0);
          while (v83 < [a8 count]);
        }
        int v50 = (a16 & HIBYTE(a16));
      }
    }
    if (!v50) {
      return v41;
    }
    if (v41) {
      int v84 = v41;
    }
    else {
      int v84 = v46;
    }
    id v41 = (__CFString *)(id)[(__CFString *)v84 mutableCopy];
    double v85 = fabs(v30);
    uint64_t v42 = TSUNumberFormatFractionStringFromDouble(a23, v85 - floor(v85));
    uint64_t v43 = NSString;
    goto LABEL_107;
  }
  if (HIBYTE(a16) && (a16 & 1) == 0)
  {
    id v41 = (__CFString *)(id)[TSUNumberFormatterStringByUnescapingFormatString(a5) mutableCopy];
    if (a6) {
      -[__CFString replaceOccurrencesOfString:withString:options:range:](v41, "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(NSString, "stringWithFormat:", @"%C", 164), +[TSUNumberFormatter currencySymbolForCurrencyCode:](TSUNumberFormatter, "currencySymbolForCurrencyCode:", a6), 0, 0, -[__CFString length](v41, "length"));
    }
    uint64_t v42 = TSUNumberFormatFractionStringFromDouble(a23, v30);
    uint64_t v43 = NSString;
LABEL_107:
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v41, "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(v43, "stringWithFormat:", @"%C", (unsigned __int16)TSUCustomNumberFormatFractionReplacementCharacter), v42, 0, 0, -[__CFString length](v41, "length"));
    return v41;
  }
  if (a1 == 1)
  {
    if (a18)
    {
      id v86 = +[TSUNumberFormatter defaultFormatStringForValueType:0 negativeStyle:2];
      BYTE6(v96) = a22;
      WORD2(v96) = a21;
      BYTE2(v96) = a20;
      LOWORD(v96) = a19;
      HIBYTE(v95) = 1;
      BYTE6(v95) = a17;
      *(_DWORD *)((char *)&v95 + 2) = __PAIR32__(a16, a15);
      LOWORD(v95) = a13;
      uint64_t v87 = TSUNumberFormatStringFromDouble(0, a2, a3, 0, v86, a6, a7, 0, v30, a10, a11, a12, v95, v96, a23);

      id v88 = +[TSUNumberFormatter currencySymbolForCurrencyCode:a6];
      return (__CFString *)[NSString stringWithFormat:@"%@\t%@", v88, v87];
    }
    goto LABEL_121;
  }
  if (a1 != 5)
  {
    if (a1 == 4)
    {
      return (__CFString *)TSUNumberFormatFractionStringFromDouble(a23, v30);
    }
    if (!a1)
    {
      if ((_BYTE)a19)
      {
        if ((a15 & 1) == 0)
        {
          double v90 = fabs(v30);
          if (v90 > 1.0e12 || v90 < 0.0000001 && (v91 = __fpclassifyd(v30), int v38 = a4 | a13, v91 != 3))
          {
            int v31 = @"0E0";
            double v32 = v30;
            int v33 = 1;
            unsigned int v34 = 0;
            uint64_t v35 = 5;
            int v36 = 0;
            goto LABEL_7;
          }
        }
      }
    }
LABEL_121:
    if (HIBYTE(a19) && (a15 & 1) == 0 && (v92 = v38, v93 = __fpclassifyd(v30), int v38 = v92, v93 == 3))
    {
      double v32 = v30;
      int v31 = a5;
      int v33 = 1;
      unsigned int v34 = 0;
      uint64_t v35 = 0;
    }
    else
    {
      unsigned int v34 = a3;
      uint64_t v35 = a2;
      double v32 = v30;
      int v31 = a5;
      int v33 = a15 ^ 1;
    }
    int v36 = a17;
    int v37 = a6;
    goto LABEL_8;
  }
  id v41 = (__CFString *)TSUNumberFormatBaseStringFromDouble(a20, a21, a22, v30);
  if (v41) {
    return v41;
  }
  HIDWORD(v94) = -3;
  LOBYTE(v94) = 1;
  v89 = +[TSUNumberFormat numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](TSUNumberFormat, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", 0, 0, 0, 0, 0, 0, v94);
  [(TSUNumberFormat *)v89 setUseScientificFormattingAutomatically:1];
  return (__CFString *)[(TSUNumberFormat *)v89 stringFromDouble:v30];
}

uint64_t TSUNumberFormatFractionStringFromDouble(unsigned int a1, double a2)
{
  double v2 = fabs(a2);
  if (a2 >= 0.0) {
    double v3 = a2;
  }
  else {
    double v3 = v2;
  }
  if (a1 <= 0xFFFFFFFC)
  {
    uint64_t v4 = (int)a1;
    uint64_t v5 = (int)a1;
  }
  else
  {
    uint64_t v4 = qword_222874C90[a1 + 3];
    uint64_t v5 = 2;
  }
  uint64_t v6 = 0;
  int64_t v7 = 0;
  double v8 = floor(v3);
  double v9 = v3 - v8;
  uint64_t v10 = v4 + 1;
  double v11 = 1.79769313e308;
  do
  {
    double v12 = v9 * (double)v5;
    double v13 = vabdd_f64(v9, round(v12) / (double)v5);
    unint64_t v14 = llround(v12);
    if (v13 < v11)
    {
      int64_t v7 = v14;
      uint64_t v6 = v5;
      double v11 = v13;
    }
    ++v5;
  }
  while (v10 != v5);
  if (a1 >= 0xFFFFFFFD)
  {
    uint64_t v15 = v6;
    if (v7)
    {
      uint64_t v16 = v7;
      uint64_t v17 = v6;
      do
      {
        uint64_t v15 = v16;
        uint64_t v16 = v17 % v16;
        uint64_t v17 = v15;
      }
      while (v16);
    }
    if (v15 >= 2)
    {
      v7 /= v15;
      v6 /= v15;
    }
  }
  if (v7 == v6)
  {
    int64_t v7 = 0;
    double v8 = v8 + 1.0;
  }
  __int16 v18 = NSString;
  if (v8 == 0.0)
  {
    if (a2 < 0.0) {
      int64_t v7 = -v7;
    }
    if (v7)
    {
      return objc_msgSend(NSString, "stringWithFormat:", @"%ld/%ld", v7, v6, v22);
    }
    else
    {
      return [v18 stringWithFormat:@"0"];
    }
  }
  else
  {
    if (a2 >= 0.0) {
      double v19 = v8;
    }
    else {
      double v19 = -v8;
    }
    if (v7) {
      return objc_msgSend(NSString, "stringWithFormat:", @"%.0f %ld/%ld", *(void *)&v19, v7, v6);
    }
    else {
      return objc_msgSend(NSString, "stringWithFormat:", @"%.0f", *(void *)&v19, v21, v22);
    }
  }
}

void *TSUNumberFormatBaseStringFromDouble(uint64_t a1, unsigned int a2, int a3, double a4)
{
  if ((a1 - 1) >= 0x24)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUNumberFormatBaseStringFromDouble(double, UInt8, UInt16, BOOL)");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 1797, @"Trying to format a baseFormat cell with an illegal base number");
  }
  if (a4 > 9.22337204e18 || a4 < -9.22337204e18) {
    return 0;
  }
  double v12 = rint(a4);
  uint64_t v13 = (uint64_t)v12;
  if ((uint64_t)v12 >= 0) {
    uint64_t v14 = (uint64_t)v12;
  }
  else {
    uint64_t v14 = -v13;
  }
  if ((uint64_t)v12 < 0) {
    int v15 = a3;
  }
  else {
    int v15 = 0;
  }
  if (v13 < 0 && (a3 & 1) == 0)
  {
    if (a1 > 0x10 || ((1 << a1) & 0x10104) == 0)
    {
      id v16 = +[TSUAssertionHandler currentHandler];
      uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUNumberFormatBaseStringFromDouble(double, UInt8, UInt16, BOOL)");
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 1817, @"Trying to display two's-complement for unsupported base %d", a1);
    }
    if ((unint64_t)v14 >= 0x80000001)
    {
      uint64_t v18 = -32;
      uint64_t v19 = 0x80000000;
      while (v18 != -50)
      {
        uint64_t v20 = 2 * v19;
        --v18;
        BOOL v21 = v14 > (unint64_t)(2 * v19);
        v19 *= 2;
        if (!v21)
        {
          unint64_t v22 = -v18;
          goto LABEL_26;
        }
      }
      return 0;
    }
    uint64_t v20 = 0x80000000;
    unint64_t v22 = 32;
LABEL_26:
    uint64_t v14 = 2 * v20 - v14;
    LODWORD(v23) = (int)(log2((double)a1) * (double)a2);
    unint64_t v23 = (int)v23 <= 32 ? 32 : v23;
    BOOL v21 = v23 > v22;
    unint64_t v24 = v23 - v22;
    if (v21)
    {
      while (v20 <= 500000000000000)
      {
        v14 += 2 * v20;
        v20 *= 2;
        if (!--v24) {
          goto LABEL_33;
        }
      }
      return 0;
    }
  }
LABEL_33:
  double v11 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v25 = 1;
  do
  {
    if (a1 == 26)
    {
      unsigned __int16 v26 = v14 / v25 % 26 + 65;
    }
    else if (a1 == 1)
    {
      unsigned __int16 v26 = 49;
    }
    else
    {
      int v27 = v14 / v25 % a1;
      if (v27 <= 9) {
        __int16 v28 = 48;
      }
      else {
        __int16 v28 = 55;
      }
      unsigned __int16 v26 = v28 + v27;
    }
    objc_msgSend(v11, "tsu_insertCharacter:atIndex:", v26, 0);
    uint64_t v25 = (a1 == 1) + v25 * a1;
  }
  while (v25 && v14 / v25 > 0);
  if (a2)
  {
    signed int v29 = (a2 - [v11 length]) << 24;
    if (v29 >= 1)
    {
      int v30 = v29 >> 24;
      if (a1 == 26) {
        uint64_t v31 = 65;
      }
      else {
        uint64_t v31 = 48;
      }
      if (v30 <= 1) {
        int v32 = 1;
      }
      else {
        int v32 = v30;
      }
      do
      {
        objc_msgSend(v11, "tsu_insertCharacter:atIndex:", v31, 0);
        --v32;
      }
      while (v32);
    }
  }
  if ((v13 & 0x8000000000000000) == 0
    && (a3 & 1) == 0
    && v14 >= 0x80000000
    && [v11 characterAtIndex:0] != 48)
  {
    objc_msgSend(v11, "tsu_insertCharacter:atIndex:", 48, 0);
  }
  if (v15) {
    objc_msgSend(v11, "tsu_insertCharacter:atIndex:", 45, 0);
  }
  return v11;
}

void *TSUNumberFormatCustomNumberFormatTokensFromTSUCustomFormatData(uint64_t a1, int a2)
{
  if (a2 != 270)
  {
    if (a2 != 271) {
      return 0;
    }
    double v3 = (void *)[MEMORY[0x263EFF980] array];
    uint64_t v4 = (void *)[MEMORY[0x263F089D8] string];
    uint64_t v5 = *(void **)(a1 + 8);
    uint64_t v6 = [v5 length];
    if (v6)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        unsigned int v9 = [v5 characterAtIndex:i];
        if (v9 == (unsigned __int16)TSUCustomNumberFormatTextReplacementCharacter)
        {
          if ([v4 length]) {
            [v3 addObject:v4];
          }
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x263F089D8], "customNumberFormatTokenStringOfType:content:", 5, @"@"));
          uint64_t v4 = (void *)[MEMORY[0x263F089D8] string];
        }
        else
        {
          objc_msgSend(v4, "appendFormat:", @"%C", v9);
        }
      }
    }
    if ([v4 length])
    {
      uint64_t v10 = v3;
      uint64_t v11 = (uint64_t)v4;
LABEL_181:
      [v10 addObject:v11];
      return v3;
    }
    return v3;
  }
  uint64_t v12 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"+-,#@0123456789"];
  uint64_t v13 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"#@0123456789"];
  double v3 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v14 = *(void **)(a1 + 8);
  uint64_t v15 = [v14 length];
  unint64_t v16 = 0x263F08000uLL;
  if (v15)
  {
    unint64_t v17 = v15;
    id v86 = (void *)v13;
    id v88 = (void *)v12;
    unint64_t v18 = 0;
    char v19 = 0;
    char v90 = 0;
    uint64_t v92 = a1;
    while (1)
    {
      uint64_t v20 = [v14 characterAtIndex:v18];
      unint64_t v21 = v18 + 1;
      int v22 = v18 + 1 >= v17 ? 0 : [v14 characterAtIndex:v18 + 1];
      if (v20 != 46) {
        break;
      }
      char v19 = 1;
LABEL_50:
      unint64_t v18 = v21;
      if (v21 >= v17) {
        goto LABEL_165;
      }
    }
    if (v20 == 39)
    {
      unint64_t v23 = (void *)[MEMORY[0x263F089D8] string];
      unint64_t v24 = v23;
      if (v22 == 39)
      {
        [v23 appendString:@"'"];
        unint64_t v25 = v18 + 2;
LABEL_43:
        if ([v24 length]) {
          [v3 addObject:v24];
        }
        unint64_t v21 = v25;
        goto LABEL_50;
      }
      unint64_t v25 = v18 + 1;
      if (v21 >= v17) {
        goto LABEL_43;
      }
      while (2)
      {
        unsigned int v33 = [v14 characterAtIndex:v21];
        unsigned int v34 = v33;
        unint64_t v25 = v21 + 1;
        if (v21 + 1 >= v17)
        {
          if (v33 == 39) {
            goto LABEL_43;
          }
        }
        else
        {
          int v35 = [v14 characterAtIndex:v21 + 1];
          if (v34 == 39)
          {
            if (v35 != 39) {
              goto LABEL_43;
            }
            [v24 appendString:@"'"];
            unint64_t v25 = v21 + 2;
LABEL_42:
            unint64_t v21 = v25;
            if (v25 >= v17) {
              goto LABEL_43;
            }
            continue;
          }
        }
        break;
      }
      objc_msgSend(v24, "appendFormat:", @"%C", v34);
      goto LABEL_42;
    }
    if (v20 == (unsigned __int16)TSUCustomNumberFormatSpaceNarrowCharacter
      || v20 == (unsigned __int16)TSUCustomNumberFormatSpaceNormalCharacter
      || v20 == (unsigned __int16)TSUCustomNumberFormatSpaceWideCharacter
      || v20 == (unsigned __int16)TSUCustomNumberFormatSpaceFlexibleCharacter)
    {
      signed int v29 = (void *)MEMORY[0x263F089D8];
      uint64_t v30 = objc_msgSend(*(id *)(v16 + 2880), "stringWithFormat:", @"%C", v20);
      uint64_t v31 = v29;
      uint64_t v32 = 4;
    }
    else if (v20 == (unsigned __int16)TSUCustomNumberFormatFractionReplacementCharacter)
    {
      int v36 = (void *)MEMORY[0x263F089D8];
      uint64_t v30 = objc_msgSend(*(id *)(v16 + 2880), "stringWithFormat:", @"%d", *(char *)(a1 + 48));
      uint64_t v31 = v36;
      uint64_t v32 = 6;
    }
    else
    {
      uint64_t v38 = (v20 - 37);
      if (v38 <= 0x2F)
      {
        if (((1 << (v20 - 37)) & 0x814060000001) != 0)
        {
          [v3 addObject:objc_msgSend(MEMORY[0x263F089D8], "customNumberFormatTokenStringOfType:content:", 0, objc_msgSend(*(id *)(v16 + 2880), "stringWithFormat:", @"%C%C", v20, v20))];
LABEL_55:
          char v90 = 1;
          goto LABEL_50;
        }
        if (v38 == 32)
        {
          [v3 addObject:objc_msgSend(MEMORY[0x263F089D8], "customNumberFormatTokenStringOfType:content:", 0, objc_msgSend(*(id *)(v16 + 2880), "stringWithFormat:", @"%C", 69))];
          if (v21 < v17)
          {
            while (objc_msgSend(v88, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", v21)))
            {
              if (v17 == ++v21) {
                return v3;
              }
            }
          }
          goto LABEL_55;
        }
      }
      if (v20 != 164)
      {
        if ([v88 characterIsMember:v20])
        {
          if (v19)
          {
            if (v18 >= v17)
            {
              int v40 = 0;
              int v39 = 0;
            }
            else
            {
              int v39 = 0;
              int v40 = 0;
              while (1)
              {
                uint64_t v41 = [v14 characterAtIndex:v18];
                if (![v88 characterIsMember:v41]) {
                  break;
                }
                int v42 = [v86 characterIsMember:v41];
                v40 += v42;
                if (v41 == 48) {
                  int v43 = v42;
                }
                else {
                  int v43 = 0;
                }
                v39 += v43;
                if (v17 == ++v18)
                {
                  unint64_t v18 = v17;
                  break;
                }
              }
            }
            uint64_t v47 = *(unsigned __int8 *)(v92 + 52);
            if (*(unsigned char *)(v92 + 50))
            {
              uint64_t v48 = (v39 - v47);
            }
            else
            {
              int v39 = *(unsigned __int8 *)(v92 + 52);
              uint64_t v48 = 0;
            }
            if (*(unsigned char *)(v92 + 52)) {
              objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(v16 + 2880), "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:", v47, @"0"));
            }
            if ((int)v48 >= 1) {
              objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(v16 + 2880), "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:", v48, @"?"));
            }
            if (v40 - v39 >= 1) {
              objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(v16 + 2880), "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:"));
            }
            char v19 = 1;
            unint64_t v21 = v18;
          }
          else
          {
            if (v18 >= v17)
            {
              int v83 = 0;
              unint64_t v21 = v18;
              unint64_t v45 = 0x263EFF000;
            }
            else
            {
              int v44 = 0;
              unint64_t v45 = 0x263EFF000uLL;
              while (1)
              {
                uint64_t v46 = [v14 characterAtIndex:v18];
                if (![v88 characterIsMember:v46]) {
                  break;
                }
                v44 += [v86 characterIsMember:v46];
                if (v17 == ++v18)
                {
                  int v83 = v44;
                  unint64_t v21 = v17;
                  goto LABEL_92;
                }
              }
              int v83 = v44;
              unint64_t v21 = v18;
            }
LABEL_92:
            int v91 = (void *)[*(id *)(v45 + 2432) array];
            int v49 = *(unsigned __int8 *)(a1 + 51);
            int v50 = *(unsigned __int8 *)(a1 + 49);
            int v84 = v50;
            if (!*(unsigned char *)(a1 + 49)) {
              int v50 = *(unsigned __int8 *)(a1 + 51);
            }
            int v85 = v50;
            v89 = *(void **)(a1 + 32);
            uint64_t v51 = [v89 firstIndex];
            uint64_t v52 = v51;
            int v82 = v49;
            if (v49)
            {
              uint64_t v87 = 0;
              uint64_t v53 = 0;
              uint64_t v54 = v51;
              int v55 = v49;
              do
              {
                if (v89) {
                  BOOL v56 = v54 == 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  BOOL v56 = 1;
                }
                int v57 = !v56;
                uint64_t v58 = v55;
                uint64_t v59 = v54 - v53;
                if (v54 - v53 >= v58) {
                  uint64_t v59 = v58;
                }
                BOOL v60 = v57 != 1 || v54 - v53 <= v58;
                if (v57 == 1) {
                  uint64_t v61 = v59;
                }
                else {
                  uint64_t v61 = v58;
                }
                objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(NSString, "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v61, *(unsigned char *)(v92 + 56) & 1, @"0"), 0);
                if (v57)
                {
                  if (v60)
                  {
                    objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(*(id *)(v92 + 24), "objectAtIndex:", v87++), 0);
                    uint64_t v52 = [*(id *)(v92 + 32) indexGreaterThanIndex:v54];
                  }
                  else
                  {
                    uint64_t v52 = v54;
                    uint64_t v54 = v61 + v53;
                  }
                }
                else
                {
                  uint64_t v52 = v54;
                  uint64_t v54 = v53;
                }
                int v55 = v58 - v61;
                uint64_t v62 = v54;
                uint64_t v53 = v54;
                uint64_t v54 = v52;
              }
              while (v55 > 0);
            }
            else
            {
              uint64_t v62 = 0;
              uint64_t v87 = 0;
            }
            if (v84)
            {
              unsigned int v63 = v84 - v82;
              uint64_t v64 = v52;
              if (v84 - v82 >= 1)
              {
                do
                {
                  if (v89) {
                    BOOL v65 = v64 == 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    BOOL v65 = 1;
                  }
                  int v66 = !v65;
                  uint64_t v67 = v63;
                  uint64_t v68 = v64 - v62;
                  if (v64 - v62 >= v67) {
                    uint64_t v68 = v67;
                  }
                  BOOL v69 = v66 != 1 || v64 - v62 <= v67;
                  if (v66 == 1) {
                    uint64_t v70 = v68;
                  }
                  else {
                    uint64_t v70 = v67;
                  }
                  objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(NSString, "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v70, *(unsigned char *)(v92 + 56) & 1, @"?"), 0);
                  if (v66)
                  {
                    if (v69)
                    {
                      objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(*(id *)(v92 + 24), "objectAtIndex:", v87++), 0);
                      uint64_t v52 = [*(id *)(v92 + 32) indexGreaterThanIndex:v64];
                    }
                    else
                    {
                      uint64_t v52 = v64;
                      uint64_t v64 = v70 + v62;
                    }
                  }
                  else
                  {
                    uint64_t v52 = v64;
                    uint64_t v64 = v62;
                  }
                  unsigned int v63 = v67 - v70;
                  uint64_t v62 = v64;
                  uint64_t v64 = v52;
                }
                while ((int)v67 - (int)v70 > 0);
              }
            }
            unsigned int v71 = v83 - v85;
            if (v83 - v85 >= 1)
            {
              do
              {
                if (v89) {
                  BOOL v72 = v52 == 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  BOOL v72 = 1;
                }
                int v73 = !v72;
                uint64_t v74 = v71;
                uint64_t v75 = v52 - v62;
                if (v52 - v62 >= v74) {
                  uint64_t v75 = v74;
                }
                BOOL v76 = v73 != 1 || v52 - v62 <= v74;
                if (v73 == 1) {
                  uint64_t v77 = v75;
                }
                else {
                  uint64_t v77 = v74;
                }
                objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(NSString, "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v77, *(unsigned char *)(v92 + 56) & 1, @"#"), 0);
                if (v73)
                {
                  if (v76)
                  {
                    objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(*(id *)(v92 + 24), "objectAtIndex:", v87++), 0);
                    uint64_t v78 = [*(id *)(v92 + 32) indexGreaterThanIndex:v52];
                  }
                  else
                  {
                    uint64_t v78 = v52;
                    uint64_t v52 = v77 + v62;
                  }
                }
                else
                {
                  uint64_t v78 = v52;
                  uint64_t v52 = v62;
                }
                unsigned int v71 = v74 - v77;
                uint64_t v62 = v52;
                uint64_t v52 = v78;
              }
              while ((int)v74 - (int)v77 > 0);
            }
            [v3 addObjectsFromArray:v91];
            char v19 = 0;
            unint64_t v16 = 0x263F08000;
          }
          a1 = v92;
          goto LABEL_50;
        }
        uint64_t v37 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%C", v20);
        goto LABEL_49;
      }
      uint64_t v31 = (void *)MEMORY[0x263F089D8];
      uint64_t v30 = *(void *)(a1 + 16);
      uint64_t v32 = 3;
    }
    uint64_t v37 = [v31 customNumberFormatTokenStringOfType:v32 content:v30];
LABEL_49:
    [v3 addObject:v37];
    goto LABEL_50;
  }
  char v90 = 0;
LABEL_165:
  double v79 = *(double *)(a1 + 40);
  if (v79 != 1.0 && (v90 & 1) == 0)
  {
    if (v79 == 100.0)
    {
      uint64_t v80 = 37;
    }
    else if (v79 == 0.01)
    {
      uint64_t v80 = 67;
    }
    else if (v79 == 0.001)
    {
      uint64_t v80 = 75;
    }
    else if (v79 == 0.000001)
    {
      uint64_t v80 = 77;
    }
    else if (v79 == 0.000000001)
    {
      uint64_t v80 = 66;
    }
    else if (v79 == 1.0e-12)
    {
      uint64_t v80 = 84;
    }
    else
    {
      uint64_t v80 = 0;
    }
    uint64_t v11 = [MEMORY[0x263F089D8] customNumberFormatTokenStringOfType:0, objc_msgSend(*(id *)(v16 + 2880), "stringWithFormat:", @"%C", v80) content];
    uint64_t v10 = v3;
    goto LABEL_181;
  }
  return v3;
}

uint64_t TSUNumberFormatStringApplyPrefixAndSuffix(void *a1, void *a2, void *a3)
{
  if (a2)
  {
    uint64_t v5 = a2;
    if ([a2 length])
    {
      if ([v5 rangeOfString:@"'"] != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v5 = (void *)[v5 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
      }
      if ([a1 length] && objc_msgSend(a1, "characterAtIndex:", 0) == 39)
      {
        uint64_t v6 = (void *)[NSString stringWithFormat:@"'%@", v5];
        a1 = (void *)[a1 substringFromIndex:1];
      }
      else
      {
        uint64_t v6 = (void *)[NSString stringWithFormat:@"'%@'", v5];
      }
      a1 = (void *)[v6 stringByAppendingString:a1];
    }
  }
  if (!a3 || ![a3 length]) {
    return (uint64_t)a1;
  }
  if ([a3 rangeOfString:@"'"] != 0x7FFFFFFFFFFFFFFFLL) {
    a3 = (void *)[a3 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
  }
  uint64_t v7 = [a1 length];
  if (v7 && (uint64_t v8 = v7 - 1, [a1 characterAtIndex:v7 - 1] == 39))
  {
    uint64_t v9 = [NSString stringWithFormat:@"%@'", a3];
    a1 = (void *)[a1 substringToIndex:v8];
  }
  else
  {
    uint64_t v9 = [NSString stringWithFormat:@"'%@'", a3];
  }
  return [a1 stringByAppendingString:v9];
}

void sub_2228272F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSULocationInRanges(unint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = [a2 count];
  if (result)
  {
    unint64_t v5 = result;
    unint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 0), "rangeValue");
    if (a1 < v6 || a1 - v6 >= v7)
    {
      uint64_t v8 = 1;
      do
      {
        unint64_t v9 = v8;
        if (v5 == v8) {
          break;
        }
        unint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", v8), "rangeValue");
        uint64_t v8 = v9 + 1;
      }
      while (a1 < v10 || a1 - v10 >= v11);
      return v9 < v5;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t TSUSearchCharacterSetForSeparatorCharacter(unsigned int a1)
{
  CFCharacterSetRef v2 = (const __CFCharacterSet *)[MEMORY[0x263F08708] characterSetWithCharactersInString:@",，"];
  CFCharacterSetRef v3 = (const __CFCharacterSet *)[MEMORY[0x263F08708] characterSetWithCharactersInString:@".．"];
  CFCharacterSetRef v4 = (const __CFCharacterSet *)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"  "];
  if (CFCharacterSetIsCharacterMember(v3, a1)) {
    return (uint64_t)v3;
  }
  CFCharacterSetRef v3 = v2;
  if (CFCharacterSetIsCharacterMember(v2, a1)) {
    return (uint64_t)v3;
  }
  CFCharacterSetRef v3 = v4;
  if (CFCharacterSetIsCharacterMember(v4, a1)) {
    return (uint64_t)v3;
  }
  unint64_t v6 = (void *)MEMORY[0x263F08708];
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%C", a1);
  return [v6 characterSetWithCharactersInString:v7];
}

BOOL TSUNumberOfDigitsInStringAllowsPreciseDoubleParsing(void *a1)
{
  CFCharacterSetRef v2 = (void *)[MEMORY[0x263F08B08] scannerWithString:a1];
  [v2 setCharactersToBeSkipped:0];
  unint64_t v3 = 0;
  uint64_t v7 = 0;
  id v8 = 0;
  do
  {
    unint64_t v4 = objc_msgSend(v2, "scanLocation", v7);
    unint64_t v5 = [a1 length];
    if (v4 >= v5) {
      break;
    }
    objc_msgSend(v2, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x263F08708], "decimalDigitCharacterSet"), &v8);
    objc_msgSend(v2, "scanCharactersFromSet:intoString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "decimalDigitCharacterSet"), "invertedSet"), &v7);
    v3 += [v8 length];
  }
  while (v3 <= kTSUNumberFormatterMaxDigitsForPreciseDoubleParsing);
  return v4 >= v5;
}

uint64_t TSUNumberOfDecimalPlacesInNumericString(const __CFString *a1, CFLocaleRef locale)
{
  CFLocaleRef v4 = locale;
  if (!locale) {
    CFLocaleRef v4 = CFLocaleCopyCurrent();
  }
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(v4, (CFLocaleKey)*MEMORY[0x263EFFCD0]);
  unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(Value, 0);
  CFCharacterSetRef v7 = (const __CFCharacterSet *)TSUSearchCharacterSetForSeparatorCharacter(CharacterAtIndex);
  v18.location = 0;
  v18.length = 0;
  v19.length = CFStringGetLength(a1);
  v19.location = 0;
  if (CFStringFindCharacterFromSet(a1, v7, v19, 4uLL, &v18)) {
    BOOL v8 = v18.length == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v18.location == -1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
    uint64_t v12 = 0;
    CFIndex v13 = v18.location + 1;
    do
    {
      uint64_t v10 = v12;
      CFIndex v14 = v13 + v12;
      if (v13 + v12 >= (unint64_t)CFStringGetLength(a1)) {
        break;
      }
      UniChar v15 = CFStringGetCharacterAtIndex(a1, v14);
      int IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v15);
      uint64_t v12 = v10 + 1;
    }
    while (IsCharacterMember);
  }
  if (!locale) {
    CFRelease(v4);
  }
  return v10;
}

BOOL TSUIsGroupingSeparatorUsedInNumericString(const __CFString *a1, CFLocaleRef locale)
{
  CFLocaleRef v4 = locale;
  if (!locale) {
    CFLocaleRef v4 = CFLocaleCopyCurrent();
  }
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(v4, (CFLocaleKey)*MEMORY[0x263EFFCE0]);
  unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(Value, 0);
  CFCharacterSetRef v7 = (const __CFCharacterSet *)TSUSearchCharacterSetForSeparatorCharacter(CharacterAtIndex);
  v18.CFIndex location = 0;
  v18.length = 0;
  v19.length = CFStringGetLength(a1);
  v19.CFIndex location = 0;
  if (CFStringFindCharacterFromSet(a1, v7, v19, 0, &v18)) {
    BOOL v8 = v18.length == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = v8 || v18.location == -1;
  if (v9
    || (CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit),
        CFIndex location = v18.location,
        CFIndex v12 = v18.location - 1,
        v18.location < 1)
    || (CFCharacterSetRef v13 = Predefined, location > CFStringGetLength(a1))
    || (UniChar v14 = CFStringGetCharacterAtIndex(a1, v12), !CFCharacterSetIsCharacterMember(v13, v14))
    || location + 1 >= CFStringGetLength(a1))
  {
    BOOL v16 = 0;
    if (!locale) {
LABEL_17:
    }
      CFRelease(v4);
  }
  else
  {
    UniChar v15 = CFStringGetCharacterAtIndex(a1, location + 1);
    BOOL v16 = CFCharacterSetIsCharacterMember(v13, v15) != 0;
    if (!locale) {
      goto LABEL_17;
    }
  }
  return v16;
}

unint64_t TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific(uint64_t a1, double a2)
{
  double valuePtr = a2;
  unint64_t v3 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (!TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter)
  {
    CFLocaleRef v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter)
    {
      CFAllocatorRef v5 = *v3;
      CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(*v3, @"en_US");
      CFLocaleRef v7 = CFLocaleCreate(v5, CanonicalLocaleIdentifierFromString);
      CFRelease(CanonicalLocaleIdentifierFromString);
      BOOL v8 = CFNumberFormatterCreate(v5, v7, kCFNumberFormatterNoStyle);
      CFRelease(v7);
      CFNumberFormatterSetFormat(v8, @"#.##E+00");
      __dmb(0xBu);
      TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter = (uint64_t)v8;
    }
    objc_sync_exit(v4);
  }
  BOOL v9 = (void *)[objc_alloc(NSNumber) initWithInt:a1];
  uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  [(id)gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific lock];
  CFNumberFormatterSetProperty((CFNumberFormatterRef)TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], v9);
  CFNumberFormatterSetProperty((CFNumberFormatterRef)TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], v9);
  CFNumberFormatterSetProperty((CFNumberFormatterRef)TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], v10);
  unint64_t v11 = (__CFString *)CFNumberFormatterCreateStringWithValue(*v3, (CFNumberFormatterRef)TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter, kCFNumberDoubleType, &valuePtr);
  [(id)gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific unlock];

  unint64_t v12 = [(__CFString *)v11 rangeOfString:@"."];
  unint64_t v13 = [(__CFString *)v11 rangeOfString:@"E" options:1];
  unint64_t v14 = 0;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v15 = v13 - v12;
    if (v13 > v12)
    {
      unint64_t v14 = v13 + ~v12;
      unint64_t v16 = v13 - 1;
      uint64_t v17 = 1;
      while (v15 != v17)
      {
        int v18 = [(__CFString *)v11 characterAtIndex:v16];
        ++v17;
        --v16;
        if (v18 != 48)
        {
          unint64_t v14 = v17 - 2;
          break;
        }
      }
    }
  }

  return v14;
}

void sub_2228282B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2228282EC(void *a1)
{
}

uint64_t TSUNumberOfDecimalPlacesInValue(double a1)
{
  double valuePtr = a1;
  if (floor(a1) == a1) {
    return 0;
  }
  CFCharacterSetRef v2 = (__CFNumberFormatter *)TSUNumberOfDecimalPlacesInValue_formatter;
  unint64_t v3 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (!TSUNumberOfDecimalPlacesInValue_formatter)
  {
    CFLocaleRef v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!TSUNumberOfDecimalPlacesInValue_formatter)
    {
      CFAllocatorRef v5 = *v3;
      CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(*v3, @"en_US");
      CFLocaleRef v7 = CFLocaleCreate(v5, CanonicalLocaleIdentifierFromString);
      CFRelease(CanonicalLocaleIdentifierFromString);
      BOOL v8 = CFNumberFormatterCreate(v5, v7, kCFNumberFormatterNoStyle);
      CFRelease(v7);
      CFNumberFormatterSetFormat(v8, @"0");
      BOOL v9 = (const void *)[NSNumber numberWithInt:0];
      CFNumberFormatterSetProperty(v8, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], v9);
      uint64_t v10 = (const void *)[NSNumber numberWithInt:0x7FFFFFFFLL];
      CFNumberFormatterSetProperty(v8, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], v10);
      __dmb(0xBu);
      TSUNumberOfDecimalPlacesInValue_formatter = (uint64_t)v8;
    }
    objc_sync_exit(v4);
    CFCharacterSetRef v2 = (__CFNumberFormatter *)TSUNumberOfDecimalPlacesInValue_formatter;
  }
  unint64_t v11 = (__CFString *)CFNumberFormatterCreateStringWithValue(*v3, v2, kCFNumberDoubleType, &valuePtr);
  uint64_t v12 = [(__CFString *)v11 rangeOfString:@"."];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 == 1) {
    uint64_t v1 = [(__CFString *)v11 length] + ~v12;
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

void sub_222828488(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUNumberOfDecimalPlacesNecessaryToDisplayFullPrecisionInScientificNotation(double a1)
{
  double valuePtr = a1;
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString((CFAllocatorRef)*MEMORY[0x263EFFB08], @"en_US");
  CFLocaleRef v3 = CFLocaleCreate(v1, CanonicalLocaleIdentifierFromString);
  CFRelease(CanonicalLocaleIdentifierFromString);
  CFLocaleRef v4 = CFNumberFormatterCreate(v1, v3, kCFNumberFormatterNoStyle);
  CFRelease(v3);
  CFNumberFormatterSetFormat(v4, @"0");
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], (CFTypeRef)[NSNumber numberWithInt:0]);
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], (CFTypeRef)[NSNumber numberWithInt:0x7FFFFFFFLL]);
  CFAllocatorRef v5 = (__CFString *)CFNumberFormatterCreateStringWithValue(v1, v4, kCFNumberDoubleType, &valuePtr);
  CFRelease(v4);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"0.-"), "invertedSet");
  uint64_t v7 = [(__CFString *)v5 rangeOfCharacterFromSet:v6];
  uint64_t v9 = 0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 == 1)
  {
    uint64_t v11 = v7;
    if (v7 != [(__CFString *)v5 length] - 1
      && ((uint64_t v12 = -[__CFString rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v6, 4, v11 + 1, [(__CFString *)v5 length] - (v11 + 1)), v12 != 0x7FFFFFFFFFFFFFFFLL)? (v14 = v13 == 1): (v14 = 0), v14))
    {
      uint64_t v15 = v12 - v11;
      BOOL v18 = [(__CFString *)v5 rangeOfString:@".", 0, v11, v12 - v11 + 1 options range] != 0x7FFFFFFFFFFFFFFFLL&& v16 == 1;
      uint64_t v9 = v15 - v18;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

uint64_t TSUNumberFormatterGroupingSizeForLocale(const __CFLocale *a1)
{
  if (a1)
  {
    CFAllocatorRef v1 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterDecimalStyle);
    CFNumberRef v2 = (const __CFNumber *)CFNumberFormatterCopyProperty(v1, (CFNumberFormatterKey)*MEMORY[0x263EFFD68]);
    CFRelease(v1);
    unsigned int valuePtr = 0;
    CFNumberGetValue(v2, kCFNumberIntType, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    uint64_t result = TSUNumberFormatterGroupingSizeForLocale_sCurrentLocaleGroupingSize;
    if (TSUNumberFormatterGroupingSizeForLocale_sCurrentLocaleGroupingSize == -1)
    {
      CFLocaleRef v4 = objc_opt_class();
      objc_sync_enter(v4);
      uint64_t v5 = TSUGetCurrentLocale();
      int v6 = TSUNumberFormatterGroupingSizeForLocale(v5);
      __dmb(0xBu);
      TSUNumberFormatterGroupingSizeForLocale_sCurrentLocaleGroupingSize = v6;
      objc_sync_exit(v4);
      return TSUNumberFormatterGroupingSizeForLocale_sCurrentLocaleGroupingSize;
    }
  }
  return result;
}

void sub_222828730(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *TSUNumberFormatterStringFromDoubleWithFormat(__CFString *a1, int a2, unsigned int a3, uint64_t a4, int a5, __CFString *a6, int a7, double a8)
{
  if (a6 && [(__CFString *)a6 length])
  {
    return TSUNumberFormatterStringFromDoubleWithFormatForCurrency(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    return TSUNumberFormatterStringFromDoubleWithFormatForNumber(a1, a2, a3, a4, a5, a7, a8);
  }
}

__CFString *TSUNumberFormatterStringFromDoubleWithFormatForCurrency(__CFString *a1, int a2, unsigned int a3, unsigned int a4, int a5, __CFString *a6, int a7, double a8)
{
  double valuePtr = a8;
  CFLocaleRef v11 = (const __CFLocale *)TSUGetCurrentLocale();
  uint64_t v12 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (!TSUNumberFormatterStringFromDoubleWithFormatForCurrency_formatter)
  {
    uint64_t v13 = objc_opt_class();
    objc_sync_enter(v13);
    if (!TSUNumberFormatterStringFromDoubleWithFormatForCurrency_formatter)
    {
      BOOL v14 = CFNumberFormatterCreate(*v12, v11, kCFNumberFormatterNoStyle);
      uint64_t v15 = (const void *)[NSNumber numberWithInt:6];
      CFNumberFormatterSetProperty(v14, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], v15);
      uint64_t v16 = (void *)[objc_alloc(NSNumber) initWithInt:1];
      CFNumberFormatterSetProperty(v14, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], v16);

      __dmb(0xBu);
      TSUNumberFormatterStringFromDoubleWithFormatForCurrency_formatter = (uint64_t)v14;
    }
    objc_sync_exit(v13);
  }
  if (!TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter)
  {
    uint64_t v17 = objc_opt_class();
    objc_sync_enter(v17);
    if (!TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter)
    {
      BOOL v18 = CFNumberFormatterCreate(*v12, v11, kCFNumberFormatterNoStyle);
      CFRange v19 = (const void *)[NSNumber numberWithInt:6];
      CFNumberFormatterSetProperty(v18, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], v19);
      uint64_t v20 = (void *)[objc_alloc(NSNumber) initWithInt:1];
      CFNumberFormatterSetProperty(v18, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], v20);

      __dmb(0xBu);
      TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter = (uint64_t)v18;
    }
    objc_sync_exit(v17);
  }
  [(id)gLockTSUNumberFormatterStringFromDoubleWithFormat lock];
  unint64_t v21 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter;
  if (a7) {
    int v22 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter;
  }
  else {
    int v22 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForCurrency_formatter;
  }
  uint64_t v23 = (uint64_t)v22;
  if ((__CFNumberFormatter *)sActiveCurrencyFormatter != v22)
  {
    sActiveCurrencyFormatter = 0;

    sActiveCurrencyCFStringRef Format = 0;
    uint64_t v23 = sActiveCurrencyFormatter;
  }
  if (!v23
    || (__CFString *)sActiveCurrencyCode != a6
    && ([(id)sActiveCurrencyCode isEqualToString:a6] & 1) == 0)
  {

    sActiveCurrencyCFStringRef Format = 0;
    CFStringRef v24 = (const __CFString *)*MEMORY[0x263EFFD20];
    if (a6)
    {
      CFNumberFormatterSetProperty(v22, v24, a6);
      if (CFEqual(a6, @"CHF"))
      {
        unint64_t v25 = (void *)[objc_alloc(NSNumber) initWithInt:0];
        CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFE18], v25);
      }
    }
    else
    {
      CFNumberFormatterSetProperty(v22, v24, &stru_26D4F03D0);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFD38], &stru_26D4F03D0);
    }

    sActiveCurrencyCode = [(__CFString *)a6 copy];
  }
  if (!sActiveCurrencyFormat || CFStringCompare(a1, (CFStringRef)sActiveCurrencyFormat, 0))
  {
    CFNumberFormatterSetFormat(v22, a1);

    sActiveCurrencyCFStringRef Format = a1;
  }
  if (a2)
  {
    if ((unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary == a4)
    {
      unsigned __int16 v26 = (void *)[objc_alloc(NSNumber) initWithInt:0];
      int v27 = (void *)[objc_alloc(NSNumber) initWithInt:0x7FFFFFFFLL];
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], v26);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], v27);
    }
    else
    {
      __int16 v28 = (void *)[objc_alloc(NSNumber) initWithInt:a3];
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], v28);

      signed int v29 = (void *)[objc_alloc(NSNumber) initWithInt:a4];
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], v29);
    }
  }
  if (a7) {
    CFNumberFormatterSetProperty(v21, (CFNumberFormatterKey)*MEMORY[0x263EFFDB8], &stru_26D4F03D0);
  }
  uint64_t v30 = (CFTypeRef *)MEMORY[0x263EFFB38];
  if (a5) {
    uint64_t v30 = (CFTypeRef *)MEMORY[0x263EFFB40];
  }
  CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFE30], *v30);
  uint64_t v31 = (__CFString *)CFNumberFormatterCreateStringWithValue(*v12, v22, kCFNumberDoubleType, &valuePtr);
  sActiveCurrencyFormatter = (uint64_t)v22;
  [(id)gLockTSUNumberFormatterStringFromDoubleWithFormat unlock];
  return v31;
}

void sub_222828CA8(void *a1)
{
}

__CFString *TSUNumberFormatterStringFromDoubleWithFormatForNumber(__CFString *a1, int a2, unsigned int a3, uint64_t a4, int a5, int a6, double a7)
{
  double valuePtr = a7;
  CFLocaleRef v12 = (const __CFLocale *)TSUGetCurrentLocale();
  if (!TSUNumberFormatterStringFromDoubleWithFormatForNumber_formatter)
  {
    uint64_t v13 = objc_opt_class();
    objc_sync_enter(v13);
    if (!TSUNumberFormatterStringFromDoubleWithFormatForNumber_formatter)
    {
      BOOL v14 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v12, kCFNumberFormatterNoStyle);
      uint64_t v15 = (const void *)[NSNumber numberWithInt:6];
      CFNumberFormatterSetProperty(v14, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], v15);
      uint64_t v16 = (void *)[objc_alloc(NSNumber) initWithInt:1];
      CFNumberFormatterSetProperty(v14, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], v16);

      __dmb(0xBu);
      TSUNumberFormatterStringFromDoubleWithFormatForNumber_formatter = (uint64_t)v14;
    }
    objc_sync_exit(v13);
  }
  if (!TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter)
  {
    uint64_t v17 = objc_opt_class();
    objc_sync_enter(v17);
    if (!TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter)
    {
      BOOL v18 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v12, kCFNumberFormatterNoStyle);
      CFRange v19 = (const void *)[NSNumber numberWithInt:6];
      CFNumberFormatterSetProperty(v18, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], v19);
      uint64_t v20 = (void *)[objc_alloc(NSNumber) initWithInt:1];
      CFNumberFormatterSetProperty(v18, (CFNumberFormatterKey)*MEMORY[0x263EFFDA8], v20);

      __dmb(0xBu);
      TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter = (uint64_t)v18;
    }
    objc_sync_exit(v17);
  }
  [(id)gLockTSUNumberFormatterStringFromDoubleWithFormat lock];
  unint64_t v21 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter;
  if (a6) {
    int v22 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter;
  }
  else {
    int v22 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForNumber_formatter;
  }
  if ((__CFNumberFormatter *)sActiveFormatter != v22)
  {
    sActiveFormatter = 0;

    sActiveCFStringRef Format = 0;
LABEL_14:
    CFNumberFormatterSetFormat(v22, a1);

    sActiveCFStringRef Format = a1;
    goto LABEL_15;
  }
  if (!sActiveFormat || CFStringCompare(a1, (CFStringRef)sActiveFormat, 0)) {
    goto LABEL_14;
  }
LABEL_15:
  if (a2)
  {
    if ((unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary == a4)
    {
      uint64_t v23 = (void *)[objc_alloc(NSNumber) initWithInt:0];
      CFStringRef v24 = (void *)[objc_alloc(NSNumber) initWithInt:0x7FFFFFFFLL];
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], v23);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], v24);
    }
    else
    {
      unint64_t v25 = (void *)[objc_alloc(NSNumber) initWithInt:a3];
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFDA0], v25);

      unsigned __int16 v26 = (void *)[objc_alloc(NSNumber) initWithInt:a4];
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFD88], v26);
    }
  }
  if (a6) {
    CFNumberFormatterSetProperty(v21, (CFNumberFormatterKey)*MEMORY[0x263EFFDB8], &stru_26D4F03D0);
  }
  int v27 = (CFTypeRef *)MEMORY[0x263EFFB38];
  if (a5) {
    int v27 = (CFTypeRef *)MEMORY[0x263EFFB40];
  }
  CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x263EFFE30], *v27);
  __int16 v28 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x263EFFB08], v22, kCFNumberDoubleType, &valuePtr);
  sActiveFormatter = (uint64_t)v22;
  [(id)gLockTSUNumberFormatterStringFromDoubleWithFormat unlock];
  return v28;
}

void sub_2228290B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222829104(void *a1)
{
}

void *TSUNumberFormatterStringFromStringWithCustomFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 && a2)
  {
    CFLocaleRef v3 = (void *)[MEMORY[0x263F089D8] stringWithString:a2];
    [v3 replaceOccurrencesOfString:objc_msgSend(NSString, "stringWithFormat:", @"%C", (unsigned __int16)TSUCustomNumberFormatTextReplacementCharacter), v2, 0, 0, objc_msgSend(v3, "length") withString options range];
    return v3;
  }
  return (void *)v2;
}

void TSUNumberFormatterSetBogusExponentSymbol(__CFNumberFormatter *a1)
{
}

uint64_t TSUDecimalSeparatorForCurrentLocale()
{
  uint64_t result = TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator;
  if (!TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator)
  {
    CFLocaleRef v1 = CFLocaleCopyCurrent();
    TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator = (uint64_t)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x263EFFCD0]);
    id v2 = (id)TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator;
    CFRelease(v1);
    return TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator;
  }
  return result;
}

CFTypeRef TSUDecimalSeparatorForNonCachedCurrentLocale()
{
  CFLocaleRef v0 = (const __CFLocale *)[MEMORY[0x263EFF960] currentLocale];
  CFStringRef v1 = (const __CFString *)*MEMORY[0x263EFFCD0];
  return CFLocaleGetValue(v0, v1);
}

__CFString *TSUListSeparatorForCurrentLocale()
{
  uint64_t result = (__CFString *)TSUListSeparatorForCurrentLocale_sListSeparator;
  if (!TSUListSeparatorForCurrentLocale_sListSeparator)
  {
    CFLocaleRef v1 = CFLocaleCopyCurrent();
    CFStringRef Value = (void *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x263EFFCD0]);
    id v3 = Value;
    CFRelease(v1);
    if ([Value isEqualToString:@"."]) {
      uint64_t result = @",";
    }
    else {
      uint64_t result = @";";
    }
    TSUListSeparatorForCurrentLocale_sListSeparator = (uint64_t)result;
  }
  return result;
}

void *TSUCurrencyCodesForLocale(const __CFLocale *a1, uint64_t a2)
{
  CFLocaleRef v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", +[TSUNumberFormatter userVisibleCurrencyCodes](TSUNumberFormatter, "userVisibleCurrencyCodes"));
  if (a1)
  {
    CFTypeRef Value = CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x263EFFCB8]);
    if (Value)
    {
      CFTypeRef v6 = Value;
      if (([v4 containsObject:Value] & 1) == 0) {
        [v4 insertObject:v6 atIndex:0];
      }
    }
  }
  if (a2 && ([v4 containsObject:a2] & 1) == 0) {
    [v4 insertObject:a2 atIndex:0];
  }
  return v4;
}

__CFArray *TSUCreateArrayOfDecimalFormattersForLocale(const __CFLocale *a1)
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  id v3 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, kCFNumberFormatterDecimalStyle);
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFD50];
  CFNumberFormatterSetProperty(v3, (CFNumberFormatterKey)*MEMORY[0x263EFFD50], @"xyzzyqghbv&q");
  CFArrayAppendValue(Mutable, v3);
  CFRelease(v3);
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"#,##0;- #,##0",
                 @"#,##0;(#,##0)",
                 @"#,##0;( #,##0)",
                 0);
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
      CFNumberFormatterSetFormat(v9, (CFStringRef)[v5 objectAtIndex:i]);
      CFNumberFormatterSetProperty(v9, v4, @"xyzzyqghbv&q");
      CFArrayAppendValue(Mutable, v9);
      CFRelease(v9);
    }
  }

  return Mutable;
}

__CFArray *TSUCreateArrayOfCurrencyFormattersForCurrencyCode(const __CFLocale *a1, const __CFArray *a2, const void *a3)
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFIndex Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    CFIndex v8 = Count;
    CFIndex v9 = 0;
    CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFD20];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFD50];
    do
    {
      CFLocaleRef v12 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, v9);
      CFNumberFormatterSetFormat(v12, ValueAtIndex);
      CFNumberFormatterSetProperty(v12, v10, a3);
      CFNumberFormatterSetProperty(v12, v11, @"xyzzyqghbv&q");
      CFArrayAppendValue(Mutable, v12);
      CFRelease(v12);
      ++v9;
    }
    while (v8 != v9);
  }
  return Mutable;
}

__CFArray *TSUCreateArrayOfCurrencyFormattersForLocale(const __CFLocale *a1, const __CFArray *a2)
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterCurrencyStyle);
  CFNumberFormatterSetProperty(v6, (CFNumberFormatterKey)*MEMORY[0x263EFFD50], @"xyzzyqghbv&q");
  uint64_t v7 = objc_msgSend((id)-[__CFString positiveSubpatternOfNumberFormatPattern]((id)CFNumberFormatterGetFormat(v6), "positiveSubpatternOfNumberFormatPattern"), "numberPortionOfNumberFormatSubpattern");
  CFArrayAppendValue(Mutable, v6);
  CFRelease(v6);
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@", v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;- ¤%@", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤", v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;- %@¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤ %@", v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤ %@;- ¤ %@", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ ¤", v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@ ¤;- %@ ¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤-%@", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤ -%@", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤- %@", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤ - %@", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;(¤%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;( ¤%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;(¤%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;(¤ %@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;( ¤ %@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;(¤ %@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;( ¤%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;( ¤ %@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤(%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤( %@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤(%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤ (%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤(%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤ (%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤( %@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤(%@)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;(%@¤)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;( %@¤)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;(%@¤)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;(%@ ¤)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;( %@ ¤)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;(%@ ¤)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;( %@¤)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;( %@ ¤)", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;(%@)¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;( %@)¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;(%@)¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;(%@) ¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;( %@) ¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;(%@) ¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;( %@)¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;( %@) ¤", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤%@-", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤%@ -", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤ %@-", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"¤%@;¤ %@ -", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;%@¤-", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;%@¤ -", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;%@ ¤-", v7, v7)];
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@¤;%@ ¤ -", v7, v7)];
  CFIndex Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    CFIndex v9 = Count;
    for (CFIndex i = 0; i != v9; ++i)
    {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      CFLocaleRef v12 = TSUCreateArrayOfCurrencyFormattersForCurrencyCode(a1, (const __CFArray *)v5, ValueAtIndex);
      v14.length = CFArrayGetCount(v12);
      v14.CFIndex location = 0;
      CFArrayAppendArray(Mutable, v12, v14);
      CFRelease(v12);
    }
  }

  return Mutable;
}

__CFArray *TSUCreateArrayOfPercentageFormattersForLocale(const __CFLocale *a1)
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  id v3 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterPercentStyle);
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFD50];
  CFNumberFormatterSetProperty(v3, (CFNumberFormatterKey)*MEMORY[0x263EFFD50], @"xyzzyqghbv&q");
  CFArrayAppendValue(Mutable, v3);
  CFRelease(v3);
  id v5 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
  CFNumberFormatterSetFormat(v5, @"#,##0 %");
  CFNumberFormatterSetProperty(v5, v4, @"xyzzyqghbv&q");
  CFArrayAppendValue(Mutable, v5);
  CFRelease(v5);
  uint64_t v6 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
  CFNumberFormatterSetFormat(v6, @"#,##0%");
  CFNumberFormatterSetProperty(v6, v4, @"xyzzyqghbv&q");
  CFArrayAppendValue(Mutable, v6);
  CFRelease(v6);
  return Mutable;
}

CFArrayRef TSUCreateArrayOfScientificFormattersForLocale(CFLocaleRef locale)
{
  values = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], locale, kCFNumberFormatterScientificStyle);
  CFArrayRef v1 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  CFRelease(values);
  return v1;
}

uint64_t TSUImprovedCFNumberFormatterGetValueFromString(__CFNumberFormatter *a1, CFStringRef theString, double *a3)
{
  v10.CFIndex location = 0;
  v10.CFIndex length = CFStringGetLength(theString);
  int ValueFromString = CFNumberFormatterGetValueFromString(a1, theString, &v10, kCFNumberDoubleType, a3);
  if (a3 && ValueFromString)
  {
    if (v10.location || (CFIndex length = v10.length, length != CFStringGetLength(theString)))
    {
      uint64_t result = 0;
    }
    else
    {
      int v8 = __fpclassifyd(*a3);
      uint64_t result = 1;
      if (v8 != 3) {
        return result;
      }
    }
LABEL_10:
    *a3 = 0.0;
    return result;
  }
  uint64_t result = 0;
  if (a3) {
    goto LABEL_10;
  }
  return result;
}

uint64_t TSUGetNumberValueAndTypeFromString(const __CFString *a1, uint64_t a2, uint64_t a3, int *a4, void *a5, uint64_t a6)
{
  return TSUGetNumberValueAndTypeFromStringWithCurrencyCode(a1, 0, a2, a3, a4, a5, a6);
}

uint64_t TSUGetNumberValueAndTypeFromStringWithCurrencyCode(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, void *a6, uint64_t a7)
{
  if (a1)
  {
    if (a5) {
      *a5 = -999;
    }
    id v13 = +[TSUNumberFormatter formatterForLocale:](TSUNumberFormatter, "formatterForLocale:");
    MutableCopy = CFStringCreateMutableCopy(0, 0, a1);
    CFStringTransform(MutableCopy, 0, (CFStringRef)*MEMORY[0x263EFFEF0], 0);
    uint64_t v15 = (void *)[(__CFString *)MutableCopy newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand];
    CFRelease(MutableCopy);
    if ([v13 decimalFromString:v15 value:a4 formatString:a6])
    {
      if (a5) {
        *a5 = 0;
      }
      goto LABEL_18;
    }
    if ([v13 currencyFromString:v15 additionalCurrencyCode:a2 value:a4 formatString:a6 currencyCode:a7])
    {
      uint64_t v16 = 1;
      if (a5) {
        *a5 = 1;
      }
      goto LABEL_19;
    }
    if ([v13 percentageFromString:v15 value:a4 formatString:a6])
    {
      if (a5)
      {
        int v17 = 2;
LABEL_17:
        *a5 = v17;
      }
    }
    else if ([v13 scientificFromString:v15 value:a4 formatString:a6])
    {
      if (a5)
      {
        int v17 = 3;
        goto LABEL_17;
      }
    }
    else
    {
      if (![v13 fractionFromString:v15 value:a4])
      {
        uint64_t v16 = 0;
        goto LABEL_19;
      }
      if (a5) {
        *a5 = 4;
      }
      if (a6) {
        *a6 = 0;
      }
    }
LABEL_18:
    uint64_t v16 = 1;
LABEL_19:

    return v16;
  }
  return 0;
}

__CFString *TSUNumberFormatterStringFromValueType(unsigned int a1)
{
  if (a1 > 5) {
    return @"unknown";
  }
  else {
    return off_26462A210[a1];
  }
}

__CFString *TSUNumberFormatterStringFromNegativeStyle(unsigned int a1)
{
  if (a1 > 4) {
    return @"unknown";
  }
  else {
    return off_26462A240[a1];
  }
}

__CFString *TSUNumberFormatterStringFromFractionAccuracy(uint64_t a1)
{
  if (a1 <= 0xFFFFFFFC) {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"1/%d", a1);
  }
  else {
    return off_26462A268[(int)a1 + 3];
  }
}

void *TSUNumberFormatterStringByUnescapingFormatString(void *a1)
{
  unint64_t v2 = [a1 length];
  id v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:v2];
  if (v2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      unsigned int v5 = [a1 characterAtIndex:v4];
      unsigned int v6 = v5;
      unint64_t v7 = v4 + 1;
      if (v4 + 1 >= v2)
      {
        if (v5 != 39) {
LABEL_16:
        }
          objc_msgSend(v3, "appendFormat:", @"%C", v6);
        ++v4;
        goto LABEL_18;
      }
      int v8 = [a1 characterAtIndex:v4 + 1];
      if (v6 != 39) {
        goto LABEL_16;
      }
      if (v8 != 39) {
        break;
      }
      [v3 appendString:@"'"];
      v4 += 2;
LABEL_18:
      if (v4 >= v2) {
        return v3;
      }
    }
    while (1)
    {
      unsigned int v9 = [a1 characterAtIndex:v7];
      unsigned int v10 = v9;
      unint64_t v4 = v7 + 1;
      if (v7 + 1 >= v2)
      {
        if (v9 == 39) {
          goto LABEL_18;
        }
      }
      else
      {
        int v11 = [a1 characterAtIndex:v7 + 1];
        if (v10 == 39)
        {
          if (v11 != 39) {
            goto LABEL_18;
          }
          [v3 appendString:@"'"];
          unint64_t v4 = v7 + 2;
          goto LABEL_13;
        }
      }
      objc_msgSend(v3, "appendFormat:", @"%C", v10);
LABEL_13:
      unint64_t v7 = v4;
      if (v4 >= v2) {
        goto LABEL_18;
      }
    }
  }
  return v3;
}

__CFString *TSUNumberFormatterDisplayNSStringForFractionAccuracy(int a1)
{
  CFArrayRef v1 = @"Up to 1 digit (7/8)";
  switch(a1)
  {
    case -3:
      CFArrayRef v1 = @"Up to 3 digits (445/553)";
      goto LABEL_13;
    case -2:
      CFArrayRef v1 = @"Up to 2 digits (23/24)";
      goto LABEL_13;
    case -1:
      goto LABEL_13;
    case 0:
      CFArrayRef v1 = @"Conflicting";
      goto LABEL_13;
    case 1:
    case 3:
    case 5:
    case 6:
    case 7:
    case 9:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      return @"Unknown TSU fraction type";
    case 2:
      CFArrayRef v1 = @"Halves";
      goto LABEL_13;
    case 4:
      CFArrayRef v1 = @"Quarters";
      goto LABEL_13;
    case 8:
      CFArrayRef v1 = @"Eighths";
      goto LABEL_13;
    case 10:
      CFArrayRef v1 = @"Tenths";
      goto LABEL_13;
    case 16:
      CFArrayRef v1 = @"Sixteenths";
      goto LABEL_13;
    default:
      if (a1 != 100) {
        return @"Unknown TSU fraction type";
      }
      CFArrayRef v1 = @"Hundredths";
LABEL_13:
      id v3 = (void *)SFUBundle();
      return (__CFString *)[v3 localizedStringForKey:v1 value:&stru_26D4F03D0 table:@"TSUtility"];
  }
}

void sub_22282B400(void *a1)
{
}

void sub_22282BFD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22282C0A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22282C1A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22282C220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22282C288(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22282C2F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *TSUSpecificCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 isMemberOfClass:a1]) {
    return a2;
  }
  return 0;
}

void *TSUProtocolCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 conformsToProtocol:a1]) {
    return a2;
  }
  return 0;
}

void *TSUClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    id v13 = &a9;
    if (a3)
    {
      while (1)
      {
        int v11 = v13++;
        if (([v9 conformsToProtocol:*v11] & 1) == 0) {
          break;
        }
        if (!--a3) {
          return v9;
        }
      }
      return 0;
    }
  }
  return v9;
}

CFTypeRef TSUCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a1) {
    return cf;
  }
  return 0;
}

uint64_t TSUCheckedDynamicCast(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "id TSUCheckedDynamicCast(Class, id<NSObject>)");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCast.m"), 94, @"Unexpected object type in checked dynamic cast");
    return 0;
  }
  return v2;
}

uint64_t TSUCheckedStaticCast(uint64_t a1, uint64_t a2)
{
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "id TSUCheckedStaticCast(Class, id<NSObject>)");
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCast.m"), 105, @"Unexpected object type in checked static cast.  This is a serious problem and could lead to a crash, or worse." file lineNumber description];
  }
  return a2;
}

void *TSUCheckedProtocolCast(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  if (a2 && ([a2 conformsToProtocol:a1] & 1) == 0)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "id TSUCheckedProtocolCast(Protocol *, id<NSObject>)");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCast.m"), 116, @"Unexpected object type in checked protocol cast");
    return 0;
  }
  return v2;
}

void *TSUCheckedStaticProtocolCast(uint64_t a1, void *a2)
{
  if (a2 && ([a2 conformsToProtocol:a1] & 1) == 0)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = objc_msgSend(NSString, "stringWithUTF8String:", "id TSUCheckedStaticProtocolCast(Protocol *, id<NSObject>)");
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCast.m"), 127, @"Unexpected object type in checked protocol cast. This is a serious problem and could lead to a crash, or worse." file lineNumber description];
  }
  return a2;
}

void sub_22282E654(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromTSUError(int a1)
{
  if (a1 > 999)
  {
    uint64_t v2 = @"Table has maximum number of cells";
    id v3 = @"Table ID already used by another table registered with the calc engine";
    if (a1 != 1002) {
      id v3 = 0;
    }
    if (a1 != 1001) {
      uint64_t v2 = v3;
    }
    if (a1 == 1000) {
      return @"Table cell is undefined";
    }
    else {
      return v2;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        uint64_t result = @"No error";
        break;
      case 1:
        uint64_t result = @"Unspecified error";
        break;
      case 2:
        uint64_t result = @"Not found";
        break;
      case 3:
        uint64_t result = @"Argument out of bounds";
        break;
      case 4:
        uint64_t result = @"Function not implemented";
        break;
      default:
        uint64_t result = 0;
        break;
    }
  }
  return result;
}

void TSULogErrorInMethod(const char *a1, objc_class *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CFRange v14 = (objc_class *)objc_opt_class();
  id v15 = [NSString alloc];
  BOOL v18 = NSStringFromClass(v14);
  CFRange v19 = NSStringFromSelector(a1);
  uint64_t v16 = 45;
  if (v14 == a2) {
    uint64_t v16 = 43;
  }
  int v17 = (void *)[v15 initWithFormat:@"%c[%@ %@]", v16, v18, v19];
  TSULogErrorInLocation((uint64_t)v17, a3, a4, a5, (uint64_t)&a9);
}

void TSULogErrorInLocation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = (id)[[NSString alloc] initWithFormat:a4 arguments:a5];
  int v8 = (void *)[[NSString alloc] initWithUTF8String:a2];
  uint64_t v9 = [v8 lastPathComponent];

  TSULogSink(@"Error", (NSString *)@"*** Error: %@ %@:%ld %@", a1, v9, a3, v10);
}

void TSULogErrorInFunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CFLocaleRef v12 = (void *)[[NSString alloc] initWithUTF8String:a1];
  TSULogErrorInLocation((uint64_t)v12, a2, a3, a4, (uint64_t)&a9);
}

void TSULogBacktrace()
{
}

void TSULogOnceFn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (TSULogOnceFn_onceToken != -1) {
    dispatch_once(&TSULogOnceFn_onceToken, &__block_literal_global_2);
  }
  block[6] = &a9;
  uint64_t v11 = objc_msgSend(NSString, "tsu_stringWithFormat:arguments:", a2, &a9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __TSULogOnceFn_block_invoke_2;
  block[3] = &unk_26462A298;
  block[4] = a1;
  block[5] = v11;
  dispatch_sync((dispatch_queue_t)TSULogOnceFn_logOnceQueue, block);
}

dispatch_queue_t __TSULogOnceFn_block_invoke()
{
  TSULogOnceFn_tokens = objc_opt_new();
  dispatch_queue_t result = dispatch_queue_create("TSULogOnce", 0);
  TSULogOnceFn_logOnceQueue = (uint64_t)result;
  return result;
}

uint64_t __TSULogOnceFn_block_invoke_2(uint64_t a1)
{
  uint64_t result = [(id)TSULogOnceFn_tokens containsObject:*(void *)(a1 + 32)];
  if ((result & 1) == 0)
  {
    NSLog((NSString *)@"%@", *(void *)(a1 + 40));
    id v3 = (void *)TSULogOnceFn_tokens;
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 addObject:v4];
  }
  return result;
}

unint64_t TSUNormalizeRanges(void *a1)
{
  [a1 sortUsingFunction:compareRangeValues context:0];
  unint64_t result = [a1 count];
  if (result >= 2)
  {
    unsigned int v3 = 0;
    unint64_t v4 = 1;
    do
    {
      uint64_t v5 = v3;
      unsigned int v3 = v4;
      uint64_t location = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v5), "rangeValue");
      NSUInteger length = v7;
LABEL_4:
      NSUInteger v9 = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v4), "rangeValue");
      for (NSUInteger i = v10; ; NSUInteger i = 0)
      {
        v13.uint64_t location = location;
        v13.NSUInteger length = length;
        v15.uint64_t location = v9;
        v15.NSUInteger length = i;
        if (!NSIntersectionRange(v13, v15).length) {
          break;
        }
        v14.uint64_t location = location;
        v14.NSUInteger length = length;
        v16.uint64_t location = v9;
        v16.NSUInteger length = i;
        NSRange v12 = NSUnionRange(v14, v16);
        uint64_t location = v12.location;
        NSUInteger length = v12.length;
        objc_msgSend(a1, "replaceObjectAtIndex:withObject:", v5, objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v12.location, v12.length));
        [a1 removeObjectAtIndex:v4];
        if ([a1 count] > v4) {
          goto LABEL_4;
        }
      }
      unint64_t v4 = (v4 + 1);
      unint64_t result = [a1 count];
    }
    while (result > v4);
  }
  return result;
}

uint64_t compareRangeValues(objc_object *a1, objc_object *a2, void *a3)
{
  unint64_t v4 = [(objc_object *)a1 rangeValue];
  unint64_t v5 = [(objc_object *)a2 rangeValue];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v4 > v5;
  }
}

void *TSUIntersectionLocations(void *a1, void *a2)
{
  unint64_t v4 = [a1 count];
  unint64_t v5 = [a2 count];
  if (v4 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  NSUInteger v7 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v6];
  int v8 = (void *)[a1 mutableCopy];
  NSUInteger v9 = (void *)[a2 mutableCopy];
  TSUNormalizeRanges(v8);
  TSUNormalizeRanges(v9);
  if (v4 && v5 && [v8 count])
  {
    do
    {
      if (![v9 count]) {
        break;
      }
      NSUInteger v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
      NSUInteger v12 = v11;
      NSUInteger v13 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rangeValue");
      NSUInteger v15 = v14;
      v20.uint64_t location = v10;
      v20.NSUInteger length = v12;
      v22.uint64_t location = v13;
      v22.NSUInteger length = v15;
      if (NSIntersectionRange(v20, v22).length)
      {
        NSRange v16 = (void *)MEMORY[0x263F08D40];
        v21.uint64_t location = v10;
        v21.NSUInteger length = v12;
        v23.uint64_t location = v13;
        v23.NSUInteger length = v15;
        NSRange v17 = NSIntersectionRange(v21, v23);
        objc_msgSend(v7, "addObject:", objc_msgSend(v16, "valueWithRange:", v17.location, v17.length));
      }
      BOOL v18 = v10 >= v13 ? v9 : v8;
      [v18 removeObjectAtIndex:0];
    }
    while ([v8 count]);
  }

  return v7;
}

void *TSUUnionLocations(void *a1, void *a2)
{
  unint64_t v4 = [a1 count];
  unint64_t v5 = [a2 count];
  if (v4 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  NSUInteger v7 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v6];
  int v8 = (void *)[a1 mutableCopy];
  NSUInteger v9 = (void *)[a2 mutableCopy];
  TSUNormalizeRanges(v8);
  TSUNormalizeRanges(v9);
LABEL_5:
  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    NSUInteger v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
    NSUInteger v12 = v11;
    unint64_t v13 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rangeValue");
    NSUInteger v15 = v13;
    NSUInteger v16 = v14;
    if (v10 >= v13) {
      NSUInteger v17 = v13;
    }
    else {
      NSUInteger v17 = v10;
    }
    if (v10 >= v13) {
      NSUInteger length = v14;
    }
    else {
      NSUInteger length = v12;
    }
    while (1)
    {
      while (1)
      {
        if (![v8 count] || !objc_msgSend(v9, "count"))
        {
LABEL_24:
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v17, length));
          goto LABEL_5;
        }
        v26.NSUInteger location = v10;
        v26.NSUInteger length = v12;
        v30.NSUInteger location = v17;
        v30.NSUInteger length = length;
        NSUInteger location = NSIntersectionRange(v26, v30).location;
        BOOL v20 = location != 0;
        if (location)
        {
          v27.NSUInteger location = v10;
          v27.NSUInteger length = v12;
          v31.NSUInteger location = v17;
          v31.NSUInteger length = length;
          NSRange v21 = NSUnionRange(v27, v31);
          NSUInteger v17 = v21.location;
          NSUInteger length = v21.length;
          [v8 removeObjectAtIndex:0];
          if ([v8 count])
          {
            NSUInteger v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
            NSUInteger v12 = v22;
          }
        }
        v28.NSUInteger location = v15;
        v28.NSUInteger length = v16;
        v32.NSUInteger location = v17;
        v32.NSUInteger length = length;
        if (NSIntersectionRange(v28, v32).location) {
          break;
        }
LABEL_21:
        if (!v20) {
          goto LABEL_24;
        }
      }
      v29.NSUInteger location = v15;
      v29.NSUInteger length = v16;
      v33.NSUInteger location = v17;
      v33.NSUInteger length = length;
      NSRange v23 = NSUnionRange(v29, v33);
      NSUInteger v17 = v23.location;
      NSUInteger length = v23.length;
      [v9 removeObjectAtIndex:0];
      if (![v9 count])
      {
        BOOL v20 = 1;
        goto LABEL_21;
      }
      NSUInteger v15 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rangeValue");
      NSUInteger v16 = v24;
    }
  }
  [v7 addObjectsFromArray:v8];
  [v7 addObjectsFromArray:v9];

  return v7;
}

void *TSUComplementLocations(void *a1, void *a2)
{
  unint64_t v4 = [a1 count];
  unint64_t v5 = [a2 count];
  if (v4 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  NSUInteger v7 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v6];
  int v8 = (void *)[a1 mutableCopy];
  NSUInteger v9 = (void *)[a2 mutableCopy];
  TSUNormalizeRanges(v8);
  TSUNormalizeRanges(v9);
  NSUInteger v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
  if ([v8 count])
  {
    NSUInteger v11 = 0;
    do
    {
      if (![v9 count]) {
        break;
      }
      NSUInteger v12 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
      NSUInteger v14 = v13;
      NSUInteger v15 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rangeValue");
      v20.NSUInteger length = v16;
      v19.NSUInteger location = v12;
      v19.NSUInteger length = v14;
      v20.NSUInteger location = v15;
      NSRange v17 = NSIntersectionRange(v19, v20);
      if (v17.location)
      {
        if (v17.location > v10) {
          NSUInteger v11 = v17.location - v10;
        }
        if (v11) {
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v11));
        }
        if (v12 + v14 <= v17.location + v17.length) {
          goto LABEL_16;
        }
        [v9 removeObjectAtIndex:0];
        NSUInteger v11 = 0;
        NSUInteger v10 = v17.location + v17.length;
      }
      else
      {
        if (v15 > v12)
        {
          NSUInteger v11 = v12 + v14 - v10;
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v10, v11));
LABEL_16:
          [v8 removeObjectAtIndex:0];
          if ([v8 count])
          {
            NSUInteger v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
            NSUInteger v11 = 0;
          }
          continue;
        }
        [v9 removeObjectAtIndex:0];
      }
    }
    while ([v8 count]);
  }

  return v7;
}

NSUInteger TSUIntersectionRangeWithEdge(NSRange a1, NSRange a2, int a3)
{
  NSUInteger length = a2.length;
  NSUInteger location = a2.location;
  NSUInteger v6 = a1.length;
  NSUInteger v7 = a1.location;
  NSRange v8 = NSIntersectionRange(a1, a2);
  if (length) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v7 | location) {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v8 == 0uLL) {
    NSUInteger v12 = v11;
  }
  else {
    NSUInteger v12 = v8.location;
  }
  if (location + length == v7) {
    NSUInteger v13 = v7;
  }
  else {
    NSUInteger v13 = v12;
  }
  if (v7 + v6 == location) {
    NSUInteger v14 = location;
  }
  else {
    NSUInteger v14 = v13;
  }
  if (a3) {
    return v14;
  }
  else {
    return v12;
  }
}

uint64_t TSUAdjustSelectionRangeForChangedRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = a1;
  if (a5)
  {
    if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = +[TSUAssertionHandler currentHandler];
      uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSRange TSUAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSURangeUtils.mm"), 280, @"Bad selectionRange passed to TSUAdjustSelectionRangeForChangedRange");
      if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_6;
    }
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_6:
      id v9 = +[TSUAssertionHandler currentHandler];
      uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "NSRange TSUAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)");
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSURangeUtils.mm"];
      NSUInteger v12 = @"Bad changingRange passed to TSUAdjustSelectionRangeForChangedRange";
      NSUInteger v13 = v9;
      uint64_t v14 = v10;
      uint64_t v15 = 281;
LABEL_7:
      [v13 handleFailureInFunction:v14 file:v11 lineNumber:v15 description:v12];
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (-a4 > a5)
    {
      id v18 = +[TSUAssertionHandler currentHandler];
      uint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSRange TSUAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)");
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSURangeUtils.mm"];
      NSUInteger v12 = @"Bad delta passed to TSUAdjustSelectionRangeForChangedRange";
      NSUInteger v13 = v18;
      uint64_t v14 = v19;
      uint64_t v15 = 285;
      goto LABEL_7;
    }
    unint64_t v20 = a1 + a2;
    if (a1 + a2 >= a3)
    {
      unint64_t v21 = a3 + a4;
      if (a3 + a4 >= a1)
      {
        if ((a3 != a1 || a4 != a2) && (a1 > a3 || v20 < v21) && a3 <= a1)
        {
          if (v21 >= v20)
          {
            if (-a2 > a5 && a1 >= a4 + a5 + a3) {
              return a4 + a5 + a3;
            }
          }
          else
          {
            if (a1 <= a3)
            {
              id v22 = +[TSUAssertionHandler currentHandler];
              uint64_t v23 = objc_msgSend(NSString, "stringWithUTF8String:", "NSRange TSUAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)");
              objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSURangeUtils.mm"), 326, @"expected selectionRange to start within changingRange");
            }
            if (a3 > v5 + a5) {
              return a3;
            }
          }
        }
      }
      else
      {
        return a1 + a5;
      }
    }
  }
  return v5;
}

NSUInteger TSUUnionRangesIgnoringInvalid(NSRange a1, NSRange a2)
{
  if (a1.location != TSUInvalidRange || a1.length != *(void *)algn_267F820F8)
  {
    if (a2.location != TSUInvalidRange || a2.length != *(void *)algn_267F820F8) {
      return NSUnionRange(a1, a2).location;
    }
    a2.NSUInteger location = a1.location;
  }
  return a2.location;
}

uint64_t TSUCFUUIDEqual(const __CFUUID *a1, const __CFUUID *a2)
{
  if (a1 == a2) {
    return 1;
  }
  if (!a1 && a2) {
    return 0;
  }
  if (a1 && !a2) {
    return 0;
  }
  CFUUIDBytes v3 = CFUUIDGetUUIDBytes(a1);
  CFUUIDBytes v4 = CFUUIDGetUUIDBytes(a2);
  if (((*(void *)&v4.byte0 ^ *(void *)&v3.byte0) & 0xFFFFFFFFFFFFLL) != 0
    || ((*(void *)&v4.byte0 ^ *(void *)&v3.byte0) & 0xFF000000000000) != 0)
  {
    return 0;
  }
  BOOL v6 = ((*(void *)&v4.byte8 ^ *(void *)&v3.byte8) & 0xFFFFFFFFFFFFFFLL) == 0
    && HIBYTE(*(void *)&v3.byte8) == HIBYTE(*(void *)&v4.byte8);
  return HIBYTE(*(void *)&v3.byte0) == HIBYTE(*(void *)&v4.byte0) && v6;
}

void TSUCopyCFStringIntoStdString(CFStringRef theString, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  TSUUTF8Converter<256>::TSUUTF8Converter((uint64_t)v3, theString);
  MEMORY[0x223C9EE30](a2, v5);
  if (v4) {
    free(v4);
  }
}

void sub_222830CE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42)
{
  if (a42) {
    free(a42);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TSUUTF8Converter<256>::TSUUTF8Converter(uint64_t a1, CFStringRef theString)
{
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = 0;
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  *(void *)(a1 + 264) = CStringPtr;
  if (!CStringPtr)
  {
    CFIndex maxBufLen = 0;
    uint64_t Length = CFStringGetLength(theString);
    if (Length <= 62
      && (v10.NSUInteger location = 0,
          v10.NSUInteger length = Length,
          CFStringGetBytes(theString, v10, 0x8000100u, 0, 0, (UInt8 *)a1, 255, &maxBufLen) == Length))
    {
      *(unsigned char *)(a1 + maxBufLen) = 0;
      *(void *)(a1 + 264) = a1;
    }
    else if (!*(void *)(a1 + 264))
    {
      CFIndex maxBufLen = 0;
      v11.NSUInteger location = 0;
      v11.NSUInteger length = Length;
      if (CFStringGetBytes(theString, v11, 0x8000100u, 0, 0, 0, 0, &maxBufLen) == Length)
      {
        uint64_t v6 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x2E3AE026uLL);
        *(void *)(a1 + 256) = v6;
        if (v6)
        {
          CFIndex usedBufLen = 0;
          v12.NSUInteger location = 0;
          v12.NSUInteger length = Length;
          CFStringGetBytes(theString, v12, 0x8000100u, 0, 0, v6, maxBufLen, &usedBufLen);
          if (usedBufLen == maxBufLen)
          {
            *(unsigned char *)(*(void *)(a1 + 256) + usedBufLen) = 0;
            *(void *)(a1 + 264) = *(void *)(a1 + 256);
          }
        }
      }
    }
  }
  return a1;
}

BOOL TSUHandleSqlite(int a1, void *a2, void *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    id v14 = a6
        ? (id)[[NSString alloc] initWithFormat:a6 arguments:&a9]
        : @"SQLite error";
    if (a1 != 101) {
      sqlite3_errmsg((sqlite3 *)[a3 _sqliteDatabase]);
    }
    TSULogErrorInMethod(a4, (objc_class *)a3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m", a5, @"%@: %s (%d)", a6, a7, a8, (uint64_t)v14);
    if (a2)
    {
      if (!*a2)
      {
        uint64_t v15 = 0;
        if (a1 > 265)
        {
          if (a1 == 266 || a1 == 522) {
            goto LABEL_19;
          }
          if (a1 != 778) {
            goto LABEL_21;
          }
        }
        else
        {
          if (a1 > 0x19)
          {
LABEL_21:
            *a2 = [MEMORY[0x263F087E8] tsuErrorWithCode:v15];
            return a1 == 0;
          }
          if (((1 << a1) & 0x27A0000) != 0)
          {
            id v16 = +[TSUAssertionHandler currentHandler];
            uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TSUHandleSqlite(int, NSError **, TSUDatabase *, SEL, long, NSString *, ...)");
            objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 415, @"SQLite misused");
            uint64_t v15 = 0;
            goto LABEL_21;
          }
          if (a1 != 13)
          {
            if (a1 != 14) {
              goto LABEL_21;
            }
LABEL_19:
            uint64_t v15 = 1;
            goto LABEL_21;
          }
        }
        uint64_t v15 = 2;
        goto LABEL_21;
      }
    }
  }
  return a1 == 0;
}

void sub_222834980(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUCFArrayShortDescription(const __CFArray *a1)
{
  CFArrayRef v1 = +[TSUDescription descriptionWithCFType:format:](TSUDescription, "descriptionWithCFType:format:", a1, @"; count=%ld",
         CFArrayGetCount(a1));
  return (uint64_t)[(TSUDescription *)v1 descriptionString];
}

uint64_t TSUCFArrayDescription(const __CFArray *a1)
{
  uint64_t v2 = +[TSUDescription descriptionWithCFType:format:](TSUDescription, "descriptionWithCFType:format:", a1, @"; count=%ld",
         CFArrayGetCount(a1));
  if (CFArrayGetCount(a1) >= 1)
  {
    CFIndex v3 = 0;
    do
    {
      -[TSUDescription addField:format:](v2, "addField:format:", objc_msgSend(NSString, "stringWithFormat:", @"[%d]", v3), @"%@", CFArrayGetValueAtIndex(a1, v3));
      ++v3;
    }
    while (CFArrayGetCount(a1) > v3);
  }
  [(TSUDescription *)v2 setFieldOptionCommaSeparated];
  return (uint64_t)[(TSUDescription *)v2 descriptionString];
}

uint64_t TSUCFDictionaryDescription(const __CFDictionary *a1)
{
  uint64_t v2 = +[TSUDescription descriptionWithCFType:a1 format:&stru_26D4F03D0];
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)CFDictionaryDescriptionApplierFunction, v2);
  return (uint64_t)[(TSUDescription *)v2 descriptionString];
}

uint64_t CFDictionaryDescriptionApplierFunction(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 addField:a1, @"%@", a2 format];
}

__CFString *TSUObjectReferenceDescription(void *a1)
{
  if (!a1) {
    return @"<nil>";
  }
  ClassName = object_getClassName(a1);
  int v3 = strcmp(ClassName, "NSCFArray");
  CFUUIDBytes v4 = NSString;
  uint64_t v5 = object_getClassName(a1);
  if (v3) {
    return (__CFString *)objc_msgSend(v4, "stringWithFormat:", @"(%s*)%p", v5, a1, v7);
  }
  else {
    return (__CFString *)objc_msgSend(v4, "stringWithFormat:", @"(%s*)%p; count=%ld",
  }
                           v5,
                           a1,
                           CFArrayGetCount((CFArrayRef)a1));
}

__CFString *TSUCGColorDescription(CGColor *a1)
{
  if (!a1) {
    return @"CGColor(NULL)";
  }
  ColorSpace = CGColorGetColorSpace(a1);
  size_t NumberOfComponents = CGColorGetNumberOfComponents(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == kCGColorSpaceModelRGB)
  {
    if (NumberOfComponents != 4)
    {
LABEL_10:
      uint64_t v7 = (__CFString *)CFCopyDescription(a1);
      id v9 = v7;
      return v7;
    }
    Components = CGColorGetComponents(a1);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"CGColor(%p) RGB (%g %g %g %g)", a1, *(void *)Components, *((void *)Components + 1), *((void *)Components + 2), *((void *)Components + 3));
  }
  else
  {
    if (Model || NumberOfComponents != 2) {
      goto LABEL_10;
    }
    uint64_t v5 = CGColorGetComponents(a1);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"CGColor(%p) Gray (%g %g)", a1, *(void *)v5, *((void *)v5 + 1), v11, v12);
  }
  uint64_t v7 = (__CFString *)v6;
  if (!v6) {
    goto LABEL_10;
  }
  return v7;
}

void *TSUStringArrayFromBitFields(void *a1, unint64_t a2)
{
  CFUUIDBytes v4 = (void *)[MEMORY[0x263EFF980] array];
  if ([a1 count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = (void *)[a1 objectAtIndex:v5];
      if ([v6 count])
      {
        if (((a2 >> v5) & 1) >= [v6 count]) {
          uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"<Bad Value: %lu>", (a2 >> v5) & 1);
        }
        else {
          uint64_t v7 = (void *)[v6 objectAtIndex:(a2 >> v5) & 1];
        }
        uint64_t v8 = v7;
        if ([v7 length]) {
          [v4 addObject:v8];
        }
      }
      ++v5;
    }
    while (v5 < [a1 count]);
  }
  return v4;
}

BOOL TSUCGColorEqualToColorWithFloatTolerance(CGColor *a1, CGColor *a2)
{
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceRef v5 = CGColorGetColorSpace(a2);
  if (CFEqual(ColorSpace, v5))
  {
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a1);
    Components = CGColorGetComponents(a1);
    uint64_t v8 = CGColorGetComponents(a2);
    if (!NumberOfComponents) {
      return 1;
    }
    size_t v9 = NumberOfComponents - 1;
    do
    {
      double v10 = *Components++;
      double v11 = v10;
      double v12 = *v8++;
      double v13 = vabdd_f64(v11, v12);
      BOOL v15 = v9-- != 0;
      BOOL v16 = v13 < 0.00999999978;
    }
    while (v13 < 0.00999999978 && v15);
    return v16;
  }
  else
  {
    return CGColorEqualToColor(a1, a2);
  }
}

uint64_t TSUGenericRGBColorSpace()
{
  if (TSUGenericRGBColorSpace_sGenericRGBDispatchOnce != -1) {
    dispatch_once(&TSUGenericRGBColorSpace_sGenericRGBDispatchOnce, &__block_literal_global_6);
  }
  return TSUGenericRGBColorSpace_sGenericRGBColorSpace;
}

CGColorSpaceRef __TSUGenericRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00260]);
  TSUGenericRGBColorSpace_sGenericRGBCGColorSpaceRef ColorSpace = (uint64_t)result;
  return result;
}

uint64_t TSUGenericCMYKColorSpace()
{
  if (TSUGenericCMYKColorSpace_sGenericCMYKDispatchOnce != -1) {
    dispatch_once(&TSUGenericCMYKColorSpace_sGenericCMYKDispatchOnce, &__block_literal_global_8);
  }
  return TSUGenericCMYKColorSpace_sGenericCMYKColorSpace;
}

CGColorSpaceRef __TSUGenericCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00240]);
  TSUGenericCMYKColorSpace_sGenericCMYKCGColorSpaceRef ColorSpace = (uint64_t)result;
  return result;
}

uint64_t TSUGenericGrayColorSpace()
{
  if (TSUGenericGrayColorSpace_sGenericGrayDispatchOnce != -1) {
    dispatch_once(&TSUGenericGrayColorSpace_sGenericGrayDispatchOnce, &__block_literal_global_10);
  }
  return TSUGenericGrayColorSpace_sGenericGrayColorSpace;
}

CGColorSpaceRef __TSUGenericGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00248]);
  TSUGenericGrayColorSpace_sGenericGrayCGColorSpaceRef ColorSpace = (uint64_t)result;
  return result;
}

uint64_t TSUSRGBColorSpace()
{
  if (TSUSRGBColorSpace_sSRGBDispatchOnce != -1) {
    dispatch_once(&TSUSRGBColorSpace_sSRGBDispatchOnce, &__block_literal_global_12);
  }
  return TSUSRGBColorSpace_sSRGBColorSpace;
}

CGColorSpaceRef __TSUSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  TSUSRGBColorSpace_sSRGBCGColorSpaceRef ColorSpace = (uint64_t)result;
  if (!result)
  {
    CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
    TSUSRGBColorSpace_sSRGBCGColorSpaceRef ColorSpace = (uint64_t)result;
  }
  return result;
}

uint64_t TSUP3ColorSpace()
{
  if (TSUP3ColorSpace_sP3DispatchOnce != -1) {
    dispatch_once(&TSUP3ColorSpace_sP3DispatchOnce, &__block_literal_global_14);
  }
  return TSUP3ColorSpace_sP3ColorSpace;
}

CGColorSpaceRef __TSUP3ColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
  TSUP3ColorSpace_sP3CGColorSpaceRef ColorSpace = (uint64_t)result;
  if (!result)
  {
    CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
    TSUP3ColorSpace_sP3CGColorSpaceRef ColorSpace = (uint64_t)result;
  }
  return result;
}

CGImageRef TSUCGImageCreateCopyByApplyingGenericColorSpaceIfNeeded(CGImageRef image, const __CFDictionary *a2)
{
  if (!a2) {
    goto LABEL_18;
  }
  if (TSUCGImagePropertiesIncludeColorSpace(a2)) {
    goto LABEL_18;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x263F0F0A8]);
  if (!Value) {
    goto LABEL_18;
  }
  CFStringRef v5 = Value;
  if (CFEqual(Value, (CFStringRef)*MEMORY[0x263F0F0C0]))
  {
    if (TSUGenericRGBColorSpace_sGenericRGBDispatchOnce != -1) {
      dispatch_once(&TSUGenericRGBColorSpace_sGenericRGBDispatchOnce, &__block_literal_global_6);
    }
    uint64_t v6 = &TSUGenericRGBColorSpace_sGenericRGBColorSpace;
LABEL_16:
    if (*v6)
    {
      CGImageRef result = CGImageCreateCopyWithColorSpace(image, (CGColorSpaceRef)*v6);
      if (result) {
        return result;
      }
    }
    goto LABEL_18;
  }
  if (CFEqual(v5, (CFStringRef)*MEMORY[0x263F0F0B0]))
  {
    if (TSUGenericCMYKColorSpace_sGenericCMYKDispatchOnce != -1) {
      dispatch_once(&TSUGenericCMYKColorSpace_sGenericCMYKDispatchOnce, &__block_literal_global_8);
    }
    uint64_t v6 = &TSUGenericCMYKColorSpace_sGenericCMYKColorSpace;
    goto LABEL_16;
  }
  if (CFEqual(v5, (CFStringRef)*MEMORY[0x263F0F0B8]))
  {
    if (TSUGenericGrayColorSpace_sGenericGrayDispatchOnce != -1) {
      dispatch_once(&TSUGenericGrayColorSpace_sGenericGrayDispatchOnce, &__block_literal_global_10);
    }
    uint64_t v6 = &TSUGenericGrayColorSpace_sGenericGrayColorSpace;
    goto LABEL_16;
  }
LABEL_18:
  return CGImageRetain(image);
}

CFDictionaryRef TSUCGImagePropertiesIncludeColorSpace(const __CFDictionary *result)
{
  if (result)
  {
    CGImageRef result = (const __CFDictionary *)CFDictionaryGetValue(result, (const void *)*MEMORY[0x263F0F500]);
    if (result) {
      return (const __CFDictionary *)(CFStringGetLength((CFStringRef)result) > 0);
    }
  }
  return result;
}

CGColorRef TSUCGColorCreateWithUIColor(void *a1)
{
  CFArrayRef v1 = (CGColor *)[a1 CGColor];
  return CGColorCreateCopy(v1);
}

CGColorRef TSUCGColorCreateDeviceRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  }
  return CGColorCreate((CGColorSpaceRef)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace, components);
}

CGColorRef TSUCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  if (TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1) {
    dispatch_once(&TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return CGColorCreate((CGColorSpaceRef)TSUDeviceGrayColorSpace_sDeviceGrayColorSpace, components);
}

CGColorRef TSUCGColorCreateRandomRGB()
{
  double v0 = TSURandom();
  double v1 = TSURandom();
  double v2 = TSURandom();
  return TSUCGColorCreateDeviceRGB(v0, v1, v2, 1.0);
}

CGPatternRef TSUCGPatternCreateWithImageAndTransform(CGImageRef image, long long *a2)
{
  if (!image)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "CGPatternRef TSUCGPatternCreateWithImageAndTransform(CGImageRef, const CGAffineTransform *)");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColorUtils.m"), 227, @"can't create an image pattern without an image");
  }
  CGImageRetain(image);
  CGFloat v6 = *MEMORY[0x263F00148];
  CGFloat v7 = *(double *)(MEMORY[0x263F00148] + 8);
  size_t Width = CGImageGetWidth(image);
  size_t Height = CGImageGetHeight(image);
  if (a2)
  {
    long long v10 = a2[1];
    long long v15 = *a2;
    long long v16 = v10;
    long long v11 = a2[2];
  }
  else
  {
    long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v15 = *MEMORY[0x263F000D0];
    long long v16 = v12;
    long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  long long v17 = v11;
  v18.size.height = (double)Height;
  v18.size.width = (double)Width;
  *(_OWORD *)&v14.a = v15;
  *(_OWORD *)&v14.c = v16;
  *(_OWORD *)&v14.tx = v11;
  v18.origin.x = v6;
  v18.origin.y = v7;
  return CGPatternCreate(image, v18, &v14, (double)Width, v18.size.height, kCGPatternTilingConstantSpacing, 1, &TSUCGPatternCreateWithImageAndTransform_sCallbacks);
}

void TSUDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  uint64_t v4 = *MEMORY[0x263F00148];
  uint64_t v5 = *(void *)(MEMORY[0x263F00148] + 8);
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  double v10 = Width;
  CGContextDrawImage(a2, *(CGRect *)&v8, a1);
}

CGPatternRef TSUCGPatternCreateWithImage(CGImage *a1)
{
  return TSUCGPatternCreateWithImageAndTransform(a1, 0);
}

CGColorRef TSUCGColorCreatePatternWithImageAndTransform(CGImage *a1, long long *a2)
{
  v6[1] = *(CGFloat *)MEMORY[0x263EF8340];
  double v2 = TSUCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  CGColorRef v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef TSUCGColorCreatePatternWithImage(CGImage *a1)
{
  return TSUCGColorCreatePatternWithImageAndTransform(a1, 0);
}

CGColorRef TSUCreateCGColorFromHSBInColorSpace(CGColorSpace *a1, double a2, double a3, double a4, double a5)
{
  v9[2] = *(double *)MEMORY[0x263EF8340];
  v9[1] = a5;
  TSUHSBToRGB(&components, &v8, v9, a2, a3, a4);
  if (!a1)
  {
    if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
      dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
    }
    a1 = (CGColorSpace *)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace;
  }
  return CGColorCreate(a1, &components);
}

double *TSUHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6 = a4 * 6.0;
  BOOL v7 = a4 == 1.0;
  double v8 = 0.0;
  if (!v7) {
    double v8 = v6;
  }
  uint64_t v9 = (uint64_t)v8;
  double v10 = v8 - (double)(uint64_t)v8;
  double v11 = (1.0 - a5) * a6;
  double v12 = (1.0 - a5 * v10) * a6;
  double v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  double v14 = a6;
  double v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      double v14 = v12;
      double v15 = a6;
      goto LABEL_10;
    case 2:
      double v14 = v11;
      double v15 = a6;
      double v11 = v13;
      goto LABEL_10;
    case 3:
      double v14 = v11;
      double v15 = v12;
      goto LABEL_8;
    case 4:
      double v14 = v13;
      double v15 = v11;
LABEL_8:
      double v11 = a6;
      goto LABEL_10;
    case 5:
      double v14 = a6;
      double v15 = v11;
      double v11 = v12;
LABEL_10:
      *CGImageRef result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

CGColorRef TSUCreateCGColorFromHSB(double a1, double a2, double a3, double a4)
{
  return TSUCreateCGColorFromHSBInColorSpace(0, a1, a2, a3, a4);
}

uint64_t TSUHSBFromCGColorRef(CGColorRef color, double *a2, double *a3, double *a4, CGFloat *a5)
{
  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  if (!color)
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL TSUHSBFromCGColorRef(CGColorRef, CGFloat *, CGFloat *, CGFloat *, CGFloat *)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColorUtils.m"), 278, @"NULL color");
  }
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(color);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(color) != 4) {
    return 0;
  }
  *a5 = CGColorGetAlpha(color);
  Components = CGColorGetComponents(color);
  TSURGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double TSURGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4) {
      double v7 = a4;
    }
    else {
      double v7 = a5;
    }
    if (a4 >= a6) {
      double v8 = a6;
    }
    else {
      double v8 = a4;
    }
    BOOL v9 = a5 < a4 || a5 < a6;
    if (v9) {
      double v10 = a6;
    }
    else {
      double v10 = a5;
    }
    if (v9) {
      double v11 = v7;
    }
    else {
      double v11 = v8;
    }
  }
  else
  {
    if (a5 >= a6) {
      double v11 = a6;
    }
    else {
      double v11 = a5;
    }
    double v10 = a4;
  }
  double v12 = 0.0;
  if (v10 <= 0.0)
  {
    double v14 = 0.0;
  }
  else
  {
    double v13 = v10 - v11;
    double v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      double v15 = (v10 - a5) / v13;
      double v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5) {
          double v12 = v16 + 5.0;
        }
        else {
          double v12 = 1.0 - v15;
        }
      }
      else
      {
        BOOL v18 = v10 == a5;
        double v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6) {
            double v12 = v19 + 1.0;
          }
          else {
            double v12 = 3.0 - v16;
          }
        }
        else if (v11 == a4)
        {
          double v12 = v15 + 3.0;
        }
        else
        {
          double v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  double result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double TSUCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  double result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

BOOL TSUColorIsBlack(CGColor *a1)
{
  CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  double v5 = 0.0;
  if (Model)
  {
    if (Model == kCGColorSpaceModelCMYK)
    {
      Components += 3;
      double v5 = 1.0;
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB || *Components != 0.0 || Components[1] != 0.0) {
        return 0;
      }
      Components += 2;
    }
  }
  return *Components == v5;
}

BOOL TSUColorIsClear(CGColor *a1)
{
  return CGColorGetAlpha(a1) == 0.0;
}

CGFloat TSUColorLightness(CGColor *a1)
{
  if (a1)
  {
    CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a1);
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    switch(Model)
    {
      case kCGColorSpaceModelMonochrome:
        return *CGColorGetComponents(a1);
      case kCGColorSpaceModelCMYK:
        Components = CGColorGetComponents(a1);
        double v10 = Components[3];
        double v11 = 1.0 - fmin(v10 + *Components * (1.0 - v10), 1.0);
        double v12 = 1.0 - fmin(v10 + Components[1] * (1.0 - v10), 1.0);
        double v13 = 1.0 - fmin(v10 + Components[2] * (1.0 - v10), 1.0);
        double v5 = fmax(fmax(v11, v12), v13) + fmin(fmin(v11, v12), v13);
        return v5 * 0.5;
      case kCGColorSpaceModelRGB:
        CGColorRef v4 = CGColorGetComponents(a1);
        double v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
        return v5 * 0.5;
    }
    NSLog((NSString *)@"WARNING: Testing lightness of unsupported color model");
  }
  else
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"CGFloat TSUColorLightness(CGColorRef)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColorUtils.m"), 467, @"Trying to get lightness of a nil color");
  }
  return 0.0;
}

CGFloat TSUColorAverageLightness(CGColor *a1)
{
  if (a1)
  {
    CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a1);
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    switch(Model)
    {
      case kCGColorSpaceModelMonochrome:
        return *CGColorGetComponents(a1);
      case kCGColorSpaceModelCMYK:
        Components = CGColorGetComponents(a1);
        double v10 = Components[3];
        double v5 = 1.0
           - fmin(v10 + Components[2] * (1.0 - v10), 1.0)
           + 1.0
           - fmin(v10 + *Components * (1.0 - v10), 1.0)
           + 1.0
           - fmin(v10 + Components[1] * (1.0 - v10), 1.0);
        return v5 / 3.0;
      case kCGColorSpaceModelRGB:
        CGColorRef v4 = CGColorGetComponents(a1);
        double v5 = *v4 + v4[1] + v4[2];
        return v5 / 3.0;
    }
    NSLog((NSString *)@"WARNING: Testing lightness of unsupported color model");
  }
  else
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"CGFloat TSUColorAverageLightness(CGColorRef)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColorUtils.m"), 496, @"Trying to get lightness of a nil color");
  }
  return 0.0;
}

CGContext *TSUCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  }
  double v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t TSUBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef TSUCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  return TSUCreateCheckerBoardColorWithTint(a1, a2, 0, a3, a4);
}

CGColorRef TSUCreateCheckerBoardColorWithTint(CGColor *a1, CGColor *a2, CGColor *a3, CGFloat a4, CGFloat a5)
{
  double v10 = a4 + a4;
  double v11 = a5 + a5;
  double v12 = TSUCreateRGBABitmapContext(0, a4 + a4, a5 + a5, 1.0);
  if (!v12) {
    return 0;
  }
  double v13 = v12;
  CGContextSetFillColorWithColor(v12, a1);
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = v10;
  v17.size.height = v11;
  CGContextFillRect(v13, v17);
  CGContextSetFillColorWithColor(v13, a2);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = a4;
  v18.size.height = a5;
  CGContextFillRect(v13, v18);
  v19.origin.x = a4;
  v19.origin.y = a5;
  v19.size.width = a4;
  v19.size.height = a5;
  CGContextFillRect(v13, v19);
  if (a3)
  {
    CGContextSetFillColorWithColor(v13, a3);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = v10;
    v20.size.height = v11;
    CGContextFillRect(v13, v20);
  }
  Image = CGBitmapContextCreateImage(v13);
  CGContextRelease(v13);
  if (!Image) {
    return 0;
  }
  CGColorRef PatternWithImageAndTransform = TSUCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

uint64_t TSUPatternColorFromGradient(CGGradient *a1, CGFloat a2, CGFloat a3)
{
  id v6 = TSUCreateRGBABitmapContext(1, 1.0, a2, a3);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  v13.x = 0.0;
  v13.y = 0.0;
  v14.x = 0.0;
  v14.y = a2;
  CGContextDrawLinearGradient(v6, a1, v13, v14, 0);
  Image = CGBitmapContextCreateImage(v7);
  CGContextRelease(v7);
  uint64_t v9 = [MEMORY[0x263F1C6B0] imageWithCGImage:Image scale:0 orientation:a3];
  CGImageRelease(Image);
  if (!v9) {
    return 0;
  }
  double v10 = (void *)MEMORY[0x263F1C550];
  return [v10 colorWithPatternImage:v9];
}

double TSUFractionalPart(double a1)
{
  BOOL v1 = a1 <= 0.0;
  double v2 = -(-a1 - floor(-a1));
  double result = a1 - floor(a1);
  if (v1) {
    return v2;
  }
  return result;
}

double TSUClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3) {
      return a3;
    }
  }
  return a2;
}

double TSUMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double TSURandom()
{
  return (double)random() / 2147483650.0;
}

double TSURandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double TSUReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double TSUSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

uint64_t p_chunkIndexForCharacterIndex(unint64_t a1, void *a2)
{
  double v2 = (void **)a2[1];
  if (v2 != (void **)*a2)
  {
    unint64_t v3 = ((uint64_t)v2 - *a2) >> 4;
    double v2 = (void **)*a2;
    do
    {
      unint64_t v4 = v3 >> 1;
      double v5 = &v2[2 * (v3 >> 1)];
      uint64_t v7 = *v5;
      id v6 = v5 + 2;
      v3 += ~(v3 >> 1);
      if (v7[2] + *v7 <= a1) {
        double v2 = v6;
      }
      else {
        unint64_t v3 = v4;
      }
    }
    while (v3);
  }
  return ((uint64_t)v2 - *a2) >> 4;
}

void sub_222839B28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void **std::vector<std::shared_ptr<TSUStringChunk>>::push_back[abi:ne180100](uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  double result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v18[4] = result;
    CGPoint v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)result, v13);
    double v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)double v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    std::vector<std::shared_ptr<TSUStringChunk>>::__swap_out_circular_buffer(a1, v18);
    uint64_t v9 = (void *)a1[1];
    double result = std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer(v18);
  }
  else
  {
    *uint64_t v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_222839C50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void sub_22283A2CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20)
{
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<std::shared_ptr<TSUStringChunk>>::insert(uint64_t *a1, void *a2, void *a3)
{
  unint64_t v4 = a2;
  uint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v8 = (uint64_t)a2 - *a1;
  uint64_t v9 = v8 >> 4;
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v10 = a1[2];
  if (v6 >= v10)
  {
    unint64_t v16 = ((uint64_t)(v6 - v7) >> 4) + 1;
    if (v16 >> 60) {
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = v10 - v7;
    if (v17 >> 3 > v16) {
      unint64_t v16 = v17 >> 3;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v16;
    }
    uint64_t v41 = a1 + 2;
    if (v18)
    {
      CGRect v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)(a1 + 2), v18);
      uint64_t v21 = v20;
    }
    else
    {
      CGRect v19 = 0;
      uint64_t v21 = 0;
    }
    uint64_t v23 = (long long *)&v19[16 * v9];
    uint64_t v38 = v19;
    *(void *)&long long v39 = v23;
    *((void *)&v39 + 1) = v23;
    int v40 = &v19[16 * v21];
    if (v9 == v21)
    {
      if (v8 < 1)
      {
        if ((void *)v7 == v4) {
          unint64_t v25 = 1;
        }
        else {
          unint64_t v25 = v8 >> 3;
        }
        uint64_t v45 = v11;
        NSRange v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>(v11, v25);
        uint64_t v28 = v39;
        uint64_t v29 = *((void *)&v39 + 1) - v39;
        if (*((void *)&v39 + 1) == (void)v39)
        {
          int64x2_t v34 = vdupq_n_s64(v39);
          unint64_t v31 = (unint64_t)&v26[16 * (v25 >> 2)];
        }
        else
        {
          uint64_t v30 = v29 >> 4;
          unint64_t v31 = (unint64_t)&v26[16 * (v25 >> 2) + (v29 & 0xFFFFFFFFFFFFFFF0)];
          uint64_t v32 = 16 * v30;
          NSRange v33 = &v26[16 * (v25 >> 2)];
          do
          {
            *(_OWORD *)NSRange v33 = *(_OWORD *)v28;
            v33 += 16;
            *(void *)uint64_t v28 = 0;
            *(void *)(v28 + 8) = 0;
            v28 += 16;
            v32 -= 16;
          }
          while (v32);
          int64x2_t v34 = (int64x2_t)v39;
        }
        int v35 = v40;
        int v42 = v38;
        uint64_t v38 = v26;
        *(void *)&long long v39 = &v26[16 * (v25 >> 2)];
        int64x2_t v43 = v34;
        *((void *)&v39 + 1) = v31;
        int v40 = &v26[16 * v27];
        int v44 = v35;
        std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer(&v42);
        uint64_t v23 = (long long *)*((void *)&v39 + 1);
      }
      else
      {
        if (v9 >= -1) {
          uint64_t v24 = v9 + 1;
        }
        else {
          uint64_t v24 = v9 + 2;
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *>((uint64_t)&v42, v23, v23, (uint64_t)&v23[-(v24 >> 1)]);
        *(void *)&long long v39 = v39 - 16 * (v24 >> 1);
        *((void *)&v39 + 1) = v23;
      }
    }
    *(void *)uint64_t v23 = *a3;
    uint64_t v36 = a3[1];
    *((void *)v23 + 1) = v36;
    if (v36)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v36 + 8), 1uLL, memory_order_relaxed);
      uint64_t v23 = (long long *)*((void *)&v39 + 1);
    }
    *((void *)&v39 + 1) = v23 + 1;
    unint64_t v4 = (void *)std::vector<std::shared_ptr<TSUStringChunk>>::__swap_out_circular_buffer(a1, &v38, v4);
    std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer(&v38);
  }
  else if (a2 == (void *)v6)
  {
    long long v22 = *(_OWORD *)a3;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    if (*((void *)&v22 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v22 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    a1[1] = (uint64_t)(a2 + 2);
  }
  else
  {
    std::vector<std::shared_ptr<TSUStringChunk>>::__move_range((uint64_t)a1, a2, v6, (uint64_t)(a2 + 2));
    if (v4 <= a3) {
      a3 += 2 * (a1[1] > (unint64_t)a3);
    }
    uint64_t v13 = *a3;
    uint64_t v12 = a3[1];
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    void *v4 = v13;
    uint64_t v14 = v7 + 16 * v9;
    double v15 = *(std::__shared_weak_count **)(v14 + 8);
    *(void *)(v14 + 8) = v12;
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  return v4;
}

void sub_22283A588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_22283AA88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<std::shared_ptr<TSUStringChunk>>::erase(uint64_t a1, uint64_t a2, long long *a3)
{
  if ((long long *)a2 != a3)
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *>((uint64_t)&v10, a3, *(long long **)(a1 + 8), a2);
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7 != v5)
    {
      do
      {
        uint64_t v8 = *(std::__shared_weak_count **)(v7 - 8);
        if (v8) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v8);
        }
        v7 -= 16;
      }
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

void std::vector<std::shared_ptr<TSUStringChunk>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    unint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  a1[1] = v2;
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<std::shared_ptr<TSUStringChunk>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::shared_ptr<TSUStringChunk>>::__clear[abi:ne180100]((uint64_t *)v2);
    unint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::shared_ptr<TSUStringChunk>::shared_ptr[abi:ne180100]<TSUStringChunk,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_22283ACC8(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x223C9EE80](v1, 0x1000C401E2E008BLL);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<TSUStringChunk *,std::shared_ptr<TSUStringChunk>::__shared_ptr_default_delete<TSUStringChunk,TSUStringChunk>,std::allocator<TSUStringChunk>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x223C9EE80);
}

uint64_t std::__shared_ptr_pointer<TSUStringChunk *,std::shared_ptr<TSUStringChunk>::__shared_ptr_default_delete<TSUStringChunk,TSUStringChunk>,std::allocator<TSUStringChunk>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    JUMPOUT(0x223C9EE80);
  }
  return result;
}

uint64_t std::vector<std::shared_ptr<TSUStringChunk>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_22283AE28(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TSUStringChunk>>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TSUStringChunk>>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TSUStringChunk>>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TSUStringChunk>>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    unint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    v1 += 16;
  }
}

void **std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::shared_ptr<TSUStringChunk>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 16;
    unint64_t v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
}

void *std::vector<std::shared_ptr<TSUStringChunk>>::__move_range(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = (void *)((char *)a2 + v6 - a4);
  uint64_t v8 = (_OWORD *)v6;
  if ((unint64_t)v7 < a3)
  {
    long long v9 = v7;
    uint64_t v8 = *(_OWORD **)(a1 + 8);
    do
    {
      *v8++ = *(_OWORD *)v9;
      *long long v9 = 0;
      v9[1] = 0;
      v9 += 2;
    }
    while ((unint64_t)v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *>((uint64_t)&v11, a2, v7, v6);
}

uint64_t std::vector<std::shared_ptr<TSUStringChunk>>::__swap_out_circular_buffer(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>,std::reverse_iterator<std::shared_ptr<TSUStringChunk>*>>((uint64_t)(a1 + 2), (uint64_t)a3, a3, *a1, (void *)*a1, v6, v6);
  a2[1] = v8;
  a2[2] = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>,std::shared_ptr<TSUStringChunk>*,std::shared_ptr<TSUStringChunk>*,std::shared_ptr<TSUStringChunk>*>(v7, (uint64_t)a3, a1[1], (_OWORD *)a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

void *std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *>(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v7 = a3;
    do
    {
      long long v8 = *((_OWORD *)v7 - 1);
      v7 -= 2;
      *uint64_t v7 = 0;
      v7[1] = 0;
      uint64_t v9 = *(std::__shared_weak_count **)(a4 - 8);
      *(_OWORD *)(a4 - 16) = v8;
      a4 -= 16;
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
    }
    while (v7 != a2);
  }
  return a3;
}

long long *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      long long v7 = *v5;
      *(void *)uint64_t v5 = 0;
      *((void *)v5 + 1) = 0;
      long long v8 = *(std::__shared_weak_count **)(a4 + 8);
      *(_OWORD *)a4 = v7;
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      ++v5;
      a4 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

_OWORD *std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>,std::shared_ptr<TSUStringChunk>*,std::shared_ptr<TSUStringChunk>*,std::shared_ptr<TSUStringChunk>*>(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  unint64_t v4 = a4;
  uint64_t v9 = a4;
  long long v8 = a4;
  v6[0] = a1;
  v6[1] = &v8;
  CGFloat v6[2] = &v9;
  if (a2 != a3)
  {
    do
    {
      *v4++ = *(_OWORD *)a2;
      *(void *)a2 = 0;
      *(void *)(a2 + 8) = 0;
      a2 += 16;
    }
    while (a2 != a3);
    uint64_t v9 = v4;
  }
  char v7 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TSUStringChunk>>,std::shared_ptr<TSUStringChunk>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v6);
  return v4;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TSUStringChunk>>,std::shared_ptr<TSUStringChunk>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TSUStringChunk>>,std::shared_ptr<TSUStringChunk>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<TSUStringChunk>>,std::shared_ptr<TSUStringChunk>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    unint64_t v3 = *(std::__shared_weak_count **)(v1 - 8);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    v1 -= 16;
  }
}

void sub_22283B3A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283B648(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283B6D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283B740(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283B7AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283B814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283B87C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283B8E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283B9CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283BA40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22283BC38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUHasListLanguage(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    if (([(id)result hasPrefix:@"ja"] & 1) != 0
      || ([v1 hasPrefix:@"zh"] & 1) != 0
      || ([v1 hasPrefix:@"ko"] & 1) != 0
      || ([v1 hasPrefix:@"ar"] & 1) != 0)
    {
      return 1;
    }
    else
    {
      return [v1 hasPrefix:@"he"];
    }
  }
  return result;
}

BOOL TSUHasBiDiLanguage(uint64_t a1)
{
  return [MEMORY[0x263EFF960] characterDirectionForLanguage:a1] == 2;
}

void *TSULocalizedPList(void *a1)
{
  do
  {
    uint64_t v2 = a1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
      uint64_t v6 = (void *)[a1 objectEnumerator];
      char v7 = v6;
      while ([v6 nextObject])
      {
        [v5 addObject:((uint64_t (*)(void))TSULocalizedPList)()];
        uint64_t v6 = v7;
      }
      return v5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return v2;
    }
    uint64_t v3 = [a1 objectForKey:@"_LOCALIZABLE_"];
    if (!v3)
    {
      uint64_t v5 = (void *)[MEMORY[0x263EFF9A0] dictionary];
      long long v8 = (void *)[a1 keyEnumerator];
      uint64_t v9 = [v8 nextObject];
      if (v9)
      {
        uint64_t v10 = v9;
        do
        {
          objc_msgSend(v5, "setObject:forKey:", TSULocalizedPList(objc_msgSend(v2, "objectForKey:", v10)), v10);
          uint64_t v10 = [v8 nextObject];
        }
        while (v10);
      }
      return v5;
    }
    a1 = (void *)v3;
  }
  while ([v2 count] == 1);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSRange v26 = (void *)[MEMORY[0x263EFF980] array];
    unint64_t v4 = 0;
  }
  else
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"id TSULocalizedPList(id)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocalization.mm"), 79, @"TSULocalizedPList() - unexpected type");
    unint64_t v4 = 0;
LABEL_17:
    NSRange v26 = 0;
  }
  char v13 = (void *)[v2 objectEnumerator];
  uint64_t v14 = [v13 nextObject];
  if (v14)
  {
    while (2)
    {
      uint64_t v15 = TSULocalizedPList(v14);
      if (v4)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 addEntriesFromDictionary:v15];
          goto LABEL_27;
        }
        id v16 = +[TSUAssertionHandler currentHandler];
        uint64_t v17 = [NSString stringWithUTF8String:"id TSULocalizedPList(id)"];
        uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocalization.mm"];
        CGRect v19 = v16;
        uint64_t v20 = v17;
        uint64_t v21 = 90;
        long long v22 = @"TSULocalizedPList() - expected dictionary";
LABEL_26:
        [v19 handleFailureInFunction:v20 file:v18 lineNumber:v21 description:v22];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v23 = +[TSUAssertionHandler currentHandler];
          uint64_t v24 = [NSString stringWithUTF8String:"id TSULocalizedPList(id)"];
          uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocalization.mm"];
          CGRect v19 = v23;
          uint64_t v20 = v24;
          uint64_t v21 = 97;
          long long v22 = @"TSULocalizedPList() - expected array";
          goto LABEL_26;
        }
        [v26 addObjectsFromArray:v15];
      }
LABEL_27:
      uint64_t v14 = [v13 nextObject];
      if (!v14) {
        break;
      }
      continue;
    }
  }
  if (v4) {
    return v4;
  }
  else {
    return v26;
  }
}

NSMutableArray *p_arrayByAddingLanguage(NSString *a1, NSMutableArray *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(NSMutableArray *)a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(a2);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v7) hasPrefix:a1]) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [(NSMutableArray *)a2 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      [(NSMutableArray *)a2 addObject:a1];
    }
    return a2;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263EFF980];
    return (NSMutableArray *)[v9 arrayWithObject:a1];
  }
}

NSMutableArray *TSUFindInputLanguagesWithBlock(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x263F1CAA0], "activeInputModes", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = (NSString *)[*(id *)(*((void *)&v11 + 1) + 8 * i) primaryLanguage];
        if ((*(unsigned int (**)(uint64_t, NSString *))(a1 + 16))(a1, v8)) {
          uint64_t v5 = p_arrayByAddingLanguage(v8, v5);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v9 = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF960], "preferredLanguages"), "firstObject");
  if ((*(unsigned int (**)(uint64_t, NSString *))(a1 + 16))(a1, v9)) {
    return p_arrayByAddingLanguage(v9, v5);
  }
  return v5;
}

void sub_22283DE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t MOFullMethodName(uint64_t a1, const char *a2)
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = NSString;
  if (v4 == a1) {
    return [NSString stringWithFormat:@"+[%@ %@]", a1, NSStringFromSelector(a2)];
  }
  uint64_t v6 = objc_opt_class();
  return [v5 stringWithFormat:@"-[%@ %@]", v6, NSStringFromSelector(a2)];
}

CFDataRef _createASCIIData(const __CFString *a1, UInt8 a2, CFIndex a3, CFIndex a4)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  if (CStringPtr)
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB28];
    return CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&CStringPtr[a3], a4, v9);
  }
  else
  {
    if (a4 < 1) {
      return 0;
    }
    Mutable = CFDataCreateMutable(0, a4);
    CFDataSetLength(Mutable, a4);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    v14.NSUInteger location = a3;
    v14.NSUInteger length = a4;
    if (a4 != CFStringGetBytes(a1, v14, 0x600u, a2, 0, MutableBytePtr, a4, 0)) {
      NSLog((NSString *)@"*** %s: Unexpected string conversion error", "NSData *_createASCIIData(CFStringRef, UInt8, CFRange)");
    }
    return Mutable;
  }
}

uint64_t TSUOperatorStringAddition()
{
  uint64_t result = TSUOperatorStringAddition_sOperatorString;
  if (!TSUOperatorStringAddition_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 43);
    TSUOperatorStringAddition_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringSubtraction()
{
  uint64_t result = TSUOperatorStringSubtraction_sOperatorString;
  if (!TSUOperatorStringSubtraction_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 8722);
    TSUOperatorStringSubtraction_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringMultiplication()
{
  uint64_t result = TSUOperatorStringMultiplication_sOperatorString;
  if (!TSUOperatorStringMultiplication_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 215);
    TSUOperatorStringMultiplication_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringDivision()
{
  uint64_t result = TSUOperatorStringDivision_sOperatorString;
  if (!TSUOperatorStringDivision_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 247);
    TSUOperatorStringDivision_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringPower()
{
  uint64_t result = TSUOperatorStringPower_sOperatorString;
  if (!TSUOperatorStringPower_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 94);
    TSUOperatorStringPower_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringConcatenation()
{
  uint64_t result = TSUOperatorStringConcatenation_sOperatorString;
  if (!TSUOperatorStringConcatenation_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 38);
    TSUOperatorStringConcatenation_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringGreaterThan()
{
  uint64_t result = TSUOperatorStringGreaterThan_sOperatorString;
  if (!TSUOperatorStringGreaterThan_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 62);
    TSUOperatorStringGreaterThan_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringGreaterThanOrEqualTo()
{
  uint64_t result = TSUOperatorStringGreaterThanOrEqualTo_sOperatorString;
  if (!TSUOperatorStringGreaterThanOrEqualTo_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 8805);
    TSUOperatorStringGreaterThanOrEqualTo_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringLessThan()
{
  uint64_t result = TSUOperatorStringLessThan_sOperatorString;
  if (!TSUOperatorStringLessThan_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 60);
    TSUOperatorStringLessThan_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringLessThanOrEqualTo()
{
  uint64_t result = TSUOperatorStringLessThanOrEqualTo_sOperatorString;
  if (!TSUOperatorStringLessThanOrEqualTo_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 8804);
    TSUOperatorStringLessThanOrEqualTo_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringEqualTo()
{
  uint64_t result = TSUOperatorStringEqualTo_sOperatorString;
  if (!TSUOperatorStringEqualTo_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 61);
    TSUOperatorStringEqualTo_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringNotEqualTo()
{
  uint64_t result = TSUOperatorStringNotEqualTo_sOperatorString;
  if (!TSUOperatorStringNotEqualTo_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 8800);
    TSUOperatorStringNotEqualTo_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringPercent()
{
  uint64_t result = TSUOperatorStringPercent_sOperatorString;
  if (!TSUOperatorStringPercent_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 37);
    TSUOperatorStringPercent_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringColon()
{
  uint64_t result = TSUOperatorStringColon_sOperatorString;
  if (!TSUOperatorStringColon_sOperatorString)
  {
    uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 58);
    TSUOperatorStringColon_sOperatorString = result;
  }
  return result;
}

void sub_222840BE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222841084(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222841100(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *TSUBlockCleanup::TSUBlockCleanup(void *a1, void *a2)
{
  *a1 = a2;
  id v3 = a2;
  return a1;
}

{
  id v3;

  *a1 = a2;
  id v3 = a2;
  return a1;
}

void TSUBlockCleanup::~TSUBlockCleanup(id *this)
{
}

{
  (*((void (**)(void))*this + 2))();
}

void sub_222841770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TSUImageSourceOrientation(CGImageSource *a1)
{
  CFDictionaryRef v1 = CGImageSourceCopyPropertiesAtIndex(a1, 0, 0);
  int v2 = objc_msgSend((id)-[__CFDictionary objectForKey:](v1, "objectForKey:", *MEMORY[0x263F0F4C8]), "intValue");

  uint64_t result = 0;
  if ((v2 - 1) <= 7) {
    return TSUImageSourceOrientation___orientationMapping[v2 - 1];
  }
  return result;
}

uint64_t TSUImageOrientationApplyFlips(uint64_t result, int a2, int a3)
{
  if (!a2)
  {
    if (!a3) {
      return result;
    }
    return TSUImageOrientationApplyFlips_vFlippedOrientations[result];
  }
  uint64_t result = TSUImageOrientationApplyFlips_hFlippedOrientations[result];
  if (a3) {
    return TSUImageOrientationApplyFlips_vFlippedOrientations[result];
  }
  return result;
}

CGAffineTransform *TSUImageOrientationTransform@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  if (!result)
  {
    uint64_t v21 = MEMORY[0x263F000D0];
    long long v22 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)a3 = *MEMORY[0x263F000D0];
    *(_OWORD *)(a3 + 16) = v22;
    long long v23 = *(_OWORD *)(v21 + 32);
LABEL_20:
    *(_OWORD *)(a3 + 32) = v23;
    return result;
  }
  int v13 = dword_222874ED0[(void)result];
  uint64_t v14 = MEMORY[0x263F000D0];
  long long v15 = *MEMORY[0x263F000D0];
  long long v16 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a3 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a3 + 16) = v16;
  long long v17 = *(_OWORD *)(v14 + 32);
  *(_OWORD *)(a3 + 32) = v17;
  unint64_t v18 = 0xCCuLL >> (char)result;
  if ((0xCCuLL >> (char)result))
  {
    *(_OWORD *)&v42.a = v15;
    *(_OWORD *)&v42.c = v16;
    *(_OWORD *)&v42.tx = v17;
    uint64_t result = CGAffineTransformScale((CGAffineTransform *)a3, &v42, a6 / a7, a7 / a6);
  }
  switch(v13)
  {
    case 2:
      goto LABEL_8;
    case 3:
      long long v19 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v19;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGFloat v20 = 3.14159265;
      goto LABEL_14;
    case 4:
      goto LABEL_11;
    case 5:
      long long v24 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v24;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGAffineTransformRotate(&v42, &v41, -1.57079633);
      long long v25 = *(_OWORD *)&v42.c;
      *(_OWORD *)a3 = *(_OWORD *)&v42.a;
      *(_OWORD *)(a3 + 16) = v25;
      *(_OWORD *)(a3 + 32) = *(_OWORD *)&v42.tx;
LABEL_8:
      long long v26 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v26;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGFloat v27 = -1.0;
      CGFloat v28 = 1.0;
      goto LABEL_12;
    case 6:
      long long v29 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v29;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGFloat v20 = 1.57079633;
      goto LABEL_14;
    case 7:
      long long v30 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v30;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGAffineTransformRotate(&v42, &v41, -1.57079633);
      long long v31 = *(_OWORD *)&v42.c;
      *(_OWORD *)a3 = *(_OWORD *)&v42.a;
      *(_OWORD *)(a3 + 16) = v31;
      *(_OWORD *)(a3 + 32) = *(_OWORD *)&v42.tx;
LABEL_11:
      long long v32 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v32;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGFloat v27 = 1.0;
      CGFloat v28 = -1.0;
LABEL_12:
      uint64_t result = CGAffineTransformScale(&v42, &v41, v27, v28);
      goto LABEL_15;
    case 8:
      long long v33 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v33;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGFloat v20 = -1.57079633;
LABEL_14:
      uint64_t result = CGAffineTransformRotate(&v42, &v41, v20);
LABEL_15:
      long long v34 = *(_OWORD *)&v42.c;
      *(_OWORD *)a3 = *(_OWORD *)&v42.a;
      *(_OWORD *)(a3 + 16) = v34;
      *(_OWORD *)(a3 + 32) = *(_OWORD *)&v42.tx;
      break;
    default:
      break;
  }
  if (a2)
  {
    v43.origin.x = a4;
    v43.origin.y = a5;
    v43.size.width = a6;
    v43.size.height = a7;
    double MidX = CGRectGetMidX(v43);
    v44.origin.x = a4;
    v44.origin.y = a5;
    v44.size.width = a6;
    v44.size.height = a7;
    double MidY = CGRectGetMidY(v44);
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformMakeTranslation(&v42, MidX, MidY);
    if (v18)
    {
      CGAffineTransform t1 = v42;
      CGAffineTransformRotate(&v41, &t1, 3.14159265);
      CGAffineTransform v42 = v41;
    }
    long long v37 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a3;
    *(_OWORD *)&t1.c = v37;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a3 + 32);
    CGAffineTransform v39 = v42;
    CGAffineTransformConcat(&v41, &t1, &v39);
    CGAffineTransform v42 = v41;
    CGAffineTransform t1 = v41;
    uint64_t result = CGAffineTransformTranslate(&v41, &t1, -MidX, -MidY);
    long long v38 = *(_OWORD *)&v41.c;
    long long v23 = *(_OWORD *)&v41.tx;
    CGAffineTransform v42 = v41;
    *(_OWORD *)a3 = *(_OWORD *)&v41.a;
    *(_OWORD *)(a3 + 16) = v38;
    goto LABEL_20;
  }
  return result;
}

BOOL TSUCGImageIsEmpty(CGImage *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 1;
  }
  memset(data, 0, sizeof(data));
  int v2 = CGBitmapContextCreateWithData(data, 1uLL, 1uLL, 8uLL, 1uLL, 0, 7u, 0, 0);
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  CGContextDrawImage(v2, v6, a1);
  CFRelease(v2);
  return LOBYTE(data[0]) == 0;
}

void TSUSplitRectIntoSlices(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  CGSize v21 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  CGPoint v22 = (CGPoint)*MEMORY[0x263F001A0];
  remainder.origin = v22;
  remainder.size_t size = v21;
  slice.origin = v22;
  slice.size_t size = v21;
  v28.origin = v22;
  v28.size_t size = v21;
  v29.origin = v22;
  v29.size_t size = v21;
  v24.origin = v22;
  v24.size_t size = v21;
  v25.origin = v22;
  v25.size_t size = v21;
  v26.origin = v22;
  v26.size_t size = v21;
  CGRectDivide(*(CGRect *)&a2, &slice, &remainder, a8, CGRectMinYEdge);
  CGRectDivide(remainder, &v29, &v28, a9, CGRectMaxYEdge);
  remainder.origin = v22;
  remainder.size_t size = v21;
  v31.origin.x = a2;
  v31.origin.y = a3;
  v31.size.width = a4;
  v31.size.height = a5;
  CGRectDivide(v31, &v24, &remainder, a6, CGRectMinXEdge);
  CGRectDivide(remainder, &v26, &v25, a7, CGRectMaxXEdge);
  uint64_t v17 = 0;
  uint64_t v18 = a1 + 16;
  do
  {
    uint64_t v19 = 0;
    uint64_t v20 = v18;
    do
    {
      *(CGRect *)(v20 - 16) = CGRectIntersection(*(CGRect *)((char *)&slice + v19), *(&v24 + v17));
      v20 += 96;
      v19 += 32;
    }
    while (v19 != 96);
    ++v17;
    v18 += 32;
  }
  while (v17 != 3);
}

UIImage *TSUCGImagePNGRepresentationWithProperties(uint64_t a1)
{
  uint64_t result = (UIImage *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:a1];
  if (result)
  {
    int v2 = result;
    id v3 = UIImagePNGRepresentation(result);

    return (UIImage *)v3;
  }
  return result;
}

UIImage *TSUCGImagePNGRepresentationWithOrientation(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F0F4C8];
  if ((unint64_t)(a2 - 1) > 6) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = dword_222874EF0[a2 - 1];
  }
  v6[0] = [NSNumber numberWithInt:v3];
  [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return TSUCGImagePNGRepresentationWithProperties(a1);
}

uint64_t TSUCGImageJPEGRepresentationWithProperties()
{
  return 0;
}

UIImage *TSUCGImageJPEGRepresentation(uint64_t a1, CGFloat a2)
{
  uint64_t result = (UIImage *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:a1];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = UIImageJPEGRepresentation(result, a2);

    return (UIImage *)v5;
  }
  return result;
}

uint64_t TSUCGImageJPEGRepresentationWithOrientation(uint64_t a1, uint64_t a2)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = *MEMORY[0x263F0EFE8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  v6[1] = *MEMORY[0x263F0F4C8];
  v7[0] = v3;
  if ((unint64_t)(a2 - 1) > 6) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = dword_222874EF0[a2 - 1];
  }
  v7[1] = [NSNumber numberWithInt:v4];
  [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  return 0;
}

__CFData *TSUCGImageTIFFRepresentation(CGImage *a1)
{
  int v2 = (__CFData *)[MEMORY[0x263EFF990] data];
  uint64_t v3 = CGImageDestinationCreateWithData(v2, (CFStringRef)*MEMORY[0x263F01B40], 1uLL, 0);
  CGImageDestinationAddImage(v3, a1, 0);
  BOOL v4 = CGImageDestinationFinalize(v3);
  if (v3) {
    CFRelease(v3);
  }
  if (v4) {
    return v2;
  }
  else {
    return 0;
  }
}

double TSDMultiplyPointScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double TSUMultiplySizeScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double TSUMultiplyRectScalar(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9 = a1;
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v11.origin.x = v9;
    v11.origin.y = a2;
    v11.size.width = a3;
    v11.size.height = a4;
    if (!CGRectIsNull(v11)) {
      return v9 * a5;
    }
  }
  return v9;
}

double TSUFlooredPoint(double a1)
{
  return floor(a1);
}

double TSUFlooredSize(double a1)
{
  return floor(a1);
}

double TSURoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  v20.origin.CGFloat x = TSUMultiplyRectScalar(a1, a2, a3, a4, a5);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double MinX = CGRectGetMinX(v20);
  double v11 = TSURound(MinX);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v21);
  double v13 = TSURound(MinY);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v22);
  double v15 = TSURound(MaxX) - v11;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v23);
  double v17 = TSURound(MaxY) - v13;
  return TSUMultiplyRectScalar(v11, v13, v15, v17, 1.0 / a5);
}

double TSURectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double TSURectWithSize()
{
  return 0.0;
}

double TSUCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.CGFloat x = a1;
  v10.origin.CGFloat y = a2;
  v10.size.CGFloat width = a3;
  v10.size.CGFloat height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double TSURoundedRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return TSURoundedRectForScale(a1, a2, a3, a4, 1.0);
}

BOOL TSUPointIsNearPoint(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

uint64_t TSUPointIsFinite(double a1, double a2)
{
  double v2 = fabs(a1);
  BOOL v3 = v2 < INFINITY;
  if (v2 > INFINITY) {
    BOOL v3 = 1;
  }
  double v4 = fabs(a2);
  BOOL v5 = v4 < INFINITY;
  if (v4 > INFINITY) {
    BOOL v5 = 1;
  }
  return v3 & v5;
}

double TSUPointFromNormalizedRect(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v14.origin.CGFloat x = a3;
  v14.origin.CGFloat y = a4;
  v14.size.CGFloat width = a5;
  v14.size.CGFloat height = a6;
  double MinX = CGRectGetMinX(v14);
  v15.origin.CGFloat x = a3;
  v15.origin.CGFloat y = a4;
  v15.size.CGFloat width = a5;
  v15.size.CGFloat height = a6;
  double v12 = MinX + a1 * CGRectGetWidth(v15);
  v16.origin.CGFloat x = a3;
  v16.origin.CGFloat y = a4;
  v16.size.CGFloat width = a5;
  v16.size.CGFloat height = a6;
  CGRectGetMinY(v16);
  v17.origin.CGFloat x = a3;
  v17.origin.CGFloat y = a4;
  v17.size.CGFloat width = a5;
  v17.size.CGFloat height = a6;
  CGRectGetHeight(v17);
  return v12;
}

double TSUScaleSizeWithinSize(double a1, double a2, double a3, double a4)
{
  if (a1 / a2 < a3 / a4) {
    return a1 * (a4 / a2);
  }
  return a3;
}

double TSUShrinkSizeToFitInSize(double result, double a2, double a3, double a4)
{
  if (result <= a3)
  {
    BOOL v4 = a2 == a4;
    BOOL v5 = a2 < a4;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v5 = 0;
  }
  if (!v5 && !v4)
  {
    if (result / a2 <= a3 / a4)
    {
      if (result / a2 < a3 / a4) {
        return result * (a4 / a2);
      }
      else {
        return a3;
      }
    }
    else
    {
      return a3;
    }
  }
  return result;
}

double TSUMixFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

double TSUMixPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double TSUMixSizes(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double TSUMixRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

double TSUSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

double TSUDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

BOOL isFormatTypeNumber(int a1)
{
  return (a1 & 0xFFFFFFFC) == 256;
}

uint64_t TSUFormat::isMergableWithFormatType(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  if ((v2 & 0xFFFFFFFC) == 0x100) {
    BOOL v3 = (a2 & 0xFFFFFFFC) == 256;
  }
  else {
    BOOL v3 = v2 == a2;
  }
  unsigned int v4 = v2 == 1 || v3;
  if (a2 == 1) {
    return 1;
  }
  else {
    return v4;
  }
}

void TSUFormat::TSUFormat(TSUFormat *this)
{
  *(void *)this = &unk_26D4EFD40;
  *((_DWORD *)this + 2) = 1;
  *((unsigned char *)this + 12) = 1;
  *((void *)this + 6) = 0;
}

{
  *(void *)this = &unk_26D4EFD40;
  *((_DWORD *)this + 2) = 1;
  *((unsigned char *)this + 12) = 1;
  *((void *)this + 6) = 0;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, int *a2)
{
  *(void *)a1 = &unk_26D4EFD40;
  int v4 = *a2;
  *(_DWORD *)(a1 + 8) = *a2;
  *(unsigned char *)(a1 + 12) = 1;
  if (v4 == 257)
  {
    CFLocaleRef v5 = (const __CFLocale *)TSUGetCurrentLocale();
    CFStringRef Value = (__CFString *)CFLocaleGetValue(v5, (CFLocaleKey)*MEMORY[0x263EFFCB8]);
    if (Value) {
      uint64_t v7 = Value;
    }
    else {
      uint64_t v7 = @"USD";
    }
    int32_t defaultFractionDigits = 0;
    int DecimalInfoForCurrencyCode = CFNumberFormatterGetDecimalInfoForCurrencyCode(v7, &defaultFractionDigits, 0);
    double v9 = v7;
    uint64_t v10 = defaultFractionDigits;
    if (!DecimalInfoForCurrencyCode) {
      uint64_t v10 = 2;
    }
  }
  else
  {
    double v9 = 0;
    uint64_t v10 = 253;
  }
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10 & 0xFFFFFFFFFFFFF8FFLL;
  double v11 = v9;
  *(void *)(a1 + 48) = 0;
  unsigned int v12 = *a2 - 261;
  BOOL v13 = v12 > 8;
  int v14 = (1 << v12) & 0x183;
  if (!v13 && v14 != 0)
  {
    id v16 = +[TSUAssertionHandler currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"TSUFormat::TSUFormat(const TSUFormatType &)"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 62, @"Use the constructor for this type of struct instead of this one (unless you want a number struct value).");
  }
  return a1;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, _DWORD *a2, _OWORD *a3)
{
  *(void *)a1 = &unk_26D4EFD40;
  *(_DWORD *)(a1 + 8) = *a2;
  *(unsigned char *)(a1 + 12) = 1;
  *(_OWORD *)(a1 + 16) = *a3;
  id v5 = *(id *)(a1 + 16);
  *(void *)(a1 + 48) = 0;
  if ((*a2 & 0xFFFFFFFC) != 0x100)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatType &, const TSUFormatStructNumber &)");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 71, @"Creating a non-number formatType but initializing the numberStruct variable.");
  }
  return a1;
}

{
  id v5;
  uint64_t v6;
  long long v7;

  *(void *)a1 = &unk_26D4EFD40;
  *(_DWORD *)(a1 + 8) = *a2;
  *(unsigned char *)(a1 + 12) = 1;
  id v5 = +[TSUAssertionHandler currentHandler];
  id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatType &, const TSUFormatStructControl &)");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 142, @"Formula engine formats should never use stepper/sliders. Some caller needs to get the display format.");
  uint64_t v7 = a3[1];
  *(_OWORD *)(a1 + 16) = *a3;
  *(_OWORD *)(a1 + 32) = v7;
  *(void *)(a1 + 48) = 0;
  return a1;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, int *a2, char a3, uint64_t a4)
{
  *(void *)a1 = &unk_26D4EFD40;
  int v5 = *a2;
  *(_DWORD *)(a1 + 8) = *a2;
  *(unsigned char *)(a1 + 12) = a3;
  *(void *)(a1 + 48) = a4;
  if (v5 != -999 && v5 != 1)
  {
    if ((v5 & 0xFFFFFFFC) == 0x100)
    {
      *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 2);
      long long v8 = *(void **)(a1 + 16);
LABEL_7:
      id v9 = v8;
    }
    else
    {
      switch(v5)
      {
        case 261:
          *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 2);
          long long v8 = *(void **)(a1 + 24);
          goto LABEL_7;
        case 262:
          *(_DWORD *)(a1 + 16) = a2[2];
          return a1;
        case 268:
          goto LABEL_16;
        case 269:
          __int16 v10 = *((_WORD *)a2 + 4);
          *(unsigned char *)(a1 + 18) = *((unsigned char *)a2 + 10);
          *(_WORD *)(a1 + 16) = v10;
          return a1;
        default:
          if ((v5 - 270) <= 2) {
            goto LABEL_16;
          }
          if ((v5 - 264) >= 2)
          {
            if (v5 != 266) {
              return a1;
            }
LABEL_16:
            long long v13 = *(_OWORD *)(a2 + 2);
          }
          else
          {
            id v11 = +[TSUAssertionHandler currentHandler];
            uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatStruct &, BOOL, const TSUCustomFormat *)");
            objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 100, @"Formula engine formats should never use stepper/sliders. Some caller needs to get the display format.");
            long long v13 = *(_OWORD *)(a2 + 2);
            *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 6);
          }
          *(_OWORD *)(a1 + 16) = v13;
          break;
      }
    }
  }
  return a1;
}

uint64_t TSUFormat::TSUFormat(uint64_t result, _DWORD *a2)
{
  *(void *)uint64_t result = &unk_26D4EFD40;
  *(_DWORD *)(result + 8) = 262;
  *(unsigned char *)(result + 12) = 1;
  *(_DWORD *)(result + 16) = *a2;
  *(void *)(result + 48) = 0;
  return result;
}

{
  *(void *)uint64_t result = &unk_26D4EFD40;
  *(_DWORD *)(result + 8) = 262;
  *(unsigned char *)(result + 12) = 1;
  *(_DWORD *)(result + 16) = *a2;
  *(void *)(result + 48) = 0;
  return result;
}

uint64_t TSUFormat::TSUFormat(uint64_t result, __int16 *a2)
{
  *(void *)uint64_t result = &unk_26D4EFD40;
  *(_DWORD *)(result + 8) = 269;
  *(unsigned char *)(result + 12) = 1;
  __int16 v2 = *a2;
  *(unsigned char *)(result + 18) = *((unsigned char *)a2 + 2);
  *(_WORD *)(result + 16) = v2;
  *(void *)(result + 48) = 0;
  return result;
}

{
  __int16 v2;

  *(void *)uint64_t result = &unk_26D4EFD40;
  *(_DWORD *)(result + 8) = 269;
  *(unsigned char *)(result + 12) = 1;
  __int16 v2 = *a2;
  *(unsigned char *)(result + 18) = *((unsigned char *)a2 + 2);
  *(_WORD *)(result + 16) = v2;
  *(void *)(result + 48) = 0;
  return result;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, _OWORD *a2)
{
  *(void *)a1 = &unk_26D4EFD40;
  *(_DWORD *)(a1 + 8) = 261;
  *(unsigned char *)(a1 + 12) = 1;
  *(_OWORD *)(a1 + 16) = *a2;
  id v3 = *(id *)(a1 + 24);
  *(void *)(a1 + 48) = 0;
  return a1;
}

{
  id v3;

  *(void *)a1 = &unk_26D4EFD40;
  *(_DWORD *)(a1 + 8) = 261;
  *(unsigned char *)(a1 + 12) = 1;
  *(_OWORD *)(a1 + 16) = *a2;
  id v3 = *(id *)(a1 + 24);
  *(void *)(a1 + 48) = 0;
  return a1;
}

__n128 TSUFormat::TSUFormat(__n128 *a1, __n128 *a2)
{
  a1->n128_u64[0] = (unint64_t)&unk_26D4EFD40;
  a1->n128_u32[2] = 268;
  a1->n128_u8[12] = 1;
  __n128 result = *a2;
  a1[1] = *a2;
  a1[3].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[0] = (unint64_t)&unk_26D4EFD40;
  a1->n128_u32[2] = 268;
  a1->n128_u8[12] = 1;
  __n128 result = *a2;
  a1[1] = *a2;
  a1[3].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[0] = (unint64_t)&unk_26D4EFD40;
  a1->n128_u32[2] = 266;
  a1->n128_u8[12] = 1;
  __n128 result = *a2;
  a1[1] = *a2;
  a1[3].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[0] = (unint64_t)&unk_26D4EFD40;
  a1->n128_u32[2] = 266;
  a1->n128_u8[12] = 1;
  __n128 result = *a2;
  a1[1] = *a2;
  a1[3].n128_u64[0] = 0;
  return result;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, _DWORD *a2, _OWORD *a3, uint64_t a4)
{
  *(void *)a1 = &unk_26D4EFD40;
  *(_DWORD *)(a1 + 8) = *a2;
  *(unsigned char *)(a1 + 12) = 1;
  *(void *)(a1 + 48) = a4;
  *(_OWORD *)(a1 + 16) = *a3;
  if ((*a2 - 270) >= 3)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatType &, const TSUFormatStructCustom &, const TSUCustomFormat *)");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 137, @"Creating a non-custom formatType but initializing the customStruct variable.");
  }
  return a1;
}

void TSUFormat::TSUFormat(TSUFormat *this, const TSUFormat *a2)
{
  *(void *)this = &unk_26D4EFD40;
  int v2 = *((_DWORD *)a2 + 2);
  *((_DWORD *)this + 2) = v2;
  *((unsigned char *)this + 12) = *((unsigned char *)a2 + 12);
  long long v3 = *((_OWORD *)a2 + 2);
  *((_OWORD *)this + 1) = *((_OWORD *)a2 + 1);
  *((_OWORD *)this + 2) = v3;
  *((void *)this + 6) = *((void *)a2 + 6);
  if ((v2 & 0xFFFFFFFC) == 0x100)
  {
    int v4 = (id *)((char *)this + 16);
  }
  else
  {
    if (v2 != 261) {
      return;
    }
    int v4 = (id *)((char *)this + 24);
  }
  id v5 = *v4;
}

uint64_t TSUFormat::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    int v4 = *(_DWORD *)(a2 + 8);
    if ((v4 & 0xFFFFFFFC) == 0x100)
    {
      id v5 = (id *)(a2 + 16);
    }
    else
    {
      if (v4 != 261) {
        goto LABEL_7;
      }
      id v5 = (id *)(a2 + 24);
    }
    id v6 = *v5;
LABEL_7:
    int v7 = *(_DWORD *)(a1 + 8);
    if ((v7 & 0xFFFFFFFC) == 0x100)
    {
      long long v8 = (id *)(a1 + 16);
    }
    else
    {
      if (v7 != 261)
      {
LABEL_12:
        *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
        long long v9 = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
        *(_OWORD *)(a1 + 32) = v9;
        *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        return a1;
      }
      long long v8 = (id *)(a1 + 24);
    }

    goto LABEL_12;
  }
  return a1;
}

void TSUFormat::~TSUFormat(TSUFormat *this)
{
  *(void *)this = &unk_26D4EFD40;
  int v1 = *((_DWORD *)this + 2);
  if ((v1 & 0xFFFFFFFC) == 0x100)
  {
    int v2 = (id *)((char *)this + 16);
  }
  else
  {
    if (v1 != 261) {
      return;
    }
    int v2 = (id *)((char *)this + 24);
  }

  id *v2 = 0;
}

void TSUFormat::formatByMergingWithFormat(TSUFormat *this@<X0>, const TSUFormat *a2@<X1>, uint64_t a3@<X8>)
{
  int v4 = *((_DWORD *)this + 2);
  if (v4 == 254) {
    goto LABEL_3;
  }
  id v5 = a2;
  int v6 = *((_DWORD *)a2 + 2);
  if (v6 == 254) {
    goto LABEL_3;
  }
  if (v4 != 1 && v6 != 1)
  {
    if ((v4 & 0xFFFFFFFC) == 0x100)
    {
      if ((v6 & 0xFFFFFFFC) == 0x100) {
        goto LABEL_13;
      }
    }
    else if (v4 == v6)
    {
      goto LABEL_13;
    }
LABEL_3:
    int v7 = 254;
LABEL_4:
    LODWORD(v42) = v7;
    TSUFormat::TSUFormat(a3, (int *)&v42);
    return;
  }
LABEL_13:
  if (*((unsigned char *)this + 12))
  {
    if (!*((unsigned char *)a2 + 12)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)a2 + 12))
  {
    goto LABEL_45;
  }
  if (v4 == 1)
  {
    if (v6 != 271)
    {
LABEL_19:
      __int16 v10 = (TSUFormat *)a3;
LABEL_46:
      TSUFormat::TSUFormat(v10, a2);
      return;
    }
LABEL_22:
    int v7 = 260;
    goto LABEL_4;
  }
  if (v6 == 1)
  {
    if (v4 == 271) {
      goto LABEL_22;
    }
LABEL_45:
    __int16 v10 = (TSUFormat *)a3;
    a2 = this;
    goto LABEL_46;
  }
  if ((v4 & 0xFFFFFFFC) == 0x100)
  {
    if (v4 != v6) {
      int v4 = 256;
    }
    int v43 = v4;
    unsigned int v11 = *((unsigned __int16 *)this + 12);
    int v12 = *((_WORD *)this + 12);
    unsigned int v13 = *((unsigned __int16 *)a2 + 12);
    int v14 = *((_WORD *)a2 + 12);
    if (v12 == v14) {
      __int16 v15 = *((_WORD *)this + 12);
    }
    else {
      __int16 v15 = 255;
    }
    if (v14 == 254) {
      __int16 v15 = *((_WORD *)this + 12);
    }
    if (v12 == 254) {
      __int16 v16 = *((_WORD *)a2 + 12);
    }
    else {
      __int16 v16 = v15;
    }
    int v17 = (v11 >> 8) & 7;
    if (v17 == ((v13 >> 8) & 7)) {
      __int16 v18 = (_WORD)v17 << 8;
    }
    else {
      __int16 v18 = 0;
    }
    unsigned int v19 = v11 & 0x800;
    if (((v13 >> 11) & 1) == v19 >> 11) {
      __int16 v20 = v19;
    }
    else {
      __int16 v20 = 0;
    }
    CGRect v21 = (void *)*((void *)this + 2);
    if (v21 != *((void **)a2 + 2))
    {
      if (objc_msgSend(v21, "isEqualToString:")) {
        CGRect v21 = (void *)*((void *)this + 2);
      }
      else {
        CGRect v21 = 0;
      }
    }
    *(void *)&long long v42 = v21;
    unsigned int v22 = *((_WORD *)this + 12) & 0x1000;
    if (((*((unsigned __int16 *)v5 + 12) >> 12) & 1) != v22 >> 12) {
      LOWORD(v22) = 0;
    }
    WORD4(v42) = v22 | v20 | v18 | v16;
    TSUFormat::TSUFormat(a3, &v43, &v42);
  }
  else
  {
    switch(v4)
    {
      case 261:
        CGRect v23 = (void *)*((void *)this + 3);
        if (v23 != *((void **)a2 + 3)) {
          CGRect v23 = (void *)TSUDefaultDateTimeFormat();
        }
        char v24 = *((unsigned char *)v5 + 16) & *((unsigned char *)this + 16) & 3;
        *(void *)a3 = &unk_26D4EFD40;
        *(_DWORD *)(a3 + 8) = 261;
        *(unsigned char *)(a3 + 12) = 1;
        *(unsigned char *)(a3 + 16) = v24;
        *(void *)(a3 + 24) = v23;
        id v25 = v23;
        break;
      case 262:
        int v26 = *((unsigned __int8 *)this + 16);
        if (v26 != *((unsigned __int8 *)a2 + 16)) {
          int v26 = 0;
        }
        *(void *)a3 = &unk_26D4EFD40;
        *(_DWORD *)(a3 + 8) = 262;
        *(unsigned char *)(a3 + 12) = 1;
        *(_DWORD *)(a3 + 16) = v26;
        break;
      case 268:
        int v27 = *((_DWORD *)this + 5);
        int v28 = *((_DWORD *)this + 6);
        int v29 = *((_DWORD *)a2 + 5);
        int v30 = *((_DWORD *)a2 + 6);
        if (v27 <= v29) {
          int v31 = *((_DWORD *)a2 + 5);
        }
        else {
          int v31 = *((_DWORD *)this + 5);
        }
        if (!v29) {
          int v31 = *((_DWORD *)this + 5);
        }
        if (v27) {
          int v32 = v31;
        }
        else {
          int v32 = *((_DWORD *)a2 + 5);
        }
        if (v28 >= v30) {
          int v33 = *((_DWORD *)a2 + 6);
        }
        else {
          int v33 = *((_DWORD *)this + 6);
        }
        if (!v30) {
          int v33 = *((_DWORD *)this + 6);
        }
        if (v28) {
          int v34 = v33;
        }
        else {
          int v34 = *((_DWORD *)a2 + 6);
        }
        int v35 = *((_DWORD *)this + 7);
        if (v35 != *((_DWORD *)a2 + 7)) {
          int v35 = 1;
        }
        *(void *)a3 = &unk_26D4EFD40;
        *(_DWORD *)(a3 + 8) = 268;
        *(unsigned char *)(a3 + 12) = 1;
        *(_DWORD *)(a3 + 20) = v32;
        *(_DWORD *)(a3 + 24) = v34;
        *(_DWORD *)(a3 + 28) = v35;
        break;
      case 269:
        __int16 v36 = *((_WORD *)this + 8);
        __int16 v37 = *((_WORD *)a2 + 8) ^ v36;
        __int16 v38 = v36;
        if (*((_WORD *)a2 + 8) != v36) {
          __int16 v38 = 255;
        }
        __int16 v39 = v36 & 0xFF00;
        if ((v37 & 0xFF00) != 0) {
          __int16 v39 = -256;
        }
        __int16 v40 = v38 | v39;
        int v41 = *((unsigned char *)this + 18) & 1;
        if (v41 != (*((unsigned char *)a2 + 18) & 1)) {
          int v41 = kTSUDefaultBaseUseMinusSign != 0;
        }
        *(void *)a3 = &unk_26D4EFD40;
        *(_DWORD *)(a3 + 8) = 269;
        *(unsigned char *)(a3 + 12) = 1;
        *(_WORD *)(a3 + 16) = v40;
        *(unsigned char *)(a3 + 18) = v41 != 0;
        break;
      case 270:
      case 272:
        if (*((_DWORD *)this + 4) == *((_DWORD *)a2 + 4)) {
          goto LABEL_45;
        }
        goto LABEL_3;
      case 271:
        goto LABEL_22;
      default:
        goto LABEL_45;
    }
    *(void *)(a3 + 48) = 0;
  }
}

void TSUFormat::formatByUnsettingDecimalPlacesIfPresent(TSUFormat *this@<X0>, TSUFormat *a2@<X8>)
{
  if (((**(uint64_t (***)(TSUFormat *))this)(this) & 0xFFFFFFFC) == 0x100)
  {
    long long v5 = *((_OWORD *)this + 1);
    BYTE8(v5) = -2;
    int v4 = (**(uint64_t (***)(TSUFormat *))this)(this);
    TSUFormat::TSUFormat((uint64_t)a2, &v4, &v5);
  }
  else
  {
    TSUFormat::TSUFormat(a2, this);
  }
}

TSUCustomFormat *TSUFormat::customConditionalFormatStructForDouble@<X0>(TSUCustomFormat **this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = -1;
  if ((*(unsigned int (**)(TSUCustomFormat **))*this)(this) != 270)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"TSUFormatStruct TSUFormat::customConditionalFormatStructForDouble(double) const"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 338, @"This only works for Custom Numbers");
  }
  __n128 result = (TSUCustomFormat *)(*(uint64_t (**)(TSUCustomFormat **))*this)(this);
  if (result == 270)
  {
    __n128 result = this[6];
    if (result)
    {
      *(_DWORD *)a3 = *((_DWORD *)this + 2);
      *(_DWORD *)(a3 + 8) = *((_DWORD *)this + 4);
      __n128 result = (TSUCustomFormat *)TSUCustomFormat::formatByEvaluatingConditionsWithDouble(result, a2);
      *(void *)(a3 + 16) = result;
    }
  }
  return result;
}

uint64_t TSUFormat::isEqual(TSUFormat *this, const TSUFormat *a2)
{
  unsigned int v2 = *((_DWORD *)this + 2);
  if (v2 != *((_DWORD *)a2 + 2)) {
    return 0;
  }
  uint64_t result = 1;
  switch(v2)
  {
    case 0xFEu:
      goto LABEL_19;
    case 0xFFu:
      goto LABEL_6;
    case 0x100u:
    case 0x102u:
      goto LABEL_15;
    case 0x101u:
      unsigned int v13 = (void *)*((void *)this + 2);
      if (v13 != *((void **)a2 + 2))
      {
        uint64_t result = objc_msgSend(v13, "isEqualToString:");
        if (!result) {
          return result;
        }
      }
      if (((*((unsigned __int16 *)a2 + 12) ^ *((unsigned __int16 *)this + 12)) & 0x1000) != 0) {
        return 0;
      }
LABEL_15:
      __int16 v14 = *((_WORD *)a2 + 12) ^ *((_WORD *)this + 12);
      if ((v14 & 0xF00) != 0) {
        return 0;
      }
LABEL_18:
      if ((_BYTE)v14) {
        return 0;
      }
LABEL_19:
      uint64_t result = 1;
      break;
    case 0x103u:
      __int16 v14 = *((_WORD *)a2 + 12) ^ *((_WORD *)this + 12);
      goto LABEL_18;
    case 0x104u:
    case 0x107u:
    case 0x10Bu:
      return result;
    case 0x105u:
      uint64_t result = [*((id *)this + 3) isEqualToString:*((void *)a2 + 3)];
      if (!result) {
        return result;
      }
      char v15 = *((unsigned char *)a2 + 16) ^ *((unsigned char *)this + 16);
      BOOL v11 = (v15 & 2) == 0;
      BOOL v12 = (v15 & 1) == 0;
      return v12 && v11;
    case 0x106u:
      int v6 = *((unsigned __int8 *)this + 16);
      int v7 = *((unsigned __int8 *)a2 + 16);
      return v6 == v7;
    case 0x108u:
    case 0x109u:
      if (*((double *)this + 2) != *((double *)a2 + 2)
        || *((double *)this + 3) != *((double *)a2 + 3)
        || *((double *)this + 4) != *((double *)a2 + 4)
        || *((_DWORD *)this + 10) != *((_DWORD *)a2 + 10))
      {
        return 0;
      }
      char v10 = *((unsigned char *)a2 + 44) ^ *((unsigned char *)this + 44);
      BOOL v11 = (v10 & 0xC) == 0;
      BOOL v12 = (v10 & 3) == 0;
      return v12 && v11;
    case 0x10Au:
      if (*((_DWORD *)this + 4) != *((_DWORD *)a2 + 4)) {
        return 0;
      }
      int v6 = *((_DWORD *)this + 5);
      int v7 = *((_DWORD *)a2 + 5);
      return v6 == v7;
    case 0x10Cu:
      if (*((_DWORD *)this + 5) != *((_DWORD *)a2 + 5) || *((_DWORD *)this + 6) != *((_DWORD *)a2 + 6)) {
        return 0;
      }
      int v6 = *((_DWORD *)this + 7);
      int v7 = *((_DWORD *)a2 + 7);
      return v6 == v7;
    case 0x10Du:
      int v17 = *((unsigned __int16 *)a2 + 8);
      if ((unsigned __int16)v17 != *((_WORD *)this + 8)) {
        return 0;
      }
      return (((v17 | (*((unsigned __int8 *)a2 + 18) << 16)) ^ (*((unsigned __int16 *)this + 8) | (*((unsigned __int8 *)this + 18) << 16))) & 0x10000) == 0;
    case 0x10Eu:
    case 0x10Fu:
    case 0x110u:
      int v6 = *((_DWORD *)this + 4);
      int v7 = *((_DWORD *)a2 + 4);
      return v6 == v7;
    default:
      if (v2 < 2 || v2 == -999) {
        return result;
      }
LABEL_6:
      id v8 = +[TSUAssertionHandler currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"BOOL TSUFormat::isEqual(const TSUFormat &) const"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 412, @"We should have dealt with any types earlier.");
      return 0;
  }
  return result;
}

uint64_t TSUFormat::numberStruct(TSUFormat *this)
{
  if ((*((_DWORD *)this + 2) & 0xFFFFFFFC) != 0x100)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"TSUFormatStructNumber TSUFormat::numberStruct() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 423, @"Format is not of this type.  Can't return this.");
  }
  return *((void *)this + 2);
}

uint64_t TSUFormat::fractionFormatStruct(TSUFormat *this)
{
  if (*((_DWORD *)this + 2) != 262)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"TSUFormatStructFraction TSUFormat::fractionFormatStruct() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 429, @"Format is not of this type.  Can't return this.");
  }
  return *((unsigned int *)this + 4);
}

uint64_t TSUFormat::baseFormatStruct(TSUFormat *this)
{
  if (*((_DWORD *)this + 2) != 269)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"TSUFormatStructBase TSUFormat::baseFormatStruct() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 436, @"Format is not of this type.  Can't return this.");
  }
  return *((unsigned __int16 *)this + 8) | (*((unsigned __int8 *)this + 18) << 16);
}

uint64_t TSUFormat::dateFormatStruct(TSUFormat *this)
{
  if (*((_DWORD *)this + 2) != 261)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"TSUFormatStructDate TSUFormat::dateFormatStruct() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 443, @"Format is not of this type.  Can't return this.");
  }
  id v4 = *((id *)this + 3);
  return *((void *)this + 2);
}

uint64_t TSUFormat::durationFormatStruct(TSUFormat *this)
{
  if (*((_DWORD *)this + 2) != 268)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"TSUFormatStructDuration TSUFormat::durationFormatStruct() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 451, @"Format is not of this type.  Can't return this.");
  }
  return *((void *)this + 2);
}

uint64_t TSUFormat::customFormatStruct(TSUFormat *this)
{
  if ((*((_DWORD *)this + 2) - 270) >= 3)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"TSUFormatStructCustom TSUFormat::customFormatStruct() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 457, @"Format is not of this type.  Can't return this.");
  }
  return *((void *)this + 2);
}

__n128 TSUFormat::controlFormatStruct@<Q0>(__n128 *this@<X0>, __n128 *a2@<X8>)
{
  if (this->n128_u32[2] - 263 >= 5)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"TSUFormatStructControl TSUFormat::controlFormatStruct() const"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 463, @"Format is not of this type.  Can't return this.");
  }
  __n128 result = this[1];
  __n128 v7 = this[2];
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t TSUFormat::multipleChoiceListStruct(TSUFormat *this)
{
  if (*((_DWORD *)this + 2) != 266)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"TSUFormatStructMultipleChoiceList TSUFormat::multipleChoiceListStruct() const"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 469, @"Format is not of this type.  Can't return this.");
  }
  return *((void *)this + 2);
}

__n128 TSUFormat::formatStruct@<Q0>(__n128 *this@<X0>, uint64_t a2@<X8>)
{
  result.n128_u64[0] = 0;
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  unsigned __int32 v3 = this->n128_u32[2];
  *(_DWORD *)a2 = v3;
  if ((v3 & 0xFFFFFFFC) == 0x100)
  {
LABEL_3:
    __n128 result = this[1];
    *(__n128 *)(a2 + 8) = result;
  }
  else
  {
    switch(v3)
    {
      case 0x105u:
      case 0x10Cu:
        goto LABEL_3;
      case 0x106u:
        *(_DWORD *)(a2 + 8) = this[1].n128_u32[0];
        break;
      case 0x10Du:
        *(_WORD *)(a2 + 8) = this[1].n128_u16[0];
        *(unsigned char *)(a2 + 10) = this[1].n128_u8[2];
        break;
      default:
        if (v3 - 270 <= 2) {
          goto LABEL_3;
        }
        if (v3 - 263 <= 4)
        {
          __n128 result = this[1];
          __n128 v4 = this[2];
          *(__n128 *)(a2 + 8) = result;
          *(__n128 *)(a2 + 24) = v4;
        }
        break;
    }
  }
  return result;
}

uint64_t TSUFormat::formatType(TSUFormat *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t TSUFormat::setFormatType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

void TSUFormatStructRelease(_DWORD *a1)
{
  int v1 = *a1;
  if ((*a1 & 0xFFFFFFFC) == 0x100)
  {
    id v2 = (id *)(a1 + 2);
LABEL_6:

    return;
  }
  if (v1 == 266 || v1 == 261)
  {
    id v2 = (id *)(a1 + 4);
    goto LABEL_6;
  }
}

_DWORD *TSUFormatStructRetain(_DWORD *result)
{
  int v1 = *result;
  if ((*result & 0xFFFFFFFC) == 0x100)
  {
    id v2 = (id *)(result + 2);
    return *v2;
  }
  if (v1 == 266 || v1 == 261)
  {
    id v2 = (id *)(result + 4);
    return *v2;
  }
  return result;
}

__CFString *NSStringForTSUFormatType(int a1)
{
  if (a1 <= 0)
  {
    if (a1 == -999)
    {
      return @"TSUFormatTypeUnknown";
    }
    else if (a1 == -1)
    {
      return @"TSUFormatTypeInvalid";
    }
    else if (a1)
    {
      return @"Unknown TSU format type";
    }
    else
    {
      return @"TSUFormatTypeUnsupported";
    }
  }
  else
  {
    int v1 = a1 - 254;
    __n128 result = @"TSUFormatTypeDecimal";
    switch(v1)
    {
      case 0:
        __n128 result = @"TSUFormatTypeConflicting";
        break;
      case 1:
        return @"Unknown TSU format type";
      case 2:
        return result;
      case 3:
        __n128 result = @"TSUFormatTypeCurrency";
        break;
      case 4:
        __n128 result = @"TSUFormatTypePercent";
        break;
      case 5:
        __n128 result = @"TSUFormatTypeScientific";
        break;
      case 6:
        __n128 result = @"TSUFormatTypeText";
        break;
      case 7:
        __n128 result = @"TSUFormatTypeDateTime";
        break;
      case 8:
        __n128 result = @"TSUFormatTypeFraction";
        break;
      case 9:
        __n128 result = @"TSUFormatTypeCheckbox";
        break;
      case 10:
        __n128 result = @"TSUFormatTypeStepper";
        break;
      case 11:
        __n128 result = @"TSUFormatTypeSlider";
        break;
      case 12:
        __n128 result = @"TSUFormatTypeMultipleChoiceList";
        break;
      case 13:
        __n128 result = @"TSUFormatTypeRating";
        break;
      case 14:
        __n128 result = @"TSUFormatTypeDuration";
        break;
      case 15:
        __n128 result = @"TSUFormatTypeBase";
        break;
      case 16:
        __n128 result = @"TSUFormatTypeCustomNumber";
        break;
      case 17:
        __n128 result = @"TSUFormatTypeCustomText";
        break;
      case 18:
        __n128 result = @"TSUFormatTypeCustomDateTime";
        break;
      default:
        if (@"TSUFormatTypeDecimal" != 1) {
          return @"Unknown TSU format type";
        }
        __n128 result = @"TSUFormatTypeNotSet";
        break;
    }
  }
  return result;
}

__CFString *DisplayNSStringForTSUFormatType(int a1)
{
  if (a1 <= 0)
  {
    if (a1 == -999)
    {
      int v1 = @"Unknown";
    }
    else if (a1 == -1)
    {
      int v1 = @"Invalid";
    }
    else
    {
      if (a1) {
        return @"Unknown TSU format type";
      }
      int v1 = @"Unsupported";
    }
  }
  else
  {
    int v1 = @"Number";
    switch(a1)
    {
      case 254:
        int v1 = @"Conflicting";
        break;
      case 255:
        int v1 = @"Automatic";
        break;
      case 256:
        break;
      case 257:
        int v1 = @"Currency";
        break;
      case 258:
        int v1 = @"Percentage";
        break;
      case 259:
        int v1 = @"Scientific";
        break;
      case 260:
        int v1 = @"Text";
        break;
      case 261:
        int v1 = @"Date & Time";
        break;
      case 262:
        int v1 = @"Fraction";
        break;
      case 263:
        int v1 = @"Checkbox";
        break;
      case 264:
        int v1 = @"Stepper";
        break;
      case 265:
        int v1 = @"Slider";
        break;
      case 266:
        int v1 = @"Pop-Up Menu";
        break;
      case 267:
        int v1 = @"Star Rating";
        break;
      case 268:
        int v1 = @"Duration";
        break;
      case 269:
        int v1 = @"Numeral System";
        break;
      case 270:
      case 271:
      case 272:
        int v1 = @"Custom";
        break;
      default:
        if (a1 != 1) {
          return @"Unknown TSU format type";
        }
        int v1 = @"Not Set";
        break;
    }
  }
  unsigned __int32 v3 = (void *)SFUBundle();
  return (__CFString *)[v3 localizedStringForKey:v1 value:&stru_26D4F03D0 table:@"TSUtility"];
}

uint64_t TSUFormatTypeForDisplayNSString(void *a1)
{
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Number", &stru_26D4F03D0, @"TSUtility")) & 1) != 0|| (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Number", &stru_26D4F03D0, @"TSUtility")))
  {
    return 256;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Scientific", &stru_26D4F03D0, @"TSUtility")))return 259; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Fraction", &stru_26D4F03D0, @"TSUtility")))return 262;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Currency", &stru_26D4F03D0, @"TSUtility")))return 257; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Percentage", &stru_26D4F03D0, @"TSUtility")))return 258;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Date & Time", &stru_26D4F03D0, @"TSUtility")))return 261; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Duration", &stru_26D4F03D0, @"TSUtility")))return 268;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Text", &stru_26D4F03D0, @"TSUtility")))return 260; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Unknown", &stru_26D4F03D0, @"TSUtility")))return 4294966297;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Not Set", &stru_26D4F03D0, @"TSUtility")))return 1; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Invalid", &stru_26D4F03D0, @"TSUtility")))return 0xFFFFFFFFLL;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Conflicting", &stru_26D4F03D0, @"TSUtility")))return 254; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Unsupported", &stru_26D4F03D0, @"TSUtility")))return 0;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Checkbox", &stru_26D4F03D0, @"TSUtility")))return 263; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Stepper", &stru_26D4F03D0, @"TSUtility")))return 264;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Slider", &stru_26D4F03D0, @"TSUtility")))return 265; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Pop-Up Menu", &stru_26D4F03D0, @"TSUtility")))return 266;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Star Rating", &stru_26D4F03D0, @"TSUtility")))return 267; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Numeral System", &stru_26D4F03D0, @"TSUtility")))return 269;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Custom", &stru_26D4F03D0, @"TSUtility")))return 270; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Custom", &stru_26D4F03D0, @"TSUtility")))return 271;
  }
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Custom", &stru_26D4F03D0, @"TSUtility")))return 272; {
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", @"Automatic", &stru_26D4F03D0, @"TSUtility")))return 255;
  }
  return 4294966297;
}

uint64_t TSUFormatStructEquals(int *a1, uint64_t a2)
{
  int v2 = *a1;
  if (*a1 != *(_DWORD *)a2) {
    return 0;
  }
  if ((v2 & 0xFFFFFFFC) != 0x100)
  {
    switch(v2)
    {
      case 261:
        if (((*(_DWORD *)(a2 + 8) ^ a1[2]) & 3) != 0) {
          return 0;
        }
        uint64_t v6 = *(void *)(a2 + 16);
        uint64_t v5 = (void *)*((void *)a1 + 2);
        return [v5 isEqual:v6];
      case 262:
        return *(unsigned __int8 *)(a2 + 8) == *((unsigned __int8 *)a1 + 8);
      case 268:
        uint64_t v8 = *((void *)a1 + 2);
        uint64_t v9 = *(void *)(a2 + 16);
        return a1[3] == *(_DWORD *)(a2 + 12) && v8 == v9 && HIDWORD(v8) == HIDWORD(v9);
      case 269:
        return (((*(unsigned __int16 *)(a2 + 8) | (*(unsigned __int8 *)(a2 + 10) << 16)) ^ (*((unsigned __int16 *)a1 + 4) | (*((unsigned __int8 *)a1 + 10) << 16))) & 0x1FFFF) == 0;
      default:
        if ((v2 - 270) <= 2) {
          return a1[2] == *(_DWORD *)(a2 + 8);
        }
        if ((v2 - 263) > 4) {
          return 1;
        }
        if (*((double *)a1 + 1) == *(double *)(a2 + 8)
          && *((double *)a1 + 2) == *(double *)(a2 + 16)
          && *((double *)a1 + 3) == *(double *)(a2 + 24)
          && a1[8] == *(_DWORD *)(a2 + 32))
        {
          return ((*((unsigned char *)a1 + 36) ^ *(unsigned char *)(a2 + 36)) & 3) == 0
              && ((*((unsigned char *)a1 + 36) ^ *(unsigned char *)(a2 + 36)) & 0xC) == 0;
        }
        break;
    }
    return 0;
  }
  uint64_t v3 = *(void *)(a2 + 16) ^ *((void *)a1 + 2);
  if ((v3 & 0x1800) != 0) {
    return 0;
  }
  if (*(unsigned char *)(a2 + 16) != *((unsigned char *)a1 + 16) || (v3 & 0x700) != 0) {
    return 0;
  }
  uint64_t v5 = (void *)*((void *)a1 + 1);
  uint64_t v6 = *(void *)(a2 + 8);
  return [v5 isEqual:v6];
}

uint64_t TSUFormatStructNumberEquals(void *a1, int a2, uint64_t a3, int a4)
{
  if (((a4 ^ a2) & 0x1800) != 0
    || a4 != a2
    || (((unsigned __int16)a4 ^ (unsigned __int16)a2) & 0x700) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "isEqual:");
  }
}

BOOL TSUFormatStructFractionEquals(char a1, char a2)
{
  return a2 == a1;
}

BOOL TSUFormatStructBaseEquals(unsigned int a1, int a2)
{
  return ((a2 ^ a1) & 0x1FFFFLL) == 0;
}

uint64_t TSUFormatStructDateEquals(unsigned int a1, void *a2, int a3, uint64_t a4)
{
  if (((a3 ^ a1) & 3) != 0) {
    return 0;
  }
  else {
    return [a2 isEqual:a4];
  }
}

BOOL TSUFormatStructDurationEquals(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return HIDWORD(a1) == HIDWORD(a3) && a2 == a4 && HIDWORD(a2) == HIDWORD(a4);
}

BOOL TSUFormatStructCustomEquals(int a1, uint64_t a2, int a3)
{
  return a1 == a3;
}

BOOL TSUFormatStructControlEquals(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 != *(double *)a2
    || *(double *)(a1 + 8) != *(double *)(a2 + 8)
    || *(double *)(a1 + 16) != *(double *)(a2 + 16)
    || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
  {
    return 0;
  }
  if (((*(unsigned char *)(a2 + 28) ^ *(unsigned char *)(a1 + 28)) & 3) != 0) {
    return 0;
  }
  return ((*(unsigned char *)(a2 + 28) ^ *(unsigned char *)(a1 + 28)) & 0xC) == 0;
}

uint64_t TSUFormatStructMultipleChoiceListEquals(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a1 != a3) {
    return 0;
  }
  uint64_t v6 = (void *)[a2 choices];
  uint64_t v7 = [a4 choices];
  return [v6 isEqual:v7];
}

uint64_t TSUFormatStructHash(unsigned int *a1)
{
  uint64_t v1 = *a1;
  if ((v1 & 0xFFFFFFFC) == 0x100)
  {
    uint64_t v2 = (*((void *)a1 + 2) >> 6) & 0x1CLL | (32 * *((void *)a1 + 2)) | (*((void *)a1 + 2) >> 10) & 2 | (*((void *)a1 + 2) >> 12) & 1;
    return [*((id *)a1 + 1) hash] ^ v1 ^ v2;
  }
  else
  {
    switch((int)v1)
    {
      case 261:
        uint64_t v1 = __rbit32(a1[2]) >> 30;
        uint64_t v4 = [*((id *)a1 + 2) hash] ^ 0x105;
        goto LABEL_11;
      case 262:
        unint64_t v5 = *((char *)a1 + 8);
        uint64_t v6 = 262;
        goto LABEL_7;
      case 268:
        unint64_t v5 = (4 * (a1[3] | *((void *)a1 + 2))) | HIDWORD(*((void *)a1 + 2));
        uint64_t v6 = 268;
        goto LABEL_7;
      case 269:
        return ((*((unsigned __int16 *)a1 + 4) << 9) & 0x1FFFE | (*((unsigned __int16 *)a1 + 4) >> 7) & 0x1FFFEu | (unint64_t)(*((unsigned char *)a1 + 10) & 1)) ^ 0x10D;
      default:
        if ((v1 - 270) > 2)
        {
          if ((v1 - 264) >= 2)
          {
            if (v1 == 266)
            {
              unint64_t v8 = *((void *)a1 + 1);
              uint64_t v9 = objc_msgSend((id)objc_msgSend(*((id *)a1 + 2), "choices"), "hash");
              unint64_t v5 = v8 ^ HIDWORD(v8);
              uint64_t v6 = v9 ^ 0x10A;
LABEL_7:
              uint64_t result = v5 ^ v6;
            }
            else
            {
              uint64_t result = (int)v1;
            }
          }
          else
          {
            long long v7 = *(_OWORD *)(a1 + 6);
            v10[0] = *(_OWORD *)(a1 + 2);
            v10[1] = v7;
            uint64_t result = TSUFormatStructControlHash((uint64_t)v10) ^ v1;
          }
        }
        else
        {
          uint64_t v4 = a1[2];
LABEL_11:
          uint64_t result = v4 ^ v1;
        }
        break;
    }
  }
  return result;
}

uint64_t TSUFormatStructNumberHash(void *a1, unint64_t a2)
{
  return [a1 hash] ^ ((a2 >> 6) & 0x1C | (32 * a2) | (a2 >> 10) & 2 | (a2 >> 12) & 1);
}

uint64_t TSUFormatStructFractionHash(uint64_t result)
{
  return (char)result;
}

unint64_t TSUFormatStructBaseHash(unint64_t a1)
{
  return (a1 >> 7) & 0x1FE | ((unint64_t)a1 << 9) | (a1 >> 16) & 1;
}

uint64_t TSUFormatStructDateHash(unsigned int a1, void *a2)
{
  return [a2 hash] ^ (__rbit32(a1) >> 30);
}

unint64_t TSUFormatStructDurationHash(uint64_t a1, unint64_t a2)
{
  return (4 * (HIDWORD(a1) | a2)) | HIDWORD(a2);
}

uint64_t TSUFormatStructCustomHash(uint64_t result)
{
  return result;
}

unint64_t TSUFormatStructControlHash(uint64_t a1)
{
  uint64_t v2 = TSUHash((char *)a1, 8);
  uint64_t v3 = TSUHash((char *)(a1 + 8), 8) ^ v2;
  return v3 ^ TSUHash((char *)(a1 + 16), 8) ^ *(int *)(a1 + 24) ^ (((unint64_t)*(unsigned __int8 *)(a1 + 28) >> 2) & 3 | (4 * (*(unsigned char *)(a1 + 28) & 3)));
}

uint64_t TSUFormatStructMultipleChoiceListHash(unint64_t a1, void *a2)
{
  return a1 ^ HIDWORD(a1) ^ objc_msgSend((id)objc_msgSend(a2, "choices"), "hash");
}

void TSUFormatInit(void)
{
  if ((sTSUFormatIsInitted & 1) == 0)
  {
    CFLocaleRef v0 = CFLocaleCopyCurrent();
    uint64_t v1 = CFNumberFormatterCreate(0, v0, kCFNumberFormatterCurrencyStyle);
    sTSUFormatCurrencyString = [(__CFString *)(id)CFNumberFormatterGetFormat(v1) copy];
    CFRelease(v1);
    sTSUFormatCurrencyStringMinus = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatCurrencyString, 0), "copy");
    sTSUFormatCurrencyStringRedOnlCGFloat y = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatCurrencyString, 1), "copy");
    sTSUFormatCurrencyStringWithParens = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatCurrencyString, 2), "copy");
    uint64_t v2 = CFNumberFormatterCreate(0, v0, kCFNumberFormatterPercentStyle);
    sTSUFormatPercentageString = [(__CFString *)(id)CFNumberFormatterGetFormat(v2) copy];
    CFRelease(v2);
    sTSUFormatPercentageStringMinus = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatPercentageString, 0), "copy");
    sTSUFormatPercentageStringRedOnlCGFloat y = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatPercentageString, 1), "copy");
    sTSUFormatPercentageStringWithParens = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatPercentageString, 2), "copy");
    uint64_t v3 = CFNumberFormatterCreate(0, v0, kCFNumberFormatterNoStyle);
    CFNumberFormatterSetFormat(v3, @"#.##E+00");
    sTSUFormatScientificString = [(__CFString *)(id)CFNumberFormatterGetFormat(v3) copy];
    CFRelease(v3);
    sTSUFormatScientificStringMinus = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatScientificString, 0), "copy");
    sTSUFormatScientificStringRedOnlCGFloat y = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatScientificString, 1), "copy");
    sTSUFormatScientificStringWithParens = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatScientificString, 2), "copy");
    uint64_t v4 = CFNumberFormatterCreate(0, v0, kCFNumberFormatterDecimalStyle);
    sTSUFormatDecimalString = [(__CFString *)(id)CFNumberFormatterGetFormat(v4) copy];
    CFRelease(v4);
    sTSUFormatDecimalStringMinus = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatDecimalString, 0), "copy");
    sTSUFormatDecimalStringRedOnlCGFloat y = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatDecimalString, 1), "copy");
    sTSUFormatDecimalStringWithParens = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatDecimalString, 2), "copy");
    sTSUFormatIsInitted = 1;
    CFRelease(v0);
    TSUDateFormatterInit();
  }
}

uint64_t TSUFormatDefaultFormatStringForValueType(int a1, int a2)
{
  int v2 = a1 - 257;
  uint64_t result = 0;
  switch(v2)
  {
    case 0:
      if ((a2 - 2) < 2)
      {
        uint64_t result = sTSUFormatCurrencyStringWithParens;
      }
      else if (a2 == 1)
      {
        uint64_t result = sTSUFormatCurrencyStringRedOnly;
      }
      else if (a2)
      {
        uint64_t result = sTSUFormatCurrencyString;
      }
      else
      {
        uint64_t result = sTSUFormatCurrencyStringMinus;
      }
      break;
    case 1:
      if ((a2 - 2) < 2)
      {
        uint64_t result = sTSUFormatPercentageStringWithParens;
      }
      else if (a2 == 1)
      {
        uint64_t result = sTSUFormatPercentageStringRedOnly;
      }
      else if (a2)
      {
        uint64_t result = sTSUFormatPercentageString;
      }
      else
      {
        uint64_t result = sTSUFormatPercentageStringMinus;
      }
      break;
    case 2:
      if ((a2 - 2) < 2)
      {
        uint64_t result = sTSUFormatScientificStringWithParens;
      }
      else if (a2 == 1)
      {
        uint64_t result = sTSUFormatScientificStringRedOnly;
      }
      else if (a2)
      {
        uint64_t result = sTSUFormatScientificString;
      }
      else
      {
        uint64_t result = sTSUFormatScientificStringMinus;
      }
      break;
    case 4:
      return result;
    default:
      if ((a2 - 2) < 2)
      {
        uint64_t result = sTSUFormatDecimalStringWithParens;
      }
      else if (a2 == 1)
      {
        uint64_t result = sTSUFormatDecimalStringRedOnly;
      }
      else if (a2)
      {
        uint64_t result = sTSUFormatDecimalString;
      }
      else
      {
        uint64_t result = sTSUFormatDecimalStringMinus;
      }
      break;
  }
  return result;
}

uint64_t TSUFormatTypeToTSUNumberValueType(int a1)
{
  if ((a1 - 256) > 0xE) {
    return 4294966297;
  }
  else {
    return dword_222874F50[a1 - 256];
  }
}

uint64_t TSUFormatTypeFromTSUNumberValueType(unsigned int a1)
{
  if (a1 > 5) {
    return 4294966297;
  }
  else {
    return dword_222874F8C[a1];
  }
}

uint64_t TSUFormatFractionStringFromDouble(char *a1, double a2)
{
  return TSUNumberFormatFractionStringFromDouble(*a1, a2);
}

void *TSUFormatBaseStringFromDouble(uint64_t a1, double a2)
{
  return TSUNumberFormatBaseStringFromDouble(*(_WORD *)a1, HIBYTE(*(_WORD *)a1), *(unsigned char *)(a1 + 2) & 1, a2);
}

__CFString *TSUFormatStructStringFromDouble(uint64_t a1, double a2)
{
  int v4 = *(_DWORD *)a1;
  unsigned int v5 = *(_DWORD *)a1 & 0xFFFFFFFC;
  if (v5 == 256)
  {
    unsigned int v6 = *(unsigned __int16 *)(a1 + 16);
    if (*(_WORD *)(a1 + 16) == 253 || (~v6 & 0xFE) == 0) {
      unsigned __int16 v8 = kTSUNumberFormatterDecimalPlacesAsManyAsNecessary;
    }
    else {
      unsigned __int16 v8 = *(_WORD *)(a1 + 16);
    }
    int v9 = (v6 >> 8) & 7;
    BOOL v10 = v9 != 0;
  }
  else
  {
    unsigned __int16 v8 = 0;
    BOOL v10 = 0;
    int v9 = 0;
  }
  int v11 = TSUFormatTypeToTSUNumberValueType(*(_DWORD *)a1);
  if (v11 == -999) {
    return &stru_26D4F03D0;
  }
  int v13 = v11;
  __int16 v14 = (__CFString *)TSUFormatDefaultFormatStringForValueType(v4, v9);
  return TSUNumberFormatStringFromDouble(v13, v8, v8, v10, v14, *(__CFString **)(a1 + 8), v5 == 256, 0, a2, 1.0, 0, 0, v10, 0, 0, 0, (*(_WORD *)(a1 + 16) & 0x800) != 0, (*(_WORD *)(a1 + 16) & 0x1000) != 0, 0,
           *(void *)(a1 + 8),
           BYTE1(*(void *)(a1 + 8)),
           WORD1(*(void *)(a1 + 8)) & 1,
           (char)*(void *)(a1 + 8));
}

__CFString *TSUFormatCustomStringFromDouble(uint64_t a1, double a2)
{
  if (*(_DWORD *)a1 == 270)
  {
    int v4 = (uint64_t *)(a1 + 16);
    uint64_t v5 = *(void *)(a1 + 16);
    uint64_t v6 = v5;
  }
  else
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *TSUFormatCustomStringFromDouble(TSUFormatStruct *, double)");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatUtilities.mm"), 289, @"Not a custom number format.");
    int v4 = (uint64_t *)(a1 + 16);
    uint64_t v6 = *(void *)(a1 + 16);
    if ((*(_DWORD *)a1 - 270) >= 3)
    {
      id v9 = +[TSUAssertionHandler currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"const TSUCustomFormatDataStruct *TSUFormatGetCustomFormatData(const TSUFormatStruct)"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 579, @"Accessor requires a custom format.");
      uint64_t v5 = *(void *)(a1 + 16);
      if ((*(_DWORD *)a1 - 270) >= 3)
      {
        id v11 = +[TSUAssertionHandler currentHandler];
        uint64_t v12 = [NSString stringWithUTF8String:"NSString *TSUFormatGetCustomFormatString(const TSUFormatStruct)"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 592, @"Accessor requires a custom format.");
      }
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 16);
    }
  }
  if (v5)
  {
    int v13 = *(void **)(v5 + 8);
  }
  else
  {
    id v14 = +[TSUAssertionHandler currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"NSString *TSUFormatGetCustomFormatString(const TSUFormatStruct)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 593, @"Custom format is not correctly populated.");
    int v13 = 0;
  }
  if (![v13 length]) {
    return (__CFString *)v13;
  }
  if ([v13 characterAtIndex:0] == 39
    && objc_msgSend(v13, "characterAtIndex:", objc_msgSend(v13, "length") - 1) == 39)
  {
    __int16 v16 = (void *)[v13 substringFromIndex:1];
    uint64_t v17 = [v16 rangeOfString:@"'"];
    if (v17 == [v16 length] - 1)
    {
      __int16 v18 = objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1);
      return (__CFString *)v18;
    }
  }
  unsigned int v20 = *(unsigned __int8 *)(v6 + 56);
  int v21 = *(_DWORD *)a1;
  if ((v20 & 0x20) != 0)
  {
    int v26 = TSUFormatTypeToTSUNumberValueType(v21);
    if (v26 != -999)
    {
      HIBYTE(v55) = (v20 & 4) != 0;
      LOBYTE(v55) = (v20 & 0x10) != 0;
      HIWORD(v54) = *(unsigned __int8 *)(v6 + 53);
      WORD2(v54) = *(_WORD *)(v6 + 54);
      LODWORD(v54) = *(_DWORD *)(v6 + 49);
      return TSUNumberFormatStringFromDouble(v26, 0, 0, (v20 >> 3) & 1, *(__CFString **)(v6 + 8), *(__CFString **)(v6 + 16), 1, *(void **)(v6 + 24), a2, *(double *)(v6 + 40), *(void **)(v6 + 32), v54, (v20 & 8) != 0, 0, 0x101u, v55, v20 & 1, (v20 & 2) != 0, 0,
               0,
               0,
               0,
               *(char *)(v6 + 48));
    }
    return &stru_26D4F03D0;
  }
  uint64_t v22 = *v4;
  if (v21 != 270)
  {
    id v23 = +[TSUAssertionHandler currentHandler];
    uint64_t v24 = [NSString stringWithUTF8String:"double TSUFormatGetCustomNumberFormatScaleFactor(const TSUFormatStruct)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 614, @"Accessor requires a custom number format.");
  }
  if (v22)
  {
    double v25 = *(double *)(v22 + 40);
  }
  else
  {
    id v27 = +[TSUAssertionHandler currentHandler];
    uint64_t v28 = [NSString stringWithUTF8String:"double TSUFormatGetCustomNumberFormatScaleFactor(const TSUFormatStruct)"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 615, @"Custom format is not correctly populated.");
    double v25 = 1.0;
  }
  uint64_t v29 = *(void *)(a1 + 16);
  if ((*(_DWORD *)a1 - 270) >= 3)
  {
    id v30 = +[TSUAssertionHandler currentHandler];
    uint64_t v31 = [NSString stringWithUTF8String:"NSString *TSUFormatGetCustomFormatString(const TSUFormatStruct)"];
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 592, @"Accessor requires a custom format.");
  }
  if (v29)
  {
    int v32 = *(__CFString **)(v29 + 8);
  }
  else
  {
    id v33 = +[TSUAssertionHandler currentHandler];
    uint64_t v34 = [NSString stringWithUTF8String:"NSString *TSUFormatGetCustomFormatString(const TSUFormatStruct)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 593, @"Custom format is not correctly populated.");
    int v32 = 0;
  }
  uint64_t v35 = *(void *)(a1 + 16);
  if (*(_DWORD *)a1 != 270)
  {
    id v36 = +[TSUAssertionHandler currentHandler];
    uint64_t v37 = [NSString stringWithUTF8String:"BOOL TSUFormatGetCustomNumberFormatShowThousandsSeparator(const TSUFormatStruct)"];
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 624, @"Accessor requires a custom number format.");
  }
  if (v35)
  {
    int v38 = *(unsigned char *)(v35 + 56) & 1;
  }
  else
  {
    id v39 = +[TSUAssertionHandler currentHandler];
    uint64_t v40 = [NSString stringWithUTF8String:"BOOL TSUFormatGetCustomNumberFormatShowThousandsSeparator(const TSUFormatStruct)"];
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 625, @"Custom format is not correctly populated.");
    int v38 = 0;
  }
  uint64_t v41 = *(void *)(a1 + 16);
  if (*(_DWORD *)a1 != 270)
  {
    id v42 = +[TSUAssertionHandler currentHandler];
    uint64_t v43 = [NSString stringWithUTF8String:"NSString *TSUFormatGetCustomNumberFormatCurrencyCode(const TSUFormatStruct)"];
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 603, @"Accessor requires a custom number format.");
  }
  if (v41)
  {
    CGRect v44 = *(__CFString **)(v41 + 16);
  }
  else
  {
    id v45 = +[TSUAssertionHandler currentHandler];
    uint64_t v46 = [NSString stringWithUTF8String:"NSString *TSUFormatGetCustomNumberFormatCurrencyCode(const TSUFormatStruct)"];
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 604, @"Custom format is not correctly populated.");
    CGRect v44 = 0;
  }
  uint64_t v47 = *(void *)(a1 + 16);
  if (*(_DWORD *)a1 != 270)
  {
    id v48 = +[TSUAssertionHandler currentHandler];
    uint64_t v49 = [NSString stringWithUTF8String:"BOOL TSUFormatGetCustomNumberFormatIsConditional(const TSUFormatStruct)"];
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 664, @"Accessor requires a custom number format.");
  }
  double v50 = v25 * a2;
  if (v47)
  {
    int v51 = (*(unsigned __int8 *)(v47 + 56) >> 3) & 1;
  }
  else
  {
    id v52 = +[TSUAssertionHandler currentHandler];
    uint64_t v53 = [NSString stringWithUTF8String:"BOOL TSUFormatGetCustomNumberFormatIsConditional(const TSUFormatStruct)"];
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 665, @"Custom format is not correctly populated.");
    int v51 = 0;
  }
  return TSUNumberFormatterStringFromDoubleWithFormat(v32, 0, 0, 0, v38, v44, v51, v50);
}

TSUNumberFormat *TSUFormatStructNumberToTSUNumberFormat(int a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 8) - 253 >= 2) {
    unsigned __int16 v4 = *(unsigned __int8 *)(a2 + 8);
  }
  else {
    unsigned __int16 v4 = kTSUNumberFormatterDecimalPlacesAsManyAsNecessary;
  }
  uint64_t v5 = [TSUNumberFormat alloc];
  uint64_t v6 = TSUFormatTypeToTSUNumberValueType(a1);
  unsigned int v7 = *(unsigned __int16 *)(a2 + 8);
  HIDWORD(v10) = -3;
  LOBYTE(v10) = (v7 & 0x800) != 0;
  uint64_t v8 = -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](v5, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", v6, 0, v4, *(void *)a2, (v7 >> 12) & 1, (v7 >> 8) & 7, v10);
  return v8;
}

TSUNumberFormat *TSUFormatStructFractionToTSUNumberFormat(int a1, char *a2)
{
  unsigned __int16 v4 = [TSUNumberFormat alloc];
  uint64_t v5 = TSUFormatTypeToTSUNumberValueType(a1);
  HIDWORD(v8) = *a2;
  LOBYTE(v8) = 0;
  uint64_t v6 = -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", v5, 0, 0, 0, 0, 0, v8);
  return v6;
}

TSUNumberFormat *TSUFormatStructBaseToTSUNumberFormat(int a1, uint64_t a2)
{
  unsigned __int16 v4 = [TSUNumberFormat alloc];
  uint64_t v5 = TSUFormatTypeToTSUNumberValueType(a1);
  BYTE4(v9) = *(unsigned char *)(a2 + 2) & 1;
  WORD1(v9) = HIBYTE(*(_WORD *)a2);
  LOBYTE(v9) = *(_WORD *)a2;
  HIDWORD(v8) = -3;
  LOBYTE(v8) = 0;
  uint64_t v6 = -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:](v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", v5, 0, 0, 0, 0, 0, v8, v9);
  return v6;
}

TSUDateFormat *TSUFormatStructDateToTSUDateFormat(uint64_t a1)
{
  uint64_t v1 = [[TSUDateFormat alloc] initWithFormat:*(void *)(a1 + 8) name:&stru_26D4F03D0];
  return v1;
}

TSUDurationFormat *TSUFormatStructDurationToTSUDurationFormat(uint64_t a1)
{
  uint64_t v1 = [[TSUDurationFormat alloc] initWithFormat:TSUDurationFormatterFormatFromDurationUnits(*(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), 1) name:&stru_26D4F03D0];
  return v1;
}

void sub_222848014(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22284808C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222848104(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222848174(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void TSUCustomFormat::TSUCustomFormat(TSUCustomFormat *this)
{
  *(void *)this = 0;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  id v1 = +[TSUAssertionHandler currentHandler];
  uint64_t v2 = [NSString stringWithUTF8String:"TSUCustomFormat::TSUCustomFormat()"];
  [v1 handleFailureInFunction:v2, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 17, @"Using default constructor for TSUCustomFormat. Use TSUCustomFormat(NSString* name, TSUFormatType formatType, NSString* format)." file lineNumber description];
}

void sub_2228483F0(_Unwind_Exception *a1)
{
  unsigned __int16 v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 88) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

uint64_t TSUCustomFormat::TSUCustomFormat(uint64_t a1, void *a2, int a3, long long *a4)
{
  *(void *)a1 = a2;
  id v7 = a2;
  *(_DWORD *)(a1 + 8) = a3;
  long long v8 = a4[2];
  long long v9 = a4[3];
  long long v11 = *a4;
  long long v10 = a4[1];
  *(void *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 48) = v8;
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = v10;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  if ((a3 - 270) >= 3)
  {
    id v12 = +[TSUAssertionHandler currentHandler];
    uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "TSUCustomFormat::TSUCustomFormat(NSString *, TSUFormatType, TSUCustomFormatDataStruct)");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 23, @"Creating a custom format without a correct custom format type.");
  }
  id v14 = (void *)*((void *)a4 + 1);
  if (!v14)
  {
    id v15 = +[TSUAssertionHandler currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "TSUCustomFormat::TSUCustomFormat(NSString *, TSUFormatType, TSUCustomFormatDataStruct)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 25, @"Creating a custom format with null format.");
    id v14 = (void *)*((void *)a4 + 1);
  }
  id v17 = v14;
  id v18 = *((id *)a4 + 2);
  id v19 = *((id *)a4 + 3);
  id v20 = *((id *)a4 + 4);
  *(void *)(a1 + 16) = *(void *)a1;
  *(unsigned char *)(a1 + 72) &= ~8u;
  return a1;
}

void sub_22284856C(_Unwind_Exception *a1)
{
  unsigned __int16 v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 88) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

BOOL TSUCustomFormat::formatTypeIsOK(uint64_t a1, int a2)
{
  return a2 == 272 || (a2 & 0xFFFFFFFE) == 270;
}

void TSUCustomFormat::TSUCustomFormat(TSUCustomFormat *this, const TSUCustomFormat *a2)
{
  *(void *)this = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  if ((*((_DWORD *)a2 + 2) - 270) >= 3)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"TSUCustomFormat::TSUCustomFormat(const TSUCustomFormat &)"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 36, @"Creating a custom format without a correct custom format type.");
  }
  if (!*((void *)a2 + 3))
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"TSUCustomFormat::TSUCustomFormat(const TSUCustomFormat &)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 38, @"Creating a custom format with nullformat.");
  }
  SFUtility::ObjcSharedPtr<NSString>::reset((void **)this, *(void **)a2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  long long v8 = *((_OWORD *)a2 + 4);
  long long v10 = *((_OWORD *)a2 + 1);
  long long v9 = *((_OWORD *)a2 + 2);
  *((_OWORD *)this + 3) = *((_OWORD *)a2 + 3);
  *((_OWORD *)this + 4) = v8;
  *((_OWORD *)this + 1) = v10;
  *((_OWORD *)this + 2) = v9;
  id v11 = *((id *)this + 3);
  id v12 = *((id *)this + 4);
  id v13 = *((id *)this + 5);
  id v14 = *((id *)this + 6);
  *((void *)this + 2) = *(void *)this;
  uint64_t v15 = *((void *)a2 + 11) - *((void *)a2 + 10);
  if (v15)
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    unint64_t v18 = v15 / 80;
    if (v18 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v18;
    }
    do
    {
      uint64_t v20 = *((void *)a2 + 10);
      if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)a2 + 11) - v20) >> 4) <= v17) {
        abort();
      }
      uint64_t v21 = v20 + v16;
      int v22 = *(_DWORD *)v21;
      double v23 = *(double *)(v21 + 8);
      long long v24 = *(_OWORD *)(v21 + 32);
      v26[0] = *(_OWORD *)(v21 + 16);
      v26[1] = v24;
      long long v25 = *(_OWORD *)(v21 + 64);
      v26[2] = *(_OWORD *)(v21 + 48);
      v26[3] = v25;
      TSUCustomFormat::addConditionalFormat((uint64_t)this, v22, v26, v23);
      ++v17;
      v16 += 80;
    }
    while (v19 != v17);
  }
}

void sub_2228487A4(_Unwind_Exception *a1)
{
  id v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 88) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

uint64_t TSUCustomFormat::addConditionalFormat(uint64_t a1, int a2, long long *a3, double a4)
{
  *(_DWORD *)(a1 + 8) = 270;
  long long v8 = (void *)*((void *)a3 + 1);
  if (!v8)
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger TSUCustomFormat::addConditionalFormat(TSUCustomFormatNumberFormatConditionType, double, TSUCustomFormatDataStruct)");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 156, @"Tried to set a null format.");
    if (*(_DWORD *)(a1 + 8) != 270) {
      return -1;
    }
    long long v8 = (void *)*((void *)a3 + 1);
  }
  *(void *)a3 = *(void *)a1;
  id v11 = v8;
  id v12 = *((id *)a3 + 2);
  id v13 = *((id *)a3 + 3);
  id v14 = *((id *)a3 + 4);
  *((unsigned char *)a3 + 56) |= 8u;
  long long v35 = *a3;
  long long v36 = a3[1];
  long long v37 = a3[2];
  long long v38 = a3[3];
  unint64_t v15 = *(void *)(a1 + 96);
  unint64_t v16 = *(void *)(a1 + 88);
  if (v16 >= v15)
  {
    uint64_t v18 = *(void *)(a1 + 80);
    unint64_t v19 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v16 - v18) >> 4);
    unint64_t v20 = v19 + 1;
    if (v19 + 1 > 0x333333333333333) {
      abort();
    }
    unint64_t v21 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v15 - v18) >> 4);
    if (2 * v21 > v20) {
      unint64_t v20 = 2 * v21;
    }
    if (v21 >= 0x199999999999999) {
      unint64_t v22 = 0x333333333333333;
    }
    else {
      unint64_t v22 = v20;
    }
    if (v22) {
      double v23 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TSUCustomFormatCondition>>(a1 + 96, v22);
    }
    else {
      double v23 = 0;
    }
    long long v25 = &v23[80 * v19];
    int v26 = &v23[80 * v22];
    *(_DWORD *)long long v25 = a2;
    *((_DWORD *)v25 + 1) = 0;
    *((double *)v25 + 1) = a4;
    *((_OWORD *)v25 + 1) = v35;
    *((_OWORD *)v25 + 2) = v36;
    *((_OWORD *)v25 + 3) = v37;
    *((_OWORD *)v25 + 4) = v38;
    unint64_t v17 = v25 + 80;
    uint64_t v28 = *(char **)(a1 + 80);
    id v27 = *(char **)(a1 + 88);
    if (v27 != v28)
    {
      do
      {
        *((_OWORD *)v25 - 5) = *((_OWORD *)v27 - 5);
        long long v29 = *((_OWORD *)v27 - 4);
        long long v30 = *((_OWORD *)v27 - 3);
        long long v31 = *((_OWORD *)v27 - 1);
        *((_OWORD *)v25 - 2) = *((_OWORD *)v27 - 2);
        *((_OWORD *)v25 - 1) = v31;
        *((_OWORD *)v25 - 4) = v29;
        *((_OWORD *)v25 - 3) = v30;
        v25 -= 80;
        v27 -= 80;
      }
      while (v27 != v28);
      id v27 = *(char **)(a1 + 80);
    }
    *(void *)(a1 + 80) = v25;
    *(void *)(a1 + 88) = v17;
    *(void *)(a1 + 96) = v26;
    if (v27) {
      operator delete(v27);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v16 = a2;
    *(_DWORD *)(v16 + 4) = 0;
    *(double *)(v16 + 8) = a4;
    *(_OWORD *)(v16 + 16) = v35;
    *(_OWORD *)(v16 + 32) = v36;
    unint64_t v17 = (char *)(v16 + 80);
    *(_OWORD *)(v16 + 48) = v37;
    *(_OWORD *)(v16 + 64) = v38;
  }
  *(void *)(a1 + 88) = v17;
  unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v17[-*(void *)(a1 + 80)] >> 4);
  if (v24 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    id v32 = +[TSUAssertionHandler currentHandler];
    uint64_t v33 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger TSUCustomFormat::addConditionalFormat(TSUCustomFormatNumberFormatConditionType, double, TSUCustomFormatDataStruct)");
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 168, @"condition list size overflow");
  }
  return v24;
}

uint64_t TSUCustomFormat::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    SFUtility::ObjcSharedPtr<NSString>::reset((void **)a1, *(void **)a2);
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
    id v4 = *(id *)(a2 + 24);
    id v5 = *(id *)(a2 + 32);
    id v6 = *(id *)(a2 + 40);
    id v7 = *(id *)(a2 + 48);

    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;

    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
    long long v8 = *(_OWORD *)(a2 + 64);
    long long v10 = *(_OWORD *)(a2 + 16);
    long long v9 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v8;
    *(_OWORD *)(a1 + 16) = v10;
    *(_OWORD *)(a1 + 32) = v9;
    *(void *)(a1 + 16) = *(void *)a1;
    uint64_t v11 = *(void *)(a1 + 88);
    uint64_t v12 = v11 - *(void *)(a1 + 80);
    if (v12)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      if ((unint64_t)(v12 / 80) <= 1) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = v12 / 80;
      }
      do
      {
        uint64_t v16 = *(void *)(a1 + 80);
        if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 88) - v16) >> 4) <= v14) {
          goto LABEL_16;
        }
        uint64_t v17 = v16 + v13;
        uint64_t v18 = *(void **)(v17 + 32);

        ++v14;
        v13 += 80;
      }
      while (v15 != v14);
      uint64_t v11 = *(void *)(a1 + 80);
    }
    *(void *)(a1 + 88) = v11;
    uint64_t v19 = *(void *)(a2 + 88) - *(void *)(a2 + 80);
    if (v19)
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0;
      unint64_t v22 = v19 / 80;
      if (v22 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v22;
      }
      while (1)
      {
        uint64_t v24 = *(void *)(a2 + 80);
        if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a2 + 88) - v24) >> 4) <= v21) {
          break;
        }
        uint64_t v25 = v24 + v20;
        int v26 = *(_DWORD *)v25;
        double v27 = *(double *)(v25 + 8);
        long long v28 = *(_OWORD *)(v25 + 32);
        v31[0] = *(_OWORD *)(v25 + 16);
        v31[1] = v28;
        long long v29 = *(_OWORD *)(v25 + 64);
        v31[2] = *(_OWORD *)(v25 + 48);
        v31[3] = v29;
        TSUCustomFormat::addConditionalFormat(a1, v26, v31, v27);
        ++v21;
        v20 += 80;
        if (v23 == v21) {
          return a1;
        }
      }
LABEL_16:
      abort();
    }
  }
  return a1;
}

void TSUCustomFormat::~TSUCustomFormat(id *this)
{
  this[3] = 0;
  this[4] = 0;

  this[5] = 0;
  this[6] = 0;
  uint64_t v3 = this[10];
  uint64_t v2 = this[11];
  if (v2 != v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    if ((unint64_t)((v2 - v3) / 80) <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = (v2 - v3) / 80;
    }
    do
    {
      if (0xCCCCCCCCCCCCCCCDLL * ((v2 - v3) >> 4) <= v5) {
        goto LABEL_15;
      }

      id v7 = this[10];
      if (0xCCCCCCCCCCCCCCCDLL * (((unsigned char *)this[11] - v7) >> 4) <= v5) {
        goto LABEL_15;
      }
      long long v8 = &v7[v4];
      *((void *)v8 + 3) = 0;

      long long v9 = this[10];
      if (0xCCCCCCCCCCCCCCCDLL * (((unsigned char *)this[11] - v9) >> 4) <= v5) {
        goto LABEL_15;
      }
      long long v10 = &v9[v4];
      *((void *)v10 + 4) = 0;

      uint64_t v11 = this[10];
      if (0xCCCCCCCCCCCCCCCDLL * (((unsigned char *)this[11] - v11) >> 4) <= v5
        || (uint64_t v12 = &v11[v4],
            *((void *)v12 + 5) = 0,
            *((id *)v12 + 6),
            uint64_t v3 = this[10],
            uint64_t v2 = this[11],
            0xCCCCCCCCCCCCCCCDLL * ((v2 - v3) >> 4) <= v5))
      {
LABEL_15:
        abort();
      }
      *(void *)&v3[v4 + 48] = 0;
      ++v5;
      v4 += 80;
    }
    while (v6 != v5);
    this[11] = v3;
    uint64_t v2 = v3;
    goto LABEL_13;
  }
  if (v2)
  {
LABEL_13:
    this[11] = v2;
    operator delete(v2);
  }
}

void sub_222848DC8(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 + 80);
  if (v3)
  {
    *(void *)(v1 + 88) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(a1);
}

void TSUCustomFormat::setFormatName(void **this, id a2)
{
  id v3 = a2;
  SFUtility::ObjcSharedPtr<NSString>::reset(this, a2);
}

uint64_t TSUCustomFormat::defaultFormatData(TSUCustomFormat *this)
{
  return (uint64_t)this + 16;
}

uint64_t TSUCustomFormat::formatName(TSUCustomFormat *this)
{
  return *(void *)this;
}

unint64_t TSUCustomFormat::conditionCount(TSUCustomFormat *this)
{
  return 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 11) - *((void *)this + 10)) >> 4);
}

uint64_t TSUCustomFormat::type(TSUCustomFormat *this)
{
  return *((unsigned int *)this + 2);
}

BOOL TSUCustomFormat::conditionalFormatAtIndex(uint64_t a1, unint64_t a2, _DWORD *a3, void *a4, int **a5)
{
  uint64_t v5 = *(void *)(a1 + 80);
  unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((*(void *)(a1 + 88) - v5) >> 4);
  if (v6 <= a2)
  {
    int v8 = 0;
    long long v10 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    id v7 = (int *)(v5 + 80 * a2);
    int v8 = *v7;
    uint64_t v9 = *((void *)v7 + 1);
    long long v10 = v7 + 4;
  }
  *a3 = v8;
  BOOL result = v6 > a2;
  *a4 = v9;
  *a5 = v10;
  return result;
}

uint64_t TSUCustomFormat::formatByEvaluatingConditionsWithDouble(TSUCustomFormat *this, double a2)
{
  if (*((_DWORD *)this + 2) != 270) {
    return 0;
  }
  uint64_t v3 = *((void *)this + 10);
  uint64_t v4 = *((void *)this + 11);
  if (v4 != v3)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    while (2)
    {
      uint64_t v8 = v3 + 80 * v6;
      double v9 = *(double *)(v8 + 8);
      switch(*(_DWORD *)v8)
      {
        case 0:
          if (vabdd_f64(a2, v9) >= 1.0e-14) {
            goto LABEL_15;
          }
          return v3 + 80 * v6 + 16;
        case 1:
          if (v9 > a2) {
            return v3 + 80 * v6 + 16;
          }
          goto LABEL_15;
        case 2:
          if (v9 >= a2) {
            return v3 + 80 * v6 + 16;
          }
          goto LABEL_15;
        case 3:
          if (v9 < a2) {
            return v3 + 80 * v6 + 16;
          }
          goto LABEL_15;
        case 4:
          if (v9 > a2) {
            goto LABEL_15;
          }
          return v3 + 80 * v6 + 16;
        default:
          id v10 = +[TSUAssertionHandler currentHandler];
          uint64_t v11 = [NSString stringWithUTF8String:"const TSUCustomFormatDataStruct *TSUCustomFormat::formatByEvaluatingConditionsWithDouble(double) const"];
          objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 243, @"Unexpected condition type in conditional number format!");
          uint64_t v3 = *((void *)this + 10);
          uint64_t v4 = *((void *)this + 11);
LABEL_15:
          uint64_t v6 = v7;
          if (0xCCCCCCCCCCCCCCCDLL * ((v4 - v3) >> 4) <= v7++) {
            return (uint64_t)this + 16;
          }
          continue;
      }
    }
  }
  return (uint64_t)this + 16;
}

BOOL TSUCustomFormat::customFormatIsEqual(TSUCustomFormat *this, TSUCustomFormat *a2)
{
  if (*((_DWORD *)this + 2) != *((_DWORD *)a2 + 2)
    || *((void *)this + 11) - *((void *)this + 10) != *((void *)a2 + 11) - *((void *)a2 + 10))
  {
    return 0;
  }
  uint64_t v4 = *(void **)this;
  if (*(void *)this && *(void *)a2)
  {
    unint64_t v5 = [v4 length];
    unint64_t v6 = [*(id *)a2 length];
    unint64_t v7 = v5 >= v6 ? v6 : v5;
    uint64_t v4 = objc_msgSend(*(id *)this, "compare:options:range:", *(void *)a2, 0, 0, v7);
    if (v4) {
      return 0;
    }
  }
  BOOL result = TSUCustomFormat::customFormatDataIsEqual((uint64_t)v4, (uint64_t)this + 16, (uint64_t)a2 + 16);
  if (result)
  {
    uint64_t v9 = *((void *)this + 11) - *((void *)this + 10);
    if (!v9) {
      return 1;
    }
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v12 = v9 / 80;
    if (v12 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    while (1)
    {
      uint64_t v14 = *((void *)a2 + 10);
      unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * ((*((void *)a2 + 11) - v14) >> 4);
      if (v15 > v11)
      {
        uint64_t v19 = v14 + v10;
        int v16 = *(_DWORD *)(v14 + v10);
        double v18 = *(double *)(v19 + 8);
        uint64_t v17 = v19 + 16;
      }
      else
      {
        int v16 = 0;
        uint64_t v17 = 0;
        double v18 = 0.0;
      }
      uint64_t v20 = *((void *)this + 10);
      if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 11) - v20) >> 4) <= v11) {
        break;
      }
      uint64_t v21 = v20 + v10;
      BOOL v22 = v15 > v11 && *(_DWORD *)v21 == v16;
      BOOL v23 = v22 && *(double *)(v21 + 8) == v18;
      if (!v23 || !TSUCustomFormat::customFormatDataIsEqual(result, v21 + 16, v17)) {
        break;
      }
      ++v11;
      v10 += 80;
      BOOL result = 1;
      if (v13 == v11) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

BOOL TSUCustomFormat::customFormatDataIsEqual(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (((*(unsigned char *)(a3 + 56) ^ *(unsigned char *)(a2 + 56)) & 0x3F) != 0
    || *(unsigned __int8 *)(a2 + 48) != *(unsigned __int8 *)(a3 + 48)
    || *(unsigned __int8 *)(a2 + 49) != *(unsigned __int8 *)(a3 + 49)
    || *(unsigned __int8 *)(a2 + 50) != *(unsigned __int8 *)(a3 + 50)
    || *(unsigned __int8 *)(a2 + 51) != *(unsigned __int8 *)(a3 + 51)
    || *(unsigned __int8 *)(a2 + 52) != *(unsigned __int8 *)(a3 + 52)
    || *(unsigned __int8 *)(a2 + 53) != *(unsigned __int8 *)(a3 + 53)
    || *(unsigned __int8 *)(a2 + 54) != *(unsigned __int8 *)(a3 + 54)
    || *(unsigned __int8 *)(a2 + 55) != *(unsigned __int8 *)(a3 + 55)
    || *(double *)(a2 + 40) != *(double *)(a3 + 40))
  {
    return 0;
  }
  unint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void *)(a3 + 8);
  if (v6)
  {
    if (([v6 isEqualToString:v7] & 1) == 0) {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  uint64_t v8 = *(void **)(a2 + 16);
  uint64_t v9 = *(void *)(a3 + 16);
  if (v8)
  {
    if (([v8 isEqualToString:v9] & 1) == 0) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  uint64_t v10 = *(void **)(a2 + 24);
  uint64_t v11 = *(void *)(a3 + 24);
  if (v10)
  {
    if (([v10 isEqualToArray:v11] & 1) == 0) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  unint64_t v12 = *(void **)(a2 + 32);
  uint64_t v13 = *(void *)(a3 + 32);
  if (v12) {
    return ([v12 isEqualToIndexSet:v13] & 1) != 0;
  }
  return !v13;
}

uint64_t TSUCustomFormat::customFormatNameIsEqual(void **this, TSUCustomFormat *a2)
{
  if (a2 && (uint64_t v2 = *this) != 0) {
    return [v2 isEqualToString:*(void *)a2];
  }
  else {
    return 0;
  }
}

uint64_t TSUCustomFormat::hash(id *this)
{
  return [this[3] hash] ^ *((int *)this + 2);
}

void TSUCustomFormat_TestCode(void)
{
  uint64_t v3 = 0;
  long long v2 = 0uLL;
  v0[0] = 0;
  *(_DWORD *)((char *)v0 + 3) = 0;
  v1[0] = 0;
  *(_DWORD *)((char *)v1 + 3) = 0;
  operator new();
}

void sub_222849974(_Unwind_Exception *a1)
{
  MEMORY[0x223C9EE80](v1, 0x10A0C40ADE6F494);
  _Unwind_Resume(a1);
}

void SFUtility::ObjcSharedPtr<NSString>::reset(void **a1, void *a2)
{
  if (*a1 != a2)
  {
    id v4 = a2;
    unint64_t v5 = *a1;
    *a1 = a2;
  }
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<TSUCustomFormatCondition>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(80 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void sub_222849F40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22284A604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_22284A8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22284AB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TSUCustomNumberFormatTokenIdentifierCharacterForTokenType(unsigned int a1)
{
  if (a1 >= 7)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"unichar TSUCustomNumberFormatTokenIdentifierCharacterForTokenType(TSUCustomNumberFormatTokenType)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 59, @"Invalid custom number format token type!");
    uint64_t v1 = &TSUCustomNumberFormatTokenScaleIdentifierCharacter;
  }
  else
  {
    uint64_t v1 = (&off_26462A558)[a1];
  }
  return (unsigned __int16)*v1;
}

uint64_t TSUPerformBlockOnNextRunloop(void *a1)
{
  id v1 = (id)[a1 copy];
  return [v1 performSelector:sel_tsu_runBlock withObject:0 afterDelay:0.0];
}

void sub_22284C400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t AMOFullMethodName(uint64_t a1, const char *a2)
{
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = NSString;
  if (v4 == a1) {
    return [NSString stringWithFormat:@"+[%@ %@]", a1, NSStringFromSelector(a2)];
  }
  uint64_t v6 = objc_opt_class();
  return [v5 stringWithFormat:@"-[%@ %@]", v6, NSStringFromSelector(a2)];
}

BOOL SFUEqualCryptoKeys(unint64_t a1, unint64_t a2)
{
  if (!(a1 | a2)) {
    return 1;
  }
  BOOL result = 0;
  BOOL v5 = a1 != 0;
  if (a2) {
    BOOL v6 = a1 != 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (a2) {
    BOOL v5 = 0;
  }
  if (!v5 && v6)
  {
    size_t v7 = [(id)a1 keyLength];
    return v7 == [(id)a2 keyLength]
        && memcmp((const void *)[(id)a1 keyData], (const void *)objc_msgSend((id)a2, "keyData"), v7) == 0;
  }
  return result;
}

void sub_22284ED94(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t SFUDeriveAes128Key(uint64_t a1, unint64_t a2, unsigned int a3, char *a4, uint64_t a5, void *a6, size_t a7)
{
  if (a4) {
    BOOL v7 = a5 == 16;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v10 = v7 && a1 != 0 && a3 >= 0x3E8 && HIDWORD(a2) == 0;
  int v11 = !v10;
  if (v10)
  {
    unsigned int v14 = a5;
    uint64_t v19 = a7 + 4;
    if (a7 + 4 <= 0x14) {
      uint64_t v19 = 20;
    }
    uint64_t v20 = (char *)malloc_type_calloc(1uLL, v19 + 40, 0x236D5F05uLL);
    pbkdf2((uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, char *))hmacsha1, 20, a1, a2, a6, a7, a3, a4, v14, v20);
    free(v20);
  }
  return v11 ^ 1u;
}

void hmacsha1(const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void sub_222851730()
{
}

void sub_2228517B8()
{
}

uint64_t SFUXmlReaderIORead(void *a1, uint64_t a2, int a3)
{
  uint64_t v3 = [a1 readToBuffer:a2 size:a3];
  if (v3 >= 0x80000000)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "int SFUXmlReaderIORead(void *, char *, int)");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 557, @"Overflow in SFUXmlReaderIORead");
  }
  return v3;
}

uint64_t SFUXmlReaderIOClose(void *a1)
{
  return 0;
}

void sub_222851C14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    id v11 = +[TSUAssertionHandler currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[SFUDataRepresentation readIntoData:]"];
    [v11 handleFailureInFunction:v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 283, @"Caught exception trying to read storage into NSMutableData: %@" file lineNumber description];
    [v9 setLength:v10];
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_222851DD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222851E94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SFUCGDataProviderGetBytes(void *a1, const char *a2, uint64_t a3)
{
  return [a1 readToBuffer:a2 size:a3];
}

uint64_t SFUCGDataProviderSkipForward(void *a1, uint64_t a2)
{
  uint64_t v4 = [a1 offset];
  [a1 seekToOffset:v4 + a2];
  return [a1 offset] - v4;
}

uint64_t SFUCGDataProviderRewind(void *a1, const char *a2)
{
  return [a1 seekToOffset:0];
}

void SFUCGDataProviderReleaseInfo(void *a1)
{
  [a1 closeLocalStream];
}

void sub_222852530(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2228527F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222852BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

FILE *SFUFileOpen(void *a1, const char *a2)
{
  uint64_t v3 = fopen((const char *)[a1 fileSystemRepresentation], a2);
  if (!v3) {
    [MEMORY[0x263EFF940] errnoRaise:@"SFUFileOpenError", @"Could not open %@", a1 format];
  }
  return v3;
}

FILE *SFUFdOpen(uint64_t a1, const char *a2)
{
  uint64_t v3 = fdopen(a1, a2);
  if (!v3) {
    objc_msgSend(MEMORY[0x263EFF940], "errnoRaise:format:", @"SFUFdOpenError", @"Could not fdopen %d", a1);
  }
  return v3;
}

uint64_t SFUOpen(void *a1, int a2, unsigned int a3)
{
  uint64_t v4 = open((const char *)[a1 fileSystemRepresentation], a2, a3);
  if (v4 == -1) {
    [MEMORY[0x263EFF940] errnoRaise:@"SFUOpenError", @"Could not open %@", a1 format];
  }
  return v4;
}

uint64_t SFUDup(uint64_t a1)
{
  uint64_t v2 = dup(a1);
  if (v2 == -1) {
    objc_msgSend(MEMORY[0x263EFF940], "errnoRaise:format:", @"SFUDupError", @"Could not dup %d", a1);
  }
  return v2;
}

void sub_222853C50(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_222854130(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    free(v3);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t TSUStandardizedAPFSPath(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "pathComponents");
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v1);
        }
        BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![v7 isEqualToString:@"/"])
        {
          if (![v7 fileSystemRepresentation]) {
            continue;
          }
          if (APFSMakeCompatibleName()) {
            continue;
          }
          BOOL v7 = (void *)[NSString stringWithUTF8String:0];
          if (![v7 length]) {
            continue;
          }
        }
        [v2 addObject:v7];
      }
      uint64_t v4 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  uint64_t v8 = [v2 count];
  if (v8 == [v1 count]) {
    return [NSString pathWithComponents:v2];
  }
  else {
    return 0;
  }
}

uint64_t TSUOpen(void *a1, int a2, unsigned int a3)
{
  BOOL v6 = (const char *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "fileSystemRepresentation");
  if (!v6 || (uint64_t result = open(v6, a2, a3), result == -1))
  {
    if (*__error() == 92
      && (uint64_t v8 = (const char *)[(id)TSUStandardizedAPFSPath(a1) fileSystemRepresentation]) != 0)
    {
      return open(v8, a2, a3);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t TSULink(void *a1, void *a2)
{
  uint64_t v4 = (const char *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "fileSystemRepresentation");
  uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(a2, "stringByStandardizingPath"), "fileSystemRepresentation");
  if (!v4 || !v5 || (uint64_t result = link(v4, v5), result == -1))
  {
    if (*__error() == 92)
    {
      BOOL v7 = (const char *)[(id)TSUStandardizedAPFSPath(a1) fileSystemRepresentation];
      uint64_t v8 = (const char *)[(id)TSUStandardizedAPFSPath(a2) fileSystemRepresentation];
      uint64_t result = 0xFFFFFFFFLL;
      if (v7 && v8)
      {
        return link(v7, v8);
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t TSUMkdir(void *a1, mode_t a2)
{
  uint64_t v4 = (const char *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "fileSystemRepresentation");
  if (!v4 || (uint64_t result = mkdir(v4, a2), result == -1))
  {
    if (*__error() == 92
      && (BOOL v6 = (const char *)[(id)TSUStandardizedAPFSPath(a1) fileSystemRepresentation]) != 0)
    {
      return mkdir(v6, a2);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void sub_222854B24(void *a1)
{
  objc_begin_catch(a1);
  free(v1);
  objc_exception_rethrow();
}

void sub_222854B38(_Unwind_Exception *a1)
{
}

void sub_222855980(_Unwind_Exception *a1)
{
}

void sub_2228559A0(void *a1)
{
}

void sub_222855A40(_Unwind_Exception *a1)
{
}

void sub_222855A60(void *a1)
{
}

void sub_222855BB8(_Unwind_Exception *a1)
{
}

void sub_2228561AC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x222856160);
  }
  _Unwind_Resume(a1);
}

void sub_2228563D4(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_222857068(void *a1)
{
}

uint64_t SFUZipCurrentDosTime()
{
  time_t v4 = time(0);
  CFLocaleRef v0 = localtime(&v4);
  tm_unsigned int year = v0->tm_year;
  int v2 = (tm_year << 25) + 1610612736;
  if (tm_year <= 81) {
    int v2 = 0x2000000;
  }
  return v2 | ((v0->tm_mon << 21) + 0x200000) | (v0->tm_mday << 16) | (v0->tm_hour << 11) | (32 * v0->tm_min) | (v0->tm_sec >> 1);
}

void sub_222858620(_Unwind_Exception *a1)
{
}

void sub_222858640(void *a1)
{
}

uint64_t SFUSimpleXmlOutputWriteCallback(void *a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t SFUSimpleXmlOutputCloseCallback()
{
  return 0;
}

void sub_222859A80(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_222859EF0(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_22285A4B8(void *a1)
{
  objc_begin_catch(a1);
  fclose(v1);
  objc_exception_rethrow();
}

void sub_22285A4D0(_Unwind_Exception *a1)
{
}

void sub_22285AB60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22285AC24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22285C960(_Unwind_Exception *a1)
{
}

uint64_t SFUHash(char *a1, uint64_t a2)
{
  return SFUHashWithSeed(a1, a2, 2166136261);
}

uint64_t SFUHashWithSeed(char *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    do
    {
      unsigned int v4 = *a1++;
      a3 = (16777619 * a3) ^ v4;
      --a2;
    }
    while (a2);
  }
  else
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "unsigned int SFUHashWithSeed(const char *, size_t, unsigned int)");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUHash.m"), 24, @"SFUHash must have at least one byte of input.");
  }
  return a3;
}

void SFUStopwatch::SFUStopwatch(SFUStopwatch *this, const char *a2, int a3)
{
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *(void *)this = a2;
  if (!SFUStopwatch::smInitialized) {
    SFUStopwatch::Initialize(this);
  }
  if (a3)
  {
    if (!*((_DWORD *)this + 8))
    {
      *((double *)this + 5) = SFUStopwatch::GetMicroseconds(this);
      *((_DWORD *)this + 8) = 1;
    }
  }
}

void sub_22285DF58(_Unwind_Exception *exception_object)
{
  unsigned int v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

double SFUStopwatch::Initialize(SFUStopwatch *this)
{
  uint64_t v1 = (SFUStopwatch *)mach_timebase_info(&info);
  LODWORD(v3) = info.numer;
  LODWORD(v2) = info.denom;
  *(double *)&SFUStopwatch::smDivisor = (double)v2 / (double)v3 * 1000.0;
  SFUStopwatch::smInitialized = 1;
  double Microseconds = SFUStopwatch::GetMicroseconds(v1);
  double result = (SFUStopwatch::GetMicroseconds(v5) - Microseconds) / 10.0;
  SFUStopwatch::smMethodCallOverhead = *(void *)&result;
  return result;
}

void SFUStopwatch::Start(SFUStopwatch *this)
{
  if (!*((_DWORD *)this + 8))
  {
    *((double *)this + 5) = SFUStopwatch::GetMicroseconds(this);
    *((_DWORD *)this + 8) = 1;
  }
}

void SFUStopwatch::~SFUStopwatch(SFUStopwatch *this)
{
  if (*((_DWORD *)this + 8) == 1)
  {
    *((double *)this + 6) = SFUStopwatch::GetMicroseconds(this);
    *((_DWORD *)this + 8) = 2;
  }
  unint64_t v2 = (void *)*((void *)this + 1);
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

void sub_22285E07C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)(v1 + 8);
  if (v3)
  {
    *(void *)(v1 + 16) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void SFUStopwatch::Stop(SFUStopwatch *this)
{
  if (*((_DWORD *)this + 8) == 1)
  {
    *((double *)this + 6) = SFUStopwatch::GetMicroseconds(this);
    *((_DWORD *)this + 8) = 2;
  }
}

double SFUStopwatch::GetMicroseconds(SFUStopwatch *this)
{
  uint64_t v1 = (SFUStopwatch *)mach_absolute_time();
  unint64_t v2 = (unint64_t)v1;
  if (!SFUStopwatch::smInitialized) {
    SFUStopwatch::Initialize(v1);
  }
  return (double)v2 / *(double *)&SFUStopwatch::smDivisor;
}

uint64_t SFUStopwatch::Reset(uint64_t this)
{
  *(_DWORD *)(this + 32) = 0;
  *(void *)(this + 40) = 0;
  *(void *)(this + 48) = 0;
  return this;
}

void SFUStopwatch::Lap(double **this)
{
  double Microseconds = SFUStopwatch::GetMicroseconds((SFUStopwatch *)this);
  if (*((_DWORD *)this + 8) == 1)
  {
    double v3 = Microseconds;
    unint64_t v4 = (unint64_t)this[3];
    id v5 = this[2];
    if ((unint64_t)v5 >= v4)
    {
      BOOL v7 = this[1];
      uint64_t v8 = v5 - v7;
      unint64_t v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 61) {
        abort();
      }
      uint64_t v10 = v4 - (void)v7;
      if (v10 >> 2 > v9) {
        unint64_t v9 = v10 >> 2;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v9;
      }
      if (v11)
      {
        long long v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>((uint64_t)(this + 3), v11);
        BOOL v7 = this[1];
        id v5 = this[2];
      }
      else
      {
        long long v12 = 0;
      }
      long long v13 = (double *)&v12[8 * v8];
      unsigned int v14 = (double *)&v12[8 * v11];
      *long long v13 = v3;
      uint64_t v6 = v13 + 1;
      while (v5 != v7)
      {
        uint64_t v15 = *((void *)v5-- - 1);
        *((void *)v13-- - 1) = v15;
      }
      this[1] = v13;
      this[2] = v6;
      this[3] = v14;
      if (v7) {
        operator delete(v7);
      }
    }
    else
    {
      double *v5 = Microseconds;
      uint64_t v6 = v5 + 1;
    }
    this[2] = v6;
  }
}

double SFUStopwatch::StartTime(SFUStopwatch *this)
{
  if (*((int *)this + 8) < 1) {
    return -1.0;
  }
  else {
    return *((double *)this + 5);
  }
}

double SFUStopwatch::StopTime(SFUStopwatch *this)
{
  if (*((int *)this + 8) < 1) {
    return -1.0;
  }
  else {
    return *((double *)this + 6);
  }
}

double SFUStopwatch::ElapsedTime(SFUStopwatch *this)
{
  double v1 = -1.0;
  if (*((_DWORD *)this + 8) == 2) {
    double v1 = *((double *)this + 6) - *((double *)this + 5);
  }
  double result = v1 - *(double *)&SFUStopwatch::smMethodCallOverhead;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

uint64_t SFUStopwatch::Laps(SFUStopwatch *this)
{
  return (uint64_t)(*((void *)this + 2) - *((void *)this + 1)) >> 3;
}

double SFUStopwatch::LapTime(SFUStopwatch *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 1);
  double result = -1.0;
  if (a2 <= (*((void *)this + 2) - v2) >> 3) {
    return *(double *)(v2 + 8 * a2 - 8);
  }
  return result;
}

void SFUStopwatch::LogElapsedTime(SFUStopwatch *this)
{
  double v1 = -1.0;
  if (*((_DWORD *)this + 8) == 2) {
    double v1 = *((double *)this + 6) - *((double *)this + 5);
  }
  double v2 = v1 - *(double *)&SFUStopwatch::smMethodCallOverhead;
  if (v2 < 0.0) {
    double v3 = 0.0;
  }
  else {
    double v3 = v2;
  }
  uint64_t v4 = v3 > 1000.0;
  double v5 = v3 / 1000.0;
  if (v3 <= 1000.0) {
    double v5 = v3;
  }
  if (v5 > 1000.0)
  {
    uint64_t v4 = 2;
    if (v3 <= 1000.0) {
      uint64_t v4 = 1;
    }
    double v5 = v5 / 1000.0;
  }
  NSLog((NSString *)@"%s: %p [ %f %s ]", *(void *)this, this, *(void *)&v5, off_26462A670[v4]);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

uint64_t (*pbkdf2(uint64_t (*result)(uint64_t, uint64_t, char *, uint64_t, char *), uint64_t a2, uint64_t a3, uint64_t a4, void *__src, size_t __n, unsigned int a7, char *a8, unsigned int a9, char *a10))(uint64_t, uint64_t, char *, uint64_t, char *)
{
  int v16 = result;
  uint64_t v17 = a9 / a2;
  double v18 = &a10[a2];
  size_t v24 = a9 % a2;
  if (a2 <= a9)
  {
    uint64_t v25 = a2;
    unsigned int v19 = 1;
    do
    {
      int v26 = a8;
      BOOL v23 = a8;
      uint64_t v20 = a2;
      uint64_t v21 = v18;
      uint64_t v22 = v17;
      double result = (uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, char *))F(v16, a2, a3, a4, __src, __n, a7, v19, v23, v18);
      uint64_t v17 = v22;
      double v18 = v21;
      a2 = v20;
      a8 = &v26[v25];
      ++v19;
    }
    while (v19 <= v17);
  }
  else
  {
    unsigned int v19 = 1;
  }
  if (v24)
  {
    F(v16, a2, a3, a4, __src, __n, a7, v19, a10, v18);
    return (uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, char *))memcpy(a8, a10, v24);
  }
  return result;
}

void *F(uint64_t (*a1)(uint64_t, uint64_t, char *, uint64_t, char *), uint64_t a2, uint64_t a3, uint64_t a4, void *__src, size_t __n, unsigned int a7, int a8, void *a9, char *a10)
{
  int v11 = __n;
  size_t v16 = a2;
  uint64_t v17 = a10;
  double v18 = &a10[a2];
  memcpy(v18, __src, __n);
  v18[v11] = HIBYTE(a8);
  v18[v11 + 1] = BYTE2(a8);
  v18[v11 + 2] = BYTE1(a8);
  v18[v11 + 3] = a8;
  a1(a3, a4, v18, (v11 + 4), a10);
  size_t v19 = v16;
  double result = memcpy(a9, a10, v16);
  if (a7 >= 2)
  {
    unsigned int v21 = 2;
    do
    {
      uint64_t v22 = v18;
      double result = (void *)a1(a3, a4, v17, a2, v18);
      if (a2)
      {
        size_t v23 = v19;
        size_t v24 = a9;
        uint64_t v25 = v18;
        do
        {
          char v26 = *v25++;
          *v24++ ^= v26;
          --v23;
        }
        while (v23);
      }
      ++v21;
      double v18 = v17;
      uint64_t v17 = v22;
    }
    while (v21 <= a7);
  }
  return result;
}

double TSUCPUUsed(mach_msg_type_number_t *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  thread_act_array_t act_list = 0;
  mach_msg_type_number_t act_listCnt = 0;
  mach_error_t v2 = task_threads(*MEMORY[0x263EF8960], &act_list, &act_listCnt);
  if (v2)
  {
    double v3 = mach_error_string(v2);
    NSLog((NSString *)@"Unable to get threads: %s", v3);
    return 0.0;
  }
  mach_msg_type_number_t v5 = act_listCnt;
  if (!act_listCnt)
  {
    double v4 = 0.0;
    if (!a1) {
      return v4;
    }
    goto LABEL_10;
  }
  unint64_t v6 = 0;
  double v4 = 0.0;
  do
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)thread_info_out = 0u;
    long long v12 = 0u;
    mach_msg_type_number_t thread_info_outCnt = 32;
    if (!thread_info(act_list[v6], 3u, thread_info_out, &thread_info_outCnt) && (BYTE12(v12) & 2) == 0) {
      double v4 = v4 + (double)(int)v12 / 1000.0 * 100.0;
    }
    ++v6;
    mach_msg_type_number_t v5 = act_listCnt;
  }
  while (v6 < act_listCnt);
  if (a1) {
LABEL_10:
  }
    *a1 = v5;
  return v4;
}

void TSULogSink(uint64_t a1, NSString *format, ...)
{
  va_start(va, format);
  if (g_logSinkBlock) {
    (*(void (**)(void))(g_logSinkBlock + 16))();
  }
  else {
    NSLogv(format, va);
  }
}

void *TSULogSinkSetBlock(void *aBlock)
{
  double result = (void *)g_logSinkBlock;
  if ((void *)g_logSinkBlock != aBlock)
  {
    if (g_logSinkBlock) {
      _Block_release((const void *)g_logSinkBlock);
    }
    if (aBlock) {
      double result = _Block_copy(aBlock);
    }
    else {
      double result = 0;
    }
    g_logSinkBlock = (uint64_t)result;
  }
  return result;
}

void sub_222862E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_222864848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_22286536C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

void sub_2228657B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_222865E04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22286A95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 128), 8);
  _Block_object_dispose((const void *)(v10 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_22286B7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t APFSMakeCompatibleName()
{
  return MEMORY[0x270F08AD8]();
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x270EFB900](a, b);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78C8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78E8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x270ED7930](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x270EE4288](tz, at);
  result.second = v3;
  result.unsigned int year = v2;
  result.month = BYTE4(v2);
  result.daCGFloat y = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4868](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x270EE4878](allocator, tmplate, options, locale);
}

CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return (CFDateRef)MEMORY[0x270EE4880](allocator, formatter, string, rangep);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x270EE4890](allocator, formatter, at);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x270EE4898](allocator, formatter, date);
}

Boolean CFDateFormatterGetAbsoluteTimeFromString(CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep, CFAbsoluteTime *atp)
{
  return MEMORY[0x270EE48A0](formatter, string, rangep, atp);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x270EE48A8](formatter);
}

CFLocaleRef CFDateFormatterGetLocale(CFDateFormatterRef formatter)
{
  return (CFLocaleRef)MEMORY[0x270EE48B0](formatter);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE4938](theDict, key);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  MEMORY[0x270EE4A40](*(void *)&gdate.year, *(void *)&gdate.second, tz);
  return result;
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

CFArrayRef CFLocaleCopyCommonISOCurrencyCodes(void)
{
  return (CFArrayRef)MEMORY[0x270EE4A58]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFStringRef CFLocaleCopyDisplayNameForPropertyValue(CFLocaleRef displayLocale, CFLocaleKey key, CFStringRef value)
{
  return (CFStringRef)MEMORY[0x270EE4A68](displayLocale, key, value);
}

CFArrayRef CFLocaleCopyISOCurrencyCodes(void)
{
  return (CFArrayRef)MEMORY[0x270EE4A70]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4A90](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x270EE4A98](allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AA8](allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4B20](cf);
}

CFTypeRef CFNumberFormatterCopyProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4BF0](formatter, key);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x270EE4BF8](allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr)
{
  return (CFStringRef)MEMORY[0x270EE4C10](allocator, formatter, numberType, valuePtr);
}

Boolean CFNumberFormatterGetDecimalInfoForCurrencyCode(CFStringRef currencyCode, int32_t *defaultFractionDigits, double *roundingIncrement)
{
  return MEMORY[0x270EE4C18](currencyCode, defaultFractionDigits, roundingIncrement);
}

CFStringRef CFNumberFormatterGetFormat(CFNumberFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x270EE4C20](formatter);
}

Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFNumberType numberType, void *valuePtr)
{
  return MEMORY[0x270EE4C30](formatter, string, rangep, numberType, valuePtr);
}

void CFNumberFormatterSetFormat(CFNumberFormatterRef formatter, CFStringRef formatString)
{
}

void CFNumberFormatterSetProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key, CFTypeRef value)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x270EE4F50](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x270EE4F58](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F68](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

Boolean CFSetGetValueIfPresent(CFSetRef theSet, const void *candidate, const void **value)
{
  return MEMORY[0x270EE4F88](theSet, candidate, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x270EE5068](*(void *)&encoding);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x270EE5210]();
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52E0]();
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52F8](allocator, ti);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53D0](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGContextRef CGBitmapContextCreateWithData(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo, CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo)
{
  return (CGContextRef)MEMORY[0x270EE5A10](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo, releaseCallback);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5B58](color);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B68](color, alpha);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B90](space, pattern, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x270EE5B98](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C50]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C90](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateSequential(void *info, const CGDataProviderSequentialCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x270EE62C8](info, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x270EE62F0](url);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x270EE6748](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x270EE7110](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFStringRef CTFontCopyFamilyName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE9A28](font);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE9A78](font);
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x270EE9AB8](font, matrix, attributes, size);
}

CTFontRef CTFontCreateCopyWithSymbolicTraits(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontRef)MEMORY[0x270EE9AC0](font, matrix, *(void *)&symTraitValue, *(void *)&symTraitMask, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AF8](name, matrix, size);
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x270EE9BE8](font);
  return result;
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  MEMORY[0x270EE9C00](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x270EE9C10](font);
  return result;
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x270EE9C40](font);
  return result;
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  MEMORY[0x270EE9CA0](font);
  return result;
}

void NSDeallocateObject(id object)
{
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x270EE5598](typePtr, sizep, alignp);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

void NSLogv(NSString *format, va_list args)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x270EF2C80](zone, size);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F05600](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void UIRectFill(CGRect rect)
{
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x270EE8570](inUTI, inTagClass);
}

CFArrayRef UTTypeCreateAllIdentifiersForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFArrayRef)MEMORY[0x270EE8578](inTagClass, inTag, inConformingToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x270EE8580](inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x270ED7DE8](a1);
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x270ED8730](a1, *(void *)&a2);
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x270F9A428](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x270F9A468](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x270ED92B8](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x270ED92E0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x270ED92E8](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x270ED92F0](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_io_barrier(dispatch_io_t channel, dispatch_block_t barrier)
{
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x270ED9390](type, *(void *)&fd, queue, cleanup_handler);
}

dispatch_io_t dispatch_io_create_with_io(dispatch_io_type_t type, dispatch_io_t io, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x270ED9398](type, io, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return (char *)MEMORY[0x270ED97C0](a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270ED9B20](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x270F9C6D0](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x270F9C6E0](*(void *)&fd, mode);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x270F9C718](file, buf, *(void *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x270F9C728](file, buf, *(void *)&len);
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x270ED9E20](*(void *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x270ED9E40](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x270EDA068](a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x270EDA340]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D8](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x270F9AA60](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
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

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x270F9B680](a1, *(void *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x270F9B700](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x270F9B7F8](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

void srand(unsigned int a1)
{
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

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x270EDB8B0](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x270EDB8F8](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return (xmlParserCtxtPtr)MEMORY[0x270F9BBC8](sax, user_data, chunk, *(void *)&size, filename);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x270F9BF90](ctxt, chunk, *(void *)&size, *(void *)&terminate);
}

xmlTextReaderPtr xmlReaderForIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void *ioctx, const char *URL, const char *encoding, int options)
{
  return (xmlTextReaderPtr)MEMORY[0x270F9BFE8](ioread, ioclose, ioctx, URL, encoding, *(void *)&options);
}