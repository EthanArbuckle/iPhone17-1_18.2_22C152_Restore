void ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke_5(void *a1, int a2)
{
  std::__shared_weak_count *v3;
  os_unfair_lock_s *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  uint64_t vars8;

  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    v5 = (os_unfair_lock_s *)a1[4];
    v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      v7 = v6;
      if (a2 && a1[5]) {
        mav_router::device::pci_shim::handleError(v5);
      }
      if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
}

void sub_2192A5F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t mav_router_service_transmit(uint64_t a1, unsigned int a2, void *a3)
{
  if (!a1) {
    return 1;
  }
  if (*(_DWORD *)a1 <= a2) {
    return 1;
  }
  v4 = *(unsigned int **)(*(void *)(a1 + 8) + 48 * a2 + 8);
  if (!v4) {
    return 3;
  }
  v5 = (uint64_t (*)(uint64_t, uint64_t, void, void))*((void *)v4 + 3);
  if (!v5) {
    return 4;
  }
  uint64_t v6 = *v4;
  if (*(_DWORD *)(a1 + 4) <= v6) {
    return 1;
  }
  if (*(_DWORD *)(*(void *)(a1 + 16) + 40 * v6 + 16) >= 2u)
  {
    v9[1] = a3;
    v9[0] = a2;
    if (mav_mux_encode((uint64_t)v9)) {
      return 1;
    }
    v5 = (uint64_t (*)(uint64_t, uint64_t, void, void))*((void *)v4 + 3);
    uint64_t v6 = *v4;
  }
  return v5(a1, v6, *a3, *((void *)v4 + 4));
}

uint64_t mav_router::device::shim::handle_transmit_static(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a4 + 16))(a4, a3);
}

void mav_router::device::pci_shim::dtor(mav_router::device::pci_shim *this, void *a2)
{
  os_unfair_lock_lock(&mav_router::device::pci_shim::mapLock);
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&_MergedGlobals))
  {
    qword_26AB7A100 = 0;
    qword_26AB7A0F8 = 0;
    qword_26AB7A0F0 = (uint64_t)&qword_26AB7A0F8;
    __cxa_guard_release(&_MergedGlobals);
  }
  uint64_t v3 = qword_26AB7A0F8;
  if (!qword_26AB7A0F8) {
    goto LABEL_13;
  }
  v4 = &qword_26AB7A0F8;
  uint64_t v5 = qword_26AB7A0F8;
  do
  {
    unint64_t v6 = *(void *)(v5 + 32);
    BOOL v7 = v6 >= (unint64_t)this;
    if (v6 >= (unint64_t)this) {
      v8 = (uint64_t *)v5;
    }
    else {
      v8 = (uint64_t *)(v5 + 8);
    }
    if (v7) {
      v4 = (uint64_t *)v5;
    }
    uint64_t v5 = *v8;
  }
  while (*v8);
  if (v4 == &qword_26AB7A0F8 || v4[4] > (unint64_t)this) {
LABEL_13:
  }
    v4 = &qword_26AB7A0F8;
  uint64_t v9 = v4[1];
  if (v9)
  {
    v10 = (uint64_t *)v4[1];
    do
    {
      v11 = v10;
      v10 = (uint64_t *)*v10;
    }
    while (v10);
  }
  else
  {
    v12 = v4;
    do
    {
      v11 = (uint64_t *)v12[2];
      BOOL v23 = *v11 == (void)v12;
      v12 = v11;
    }
    while (!v23);
  }
  if ((uint64_t *)qword_26AB7A0F0 == v4) {
    qword_26AB7A0F0 = (uint64_t)v11;
  }
  v13 = v4[5];
  --qword_26AB7A100;
  if (*v4)
  {
    if (v9)
    {
      do
      {
        uint64_t v14 = v9;
        uint64_t v9 = *(void *)v9;
      }
      while (v9);
      uint64_t v9 = *(void *)(v14 + 8);
      if (!v9)
      {
LABEL_29:
        int v15 = 1;
        v16 = *(uint64_t **)(v14 + 16);
        uint64_t v17 = *v16;
        if (*v16 == v14) {
          goto LABEL_30;
        }
LABEL_35:
        v16[1] = v9;
        int v18 = *(unsigned __int8 *)(v14 + 24);
        if ((uint64_t *)v14 == v4) {
          goto LABEL_40;
        }
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v9 = *v4;
      uint64_t v14 = (uint64_t)v4;
    }
  }
  else
  {
    uint64_t v14 = (uint64_t)v4;
    if (!v9) {
      goto LABEL_29;
    }
  }
  int v15 = 0;
  *(void *)(v9 + 16) = *(void *)(v14 + 16);
  v16 = *(uint64_t **)(v14 + 16);
  uint64_t v17 = *v16;
  if (*v16 != v14) {
    goto LABEL_35;
  }
LABEL_30:
  uint64_t *v16 = v9;
  if (v14 != v3)
  {
    uint64_t v17 = v16[1];
    int v18 = *(unsigned __int8 *)(v14 + 24);
    if ((uint64_t *)v14 == v4) {
      goto LABEL_40;
    }
LABEL_36:
    uint64_t v19 = v4[2];
    *(void *)(v14 + 16) = v19;
    *(void *)(v19 + 8 * (*(void *)v4[2] != (void)v4)) = v14;
    uint64_t v21 = *v4;
    uint64_t v20 = v4[1];
    *(void *)(v21 + 16) = v14;
    *(void *)uint64_t v14 = v21;
    *(void *)(v14 + 8) = v20;
    if (v20) {
      *(void *)(v20 + 16) = v14;
    }
    *(unsigned char *)(v14 + 24) = *((unsigned char *)v4 + 24);
    if ((uint64_t *)v3 == v4) {
      uint64_t v3 = v14;
    }
    goto LABEL_40;
  }
  uint64_t v17 = 0;
  uint64_t v3 = v9;
  int v18 = *(unsigned __int8 *)(v14 + 24);
  if ((uint64_t *)v14 != v4) {
    goto LABEL_36;
  }
LABEL_40:
  if (!v18 || !v3) {
    goto LABEL_99;
  }
  if (!v15)
  {
    *(unsigned char *)(v9 + 24) = 1;
    goto LABEL_99;
  }
  while (1)
  {
    v24 = *(void ***)(v17 + 16);
    if (*v24 != (void *)v17) {
      break;
    }
    if (*(unsigned char *)(v17 + 24))
    {
      uint64_t v26 = *(void *)v17;
      if (*(void *)v17) {
        goto LABEL_72;
      }
    }
    else
    {
      *(unsigned char *)(v17 + 24) = 1;
      *((unsigned char *)v24 + 24) = 0;
      v30 = *(void **)(v17 + 8);
      *v24 = v30;
      if (v30) {
        v30[2] = v24;
      }
      *(void *)(v17 + 16) = v24[2];
      v24[2][*v24[2] != (void)v24] = v17;
      *(void *)(v17 + 8) = v24;
      v24[2] = (void *)v17;
      if ((void **)v3 == v24) {
        uint64_t v3 = v17;
      }
      uint64_t v17 = (uint64_t)*v24;
      uint64_t v26 = **v24;
      if (v26)
      {
LABEL_72:
        if (!*(unsigned char *)(v26 + 24)) {
          goto LABEL_94;
        }
      }
    }
    uint64_t v31 = *(void *)(v17 + 8);
    if (v31 && !*(unsigned char *)(v31 + 24))
    {
      if (v26 && !*(unsigned char *)(v26 + 24))
      {
LABEL_94:
        uint64_t v31 = v17;
      }
      else
      {
        *(unsigned char *)(v31 + 24) = 1;
        *(unsigned char *)(v17 + 24) = 0;
        uint64_t v32 = *(void *)v31;
        *(void *)(v17 + 8) = *(void *)v31;
        if (v32) {
          *(void *)(v32 + 16) = v17;
        }
        *(void *)(v31 + 16) = *(void *)(v17 + 16);
        *(void *)(*(void *)(v17 + 16) + 8 * (**(void **)(v17 + 16) != v17)) = v31;
        *(void *)uint64_t v31 = v17;
        *(void *)(v17 + 16) = v31;
        uint64_t v26 = v17;
      }
      uint64_t v34 = *(void *)(v31 + 16);
      *(unsigned char *)(v31 + 24) = *(unsigned char *)(v34 + 24);
      *(unsigned char *)(v34 + 24) = 1;
      *(unsigned char *)(v26 + 24) = 1;
      v35 = *(uint64_t **)v34;
      uint64_t v37 = *(void *)(*(void *)v34 + 8);
      *(void *)uint64_t v34 = v37;
      if (v37) {
        *(void *)(v37 + 16) = v34;
      }
      v35[2] = *(void *)(v34 + 16);
      *(void *)(*(void *)(v34 + 16) + 8 * (**(void **)(v34 + 16) != v34)) = v35;
      v35[1] = v34;
      goto LABEL_98;
    }
    *(unsigned char *)(v17 + 24) = 0;
    uint64_t v22 = *(void *)(v17 + 16);
    if (*(unsigned char *)(v22 + 24)) {
      BOOL v23 = v22 == v3;
    }
    else {
      BOOL v23 = 1;
    }
    if (v23) {
      goto LABEL_84;
    }
LABEL_48:
    uint64_t v17 = *(void *)(*(void *)(v22 + 16) + 8 * (**(void **)(v22 + 16) == v22));
  }
  if (*(unsigned char *)(v17 + 24))
  {
    uint64_t v25 = *(void *)v17;
    if (!*(void *)v17)
    {
LABEL_62:
      uint64_t v29 = *(void *)(v17 + 8);
      if (v29 && !*(unsigned char *)(v29 + 24)) {
        goto LABEL_90;
      }
      *(unsigned char *)(v17 + 24) = 0;
      uint64_t v22 = *(void *)(v17 + 16);
      if (v22 == v3)
      {
        uint64_t v22 = v3;
LABEL_84:
        *(unsigned char *)(v22 + 24) = 1;
        goto LABEL_99;
      }
      if (!*(unsigned char *)(v22 + 24)) {
        goto LABEL_84;
      }
      goto LABEL_48;
    }
  }
  else
  {
    *(unsigned char *)(v17 + 24) = 1;
    *((unsigned char *)v24 + 24) = 0;
    v27 = v24[1];
    v28 = (void *)*v27;
    v24[1] = (void *)*v27;
    if (v28) {
      v28[2] = v24;
    }
    v27[2] = v24[2];
    v24[2][*v24[2] != (void)v24] = v27;
    void *v27 = v24;
    v24[2] = v27;
    if (v3 == *(void *)v17) {
      uint64_t v3 = v17;
    }
    uint64_t v17 = *(void *)(*(void *)v17 + 8);
    uint64_t v25 = *(void *)v17;
    if (!*(void *)v17) {
      goto LABEL_62;
    }
  }
  if (*(unsigned char *)(v25 + 24)) {
    goto LABEL_62;
  }
  uint64_t v29 = *(void *)(v17 + 8);
  if (v29 && !*(unsigned char *)(v29 + 24))
  {
LABEL_90:
    uint64_t v25 = v17;
  }
  else
  {
    *(unsigned char *)(v25 + 24) = 1;
    *(unsigned char *)(v17 + 24) = 0;
    uint64_t v33 = *(void *)(v25 + 8);
    *(void *)uint64_t v17 = v33;
    if (v33) {
      *(void *)(v33 + 16) = v17;
    }
    *(void *)(v25 + 16) = *(void *)(v17 + 16);
    *(void *)(*(void *)(v17 + 16) + 8 * (**(void **)(v17 + 16) != v17)) = v25;
    *(void *)(v25 + 8) = v17;
    *(void *)(v17 + 16) = v25;
    uint64_t v29 = v17;
  }
  uint64_t v34 = *(void *)(v25 + 16);
  *(unsigned char *)(v25 + 24) = *(unsigned char *)(v34 + 24);
  *(unsigned char *)(v34 + 24) = 1;
  *(unsigned char *)(v29 + 24) = 1;
  v35 = *(uint64_t **)(v34 + 8);
  uint64_t v36 = *v35;
  *(void *)(v34 + 8) = *v35;
  if (v36) {
    *(void *)(v36 + 16) = v34;
  }
  v35[2] = *(void *)(v34 + 16);
  *(void *)(*(void *)(v34 + 16) + 8 * (**(void **)(v34 + 16) != v34)) = v35;
  uint64_t *v35 = v34;
LABEL_98:
  *(void *)(v34 + 16) = v35;
LABEL_99:
  operator delete(v4);
  os_unfair_lock_unlock(&mav_router::device::pci_shim::mapLock);

  dispatch_release(v13);
}

void ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke_2(void *a1, int a2, void *a3, unsigned int a4)
{
  BOOL v7 = (os_unfair_lock_s *)a1[4];
  v8 = (std::__shared_weak_count *)a1[6];
  if (v8)
  {
    v10 = std::__shared_weak_count::lock(v8);
    if (v10 && a1[5])
    {
      if (a2) {
        mav_router::device::pci_shim::handleError(v7);
      }
      else {
        mav_router::device::pci_shim::handleRead(v7, a3, a4);
      }
LABEL_11:
      if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      return;
    }
  }
  else
  {
    v10 = 0;
  }
  if (!a2 && a3) {
    free(a3);
  }
  if (v10) {
    goto LABEL_11;
  }
}

void sub_2192A66EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void mav_router::device::pci_shim::handleRead(os_unfair_lock_s *this, const void *a2, unsigned int a3)
{
  unint64_t v6 = this + 12;
  os_unfair_lock_lock(this + 12);
  BOOL v7 = *(std::__shared_weak_count **)&this[4]._os_unfair_lock_opaque;
  if (!v7)
  {
    v8 = 0;
    goto LABEL_5;
  }
  v8 = std::__shared_weak_count::lock(v7);
  if (!v8)
  {
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)&this[2]._os_unfair_lock_opaque;
LABEL_6:
  dispatch_data_t v17 = dispatch_data_create(a2, a3, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint32_t os_unfair_lock_opaque = this[6]._os_unfair_lock_opaque;
    if (*(_DWORD *)(v10 + 4) > os_unfair_lock_opaque)
    {
      uint64_t v12 = *(void *)(v10 + 16);
      int v13 = *(_DWORD *)(v12 + 40 * os_unfair_lock_opaque + 16);
      if (v13)
      {
        if (v13 == 1)
        {
          uint64_t v14 = *(unsigned int **)(v12 + 40 * os_unfair_lock_opaque + 8);
          if (!v14) {
            goto LABEL_17;
          }
          int v15 = &v17;
          v16 = *(void (**)(uint64_t))(*(void *)(v10 + 8) + 48 * *v14 + 16);
          if (!v16) {
            goto LABEL_17;
          }
LABEL_16:
          v16(v10);
          *int v15 = 0;
          goto LABEL_17;
        }
        unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
        if (!mav_mux_decode(&v17, (uint64_t)&v18) && *(_DWORD *)v10 > v18)
        {
          int v15 = (dispatch_data_t *)v19;
          v16 = *(void (**)(uint64_t))(*(void *)(v10 + 8) + 48 * v18 + 16);
          if (v16) {
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_17:
  os_unfair_lock_unlock(v6);
  if (v8)
  {
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

uint64_t mav_router::device::pci_shim::handle_transmit(os_unfair_lock_s *this, dispatch_data_t data)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  size_t v19 = 0xAAAAAAAAAAAAAAAALL;
  buffer_ptr = (void *)0xAAAAAAAAAAAAAAAALL;
  dispatch_data_t v4 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v19);
  if (!v4)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v22 = 0x40000000;
    *(void *)&long long v23 = ____mav_log_platform_os_log_handle_block_invoke;
    *((void *)&v23 + 1) = &__block_descriptor_tmp_0;
    int v24 = 3;
    if (qword_26AB7A0B0 == -1)
    {
      dispatch_data_t v17 = qword_26AB7A0D0;
      if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO)) {
        return 7;
      }
    }
    else
    {
      dispatch_once(&qword_26AB7A0B0, buf);
      dispatch_data_t v17 = qword_26AB7A0D0;
      if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO)) {
        return 7;
      }
    }
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 3;
    uint64_t v22 = 0x400000000000400;
    LODWORD(v23) = 0;
    WORD2(v23) = 2080;
    *(void *)((char *)&v23 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::handle_transmit(mav_buffer_t)";
    HIWORD(v23) = 1024;
    int v24 = 283;
    __int16 v25 = 2048;
    dispatch_data_t v26 = data;
    _os_log_impl(&dword_2192A5000, v17, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:failed to create mapping of buffer %p", buf, 0x2Eu);
    return 7;
  }
  dispatch_data_t v5 = v4;
  dispatch_release(data);
  unint64_t v6 = this + 12;
  os_unfair_lock_lock(this + 12);
  *(_DWORD *)buf = -1431655766;
  os_unfair_lock_lock(&mav_router::device::pci_shim::mapLock);
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&_MergedGlobals))
  {
    qword_26AB7A100 = 0;
    qword_26AB7A0F8 = 0;
    qword_26AB7A0F0 = (uint64_t)&qword_26AB7A0F8;
    __cxa_guard_release(&_MergedGlobals);
  }
  BOOL v7 = buffer_ptr;
  uint64_t v8 = qword_26AB7A0F8;
  if (qword_26AB7A0F8)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v10 = (uint64_t *)v8;
        unint64_t v11 = *(void *)(v8 + 32);
        if ((unint64_t)buffer_ptr >= v11) {
          break;
        }
        uint64_t v8 = *v10;
        uint64_t v9 = v10;
        if (!*v10) {
          goto LABEL_10;
        }
      }
      if (v11 >= (unint64_t)buffer_ptr) {
        break;
      }
      uint64_t v8 = v10[1];
      if (!v8)
      {
        uint64_t v9 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = &qword_26AB7A0F8;
    uint64_t v10 = &qword_26AB7A0F8;
LABEL_10:
    uint64_t v12 = (uint64_t *)operator new(0x30uLL);
    v12[4] = (uint64_t)v7;
    v12[5] = (uint64_t)v5;
    uint64_t *v12 = 0;
    v12[1] = 0;
    v12[2] = (uint64_t)v10;
    *uint64_t v9 = (uint64_t)v12;
    if (*(void *)qword_26AB7A0F0)
    {
      qword_26AB7A0F0 = *(void *)qword_26AB7A0F0;
      uint64_t v12 = (uint64_t *)*v9;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_26AB7A0F8, v12);
    ++qword_26AB7A100;
  }
  os_unfair_lock_unlock(&mav_router::device::pci_shim::mapLock);
  int v15 = *(unsigned int (**)(os_unfair_lock_s *, void *, void, uint8_t *, uint64_t, uint64_t, void (*)(mav_router::device::pci_shim *, void *)))&this[14]._os_unfair_lock_opaque;
  uint64_t v14 = this + 14;
  int v13 = v15;
  if (v15)
  {
    if (v13(v14, buffer_ptr, v19, buf, 1, 1000, mav_router::device::pci_shim::dtor)) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = 7;
    }
  }
  else
  {
    uint64_t v16 = 7;
  }
  os_unfair_lock_unlock(v6);
  return v16;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), dispatch_data_t v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *uint64_t v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }
        void v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        *uint64_t v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *uint64_t v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    *dispatch_data_t v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    dispatch_data_t v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  int v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  uint64_t *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

void *mav_router::device::controller_mac::controller_mac(void *a1, void *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  mav_router::device::controller::controller((uint64_t)a1, v5);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  *a1 = &unk_26CAA7EC0;
  return a1;
}

{
  std::__shared_weak_count *v3;
  void v5[2];

  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  mav_router::device::controller::controller((uint64_t)a1, v5);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  *a1 = &unk_26CAA7EC0;
  return a1;
}

void sub_2192A6E0C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192A6E9C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

void mav_router::device::controller_mac::~controller_mac(mav_router::device::controller_mac *this)
{
  *(void *)this = &unk_26CAA7F48;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  if (*((void *)this + 3))
  {
    uint64_t v3 = *((void *)this + 1);
    uint64_t v4 = (mav_router::device::controller_mac *)*((void *)this + 2);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 3) = 0;
    if (v4 != (mav_router::device::controller_mac *)((char *)this + 8))
    {
      do
      {
        int v6 = (mav_router::device::controller_mac *)*((void *)v4 + 1);
        uint64_t v7 = (std::__shared_weak_count *)*((void *)v4 + 3);
        if (v7)
        {
          if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
        operator delete(v4);
        uint64_t v4 = v6;
      }
      while (v6 != (mav_router::device::controller_mac *)((char *)this + 8));
    }
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t v3;
  mav_router::device::controller_mac *v4;
  uint64_t v5;
  mav_router::device::controller_mac *v6;
  std::__shared_weak_count *v7;

  *(void *)this = &unk_26CAA7F48;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  if (*((void *)this + 3))
  {
    uint64_t v3 = *((void *)this + 1);
    uint64_t v4 = (mav_router::device::controller_mac *)*((void *)this + 2);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 3) = 0;
    if (v4 != (mav_router::device::controller_mac *)((char *)this + 8))
    {
      do
      {
        int v6 = (mav_router::device::controller_mac *)*((void *)v4 + 1);
        uint64_t v7 = (std::__shared_weak_count *)*((void *)v4 + 3);
        if (v7)
        {
          if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
        operator delete(v4);
        uint64_t v4 = v6;
      }
      while (v6 != (mav_router::device::controller_mac *)((char *)this + 8));
    }
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t v3;
  mav_router::device::controller_mac *v4;
  uint64_t v5;
  mav_router::device::controller_mac *v6;
  std::__shared_weak_count *v7;
  uint64_t vars8;

  *(void *)this = &unk_26CAA7F48;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  if (*((void *)this + 3))
  {
    uint64_t v3 = *((void *)this + 1);
    uint64_t v4 = (mav_router::device::controller_mac *)*((void *)this + 2);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 3) = 0;
    if (v4 != (mav_router::device::controller_mac *)((char *)this + 8))
    {
      do
      {
        int v6 = (mav_router::device::controller_mac *)*((void *)v4 + 1);
        uint64_t v7 = (std::__shared_weak_count *)*((void *)v4 + 3);
        if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        operator delete(v4);
        uint64_t v4 = v6;
      }
      while (v6 != (mav_router::device::controller_mac *)((char *)this + 8));
    }
  }

  operator delete(this);
}

void mav_router::device::controller_mac::init_routes(mav_router::device::controller_mac *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (!v2)
  {
    uint64_t v3 = 0;
LABEL_9:
    uint64_t v4 = 0;
    uint64_t v5 = (unsigned int *)MEMORY[0x10];
    uint64_t v7 = *MEMORY[0x10];
    LODWORD(v6) = *(_DWORD *)(MEMORY[0x10] + 4);
    if (v6 >= v7) {
      uint64_t v6 = v7;
    }
    else {
      uint64_t v6 = v6;
    }
    if (!v7) {
      goto LABEL_25;
    }
    goto LABEL_13;
  }
  uint64_t v3 = std::__shared_weak_count::lock(v2);
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v4 = *((void *)this + 4);
  uint64_t v5 = *(unsigned int **)(v4 + 16);
  uint64_t v7 = *v5;
  LODWORD(v6) = v5[1];
  if (v6 >= v7) {
    uint64_t v6 = v7;
  }
  else {
    uint64_t v6 = v6;
  }
  if (!v7) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v8 = 0;
  uint64_t v9 = *((void *)v5 + 1);
  do
  {
    uint64_t v10 = v9 + 48 * v8;
    uint64_t v13 = *(void *)(v10 + 8);
    uint64_t v11 = (void *)(v10 + 8);
    uint64_t v12 = v13;
    if (v13)
    {
      int v14 = *(_DWORD *)(v12 + 16);
      *(_DWORD *)(v12 + 16) = v14 - 1;
      if (v14 == 1)
      {
        *(void *)(v12 + 8) = 0;
      }
      else if (v14 == 2)
      {
        uint64_t v15 = v7;
        uint64_t v16 = v9;
        while (*(void *)(v16 + 8) != v12)
        {
          v16 += 48;
          if (!--v15)
          {
            void *v11 = 0;
            goto LABEL_25;
          }
        }
        *(void *)(v12 + 8) = v16;
      }
      void *v11 = 0;
    }
    ++v8;
  }
  while (v8 != v7);
LABEL_25:
  if (v6)
  {
    dispatch_data_t v17 = *(unsigned int **)(v4 + 16);
    if (v17)
    {
      unint64_t v18 = 0;
LABEL_29:
      if (v18 < *v17 && v18 < v17[1])
      {
        uint64_t v21 = v17 + 2;
        uint64_t v19 = *((void *)v17 + 1);
        uint64_t v20 = *((void *)v21 + 1);
        uint64_t v22 = v20 + 40 * v18;
        *(void *)(v19 + 48 * v18 + 8) = v22;
        int v23 = *(_DWORD *)(v22 + 16);
        *(_DWORD *)(v22 + 16) = v23 + 1;
        if (!v23) {
          *(void *)(v20 + 40 * v18 + 8) = v19 + 48 * v18;
        }
      }
      while (++v18 != v6)
      {
        dispatch_data_t v17 = *(unsigned int **)(v4 + 16);
        if (v17) {
          goto LABEL_29;
        }
      }
    }
  }
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

uint64_t mav_router::device::controller_mac::get_channel_for_service()
{
  return 0;
}

uint64_t mav_router_device_register_transmit(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 1;
  if (a1 && a3 && *(_DWORD *)(a1 + 4) > a2)
  {
    uint64_t result = 0;
    uint64_t v6 = *(void *)(a1 + 16) + 40 * a2;
    *(void *)(v6 + 24) = a3;
    *(void *)(v6 + 32) = a4;
  }
  return result;
}

uint64_t mav_router_device_receive(uint64_t a1, unsigned int a2, dispatch_data_t *a3)
{
  if (!a1) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 4) <= a2) {
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = *(_DWORD *)(v4 + 40 * a2 + 16);
  if (!v5) {
    return 6;
  }
  uint64_t v6 = a3;
  if (v5 != 1)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    if (!mav_mux_decode(a3, (uint64_t)&v10) && *(_DWORD *)a1 > v10)
    {
      uint64_t v6 = (void *)v11;
      uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 48 * v10 + 16);
      if (v8) {
        goto LABEL_7;
      }
      return 4;
    }
    return 1;
  }
  uint64_t v7 = *(unsigned int **)(v4 + 40 * a2 + 8);
  if (v7)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 48 * *v7 + 16);
    if (v8)
    {
LABEL_7:
      uint64_t result = v8(a1);
      *uint64_t v6 = 0;
      return result;
    }
    return 4;
  }
  return 3;
}

uint64_t mav_router_device_error(unsigned int *a1, unsigned int a2, uint64_t a3)
{
  if (!a1) {
    return 1;
  }
  if (a1[1] <= a2) {
    return 1;
  }
  unint64_t v5 = *a1;
  if (v5)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *((void *)a1 + 1);
      unint64_t v11 = *(_DWORD **)(v10 + v7 + 8);
      if (v11 && *v11 == a2)
      {
        uint64_t v12 = v10 + v7;
        uint64_t v13 = *(void (**)(unsigned int *, unint64_t, uint64_t, void))(v10 + v7 + 32);
        if (v13)
        {
          v13(a1, v8, a3, *(void *)(v12 + 40));
          unint64_t v5 = *a1;
        }
        else
        {
          uint64_t v9 = 4;
        }
      }
      ++v8;
      v7 += 48;
    }
    while (v8 < v5);
    return v9;
  }
  return 0;
}

const char *mav_router_channel_get_name_as_cstr(unsigned int a1)
{
  if (a1 > 0xA) {
    return "unknown channel";
  }
  else {
    return mav_router_channel_cstrings[a1];
  }
}

const char *mav_router_device_get_name_as_cstr(unsigned int a1)
{
  if (a1 > 0x10) {
    return "unknown device";
  }
  else {
    return mav_router_device_cstrings[a1];
  }
}

uint64_t mav_router::device::controller::create@<X0>(std::__shared_weak_count **a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v4 = (uint64_t (***)(void))operator new(0x50uLL);
  unint64_t v5 = v4;
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  v10[0] = v6;
  v10[1] = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  mav_router::device::controller_ios::controller_ios((uint64_t)v4, v10);
  unint64_t v8 = operator new(0x20uLL);
  void *v8 = &unk_26CAA8198;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v5;
  *a2 = v5;
  a2[1] = v8;
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  return (**v5)(v5);
}

void sub_2192A7770(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_2192A77E8(_Unwind_Exception *a1)
{
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t mav_router::device::controller::controller(uint64_t a1, void *a2)
{
  *(void *)a1 = &unk_26CAA7F48;
  *(void *)(a1 + 8) = a1 + 8;
  *(void *)(a1 + 16) = a1 + 8;
  *(void *)(a1 + 24) = 0;
  uint64_t v3 = a2[1];
  *(void *)(a1 + 32) = *a2;
  *(void *)(a1 + 40) = v3;
  atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  uint64_t v4 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 40));
  unint64_t v5 = *(unsigned int **)(*(void *)(a1 + 32) + 16);
  bzero(*((void **)v5 + 1), 48 * *v5);
  uint64_t v6 = *v5;
  if (v6)
  {
    uint64_t v7 = *((void *)v5 + 1);
    if (v6 == 1)
    {
      uint64_t v8 = 0;
LABEL_7:
      unint64_t v11 = (_DWORD *)(v7 + 48 * v8);
      do
      {
        _DWORD *v11 = v8;
        v11 += 12;
        ++v8;
      }
      while (v6 != v8);
      goto LABEL_9;
    }
    uint64_t v9 = 0;
    uint64_t v8 = v6 & 0xFFFFFFFE;
    uint64_t v10 = (_DWORD *)*((void *)v5 + 1);
    do
    {
      _DWORD *v10 = v9;
      v10[12] = v9 + 1;
      v9 += 2;
      v10 += 24;
    }
    while (v8 != v9);
    if (v8 != v6) {
      goto LABEL_7;
    }
  }
LABEL_9:
  bzero(*((void **)v5 + 2), 40 * v5[1]);
  uint64_t v12 = v5[1];
  if (!v12) {
    goto LABEL_17;
  }
  uint64_t v13 = *((void *)v5 + 2);
  if (v12 == 1)
  {
    uint64_t v14 = 0;
LABEL_15:
    dispatch_data_t v17 = (_DWORD *)(v13 + 40 * v14);
    do
    {
      *dispatch_data_t v17 = v14;
      v17 += 10;
      ++v14;
    }
    while (v12 != v14);
    goto LABEL_17;
  }
  uint64_t v15 = 0;
  uint64_t v14 = v12 & 0xFFFFFFFE;
  uint64_t v16 = (_DWORD *)*((void *)v5 + 2);
  do
  {
    _DWORD *v16 = v15;
    v16[10] = v15 + 1;
    v15 += 2;
    v16 += 20;
  }
  while (v14 != v15);
  if (v14 != v12) {
    goto LABEL_15;
  }
LABEL_17:
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void mav_router::device::controller::~controller(mav_router::device::controller *this)
{
  *(void *)this = &unk_26CAA7F48;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  if (*((void *)this + 3))
  {
    uint64_t v3 = *((void *)this + 1);
    uint64_t v4 = (mav_router::device::controller *)*((void *)this + 2);
    uint64_t v5 = *(void *)v4;
    *(void *)(v5 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v5;
    *((void *)this + 3) = 0;
    if (v4 != (mav_router::device::controller *)((char *)this + 8))
    {
      do
      {
        uint64_t v6 = (mav_router::device::controller *)*((void *)v4 + 1);
        uint64_t v7 = (std::__shared_weak_count *)*((void *)v4 + 3);
        if (v7)
        {
          if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
        operator delete(v4);
        uint64_t v4 = v6;
      }
      while (v6 != (mav_router::device::controller *)((char *)this + 8));
    }
  }
}

uint64_t mav_router::device::controller::engage(uint64_t a1, const void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(void *)buf = MEMORY[0x263EF8330];
  uint64_t v10 = 0x40000000;
  *(void *)&long long v11 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v11 + 1) = &__block_descriptor_tmp_0;
  int v12 = 0;
  if (__mav_log_platform_os_log_handle::once[0] != -1) {
    dispatch_once(__mav_log_platform_os_log_handle::once, buf);
  }
  uint64_t v4 = __mav_log_platform_os_log_handle::logger[0];
  if (os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = 0;
    uint64_t v10 = 0x400000000010400;
    LODWORD(v11) = 0;
    WORD2(v11) = 2080;
    *(void *)((char *)&v11 + 6) = "virtual mav_router_result_t mav_router::device::controller::engage(engage_callback_t)";
    HIWORD(v11) = 1024;
    int v12 = 53;
    _os_log_impl(&dword_2192A5000, v4, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:engaging", buf, 0x24u);
  }
  uint64_t v5 = _Block_copy(a2);
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke;
  v8[3] = &__block_descriptor_tmp_4;
  v8[4] = v5;
  v8[5] = a1;
  dispatch_async(global_queue, v8);
  return 0;
}

void ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  char v14 = 1;
  uint64_t v3 = dispatch_group_create();
  uint64_t v4 = v2 + 8;
  uint64_t v5 = *(void *)(v2 + 16);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  uint64_t v9 = ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke_2;
  uint64_t v10 = &__block_descriptor_tmp_1;
  long long v11 = v13;
  for (i = v3; v5 != v4; uint64_t v5 = *(void *)(v5 + 8))
    v9((uint64_t)v8, (void *)(v5 + 16));
  dispatch_retain(v3);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1107296256;
  block[2] = ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke_1;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = *(void *)(a1 + 32);
  block[5] = v13;
  block[6] = v3;
  dispatch_group_notify(v3, global_queue, block);
  dispatch_release(v3);
  _Block_object_dispose(v13, 8);
}

void sub_2192A7DCC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  char v3 = *(unsigned char *)(v2 + 24);
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t result = (*(uint64_t (**)(void, void))(*(void *)*a2 + 24))(*a2, *(void *)(result + 40));
    char v3 = result == 0;
    uint64_t v2 = *(void *)(*(void *)(v4 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = v3;
  return result;
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

void ___ZN10mav_router6device10controller6engageEU13block_pointerFv19mav_router_result_tE_block_invoke_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 6;
  }
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v4 = *(NSObject **)(a1 + 48);

  dispatch_release(v4);
}

void __copy_helper_block_e8_32b40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
  uint64_t v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

void __destroy_helper_block_e8_32b40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 7);
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32b(uint64_t a1)
{
}

uint64_t mav_router::device::controller::engage(mav_router::device::controller *this)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2)
  {
    uint64_t v3 = std::__shared_weak_count::lock(v2);
    uint64_t v15 = v3;
    if (v3)
    {
      uint64_t v4 = *((void *)this + 4);
      uint64_t v14 = v4;
      if (v4)
      {
        uint64_t v5 = *(NSObject **)(v4 + 80);
        if (v5) {
          dispatch_assert_queue_not_V2(v5);
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2000000000;
  int v13 = -1431655766;
  uint64_t v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  void v9[2] = ___ZN10mav_router6device10controller6engageEv_block_invoke;
  v9[3] = &__block_descriptor_tmp_8;
  v9[4] = &v10;
  v9[5] = v6;
  uint64_t v7 = (*(uint64_t (**)(mav_router::device::controller *, void *))(*(void *)this + 32))(this, v9);
  if (v7)
  {
    dispatch_group_leave(v6);
    dispatch_release(v6);
    _Block_object_dispose(&v10, 8);
    if (!v3) {
      return v7;
    }
  }
  else
  {
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = *((unsigned int *)v11 + 6);
    dispatch_release(v6);
    _Block_object_dispose(&v10, 8);
    if (!v3) {
      return v7;
    }
  }
  if (atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return v7;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return v7;
}

void sub_2192A813C(_Unwind_Exception *a1)
{
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v1 - 48);
  _Unwind_Resume(a1);
}

void sub_2192A8150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v7 - 48);
  _Unwind_Resume(a1);
}

void ___ZN10mav_router6device10controller6engageEv_block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(a1 + 40);
  *(_DWORD *)(*(void *)(v2 + 8) + 24) = a2;
  dispatch_group_leave(v3);
}

uint64_t mav_router::device::controller::tearDown(mav_router::device::controller *this)
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2000000000;
  char v13 = 1;
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = (char *)*((void *)this + 2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  uint64_t v7 = ___ZN10mav_router6device10controller8tearDownEv_block_invoke;
  uint64_t v8 = &__block_descriptor_tmp_11;
  uint64_t v9 = &v10;
  if (v3 == (char *)this + 8) {
    goto LABEL_4;
  }
  do
  {
    v7((uint64_t)v6, (uint64_t)(v3 + 16));
    uint64_t v3 = (char *)*((void *)v3 + 1);
  }
  while (v3 != v2);
  if (*((unsigned char *)v11 + 24))
  {
LABEL_4:
    (**(void (***)(mav_router::device::controller *))this)(this);
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 6;
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void sub_2192A8290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2192A82A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller8tearDownEv_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  char v3 = *(unsigned char *)(v2 + 24);
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)a2 + 32))();
    char v3 = result == 0;
    uint64_t v2 = *(void *)(*(void *)(v4 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = v3;
  return result;
}

uint64_t mav_router::device::controller::recover(mav_router::device::controller *this)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  char v12 = 1;
  uint64_t v1 = (char *)this + 8;
  uint64_t v2 = (char *)*((void *)this + 2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  uint64_t v6 = ___ZN10mav_router6device10controller7recoverEv_block_invoke;
  uint64_t v7 = &__block_descriptor_tmp_14;
  uint64_t v8 = &v9;
  if (v2 == (char *)this + 8)
  {
    uint64_t v3 = 0;
  }
  else
  {
    do
    {
      v6((uint64_t)v5, (uint64_t)(v2 + 16));
      uint64_t v2 = (char *)*((void *)v2 + 1);
    }
    while (v2 != v1);
    if (*((unsigned char *)v10 + 24)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 6;
    }
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

void sub_2192A8414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller7recoverEv_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  char v3 = *(unsigned char *)(v2 + 24);
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)a2 + 40))();
    char v3 = result == 0;
    uint64_t v2 = *(void *)(*(void *)(v4 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = v3;
  return result;
}

uint64_t mav_router::device::controller::enterLowPower(mav_router::device::controller *this)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  char v12 = 1;
  uint64_t v1 = (char *)this + 8;
  uint64_t v2 = (char *)*((void *)this + 2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  uint64_t v6 = ___ZN10mav_router6device10controller13enterLowPowerEv_block_invoke;
  uint64_t v7 = &__block_descriptor_tmp_17;
  uint64_t v8 = &v9;
  if (v2 == (char *)this + 8)
  {
    uint64_t v3 = 0;
  }
  else
  {
    do
    {
      v6((uint64_t)v5, (uint64_t)(v2 + 16));
      uint64_t v2 = (char *)*((void *)v2 + 1);
    }
    while (v2 != v1);
    if (*((unsigned char *)v10 + 24)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 6;
    }
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

void sub_2192A8580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller13enterLowPowerEv_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  char v3 = *(unsigned char *)(v2 + 24);
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)a2 + 48))();
    char v3 = result == 0;
    uint64_t v2 = *(void *)(*(void *)(v4 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = v3;
  return result;
}

uint64_t mav_router::device::controller::exitLowPower(mav_router::device::controller *this)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  char v12 = 1;
  uint64_t v1 = (char *)this + 8;
  uint64_t v2 = (char *)*((void *)this + 2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  uint64_t v6 = ___ZN10mav_router6device10controller12exitLowPowerEv_block_invoke;
  uint64_t v7 = &__block_descriptor_tmp_20;
  uint64_t v8 = &v9;
  if (v2 == (char *)this + 8)
  {
    uint64_t v3 = 0;
  }
  else
  {
    do
    {
      v6((uint64_t)v5, (uint64_t)(v2 + 16));
      uint64_t v2 = (char *)*((void *)v2 + 1);
    }
    while (v2 != v1);
    if (*((unsigned char *)v10 + 24)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 6;
    }
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

void sub_2192A86EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller12exitLowPowerEv_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  char v3 = *(unsigned char *)(v2 + 24);
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)a2 + 56))();
    char v3 = result == 0;
    uint64_t v2 = *(void *)(*(void *)(v4 + 32) + 8);
  }
  *(unsigned char *)(v2 + 24) = v3;
  return result;
}

uint64_t mav_router::device::controller::hasFatalErrorOccurred(mav_router::device::controller *this, BOOL *a2)
{
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  uint64_t v2 = 1;
  char v20 = 1;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000;
  char v16 = 0;
  if (a2)
  {
    uint64_t v4 = (char *)this + 8;
    uint64_t v5 = (char *)*((void *)this + 2);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    uint64_t v9 = ___ZN10mav_router6device10controller21hasFatalErrorOccurredEPb_block_invoke;
    uint64_t v10 = &__block_descriptor_tmp_21;
    uint64_t v11 = &v17;
    char v12 = &v13;
    if (v5 == (char *)this + 8)
    {
      char v6 = 0;
      uint64_t v2 = 0;
    }
    else
    {
      do
      {
        v9((uint64_t)v8, (void *)v5 + 2);
        uint64_t v5 = (char *)*((void *)v5 + 1);
      }
      while (v5 != v4);
      char v6 = *((unsigned char *)v14 + 24);
      if (*((unsigned char *)v18 + 24)) {
        uint64_t v2 = 0;
      }
      else {
        uint64_t v2 = 6;
      }
    }
    *a2 = v6;
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v2;
}

void sub_2192A888C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN10mav_router6device10controller21hasFatalErrorOccurredEPb_block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = result;
  char v7 = 0;
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  char v4 = *(unsigned char *)(v3 + 24);
  if (v4)
  {
    uint64_t result = (*(uint64_t (**)(void, char *))(*(void *)*a2 + 64))(*a2, &v7);
    BOOL v5 = result == 0;
    uint64_t v3 = *(void *)(*(void *)(v2 + 32) + 8);
    char v4 = v7 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  *(unsigned char *)(v3 + 24) = v5;
  uint64_t v6 = *(void *)(*(void *)(v2 + 40) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    char v4 = 1;
  }
  *(unsigned char *)(v6 + 24) = v4;
  return result;
}

void __copy_helper_block_e8_32r40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  char v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

void __destroy_helper_block_e8_32r40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

uint64_t mav_router::device::controller::getFatalErrorReason(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &v21;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2000000000;
  char v32 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x4002000000;
  int v24 = __Block_byref_object_copy_;
  __int16 v25 = __Block_byref_object_dispose_;
  __p = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v4 = a1 + 8;
  uint64_t v5 = *(void *)(a1 + 16);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  uint64_t v17 = ___ZN10mav_router6device10controller19getFatalErrorReasonERNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke;
  unint64_t v18 = &__block_descriptor_tmp_26;
  uint64_t v19 = &v29;
  char v20 = &v21;
  if (v5 != a1 + 8)
  {
    do
    {
      v17((uint64_t)v16, (void *)(v5 + 16));
      uint64_t v5 = *(void *)(v5 + 8);
    }
    while (v5 != v4);
    uint64_t v3 = v22;
  }
  uint64_t v6 = (long long *)(v3 + 5);
  if (v3 + 5 != (uint64_t *)a2)
  {
    size_t v7 = *((unsigned __int8 *)v3 + 63);
    if (*(char *)(a2 + 23) < 0)
    {
      uint64_t v10 = (long long *)v3[5];
      size_t v9 = v3[6];
      if ((v7 & 0x80u) == 0) {
        uint64_t v11 = v6;
      }
      else {
        uint64_t v11 = v10;
      }
      if ((v7 & 0x80u) == 0) {
        size_t v12 = v7;
      }
      else {
        size_t v12 = v9;
      }
      std::string::__assign_no_alias<false>((void **)a2, v11, v12);
    }
    else if ((v7 & 0x80) != 0)
    {
      std::string::__assign_no_alias<true>((void *)a2, (void *)v3[5], v3[6]);
    }
    else
    {
      long long v8 = *v6;
      *(void *)(a2 + 16) = v3[7];
      *(_OWORD *)a2 = v8;
    }
  }
  int v13 = *((unsigned __int8 *)v30 + 24);
  _Block_object_dispose(&v21, 8);
  if (SHIBYTE(v28) < 0) {
    operator delete(__p);
  }
  if (v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 6;
  }
  _Block_object_dispose(&v29, 8);
  return v14;
}

void sub_2192A8B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  _Block_object_dispose(&a15, 8);
  if (a25 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose((const void *)(v25 - 64), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

void ___ZN10mav_router6device10controller19getFatalErrorReasonERNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke(uint64_t a1, void *a2)
{
  std::string::size_type v32 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = 0;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  char v5 = *(unsigned char *)(v4 + 24);
  if (v5)
  {
    char v5 = (*(unsigned int (**)(void, std::string::value_type **))(*(void *)*a2 + 72))(*a2, &v31) == 0;
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v4 + 24) = v5;
  int v30 = 16;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    BOOL v7 = (*(unsigned int (**)(void, int *))(*(void *)*a2 + 96))(*a2, &v30) == 0;
    unsigned int v8 = v30;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
    if (v8 > 0x10)
    {
      size_t v9 = "unknown device";
      goto LABEL_8;
    }
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
    unsigned int v8 = 16;
  }
  size_t v9 = mav_router_device_cstrings[v8];
LABEL_8:
  size_t v10 = strlen(v9);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    p_dst = (std::string *)operator new(v13 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_15;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v10;
  p_dst = &__dst;
  if (v10) {
LABEL_15:
  }
    memmove(p_dst, v9, v11);
  p_dst->__r_.__value_.__s.__data_[v11] = 0;
  uint64_t v15 = std::string::insert(&__dst, 0, "\n", 1uLL);
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v26.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  uint64_t v17 = std::string::append(&v26, ":  ", 3uLL);
  long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  if (v33 >= 0) {
    uint64_t v19 = (const std::string::value_type *)&v31;
  }
  else {
    uint64_t v19 = v31;
  }
  if (v33 >= 0) {
    std::string::size_type v20 = HIBYTE(v33);
  }
  else {
    std::string::size_type v20 = v32;
  }
  uint64_t v21 = std::string::append(&v27, v19, v20);
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  int64_t v29 = v21->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  if (v29 >= 0) {
    uint64_t v23 = __p;
  }
  else {
    uint64_t v23 = (void **)__p[0];
  }
  if (v29 >= 0) {
    std::string::size_type v24 = HIBYTE(v29);
  }
  else {
    std::string::size_type v24 = (std::string::size_type)__p[1];
  }
  std::string::append((std::string *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), (const std::string::value_type *)v23, v24);
  if (SHIBYTE(v29) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_30:
      if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_36;
    }
  }
  else if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_30;
  }
  operator delete(v27.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v26.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_31:
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_37;
  }
LABEL_36:
  operator delete(v26.__r_.__value_.__l.__data_);
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_32:
    if ((SHIBYTE(v33) & 0x80000000) == 0) {
      return;
    }
LABEL_38:
    operator delete(v31);
    return;
  }
LABEL_37:
  operator delete(__dst.__r_.__value_.__l.__data_);
  if (SHIBYTE(v33) < 0) {
    goto LABEL_38;
  }
}

void sub_2192A8ED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if ((*(char *)(v35 - 49) & 0x80000000) == 0) {
    _Unwind_Resume(exception_object);
  }
  operator delete(*(void **)(v35 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t mav_router::device::controller::getMaxPayload(mav_router::device::controller *this, unint64_t *a2)
{
  *a2 = -1;
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = *((void *)this + 2);
  if ((mav_router::device::controller *)v3 == (mav_router::device::controller *)((char *)this + 8)) {
    return 0;
  }
  LOBYTE(v5) = 1;
  unint64_t v6 = -1;
  do
  {
    unint64_t v9 = 0;
    if (v5)
    {
      BOOL v5 = (*(uint64_t (**)(void, unint64_t *))(**(void **)(v3 + 16) + 88))(*(void *)(v3 + 16), &v9) == 0;
      unint64_t v7 = v9;
      unint64_t v6 = *a2;
    }
    else
    {
      unint64_t v7 = 0;
      BOOL v5 = 0;
    }
    if (v7 < v6) {
      unint64_t v6 = v7;
    }
    *a2 = v6;
    uint64_t v3 = *(void *)(v3 + 8);
  }
  while ((char *)v3 != v2);
  if (v5) {
    return 0;
  }
  else {
    return 6;
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26439C5B0, MEMORY[0x263F8C060]);
}

void sub_2192A90F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::string::__assign_no_alias<true>(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    unint64_t v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *std::string __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unint64_t v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      unint64_t v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    size_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v10 = v7 - 1;
  std::string::size_type v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    size_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  std::string::size_type v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  size_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

void std::__shared_ptr_pointer<mav_router::device::controller_ios *,std::shared_ptr<mav_router::device::controller>::__shared_ptr_default_delete<mav_router::device::controller,mav_router::device::controller_ios>,std::allocator<mav_router::device::controller_ios>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<mav_router::device::controller_ios *,std::shared_ptr<mav_router::device::controller>::__shared_ptr_default_delete<mav_router::device::controller,mav_router::device::controller_ios>,std::allocator<mav_router::device::controller_ios>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<mav_router::device::controller_ios *,std::shared_ptr<mav_router::device::controller>::__shared_ptr_default_delete<mav_router::device::controller,mav_router::device::controller_ios>,std::allocator<mav_router::device::controller_ios>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002192B1B34) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002192B1B34 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002192B1B34)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002192B1B34 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t mav_router::device::shim::shim(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  *(void *)a1 = &unk_26CAA81F8;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
  unint64_t v6 = *(std::__shared_weak_count **)(a1 + 16);
  *(_DWORD *)(a1 + 24) = a3;
  uint64_t v7 = std::__shared_weak_count::lock(v6);
  size_t v8 = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 8) + 16);
  if (v9)
  {
    unsigned int v10 = *(_DWORD *)(a1 + 24);
    if (*(_DWORD *)(v9 + 4) > v10)
    {
      uint64_t v11 = *(void *)(v9 + 16) + 40 * v10;
      *(void *)(v11 + 24) = mav_router::device::shim::handle_transmit_static;
      *(void *)(v11 + 32) = a1;
    }
  }
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v8);
  }
  return a1;
}

void mav_router::device::shim::register_for_transmit(std::__shared_weak_count **this)
{
  uint64_t v2 = std::__shared_weak_count::lock(this[2]);
  uint64_t v3 = v2;
  uint64_t shared_weak_owners = this[1]->__shared_weak_owners_;
  if (shared_weak_owners)
  {
    unsigned int v5 = *((_DWORD *)this + 6);
    if (*(_DWORD *)(shared_weak_owners + 4) > v5)
    {
      uint64_t v6 = *(void *)(shared_weak_owners + 16) + 40 * v5;
      *(void *)(v6 + 24) = mav_router::device::shim::handle_transmit_static;
      *(void *)(v6 + 32) = this;
    }
  }
  if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void mav_router::device::shim::~shim(mav_router::device::shim *this)
{
  *(void *)this = &unk_26CAA81F8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t mav_router::device::shim::getDevice(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t result = 0;
  *a2 = *(_DWORD *)(a1 + 24);
  return result;
}

BOOL mav_router_channel_is_valid(unsigned int *a1, unsigned int a2)
{
  return !a1 || *a1 <= a2;
}

BOOL mav_router_device_is_valid(uint64_t a1, unsigned int a2)
{
  return !a1 || *(_DWORD *)(a1 + 4) <= a2;
}

uint64_t mav_router_get_device_muxed(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result = 1;
  if (a1 && a3 && *(_DWORD *)(a1 + 4) > a2)
  {
    uint64_t result = 0;
    *a3 = *(_DWORD *)(*(void *)(a1 + 16) + 40 * a2 + 16) > 1u;
  }
  return result;
}

uint64_t *mav_router::device::pci_shim::getDataBufferMap(mav_router::device::pci_shim *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&_MergedGlobals))
  {
    return &qword_26AB7A0F0;
  }
  qword_26AB7A100 = 0;
  qword_26AB7A0F8 = 0;
  qword_26AB7A0F0 = (uint64_t)&qword_26AB7A0F8;
  __cxa_guard_release(&_MergedGlobals);
  return &qword_26AB7A0F0;
}

uint64_t *mav_router::device::pci_shim::getIntToPCITransportMap(mav_router::device::pci_shim *this)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AB7A0E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AB7A0E8))
  {
    long long v6 = xmmword_2192B1BC0;
    std::map<unsigned int,PCITransportInterface>::map[abi:ne180100](&v3, (unsigned int *)&v6, 2);
    uint64_t v2 = (void *)v4;
    qword_26AB7A108 = (uint64_t)v3;
    qword_26AB7A110 = v4;
    qword_26AB7A118 = v5;
    if (v5)
    {
      *(void *)(v4 + 16) = &qword_26AB7A110;
      uint64_t v3 = &v4;
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v2 = 0;
    }
    else
    {
      qword_26AB7A108 = (uint64_t)&qword_26AB7A110;
    }
    std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(v2);
    __cxa_guard_release(&qword_26AB7A0E8);
  }
  return &qword_26AB7A108;
}

void sub_2192A9828(_Unwind_Exception *a1)
{
}

uint64_t mav_router::device::pci_shim::pci_shim(uint64_t a1, uint64_t *a2, int a3, uint64_t a4)
{
  long long v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v11 = *a2;
  size_t v12 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  mav_router::device::shim::shim(a1, &v11, a3);
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)a1 = &unk_26CAA8280;
  *(_DWORD *)(a1 + 48) = 0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(void *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 144) = *(_DWORD *)a4;
  uint64_t v7 = (std::string *)(a1 + 152);
  if (*(char *)(a4 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a4 + 16), *(void *)(a4 + 24));
  }
  else
  {
    long long v8 = *(_OWORD *)(a4 + 16);
    *(void *)(a1 + 168) = *(void *)(a4 + 32);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  uint64_t v9 = *(NSObject **)(a4 + 48);
  *(void *)(a1 + 176) = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  *(_DWORD *)(a1 + 184) = *(_DWORD *)(a4 + 56);
  *(unsigned char *)(a1 + 215) = 0;
  *(unsigned char *)(a1 + 192) = 0;
  return a1;
}

void sub_2192A9934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  size_t v12 = (std::__shared_weak_count *)v10[5];
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  void *v10 = &unk_26CAA81F8;
  unint64_t v13 = (std::__shared_weak_count *)v10[2];
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  _Unwind_Resume(exception_object);
}

void mav_router::device::pci_shim::~pci_shim(mav_router::device::pci_shim *this)
{
  *(void *)this = &unk_26CAA8280;
  if ((*((char *)this + 215) & 0x80000000) == 0)
  {
    uint64_t v2 = *((void *)this + 22);
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  operator delete(*((void **)this + 24));
  uint64_t v2 = *((void *)this + 22);
  if (v2) {
LABEL_3:
  }
    dispatch_release(v2);
LABEL_4:
  if ((*((char *)this + 175) & 0x80000000) == 0)
  {
    uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 5);
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  operator delete(*((void **)this + 19));
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v3) {
LABEL_6:
  }
    std::__shared_weak_count::__release_weak(v3);
LABEL_7:
  *(void *)this = &unk_26CAA81F8;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

{
  NSObject *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  *(void *)this = &unk_26CAA8280;
  if ((*((char *)this + 215) & 0x80000000) == 0)
  {
    uint64_t v2 = *((void *)this + 22);
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  operator delete(*((void **)this + 24));
  uint64_t v2 = *((void *)this + 22);
  if (v2) {
LABEL_3:
  }
    dispatch_release(v2);
LABEL_4:
  if ((*((char *)this + 175) & 0x80000000) == 0)
  {
    uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 5);
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  operator delete(*((void **)this + 19));
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v3) {
LABEL_6:
  }
    std::__shared_weak_count::__release_weak(v3);
LABEL_7:
  *(void *)this = &unk_26CAA81F8;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

{
  NSObject *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t vars8;

  *(void *)this = &unk_26CAA8280;
  if ((*((char *)this + 215) & 0x80000000) == 0)
  {
    uint64_t v2 = *((void *)this + 22);
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  operator delete(*((void **)this + 24));
  uint64_t v2 = *((void *)this + 22);
  if (v2) {
LABEL_3:
  }
    dispatch_release(v2);
LABEL_4:
  if ((*((char *)this + 175) & 0x80000000) == 0)
  {
    uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 5);
    if (!v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  operator delete(*((void **)this + 19));
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v3) {
LABEL_6:
  }
    std::__shared_weak_count::__release_weak(v3);
LABEL_7:
  *(void *)this = &unk_26CAA81F8;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(this);
}

uint64_t mav_router::device::pci_shim::init(mav_router::device::pci_shim *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 0x40000000;
  *(void *)&long long v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v7 + 1) = &__block_descriptor_tmp_0;
  int v8 = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, &v5);
  }
  uint64_t v2 = qword_26AB7A0D0;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
    int v3 = *((_DWORD *)this + 36);
    uint64_t v5 = 0x304000602;
    uint64_t v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(void *)((char *)&v7 + 6) = "BOOL mav_router::device::pci_shim::init()";
    HIWORD(v7) = 1024;
    int v8 = 67;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_2192A5000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  return 1;
}

uint64_t mav_router::device::pci_shim::engage(mav_router::device::pci_shim *this, dispatch_group_s *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v3 = *((void *)this + 22);
  if (v3) {
    dispatch_assert_queue_not_V2(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 5);
  if (!v4 || (v5 = *((void *)this + 4), (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&uint8_t buf[8] = 0x40000000;
  *(void *)&long long v38 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v38 + 1) = &__block_descriptor_tmp_0;
  LODWORD(v39) = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, buf);
  }
  int v8 = qword_26AB7A0D0;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
    int v9 = *((_DWORD *)this + 36);
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 3;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = 1;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v38) = 0;
    WORD2(v38) = 2080;
    *(void *)((char *)&v38 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::engage(dispatch_group_t)";
    HIWORD(v38) = 1024;
    LODWORD(v39) = 121;
    WORD2(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 6) = v9;
    _os_log_impl(&dword_2192A5000, v8, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", buf, 0x2Au);
  }
  int v10 = (os_unfair_lock_s *)((char *)this + 48);
  os_unfair_lock_lock((os_unfair_lock_t)this + 12);
  unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v40 = v11;
  long long v41 = v11;
  long long v38 = v11;
  long long v39 = v11;
  *(_OWORD *)buf = v11;
  inited = (mav_router::device::pci_shim *)TelephonyBasebandPCITransportInitParameters();
  *(_OWORD *)((char *)this + 56) = 0u;
  *((void *)this + 17) = 0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(void *)&long long v38 = &__block_literal_global;
  IntToPCITransportMap = mav_router::device::pci_shim::getIntToPCITransportMap(inited);
  uint64_t v14 = qword_26AB7A110;
  if (!qword_26AB7A110) {
    goto LABEL_22;
  }
  unsigned int v15 = *((_DWORD *)this + 36);
  long long v16 = &qword_26AB7A110;
  do
  {
    unsigned int v17 = *(_DWORD *)(v14 + 28);
    BOOL v18 = v17 >= v15;
    if (v17 >= v15) {
      uint64_t v19 = (uint64_t *)v14;
    }
    else {
      uint64_t v19 = (uint64_t *)(v14 + 8);
    }
    if (v18) {
      long long v16 = (uint64_t *)v14;
    }
    uint64_t v14 = *v19;
  }
  while (*v19);
  if (v16 == &qword_26AB7A110 || v15 < *((_DWORD *)v16 + 7)) {
LABEL_22:
  }
    long long v16 = &qword_26AB7A110;
  mav_router::device::pci_shim::getIntToPCITransportMap((mav_router::device::pci_shim *)IntToPCITransportMap);
  if (v16 == &qword_26AB7A110)
  {
    *(void *)block = MEMORY[0x263EF8330];
    uint64_t v32 = 0x40000000;
    *(void *)&long long v33 = ____mav_log_platform_os_log_handle_block_invoke;
    *((void *)&v33 + 1) = &__block_descriptor_tmp_0;
    int v34 = 3;
    if (qword_26AB7A0B0 == -1)
    {
      uint64_t v23 = qword_26AB7A0D0;
      if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
      {
LABEL_34:
        os_unfair_lock_unlock((os_unfair_lock_t)this + 12);
        uint64_t v21 = 7;
        goto LABEL_42;
      }
    }
    else
    {
      dispatch_once(&qword_26AB7A0B0, block);
      uint64_t v23 = qword_26AB7A0D0;
      if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO)) {
        goto LABEL_34;
      }
    }
    int v24 = *((_DWORD *)this + 36);
    *(_DWORD *)block = 67110402;
    *(_DWORD *)&block[4] = 3;
    uint64_t v32 = 0x400000000000400;
    LODWORD(v33) = 0;
    WORD2(v33) = 2080;
    *(void *)((char *)&v33 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::engage(dispatch_group_t)";
    HIWORD(v33) = 1024;
    int v34 = 138;
    __int16 v35 = 1024;
    int v36 = v24;
    _os_log_impl(&dword_2192A5000, v23, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:invalid interface %u", block, 0x2Au);
    goto LABEL_34;
  }
  *(_DWORD *)buf = *((_DWORD *)v16 + 8);
  DWORD2(v38) = 5000;
  LODWORD(v39) = v39 | 4;
  std::string::size_type v20 = (capabilities::radio *)pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  *(void *)((char *)&v39 + 4) = 0x180000000008;
  if (capabilities::radio::mavLegacy(v20)) {
    DWORD1(v39) = 4;
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 1174405120;
  v29[2] = ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke_2;
  v29[3] = &__block_descriptor_tmp_4_0;
  v29[4] = this;
  v29[5] = v5;
  int v30 = v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)&long long v40 = v29;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 1174405120;
  v27[2] = ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke_5;
  v27[3] = &__block_descriptor_tmp_8_0;
  v27[4] = this;
  v27[5] = v5;
  uint64_t v28 = v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *((void *)&v40 + 1) = v27;
  *(void *)&long long v41 = 0;
  if (*((void *)this + 22)) {
    *((void *)&v41 + 1) = *((void *)this + 22);
  }
  LODWORD(v42) = *((_DWORD *)this + 46);
  if ((TelephonyBasebandPCITransportCreate() & 1) == 0)
  {
    *(void *)block = MEMORY[0x263EF8330];
    uint64_t v32 = 0x40000000;
    *(void *)&long long v33 = ____mav_log_platform_os_log_handle_block_invoke;
    *((void *)&v33 + 1) = &__block_descriptor_tmp_0;
    int v34 = 3;
    if (qword_26AB7A0B0 == -1)
    {
      uint64_t v25 = qword_26AB7A0D0;
      if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO)) {
        goto LABEL_38;
      }
    }
    else
    {
      dispatch_once(&qword_26AB7A0B0, block);
      uint64_t v25 = qword_26AB7A0D0;
      if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
      {
LABEL_38:
        uint64_t v21 = 7;
        os_unfair_lock_unlock(v10);
        long long v22 = v28;
        if (!v28) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
    }
    *(_DWORD *)block = 67110146;
    *(_DWORD *)&block[4] = 3;
    uint64_t v32 = 0x400000000000400;
    LODWORD(v33) = 0;
    WORD2(v33) = 2080;
    *(void *)((char *)&v33 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::engage(dispatch_group_t)";
    HIWORD(v33) = 1024;
    int v34 = 187;
    _os_log_impl(&dword_2192A5000, v25, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:failed to create pci transport", block, 0x24u);
    goto LABEL_38;
  }
  uint64_t v21 = 0;
  os_unfair_lock_unlock(v10);
  long long v22 = v28;
  if (v28) {
LABEL_39:
  }
    std::__shared_weak_count::__release_weak(v22);
LABEL_40:
  if (v30) {
    std::__shared_weak_count::__release_weak(v30);
  }
LABEL_42:
  std::__shared_weak_count::__release_weak(v7);
  return v21;
}

void sub_2192AA33C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a15)
  {
    std::__shared_weak_count::__release_weak(a15);
    int v24 = a22;
    if (!a22)
    {
LABEL_3:
      std::__shared_weak_count::__release_weak(v22);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    int v24 = a22;
    if (!a22) {
      goto LABEL_3;
    }
  }
  std::__shared_weak_count::__release_weak(v24);
  std::__shared_weak_count::__release_weak(v22);
  _Unwind_Resume(a1);
}

void sub_2192AA380(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void sub_2192AA394(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void sub_2192AA3A8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void ___ZN10mav_router6device8pci_shim6engageEP16dispatch_group_s_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 0x40000000;
  *(void *)&long long v10 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v10 + 1) = &__block_descriptor_tmp_0;
  int v11 = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, &v8);
  }
  long long v7 = qword_26AB7A0D0;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = 0x304000802;
    uint64_t v9 = 0x400000000010400;
    WORD2(v10) = 2080;
    LODWORD(v10) = 0;
    *(void *)((char *)&v10 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::engage(dispatch_group_t)_block_invoke";
    HIWORD(v10) = 1024;
    int v11 = 132;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    __int16 v16 = 2048;
    uint64_t v17 = a4;
    _os_log_impl(&dword_2192A5000, v7, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:status %u, arg1 %p, arg2 %p", (uint8_t *)&v8, 0x3Eu);
  }
}

uint64_t mav_router::device::pci_shim::handleError(os_unfair_lock_s *this)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v2 = this + 12;
  os_unfair_lock_lock(this + 12);
  unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v53[7] = v3;
  v53[8] = v3;
  v53[5] = v3;
  v53[6] = v3;
  v53[3] = v3;
  v53[4] = v3;
  v53[1] = v3;
  v53[2] = v3;
  v53[0] = v3;
  long long v51 = v3;
  long long v52 = v3;
  long long v49 = v3;
  *(_OWORD *)__p = v3;
  long long v47 = v3;
  long long v48 = v3;
  long long v46 = v3;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v46);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v46, (uint64_t)"pci error: ", 11);
  uint64_t v4 = (void *)std::ostream::operator<<();
  uint64_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)". failed on I/O 0x", 18);
  *(_DWORD *)((char *)v5 + *(void *)(*v5 - 24) + 8) = *(_DWORD *)((unsigned char *)v5 + *(void *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  *(void *)buf = MEMORY[0x263EF8330];
  uint64_t v56 = 0x40000000;
  *(void *)&long long v57 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v57 + 1) = &__block_descriptor_tmp_0;
  int v58 = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, buf);
  }
  uint64_t v6 = qword_26AB7A0D0;
  if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO)) {
    goto LABEL_20;
  }
  if ((BYTE8(v52) & 0x10) != 0)
  {
    uint64_t v9 = v52;
    if ((unint64_t)v52 < *((void *)&v49 + 1))
    {
      *(void *)&long long v52 = *((void *)&v49 + 1);
      uint64_t v9 = *((void *)&v49 + 1);
    }
    long long v10 = (const void *)v49;
    size_t v7 = v9 - v49;
    if ((unint64_t)(v9 - v49) > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_47;
    }
  }
  else
  {
    if ((BYTE8(v52) & 8) == 0)
    {
      size_t v7 = 0;
      HIBYTE(v45) = 0;
      uint64_t v8 = __dst;
      goto LABEL_17;
    }
    long long v10 = (const void *)*((void *)&v47 + 1);
    size_t v7 = *((void *)&v48 + 1) - *((void *)&v47 + 1);
    if (*((void *)&v48 + 1) - *((void *)&v47 + 1) > 0x7FFFFFFFFFFFFFF7uLL) {
LABEL_47:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v7 >= 0x17)
  {
    uint64_t v11 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v11 = v7 | 7;
    }
    uint64_t v12 = v11 + 1;
    uint64_t v8 = (void **)operator new(v11 + 1);
    __dst[1] = (void *)v7;
    int64_t v45 = v12 | 0x8000000000000000;
    __dst[0] = v8;
    goto LABEL_16;
  }
  HIBYTE(v45) = v7;
  uint64_t v8 = __dst;
  if (v7) {
LABEL_16:
  }
    memmove(v8, v10, v7);
LABEL_17:
  *((unsigned char *)v8 + v7) = 0;
  int v13 = __dst;
  if (v45 < 0) {
    int v13 = (void **)__dst[0];
  }
  *(_DWORD *)buf = 67110402;
  *(_DWORD *)&buf[4] = 3;
  uint64_t v56 = 0x400000000010400;
  LODWORD(v57) = 0;
  WORD2(v57) = 2080;
  *(void *)((char *)&v57 + 6) = "void mav_router::device::pci_shim::handleError(IOReturn)";
  HIWORD(v57) = 1024;
  int v58 = 353;
  __int16 v59 = 2080;
  v60 = v13;
  _os_log_impl(&dword_2192A5000, v6, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:got error (%s)", buf, 0x2Eu);
  if (SHIBYTE(v45) < 0)
  {
    operator delete(__dst[0]);
    char v14 = BYTE8(v52);
    if ((BYTE8(v52) & 0x10) == 0) {
      goto LABEL_21;
    }
LABEL_25:
    uint64_t v18 = v52;
    if ((unint64_t)v52 < *((void *)&v49 + 1))
    {
      *(void *)&long long v52 = *((void *)&v49 + 1);
      uint64_t v18 = *((void *)&v49 + 1);
    }
    uint64_t v17 = (const void **)&v49;
    goto LABEL_28;
  }
LABEL_20:
  char v14 = BYTE8(v52);
  if ((BYTE8(v52) & 0x10) != 0) {
    goto LABEL_25;
  }
LABEL_21:
  if ((v14 & 8) == 0)
  {
    size_t v15 = 0;
    BYTE7(v57) = 0;
    __int16 v16 = buf;
    goto LABEL_36;
  }
  uint64_t v17 = (const void **)&v47 + 1;
  uint64_t v18 = *((void *)&v48 + 1);
LABEL_28:
  uint64_t v19 = *v17;
  size_t v15 = v18 - (void)*v17;
  if (v15 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v15 >= 0x17)
  {
    uint64_t v20 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v20 = v15 | 7;
    }
    uint64_t v21 = v20 + 1;
    __int16 v16 = operator new(v20 + 1);
    uint64_t v56 = v15;
    *(void *)&long long v57 = v21 | 0x8000000000000000;
    *(void *)buf = v16;
    goto LABEL_35;
  }
  BYTE7(v57) = v18 - *(unsigned char *)v17;
  __int16 v16 = buf;
  if (v15) {
LABEL_35:
  }
    memmove(v16, v19, v15);
LABEL_36:
  *((unsigned char *)v16 + v15) = 0;
  mav_router::device::pci_shim::setErrorReason_sync((uint64_t)this, (void **)buf);
  if (SBYTE7(v57) < 0)
  {
    operator delete(*(void **)buf);
    long long v22 = *(std::__shared_weak_count **)&this[4]._os_unfair_lock_opaque;
    if (!v22)
    {
LABEL_45:
      os_unfair_lock_unlock(v2);
      goto LABEL_63;
    }
  }
  else
  {
    long long v22 = *(std::__shared_weak_count **)&this[4]._os_unfair_lock_opaque;
    if (!v22) {
      goto LABEL_45;
    }
  }
  uint64_t v23 = std::__shared_weak_count::lock(v22);
  if (!v23) {
    goto LABEL_45;
  }
  int v24 = v23;
  uint64_t v25 = *(void *)&this[2]._os_unfair_lock_opaque;
  if (!v25) {
    goto LABEL_61;
  }
  std::string v26 = *(unsigned int **)(v25 + 16);
  std::string v27 = this + 48;
  if (SHIBYTE(this[53]._os_unfair_lock_opaque) < 0)
  {
    std::string v27 = *(os_unfair_lock_s **)&v27->_os_unfair_lock_opaque;
    if (!v26) {
      goto LABEL_52;
    }
  }
  else if (!v26)
  {
LABEL_52:
    int v31 = 1;
LABEL_53:
    int v43 = v31;
    goto LABEL_54;
  }
  uint32_t os_unfair_lock_opaque = this[6]._os_unfair_lock_opaque;
  if (v26[1] <= os_unfair_lock_opaque) {
    goto LABEL_52;
  }
  unint64_t v29 = *v26;
  if (!v29) {
    goto LABEL_61;
  }
  unint64_t v30 = 0;
  int v43 = 0;
  do
  {
    uint64_t v38 = *((void *)v26 + 1);
    long long v39 = *(_DWORD **)(v38 + 48 * v30 + 8);
    if (v39 && *v39 == os_unfair_lock_opaque)
    {
      long long v40 = *(void (**)(unsigned int *, unint64_t, os_unfair_lock_s *, void))(v38 + 48 * v30 + 32);
      if (v40)
      {
LABEL_67:
        v40(v26, v30, v27, *(void *)(v38 + 48 * v30 + 40));
        unint64_t v29 = *v26;
      }
      else
      {
        if (v30 + 1 >= v29)
        {
LABEL_80:
          int v31 = 4;
          goto LABEL_53;
        }
        long long v41 = (void (**)(unsigned int *, unint64_t, os_unfair_lock_s *, void))(v38 + 48 * v30++ + 80);
        while (1)
        {
          unint64_t v42 = *(v41 - 3);
          if (!v42 || *v42 != os_unfair_lock_opaque) {
            break;
          }
          long long v40 = *v41;
          if (*v41)
          {
            int v43 = 4;
            goto LABEL_67;
          }
          ++v30;
          v41 += 6;
          if (v30 >= v29) {
            goto LABEL_80;
          }
        }
        int v43 = 4;
      }
    }
    ++v30;
  }
  while (v30 < v29);
  if (!v43) {
    goto LABEL_61;
  }
LABEL_54:
  *(void *)buf = MEMORY[0x263EF8330];
  uint64_t v56 = 0x40000000;
  *(void *)&long long v57 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v57 + 1) = &__block_descriptor_tmp_0;
  int v58 = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, buf);
  }
  uint64_t v32 = qword_26AB7A0D0;
  BOOL v33 = 1;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 3;
    uint64_t v56 = 0x400000000010400;
    LODWORD(v57) = 0;
    WORD2(v57) = 2080;
    *(void *)((char *)&v57 + 6) = "void mav_router::device::pci_shim::handleError(IOReturn)";
    HIWORD(v57) = 1024;
    int v58 = 364;
    __int16 v59 = 1024;
    LODWORD(v60) = v43;
    _os_log_impl(&dword_2192A5000, v32, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:mav_router_device_error returned 0x%x", buf, 0x2Au);
    BOOL v33 = qword_26AB7A0B0 == -1;
  }
  *(void *)buf = MEMORY[0x263EF8330];
  uint64_t v56 = 0x40000000;
  *(void *)&long long v57 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v57 + 1) = &__block_descriptor_tmp_0;
  int v58 = 3;
  if (v33)
  {
    int v34 = qword_26AB7A0D0;
    if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO)) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
  dispatch_once(&qword_26AB7A0B0, buf);
  int v34 = qword_26AB7A0D0;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
LABEL_60:
    __int16 v35 = *(void ***)(v25 + 16);
    uint32_t v36 = this[6]._os_unfair_lock_opaque;
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)&buf[4] = 3;
    uint64_t v56 = 0x400000000010400;
    LODWORD(v57) = 0;
    WORD2(v57) = 2080;
    *(void *)((char *)&v57 + 6) = "void mav_router::device::pci_shim::handleError(IOReturn)";
    HIWORD(v57) = 1024;
    int v58 = 366;
    __int16 v59 = 2048;
    v60 = v35;
    __int16 v61 = 1024;
    uint32_t v62 = v36;
    _os_log_impl(&dword_2192A5000, v34, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:router %p, device %u", buf, 0x34u);
  }
LABEL_61:
  os_unfair_lock_unlock(v2);
  if (!atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
LABEL_63:
  *(void *)&long long v46 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v46 + *(void *)(v46 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v46 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v51) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D485D20](v53);
}

void sub_2192AADC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN10mav_router6device8pci_shimEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN10mav_router6device8pci_shimEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t mav_router::device::pci_shim::tearDown(os_unfair_lock_s *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 0x40000000;
  *(void *)&long long v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v7 + 1) = &__block_descriptor_tmp_0;
  int v8 = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, &v5);
  }
  uint64_t v2 = qword_26AB7A0D0;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
    uint32_t os_unfair_lock_opaque = this[36]._os_unfair_lock_opaque;
    uint64_t v5 = 0x304000602;
    uint64_t v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(void *)((char *)&v7 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::tearDown()";
    HIWORD(v7) = 1024;
    int v8 = 197;
    __int16 v9 = 1024;
    uint32_t v10 = os_unfair_lock_opaque;
    _os_log_impl(&dword_2192A5000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  os_unfair_lock_lock(this + 12);
  TelephonyUtilTransportFree();
  os_unfair_lock_unlock(this + 12);
  return 0;
}

uint64_t mav_router::device::pci_shim::recover(os_unfair_lock_s *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 0x40000000;
  *(void *)&long long v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v7 + 1) = &__block_descriptor_tmp_0;
  int v8 = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, &v5);
  }
  uint64_t v2 = qword_26AB7A0D0;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
    uint32_t os_unfair_lock_opaque = this[36]._os_unfair_lock_opaque;
    uint64_t v5 = 0x304000602;
    uint64_t v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(void *)((char *)&v7 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::recover()";
    HIWORD(v7) = 1024;
    int v8 = 210;
    __int16 v9 = 1024;
    uint32_t v10 = os_unfair_lock_opaque;
    _os_log_impl(&dword_2192A5000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  os_unfair_lock_lock(this + 12);
  if (SHIBYTE(this[53]._os_unfair_lock_opaque) < 0)
  {
    **(unsigned char **)&this[48]._uint32_t os_unfair_lock_opaque = 0;
    *(void *)&this[50]._uint32_t os_unfair_lock_opaque = 0;
  }
  else
  {
    LOBYTE(this[48]._os_unfair_lock_opaque) = 0;
    HIBYTE(this[53]._os_unfair_lock_opaque) = 0;
  }
  os_unfair_lock_unlock(this + 12);
  return 0;
}

uint64_t mav_router::device::pci_shim::clearErrorReason_sync(uint64_t this)
{
  if (*(char *)(this + 215) < 0)
  {
    **(unsigned char **)(this + 192) = 0;
    *(void *)(this + 200) = 0;
  }
  else
  {
    *(unsigned char *)(this + 192) = 0;
    *(unsigned char *)(this + 215) = 0;
  }
  return this;
}

uint64_t mav_router::device::pci_shim::enterLowPower(mav_router::device::pci_shim *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 0x40000000;
  *(void *)&long long v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v7 + 1) = &__block_descriptor_tmp_0;
  int v8 = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, &v5);
  }
  uint64_t v2 = qword_26AB7A0D0;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
    int v3 = *((_DWORD *)this + 36);
    uint64_t v5 = 0x304000602;
    uint64_t v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(void *)((char *)&v7 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::enterLowPower()";
    HIWORD(v7) = 1024;
    int v8 = 223;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_2192A5000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  return 0;
}

uint64_t mav_router::device::pci_shim::exitLowPower(mav_router::device::pci_shim *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 0x40000000;
  *(void *)&long long v7 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v7 + 1) = &__block_descriptor_tmp_0;
  int v8 = 3;
  if (qword_26AB7A0B0 != -1) {
    dispatch_once(&qword_26AB7A0B0, &v5);
  }
  uint64_t v2 = qword_26AB7A0D0;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO))
  {
    int v3 = *((_DWORD *)this + 36);
    uint64_t v5 = 0x304000602;
    uint64_t v6 = 0x400000000010400;
    LODWORD(v7) = 0;
    WORD2(v7) = 2080;
    *(void *)((char *)&v7 + 6) = "virtual mav_router_result_t mav_router::device::pci_shim::exitLowPower()";
    HIWORD(v7) = 1024;
    int v8 = 230;
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_2192A5000, v2, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:service %u", (uint8_t *)&v5, 0x2Au);
  }
  return 0;
}

uint64_t mav_router::device::pci_shim::hasFatalErrorOccurred(mav_router::device::pci_shim *this, BOOL *a2)
{
  if (*((char *)this + 215) < 0) {
    *a2 = *((void *)this + 25) != 0;
  }
  else {
    *a2 = *((unsigned char *)this + 215) != 0;
  }
  return 0;
}

BOOL mav_router::device::pci_shim::isError_sync(mav_router::device::pci_shim *this)
{
  if (*((char *)this + 215) < 0) {
    return *((void *)this + 25) != 0;
  }
  else {
    return *((unsigned char *)this + 215) != 0;
  }
}

uint64_t mav_router::device::pci_shim::getFatalErrorReason(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a1 + 215) < 0)
  {
    std::string::__init_copy_ctor_external(&v4, *(const std::string::value_type **)(a1 + 192), *(void *)(a1 + 200));
    if ((*(char *)(a2 + 23) & 0x80000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  std::string v4 = *(std::string *)(a1 + 192);
  if (*(char *)(a2 + 23) < 0) {
LABEL_3:
  }
    operator delete(*(void **)a2);
LABEL_4:
  *(std::string *)a2 = v4;
  return 0;
}

void mav_router::device::pci_shim::getErrorReason_sync(mav_router::device::pci_shim *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 215) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 24), *((void *)this + 25));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *((_OWORD *)this + 12);
    a2->__r_.__value_.__r.__words[2] = *((void *)this + 26);
  }
}

uint64_t mav_router::device::pci_shim::snapshot()
{
  return 0;
}

uint64_t mav_router::device::pci_shim::getMaxPayload(mav_router::device::pci_shim *this, unint64_t *a2)
{
  int v3 = (capabilities::radio *)pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  capabilities::radio::mavLegacy(v3);
  *a2 = 6144;
  return 0;
}

void **mav_router::device::pci_shim::setErrorReason_sync(uint64_t a1, void **a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 0x40000000;
  *(void *)&long long v13 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v13 + 1) = &__block_descriptor_tmp_0;
  int v14 = 3;
  if (qword_26AB7A0B0 == -1)
  {
    std::string v4 = qword_26AB7A0D0;
    if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_26AB7A0B0, &v11);
    std::string v4 = qword_26AB7A0D0;
    if (!os_log_type_enabled((os_log_t)qword_26AB7A0D0, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
  }
  if (*((char *)a2 + 23) >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  uint64_t v11 = 0x304000602;
  uint64_t v12 = 0x400000000000400;
  LODWORD(v13) = 0;
  WORD2(v13) = 2080;
  *(void *)((char *)&v13 + 6) = "void mav_router::device::pci_shim::setErrorReason_sync(const std::string &)";
  HIWORD(v13) = 1024;
  int v14 = 322;
  __int16 v15 = 2080;
  __int16 v16 = v5;
  _os_log_impl(&dword_2192A5000, v4, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:reason %s", (uint8_t *)&v11, 0x2Eu);
LABEL_7:
  uint64_t result = (void **)(a1 + 192);
  if (*(char *)(a1 + 215) < 0)
  {
    if (result != a2 && !*(void *)(a1 + 200))
    {
      int v8 = *((char *)a2 + 23);
      if (v8 >= 0) {
        __int16 v9 = a2;
      }
      else {
        __int16 v9 = *a2;
      }
      if (v8 >= 0) {
        size_t v10 = *((unsigned __int8 *)a2 + 23);
      }
      else {
        size_t v10 = (size_t)a2[1];
      }
      return std::string::__assign_no_alias<false>(result, v9, v10);
    }
  }
  else if (result != a2 && !*(unsigned char *)(a1 + 215))
  {
    if (*((char *)a2 + 23) < 0)
    {
      return (void **)std::string::__assign_no_alias<true>(result, *a2, (size_t)a2[1]);
    }
    else
    {
      long long v7 = *(_OWORD *)a2;
      *(void *)(a1 + 208) = a2[2];
      *(_OWORD *)uint64_t result = v7;
    }
  }
  return result;
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_2192AB920(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x21D485D20](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D485D20](a1 + 112);
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t **std::map<unsigned int,PCITransportInterface>::map[abi:ne180100](uint64_t **a1, unsigned int *a2, uint64_t a3)
{
  a1[1] = 0;
  uint64_t v4 = (uint64_t *)(a1 + 1);
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  if (a3)
  {
    uint64_t v5 = a2;
    std::string::size_type v6 = &a2[2 * a3];
    while (1)
    {
      std::string::size_type v7 = a1[1];
      int v8 = v4;
      if (*a1 != v4)
      {
        __int16 v9 = a1[1];
        size_t v10 = v4;
        if (v7)
        {
          do
          {
            int v8 = v9;
            __int16 v9 = (uint64_t *)v9[1];
          }
          while (v9);
        }
        else
        {
          do
          {
            int v8 = (uint64_t *)v10[2];
            BOOL v11 = *v8 == (void)v10;
            size_t v10 = v8;
          }
          while (v11);
        }
        unsigned int v12 = *v5;
        if (*((_DWORD *)v8 + 7) >= *v5) {
          break;
        }
      }
      if (v7) {
        long long v13 = (uint64_t **)v8;
      }
      else {
        long long v13 = (uint64_t **)v4;
      }
      if (v7) {
        int v14 = (uint64_t **)(v8 + 1);
      }
      else {
        int v14 = (uint64_t **)v4;
      }
      if (!*v14) {
        goto LABEL_26;
      }
LABEL_4:
      v5 += 2;
      if (v5 == v6) {
        return a1;
      }
    }
    int v14 = (uint64_t **)v4;
    long long v13 = (uint64_t **)v4;
    if (v7)
    {
      __int16 v15 = a1[1];
      while (1)
      {
        while (1)
        {
          long long v13 = (uint64_t **)v15;
          unsigned int v16 = *((_DWORD *)v15 + 7);
          if (v16 <= v12) {
            break;
          }
          __int16 v15 = *v13;
          int v14 = v13;
          if (!*v13) {
            goto LABEL_26;
          }
        }
        if (v16 >= v12) {
          goto LABEL_4;
        }
        __int16 v15 = v13[1];
        if (!v15)
        {
          int v14 = v13 + 1;
          break;
        }
      }
    }
LABEL_26:
    uint64_t v17 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v17 + 28) = *(void *)v5;
    *uint64_t v17 = 0;
    v17[1] = 0;
    v17[2] = (uint64_t)v13;
    *int v14 = v17;
    uint64_t v18 = (uint64_t *)**a1;
    if (v18)
    {
      *a1 = v18;
      uint64_t v17 = *v14;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v17);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    goto LABEL_4;
  }
  return a1;
}

void sub_2192ABC6C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(v1);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned int,PCITransportInterface>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCITransportInterface>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCITransportInterface>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void *ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init()
{
  uint64_t result = operator new(0x18uLL);
  result[1] = 0;
  result[2] = 0;
  *uint64_t result = &unk_26CAA8538;
  ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::fsInstance = (uint64_t)result;
  return result;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x21D485C40](v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      size_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x21D485C50](v13);
  return a1;
}

void sub_2192ABEA4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x21D485C50](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2192ABE84);
}

void sub_2192ABEF8(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        long long v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        long long v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0) {
        unsigned int v16 = __b;
      }
      else {
        unsigned int v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_2192AC0EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__n128 mav_router::service::transport_shim::create@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v4 = (char *)operator new(0x70uLL);
  mav_router::service::transport_shim::transport_shim(v4, a1);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)uint64_t v4 = &unk_26CAA83F8;
  uint64_t v5 = *(void *)(a1 + 8);
  *((void *)v4 + 3) = *(void *)a1;
  *((void *)v4 + 4) = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)v4 + 5) = *(unsigned int *)(a1 + 16);
  uint64_t v6 = dispatch_group_create();
  *((void *)v4 + 6) = v6;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  v4[104] = 1;
  dispatch_group_enter(v6);
  v19.n128_u64[0] = (unint64_t)v4;
  uint64_t v7 = (std::__shared_weak_count *)operator new(0x20uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = &v7->__shared_owners_;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA8498;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  v19.n128_u64[1] = (unint64_t)v7;
  int v9 = (std::__shared_weak_count *)*((void *)v4 + 2);
  if (v9)
  {
    if (v9->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *((void *)v4 + 1) = v4;
      *((void *)v4 + 2) = v7;
      std::__shared_weak_count::__release_weak(v9);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v4 + 1) = v4;
    *((void *)v4 + 2) = v7;
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_8:
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  uint64_t v10 = *(void *)(*((void *)v4 + 3) + 16);
  unsigned int v11 = *((_DWORD *)v4 + 10);
  size_t v12 = operator new(0x10uLL);
  long long v13 = *(std::__shared_weak_count **)(v19.n128_u64[0] + 16);
  if (!v13 || (uint64_t v14 = *(void *)(v19.n128_u64[0] + 8), (v15 = std::__shared_weak_count::lock(v13)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  unsigned int v16 = v15;
  void *v12 = v14;
  v12[1] = v15;
  atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (v10 && *(_DWORD *)v10 > v11)
  {
    uint64_t v17 = *(void *)(v10 + 8) + 48 * v11;
    *(void *)(v17 + 16) = mav_router::service::transport_shim_private::handle_receive;
    *(void *)(v17 + 24) = v12;
  }
  if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v16);
  }
  __n128 result = v19;
  *a2 = v19;
  return result;
}

void sub_2192AC34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192AC360(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_2192AC394(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2192AC3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  operator delete(v9);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void *mav_router::service::transport_shim::transport_shim(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *a1 = &unk_26CAA83C0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 0x40000000;
  *(void *)&long long v10 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v10 + 1) = &__block_descriptor_tmp_0;
  int v11 = 2;
  if (qword_26AB7A0A8 == -1)
  {
    uint64_t v4 = qword_26AB7A0C8;
    if (!os_log_type_enabled((os_log_t)qword_26AB7A0C8, OS_LOG_TYPE_INFO)) {
      return a1;
    }
  }
  else
  {
    dispatch_once(&qword_26AB7A0A8, &v8);
    uint64_t v4 = qword_26AB7A0C8;
    if (!os_log_type_enabled((os_log_t)qword_26AB7A0C8, OS_LOG_TYPE_INFO)) {
      return a1;
    }
  }
  uint64_t v5 = *(unsigned int *)(a2 + 16);
  if (v5 > 0xA) {
    uint64_t v6 = "unknown channel";
  }
  else {
    uint64_t v6 = mav_router_channel_cstrings[v5];
  }
  uint64_t v8 = 0x204000602;
  uint64_t v9 = 0x400000000010400;
  LODWORD(v10) = 0;
  WORD2(v10) = 2080;
  *(void *)((char *)&v10 + 6) = "mav_router::service::transport_shim::transport_shim(const parameters &)";
  HIWORD(v10) = 1024;
  int v11 = 353;
  __int16 v12 = 2080;
  long long v13 = v6;
  _os_log_impl(&dword_2192A5000, v4, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:with channel %s", (uint8_t *)&v8, 0x2Eu);
  return a1;
}

uint64_t mav_router::service::transport_shim::get_shim@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v2 = *(uint64_t **)(result + 80);
  if (v2)
  {
    uint64_t v4 = *v2;
    uint64_t v3 = v2[1];
    if (v3) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
    }
    *a2 = v4;
    a2[1] = v3;
  }
  return result;
}

void mav_router::service::transport_shim_private::~transport_shim_private(mav_router::service::transport_shim_private *this)
{
  mav_router::service::transport_shim_private::~transport_shim_private(this);

  operator delete(v1);
}

{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  std::__shared_weak_count *v6;
  uint64_t v7;
  void **v8;
  NSObject *v9;
  unint64_t v10;
  void **v11;
  void **v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  std::__shared_weak_count *v20;
  std::__shared_weak_count *v21;

  *(void *)this = &unk_26CAA83F8;
  uint64_t v2 = *(void *)(*((void *)this + 3) + 16);
  if (!v2)
  {
    uint64_t v5 = (void *)0xAAAAAAAAAAAAAAAALL;
    goto LABEL_6;
  }
  uint64_t v3 = *((_DWORD *)this + 10);
  if (*(_DWORD *)v2 <= v3)
  {
    uint64_t v5 = (void *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v6 = (std::__shared_weak_count *)MEMORY[0xAAAAAAAAAAAAAAB2];
    if (!MEMORY[0xAAAAAAAAAAAAAAB2]) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v4 = *(void *)(v2 + 8) + 48 * v3;
  *(void *)(v4 + 16) = 0;
  uint64_t v5 = *(void **)(v4 + 24);
  if (v5)
  {
LABEL_6:
    uint64_t v6 = (std::__shared_weak_count *)v5[1];
    if (!v6)
    {
LABEL_8:
      operator delete(v5);
      goto LABEL_9;
    }
LABEL_7:
    std::__shared_weak_count::__release_weak(v6);
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v7 = *((void *)this + 12);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void **)*((void *)this + 8);
      uint64_t v9 = (*(void **)((char *)v8 + ((*((void *)this + 11) >> 6) & 0x3FFFFFFFFFFFFF8)))[*((void *)this + 11) & 0x1FFLL];
      long long v10 = *((void *)this + 11) + 1;
      *((void *)this + 11) = v10;
      *((void *)this + 12) = v7 - 1;
      if (v10 >= 0x400)
      {
        operator delete(*v8);
        *((void *)this + 8) += 8;
        *((void *)this + 11) -= 512;
      }
      dispatch_release(v9);
      uint64_t v7 = *((void *)this + 12);
    }
    while (v7);
    dispatch_group_enter(*((dispatch_group_t *)this + 6));
  }
  dispatch_group_leave(*((dispatch_group_t *)this + 6));
  dispatch_release(*((dispatch_object_t *)this + 6));
  int v11 = (void **)*((void *)this + 8);
  __int16 v12 = (void **)*((void *)this + 9);
  *((void *)this + 12) = 0;
  long long v13 = (char *)v12 - (char *)v11;
  if ((unint64_t)((char *)v12 - (char *)v11) >= 0x11)
  {
    do
    {
      operator delete(*v11);
      __int16 v12 = (void **)*((void *)this + 9);
      int v11 = (void **)(*((void *)this + 8) + 8);
      *((void *)this + 8) = v11;
      long long v13 = (char *)v12 - (char *)v11;
    }
    while ((unint64_t)((char *)v12 - (char *)v11) > 0x10);
  }
  uint64_t v14 = v13 >> 3;
  if (v14 == 1)
  {
    uint64_t v15 = 256;
    goto LABEL_21;
  }
  if (v14 == 2)
  {
    uint64_t v15 = 512;
LABEL_21:
    *((void *)this + 11) = v15;
  }
  if (v11 != v12)
  {
    do
    {
      unsigned int v16 = *v11++;
      operator delete(v16);
    }
    while (v11 != v12);
    uint64_t v18 = *((void *)this + 8);
    uint64_t v17 = *((void *)this + 9);
    if (v17 != v18) {
      *((void *)this + 9) = v17 + ((v18 - v17 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  __n128 v19 = (void *)*((void *)this + 7);
  if (v19) {
    operator delete(v19);
  }
  uint64_t v20 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
    uint64_t v21 = (std::__shared_weak_count *)*((void *)this + 2);
    if (!v21) {
      return;
    }
  }
  else
  {
    uint64_t v21 = (std::__shared_weak_count *)*((void *)this + 2);
    if (!v21) {
      return;
    }
  }
  std::__shared_weak_count::__release_weak(v21);
}

std::__shared_weak_count *mav_router::service::transport_shim_private::apply_transport(uint64_t a1, uint64_t (**a2)(uint64_t a1, const void *a2, unsigned int a3, unsigned int *a4))
{
  uint64_t v4 = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))operator new(0x10uLL);
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 16);
  *(void *)uint64_t v4 = *(void *)(a1 + 8);
  if (!v5)
  {
    *((void *)v4 + 1) = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  __n128 result = std::__shared_weak_count::lock(v5);
  *((void *)v4 + 1) = result;
  if (!result) {
    goto LABEL_5;
  }
  a2[10] = v4;
  *a2 = mav_router::service::transport_shim_private::write_func;
  a2[1] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::read_func;
  a2[2] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::unblock_read_func;
  a2[3] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::flush_read_func;
  a2[7] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::is_valid_func;
  a2[6] = (uint64_t (*)(uint64_t, const void *, unsigned int, unsigned int *))mav_router::service::transport_shim_private::free_func;
  return result;
}

void sub_2192AC6A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t mav_router::service::transport_shim_private::write_func(uint64_t a1, const void *a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 80)) {
    return 0;
  }
  *(void *)buf = MEMORY[0x263EF8330];
  uint64_t v25 = 0x40000000;
  *(void *)&long long v26 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v26 + 1) = &__block_descriptor_tmp_0;
  int v27 = 2;
  if (qword_26AB7A0A8 != -1) {
    dispatch_once(&qword_26AB7A0A8, buf);
  }
  uint64_t v8 = qword_26AB7A0C8;
  if (os_log_type_enabled((os_log_t)qword_26AB7A0C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111170;
    *(_DWORD *)&buf[4] = 2;
    uint64_t v25 = 0x400000000030400;
    LODWORD(v26) = 0;
    WORD2(v26) = 2080;
    *(void *)((char *)&v26 + 6) = "static void mav_router::service::transport_shim_private::log_write(const unsigned ch"
                                    "ar *, unsigned int)";
    HIWORD(v26) = 1024;
    int v27 = 153;
    __int16 v28 = 2080;
    unint64_t v29 = &unk_2192B27D7;
    __int16 v30 = 1024;
    unsigned int v31 = a3;
    __int16 v32 = 1040;
    unsigned int v33 = a3;
    __int16 v34 = 2096;
    __int16 v35 = a2;
    _os_log_impl(&dword_2192A5000, v8, OS_LOG_TYPE_DEBUG, "[%04x.%04u.%04u] %s:%u:%s (%u bytes): %.*P", buf, 0x44u);
  }
  uint64_t v9 = *(uint64_t **)(a1 + 80);
  uint64_t v11 = *v9;
  long long v10 = (std::__shared_weak_count *)v9[1];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v23 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_data_t v13 = dispatch_data_create(a2, a3, global_queue, 0);
  uint64_t v14 = v13;
  if (v13) {
    uint64_t v23 = v13;
  }
  uint64_t v15 = *(void *)(*(void *)(v11 + 24) + 16);
  if (!v15
    || (unsigned int v16 = *(_DWORD *)(v11 + 40), *(_DWORD *)v15 <= v16)
    || (uint64_t v17 = *(unsigned int **)(*(void *)(v15 + 8) + 48 * v16 + 8)) == 0
    || (uint64_t v18 = (unsigned int (*)(uint64_t, uint64_t, NSObject *, void))*((void *)v17 + 3)) == 0
    || (uint64_t v19 = *v17, *(_DWORD *)(v15 + 4) <= v19))
  {
LABEL_20:
    *a4 = 0;
    dispatch_release(v14);
    uint64_t v21 = 0;
    if (!v10) {
      return v21;
    }
    goto LABEL_21;
  }
  if (*(_DWORD *)(*(void *)(v15 + 16) + 40 * v19 + 16) >= 2u)
  {
    *(_DWORD *)&buf[4] = 0;
    uint64_t v25 = (uint64_t)&v23;
    *(_DWORD *)buf = v16;
    int v20 = mav_mux_encode((uint64_t)buf);
    uint64_t v14 = v23;
    if (v20) {
      goto LABEL_20;
    }
    uint64_t v18 = (unsigned int (*)(uint64_t, uint64_t, NSObject *, void))*((void *)v17 + 3);
    uint64_t v19 = *v17;
  }
  if (v18(v15, v19, v14, *((void *)v17 + 4)))
  {
    uint64_t v14 = v23;
    goto LABEL_20;
  }
  *a4 = a3;
  uint64_t v21 = 1;
  if (!v10) {
    return v21;
  }
LABEL_21:
  if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  return v21;
}

uint64_t mav_router::service::transport_shim_private::read_func(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6 = *(uint64_t **)(a1 + 80);
  if (!v6) {
    return 0;
  }
  unsigned int v7 = a6;
  *a4 = 0;
  uint64_t v12 = *v6;
  uint64_t v11 = (std::__shared_weak_count *)v6[1];
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int64_t v13 = 1000000 * a6;
  while (2)
  {
    if (v7 == -1)
    {
      while (1)
      {
        if (dispatch_group_wait(*(dispatch_group_t *)(v12 + 48), 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_42;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v12 + 44));
        if (*(void *)(v12 + 96)) {
          break;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 44));
      }
LABEL_12:
      unsigned int v32 = v7;
      uint64_t v15 = a5;
      unsigned int v16 = *(NSObject **)(*(void *)(*(void *)(v12 + 64) + ((*(void *)(v12 + 88) >> 6) & 0x3FFFFFFFFFFFFF8))
                         + 8 * (*(void *)(v12 + 88) & 0x1FFLL));
      unsigned int size = dispatch_data_get_size(v16);
      if (a3 >= size) {
        size_t v18 = size;
      }
      else {
        size_t v18 = a3;
      }
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2000000000;
      v39[3] = a2;
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2000000000;
      int v38 = -1431655766;
      unsigned int v19 = dispatch_data_get_size(v16);
      int v34 = 0;
      if (v18 > v19 || v18 == -1) {
        int v21 = v19;
      }
      else {
        int v21 = v18;
      }
      int v38 = v21;
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 1107296256;
      applier[2] = ___ZL19mav_buffer_copy_rawPvS_jjPj_block_invoke;
      applier[3] = &__block_descriptor_tmp_2;
      int v36 = 0;
      applier[4] = v37;
      applier[5] = v39;
      applier[6] = &v34;
      BOOL v22 = dispatch_data_apply(v16, applier);
      _Block_object_dispose(v37, 8);
      _Block_object_dispose(v39, 8);
      BOOL v23 = v22 && v34 == v18;
      if (!v23 || (unsigned int v24 = dispatch_data_get_size(v16), v24 < v18))
      {
        a5 = v15;
        *a4 += v18;
        if (v16) {
          goto LABEL_39;
        }
        goto LABEL_35;
      }
      if (v24 == v18)
      {
        uint64_t v25 = 0;
      }
      else
      {
        dispatch_data_t subrange = dispatch_data_create_subrange(v16, v18, v24 - v18);
        uint64_t v25 = subrange;
        if (!subrange)
        {
LABEL_34:
          a5 = v15;
          *a4 += v18;
          if (v16) {
            goto LABEL_39;
          }
LABEL_35:
          int v27 = *(void ***)(v12 + 64);
          uint64_t v28 = *(void *)(v12 + 96) - 1;
          unint64_t v29 = *(void *)(v12 + 88) + 1;
          *(void *)(v12 + 88) = v29;
          *(void *)(v12 + 96) = v28;
          if (v29 >= 0x400)
          {
            operator delete(*v27);
            *(void *)(v12 + 64) += 8;
            uint64_t v28 = *(void *)(v12 + 96);
            *(void *)(v12 + 88) -= 512;
          }
          if (!v28) {
            dispatch_group_enter(*(dispatch_group_t *)(v12 + 48));
          }
LABEL_39:
          os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 44));
          uint64_t v30 = 1;
          if (a5)
          {
            a2 += v18;
            a3 -= v18;
            unsigned int v7 = v32;
            if (a3) {
              continue;
            }
          }
          goto LABEL_43;
        }
      }
      dispatch_release(v16);
      unsigned int v16 = v25;
      goto LABEL_34;
    }
    break;
  }
  while (1)
  {
    dispatch_time_t v14 = dispatch_time(0, v13);
    if (dispatch_group_wait(*(dispatch_group_t *)(v12 + 48), v14)) {
      break;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 44));
    if (*(void *)(v12 + 96)) {
      goto LABEL_12;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 44));
  }
LABEL_42:
  uint64_t v30 = 0;
LABEL_43:
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  return v30;
}

BOOL mav_router::service::transport_shim_private::unblock_read_func(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 80);
  if (!v1) {
    return v1 != 0;
  }
  uint64_t v3 = *v1;
  uint64_t v2 = (std::__shared_weak_count *)v1[1];
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 44));
  uint64_t v4 = *(void *)(v3 + 96);
  if (!v4)
  {
    *(unsigned char *)(v3 + 104) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
    if (!v2) {
      return v1 != 0;
    }
    goto LABEL_11;
  }
  do
  {
    uint64_t v5 = *(void ***)(v3 + 64);
    uint64_t v6 = (*(void **)((char *)v5 + ((*(void *)(v3 + 88) >> 6) & 0x3FFFFFFFFFFFFF8)))[*(void *)(v3 + 88) & 0x1FFLL];
    unint64_t v7 = *(void *)(v3 + 88) + 1;
    *(void *)(v3 + 88) = v7;
    *(void *)(v3 + 96) = v4 - 1;
    if (v7 >= 0x400)
    {
      operator delete(*v5);
      *(void *)(v3 + 64) += 8;
      *(void *)(v3 + 88) -= 512;
    }
    dispatch_release(v6);
    uint64_t v4 = *(void *)(v3 + 96);
  }
  while (v4);
  dispatch_group_enter(*(dispatch_group_t *)(v3 + 48));
  *(unsigned char *)(v3 + 104) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
  if (v2)
  {
LABEL_11:
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return v1 != 0;
}

uint64_t mav_router::service::transport_shim_private::flush_read_func(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 80);
  if (!v1) {
    return 1;
  }
  uint64_t v3 = *v1;
  uint64_t v2 = (std::__shared_weak_count *)v1[1];
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 44));
  uint64_t v4 = *(void *)(v3 + 96);
  if (v4)
  {
    do
    {
      uint64_t v6 = *(void ***)(v3 + 64);
      unint64_t v7 = (*(void **)((char *)v6 + ((*(void *)(v3 + 88) >> 6) & 0x3FFFFFFFFFFFFF8)))[*(void *)(v3 + 88) & 0x1FFLL];
      unint64_t v8 = *(void *)(v3 + 88) + 1;
      *(void *)(v3 + 88) = v8;
      *(void *)(v3 + 96) = v4 - 1;
      if (v8 >= 0x400)
      {
        operator delete(*v6);
        *(void *)(v3 + 64) += 8;
        *(void *)(v3 + 88) -= 512;
      }
      dispatch_release(v7);
      uint64_t v4 = *(void *)(v3 + 96);
    }
    while (v4);
    dispatch_group_enter(*(dispatch_group_t *)(v3 + 48));
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
    if (!v2) {
      return 1;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 44));
    if (!v2) {
      return 1;
    }
  }
  if (atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return 1;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  return 1;
}

BOOL mav_router::service::transport_shim_private::is_valid_func(uint64_t a1)
{
  return *(void *)(a1 + 80) != 0;
}

uint64_t mav_router::service::transport_shim_private::free_func(uint64_t a1)
{
  uint64_t v1 = *(os_unfair_lock_s ***)(a1 + 80);
  if (!v1) {
    return 1;
  }
  uint64_t v4 = *v1;
  uint64_t v3 = (std::__shared_weak_count *)v1[1];
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v5 = (std::__shared_weak_count *)v1[1];
    if (v5)
    {
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    operator delete(v1);
    os_unfair_lock_lock(v4 + 11);
    *(void *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    os_unfair_lock_unlock(v4 + 11);
    if (atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      return 1;
    }
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    return 1;
  }
  else
  {
    operator delete(*(void **)(a1 + 80));
    os_unfair_lock_lock(v4 + 11);
    *(void *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    os_unfair_lock_unlock(v4 + 11);
    return 1;
  }
}

uint64_t ___ZL19mav_buffer_copy_rawPvS_jjPj_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5)
{
  int v5 = *(_DWORD *)(a1 + 56) - a3;
  unint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v6) {
    BOOL v7 = v5 < (int)a5;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    return 1;
  }
  uint64_t v10 = v5 & ~(v5 >> 31);
  if (v6 >= a5) {
    size_t v11 = a5;
  }
  else {
    size_t v11 = v6;
  }
  memcpy(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (const void *)(a4 + v10), v11);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) -= v11;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v11;
  **(_DWORD **)(a1 + 48) += v11;
  return 1;
}

uint64_t mav_router::service::transport_shim_private::handle_receive(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t *a4)
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  int v5 = (std::__shared_weak_count *)a4[1];
  if (!v5)
  {
    v123 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = *a4;
  atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v123 = std::__shared_weak_count::lock(v5);
  if (!v123 || !v6)
  {
LABEL_19:
    dispatch_release(a3);
    BOOL v23 = v123;
    if (!v123) {
      goto LABEL_121;
    }
    goto LABEL_119;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 44));
  if (*(unsigned char *)(v6 + 104))
  {
    BOOL v7 = *(char **)(v6 + 64);
    unint64_t v8 = *(char **)(v6 + 72);
    uint64_t v9 = v8 - v7;
    if (v8 == v7) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = ((v8 - v7) << 6) - 1;
    }
    unint64_t v11 = *(void *)(v6 + 88);
    unint64_t v12 = v11 + *(void *)(v6 + 96);
    uint64_t v122 = *(void *)(v6 + 96);
    if (v10 != v12)
    {
      uint64_t v24 = *(void *)(v6 + 96);
      goto LABEL_106;
    }
    if (v11 >= 0x200)
    {
      *(void *)(v6 + 88) = v11 - 512;
      int64_t v13 = v7 + 8;
      uint64_t v14 = *(void *)v7;
      *(void *)(v6 + 64) = v7 + 8;
      if (v8 != *(char **)(v6 + 80))
      {
LABEL_103:
        *(void *)unint64_t v8 = v14;
        goto LABEL_104;
      }
      uint64_t v15 = *(char **)(v6 + 56);
      if (v13 > v15)
      {
        uint64_t v16 = (v13 - v15) >> 3;
        if (v16 >= -1) {
          uint64_t v17 = v16 + 1;
        }
        else {
          uint64_t v17 = v16 + 2;
        }
        uint64_t v18 = v17 >> 1;
        uint64_t v19 = -v18;
        int v20 = &v13[-8 * v18];
        int64_t v21 = v8 - v13;
        if (v8 != v13)
        {
          memmove(&v13[-8 * v18], v13, v8 - v13);
          unint64_t v8 = *(char **)(v6 + 64);
        }
        BOOL v22 = &v8[8 * v19];
        unint64_t v8 = &v20[v21];
        *(void *)(v6 + 64) = v22;
        *(void *)(v6 + 72) = &v20[v21];
        goto LABEL_103;
      }
      if (v8 == v15) {
        unint64_t v34 = 1;
      }
      else {
        unint64_t v34 = (v8 - v15) >> 2;
      }
      if (!(v34 >> 61))
      {
        __int16 v35 = (char *)operator new(8 * v34);
        int v36 = &v35[8 * (v34 >> 2)];
        int64_t v38 = v8 - v13;
        BOOL v37 = v8 == v13;
        unint64_t v8 = v36;
        if (v37) {
          goto LABEL_101;
        }
        unint64_t v8 = &v36[v38 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v39 = v38 - 8;
        if (v39 >= 0x38)
        {
          v91 = &v35[8 * (v34 >> 2)];
          long long v40 = v91;
          if ((unint64_t)(v91 - v13) >= 0x20)
          {
            uint64_t v92 = (v39 >> 3) + 1;
            uint64_t v93 = 8 * (v92 & 0x3FFFFFFFFFFFFFFCLL);
            long long v40 = &v36[v93];
            v13 += v93;
            v94 = (long long *)(v7 + 24);
            v95 = v91 + 16;
            uint64_t v96 = v92 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v97 = *v94;
              *(v95 - 1) = *(v94 - 1);
              _OWORD *v95 = v97;
              v94 += 2;
              v95 += 2;
              v96 -= 4;
            }
            while (v96);
            if (v92 == (v92 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_101:
              *(void *)(v6 + 56) = v35;
              *(void *)(v6 + 64) = v36;
              *(void *)(v6 + 72) = v8;
              *(void *)(v6 + 80) = &v35[8 * v34];
              if (v15)
              {
                operator delete(v15);
                unint64_t v8 = *(char **)(v6 + 72);
              }
              goto LABEL_103;
            }
          }
        }
        else
        {
          long long v40 = &v35[8 * (v34 >> 2)];
        }
        do
        {
          uint64_t v98 = *(void *)v13;
          v13 += 8;
          *(void *)long long v40 = v98;
          v40 += 8;
        }
        while (v40 != v8);
        goto LABEL_101;
      }
LABEL_143:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v25 = *(char **)(v6 + 80);
    long long v26 = *(char **)(v6 + 56);
    uint64_t v120 = v9 >> 3;
    if (v9 >> 3 >= (unint64_t)((v25 - v26) >> 3))
    {
      if (v25 == v26) {
        unint64_t v29 = 1;
      }
      else {
        unint64_t v29 = (v25 - v26) >> 2;
      }
      if (!(v29 >> 61))
      {
        uint64_t v30 = (char *)operator new(8 * v29);
        v119 = operator new(0x1000uLL);
        unsigned int v31 = &v30[8 * v120];
        unsigned int v32 = &v30[8 * v29];
        if (v120 == v29)
        {
          if (v9 < 1)
          {
            if (v8 == v7) {
              unint64_t v42 = 1;
            }
            else {
              unint64_t v42 = v9 >> 2;
            }
            if (v42 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            unsigned int v31 = (char *)operator new(8 * v42);
            unsigned int v32 = &v31[8 * v42];
            operator delete(v30);
            BOOL v7 = *(char **)(v6 + 64);
            unint64_t v8 = *(char **)(v6 + 72);
            uint64_t v30 = v31;
          }
          else
          {
            unint64_t v33 = v120 + 2;
            if (v120 >= -1) {
              unint64_t v33 = v120 + 1;
            }
            v31 -= 8 * (v33 >> 1);
          }
        }
        *(void *)unsigned int v31 = v119;
        int v43 = v31 + 8;
        if (v8 != v7)
        {
          do
          {
            if (v31 == v30)
            {
              if (v43 >= v32)
              {
                if (v32 == v30) {
                  unint64_t v50 = 1;
                }
                else {
                  unint64_t v50 = (v32 - v30) >> 2;
                }
                if (v50 >> 61) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                long long v51 = (char *)operator new(8 * v50);
                long long v52 = v51;
                unint64_t v53 = (v50 + 3) >> 2;
                unsigned int v31 = &v51[8 * v53];
                int64_t v54 = v43 - v30;
                BOOL v37 = v43 == v30;
                int v43 = v31;
                if (!v37)
                {
                  int v43 = &v31[v54 & 0xFFFFFFFFFFFFFFF8];
                  unint64_t v55 = v54 - 8;
                  uint64_t v56 = &v51[8 * v53];
                  long long v57 = v30;
                  if (v55 < 0x38) {
                    goto LABEL_147;
                  }
                  uint64_t v58 = 8 * v53;
                  uint64_t v56 = &v51[8 * v53];
                  long long v57 = v30;
                  if ((unint64_t)(v56 - v30) < 0x20) {
                    goto LABEL_147;
                  }
                  uint64_t v59 = (v55 >> 3) + 1;
                  uint64_t v60 = 8 * (v59 & 0x3FFFFFFFFFFFFFFCLL);
                  uint64_t v56 = &v31[v60];
                  long long v57 = &v30[v60];
                  __int16 v61 = (long long *)(v30 + 16);
                  uint32_t v62 = &v51[v58 + 16];
                  uint64_t v63 = v59 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    long long v64 = *v61;
                    *((_OWORD *)v62 - 1) = *(v61 - 1);
                    *(_OWORD *)uint32_t v62 = v64;
                    v61 += 2;
                    v62 += 32;
                    v63 -= 4;
                  }
                  while (v63);
                  if (v59 != (v59 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_147:
                    do
                    {
                      uint64_t v65 = *(void *)v57;
                      v57 += 8;
                      *(void *)uint64_t v56 = v65;
                      v56 += 8;
                    }
                    while (v56 != v43);
                  }
                }
                unsigned int v32 = &v51[8 * v50];
                operator delete(v30);
                uint64_t v30 = v52;
              }
              else
              {
                uint64_t v46 = (v32 - v43) >> 3;
                if (v46 >= -1) {
                  uint64_t v47 = v46 + 1;
                }
                else {
                  uint64_t v47 = v46 + 2;
                }
                uint64_t v48 = v47 >> 1;
                unsigned int v31 = &v30[8 * (v47 >> 1)];
                long long v49 = v30;
                if (v43 != v30)
                {
                  memmove(v31, v30, v43 - v30);
                  long long v49 = v43;
                }
                int v43 = (char *)v49 + 8 * v48;
              }
            }
            uint64_t v45 = *((void *)v8 - 1);
            v8 -= 8;
            *((void *)v31 - 1) = v45;
            v31 -= 8;
          }
          while (v8 != *(char **)(v6 + 64));
        }
        v44 = *(void **)(v6 + 56);
        *(void *)(v6 + 56) = v30;
        *(void *)(v6 + 64) = v31;
        *(void *)(v6 + 72) = v43;
        *(void *)(v6 + 80) = v32;
        if (v44) {
          operator delete(v44);
        }
        goto LABEL_105;
      }
      goto LABEL_143;
    }
    int v27 = operator new(0x1000uLL);
    uint64_t v28 = v27;
    if (v25 != v8)
    {
      *(void *)unint64_t v8 = v27;
LABEL_104:
      *(void *)(v6 + 72) += 8;
LABEL_105:
      BOOL v7 = *(char **)(v6 + 64);
      uint64_t v24 = *(void *)(v6 + 96);
      unint64_t v12 = *(void *)(v6 + 88) + v24;
LABEL_106:
      *(void *)(*(void *)&v7[(v12 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v12 & 0x1FF)) = a3;
      *(void *)(v6 + 96) = v24 + 1;
      uint64_t applier = MEMORY[0x263EF8330];
      uint64_t v129 = 0x40000000;
      *(void *)&long long v130 = ____mav_log_platform_os_log_handle_block_invoke;
      *((void *)&v130 + 1) = &__block_descriptor_tmp_0;
      LODWORD(v131) = 2;
      if (qword_26AB7A0A8 == -1)
      {
        if (os_log_type_enabled((os_log_t)qword_26AB7A0C8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_108;
        }
      }
      else
      {
        dispatch_once(&qword_26AB7A0A8, &applier);
        if (os_log_type_enabled((os_log_t)qword_26AB7A0C8, OS_LOG_TYPE_DEBUG))
        {
LABEL_108:
          unsigned int size = dispatch_data_get_size(a3);
          size_t v100 = size;
          if (size)
          {
            v101 = operator new(size);
            int v121 = v101 + v100;
            bzero(v101, v100);
          }
          else
          {
            v101 = 0;
            int v121 = 0;
          }
          v127[0] = 0;
          v127[1] = v127;
          v127[2] = 0x2000000000;
          v127[3] = v101;
          v125[0] = 0;
          v125[1] = v125;
          v125[2] = 0x2000000000;
          int v126 = -1431655766;
          int v124 = 0;
          int v126 = dispatch_data_get_size(a3);
          uint64_t applier = MEMORY[0x263EF8330];
          uint64_t v129 = 1107296256;
          *(void *)&long long v130 = ___ZL19mav_buffer_copy_rawPvS_jjPj_block_invoke;
          *((void *)&v130 + 1) = &__block_descriptor_tmp_2;
          *(_DWORD *)&v132[8] = 0;
          *(void *)&long long v131 = v125;
          *((void *)&v131 + 1) = v127;
          *(void *)v132 = &v124;
          dispatch_data_apply(a3, &applier);
          _Block_object_dispose(v125, 8);
          _Block_object_dispose(v127, 8);
          uint64_t applier = MEMORY[0x263EF8330];
          uint64_t v129 = 0x40000000;
          *(void *)&long long v130 = ____mav_log_platform_os_log_handle_block_invoke;
          *((void *)&v130 + 1) = &__block_descriptor_tmp_0;
          LODWORD(v131) = 2;
          if (qword_26AB7A0A8 == -1)
          {
            v102 = qword_26AB7A0C8;
            if (!os_log_type_enabled((os_log_t)qword_26AB7A0C8, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_114;
            }
          }
          else
          {
            dispatch_once(&qword_26AB7A0A8, &applier);
            v102 = qword_26AB7A0C8;
            if (!os_log_type_enabled((os_log_t)qword_26AB7A0C8, OS_LOG_TYPE_DEBUG))
            {
LABEL_114:
              if (v101) {
                operator delete(v101);
              }
              goto LABEL_116;
            }
          }
          uint64_t applier = 0x204000902;
          uint64_t v129 = 0x400000000030400;
          LODWORD(v130) = 0;
          WORD2(v130) = 2080;
          *(void *)((char *)&v130 + 6) = "static void mav_router::service::transport_shim_private::log_received(mav_buffer_t)";
          HIWORD(v130) = 1024;
          LODWORD(v131) = 91;
          WORD2(v131) = 2080;
          *(void *)((char *)&v131 + 6) = &unk_2192B27D7;
          HIWORD(v131) = 1024;
          *(_DWORD *)v132 = v121 - v101;
          *(_WORD *)&v132[4] = 1040;
          *(_DWORD *)&v132[6] = v121 - v101;
          *(_WORD *)&v132[10] = 2096;
          v133 = v101;
          _os_log_impl(&dword_2192A5000, v102, OS_LOG_TYPE_DEBUG, "[%04x.%04u.%04u] %s:%u:%s (%u bytes): %.*P", (uint8_t *)&applier, 0x44u);
          goto LABEL_114;
        }
      }
LABEL_116:
      if (!v122) {
        dispatch_group_leave(*(dispatch_group_t *)(v6 + 48));
      }
      goto LABEL_118;
    }
    if (v7 == v26)
    {
      if (v8 == v7) {
        unint64_t v66 = 1;
      }
      else {
        unint64_t v66 = (v25 - v7) >> 2;
      }
      if (v66 >> 61) {
        goto LABEL_143;
      }
      v67 = (char *)operator new(8 * v66);
      unint64_t v68 = (v66 + 3) >> 2;
      long long v41 = &v67[8 * v68];
      v69 = v41;
      if (v8 != v7)
      {
        v69 = &v41[8 * v120];
        v70 = &v67[8 * v68];
        v71 = v7;
        if ((unint64_t)(v9 - 8) < 0x38) {
          goto LABEL_148;
        }
        v72 = &v67[8 * v68];
        v70 = v72;
        v71 = v7;
        if ((unint64_t)(v72 - v7) < 0x20) {
          goto LABEL_148;
        }
        unint64_t v73 = ((unint64_t)(v9 - 8) >> 3) + 1;
        uint64_t v74 = 8 * (v73 & 0x3FFFFFFFFFFFFFFCLL);
        v70 = &v41[v74];
        v71 = &v7[v74];
        v75 = (long long *)(v7 + 16);
        v76 = v72 + 16;
        uint64_t v77 = v73 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v78 = *v75;
          *(v76 - 1) = *(v75 - 1);
          _OWORD *v76 = v78;
          v75 += 2;
          v76 += 2;
          v77 -= 4;
        }
        while (v77);
        if (v73 != (v73 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_148:
          do
          {
            uint64_t v79 = *(void *)v71;
            v71 += 8;
            *(void *)v70 = v79;
            v70 += 8;
          }
          while (v70 != v69);
        }
      }
      *(void *)(v6 + 56) = v67;
      *(void *)(v6 + 64) = v41;
      *(void *)(v6 + 72) = v69;
      *(void *)(v6 + 80) = &v67[8 * v66];
      if (v7)
      {
        operator delete(v7);
        long long v41 = *(char **)(v6 + 64);
      }
    }
    else
    {
      long long v41 = v7;
    }
    *((void *)v41 - 1) = v28;
    v80 = *(char **)(v6 + 64);
    v81 = *(char **)(v6 + 72);
    *(void *)(v6 + 64) = v80 - 8;
    uint64_t v82 = *((void *)v80 - 1);
    *(void *)(v6 + 64) = v80;
    if (v81 != *(char **)(v6 + 80))
    {
LABEL_88:
      *(void *)v81 = v82;
      goto LABEL_104;
    }
    v83 = *(char **)(v6 + 56);
    if (v80 > v83)
    {
      uint64_t v84 = (v80 - v83) >> 3;
      if (v84 >= -1) {
        uint64_t v85 = v84 + 1;
      }
      else {
        uint64_t v85 = v84 + 2;
      }
      uint64_t v86 = v85 >> 1;
      uint64_t v87 = -v86;
      v88 = &v80[-8 * v86];
      size_t v89 = v81 - v80;
      if (v89)
      {
        memmove(&v80[-8 * v86], v80, v89);
        v80 = *(char **)(v6 + 64);
      }
      v90 = &v88[v89];
      *(void *)(v6 + 64) = &v80[8 * v87];
      *(void *)(v6 + 72) = v90;
      *(void *)v90 = v82;
      goto LABEL_104;
    }
    if (v81 == v83) {
      unint64_t v104 = 1;
    }
    else {
      unint64_t v104 = (v81 - v83) >> 2;
    }
    if (v104 >> 61) {
      goto LABEL_143;
    }
    v105 = (char *)operator new(8 * v104);
    v106 = &v105[8 * (v104 >> 2)];
    int64_t v107 = v81 - v80;
    BOOL v37 = v81 == v80;
    v81 = v106;
    if (!v37)
    {
      v81 = &v106[v107 & 0xFFFFFFFFFFFFFFF8];
      unint64_t v108 = v107 - 8;
      if (v108 < 0x38)
      {
        v109 = &v105[8 * (v104 >> 2)];
        do
        {
LABEL_135:
          uint64_t v118 = *(void *)v80;
          v80 += 8;
          *(void *)v109 = v118;
          v109 += 8;
        }
        while (v109 != v81);
        goto LABEL_136;
      }
      v110 = &v105[8 * (v104 >> 2)];
      v109 = v110;
      if ((unint64_t)(v110 - v80) < 0x20) {
        goto LABEL_135;
      }
      uint64_t v111 = (v108 >> 3) + 1;
      uint64_t v112 = 8 * (v111 & 0x3FFFFFFFFFFFFFFCLL);
      v109 = &v106[v112];
      v113 = &v80[v112];
      v114 = (long long *)(v80 + 16);
      v115 = v110 + 16;
      uint64_t v116 = v111 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v117 = *v114;
        *(v115 - 1) = *(v114 - 1);
        _OWORD *v115 = v117;
        v114 += 2;
        v115 += 2;
        v116 -= 4;
      }
      while (v116);
      v80 = v113;
      if (v111 != (v111 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_135;
      }
    }
LABEL_136:
    *(void *)(v6 + 56) = v105;
    *(void *)(v6 + 64) = v106;
    *(void *)(v6 + 72) = v81;
    *(void *)(v6 + 80) = &v105[8 * v104];
    if (v83)
    {
      operator delete(v83);
      v81 = *(char **)(v6 + 72);
    }
    goto LABEL_88;
  }
  dispatch_release(a3);
LABEL_118:
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 44));
  BOOL v23 = v123;
LABEL_119:
  if (!atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
LABEL_121:
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  return 0;
}

void sub_2192ADE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12)
{
  operator delete(__p);
  operator delete(v13);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  std::__shared_weak_count::__release_weak(v12);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_ptr_pointer<mav_router::service::transport_shim_private *,std::shared_ptr<mav_router::service::transport_shim_private>::__shared_ptr_default_delete<mav_router::service::transport_shim_private,mav_router::service::transport_shim_private>,std::allocator<mav_router::service::transport_shim_private>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<mav_router::service::transport_shim_private *,std::shared_ptr<mav_router::service::transport_shim_private>::__shared_ptr_default_delete<mav_router::service::transport_shim_private,mav_router::service::transport_shim_private>,std::allocator<mav_router::service::transport_shim_private>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<mav_router::service::transport_shim_private *,std::shared_ptr<mav_router::service::transport_shim_private>::__shared_ptr_default_delete<mav_router::service::transport_shim_private,mav_router::service::transport_shim_private>,std::allocator<mav_router::service::transport_shim_private>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002192B1DADLL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002192B1DADLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002192B1DADLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002192B1DADLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t mav_router_service_register_receive(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 1;
  if (a1 && a3 && *(_DWORD *)a1 > a2)
  {
    uint64_t result = 0;
    uint64_t v6 = *(void *)(a1 + 8) + 48 * a2;
    *(void *)(v6 + 16) = a3;
    *(void *)(v6 + 24) = a4;
  }
  return result;
}

uint64_t mav_router_service_unregister_receive(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t result = 1;
  if (a1 && a3 && *(_DWORD *)a1 > a2)
  {
    uint64_t result = 0;
    uint64_t v5 = *(void *)(a1 + 8) + 48 * a2;
    *(void *)(v5 + 16) = 0;
    *a3 = *(void *)(v5 + 24);
  }
  return result;
}

uint64_t mav_router_service_register_error_handler(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 1;
  if (a1 && a3 && *(_DWORD *)a1 > a2)
  {
    uint64_t result = 0;
    uint64_t v6 = *(void *)(a1 + 8) + 48 * a2;
    *(void *)(v6 + 32) = a3;
    *(void *)(v6 + 40) = a4;
  }
  return result;
}

uint64_t mav_router_service_unregister_error_handler(uint64_t a1, unsigned int a2)
{
  if (!a1 || *(_DWORD *)a1 <= a2) {
    return 1;
  }
  uint64_t result = 0;
  uint64_t v4 = *(void *)(a1 + 8) + 48 * a2;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  return result;
}

uint64_t mav_router_init_context(unsigned int *a1)
{
  bzero(*((void **)a1 + 1), 48 * *a1);
  uint64_t v2 = *a1;
  if (v2)
  {
    uint64_t v3 = *((void *)a1 + 1);
    if (v2 == 1)
    {
      uint64_t v4 = 0;
LABEL_7:
      BOOL v7 = (_DWORD *)(v3 + 48 * v4);
      do
      {
        *BOOL v7 = v4;
        v7 += 12;
        ++v4;
      }
      while (v2 != v4);
      goto LABEL_9;
    }
    uint64_t v5 = 0;
    uint64_t v4 = v2 & 0xFFFFFFFE;
    uint64_t v6 = (_DWORD *)*((void *)a1 + 1);
    do
    {
      *uint64_t v6 = v5;
      v6[12] = v5 + 1;
      v5 += 2;
      v6 += 24;
    }
    while (v4 != v5);
    if (v4 != v2) {
      goto LABEL_7;
    }
  }
LABEL_9:
  bzero(*((void **)a1 + 2), 40 * a1[1]);
  uint64_t v8 = a1[1];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = *((void *)a1 + 2);
  if (v8 == 1)
  {
    uint64_t v10 = 0;
LABEL_15:
    int64_t v13 = (_DWORD *)(v9 + 40 * v10);
    do
    {
      _DWORD *v13 = v10;
      v13 += 10;
      ++v10;
    }
    while (v8 != v10);
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v10 = v8 & 0xFFFFFFFE;
  unint64_t v12 = (_DWORD *)*((void *)a1 + 2);
  do
  {
    _DWORD *v12 = v11;
    v12[10] = v11 + 1;
    v11 += 2;
    v12 += 20;
  }
  while (v10 != v11);
  if (v10 != v8) {
    goto LABEL_15;
  }
  return 0;
}

uint64_t mav_router_route(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (!a1 || *(_DWORD *)a1 <= a2 || *(_DWORD *)(a1 + 4) <= a3) {
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v5 = v3 + 40 * a3;
  *(void *)(v4 + 48 * a2 + 8) = v5;
  int v6 = *(_DWORD *)(v5 + 16);
  *(_DWORD *)(v5 + 16) = v6 + 1;
  uint64_t result = 0;
  if (!v6) {
    *(void *)(v3 + 40 * a3 + 8) = v4 + 48 * a2;
  }
  return result;
}

uint64_t mav_router_unroute(unsigned int *a1, unsigned int a2)
{
  if (!a1) {
    return 1;
  }
  uint64_t v2 = *a1;
  if (v2 <= a2) {
    return 1;
  }
  uint64_t v3 = *((void *)a1 + 1);
  uint64_t v4 = v3 + 48 * a2;
  uint64_t v7 = *(void *)(v4 + 8);
  uint64_t v5 = (void *)(v4 + 8);
  uint64_t v6 = v7;
  if (!v7) {
    return 3;
  }
  int v8 = *(_DWORD *)(v6 + 16);
  *(_DWORD *)(v6 + 16) = v8 - 1;
  if (v8 == 1)
  {
    uint64_t result = 0;
    *(void *)(v6 + 8) = 0;
    *uint64_t v5 = 0;
  }
  else if (v8 == 2)
  {
    while (1)
    {
      uint64_t v9 = *(void *)(v3 + 8);
      if (v9 == v6) {
        break;
      }
      v3 += 48;
      if (!--v2)
      {
        uint64_t result = v9 != v6;
        *uint64_t v5 = 0;
        return result;
      }
    }
    *(void *)(v6 + 8) = v3;
    uint64_t result = 0;
    *uint64_t v5 = 0;
  }
  else
  {
    uint64_t result = 0;
    *uint64_t v5 = 0;
  }
  return result;
}

uint64_t mav_router_unroute_all(unsigned int *a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t v1 = *a1;
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *((void *)a1 + 1);
    do
    {
      uint64_t v4 = v3 + 48 * v2;
      uint64_t v7 = *(void *)(v4 + 8);
      uint64_t v5 = (void *)(v4 + 8);
      uint64_t v6 = v7;
      if (v7)
      {
        int v8 = *(_DWORD *)(v6 + 16);
        *(_DWORD *)(v6 + 16) = v8 - 1;
        if (v8 == 1)
        {
          *(void *)(v6 + 8) = 0;
        }
        else if (v8 == 2)
        {
          uint64_t v9 = v1;
          for (uint64_t i = v3; *(void *)(i + 8) != v6; i += 48)
          {
            if (!--v9)
            {
              *uint64_t v5 = 0;
              return 1;
            }
          }
          *(void *)(v6 + 8) = i;
        }
        *uint64_t v5 = 0;
      }
      ++v2;
    }
    while (v2 != v1);
  }
  return 0;
}

uint64_t mav_router_swap(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (!a1) {
    return 1;
  }
  if (*(_DWORD *)a1 <= a2 || *(_DWORD *)a1 <= a3) {
    return 1;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = v5 + 48 * a2;
  uint64_t v9 = *(void *)(v6 + 8);
  uint64_t v7 = (void *)(v6 + 8);
  uint64_t v8 = v9;
  if (!v9) {
    return 1;
  }
  uint64_t v10 = v5 + 48 * a3;
  uint64_t v13 = *(void *)(v10 + 8);
  uint64_t v11 = v10 + 8;
  uint64_t v12 = v13;
  if (!v13) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)uint64_t v11 = v8;
  *uint64_t v7 = v12;
  uint64_t v15 = *(void *)(a1 + 8);
  *(void *)(v12 + 8) = v15 + 48 * a2;
  *(void *)(*(void *)v11 + 8) = v15 + 48 * a3;
  return result;
}

uint64_t mav_router_get_pci_control_device(int a1)
{
  return (a1 + 13);
}

uint64_t mav_router_get_hsic_control_device(int a1)
{
  return (2 * a1 + 4);
}

uint64_t mav_router_get_qmi_channel(int a1)
{
  return (a1 + 4);
}

void mav_router_t::create(long long *a1@<X0>, std::__shared_weak_count **a2@<X8>)
{
  *a2 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  a2[1] = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = (char *)operator new(0x68uLL);
  long long v24 = *a1;
  if (*((char *)a1 + 39) < 0) {
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a1 + 2), *((void *)a1 + 3));
  }
  else {
    std::string __p = *(std::string *)(a1 + 1);
  }
  uint64_t v5 = *((void *)a1 + 5);
  dispatch_object_t object = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  uint64_t v27 = *((void *)a1 + 6);
  unsigned int v28 = *((_DWORD *)a1 + 14);
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v6 = operator new(0x18uLL);
  *((void *)v4 + 3) = 0;
  *((void *)v4 + 2) = v6;
  *((void *)v4 + 4) = 0;
  *(_OWORD *)(v4 + 40) = v24;
  uint64_t v7 = (std::string *)(v4 + 56);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v7, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((void *)v4 + 9) = *((void *)&__p.__r_.__value_.__l + 2);
  }
  uint64_t v8 = object;
  *((void *)v4 + 10) = object;
  if (v8) {
    dispatch_retain(v8);
  }
  *((void *)v4 + 11) = v27;
  *((_DWORD *)v4 + 24) = v28;
  uint64_t v9 = HIDWORD(v27);
  uint64_t v10 = *((void *)v4 + 2);
  *(_DWORD *)uint64_t v10 = HIDWORD(v27);
  uint64_t v11 = v28;
  *(_DWORD *)(v10 + 4) = v28;
  *(void *)(v10 + 8) = operator new[](48 * v9);
  *(void *)(v10 + 16) = operator new[](40 * v11);
  *a2 = (std::__shared_weak_count *)v4;
  uint64_t v12 = (std::__shared_weak_count *)operator new(0x20uLL);
  v12->__shared_owners_ = 0;
  p_shared_owners = &v12->__shared_owners_;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA84E8;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  a2[1] = v12;
  v23[0] = 0;
  uint64_t v14 = (std::__shared_weak_count *)*((void *)v4 + 1);
  if (!v14)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)uint64_t v4 = v4;
    *((void *)v4 + 1) = v12;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v14->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)uint64_t v4 = v4;
    *((void *)v4 + 1) = v12;
    std::__shared_weak_count::__release_weak(v14);
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_16:
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
LABEL_17:
  if (v23[0])
  {
    mav_router_t::~mav_router_t(v23[0]);
    operator delete(v15);
  }
  if (object) {
    dispatch_release(object);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  uint64_t v17 = *a2;
  uint64_t v16 = a2[1];
  int64_t v21 = *a2;
  BOOL v22 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  mav_router::device::controller::create(&v21, v23);
  std::__shared_count v18 = *(std::__shared_count *)v23;
  v23[0] = 0;
  v23[1] = 0;
  shared_owners = (std::__shared_weak_count *)v17[1].__shared_owners_;
  v17[1].std::__shared_count = v18;
  if (shared_owners && !atomic_fetch_add(&shared_owners->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))shared_owners->__on_zero_shared)(shared_owners);
    std::__shared_weak_count::__release_weak(shared_owners);
  }
  int v20 = (std::__shared_weak_count *)v23[1];
  if (v23[1] && !atomic_fetch_add((atomic_ullong *volatile)v23[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  if (v22) {
    std::__shared_weak_count::__release_weak(v22);
  }
}

void sub_2192AE6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100](v6);
  uint64_t v8 = (std::__shared_weak_count *)v5[1];
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  mav_router_parameters_t::~mav_router_parameters_t((mav_router_parameters_t *)va);
  operator delete(v5);
  _Unwind_Resume(a1);
}

void mav_router_parameters_t::~mav_router_parameters_t(mav_router_parameters_t *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2) {
    dispatch_release(v2);
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

void mav_router_t::create(void *a1@<X0>, uint64_t a2@<X1>, std::__shared_weak_count **a3@<X8>)
{
  *(void *)(a2 + 52) = *a1;
  long long v6 = *(_OWORD *)a2;
  if ((*(char *)(a2 + 39) & 0x80000000) == 0)
  {
    std::string __p = *(std::string *)(a2 + 16);
    uint64_t v5 = *(NSObject **)(a2 + 40);
    dispatch_object_t object = v5;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 16), *(void *)(a2 + 24));
  uint64_t v5 = *(NSObject **)(a2 + 40);
  dispatch_object_t object = v5;
  if (v5) {
LABEL_3:
  }
    dispatch_retain(v5);
LABEL_4:
  uint64_t v9 = *(void *)(a2 + 48);
  int v10 = *(_DWORD *)(a2 + 56);
  mav_router_t::create(&v6, a3);
  if (object) {
    dispatch_release(object);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2192AE8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void mav_router_t::create(void *a1@<X0>, int a2@<W1>, std::__shared_weak_count **a3@<X8>)
{
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  long long v17 = v6;
  long long v13 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = (char *)operator new(0x38uLL);
  uint64_t v14 = v7;
  long long v15 = xmmword_2192B1E20;
  strcpy(v7, "/var/wireless/Library/Logs/CoreTelephonyTraceScratch");
  unint64_t v16 = 0;
  *(void *)&long long v17 = 0xB00000015;
  DWORD2(v17) = 17;
  LODWORD(v13) = a2;
  long long v8 = v13;
  std::string::__init_copy_ctor_external(&__p, v7, 0x34uLL);
  dispatch_object_t object = 0;
  uint64_t v11 = v17;
  int v12 = DWORD2(v17);
  mav_router_t::create(a1, (uint64_t)&v8, a3);
  if (object) {
    dispatch_release(object);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  operator delete(v7);
}

void sub_2192AE9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

void sub_2192AE9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  mav_router_parameters_t::~mav_router_parameters_t((mav_router_parameters_t *)va);
  _Unwind_Resume(a1);
}

uint64_t mav_router_t::get_channel_for_service(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 8))();
}

mav_router_t **std::unique_ptr<mav_router_t>::~unique_ptr[abi:ne180100](mav_router_t **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    mav_router_t::~mav_router_t(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<mav_router_t *,std::shared_ptr<mav_router_t>::__shared_ptr_default_delete<mav_router_t,mav_router_t>,std::allocator<mav_router_t>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<mav_router_t *,std::shared_ptr<mav_router_t>::__shared_ptr_default_delete<mav_router_t,mav_router_t>,std::allocator<mav_router_t>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(mav_router_t **)(a1 + 24);
  if (v1)
  {
    mav_router_t::~mav_router_t(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<mav_router_t *,std::shared_ptr<mav_router_t>::__shared_ptr_default_delete<mav_router_t,mav_router_t>,std::allocator<mav_router_t>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002192B1EB5) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002192B1EB5 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002192B1EB5)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002192B1EB5 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void mav_router_t::~mav_router_t(mav_router_t *this)
{
  uint64_t v2 = (void **)*((void *)this + 2);
  if (v2[1])
  {
    operator delete[](v2[1]);
    uint64_t v2 = (void **)*((void *)this + 2);
  }
  v2[1] = 0;
  if (v2[2])
  {
    operator delete[](v2[2]);
    uint64_t v2 = (void **)*((void *)this + 2);
  }
  operator delete(v2);
  *((void *)this + 2) = 0;
  uint64_t v3 = *((void *)this + 10);
  if (v3) {
    dispatch_release(v3);
  }
  if (*((char *)this + 79) < 0)
  {
    operator delete(*((void **)this + 7));
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 4);
    if (!v4) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 4);
    if (!v4)
    {
LABEL_12:
      uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 1);
      if (!v5) {
        return;
      }
      goto LABEL_13;
    }
  }
  if (atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_12;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 1);
  if (!v5) {
    return;
  }
LABEL_13:
  std::__shared_weak_count::__release_weak(v5);
}

void mav_router_ios_preferences::mav_router_ios_preferences(mav_router_ios_preferences *this)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26CAA8538;
}

{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26CAA8538;
}

uint64_t mav_router_ios_preferences::should_use_qmi_over_pci(capabilities::ipc *a1, int a2)
{
  if ((a2 - 3) >= 2) {
    return capabilities::ipc::supportsPCI(a1);
  }
  else {
    return 0;
  }
}

uint64_t mav_router_ios_preferences::should_use_qmi_over_uart()
{
  return 0;
}

BOOL mav_router_ios_preferences::should_start_with_reliable_uart(uint64_t a1, int a2)
{
  return a2 == 3;
}

uint64_t mav_router_ios_preferences::should_enable_reliable_uart(uint64_t a1, unsigned int a2)
{
  return (a2 < 5) & (0xCu >> a2);
}

uint64_t mav_router_ios_preferences::get_max_pci_read_params(mav_router_ios_preferences *this, unsigned int *a2, unsigned int *a3)
{
  *a2 = 6144;
  *a3 = 8;
  if (capabilities::radio::mavLegacy(this)) {
    *a3 = 4;
  }
  return 1;
}

void mav_router_ios_preferences::~mav_router_ios_preferences(mav_router_ios_preferences *this)
{
  *(void *)this = &unk_26CAA8538;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void mav_router_ios_preferences::~mav_router_ios_preferences(std::__shared_weak_count **this)
{
  uint64_t v1 = (mav_router_ios_preferences *)this;
  *this = (std::__shared_weak_count *)&unk_26CAA8538;
  uint64_t v2 = this[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    this = (std::__shared_weak_count **)v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(this);
}

uint64_t mav_router::device::null_shim::handle_transmit(mav_router::device::null_shim *this, dispatch_object_t object)
{
  return 0;
}

void mav_router::device::null_shim::~null_shim(mav_router::device::null_shim *this)
{
  *(void *)this = &unk_26CAA81F8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *(void *)this = &unk_26CAA81F8;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(this);
}

uint64_t mav_router::device::null_shim::engage(mav_router::device::null_shim *this, dispatch_group_s *a2)
{
  return 0;
}

uint64_t mav_router::device::null_shim::tearDown(mav_router::device::null_shim *this)
{
  return 0;
}

uint64_t mav_router::device::null_shim::recover(mav_router::device::null_shim *this)
{
  return 0;
}

uint64_t mav_router::device::null_shim::enterLowPower(mav_router::device::null_shim *this)
{
  return 0;
}

uint64_t mav_router::device::null_shim::exitLowPower(mav_router::device::null_shim *this)
{
  return 0;
}

uint64_t mav_router::device::null_shim::hasFatalErrorOccurred(mav_router::device::null_shim *this, BOOL *a2)
{
  *a2 = 0;
  return 0;
}

uint64_t mav_router::device::null_shim::getFatalErrorReason()
{
  return 0;
}

uint64_t mav_router::device::null_shim::snapshot()
{
  return 0;
}

uint64_t mav_router::device::null_shim::getMaxPayload(mav_router::device::null_shim *this, unint64_t *a2)
{
  *a2 = -1;
  return 0;
}

uint64_t mav_mux_init_paramameters(int a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 1;
  }
  uint64_t result = 0;
  *a3 = 0;
  a3[1] = a2;
  *(_DWORD *)a3 = a1;
  return result;
}

uint64_t mav_mux_encode(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  buffer[0] = -16657;
  buffer[1] = *(_DWORD *)a1;
  uint64_t v2 = *(dispatch_data_t **)(a1 + 8);
  LOWORD(v16) = dispatch_data_get_size(*v2);
  int v16 = (unsigned __int16)v16;
  char v14 = -91;
  global_queue = dispatch_get_global_queue(0, 0);
  uint64_t v4 = dispatch_data_create(buffer, 8uLL, global_queue, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    dispatch_data_t concat = dispatch_data_create_concat(v4, *v2);
    if (!concat) {
      goto LABEL_9;
    }
    uint64_t v7 = concat;
    dispatch_release(*v2);
    *uint64_t v2 = v7;
    dispatch_release(v5);
    long long v8 = *(dispatch_data_t **)(a1 + 8);
    uint64_t v9 = dispatch_data_create(&v14, 1uLL, global_queue, 0);
    if (v9)
    {
      uint64_t v5 = v9;
      dispatch_data_t v10 = dispatch_data_create_concat(*v8, v9);
      if (v10)
      {
        uint64_t v11 = v10;
        dispatch_release(*v8);
        uint64_t v12 = 0;
        dispatch_data_t *v8 = v11;
LABEL_10:
        dispatch_release(v5);
        return v12;
      }
LABEL_9:
      uint64_t v12 = 2;
      goto LABEL_10;
    }
  }
  return 2;
}

uint64_t mav_mux_decode(dispatch_data_t *a1, uint64_t a2)
{
  uint64_t v28 = 0;
  unsigned __int8 v27 = 0;
  uint64_t result = 1;
  if (!a1 || !a2) {
    return result;
  }
  *(_DWORD *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *a1;
  if ((dispatch_data_get_size(*a1) & 0xFFFFFFF8) == 0) {
    return 3;
  }
  uint64_t v42 = 0;
  int v43 = &v42;
  uint64_t v44 = 0x2000000000;
  uint64_t v45 = (unsigned __int8 *)&v28;
  uint64_t v38 = 0;
  unint64_t v39 = &v38;
  uint64_t v40 = 0x2000000000;
  int v41 = -1431655766;
  unsigned int size = dispatch_data_get_size(v5);
  int v29 = 0;
  int v7 = size >= 8 ? 8 : size;
  int v41 = v7;
  uint64_t applier = MEMORY[0x263EF8330];
  uint64_t v31 = 1107296256;
  unsigned int v32 = __mav_buffer_copy_raw_block_invoke;
  unint64_t v33 = &__block_descriptor_tmp_3;
  unsigned int v37 = 0;
  unint64_t v34 = &v38;
  __int16 v35 = &v42;
  int v36 = &v29;
  BOOL v8 = dispatch_data_apply(v5, &applier);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  int v9 = v29 == 8 ? 0 : 102;
  if (v8)
  {
    if (v29 == 8)
    {
      dispatch_data_t v10 = *a1;
      unsigned int v11 = dispatch_data_get_size(*a1);
      if (v11 < 8) {
        return 3;
      }
      if (v11 == 8)
      {
        long long v13 = 0;
      }
      else
      {
        dispatch_data_t subrange = dispatch_data_create_subrange(v10, 8uLL, v11 - 8);
        if (!subrange) {
          return 3;
        }
        long long v13 = subrange;
        dispatch_data_t v10 = *a1;
      }
      dispatch_release(v10);
      int v9 = 0;
      *a1 = v13;
    }
  }
  else
  {
    int v9 = 103;
  }
  uint64_t result = 3;
  if (v9) {
    return result;
  }
  if ((unsigned __int16)v28 != 48879) {
    return result;
  }
  char v14 = *a1;
  if (!*a1) {
    return result;
  }
  unsigned int v15 = dispatch_data_get_size(*a1);
  unsigned int v16 = v15;
  if (v15 < 2) {
    return 3;
  }
  unsigned int v17 = v15 - 1;
  uint64_t v42 = 0;
  int v43 = &v42;
  uint64_t v44 = 0x2000000000;
  uint64_t v45 = &v27;
  uint64_t v38 = 0;
  unint64_t v39 = &v38;
  uint64_t v40 = 0x2000000000;
  int v41 = -1431655766;
  unsigned int v18 = dispatch_data_get_size(v14);
  int v29 = 0;
  int v19 = 102;
  int v20 = v18 - v17;
  if (v18 >= v17)
  {
    if (v16 <= v18) {
      int v20 = 1;
    }
    int v41 = v20;
    uint64_t applier = MEMORY[0x263EF8330];
    uint64_t v31 = 1107296256;
    unsigned int v32 = __mav_buffer_copy_raw_block_invoke;
    unint64_t v33 = &__block_descriptor_tmp_3;
    unsigned int v37 = v17;
    unint64_t v34 = &v38;
    __int16 v35 = &v42;
    int v36 = &v29;
    if (dispatch_data_apply(v14, &applier)) {
      int v19 = 0;
    }
    else {
      int v19 = 103;
    }
  }
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  if (v29 == 1) {
    int v21 = 0;
  }
  else {
    int v21 = 102;
  }
  if (!v19)
  {
    if (v29 != 1) {
      goto LABEL_38;
    }
    BOOL v22 = *a1;
    int v23 = dispatch_data_get_size(*a1);
    if ((v23 & 0xFFFFFFFE) != 0)
    {
      dispatch_data_t v24 = dispatch_data_create_subrange(v22, 0, (v23 - 1));
      if (v24)
      {
        uint64_t v25 = v24;
        dispatch_release(*a1);
        int v21 = 0;
        *a1 = v25;
        goto LABEL_38;
      }
    }
    return 3;
  }
  int v21 = v19;
LABEL_38:
  uint64_t result = 3;
  if (!v21 && v27 == 165)
  {
    int v26 = dispatch_data_get_size(*a1);
    if (HIDWORD(v28) == v26)
    {
      uint64_t result = 0;
      *(_DWORD *)a2 = WORD1(v28);
      *(void *)(a2 + 8) = a1;
      return result;
    }
    return 3;
  }
  return result;
}

uint64_t __mav_buffer_copy_raw_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5)
{
  int v5 = *(_DWORD *)(a1 + 56) - a3;
  unint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v6) {
    BOOL v7 = v5 < (int)a5;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    return 1;
  }
  uint64_t v10 = v5 & ~(v5 >> 31);
  if (v6 >= a5) {
    size_t v11 = a5;
  }
  else {
    size_t v11 = v6;
  }
  memcpy(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (const void *)(a4 + v10), v11);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) -= v11;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v11;
  **(_DWORD **)(a1 + 48) += v11;
  return 1;
}

void __copy_helper_block_8_32r40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  uint64_t v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

void __destroy_helper_block_8_32r40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

uint64_t __mav_log_platform_os_log_handle(unsigned int a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = &__mav_log_platform_os_log_handle::once[a1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ____mav_log_platform_os_log_handle_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  unsigned int v6 = a1;
  if (*v3 != -1) {
    dispatch_once(v3, block);
  }
  return __mav_log_platform_os_log_handle::logger[v2];
}

os_log_t ____mav_log_platform_os_log_handle_block_invoke(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.telephony.ipc", kRouterLogCategory[*(unsigned int *)(a1 + 32)]);
  __mav_log_platform_os_log_handle::logger[*(unsigned int *)(a1 + 32)] = (uint64_t)result;
  return result;
}

uint64_t mav_router::device::controller_ios::controller_ios(uint64_t a1, std::__shared_weak_count **a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v4 = a2[1];
  v48[0] = *a2;
  v48[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  mav_router::device::controller::controller(a1, v48);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  *(void *)a1 = &unk_26CAA8640;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 48) = a1 + 56;
  *(_DWORD *)(a1 + 72) = 3;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  int v5 = *(std::__shared_weak_count **)(a1 + 40);
  if (v5 && (uint64_t v47 = std::__shared_weak_count::lock(v5)) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v46 = v6;
  }
  else
  {
    uint64_t v6 = 0;
  }
  mav_router::device::controller_ios::determine_mappings((mav_router::device::controller_ios *)a1);
  BOOL v7 = (capabilities::ipc *)pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  if ((*(_DWORD *)(v6 + 40) - 3) >= 2)
  {
    BOOL v8 = (capabilities::ipc *)capabilities::ipc::supportsPCI(v7);
    if (v8)
    {
      *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v42[0] = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)std::string __p = 0u;
      long long v44 = 0u;
      long long v45 = v9;
      uint64_t v10 = (std::__shared_weak_count *)capabilities::ipc::controlDataPrintSizeBytes(v8);
      size_t v11 = (capabilities::pci *)__p;
      v42[1] = v10;
      if (__p != (void **)(v6 + 56))
      {
        char v12 = *(unsigned char *)(v6 + 79);
        if (SBYTE7(v44) < 0)
        {
          if (v12 >= 0) {
            long long v13 = (void *)(v6 + 56);
          }
          else {
            long long v13 = *(void **)(v6 + 56);
          }
          if (v12 >= 0) {
            size_t v14 = *(unsigned __int8 *)(v6 + 79);
          }
          else {
            size_t v14 = *(void *)(v6 + 64);
          }
          size_t v11 = (capabilities::pci *)std::string::__assign_no_alias<false>(__p, v13, v14);
          uint64_t v6 = v46;
        }
        else if ((*(unsigned char *)(v6 + 79) & 0x80) != 0)
        {
          size_t v11 = (capabilities::pci *)std::string::__assign_no_alias<true>(__p, *(void **)(v6 + 56), *(void *)(v6 + 64));
        }
        else
        {
          *(_OWORD *)std::string __p = *(_OWORD *)(v6 + 56);
          *(void *)&long long v44 = *(void *)(v6 + 72);
        }
      }
      uint64_t v15 = *(void *)(v6 + 80);
      *((void *)&v44 + 1) = *(void *)(v6 + 48);
      *(void *)&long long v45 = v15;
      DWORD2(v45) = *(_DWORD *)(v6 + 88);
      int v39 = capabilities::pci::controlChannelCount(v11);
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v50 = 0x40000000;
      *(void *)&long long v51 = ____mav_log_platform_os_log_handle_block_invoke;
      *((void *)&v51 + 1) = &__block_descriptor_tmp_0;
      int v52 = 0;
      if (__mav_log_platform_os_log_handle::once[0] != -1) {
        dispatch_once(__mav_log_platform_os_log_handle::once, buf);
      }
      unsigned int v16 = __mav_log_platform_os_log_handle::logger[0];
      if (os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = 0;
        uint64_t v50 = 0x400000000010400;
        LODWORD(v51) = 0;
        WORD2(v51) = 2080;
        *(void *)((char *)&v51 + 6) = "mav_router::device::controller_ios::controller_ios(mav_router_weak_ptr_t)";
        HIWORD(v51) = 1024;
        int v52 = 37;
        __int16 v53 = 1024;
        int v54 = v39;
        _os_log_impl(&dword_2192A5000, v16, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:PCI supported with %u control channels", buf, 0x2Au);
      }
      if (v39)
      {
        int v17 = 0;
        uint64_t v18 = MEMORY[0x263EF8330];
        while (1)
        {
          *(void *)buf = v18;
          uint64_t v50 = 0x40000000;
          *(void *)&long long v51 = ____mav_log_platform_os_log_handle_block_invoke;
          *((void *)&v51 + 1) = &__block_descriptor_tmp_0;
          int v52 = 0;
          if (__mav_log_platform_os_log_handle::once[0] == -1) {
            break;
          }
          dispatch_once(__mav_log_platform_os_log_handle::once, buf);
          int v19 = __mav_log_platform_os_log_handle::logger[0];
          if (os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO)) {
            goto LABEL_32;
          }
LABEL_33:
          LODWORD(v42[0]) = v17;
          int v20 = operator new(0xD8uLL);
          int v21 = v20;
          BOOL v22 = a2[1];
          uint64_t v40 = *a2;
          int v41 = v22;
          if (v22) {
            atomic_fetch_add_explicit(&v22->__shared_weak_owners_, 1uLL, memory_order_relaxed);
          }
          mav_router::device::pci_shim::pci_shim((uint64_t)v20, (uint64_t *)&v40, v17 + 13, (uint64_t)v42);
          *(void *)buf = v21;
          int v23 = (std::__shared_weak_count *)operator new(0x20uLL);
          v23->__shared_owners_ = 0;
          p_shared_owners = &v23->__shared_owners_;
          v23->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA86F8;
          v23->__shared_weak_owners_ = 0;
          v23[1].__vftable = (std::__shared_weak_count_vtbl *)v21;
          uint64_t v50 = (uint64_t)v23;
          uint64_t v25 = (std::__shared_weak_count *)*((void *)v21 + 5);
          if (v25)
          {
            if (v25->__shared_owners_ != -1) {
              goto LABEL_41;
            }
            atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
            atomic_fetch_add_explicit(&v23->__shared_weak_owners_, 1uLL, memory_order_relaxed);
            *((void *)v21 + 4) = v21;
            *((void *)v21 + 5) = v23;
            std::__shared_weak_count::__release_weak(v25);
            if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
              goto LABEL_41;
            }
LABEL_40:
            ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
            std::__shared_weak_count::__release_weak(v23);
            goto LABEL_41;
          }
          atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
          atomic_fetch_add_explicit(&v23->__shared_weak_owners_, 1uLL, memory_order_relaxed);
          *((void *)v21 + 4) = v21;
          *((void *)v21 + 5) = v23;
          if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
            goto LABEL_40;
          }
LABEL_41:
          if (v41) {
            std::__shared_weak_count::__release_weak(v41);
          }
          int v26 = *(mav_router::device::pci_shim **)buf;
          mav_router::device::pci_shim::init(*(mav_router::device::pci_shim **)buf);
          unsigned __int8 v27 = (std::__shared_weak_count *)v50;
          if (v50) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v50 + 8), 1uLL, memory_order_relaxed);
          }
          uint64_t v28 = operator new(0x20uLL);
          v28[2] = v26;
          v28[3] = v27;
          uint64_t v29 = *(void *)(a1 + 8);
          void *v28 = v29;
          v28[1] = a1 + 8;
          *(void *)(v29 + 8) = v28;
          *(void *)(a1 + 8) = v28;
          ++*(void *)(a1 + 24);
          if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
          }
          if (v39 == ++v17) {
            goto LABEL_50;
          }
        }
        int v19 = __mav_log_platform_os_log_handle::logger[0];
        if (!os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO)) {
          goto LABEL_33;
        }
LABEL_32:
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = 0;
        uint64_t v50 = 0x400000000010400;
        LODWORD(v51) = 0;
        WORD2(v51) = 2080;
        *(void *)((char *)&v51 + 6) = "mav_router::device::controller_ios::controller_ios(mav_router_weak_ptr_t)";
        HIWORD(v51) = 1024;
        int v52 = 41;
        __int16 v53 = 1024;
        int v54 = v17;
        _os_log_impl(&dword_2192A5000, v19, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:Create pci control for interface %u", buf, 0x2Au);
        goto LABEL_33;
      }
LABEL_50:
      if (SBYTE7(v44) < 0) {
        operator delete(__p[0]);
      }
    }
  }
  uint64_t v30 = (std::__shared_weak_count *)operator new(0x20uLL);
  uint64_t v31 = v30;
  unsigned int v32 = *a2;
  unint64_t v33 = a2[1];
  if (v33)
  {
    atomic_fetch_add_explicit(&v33->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v42[0] = v32;
    v42[1] = v33;
    atomic_fetch_add_explicit(&v33->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    v42[0] = *a2;
    v42[1] = 0;
  }
  mav_router::device::shim::shim((uint64_t)v30, (uint64_t *)v42, 16);
  if (v42[1]) {
    std::__shared_weak_count::__release_weak(v42[1]);
  }
  v31->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA8580;
  *(void *)buf = v31;
  unint64_t v34 = (std::__shared_weak_count *)operator new(0x20uLL);
  v34->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA8748;
  v34->__shared_owners_ = 0;
  v34->__shared_weak_owners_ = 0;
  v34[1].__vftable = (std::__shared_weak_count_vtbl *)v31;
  uint64_t v50 = (uint64_t)v34;
  if (v33) {
    std::__shared_weak_count::__release_weak(v33);
  }
  v42[0] = v31;
  v42[1] = v34;
  atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
  __int16 v35 = operator new(0x20uLL);
  v35[2] = v31;
  v35[3] = v34;
  uint64_t v36 = *(void *)(a1 + 8);
  void *v35 = v36;
  v35[1] = a1 + 8;
  *(void *)(v36 + 8) = v35;
  *(void *)(a1 + 8) = v35;
  ++*(void *)(a1 + 24);
  if (!atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
    std::__shared_weak_count::__release_weak(v34);
  }
  unsigned int v37 = v47;
  if (v47 && !atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
  }
  return a1;
}

void sub_2192AFD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, std::__shared_weak_count *a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<mav_router_t>::~shared_ptr[abi:ne180100]((uint64_t)&a28);
  std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(v32[7]);
  mav_router::device::controller::~controller((mav_router::device::controller *)v32);
  _Unwind_Resume(a1);
}

void sub_2192AFEE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if ((a24 & 0x80000000) == 0) {
    JUMPOUT(0x2192AFEC4);
  }
  JUMPOUT(0x2192AFEBCLL);
}

void mav_router::device::controller_ios::determine_mappings(mav_router::device::controller_ios *this)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v26 = 0x4AAAAAAAAAAAAAALL;
  uint64_t v23 = 0xC00000000000000;
  dispatch_data_t v24 = (void *)0xAAAAAA0078756D71;
  BYTE5(v22[1]) = 0;
  HIWORD(v22[1]) = 0;
  strcpy((char *)v22, "qmux_control");
  int v18 = *((_DWORD *)this + 18) - 1;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&uint8_t buf[8] = 0x40000000;
  *(void *)&long long v28 = ____mav_log_platform_os_log_handle_block_invoke;
  *((void *)&v28 + 1) = &__block_descriptor_tmp_0;
  LODWORD(v29) = 0;
  if (__mav_log_platform_os_log_handle::once[0] != -1) {
    dispatch_once(__mav_log_platform_os_log_handle::once, buf);
  }
  uint64_t v1 = __mav_log_platform_os_log_handle::logger[0];
  if (os_log_type_enabled((os_log_t)__mav_log_platform_os_log_handle::logger[0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = 1;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v28) = 0;
    WORD2(v28) = 2080;
    *(void *)((char *)&v28 + 6) = "void mav_router::device::controller_ios::determine_mappings()";
    HIWORD(v28) = 1024;
    LODWORD(v29) = 106;
    WORD2(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 6) = v18;
    _os_log_impl(&dword_2192A5000, v1, OS_LOG_TYPE_INFO, "[%04x.%04u.%04u] %s:%u:Number of local QMI instances %u", buf, 0x2Au);
  }
  int v2 = v18;
  if (v18)
  {
    int v3 = 0;
    uint64_t v19 = *(void *)(MEMORY[0x263F8C2C8] + 24);
    uint64_t v20 = *MEMORY[0x263F8C2C8];
    do
    {
      unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v34[7] = v4;
      v34[8] = v4;
      v34[5] = v4;
      v34[6] = v4;
      v34[3] = v4;
      v34[4] = v4;
      v34[1] = v4;
      v34[2] = v4;
      long long v33 = v4;
      v34[0] = v4;
      long long v31 = v4;
      long long v32 = v4;
      long long v29 = v4;
      long long v30 = v4;
      *(_OWORD *)buf = v4;
      long long v28 = v4;
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)buf);
      if (v26 >= 0) {
        int v5 = &v24;
      }
      else {
        int v5 = v24;
      }
      if (v26 >= 0) {
        uint64_t v6 = HIBYTE(v26);
      }
      else {
        uint64_t v6 = v25;
      }
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)v5, v6);
      int v7 = v3 + 1;
      std::ostream::operator<<();
      memset(__dst, 170, sizeof(__dst));
      if ((BYTE8(v33) & 0x10) != 0)
      {
        uint64_t v10 = v33;
        size_t v11 = (const void **)&v30;
        if ((unint64_t)v33 < *((void *)&v30 + 1))
        {
          *(void *)&long long v33 = *((void *)&v30 + 1);
          uint64_t v10 = *((void *)&v30 + 1);
          size_t v11 = (const void **)&v30;
        }
      }
      else
      {
        if ((BYTE8(v33) & 8) == 0)
        {
          size_t v8 = 0;
          HIBYTE(__dst[2]) = 0;
          long long v9 = __dst;
          goto LABEL_28;
        }
        uint64_t v10 = *((void *)&v29 + 1);
        size_t v11 = (const void **)&v28 + 1;
      }
      char v12 = *v11;
      size_t v8 = v10 - (void)*v11;
      if (v8 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v8 >= 0x17)
      {
        uint64_t v13 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v8 | 7) != 0x17) {
          uint64_t v13 = v8 | 7;
        }
        uint64_t v14 = v13 + 1;
        long long v9 = (const void **)operator new(v13 + 1);
        __dst[1] = (const void *)v8;
        __dst[2] = (const void *)(v14 | 0x8000000000000000);
        __dst[0] = v9;
        int v2 = v18;
      }
      else
      {
        HIBYTE(__dst[2]) = v10 - *(unsigned char *)v11;
        long long v9 = __dst;
        if (!v8) {
          goto LABEL_28;
        }
      }
      memmove(v9, v12, v8);
LABEL_28:
      *((unsigned char *)v9 + v8) = 0;
      *((_DWORD *)std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)this + 6, __dst, (uint64_t)__dst)+ 14) = v3 + 4;
      if (SHIBYTE(__dst[2]) < 0) {
        operator delete((void *)__dst[0]);
      }
      *(void *)buf = v20;
      *(void *)&buf[*(void *)(v20 - 24)] = v19;
      *(void *)&uint8_t buf[8] = MEMORY[0x263F8C318] + 16;
      if (SHIBYTE(v32) < 0) {
        operator delete(*((void **)&v31 + 1));
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x21D485D20](v34);
      ++v3;
    }
    while (v2 != v7);
  }
  memset(buf, 0, sizeof(buf));
  uint64_t v15 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v15)
  {
    unsigned int v16 = std::__shared_weak_count::lock(v15);
    *(void *)&uint8_t buf[8] = v16;
    if (v16) {
      *(void *)buf = *((void *)this + 4);
    }
  }
  else
  {
    unsigned int v16 = 0;
  }
  pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  *((_DWORD *)std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)this + 6, v22, (uint64_t)v22)+ 14) = 4;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    if ((SHIBYTE(v23) & 0x80000000) == 0)
    {
LABEL_39:
      if ((SHIBYTE(v26) & 0x80000000) == 0) {
        return;
      }
LABEL_43:
      operator delete(v24);
      return;
    }
  }
  else if ((SHIBYTE(v23) & 0x80000000) == 0)
  {
    goto LABEL_39;
  }
  operator delete((void *)v22[0]);
  if (SHIBYTE(v26) < 0) {
    goto LABEL_43;
  }
}

void sub_2192B043C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,char a36)
{
  if (a29 < 0)
  {
    operator delete(__p);
    if ((a35 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else if ((a35 & 0x80000000) == 0)
  {
LABEL_3:
    _Unwind_Resume(a1);
  }
  operator delete(a30);
  _Unwind_Resume(a1);
}

void mav_router::device::controller_ios::~controller_ios(mav_router::device::controller_ios *this)
{
  *(void *)this = &unk_26CAA8640;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x4002000000;
  v20[3] = __Block_byref_object_copy__0;
  v20[4] = __Block_byref_object_dispose__0;
  uint64_t v21 = (uint64_t)&v21;
  BOOL v22 = &v21;
  uint64_t v23 = 0;
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    uint64_t v4 = *((void *)this + 1);
    int v3 = (uint64_t *)*((void *)this + 2);
    uint64_t v5 = *v3;
    *(void *)(v5 + 8) = *(void *)(v4 + 8);
    **(void **)(v4 + 8) = v5;
    uint64_t v6 = v21;
    *(void *)(v21 + 8) = v3;
    *int v3 = v6;
    uint64_t v21 = v4;
    *(void *)(v4 + 8) = &v21;
    uint64_t v23 = v2;
    *((void *)this + 3) = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1107296256;
  block[2] = ___ZN10mav_router6device14controller_iosD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_4;
  void block[4] = v20;
  dispatch_async(global_queue, block);
  _Block_object_dispose(v20, 8);
  if (v23)
  {
    uint64_t v8 = v21;
    long long v9 = v22;
    uint64_t v10 = *v22;
    *(void *)(v10 + 8) = *(void *)(v21 + 8);
    **(void **)(v8 + 8) = v10;
    uint64_t v23 = 0;
    if (v9 != &v21)
    {
      do
      {
        size_t v11 = (uint64_t *)v9[1];
        char v12 = (std::__shared_weak_count *)v9[3];
        if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
        operator delete(v9);
        long long v9 = v11;
      }
      while (v11 != &v21);
    }
  }
  std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(*((char **)this + 7));
  *(void *)this = &unk_26CAA7F48;
  uint64_t v13 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  if (*((void *)this + 3))
  {
    uint64_t v14 = *((void *)this + 1);
    uint64_t v15 = (mav_router::device::controller_ios *)*((void *)this + 2);
    uint64_t v16 = *(void *)v15;
    *(void *)(v16 + 8) = *(void *)(v14 + 8);
    **(void **)(v14 + 8) = v16;
    *((void *)this + 3) = 0;
    if (v15 != (mav_router::device::controller_ios *)((char *)this + 8))
    {
      do
      {
        int v17 = (mav_router::device::controller_ios *)*((void *)v15 + 1);
        int v18 = (std::__shared_weak_count *)*((void *)v15 + 3);
        if (v18)
        {
          if (!atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
            std::__shared_weak_count::__release_weak(v18);
          }
        }
        operator delete(v15);
        uint64_t v15 = v17;
      }
      while (v17 != (mav_router::device::controller_ios *)((char *)this + 8));
    }
  }
}

{
  void *v1;
  uint64_t vars8;

  mav_router::device::controller_ios::~controller_ios(this);

  operator delete(v1);
}

void *__Block_byref_object_copy__0(void *result, uint64_t a2)
{
  uint64_t v2 = result + 5;
  int v3 = (void *)(a2 + 40);
  result[5] = result + 5;
  result[6] = result + 5;
  result[7] = 0;
  uint64_t v4 = *(void **)(a2 + 48);
  if (v4 != (void *)(a2 + 40))
  {
    uint64_t v5 = result;
    uint64_t v6 = 0;
    int v7 = result + 5;
    do
    {
      os_log_t result = operator new(0x20uLL);
      uint64_t v8 = v4[3];
      result[2] = v4[2];
      result[3] = v8;
      if (v8)
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
        int v7 = (void *)v5[5];
        uint64_t v6 = v5[7];
      }
      *os_log_t result = v7;
      result[1] = v2;
      v7[1] = result;
      v5[5] = result;
      v5[7] = ++v6;
      uint64_t v4 = (void *)v4[1];
      int v7 = result;
    }
    while (v4 != v3);
  }
  return result;
}

void sub_2192B0808(_Unwind_Exception *exception_object)
{
  if (v3)
  {
    uint64_t v6 = *(void **)(v1 + 48);
    uint64_t v7 = *v6;
    *(void *)(v7 + 8) = *(void *)(v4 + 8);
    **(void **)(v4 + 8) = v7;
    *(void *)(v1 + 56) = 0;
    if (v6 != v2)
    {
      uint64_t v8 = v6;
      do
      {
        long long v9 = (void *)v8[1];
        uint64_t v10 = (std::__shared_weak_count *)v8[3];
        if (v10)
        {
          if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
            std::__shared_weak_count::__release_weak(v10);
          }
        }
        operator delete(v8);
        uint64_t v8 = v9;
      }
      while (v9 != v2);
    }
  }
  _Unwind_Resume(exception_object);
}

void __Block_byref_object_dispose__0(void *a1)
{
  if (a1[7])
  {
    uint64_t v1 = a1 + 5;
    uint64_t v2 = a1[5];
    uint64_t v3 = (uint64_t *)a1[6];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(v2 + 8);
    **(void **)(v2 + 8) = v4;
    a1[7] = 0;
    if (v3 != a1 + 5)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (std::__shared_weak_count *)v3[3];
        if (v6)
        {
          if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != v1);
    }
  }
}

void __copy_helper_block_e8_32rc(uint64_t a1, uint64_t a2)
{
}

void mav_router::device::controller_ios::init_routes(mav_router::device::controller_ios *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (!v2)
  {
    uint64_t v3 = 0;
LABEL_6:
    uint64_t v4 = 0;
    int v5 = *((_DWORD *)this + 18);
    uint64_t v6 = (unsigned int *)MEMORY[0x10];
    if (!MEMORY[0x10]) {
      goto LABEL_20;
    }
    goto LABEL_7;
  }
  uint64_t v3 = std::__shared_weak_count::lock(v2);
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v4 = *((void *)this + 4);
  int v5 = *((_DWORD *)this + 18);
  uint64_t v6 = *(unsigned int **)(v4 + 16);
  if (!v6) {
    goto LABEL_20;
  }
LABEL_7:
  uint64_t v7 = *v6;
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *((void *)v6 + 1);
    do
    {
      uint64_t v10 = v9 + 48 * v8;
      uint64_t v13 = *(void *)(v10 + 8);
      size_t v11 = (void *)(v10 + 8);
      uint64_t v12 = v13;
      if (v13)
      {
        int v14 = *(_DWORD *)(v12 + 16);
        *(_DWORD *)(v12 + 16) = v14 - 1;
        if (v14 == 1)
        {
          *(void *)(v12 + 8) = 0;
        }
        else if (v14 == 2)
        {
          uint64_t v15 = v7;
          uint64_t v16 = v9;
          while (*(void *)(v16 + 8) != v12)
          {
            v16 += 48;
            if (!--v15)
            {
              void *v11 = 0;
              goto LABEL_20;
            }
          }
          *(void *)(v12 + 8) = v16;
        }
        void *v11 = 0;
      }
      ++v8;
    }
    while (v8 != v7);
  }
LABEL_20:
  int v17 = (capabilities::ipc *)pthread_once(&ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::getInstance(void)::sOnce, (void (*)(void))ctu::concurrency::Singleton<mav_router_ios_preferences,ctu::concurrency::__DefaultFactory<mav_router_ios_preferences>>::__init);
  if ((*(_DWORD *)(v4 + 40) - 3) >= 2)
  {
    int v18 = capabilities::ipc::supportsPCI(v17);
    int v19 = v5 == 1 ? 0 : v18;
    if (v19 == 1)
    {
      uint64_t v20 = *(void *)(v4 + 16);
      if (v20)
      {
        uint64_t v21 = 1;
LABEL_28:
        unsigned int v22 = v21 + 3;
        if (*(_DWORD *)v20 > (v21 + 3))
        {
          unsigned int v23 = v21 + 12;
          if (*(_DWORD *)(v20 + 4) > (v21 + 12))
          {
            uint64_t v26 = v20 + 8;
            uint64_t v24 = *(void *)(v20 + 8);
            uint64_t v25 = *(void *)(v26 + 8);
            uint64_t v27 = v25 + 40 * v23;
            *(void *)(v24 + 48 * v22 + 8) = v27;
            int v28 = *(_DWORD *)(v27 + 16);
            *(_DWORD *)(v27 + 16) = v28 + 1;
            if (!v28) {
              *(void *)(v25 + 40 * v23 + 8) = v24 + 48 * v22;
            }
          }
        }
        while (v5 - 1 != v21)
        {
          uint64_t v20 = *(void *)(v4 + 16);
          ++v21;
          if (v20) {
            goto LABEL_28;
          }
        }
      }
    }
  }
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_2192B0BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t mav_router::device::controller_ios::get_channel_for_service(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = *(uint64_t **)(a1 + 56);
  if (!v3) {
    return *(unsigned int *)(v2 + 56);
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    int v5 = a2;
  }
  else {
    int v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t v7 = (uint64_t *)(a1 + 56);
  do
  {
    while (1)
    {
      int v8 = *((char *)v3 + 55);
      uint64_t v9 = v8 >= 0 ? v3 + 4 : (uint64_t *)v3[4];
      size_t v10 = v8 >= 0 ? *((unsigned __int8 *)v3 + 55) : v3[5];
      size_t v11 = v6 >= v10 ? v10 : v6;
      int v12 = memcmp(v9, v5, v11);
      if (v12) {
        break;
      }
      if (v10 >= v6) {
        goto LABEL_23;
      }
LABEL_9:
      uint64_t v3 = (uint64_t *)v3[1];
      if (!v3) {
        goto LABEL_24;
      }
    }
    if (v12 < 0) {
      goto LABEL_9;
    }
LABEL_23:
    uint64_t v7 = v3;
    uint64_t v3 = (uint64_t *)*v3;
  }
  while (v3);
LABEL_24:
  if (v7 == (uint64_t *)v2) {
    return *(unsigned int *)(v2 + 56);
  }
  int v13 = *((char *)v7 + 55);
  if (v13 >= 0) {
    int v14 = v7 + 4;
  }
  else {
    int v14 = (const void *)v7[4];
  }
  if (v13 >= 0) {
    size_t v15 = *((unsigned __int8 *)v7 + 55);
  }
  else {
    size_t v15 = v7[5];
  }
  if (v15 >= v6) {
    size_t v16 = v6;
  }
  else {
    size_t v16 = v15;
  }
  int v17 = memcmp(v5, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0) {
      return *((unsigned int *)v7 + 14);
    }
    return *(unsigned int *)(v2 + 56);
  }
  else
  {
    if (v6 < v15) {
      return *(unsigned int *)(v2 + 56);
    }
    return *((unsigned int *)v7 + 14);
  }
}

void std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::destroy(*((void *)a1 + 1));
    if (a1[55] < 0)
    {
      operator delete(*((void **)a1 + 4));
      uint64_t v2 = a1;
    }
    else
    {
      uint64_t v2 = a1;
    }
    operator delete(v2);
  }
}

void std::__shared_ptr_pointer<mav_router::device::pci_shim *,std::shared_ptr<mav_router::device::pci_shim>::__shared_ptr_default_delete<mav_router::device::pci_shim,mav_router::device::pci_shim>,std::allocator<mav_router::device::pci_shim>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<mav_router::device::pci_shim *,std::shared_ptr<mav_router::device::pci_shim>::__shared_ptr_default_delete<mav_router::device::pci_shim,mav_router::device::pci_shim>,std::allocator<mav_router::device::pci_shim>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<mav_router::device::pci_shim *,std::shared_ptr<mav_router::device::pci_shim>::__shared_ptr_default_delete<mav_router::device::pci_shim,mav_router::device::pci_shim>,std::allocator<mav_router::device::pci_shim>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002192B2047) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002192B2047 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002192B2047)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002192B2047 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::__shared_ptr_pointer<mav_router::device::null_shim *,std::shared_ptr<mav_router::device::null_shim>::__shared_ptr_default_delete<mav_router::device::null_shim,mav_router::device::null_shim>,std::allocator<mav_router::device::null_shim>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<mav_router::device::null_shim *,std::shared_ptr<mav_router::device::null_shim>::__shared_ptr_default_delete<mav_router::device::null_shim,mav_router::device::null_shim>,std::allocator<mav_router::device::null_shim>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<mav_router::device::null_shim *,std::shared_ptr<mav_router::device::null_shim>::__shared_ptr_default_delete<mav_router::device::null_shim,mav_router::device::null_shim>,std::allocator<mav_router::device::null_shim>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000002192B212FLL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000002192B212FLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002192B212FLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002192B212FLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t **std::__tree<std::__value_type<std::string,mav_router_channel_t>,std::__map_value_compare<std::string,std::__value_type<std::string,mav_router_channel_t>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,mav_router_channel_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3)
{
  size_t v6 = a1 + 1;
  int v5 = a1[1];
  if (v5)
  {
    int v7 = *((char *)a2 + 23);
    if (v7 >= 0) {
      int v8 = a2;
    }
    else {
      int v8 = *a2;
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v9 = (size_t)a2[1];
    }
    while (1)
    {
      size_t v10 = (uint64_t **)v5;
      int v13 = (const void *)v5[4];
      size_t v11 = v5 + 4;
      int v12 = v13;
      int v14 = *((char *)v11 + 23);
      if (v14 >= 0) {
        size_t v15 = v11;
      }
      else {
        size_t v15 = v12;
      }
      if (v14 >= 0) {
        size_t v16 = *((unsigned __int8 *)v11 + 23);
      }
      else {
        size_t v16 = v11[1];
      }
      if (v16 >= v9) {
        size_t v17 = v9;
      }
      else {
        size_t v17 = v16;
      }
      int v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0) {
          goto LABEL_8;
        }
LABEL_22:
        int v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0) {
            return v10;
          }
        }
        else if (v16 >= v9)
        {
          return v10;
        }
        int v5 = v10[1];
        if (!v5)
        {
          size_t v6 = v10 + 1;
LABEL_28:
          uint64_t v20 = (char *)operator new(0x40uLL);
          uint64_t v21 = (std::string *)(v20 + 32);
          if (*(char *)(a3 + 23) < 0) {
            goto LABEL_31;
          }
LABEL_29:
          *(_OWORD *)&v21->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
          v21->__r_.__value_.__r.__words[2] = *(void *)(a3 + 16);
          goto LABEL_32;
        }
      }
      else
      {
        if (v9 >= v16) {
          goto LABEL_22;
        }
LABEL_8:
        int v5 = *v10;
        size_t v6 = v10;
        if (!*v10) {
          goto LABEL_28;
        }
      }
    }
  }
  size_t v10 = a1 + 1;
  uint64_t v20 = (char *)operator new(0x40uLL);
  uint64_t v21 = (std::string *)(v20 + 32);
  if ((*(char *)(a3 + 23) & 0x80000000) == 0) {
    goto LABEL_29;
  }
LABEL_31:
  std::string::__init_copy_ctor_external(v21, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
LABEL_32:
  *((_DWORD *)v20 + 14) = 0;
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  *((void *)v20 + 2) = v10;
  *size_t v6 = (uint64_t *)v20;
  unsigned int v22 = (uint64_t *)**a1;
  unsigned int v23 = (uint64_t *)v20;
  if (v22)
  {
    *a1 = v22;
    unsigned int v23 = *v6;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v20;
}

void sub_2192B10B8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x270F964F0]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x270F964F8]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x270F97228]();
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

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  return MEMORY[0x270F96C30](this);
}

uint64_t capabilities::ipc::controlDataPrintSizeBytes(capabilities::ipc *this)
{
  return MEMORY[0x270F96C48](this);
}

uint64_t capabilities::pci::controlChannelCount(capabilities::pci *this)
{
  return MEMORY[0x270F96C70](this);
}

uint64_t capabilities::radio::mavLegacy(capabilities::radio *this)
{
  return MEMORY[0x270F96D48](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
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

void __cxa_end_catch(void)
{
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}