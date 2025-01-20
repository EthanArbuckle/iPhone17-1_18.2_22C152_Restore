uint64_t btree_node_insert(void *a1, unint64_t *a2, size_t a3, unint64_t *a4, unsigned int a5, uint64_t a6, unsigned __int16 *a7, char *a8)
{
  uint64_t v16;
  unint64_t *v17;
  size_t v18;
  uint64_t result;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  unsigned char v24[5];
  char v25;
  unsigned __int16 v26;
  uint64_t v27;

  v27 = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  v17 = (unint64_t *)&v24[-v16];
  bzero(&v24[-v16], v18);
  v26 = -21846;
  v25 = -86;
  result = bt_search_node_insert((uint64_t)a1, a2, a3, &v26, (BOOL *)&v25);
  if (!result)
  {
    if (a8) {
      *a8 = v25;
    }
    if (a7) {
      *a7 = v26;
    }
    if ((*(_WORD *)(a1[7] + 32) & 0xA) != 8) {
      goto LABEL_9;
    }
    v20 = *a4;
    v21 = a1[51];
    if (v20 > v21)
    {
      *v17 = v20 - v21;
      a4 = v17;
LABEL_9:
      if (v25) {
        return btree_node_entry_update((uint64_t)a1, v26, a2, a3, a4, a5, a6);
      }
      else {
        return btree_node_insert_internal((uint64_t)a1, v26, a2, a3, a4, a5, a6);
      }
    }
    v22 = a1[1];
    v23 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v23) {
        btree_node_insert_cold_2();
      }
    }
    else if (v23)
    {
      btree_node_insert_cold_1();
    }
    return 22;
  }
  return result;
}

uint64_t bt_update_with_hint(uint64_t *a1, uint64_t a2, unint64_t *a3, uint64_t a4, void *a5, unsigned int a6, unint64_t a7, uint64_t *a8)
{
  v43 = a3;
  v50[1] = *MEMORY[0x263EF8340];
  uint64_t v15 = a1[50];
  MEMORY[0x270FA5388]();
  v17 = (void **)((char *)&v40 - v16);
  bzero((char *)&v40 - v16, v18);
  v49 = 0;
  unsigned __int16 v48 = 0;
  if (!a1[52]) {
    return 22;
  }
  uint64_t v19 = btree_entry_size_check((uint64_t)a1, a4, a6);
  if (!v19)
  {
    uint64_t v19 = obj_modify(a1, (v15 >> 3) & 2, a7);
    if (!v19)
    {
      uint64_t v20 = a1[49];
      BOOL v21 = *(_DWORD *)(v20 + 16) < a4 || *(_DWORD *)(v20 + 20) < a6;
      BOOL v42 = v21;
      v50[0] = 0xAAAAAAAAAAAAAAAALL;
      char v47 = -86;
      v40 = a5;
      v41 = a8;
      if (a8)
      {
        uint64_t v23 = *a8;
        if (*a8)
        {
          if ((uint64_t *)a8[1] == a1 && ((v42 | ((a1[50] & 0x10) >> 4)) & 1) == 0)
          {
            void *v17 = v23;
            if (v23 != obj_oid((uint64_t)a1)
              && !btree_node_get(a1, v17, a2, (a7 != 0) | (((*(unsigned __int16 *)(a1[7] + 32) >> 3) & 1) << 6) | 6u, 0, a7, v50))
            {
              v24 = (uint64_t *)v50[0];
              if ((*(_WORD *)(*(void *)(v50[0] + 56) + 32) & 2) != 0
                && !bt_search_node(v50[0], v43, (unsigned __int16)a4, &v48, (BOOL *)&v47)
                && v47)
              {
                if ((*(_WORD *)(v24[7] + 32) & 2) == 0) {
                  goto LABEL_53;
                }
                goto LABEL_39;
              }
              obj_unlock((uint64_t)v24, 2);
              obj_release(v24);
            }
          }
        }
      }
      uint64_t v19 = 2;
      obj_lock((uint64_t)a1, 2);
      obj_retain(a1);
      v26 = a1 + 7;
      uint64_t v25 = a1[7];
      if ((*(_WORD *)(v25 + 32) & 2) == 0)
      {
        char v27 = 0;
        uint64_t v28 = 2;
        v24 = a1;
        while (1)
        {
          if (!*(_DWORD *)(v25 + 36))
          {
            uint64_t v19 = v28;
            goto LABEL_34;
          }
          uint64_t v29 = bt_search_node((uint64_t)v24, v43, (unsigned __int16)a4, &v48, (BOOL *)&v47);
          if (v29
            || (v30 = v48, uint64_t v29 = btree_node_child_val((uint64_t)v24, v48, v17), v29)
            || (uint64_t v29 = btree_node_get(a1, v17, a2, 3, *(_WORD *)(*v26 + 34) - 1, a7, (uint64_t *)&v49), v29))
          {
            uint64_t v19 = v29;
            v50[0] = (uint64_t)v24;
            goto LABEL_55;
          }
          if ((a1[50] & 0x10) != 0 && v49[14] != *v17) {
            btree_node_child_id_update((uint64_t)v24, v30, v49 + 14, a7);
          }
          BOOL v31 = v42;
          if (v24 != a1) {
            BOOL v31 = 0;
          }
          if (!v31)
          {
            obj_unlock((uint64_t)v24, 2);
            obj_release(v24);
          }
          v24 = v49;
          if (!v49) {
            break;
          }
          uint64_t v28 = 0;
          uint64_t v19 = 0;
          v26 = v49 + 7;
          uint64_t v25 = v49[7];
          char v27 = 1;
          if ((*(_WORD *)(v25 + 32) & 2) != 0) {
            goto LABEL_34;
          }
        }
        v50[0] = 0;
        goto LABEL_53;
      }
      char v27 = 0;
      v24 = a1;
LABEL_34:
      v50[0] = (uint64_t)v24;
      if ((*(_WORD *)(v24[7] + 32) & 2) == 0)
      {
        if ((v27 & 1) == 0) {
          goto LABEL_54;
        }
        goto LABEL_53;
      }
      uint64_t v19 = bt_search_node((uint64_t)v24, v43, (unsigned __int16)a4, &v48, (BOOL *)&v47);
      if (v19)
      {
LABEL_54:
        v24 = (uint64_t *)v50[0];
        if (v50[0])
        {
LABEL_55:
          obj_unlock((uint64_t)v24, 2);
          obj_release(v24);
        }
        char v39 = !v42;
        if (v24 == a1) {
          char v39 = 1;
        }
        if ((v39 & 1) == 0)
        {
          obj_unlock((uint64_t)a1, 2);
          obj_release(a1);
        }
        return v19;
      }
      if (!v47)
      {
LABEL_53:
        uint64_t v19 = 2;
        goto LABEL_54;
      }
LABEL_39:
      unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
      int v45 = 0;
      unsigned __int16 v44 = -21846;
      unsigned int v32 = v48;
      int v33 = btree_node_key_ptr((uint64_t)v24, v48, &v46, &v44);
      v34 = v41;
      if (!v33)
      {
        v35 = (const void *)v46;
        uint64_t v36 = a1[1];
        if (!v36) {
          uint64_t v36 = *(void *)(*a1 + 392);
        }
        if (!((unsigned int (*)(uint64_t, unint64_t, void, unint64_t *, uint64_t, int *))a1[52])(v36, v46, v44, v43, a4, &v45)&& v45)
        {
          panic("you can't change a key here!  (ekey %p eklen %d; key %p klen %d; n %p bt %p)\n",
            v35,
            v44,
            v43,
            a4,
            v24,
            a1);
        }
      }
      uint64_t v19 = btree_node_entry_update((uint64_t)v24, v32, v43, (unsigned __int16)a4, v40, (unsigned __int16)a6, a7);
      if (v19) {
        goto LABEL_54;
      }
      uint64_t v37 = a1[49];
      unsigned int v38 = *(_DWORD *)(v37 + 16);
      if (v38 < a4) {
        *(_DWORD *)(v37 + 16) = a4;
      }
      if (*(_DWORD *)(v37 + 20) >= a6)
      {
        if (v38 >= a4 && (a1[50] & 0x80) == 0)
        {
LABEL_63:
          if (v34)
          {
            uint64_t *v34 = obj_oid((uint64_t)v24);
            v34[1] = (uint64_t)a1;
          }
          goto LABEL_54;
        }
      }
      else
      {
        *(_DWORD *)(v37 + 20) = a6;
      }
      obj_dirty((uint64_t)a1, a7, 0);
      goto LABEL_63;
    }
  }
  return v19;
}

uint64_t bt_update(uint64_t *a1, uint64_t a2, unint64_t *a3, uint64_t a4, void *a5, unsigned int a6, unint64_t a7)
{
  return bt_update_with_hint(a1, a2, a3, a4, a5, a6, a7, 0);
}

uint64_t bt_update_via_callback(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned int a4, uint64_t a5, unsigned int a6, int a7, unint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a10)
{
  v34 = a3;
  v37[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  size_t v18 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&v30 - v17);
  bzero((char *)&v30 - v17, v19);
  v37[0] = 0;
  if (!*(void *)(a1 + 416)) {
    return 22;
  }
  uint64_t v32 = a5;
  int v33 = a7;
  uint64_t v20 = btree_entry_size_check(a1, a4, a6);
  if (!v20)
  {
    obj_lock(a1, 2);
    uint64_t v21 = obj_modify((void *)a1, (*(_DWORD *)(a1 + 400) >> 3) & 2, a8);
    if (v21)
    {
      uint64_t v20 = v21;
      obj_unlock(a1, 2);
    }
    else
    {
      unsigned int v30 = a9;
      uint64_t v31 = a10;
      unsigned __int16 v36 = -21846;
      char v35 = -86;
      obj_retain((atomic_ullong *)a1);
      char v23 = 0;
      uint64_t v24 = 2;
      uint64_t v25 = (uint64_t *)a1;
      while (1)
      {
        v26 = v25;
        uint64_t v27 = v25[7];
        if ((*(_WORD *)(v27 + 32) & 2) != 0)
        {
          uint64_t v24 = bt_search_node((uint64_t)v25, v34, (unsigned __int16)a4, &v36, (BOOL *)&v35);
          if (v24) {
            goto LABEL_24;
          }
          if (v35)
          {
            uint64_t v24 = btree_node_entry_update_via_callback((uint64_t)v25, v36, (uint64_t)v34, (unsigned __int16)a4, v32, (unsigned __int16)a6, v33, a8, v30, v31);
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        if (!*(_DWORD *)(v27 + 36)) {
          break;
        }
        uint64_t v28 = bt_search_node((uint64_t)v25, v34, (unsigned __int16)a4, &v36, (BOOL *)&v35);
        if (v28
          || (v29 = v36, uint64_t v28 = btree_node_child_val((uint64_t)v25, v36, v18), v28)
          || (uint64_t v28 = btree_node_get((void *)a1, v18, a2, 3, *(_WORD *)(v25[7] + 34) - 1, a8, v37), v28))
        {
          uint64_t v20 = v28;
          obj_unlock((uint64_t)v25, 2);
          obj_release(v25);
          return v20;
        }
        uint64_t v25 = (uint64_t *)v37[0];
        if ((*(unsigned char *)(a1 + 400) & 0x10) != 0 && *(void *)(v37[0] + 112) != *v18) {
          btree_node_child_id_update((uint64_t)v26, v29, (unint64_t *)(v37[0] + 112), a8);
        }
        uint64_t v20 = 2;
        obj_unlock((uint64_t)v26, 2);
        obj_release(v26);
        uint64_t v24 = 0;
        char v23 = 1;
        if (!v25) {
          return v20;
        }
      }
      if ((v23 & 1) == 0) {
        goto LABEL_24;
      }
LABEL_23:
      uint64_t v24 = 2;
LABEL_24:
      obj_unlock((uint64_t)v25, 2);
      obj_release(v25);
      uint64_t v20 = v24;
      if (!v24)
      {
        if ((*(unsigned char *)(a1 + 400) & 0x80) != 0) {
          obj_dirty(a1, a8, 0);
        }
        return 0;
      }
    }
  }
  return v20;
}

uint64_t btree_node_entry_update_via_callback(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a10)
{
  uint64_t v10 = *(void *)(a1 + 56);
  if (*(_DWORD *)(v10 + 36) <= a2) {
    return 22;
  }
  __int16 v17 = *(_WORD *)(v10 + 32);
  uint64_t v18 = *(void *)(a1 + 376);
  if ((v17 & 4) != 0) {
    size_t v19 = (unsigned __int16 *)(v18 + 4 * a2);
  }
  else {
    size_t v19 = (unsigned __int16 *)(v18 + 8 * a2);
  }
  uint64_t v20 = *v19;
  uint64_t v21 = (unsigned __int16 *)(v18 + 4 * a2 + 2);
  if ((v17 & 4) == 0) {
    uint64_t v21 = (unsigned __int16 *)(v18 + 8 * a2 + 4);
  }
  uint64_t v22 = *v21;
  if (v20 == 0xFFFF)
  {
    uint64_t v23 = 0;
  }
  else if ((v17 & 4) != 0)
  {
    uint64_t v23 = (*(_DWORD *)(a1 + 400) >> 9) & 0x3FFF;
  }
  else
  {
    uint64_t v23 = *(unsigned __int16 *)(v18 + 8 * a2 + 2);
  }
  if (v22 > 0xFFFD)
  {
    uint64_t v24 = 0;
    if (!v23) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v24 = btree_node_val_len(a1, a2);
    if (!v23) {
      goto LABEL_17;
    }
  }
  uint64_t result = btree_node_key_range_validate(a1, v20, v23);
  if (result) {
    return result;
  }
LABEL_17:
  if (!v24)
  {
    if (v20 != 0xFFFF)
    {
LABEL_27:
      if (v24 >= a6) {
        int v28 = 1;
      }
      else {
        int v28 = a7;
      }
      uint64_t result = 22;
      if (v23 == a4 && v28)
      {
        uint64_t result = a9(*(void *)(a1 + 384) + v20, v23, a3, a4, *(void *)(a1 + 392) - v22, v24, a5, a6, a10);
        if (!result)
        {
          obj_dirty(a1, a8, 0);
          return 0;
        }
      }
      return result;
    }
    return 22;
  }
  LODWORD(result) = btree_node_val_range_validate(a1, v22, v24);
  int v26 = result;
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 22;
  }
  if (v20 != 0xFFFF && v26 == 0) {
    goto LABEL_27;
  }
  return result;
}

uint64_t bt_remove_internal(atomic_ullong *a1, uint64_t a2, int a3, unint64_t *a4, unsigned int a5, void *a6, unsigned int *a7, void *a8, unsigned int *a9, uint64_t a10)
{
  uint64_t v145 = *MEMORY[0x263EF8340];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v142 = 0u;
  uint64_t v134 = 0;
  MEMORY[0x270FA5388]();
  size_t v19 = (atomic_ullong **)((char *)&v105 - v18);
  bzero((char *)&v105 - v18, v20);
  memset(v133, 170, sizeof(v133));
  unsigned __int16 v132 = a5;
  unsigned __int16 v131 = -21846;
  unsigned __int16 v130 = -21846;
  unsigned __int16 v129 = -21846;
  if (!a1[52]) {
    return 22;
  }
  unint64_t v21 = a1[50];
  uint64_t v22 = (v21 >> 9) & 0x3FFF;
  if (!v22)
  {
    if (((unsigned __int16)((((v21 >> 27) & 0xF000) - 160) & 0xFFE0) >> 2) - 72 >= a5) {
      goto LABEL_4;
    }
    return 22;
  }
  if (v22 != a5) {
    return 22;
  }
LABEL_4:
  int v120 = *(unsigned __int16 *)(a1[49] + 16);
  v116 = a8;
  uint64_t v125 = a2;
  obj_lock((uint64_t)a1, 2);
  uint64_t v23 = obj_modify(a1, (*((_DWORD *)a1 + 100) >> 3) & 2, a10);
  if (v23)
  {
    uint64_t v24 = v23;
    obj_unlock((uint64_t)a1, 2);
    return v24;
  }
  v114 = a6;
  uint64_t v123 = a10;
  v115 = &v105;
  *(void *)&long long v142 = a1;
  obj_retain(a1);
  uint64_t v26 = btri_search_node(v142, a3, 1, a4, &v132, (unsigned __int16)a5, (_WORD *)&v142 + 4, (BOOL *)((unint64_t)&v142 | 0xA));
  if (v26)
  {
LABEL_10:
    uint64_t v24 = v26;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    goto LABEL_107;
  }
  v126 = (BOOL *)((unint64_t)&v142 | 0xA);
  v119 = (_WORD *)&v142 + 4;
  uint64_t v27 = 0;
  v121 = 0;
  int v113 = 0;
  char v29 = 0;
  v106 = a9;
  v117 = &v143;
  v111 = (_WORD *)&v143 + 4;
  int v112 = (v120 + 7) & 0x1FFF8;
  v118 = &v144;
  v109 = (_WORD *)&v144 + 4;
  v110 = (BOOL *)&v143 + 10;
  v108 = (BOOL *)&v144 + 10;
  v122 = a4;
  v107 = a7;
  unsigned int v30 = v114;
  while (1)
  {
    if (v29)
    {
      LODWORD(v124) = 1;
      uint64_t v31 = v143;
    }
    else
    {
      uint64_t v31 = v143;
      if (BYTE10(v142)) {
        BOOL v32 = WORD4(v142) == 0;
      }
      else {
        BOOL v32 = 0;
      }
      if (v32)
      {
        int v113 = WORD4(v143);
        LODWORD(v124) = 1;
        uint64_t v27 = v142;
        v121 = (atomic_ullong *)v143;
      }
      else
      {
        LODWORD(v124) = 0;
      }
    }
    int v33 = v126;
    if (!v31 || (a1[50] & 0x7FFE00) != 0) {
      goto LABEL_92;
    }
    *(void *)buf = 0;
    if (BYTE10(v142))
    {
      uint64_t v34 = btree_node_key_ptr(v31, WORD4(v143), &v133[2], &v129);
      if (v34) {
        goto LABEL_104;
      }
      __int16 v35 = v120;
      if ((*(void *)(v143 + 400) & 0x40) == 0) {
        __int16 v35 = v112;
      }
      __int16 v36 = v129;
      if ((*(void *)(v143 + 400) & 0x40) == 0) {
        __int16 v36 = (v129 + 7) & 0xFFF8;
      }
      __int16 v37 = v35 - v36;
      if (v37 < 0) {
        __int16 v38 = 0;
      }
      else {
        __int16 v38 = v37;
      }
    }
    else
    {
      __int16 v38 = 0;
    }
    unsigned __int16 v128 = btree_node_largest_key_len(v142);
    uint64_t v39 = v143;
    __int16 v127 = (*(_WORD *)(v142 + 406) & 0x7F) + 8;
    if (btree_node_has_room(v143, 1u, (__int16 *)&v128, &v127, v38, 0, 0))
    {
      a4 = v122;
LABEL_34:
      int v33 = v126;
      goto LABEL_92;
    }
    unsigned __int16 v40 = WORD4(v143);
    if (!BYTE10(v143)) {
      unsigned __int16 v40 = WORD4(v143) + 1;
    }
    uint64_t v41 = v132;
    uint64_t v34 = bt_shift_or_split(a1, v144, WORD4(v144), v39, v40, v122);
    if (v34)
    {
LABEL_104:
      uint64_t v24 = v34;
      goto LABEL_105;
    }
    uint64_t v42 = *(void *)buf;
    int v33 = v126;
    if (!*(void *)buf)
    {
      a4 = v122;
      goto LABEL_92;
    }
    uint64_t v43 = v143;
    v105 = (atomic_ullong *)v143;
    if ((void)v144)
    {
      ++WORD4(v144);
      if (!(void)v143)
      {
        uint64_t v47 = 0;
        goto LABEL_56;
      }
      if (v121 == (atomic_ullong *)v143 || (void)v143 == v27)
      {
        uint64_t v47 = v143;
        goto LABEL_56;
      }
      uint64_t v44 = v143;
      obj_unlock(v143, 2);
      obj_release(v44);
      goto LABEL_55;
    }
    *(void *)&long long v144 = v143;
    if (*(_DWORD *)(*(void *)(*(void *)buf + 56) + 36))
    {
      uint64_t v34 = btree_node_key_ptr(*(uint64_t *)buf, 0, &v133[2], &v129);
      if (v34) {
        goto LABEL_104;
      }
      uint64_t v43 = v144;
      int v45 = (unint64_t *)v133[2];
      uint64_t v46 = v129;
LABEL_54:
      uint64_t v24 = bt_search_node(v43, v45, v46, v109, v108);
      if (v24) {
        goto LABEL_105;
      }
LABEL_55:
      uint64_t v47 = 0;
      goto LABEL_56;
    }
    if ((a3 & 1) == 0)
    {
      int v45 = v122;
      uint64_t v46 = v41;
      goto LABEL_54;
    }
    if (!*(_DWORD *)(*(void *)(v143 + 56) + 36)) {
      goto LABEL_147;
    }
    uint64_t v47 = 0;
    WORD4(v144) = 0;
    BYTE10(v144) = 1;
LABEL_56:
    BOOL v48 = v121 != (atomic_ullong *)v144 || v121 == 0;
    int v49 = v113;
    if (!v48) {
      int v49 = WORD4(v144);
    }
    int v113 = v49;
    *(void *)&long long v143 = v42;
    if (a3)
    {
      if (!*(_DWORD *)(*(void *)(v42 + 56) + 36))
      {
LABEL_147:
        uint64_t v24 = 2;
LABEL_105:
        uint64_t v134 = v27;
        goto LABEL_106;
      }
      WORD4(v143) = 0;
      BYTE10(v143) = 1;
    }
    else
    {
      uint64_t v34 = bt_search_node(v42, v122, v41, v111, v110);
      if (v34) {
        goto LABEL_104;
      }
    }
    uint64_t v50 = v142;
    obj_unlock(v142, 2);
    obj_release(v50);
    *(void *)&long long v142 = 0;
    uint64_t v34 = btree_node_child_val(v143, WORD4(v143), v19);
    if (v34) {
      goto LABEL_104;
    }
    uint64_t v34 = btree_node_get(a1, v19, v125, 3, *(_WORD *)(*(void *)(v143 + 56) + 34) - 1, v123, (uint64_t *)&v142);
    if (v34) {
      goto LABEL_104;
    }
    uint64_t v51 = v142;
    if ((a1[50] & 0x10) != 0)
    {
      a4 = v122;
      if (*(void *)(v142 + 112) != *v19)
      {
        btree_node_child_id_update(v143, WORD4(v143), (unint64_t *)(v142 + 112), v123);
        uint64_t v51 = v142;
      }
    }
    else
    {
      a4 = v122;
    }
    uint64_t v34 = btri_search_node(v51, a3, 1, a4, &v132, (unsigned __int16)a5, v119, v126);
    if (v34) {
      goto LABEL_104;
    }
    if (v121 == v105)
    {
      int v54 = WORD4(v143);
      uint64_t v52 = v47;
      if (v121 == a1 && !WORD4(v143))
      {
        uint64_t v27 = v143;
        v121 = a1;
        int v33 = v126;
        unsigned int v30 = v114;
        goto LABEL_92;
      }
      int v53 = v124;
      unsigned int v30 = v114;
      if (!WORD4(v143))
      {
        int v113 = WORD4(v144);
        goto LABEL_83;
      }
      goto LABEL_87;
    }
    uint64_t v52 = v47;
    if (v124)
    {
      int v53 = 1;
      unsigned int v30 = v114;
      goto LABEL_88;
    }
    int v54 = WORD4(v143);
    unsigned int v30 = v114;
    if (BYTE10(v143) && !WORD4(v143))
    {
      int v113 = WORD4(v144);
      int v53 = 1;
LABEL_83:
      v121 = (atomic_ullong *)v144;
      uint64_t v27 = v143;
      goto LABEL_88;
    }
    int v53 = 0;
    if (BYTE10(v142) && !WORD4(v142))
    {
      int v53 = 1;
LABEL_87:
      v121 = (atomic_ullong *)v143;
      uint64_t v27 = v142;
      int v113 = v54;
    }
LABEL_88:
    LODWORD(v124) = v53;
    if (!v52) {
      goto LABEL_34;
    }
    int v33 = v126;
    if ((atomic_ullong *)v52 != v121 && v52 != v27)
    {
      obj_unlock(v52, 2);
      obj_release(v52);
      goto LABEL_34;
    }
LABEL_92:
    if ((*(_WORD *)(*(void *)(v142 + 56) + 32) & 2) != 0) {
      break;
    }
    uint64_t v55 = v144;
    if ((void)v144 && (atomic_ullong *)v144 != v121 && (void)v144 != v27)
    {
      obj_unlock(v144, 2);
      obj_release(v55);
    }
    v56 = v117;
    long long *v118 = *v117;
    long long *v56 = v142;
    *(void *)&long long v142 = 0;
    uint64_t v34 = btree_node_child_val(v143, WORD4(v143), v19);
    if (!v34)
    {
      uint64_t v34 = btree_node_get(a1, v19, v125, 3, *(_WORD *)(*(void *)(v143 + 56) + 34) - 1, v123, (uint64_t *)&v142);
      if (!v34)
      {
        uint64_t v57 = v142;
        if ((a1[50] & 0x10) != 0)
        {
          a4 = v122;
          if (*(void *)(v142 + 112) != *v19)
          {
            btree_node_child_id_update(v143, WORD4(v143), (unint64_t *)(v142 + 112), v123);
            uint64_t v57 = v142;
          }
        }
        else
        {
          a4 = v122;
        }
        uint64_t v34 = btri_search_node(v57, a3, 1, a4, &v132, (unsigned __int16)a5, v119, v126);
        char v29 = v124;
        if (!v34) {
          continue;
        }
      }
    }
    goto LABEL_104;
  }
  uint64_t v134 = v27;
  uint64_t v62 = btri_search_node(v142, a3, 1, a4, &v132, (unsigned __int16)a5, v119, v33);
  if (v62) {
    goto LABEL_134;
  }
  if (!BYTE10(v142))
  {
    uint64_t v24 = 2;
LABEL_106:
    uint64_t v28 = (uint64_t)v121;
    goto LABEL_107;
  }
  if (v30)
  {
    uint64_t v62 = btree_node_key_ptr(v142, 0, &v133[1], &v131);
    if (v62)
    {
LABEL_134:
      uint64_t v24 = v62;
      goto LABEL_106;
    }
    unsigned int v63 = v131;
    v64 = v107;
    unsigned int v65 = *v107;
    size_t v66 = *v107 >= v131 ? v131 : v65;
    memcpy(v30, v133[1], v66);
    unsigned int *v64 = v63;
    if (v65 < v63)
    {
      uint64_t v24 = 34;
      goto LABEL_106;
    }
  }
  uint64_t v28 = (uint64_t)v121;
  if (v116)
  {
    uint64_t v67 = btree_node_val_ptr((void *)v142, 0, v133, (__int16 *)&v130);
    if (v67) {
      goto LABEL_146;
    }
    unsigned int v68 = v130;
    unsigned int v69 = v130 == 65534 ? 0 : v130;
    v70 = v106;
    unsigned int v71 = *v106;
    size_t v72 = *v106 >= v69 ? v69 : v71;
    memcpy(v116, v133[0], v72);
    unsigned int *v70 = v68;
    if (v71 < v69)
    {
      uint64_t v24 = 34;
      goto LABEL_107;
    }
  }
  uint64_t v73 = v123;
  btree_node_remove(v142, WORD4(v142), v123);
  atomic_fetch_add_explicit((atomic_ullong *volatile)(a1[49] + 24), 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed);
  obj_dirty((uint64_t)a1, v73, 0);
  if (WORD4(v142))
  {
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 0;
    if (*(_DWORD *)(*(void *)(v142 + 56) + 36) && (void)v143)
    {
      uint64_t v24 = btree_node_key_ptr(v142, 0, &v133[2], &v129);
      if (v24
        || (uint64_t v24 = btree_node_entry_update(v143, WORD4(v143), (void *)v133[2], v129, 0, 0, v123), v24))
      {
        atomic_ullong v74 = a1[1];
        BOOL v75 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v74)
        {
          if (v75) {
            bt_remove_internal_cold_6();
          }
        }
        else if (v75)
        {
          bt_remove_internal_cold_5();
        }
      }
      uint64_t v28 = (uint64_t)v121;
    }
  }
  int is_underused = btree_node_is_underused((uint64_t)a1, v142);
  uint64_t v77 = v144;
  int v78 = v124;
  if ((void)v144)
  {
    if ((void)v144 != v28 && (void)v144 != v27)
    {
      obj_unlock(v144, 2);
      obj_release(v77);
      int v78 = v124;
    }
    *(void *)&long long v144 = 0;
  }
  uint64_t v79 = v143;
  if ((void)v143)
  {
    if ((void)v143 != v28 && (void)v143 != v27)
    {
      obj_unlock(v143, 2);
      obj_release(v79);
      int v78 = v124;
    }
    *(void *)&long long v143 = 0;
  }
  if (v78 && *(_DWORD *)(*(void *)(v142 + 56) + 36))
  {
    uint64_t v67 = btree_node_key_ptr(v142, 0, &v133[2], &v129);
    if (v67)
    {
LABEL_146:
      uint64_t v24 = v67;
      goto LABEL_107;
    }
    if (v28)
    {
      uint64_t v24 = btree_node_entry_update((uint64_t)v121, (unsigned __int16)v113, (void *)v133[2], v129, 0, 0, v123);
      if (v24)
      {
        atomic_ullong v81 = a1[1];
        BOOL v82 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v81)
        {
          if (v82) {
            bt_remove_internal_cold_4();
          }
        }
        else if (v82)
        {
          bt_remove_internal_cold_3();
        }
      }
      if (v121 != (atomic_ullong *)v144 && v121 != (atomic_ullong *)v143 && v121 != (atomic_ullong *)v142)
      {
        uint64_t v83 = (uint64_t)v121;
        obj_unlock((uint64_t)v121, 2);
        obj_release(v83);
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v84 = v134;
    uint64_t v85 = v134 + 56;
    v86 = v122;
    if ((*(_WORD *)(*(void *)(v134 + 56) + 32) & 2) == 0)
    {
      uint64_t v87 = v132;
      v126 = (BOOL *)v133[2];
      *(void *)&long long v80 = 136315906;
      long long v124 = v80;
      while (1)
      {
        unsigned __int16 v128 = -21846;
        LOBYTE(v127) = -86;
        uint64_t v27 = v84;
        uint64_t v88 = bt_search_node(v84, v86, v87, &v128, (BOOL *)&v127);
        if (v88)
        {
          uint64_t v24 = v88;
          goto LABEL_249;
        }
        if (!(_BYTE)v127)
        {
          uint64_t v24 = 0;
          break;
        }
        if (*(_WORD *)(*(void *)v85 + 34) == 1)
        {
          uint64_t v97 = a1[1];
          BOOL v98 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v97)
          {
            if (v98) {
              bt_remove_internal_cold_2(v97, v27);
            }
          }
          else if (v98)
          {
            bt_remove_internal_cold_1((uint64_t)a1, v27);
          }
          uint64_t v24 = 0;
          break;
        }
        unsigned int v89 = v128;
        int v90 = btree_node_entry_update(v27, v128, v126, v129, 0, 0, v123);
        if (v90)
        {
          int v91 = v90;
          atomic_ullong v92 = a1[1];
          BOOL v93 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v92)
          {
            if (v93)
            {
              *(_DWORD *)buf = v124;
              *(void *)&buf[4] = "bt_remove_internal";
              __int16 v136 = 1024;
              int v137 = 5120;
              __int16 v138 = 2080;
              uint64_t v139 = v92 + 3832;
              __int16 v140 = 1024;
              int v141 = v91;
              v94 = &_os_log_internal;
LABEL_217:
              _os_log_error_impl(&dword_22CAAC000, v94, OS_LOG_TYPE_ERROR, "%s:%d: %s btree_node_key_update failed: %d\n", buf, 0x22u);
            }
          }
          else if (v93)
          {
            uint64_t v96 = *(void *)(*(void *)(*a1 + 392) + 384) + 208;
            *(_DWORD *)buf = v124;
            *(void *)&buf[4] = "bt_remove_internal";
            __int16 v136 = 1024;
            int v137 = 5120;
            __int16 v138 = 2080;
            uint64_t v139 = v96;
            __int16 v140 = 1024;
            int v141 = v91;
            v94 = &_os_log_internal;
            goto LABEL_217;
          }
        }
        uint64_t v24 = btree_node_child_val(v27, v89, v19);
        __int16 v95 = *(_WORD *)(*(void *)v85 + 34);
        uint64_t v134 = 0;
        if (!v24) {
          uint64_t v24 = btree_node_get(a1, v19, v125, 3, v95 - 1, v123, &v134);
        }
        v86 = v122;
        if (v27 != (void)v144 && v27 != (void)v143 && v27 != (void)v142)
        {
          obj_unlock(v27, 2);
          obj_release(v27);
        }
        if (!v24)
        {
          uint64_t v84 = v134;
          uint64_t v85 = v134 + 56;
          if ((*(_WORD *)(*(void *)(v134 + 56) + 32) & 2) == 0) {
            continue;
          }
        }
        break;
      }
    }
  }
  else if (v28 && v28 != (void)v144 && v28 != (void)v142)
  {
    obj_unlock(v28, 2);
    obj_release(v28);
  }
  uint64_t v99 = v134;
  if (v134)
  {
    if (v134 != (void)v144 && v134 != (void)v143 && v134 != (void)v142)
    {
      obj_unlock(v134, 2);
      obj_release(v99);
    }
    uint64_t v134 = 0;
  }
  if (is_underused)
  {
    if (WORD4(v142))
    {
      v100 = 0;
      unsigned __int16 v101 = 0;
    }
    else if (*(_DWORD *)(*(void *)(v142 + 56) + 36))
    {
      uint64_t v26 = btree_node_key_ptr(v142, 0, &v133[2], &v129);
      if (v26) {
        goto LABEL_10;
      }
      unsigned __int16 v101 = v129;
      v103 = (unint64_t *)_apfs_malloc(v129);
      v100 = v103;
      if (v103) {
        memcpy(v103, v133[2], v129);
      }
      uint64_t v24 = 0;
    }
    else
    {
      v100 = 0;
      unsigned __int16 v101 = 0;
    }
    if (v100)
    {
      unsigned __int16 v102 = v101;
    }
    else
    {
      v100 = v122;
      unsigned __int16 v102 = v132;
    }
  }
  else
  {
    v100 = 0;
    unsigned __int16 v102 = 0;
  }
  uint64_t v104 = v142;
  obj_unlock(v142, 2);
  obj_release(v104);
  *(void *)&long long v142 = 0;
  if (is_underused)
  {
    bt_merge_up((uint64_t)a1, v125, v100, v102, v123);
    if (v100 != v122) {
      _apfs_free(v100, v102);
    }
  }
  uint64_t v27 = 0;
LABEL_249:
  uint64_t v28 = 0;
LABEL_107:
  uint64_t v58 = v144;
  if ((void)v144)
  {
    if ((void)v144 != v28 && (void)v144 != v27)
    {
      obj_unlock(v144, 2);
      obj_release(v58);
    }
    *(void *)&long long v144 = 0;
  }
  uint64_t v60 = v143;
  if ((void)v143)
  {
    if ((void)v143 != v28 && (void)v143 != v27)
    {
      obj_unlock(v143, 2);
      obj_release(v60);
    }
    *(void *)&long long v143 = 0;
  }
  uint64_t v61 = v142;
  if ((void)v142)
  {
    if ((void)v142 != v28 && (void)v142 != v27)
    {
      obj_unlock(v142, 2);
      obj_release(v61);
    }
    *(void *)&long long v142 = 0;
  }
  if (v28 && v28 != (void)v144 && v28 != (void)v143)
  {
    obj_unlock(v28, 2);
    obj_release(v28);
    uint64_t v27 = v134;
  }
  if (v27 && v27 != (void)v144 && v27 != (void)v143 && v27 != (void)v142)
  {
    obj_unlock(v27, 2);
    obj_release(v27);
  }
  return v24;
}

uint64_t btri_search_node(uint64_t a1, char a2, int a3, void *a4, _WORD *a5, unsigned int a6, _WORD *a7, BOOL *a8)
{
  if (a2)
  {
    if (!*(_DWORD *)(*(void *)(a1 + 56) + 36)) {
      return 2;
    }
    uint64_t v10 = 0;
    *a7 = 0;
    *a8 = 1;
    if (a3)
    {
      __src = (void *)0xAAAAAAAAAAAAAAAALL;
      unsigned __int16 v15 = -21846;
      uint64_t v10 = btree_node_key_ptr(a1, 0, &__src, &v15);
      if (!v10)
      {
        if (v15 >= a6) {
          size_t v12 = a6;
        }
        else {
          size_t v12 = v15;
        }
        *a5 = v12;
        memcpy(a4, __src, v12);
      }
    }
    return v10;
  }
  else
  {
    uint64_t v13 = (unsigned __int16)*a5;
    return bt_search_node(a1, (unint64_t *)a4, v13, a7, a8);
  }
}

void btree_node_remove(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_WORD *)(v6 + 32) & 4;
  if (v7) {
    unsigned int v8 = (*(_DWORD *)(a1 + 400) >> 9) & 0x3FFF;
  }
  else {
    unsigned int v8 = *(unsigned __int16 *)(*(void *)(a1 + 376) + 8 * a2 + 2);
  }
  if (*(unsigned __int16 *)(a1 + 440) <= v8)
  {
    *(_WORD *)(a1 + 440) = 0;
    int v7 = *(_WORD *)(v6 + 32) & 4;
  }
  uint64_t v9 = *(void *)(a1 + 376);
  uint64_t v10 = (unsigned __int16 *)(v9 + 4 * a2);
  v11 = (unsigned __int16 *)(v9 + 8 * a2);
  if (v7) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v11;
  }
  uint64_t v13 = *v12;
  uint64_t v14 = *(void *)(a1 + 400);
  if ((v14 & 0x40) != 0) {
    unsigned __int16 v15 = v8;
  }
  else {
    unsigned __int16 v15 = (v8 + 7) & 0xFFF8;
  }
  if (v13 != 0xFFFF)
  {
    int v16 = btree_node_key_range_validate(a1, v13, v15);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 400);
    if (!v16)
    {
      unsigned __int16 v17 = (v15 + 7) & 0xFFF8;
      if ((v14 & 0x40) != 0) {
        unsigned __int16 v17 = v15;
      }
      if (v17 >= 4u)
      {
        uint64_t v18 = (_WORD *)(*(void *)(a1 + 384) + v13);
        v18[1] = v17;
        *uint64_t v18 = *(_WORD *)(v6 + 48);
        *(_WORD *)(v6 + 48) = v13;
      }
      *(_WORD *)(v6 + 50) += v17;
      uint64_t v14 = *(void *)(a1 + 400);
    }
  }
  uint64_t v19 = *(void *)(a1 + 376);
  uint64_t v20 = v19 + 4 * a2 + 2;
  uint64_t v21 = v19 + 8 * a2 + 4;
  if ((*(_WORD *)(v6 + 32) & 4) != 0) {
    uint64_t v22 = (unsigned __int16 *)v20;
  }
  else {
    uint64_t v22 = (unsigned __int16 *)v21;
  }
  unint64_t v23 = *v22;
  unsigned __int16 v24 = btree_node_val_len(a1, a2);
  if ((v14 & 0x40) != 0) {
    unsigned __int16 v25 = v24;
  }
  else {
    unsigned __int16 v25 = (v24 + 7) & 0xFFF8;
  }
  if (v23 <= 0xFFFD)
  {
    int v26 = btree_node_val_range_validate(a1, v23, v25);
    uint64_t v6 = *(void *)(a1 + 56);
    if (!v26)
    {
      if ((*(unsigned char *)(a1 + 400) & 0x40) != 0) {
        unsigned __int16 v27 = v25;
      }
      else {
        unsigned __int16 v27 = (v25 + 7) & 0xFFF8;
      }
      if (v27 >= 4u)
      {
        uint64_t v28 = (_WORD *)(*(void *)(a1 + 392) - v23);
        v28[1] = v27;
        *uint64_t v28 = *(_WORD *)(v6 + 52);
        *(_WORD *)(v6 + 52) = v23;
      }
      *(_WORD *)(v6 + 54) += v27;
    }
  }
  unsigned int v29 = *(_DWORD *)(v6 + 36) - 1;
  if (v29 > a2)
  {
    btree_node_toc_shift(a1, a2, -1);
    uint64_t v6 = *(void *)(a1 + 56);
    unsigned int v29 = *(_DWORD *)(v6 + 36) - 1;
  }
  *(_DWORD *)(v6 + 36) = v29;
  __int16 v30 = *(_WORD *)(v6 + 32);
  if ((v30 & 4) != 0)
  {
    if ((*(unsigned char *)(a1 + 400) & 4) == 0) {
      goto LABEL_50;
    }
    unsigned int v31 = 4;
  }
  else
  {
    unsigned int v31 = 8;
  }
  unsigned int v32 = *(unsigned __int16 *)(v6 + 42) / v31;
  if (v32 - v29 >= 0x10)
  {
    if ((v30 & 4) != 0)
    {
      unint64_t v34 = *(void *)(a1 + 400);
      if ((v30 & 2) != 0) {
        unint64_t v35 = v34 >> 23;
      }
      else {
        LODWORD(v35) = (HIWORD(v34) & 0x7F) + 8;
      }
      unint64_t v36 = (((v34 >> 27) & 0x1F000) - 56) / (((v34 >> 9) & 0x3FFF) + (unsigned __int16)v35 + 4);
      if (v32 <= (v36 & 0xFFFE)) {
        goto LABEL_50;
      }
      unsigned __int16 v37 = v36 & 0xFFFE;
      int v38 = v32 - 8;
      __int16 v39 = v32 - v37;
      if (v38 >= v37) {
        __int16 v33 = 8;
      }
      else {
        __int16 v33 = v39;
      }
    }
    else
    {
      __int16 v33 = 8;
    }
    unsigned __int16 v40 = v33 * v31;
    memmove((void *)(*(void *)(a1 + 384) - (unsigned __int16)(v33 * v31)), *(const void **)(a1 + 384), *(unsigned __int16 *)(v6 + 44));
    *(void *)(a1 + 384) -= v40;
    uint64_t v41 = *(void *)(a1 + 56);
    *(_WORD *)(v41 + 42) -= v40;
    *(_WORD *)(v41 + 46) += v40;
  }
LABEL_50:

  obj_dirty(a1, a3, 0);
}

uint64_t btree_node_is_underused(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  int v3 = *(unsigned __int16 *)(v2 + 32);
  if ((~v3 & 3) == 0) {
    return 0;
  }
  unsigned int v4 = *(_DWORD *)(v2 + 36);
  if (!v4) {
    return 1;
  }
  if (*(void *)(a1 + 432) == *(void *)(a2 + 112)) {
    return 0;
  }
  if ((v3 & 4) != 0 && (*(unsigned char *)(a2 + 400) & 4) == 0) {
    return v4 < *(unsigned __int16 *)(v2 + 42) >> 3;
  }
  __int16 v7 = obj_size_phys(a2);
  if (*(_WORD *)(*(void *)(a2 + 56) + 32)) {
    __int16 v8 = -96;
  }
  else {
    __int16 v8 = -56;
  }
  return btree_node_free_space_total(a2) > (unsigned __int16)((v8 + v7) & 0xFFFE) >> 1;
}

void bt_merge_up(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  v11 = (uint64_t *)((char *)&v44 - v10);
  bzero((char *)&v44 - v10, v12);
  v54[0] = 0xAAAAAAAAAAAAAAAALL;
  v54[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v13 = *(void *)(a1 + 56);
  if (!v13) {
    return;
  }
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v55[2] = v14;
  v55[3] = v14;
  v55[0] = v14;
  v55[1] = v14;
  int v51 = -1431655766;
  unsigned __int16 v50 = -21846;
  unsigned __int16 v49 = -21846;
  unsigned int v15 = *(unsigned __int16 *)(v13 + 34);
  if (v15 >= 6)
  {
    uint64_t v16 = v15 + 11;
    uint64_t v18 = (unsigned __int16)(v15 + 11);
    unsigned __int16 v17 = (uint64_t *)_apfs_malloc(8 * v18);
    uint64_t v47 = _apfs_malloc(2 * v18);
  }
  else
  {
    uint64_t v16 = 8;
    uint64_t v47 = v54;
    unsigned __int16 v17 = (uint64_t *)v55;
  }
  obj_lock(a1, 2);
  if (obj_modify(a1, (*(_DWORD *)(a1 + 400) >> 3) & 2, a5))
  {
    obj_unlock(a1, 2);
    return;
  }
  uint64_t *v17 = a1;
  obj_retain((atomic_ullong *)a1);
  uint64_t v19 = *v17;
  if ((*(_WORD *)(*(void *)(*v17 + 56) + 32) & 2) != 0)
  {
    LOWORD(v21) = 0;
  }
  else
  {
    uint64_t v45 = v16;
    uint64_t v46 = a2;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    unint64_t v52 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v53 = 0xAAAAAAAAAAAAAAAALL;
    char v48 = -86;
    __int16 v22 = v16;
    if ((v16 & 0xFFFE) == 0) {
      __int16 v22 = 1;
    }
    uint64_t v23 = (unsigned __int16)(v22 - 1);
    unsigned __int16 v24 = v17 + 1;
    do
    {
      if (bt_search_node(v19, a3, a4, &v47[v20], (BOOL *)&v48)) {
        goto LABEL_63;
      }
      if (v23 == v21)
      {
        LOWORD(v16) = v45;
        LOWORD(v21) = v45 - 1;
        goto LABEL_64;
      }
      void *v11 = 0;
      if (btree_node_child_val(*(v24 - 1), (unsigned __int16)v47[v21], v11)
        || btree_node_get((void *)a1, v11, v46, 3, *(_WORD *)(*(void *)(*(v24 - 1) + 56) + 34) - 1, a5, v24))
      {
        goto LABEL_63;
      }
      uint64_t v19 = *v24;
      if ((*(unsigned char *)(a1 + 400) & 0x10) != 0 && *(void *)(v19 + 112) != *v11)
      {
        btree_node_child_id_update(*(v24 - 1), (unsigned __int16)v47[v21], (unint64_t *)(v19 + 112), a5);
        uint64_t v19 = *v24;
      }
      ++v20;
      ++v24;
      ++v21;
    }
    while ((*(_WORD *)(*(void *)(v19 + 56) + 32) & 2) == 0);
    if ((_WORD)v21)
    {
      unsigned __int16 v25 = v21;
      LOWORD(v16) = v45;
      while (1)
      {
        uint64_t v26 = ((__int16)v25 - 1);
        if ((__int16)v25 < 1) {
          break;
        }
        if ((int)v21 <= (__int16)v25) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = v17[(__int16)v25 + 1];
        }
        bt_merge_nodes(a1, v17[v26], (unsigned __int16)v47[v26], v17[v25], (unsigned __int16)v47[v25], v27, v46, a5);
        int v28 = *(_DWORD *)(*(void *)(v17[v25] + 56) + 36);
        if ((__int16)v25 < 2 || v28)
        {
          if (v28)
          {
            if (btree_node_key_ptr(v17[v26], (unsigned __int16)v47[v26], &v52, &v49)) {
              goto LABEL_64;
            }
            int v51 = 0;
            if (btree_node_key_ptr(v17[v25], 0, &v53, &v50)) {
              goto LABEL_64;
            }
            uint64_t v37 = *(void *)(a1 + 8);
            if (!v37) {
              uint64_t v37 = *(void *)(*(void *)a1 + 392);
            }
            int v38 = (void *)v53;
            int v39 = (*(uint64_t (**)(uint64_t, unint64_t, void, unint64_t, void, int *))(a1 + 416))(v37, v53, v50, v52, v49, &v51);
            if (!v39 && v51) {
              int v39 = btree_node_entry_update(v17[v26], (unsigned __int16)v47[v26], v38, v50, 0, 0, a5);
            }
            if (v39) {
              goto LABEL_64;
            }
          }
        }
        else if (!v47[v26])
        {
          uint64_t v29 = (unsigned __int16)(v25 - 1);
          if (v25 != 1)
          {
            uint64_t v30 = v17[(unsigned __int16)(v25 - 1)];
            if (*(_DWORD *)(*(void *)(v30 + 56) + 36))
            {
              unsigned int v31 = &v47[v29];
              int v32 = v29 - 1;
              --v25;
              while (1)
              {
                if (*v31--) {
                  goto LABEL_27;
                }
                if (btree_node_key_ptr(v30, 0, &v53, &v50)) {
                  goto LABEL_69;
                }
                int v51 = 0;
                if (btree_node_key_ptr(v17[v32], (unsigned __int16)v47[v32], &v52, &v49)) {
                  goto LABEL_69;
                }
                uint64_t v34 = *(void *)(a1 + 8);
                if (!v34) {
                  uint64_t v34 = *(void *)(*(void *)a1 + 392);
                }
                unint64_t v35 = (void *)v53;
                int v36 = (*(uint64_t (**)(uint64_t, unint64_t, void, unint64_t, void, int *))(a1 + 416))(v34, v53, v50, v52, v49, &v51);
                if (!v36 && v51) {
                  int v36 = btree_node_entry_update(v17[v32], (unsigned __int16)v47[v32], v35, v50, 0, 0, a5);
                }
                if (v36)
                {
LABEL_69:
                  uint64_t v42 = *(void *)(a1 + 8);
                  BOOL v43 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                  LOWORD(v16) = v45;
                  if (v42)
                  {
                    if (v43) {
                      bt_merge_up_cold_2();
                    }
                  }
                  else if (v43)
                  {
                    bt_merge_up_cold_1();
                  }
                  goto LABEL_64;
                }
                LOWORD(v26) = v26 - 1;
                if ((_WORD)v26)
                {
                  uint64_t v30 = v17[(unsigned __int16)v26];
                  --v32;
                  if (*(_DWORD *)(*(void *)(v30 + 56) + 36)) {
                    continue;
                  }
                }
                goto LABEL_27;
              }
            }
          }
        }
        --v25;
LABEL_58:
        if ((btree_node_is_underused(a1, v17[v25]) & 1) == 0) {
          goto LABEL_64;
        }
      }
      --v25;
      bt_merge_nodes(a1, 0, 0, *v17, (unsigned __int16)*v47, v17[1], v46, a5);
LABEL_27:
      if ((v25 & 0x8000) != 0) {
        goto LABEL_63;
      }
      LOWORD(v16) = v45;
      goto LABEL_58;
    }
    LOWORD(v21) = 0;
LABEL_63:
    LOWORD(v16) = v45;
  }
LABEL_64:
  int v40 = 0;
  do
  {
    uint64_t v41 = v17[(__int16)v40];
    obj_unlock(v41, 2);
    obj_release(v41);
    ++v40;
  }
  while ((unsigned __int16)v21 >= (__int16)v40);
  if ((unsigned __int16)v16 >= 9u)
  {
    _apfs_free(v17, 8 * (unsigned __int16)v16);
    _apfs_free(v47, 2 * (unsigned __int16)v16);
  }
}

uint64_t bt_remove(atomic_ullong *a1, uint64_t a2, unint64_t *a3, unsigned int a4, uint64_t a5)
{
  return bt_remove_internal(a1, a2, 0, a3, a4, 0, 0, 0, 0, a5);
}

uint64_t bt_remove_first(atomic_ullong *a1, uint64_t a2, void *a3, unsigned int *a4, void *a5, unsigned int *a6, uint64_t a7)
{
  size_t v14 = *(unsigned int *)(a1[49] + 16);
  unsigned int v15 = (unint64_t *)_apfs_malloc(v14);
  if (!v15) {
    return 12;
  }
  uint64_t v16 = v15;
  uint64_t v17 = bt_remove_internal(a1, a2, 1, v15, v14, a3, a4, a5, a6, a7);
  _apfs_free(v16, v14);
  return v17;
}

uint64_t bt_lookup_first(atomic_ullong *a1, uint64_t a2, void *a3, _DWORD *a4, void *a5, unsigned int *a6)
{
  v33[1] = *MEMORY[0x263EF8340];
  unint64_t v12 = a1[50];
  MEMORY[0x270FA5388]();
  size_t v14 = &v28[-v13];
  bzero(&v28[-v13], v15);
  v33[0] = 0;
  if (!a1[52]) {
    return 22;
  }
  unsigned int v16 = (v12 >> 9) & 0x3FFF;
  if (v16)
  {
    if (*a4 != v16) {
      return 22;
    }
  }
  if ((unsigned __int16)(v12 >> 23) && *a6 != (unsigned __int16)(v12 >> 23)) {
    return 22;
  }
  unsigned __int16 v30 = -21846;
  unsigned __int16 v29 = -21846;
  obj_lock((uint64_t)a1, 1);
  obj_retain(a1);
  uint64_t v18 = (uint64_t)(a1 + 7);
  atomic_ullong v17 = a1[7];
  if ((*(_WORD *)(v17 + 32) & 2) != 0)
  {
    uint64_t v19 = a1;
LABEL_15:
    if (*(_DWORD *)(v17 + 36))
    {
      int v32 = (const void *)0xAAAAAAAAAAAAAAAALL;
      uint64_t v20 = btree_node_key_ptr((uint64_t)v19, 0, &v32, &v30);
      if (!v20)
      {
        unsigned int v31 = (const void *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v20 = btree_node_val_ptr(v19, 0, &v31, (__int16 *)&v29);
        if (!v20)
        {
          unsigned int v21 = v29;
          if (v29 == 65534) {
            unsigned int v22 = 0;
          }
          else {
            unsigned int v22 = v29;
          }
          int v23 = v30;
          if (*a4 >= v30) {
            size_t v24 = v30;
          }
          else {
            size_t v24 = *a4;
          }
          if (*a4 >= v30 && *a6 >= v22) {
            uint64_t v20 = 0;
          }
          else {
            uint64_t v20 = 34;
          }
          memcpy(a3, v32, v24);
          if (*a6 >= v22) {
            size_t v26 = v22;
          }
          else {
            size_t v26 = *a6;
          }
          memcpy(a5, v31, v26);
          *a4 = v23;
          *a6 = v21;
        }
      }
    }
    else
    {
      uint64_t v20 = 2;
    }
    obj_unlock((uint64_t)v19, 1);
    obj_release(v19);
  }
  else
  {
    uint64_t v19 = a1;
    while (1)
    {
      *size_t v14 = 0;
      uint64_t v20 = btree_node_child_val((uint64_t)v19, 0, v14);
      if (!v20) {
        uint64_t v20 = btree_node_get(a1, v14, a2, 2, *(_WORD *)(*(void *)v18 + 34) - 1, 0, v33);
      }
      obj_unlock((uint64_t)v19, 1);
      obj_release(v19);
      if (v20) {
        break;
      }
      uint64_t v19 = (atomic_ullong *)v33[0];
      uint64_t v18 = v33[0] + 56;
      atomic_ullong v17 = *(void *)(v33[0] + 56);
      if ((*(_WORD *)(v17 + 32) & 2) != 0) {
        goto LABEL_15;
      }
    }
  }
  return v20;
}

uint64_t bt_lookup_variant(atomic_ullong *a1, uint64_t a2, unint64_t *a3, unsigned int *a4, unsigned int a5, void *a6, unsigned int *a7, unsigned int a8, int a9, uint64_t *a10)
{
  if (!a1[52]) {
    return 22;
  }
  unint64_t v17 = a1[50];
  unsigned int v18 = (v17 >> 9) & 0x3FFF;
  if (v18)
  {
    if (*a4 != v18) {
      return 22;
    }
  }
  if ((unsigned __int16)(v17 >> 23) && *a7 != (unsigned __int16)(v17 >> 23)) {
    return 22;
  }
  unsigned int v19 = *a4;
  if ((v17 & 0x7FFE00) == 0 && v19 > ((unsigned __int16)((((v17 >> 27) & 0xF000) - 160) & 0xFFE0) >> 2) - 72) {
    return 22;
  }
  unsigned __int16 v25 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  unsigned __int16 v24 = -21846;
  uint64_t v20 = bt_lookup_internal(a1, a2, a3, (unsigned __int16)v19, a8, a9, 0, a10, &v25, &v24);
  if (!v20)
  {
    unsigned int v22 = v25;
    uint64_t v23 = bt_lookup_copy_out((uint64_t)a1, v25, v24, a3, a4, a5, a6, a7, a8);
    uint64_t v20 = v23;
    if (a10 && !v23)
    {
      *a10 = obj_oid((uint64_t)v22);
      a10[1] = (uint64_t)a1;
    }
    obj_unlock((uint64_t)v22, 1);
    obj_release(v22);
  }
  return v20;
}

uint64_t bt_lookup_internal(atomic_ullong *a1, uint64_t a2, unint64_t *a3, unsigned int a4, unsigned int a5, int a6, unsigned int a7, uint64_t *a8, atomic_ullong **a9, unsigned __int16 *a10)
{
  int v41 = a6;
  unsigned int v42 = a7;
  unsigned int v45 = a4;
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  int v39 = a9;
  v49[1] = *(atomic_ullong **)MEMORY[0x263EF8340];
  atomic_ullong v13 = a1[50];
  MEMORY[0x270FA5388]();
  size_t v15 = &v37[-v14];
  bzero(&v37[-v14], v16);
  char v48 = 0;
  v49[0] = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  unsigned __int16 v47 = -21846;
  char v46 = -86;
  if (!a8) {
    goto LABEL_9;
  }
  uint64_t v17 = *a8;
  if (!*a8) {
    goto LABEL_9;
  }
  if ((v13 & 0x10) != 0) {
    goto LABEL_9;
  }
  if ((atomic_ullong *)a8[1] != a1) {
    goto LABEL_9;
  }
  *size_t v15 = v17;
  if (v17 == obj_oid((uint64_t)a1)
    || btree_node_get(a1, v15, v43, (((*(unsigned __int16 *)(a1[7] + 32) >> 3) & 1) << 6) | 6u, 0, 0, (uint64_t *)v49))
  {
    goto LABEL_9;
  }
  unsigned int v18 = v49[0];
  if ((*(_WORD *)(v49[0][7] + 32) & 2) == 0) {
    goto LABEL_8;
  }
  int v35 = bt_search_node_insert((uint64_t)v49[0], v44, v45, &v47, (BOOL *)&v46);
  if (!v35 && v46)
  {
    if (a5 != 4)
    {
      if (a5 != 2) {
        goto LABEL_80;
      }
      if (v47)
      {
        --v47;
        goto LABEL_80;
      }
LABEL_83:
      char v46 = 0;
      goto LABEL_8;
    }
    if (*(_DWORD *)(v18[7] + 36) <= ++v47) {
      goto LABEL_83;
    }
LABEL_80:
    uint64_t v34 = v39;
LABEL_81:
    uint64_t v33 = 0;
    unint64_t *v34 = v18;
    *a10 = v47;
    return v33;
  }
  if (!(v35 | a5))
  {
    if (v47 && *(_DWORD *)(v18[7] + 36) > v47)
    {
      unsigned __int16 v25 = 0;
      uint64_t v33 = 2;
      uint64_t v34 = v39;
      goto LABEL_53;
    }
    goto LABEL_8;
  }
  if (!v35 && a5 - 3 <= 1 && v47 && *(_DWORD *)(v18[7] + 36) > v47) {
    goto LABEL_80;
  }
LABEL_8:
  obj_unlock((uint64_t)v18, 1);
  obj_release(v18);
LABEL_9:
  BOOL v19 = a5 == 2;
  unsigned int v38 = a5 - 3;
  BOOL v20 = a5 - 3 < 2;
  obj_lock((uint64_t)a1, 1);
  v49[0] = a1;
  obj_retain(a1);
  unsigned __int16 v21 = 0;
  unsigned int v22 = a1;
  unsigned int v40 = a5;
  while (1)
  {
    char v46 = 0;
    unsigned __int16 v24 = v22 + 7;
    atomic_ullong v23 = v22[7];
    if ((*(_WORD *)(v23 + 32) & 2) != 0)
    {
      unsigned __int16 v25 = 0;
    }
    else
    {
      unsigned __int16 v25 = 0;
      while (*(unsigned __int16 *)(v23 + 34) > v42)
      {
        uint64_t v26 = bt_search_node((uint64_t)v22, v44, v45, &v47, (BOOL *)&v46);
        if (v26) {
          goto LABEL_48;
        }
        unsigned int v27 = v47;
        if (v19 && v47 != 0 || v20 && *(_DWORD *)(*v24 + 36) - 1 > v47)
        {
          if (v25)
          {
            obj_unlock((uint64_t)v25, 1);
            obj_release(v25);
            unsigned int v27 = v47;
          }
          unsigned __int16 v25 = v49[0];
          obj_retain(v49[0]);
          unsigned __int16 v21 = v20 - v19 + v27;
        }
        int v28 = v49[0];
        if ((v41 & 0x100) != 0)
        {
          atomic_ullong v29 = v49[0][7];
          if (*(_WORD *)(v29 + 34) == 1
            && *(_DWORD *)(v29 + 36) - 1 > v27
            && !btree_node_child_val((uint64_t)v49[0], (unsigned __int16)(v27 + 1), v15))
          {
            btree_node_get(a1, v15, v43, 256, *(_WORD *)(v28[7] + 34) - 1, 0, (uint64_t *)&v48);
          }
        }
        uint64_t v26 = btree_node_child_val((uint64_t)v28, v27, v15);
        if (v26) {
          goto LABEL_48;
        }
        uint64_t v26 = btree_node_get(a1, v15, v43, 2, *(_WORD *)(v28[7] + 34) - 1, 0, (uint64_t *)&v48);
        if (v26) {
          goto LABEL_48;
        }
        btree_node_release((uint64_t)v28, v28 != v25);
        unsigned int v22 = v48;
        v49[0] = v48;
        unsigned __int16 v24 = v48 + 7;
        atomic_ullong v23 = v48[7];
        if ((*(unsigned char *)(v23 + 32) & 2) != 0) {
          break;
        }
      }
    }
    uint64_t v26 = bt_search_node_insert((uint64_t)v22, v44, v45, &v47, (BOOL *)&v46);
    if (v26)
    {
LABEL_48:
      uint64_t v33 = v26;
      goto LABEL_49;
    }
    if (v46) {
      break;
    }
    if (!v40)
    {
      uint64_t v33 = 2;
      goto LABEL_49;
    }
    unsigned int v30 = v47;
    if (v40 <= 2 && v47)
    {
      uint64_t v33 = 0;
      char v46 = 1;
      goto LABEL_69;
    }
    if (v38 <= 1)
    {
      unsigned int v31 = *(_DWORD *)(*v24 + 36);
      goto LABEL_43;
    }
LABEL_44:
    if (!v25)
    {
      uint64_t v33 = 2;
      unsigned int v18 = v49[0];
      uint64_t v34 = v39;
      if (v49[0]) {
        goto LABEL_53;
      }
      goto LABEL_54;
    }
    btree_node_release((uint64_t)v22, v22 != v25);
    uint64_t v32 = btree_node_child_val((uint64_t)v25, v21, v15);
    if (v32
      || (uint64_t v32 = btree_node_get(a1, v15, v43, 2, *(_WORD *)(v25[7] + 34) - 1, 0, (uint64_t *)v49), v32))
    {
      uint64_t v33 = v32;
      v49[0] = 0;
      uint64_t v34 = v39;
      goto LABEL_50;
    }
    obj_unlock((uint64_t)v25, 1);
    obj_release(v25);
    BOOL v19 = 0;
    BOOL v20 = 0;
    unsigned int v22 = v49[0];
  }
  if (v40 != 2)
  {
    if (v40 != 4 || (++v47, unsigned int v31 = *(_DWORD *)(*v24 + 36), v31 > v47))
    {
      uint64_t v33 = 0;
      goto LABEL_49;
    }
    unsigned int v30 = v47;
    char v46 = 0;
LABEL_43:
    if (v31 > v30)
    {
      uint64_t v33 = 0;
      char v46 = 1;
      goto LABEL_49;
    }
    goto LABEL_44;
  }
  LOWORD(v30) = v47;
  if (!v47)
  {
    char v46 = 0;
    goto LABEL_44;
  }
  uint64_t v33 = 0;
LABEL_69:
  unsigned __int16 v47 = v30 - 1;
LABEL_49:
  uint64_t v34 = v39;
  if (!v25) {
    goto LABEL_51;
  }
LABEL_50:
  obj_unlock((uint64_t)v25, 1);
  obj_release(v25);
LABEL_51:
  unsigned int v18 = v49[0];
  if (!v33) {
    goto LABEL_81;
  }
  if (!v49[0]) {
    goto LABEL_54;
  }
LABEL_53:
  btree_node_release((uint64_t)v18, v18 != v25);
LABEL_54:
  unint64_t *v34 = 0;
  return v33;
}

uint64_t bt_lookup_copy_out(uint64_t a1, void *a2, unsigned __int16 a3, void *a4, _DWORD *a5, unsigned int a6, void *a7, unsigned int *a8, int a9)
{
  __src = (void *)0xAAAAAAAAAAAAAAAALL;
  int v30 = 0;
  unsigned __int16 v29 = -21846;
  unsigned __int16 v28 = -21846;
  if (!(a9 | a6))
  {
    __src = 0;
    unsigned __int16 v29 = 0;
    goto LABEL_22;
  }
  uint64_t v17 = btree_node_key_ptr((uint64_t)a2, a3, &__src, &v29);
  uint64_t v18 = v17;
  if (a9) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (!v19)
  {
LABEL_19:
    if (v18) {
      return v18;
    }
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(a1 + 8);
  if (!v20) {
    uint64_t v20 = *(void *)(*(void *)a1 + 392);
  }
  uint64_t v18 = (*(uint64_t (**)(uint64_t, void *, void, void *, void, int *))(a1 + 416))(v20, __src, v29, a4, *a5, &v30);
  if (!v18)
  {
    if (a9 == 2 && (v30 & 0x80000000) == 0 || a9 == 1 && v30 > 0 || a9 == 3 && v30 < 0 || a9 == 4 && v30 <= 0)
    {
      uint64_t v18 = nx_corruption_detected_int(*(void *)(*(void *)a1 + 392), (uint64_t)"bt_lookup_copy_out", 5519);
      goto LABEL_19;
    }
LABEL_22:
    unsigned int v31 = (void *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v18 = btree_node_val_ptr(a2, a3, &v31, (__int16 *)&v28);
    if (!v18)
    {
      unsigned int v21 = v28;
      if (v28 == 65534) {
        unsigned int v22 = 0;
      }
      else {
        unsigned int v22 = v28;
      }
      unsigned int v23 = *a8;
      if (*a8 < v22 || (uint64_t v18 = 0, a6) && v29 > a6) {
        uint64_t v18 = 34;
      }
      if (a6)
      {
        int v24 = v29;
        if (v29 >= a6) {
          size_t v25 = a6;
        }
        else {
          size_t v25 = v29;
        }
        memcpy(a4, __src, v25);
        *a5 = v24;
        unsigned int v23 = *a8;
      }
      if (v23 >= v22) {
        size_t v26 = v22;
      }
      else {
        size_t v26 = v23;
      }
      memcpy(a7, v31, v26);
      *a8 = v21;
    }
  }
  return v18;
}

__n128 bt_iterator_init_with_hint(uint64_t a1, atomic_ullong *a2, uint64_t a3, int a4, unint64_t *a5, int a6, unsigned int a7, void *a8, unsigned int a9, _OWORD *a10)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  int v16 = a4 & 0x180;
  *(_DWORD *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 20) = a7;
  *(void *)(a1 + 32) = a5;
  *(void *)(a1 + 40) = a8;
  *(void *)(a1 + 24) = a9;
  uint64_t v17 = (uint64_t *)(a1 + 56);
  if (a10)
  {
    *(_OWORD *)uint64_t v17 = *a10;
  }
  else
  {
    uint64_t *v17 = 0;
    *(void *)(a1 + 64) = 0;
  }
  *(_DWORD *)(a1 + 48) = a6;
  *(_DWORD *)(a1 + 52) = a9;
  if ((a4 & 4) != 0)
  {
    unsigned int v18 = 4;
  }
  else if ((a4 & 2) != 0)
  {
    int v21 = a4 & 0x180;
    int v19 = bt_lookup_variant(a2, a3, a5, (unsigned int *)(a1 + 48), a7, a8, (unsigned int *)(a1 + 52), 1u, v16, (uint64_t *)(a1 + 56));
    if (v19 != 2) {
      goto LABEL_11;
    }
    unsigned int v18 = 3;
    int v16 = v21;
  }
  else
  {
    unsigned int v18 = 3;
  }
  int v19 = bt_lookup_variant(a2, a3, a5, (unsigned int *)(a1 + 48), a7, a8, (unsigned int *)(a1 + 52), v18, v16, v17);
LABEL_11:
  if (v19)
  {
    *(_DWORD *)(a1 + 16) |= 1u;
    if (v19 != 2) {
      *(_DWORD *)(a1 + 28) = v19;
    }
  }
  else if (a10)
  {
    __n128 result = *(__n128 *)v17;
    *a10 = *(_OWORD *)v17;
  }
  return result;
}

double bt_iterator_init(uint64_t a1, atomic_ullong *a2, uint64_t a3, int a4, unint64_t *a5, int a6, unsigned int a7, void *a8, unsigned int a9)
{
  *(void *)&double result = bt_iterator_init_with_hint(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0).n128_u64[0];
  return result;
}

uint64_t bt_iterator_ended(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 28);
  if (!result) {
    return *(_DWORD *)(a1 + 16) & 1;
  }
  return result;
}

uint64_t bt_iterator_next(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 28);
  if (!result)
  {
    int v3 = *(_DWORD *)(a1 + 16);
    uint64_t result = 2;
    if ((v3 & 1) == 0)
    {
      unsigned int v4 = *(_DWORD *)(a1 + 20);
      *(_DWORD *)(a1 + 52) = *(_DWORD *)(a1 + 24);
      if ((v3 & 0x1000) != 0) {
        unsigned int v5 = 2;
      }
      else {
        unsigned int v5 = 4;
      }
      uint64_t result = bt_lookup_variant(*(atomic_ullong **)a1, *(void *)(a1 + 8), *(unint64_t **)(a1 + 32), (unsigned int *)(a1 + 48), v4, *(void **)(a1 + 40), (unsigned int *)(a1 + 52), v5, v3 & 0x180, (uint64_t *)(a1 + 56));
      if (result == 2)
      {
        uint64_t result = 0;
        *(_DWORD *)(a1 + 16) |= 1u;
      }
      *(_DWORD *)(a1 + 28) = result;
    }
  }
  return result;
}

uint64_t bt_iterate_individual(atomic_ullong *a1, uint64_t a2, int a3, void *__src, size_t __n, _OWORD *a6, uint64_t (*a7)(void, void, void, void, uint64_t, __n128), uint64_t a8, void *a9, void *a10)
{
  unsigned int v10 = __n;
  unint64_t v12 = a1[50];
  unint64_t v13 = v12 >> 27;
  uint64_t v14 = (v12 >> 27) & 0x1F000;
  unsigned int v15 = (v12 >> 9) & 0x3FFF;
  if (v15)
  {
    unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v44 = v16;
    long long v45 = v16;
    long long v42 = v16;
    long long v43 = v16;
    unsigned int v17 = __n;
    if (v15 == __n) {
      goto LABEL_3;
    }
    return 34;
  }
  unsigned int v17 = (unsigned __int16)(((unsigned __int16)(v14 - 160) >> 2) - 72);
  unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v44 = v31;
  long long v45 = v31;
  long long v42 = v31;
  long long v43 = v31;
  if ((v12 & 0x7FFE00) == 0 && v17 < __n) {
    return 34;
  }
LABEL_3:
  unsigned int v18 = a9;
  if (!a9)
  {
    int v19 = __src;
    uint64_t v20 = _apfs_calloc(1uLL, v17);
    __src = v19;
    unsigned int v18 = v20;
  }
  int v21 = a10;
  if (!a10)
  {
    unsigned int v22 = __src;
    unsigned int v23 = _apfs_calloc(1uLL, v13 & 0x1F000);
    __src = v22;
    int v21 = v23;
  }
  unsigned int v24 = 0;
  unsigned int v25 = 12;
  if (v18 && v21)
  {
    size_t v26 = v21;
    memcpy(v18, __src, v10);
    unsigned int v27 = a1;
    unsigned __int16 v28 = v26;
    __n128 v30 = bt_iterator_init_with_hint((uint64_t)&v42, v27, a2, a3, (unint64_t *)v18, v10, v17, v26, v14, a6);
    if (v29)
    {
LABEL_10:
      unsigned int v25 = v29;
      unsigned int v24 = 0;
    }
    else
    {
      while (1)
      {
        if (HIDWORD(v43) || (v43 & 1) != 0)
        {
          unsigned int v24 = 0;
          goto LABEL_23;
        }
        unsigned int v34 = a7(v44, v45, *((void *)&v44 + 1), DWORD1(v45), a8, v30);
        if (v34) {
          break;
        }
        unsigned int v29 = bt_iterator_next((uint64_t)&v42);
        if (v29) {
          goto LABEL_10;
        }
      }
      unsigned int v24 = v34;
LABEL_23:
      unsigned int v25 = 0;
    }
    int v21 = v28;
  }
  if (a9)
  {
    if (a10) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v35 = v17;
    int v36 = v21;
    _apfs_free(v18, v35);
    int v21 = v36;
    if (a10) {
      goto LABEL_27;
    }
  }
  _apfs_free(v21, v13 & 0x1F000);
LABEL_27:
  if (v25) {
    return v25;
  }
  else {
    return v24;
  }
}

uint64_t bt_iterate_bulk(atomic_ullong *a1, uint64_t a2, __int16 a3, unint64_t *a4, unsigned int a5, uint64_t *a6, uint64_t (*a7)(void, uint64_t, void, void, uint64_t), uint64_t a8)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  unint64_t v8 = a1[50];
  long long v49 = 0uLL;
  unsigned int v48 = 4;
  unsigned int v9 = (v8 >> 9) & 0x3FFF;
  if (v9) {
    BOOL v10 = v9 == a5;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    return 34;
  }
  unsigned __int16 v14 = a5;
  unint64_t v19 = v8 >> 27;
  uint64_t v20 = (v8 >> 27) & 0x1F000;
  if ((v8 & 0x7FFE00) == 0 && a5 > (unsigned __int16)(((unsigned __int16)(v20 - 160) >> 2) - 72)) {
    return 34;
  }
  uint64_t v22 = v19 & 0x1F000;
  unsigned int v23 = (char *)_apfs_calloc(1uLL, v19 & 0x1F000);
  if (!v23) {
    return 12;
  }
  *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v53[6] = v24;
  v53[7] = v24;
  v53[4] = v24;
  v53[5] = v24;
  v53[2] = v24;
  v53[3] = v24;
  v53[0] = v24;
  v53[1] = v24;
  v52[1] = v24;
  v52[2] = v24;
  v52[3] = v24;
  v52[4] = v24;
  v52[5] = v24;
  v52[6] = v24;
  v52[7] = v24;
  v51[0] = v24;
  v51[1] = v24;
  v51[2] = v24;
  v51[3] = v24;
  v52[0] = v24;
  uint64_t v50[2] = v24;
  v50[3] = v24;
  v50[0] = v24;
  v50[1] = v24;
  unsigned int v25 = a4;
  size_t v26 = v23;
  uint64_t v21 = bt_lookup_multiple(a1, a2, v25, v14, a3, a6, v23, v20, (int *)&v48, (uint64_t)v53, (uint64_t)v51, (uint64_t)v52, (uint64_t)v50);
  if (!v21)
  {
    unint64_t v46 = v26;
    if (a6) {
      long long v49 = *(_OWORD *)a6;
    }
    __int16 v42 = a3 & 0xFFF9 | 4;
    unsigned int v43 = v20;
    int v27 = 4;
    uint64_t v44 = a2;
    uint64_t v45 = v22;
    while (1)
    {
      int v47 = v48;
      if ((int)v48 >= 1) {
        break;
      }
LABEL_18:
      uint64_t v37 = v47 - 1;
      unsigned int v38 = (unint64_t *)*((void *)v53 + v37);
      unsigned int v39 = *((unsigned __int16 *)v51 + 2 * v37);
      unsigned int v48 = v27;
      uint64_t v40 = bt_lookup_multiple(a1, v44, v38, v39, v42, (uint64_t *)&v49, v46, v43, (int *)&v48, (uint64_t)v53, (uint64_t)v51, (uint64_t)v52, (uint64_t)v50);
      v27 <<= v27 < 16;
      uint64_t v22 = v45;
      if (v40)
      {
        uint64_t v21 = v40;
        size_t v26 = v46;
        if (v40 == 2) {
          uint64_t v21 = 0;
        }
        goto LABEL_23;
      }
    }
    unsigned __int16 v28 = (unsigned int *)v50;
    unsigned int v29 = v52;
    __n128 v30 = (unsigned int *)v51;
    long long v31 = v53;
    uint64_t v32 = v48;
    while (1)
    {
      unsigned int v34 = *v30++;
      uint64_t v33 = v34;
      unsigned int v35 = *v28++;
      uint64_t v36 = a7(*v31, v33, *v29, v35, a8);
      if (v36) {
        break;
      }
      ++v29;
      ++v31;
      if (!--v32) {
        goto LABEL_18;
      }
    }
    uint64_t v21 = v36;
    uint64_t v22 = v45;
    size_t v26 = v46;
  }
LABEL_23:
  _apfs_free(v26, v22);
  return v21;
}

uint64_t bt_lookup_multiple(atomic_ullong *a1, uint64_t a2, unint64_t *a3, unsigned int a4, __int16 a5, uint64_t *a6, char *a7, unsigned int a8, int *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v15 = *a9;
  unsigned int v34 = 0;
  unsigned __int16 v33 = -21846;
  uint64_t v16 = bt_iterate_lookup(a1, a2, a3, a4, a5, a6, &v34, &v33);
  unsigned int v17 = v34;
  if (!v16)
  {
    int v18 = 0;
    unsigned int v19 = v33;
    *a9 = 0;
    if (*(_DWORD *)(v17[7] + 36) <= v19 || v15 < 1)
    {
LABEL_17:
      if (v18) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = 34;
      }
    }
    else
    {
      while (1)
      {
        memset(__n, 170, 18);
        unsigned __int16 v31 = -21846;
        uint64_t v21 = btree_node_key_ptr((uint64_t)v17, (unsigned __int16)v19, (size_t *)((char *)&__n[1] + 2), __n);
        if (v21) {
          break;
        }
        uint64_t v21 = btree_node_val_ptr(v17, (unsigned __int16)v19, (size_t *)((char *)__n + 2), (__int16 *)&v31);
        if (v21) {
          break;
        }
        int v22 = v31;
        if (v31 == 65534) {
          size_t v23 = 0;
        }
        else {
          size_t v23 = v31;
        }
        int v24 = LOWORD(__n[0]);
        unsigned int v25 = v23 + LOWORD(__n[0]);
        BOOL v26 = a8 >= v25;
        a8 -= v25;
        if (!v26)
        {
          int v18 = *a9;
          goto LABEL_17;
        }
        memcpy(a7, *(const void **)((char *)&__n[1] + 2), LOWORD(__n[0]));
        uint64_t v27 = *a9;
        *(void *)(a10 + 8 * v27) = a7;
        *(_DWORD *)(a11 + 4 * v27) = v24;
        unsigned __int16 v28 = &a7[v24];
        memcpy(v28, *(const void **)((char *)__n + 2), v23);
        uint64_t v29 = *a9;
        *(void *)(a12 + 8 * v29) = v28;
        *(_DWORD *)(a13 + 4 * v29) = v22;
        LOWORD(v19) = v19 + 1;
        int v18 = *a9 + 1;
        *a9 = v18;
        if (*(_DWORD *)(v17[7] + 36) > (unsigned __int16)v19)
        {
          a7 = &v28[v23];
          if (v18 < v15) {
            continue;
          }
        }
        goto LABEL_17;
      }
      uint64_t v16 = v21;
    }
  }
  if (v17)
  {
    obj_unlock((uint64_t)v17, 1);
    obj_release(v17);
  }
  return v16;
}

uint64_t bt_iterate_per_node(atomic_ullong *a1, uint64_t a2, __int16 a3, unint64_t *a4, unsigned int a5, uint64_t *a6, uint64_t (*a7)(unint64_t, void, unint64_t, void, uint64_t), uint64_t a8)
{
  unsigned __int16 v11 = a5;
  unint64_t v16 = a1[50];
  unsigned int v17 = (v16 >> 9) & 0x3FFF;
  if (v17)
  {
    __int16 v42 = 0;
    unsigned __int16 v41 = -21846;
    unsigned int v18 = a5;
    if (v17 == a5) {
      goto LABEL_3;
    }
    return 34;
  }
  unsigned int v18 = ((unsigned __int16)((((v16 >> 27) & 0xF000) - 160) & 0xFFE0) >> 2) - 72;
  __int16 v42 = 0;
  unsigned __int16 v41 = -21846;
  if ((v16 & 0x7FFE00) == 0 && v18 < a5) {
    return 34;
  }
LABEL_3:
  uint64_t v19 = v18;
  uint64_t v20 = _apfs_calloc(1uLL, v18);
  if (!v20) {
    return 12;
  }
  uint64_t v21 = v20;
  unsigned int v22 = bt_iterate_lookup(a1, a2, a4, v11, a3, a6, &v42, &v41);
  if (!v22)
  {
    __int16 v28 = a3 & 0xFFF9 | 4;
    __int16 v36 = v28;
    while (1)
    {
      uint64_t v29 = (const void *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
      unsigned __int16 v38 = 0;
      unsigned __int16 v37 = -21846;
      __n128 v30 = v42;
      unsigned __int16 v31 = v41;
      if (*(_DWORD *)(v42[7] + 36) > v41) {
        break;
      }
      unsigned int v33 = 0;
LABEL_26:
      unsigned __int16 v41 = v31;
      if (v19 >= v33) {
        size_t v34 = v33;
      }
      else {
        size_t v34 = v19;
      }
      memcpy(v21, v29, v34);
      obj_unlock((uint64_t)v30, 1);
      obj_release(v30);
      __int16 v42 = 0;
      unsigned int v35 = bt_iterate_lookup(a1, a2, (unint64_t *)v21, v38, v28, 0, &v42, &v41);
      if (v35)
      {
        unsigned int v24 = 0;
        if (v35 == 2) {
          unsigned int v23 = 0;
        }
        else {
          unsigned int v23 = v35;
        }
        goto LABEL_6;
      }
    }
    while (1)
    {
      unsigned int v22 = btree_node_key_ptr((uint64_t)v30, v31, &v40, &v38);
      if (v22) {
        break;
      }
      unsigned int v22 = btree_node_val_ptr(v30, v31, &v39, (__int16 *)&v37);
      if (v22) {
        break;
      }
      uint64_t v29 = (const void *)v40;
      unsigned int v32 = a7(v40, v38, v39, v37, a8);
      if (v32)
      {
        unsigned int v24 = v32;
        unsigned int v23 = 0;
        goto LABEL_6;
      }
      if (*(_DWORD *)(v30[7] + 36) <= ++v31)
      {
        unsigned int v33 = v38;
        __int16 v28 = v36;
        goto LABEL_26;
      }
    }
  }
  unsigned int v23 = v22;
  unsigned int v24 = 0;
LABEL_6:
  unsigned int v25 = v42;
  if (v42)
  {
    obj_unlock((uint64_t)v42, 1);
    obj_release(v25);
  }
  _apfs_free(v21, v19);
  if (v23) {
    return v23;
  }
  else {
    return v24;
  }
}

uint64_t bt_iterate_lookup(atomic_ullong *a1, uint64_t a2, unint64_t *a3, unsigned int a4, __int16 a5, uint64_t *a6, atomic_ullong **a7, unsigned __int16 *a8)
{
  int v15 = a5 & 0x180;
  if ((a5 & 4) != 0)
  {
    unsigned int v17 = 4;
    goto LABEL_6;
  }
  if ((a5 & 2) == 0 || (uint64_t v16 = bt_lookup_internal(a1, a2, a3, a4, 1u, v15, 0, a6, a7, a8), v16 == 2))
  {
    unsigned int v17 = 3;
LABEL_6:
    uint64_t v16 = bt_lookup_internal(a1, a2, a3, a4, v17, v15, 0, a6, a7, a8);
  }
  if (a6 && !v16)
  {
    *a6 = obj_oid((uint64_t)*a7);
    a6[1] = (uint64_t)a1;
  }
  return v16;
}

uint64_t btree_create_extended(pthread_mutex_t **a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, uint64_t *a6, uint64_t a7, unint64_t *a8)
{
  unsigned __int16 v11 = a5;
  __int16 v12 = a4;
  unsigned int v13 = a3;
  uint64_t v31 = 0;
  unsigned int v15 = *((_DWORD *)a6 + 5);
  unsigned int v16 = a2 >> 30;
  int v17 = (v15 << 26) & 0x40000000 | ((v15 >> 3) << 31) | (((v15 >> 5) & 1) << 27) | a2;
  if ((v15 & 0x18) == 0) {
    int v17 = a2;
  }
  int v18 = v15 | (a2 >> 26) & 0x10;
  if ((a2 & 0x80000000) != 0) {
    v18 |= 8u;
  }
  int v19 = v18 | (a2 >> 22) & 0x20;
  if (v16) {
    int v20 = a2;
  }
  else {
    int v20 = v17;
  }
  if (v16) {
    unsigned int v21 = v19;
  }
  else {
    unsigned int v21 = *((_DWORD *)a6 + 5);
  }
  if (!a3) {
    unsigned int v13 = *(_DWORD *)(*(void *)(*(void *)(*a1)[6].__opaque + 376) + 36);
  }
  if (v13 - 65537 < 0xFFFF0060
    || a4 != 8 && (v21 & 1) != 0
    || a4 > (unsigned __int16)(((unsigned __int16)(v13 - 160) >> 2) - 72)
    || a5 + a4 > btree_entry_max_size(v21, v13, (unsigned __int16)a4, (unsigned __int16)a5)
    || v21 > 0x1FF)
  {
    return 22;
  }
  unint64_t v22 = ((unsigned __int16)(v12 & 0x3FFF) << 9) | ((unint64_t)v11 << 23) | v21 & 0x1FF | ((unint64_t)(v13 >> 12) << 39);
  uint64_t v23 = *a6;
  unint64_t v30 = v22;
  uint64_t v32 = v23;
  uint64_t v29 = 0x300086583;
  if ((v21 & 0x80) == 0)
  {
    __int16 v24 = 19;
    if ((v21 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (authapfs_valid_hash_type(*((_DWORD *)a6 + 6))) {
    return 22;
  }
  unsigned int v27 = *((_DWORD *)a6 + 6);
  if (v27 > 0xF) {
    return 22;
  }
  unsigned int v28 = *((_DWORD *)a6 + 7);
  unint64_t v30 = v22 & 0xFF800FFFFFFFFFFFLL | ((unint64_t)(v27 & 0xF) << 44) | ((unint64_t)(v28 & 0x7F) << 48);
  if (v28 > 0x7F) {
    return 22;
  }
  WORD2(v29) = 11;
  __int16 v24 = 27;
  if ((v21 & 0x100) != 0) {
LABEL_21:
  }
    WORD2(v29) = v24;
LABEL_22:
  uint64_t result = btree_node_create(a1, v20, *((_DWORD *)a6 + 4), (uint64_t)&v29, a7, a8);
  if (!result)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(*a8 + 392) + 32), 1uLL, memory_order_relaxed);
    uint64_t v26 = a6[1];
    if (v26) {
      *(void *)(*a8 + 424) = v26;
    }
    obj_unlock(*a8, 2);
    return 0;
  }
  return result;
}

uint64_t btree_node_create(pthread_mutex_t **a1, int a2, int a3, uint64_t a4, uint64_t a5, unint64_t *a6)
{
  long long v18 = btree_node_desc;
  DWORD2(v18) = (*(void *)(a4 + 8) >> 27) & 0x1F000;
  __int16 v10 = *(_WORD *)(a4 + 4);
  if (v10) {
    LODWORD(v18) = 2;
  }
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  DWORD1(v18) = a3;
  if ((v10 & 0x10) != 0) {
    int v11 = 536870916;
  }
  else {
    int v11 = 4;
  }
  int v12 = v11 | a2;
  unsigned int v13 = *a1;
  if (obj_type((uint64_t)a1) == 13) {
    uint64_t v14 = (uint64_t)a1;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = obj_create(v13, v12, 0, (int *)&v18, a4, v14, a5, &v19);
  if (!v15)
  {
    uint64_t v16 = v19;
    *a6 = v19;
    obj_dirty(v16, a5, 0);
  }
  return v15;
}

uint64_t btree_create(pthread_mutex_t **a1, unsigned int a2, int a3, int a4, unsigned int a5, unsigned int a6, int a7, uint64_t a8, uint64_t a9, unint64_t *a10)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v11[1] = 0;
  long long v14 = 0u;
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  v11[0] = a8;
  int v12 = a4;
  int v13 = a3;
  return btree_create_extended(a1, a2, a5, a6, a7, v11, a9, a10);
}

uint64_t btree_get_extended(uint64_t a1, unsigned int a2, unint64_t a3, unint64_t a4, int a5, uint64_t a6, unint64_t a7, uint64_t *a8)
{
  unint64_t v40 = a8;
  unint64_t v41 = a7;
  v43[1] = *MEMORY[0x263EF8340];
  unsigned int v14 = *(_DWORD *)(a6 + 28);
  if (v14 >= 0x40) {
    unsigned int v14 = 64;
  }
  size_t v15 = v14 + 32;
  MEMORY[0x270FA5388]();
  long long v17 = (char *)&v40 - v16;
  bzero((char *)&v40 - v16, v15);
  v43[0] = 0;
  long long v42 = btree_node_desc;
  unsigned int v18 = *(_DWORD *)(a6 + 20);
  unsigned int v19 = a2 >> 30;
  int v20 = (v18 << 26) & 0x40000000 | ((v18 >> 3) << 31) | (((v18 >> 5) & 1) << 27) | a2;
  if ((v18 & 0x18) == 0) {
    int v20 = a2;
  }
  int v21 = v18 | (a2 >> 26) & 0x10;
  if ((a2 & 0x80000000) != 0) {
    v21 |= 8u;
  }
  int v22 = v21 | (a2 >> 22) & 0x20;
  if (v19) {
    unsigned int v23 = a2;
  }
  else {
    unsigned int v23 = v20;
  }
  if (v19) {
    unsigned int v24 = v22;
  }
  else {
    unsigned int v24 = *(_DWORD *)(a6 + 20);
  }
  *(_WORD *)long long v17 = 25987;
  *((_WORD *)v17 + 1) = v15;
  if (v24 > 0x1FF) {
    return 22;
  }
  uint64_t v25 = *(void *)a1;
  *((void *)v17 + 1) = *((void *)v17 + 1) & 0xFFFFF07FFFFFFE00 | v24 & 0x1FF | ((unint64_t)((*(_DWORD *)(*(void *)(*(void *)(*(void *)a1 + 392) + 376) + 36) >> 12) & 0x1F) << 39);
  *((void *)v17 + 3) = *(void *)a6;
  *((_DWORD *)v17 + 1) = -267452416;
  if ((v24 & 0x80) == 0) {
    goto LABEL_15;
  }
  if (authapfs_valid_hash_type(*(_DWORD *)(a6 + 24))) {
    return 22;
  }
  unsigned int v32 = *(_DWORD *)(a6 + 24);
  if (v32 > 0xF) {
    return 22;
  }
  unint64_t v33 = *((void *)v17 + 1) & 0xFF800FFFFFFFFFFFLL | ((unint64_t)(v32 & 0xF) << 44);
  unsigned int v34 = *(_DWORD *)(a6 + 28);
  *((void *)v17 + 1) = v33 | ((unint64_t)(v34 & 0x7F) << 48);
  if (v34 > 0x7F) {
    return 22;
  }
  if (v34 >= 0x40) {
    size_t v35 = 64;
  }
  else {
    size_t v35 = v34;
  }
  memcpy(v17 + 32, (const void *)(a6 + 32), v35);
  uint64_t v25 = *(void *)a1;
LABEL_15:
  int v26 = *(_DWORD *)(a6 + 16);
  LODWORD(v42) = (v24 << 21) & 0x20000000 | v23 & 0xFFFF0000 | 2;
  DWORD1(v42) = v26;
  if ((v23 & 0x40000000) != 0) {
    int v27 = 3;
  }
  else {
    int v27 = 1;
  }
  unsigned int v28 = (2 * (a5 & 2)) & 0xDF | (32 * (((a5 & 4) >> 2) & 1)) | (a5 << 31 >> 31) & v27 | (v24 << 21) & 0x20000000 | v23;
  if (obj_type(a1) == 13) {
    uint64_t v29 = a1;
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t result = obj_get(v25, v28, a3, (int *)&v42, v17, v29, a4, v41, v43);
  if ((a5 & 4) == 0 || result)
  {
    uint64_t v31 = v43[0];
    if (result) {
      uint64_t v36 = 0;
    }
    else {
      uint64_t v36 = v43[0];
    }
    uint64_t *v40 = v36;
    if (!result) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v31 = v43[0];
    if ((*(unsigned char *)(v43[0] + 16) & 0x10) == 0)
    {
      uint64_t *v40 = v43[0];
LABEL_38:
      uint64_t v37 = *(void *)(a6 + 8);
      uint64_t result = 0;
      if (v37) {
        *(void *)(v31 + 424) = v37;
      }
      return result;
    }
    if (a5) {
      char v38 = 2;
    }
    else {
      char v38 = 1;
    }
    if ((a5 & 2) != 0) {
      char v39 = v38;
    }
    else {
      char v39 = 0;
    }
    btree_node_release(v43[0], v39);
    uint64_t *v40 = 0;
    return 2;
  }
  return result;
}

uint64_t btree_get(uint64_t a1, unsigned int a2, unint64_t a3, unint64_t a4, int a5, int a6, int a7, uint64_t a8, unint64_t a9, uint64_t *a10)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v11[1] = 0;
  long long v14 = 0u;
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  v11[0] = a8;
  int v12 = a7;
  int v13 = a5;
  return btree_get_extended(a1, a2, a3, a4, a6, (uint64_t)v11, a9, a10);
}

uint64_t btree_iterate_nodes(uint64_t a1, uint64_t a2, int a3, uint64_t (*a4)(void), uint64_t a5, unint64_t a6)
{
  unint64_t v143 = a6;
  uint64_t v144 = a5;
  v146 = a4;
  uint64_t v142 = a2;
  unint64_t v8 = &v165;
  uint64_t v173 = *MEMORY[0x263EF8340];
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v171 = v9;
  long long v172 = v9;
  long long v169 = v9;
  long long v170 = v9;
  long long v168 = v9;
  long long v166 = v9;
  long long v167 = v9;
  long long v165 = v9;
  MEMORY[0x270FA5388]();
  int v11 = (uint64_t *)((char *)&v124 - v10);
  bzero((char *)&v124 - v10, v12);
  int v140 = a3 & 0x180;
  int v13 = v140 != 0;
  if (a3) {
    char v14 = 2;
  }
  else {
    char v14 = 1;
  }
  obj_lock(a1, v14);
  uint64_t v15 = *(void *)(a1 + 56);
  if (!v15)
  {
    obj_unlock(a1, v14);
    return 22;
  }
  uint64_t v16 = *(unsigned __int16 *)(v15 + 34);
  uint64_t v17 = v16 + 1;
  uint64_t v138 = v16;
  if (v16 < 8)
  {
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v168 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v165 = 0u;
  }
  else
  {
    unint64_t v8 = (long long *)_apfs_calloc(v16 + 1, 0x10uLL);
    if (!v8)
    {
      obj_unlock(a1, v14);
      return 12;
    }
  }
  *(void *)unint64_t v8 = a1;
  *((_WORD *)v8 + 4) = 0;
  obj_retain((atomic_ullong *)a1);
  uint64_t v18 = 0;
  if (a3)
  {
    uint64_t v18 = obj_modify((void *)a1, 2, v143);
    if (!v18)
    {
      if ((*(unsigned char *)(a1 + 400) & 0x80) != 0) {
        obj_dirty(a1, v143, 0);
      }
      uint64_t v18 = 0;
    }
  }
  uint64_t v137 = v17;
  int v20 = a3 & 0x20;
  if (v146 && !(v18 | v20) && ((a3 & 0x10) == 0 || *(_WORD *)(*(void *)(a1 + 56) + 34))) {
    uint64_t v18 = ((uint64_t (*)(uint64_t, uint64_t))v146)(a1, v144);
  }
  if (!v18)
  {
    unsigned __int16 v26 = 0;
    unsigned int v128 = a3 & 0xFFFFFE4F;
    unsigned int v27 = a3 & 0xFFFFFE4D | 2;
    unsigned int v132 = a3 & 0xFFFFFE4C;
    if (v140) {
      unsigned int v27 = a3 & 0xFFFFFE4C;
    }
    BOOL v28 = v20 != 0;
    if (!v146) {
      BOOL v28 = 0;
    }
    BOOL v145 = v28;
    int v127 = v13 << 7;
    unsigned int v136 = (v13 << 7) | v27;
    unsigned int v130 = v27 | 0x100;
    if (v146) {
      BOOL v29 = v20 == 0;
    }
    else {
      BOOL v29 = 0;
    }
    BOOL v134 = v29;
    *(void *)&long long v19 = 136317186;
    long long v129 = v19;
    unsigned __int16 v131 = &v124;
    while (1)
    {
      unsigned __int16 v30 = v26;
      uint64_t v31 = (uint64_t *)&v8[v26];
      uint64_t v32 = *v31;
      uint64_t v33 = *(void *)(*v31 + 56);
      if ((*(_WORD *)(v33 + 32) & 2) != 0
        || (unsigned int v34 = &v8[v26],
            unsigned int v37 = *((unsigned __int16 *)v34 + 4),
            uint64_t v36 = (_WORD *)v34 + 4,
            unsigned int v35 = v37,
            *(_DWORD *)(v33 + 36) <= v37)
        || (a3 & 0x10) != 0 && *(_WORD *)(v33 + 34) == 1)
      {
        if (v145)
        {
          uint64_t v18 = v146();
          uint64_t v32 = *v31;
        }
        else
        {
          uint64_t v18 = 0;
        }
        btree_node_release(v32, v14);
        *uint64_t v31 = 0;
        unsigned __int16 v26 = v30 - 1;
        goto LABEL_45;
      }
      uint64_t *v11 = 0;
      uint64_t v38 = btree_node_child_val(v32, v35, v11);
      if (v38)
      {
        uint64_t v18 = v38;
        uint64_t v75 = *(void *)(a1 + 8);
        BOOL v76 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v75)
        {
          if (!v76) {
            goto LABEL_21;
          }
          int v77 = *(unsigned __int16 *)(*(void *)(*v31 + 56) + 34);
          uint64_t v78 = obj_oid(*v31);
          int v79 = (unsigned __int16)*v36;
          int buf = 136316674;
          v149 = "btree_iterate_nodes";
          __int16 v150 = 1024;
          int v151 = 6416;
          __int16 v152 = 2080;
          uint64_t v153 = v75 + 3832;
          __int16 v154 = 1024;
          int v155 = v77;
          __int16 v156 = 2048;
          uint64_t v157 = v78;
          __int16 v158 = 1024;
          int v159 = v79;
          __int16 v160 = 1024;
          *(_DWORD *)v161 = v18;
          long long v80 = &_os_log_internal;
          atomic_ullong v81 = "%s:%d: %s level %d node 0x%llx: error getting index %d child oid: %d\n";
        }
        else
        {
          if (!v76) {
            goto LABEL_21;
          }
          uint64_t v92 = *(void *)(*(void *)(*(void *)a1 + 392) + 384) + 208;
          int v93 = *(unsigned __int16 *)(*(void *)(*v31 + 56) + 34);
          uint64_t v94 = obj_oid(*v31);
          int v95 = (unsigned __int16)*v36;
          int buf = 136316674;
          v149 = "btree_iterate_nodes";
          __int16 v150 = 1024;
          int v151 = 6416;
          __int16 v152 = 2080;
          uint64_t v153 = v92;
          __int16 v154 = 1024;
          int v155 = v93;
          __int16 v156 = 2048;
          uint64_t v157 = v94;
          __int16 v158 = 1024;
          int v159 = v95;
          __int16 v160 = 1024;
          *(_DWORD *)v161 = v18;
          long long v80 = &_os_log_internal;
          atomic_ullong v81 = "%s:%d: %s level %d node 0x%llx: error getting index %d child oid: %d\n";
        }
        uint32_t v96 = 56;
        goto LABEL_116;
      }
      ++*v36;
      unsigned __int16 v26 = v30 + 1;
      if (v138 < (__int16)(v30 + 1))
      {
        uint64_t v82 = *(void *)(a1 + 8);
        BOOL v83 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v82)
        {
          if (v83) {
            btree_iterate_nodes_cold_2(v82, (__int16)v26, (uint64_t)v8);
          }
        }
        else if (v83)
        {
          btree_iterate_nodes_cold_1(a1, (__int16)v26, (uint64_t)v8);
        }
        uint64_t v18 = 22;
        goto LABEL_21;
      }
      char v39 = &v8[(__int16)v26];
      *((_WORD *)v39 + 4) = 0;
      uint64_t v139 = (__int16)v26 - 1;
      int v141 = (uint64_t *)&v8[v139];
      uint64_t v18 = btree_node_get((void *)a1, v11, v142, v136, *(_WORD *)(*(void *)(*v141 + 56) + 34) - 1, v143, (uint64_t *)v39);
      if (v18) {
        break;
      }
      if (v140) {
        goto LABEL_59;
      }
      if (a3) {
        goto LABEL_78;
      }
LABEL_80:
      if (v134) {
        uint64_t v18 = ((uint64_t (*)(void, uint64_t))v146)(*(void *)v39, v144);
      }
      else {
        uint64_t v18 = 0;
      }
LABEL_45:
      if (v18 || (v26 & 0x8000) != 0) {
        goto LABEL_21;
      }
    }
    uint64_t v40 = *(void *)(a1 + 8);
    BOOL v41 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v40)
    {
      if (!v41) {
        goto LABEL_58;
      }
      int v42 = *(unsigned __int16 *)(*(void *)(*v141 + 56) + 34);
      uint64_t v43 = obj_oid(*v141);
      uint64_t v44 = *v11;
      int v45 = WORD4(v8[v139]) - 1;
      int buf = v129;
      v149 = "btree_iterate_nodes";
      __int16 v150 = 1024;
      int v151 = 6438;
      __int16 v152 = 2080;
      uint64_t v153 = v40 + 3832;
      __int16 v154 = 1024;
      int v155 = v42;
      __int16 v156 = 2048;
      uint64_t v157 = v43;
      __int16 v158 = 1024;
      int v159 = v45;
      __int16 v160 = 2048;
      *(void *)v161 = v44;
      *(_WORD *)&v161[8] = 1024;
      int v162 = v136;
      __int16 v163 = 1024;
      int v164 = v18;
      unint64_t v46 = &_os_log_internal;
    }
    else
    {
      if (!v41) {
        goto LABEL_58;
      }
      uint64_t v66 = *(void *)(*(void *)(*(void *)a1 + 392) + 384) + 208;
      int v67 = *(unsigned __int16 *)(*(void *)(*v141 + 56) + 34);
      uint64_t v68 = obj_oid(*v141);
      uint64_t v69 = *v11;
      int v70 = WORD4(v8[v139]) - 1;
      int buf = v129;
      v149 = "btree_iterate_nodes";
      __int16 v150 = 1024;
      int v151 = 6438;
      __int16 v152 = 2080;
      uint64_t v153 = v66;
      __int16 v154 = 1024;
      int v155 = v67;
      __int16 v156 = 2048;
      uint64_t v157 = v68;
      __int16 v158 = 1024;
      int v159 = v70;
      __int16 v160 = 2048;
      *(void *)v161 = v69;
      *(_WORD *)&v161[8] = 1024;
      int v162 = v136;
      __int16 v163 = 1024;
      int v164 = v18;
      unint64_t v46 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_22CAAC000, v46, OS_LOG_TYPE_ERROR, "%s:%d: %s level %d node 0x%llx: error getting index %d child 0x%llx flags 0x%x: %d\n", (uint8_t *)&buf, 0x48u);
LABEL_58:
    if (!v140) {
      goto LABEL_110;
    }
LABEL_59:
    int v47 = &v8[v139];
    unsigned int v48 = *((unsigned __int16 *)v47 + 4);
    v135 = (unsigned __int16 *)v47 + 4;
    if (*(_DWORD *)(*(void *)(*v141 + 56) + 36) <= v48) {
      goto LABEL_67;
    }
    v133 = &v124;
    MEMORY[0x270FA5388]();
    unsigned __int16 v50 = (uint64_t *)((char *)&v124 - v49);
    bzero((char *)&v124 - v49, v51);
    unsigned int v52 = *v135;
    if (*(_DWORD *)(*(void *)(*v141 + 56) + 36) <= v52) {
      goto LABEL_67;
    }
    int v126 = btree_node_child_val(*v141, v52, v50);
    if (!v126)
    {
      int v126 = btree_node_get((void *)a1, v50, v142, v130, *(_WORD *)(*(void *)(*v141 + 56) + 34) - 1, v143, &v147);
      if (!v126) {
        goto LABEL_67;
      }
    }
    uint64_t v53 = *(void *)(a1 + 8);
    BOOL v54 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v53)
    {
      if (v54)
      {
        uint64_t v125 = v53 + 3832;
        int v55 = *(unsigned __int16 *)(*(void *)(*v141 + 56) + 34);
        uint64_t v56 = obj_oid(*v141);
        int v57 = *v135;
        uint64_t v58 = *v50;
        int buf = v129;
        v149 = "btree_iterate_nodes";
        __int16 v150 = 1024;
        int v151 = 6457;
        __int16 v152 = 2080;
        uint64_t v153 = v125;
        __int16 v154 = 1024;
        int v155 = v55;
        __int16 v156 = 2048;
        uint64_t v157 = v56;
        __int16 v158 = 1024;
        int v159 = v57;
        __int16 v160 = 2048;
        *(void *)v161 = v58;
        *(_WORD *)&v161[8] = 1024;
        int v162 = v130;
        __int16 v163 = 1024;
        int v164 = v126;
        v59 = &_os_log_internal;
LABEL_86:
        _os_log_error_impl(&dword_22CAAC000, v59, OS_LOG_TYPE_ERROR, "%s:%d: %s level %d node 0x%llx: error prefetching index %d child 0x%llx flags 0x%x: %d\n", (uint8_t *)&buf, 0x48u);
      }
    }
    else if (v54)
    {
      uint64_t v125 = *(void *)(*(void *)(*(void *)a1 + 392) + 384) + 208;
      int v71 = *(unsigned __int16 *)(*(void *)(*v141 + 56) + 34);
      uint64_t v72 = obj_oid(*v141);
      int v73 = *v135;
      uint64_t v74 = *v50;
      int buf = v129;
      v149 = "btree_iterate_nodes";
      __int16 v150 = 1024;
      int v151 = 6457;
      __int16 v152 = 2080;
      uint64_t v153 = v125;
      __int16 v154 = 1024;
      int v155 = v71;
      __int16 v156 = 2048;
      uint64_t v157 = v72;
      __int16 v158 = 1024;
      int v159 = v73;
      __int16 v160 = 2048;
      *(void *)v161 = v74;
      *(_WORD *)&v161[8] = 1024;
      int v162 = v130;
      __int16 v163 = 1024;
      int v164 = v126;
      v59 = &_os_log_internal;
      goto LABEL_86;
    }
LABEL_67:
    if (v18)
    {
      if (v18 != 45 && v18 != 16) {
        goto LABEL_110;
      }
      uint64_t v61 = btree_node_get((void *)a1, v11, v142, v132, *(_WORD *)(*(void *)(*v141 + 56) + 34) - 1, v143, (uint64_t *)&v8[(__int16)v26]);
      if (v61)
      {
        uint64_t v18 = v61;
        goto LABEL_110;
      }
    }
    else
    {
      uint64_t v62 = obj_async_wait(*(void *)v39);
      if (v62)
      {
        uint64_t v18 = v62;
        uint64_t v97 = *(void *)(a1 + 8);
        BOOL v98 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v97)
        {
          if (v98)
          {
            uint64_t v99 = v97 + 3832;
            int v100 = *(unsigned __int16 *)(*(void *)(*(void *)v39 + 56) + 34);
            uint64_t v101 = obj_oid(*v141);
            int v102 = *v135 - 1;
            uint64_t v103 = obj_oid(*(void *)v39);
            int buf = v129;
            v149 = "btree_iterate_nodes";
            __int16 v150 = 1024;
            int v151 = 6470;
            __int16 v152 = 2080;
            uint64_t v153 = v99;
            __int16 v154 = 1024;
            int v155 = v100;
            __int16 v156 = 2048;
            uint64_t v157 = v101;
            __int16 v158 = 1024;
            int v159 = v102;
            __int16 v160 = 2048;
            *(void *)v161 = v103;
            *(_WORD *)&v161[8] = 1024;
            int v162 = v136;
            __int16 v163 = 1024;
            int v164 = v18;
            uint64_t v104 = &_os_log_internal;
            goto LABEL_120;
          }
        }
        else if (v98)
        {
          uint64_t v119 = *(void *)(*(void *)(*(void *)a1 + 392) + 384) + 208;
          int v120 = *(unsigned __int16 *)(*(void *)(*(void *)v39 + 56) + 34);
          uint64_t v121 = obj_oid(*v141);
          int v122 = *v135 - 1;
          uint64_t v123 = obj_oid(*(void *)v39);
          int buf = v129;
          v149 = "btree_iterate_nodes";
          __int16 v150 = 1024;
          int v151 = 6470;
          __int16 v152 = 2080;
          uint64_t v153 = v119;
          __int16 v154 = 1024;
          int v155 = v120;
          __int16 v156 = 2048;
          uint64_t v157 = v121;
          __int16 v158 = 1024;
          int v159 = v122;
          __int16 v160 = 2048;
          *(void *)v161 = v123;
          *(_WORD *)&v161[8] = 1024;
          int v162 = v136;
          __int16 v163 = 1024;
          int v164 = v18;
          uint64_t v104 = &_os_log_internal;
LABEL_120:
          _os_log_error_impl(&dword_22CAAC000, v104, OS_LOG_TYPE_ERROR, "%s:%d: %s level %d node 0x%llx: error ON WAIT getting index %d child 0x%llx flags 0x%x: %d\n", (uint8_t *)&buf, 0x48u);
        }
        obj_release(*(uint64_t **)v39);
        goto LABEL_109;
      }
    }
    obj_lock(*(void *)v39, v14);
    if ((a3 & 1) == 0) {
      goto LABEL_80;
    }
    unsigned int v63 = *(void **)v39;
    unsigned int v64 = obj_type_and_flags(*(void *)v39);
    uint64_t v65 = obj_modify(v63, (v64 >> 29) & 2, v143);
    if (v65)
    {
      uint64_t v18 = v65;
      uint64_t v84 = *(void *)(a1 + 8);
      BOOL v85 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v84)
      {
        if (v85)
        {
          uint64_t v86 = v84 + 3832;
          int v87 = *(unsigned __int16 *)(*(void *)(*(void *)v39 + 56) + 34);
          uint64_t v88 = obj_oid(*v141);
          int v89 = *v135 - 1;
          uint64_t v90 = obj_oid(*(void *)v39);
          int buf = v129;
          v149 = "btree_iterate_nodes";
          __int16 v150 = 1024;
          int v151 = 6484;
          __int16 v152 = 2080;
          uint64_t v153 = v86;
          __int16 v154 = 1024;
          int v155 = v87;
          __int16 v156 = 2048;
          uint64_t v157 = v88;
          __int16 v158 = 1024;
          int v159 = v89;
          __int16 v160 = 2048;
          *(void *)v161 = v90;
          *(_WORD *)&v161[8] = 1024;
          int v162 = v136;
          __int16 v163 = 1024;
          int v164 = v18;
          int v91 = &_os_log_internal;
          goto LABEL_118;
        }
      }
      else if (v85)
      {
        uint64_t v114 = *(void *)(*(void *)(*(void *)a1 + 392) + 384) + 208;
        int v115 = *(unsigned __int16 *)(*(void *)(*(void *)v39 + 56) + 34);
        uint64_t v116 = obj_oid(*v141);
        int v117 = *v135 - 1;
        uint64_t v118 = obj_oid(*(void *)v39);
        int buf = v129;
        v149 = "btree_iterate_nodes";
        __int16 v150 = 1024;
        int v151 = 6484;
        __int16 v152 = 2080;
        uint64_t v153 = v114;
        __int16 v154 = 1024;
        int v155 = v115;
        __int16 v156 = 2048;
        uint64_t v157 = v116;
        __int16 v158 = 1024;
        int v159 = v117;
        __int16 v160 = 2048;
        *(void *)v161 = v118;
        *(_WORD *)&v161[8] = 1024;
        int v162 = v136;
        __int16 v163 = 1024;
        int v164 = v18;
        int v91 = &_os_log_internal;
LABEL_118:
        _os_log_error_impl(&dword_22CAAC000, v91, OS_LOG_TYPE_ERROR, "%s:%d: %s level %d node 0x%llx: error MODIFYING index %d child 0x%llx flags 0x%x: %d\n", (uint8_t *)&buf, 0x48u);
      }
      btree_node_release(*(void *)v39, 2);
LABEL_109:
      *(void *)char v39 = 0;
LABEL_110:
      uint64_t v105 = *(void *)(a1 + 8);
      BOOL v106 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v105)
      {
        if (!v106) {
          goto LABEL_21;
        }
        int v107 = *(unsigned __int16 *)(*(void *)(*v141 + 56) + 34);
        uint64_t v108 = obj_oid(*v141);
        int v109 = WORD4(v8[v139]) - 1;
        int buf = 136316930;
        v149 = "btree_iterate_nodes";
        __int16 v150 = 1024;
        int v151 = 6493;
        __int16 v152 = 2080;
        uint64_t v153 = v105 + 3832;
        __int16 v154 = 1024;
        int v155 = v107;
        __int16 v156 = 2048;
        uint64_t v157 = v108;
        __int16 v158 = 1024;
        int v159 = v109;
        __int16 v160 = 1024;
        *(_DWORD *)v161 = v128 | v127 | 2;
        *(_WORD *)&v161[4] = 1024;
        *(_DWORD *)&v161[6] = v18;
        long long v80 = &_os_log_internal;
        atomic_ullong v81 = "%s:%d: %s level %d node 0x%llx: error getting index %d child flags 0x%x: %d\n";
      }
      else
      {
        if (!v106) {
          goto LABEL_21;
        }
        uint64_t v110 = *(void *)(*(void *)(*(void *)a1 + 392) + 384) + 208;
        int v111 = *(unsigned __int16 *)(*(void *)(*v141 + 56) + 34);
        uint64_t v112 = obj_oid(*v141);
        int v113 = WORD4(v8[v139]) - 1;
        int buf = 136316930;
        v149 = "btree_iterate_nodes";
        __int16 v150 = 1024;
        int v151 = 6493;
        __int16 v152 = 2080;
        uint64_t v153 = v110;
        __int16 v154 = 1024;
        int v155 = v111;
        __int16 v156 = 2048;
        uint64_t v157 = v112;
        __int16 v158 = 1024;
        int v159 = v113;
        __int16 v160 = 1024;
        *(_DWORD *)v161 = v128 | v127 | 2;
        *(_WORD *)&v161[4] = 1024;
        *(_DWORD *)&v161[6] = v18;
        long long v80 = &_os_log_internal;
        atomic_ullong v81 = "%s:%d: %s level %d node 0x%llx: error getting index %d child flags 0x%x: %d\n";
      }
      uint32_t v96 = 62;
LABEL_116:
      _os_log_error_impl(&dword_22CAAC000, v80, OS_LOG_TYPE_ERROR, v81, (uint8_t *)&buf, v96);
      goto LABEL_21;
    }
LABEL_78:
    if (obj_oid(*(void *)v39) != *v11) {
      btree_node_child_id_update(*v141, (unsigned __int16)(WORD4(v8[v139]) - 1), (unint64_t *)(*(void *)v39 + 112), v143);
    }
    goto LABEL_80;
  }
LABEL_21:
  int v21 = v137;
  if ((((_WORD)v137 - 1) & 0x8000) == 0)
  {
    unsigned __int16 v22 = v137 - 1;
    do
    {
      uint64_t v23 = *(void *)&v8[v22];
      if (v23) {
        btree_node_release(v23, v14);
      }
      int v24 = (__int16)v22--;
    }
    while (v24 > 0);
  }
  if (v8 != &v165) {
    _apfs_free(v8, (16 * v21));
  }
  return v18;
}

uint64_t btree_level_count(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 22;
  }
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2) {
    return 22;
  }
  uint64_t result = 0;
  *a2 = *(unsigned __int16 *)(v2 + 34) + 1;
  return result;
}

uint64_t btree_node_checkpoint_traverse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v22[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  int v11 = (uint64_t *)((char *)v22 - v10);
  bzero((char *)v22 - v10, v12);
  if (a5 == 2)
  {
    if (obj_type(a1) == 13) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = 0;
    }
    *(void *)(a4 + 8) = v14;
    unsigned __int16 v15 = obj_subtype(a4);
    uint64_t v16 = tree_key_compare_function_for_type(v15);
    if (!v16) {
      return 22;
    }
    *(void *)(a4 + 416) = v16;
    if (a4 != a3) {
      *(_OWORD *)(a4 + 400) = *(_OWORD *)(a3 + 400);
    }
    uint64_t v13 = obj_checkpoint_known(a4);
    goto LABEL_11;
  }
  if (a5 == 1)
  {
    uint64_t v13 = obj_checkpoint_start(a4);
LABEL_11:
    uint64_t v17 = v13;
    goto LABEL_13;
  }
  uint64_t v17 = 0;
LABEL_13:
  if (!(*(_WORD *)(*(void *)(a4 + 56) + 32) & 2 | v17))
  {
    unsigned int v18 = 0;
    v22[0] = 0xAAAAAAAAAAAAAAAALL;
    while (v18 < *(_DWORD *)(*(void *)(a4 + 56) + 36))
    {
      void *v11 = 0;
      uint64_t v19 = btree_node_child_val(a4, (unsigned __int16)v18, v11);
      if (v19) {
        return v19;
      }
      uint64_t v19 = btree_node_get((void *)a3, v11, 0, 2, *(_WORD *)(*(void *)(a4 + 56) + 34) - 1, 0, v22);
      if (v19) {
        return v19;
      }
      int v20 = (uint64_t *)v22[0];
      uint64_t v17 = btree_node_checkpoint_traverse(a1, a2, a3, v22[0], a5);
      obj_unlock((uint64_t)v20, 1);
      obj_release(v20);
      ++v18;
      if (v17) {
        return v17;
      }
    }
    return 0;
  }
  return v17;
}

uint64_t btree_checkpoint_traverse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return btree_node_checkpoint_traverse(a1, a2, a3, a3, a4);
}

uint64_t btree_node_copy(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  unsigned __int16 v15 = (void *)((char *)&v41 - v14);
  bzero((char *)&v41 - v14, v16);
  uint64_t v47 = 0;
  memset(v46, 0, sizeof(v46));
  unsigned int v17 = (a3 >> 26) & 0x10 | a4;
  if ((int)a3 < 0) {
    v17 |= 8u;
  }
  LODWORD(v46[0]) = 2123139;
  *(_OWORD *)((char *)v46 + 8) = *(_OWORD *)(a2 + 400);
  unsigned int v43 = v17 | (a3 >> 22) & 0x20;
  uint64_t v18 = *(void *)(a2 + 416);
  *((void *)&v46[0] + 1) = *((void *)&v46[0] + 1) & 0xFFFFFFFFFFFFFE00 | BYTE8(v46[0]) & 0x47 | v17 & 0x1B8 | (a3 >> 22) & 0x20;
  *((void *)&v46[1] + 1) = v18;
  uint64_t v19 = *(void *)(a2 + 56);
  WORD2(v46[0]) = *(_WORD *)(v19 + 32) & 0x1B;
  WORD3(v46[0]) = *(_WORD *)(v19 + 34);
  uint64_t v20 = *(void *)(a2 + 8);
  if (!v20) {
    uint64_t v20 = *(void *)(*(void *)a2 + 392);
  }
  unsigned __int16 v44 = -21846;
  uint64_t v21 = obj_subtype(a2);
  uint64_t v22 = btree_node_create(v20, a3, v21, v46, a5, a7);
  uint64_t inserted = v22;
  if (!a6 || *(_WORD *)(*(void *)(a2 + 56) + 32) & 2 | v22)
  {
    if (!v22)
    {
      uint64_t v25 = (void *)(*(void *)(*a7 + 56) + 32);
      unsigned __int16 v26 = (const void *)(*(void *)(a2 + 56) + 32);
      unsigned int v27 = obj_size_phys(a2);
      memcpy(v25, v26, v27 - 32);
      uint64_t v28 = *a7;
      if (*(_WORD *)(*(void *)(a2 + 56) + 32))
      {
        BOOL v29 = *(int **)(v28 + 392);
        *BOOL v29 = WORD4(v46[0]) & 0x1FF;
        v29[1] = (*((void *)&v46[0] + 1) >> 27) & 0x1F000;
        v29[2] = (DWORD2(v46[0]) >> 9) & 0x3FFF;
        v29[3] = (unsigned __int16)(*((void *)&v46[0] + 1) >> 23);
      }
      btree_node_init_ext(v28, (uint64_t)v46);
      uint64_t inserted = 0;
      goto LABEL_31;
    }
    return inserted;
  }
  uint64_t v30 = a6;
  int v42 = a7;
  unsigned int v31 = 0;
  uint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
  int v45 = (const void *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v23 = 136315906;
  long long v41 = v23;
  while (1)
  {
    if (v31 >= *(_DWORD *)(*(void *)(a2 + 56) + 36))
    {
      uint64_t inserted = 0;
      goto LABEL_30;
    }
    *unsigned __int16 v15 = 0;
    uint64_t v32 = btree_node_child_val(a2, (unsigned __int16)v31, v15);
    if (v32
      || (uint64_t v32 = btree_node_get(a1, v15, 0, 2, *(_WORD *)(*(void *)(a2 + 56) + 34) - 1, 0, &v48), v32))
    {
      uint64_t inserted = v32;
      goto LABEL_30;
    }
    uint64_t v33 = v48;
    uint64_t v34 = btree_node_copy(a1, v48, a3, v43, a5, v30, &v47);
    if (v34) {
      break;
    }
    uint64_t v35 = v30;
    uint64_t inserted = btree_node_key_ptr(a2, (unsigned __int16)v31, &v45, &v44);
    if (!inserted)
    {
      *unsigned __int16 v15 = *(void *)(v47 + 112);
      uint64_t inserted = btree_node_insert_internal(*v42, (unsigned __int16)v31, v45, v44, v15, (*(_WORD *)(*v42 + 406) & 0x7Fu) + 8, a5);
      if (!inserted) {
        goto LABEL_22;
      }
    }
    uint64_t v36 = a1[1];
    BOOL v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v36)
    {
      if (v37)
      {
        *(_DWORD *)int buf = v41;
        unsigned __int16 v50 = "btree_node_copy";
        __int16 v51 = 1024;
        int v52 = 6675;
        __int16 v53 = 2080;
        uint64_t v54 = v36 + 3832;
        __int16 v55 = 1024;
        int v56 = inserted;
        uint64_t v38 = &_os_log_internal;
LABEL_25:
        _os_log_error_impl(&dword_22CAAC000, v38, OS_LOG_TYPE_ERROR, "%s:%d: %s btree_node_insert_internal failed: %d\n", buf, 0x22u);
      }
    }
    else if (v37)
    {
      uint64_t v39 = *(void *)(*(void *)(*a1 + 392) + 384) + 208;
      *(_DWORD *)int buf = v41;
      unsigned __int16 v50 = "btree_node_copy";
      __int16 v51 = 1024;
      int v52 = 6675;
      __int16 v53 = 2080;
      uint64_t v54 = v39;
      __int16 v55 = 1024;
      int v56 = inserted;
      uint64_t v38 = &_os_log_internal;
      goto LABEL_25;
    }
LABEL_22:
    uint64_t v30 = v35;
    obj_release(v47);
    obj_unlock(v33, 1);
    obj_release(v33);
    uint64_t v47 = 0;
    ++v31;
    if (inserted) {
      goto LABEL_30;
    }
  }
  uint64_t inserted = v34;
  obj_unlock(v33, 1);
  obj_release(v33);
  if (v47) {
    obj_release(v47);
  }
LABEL_30:
  a7 = v42;
  obj_dirty(*v42, a5, 0);
LABEL_31:
  obj_unlock(*a7, 2);
  return inserted;
}

uint64_t btree_copy(void *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t *a5)
{
  *a5 = 0;
  if ((a3 & 0x18) != 0) {
    uint64_t v9 = (a3 << 26) & 0x40000000 | ((a3 >> 3) << 31) | (((a3 >> 5) & 1) << 27) | a2;
  }
  else {
    uint64_t v9 = a2;
  }
  obj_lock((uint64_t)a1, 1);
  uint64_t v10 = btree_node_copy(a1, (uint64_t)a1, v9, a3, a4, 1, a5);
  if (v10)
  {
    uint64_t v11 = *a5;
    if (*a5)
    {
      unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
      btree_delete(v11, a4, &v16);
      obj_release((uint64_t *)*a5);
      *a5 = 0;
    }
  }
  else
  {
    uint64_t v12 = a1[49];
    uint64_t v13 = *(void *)(*a5 + 392);
    long long v14 = *(_OWORD *)(v12 + 16);
    *(void *)(v13 + 32) = *(void *)(v12 + 32);
    *(_OWORD *)(v13 + 16) = v14;
  }
  obj_unlock((uint64_t)a1, 1);
  return v10;
}

uint64_t btree_delete(uint64_t a1, uint64_t a2, void *a3)
{
  obj_lock(a1, 2);
  if ((*(unsigned char *)(a1 + 19) & 0x80) != 0 || (*(unsigned char *)(a1 + 400) & 0x80) != 0)
  {
    uint64_t v8 = btree_delete_node((void *)a1, a1, a2);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6) {
      uint64_t v7 = obj_oid(v6);
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v10 = *(void **)(*(void *)a1 + 392);
    int v11 = obj_type_and_flags(a1);
    int v12 = obj_size_phys(a1);
    uint64_t v13 = obj_oid(a1);
    if (a3) {
      uint64_t v14 = nx_reaper_add(v10, v11, v12, v7, v13, a2, 0, a3);
    }
    else {
      uint64_t v14 = nx_reaper_add_sub_object(v10, v11, v12, v7, v13, a2, 0);
    }
    uint64_t v8 = v14;
    if (v14)
    {
      uint64_t v15 = *(void *)(a1 + 8);
      BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v15)
      {
        if (v16) {
          btree_delete_cold_2(v15, a1);
        }
      }
      else if (v16)
      {
        btree_delete_cold_1(a1);
      }
    }
  }
  obj_unlock(a1, 2);
  return v8;
}

uint64_t btree_delete_node(void *a1, uint64_t a2, uint64_t a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  uint64_t v7 = (uint64_t *)((char *)v14 - v6);
  bzero((char *)v14 - v6, v8);
  if ((*(_WORD *)(*(void *)(a2 + 56) + 32) & 2) == 0)
  {
    unsigned int v9 = 0;
    v14[0] = 0xAAAAAAAAAAAAAAAALL;
    while (v9 < *(_DWORD *)(*(void *)(a2 + 56) + 36))
    {
      *uint64_t v7 = 0;
      uint64_t v10 = btree_node_child_val(a2, (unsigned __int16)v9, v7);
      if (v10
        || (uint64_t v10 = btree_node_get(a1, v7, 0, 0, *(_WORD *)(*(void *)(a2 + 56) + 34) - 1, 0, v14), v10))
      {
        uint64_t v12 = v10;
        goto LABEL_10;
      }
      uint64_t v11 = v14[0];
      obj_lock(v14[0], 2);
      uint64_t v12 = btree_delete_node(a1, v11, a3);
      obj_unlock(v11, 2);
      obj_release(v11);
      ++v9;
      if (v12) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_10:
  obj_delete_and_free(a2, a3);
  return v12;
}

uint64_t btree_node_count(uint64_t a1, void *a2)
{
  if (!a1) {
    return 22;
  }
  if (obj_type(a1) != 2) {
    return 22;
  }
  uint64_t result = 0;
  *a2 = *(void *)(*(void *)(a1 + 392) + 32);
  return result;
}

uint64_t btree_key_count(uint64_t a1, void *a2)
{
  if (!a1) {
    return 22;
  }
  if (obj_type(a1) != 2) {
    return 22;
  }
  uint64_t result = 0;
  *a2 = *(void *)(*(void *)(a1 + 392) + 24);
  return result;
}

uint64_t btree_node_init_ext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = btree_node_sanity_check((void *)a1, a2);
  if (!v5)
  {
    if (a2)
    {
      *(_OWORD *)(a1 + 400) = *(_OWORD *)(a2 + 8);
      *(void *)(a1 + 416) = *(void *)(a2 + 24);
    }
    uint64_t v6 = v4 + 56 + *(unsigned __int16 *)(v4 + 42);
    *(void *)(a1 + 376) = v4 + 56;
    *(void *)(a1 + 384) = v6;
    unsigned int v7 = obj_size_phys(a1);
    __int16 v8 = *(_WORD *)(v4 + 32);
    uint64_t v9 = -40;
    if ((v8 & 1) == 0) {
      uint64_t v9 = 0;
    }
    uint64_t v10 = v4 + v7 + v9;
    *(void *)(a1 + 392) = v10;
    if (v8)
    {
      unint64_t v11 = *(void *)(a1 + 400) & 0xFFFFFFFFFFFFFE00 | *(_DWORD *)v10 & 0x1FF;
      *(void *)(a1 + 400) = v11;
      unint64_t v12 = v11 & 0xFFFFF07FFFFFFFFFLL | ((unint64_t)((*(_DWORD *)(v10 + 4) >> 12) & 0x1F) << 39);
      *(void *)(a1 + 400) = v12;
      unint64_t v13 = v12 & 0xFFFFFFFFFF8001FFLL | ((*(_DWORD *)(v10 + 8) & 0x3FFFLL) << 9);
      *(void *)(a1 + 400) = v13;
      *(void *)(a1 + 400) = v13 & 0xFFFFFF80007FFFFFLL | ((unint64_t)*(unsigned __int16 *)(v10 + 12) << 23);
      *(void *)(a1 + 408) = obj_oid(a1);
    }
  }
  return v5;
}

uint64_t btree_node_free_space_total(uint64_t a1)
{
  v1 = *(_WORD **)(a1 + 56);
  if ((v1[16] & 4) != 0)
  {
    if ((*(unsigned char *)(a1 + 400) & 4) == 0)
    {
      __int16 v3 = 0;
      return (unsigned __int16)(v1[23] + v3 + v1[25] + v1[27]);
    }
    __int16 v2 = 4;
  }
  else
  {
    __int16 v2 = 8;
  }
  unsigned int v4 = (unsigned __int16)v1[21];
  __int16 v5 = btree_node_toc_required_capacity(a1, 0);
  __int16 v3 = v4 - v5 * v2;
  if (v4 < (unsigned __int16)(v5 * v2)) {
    __int16 v3 = 0;
  }
  return (unsigned __int16)(v1[23] + v3 + v1[25] + v1[27]);
}

uint64_t btree_node_space_free_list_search(uint64_t result, int a2, unsigned __int16 a3, __int16 *a4, unsigned __int16 *a5)
{
  if ((*(unsigned char *)(result + 400) & 0x40) != 0) {
    unsigned __int16 v5 = a3;
  }
  else {
    unsigned __int16 v5 = (a3 + 7) & 0xFFF8;
  }
  uint64_t v6 = 48;
  if (a2 != 1) {
    uint64_t v6 = 52;
  }
  uint64_t v7 = 392;
  if (a2 == 1) {
    uint64_t v7 = 384;
  }
  int v8 = *(unsigned __int16 *)(*(void *)(result + 56) + v6);
  unsigned __int16 v9 = -1;
  if (v8 == 0xFFFF)
  {
    __int16 v13 = -1;
    if (a4) {
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  uint64_t v11 = result;
  uint64_t v25 = a4;
  unsigned __int16 v26 = a5;
  uint64_t v12 = *(void *)(result + v7);
  __int16 v13 = -1;
  do
  {
    unsigned __int16 v9 = v8;
    uint64_t v14 = (unsigned __int16)v8;
    if (a2 == 1)
    {
      unsigned int v15 = *(unsigned __int16 *)(*(void *)(v11 + 56) + 44);
      BOOL v16 = v15 >= v9;
      unsigned int v17 = v15 - v9;
      if (v17 != 0 && v16)
      {
        if (v17 >= 4)
        {
          int v21 = *(unsigned __int16 *)(*(void *)(v11 + 384) + v14 + 2);
          if (v21 >= 4)
          {
            if ((*(unsigned char *)(v11 + 400) & 0x40) == 0) {
              int v21 = (v21 + 7) & 0x1FFF8;
            }
            if (v21 <= (int)v17) {
              goto LABEL_35;
            }
            int v20 = 1250;
          }
          else
          {
            int v20 = 1247;
          }
        }
        else
        {
          int v20 = 1243;
        }
      }
      else
      {
        int v20 = 1240;
      }
    }
    else
    {
      uint64_t result = obj_size_phys(v11);
      uint64_t v18 = *(void *)(v11 + 56);
      if (*(unsigned char *)(v18 + 32)) {
        __int16 v19 = -96;
      }
      else {
        __int16 v19 = -56;
      }
      if (v9 <= (unsigned __int16)(result
                                                - *(_WORD *)(v18 + 42)
                                                + v19
                                                - (*(_WORD *)(v18 + 46)
                                                 + *(_WORD *)(v18 + 44))))
      {
        if (v9 >= 4u)
        {
          unsigned int v22 = *(unsigned __int16 *)(*(void *)(v11 + 392) - v14 + 2);
          if (v22 >= 4)
          {
            if ((*(unsigned char *)(v11 + 400) & 0x40) == 0) {
              unsigned int v22 = (v22 + 7) & 0x1FFF8;
            }
            if (v22 <= v9) {
              goto LABEL_35;
            }
            int v20 = 1276;
          }
          else
          {
            int v20 = 1273;
          }
        }
        else
        {
          int v20 = 1269;
        }
      }
      else
      {
        int v20 = 1266;
      }
    }
    uint64_t result = nx_corruption_detected_int(*(void *)(*(void *)v11 + 392), (uint64_t)"btree_node_free_list_entry_validate", v20);
    if (result) {
      break;
    }
LABEL_35:
    if (a2 == 1) {
      uint64_t v23 = v14;
    }
    else {
      uint64_t v23 = -v14;
    }
    int v24 = (unsigned __int16 *)(v12 + v23);
    if (v24[1] >= v5) {
      goto LABEL_41;
    }
    int v8 = *v24;
    __int16 v13 = v9;
  }
  while (v8 != 0xFFFF);
  unsigned __int16 v9 = -1;
  __int16 v13 = -1;
LABEL_41:
  a4 = v25;
  a5 = v26;
  if (v25) {
LABEL_42:
  }
    *a4 = v13;
LABEL_43:
  if (a5) {
    *a5 = v9;
  }
  return result;
}

uint64_t btree_node_compact(uint64_t a1, __int16 a2, uint64_t a3)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  int v56 = (void *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = *(void *)(a1 + 56);
  __int16 v7 = *(_WORD *)(v6 + 32);
  if (v7)
  {
    uint64_t v10 = btree_node_copy(0, a1, 2281701376, (16 * v7) & 0x180, a3, 0, (uint64_t *)&v56);
    if (v10) {
      return v10;
    }
    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)(v11 + 36) = 0;
    *(_WORD *)(v11 + 44) = 0;
    uint64_t v12 = *(void *)(a1 + 392) - *(void *)(a1 + 384);
    *(_WORD *)(v11 + 46) = v12;
    *(void *)(v11 + 48) = 0xFFFF0000FFFFLL;
    bzero(*(void **)(a1 + 376), *(unsigned __int16 *)(v11 + 42) + (unint64_t)(unsigned __int16)v12);
    __int16 v13 = v56;
    uint64_t v14 = v56[7];
    goto LABEL_11;
  }
  long long v50 = btree_node_desc;
  int v51 = 2123139;
  long long v54 = *(_OWORD *)(a1 + 400);
  uint64_t v55 = *(void *)(a1 + 416);
  __int16 v52 = v7;
  __int16 v53 = *(_WORD *)(v6 + 34);
  int v8 = *(_DWORD *)(a1 + 40);
  LODWORD(v50) = *(unsigned __int16 *)(a1 + 36);
  DWORD1(v50) = v8;
  DWORD2(v50) = (*(void *)(a1 + 400) >> 27) & 0x1F000;
  uint64_t v9 = obj_create(*(void *)a1, -2013265920, 0, (int)&v50, (int)&v51, *(void *)(a1 + 8), a3, (uint64_t)&v56);
  if (!v9)
  {
    unsigned int v15 = v56;
    BOOL v16 = (_OWORD *)v56[7];
    unsigned int v17 = *(_OWORD **)(a1 + 56);
    long long v18 = v17[1];
    *BOOL v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = obj_exchange_phys((uint64_t *)a1, (uint64_t)v15);
    if (v19)
    {
      uint64_t v10 = v19;
      uint64_t v20 = *(void *)(a1 + 8);
      BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v20)
      {
        if (v21)
        {
          uint64_t v22 = v20 + 3832;
          uint64_t v23 = obj_oid(a1);
          uint64_t v24 = obj_oid((uint64_t)v56);
          *(_DWORD *)int buf = 136316674;
          uint64_t v58 = "btree_node_compact";
          __int16 v59 = 1024;
          int v60 = 1569;
          __int16 v61 = 2080;
          uint64_t v62 = v22;
          __int16 v63 = 2048;
          uint64_t v64 = v23;
          __int16 v65 = 2048;
          uint64_t v66 = v24;
          __int16 v67 = 2048;
          uint64_t v68 = a3;
          __int16 v69 = 1024;
          int v70 = v10;
          uint64_t v25 = &_os_log_internal;
LABEL_39:
          _os_log_error_impl(&dword_22CAAC000, v25, OS_LOG_TYPE_ERROR, "%s:%d: %s obj_exchange_phys (%llx, %llx) with xid %llu failed: %d\n", buf, 0x40u);
        }
      }
      else if (v21)
      {
        uint64_t v47 = *(void *)(*(void *)(*(void *)a1 + 392) + 384) + 208;
        uint64_t v48 = obj_oid(a1);
        uint64_t v49 = obj_oid((uint64_t)v56);
        *(_DWORD *)int buf = 136316674;
        uint64_t v58 = "btree_node_compact";
        __int16 v59 = 1024;
        int v60 = 1569;
        __int16 v61 = 2080;
        uint64_t v62 = v47;
        __int16 v63 = 2048;
        uint64_t v64 = v48;
        __int16 v65 = 2048;
        uint64_t v66 = v49;
        __int16 v67 = 2048;
        uint64_t v68 = a3;
        __int16 v69 = 1024;
        int v70 = v10;
        uint64_t v25 = &_os_log_internal;
        goto LABEL_39;
      }
LABEL_36:
      obj_free((uint64_t)v56);
      obj_release(v56);
      obj_dirty(a1, a3, 0);
      return v10;
    }
    btree_node_init_ext(a1, (uint64_t)&v51);
    btree_node_init_ext((uint64_t)v56, (uint64_t)&v51);
    __int16 v13 = v56;
    uint64_t v14 = v56[7];
    *(_WORD *)(*(void *)(a1 + 56) + 32) |= *(_WORD *)(v14 + 32) & 0x8000;
LABEL_11:
    int v26 = btree_node_toc_required_capacity((uint64_t)v13, a2);
    char v27 = 2;
    if ((*(_WORD *)(v14 + 32) & 4) == 0) {
      char v27 = 3;
    }
    btree_node_toc_resize(a1, (v26 << v27) & 0xFFFC);
    uint64_t v28 = v56;
    uint64_t v29 = v56[7];
    if (*(_DWORD *)(v29 + 36))
    {
      unsigned __int16 v30 = 0;
      while (1)
      {
        __int16 v31 = *(_WORD *)(v29 + 32);
        uint64_t v32 = v28[47];
        uint64_t v33 = v30;
        uint64_t v34 = (unsigned __int16 *)(v32 + 4 * v30);
        uint64_t v35 = (unsigned __int16 *)(v32 + 8 * v30);
        if ((v31 & 4) != 0)
        {
          uint64_t v35 = v34;
          int v36 = (*((_DWORD *)v28 + 100) >> 9) & 0x3FFF;
        }
        else
        {
          int v36 = *(unsigned __int16 *)(v32 + 8 * v33 + 2);
        }
        uint64_t v37 = *v35;
        uint64_t v38 = (unsigned __int16 *)(v32 + 4 * v33 + 2);
        uint64_t v39 = v32 + 8 * v33 + 4;
        if ((v31 & 4) == 0) {
          uint64_t v38 = (unsigned __int16 *)v39;
        }
        uint64_t v40 = *v38;
        unsigned int v41 = btree_node_val_len((uint64_t)v28, v33);
        if (v37 == 0xFFFF)
        {
          unsigned int v43 = 0;
        }
        else
        {
          uint64_t inserted = btree_node_key_range_validate((uint64_t)v28, v37, v36);
          if (inserted) {
            break;
          }
          uint64_t v28 = v56;
          unsigned int v43 = (const void *)(v56[48] + v37);
        }
        if (v40 > 0xFFFD)
        {
          unsigned __int16 v44 = 0;
        }
        else
        {
          uint64_t inserted = btree_node_val_range_validate((uint64_t)v28, v40, v41);
          if (inserted) {
            break;
          }
          unsigned __int16 v44 = (const void *)(v56[49] - v40);
        }
        uint64_t inserted = btree_node_insert_internal(a1, v33, v43, v36, v44, v41, a3);
        if (inserted) {
          break;
        }
        unsigned __int16 v30 = v33 + 1;
        uint64_t v28 = v56;
        uint64_t v29 = v56[7];
        if (*(_DWORD *)(v29 + 36) <= (unsigned __int16)(v33 + 1)) {
          goto LABEL_30;
        }
      }
      uint64_t v10 = inserted;
      if (v7)
      {
        memcpy((void *)(*(void *)(a1 + 56) + 32), (const void *)(v56[7] + 32), v56[49] - v56[7] - 32);
        int v45 = (void *)a1;
      }
      else
      {
        obj_exchange_phys((uint64_t *)a1, (uint64_t)v56);
        btree_node_init_ext(a1, 0);
        int v45 = v56;
      }
      btree_node_init_ext((uint64_t)v45, 0);
    }
    else
    {
LABEL_30:
      uint64_t v10 = 0;
    }
    goto LABEL_36;
  }
  return v9;
}

uint64_t btree_node_space_free_list_alloc(uint64_t a1, int a2, unsigned __int16 a3, int a4, int a5)
{
  if (a5 == 0xFFFF) {
    return 22;
  }
  if ((*(void *)(a1 + 400) & 0x40) != 0) {
    unsigned __int16 v5 = a3;
  }
  else {
    unsigned __int16 v5 = (a3 + 7) & 0xFFF8;
  }
  uint64_t v6 = *(void *)(a1 + 56);
  __int16 v7 = (_WORD *)(v6 + 48);
  uint64_t v8 = 48;
  if (a2 != 1)
  {
    uint64_t v8 = 52;
    __int16 v7 = (_WORD *)(v6 + 52);
  }
  uint64_t v9 = 392;
  if (a2 == 1)
  {
    uint64_t v9 = 384;
    int v10 = 1;
  }
  else
  {
    int v10 = -1;
  }
  uint64_t v11 = *(void *)(a1 + v9);
  v7[1] -= v5;
  if (a4 != 0xFFFF || (uint64_t result = 0, *(unsigned __int16 *)(v6 + v8) == a5))
  {
    int v13 = v5;
    int v14 = v10;
    unsigned int v15 = (_WORD *)(v11 + a5 * (uint64_t)v10);
    unsigned __int16 v16 = v15[1] - v13;
    if (v16 < 5u)
    {
      long long v18 = (_WORD *)(v11 + v10 * (uint64_t)a4);
      if (a4 != 0xFFFF) {
        __int16 v7 = v18;
      }
    }
    else
    {
      if (a4 != 0xFFFF) {
        __int16 v7 = (_WORD *)(v11 + v10 * (uint64_t)a4);
      }
      int v17 = v10 * v13 + a5;
      *__int16 v7 = v17;
      __int16 v7 = (_WORD *)(v11 + v14 * (uint64_t)v17);
      v7[1] = v16;
    }
    uint64_t result = 0;
    *__int16 v7 = *v15;
  }
  return result;
}

uint64_t btree_node_space_alloc(uint64_t a1, int a2, unsigned __int16 a3, _WORD *a4)
{
  unsigned __int16 v14 = -1;
  unsigned __int16 v13 = -1;
  btree_node_space_free_list_search(a1, a2, a3, (__int16 *)&v13, &v14);
  if (v14 == 0xFFFF)
  {
    if ((*(unsigned char *)(a1 + 400) & 0x40) != 0) {
      unsigned __int16 v10 = a3;
    }
    else {
      unsigned __int16 v10 = (a3 + 7) & 0xFFF8;
    }
    uint64_t v11 = *(void *)(a1 + 56);
    unsigned int v12 = *(unsigned __int16 *)(v11 + 46);
    if (v12 < v10) {
      return 28;
    }
    if (a2 == 1)
    {
      LOWORD(v9) = *(_WORD *)(v11 + 44);
      *(_WORD *)(v11 + 44) = v9 + v10;
      *(_WORD *)(v11 + 46) = v12 - v10;
    }
    else
    {
      *(_WORD *)(v11 + 46) = v12 - v10;
      if (a2 == 2) {
        int v9 = *(_DWORD *)(a1 + 392)
      }
           - *(unsigned __int16 *)(v11 + 44)
           - (*(_DWORD *)(a1 + 384)
            + (unsigned __int16)(v12 - v10));
      else {
        LOWORD(v9) = -1;
      }
    }
  }
  else
  {
    uint64_t result = btree_node_space_free_list_alloc(a1, a2, a3, v13, v14);
    if (result) {
      return result;
    }
    LOWORD(v9) = v14;
  }
  uint64_t result = 0;
  *a4 = v9;
  return result;
}

void btree_node_toc_resize(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 56);
  unsigned int v4 = *(unsigned __int16 *)(v3 + 42);
  unsigned __int16 v5 = v4 - a2;
  if (v4 >= a2)
  {
    if (v4 <= a2) {
      return;
    }
    memmove((void *)(*(void *)(a1 + 384) - v5), *(const void **)(a1 + 384), *(unsigned __int16 *)(v3 + 44));
    *(void *)(a1 + 384) -= v5;
    uint64_t v7 = *(void *)(a1 + 56);
    *(_WORD *)(v7 + 46) += v5;
    __int16 v8 = *(_WORD *)(v7 + 42) - v5;
  }
  else
  {
    unsigned __int16 v6 = a2 - v4;
    memmove((void *)(*(void *)(a1 + 384) + (unsigned __int16)(a2 - v4)), *(const void **)(a1 + 384), *(unsigned __int16 *)(v3 + 44));
    bzero(*(void **)(a1 + 384), v6);
    *(void *)(a1 + 384) += v6;
    uint64_t v7 = *(void *)(a1 + 56);
    *(_WORD *)(v7 + 46) -= v6;
    __int16 v8 = *(_WORD *)(v7 + 42) + v6;
  }
  *(_WORD *)(v7 + 42) = v8;
}

void *btree_node_toc_shift(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 56);
  __int16 v4 = *(_WORD *)(v3 + 32);
  if ((v4 & 4) != 0) {
    char v5 = 2;
  }
  else {
    char v5 = 3;
  }
  unsigned int v6 = (a2 + (unsigned __int16)a3) << v5;
  int v7 = a2 + (__int16)-(__int16)a3;
  if ((v4 & 4) != 0) {
    char v8 = 2;
  }
  else {
    char v8 = 3;
  }
  uint64_t v9 = v7 << v8;
  if (a3 >= 0) {
    int v7 = a2;
  }
  else {
    unsigned int v6 = a2 << v8;
  }
  if (a3 >= 0)
  {
    char v8 = v5;
    uint64_t v9 = (a2 << v5);
  }
  return memmove((void *)(*(void *)(a1 + 376) + v6), (const void *)(*(void *)(a1 + 376) + v9), ((*(_DWORD *)(v3 + 36) - v7) << v8) & 0xFFFC);
}

uint64_t btree_node_child_id_update_cb(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, int a8)
{
  if (a8 != 8) {
    return 22;
  }
  uint64_t result = 0;
  *a5 = *a7;
  return result;
}

uint64_t bt_move_entries(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 0) {
    LOWORD(v7) = a3;
  }
  else {
    int v7 = -a3;
  }
  int v8 = (__int16)v7;
  if (a3 >= 0) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = a2;
  }
  if (a3 >= 0) {
    uint64_t v10 = a2;
  }
  else {
    uint64_t v10 = a1;
  }
  uint64_t v11 = *(_WORD **)(v10 + 56);
  if ((v11[16] & 4) != 0)
  {
    if ((*(unsigned char *)(v10 + 400) & 4) == 0) {
      goto LABEL_19;
    }
    __int16 v12 = 4;
  }
  else
  {
    __int16 v12 = 8;
  }
  unsigned __int16 v13 = btree_node_toc_required_capacity(v10, (__int16)v7) * v12;
  unsigned int v14 = (unsigned __int16)v11[21];
  if (v14 >= v13) {
    goto LABEL_19;
  }
  if (v13 - v14 <= (unsigned __int16)v11[23])
  {
    btree_node_toc_resize(v10, v13);
    goto LABEL_19;
  }
  uint64_t v15 = btree_node_compact(v10, v8, a4);
  if (!v15)
  {
LABEL_19:
    memset(__n, 170, sizeof(__n));
    unsigned __int16 v58 = -21846;
    if (v9 == a2)
    {
      if (v8 < 1)
      {
        __int16 v37 = 0;
        int v38 = 0;
LABEL_60:
        uint64_t v15 = 0;
      }
      else
      {
        uint64_t v36 = btree_node_key_ptr(a2, 0, &__n[10], __n);
        if (v36)
        {
          uint64_t v15 = v36;
          __int16 v37 = 0;
          int v38 = 0;
        }
        else
        {
          int v38 = 0;
          do
          {
            uint64_t inserted = btree_node_val_ptr((void *)a2, (unsigned __int16)v38, &__n[2], (__int16 *)&v58);
            if (inserted) {
              break;
            }
            uint64_t inserted = btree_node_insert_internal(a1, *(unsigned __int16 *)(*(void *)(a1 + 56) + 36), *(const void **)&__n[10], *(unsigned __int16 *)__n, *(const void **)&__n[2], v58, a4);
            if (inserted) {
              break;
            }
            uint64_t v40 = *(_WORD **)(a2 + 56);
            uint64_t v41 = *(void *)(a2 + 376);
            if ((*(unsigned char *)(a2 + 400) & 0x40) != 0) {
              __int16 v42 = *(_WORD *)__n;
            }
            else {
              __int16 v42 = (*(_WORD *)__n + 7) & 0xFFF8;
            }
            unsigned __int16 v43 = (v42 + 7) & 0xFFF8;
            if ((*(unsigned char *)(a2 + 400) & 0x40) != 0) {
              unsigned __int16 v43 = *(_WORD *)__n;
            }
            if (v43 >= 4u)
            {
              if ((v40[16] & 4) != 0) {
                unsigned __int16 v44 = (unsigned __int16 *)(v41 + 4 * (unsigned __int16)v38);
              }
              else {
                unsigned __int16 v44 = (unsigned __int16 *)(v41 + 8 * (unsigned __int16)v38);
              }
              uint64_t v45 = *v44;
              unint64_t v46 = (_WORD *)(*(void *)(a2 + 384) + v45);
              v46[1] = v43;
              *unint64_t v46 = v40[24];
              v40[24] = v45;
            }
            v40[25] += v43;
            unsigned __int16 v47 = v58;
            if (v58 && v58 != 65534)
            {
              if ((*(unsigned char *)(a2 + 400) & 0x40) != 0) {
                unsigned __int16 v48 = v58;
              }
              else {
                unsigned __int16 v48 = (v58 + 7) & 0xFFF8;
              }
              unsigned __int16 v49 = (v48 + 7) & 0xFFF8;
              if ((*(unsigned char *)(a2 + 400) & 0x40) == 0) {
                unsigned __int16 v47 = v49;
              }
              if (v47 >= 4u)
              {
                uint64_t v50 = v41 + 8 * (unsigned __int16)v38 + 4;
                int v51 = (unsigned __int16 *)(v41 + 4 * (unsigned __int16)v38 + 2);
                if ((v40[16] & 4) == 0) {
                  int v51 = (unsigned __int16 *)v50;
                }
                uint64_t v52 = *v51;
                __int16 v53 = (_WORD *)(*(void *)(a2 + 392) - v52);
                v53[1] = v47;
                *__int16 v53 = v40[26];
                v40[26] = v52;
              }
              v40[27] += v47;
            }
            __int16 v37 = ++v38;
            if ((__int16)v38 >= v8) {
              goto LABEL_60;
            }
            uint64_t inserted = btree_node_key_ptr(a2, (unsigned __int16)v38, &__n[10], __n);
          }
          while (!inserted);
          uint64_t v15 = inserted;
          __int16 v37 = v38;
        }
      }
      btree_node_toc_shift(a2, 0, (__int16)-v37);
      *(_DWORD *)(*(void *)(a2 + 56) + 36) -= v38;
    }
    else if (v8 < 1)
    {
      uint64_t v15 = 0;
    }
    else
    {
      btree_node_toc_shift(a2, 0, v8);
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)(a2 + 56);
      *(_DWORD *)(v17 + 36) += (unsigned __int16)v8;
      *(_WORD *)(v17 + 32) |= 0x8000u;
      uint64_t v18 = *(void *)(a2 + 376);
      do
      {
        if ((*(_WORD *)(v17 + 32) & 4) != 0) {
          *(_DWORD *)(v18 + 4 * v16) = -1;
        }
        else {
          *(void *)(v18 + 8 * v16) = 0xFFFF0000FFFFLL;
        }
        ++v16;
      }
      while (v8 > (__int16)v16);
      LOWORD(v19) = 0;
      int v20 = *(_DWORD *)(*(void *)(a1 + 56) + 36);
      while (1)
      {
        uint64_t v21 = btree_node_key_ptr(a1, (unsigned __int16)(v20 - 1), &__n[10], __n);
        if (v21) {
          break;
        }
        uint64_t v21 = btree_node_val_ptr((void *)a1, (unsigned __int16)(*(_WORD *)(*(void *)(a1 + 56) + 36) - 1), &__n[2], (__int16 *)&v58);
        if (v21) {
          break;
        }
        uint64_t v21 = btree_node_entry_update(a2, (unsigned __int16)(v8 + ~(_WORD)v19), *(void **)&__n[10], *(unsigned __int16 *)__n, *(void **)&__n[2], v58, a4);
        if (v21) {
          break;
        }
        uint64_t v22 = *(void *)(a1 + 56);
        int v20 = *(_DWORD *)(v22 + 36) - 1;
        *(_DWORD *)(v22 + 36) = v20;
        uint64_t v23 = *(void *)(a1 + 376);
        if ((*(unsigned char *)(a1 + 400) & 0x40) != 0) {
          __int16 v24 = *(_WORD *)__n;
        }
        else {
          __int16 v24 = (*(_WORD *)__n + 7) & 0xFFF8;
        }
        unsigned __int16 v25 = (v24 + 7) & 0xFFF8;
        if ((*(unsigned char *)(a1 + 400) & 0x40) != 0) {
          unsigned __int16 v25 = *(_WORD *)__n;
        }
        if (v25 >= 4u)
        {
          if ((*(_WORD *)(v22 + 32) & 4) != 0) {
            int v26 = (unsigned __int16 *)(v23 + 4 * (unsigned __int16)v20);
          }
          else {
            int v26 = (unsigned __int16 *)(v23 + 8 * (unsigned __int16)v20);
          }
          uint64_t v27 = *v26;
          uint64_t v28 = (_WORD *)(*(void *)(a1 + 384) + v27);
          v28[1] = v25;
          *uint64_t v28 = *(_WORD *)(v22 + 48);
          *(_WORD *)(v22 + 48) = v27;
        }
        *(_WORD *)(v22 + 50) += v25;
        unsigned __int16 v29 = v58;
        if (v58 && v58 != 65534)
        {
          if ((*(unsigned char *)(a1 + 400) & 0x40) != 0) {
            unsigned __int16 v30 = v58;
          }
          else {
            unsigned __int16 v30 = (v58 + 7) & 0xFFF8;
          }
          unsigned __int16 v31 = (v30 + 7) & 0xFFF8;
          if ((*(unsigned char *)(a1 + 400) & 0x40) == 0) {
            unsigned __int16 v29 = v31;
          }
          if (v29 >= 4u)
          {
            uint64_t v32 = v23 + 8 * (unsigned __int16)v20 + 4;
            uint64_t v33 = (unsigned __int16 *)(v23 + 4 * (unsigned __int16)v20 + 2);
            if ((*(_WORD *)(v22 + 32) & 4) == 0) {
              uint64_t v33 = (unsigned __int16 *)v32;
            }
            uint64_t v34 = *v33;
            uint64_t v35 = (_WORD *)(*(void *)(a1 + 392) - v34);
            v35[1] = v29;
            _WORD *v35 = *(_WORD *)(v22 + 52);
            *(_WORD *)(v22 + 52) = v34;
          }
          *(_WORD *)(v22 + 54) += v29;
        }
        int v19 = (__int16)(v19 + 1);
        if (v19 >= v8)
        {
          uint64_t v15 = 0;
          *(_WORD *)(*(void *)(a2 + 56) + 32) &= ~0x8000u;
          goto LABEL_90;
        }
      }
      uint64_t v15 = v21;
      *(_WORD *)(*(void *)(a2 + 56) + 32) &= ~0x8000u;
      btree_node_toc_shift(a2, 0, (__int16)(v19 - v8));
    }
LABEL_90:
    uint64_t v54 = *(void *)(v9 + 56);
    if ((*(_WORD *)(v54 + 32) & 4) != 0)
    {
      if ((*(unsigned char *)(v9 + 400) & 4) == 0)
      {
LABEL_96:
        *(_WORD *)(v9 + 440) = 0;
        obj_dirty(a1, a4, 0);
        obj_dirty(a2, a4, 0);
        return v15;
      }
      __int16 v55 = 4;
    }
    else
    {
      __int16 v55 = 8;
    }
    __int16 v56 = btree_node_toc_required_capacity(v9, 8);
    if (*(unsigned __int16 *)(v54 + 42) > (unsigned __int16)(v56 * v55)) {
      btree_node_toc_resize(v9, (unsigned __int16)(v56 * v55));
    }
    goto LABEL_96;
  }
  return v15;
}

void btree_node_reinit_root(uint64_t a1, int a2, uint64_t a3)
{
  int v9 = 2123139;
  if (a2) {
    __int16 v5 = 1;
  }
  else {
    __int16 v5 = 3;
  }
  uint64_t v6 = *(void *)(a1 + 56);
  __int16 v10 = *(_WORD *)(v6 + 32) & 0x18 | v5;
  __int16 v11 = a2;
  long long v12 = *(_OWORD *)(a1 + 400);
  uint64_t v13 = *(void *)(a1 + 416);
  bzero((void *)(v6 + 32), ((*(void *)(a1 + 400) >> 27) & 0x1F000) - 72);
  uint64_t v7 = *(void *)(a1 + 56);
  unsigned int v8 = obj_size_phys(a1);
  btree_node_init_phys(v7, v8, (uint64_t)&v9);
  btree_node_init_ext(a1, (uint64_t)&v9);
  obj_dirty(a1, a3, 0);
}

void bt_update_last_leaf(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 432) == *(void *)(a3 + 112))
  {
    uint64_t v5 = *(void *)(a2 + 56);
    if ((*(_WORD *)(v5 + 32) & 2) != 0 || !*(_DWORD *)(v5 + 36))
    {
      *(void *)(a1 + 432) = *(void *)(a2 + 112);
    }
    else
    {
      MEMORY[0x270FA5388]();
      uint64_t v7 = (void *)((char *)v12 - v6);
      bzero((char *)v12 - v6, v8);
      if (btree_node_child_val(a2, (unsigned __int16)(*(_WORD *)(*(void *)(a2 + 56) + 36) - 1), v7))
      {
        uint64_t v9 = *(void *)(a1 + 8);
        BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v9)
        {
          if (v10) {
            bt_update_last_leaf_cold_2();
          }
        }
        else if (v10)
        {
          bt_update_last_leaf_cold_1();
        }
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = *v7;
      }
      *(void *)(a1 + 432) = v11;
    }
  }
}

void bt_merge_nodes(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a6;
  v69[1] = *MEMORY[0x263EF8340];
  v69[0] = a6;
  MEMORY[0x270FA5388]();
  uint64_t v17 = (uint64_t *)((char *)&v60 - v16);
  bzero((char *)&v60 - v16, v18);
  __int16 v67 = (void *)0xAAAAAAAAAAAAAAAALL;
  unsigned __int16 v66 = -21846;
  uint64_t v19 = *(void *)(a4 + 56);
  if (!a2)
  {
    if ((*(_WORD *)(v19 + 32) & 2) != 0 || *(_DWORD *)(v19 + 36) != 1) {
      return;
    }
    if (a5 || v10 && (*(unsigned char *)(v10 + 16) & 0x10) != 0)
    {
      if (btree_node_child_val(a4, 0, v17)
        || btree_node_get((void *)a1, v17, a7, 3, *(_WORD *)(*(void *)(a4 + 56) + 34) - 1, a8, v69))
      {
        return;
      }
      uint64_t v10 = v69[0];
      if ((*(unsigned char *)(a1 + 400) & 0x10) != 0 && *(void *)(v69[0] + 112) != *v17) {
        btree_node_child_id_update(a4, 0, (unint64_t *)(v69[0] + 112), a8);
      }
      int v44 = 1;
    }
    else
    {
      int v44 = 0;
    }
    if (btree_node_free_space_total(v10) > 0x27)
    {
      uint64_t v46 = *(void *)(v10 + 56);
      if (*(unsigned __int16 *)(v46 + 46) > 0x27u
        || ((*(_WORD *)(v46 + 32) & 4) == 0 || (*(unsigned char *)(v10 + 400) & 4) != 0)
        && (btree_node_compact(v10, 0, a8), *(unsigned __int16 *)(*(void *)(v10 + 56) + 46) > 0x27u))
      {
        btree_node_remove(a4, 0, a8);
        btree_node_reinit_root(a4, (unsigned __int16)(*(_WORD *)(*(void *)(a4 + 56) + 34) - 1), a8);
        if (!bt_move_entries(a4, v10, (__int16)-*(_WORD *)(*(void *)(v10 + 56) + 36), a8))
        {
          bt_update_last_leaf(a1, a4, v10);
          obj_delete_and_free(v10, a8);
          if (v44)
          {
            obj_unlock(v10, 2);
            obj_release(v10);
          }
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(a1 + 392) + 32), 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed);
          obj_dirty(a1, a8, 0);
          return;
        }
        uint64_t v47 = *(void *)(a1 + 8);
        BOOL v48 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v47)
        {
          if (v48) {
            bt_merge_nodes_cold_2();
          }
        }
        else if (v48)
        {
          bt_merge_nodes_cold_1();
        }
        bt_move_entries(a4, v10, *(__int16 *)(*(void *)(a4 + 56) + 36), a8);
        btree_node_reinit_root(a4, (unsigned __int16)(*(_WORD *)(*(void *)(a4 + 56) + 34) + 1), a8);
        if (!btree_node_key_ptr(v10, 0, &v67, &v66))
        {
          void *v17 = *(void *)(v10 + 112);
          btree_node_insert_internal(a4, 0, v67, v66, v17, (*(_WORD *)(a4 + 406) & 0x7F) + 8, a8);
        }
      }
    }
    if (!v44) {
      return;
    }
    obj_unlock(v10, 2);
    uint64_t v57 = (void *)v10;
    goto LABEL_106;
  }
  if (*(_DWORD *)(v19 + 36))
  {
    if (*(_DWORD *)(*(void *)(a2 + 56) + 36) - 1 > a3)
    {
      uint64_t v20 = a3 + 1;
      if (!btree_node_child_val(a2, (unsigned __int16)v20, v17))
      {
        uint64_t v68 = (void *)0xAAAAAAAAAAAAAAAALL;
        if (!btree_node_get((void *)a1, v17, a7, 3, *(_WORD *)(*(void *)(a2 + 56) + 34) - 1, a8, (uint64_t *)&v68))
        {
          if ((*(unsigned char *)(a1 + 400) & 0x10) != 0 && v68[14] != *v17) {
            btree_node_child_id_update(a2, (unsigned __int16)v20, v68 + 14, a8);
          }
          uint64_t v21 = *(void *)(a4 + 56);
          if ((*(_WORD *)(v21 + 32) & 4) != 0)
          {
            unsigned int v49 = *(_DWORD *)(v21 + 36);
            __int16 v24 = v68;
            uint64_t v64 = v68[7];
            int v43 = *(_DWORD *)(v64 + 36);
            unsigned int v50 = v43 + v49;
            if (v43 + v49 <= btree_node_toc_required_capacity(a4, 0))
            {
              uint64_t v65 = 0;
              LOWORD(v30) = v43;
            }
            else
            {
              if (v49 >= (unsigned __int16)(v50 >> 1)) {
                uint64_t v30 = 0;
              }
              else {
                uint64_t v30 = (v50 >> 1) - v49;
              }
              uint64_t v65 = v30;
            }
          }
          else
          {
            uint64_t v61 = v20;
            __int16 v22 = btree_node_toc_required_capacity(a4, 0);
            unsigned int v23 = btree_node_free_space_total(a4);
            __int16 v24 = v68;
            int v25 = btree_node_free_space_total((uint64_t)v68);
            unsigned int v26 = 0;
            int v27 = 0;
            uint64_t v64 = v24[7];
            uint64_t v65 = 0;
            unsigned int v28 = *(_DWORD *)(v64 + 36);
            unsigned int v29 = 8 * (v22 & 0x1FFF);
            int v62 = v23 - ((v25 + v23) >> 1);
            unsigned int v63 = v28;
            do
            {
              LODWORD(v30) = v26;
              if (v63 <= (unsigned __int16)v26) {
                break;
              }
              if (!(_WORD)v65 && (_WORD)v26)
              {
                int v31 = btree_node_toc_required_capacity(a4, (__int16)v26);
                int v32 = (8 * (_WORD)v31 - (_WORD)v29) & 0xFFF8;
                if (((8 * v31) & 0xFFF8u) <= v29) {
                  int v32 = 0;
                }
                if (v32 + (unsigned __int16)v27 <= v62) {
                  uint64_t v33 = 0;
                }
                else {
                  uint64_t v33 = v26;
                }
                uint64_t v65 = v33;
              }
              uint64_t v34 = v24[50];
              __int16 v35 = *(_WORD *)(v64 + 32);
              if ((v34 & 0x40) != 0)
              {
                if ((v35 & 4) != 0) {
                  unsigned int v37 = (v34 >> 9) & 0x3FFF;
                }
                else {
                  unsigned int v37 = *(unsigned __int16 *)(v24[47] + 8 * (unsigned __int16)v30 + 2);
                }
              }
              else
              {
                if ((v35 & 4) != 0) {
                  unsigned int v36 = (v34 >> 9) & 0x3FFF;
                }
                else {
                  unsigned int v36 = *(unsigned __int16 *)(v24[47] + 8 * (unsigned __int16)v30 + 2);
                }
                unsigned int v37 = (v36 + 7) & 0x1FFF8;
              }
              int v38 = v37 + v27;
              int v39 = btree_node_val_len((uint64_t)v24, (unsigned __int16)v30);
              if (v39 == 65534) {
                int v40 = 0;
              }
              else {
                int v40 = v39;
              }
              if ((v34 & 0x40) == 0) {
                int v40 = (v40 + 7) & 0x1FFF8;
              }
              int v27 = v38 + v40;
              unsigned int v26 = v30 + 1;
              int v41 = btree_node_toc_required_capacity(a4, (__int16)(v30 + 1));
              int v42 = (8 * (_WORD)v41 - (_WORD)v29) & 0xFFF8;
              if (((8 * v41) & 0xFFF8u) <= v29) {
                int v42 = 0;
              }
            }
            while (v42 + (unsigned __int16)v27 <= v23);
            LOWORD(v20) = v61;
            int v43 = v63;
          }
          if (v43 != (unsigned __int16)v30)
          {
            if ((*(_WORD *)(*(void *)(a2 + 56) + 32) & 4) != 0) {
              int v51 = (*(_DWORD *)(a2 + 400) >> 9) & 0x3FFF;
            }
            else {
              int v51 = *(unsigned __int16 *)(*(void *)(a2 + 376) + 8 * (unsigned __int16)v20 + 2);
            }
            if ((*(_WORD *)(v64 + 32) & 4) != 0) {
              int v52 = (*((_DWORD *)v24 + 100) >> 9) & 0x3FFF;
            }
            else {
              int v52 = *(unsigned __int16 *)(v24[47] + 8 * (unsigned __int16)v65 + 2);
            }
            unsigned __int16 v66 = v52;
            uint64_t v53 = *(void *)(a2 + 400);
            if ((v53 & 0x40) != 0) {
              unsigned int v54 = v51;
            }
            else {
              unsigned int v54 = (v51 + 7) & 0x1FFF8;
            }
            unsigned int v55 = (v52 + 7) & 0x1FFF8;
            if ((v53 & 0x40) != 0) {
              unsigned int v55 = v52;
            }
            if (v54 >= v55)
            {
              LOWORD(v30) = v65;
            }
            else
            {
              if ((v53 & 0x40) == 0)
              {
                LOWORD(v52) = (v52 + 7) & 0xFFF8;
                LOWORD(v51) = (v51 + 7) & 0xFFF8;
              }
              BOOL has_room = btree_node_has_room(a2, 0, 0, 0, v52 - v51, 0, 0);
              LOWORD(v30) = v65;
              if (!has_room) {
                goto LABEL_90;
              }
            }
          }
          if ((_WORD)v30 && !bt_move_entries(a4, (uint64_t)v24, (__int16)-(__int16)v30, a8))
          {
            if (*(_DWORD *)(v24[7] + 36))
            {
              if (btree_node_key_ptr((uint64_t)v24, 0, &v67, &v66)
                || btree_node_entry_update(a2, (unsigned __int16)v20, v67, v66, 0, 0, a8))
              {
                uint64_t v58 = *(void *)(a1 + 8);
                BOOL v59 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
                if (v58)
                {
                  if (v59) {
                    bt_merge_nodes_cold_4();
                  }
                }
                else if (v59)
                {
                  bt_merge_nodes_cold_3();
                }
              }
            }
            else
            {
              btree_node_remove(a2, (unsigned __int16)v20, a8);
              bt_update_last_leaf(a1, a2, (uint64_t)v24);
              obj_delete_and_free(v24, a8);
              atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(a1 + 392) + 32), 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed);
              obj_dirty(a1, a8, 0);
            }
          }
LABEL_90:
          obj_unlock((uint64_t)v24, 2);
          uint64_t v57 = v24;
LABEL_106:
          obj_release(v57);
        }
      }
    }
  }
  else
  {
    btree_node_remove(a2, a3, a8);
    uint64_t v45 = *(void *)(a2 + 56);
    if ((*(_WORD *)(v45 + 32) & 1) != 0 && !*(_DWORD *)(v45 + 36)) {
      btree_node_reinit_root(a2, 0, a8);
    }
    bt_update_last_leaf(a1, a2, a4);
    obj_delete_and_free(a4, a8);
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(a1 + 392) + 32), 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed);
    obj_dirty(a1, a8, 0);
  }
}

void OUTLINED_FUNCTION_21_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 40) = a1;
}

uint64_t OUTLINED_FUNCTION_22_3(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16 * a2 - 16);
  return obj_oid(v4);
}

uint64_t userfs_fd_is_apfs(int a1)
{
  uint64_t v8 = 0;
  if (dev_init_with_fd(a1, &v8))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      userfs_fd_is_apfs_cold_4();
    }
    return 0;
  }
  unsigned int v2 = dev_block_size(v8);
  if (v2 <= 0x1000) {
    size_t v3 = 4096;
  }
  else {
    size_t v3 = v2;
  }
  uint64_t v4 = _apfs_malloc(v3);
  if (v4)
  {
    if (dev_read(v8, 0))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_fd_is_apfs_cold_3();
      }
    }
    else
    {
      if (!nx_check_superblock((uint64_t)v4, 0x10001u, 0, v5, v6))
      {
        uint64_t v1 = 1;
        goto LABEL_18;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_fd_is_apfs_cold_2();
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    userfs_fd_is_apfs_cold_1();
  }
  uint64_t v1 = 0;
LABEL_18:
  if (v8) {
    dev_close(v8);
  }
  if (v4) {
    _apfs_free(v4, v3);
  }
  return v1;
}

uint64_t userfs_apfs_get_next_vol(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a2;
  *a3 = 0;
  if (v3 > 0x63) {
    return 4294966295;
  }
  int8x16_t v5 = (void *)(a1 + 376);
  while (1)
  {
    unint64_t v6 = *(void *)(*(void *)(a1 + 376) + 184 + 8 * v3);
    if (v6) {
      break;
    }
    if (++v3 == 100) {
      return 4294966295;
    }
  }
  uint64_t v7 = obj_get(*(void *)(a1 + 392), 0, v6, (int *)&apfs_desc, 0, 0, 0, 0, a3);
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      userfs_apfs_get_next_vol_cold_1(v5, v3, v7);
    }
  }
  else
  {
    *a2 = v3;
  }
  return v7;
}

uint64_t userfs_volume_is_mountable(uint64_t a1, unsigned char *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  *a2 = 0;
  uint64_t v4 = *(void *)(a1 + 376);
  unsigned int v5 = *(unsigned __int16 *)(v4 + 964);
  if (v5 >= 3 && v5 != 64 && v5 != 576)
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v12) {
      return result;
    }
    int v19 = 136315650;
    uint64_t v20 = "userfs_volume_is_mountable";
    __int16 v21 = 1024;
    int v22 = 125;
    __int16 v23 = 1024;
    unsigned int v24 = v5;
    uint64_t v9 = &_os_log_internal;
    uint64_t v10 = "%s:%d: Refusing to mount volume with role: %u\n";
    uint32_t v13 = 24;
    goto LABEL_27;
  }
  if ((*(unsigned char *)(v4 + 48) & 2) != 0)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v11) {
      return result;
    }
    int v19 = 136315394;
    uint64_t v20 = "userfs_volume_is_mountable";
    __int16 v21 = 1024;
    int v22 = 132;
    uint64_t v9 = &_os_log_internal;
    uint64_t v10 = "%s:%d: Refusing to mount conformance volume.\n";
    goto LABEL_26;
  }
  uint64_t v6 = *(void *)(v4 + 56);
  if ((v6 & 9) == 0)
  {
    BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v14) {
      return result;
    }
    int v19 = 136315394;
    uint64_t v20 = "userfs_volume_is_mountable";
    __int16 v21 = 1024;
    int v22 = 139;
    uint64_t v9 = &_os_log_internal;
    uint64_t v10 = "%s:%d: Refusing to mount fully sensitive volume.\n";
    goto LABEL_26;
  }
  if ((v6 & 0x10) != 0)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v15) {
      return result;
    }
    int v19 = 136315394;
    uint64_t v20 = "userfs_volume_is_mountable";
    __int16 v21 = 1024;
    int v22 = 146;
    uint64_t v9 = &_os_log_internal;
    uint64_t v10 = "%s:%d: Refusing to mount incomplete volume.\n";
    goto LABEL_26;
  }
  if (v5 == 1 && !uuid_is_null((const unsigned __int8 *)(v4 + 1008)))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      uint64_t v20 = "userfs_volume_is_mountable";
      __int16 v21 = 1024;
      int v22 = 154;
      _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: Allowing read-only mount of read-only system volume.\n", (uint8_t *)&v19, 0x12u);
    }
    *a2 = 1;
  }
  if ((*(unsigned char *)(*(void *)(a1 + 376) + 56) & 0x20) != 0)
  {
    BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v16) {
      return result;
    }
    int v19 = 136315394;
    uint64_t v20 = "userfs_volume_is_mountable";
    __int16 v21 = 1024;
    int v22 = 161;
    uint64_t v9 = &_os_log_internal;
    uint64_t v10 = "%s:%d: Refusing to mount sealed volume.\n";
    goto LABEL_26;
  }
  if (apfs_has_secondary_fsroot(a1))
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v7) {
      return result;
    }
    int v19 = 136315394;
    uint64_t v20 = "userfs_volume_is_mountable";
    __int16 v21 = 1024;
    int v22 = 168;
    uint64_t v9 = &_os_log_internal;
    uint64_t v10 = "%s:%d: Refusing to mount a volume formatted with a secondary fs_root tree.\n";
    goto LABEL_26;
  }
  uint64_t v17 = *(void *)(a1 + 376);
  if ((*(unsigned char *)(v17 + 57) & 2) != 0)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v18)
    {
      int v19 = 136315394;
      uint64_t v20 = "userfs_volume_is_mountable";
      __int16 v21 = 1024;
      int v22 = 175;
      uint64_t v9 = &_os_log_internal;
      uint64_t v10 = "%s:%d: Refusing to mount a volume formatted with expanded records.\n";
LABEL_26:
      uint32_t v13 = 18;
LABEL_27:
      _os_log_impl(&dword_22CAAC000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v13);
      return 0;
    }
  }
  else if ((*(unsigned char *)(v17 + 48) & 8) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      uint64_t v20 = "userfs_volume_is_mountable";
      __int16 v21 = 1024;
      int v22 = 182;
      _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: Allowing read-only mount of a volume with attribution tag records.\n", (uint8_t *)&v19, 0x12u);
    }
    uint64_t result = 1;
    *a2 = 1;
  }
  else
  {
    return 1;
  }
  return result;
}

uint64_t userfs_apfs_mount(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  if (a2 <= 0x63)
  {
    unint64_t v7 = *(void *)(*(void *)(a1 + 376) + 8 * a2 + 184);
    if (a4) {
      LODWORD(v18) = 1;
    }
    uint64_t v8 = apfs_mount(a1, v7, &v18, a3, 0, a5);
    if (v8)
    {
      uint64_t v5 = v8;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_apfs_mount_cold_7();
      }
      goto LABEL_37;
    }
    if (*(void *)(*(void *)(*a5 + 376) + 160))
    {
      uint64_t v9 = revert_to_snapshot(*a5, 0);
      if (v9)
      {
        uint64_t v5 = v9;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          userfs_apfs_mount_cold_6();
        }
LABEL_36:
        apfs_unmount(*a5);
LABEL_37:
        *a5 = 0;
        return v5;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 136315394;
        uint64_t v20 = "userfs_apfs_mount";
        __int16 v21 = 1024;
        int v22 = 276;
        _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s:%d: Successfully reverted to snapshot.\n", buf, 0x12u);
      }
    }
    uint64_t v10 = (uint64_t *)*a5;
    if (*(void *)(*a5 + 480)) {
      goto LABEL_41;
    }
    uint64_t v11 = fs_lookup_name((uint64_t *)*a5, 0, "root", 4uLL);
    if (!v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_apfs_mount_cold_2();
      }
      goto LABEL_29;
    }
    BOOL v12 = (unsigned char *)v11;
    v10[60] = fs_get_inode((uint64_t)v10, *(void *)(v11 + 16));
    jobj_release((uint64_t)v10, v12);
    if (v10[60])
    {
LABEL_41:
      if (v10[61])
      {
LABEL_16:
        cleanup_purgatory_dir(*a5);
        return 0;
      }
      uint64_t v13 = fs_lookup_name(v10, 0, "private-dir", 0xBuLL);
      if (v13)
      {
        BOOL v14 = (unsigned char *)v13;
        v10[61] = fs_get_inode((uint64_t)v10, *(void *)(v13 + 16));
        jobj_release((uint64_t)v10, v14);
        if (v10[61]) {
          goto LABEL_16;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          userfs_apfs_mount_cold_5();
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        userfs_apfs_mount_cold_4();
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      userfs_apfs_mount_cold_3();
    }
LABEL_29:
    BOOL v15 = (unsigned char *)v10[61];
    if (v15)
    {
      jobj_release((uint64_t)v10, v15);
      v10[61] = 0;
    }
    BOOL v16 = (unsigned char *)v10[60];
    if (v16)
    {
      jobj_release((uint64_t)v10, v16);
      v10[60] = 0;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      userfs_apfs_mount_cold_1();
    }
    uint64_t v5 = 22;
    goto LABEL_36;
  }
  return 22;
}

void userfs_apfs_unmount(uint64_t a1)
{
  unsigned int v2 = *(unsigned char **)(a1 + 488);
  if (v2)
  {
    jobj_release(a1, v2);
    *(void *)(a1 + 488) = 0;
  }

  apfs_unmount(a1);
}

uint64_t userfs_nx_mount(int a1, int a2, void *a3, uint64_t **a4)
{
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = v7;
  v12[1] = v7;
  uint64_t v11 = 0;
  uint64_t v8 = dev_init_with_fd(a1, &v11);
  if (v8)
  {
    uint64_t v9 = v8;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      userfs_nx_mount_cold_2();
    }
  }
  else
  {
    parse_nx_mount_options(0, (int *)v12);
    WORD4(v12[0]) |= 3u;
    if (a2) {
      LODWORD(v12[0]) |= 1u;
    }
    uint64_t v9 = nx_mount(v11, (uint64_t)v12, a4);
    if (v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_nx_mount_cold_1();
      }
    }
    else
    {
      *a3 = v11;
    }
  }
  return v9;
}

unint64_t fletcher64_set_cksum(unint64_t *a1, uint32x4_t *a2, unint64_t a3, unint64_t a4, int8x16_t a5, int8x16_t a6)
{
  unint64_t result = fletcher64(a2, a3, a4, a5, a6);
  unint64_t v8 = (HIDWORD(result)
      + result
      - 0xFFFFFFFF
      * ((unint64_t)(((HIDWORD(result) + result) * (unsigned __int128)0x200000003uLL) >> 64) >> 1)) ^ 0xFFFFFFFF;
  *a1 = v8 | ((unint64_t)~(v8
                                + result
                                + ((unint64_t)(((v8 + result)
                                                                   * (unsigned __int128)0x200000003uLL) >> 64) >> 1)) << 32);
  return result;
}

unint64_t fletcher64_verify_cksum(void *a1, uint32x4_t *a2, unint64_t a3, unint64_t a4, int8x16_t a5, int8x16_t a6)
{
  unint64_t v7 = fletcher64(a2, a3, a4, a5, a6);
  unint64_t v8 = (HIDWORD(v7)
      + v7
      - 0xFFFFFFFF
      * ((unint64_t)(((HIDWORD(v7) + v7) * (unsigned __int128)0x200000003uLL) >> 64) >> 1)) ^ 0xFFFFFFFF;
  return (v8 | ((unint64_t)~(v8
                                  + v7
                                  + ((unint64_t)(((v8 + v7)
                                                                     * (unsigned __int128)0x200000003uLL) >> 64) >> 1)) << 32)) ^ *a1;
}

BOOL nx_is_panic_on_corruption_enabled(uint64_t a1)
{
  if (a1) {
    return *(unsigned char *)(a1 + 637) != 0;
  }
  else {
    return apfs_corruption_panics & 1;
  }
}

uint64_t nx_calculate_metadata_parameters(unsigned int a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5)
{
  *(void *)(a5 + 208) = 0;
  *(_OWORD *)(a5 + 176) = 0u;
  *(_OWORD *)(a5 + 192) = 0u;
  *(_OWORD *)(a5 + 144) = 0u;
  *(_OWORD *)(a5 + 160) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  uint64_t v5 = 22;
  *(_OWORD *)a5 = 0u;
  if (a1 - 65537 < 0xFFFF0FFF || !a2) {
    return v5;
  }
  unint64_t v6 = 8 * a1;
  unint64_t v7 = a1 - 40;
  *(void *)(a5 + 88) = v7 >> 5;
  *(void *)(a5 + 96) = v7 >> 3;
  *(void *)(a5 + 8) = a1;
  *(void *)(a5 + 16) = a2;
  unint64_t v8 = (a2 + v6 - 1) / v6;
  uint64_t v9 = (v7 >> 5) - 1;
  unint64_t v10 = (v9 + v8) / (v7 >> 5);
  *(void *)(a5 + 24) = v8;
  *(void *)(a5 + 32) = v10;
  uint64_t v11 = (v7 >> 3) - 1;
  unint64_t v12 = (v11 + v10) / (v7 >> 3);
  if (v12 == 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = (v11 + v10) / (v7 >> 3);
  }
  *(void *)(a5 + 40) = v13;
  *(void *)(a5 + 48) = a3;
  unint64_t v14 = (a3 + v6 - 1) / v6;
  unint64_t v15 = (v9 + v14) / (v7 >> 5);
  *(void *)(a5 + 56) = v14;
  *(void *)(a5 + 64) = v15;
  unint64_t v16 = (v11 + v15) / (v7 >> 3);
  if (v16 == 1) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = v16;
  }
  *(void *)(a5 + 72) = v17;
  *(void *)(a5 + 80) = v6;
  uint64_t v18 = 3 * (v10 + v8 + v14 + v15 + v13 + v17);
  *(void *)(a5 + 104) = v18;
  unint64_t v19 = (unint64_t)(v18 + 63) >> 6;
  unint64_t v20 = (a1 - 1 + 8 * v19) / a1;
  if (HIDWORD(v20)) {
    return 27;
  }
  *(void *)(a5 + 112) = v20;
  *(void *)(a5 + 120) = 16;
  if (v20 < 0x1000)
  {
    uint64_t v21 = 16 * v20;
    goto LABEL_14;
  }
  if (v20 >> 13) {
    return 27;
  }
  uint64_t v21 = 65534;
LABEL_14:
  *(void *)(a5 + 128) = v21;
  uint64_t v22 = (2 * v21 + 6) & 0x7FFFFFFFFFFFFFF8;
  if (v13) {
    unint64_t v10 = v12;
  }
  if (v17) {
    unint64_t v23 = v16;
  }
  else {
    unint64_t v23 = v15;
  }
  unint64_t v24 = ((2 * v20 + 6) & 0x7FFFFFFFFFFFFFF8) + 8 * (v20 + v10 + v23) + v22 + 2520;
  if (v24 > 0x100000) {
    return 27;
  }
  if (v24 % a1) {
    unint64_t v24 = a1 - 1 + v24 - (a1 - 1 + v24) % a1;
  }
  *(void *)(a5 + 136) = v24;
  unint64_t v26 = (a1 - 96 - (((((18725 * ((unsigned __int16)(a1 - 96) >> 2)) >> 15) & 0x3FFC) + 28) & 0x7FE0))
      / 0x30uLL;
  unint64_t v27 = 0x200000 / a1;
  uint64_t v28 = 15;
  if (a2 >= 0x100000) {
    uint64_t v29 = 15;
  }
  else {
    uint64_t v29 = 31;
  }
  if (a2 >= 0x100000) {
    char v30 = 4;
  }
  else {
    char v30 = 5;
  }
  if (a2 < 0x40000)
  {
    uint64_t v29 = 63;
    char v30 = 6;
  }
  unint64_t v31 = (v29 + a2) >> v30;
  unint64_t v32 = v26 - 1;
  unint64_t v33 = (v26 - 1 + v31) / v26;
  if (v33 >= v27) {
    unint64_t v33 = 0x200000 / a1;
  }
  if (v33 == 2) {
    unint64_t v33 = 3;
  }
  if (a3 >= 0x100000)
  {
    char v34 = 4;
  }
  else
  {
    uint64_t v28 = 31;
    char v34 = 5;
  }
  if (a3 < 0x40000)
  {
    uint64_t v28 = 63;
    char v34 = 6;
  }
  unint64_t v35 = (v32 + ((v28 + a3) >> v34)) / v26;
  if (v35 >= v27) {
    unint64_t v35 = 0x200000 / a1;
  }
  if (v35 == 2) {
    unint64_t v35 = 3;
  }
  *(void *)(a5 + 152) = v33;
  *(void *)(a5 + 160) = v35;
  unint64_t v36 = a3 + a2;
  if ((a3 + a2) >> 18)
  {
    if (v36 >> 20) {
      unint64_t v19 = (unint64_t)(v18 + 15) >> 4;
    }
    else {
      unint64_t v19 = (unint64_t)(v18 + 31) >> 5;
    }
  }
  unint64_t v37 = (v32 + v19) / v26;
  if (v37 >= v27) {
    unint64_t v37 = 0x200000 / a1;
  }
  if (v37 == 2) {
    unint64_t v37 = 3;
  }
  *(void *)(a5 + 144) = v37;
  uint64_t v38 = v24 / a1;
  uint64_t v39 = v38 - 1;
  if (v38 <= 1) {
    uint64_t v39 = 0;
  }
  uint64_t v40 = 8;
  if (v33 < 8) {
    uint64_t v40 = v33;
  }
  *(void *)(a5 + 192) = 4;
  *(void *)(a5 + 200) = v40;
  if (a4)
  {
    if (a4 > 0x64) {
      return 22;
    }
  }
  else
  {
    int v41 = v36 * a1;
    unint64_t v42 = (v36 * a1) >> 29;
    if ((v41 & 0x1FFFFFFF) != 0) {
      unint64_t v43 = v42 + 1;
    }
    else {
      unint64_t v43 = v42;
    }
    if (v43 >= 0x64) {
      a4 = 100;
    }
    else {
      a4 = v43;
    }
  }
  *(void *)(a5 + 184) = a4;
  uint64_t v44 = v40 * a4;
  uint64_t v45 = 2;
  if (a3) {
    uint64_t v45 = 3;
  }
  uint64_t v46 = v45 + v33 + v35 + v37 + v38 + v39 + 8 * v44;
  *(void *)(a5 + 168) = 4
                        * ((unsigned __int16)(v46 + (unsigned __int16)(a1 - 40) / 0x28u - 1)
                         / ((unsigned __int16)(a1 - 40)
                          / 0x28u))
                        + 4;
  *(void *)(a5 + 176) = 4 * v46;
  *(void *)(a5 + 208) = 0;
  uint64_t v5 = 0;
  if (a3)
  {
    unint64_t v47 = 0x100000000;
    if (0x800000000uLL / a1 < a2) {
      unint64_t v47 = 0x200000000;
    }
    unint64_t v48 = v47 / a1;
    if (v48 >= a2 / 5) {
      unint64_t v48 = a2 / 5;
    }
    *(void *)(a5 + 208) = v48;
  }
  return v5;
}

uint64_t nx_get_evict_mapping_tree(uint64_t a1, unsigned int a2, unint64_t a3, int a4, int a5, uint64_t *a6)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  *(void *)&long long v13 = 0;
  long long v14 = 0u;
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  unint64_t v12 = evict_mapping_key_compare;
  DWORD2(v13) = 33;
  HIDWORD(v13) = a4;
  uint64_t result = btree_get_extended(a1, a2, a3, 0, 0, (uint64_t)&v12, 0, a6);
  if (result == 92)
  {
    if (a5)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v18 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
      unint64_t v12 = evict_mapping_key_compare;
      HIDWORD(v13) = a4;
      uint64_t result = btree_get_extended(a1, 0, a3, 0, 0, (uint64_t)&v12, 0, a6);
      if (!result)
      {
        uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (result)
        {
          nx_get_evict_mapping_tree_cold_1();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t nx_init_phys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 22;
  }
  int v5 = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a1 + 32) = 1112758350;
  *(_DWORD *)(a1 + 36) = v5;
  *(void *)(a1 + 1264) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a3 + 8);
  *(_OWORD *)(a1 + 56) = xmmword_22CB69A60;
  uint64_t v6 = *(void *)(a3 + 32);
  *(void *)(a1 + 88) = 1024;
  *(void *)(a1 + 96) = v6;
  uuid_copy((unsigned __int8 *)(a1 + 72), (const unsigned __int8 *)(a3 + 64));
  unint64_t v7 = (const unsigned __int8 *)(a3 + 80);
  if (uuid_is_null(v7)) {
    return 0;
  }
  uuid_copy((unsigned __int8 *)(a1 + 1280), v7);
  uint64_t result = 0;
  *(void *)(a1 + 64) |= 0x100uLL;
  return result;
}

uint64_t nx_init(uint64_t a1, unsigned int *a2)
{
  if (!a2) {
    return 22;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  unsigned int v4 = *a2;
  *(_DWORD *)(a1 + 648) = *a2;
  *(_DWORD *)(a1 + 652) = *(_DWORD *)(v3 + 36) / v4;
  uint64_t v5 = *((void *)a2 + 3);
  *(void *)(a1 + 376) = v3;
  *(void *)(a1 + 384) = v5;
  LODWORD(v5) = a2[11];
  *(unsigned char *)(a1 + 627) = a2[10] != 0;
  *(unsigned char *)(a1 + 628) = v5 != 0;
  LODWORD(v5) = a2[13];
  *(unsigned char *)(a1 + 629) = a2[12] != 0;
  *(unsigned char *)(a1 + 631) = v5 != 0;
  LODWORD(v5) = a2[15];
  *(unsigned char *)(a1 + 632) = a2[14] != 0;
  *(unsigned char *)(a1 + 633) = v5 != 0;
  *(void *)(a1 + 392) = *(void *)a1;
  new_lock((pthread_mutex_t *)(a1 + 656));
  new_lock((pthread_mutex_t *)(a1 + 848));
  *(void *)(a1 + 912) = nx_keybag_init(a1);
  *(void *)(a1 + 920) = 0;
  new_rwlock((pthread_rwlock_t *)(a1 + 928));
  *(void *)(a1 + 1128) = 0;
  *(void *)(a1 + 1336) = 0;
  *(unsigned char *)(a1 + 635) = 0;
  new_lock((pthread_mutex_t *)(a1 + 1808));
  new_rwlock((pthread_rwlock_t *)(a1 + 1136));
  new_lock((pthread_mutex_t *)(a1 + 736));
  *(void *)(a1 + 812) = 0;
  *(void *)(a1 + 800) = 0;
  *(_WORD *)(a1 + 808) = 0;
  new_lock((pthread_mutex_t *)(a1 + 504));
  new_cv((pthread_cond_t *)(a1 + 568));
  return 0;
}

uint64_t nx_destroy(uint64_t a1)
{
  unsigned int v2 = *(uint64_t **)(a1 + 720);
  if (v2 && !*(_DWORD *)(*(void *)a1 + 912)) {
    obj_release(v2);
  }
  free_rwlock((pthread_rwlock_t *)(a1 + 928));
  free_rwlock((pthread_rwlock_t *)(a1 + 1136));
  free_lock((pthread_mutex_t *)(a1 + 848));
  free_lock((pthread_mutex_t *)(a1 + 656));
  nx_keybag_free(*(void *)(a1 + 912));
  free_lock((pthread_mutex_t *)(a1 + 1808));
  free_lock((pthread_mutex_t *)(a1 + 736));
  free_lock((pthread_mutex_t *)(a1 + 504));
  free_cv((pthread_cond_t *)(a1 + 568));
  return 0;
}

uint64_t nx_fusion_superblock_write(uint64_t a1, const void *a2)
{
  uint64_t v2 = *(void *)(a1 + 376);
  if ((*(unsigned char *)(v2 + 65) & 1) == 0) {
    return 0;
  }
  uint64_t v6 = _apfs_malloc(*(unsigned int *)(v2 + 36));
  memcpy(v6, a2, *(unsigned int *)(*(void *)(a1 + 376) + 36));
  v6[1295] |= 1u;
  obj_checksum_set_phys(a1, (uint64_t)v6, *(_DWORD *)(*(void *)(a1 + 376) + 36), v7, v8);
  uint64_t v9 = dev_write(*(void *)(a1 + 384), 0x4000000000000000uLL >> __clz(__rbit64(*(unsigned int *)(*(void *)(a1 + 376) + 36))));
  _apfs_free(v6, *(unsigned int *)(*(void *)(a1 + 376) + 36));
  return v9;
}

uint64_t nx_checkpoint_traverse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  int v62 = 0;
  unsigned int v63 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  uint64_t v6 = spaceman_get((void *)a1, &v63);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(a1 + 400);
    if (v8 && *(_DWORD *)(v8 + 76)) {
      return v7;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 384) + 208;
      uint64_t v16 = *(void *)(*(void *)(a1 + 376) + 152);
      long long v17 = "<UNKNOWN>";
      uint64_t v65 = "nx_checkpoint_traverse";
      if (a3 == 2) {
        long long v17 = "FIXUP";
      }
      int v67 = 831;
      *(_DWORD *)int buf = 136316418;
      __int16 v66 = 1024;
      if (a3 == 1) {
        long long v17 = "START";
      }
      __int16 v68 = 2080;
      uint64_t v69 = v15;
      __int16 v70 = 2048;
      *(void *)uint64_t v71 = v16;
      *(_WORD *)&v71[8] = 2080;
      *(void *)&v71[10] = v17;
      *(_WORD *)&v71[18] = 1024;
      *(_DWORD *)&v71[20] = v7;
      _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get spaceman oid %lld for checkpoint %s traverse: %d\n", buf, 0x36u);
      uint64_t v8 = *(void *)(a1 + 400);
      if (!v8) {
        return v7;
      }
    }
    else if (!v8)
    {
      return v7;
    }
    int v9 = 831;
    goto LABEL_13;
  }
  uint64_t v7 = spaceman_checkpoint_traverse(a1, a2, (uint64_t)v63, a3);
  obj_release(v63);
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 400);
    if (v8 && *(_DWORD *)(v8 + 76)) {
      return v7;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 384);
      uint64_t v22 = "<UNKNOWN>";
      uint64_t v65 = "nx_checkpoint_traverse";
      *(_DWORD *)int buf = 136316162;
      uint64_t v23 = v21 + 208;
      if (a3 == 2) {
        uint64_t v22 = "FIXUP";
      }
      int v67 = 838;
      uint64_t v69 = v23;
      unint64_t v24 = "START";
      __int16 v66 = 1024;
      __int16 v68 = 2080;
      if (a3 != 1) {
        unint64_t v24 = v22;
      }
      __int16 v70 = 2080;
      *(void *)uint64_t v71 = v24;
      *(_WORD *)&v71[8] = 1024;
      *(_DWORD *)&v71[10] = v7;
      _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s spaceman checkpoint %s traverse failed: %d\n", buf, 0x2Cu);
      uint64_t v8 = *(void *)(a1 + 400);
      if (!v8) {
        return v7;
      }
    }
    else if (!v8)
    {
      return v7;
    }
    int v9 = 838;
    goto LABEL_13;
  }
  uint64_t v11 = *(void *)(a1 + 376);
  unint64_t v12 = *(void *)(v11 + 160);
  if (v12 && !*(_DWORD *)(a1 + 728))
  {
    uint64_t v14 = obj_get(*(void *)(a1 + 392), 0x40000000u, v12, (int *)&om_desc, 0, 0, 0, 0, (uint64_t *)&v61);
    if (v14)
    {
      uint64_t v7 = v14;
      uint64_t v8 = *(void *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76)) {
        return v7;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = *(void *)(a1 + 384);
        char v30 = "<UNKNOWN>";
        uint64_t v65 = "nx_checkpoint_traverse";
        *(_DWORD *)int buf = 136316162;
        uint64_t v31 = v29 + 208;
        if (a3 == 2) {
          char v30 = "FIXUP";
        }
        int v67 = 848;
        uint64_t v69 = v31;
        unint64_t v32 = "START";
        __int16 v66 = 1024;
        __int16 v68 = 2080;
        if (a3 != 1) {
          unint64_t v32 = v30;
        }
        __int16 v70 = 2080;
        *(void *)uint64_t v71 = v32;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v7;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get omap for checkpoint %s traverse: %d\n", buf, 0x2Cu);
        uint64_t v8 = *(void *)(a1 + 400);
        if (!v8) {
          return v7;
        }
      }
      else if (!v8)
      {
        return v7;
      }
      int v9 = 848;
    }
    else
    {
      uint64_t v7 = omap_checkpoint_traverse(a1, a2, (uint64_t)v61, a3);
      obj_release(v61);
      if (!v7)
      {
        uint64_t v11 = *(void *)(a1 + 376);
        goto LABEL_17;
      }
      uint64_t v8 = *(void *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76)) {
        return v7;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = *(void *)(a1 + 384);
        unsigned int v49 = "<UNKNOWN>";
        uint64_t v65 = "nx_checkpoint_traverse";
        *(_DWORD *)int buf = 136316162;
        uint64_t v50 = v48 + 208;
        if (a3 == 2) {
          unsigned int v49 = "FIXUP";
        }
        int v67 = 854;
        uint64_t v69 = v50;
        int v51 = "START";
        __int16 v66 = 1024;
        __int16 v68 = 2080;
        if (a3 != 1) {
          int v51 = v49;
        }
        __int16 v70 = 2080;
        *(void *)uint64_t v71 = v51;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v7;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s omap checkpoint %s traverse failed: %d\n", buf, 0x2Cu);
        uint64_t v8 = *(void *)(a1 + 400);
        if (!v8) {
          return v7;
        }
      }
      else if (!v8)
      {
        return v7;
      }
      int v9 = 854;
    }
LABEL_13:
    *(_DWORD *)(v8 + 76) = v9;
    ++*(_WORD *)(v8 + 80);
    return v7;
  }
LABEL_17:
  if (*(void *)(v11 + 168))
  {
    uint64_t v13 = nx_reaper_get((void *)a1, &v62);
    if (v13)
    {
      uint64_t v7 = v13;
      uint64_t v8 = *(void *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76)) {
        return v7;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 384);
        unint64_t v26 = "<UNKNOWN>";
        uint64_t v65 = "nx_checkpoint_traverse";
        *(_DWORD *)int buf = 136316162;
        uint64_t v27 = v25 + 208;
        if (a3 == 2) {
          unint64_t v26 = "FIXUP";
        }
        int v67 = 867;
        uint64_t v69 = v27;
        uint64_t v28 = "START";
        __int16 v66 = 1024;
        __int16 v68 = 2080;
        if (a3 != 1) {
          uint64_t v28 = v26;
        }
        __int16 v70 = 2080;
        *(void *)uint64_t v71 = v28;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v7;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get reaper for checkpoint %s traverse: %d\n", buf, 0x2Cu);
        uint64_t v8 = *(void *)(a1 + 400);
        if (!v8) {
          return v7;
        }
      }
      else if (!v8)
      {
        return v7;
      }
      int v9 = 867;
      goto LABEL_13;
    }
    uint64_t v7 = nx_reaper_checkpoint_traverse((uint64_t *)a1, a2, (uint64_t)v62, a3);
    obj_release(v62);
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76)) {
        return v7;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)(a1 + 384);
        char v34 = "<UNKNOWN>";
        uint64_t v65 = "nx_checkpoint_traverse";
        *(_DWORD *)int buf = 136316162;
        uint64_t v35 = v33 + 208;
        if (a3 == 2) {
          char v34 = "FIXUP";
        }
        int v67 = 874;
        uint64_t v69 = v35;
        unint64_t v36 = "START";
        __int16 v66 = 1024;
        __int16 v68 = 2080;
        if (a3 != 1) {
          unint64_t v36 = v34;
        }
        __int16 v70 = 2080;
        *(void *)uint64_t v71 = v36;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v7;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s nx reaper checkpoint %s traverse failed: %d\n", buf, 0x2Cu);
        uint64_t v8 = *(void *)(a1 + 400);
        if (!v8) {
          return v7;
        }
      }
      else if (!v8)
      {
        return v7;
      }
      int v9 = 874;
      goto LABEL_13;
    }
    uint64_t v11 = *(void *)(a1 + 376);
  }
  if (!*(_DWORD *)(v11 + 180))
  {
LABEL_56:
    if (!*(void *)(v11 + 1344) || !obj_type_is_or_contains_ephemeral(*(_DWORD *)(v11 + 176))) {
      return 0;
    }
    v59[0] = 0;
    v59[1] = 0;
    uint64_t v58 = 0;
    unsigned int v57 = 0;
    uint64_t v7 = obj_descriptor_and_flags_for_type(*(_DWORD *)(*(void *)(a1 + 376) + 176), &v57, (uint64_t)v59);
    HIDWORD(v59[0]) = 255;
    if (v7
      || (uint64_t v7 = obj_get(*(void *)(a1 + 392), v57, *(void *)(*(void *)(a1 + 376) + 1344), (int *)v59, 0, 0, 0, 0, (uint64_t *)&v58), v7))
    {
      uint64_t v8 = *(void *)(a1 + 400);
      if (v8 && *(_DWORD *)(v8 + 76)) {
        return v7;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = *(void *)(a1 + 376);
        uint64_t v38 = *(void *)(a1 + 384) + 208;
        uint64_t v39 = *(void *)(v37 + 1344);
        int v40 = *(_DWORD *)(v37 + 176);
        int v41 = "<UNKNOWN>";
        if (a3 == 2) {
          int v41 = "FIXUP";
        }
        *(_DWORD *)int buf = 136316930;
        uint64_t v65 = "nx_checkpoint_traverse";
        if (a3 == 1) {
          int v41 = "START";
        }
        __int16 v66 = 1024;
        int v67 = 925;
        __int16 v68 = 2080;
        uint64_t v69 = v38;
        __int16 v70 = 2048;
        *(void *)uint64_t v71 = v39;
        *(_WORD *)&v71[8] = 1024;
        *(_DWORD *)&v71[10] = v40;
        *(_WORD *)&v71[14] = 1024;
        *(_DWORD *)&v71[16] = 255;
        *(_WORD *)&v71[20] = 2080;
        *(void *)&v71[22] = v41;
        __int16 v72 = 1024;
        int v73 = v7;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s unable to get test object 0x%llx of type 0x%x/0x%x for checkpoint %s traverse: %d\n", buf, 0x42u);
        uint64_t v8 = *(void *)(a1 + 400);
        if (!v8) {
          return v7;
        }
      }
      else if (!v8)
      {
        return v7;
      }
      int v9 = 925;
    }
    else
    {
      uint64_t v7 = obj_checkpoint_traverse(a1, a2, (uint64_t)v58, a3);
      obj_release(v58);
      if (!v7) {
        return v7;
      }
      uint64_t v8 = *(void *)(a1 + 400);
      if (v8)
      {
        if (*(_DWORD *)(v8 + 76)) {
          return v7;
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        int v52 = "<UNKNOWN>";
        uint64_t v53 = *(void *)(a1 + 376);
        uint64_t v54 = *(void *)(a1 + 384) + 208;
        uint64_t v55 = *(void *)(v53 + 1344);
        if (a3 == 2) {
          int v52 = "FIXUP";
        }
        int v56 = *(_DWORD *)(v53 + 176);
        *(_DWORD *)int buf = 136316930;
        uint64_t v65 = "nx_checkpoint_traverse";
        if (a3 == 1) {
          int v52 = "START";
        }
        __int16 v66 = 1024;
        int v67 = 931;
        __int16 v68 = 2080;
        uint64_t v69 = v54;
        __int16 v70 = 2080;
        *(void *)uint64_t v71 = v52;
        *(_WORD *)&v71[8] = 2048;
        *(void *)&v71[10] = v55;
        *(_WORD *)&v71[18] = 1024;
        *(_DWORD *)&v71[20] = v56;
        *(_WORD *)&v71[24] = 1024;
        *(_DWORD *)&v71[26] = 255;
        __int16 v72 = 1024;
        int v73 = v7;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to checkpoint %s traverse test object 0x%llx of type 0x%x/0x%x: %d\n", buf, 0x42u);
        uint64_t v8 = *(void *)(a1 + 400);
        if (!v8) {
          return v7;
        }
      }
      else if (!v8)
      {
        return v7;
      }
      int v9 = 931;
    }
    goto LABEL_13;
  }
  uint64_t v18 = 0;
  while (1)
  {
    unint64_t v19 = *(void *)(v11 + 8 * v18 + 184);
    if (v19) {
      break;
    }
LABEL_55:
    if (++v18 >= (unint64_t)*(unsigned int *)(v11 + 180)) {
      goto LABEL_56;
    }
  }
  uint64_t v20 = obj_get(*(void *)(a1 + 392), 0, v19, (int *)&apfs_desc, 0, 0, 0, 0, (uint64_t *)&v60);
  if (v20)
  {
    uint64_t v7 = v20;
    uint64_t v8 = *(void *)(a1 + 400);
    if (v8 && *(_DWORD *)(v8 + 76)) {
      return v7;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = *(void *)(a1 + 384);
      unint64_t v43 = "<UNKNOWN>";
      uint64_t v65 = "nx_checkpoint_traverse";
      int v67 = 898;
      *(_DWORD *)int buf = 136316674;
      if (a3 == 2) {
        unint64_t v43 = "FIXUP";
      }
      __int16 v66 = 1024;
      __int16 v68 = 2080;
      uint64_t v69 = v42 + 208;
      uint64_t v44 = "START";
      if (a3 != 1) {
        uint64_t v44 = v43;
      }
      __int16 v70 = 1024;
      *(_DWORD *)uint64_t v71 = v18;
      *(_WORD *)&v71[4] = 2048;
      *(void *)&v71[6] = v19;
      *(_WORD *)&v71[14] = 2080;
      *(void *)&v71[16] = v44;
      *(_WORD *)&v71[24] = 1024;
      *(_DWORD *)&v71[26] = v7;
      _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get fs[%d] oid %lld for checkpoint %s traverse: %d\n", buf, 0x3Cu);
      uint64_t v8 = *(void *)(a1 + 400);
      if (!v8) {
        return v7;
      }
    }
    else if (!v8)
    {
      return v7;
    }
    int v9 = 898;
    goto LABEL_13;
  }
  uint64_t v7 = apfs_checkpoint_traverse(a1, a2, (uint64_t)v60, a3);
  obj_release(v60);
  if (!v7)
  {
    uint64_t v11 = *(void *)(a1 + 376);
    goto LABEL_55;
  }
  uint64_t v8 = *(void *)(a1 + 400);
  if (v8 && *(_DWORD *)(v8 + 76)) {
    return v7;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v45 = *(void *)(a1 + 384);
    uint64_t v46 = "<UNKNOWN>";
    uint64_t v65 = "nx_checkpoint_traverse";
    int v67 = 904;
    *(_DWORD *)int buf = 136316418;
    if (a3 == 2) {
      uint64_t v46 = "FIXUP";
    }
    __int16 v66 = 1024;
    __int16 v68 = 2080;
    uint64_t v69 = v45 + 208;
    unint64_t v47 = "START";
    if (a3 != 1) {
      unint64_t v47 = v46;
    }
    __int16 v70 = 1024;
    *(_DWORD *)uint64_t v71 = v18;
    *(_WORD *)&v71[4] = 2080;
    *(void *)&v71[6] = v47;
    *(_WORD *)&v71[14] = 1024;
    *(_DWORD *)&v71[16] = v7;
    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s fs[%d] checkpoint %s traverse failed: %d\n", buf, 0x32u);
    uint64_t v8 = *(void *)(a1 + 400);
    if (!v8) {
      return v7;
    }
LABEL_75:
    int v9 = 904;
    goto LABEL_13;
  }
  if (v8) {
    goto LABEL_75;
  }
  return v7;
}

uint64_t nx_reaper_get(void *a1, atomic_ullong **a2)
{
  uint64_t v3 = (atomic_ullong *)a1[53];
  *a2 = v3;
  if (v3) {
    goto LABEL_2;
  }
  uint64_t result = obj_get(a1[49], 0x80000000, *(void *)(a1[47] + 168), &nx_reaper_desc, 0, 0, 0, 0, a2);
  if (!result)
  {
    a1[53] = *a2;
    uint64_t v3 = *a2;
LABEL_2:
    obj_retain(v3);
    return 0;
  }
  return result;
}

uint64_t nx_reaper_checkpoint_traverse(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a3 + 376);
  unsigned int v49 = 0;
  if (a4 == 2)
  {
    uint64_t v7 = obj_checkpoint_known(a3);
LABEL_5:
    uint64_t v8 = v7;
    if (v7) {
      return v8;
    }
    goto LABEL_6;
  }
  if (a4 == 1)
  {
    uint64_t v7 = obj_checkpoint_start(a3);
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v50 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  int v51 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  if (*(void *)(v6 + 88) && obj_type_is_or_contains_ephemeral(*(_DWORD *)(v6 + 72)))
  {
    uint64_t v8 = 0;
    if ((*(_DWORD *)(v6 + 104) & 0x10) == 0 && (*(_DWORD *)(v6 + 104) & 6) != 2)
    {
      uint64_t v9 = nx_reaper_obj_get(a1, *(_DWORD *)(v6 + 72), *(_DWORD *)(v6 + 76), *(void *)(v6 + 80), *(void *)(v6 + 88), &v49, &v50);
      if (v9)
      {
        uint64_t v8 = v9;
        uint64_t v10 = a1[50];
        if ((!v10 || !*(_DWORD *)(v10 + 76)) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          nx_reaper_checkpoint_traverse_cold_2();
        }
      }
      else
      {
        if (v49) {
          unint64_t v43 = v49;
        }
        else {
          unint64_t v43 = a1;
        }
        uint64_t v8 = obj_checkpoint_traverse((uint64_t)v43, a2, (uint64_t)v50, v4);
        obj_release(v50);
      }
      if (v49)
      {
        obj_release(v49);
        unsigned int v49 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v8) {
    return v8;
  }
  unint64_t v11 = *(void *)(v6 + 48);
  if (!v11) {
    return v8;
  }
  uint64_t v44 = a1 + 48;
  int v46 = *(_DWORD *)(v6 + 68);
  unsigned int v47 = v4;
  do
  {
    uint64_t v12 = obj_get(a1[49], 0x80000000, v11, (int *)&nx_reap_list_desc, 0, 0, 0, 0, (uint64_t *)&v51);
    if (v12)
    {
      uint64_t v8 = v12;
      uint64_t v41 = a1[50];
      if ((!v41 || !*(_DWORD *)(v41 + 76)) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        nx_reaper_checkpoint_traverse_cold_1();
      }
      return v8;
    }
    uint64_t v13 = v51[47];
    if (v4 == 2)
    {
      uint64_t v14 = obj_checkpoint_known((uint64_t)v51);
      goto LABEL_24;
    }
    if (v4 == 1)
    {
      uint64_t v14 = obj_checkpoint_start((uint64_t)v51);
LABEL_24:
      uint64_t v8 = v14;
      goto LABEL_26;
    }
    uint64_t v8 = 0;
LABEL_26:
    unint64_t v48 = *(void *)(v13 + 32);
    if (v8) {
      goto LABEL_59;
    }
    unint64_t v15 = *(unsigned int *)(v13 + 52);
    if (v15 == 0xFFFFFFFF) {
      goto LABEL_59;
    }
    uint64_t v16 = 0xFFFFFFFFLL;
    while (1)
    {
      unint64_t v17 = *(unsigned int *)(v13 + 40 * v15 + 64);
      if (v17 != -1 && v17 > *(unsigned int *)(v13 + 44)) {
        break;
      }
      uint64_t v18 = v13 + 40 * v15;
      int v21 = *(_DWORD *)(v18 + 72);
      uint64_t v20 = (int *)(v18 + 72);
      int v19 = v21;
      if ((v21 != *(_DWORD *)(v6 + 72) || *(void *)(v13 + 40 * v15 + 88) != *(void *)(v6 + 88))
        && (v16 == 0xFFFFFFFFLL
         || v19 != *(_DWORD *)(v13 + 40 * v16 + 72)
         || *(void *)(v13 + 64 + 40 * v15 + 24) != *(void *)(v13 + 64 + 40 * v16 + 24)))
      {
        uint64_t v8 = 0;
        if ((*(_DWORD *)(v13 + 40 * v15 + 68) & 0x10) != 0 || (*(_DWORD *)(v13 + 40 * v15 + 68) & 6) == 2) {
          goto LABEL_51;
        }
        if (obj_type_is_or_contains_ephemeral(v19))
        {
          int v22 = *v20;
          uint64_t v23 = v13 + 40 * v15;
          unint64_t v25 = *(void *)(v23 + 88);
          unint64_t v24 = (void *)(v23 + 88);
          uint64_t v26 = nx_reaper_obj_get(a1, v22, *((_DWORD *)v24 - 3), *(v24 - 1), v25, &v49, &v50);
          if (v26)
          {
            uint64_t v8 = v26;
            uint64_t v27 = a1[50];
            if ((!v27 || !*(_DWORD *)(v27 + 76)) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              uint64_t v28 = *v44 + 208;
              uint64_t v29 = *v24;
              *(_DWORD *)int buf = 136316162;
              uint64_t v53 = "nx_reaper_checkpoint_traverse";
              __int16 v54 = 1024;
              int v55 = 1287;
              __int16 v56 = 2080;
              uint64_t v57 = v28;
              __int16 v58 = 2048;
              *(void *)BOOL v59 = v29;
              *(_WORD *)&v59[8] = 1024;
              int v60 = v8;
              _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get object oid %lld: %d\n", buf, 0x2Cu);
            }
          }
          else
          {
            if (v49) {
              char v30 = v49;
            }
            else {
              char v30 = a1;
            }
            uint64_t v8 = obj_checkpoint_traverse((uint64_t)v30, a2, (uint64_t)v50, v47);
            obj_release(v50);
          }
          if (v49)
          {
            obj_release(v49);
            unsigned int v49 = 0;
          }
          goto LABEL_51;
        }
      }
      uint64_t v8 = 0;
LABEL_51:
      if (!v8)
      {
        uint64_t v16 = v15;
        unint64_t v15 = v17;
        if (v17 != 0xFFFFFFFF) {
          continue;
        }
      }
      goto LABEL_59;
    }
    uint64_t v31 = a1[50];
    unint64_t v32 = &_os_log_internal;
    if ((!v31 || !*(_DWORD *)(v31 + 76)) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = *v44 + 208;
      *(_DWORD *)int buf = 136316162;
      uint64_t v53 = "nx_reaper_checkpoint_traverse";
      __int16 v54 = 1024;
      int v55 = 1249;
      __int16 v56 = 2080;
      uint64_t v57 = v40;
      __int16 v58 = 1024;
      *(_DWORD *)BOOL v59 = v15;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = v17;
      _os_log_error_impl(&dword_22CAAC000, v32, OS_LOG_TYPE_ERROR, "%s:%d: %s Invalid reap list entry nrl_entries[%d].nrle_next = %d\n", buf, 0x28u);
    }
    obj_release(v51);
    uint64_t v8 = nx_corruption_detected_int((uint64_t)a1, (uint64_t)"nx_reaper_checkpoint_traverse", 1252);
LABEL_59:
    int v33 = *(_DWORD *)(v6 + 68);
    if (v33)
    {
      int v34 = v46 - 1;
      unint64_t v11 = v48;
      if (v48 && v46 == 1)
      {
        uint64_t v35 = a1[50];
        if ((!v35 || !*(_DWORD *)(v35 + 76)) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = *v44 + 208;
          *(_DWORD *)int buf = 136315906;
          uint64_t v53 = "nx_reaper_checkpoint_traverse";
          __int16 v54 = 1024;
          int v55 = 1303;
          __int16 v56 = 2080;
          uint64_t v57 = v39;
          __int16 v58 = 1024;
          *(_DWORD *)BOOL v59 = v33;
          _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s reap list expected %u objects, but haven't seen last reap list object yet\n", buf, 0x22u);
        }
        uint64_t v8 = nx_corruption_detected_int((uint64_t)a1, (uint64_t)"nx_reaper_checkpoint_traverse", 1305);
        int v46 = 0;
      }
      else
      {
        --v46;
        if (!v48)
        {
          if (v34)
          {
            uint64_t v36 = a1[50];
            if (!v36 || !*(_DWORD *)(v36 + 76))
            {
              uint64_t v37 = &_os_log_internal;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v38 = *v44 + 208;
                *(_DWORD *)int buf = 136316162;
                uint64_t v53 = "nx_reaper_checkpoint_traverse";
                __int16 v54 = 1024;
                int v55 = 1308;
                __int16 v56 = 2080;
                uint64_t v57 = v38;
                __int16 v58 = 1024;
                *(_DWORD *)BOOL v59 = v33;
                *(_WORD *)&v59[4] = 1024;
                *(_DWORD *)&v59[6] = v46;
                _os_log_impl(&dword_22CAAC000, v37, OS_LOG_TYPE_DEFAULT, "%s:%d: %s reap list expected %u objects, but got last reap list object with %u more objects left\n", buf, 0x28u);
              }
            }
          }
        }
      }
    }
    else
    {
      unint64_t v11 = v48;
    }
    obj_release(v51);
    LODWORD(v4) = v47;
  }
  while (!v8 && v11);
  return v8;
}

uint64_t nx_reaper_init_phys(uint64_t a1, int a2)
{
  *(void *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 64) = 1;
  *(_DWORD *)(a1 + 108) = (a2 & 0xFFFFFFFC) - 112;
  return 0;
}

uint64_t nx_reaper_init(void *a1)
{
  uint64_t v2 = a1[7];
  unint64_t v4 = *(void *)(v2 + 32);
  unint64_t v3 = *(void *)(v2 + 40);
  unint64_t v5 = *(unsigned int *)(v2 + 108);
  unint64_t v6 = (obj_size_phys((uint64_t)a1) & 0xFFFFFFFCLL) - 112;
  if (v3 < v4) {
    int v7 = 1;
  }
  else {
    int v7 = 2;
  }
  if (v6 >= v5) {
    BOOL v8 = v3 >= v4;
  }
  else {
    BOOL v8 = v7;
  }
  int v9 = *(_DWORD *)(v2 + 68);
  if (v9 == 1)
  {
    BOOL v10 = *(void *)(v2 + 48) == *(void *)(v2 + 56);
  }
  else
  {
    if (v9)
    {
      if (v8) {
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (*(void *)(v2 + 48)) {
      goto LABEL_19;
    }
    BOOL v10 = *(void *)(v2 + 56) == 0;
  }
  if (!v10 || v8)
  {
LABEL_19:
    uint64_t result = nx_corruption_detected_int(*(void *)(*a1 + 392), (uint64_t)"nx_reaper_sanity_check", 979);
    if (result) {
      return result;
    }
  }
LABEL_20:
  a1[47] = v2;
  unsigned int v13 = obj_size_phys((uint64_t)a1);
  uint64_t result = 0;
  a1[48] = v2 + v13 - *(unsigned int *)(v2 + 108);
  return result;
}

uint64_t nx_reap_list_init_phys(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = ((unint64_t)a2 - 64) / 0x28;
  *(_DWORD *)(a1 + 44) = v2;
  *(void *)(a1 + 52) = -1;
  *(_DWORD *)(a1 + 60) = 0;
  uint64_t v3 = (v2 - 1);
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = (_DWORD *)(a1 + 64);
    do
    {
      *unint64_t v5 = ++v4;
      v5 += 10;
    }
    while (v3 != v4);
  }
  else
  {
    LODWORD(v3) = 0;
  }
  *(_DWORD *)(a1 + 40 * v3 + 64) = -1;
  return 0;
}

uint64_t nx_reap_list_init(void *a1)
{
  unint64_t v2 = (_DWORD *)a1[7];
  unsigned int v3 = v2[11];
  BOOL v4 = v3 > (((unint64_t)obj_size_phys((uint64_t)a1) - 64) / 0x28);
  unsigned int v6 = v2[11];
  unsigned int v5 = v2[12];
  if (v4) {
    int v7 = 2;
  }
  else {
    int v7 = 1;
  }
  if (v5 <= v6) {
    int v8 = v4;
  }
  else {
    int v8 = v7;
  }
  unsigned int v9 = v2[13];
  unsigned int v10 = v2[14];
  if (v9 != -1 && v9 >= v6) {
    ++v8;
  }
  if (v10 != -1 && v10 >= v6) {
    ++v8;
  }
  unsigned int v13 = v2[15];
  if (v13 != -1 && v13 >= v6) {
    int v15 = v8 + 1;
  }
  else {
    int v15 = v8;
  }
  if (v5 == 1)
  {
    BOOL v16 = v9 == v10;
  }
  else
  {
    if (v5)
    {
      if (v15) {
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    BOOL v16 = v9 == -1 && v10 == -1;
  }
  if (!v16 || v15 != 0)
  {
LABEL_36:
    uint64_t result = nx_corruption_detected_int(*(void *)(*a1 + 392), (uint64_t)"nx_reap_list_sanity_check", 1045);
    if (result) {
      return result;
    }
  }
LABEL_37:
  uint64_t result = 0;
  a1[47] = v2;
  return result;
}

uint64_t nx_reaper_obj_get(uint64_t *a1, int a2, int a3, unint64_t a4, unint64_t a5, uint64_t **a6, atomic_ullong **a7)
{
  int v21 = 0;
  unsigned int v20 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  *a7 = 0;
  *a6 = 0;
  if (a4)
  {
    uint64_t v13 = obj_get(a1[49], 0, a4, (int *)&apfs_desc, 0, 0, 0, 0, (uint64_t *)&v21);
    if (v13)
    {
      uint64_t v14 = v13;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        nx_reaper_obj_get_cold_2();
      }
      return v14;
    }
    int v15 = v21;
  }
  else
  {
    int v15 = 0;
  }
  *a6 = v15;
  if ((a2 & 0x4000FFFF) == 0x4000000B)
  {
    uint64_t v16 = (uint64_t)(v15 ? v15 : a1);
    if (!omap_obj_get(v16, 0, 0, a7)) {
      return 0;
    }
  }
  uint64_t v14 = obj_descriptor_and_flags_for_type(a2, &v20, (uint64_t)&v18);
  if (v14
    || (LODWORD(v19) = a3,
        uint64_t v14 = obj_get(a1[49], v20, a5, (int *)&v18, 0, (uint64_t)v21, 0, 0, (uint64_t *)a7),
        v14))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_obj_get_cold_1();
    }
    if (v21) {
      obj_release(v21);
    }
    *a7 = 0;
    *a6 = 0;
  }
  return v14;
}

uint64_t nx_reaper_add(void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, void *a8)
{
  uint64_t v45 = 0;
  memset(v46, 170, sizeof(v46));
  uint64_t v16 = nx_reaper_get(a1, (atomic_ullong **)&v46[2]);
  if (v16) {
    return v16;
  }
  uint64_t v17 = *(void *)(v46[2] + 376);
  uint64_t v16 = obj_descriptor_funcs_for_type(a2, &v45);
  if (v16) {
    goto LABEL_3;
  }
  if (!*(void *)(v45 + 24))
  {
    uint64_t v16 = 22;
LABEL_3:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_add_cold_1();
    }
    goto LABEL_9;
  }
  obj_lock(v46[2], 2);
  uint64_t v18 = obj_modify(v46[2], 0, a6);
  if (v18)
  {
    uint64_t v16 = v18;
LABEL_8:
    obj_unlock(v46[2], 2);
LABEL_9:
    obj_release(v46[2]);
    return v16;
  }
  uint64_t v20 = a1[49];
  if (*(_OWORD *)(v17 + 48) == 0)
  {
    uint64_t v21 = obj_create(v20, 0x80000000, 0, (int)&nx_reap_list_desc, 0, 0, a6, (uint64_t)&v46[1]);
    if (v21)
    {
      uint64_t v16 = v21;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        nx_reaper_add_cold_4();
      }
      goto LABEL_8;
    }
    uint64_t v23 = obj_oid(v46[1]);
    *(void *)(v17 + 48) = v23;
    *(void *)(v17 + 56) = v23;
    unint64_t v24 = (_DWORD *)(v17 + 68);
    goto LABEL_20;
  }
  uint64_t v22 = obj_get(v20, 2147483649, *(void *)(v17 + 56), &nx_reap_list_desc, 0, 0, 0, a6, &v46[1]);
  if (v22)
  {
    uint64_t v16 = v22;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_add_cold_5();
    }
    goto LABEL_8;
  }
  unint64_t v24 = (_DWORD *)(v17 + 68);
  if (!*(_DWORD *)(v17 + 68) && *(void *)(v17 + 48) == *(void *)(v17 + 56))
  {
LABEL_20:
    _DWORD *v24 = 1;
    obj_dirty(v46[2], a6, 0);
  }
  unint64_t v25 = *(_DWORD **)(v46[1] + 376);
  if (v25[12] > (v25[11] - 2))
  {
    uint64_t v26 = obj_create(a1[49], 0x80000000, 0, (int)&nx_reap_list_desc, 0, 0, a6, (uint64_t)v46);
    if (v26)
    {
      uint64_t v16 = v26;
      obj_unlock(v46[2], 2);
      obj_release(v46[1]);
      goto LABEL_9;
    }
    uint64_t v27 = obj_oid(v46[0]);
    *(void *)(*(void *)(v46[1] + 376) + 32) = v27;
    *(void *)(v17 + 56) = obj_oid(v46[0]);
    int v28 = *(_DWORD *)(v17 + 68);
    if (v28) {
      *(_DWORD *)(v17 + 68) = v28 + 1;
    }
    obj_dirty(v46[2], a6, 0);
    obj_release(v46[1]);
    v46[1] = v46[0];
    unint64_t v25 = *(_DWORD **)(v46[0] + 376);
  }
  uint64_t v29 = *(void *)(v17 + 32);
  *(void *)(v17 + 32) = v29 + 1;
  int v30 = v25[15];
  if (v30 == -1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_add_cold_2();
    }
    obj_unlock(v46[2], 2);
    obj_release(v46[1]);
    obj_release(v46[2]);
    uint64_t v43 = (uint64_t)a1;
    int v44 = 1431;
    return nx_corruption_detected_int(v43, (uint64_t)"nx_reaper_add", v44);
  }
  uint64_t v31 = &v25[10 * v30];
  int v34 = v31[16];
  unint64_t v32 = v31 + 16;
  int v33 = v34;
  v25[15] = v34;
  int v35 = v25[14];
  if (v35 != -1) {
    v25[10 * v35 + 16] = v30;
  }
  if (v25[13] == -1) {
    v25[13] = v30;
  }
  v25[14] = v30;
  int v36 = v25[12];
  v25[12] = v36 + 1;
  *unint64_t v32 = -1;
  uint64_t v37 = &v25[10 * v30];
  if ((a7 & 2) != 0) {
    int v38 = 21;
  }
  else {
    int v38 = 5;
  }
  v37[17] = v38;
  v37[18] = a2;
  v37[19] = a3;
  *((void *)v37 + 10) = a4;
  *((void *)v37 + 11) = a5;
  *((void *)v37 + 12) = a6;
  if (v33 == -1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_add_cold_3();
    }
    obj_unlock(v46[2], 2);
    obj_release(v46[1]);
    obj_release(v46[2]);
    uint64_t v43 = (uint64_t)a1;
    int v44 = 1462;
    return nx_corruption_detected_int(v43, (uint64_t)"nx_reaper_add", v44);
  }
  uint64_t v39 = &v25[10 * v33];
  int v40 = v39[16];
  *unint64_t v32 = v33;
  v25[14] = v33;
  v25[15] = v40;
  v25[12] = v36 + 2;
  if ((a7 & 2) != 0) {
    int v41 = 19;
  }
  else {
    int v41 = 3;
  }
  if (a7) {
    v41 |= 0xCu;
  }
  v39[16] = -1;
  v39[17] = v41;
  v39[18] = a2;
  v39[19] = a3;
  *((void *)v39 + 10) = a4;
  *((void *)v39 + 11) = a5;
  *((void *)v39 + 12) = v29;
  obj_dirty(v46[1], a6, 0);
  obj_unlock(v46[2], 2);
  obj_release(v46[1]);
  obj_release(v46[2]);
  if (!a8) {
    return 0;
  }
  uint64_t v42 = v29;
  uint64_t v16 = 0;
  *a8 = v42;
  return v16;
}

uint64_t nx_reaper_add_sub_object(void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v39 = 0;
  memset(v40, 170, sizeof(v40));
  uint64_t v14 = nx_reaper_get(a1, (atomic_ullong **)&v40[2]);
  if (v14) {
    return v14;
  }
  uint64_t v15 = *(void *)(v40[2] + 376);
  uint64_t v14 = obj_descriptor_funcs_for_type(a2, &v39);
  if (v14) {
    goto LABEL_3;
  }
  if (!*(void *)(v39 + 24))
  {
    uint64_t v14 = 22;
LABEL_3:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_add_sub_object_cold_1();
    }
    goto LABEL_17;
  }
  obj_lock(v40[2], 2);
  uint64_t v16 = obj_modify(v40[2], 0, a6);
  if (v16)
  {
    uint64_t v14 = v16;
LABEL_16:
    obj_unlock(v40[2], 2);
LABEL_17:
    obj_release(v40[2]);
    return v14;
  }
  uint64_t v17 = *(void *)(v15 + 48);
  if (!v17 && !*(void *)(v15 + 56))
  {
    uint64_t v21 = obj_create(a1[49], 0x80000000, 0, (int)&nx_reap_list_desc, 0, 0, a6, (uint64_t)&v40[1]);
    if (v21)
    {
      uint64_t v14 = v21;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        nx_reaper_add_sub_object_cold_5();
      }
      goto LABEL_14;
    }
    uint64_t v22 = obj_oid(v40[1]);
    *(void *)(v15 + 48) = v22;
    *(void *)(v15 + 56) = v22;
    uint64_t v20 = (_DWORD *)(v15 + 68);
    goto LABEL_26;
  }
  uint64_t v18 = obj_get(a1[49], 2147483649, v17, &nx_reap_list_desc, 0, 0, 0, a6, &v40[1]);
  if (v18)
  {
    uint64_t v14 = v18;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_add_sub_object_cold_6();
    }
LABEL_14:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_add_sub_object_cold_4();
    }
    goto LABEL_16;
  }
  uint64_t v20 = (_DWORD *)(v15 + 68);
  if (!*(_DWORD *)(v15 + 68) && *(void *)(v15 + 48) == *(void *)(v15 + 56))
  {
LABEL_26:
    *uint64_t v20 = 1;
    obj_dirty(v40[2], a6, 0);
  }
  uint64_t v23 = *(_DWORD **)(v40[1] + 376);
  if (v23[12] > v23[11] + ~(a7 & 1u))
  {
    uint64_t v24 = obj_create(a1[49], 0x80000000, 0, (int)&nx_reap_list_desc, 0, 0, a6, (uint64_t)v40);
    if (v24)
    {
      uint64_t v14 = v24;
      obj_unlock(v40[2], 2);
      obj_release(v40[1]);
      goto LABEL_17;
    }
    uint64_t v25 = v40[0];
    *(void *)(*(void *)(v40[0] + 376) + 32) = *(void *)(v15 + 48);
    *(void *)(v15 + 48) = obj_oid(v25);
    int v26 = *(_DWORD *)(v15 + 68);
    if (v26) {
      *(_DWORD *)(v15 + 68) = v26 + 1;
    }
    obj_dirty(v40[2], a6, 0);
    obj_release(v40[1]);
    v40[1] = v40[0];
    uint64_t v23 = *(_DWORD **)(v40[0] + 376);
  }
  int v27 = v23[15];
  if (a7)
  {
    if (v27 == -1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        nx_reaper_add_sub_object_cold_3();
      }
      obj_unlock(v40[2], 2);
      obj_release(v40[1]);
      obj_release(v40[2]);
      uint64_t v37 = (uint64_t)a1;
      int v38 = 1612;
      return nx_corruption_detected_int(v37, (uint64_t)"nx_reaper_add_sub_object", v38);
    }
    int v28 = &v23[10 * v27];
    int v29 = v28[16];
    v23[15] = v29;
    int v30 = v23[14];
    v28[16] = v23[13];
    v23[13] = v27;
    if (v30 == -1) {
      v23[14] = v27;
    }
    ++v23[12];
    uint64_t v31 = &v23[10 * v27];
    if ((a7 & 2) != 0) {
      int v32 = 29;
    }
    else {
      int v32 = 13;
    }
    v31[17] = v32;
    v31[18] = a2;
    v31[19] = a3;
    *((void *)v31 + 10) = a4;
    *((void *)v31 + 11) = a5;
    *((void *)v31 + 12) = a6;
    int v27 = v29;
  }
  if (v27 == -1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_add_sub_object_cold_2();
    }
    obj_unlock(v40[2], 2);
    obj_release(v40[1]);
    obj_release(v40[2]);
    uint64_t v37 = (uint64_t)a1;
    int v38 = 1640;
    return nx_corruption_detected_int(v37, (uint64_t)"nx_reaper_add_sub_object", v38);
  }
  int v33 = &v23[10 * v27];
  v23[15] = v33[16];
  int v34 = v23[14];
  v33[16] = v23[13];
  v23[13] = v27;
  if (v34 == -1) {
    v23[14] = v27;
  }
  ++v23[12];
  int v35 = &v23[10 * v27];
  if ((a7 & 2) != 0) {
    int v36 = 21;
  }
  else {
    int v36 = 5;
  }
  v35[17] = v36;
  v35[18] = a2;
  v35[19] = a3;
  *((void *)v35 + 10) = a4;
  *((void *)v35 + 11) = a5;
  *((void *)v35 + 12) = a6;
  obj_dirty(v40[1], a6, 0);
  obj_unlock(v40[2], 2);
  obj_release(v40[1]);
  obj_release(v40[2]);
  return 0;
}

void nx_reaper_check_for_work(uint64_t *a1)
{
  unsigned int v5 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  unsigned int v6 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  if (!nx_reaper_get(a1, &v6))
  {
    atomic_ullong v2 = v6[47];
    obj_lock((uint64_t)v6, 2);
    if (!*(void *)(v2 + 88))
    {
      unint64_t v3 = *(void *)(v2 + 48);
      if (!v3
        || obj_get(a1[49], 0x80000000, v3, (int *)&nx_reap_list_desc, 0, 0, 0, 0, (uint64_t *)&v5))
      {
        goto LABEL_4;
      }
      uint64_t v4 = v5[47];
      if (!*(_DWORD *)(v4 + 48) && !*(void *)(v4 + 32))
      {
        obj_release(v5);
        goto LABEL_4;
      }
      obj_release(v5);
    }
    obj_unlock((uint64_t)v6, 2);
    nx_reaper(a1);
    obj_lock((uint64_t)v6, 2);
LABEL_4:
    obj_unlock((uint64_t)v6, 2);
    obj_release(v6);
  }
}

uint64_t nx_reaper(uint64_t *a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  unint64_t v28 = 0;
  int v29 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  int v26 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v27 = 0;
  uint64_t v25 = 0;
  uint64_t result = nx_reaper_get(a1, &v29);
  if (result) {
    return result;
  }
  atomic_ullong v3 = v29[47];
  obj_lock((uint64_t)v29, 2);
  uint64_t v4 = v29;
  if (*((_DWORD *)v29 + 98) || *((_DWORD *)v29 + 99))
  {
    obj_unlock((uint64_t)v29, 2);
    obj_release(v29);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      nx_reaper_cold_1();
    }
    return 16;
  }
  int v5 = 0;
  *((_DWORD *)v29 + 98) = 1;
  unsigned int v6 = &_os_log_internal;
  while (1)
  {
    unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    obj_unlock((uint64_t)v4, 2);
    unint64_t v28 = 0;
    unsigned int v7 = tx_enter((uint64_t)a1, (uint64_t *)&v28);
    obj_lock((uint64_t)v29, 2);
    uint64_t v4 = v29;
    if (v7)
    {
LABEL_43:
      int v22 = 0;
      goto LABEL_47;
    }
    unsigned int v8 = obj_modify(v29, 0, v28);
    uint64_t v4 = v29;
    if (v8)
    {
      unsigned int v7 = v8;
LABEL_46:
      int v22 = 1;
      goto LABEL_47;
    }
    if (*(void *)(v3 + 88)) {
      goto LABEL_15;
    }
    if (*((_DWORD *)v29 + 99)) {
      goto LABEL_45;
    }
    unsigned int record = nx_reaper_next_record((uint64_t)a1, (uint64_t)v29, v28);
    if (record) {
      break;
    }
    uint64_t v4 = v29;
    if (!*(void *)(v3 + 88))
    {
LABEL_45:
      unsigned int v7 = 0;
      goto LABEL_46;
    }
LABEL_15:
    obj_unlock((uint64_t)v4, 2);
    if ((*(unsigned char *)(v3 + 104) & 4) == 0) {
      goto LABEL_20;
    }
    int v10 = obj_descriptor_funcs_for_type(*(_DWORD *)(v3 + 72), &v27);
    if (v10) {
      goto LABEL_17;
    }
    if (!*(void *)(v27 + 24))
    {
      int v10 = 22;
LABEL_17:
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = a1[48] + 208;
        int v18 = *(_DWORD *)(v3 + 72);
        *(_DWORD *)int buf = 136316162;
        uint64_t v31 = "nx_reaper";
        __int16 v32 = 1024;
        int v33 = 1833;
        __int16 v34 = 2080;
        uint64_t v35 = v17;
        __int16 v36 = 1024;
        *(_DWORD *)uint64_t v37 = v18;
        *(_WORD *)&unsigned char v37[4] = 1024;
        *(_DWORD *)&v37[6] = v10;
        _os_log_error_impl(&dword_22CAAC000, v6, OS_LOG_TYPE_ERROR, "%s:%d: %s object type 0x%x not reapable?: %d\n", buf, 0x28u);
      }
      int v5 = 1;
LABEL_20:
      obj_lock((uint64_t)v29, 2);
      goto LABEL_21;
    }
    int v11 = nx_reaper_obj_get(a1, *(_DWORD *)(v3 + 72), *(_DWORD *)(v3 + 76), *(void *)(v3 + 80), *(void *)(v3 + 88), &v25, &v26);
    if (v11)
    {
      int v12 = v11;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = a1[48] + 208;
        uint64_t v14 = *(void *)(v3 + 88);
        int v15 = *(_DWORD *)(v3 + 72);
        *(_DWORD *)int buf = 136316418;
        uint64_t v31 = "nx_reaper";
        __int16 v32 = 1024;
        int v33 = 1838;
        __int16 v34 = 2080;
        uint64_t v35 = v13;
        __int16 v36 = 2048;
        *(void *)uint64_t v37 = v14;
        *(_WORD *)&v37[8] = 1024;
        int v38 = v15;
        __int16 v39 = 1024;
        int v40 = v12;
        _os_log_error_impl(&dword_22CAAC000, v6, OS_LOG_TYPE_ERROR, "%s:%d: %s unable to get object 0x%llx of type 0x%x: %d\n", buf, 0x32u);
      }
    }
    else
    {
      if ((*(unsigned char *)(v3 + 64) & 2) == 0) {
        bzero((void *)v29[48], *(unsigned int *)(v3 + 108));
      }
      int v16 = (*(uint64_t (**)(atomic_ullong *, void, atomic_ullong, void, unint64_t))(v27 + 24))(v26, (*(_DWORD *)(v3 + 104) >> 3) & 3, v29[48], *(unsigned int *)(v3 + 108), v28);
      int v12 = v16;
      if (v16 && v16 != 36 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = a1[48] + 208;
        uint64_t v20 = *(void *)(v3 + 88);
        int v21 = *(_DWORD *)(v3 + 72);
        *(_DWORD *)int buf = 136316418;
        uint64_t v31 = "nx_reaper";
        __int16 v32 = 1024;
        int v33 = 1852;
        __int16 v34 = 2080;
        uint64_t v35 = v19;
        __int16 v36 = 2048;
        *(void *)uint64_t v37 = v20;
        *(_WORD *)&v37[8] = 1024;
        int v38 = v21;
        __int16 v39 = 1024;
        int v40 = v12;
        _os_log_error_impl(&dword_22CAAC000, v6, OS_LOG_TYPE_ERROR, "%s:%d: %s error reaping object 0x%llx of type 0x%x: %d\n", buf, 0x32u);
      }
      obj_release(v26);
      if (v25)
      {
        obj_release(v25);
        uint64_t v25 = 0;
      }
    }
    obj_lock((uint64_t)v29, 2);
    if (v12 == 36)
    {
      *(_DWORD *)(v3 + 64) |= 2u;
      int v5 = 1;
      goto LABEL_24;
    }
    int v5 = 1;
LABEL_21:
    if ((*(unsigned char *)(v3 + 104) & 2) != 0) {
      *(void *)(v3 + 40) = *(void *)(v3 + 96);
    }
    *(_DWORD *)(v3 + 64) &= ~2u;
    *(void *)(v3 + 88) = 0;
LABEL_24:
    obj_dirty((uint64_t)v29, v28, 0);
    obj_unlock((uint64_t)v29, 2);
    spaceman_currently_available_space((uint64_t)a1, &v24, &v23, 0, 0);
    unsigned int v7 = tx_leave((uint64_t)a1, v28, (v23 < 0x3E8) | (4 * (v23 < 0x7D0)));
    obj_lock((uint64_t)v29, 2);
    uint64_t v4 = v29;
    if (v7) {
      goto LABEL_43;
    }
    if (*((_DWORD *)v29 + 99))
    {
      int v22 = 0;
      unsigned int v7 = 0;
      goto LABEL_47;
    }
  }
  unsigned int v7 = record;
  int v22 = 1;
  uint64_t v4 = v29;
LABEL_47:
  *((_DWORD *)v4 + 98) = 0;
  obj_unlock((uint64_t)v4, 2);
  obj_release(v29);
  if (v22) {
    tx_leave((uint64_t)a1, v28, 0);
  }
  if (v7 | v5) {
    return v7;
  }
  else {
    return 2;
  }
}

void nx_reaper_shut_down(void *a1)
{
  uint64_t v4 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  if (!nx_reaper_get(a1, &v4))
  {
    obj_lock((uint64_t)v4, 2);
    atomic_ullong v2 = v4;
    ++*((_DWORD *)v4 + 99);
    obj_unlock((uint64_t)v2, 2);
    atomic_ullong v3 = (uint64_t *)a1[53];
    if (v3)
    {
      obj_release(v3);
      a1[53] = 0;
    }
    obj_release(v4);
  }
}

uint64_t nx_reaper_wait(uint64_t *a1, unint64_t a2)
{
  unsigned int v8 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = nx_reaper_get(a1, &v8);
  if (!v4)
  {
    atomic_ullong v5 = v8[7];
    obj_lock((uint64_t)v8, 2);
    unint64_t v6 = *(void *)(v5 + 32);
    if (a2 == -1) {
      a2 = v6 - 1;
    }
    if (a2 >= v6)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        nx_reaper_wait_cold_1();
      }
      uint64_t v4 = 22;
    }
    else
    {
      while (*(void *)(v5 + 40) < a2)
      {
        obj_unlock((uint64_t)v8, 2);
        uint64_t v4 = nx_reaper(a1);
        obj_lock((uint64_t)v8, 2);
        if (v4) {
          goto LABEL_12;
        }
      }
      uint64_t v4 = 0;
    }
LABEL_12:
    obj_unlock((uint64_t)v8, 2);
    obj_release(v8);
  }
  return v4;
}

uint64_t extent_list_key_cmp(uint64_t a1, void *a2, int a3, void *a4, int a5, int *a6)
{
  uint64_t result = 22;
  if (a3 == 8 && a5 == 8)
  {
    uint64_t result = 0;
    int v7 = *a2 > *a4;
    if (*a2 < *a4) {
      int v7 = -1;
    }
    *a6 = v7;
  }
  return result;
}

uint64_t nx_metadata_fragmented_extent_list_tree_get(uint64_t a1, uint64_t a2, atomic_ullong **a3)
{
  if (!a2) {
    return 22;
  }
  for (uint64_t i = 432; i != 464; i += 8)
  {
    int v7 = *(atomic_ullong **)(a1 + i);
    if (v7 && obj_oid(*(void *)(a1 + i)) == a2)
    {
      obj_retain(v7);
      uint64_t v12 = 0;
      *a3 = v7;
      return v12;
    }
  }
  obj_lock(a1, 2);
  uint64_t v8 = 0;
  int v9 = -1;
  do
  {
    uint64_t v10 = a1 + 8 * v8;
    int v11 = *(atomic_ullong **)(v10 + 432);
    if (v11)
    {
      if (obj_oid(*(void *)(v10 + 432)) == a2)
      {
        obj_retain(v11);
        *a3 = v11;
        obj_unlock(a1, 2);
        return 0;
      }
    }
    else if (v9 == -1)
    {
      int v9 = v8;
    }
    ++v8;
  }
  while (v8 != 4);
  if (a2 < 0)
  {
    uint64_t v12 = btree_get(a1, 2281701376, a2 & 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, 10, extent_list_key_cmp, 0, a3);
  }
  else
  {
    uint64_t v12 = btree_get(a1, 0x40000000, a2, 0, 0, 0, 10, extent_list_key_cmp, 0, a3);
    if (!v12 && v9 != -1)
    {
      *(void *)(a1 + 8 * v9 + 432) = *a3;
      obj_retain(*a3);
      uint64_t v12 = 0;
    }
  }
  obj_unlock(a1, 2);
  return v12;
}

uint64_t nx_metadata_fragmented_sanity_check(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v19 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v14[2] = v5;
  v14[3] = v5;
  v14[0] = v5;
  v14[1] = v5;
  uint64_t v6 = nx_metadata_fragmented_extent_list_tree_get(a1, a2, &v19);
  if (!v6)
  {
    unint64_t v18 = 0;
    bt_iterator_init((uint64_t)v14, v19, 0, 0, &v18, 8, 8u, &v16, 0x10u);
    uint64_t v6 = v7;
    if (!v7)
    {
      uint64_t v9 = 0;
      do
      {
        if (bt_iterator_ended((uint64_t)v14))
        {
          if (a3 == v9) {
            uint64_t v6 = 0;
          }
          else {
            uint64_t v6 = nx_corruption_detected_int(a1, (uint64_t)"nx_metadata_fragmented_sanity_check", 2451);
          }
          goto LABEL_3;
        }
        if (v18 == v9) {
          uint64_t v6 = 0;
        }
        else {
          uint64_t v6 = nx_corruption_detected_int(a1, (uint64_t)"nx_metadata_fragmented_sanity_check", 2431);
        }
        if (nx_superblock_sanity_check_extent(*(void *)(a1 + 376), 0, v16, v17, 0)) {
          uint64_t v6 = nx_corruption_detected_int(a1, (uint64_t)"nx_metadata_fragmented_sanity_check", 2435);
        }
        unint64_t v10 = v17;
        if (v17 > (unint64_t)a3 - v9)
        {
          uint64_t v6 = nx_corruption_detected_int(a1, (uint64_t)"nx_metadata_fragmented_sanity_check", 2439);
          unint64_t v10 = v17;
        }
        if (v6) {
          goto LABEL_3;
        }
        v9 += v10;
        uint64_t v11 = bt_iterator_next((uint64_t)v14);
      }
      while (!v11);
      uint64_t v6 = v11;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 384) + 208;
        uint64_t v13 = strerror(v6);
        *(_DWORD *)int buf = 136316162;
        int v21 = "nx_metadata_fragmented_sanity_check";
        __int16 v22 = 1024;
        int v23 = 2445;
        __int16 v24 = 2080;
        uint64_t v25 = v12;
        __int16 v26 = 2080;
        uint64_t v27 = v13;
        __int16 v28 = 1024;
        int v29 = v6;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get next extent in metadata fragmented extent list tree, error %s(%d)\n", buf, 0x2Cu);
      }
    }
LABEL_3:
    obj_release(v19);
  }
  return v6;
}

uint64_t nx_metadata_fragmented_block_address_lookup(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t v16 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = nx_metadata_fragmented_extent_list_tree_get(a1, a2, &v16);
  if (!v8)
  {
    unint64_t v15 = a3;
    unsigned int v11 = 16;
    unsigned int v12 = 8;
    uint64_t v8 = bt_lookup_variant(v16, 0, &v15, &v12, 8u, &v13, &v11, 1u, 0, 0);
    if (!v8)
    {
      unint64_t v9 = v14 - (a3 - v15);
      if (v14 <= a3 - v15)
      {
        uint64_t v8 = 2;
      }
      else
      {
        *a4 = v13 + a3 - v15;
        uint64_t v8 = 0;
        if (a5) {
          *a5 = v9;
        }
      }
    }
    obj_release(v16);
  }
  return v8;
}

uint64_t nx_metadata_range_overlap_check(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = *(void *)(a1 + 480);
  if (!v8)
  {
    unint64_t v15 = a2;
    unsigned int v12 = 8;
    unsigned int v11 = 16;
    LODWORD(result) = bt_lookup_variant(*(atomic_ullong **)(a1 + 464), 0, &v15, &v12, 8u, &v13, &v11, 1u, 0, 0);
    if (result || (unint64_t v10 = v15, a2 - v15 >= v14))
    {
      if (result == 2) {
        uint64_t result = 0;
      }
      else {
        uint64_t result = result;
      }
      if (a3 < 2 || result) {
        return result;
      }
      unint64_t v15 = a2;
      unsigned int v11 = 16;
      unsigned int v12 = 8;
      LODWORD(result) = bt_lookup_variant(*(atomic_ullong **)(a1 + 464), 0, &v15, &v12, 8u, &v13, &v11, 4u, 0, 0);
      if (result || (unint64_t v10 = v15, v15 - a2 >= a3))
      {
        if (result == 2) {
          return 0;
        }
        else {
          return result;
        }
      }
    }
    if (a4) {
      *a4 = v10;
    }
    return 17;
  }
  if (calc_overlap_range(*(void *)(a1 + 472), v8, a2, a3, a4)) {
    return 17;
  }
  if ((((uint64_t)0xBFFFFFFFFFFFFFFFLL >> __clz(__rbit64(*(unsigned int *)(*(void *)(a1 + 376) + 36)))) & a2) == 0)
  {
    if (a4) {
      *a4 = a2;
    }
    return 17;
  }
  return 0;
}

uint64_t nx_metadata_range_add(uint64_t a1, unint64_t a2, int a3, char a4, int a5)
{
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  if (a4)
  {
    unint64_t v18 = (atomic_ullong *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13[0] = v6;
    v13[1] = v6;
    v13[2] = v6;
    v13[3] = v6;
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v7 = nx_metadata_fragmented_extent_list_tree_get(a1, a2, &v18);
    if (v7) {
      return v7;
    }
    uint64_t v8 = btree_iterate_nodes((uint64_t)v18, 0, 0, (uint64_t (*)(void))nx_metadata_range_add_btree_callback, 0, 0);
    if (!v8)
    {
      unint64_t v17 = 0;
      bt_iterator_init((uint64_t)v13, v18, 0, 0, &v17, 8, 8u, &v15, 0x10u);
      uint64_t v7 = v11;
      if (bt_iterator_ended((uint64_t)v13)) {
        goto LABEL_9;
      }
      while (1)
      {
        uint64_t v8 = nx_metadata_range_check_and_insert(a1, v15, v16, 0);
        if (v8) {
          break;
        }
        uint64_t v12 = bt_iterator_next((uint64_t)v13);
        if (v12)
        {
          uint64_t v7 = v12;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            nx_metadata_range_add_cold_1(a1, v7);
          }
          goto LABEL_9;
        }
        if (bt_iterator_ended((uint64_t)v13))
        {
          uint64_t v7 = 0;
          goto LABEL_9;
        }
      }
    }
    uint64_t v7 = v8;
LABEL_9:
    obj_release(v18);
    return v7;
  }
  unint64_t v9 = a3 & 0x7FFFFFFF;

  return nx_metadata_range_check_and_insert(a1, a2, v9, a5);
}

uint64_t nx_metadata_range_check_and_insert(uint64_t a1, unint64_t a2, unint64_t a3, int a4)
{
  if (nx_superblock_sanity_check_extent(*(void *)(a1 + 376), 0, a2, a3, a4)) {
    return 22;
  }
  if (*(void *)(a1 + 464))
  {
    uint64_t result = nx_metadata_range_overlap_check(a1, a2, a3, 0);
    if (result) {
      return result;
    }
    goto LABEL_5;
  }
  uint64_t result = btree_create((pthread_mutex_t **)a1, 0x88000000, 0, 10, 0, 8u, 16, (uint64_t)extent_list_key_cmp, 0, (unint64_t *)(a1 + 464));
  if (!result)
  {
LABEL_5:
    v8[1] = a3;
    unint64_t v9 = a2;
    v8[0] = a2;
    return bt_insert(*(void **)(a1 + 464), 0, &v9, 8, (uint64_t)v8, 0x10u, 0);
  }
  return result;
}

uint64_t nx_metadata_range_add_btree_callback(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 392);
  unint64_t v3 = obj_oid(a1);
  unint64_t v4 = (obj_size_phys(a1) + *(_DWORD *)(*(void *)(v2 + 376) + 36) - 1)
     / *(_DWORD *)(*(void *)(v2 + 376) + 36);

  return nx_metadata_range_check_and_insert(v2, v3, v4, 0);
}

void nx_metadata_range_optimize(uint64_t a1)
{
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a1 + 472) = 0;
  *(void *)(a1 + 480) = 0;
  uint64_t v1 = *(atomic_ullong **)(a1 + 464);
  if (!v1) {
    return;
  }
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  void v8[2] = v3;
  v8[3] = v3;
  v8[0] = v3;
  v8[1] = v3;
  v10[1] = 0;
  unint64_t v12 = 0;
  bt_iterator_init((uint64_t)v8, v1, 0, 0, &v12, 8, 8u, &v11, 0x10u);
  if (bt_iterator_ended((uint64_t)v8)) {
    return;
  }
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = v11;
    if ((((uint64_t)0xBFFFFFFFFFFFFFFFLL >> __clz(__rbit64(*(unsigned int *)(*(void *)(a1 + 376) + 36)))) & (unint64_t)v11) != 0)
    {
      uint64_t v6 = *((void *)&v11 + 1);
      if (!*((void *)&v11 + 1)) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v5 = v11 + 1;
      uint64_t v6 = *((void *)&v11 + 1) - 1;
      *(void *)&long long v11 = v11 + 1;
      *((void *)&v11 + 1) = v6;
      if (!v6) {
        goto LABEL_15;
      }
    }
    if (!v10[1] || v10[0] + v10[1] != v5)
    {
      ++v4;
      *(_OWORD *)unint64_t v10 = v11;
      goto LABEL_15;
    }
    v10[1] += v6;
    if (bt_update(*(uint64_t **)(a1 + 464), 0, v10, 8, v10, 0x10u, 0)) {
      break;
    }
    if (bt_remove(*(atomic_ullong **)(a1 + 464), 0, (unint64_t *)&v11, 8u, 0))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        nx_metadata_range_optimize_cold_1();
      }
      return;
    }
LABEL_15:
    bt_iterator_next((uint64_t)v8);
    if (bt_iterator_ended((uint64_t)v8))
    {
      if (v4 == 1) {
        *(_OWORD *)(a1 + 472) = *(_OWORD *)v10;
      }
      return;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    nx_metadata_range_optimize_cold_2();
  }
}

uint64_t nx_checkpoint_desc_block_address(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 376);
  int v4 = *(_DWORD *)(v3 + 104);
  if ((v4 & 0x7FFFFFFFu) <= a2) {
    return 22;
  }
  uint64_t v7 = *(void *)(v3 + 112);
  if (v4 < 0) {
    return nx_metadata_fragmented_block_address_lookup(a1, v7, a2, a3, 0);
  }
  uint64_t result = 0;
  *a3 = v7 + a2;
  return result;
}

uint64_t nx_checkpoint_data_block_address(uint64_t a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 376);
  int v5 = *(_DWORD *)(v4 + 108);
  unint64_t v6 = (v5 & 0x7FFFFFFF) - a2;
  if ((v5 & 0x7FFFFFFFu) <= a2) {
    return 22;
  }
  uint64_t v10 = *(void *)(v4 + 120);
  if (v5 < 0) {
    return nx_metadata_fragmented_block_address_lookup(a1, v10, a2, a3, a4);
  }
  *a3 = v10 + a2;
  uint64_t result = 0;
  if (a4) {
    *a4 = v6;
  }
  return result;
}

uint64_t nx_unblock_physical_range(void *a1)
{
  if (!*(void *)(a1[47] + 1256)) {
    goto LABEL_10;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v8 = 0;
  uint64_t v2 = tx_enter((uint64_t)a1, (uint64_t *)&v8);
  if (v2) {
    return v2;
  }
  uint64_t evict_mapping_tree = nx_get_evict_mapping_tree((uint64_t)a1, 0x40000000u, *(void *)(a1[47] + 1256), 1, 1, (uint64_t *)&v7);
  if (!evict_mapping_tree)
  {
    uint64_t v2 = btree_delete((uint64_t)v7, v8, &v6);
    obj_release(v7);
    if (v2)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        nx_unblock_physical_range_cold_3();
      }
      goto LABEL_14;
    }
    *(void *)(a1[47] + 1256) = 0;
    uint64_t v2 = tx_leave((uint64_t)a1, v8, 0);
    if (v2) {
      return v2;
    }
LABEL_10:
    unint64_t v8 = 0;
    uint64_t v2 = tx_enter((uint64_t)a1, (uint64_t *)&v8);
    if (v2) {
      return v2;
    }
    uint64_t v4 = spaceman_unset_block_out_range(a1, v8);
    if (!v4) {
      return tx_leave((uint64_t)a1, v8, 0);
    }
    uint64_t v2 = v4;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_unblock_physical_range_cold_2();
    }
    goto LABEL_14;
  }
  uint64_t v2 = evict_mapping_tree;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    nx_unblock_physical_range_cold_4();
  }
LABEL_14:
  if (tx_leave((uint64_t)a1, v8, 0) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    nx_unblock_physical_range_cold_1();
  }
  return v2;
}

uint64_t nx_ratelimit_log_allowed(uint64_t a1)
{
  if (!a1) {
    return 1;
  }
  uint64_t timestamp = get_timestamp();
  if ((unint64_t)(timestamp - *(void *)(a1 + 1792)) >= 0x3B9ACA01)
  {
    unint64_t v3 = 0;
    *(void *)(a1 + 1792) = timestamp;
LABEL_6:
    *(void *)(a1 + 1800) = v3 + 1;
    return 1;
  }
  unint64_t v3 = *(void *)(a1 + 1800);
  if (v3 <= 0xF) {
    goto LABEL_6;
  }
  return 0;
}

uint64_t nx_reaper_next_record(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 376);
  unint64_t v5 = *(void *)(v4 + 48);
  if (!v5) {
    return 0;
  }
  __int16 v22 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  int v23 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = obj_get(*(void *)(a1 + 392), 0x80000001, v5, (int *)&nx_reap_list_desc, 0, 0, 0, a3, (uint64_t *)&v23);
  if (v8)
  {
    uint64_t v9 = v8;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      nx_reaper_next_record_cold_1();
    }
    return v9;
  }
  uint64_t v10 = v23;
  if (*(void *)(v4 + 88))
  {
LABEL_22:
    obj_release(v10);
    return 0;
  }
  uint64_t v11 = v23[47];
  while (1)
  {
    while (1)
    {
      unsigned int v12 = *(_DWORD *)(v11 + 52);
      if (v12 == -1) {
        break;
      }
      uint64_t v13 = v11 + 40 * v12;
      unint64_t v14 = (_DWORD *)(v13 + 68);
      *(_DWORD *)(v4 + 104) = *(_DWORD *)(v13 + 68);
      *(void *)(v4 + 72) = *(void *)(v13 + 72);
      *(_OWORD *)(v4 + 80) = *(_OWORD *)(v13 + 80);
      *(void *)(v4 + 96) = *(void *)(v13 + 96);
      obj_dirty(a2, a3, 0);
      int v17 = *(_DWORD *)(v13 + 64);
      unint64_t v16 = (_DWORD *)(v13 + 64);
      int v15 = v17;
      if (*(_DWORD *)(v11 + 52) == *(_DWORD *)(v11 + 56)) {
        *(_DWORD *)(v11 + 56) = v15;
      }
      *unint64_t v14 = 0;
      *unint64_t v16 = *(_DWORD *)(v11 + 60);
      *(_DWORD *)(v11 + 60) = v12;
      --*(_DWORD *)(v11 + 48);
      *(_DWORD *)(v11 + 52) = v15;
      obj_dirty((uint64_t)v23, a3, 0);
      if (*(void *)(v4 + 88)) {
        goto LABEL_21;
      }
    }
    unint64_t v18 = *(void *)(v11 + 32);
    if (!v18)
    {
      if (!*(_DWORD *)(v4 + 68) && *(void *)(v4 + 48) == *(void *)(v4 + 56))
      {
        *(_DWORD *)(v4 + 68) = 1;
        obj_dirty(a2, a3, 0);
      }
LABEL_21:
      uint64_t v10 = v23;
      goto LABEL_22;
    }
    uint64_t v19 = obj_get(*(void *)(a1 + 392), 0x80000000, v18, (int *)&nx_reap_list_desc, 0, 0, 0, a3, (uint64_t *)&v22);
    if (v19) {
      break;
    }
    *(void *)(v4 + 48) = *(void *)(v11 + 32);
    int v20 = *(_DWORD *)(v4 + 68);
    if (v20) {
      *(_DWORD *)(v4 + 68) = v20 - 1;
    }
    obj_dirty(a2, a3, 0);
    obj_free((uint64_t)v23);
    obj_release(v23);
    uint64_t v10 = v22;
    __int16 v22 = 0;
    int v23 = v10;
    uint64_t v11 = v10[47];
    if (*(void *)(v4 + 88)) {
      goto LABEL_22;
    }
  }
  uint64_t v9 = v19;
  obj_release(v23);
  return v9;
}

char *OUTLINED_FUNCTION_34@<X0>(int __errnum@<W1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  return strerror(__errnum);
}

uint64_t apfs_udirop_rmdir_internal(unint64_t **a1, const char *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v19 = 0;
  uint64_t v2 = *a1;
  if (*((_DWORD *)*a1 + 275)) {
    return 30;
  }
  uint64_t v5 = (uint64_t)a1[1];
  memset(v17, 170, sizeof(v17));
  uint64_t v3 = userfs_check_name(a2, 0, (size_t *)&v17[1]);
  if (v3) {
    return v3;
  }
  uint64_t v7 = _apfs_calloc(1uLL, 0x10uLL);
  if (!v7) {
    return 12;
  }
  uint64_t v8 = v7;
  int v9 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 128));
  if (v9) {
    panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 54, v9);
  }
  v18[0] = v2;
  v18[1] = v5;
  v18[2] = a2;
  v18[3] = v17[1];
  uint64_t v10 = userfs_internal_lookup((uint64_t)v18, 0, (uint64_t *)&v19, &v17[3], &v17[2]);
  if (v10)
  {
    uint64_t v3 = v10;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      apfs_udirop_rmdir_internal_cold_5();
    }
LABEL_15:
    _apfs_free(v8, 16);
    goto LABEL_16;
  }
  uint64_t inode = userfs_load_inode((uint64_t)v2, v5, v17[3], v17[2], v8);
  if (inode)
  {
    uint64_t v3 = inode;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      apfs_udirop_rmdir_internal_cold_4();
    }
    goto LABEL_15;
  }
  uint64_t v13 = v8[1];
  if ((*(unsigned char *)(v13 + 120) & 0x18) == 0)
  {
    if ((*(_WORD *)(v13 + 104) & 0xF000) != 0x4000)
    {
      uint64_t v3 = 20;
      goto LABEL_24;
    }
    if (*(int *)(v13 + 80) > 0)
    {
      uint64_t v3 = 66;
      goto LABEL_24;
    }
    uint64_t v14 = fs_tx_enter((uint64_t)v2, 2, 4, 0, v17);
    if (v14)
    {
      uint64_t v3 = v14;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_udirop_rmdir_internal_cold_3();
      }
      goto LABEL_24;
    }
    uint64_t v15 = remove_dir_entry(v2, v5, v13, (uint64_t)v19, v17[0]);
    if (v15)
    {
      uint64_t v3 = v15;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_udirop_rmdir_internal_cold_2();
      }
    }
    else
    {
      apfs_increment_num_objects((uint64_t)v2, v13, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v3 = fs_delete_inode_with_xid((uint64_t)v2, v13, v17[0]);
      if (v3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 136315650;
          int v21 = "apfs_udirop_rmdir_internal";
          __int16 v22 = 1024;
          int v23 = 114;
          __int16 v24 = 1024;
          int v25 = v3;
          _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: fs_delete_inode_with_xid failed with err %d\n", buf, 0x18u);
        }
        uint64_t v3 = move_inode_to_purgatory((uint64_t)v2, v13, v5, v17[0]);
        if (v3)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            apfs_udirop_rmdir_internal_cold_1(v13, v5, v3);
          }
          goto LABEL_40;
        }
        uint64_t v16 = *(void *)(v13 + 120) | 0x20000000;
      }
      else
      {
        size_tracking_ino_moved((uint64_t)v2, v13, v5, 0, v17[0]);
        uint64_t v16 = *(void *)(v13 + 120) | 0x20000010;
      }
      *(void *)(v13 + 120) = v16;
    }
LABEL_40:
    fs_tx_leave((uint64_t)v2, 2, 4, 0, v17[0]);
    goto LABEL_24;
  }
  uint64_t v3 = 2;
LABEL_24:
  userfs_internal_reclaim((uint64_t)v8);
LABEL_16:
  jobj_release((uint64_t)v2, v19);
  int v12 = pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 128));
  if (v12) {
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 143, v12);
  }
  return v3;
}

uint64_t apfs_udirop_rmdir(unint64_t **a1, const char *a2)
{
  if (a1 && a2) {
    return apfs_udirop_rmdir_internal(a1, a2);
  }
  else {
    return 22;
  }
}

uint64_t apfs_udirop_mkdir(uint64_t *a1, char *__s1, uint64_t a3, uint64_t *a4)
{
  uint64_t common = 22;
  if (a1)
  {
    if (__s1)
    {
      if (a3)
      {
        if (a4)
        {
          uint64_t v9 = *a1;
          uint64_t common = userfs_create_common(a1, __s1, a3, a4, 2, 0);
          if (!common)
          {
            if ((*(void *)(a3 + 8) & 0xFFFFFFFFFFFFFFE5) != 0)
            {
              uint64_t v11 = *a4;
              uint64_t common = userfs_set_ufa_common(v9, *(void *)(*a4 + 8), a3, 0);
              if (common)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  apfs_udirop_mkdir_cold_2();
                }
                if (apfs_udirop_rmdir_internal((unint64_t **)a1, __s1)
                  && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  apfs_udirop_mkdir_cold_1();
                }
                userfs_internal_reclaim(v11);
                *a4 = 0;
              }
            }
            else
            {
              return 0;
            }
          }
        }
      }
    }
  }
  return common;
}

uint64_t apfs_udirop_readdir(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6 = 22;
  if (a1 && a6 && a5 && a2 && *(void *)(a1 + 8))
  {
    v8[0] = a2;
    v8[1] = a3;
    void v8[2] = 0;
    v8[3] = a5;
    _OWORD v8[4] = a6;
    v8[5] = 0xAAAAAAAAAAAAAA00;
    return apfs_udir_iterate_dir(a1, a4, *a6, (uint64_t)v8, 0);
  }
  return v6;
}

uint64_t apfs_udir_iterate_dir(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v53 = 0;
  long long v52 = 0u;
  memset(v51, 0, sizeof(v51));
  uint64_t v49 = a2;
  uint64_t v50 = 0;
  if (!a4)
  {
    if (a5)
    {
      uint64_t v10 = 0;
      char v11 = 1;
      BOOL v9 = 1;
      goto LABEL_9;
    }
    return 22;
  }
  BOOL v9 = *(unsigned char *)(a4 + 40) != 0;
  if (a5) {
    return 22;
  }
  uint64_t v10 = *(uint64_t **)(a4 + 24);
  if (v10)
  {
    char v11 = 0;
    *uint64_t v10 = 0;
  }
  else
  {
    char v11 = 1;
  }
LABEL_9:
  if (a2 == -1) {
    return 4294966295;
  }
  uint64_t v14 = *(unint64_t **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  if (!a2 && a3) {
    return 4294966296;
  }
  if (!a2 && a4)
  {
    unint64_t v15 = *(void *)(a4 + 8);
    if (v9)
    {
      if (v15 >= 0x3C6) {
        goto LABEL_18;
      }
      return 7;
    }
    if (v15 < 0x313) {
      return 7;
    }
  }
LABEL_18:
  if ((*(unsigned char *)(v13 + 120) & 0x10) != 0) {
    return 2;
  }
  if ((*(_WORD *)(v13 + 104) & 0xF000) != 0x4000) {
    return 20;
  }
  int v44 = (pthread_rwlock_t *)(v13 + 128);
  int v16 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v13 + 128));
  if (v16) {
    panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 322, v16);
  }
  if (a4) {
    char v17 = v9;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) != 0 || (uint64_t v49 = readdir_handle_dotpacking(v13, *(void *)a4, *(void *)(a4 + 8), a2, &v50)) != 0)
  {
    BOOL v18 = a2 > 1;
    if (v9) {
      BOOL v18 = a2 != 0;
    }
    if (v18)
    {
      int v19 = pthread_rwlock_unlock(v44);
      if (v19) {
        panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 339, v19);
      }
      uint64_t dir_iterator = find_dir_iterator(v13, a2);
      int v21 = pthread_rwlock_rdlock(v44);
      if (v21) {
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 341, v21);
      }
      if (dir_iterator)
      {
        char v43 = 1;
      }
      else
      {
        uint64_t v35 = readdir_process_cookie(v13, a2, v9);
        if (v35 == -1)
        {
          char v22 = 0;
          uint64_t dir_iterator = 0;
          uint64_t v12 = 4294966294;
          goto LABEL_85;
        }
        uint64_t v42 = v35;
        __int16 v36 = _apfs_calloc(1uLL, 0x358uLL);
        uint64_t dir_iterator = (uint64_t)v36;
        if (!v36)
        {
LABEL_65:
          char v22 = 0;
          goto LABEL_66;
        }
        char v43 = 0;
        *__int16 v36 = a2;
        v36[1] = v42;
        v36[4] = v42;
      }
    }
    else
    {
      uint64_t dir_iterator = (uint64_t)_apfs_calloc(1uLL, 0x358uLL);
      char v22 = 0;
      if (!dir_iterator)
      {
LABEL_66:
        uint64_t v12 = 12;
        goto LABEL_85;
      }
      char v43 = 0;
    }
    LODWORD(v51[0]) = 4718601;
    *((void *)&v51[0] + 1) = *(void *)(v13 + 8);
    if (!*(unsigned char *)(dir_iterator + 56)) {
      goto LABEL_45;
    }
    uint64_t v23 = *(void *)(dir_iterator + 48);
    WORD1(v51[0]) = v23 + 72;
    HIWORD(v52) = v23;
    DWORD2(v52) = *(_DWORD *)(dir_iterator + 44);
    __int16 v24 = _apfs_malloc((unsigned __int16)v23);
    uint64_t v53 = v24;
    if (v24)
    {
      strlcpy((char *)v24, (const char *)(dir_iterator + 56), *(void *)(dir_iterator + 48));
LABEL_45:
      unint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
      if (a4)
      {
        uint64_t v25 = 0;
        uint64_t v26 = *(void *)(a4 + 8);
        uint64_t v27 = v50;
        if (v50) {
          uint64_t v28 = v50 - 24;
        }
        else {
          uint64_t v28 = -1;
        }
        int v29 = (void *)a4;
        char v30 = v9;
      }
      else
      {
        uint64_t v27 = 0;
        int v29 = (void *)(*(void *)(a5 + 8) + 8);
        char v30 = 1;
        uint64_t v26 = -1;
        uint64_t v25 = a5;
        uint64_t v28 = -1;
      }
      v45[0] = *v29;
      v45[1] = v26;
      v45[2] = dir_iterator;
      v45[3] = a1;
      v45[4] = v25;
      uint64_t v46 = v28;
      unint64_t v47 = v27;
      LOBYTE(v48) = v30;
      unsigned int v32 = iterate_jobjs(v14, 1, 0, (unsigned __int8 *)v51, (uint64_t (*)(long long *, uint64_t))userfs_process_dirent_cb, (uint64_t)v45);
      if (v32)
      {
        int v33 = pthread_rwlock_unlock(v44);
        if (v33) {
          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 426, v33);
        }
        save_dir_iterator(v13, dir_iterator, &v49);
        int v34 = pthread_rwlock_rdlock(v44);
        if (v34) {
          panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 428, v34);
        }
        char v22 = 0;
        uint64_t dir_iterator = 0;
        if (v32 == 0x80000000) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = v32;
        }
      }
      else if (v43)
      {
        uint64_t v12 = 0;
        char v22 = 1;
      }
      else
      {
        _apfs_free((void *)dir_iterator, 856);
        uint64_t v12 = 0;
        char v22 = 0;
        uint64_t dir_iterator = 0;
      }
      if (v46 == -1)
      {
        if (v12) {
          uint64_t v12 = v12;
        }
        else {
          uint64_t v12 = 4294966295;
        }
      }
      else
      {
        uint64_t v37 = (uint64_t *)a4;
        if (!a4) {
          uint64_t v37 = (uint64_t *)(*(void *)(a5 + 8) + 8);
        }
        if (v32) {
          uint64_t v38 = v49;
        }
        else {
          uint64_t v38 = -1;
        }
        readdir_mark_dirent_as_end(*v37, v46, v38, v9);
      }
      if ((v11 & 1) == 0)
      {
        uint64_t v31 = v47;
        if (a4)
        {
          if (v47 >= *(void *)(a4 + 8)) {
            uint64_t v31 = *(void *)(a4 + 8);
          }
          goto LABEL_82;
        }
        *uint64_t v10 = v47;
LABEL_87:
        *(void *)(*(void *)(a5 + 8) + 16) = *(unsigned int *)(v13 + 88);
        goto LABEL_88;
      }
LABEL_85:
      if (a4) {
        goto LABEL_86;
      }
      goto LABEL_87;
    }
    goto LABEL_65;
  }
  uint64_t dir_iterator = 0;
  char v22 = 0;
  uint64_t v12 = 0;
  uint64_t v31 = v50;
LABEL_82:
  *uint64_t v10 = v31;
LABEL_86:
  **(void **)(a4 + 32) = *(unsigned int *)(v13 + 88);
LABEL_88:
  int v39 = pthread_rwlock_unlock(v44);
  if (v39) {
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_dirops.c", 480, v39);
  }
  char v40 = v22 ^ 1;
  if (!dir_iterator) {
    char v40 = 1;
  }
  if ((v40 & 1) == 0)
  {
    if (remove_selected_and_stale_dir_iterators(v13, dir_iterator) == 2) {
      _apfs_free((void *)dir_iterator, 856);
    }
    uint64_t dir_iterator = 0;
  }
  if (v53) {
    _apfs_free(v53, HIWORD(v52));
  }
  if (dir_iterator) {
    _apfs_free((void *)dir_iterator, 856);
  }
  return v12;
}

uint64_t apfs_udirop_readdirattr(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6 = 22;
  if (a1 && a6 && a5 && a2 && *(void *)(a1 + 8))
  {
    v8[0] = a2;
    v8[1] = a3;
    void v8[2] = 0;
    v8[3] = a5;
    _OWORD v8[4] = a6;
    v8[5] = 0xAAAAAAAAAAAAAA01;
    return apfs_udir_iterate_dir(a1, a4, *a6, (uint64_t)v8, 0);
  }
  return v6;
}

uint64_t apfs_udirop_scandir(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 22;
  if (a1 && a3 && a2 && *(void *)(a1 + 8))
  {
    v5[1] = a3;
    v5[2] = 0xAAAAAAAAAAAAAA00;
    v5[0] = a2;
    return apfs_udir_iterate_dir(a1, *(void *)(a2 + 24), *(void *)(a2 + 32), 0, (uint64_t)v5);
  }
  return v3;
}

uint64_t apfs_udirop_scanids(uint64_t *a1, unint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  uint64_t v5 = 22;
  if (a1 && a3)
  {
    unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v7;
    long long v25 = v7;
    long long v22 = v7;
    long long v23 = v7;
    long long v20 = v7;
    long long v21 = v7;
    v18[3] = v7;
    long long v19 = v7;
    v18[1] = v7;
    v18[2] = v7;
    v18[0] = v7;
    if (a2 >= 0x4000)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_udirop_scanids_cold_1();
      }
    }
    else
    {
      uint64_t v10 = *a1;
      char v11 = _apfs_malloc(0x2FEuLL);
      if (v11)
      {
        uint64_t v12 = v11;
        if (a4)
        {
          uint64_t v13 = 0;
          uint64_t v14 = a4;
          do
          {
            bzero(v12, 0x2FEuLL);
            uint64_t v15 = *(void *)(a3 + 8 * v13);
            if (v15 != 1)
            {
              uint64_t v16 = apfs_getinfo_from_id(v10, *(void *)(a3 + 8 * v13), (uint64_t)v18, (char *)v12, 0x2FEuLL);
              if (v16 != 2)
              {
                uint64_t v5 = v16;
                if (v16) {
                  goto LABEL_15;
                }
                if (v15 == 2) {
                  *((void *)&v19 + 1) = v19;
                }
                (*(void (**)(uint64_t, uint64_t, _OWORD *, void *))(a5 + 16))(a5, v13, v18, v12);
              }
            }
            ++v13;
          }
          while (v14 != v13);
        }
        uint64_t v5 = 0;
LABEL_15:
        _apfs_free(v12, 766);
      }
      else
      {
        return 12;
      }
    }
  }
  return v5;
}

uint64_t apfs_ufileop_getattr(uint64_t *a1, uint64_t a2)
{
  uint64_t result = 22;
  if (a1 && a2)
  {
    uint64_t v5 = *a1;
    uint64_t v6 = a1[1];
    int v7 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 128));
    if (v7) {
      panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 42, v7);
    }
    userfs_pack_ufa_common(v5, v6, a2);
    uint64_t result = pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 128));
    if (result) {
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 44, result);
    }
  }
  return result;
}

uint64_t apfs_ufileop_setattr(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 22;
  if (a1 && a2 && a3)
  {
    uint64_t v6 = a1[1];
    if ((*(unsigned char *)(v6 + 73) & 8) != 0) {
      return 45;
    }
    uint64_t v7 = *a1;
    if (userfs_file_is_compressed(*a1, v6))
    {
      return 45;
    }
    else
    {
      uint64_t v3 = userfs_set_ufa_common(v7, v6, a2, a3);
      if (v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_ufileop_setattr_cold_1();
      }
    }
  }
  return v3;
}

uint64_t apfs_ufileop_lookup(uint64_t *a1, char *__s1, uint64_t **a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v23 = v3;
  long long v24 = v3;
  uint64_t inode = 22;
  if (!a1 || !__s1 || !a3) {
    return inode;
  }
  int v26 = -1431655766;
  memset(v25, 170, sizeof(v25));
  uint64_t v8 = *a1;
  uint64_t v9 = a1[1];
  size_t v10 = strnlen(__s1, 0x2FEuLL);
  *a3 = 0;
  if ((*(_WORD *)(a1[1] + 104) & 0xF000) != 0x8000)
  {
    size_t v11 = v10;
    switch(v10)
    {
      case 0uLL:
        return 2;
      case 2uLL:
        if (*__s1 != 46) {
          goto LABEL_16;
        }
        int v12 = __s1[1];
        break;
      case 1uLL:
        int v12 = *__s1;
        break;
      default:
        goto LABEL_16;
    }
    if (v12 == 46) {
      return 1;
    }
LABEL_16:
    uint64_t v13 = (uint64_t *)_apfs_calloc(1uLL, 0x10uLL);
    unsigned int v14 = apfs_check_name((uint64_t)__s1, v11, 0, &v26);
    if (v14 != 63 || v26)
    {
      int v15 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v9 + 128));
      if (v15) {
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 179, v15);
      }
      if ((*(unsigned char *)(v9 + 120) & 0x18) != 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1[1] + 8);
          *(_DWORD *)int buf = 136315650;
          uint64_t v28 = "apfs_ufileop_lookup";
          __int16 v29 = 1024;
          int v30 = 187;
          __int16 v31 = 2048;
          *(void *)unsigned int v32 = v16;
          _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: Parent directory %llu is deleted.\n", buf, 0x1Cu);
        }
        uint64_t inode = 2;
      }
      else
      {
        *(void *)&long long v23 = v8;
        *((void *)&v23 + 1) = v9;
        *(void *)&long long v24 = __s1;
        *((void *)&v24 + 1) = v11;
        v25[0] = 0;
        uint64_t v19 = userfs_internal_lookup((uint64_t)&v23, v14, v25, &v25[2], &v25[1]);
        if (v19)
        {
          uint64_t inode = v19;
          if (v19 != 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = *(void *)(a1[1] + 8);
            uint64_t v21 = *(void *)(v8 + 400);
            *(_DWORD *)int buf = 136316674;
            uint64_t v28 = "apfs_ufileop_lookup";
            __int16 v29 = 1024;
            int v30 = 215;
            __int16 v31 = 1040;
            *(_DWORD *)unsigned int v32 = v11;
            *(_WORD *)&v32[4] = 2080;
            *(void *)&v32[6] = __s1;
            __int16 v33 = 2048;
            uint64_t v34 = v20;
            __int16 v35 = 2080;
            uint64_t v36 = v21;
            __int16 v37 = 1024;
            int v38 = inode;
            _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to find directory entry with name(%.*s) inside directory with ino: %llu, inside volume %s. Error %d \n", buf, 0x3Cu);
          }
        }
        else
        {
          uint64_t inode = userfs_load_inode(v8, v9, v25[2], v25[1], v13);
          if (!inode)
          {
            uint64_t v22 = v13[1];
            if (v25[0])
            {
              jobj_release(v8, (unsigned char *)v25[0]);
              v25[0] = 0;
            }
            uint64_t inode = 0;
            if (!*(_DWORD *)(v8 + 1100)) {
              *(unsigned char *)(v22 + 16) = 1;
            }
          }
        }
      }
      int v17 = pthread_rwlock_unlock((pthread_rwlock_t *)(v9 + 128));
      if (v17) {
        panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 243, v17);
      }
      if (!inode) {
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t inode = 63;
    }
    if (v13)
    {
      _apfs_free(v13, 16);
      uint64_t v13 = 0;
    }
LABEL_30:
    *a3 = v13;
    return inode;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    apfs_ufileop_lookup_cold_1();
  }
  return 20;
}

uint64_t apfs_ufileop_reclaim(uint64_t a1, char a2)
{
  if (a1) {
    return userfs_reclaim_with_flags(a1, a2);
  }
  else {
    return 22;
  }
}

uint64_t apfs_ufileop_readlink(uint64_t *a1, char *a2, size_t a3, size_t *a4, uint64_t a5)
{
  char v24 = 0;
  uint64_t v5 = 22;
  if (!a1 || !a2 || !a4 || !a5) {
    return v5;
  }
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  *a4 = 0;
  *a2 = 0;
  long long v23 = 0;
  if ((*(_WORD *)(v10 + 104) & 0xF000) != 0xA000 || (*(unsigned char *)(v10 + 120) & 0x18) != 0) {
    return 22;
  }
  uint64_t v13 = (pthread_rwlock_t *)(v10 + 128);
  uint64_t v22 = *(void *)(v10 + 360);
  unsigned int v14 = (pthread_rwlock_t *)(v10 + 128);
  if (!v22)
  {
    int v18 = pthread_rwlock_wrlock(v14);
    if (v18) {
      panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 373, v18);
    }
    goto LABEL_16;
  }
  int v15 = pthread_rwlock_rdlock(v14);
  if (v15) {
    panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 361, v15);
  }
  uint64_t v16 = *(const char **)(v10 + 360);
  if (!v16)
  {
LABEL_16:
    if (fs_get_xattr(v9, *(void *)(v10 + 8), (uint64_t *)(v10 + 328), "com.apple.fs.symlink", &v23))
    {
      long long v23 = 0;
      uint64_t v16 = &v24;
      size_t v17 = 1;
    }
    else
    {
      uint64_t v16 = &v23[*((unsigned __int16 *)v23 + 10) + 24];
      size_t v17 = *((unsigned __int16 *)v23 + 11);
      if (!v22 && !*(void *)(v10 + 360))
      {
        uint64_t v19 = (char *)_apfs_calloc(1uLL, *((unsigned __int16 *)v23 + 11));
        *(void *)(v10 + 360) = v19;
        if (v19)
        {
          strlcpy(v19, v16, v17);
          *(_DWORD *)(v10 + 368) = v17;
        }
      }
    }
    goto LABEL_22;
  }
  size_t v17 = *(int *)(v10 + 368);
LABEL_22:
  if (v17 <= a3)
  {
    strlcpy(a2, v16, v17);
    *a4 = v17;
    userfs_pack_ufa_common(v9, v10, a5);
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 55;
  }
  int v20 = pthread_rwlock_unlock(v13);
  if (v20)
  {
    int v21 = 431;
    if (!v22) {
      int v21 = 429;
    }
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", v21, v20);
  }
  jobj_release(v9, v23);
  return v5;
}

uint64_t apfs_ufileop_symlink(uint64_t *a1, char *__s1, char *a3, uint64_t a4, uint64_t **a5)
{
  uint64_t common = 22;
  if (a1 && __s1 && a3 && a4 && a5)
  {
    uint64_t v9 = *a1;
    if (*(void *)(a1[1] + 8) == *(void *)(*(void *)(*a1 + 488) + 8))
    {
      return 13;
    }
    else
    {
      uint64_t common = userfs_create_common(a1, __s1, a4, a5, 3, a3);
      if (!common)
      {
        if ((*(void *)(a4 + 8) & 0xFFFFFFFFFFFFFFE5) != 0)
        {
          size_t v11 = *a5;
          uint64_t common = userfs_set_ufa_common(v9, (*a5)[1], a4, 0);
          if (common)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              apfs_ufileop_symlink_cold_2();
            }
            if (userfs_internal_remove(v11, __s1, 0, 0)
              && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              apfs_ufileop_symlink_cold_1();
            }
            userfs_internal_reclaim((uint64_t)v11);
            *a5 = 0;
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return common;
}

uint64_t apfs_ufileop_link(uint64_t **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5)
{
  int v30 = 0;
  __int16 v31 = 0;
  uint64_t inserted = 22;
  if (!a1 || !a2 || !a3 || !a4 || !a5) {
    return inserted;
  }
  uint64_t v9 = *a1;
  if (*((_DWORD *)*a1 + 275)) {
    return 30;
  }
  uint64_t v10 = (uint64_t)a1[1];
  if ((*(_WORD *)(v10 + 104) & 0xF000) == 0x4000) {
    return 21;
  }
  uint64_t v11 = *(void *)(a2 + 8);
  if ((*(_WORD *)(v11 + 104) & 0xF000) != 0x4000) {
    return 21;
  }
  int v12 = (uint64_t *)(v11 + 8);
  if (*(void *)(v11 + 8) == *(void *)(v9[61] + 8)) {
    return 13;
  }
  memset(v29, 170, sizeof(v29));
  int v27 = -1431655766;
  int v28 = -1431655766;
  uint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t inserted = userfs_check_name(a3, 1, v29);
  if (inserted) {
    return inserted;
  }
  int v14 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v11 + 128));
  if (v14) {
    panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 560, v14);
  }
  int v15 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v10 + 128));
  if (v15) {
    panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 561, v15);
  }
  if ((*(unsigned char *)(v11 + 120) & 0x18) != 0 || (*(unsigned char *)(v10 + 120) & 0x18) != 0)
  {
    uint64_t inserted = 22;
    goto LABEL_22;
  }
  uint64_t v18 = fs_name_exists_with_parent_id(v9, *(void *)(v11 + 8), a3, v29[0], (uint64_t *)(v11 + 344), &v28);
  if ((v18 + 1) < 2)
  {
    uint64_t inserted = 17;
    goto LABEL_22;
  }
  uint64_t inserted = v18;
  if (v18 == 2)
  {
    long long v23 = (uint64_t *)(v10 + 8);
    uint64_t inserted = dir_rec_alloc_with_hash((uint64_t)v9, 1, a3, v29[0], v28, *v12, *(void *)(v10 + 8), &v30);
    if (!inserted)
    {
      uint64_t inserted = 22;
      if (!xf_get_ptr_and_size((unsigned __int16 *)(v10 + 416), 4, 0, &v29[3], &v27) && v27 >= 1)
      {
        size_t v19 = strlen((const char *)v29[3]);
        uint64_t v20 = fs_lookup_name_with_parent_id(v9, *(void *)(v10 + 24), (const char *)v29[3], v19, 0, 0, &v31);
        if (v20)
        {
          uint64_t inserted = v20;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            apfs_ufileop_link_cold_4();
          }
          goto LABEL_22;
        }
        uint64_t inserted = fs_tx_enter((uint64_t)v9, 1, 4, 0, &v26);
        if (!inserted)
        {
          if (xf_get((unsigned __int16 *)v31 + 16, 1, 0, (char *)&v29[2], 8uLL))
          {
            v29[2] = get_next_apfs_obj_id((uint64_t)v9);
            if (xf_set((unsigned __int16 *)v31 + 16, 1, 2, &v29[2], 8uLL))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                apfs_ufileop_link_cold_3();
              }
              uint64_t inserted = 5;
LABEL_51:
              fs_tx_leave((uint64_t)v9, 1, 4, 0, v26);
              goto LABEL_22;
            }
            int v21 = v31;
            v31[1] = 2;
            update_jobj((uint64_t)v9, 1, v21, v26);
            uint64_t sibling_link = create_sibling_link((uint64_t)v9, *v23, v29[2], *((void *)v31 + 1), *((const void **)v31 + 8), *((unsigned __int16 *)v31 + 31), v26);
            if (sibling_link)
            {
              uint64_t inserted = sibling_link;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                apfs_ufileop_link_cold_2();
              }
              goto LABEL_51;
            }
          }
          *((void *)v30 + 3) = get_timestamp();
          *((_WORD *)v30 + 30) = file_type_to_dirent_type(*(unsigned __int16 *)(v10 + 104));
          v29[1] = get_next_apfs_obj_id((uint64_t)v9);
          xf_set((unsigned __int16 *)v30 + 16, 1, 2, &v29[1], 8uLL);
          uint64_t inserted = insert_jobj((uint64_t)v9, 1, v30, v26);
          if (!inserted)
          {
            update_time((uint64_t)v9, (void *)v10, 2);
            ++*(_DWORD *)(v10 + 80);
            uint64_t inserted = update_jobj((uint64_t)v9, 1, (unsigned __int8 *)v10, v26);
            if (!inserted)
            {
              update_time((uint64_t)v9, (void *)v11, 3);
              uint64_t v25 = 0;
              memset(v24, 0, sizeof(v24));
              update_size_tracking((uint64_t)v9, v11, v24, v26);
              ++*(_DWORD *)(v11 + 80);
              ++*(_DWORD *)(v11 + 88);
              uint64_t inserted = update_jobj((uint64_t)v9, 1, (unsigned __int8 *)v11, v26);
              if (!inserted)
              {
                uint64_t inserted = create_sibling_link((uint64_t)v9, *v23, v29[1], *v12, *((const void **)v30 + 8), *((unsigned __int16 *)v30 + 31), v26);
                if (!inserted)
                {
                  fs_tx_leave((uint64_t)v9, 1, 4, 0, v26);
                  userfs_pack_ufa_common((uint64_t)v9, v10, a4);
                  userfs_pack_ufa_common((uint64_t)v9, v11, a5);
                  goto LABEL_22;
                }
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  apfs_ufileop_link_cold_1();
                }
              }
            }
          }
          goto LABEL_51;
        }
      }
    }
  }
LABEL_22:
  int v16 = pthread_rwlock_unlock((pthread_rwlock_t *)(v10 + 128));
  if (v16) {
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 696, v16);
  }
  int v17 = pthread_rwlock_unlock((pthread_rwlock_t *)(v11 + 128));
  if (v17) {
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 697, v17);
  }
  jobj_release((uint64_t)v9, v31);
  jobj_release((uint64_t)v9, v30);
  return inserted;
}

uint64_t apfs_ufileop_read(uint64_t *a1, unint64_t a2, unint64_t a3, char *a4, void *a5)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v5 = 22;
  if (!a1) {
    return v5;
  }
  uint64_t v6 = a4;
  if (!a4 || !a5) {
    return v5;
  }
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v13 = *(void *)(*a1 + 392);
  unsigned int block_size = apfs_get_block_size(*a1);
  *a5 = 0;
  int v15 = *(_WORD *)(v11 + 104) & 0xF000;
  if (v15 == 0x4000) {
    return 21;
  }
  if (v15 != 0x8000) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  if ((*(unsigned char *)(v11 + 73) & 8) != 0) {
    return 45;
  }
  unsigned int v16 = block_size;
  if (userfs_file_is_compressed(v12, v11)) {
    return 45;
  }
  unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v18 = v16;
  uint64_t v48 = v16 - 1;
  if ((v48 & a2) != 0)
  {
    BOOL v19 = 1;
    goto LABEL_18;
  }
  if (a3 % v16)
  {
    BOOL v19 = v16 >= a3;
LABEL_18:
    int v53 = v19;
    unint64_t v52 = calculate_num_complete_blocks(a2, a3, v16);
    uint64_t v20 = (char *)_apfs_malloc(v16);
    if (!v20)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_ufileop_read_cold_3();
      }
      return 12;
    }
    goto LABEL_23;
  }
  unint64_t v52 = calculate_num_complete_blocks(a2, a3, v16);
  int v53 = 0;
  uint64_t v20 = 0;
LABEL_23:
  uint64_t v45 = v20;
  if (*(unsigned char *)(*(void *)(v12 + 376) + 264))
  {
    int v21 = 0;
  }
  else
  {
    int v21 = userfs_crypto_alloc_cst(v12);
    if (!v21)
    {
      int v51 = 0;
      uint64_t v5 = 12;
      goto LABEL_88;
    }
  }
  uint64_t v44 = v13;
  int v51 = v21;
  apfs_io_lock_shared(v12, v11);
  uint64_t v22 = (pthread_rwlock_t *)(v11 + 128);
  int v23 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v11 + 128));
  if (v23) {
    panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 879, v23);
  }
  userfs_get_file_sizes(v12, v11, &v55, 0);
  if ((*(unsigned char *)(v11 + 120) & 0x10) != 0 && v55)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      apfs_ufileop_read_cold_1();
    }
    int v24 = pthread_rwlock_unlock((pthread_rwlock_t *)(v11 + 128));
    if (v24) {
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 887, v24);
    }
    uint64_t v5 = 22;
    goto LABEL_88;
  }
  int v25 = pthread_rwlock_unlock((pthread_rwlock_t *)(v11 + 128));
  if (v25) {
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 890, v25);
  }
  if (v55 <= a2 || a3 + a2 > v55 && (a3 = v55 - a2, v55 == a2))
  {
    uint64_t v5 = 0;
    goto LABEL_88;
  }
  char v26 = __clz(__rbit32(v16));
  if (!v16) {
    char v26 = -1;
  }
  uint64_t v46 = v16;
  char v47 = v26;
  unint64_t v27 = a3;
  while (1)
  {
    memset(__n, 170, sizeof(__n));
    *(void *)int buf = a1;
    *(void *)&buf[8] = a2;
    unint64_t v50 = v27;
    *(void *)&buf[16] = v27;
    *(void *)&buf[24] = &__n[2];
    *(void *)&buf[32] = __n;
    *(void *)&long long v57 = &__n[3];
    *((void *)&v57 + 1) = &__n[1];
    unint64_t v58 = 0xAAAAAAAA00000001;
    uint64_t data = userfs_internal_blockmap((uint64_t)buf);
    if (data) {
      break;
    }
    size_t v29 = __n[0];
    size_t v30 = (__n[3] + v48 + __n[0]) >> v47;
    if ((v53 & 1) != 0 && v30 >= 2)
    {
      size_t v29 = v46 - __n[3];
      __n[0] = v46 - __n[3];
      size_t v30 = 1;
    }
    else if ((v53 & 1) == 0 && v30 > v52)
    {
      if (__n[3])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          apfs_ufileop_read_cold_2();
        }
        uint64_t v5 = 5;
        uint64_t v18 = v46;
        goto LABEL_78;
      }
      size_t v29 = v52 << v47;
      __n[0] = v52 << v47;
      size_t v30 = v52;
    }
    uint64_t v31 = __n[2];
    size_t v49 = v30;
    if (__n[2] == -1)
    {
      size_t v36 = v30 << v47;
      if ((v53 & 1) == 0)
      {
        bzero(v6, v36);
        uint64_t v18 = v46;
        goto LABEL_64;
      }
      __int16 v33 = v45;
      bzero(v45, v36);
      uint64_t v35 = v46;
    }
    else
    {
      if (v51) {
        *(void *)(v51[9] + 8) = __n[1];
      }
      uint64_t v32 = *(void *)(v44 + 384);
      if ((v53 & 1) == 0)
      {
        uint64_t data = dev_read_data(v32, v31);
        uint64_t v18 = v46;
        if (data) {
          break;
        }
        size_t v29 = __n[0];
        goto LABEL_64;
      }
      __int16 v33 = v45;
      uint64_t v34 = dev_read_data(v32, v31);
      uint64_t v35 = v46;
      if (v34)
      {
        uint64_t v5 = v34;
        uint64_t v18 = v46;
        uint64_t v22 = (pthread_rwlock_t *)(v11 + 128);
        goto LABEL_72;
      }
    }
    size_t v29 = __n[0];
    memcpy(v6, &v33[__n[3]], __n[0]);
    uint64_t v18 = v35;
    uint64_t v22 = (pthread_rwlock_t *)(v11 + 128);
LABEL_64:
    size_t v37 = v49;
    a2 += v29;
    v6 += v29;
    int v38 = v53;
    if (v53)
    {
      int v38 = 0;
      size_t v37 = 0;
    }
    v52 -= v37;
    if (!v52) {
      int v38 = 1;
    }
    int v53 = v38;
    unint64_t v27 = v50 - v29;
    if (v50 == v29)
    {
      unint64_t v50 = 0;
      uint64_t v5 = 0;
LABEL_81:
      int v39 = pthread_rwlock_rdlock(v22);
      if (v39) {
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1062, v39);
      }
      if (!v5)
      {
        uint64_t dstream = fs_get_dstream(v12, v11);
        *a5 = a3 - v50;
        if (dstream) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(dstream + 32), a3 - v50, memory_order_relaxed);
        }
      }
      int v41 = pthread_rwlock_unlock(v22);
      if (v41) {
        panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1077, v41);
      }
      goto LABEL_88;
    }
  }
  uint64_t v5 = data;
LABEL_72:
  if (v5 <= 0x23 && ((1 << v5) & 0x800000042) != 0) {
    goto LABEL_81;
  }
LABEL_78:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v42 = *(void *)(v11 + 8);
    uint64_t v43 = *(void *)(v11 + 32);
    *(_DWORD *)int buf = 136316930;
    *(void *)&uint8_t buf[4] = "apfs_ufileop_read";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1055;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v42;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v43;
    *(_WORD *)&buf[38] = 1024;
    LODWORD(v57) = v5;
    WORD2(v57) = 2048;
    *(void *)((char *)&v57 + 6) = v55;
    HIWORD(v57) = 2048;
    unint64_t v58 = a2;
    __int16 v59 = 2048;
    unint64_t v60 = v50;
    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: ### obj-id %lld/%lld error %d filesize %lld offset %lld resid %zu ###\n", buf, 0x4Au);
  }
  if (v5 != 9) {
    goto LABEL_81;
  }
LABEL_88:
  apfs_io_unlock_shared(v12, v11);
  if (v45) {
    _apfs_free(v45, v18);
  }
  if (v51) {
    crypto_obj_release(v51);
  }
  return v5;
}

uint64_t apfs_ufileop_write(uint64_t *a1, unint64_t a2, unint64_t a3, char *a4, void *a5)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  unint64_t v85 = 0;
  unint64_t __dst = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v84 = 0;
  uint64_t result = 22;
  if (!a1) {
    return result;
  }
  uint64_t v7 = a4;
  if (!a4 || !a5) {
    return result;
  }
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  unsigned int block_size = apfs_get_block_size(*a1);
  uint64_t v14 = 0x80000000000000;
  if (!__CFADD__(a2, a3)) {
    uint64_t v14 = a2 + a3;
  }
  *a5 = 0;
  if (*(_DWORD *)(v12 + 1100)) {
    return 30;
  }
  int v15 = *(_WORD *)(v11 + 104) & 0xF000;
  if (v15 == 0x4000) {
    return 21;
  }
  if (v15 != 0x8000) {
    return 1;
  }
  if ((*(unsigned char *)(v11 + 73) & 8) != 0) {
    return 45;
  }
  unsigned int v16 = block_size;
  unint64_t v79 = v14;
  if (userfs_file_is_compressed(v12, v11)) {
    return 45;
  }
  if (v79 >> 55) {
    return 27;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v17 = v16 - 1;
  BOOL v18 = (v17 & a2) == 0;
  uint64_t v77 = v16;
  if (v16 <= a3) {
    BOOL v18 = 0;
  }
  BOOL v19 = (v17 & a2) != 0 || v16 > a3;
  int v20 = !v18;
  if ((v79 & v17) != 0) {
    BOOL v21 = v19;
  }
  else {
    BOOL v21 = (v17 & a2) != 0;
  }
  if ((v79 & v17) != 0) {
    int v22 = v20;
  }
  else {
    int v22 = 0;
  }
  unint64_t __src = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v88 = (void *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v23 = calculate_num_complete_blocks(a2, a3, v16);
  char v24 = v22;
  unint64_t v74 = v23;
  BOOL v75 = v21;
  if (v21 || v22)
  {
    int v25 = (char *)_apfs_calloc(1uLL, v16);
    BOOL v72 = v21;
    char v24 = v22;
    BOOL v76 = v25;
    if (!v25)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_ufileop_write_cold_1();
      }
      return 12;
    }
  }
  else
  {
    BOOL v76 = 0;
    BOOL v72 = 0;
  }
  char v71 = v24;
  unsigned int v26 = 0;
  long long v80 = (pthread_rwlock_t *)(v11 + 128);
  for (int i = 1; ; int i = v31 ^ 1)
  {
    if (i) {
      apfs_io_lock_exclusive(v12, v11);
    }
    else {
      apfs_io_lock_shared(v12, v11);
    }
    int v28 = pthread_rwlock_wrlock(v80);
    if (v28) {
      panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1230, v28);
    }
    if ((*(unsigned char *)(v11 + 120) & 0x10) != 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_ufileop_write_cold_9();
      }
      uint64_t v34 = 0;
      unint64_t v35 = 0;
      BOOL v36 = 0;
      unsigned int v84 = 22;
      goto LABEL_63;
    }
    clear_ino_purgeable_state_(v12, v11, 0);
    uint64_t dstream = (void *)fs_get_dstream(v12, v11);
    uint64_t v88 = dstream;
    unint64_t v30 = dstream ? *dstream : 0;
    unint64_t __src = v30;
    int v78 = i;
    int v31 = i | (v79 <= v30);
    if (v31) {
      break;
    }
    int v33 = pthread_rwlock_unlock(v80);
    if (v33) {
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1259, v33);
    }
    apfs_io_unlock_shared(v12, v11);
LABEL_55:
    ++v26;
  }
  if (v26 <= 2 && ((v78 ^ 1) & 1) == 0 && v79 <= v30)
  {
    int v32 = pthread_rwlock_unlock(v80);
    if (v32) {
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1268, v32);
    }
    apfs_io_unlock_exclusive(v12, v11);
    goto LABEL_55;
  }
  unsigned int v84 = clone_extents_if_needed(v12, v11, 0);
  if (v84)
  {
    LOBYTE(i) = v78;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      apfs_ufileop_write_cold_8();
    }
    uint64_t v34 = 0;
    unint64_t v35 = 0;
    BOOL v36 = 0;
LABEL_63:
    int v37 = 1;
    int v38 = v76;
    goto LABEL_64;
  }
  uint64_t v42 = (void *)fs_get_dstream(v12, v11);
  uint64_t v88 = v42;
  BOOL v43 = v42 == 0;
  if (v42)
  {
    unint64_t v69 = 0;
    uint64_t v70 = 0;
    int v37 = 0;
    goto LABEL_85;
  }
  unint64_t v48 = (a3 + v16 - 1) / v16;
  int v37 = 1;
  unint64_t v69 = v48;
  uint64_t v70 = v48 / 0x32 + 3;
  unsigned int v84 = fs_tx_enter(v12, 1, v70, v48, (uint64_t *)&v85);
  if (v84)
  {
LABEL_92:
    BOOL v36 = 0;
    goto LABEL_93;
  }
  uint64_t v42 = (void *)fs_create_dstream(v12, v11, v85, (int *)&v84);
  uint64_t v88 = v42;
  if (!v42)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      apfs_ufileop_write_cold_2();
    }
    goto LABEL_92;
  }
LABEL_85:
  unint64_t v45 = *v42;
  unint64_t v44 = v42[1];
  unint64_t __src = *v42;
  *(void *)(v11 + 120) |= 0x10000000uLL;
  unint64_t v46 = v79;
  if (v79 <= v44)
  {
LABEL_100:
    unint64_t v66 = v45;
    if (v46 > v45)
    {
      unint64_t v50 = v45;
      if (!v85)
      {
        unsigned int v84 = fs_tx_enter(v12, 1, 1, 0, (uint64_t *)&v85);
        BOOL v36 = v37 != 0;
        if (v84)
        {
          unint64_t v35 = 0;
          int v37 = 1;
          int v38 = v76;
          LOBYTE(i) = v78;
          uint64_t v34 = 1;
          goto LABEL_64;
        }
        unint64_t v50 = __src;
        unint64_t v69 = 0;
        uint64_t v70 = 1;
        unint64_t v46 = v79;
      }
      *(void *)(v11 + 368) = v50;
      *(void *)(v11 + 120) |= 0x4000000000000uLL;
      *uint64_t v88 = v46;
      if (xf_get((unsigned __int16 *)(v11 + 416), 5, 0, (char *)&__dst, 8uLL) || __dst > __src)
      {
        xf_set((unsigned __int16 *)(v11 + 416), 5, 0, &__src, 8uLL);
        *(void *)(v11 + 120) |= 0x100uLL;
        uint64_t v88 = 0;
      }
    }
    uint64_t v83 = 0;
    memset(v82, 0, sizeof(v82));
    update_size_tracking(v12, v11, v82, v85);
    ++*(_DWORD *)(v11 + 88);
    BOOL v67 = v85 == 0;
    if (v85)
    {
      update_jobj(v12, 1, (unsigned __int8 *)v11, v85);
      fs_tx_leave(v12, 1, v70, v69, v85);
      unint64_t v85 = 0;
    }
    int v51 = pthread_rwlock_unlock(v80);
    if (v51) {
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1396, v51);
    }
    if (*(unsigned char *)(*(void *)(v12 + 376) + 264))
    {
      unint64_t v52 = 0;
    }
    else
    {
      unint64_t v52 = userfs_crypto_alloc_cst(v12);
      if (!v52) {
        return 12;
      }
    }
    if (v84)
    {
      unint64_t v73 = a3;
    }
    else
    {
      __int16 v68 = v52;
      unint64_t v53 = a3;
      BOOL v54 = v72;
      while (1)
      {
        memset(v81, 170, sizeof(v81));
        *(void *)int buf = a1;
        *(void *)&buf[8] = a2;
        *(void *)&buf[16] = v53;
        *(void *)&buf[24] = &v81[3];
        *(void *)&buf[32] = &v81[1];
        unint64_t v91 = 0xAAAAAAAA00000002;
        *(void *)&long long v90 = v81;
        *((void *)&v90 + 1) = &v81[2];
        unsigned int v84 = userfs_internal_blockmap((uint64_t)buf);
        unint64_t v73 = v53;
        if (v84) {
          break;
        }
        if (v54)
        {
          if (v75)
          {
            if ((unint64_t)v16 - v81[0] >= v53) {
              size_t v55 = v53;
            }
            else {
              size_t v55 = v16 - v81[0];
            }
          }
          else
          {
            size_t v55 = v79 - a2;
          }
          v81[1] = v55;
          unsigned int v84 = userfs_combine_block_and_buf(a1, a2, v7, v55, __src <= a2 / v16 * v16, v76);
          if (v84)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              apfs_ufileop_write_cold_5();
            }
            goto LABEL_144;
          }
          unint64_t v56 = 0;
          long long v57 = v68;
        }
        else
        {
          unint64_t v56 = ((unint64_t)v16 - 1 + v81[1]) / v16;
          long long v57 = v68;
          if (v56 > v74)
          {
            v81[1] = v74 * v16;
            unint64_t v56 = v74;
          }
        }
        if (v57) {
          *(void *)(v57[9] + 8) = v81[2];
        }
        unsigned int v84 = dev_write_data(*(void **)(*(void *)(v12 + 392) + 384), v81[3]);
        if (v84)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            apfs_ufileop_write_cold_4();
          }
          goto LABEL_144;
        }
        BOOL v75 = 0;
        a2 += v81[1];
        v7 += v81[1];
        v74 -= v56;
        if (v74) {
          BOOL v54 = 0;
        }
        else {
          BOOL v54 = v71;
        }
        v53 -= v81[1];
        if (v73 == v81[1])
        {
          unint64_t v73 = 0;
          goto LABEL_144;
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_ufileop_write_cold_6();
      }
LABEL_144:
      unint64_t v52 = v68;
    }
    if (v52) {
      crypto_obj_release(v52);
    }
    unsigned int v58 = v84;
    if (v84)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v64 = *(void *)(v11 + 8);
        uint64_t v65 = *(void *)(v11 + 32);
        *(_DWORD *)int buf = 136316930;
        *(void *)&uint8_t buf[4] = "apfs_ufileop_write";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1571;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v64;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v65;
        *(_WORD *)&buf[38] = 1024;
        LODWORD(v90) = v58;
        WORD2(v90) = 2048;
        *(void *)((char *)&v90 + 6) = __src;
        HIWORD(v90) = 2048;
        unint64_t v91 = a2;
        __int16 v92 = 2048;
        unint64_t v93 = v73;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: ### obj-id %lld/%lld error %d filesize %llu offset %lld resid %zu ###\n", buf, 0x4Au);
        unsigned int v58 = v84;
      }
      if (v58 == 9) {
        goto LABEL_151;
      }
    }
    if (v79 <= v66)
    {
      int v62 = pthread_rwlock_wrlock(v80);
      if (v62) {
        panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1598, v62);
      }
    }
    else
    {
      unsigned int v59 = apfs_remove_prev_fsize(v12, v11, 0);
      if (v59)
      {
        unsigned int v60 = v59;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          apfs_ufileop_write_cold_3();
        }
        if (v60 == 9 || !v84)
        {
          unsigned int v84 = v60;
          if (v60 == 9)
          {
LABEL_151:
            int v37 = 0;
LABEL_169:
            int v38 = v76;
            LOBYTE(i) = v78;
            unint64_t v35 = v69;
            uint64_t v34 = v70;
            BOOL v36 = v67;
            goto LABEL_64;
          }
        }
      }
      int v61 = pthread_rwlock_wrlock(v80);
      if (v61) {
        panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1595, v61);
      }
      *(void *)(v11 + 120) &= ~0x4000000000000uLL;
    }
    if (v79 > *(void *)(v11 + 368)) {
      *(void *)(v11 + 368) = v79;
    }
    update_time(v12, (void *)v11, 3);
    uint64_t v63 = fs_get_dstream(v12, v11);
    uint64_t v88 = (void *)v63;
    if (v63) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v63 + 24), a3 - v73, memory_order_relaxed);
    }
    *a5 = a3 - v73;
    int v37 = 1;
    goto LABEL_169;
  }
  BOOL v67 = v43;
  unint64_t v47 = v85;
  if (v85) {
    goto LABEL_87;
  }
  unint64_t v49 = (a3 + v16 - 1) / v16;
  int v37 = 1;
  unint64_t v69 = v49;
  uint64_t v70 = v49 / 0x32 + 3;
  unsigned int v84 = fs_tx_enter(v12, 1, v70, v49, (uint64_t *)&v85);
  if (v84) {
    goto LABEL_169;
  }
  unint64_t v47 = v85;
  unint64_t v46 = v79;
LABEL_87:
  *(void *)int buf = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v84 = alloc_space_for_write(v12, v11, &v88, 16, v46, 0, (uint64_t *)buf, v47);
  if (!v84)
  {
    int v37 = 1;
    unint64_t v45 = __src;
    unint64_t v46 = v79;
    goto LABEL_100;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    apfs_ufileop_write_cold_7();
  }
  int v37 = 1;
  BOOL v36 = 1;
LABEL_93:
  int v38 = v76;
  LOBYTE(i) = v78;
  unint64_t v35 = v69;
  uint64_t v34 = v70;
LABEL_64:
  uint64_t v39 = v85;
  if (v85)
  {
    if (v84 != 9 && v36)
    {
      update_jobj(v12, 1, (unsigned __int8 *)v11, v85);
      uint64_t v39 = v85;
    }
    fs_tx_leave(v12, 1, v34, v35, v39);
    unint64_t v85 = 0;
  }
  if (v37)
  {
    int v41 = pthread_rwlock_unlock(v80);
    if (v41) {
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1635, v41);
    }
  }
  if (i) {
    apfs_io_unlock_exclusive(v12, v11);
  }
  else {
    apfs_io_unlock_shared(v12, v11);
  }
  if (v38) {
    _apfs_free(v38, v77);
  }
  return v84;
}

uint64_t apfs_ufileop_getxattr(uint64_t *a1, char *a2, void *a3, unint64_t a4, size_t *a5)
{
  if (!a1) {
    return 22;
  }
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  int v11 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v10 + 128));
  if (v11) {
    panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1862, v11);
  }
  uint64_t v12 = apfs_ufileop_getxattr_data(v9, v10, a2, a3, a4, a5);
  int v13 = pthread_rwlock_unlock((pthread_rwlock_t *)(v10 + 128));
  if (v13) {
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1864, v13);
  }
  return v12;
}

uint64_t apfs_ufileop_getxattr_data(uint64_t a1, uint64_t a2, char *a3, void *a4, unint64_t a5, size_t *a6)
{
  BOOL v18 = 0;
  uint64_t v6 = 22;
  if (a3 && a6)
  {
    int v13 = xattr_name_to_kind(a3);
    if (v13 == 1)
    {
      if ((*(unsigned char *)(a2 + 72) & 0x40) == 0) {
        return 93;
      }
    }
    else if (v13 == 4 || v13 == 3 && (*(unsigned char *)(a2 + 73) & 1) == 0)
    {
      return 93;
    }
    if (fs_get_xattr(a1, *(void *)(a2 + 8), (uint64_t *)(a2 + 328), a3, &v18)) {
      goto LABEL_15;
    }
    uint64_t v14 = v18;
    int v15 = *((_DWORD *)v18 + 4);
    if ((v15 & 4) != 0) {
      goto LABEL_15;
    }
    if ((v15 & 2) != 0)
    {
      size_t v17 = *((unsigned __int16 *)v18 + 11);
    }
    else
    {
      if ((v15 & 1) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          apfs_ufileop_getxattr_data_cold_1();
        }
LABEL_15:
        uint64_t v6 = 93;
LABEL_16:
        jobj_release(a1, v18);
        return v6;
      }
      size_t v17 = *(void *)&v18[*((unsigned __int16 *)v18 + 10) + 32];
    }
    uint64_t v6 = 0;
    *a6 = v17;
    if (a4 && v17)
    {
      if (v17 <= a5)
      {
        if ((v15 & 2) != 0)
        {
          memcpy(a4, &v14[*((unsigned __int16 *)v14 + 10) + 24], *((unsigned __int16 *)v14 + 11));
          uint64_t v6 = 0;
        }
        else
        {
          uint64_t v6 = apfs_ufile_getxattr_stream(a1, (uint64_t)v14, v17, (char *)a4, a5);
        }
      }
      else
      {
        uint64_t v6 = 34;
      }
    }
    goto LABEL_16;
  }
  return v6;
}

uint64_t apfs_ufile_getxattr_stream(uint64_t a1, uint64_t a2, size_t a3, char *a4, unint64_t a5)
{
  unsigned int block_size = apfs_get_block_size(a1);
  size_t v11 = block_size;
  uint64_t v12 = block_size - 1;
  if ((v12 + a3) / block_size * block_size <= a5) {
    size_t v13 = (v12 + a3) / block_size * block_size;
  }
  else {
    size_t v13 = a3;
  }
  if (!v13) {
    return 0;
  }
  size_t v26 = a3;
  unint64_t v27 = (v12 + a3) / block_size * block_size;
  unint64_t v14 = 0;
  unint64_t v15 = *(void *)(a2 + *(unsigned __int16 *)(a2 + 20) + 24);
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v29 = v16;
  long long v30 = v16;
  long long v28 = v16;
  while (1)
  {
    uint64_t v17 = lookup_file_extent(a1, v15, v14, 0, 0, (uint64_t)&v28);
    if (v17) {
      return v17;
    }
    size_t v18 = *((void *)&v30 + 1);
    if (*((void *)&v30 + 1) + v14 >= a5) {
      break;
    }
    if (v13 >= *((void *)&v30 + 1) + v14)
    {
      v14 += *((void *)&v30 + 1);
    }
    else
    {
      size_t v18 = (v12 + v13) / v11 * v11;
      v14 += v18;
      size_t v13 = v18;
    }
    uint64_t v19 = apfs_ufile_xattr_read(a1, a4, (uint64_t)&v28, v18, v11);
    if (!v19)
    {
      a4 += v18;
      v13 -= v18;
      if (v13) {
        continue;
      }
    }
    return v19;
  }
  if (v27 <= a5) {
    return apfs_ufile_xattr_read(a1, a4, (uint64_t)&v28, v27 - v14, v11);
  }
  if (!*((void *)&v29 + 1))
  {
    bzero(a4, v26 - v14);
    return 0;
  }
  size_t v20 = v27 - v14;
  unint64_t v21 = (v27 - v14) / v11;
  if (v21 >= 2)
  {
    size_t v22 = v20 - v11;
    uint64_t v19 = apfs_ufile_xattr_read(a1, a4, (uint64_t)&v28, v22, v11);
    if (v19) {
      return v19;
    }
    a4 += v22;
    v13 -= v22;
    *((void *)&v29 + 1) = v21 + *((void *)&v29 + 1) - 1;
    size_t v20 = v11;
  }
  unint64_t v23 = _apfs_malloc(v11);
  if (!v23) {
    return 12;
  }
  char v24 = v23;
  uint64_t v19 = apfs_ufile_xattr_read(a1, v23, (uint64_t)&v28, v20, v11);
  if (!v19) {
    memcpy(a4, v24, v13);
  }
  _apfs_free(v24, v11);
  return v19;
}

uint64_t apfs_ufileop_setxattr(uint64_t **a1, char *__s1, void *a3, unint64_t a4, int a5)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v63 = v5;
  long long v64 = v5;
  v62[1] = v5;
  v62[2] = v5;
  v62[0] = v5;
  uint64_t v6 = 22;
  if (!a1 || !__s1) {
    return v6;
  }
  uint64_t v67 = 0;
  unint64_t v68 = 0;
  unint64_t v66 = 0;
  uint64_t v8 = *a1;
  if (*((_DWORD *)*a1 + 275)) {
    return 30;
  }
  uint64_t v12 = (uint64_t)a1[1];
  size_t v13 = strnlen(__s1, 0x80uLL);
  if (v13 > 0x7F) {
    return 63;
  }
  size_t v14 = v13;
  if (userfs_file_is_compressed((uint64_t)v8, v12)) {
    return 45;
  }
  int v15 = xattr_name_to_kind(__s1);
  if (v15 == 4) {
    return 45;
  }
  if (a5 != 3)
  {
    int v17 = v15;
    if ((v15 - 5) < 3 || a4 != 32 && v15 == 3) {
      return v6;
    }
    if (a4 >> 55) {
      return 27;
    }
    unsigned int v70 = -1431655766;
    unsigned int v69 = -1431655766;
    char v61 = -86;
    uint64_t tree = jfs_get_tree((uint64_t)v8, 1, 0, (uint64_t *)&v66);
    if (tree)
    {
      uint64_t v6 = tree;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_ufileop_setxattr_cold_6();
      }
      return v6;
    }
    size_t v19 = v14 + 1;
    BOOL v20 = should_embed_xattr((uint64_t)v66, v17, v14 + 1, a4);
    unsigned int v70 = v14 + 11;
    size_t v60 = (v14 + 11);
    unint64_t v21 = _apfs_malloc(v60);
    if (!v21)
    {
      uint64_t v6 = 12;
      goto LABEL_86;
    }
    size_t v22 = v21;
    unsigned int v23 = a4 + 4;
    if (!v20) {
      unsigned int v23 = 52;
    }
    unsigned int v58 = v23;
    unsigned int v59 = _apfs_malloc(v23);
    if (!v59)
    {
      uint64_t v6 = 12;
LABEL_85:
      _apfs_free(v22, v60);
LABEL_86:
      if (v66) {
        obj_release(v66);
      }
      return v6;
    }
    long long v57 = (uint64_t *)(v12 + 8);
    *(void *)size_t v22 = *(void *)(v12 + 8) & 0xFFFFFFFFFFFFFFFLL | 0x4000000000000000;
    v22[4] = v19;
    memcpy(v22 + 5, __s1, v19);
    if (v20)
    {
      _WORD *v59 = 2;
      v59[1] = a4;
      char v24 = a3;
      unint64_t v25 = a4;
      memcpy(v59 + 2, v24, a4);
    }
    else
    {
      *(_DWORD *)unsigned int v59 = 3145745;
      uint64_t v32 = alloc_xattr_tmp_ino(v8, v12, a4, &v67);
      if (v32)
      {
        uint64_t v6 = v32;
        unsigned int v33 = 52;
LABEL_84:
        _apfs_free(v59, v33);
        goto LABEL_85;
      }
      uint64_t v34 = (char *)a3;
      unint64_t v25 = a4;
      uint64_t v35 = userfs_write_xattr(v8, v67, v34, a4);
      if (v35)
      {
        uint64_t v6 = v35;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v47 = *v57;
          uint64_t v48 = *(void *)(v67 + 8);
          int buf = 136316930;
          BOOL v72 = "apfs_ufileop_setxattr";
          __int16 v73 = 1024;
          int v74 = 2636;
          __int16 v75 = 1024;
          *(_DWORD *)BOOL v76 = v6;
          *(_WORD *)&v76[4] = 2048;
          *(void *)&v76[6] = 0;
          *(_WORD *)&v76[14] = 2048;
          *(void *)&v76[16] = a4;
          *(_WORD *)&v76[24] = 2048;
          *(void *)&v76[26] = v47;
          *(_WORD *)&v76[34] = 2080;
          *(void *)&v76[36] = __s1;
          __int16 v77 = 2048;
          uint64_t v78 = v48;
          _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: I/O failed with %d for I/O %llu:+%zu to ino %llu, xattr '%s', tmp ino %llu\n", (uint8_t *)&buf, 0x4Au);
        }
        unint64_t v27 = 0;
        BOOL v36 = 0;
        uint64_t v56 = -1;
        goto LABEL_75;
      }
      uint64_t v37 = *(void *)(v67 + 32);
      uint64_t dstream = fs_get_dstream((uint64_t)v8, v67);
      if (!dstream)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          apfs_ufileop_setxattr_cold_5();
        }
        unint64_t v27 = 0;
        BOOL v36 = 0;
        uint64_t v56 = -1;
        uint64_t v6 = 92;
        goto LABEL_75;
      }
      long long v40 = *(_OWORD *)(dstream + 16);
      long long v63 = *(_OWORD *)dstream;
      long long v39 = v63;
      long long v64 = v40;
      unint64_t v65 = *(void *)(dstream + 32);
      unint64_t v41 = v65;
      *(void *)(v59 + 2) = v37;
      *(_OWORD *)(v59 + 6) = v39;
      *(_OWORD *)(v59 + 14) = v40;
      *(void *)(v59 + 22) = v41;
    }
    unsigned int v69 = 3808;
    size_t v26 = _apfs_malloc(0xEE0uLL);
    if (!v26)
    {
      uint64_t v6 = 12;
LABEL_83:
      unsigned int v33 = v58;
      goto LABEL_84;
    }
    unint64_t v27 = v26;
    long long v28 = (pthread_rwlock_t *)(v12 + 128);
    int v29 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v12 + 128));
    if (v29) {
      panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 2684, v29);
    }
    uint64_t v30 = bt_lookup_variant(v66, v8[54], (unint64_t *)v22, &v70, 0, v27, &v69, 0, 0, (uint64_t *)(v12 + 328));
    uint64_t v6 = v30;
    if ((v30 | 2) == 2)
    {
      char v61 = v30 == 0;
      if (a5 == 1 && !v30)
      {
        BOOL v31 = 0;
        uint64_t v56 = -1;
        uint64_t v6 = 17;
LABEL_72:
        int v46 = pthread_rwlock_unlock(v28);
        if (v46) {
          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 2889, v46);
        }
        BOOL v36 = v31;
LABEL_75:
        if (v67
          && free_xattr_tmp_ino(v8, v67, 0, v36, v68)
          && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          apfs_ufileop_setxattr_cold_1();
        }
        if (v68)
        {
          fs_tx_leave((uint64_t)v8, 1, v56, 0, v68);
          unint64_t v68 = 0;
        }
        if (v27) {
          _apfs_free(v27, 3808);
        }
        goto LABEL_83;
      }
      if (a5 == 2 && v30)
      {
        BOOL v31 = 0;
        uint64_t v56 = -1;
        uint64_t v6 = 93;
        goto LABEL_72;
      }
      if (v30) {
        goto LABEL_62;
      }
      uint64_t v43 = validate_stream_xattr((uint64_t)v27, v69, v62, &v61);
      if (!v43)
      {
        if (v61)
        {
          uint64_t v42 = *((void *)&v62[0] + 1) / 0x32uLL + 6;
          goto LABEL_63;
        }
LABEL_62:
        uint64_t v42 = 6;
LABEL_63:
        uint64_t v56 = v42;
        uint64_t v44 = fs_tx_enter((uint64_t)v8, 1, v42, 0, (uint64_t *)&v68);
        if (v44)
        {
          uint64_t v6 = v44;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
            apfs_ufileop_setxattr_cold_4();
          }
LABEL_71:
          BOOL v31 = 0;
          goto LABEL_72;
        }
        if (v17 == 3 && !(*(void *)(v59 + 2) | *(void *)(v59 + 6) | *(void *)(v59 + 10) | *(void *)(v59 + 14)))
        {
          bt_remove(v66, v8[54], (unint64_t *)v22, v60, v68);
          BOOL v31 = 0;
          unint64_t v50 = (void *)(v12 + 72);
          unint64_t v51 = -257;
        }
        else
        {
          uint64_t v45 = bt_insert(v66, v8[54], (unint64_t *)v22, v60, (uint64_t)v59, v58, v68);
          if (v45)
          {
            uint64_t v6 = v45;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              uint64_t v54 = *v57;
              int buf = 136316674;
              BOOL v72 = "apfs_ufileop_setxattr";
              __int16 v73 = 1024;
              int v74 = 2814;
              __int16 v75 = 2048;
              *(void *)BOOL v76 = v54;
              *(_WORD *)&v76[8] = 2048;
              *(void *)&v76[10] = 0;
              *(_WORD *)&v76[18] = 2048;
              *(void *)&v76[20] = v25;
              *(_WORD *)&v76[28] = 2080;
              *(void *)&v76[30] = __s1;
              *(_WORD *)&v76[38] = 1024;
              *(_DWORD *)&v76[40] = v6;
              _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: ino %llu, I/O %llu:+%zu, xattr '%s': tree insert failed with %d\n", (uint8_t *)&buf, 0x40u);
            }
            goto LABEL_71;
          }
          BOOL v31 = v67 != 0;
          if (v61)
          {
            if (userfs_free_old_xattr((uint64_t)v8, v12, (uint64_t *)v62, v68)
              && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              apfs_ufileop_setxattr_cold_3();
            }
            char v61 = 0;
          }
          if ((v17 | 2) == 3)
          {
            uint64_t v49 = 256;
            if (v17 == 1) {
              uint64_t v49 = 64;
            }
            *(void *)(v12 + 72) |= v49;
          }
          unint64_t v50 = (void *)(v12 + 120);
          unint64_t v51 = 0xFFFFFFFDFFFFFFFFLL;
        }
        *v50 &= v51;
        update_time((uint64_t)v8, (void *)v12, 2);
        int updated = update_jobj((uint64_t)v8, 1, (unsigned __int8 *)v12, v68);
        if (updated)
        {
          int v53 = updated;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            uint64_t v55 = *v57;
            int buf = 136316418;
            BOOL v72 = "apfs_ufileop_setxattr";
            __int16 v73 = 1024;
            int v74 = 2882;
            __int16 v75 = 2048;
            *(void *)BOOL v76 = v55;
            *(_WORD *)&v76[8] = 2080;
            *(void *)&v76[10] = __s1;
            *(_WORD *)&v76[18] = 2048;
            *(void *)&v76[20] = v25;
            *(_WORD *)&v76[28] = 1024;
            *(_DWORD *)&v76[30] = v53;
            _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: update ino %llu, xattr '%s' size %zu failed, err%d\n", (uint8_t *)&buf, 0x36u);
          }
        }
        uint64_t v6 = 0;
        goto LABEL_72;
      }
      uint64_t v6 = v43;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      apfs_ufileop_setxattr_cold_2();
    }
    BOOL v31 = 0;
    uint64_t v56 = -1;
    goto LABEL_72;
  }

  return userfs_removexattr_internal((uint64_t)v8, v12, __s1);
}

uint64_t userfs_removexattr_internal(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = (pthread_rwlock_t *)(a2 + 128);
  int v7 = pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 128));
  if (v7) {
    panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1959, v7);
  }
  uint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = fs_tx_enter(a1, 2, 4, 0, &v12);
  if (!v8)
  {
    unsigned int v9 = fs_remove_xattr(a1, a2, (uint64_t *)(a2 + 328), a3, 0, v12);
    if (v9)
    {
      if (v9 == 2) {
        uint64_t v8 = 93;
      }
      else {
        uint64_t v8 = v9;
      }
    }
    else
    {
      update_time(a1, (void *)a2, 2);
      if (!strcmp(a3, "com.apple.FinderInfo")) {
        *(void *)(a2 + 72) &= ~0x100uLL;
      }
      update_jobj(a1, 1, (unsigned __int8 *)a2, v12);
      uint64_t v8 = 0;
    }
    fs_tx_leave(a1, 2, 4, 0, v12);
  }
  int v10 = pthread_rwlock_unlock(v6);
  if (v10) {
    panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 1992, v10);
  }
  return v8;
}

uint64_t userfs_write_xattr(void *a1, uint64_t a2, char *a3, unint64_t a4)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  unsigned int block_size = apfs_get_block_size((uint64_t)a1);
  uint64_t dstream = (void *)fs_get_dstream((uint64_t)a1, a2);
  if (!a4) {
    return 0;
  }
  uint64_t v38 = a1[49];
  unint64_t v47 = 0xAAAAAAAAAAAAAAAALL;
  userfs_get_file_sizes((uint64_t)a1, a2, &v47, 0);
  if (v47 < a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      userfs_write_xattr_cold_1();
    }
    return 34;
  }
  unint64_t v10 = a4 % block_size;
  if (v10)
  {
    size_t v11 = _apfs_calloc(1uLL, block_size);
    if (!v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_write_xattr_cold_5();
      }
      return 12;
    }
  }
  else
  {
    size_t v11 = 0;
  }
  uint64_t v12 = 0;
  char v13 = __clz(__rbit32(block_size));
  unint64_t v14 = a4 - v10;
  if (!block_size) {
    char v13 = -1;
  }
  unsigned __int8 v15 = block_size > a4;
  char v36 = v13;
  unint64_t v16 = v14 >> v13;
  if (block_size <= a4) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = 0;
  }
  if ((*(unsigned char *)(a1[47] + 264) & 1) == 0)
  {
    uint64_t v12 = userfs_crypto_alloc_cst((uint64_t)a1);
    if (!v12) {
      return 12;
    }
  }
  unint64_t __dst = v11;
  long long v40 = v12;
  unint64_t v37 = block_size;
  unint64_t v18 = 0;
  uint64_t v19 = block_size - 1;
  uint64_t v35 = a2;
  while (1)
  {
    unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v42 = v20;
    long long v43 = v20;
    long long v41 = v20;
    int v45 = 0;
    uint64_t v21 = fs_map_file_offset(a1, a2, (uint64_t *)&dstream, v18, a4, 2, 0, (uint64_t)&v41, &v45);
    if (v21) {
      break;
    }
    if (!*((void *)&v42 + 1))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_write_xattr_cold_2();
      }
      goto LABEL_52;
    }
    if ((v18 & v19) != 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_write_xattr_cold_4();
      }
      goto LABEL_52;
    }
    unint64_t v22 = *((void *)&v43 + 1);
    if (v18 > (unint64_t)v42)
    {
      unint64_t v22 = v42 - v18 + *((void *)&v43 + 1);
      *((void *)&v43 + 1) = v22;
      *((void *)&v42 + 1) += (v18 - (unint64_t)v42) / v37;
    }
    if (v22 >= a4) {
      size_t v23 = a4;
    }
    else {
      size_t v23 = v22;
    }
    unint64_t v24 = (v23 + v19) >> v36;
    if ((v15 & (v24 > 1)) == 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        userfs_write_xattr_cold_3();
      }
LABEL_52:
      uint64_t v9 = 5;
      goto LABEL_54;
    }
    if (v15 & 1 | (v24 <= v17))
    {
      size_t v25 = v23;
    }
    else
    {
      unint64_t v24 = v17;
      size_t v25 = v17 << v36;
    }
    if (v15) {
      memcpy(__dst, a3, v25);
    }
    if (v40)
    {
      *(void *)int buf = 0xAAAAAAAAAAAAAAAALL;
      get_fext_crypto_logic((uint64_t)a1, (uint64_t)&v41, (uint64_t *)buf);
      *(void *)(v40[9] + 8) = *(void *)buf / v37;
    }
    uint64_t v26 = dev_write_data(*(void **)(v38 + 384), *((uint64_t *)&v42 + 1));
    if (v26)
    {
      uint64_t v9 = v26;
      a2 = v35;
      goto LABEL_54;
    }
    v18 += v25;
    a3 += v25;
    if (v15) {
      unint64_t v27 = 0;
    }
    else {
      unint64_t v27 = v24;
    }
    v17 -= v27;
    v15 |= v17 == 0;
    a4 -= v25;
    a2 = v35;
    if (!a4)
    {
      uint64_t v9 = 0;
      goto LABEL_54;
    }
  }
  uint64_t v9 = v21;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = *(void *)(a2 + 8);
    uint64_t v29 = *(void *)(a2 + 32);
    uint64_t v30 = dstream;
    if (dstream)
    {
      unint64_t v31 = *dstream;
      uint64_t v30 = (void *)dstream[1];
    }
    else
    {
      unint64_t v31 = 0;
    }
    *(_DWORD *)int buf = 136317186;
    *(void *)&uint8_t buf[4] = "userfs_write_xattr";
    __int16 v49 = 1024;
    int v50 = 2161;
    __int16 v51 = 2048;
    uint64_t v52 = v28;
    __int16 v53 = 2048;
    uint64_t v54 = v29;
    __int16 v55 = 1024;
    int v56 = v9;
    __int16 v57 = 2048;
    unint64_t v58 = v18;
    __int16 v59 = 2048;
    unint64_t v60 = a4;
    __int16 v61 = 2048;
    unint64_t v62 = v31;
    __int16 v63 = 2048;
    long long v64 = v30;
    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: ### obj-id %lld/%lld,  error %d, offset %lld, resid %zu, dstream %lld/%lld ###\n", buf, 0x54u);
  }
LABEL_54:
  if (v40) {
    crypto_obj_release(v40);
  }
  if ((v9 > 0x23 || ((1 << v9) & 0x800000003) == 0)
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v33 = *(void *)(a2 + 8);
    uint64_t v34 = *(void *)(a2 + 32);
    *(_DWORD *)int buf = 136316930;
    *(void *)&uint8_t buf[4] = "userfs_write_xattr";
    __int16 v49 = 1024;
    int v50 = 2281;
    __int16 v51 = 2048;
    uint64_t v52 = v33;
    __int16 v53 = 2048;
    uint64_t v54 = v34;
    __int16 v55 = 1024;
    int v56 = v9;
    __int16 v57 = 2048;
    unint64_t v58 = v47;
    __int16 v59 = 2048;
    unint64_t v60 = v18;
    __int16 v61 = 2048;
    unint64_t v62 = a4;
    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: ### obj-id %lld/%lld error %d filesize %lld offset %lld resid %zu ###\n", buf, 0x4Au);
  }
  if (__dst) {
    _apfs_free(__dst, v37);
  }
  return v9;
}

uint64_t userfs_free_old_xattr(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  bzero(v17, 0x290uLL);
  uint64_t v18 = *a3;
  uint64_t v19 = v18;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  v9[2] = 0;
  long long v10 = 0u;
  v9[0] = a1;
  v9[1] = v17;
  v9[3] = v18;
  long long v11 = (unint64_t)(a3 + 1);
  long long v12 = a4;
  uint64_t v7 = do_iterative_file_extent_removal((uint64_t)v9);
  if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    userfs_free_old_xattr_cold_1();
  }
  return v7;
}

uint64_t apfs_ufileop_listxattr(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v4 = 22;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (a1 && a4)
  {
    uint64_t v6 = *(unint64_t **)a1;
    uint64_t v7 = *(void *)(a1 + 8);
    uint64_t v14 = v7;
    v11[0] = a2;
    v11[1] = a3;
    BYTE4(v13) = 1;
    LODWORD(v15) = 1572868;
    uint64_t v16 = *(void *)(v7 + 8);
    int v8 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v7 + 128));
    if (v8) {
      panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 2971, v8);
    }
    iterate_jobjs_with_hint(v6, 1, 0, (unsigned __int8 *)&v15, (uint64_t (*)(long long *, uint64_t))xattr_collector, (uint64_t)v11, (_OWORD *)(v7 + 328), 4u);
    int v9 = pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 128));
    if (v9) {
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 2974, v9);
    }
    uint64_t v4 = v13;
    *a4 = v12;
  }
  return v4;
}

uint64_t apfs_ufileop_remove(uint64_t *a1, const char *a2, uint64_t a3)
{
  if (a1 && a2) {
    return userfs_internal_remove(a1, a2, 1, a3);
  }
  else {
    return 22;
  }
}

uint64_t apfs_ufileop_create(uint64_t *a1, char *__s1, uint64_t a3, uint64_t *a4)
{
  uint64_t common = 22;
  if (a1)
  {
    if (__s1)
    {
      if (a3)
      {
        if (a4)
        {
          uint64_t v9 = *a1;
          uint64_t common = userfs_create_common(a1, __s1, a3, a4, 1, 0);
          if (!common)
          {
            if ((*(void *)(a3 + 8) & 0xFFFFFFFFFFFFFFE5) != 0)
            {
              uint64_t v11 = *a4;
              uint64_t common = userfs_set_ufa_common(v9, *(void *)(*a4 + 8), a3, 0);
              if (common)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  apfs_ufileop_create_cold_2();
                }
                if (userfs_internal_remove(a1, __s1, 0, 0)
                  && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  apfs_ufileop_create_cold_1();
                }
                userfs_internal_reclaim(v11);
                *a4 = 0;
              }
            }
            else
            {
              return 0;
            }
          }
        }
      }
    }
  }
  return common;
}

uint64_t apfs_ufileop_rename(uint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4, unint64_t *a5, unint64_t a6)
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v122 = v6;
  long long v123 = v6;
  uint64_t sibling_link = 22;
  if (!a1 || !a3 || !a4 || !a6) {
    return sibling_link;
  }
  unint64_t v126 = 0;
  unint64_t v127 = 0;
  uint64_t v132 = 0;
  uint64_t v124 = 0;
  uint64_t v125 = 0;
  v135 = 0;
  int v133 = 0;
  unint64_t v129 = 0;
  uint64_t v12 = *a1;
  if (a2)
  {
    unint64_t v13 = a2[1];
    if (a5)
    {
LABEL_7:
      unint64_t v14 = a5[1];
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v13 = 0;
    if (a5) {
      goto LABEL_7;
    }
  }
  unint64_t v14 = 0;
LABEL_10:
  if (*(_DWORD *)(v12 + 1100)) {
    return 30;
  }
  unint64_t v15 = a1[1];
  unint64_t v16 = *(void *)(a4 + 8);
  uint64_t v17 = *(void *)(*(void *)(v12 + 376) + 56);
  char v134 = -86;
  size_t v131 = 0xAAAAAAAAAAAAAAAALL;
  size_t v130 = 0xAAAAAAAAAAAAAAAALL;
  memset(__dst, 170, sizeof(__dst));
  if (*(unsigned char *)v16 == 1) {
    return 13;
  }
  unint64_t v118 = v15;
  uint64_t sibling_link = userfs_check_name((const char *)a3, 0, &v131);
  if (!sibling_link)
  {
    uint64_t sibling_link = userfs_check_name((const char *)a6, 1, &v130);
    if (!sibling_link)
    {
      if (*(unsigned char *)a3 == 46 && (v131 == 1 || v131 == 2 && *(unsigned char *)(a3 + 1) == 46)
        || *(unsigned char *)a6 == 46 && (v130 == 1 || v130 == 2 && *(unsigned char *)(a6 + 1) == 46))
      {
        return 22;
      }
      uint64_t v19 = *(void *)(v12 + 488);
      if (v19)
      {
        uint64_t v20 = *(void *)(v19 + 8);
        if (*(void *)(v118 + 8) == v20 || *(void *)(v16 + 8) == v20) {
          return 13;
        }
      }
      uint64_t v21 = (uint64_t *)a2;
      if (a2 || (uint64_t v21 = (uint64_t *)_apfs_calloc(1uLL, 0x10uLL)) != 0)
      {
        int v117 = v21;
        unint64_t v22 = (uint64_t *)a5;
        if (a5 || (unint64_t v22 = (uint64_t *)_apfs_calloc(1uLL, 0x10uLL)) != 0)
        {
          uint64_t v116 = v22;
          if (v118 == v16)
          {
            int v26 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
            if (!v26) {
              goto LABEL_55;
            }
            int v112 = v26;
            int v25 = 3388;
          }
          else
          {
            if (*(void *)(v118 + 24) == *(void *)(v16 + 8))
            {
              int v23 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v16 + 128));
              if (v23) {
                panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3371, v23);
              }
              int v24 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
              if (v24)
              {
                int v112 = v24;
                int v25 = 3372;
                goto LABEL_54;
              }
LABEL_55:
              if ((*(unsigned char *)(v118 + 120) & 0x18) != 0 || (*(unsigned char *)(v16 + 120) & 0x18) != 0)
              {
                BOOL v31 = 0;
                BOOL v32 = 0;
                BOOL v33 = 0;
                uint64_t sibling_link = 22;
                goto LABEL_58;
              }
              *(void *)&long long v122 = v12;
              *((void *)&v122 + 1) = v118;
              *(void *)&long long v123 = a3;
              *((void *)&v123 + 1) = v131;
              uint64_t v39 = userfs_internal_lookup((uint64_t)&v122, 0, (uint64_t *)&v125, &v129, &__dst[1]);
              if (v39)
              {
                uint64_t sibling_link = v39;
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  apfs_ufileop_rename_cold_15();
                }
LABEL_92:
                BOOL v31 = 0;
                BOOL v32 = 0;
                BOOL v33 = 0;
                goto LABEL_58;
              }
              BOOL v115 = v13 == 0;
              if (!v13)
              {
                uint64_t inode = userfs_load_inode(v12, v118, v129, __dst[1], v117);
                if (inode)
                {
                  uint64_t sibling_link = inode;
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    apfs_ufileop_rename_cold_14();
                  }
                  goto LABEL_92;
                }
                unint64_t v13 = v117[1];
              }
              uint64_t v42 = *(void *)(v13 + 8);
              uint64_t v114 = (uint64_t *)(v13 + 8);
              if (v42 == v129)
              {
                uint64_t v43 = *(void *)(v12 + 488);
                if (v43 && v42 == *(void *)(v43 + 8) || *(unsigned char *)v13 == 1)
                {
                  BOOL v32 = 0;
LABEL_103:
                  BOOL v33 = 0;
                  uint64_t sibling_link = 1;
LABEL_108:
                  BOOL v31 = v115;
LABEL_58:
                  if (v125)
                  {
                    jobj_release(v12, v125);
                    uint64_t v125 = 0;
                  }
                  uint64_t v34 = v117;
                  if (a2) {
                    goto LABEL_64;
                  }
                  goto LABEL_61;
                }
                if (v125)
                {
                  if ((*(_WORD *)(v13 + 104) & 0xF000) != 0x4000
                    || !userfs_check_parent_chain(v12, v16, v13))
                  {
                    *(void *)&long long v122 = v12;
                    *((void *)&v122 + 1) = v16;
                    *(void *)&long long v123 = a6;
                    *((void *)&v123 + 1) = v130;
                    if (userfs_internal_lookup((uint64_t)&v122, 0, (uint64_t *)&v124, &__dst[2], 0))
                    {
                      int v113 = 0;
                      unint64_t v14 = 0;
                      BOOL v45 = 1;
                      goto LABEL_118;
                    }
                    BOOL v32 = v14 == 0;
                    if (v14)
                    {
                      int v113 = 0;
                    }
                    else
                    {
                      uint64_t v50 = userfs_load_inode(v12, v16, __dst[2], __dst[1], v116);
                      if (v50)
                      {
                        uint64_t sibling_link = v50;
                        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                          apfs_ufileop_rename_cold_12();
                        }
                        unint64_t v14 = 0;
                        BOOL v32 = 0;
                        goto LABEL_209;
                      }
                      unint64_t v14 = v116[1];
                      int v113 = 1;
                    }
                    uint64_t v48 = *(void *)(v14 + 8);
                    if (v48 == __dst[2])
                    {
                      if (*(unsigned char *)v14 == 1) {
                        goto LABEL_103;
                      }
                      uint64_t v49 = *v114;
                      if (*(void *)(v118 + 8) == *(void *)(v16 + 8) && v49 == v48)
                      {
                        if (!utf8_normalizeOptCaseFoldAndCompare(*((void *)v125 + 8), *((unsigned __int16 *)v125 + 31) - 1, a6, v130, (v17 & 1) == 0, (BOOL *)&v134)&& v134)
                        {
                          jobj_release(v12, v124);
                          unint64_t v14 = 0;
                          uint64_t v124 = 0;
                          goto LABEL_210;
                        }
                        uint64_t v49 = *v114;
                        uint64_t v48 = *(void *)(v14 + 8);
                      }
                      if (v49 != v48)
                      {
LABEL_210:
                        if (v14 == v118)
                        {
                          BOOL v33 = 0;
                          uint64_t sibling_link = 66;
                          unint64_t v14 = v118;
                          goto LABEL_108;
                        }
                        if (v14)
                        {
                          uint64_t v67 = *(void *)(v12 + 488);
                          if (v67)
                          {
                            if (*(void *)(v14 + 8) == *(void *)(v67 + 8))
                            {
                              BOOL v33 = 0;
                              uint64_t sibling_link = 13;
                              goto LABEL_108;
                            }
                          }
                        }
                        BOOL v45 = v14 == 0;
                        if (v14 && v13 != v14)
                        {
                          if (v13 >= v14)
                          {
                            int v76 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v14 + 128));
                            if (v76) {
                              panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3609, v76);
                            }
                            int v77 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v13 + 128));
                            if (v77) {
                              panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3610, v77);
                            }
                          }
                          else
                          {
                            int v68 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v13 + 128));
                            if (v68) {
                              panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3606, v68);
                            }
                            int v69 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v14 + 128));
                            if (v69) {
                              panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3607, v69);
                            }
                          }
                          BOOL v45 = 0;
LABEL_120:
                          if ((*(unsigned char *)(v13 + 120) & 0x18) != 0)
                          {
                            int v47 = 0;
                            uint64_t sibling_link = 2;
                            goto LABEL_169;
                          }
                          if (xf_get((unsigned __int16 *)v125 + 16, 1, 0, (char *)__dst, 8uLL))
                          {
                            if ((*(_WORD *)(v13 + 104) & 0xF000) != 0x4000
                              && *(int *)(v13 + 80) >= 2
                              && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                            {
                              apfs_ufileop_rename_cold_11();
                            }
                            __dst[0] = 0;
                          }
                          if (v45)
                          {
                            unint64_t v14 = 0;
                          }
                          else
                          {
                            int v51 = *(_WORD *)(v13 + 104) & 0xF000;
                            if (*((void *)v124 + 2) == *(void *)(v13 + 8))
                            {
                              if (v51 != 0x8000 || (int v52 = 0, *(_DWORD *)(v13 + 80) == 1))
                              {
                                int v47 = 0;
                                uint64_t sibling_link = 22;
                                goto LABEL_169;
                              }
                            }
                            else if (v51 == 0x4000)
                            {
                              if ((*(_WORD *)(v14 + 104) & 0xF000) != 0x4000)
                              {
                                int v47 = 0;
                                uint64_t sibling_link = 20;
                                goto LABEL_169;
                              }
                              int v52 = 1;
                            }
                            else
                            {
                              int v52 = 0;
                            }
                            if ((*(unsigned char *)(v14 + 120) & 0x18) != 0)
                            {
                              int v53 = pthread_rwlock_unlock((pthread_rwlock_t *)(v14 + 128));
                              if (v53) {
                                panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3666, v53);
                              }
                              jobj_release(v12, v124);
                              unint64_t v14 = 0;
                              uint64_t v124 = 0;
                            }
                            else if ((*(_WORD *)(v14 + 104) & 0xF000) == 0x4000)
                            {
                              if (!v52)
                              {
                                int v47 = 0;
                                uint64_t sibling_link = 21;
                                goto LABEL_169;
                              }
                              if (!apfs_is_dir_empty((unint64_t *)v12, v14))
                              {
                                int v47 = 0;
                                uint64_t sibling_link = 66;
                                goto LABEL_169;
                              }
                            }
                          }
                          int v54 = set_dir_stats_for_rename(v12, v13, v16, v118, &v132);
                          if (v54)
                          {
                            int v55 = v54;
                            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                              apfs_ufileop_rename_cold_10((int)v114, v16, v55);
                            }
                          }
                          uint64_t v56 = fs_tx_enter(v12, 1, 9, 0, (uint64_t *)&v126);
                          if (v56)
                          {
                            uint64_t sibling_link = v56;
LABEL_168:
                            int v47 = 0;
                            goto LABEL_169;
                          }
                          if (!v14)
                          {
                            uint64_t v62 = dir_rec_alloc(v12, 1, (const char *)a6, v130, *(void *)(v16 + 8), *v114, &v124);
                            if (v62)
                            {
                              uint64_t sibling_link = v62;
                              unint64_t v14 = 0;
                              goto LABEL_168;
                            }
                            BOOL v72 = v124;
                            char v71 = v125;
                            *((_WORD *)v124 + 30) = *((_WORD *)v125 + 30);
                            if (v118 == v16)
                            {
                              int v47 = 0;
                              unint64_t v75 = v16;
                              goto LABEL_251;
                            }
                            int v47 = 0;
                            unint64_t v73 = v118;
                            --*(_DWORD *)(v118 + 80);
                            int v74 = 1;
                            unint64_t v75 = v16;
LABEL_249:
                            ++*(_DWORD *)(v73 + 88);
LABEL_250:
                            *(_DWORD *)(v75 + 80) += v74;
LABEL_251:
                            ++*(_DWORD *)(v75 + 88);
                            if (v118 == v16)
                            {
                              *((void *)v72 + 3) = *((void *)v71 + 3);
                            }
                            else
                            {
                              uint64_t timestamp = get_timestamp();
                              char v71 = v125;
                              *((void *)v124 + 3) = timestamp;
                            }
                            v71[1] = 3;
                            uint64_t v80 = remove_jobj(v12, 1, v71, v126);
                            if (v80)
                            {
                              uint64_t sibling_link = v80;
                              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                                goto LABEL_256;
                              }
                              uint64_t v99 = *((void *)v125 + 2);
                              if (v14) {
                                unint64_t v100 = *(void *)(v14 + 8);
                              }
                              else {
                                unint64_t v100 = 0;
                              }
                              *(_DWORD *)int buf = 136316162;
                              uint64_t v137 = "apfs_ufileop_rename";
                              __int16 v138 = 1024;
                              int v139 = 3905;
                              __int16 v140 = 2048;
                              uint64_t v141 = v99;
                              __int16 v142 = 2048;
                              unint64_t v143 = v100;
                              __int16 v144 = 1024;
                              *(_DWORD *)BOOL v145 = sibling_link;
                              uint32_t v96 = &_os_log_internal;
                              uint64_t v97 = "%s:%d: *** failed to remove the from drec for ino %lld to_ino %lld: error %d\n";
                              uint32_t v98 = 44;
                            }
                            else
                            {
                              if (__dst[0])
                              {
                                int v82 = remove_sibling_link(v12, *v114, __dst[0], v126);
                                if (v82)
                                {
                                  int v83 = v82;
                                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                                  {
                                    uint64_t v101 = *(void *)(v13 + 8);
                                    int v102 = *(_DWORD *)(v13 + 80);
                                    uint64_t v103 = *((void *)v125 + 1);
                                    uint64_t v104 = *((void *)v125 + 8);
                                    if (v14) {
                                      uint64_t v105 = *(void *)(v14 + 8);
                                    }
                                    else {
                                      uint64_t v105 = 0;
                                    }
                                    *(_DWORD *)int buf = 136317186;
                                    uint64_t v137 = "apfs_ufileop_rename";
                                    __int16 v138 = 1024;
                                    int v139 = 3922;
                                    __int16 v140 = 2048;
                                    uint64_t v141 = v101;
                                    __int16 v142 = 2048;
                                    unint64_t v143 = __dst[0];
                                    __int16 v144 = 1024;
                                    *(_DWORD *)BOOL v145 = v102;
                                    *(_WORD *)&v145[4] = 2048;
                                    *(void *)&v145[6] = v103;
                                    *(_WORD *)&v145[14] = 2080;
                                    *(void *)&v145[16] = v104;
                                    *(_WORD *)&v145[24] = 1024;
                                    *(_DWORD *)&v145[26] = v83;
                                    *(_WORD *)v146 = 2048;
                                    *(void *)&v146[2] = v105;
                                    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to remove the FROM sibling hard link (ino %lld, sib-id %lld, nlink %d) and drec %lld/%s (error %d) (to_ino %lld)\n", buf, 0x50u);
                                  }
                                }
                              }
                              if ((*(_WORD *)(v13 + 104) & 0xF000) == 0x4000 || *(int *)(v13 + 80) < 2)
                              {
                                xf_remove((unsigned __int16 *)v124 + 16, 1);
                              }
                              else
                              {
                                if (!__dst[0]) {
                                  __dst[0] = get_next_apfs_obj_id(v12);
                                }
                                if (xf_set((unsigned __int16 *)v124 + 16, 1, 2, __dst, 8uLL)
                                  && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                                {
                                  apfs_ufileop_rename_cold_6();
                                }
                              }
                              unsigned int v84 = v124;
                              v124[1] = 2;
                              uint64_t inserted = insert_jobj(v12, 1, v84, v126);
                              if (inserted)
                              {
                                uint64_t sibling_link = inserted;
                                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                                  apfs_ufileop_rename_cold_5();
                                }
                                int v86 = insert_jobj(v12, 1, v125, v126);
                                *(void *)(v13 + 24) = *(void *)(v118 + 8);
                                if (v86 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                                {
                                  apfs_ufileop_rename_cold_4();
                                  if (!v14) {
                                    goto LABEL_169;
                                  }
                                }
                                else if (!v14)
                                {
                                  goto LABEL_169;
                                }
                                *(void *)(v14 + 120) &= 0xFFFFFFFF7FFFFFF7;
                                goto LABEL_169;
                              }
                              size_tracking_ino_moved(v12, v13, v118, v16, v126);
                              if ((*(_WORD *)(v13 + 104) & 0xF000) == 0x4000 || *(int *)(v13 + 80) < 2)
                              {
                                uint64_t sibling_link = 0;
                                goto LABEL_256;
                              }
                              uint64_t sibling_link = create_sibling_link(v12, *v114, __dst[0], *((void *)v124 + 1), *((const void **)v124 + 8), *((unsigned __int16 *)v124 + 31), v126);
                              if (!sibling_link || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                                goto LABEL_256;
                              }
                              uint64_t v93 = *(void *)(v16 + 8);
                              unint64_t v94 = *((void *)v124 + 8);
                              uint64_t v95 = *v114;
                              *(_DWORD *)int buf = 136316418;
                              uint64_t v137 = "apfs_ufileop_rename";
                              __int16 v138 = 1024;
                              int v139 = 3998;
                              __int16 v140 = 2048;
                              uint64_t v141 = v93;
                              __int16 v142 = 2080;
                              unint64_t v143 = v94;
                              __int16 v144 = 2048;
                              *(void *)BOOL v145 = v95;
                              *(_WORD *)&v145[8] = 1024;
                              *(_DWORD *)&v145[10] = sibling_link;
                              uint32_t v96 = &_os_log_internal;
                              uint64_t v97 = "%s:%d: failed to create sibling link entry for %lld/%s hardlink key %lld error %d\n";
                              uint32_t v98 = 54;
                            }
                            _os_log_error_impl(&dword_22CAAC000, v96, OS_LOG_TYPE_ERROR, v97, buf, v98);
LABEL_256:
                            int v133 = 0;
                            if (xf_get_ptr_and_size((unsigned __int16 *)(v13 + 416), 4, 0, &v135, &v133)|| v133 <= 0)
                            {
                              v135 = 0;
                            }
                            if (*((void *)v125 + 1) == *(void *)(v13 + 24)
                              && (!v135 || !strcmp(*((const char **)v125 + 8), v135)))
                            {
                              *(void *)(v13 + 24) = *(void *)(v16 + 8);
                              xf_set((unsigned __int16 *)(v13 + 416), 4, 2, *((void **)v124 + 8), *((unsigned __int16 *)v124 + 31));
                            }
                            *(unsigned char *)(v13 + 1) = 2;
                            update_jobj(v12, 1, (unsigned __int8 *)v13, v126);
                            *(unsigned char *)(v118 + 1) = 2;
                            update_jobj(v12, 1, (unsigned __int8 *)v118, v126);
                            unint64_t v81 = v118;
                            if (v118 == v16
                              || (*(unsigned char *)(v16 + 1) = 2,
                                  update_jobj(v12, 1, (unsigned __int8 *)v16, v126),
                                  ++*(_DWORD *)(v118 + 384),
                                  unint64_t v81 = v16,
                                  v14))
                            {
                              ++*(_DWORD *)(v81 + 384);
                            }
                            if (!sibling_link)
                            {
                              if (v14 && v14 != v13) {
                                update_time(v12, (void *)v14, 2);
                              }
                              if (v14 != v13) {
                                update_time(v12, (void *)v13, 2);
                              }
                              update_time(v12, (void *)v16, 3);
                              if (v118 != v16) {
                                update_time(v12, (void *)v118, 3);
                              }
                              uint64_t sibling_link = 0;
                            }
LABEL_169:
                            if (v126)
                            {
                              fs_tx_leave(v12, 1, 9, 0, v126);
                              unint64_t v126 = 0;
                            }
                            if (sibling_link
                              && v132
                              && (int v57 = set_dir_stats_for_rename_cleanup(v12, v13)) != 0
                              && (int v58 = v57, os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)))
                            {
                              apfs_ufileop_rename_cold_3((int)v114, v58);
                              if (v14) {
                                goto LABEL_176;
                              }
                            }
                            else if (v14)
                            {
LABEL_176:
                              if (v14 != v13)
                              {
                                int v59 = pthread_rwlock_unlock((pthread_rwlock_t *)(v14 + 128));
                                if (v59) {
                                  panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4079, v59);
                                }
                              }
                            }
                            int v60 = pthread_rwlock_unlock((pthread_rwlock_t *)(v13 + 128));
                            if (v60) {
                              panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4082, v60);
                            }
                            BOOL v32 = v113 != 0;
                            BOOL v33 = v47 != 0;
                            goto LABEL_108;
                          }
                          if ((*(_WORD *)(v14 + 104) & 0xF000) == 0x4000)
                          {
                            BOOL v61 = 0;
                          }
                          else
                          {
                            int v63 = *(_DWORD *)(v14 + 80);
                            BOOL v61 = v63 > 1;
                            *(_DWORD *)(v14 + 80) = v63 - 1;
                            if (v63 <= 0)
                            {
                              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                                apfs_ufileop_rename_cold_9();
                              }
                              BOOL v61 = 0;
                              *(_DWORD *)(v14 + 80) = 0;
                            }
                          }
                          if (v14 == v13) {
                            goto LABEL_245;
                          }
                          __s1 = (char *)0xAAAAAAAAAAAAAAAALL;
                          int v133 = 0;
                          if ((*(_WORD *)(v14 + 104) & 0xF000) == 0x4000 || !*(_DWORD *)(v14 + 80))
                          {
                            uint64_t v70 = move_inode_to_purgatory(v12, v14, v16, v126);
                            if (v70)
                            {
                              uint64_t sibling_link = v70;
                              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                                apfs_ufileop_rename_cold_7();
                              }
                              goto LABEL_168;
                            }
                            apfs_increment_num_objects(v12, v14, 0xFFFFFFFFFFFFFFFFLL);
                            *(void *)(v14 + 120) |= 0x80000000uLL;
                            int v47 = 1;
LABEL_246:
                            if (xf_get((unsigned __int16 *)v124 + 16, 1, 0, (char *)&v127, 8uLL))
                            {
                              unint64_t v127 = 0;
                            }
                            else if (v127)
                            {
                              int v87 = remove_sibling_link(v12, *(void *)(v14 + 8), v127, v126);
                              if (v87)
                              {
                                int v88 = v87;
                                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                                {
                                  uint64_t v89 = *(void *)(v14 + 8);
                                  int v90 = *(_DWORD *)(v14 + 80);
                                  uint64_t v91 = *((void *)v124 + 1);
                                  uint64_t v92 = *((void *)v124 + 8);
                                  *(_DWORD *)int buf = 136316930;
                                  uint64_t v137 = "apfs_ufileop_rename";
                                  __int16 v138 = 1024;
                                  int v139 = 3842;
                                  __int16 v140 = 2048;
                                  uint64_t v141 = v89;
                                  __int16 v142 = 2048;
                                  unint64_t v143 = v127;
                                  __int16 v144 = 1024;
                                  *(_DWORD *)BOOL v145 = v90;
                                  *(_WORD *)&v145[4] = 2048;
                                  *(void *)&v145[6] = v91;
                                  *(_WORD *)&v145[14] = 2080;
                                  *(void *)&v145[16] = v92;
                                  *(_WORD *)&v145[24] = 1024;
                                  *(_DWORD *)&v145[26] = v88;
                                  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to remove the TO sibling hard link from ino %lld sib-id %lld (nlink %d) for drec %lld/%s error %d\n", buf, 0x46u);
                                }
                              }
                            }
                            BOOL v72 = v124;
                            char v71 = v125;
                            *((void *)v124 + 2) = *v114;
                            *((_WORD *)v72 + 30) = *((_WORD *)v71 + 30);
                            int v74 = -1;
                            unint64_t v73 = v16;
                            unint64_t v75 = v118;
                            if (v118 == v16) {
                              goto LABEL_250;
                            }
                            goto LABEL_249;
                          }
                          if (xf_get_ptr_and_size((unsigned __int16 *)(v14 + 416), 4, 0, &__s1, &v133)
                            || v133 <= 0)
                          {
                            __s1 = 0;
                          }
                          if (v61
                            && *(void *)(v14 + 24) == *((void *)v124 + 1)
                            && (!__s1 || !strcmp(__s1, *((const char **)v124 + 8))))
                          {
                            uint64_t v120 = 0;
                            memset(v119, 0, sizeof(v119));
                            LOBYTE(v119[0]) = 5;
                            *((void *)&v119[0] + 1) = *(void *)(v14 + 8);
                            WORD1(v119[0]) = 40;
                            int v64 = iterate_jobjs((unint64_t *)v12, 1, v126, (unsigned __int8 *)v119, (uint64_t (*)(long long *, uint64_t))fixup_ino_with_sibling, v14);
                            if (xf_get_ptr_and_size((unsigned __int16 *)(v14 + 416), 4, 0, &__s1, &v133)|| v133 <= 0)
                            {
                              uint64_t v65 = 0;
                              __s1 = 0;
                              BOOL v66 = 1;
                            }
                            else
                            {
                              uint64_t v65 = __s1;
                              BOOL v66 = __s1 == 0;
                              if (__s1 && v64) {
                                goto LABEL_242;
                              }
                            }
                            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                            {
                              uint64_t v106 = *(void *)(v14 + 8);
                              unint64_t v107 = *((void *)v124 + 1);
                              uint64_t v108 = *((void *)v124 + 8);
                              int v109 = "no-name";
                              uint64_t v110 = *(void *)(v14 + 24);
                              if (!v66) {
                                int v109 = v65;
                              }
                              int v111 = *(_DWORD *)(v14 + 80);
                              *(_DWORD *)int buf = 136317186;
                              uint64_t v137 = "apfs_ufileop_rename";
                              __int16 v138 = 1024;
                              int v139 = 3807;
                              __int16 v140 = 2048;
                              uint64_t v141 = v106;
                              __int16 v142 = 2048;
                              unint64_t v143 = v107;
                              __int16 v144 = 2080;
                              *(void *)BOOL v145 = v108;
                              *(_WORD *)&v145[8] = 2048;
                              *(void *)&v145[10] = v110;
                              *(_WORD *)&v145[18] = 2080;
                              *(void *)&v145[20] = v109;
                              *(_WORD *)&v145[28] = 1024;
                              *(_DWORD *)v146 = v111;
                              *(_WORD *)&v146[4] = 1024;
                              *(_DWORD *)&v146[6] = v64;
                              _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: !!! failed to fixup to_ino %lld (to_drec ino %lld name %s; to_ino parent/name %ll"
                                "d/%s nlink %d; iret %d)\n",
                                buf,
                                0x50u);
                            }
                          }
LABEL_242:
                          uint64_t updated = update_jobj(v12, 1, (unsigned __int8 *)v14, v126);
                          if (updated)
                          {
                            uint64_t sibling_link = updated;
                            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                              apfs_ufileop_rename_cold_8();
                            }
                            goto LABEL_168;
                          }
LABEL_245:
                          int v47 = 0;
                          goto LABEL_246;
                        }
LABEL_118:
                        int v46 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v13 + 128));
                        if (v46) {
                          panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3604, v46);
                        }
                        goto LABEL_120;
                      }
                      uint64_t sibling_link = 0;
LABEL_209:
                      BOOL v33 = 0;
                      goto LABEL_108;
                    }
LABEL_107:
                    BOOL v33 = 0;
                    uint64_t sibling_link = 22;
                    goto LABEL_108;
                  }
                }
                else
                {
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                  {
                    BOOL v33 = 0;
                    BOOL v32 = 0;
                    uint64_t sibling_link = 22;
                    uint64_t v34 = v117;
                    BOOL v31 = v115;
                    if (a2)
                    {
LABEL_64:
                      if (v124)
                      {
                        jobj_release(v12, v124);
                        uint64_t v124 = 0;
                      }
                      if (!a5)
                      {
                        if (v32) {
                          userfs_internal_reclaim((uint64_t)v116);
                        }
                        else {
                          _apfs_free(v116, 16);
                        }
                      }
                      if (v118 >= v16)
                      {
                        int v37 = pthread_rwlock_unlock((pthread_rwlock_t *)(v118 + 128));
                        if (v118 <= v16)
                        {
                          if (v37) {
                            panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4138, v37);
                          }
                        }
                        else
                        {
                          if (v37) {
                            panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4135, v37);
                          }
                          int v38 = pthread_rwlock_unlock((pthread_rwlock_t *)(v16 + 128));
                          if (v38) {
                            panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4136, v38);
                          }
                        }
                      }
                      else
                      {
                        int v35 = pthread_rwlock_unlock((pthread_rwlock_t *)(v16 + 128));
                        if (v35) {
                          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4132, v35);
                        }
                        int v36 = pthread_rwlock_unlock((pthread_rwlock_t *)(v118 + 128));
                        if (v36) {
                          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4133, v36);
                        }
                      }
                      if (a5 && !sibling_link && v33)
                      {
                        if (fs_delete_inode((unint64_t *)v12, v14)
                          && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                        {
                          apfs_ufileop_rename_cold_1();
                        }
                        uint64_t sibling_link = 0;
                        *(void *)(v14 + 120) |= 0x10uLL;
                      }
                      return sibling_link;
                    }
LABEL_61:
                    if (v31) {
                      userfs_internal_reclaim((uint64_t)v34);
                    }
                    else {
                      _apfs_free(v34, 16);
                    }
                    goto LABEL_64;
                  }
                  apfs_ufileop_rename_cold_2();
                }
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                apfs_ufileop_rename_cold_13();
              }
              BOOL v32 = 0;
              goto LABEL_107;
            }
            if (*(void *)(v16 + 24) == *(void *)(v118 + 8))
            {
              int v27 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
              if (v27) {
                panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3374, v27);
              }
              int v28 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v16 + 128));
              if (!v28) {
                goto LABEL_55;
              }
              int v112 = v28;
              int v25 = 3375;
            }
            else
            {
              if (v118 >= v16)
              {
                int v40 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v16 + 128));
                if (v40) {
                  panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3380, v40);
                }
                int v41 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
                if (v41) {
                  panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3381, v41);
                }
                goto LABEL_55;
              }
              int v29 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v118 + 128));
              if (v29) {
                panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 3377, v29);
              }
              int v30 = pthread_rwlock_wrlock((pthread_rwlock_t *)(v16 + 128));
              if (!v30) {
                goto LABEL_55;
              }
              int v112 = v30;
              int v25 = 3378;
            }
          }
LABEL_54:
          panic("%s:%d: wrlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", v25, v112);
        }
        if (!a2) {
          _apfs_free(v117, 16);
        }
      }
      return 12;
    }
  }
  return sibling_link;
}

uint64_t userfs_check_parent_chain(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)(a2 + 8) != *(void *)(a3 + 8))
  {
    char v6 = 0;
    while (*(void *)(a2 + 8) != 2)
    {
      unint64_t v7 = *(void *)(a2 + 24);
      if (v7 == *(void *)(a3 + 8))
      {
        uint64_t v3 = 22;
        if ((v6 & 1) == 0) {
          return v3;
        }
        goto LABEL_14;
      }
      if (v6) {
        userfs_free_inode(&v10);
      }
      uint64_t v8 = userfs_load_inode(a1, 0, v7, 0, &v10);
      if (v8) {
        return v8;
      }
      a2 = v11;
      char v6 = 1;
      if (!v11)
      {
        uint64_t v3 = 0;
LABEL_14:
        userfs_free_inode(&v10);
        return v3;
      }
    }
    uint64_t v3 = 0;
    if ((v6 & 1) == 0) {
      return v3;
    }
    goto LABEL_14;
  }
  return 22;
}

uint64_t apfs_ufileop_stream_lookup(uint64_t *a1, void *a2)
{
  unint64_t v15 = 0;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[1] = v2;
  uint64_t v14[2] = v2;
  v14[0] = v2;
  xattr_uint64_t dstream = 22;
  if (a1 && a2)
  {
    uint64_t v6 = a1[1];
    int v7 = *(_WORD *)(v6 + 104) & 0xF000;
    if (v7 == 0x8000)
    {
      uint64_t v8 = *a1;
      int v9 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 128));
      if (v9) {
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4190, v9);
      }
      if ((*(unsigned char *)(v6 + 92) & 0x20) != 0)
      {
        uint64_t v10 = (char *)_apfs_calloc(1uLL, 0x18uLL);
        if (v10)
        {
          uint64_t xattr = fs_get_xattr(v8, *(void *)(v6 + 8), (uint64_t *)(v6 + 328), "com.apple.ResourceFork", &v15);
          if (xattr)
          {
            xattr_uint64_t dstream = xattr;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              apfs_ufileop_stream_lookup_cold_2();
            }
          }
          else
          {
            xattr_uint64_t dstream = fs_get_xattr_dstream(v8, (uint64_t)v15, v14);
            if (xattr_dstream)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                apfs_ufileop_stream_lookup_cold_1();
              }
            }
            else
            {
              *(void *)uint64_t v10 = a1;
              *(_OWORD *)(v10 + 8) = v14[0];
              *a2 = v10;
            }
          }
        }
        else
        {
          xattr_uint64_t dstream = 12;
        }
      }
      else
      {
        uint64_t v10 = 0;
        xattr_uint64_t dstream = 79;
      }
      int v12 = pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 128));
      if (v12) {
        panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4224, v12);
      }
      if (v15)
      {
        jobj_release(v8, v15);
        unint64_t v15 = 0;
      }
      if (v10 && xattr_dstream) {
        _apfs_free(v10, 24);
      }
    }
    else if (v7 == 0x4000)
    {
      return 21;
    }
    else
    {
      return 22;
    }
  }
  return xattr_dstream;
}

uint64_t apfs_ufileop_stream_reclaim(void *a1)
{
  if (!a1) {
    return 22;
  }
  _apfs_free(a1, 24);
  return 0;
}

uint64_t apfs_ufileop_stream_read(uint64_t **a1, unint64_t a2, size_t a3, uint64_t a4, void *a5)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  int v7 = a1;
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v42 = v8;
  long long v43 = v8;
  long long v41 = v8;
  int v9 = *a1;
  uint64_t v10 = **a1;
  uint64_t v11 = v9[1];
  uint64_t v38 = *(void *)(v10 + 392);
  uint64_t v39 = v10;
  unsigned int block_size = apfs_get_block_size(v10);
  size_t v13 = 4 * block_size;
  unint64_t v14 = (char *)_apfs_calloc(1uLL, v13);
  if (v14)
  {
    unint64_t v15 = v14;
    uint64_t v34 = (pthread_rwlock_t *)(v11 + 128);
    int v16 = pthread_rwlock_rdlock((pthread_rwlock_t *)(v11 + 128));
    if (v16) {
      panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4296, v16);
    }
    if (a3)
    {
      size_t v33 = 4 * block_size;
      uint64_t v17 = 0;
      uint64_t v36 = block_size - 1;
      int v37 = (uint64_t *)(v11 + 328);
      while (1)
      {
        unint64_t v18 = (unint64_t)v7[2];
        if (a2 >= v18)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            BOOL v32 = v7[1];
            *(_DWORD *)int buf = 136316418;
            int v46 = "apfs_ufileop_stream_read";
            __int16 v47 = 1024;
            int v48 = 4300;
            __int16 v49 = 2048;
            uint64_t v50 = v32;
            __int16 v51 = 2048;
            unint64_t v52 = v18;
            __int16 v53 = 2048;
            unint64_t v54 = a2;
            __int16 v55 = 2048;
            size_t v56 = a3;
            _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: request to read beyond the compressed xdstream end: xds id %lld size %lld smaller than offset %lld len %lu\n", buf, 0x3Au);
          }
          uint64_t v28 = 0xFFFFFFFFLL;
          goto LABEL_28;
        }
        uint64_t v19 = lookup_file_extent(v39, (unint64_t)v7[1], a2, 0, v37, (uint64_t)&v41);
        if (v19) {
          break;
        }
        unint64_t v20 = a2 - v42;
        uint64_t v21 = v7;
        unint64_t v22 = (unint64_t)v7[2] - v42;
        if (v22 >= *((void *)&v43 + 1) * (unint64_t)block_size) {
          unint64_t v22 = *((void *)&v43 + 1) * block_size;
        }
        size_t v23 = v22 - v20;
        int v24 = v15;
        if (a3 >= v23) {
          size_t v25 = v23;
        }
        else {
          size_t v25 = a3;
        }
        uint64_t data = dev_read_data(*(void *)(v38 + 384), v20 / block_size + *((void *)&v42 + 1));
        if (data)
        {
          uint64_t v28 = data;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            apfs_ufileop_stream_read_cold_2();
          }
          size_t v13 = v33;
          unint64_t v15 = v24;
          goto LABEL_38;
        }
        if ((v20 + v25 - 1) / block_size - v20 / block_size + 1 <= 4) {
          size_t v27 = v25;
        }
        else {
          size_t v27 = 4 * block_size - (v20 & v36);
        }
        memcpy((void *)(a4 + v17), &v24[v20 & v36], v27);
        v17 += v27;
        a2 += v27;
        a3 -= v27;
        unint64_t v15 = v24;
        int v7 = v21;
        if (!a3)
        {
          uint64_t v28 = 0;
LABEL_28:
          size_t v13 = v33;
          goto LABEL_29;
        }
      }
      uint64_t v28 = v19;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        apfs_ufileop_stream_read_cold_3();
      }
      size_t v13 = v33;
LABEL_38:
      int v29 = v34;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v28 = 0;
LABEL_29:
      int v29 = v34;
      if (a5) {
        *a5 = v17;
      }
    }
    int v30 = pthread_rwlock_unlock(v29);
    if (v30) {
      panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/apfs_userfs/userfs_fileops.c", 4350, v30);
    }
    _apfs_free(v15, v13);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      apfs_ufileop_stream_read_cold_1();
    }
    return 12;
  }
  return v28;
}

uint64_t apfs_get_fs_representation(const char *a1, uint64_t a2, unint64_t a3, int a4)
{
  size_t v8 = strnlen(a1, 0x2FEuLL);
  unint64_t v10 = 0;
  if (v8 > 0x2FD) {
    return 63;
  }
  uint64_t result = utf8_normalizeOptCaseFoldToUTF8((unint64_t)a1, v8, a4, a2, a3, &v10);
  if (!result)
  {
    if (v10 >= a3)
    {
      return 12;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)(a2 + v10) = 0;
    }
  }
  return result;
}

uint64_t apfs_ufile_xattr_read(uint64_t a1, void *a2, uint64_t a3, size_t a4, unsigned int a5)
{
  uint64_t v6 = *(void *)(a3 + 24);
  if (v6)
  {
    unint64_t v8 = a5;
    if (*(unsigned char *)(*(void *)(a1 + 376) + 264))
    {
      uint64_t v11 = 0;
    }
    else
    {
      unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v10 = userfs_crypto_alloc_cst(a1);
      if (!v10) {
        return 12;
      }
      uint64_t v11 = v10;
      get_fext_crypto_logic(a1, a3, (uint64_t *)&v14);
      *(void *)(v11[9] + 8) = v14 / v8;
      uint64_t v6 = *(void *)(a3 + 24);
    }
    uint64_t data = dev_read_data(*(void *)(*(void *)(a1 + 392) + 384), v6);
    if (v11) {
      crypto_obj_release(v11);
    }
  }
  else
  {
    bzero(a2, a4);
    return 0;
  }
  return data;
}

void OUTLINED_FUNCTION_24_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

BOOL purgeable_file_has_tracked_size(uint64_t a1, uint64_t a2, int a3)
{
  if ((*(void *)(a2 + 72) & 0x180000) != 0x80000) {
    return 0;
  }
  if ((*(_WORD *)(a2 + 104) & 0xF000) == 0x4000) {
    return 1;
  }
  int v3 = *(_DWORD *)(a2 + 80);
  BOOL v4 = v3 <= 1;
  if (v3 == 1) {
    a3 = 1;
  }
  return v4 && a3 != 0;
}

unint64_t get_ino_purgeable_size_and_compressed(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v3 = *(_DWORD *)(a2 + 92) & 0x40000020;
  BOOL v4 = v3 == 32;
  if ((*(_WORD *)(a2 + 104) & 0xF000) != 0x8000) {
    return 0;
  }
  if (v3 == 32)
  {
    if ((*(void *)(*(void *)(a1 + 376) + 56) & 0x200) != 0)
    {
      unint64_t result = ino_rsrc_fork_phys_size(a1, a2);
      if (!a3) {
        return result;
      }
    }
    else
    {
      unint64_t result = 0;
      if (!a3) {
        return result;
      }
    }
  }
  else
  {
    unint64_t result = ino_phys_size(a1, a2);
    if (!a3) {
      return result;
    }
  }
  *a3 = v4;
  return result;
}

unint64_t filter_purgeable_flags_for_vol(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(*(void *)(a1 + 376) + 57) & 2) != 0)
  {
    if (HIDWORD(a2) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      unint64_t v8 = "filter_purgeable_flags_for_vol";
      __int16 v9 = 1024;
      int v10 = 666;
      __int16 v11 = 2080;
      uint64_t v12 = a1 + 3832;
      __int16 v13 = 2048;
      unint64_t v14 = v2;
      _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s Unsupported flags being used on purgeable record: %llx. Truncating...\n", (uint8_t *)&v7, 0x26u);
    }
    int v4 = 3997695;
  }
  else
  {
    if (a2 >= 0x10000 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      unint64_t v8 = "filter_purgeable_flags_for_vol";
      __int16 v9 = 1024;
      int v10 = 661;
      __int16 v11 = 2080;
      uint64_t v12 = a1 + 3832;
      __int16 v13 = 2048;
      unint64_t v14 = v2;
      _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s Unsupported flags being used on purgeable drec: %llx. Truncating...\n", (uint8_t *)&v7, 0x26u);
    }
    unint64_t v2 = (unsigned __int16)v2;
    int v4 = 0xFFFF;
  }
  uint64_t v5 = v2 & v4;
  if (v2 == v5) {
    return v2;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    unint64_t v8 = "filter_purgeable_flags_for_vol";
    __int16 v9 = 1024;
    int v10 = 677;
    __int16 v11 = 2080;
    uint64_t v12 = a1 + 3832;
    __int16 v13 = 1024;
    LODWORD(v14) = v2;
    _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s Unknown flags being used on purgeable record: %x. Truncating...\n", (uint8_t *)&v7, 0x22u);
  }
  return v5;
}

uint64_t get_pending_purgeable_flags_from_ino(uint64_t a1)
{
  unint64_t __dst = 0xAAAAAAAAAAAAAAAALL;
  if (xf_get((unsigned __int16 *)(a1 + 416), 15, 0, (char *)&__dst, 8uLL)) {
    return 66048;
  }
  else {
    return __dst;
  }
}

uint64_t get_purgeable_dir_size(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = *(_DWORD *)(*(void *)(a1 + 376) + 56);
  *a3 = -1;
  if ((*(_WORD *)(a2 + 104) & 0xF000) != 0x4000) {
    return 20;
  }
  if ((*(unsigned char *)(a2 + 72) & 4) != 0)
  {
    unint64_t v8 = 0;
    if (!get_dir_stats(a1, a2, &v8))
    {
      int v7 = v8;
      *a3 = *((void *)v8 + 4);
      jobj_release(a1, v7);
    }
    return 0;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    unint64_t v8 = (unsigned __int16 *)a1;
    BYTE4(v11) = 1;
    BYTE6(v11) = (v3 & 0x200) != 0;
    BYTE7(v11) = BYTE6(v11);
    fs_iterate_dir((unint64_t *)a1, a2, (uint64_t)child_size_calculator_cb, (uint64_t)&v8);
    uint64_t result = v11;
    if (!v11) {
      *a3 = v9;
    }
  }
  return result;
}

uint64_t lookup_purgeable_record(uint64_t a1, uint64_t a2, char a3, unint64_t a4, char a5, unsigned __int16 **a6)
{
  if ((*(unsigned char *)(*(void *)(a1 + 376) + 57) & 2) != 0)
  {
    uint64_t result = lookup_expanded_purgeable_record(a1, a2, a3, a6);
    if (!result) {
      return result;
    }
    goto LABEL_5;
  }
  uint64_t result = lookup_purgeable_drec_as_record(a1, a2, a4, a5, a3, a6);
  if (result) {
LABEL_5:
  }
    *a6 = 0;
  return result;
}

uint64_t set_ino_purgeable_state(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5 = 0;
  uint64_t v112 = *MEMORY[0x263EF8340];
  uint64_t __src = a4;
  unint64_t v102 = a3;
  uint64_t v100 = 0;
  uint64_t v6 = *(void *)(a2 + 72);
  uint64_t v7 = v6 & 0x180000;
  if ((a4 & 0x10000) != 0) {
    unint64_t v8 = "marking";
  }
  else {
    unint64_t v8 = "clearing";
  }
  int v9 = *(_DWORD *)(a2 + 92);
  unint64_t v10 = *(void *)(*(void *)(a1 + 376) + 56) & 0x200;
  if (v10) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 2;
  }
  uint64_t v12 = *(void *)(a2 + 120);
  unsigned int inserted = 0;
  if (a4 & 0x10000 | v7)
  {
    if (*(_DWORD *)(a1 + 1100)) {
      return 30;
    }
    if ((a4 & 0x100000) != 0 || a5 && *(unsigned char *)(a5 + 24) && (a3 || (*(_WORD *)(a2 + 104) & 0xF000) != 0x8000)) {
      return 22;
    }
    if ((a4 & 0x10000) != 0) {
      int v17 = 1;
    }
    else {
      int v17 = 2;
    }
    int v98 = v17;
    if (v7 == 0x80000 && ((*(_WORD *)(a2 + 104) & 0xF000) == 0x4000 || *(_DWORD *)(a2 + 80) == 1)
      || (char v18 = 0, (a4 & 0x10000) == 0) && (v12 & 0x80000000000) != 0)
    {
      char v18 = 1;
    }
    __int16 v19 = *(_WORD *)(a2 + 104);
    if ((v19 & 0xF000) == 0x8000)
    {
      LOBYTE(v20) = v6;
      if (*(int *)(a2 + 80) >= 2)
      {
        if ((a4 & 0x3C0000) != 0) {
          return 22;
        }
        char v94 = v18;
        int v97 = v12;
        size_t v25 = (unsigned __int16 *)(a2 + 416);
        if ((a4 & 0x10000) != 0)
        {
          uint64_t v5 = xf_set(v25, 15, 2, &__src, 8uLL);
          unsigned int inserted = v5;
          if (!v5)
          {
            unint64_t v20 = *(void *)(a2 + 72) | 0x100000;
            goto LABEL_168;
          }
        }
        else
        {
          uint64_t v5 = xf_remove(v25, 15);
          unsigned int inserted = v5;
          if (!v5)
          {
            unint64_t v20 = *(void *)(a2 + 72) & 0xFFFFFFFFFFEFFFFFLL;
LABEL_168:
            *(void *)(a2 + 72) = v20;
            __int16 v19 = *(_WORD *)(a2 + 104);
            LODWORD(v12) = v97;
            char v18 = v94;
            goto LABEL_29;
          }
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          return v5;
        }
        uint64_t v28 = *(void *)(a2 + 8);
        int v29 = strerror(v5);
        *(_DWORD *)int buf = 136316674;
        *(void *)&uint8_t buf[4] = "set_ino_purgeable_state";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2547;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1 + 3832;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2048;
        *(void *)int v109 = v28;
        *(_WORD *)&v109[8] = 1024;
        *(_DWORD *)&v109[10] = v5;
        *(_WORD *)&v109[14] = 2080;
        *(void *)&v109[16] = v29;
        int v30 = &_os_log_internal;
        BOOL v31 = "%s:%d: %s Failed to update extended fields when %s WANTS_TO_BE_PURGEABLE on ino %llu: %d (%s)\n";
        goto LABEL_67;
      }
    }
    else
    {
      LOBYTE(v20) = v6;
    }
LABEL_29:
    int v21 = v9 & 0x40000020;
    uint64_t v22 = (a4 >> 16) & 1;
    int v23 = v19 & 0xF000;
    int v96 = v12;
    char v93 = v18;
    if (v23 == 0x4000 && (v12 & 0x10000) != 0 && !v22)
    {
      unint64_t ino_purgeable_size_and_compressed = 0;
      goto LABEL_68;
    }
    if (v23 != 0x4000)
    {
      if (v23 == 0x8000)
      {
        if ((a4 & 0x10000) != 0 && v21 == 32 && !v10)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            set_ino_purgeable_state_cold_6();
          }
          return 22;
        }
        unint64_t ino_purgeable_size_and_compressed = get_ino_purgeable_size_and_compressed(a1, a2, 0);
        if (v21 == 32) {
          char v26 = BYTE2(a4) & 1;
        }
        else {
          char v26 = 0;
        }
        if (v10) {
          LOBYTE(v22) = v26;
        }
        else {
          LOBYTE(v22) = 0;
        }
LABEL_68:
        int v92 = v21;
        unint64_t v35 = v102;
        if (!v102)
        {
          if (a5 && *(unsigned char *)(a5 + 24)) {
            unint64_t v102 = -1;
          }
          unsigned int inserted = fs_tx_enter(a1, v98, v11, 0, (uint64_t *)&v102);
          if (inserted) {
            return inserted;
          }
        }
        uint64_t timestamp = *(void *)(a2 + 64);
        if (!timestamp)
        {
          uint64_t timestamp = get_timestamp();
          *(void *)(a2 + 64) = timestamp;
        }
        int v37 = *(_WORD *)(a2 + 104) & 0xF000;
        if (v37 != 0x4000 || (__src & 0x2000) == 0)
        {
          if ((a4 & 0x10000) == 0)
          {
            if (!v10)
            {
              *(_OWORD *)int buf = xmmword_22CB69AA0;
              *(_DWORD *)int buf = 5243152;
              uint64_t v46 = *(void *)(a2 + 8);
              *(void *)&buf[16] = timestamp;
              *(void *)&buf[24] = v46;
              *(void *)&buf[32] = ino_purgeable_size_and_compressed;
              *(void *)int v109 = 0;
              LODWORD(v46) = *(_DWORD *)(a2 + 96);
              *(_DWORD *)&v109[8] = 0;
              *(_DWORD *)&v109[12] = v46;
              uint64_t v110 = 0;
              uint64_t v111 = 0;
              *(void *)&v109[16] = 0;
              unsigned int v47 = remove_purgeable_record(a1, a2, (uint64_t)buf, v102);
              BOOL v39 = v47 == 2;
              if (v47 == 2) {
                unsigned int v48 = 0;
              }
              else {
                unsigned int v48 = v47;
              }
              unsigned int inserted = v48;
              if (v48) {
                goto LABEL_189;
              }
              goto LABEL_172;
            }
            *(void *)int buf = 0;
            unsigned int v38 = lookup_and_remove_purgeable_record(a1, a2, ino_purgeable_size_and_compressed, v102, (unsigned __int16 **)buf);
            unsigned int inserted = v38;
            if ((v6 & 0x100000) != 0)
            {
              squash((int *)&inserted, 2);
              unsigned int v38 = inserted;
            }
            else if (v38 == 2)
            {
              unsigned int inserted = 0;
              BOOL v39 = 1;
              goto LABEL_104;
            }
            if (!v38)
            {
              BOOL v39 = 0;
LABEL_104:
              __int16 v54 = *(_WORD *)(a2 + 104);
              char v55 = v93;
              if ((v54 & 0xF000) == 0x4000 && (*(unsigned char *)(a2 + 72) & 4) != 0)
              {
                dir_stats_unmark_purgeable(a1, a2, v102);
                char v55 = v93;
                __int16 v54 = *(_WORD *)(a2 + 104);
              }
              BOOL v56 = (v54 & 0xF000) == 0x8000;
              char v57 = v55 ^ 1;
              if (!v56) {
                char v57 = 1;
              }
              if ((v57 & 1) == 0)
              {
                unint64_t v58 = ino_purgeable_size_and_compressed;
                if (*(void *)buf) {
                  unint64_t v58 = *(void *)(*(void *)buf + 32);
                }
                if (v92 == 32) {
                  int v59 = (*(unsigned __int8 *)(*(void *)buf + 50) >> 4) & 1;
                }
                else {
                  int v59 = 0;
                }
                update_size_tracking_purgeable_size(a1, a2, -(uint64_t)v58, v59, v102);
                *(void *)(a2 + 120) &= ~0x80000000000uLL;
              }
              jobj_release(a1, *(unsigned char **)buf);
LABEL_172:
              *(void *)(a2 + 72) &= 0xFFFFFFFFFFE7FFFFLL;
              *(void *)(a2 + 64) = get_timestamp();
              goto LABEL_187;
            }
            goto LABEL_154;
          }
          *(_OWORD *)int buf = xmmword_22CB69AA0;
          *(_DWORD *)int buf = 5243152;
          uint64_t v40 = *(void *)(a2 + 8);
          *(void *)&buf[16] = 0;
          *(void *)&buf[24] = v40;
          uint64_t v41 = *(void *)(a2 + 32);
          *(void *)&buf[32] = ino_purgeable_size_and_compressed;
          *(void *)int v109 = v41;
          LODWORD(v41) = *(_DWORD *)(a2 + 96);
          *(_DWORD *)&v109[8] = 0;
          *(_DWORD *)&v109[12] = v41;
          uint64_t v110 = 0;
          uint64_t v111 = 0;
          *(void *)&v109[16] = 0;
          uint64_t v42 = __src;
          if ((__src & 0x8E00) == 0)
          {
            uint64_t v42 = __src | 0x200;
            __src |= 0x200uLL;
          }
          if ((v42 & 0x20000) != 0)
          {
            if (!HIDWORD(v42))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v103 = 136315906;
                *(void *)&v103[4] = "set_ino_purgeable_state";
                uint64_t v104 = 0x82000000ACE0400;
                uint64_t v105 = a1 + 3832;
                __int16 v106 = 2048;
                uint64_t v107 = v40;
                _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s checking the generation count was specified but the generation count of ino %llu is zero.\n", v103, 0x26u);
              }
              unsigned int inserted = 22;
              if (v35) {
                return inserted;
              }
              goto LABEL_155;
            }
            int v43 = (*(unsigned char *)(a2 + 72) & 4) != 0 ? v100 : *(_DWORD *)(a2 + 88);
            if (v43 != HIDWORD(v42))
            {
              unsigned int inserted = 35;
              goto LABEL_154;
            }
          }
          *(void *)&buf[16] = timestamp;
          *(_DWORD *)&v109[8] = (unsigned __int16)v42;
          if (v37 == 0x8000 && *(int *)(a2 + 80) >= 2) {
            *(_DWORD *)&v109[8] = (unsigned __int16)v42 | 0x1000;
          }
          if (ever_cloned_bit_is_ok(a1, a2)
            && (*(unsigned char *)(a2 + 73) & 4) != 0
            && get_ino_dstream_id_refcnt(a1, a2) >= 2)
          {
            *(_DWORD *)&v109[8] |= 0x4000u;
          }
          unsigned int v60 = __src & 0x3C0000 | *(_DWORD *)&v109[8];
          if (v22) {
            unint64_t v61 = v60 | 0x100000;
          }
          else {
            unint64_t v61 = v60;
          }
          *(_DWORD *)&v109[8] = v61;
          *(_DWORD *)&v109[8] = filter_purgeable_flags_for_vol(a1, v61);
          xf_init((uint64_t)&v109[16], 0);
          if ((*(unsigned char *)(a2 + 72) & 4) != 0
            && (unsigned int inserted = xf_set((unsigned __int16 *)&v109[16], 1, 2, &v100, 8uLL)) != 0)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              set_ino_purgeable_state_cold_5();
            }
          }
          else
          {
            if (!a5
              || (*(_DWORD *)&v109[8] & 0x80000) == 0
              || (v63 = *(void *)(a5 + 16), uint64_t v62 = (void *)(a5 + 16), !v63)
              || (unsigned int v64 = xf_set((unsigned __int16 *)&v109[16], 2, 2, v62, 8uLL), (inserted = v64) == 0))
            {
              unsigned int inserted = insert_purgeable_record(a1, a2, (uint64_t)buf, v102);
              xf_release((uint64_t)&v109[16]);
              if (!inserted)
              {
                char v66 = v93;
                if (v10)
                {
                  if (*(_DWORD *)(a2 + 80) == 1) {
                    unsigned int inserted = 0;
                  }
                  __int16 v67 = *(_WORD *)(a2 + 104);
                  if ((v67 & 0xF000) == 0x4000 && (*(unsigned char *)(a2 + 72) & 4) != 0)
                  {
                    unsigned int v68 = dir_stats_mark_purgeable(a1, a2, v102);
                    unsigned int inserted = v68;
                    if (v68)
                    {
                      int v69 = v68;
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                        set_ino_purgeable_state_cold_3(a1, a2 + 8, v69);
                      }
                      remove_purgeable_record(a1, a2, (uint64_t)buf, v102);
                      if (v35) {
                        return inserted;
                      }
                      goto LABEL_155;
                    }
                    __int16 v67 = *(_WORD *)(a2 + 104);
                    char v66 = v93;
                  }
                  if ((v67 & 0xF000) == 0x8000)
                  {
                    char v75 = *(_DWORD *)(a2 + 80) == 1 ? v66 : 1;
                    if ((v75 & 1) == 0) {
                      update_size_tracking_purgeable_size(a1, a2, ino_purgeable_size_and_compressed, v92 == 32, v102);
                    }
                  }
                }
                uint64_t v76 = *(void *)(a2 + 72) | 0x80000;
                *(void *)(a2 + 72) = v76;
                if ((*(_WORD *)(a2 + 104) & 0xF000) == 0x8000 && *(_DWORD *)(a2 + 80) == 1) {
                  *(void *)(a2 + 72) = v76 & 0xFFFFFFFFFFEFFFFFLL;
                }
                BOOL v39 = 0;
LABEL_187:
                unsigned int updated = update_jobj(a1, 1, (unsigned __int8 *)a2, v102);
                unsigned int inserted = updated;
                if (updated)
                {
                  int v78 = updated;
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v90 = *(void *)(a2 + 8);
                    uint64_t v91 = strerror(v78);
                    *(_DWORD *)int buf = 136316674;
                    *(void *)&uint8_t buf[4] = "set_ino_purgeable_state";
                    *(_WORD *)&unsigned char buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 3089;
                    *(_WORD *)&buf[18] = 2080;
                    *(void *)&buf[20] = a1 + 3832;
                    *(_WORD *)&buf[28] = 2048;
                    *(void *)&buf[30] = v90;
                    *(_WORD *)&buf[38] = 2080;
                    *(void *)int v109 = v8;
                    *(_WORD *)&v109[8] = 1024;
                    *(_DWORD *)&v109[10] = v78;
                    *(_WORD *)&v109[14] = 2080;
                    *(void *)&v109[16] = v91;
                    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Failed to update_jobj(ino %llu) after %s purgeability: %d (%s)\n", buf, 0x40u);
                    if (v35) {
                      goto LABEL_191;
                    }
                    goto LABEL_190;
                  }
                }
LABEL_189:
                if (!v35) {
                  goto LABEL_190;
                }
LABEL_191:
                if (v39 && !inserted)
                {
                  if ((v96 & 0x10000) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    set_ino_purgeable_state_cold_2();
                  }
                  uint64_t v79 = *(void *)(a2 + 8);
                  unint64_t v80 = v102;
                  *(void *)int buf = a1;
                  *(void *)&buf[8] = v79;
                  *(void *)&buf[16] = v102;
                  *(void *)&buf[24] = 0x200000000;
                  BOOL has_secondary_fsroot = apfs_has_secondary_fsroot(a1);
                  if ((*(unsigned char *)(*(void *)(a1 + 376) + 57) & 2) != 0)
                  {
                    BOOL v83 = apfs_has_secondary_fsroot(a1);
                    if ((*(unsigned char *)(*(void *)(a1 + 376) + 57) & 2) != 0)
                    {
                      *(void *)uint64_t v103 = 0xE000000000000007;
                      *(_DWORD *)&v103[8] = 16;
                      if (v83) {
                        int v84 = 8;
                      }
                      else {
                        int v84 = 1;
                      }
                      uint64_t v105 = 0;
                      uint64_t v104 = 0;
                      iterate_raw_jobjs_with_hint(a1, v84, v80, v103, 0x1CuLL, (uint64_t)_remove_purgeable_record_cb, (uint64_t)buf, 0, 0, 2048);
                    }
                    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                    {
                      set_ino_purgeable_state_cold_1();
                    }
                  }
                  else
                  {
                    if (has_secondary_fsroot) {
                      int v82 = 8;
                    }
                    else {
                      int v82 = 1;
                    }
                    *(_DWORD *)&v103[8] = 0;
                    *(void *)uint64_t v103 = 0x9000000000000007;
                    iterate_raw_jobjs_with_hint(a1, v82, v80, v103, 0xCuLL, (uint64_t)_remove_purgeable_record_cb, (uint64_t)buf, 0, 0, 2048);
                  }
                  unsigned int v85 = *(_DWORD *)&buf[28];
                  unsigned int inserted = *(_DWORD *)&buf[28];
                  if (*(_DWORD *)&buf[28]
                    && (v96 & 0x10000) == 0
                    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v86 = *(void *)(a2 + 8);
                    uint64_t v87 = *(void *)(a2 + 24);
                    uint64_t v88 = *(void *)(a2 + 72);
                    *(_DWORD *)int buf = 136316674;
                    *(void *)&uint8_t buf[4] = "set_ino_purgeable_state";
                    *(_WORD *)&unsigned char buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 3108;
                    *(_WORD *)&buf[18] = 2080;
                    *(void *)&buf[20] = a1 + 3832;
                    *(_WORD *)&buf[28] = 2048;
                    *(void *)&buf[30] = v86;
                    *(_WORD *)&buf[38] = 2048;
                    *(void *)int v109 = v87;
                    *(_WORD *)&v109[8] = 2048;
                    *(void *)&v109[10] = v88;
                    *(_WORD *)&v109[18] = 1024;
                    *(_DWORD *)&v109[20] = v85;
                    _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s Failed to remove purgeable record for ino %llu (parent id %llu, internal_flags %#llx) iteratively (err %d).\n", buf, 0x40u);
                    unsigned int v85 = inserted;
                  }
                  if (v85 == 2) {
                    return 0;
                  }
                }
                return inserted;
              }
LABEL_154:
              if (!v35)
              {
LABEL_155:
                BOOL v39 = 0;
LABEL_190:
                fs_tx_leave(a1, v98, v11, 0, v102);
                unint64_t v102 = 0;
                goto LABEL_191;
              }
              return inserted;
            }
            int v65 = v64;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              set_ino_purgeable_state_cold_4(a1, a2 + 8, v65);
            }
          }
          xf_release((uint64_t)&v109[16]);
          if (!v35) {
            goto LABEL_155;
          }
          return inserted;
        }
        if ((a4 & 0x10000) != 0)
        {
          *(void *)int buf = __src & 0xFFFFFFFFFFFFDFFFLL;
          unsigned int v49 = xf_set((unsigned __int16 *)(a2 + 416), 15, 2, buf, 8uLL);
          unsigned int inserted = v49;
          if (!v49)
          {
            unint64_t v45 = *(void *)(a2 + 72) | 0x2000000;
LABEL_157:
            *(void *)(a2 + 72) = v45;
            unsigned int v70 = update_jobj(a1, 1, (unsigned __int8 *)a2, v102);
            unsigned int inserted = v70;
            if (!v70 || (int v71 = v70, !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)))
            {
LABEL_159:
              BOOL v39 = 0;
              if (!v35) {
                goto LABEL_190;
              }
              goto LABEL_191;
            }
            uint64_t v73 = *(void *)(a2 + 8);
            int v74 = strerror(v71);
            *(_DWORD *)int buf = 136316674;
            *(void *)&uint8_t buf[4] = "set_ino_purgeable_state";
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = 2734;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = a1 + 3832;
            *(_WORD *)&buf[28] = 2048;
            *(void *)&buf[30] = v73;
            *(_WORD *)&buf[38] = 2080;
            *(void *)int v109 = v8;
            *(_WORD *)&v109[8] = 1024;
            *(_DWORD *)&v109[10] = v71;
            *(_WORD *)&v109[14] = 2080;
            *(void *)&v109[16] = v74;
            unint64_t v52 = &_os_log_internal;
            __int16 v53 = "%s:%d: %s Failed to update_jobj(ino %llu) after %s purgeability: %d (%s)\n";
LABEL_174:
            _os_log_error_impl(&dword_22CAAC000, v52, OS_LOG_TYPE_ERROR, v53, buf, 0x40u);
            if (!v35) {
              goto LABEL_155;
            }
            return inserted;
          }
          int v44 = v49;
        }
        else
        {
          int v44 = xf_remove((unsigned __int16 *)(a2 + 416), 15);
          unsigned int inserted = v44;
          if (!v44)
          {
            unint64_t v45 = *(void *)(a2 + 72) & 0xFFFFFFFFFDFFFFFFLL;
            goto LABEL_157;
          }
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_159;
        }
        uint64_t v50 = *(void *)(a2 + 8);
        __int16 v51 = strerror(v44);
        *(_DWORD *)int buf = 136316674;
        *(void *)&uint8_t buf[4] = "set_ino_purgeable_state";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2727;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1 + 3832;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2048;
        *(void *)int v109 = v50;
        *(_WORD *)&v109[8] = 1024;
        *(_DWORD *)&v109[10] = v44;
        *(_WORD *)&v109[14] = 2080;
        *(void *)&v109[16] = v51;
        unint64_t v52 = &_os_log_internal;
        __int16 v53 = "%s:%d: %s Failed to update extended fields when %s APFS_PURGEABLE_MARK_CHILDREN on ino %llu: %d (%s)\n";
        goto LABEL_174;
      }
LABEL_45:
      unint64_t ino_purgeable_size_and_compressed = 0;
      LOBYTE(v22) = 0;
      goto LABEL_68;
    }
    if ((__src & 0x2000) != 0) {
      goto LABEL_45;
    }
    if ((v20 & 4) != 0)
    {
      *(void *)int buf = 0;
      unsigned int dir_stats = get_dir_stats(a1, a2, (unsigned __int16 **)buf);
      unsigned int inserted = dir_stats;
      if (dir_stats)
      {
        unint64_t ino_purgeable_size_and_compressed = 0;
      }
      else
      {
        unint64_t ino_purgeable_size_and_compressed = *(void *)(*(void *)buf + 32);
        uint64_t v100 = *(void *)(*(void *)buf + 48);
        jobj_release(a1, *(unsigned char **)buf);
        unsigned int dir_stats = 0;
        if (a5)
        {
          uint64_t v72 = *(void *)(a5 + 8);
          if (v72)
          {
            if (v72 != v100)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                set_ino_purgeable_state_cold_7();
              }
              unsigned int dir_stats = 70;
              unsigned int inserted = 70;
            }
          }
        }
      }
      LOBYTE(v22) = 0;
      goto LABEL_64;
    }
    *(_OWORD *)int v109 = 0u;
    uint64_t v22 = v10 >> 9;
    memset(&buf[8], 0, 32);
    *(void *)int buf = a1;
    v109[6] = v10 >> 9;
    v109[7] = v109[6];
    if ((a4 & 0x10000) != 0)
    {
      char v24 = 1;
      v109[4] = 1;
      if (*(void *)(*(void *)(a1 + 376) + 56) & 0x200 | v20 & 2)
      {
LABEL_63:
        fs_iterate_dir((unint64_t *)a1, a2, (uint64_t)child_size_calculator_cb, (uint64_t)buf);
        unint64_t ino_purgeable_size_and_compressed = *(void *)&buf[8];
        unsigned int dir_stats = *(_DWORD *)v109;
        unsigned int inserted = *(_DWORD *)v109;
LABEL_64:
        if (!dir_stats) {
          goto LABEL_68;
        }
        int v32 = dir_stats;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          return inserted;
        }
        uint64_t v33 = *(void *)(a2 + 8);
        uint64_t v34 = strerror(v32);
        *(_DWORD *)int buf = 136316674;
        *(void *)&uint8_t buf[4] = "set_ino_purgeable_state";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2656;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1 + 3832;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2048;
        *(void *)int v109 = v33;
        *(_WORD *)&v109[8] = 1024;
        *(_DWORD *)&v109[10] = v32;
        *(_WORD *)&v109[14] = 2080;
        *(void *)&v109[16] = v34;
        int v30 = &_os_log_internal;
        BOOL v31 = "%s:%d: %s Failed %s purgeability on directory %llu: %d (%s)\n";
LABEL_67:
        _os_log_error_impl(&dword_22CAAC000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x40u);
        return inserted;
      }
    }
    else
    {
      char v24 = 0;
      LOBYTE(v22) = 0;
    }
    v109[5] = v24;
    goto LABEL_63;
  }
  return v5;
}

uint64_t child_size_calculator_cb(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  __int16 v5 = *(_WORD *)(a1 + 60);
  if (!needs_ctx())
  {
    if ((v5 & 0xF) != 8 && (v5 & 0xF) != 4) {
      return 0;
    }
    uint64_t inode = fs_get_inode(v4, *(void *)(a1 + 16));
    if (!inode) {
      return 0;
    }
    uint64_t v9 = inode;
    int v10 = *(_WORD *)(inode + 104) & 0xF000;
    if (*(unsigned char *)(a2 + 45) && v10 == 0x8000 && *(int *)(inode + 80) >= 2)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        child_size_calculator_cb_cold_1();
      }
LABEL_32:
      uint64_t v6 = 22;
      *(_DWORD *)(a2 + 40) = 22;
LABEL_47:
      _release_inode_carefully(v4, (unsigned char *)v9);
      return v6;
    }
    if (v10 == 0x4000)
    {
      if (*(unsigned char *)(a2 + 44))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          child_size_calculator_cb_cold_2();
        }
        goto LABEL_32;
      }
    }
    else if (v10 == 0x8000)
    {
      int v11 = pthread_rwlock_rdlock((pthread_rwlock_t *)(inode + 128));
      if (v11) {
        panic("%s:%d: rdlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/fscommon/purging.c", 2063, v11);
      }
      if (*(int *)(v9 + 80) >= 2 && *(unsigned char *)(a2 + 46))
      {
        if (*(void *)(v9 + 24) == *(void *)(a1 + 8))
        {
          __s1 = 0;
          int v18 = 0;
          if (!xf_get_ptr_and_size((unsigned __int16 *)(v9 + 416), 4, 0, &__s1, &v18)
            && v18 >= 1
            && __s1
            && !strcmp(__s1, *(const char **)(a1 + 64)))
          {
            *(void *)(a2 + 8) += get_ino_purgeable_size_and_compressed(v4, v9, 0);
          }
        }
LABEL_44:
        int v15 = pthread_rwlock_unlock((pthread_rwlock_t *)(v9 + 128));
        if (v15) {
          panic("%s:%d: unlock == 0 failed %d\n", "/Library/Caches/com.apple.xbs/Sources/apfs_userfs/fscommon/purging.c", 2120, v15);
        }
        goto LABEL_46;
      }
      BOOL v17 = 0;
      unint64_t ino_purgeable_size_and_compressed = get_ino_purgeable_size_and_compressed(v4, v9, &v17);
      *(void *)(a2 + 8) += ino_purgeable_size_and_compressed;
      if ((*(void *)(v9 + 72) & 0x180000) == 0x80000)
      {
        if ((*(_WORD *)(v9 + 104) & 0xF000) != 0x4000)
        {
          int v13 = *(_DWORD *)(v9 + 80);
          if (v13 != 1)
          {
LABEL_42:
            if (v13 <= 1) {
              *(void *)(a2 + 16) += ino_purgeable_size_and_compressed;
            }
            goto LABEL_44;
          }
        }
        if (v17 && *(unsigned char *)(a2 + 47)) {
          unint64_t v14 = (void *)(a2 + 32);
        }
        else {
          unint64_t v14 = (void *)(a2 + 24);
        }
        *v14 += ino_purgeable_size_and_compressed;
      }
      int v13 = *(_DWORD *)(v9 + 80);
      goto LABEL_42;
    }
LABEL_46:
    uint64_t v6 = 0;
    goto LABEL_47;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    child_size_calculator_cb_cold_3();
  }
  uint64_t v6 = 4;
  *(_DWORD *)(a2 + 40) = 4;
  return v6;
}

uint64_t insert_purgeable_record(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (apfs_has_secondary_fsroot(a1)) {
    int v8 = 8;
  }
  else {
    int v8 = 1;
  }
  if (*(void *)(a3 + 16))
  {
    if ((*(unsigned char *)(*(void *)(a1 + 376) + 57) & 2) != 0)
    {
      uint64_t inserted = insert_jobj(a1, v8, (unsigned __int8 *)a3, a4);
      if (inserted && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        insert_purgeable_record_cold_6(a1, inserted);
      }
    }
    else
    {
      unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t inserted = make_purgeable_drec(a1, *(_DWORD *)(a3 + 52), *(void *)(a3 + 32), *(void *)(a3 + 24), *(void *)(a2 + 8), &v14);
      if (inserted) {
        goto LABEL_26;
      }
      unint64_t v10 = v14;
      *(_WORD *)(v14 + 60) = *(_DWORD *)(a3 + 48);
      *(void *)(v10 + 24) = *(void *)(a3 + 16);
      uint64_t v15 = 0;
      uint64_t __dst = 0;
      int v11 = (unsigned __int16 *)(a3 + 56);
      if (!xf_get(v11, 1, 0, (char *)&__dst, 8uLL))
      {
        uint64_t v12 = xf_set((unsigned __int16 *)(v10 + 32), 2, 0, &__dst, 8uLL);
        if (v12)
        {
          uint64_t inserted = v12;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            insert_purgeable_record_cold_5();
          }
LABEL_25:
          jobj_release(a1, (unsigned char *)v10);
LABEL_26:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            insert_purgeable_record_cold_3(a1, inserted);
          }
          return inserted;
        }
      }
      if (xf_get(v11, 2, 0, (char *)&v15, 8uLL) != 2)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          insert_purgeable_record_cold_4();
        }
        uint64_t inserted = 22;
        goto LABEL_25;
      }
      uint64_t inserted = insert_jobj(a1, v8, (unsigned __int8 *)v10, a4);
      if (inserted && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        insert_purgeable_record_cold_2(a1, inserted);
      }
      jobj_release(a1, (unsigned char *)v10);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      insert_purgeable_record_cold_1();
    }
    return 9;
  }
  return inserted;
}

uint64_t remove_purgeable_record(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (apfs_has_secondary_fsroot(a1)) {
    int v8 = 8;
  }
  else {
    int v8 = 1;
  }
  if (*(void *)(a3 + 16))
  {
    if ((*(unsigned char *)(*(void *)(a1 + 376) + 57) & 2) != 0)
    {
      uint64_t v10 = remove_jobj(a1, v8, (unsigned __int8 *)a3, a4);
      if ((v10 & 0xFFFFFFFD) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        remove_purgeable_record_cold_4(a1, v10);
      }
    }
    else
    {
      int v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      uint64_t purgeable_drec = make_purgeable_drec(a1, *(_DWORD *)(a2 + 96), *(void *)(a3 + 32), *(void *)(a3 + 24), *(void *)(a2 + 8), (unint64_t *)&v13);
      if (purgeable_drec)
      {
        uint64_t v10 = purgeable_drec;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          remove_purgeable_record_cold_3(a1, v10);
        }
      }
      else
      {
        int v11 = v13;
        v13[1] = 3;
        uint64_t v10 = remove_jobj(a1, v8, v11, a4);
        if ((v10 & 0xFFFFFFFD) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          remove_purgeable_record_cold_2(a1, v10);
        }
        jobj_release(a1, v11);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      remove_purgeable_record_cold_1();
    }
    return 9;
  }
  return v10;
}

uint64_t lookup_and_remove_purgeable_record(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned __int16 **a5)
{
  if ((*(unsigned char *)(*(void *)(a1 + 376) + 57) & 2) != 0) {
    uint64_t v9 = lookup_expanded_purgeable_record(a1, a2, 0, a5);
  }
  else {
    uint64_t v9 = lookup_purgeable_drec_as_record(a1, a2, a3, 1, 0, a5);
  }
  uint64_t v10 = v9;
  if (v9)
  {
    if (v9 != 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      lookup_and_remove_purgeable_record_cold_1();
    }
  }
  else
  {
    uint64_t v10 = remove_purgeable_record(a1, a2, (uint64_t)*a5, a4);
    if (v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        lookup_and_remove_purgeable_record_cold_2();
      }
      jobj_release(a1, *a5);
      *a5 = 0;
    }
  }
  return v10;
}

uint64_t clear_ino_purgeable_state_(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return set_ino_purgeable_state(a1, a2, a3, 0, 0);
}

uint64_t merge_ino_purgeable_flags(uint64_t a1, uint64_t a2, unsigned int a3, int a4, char a5, uint64_t a6)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  BOOL v31 = 0;
  uint64_t v32 = a6;
  if (*(_DWORD *)(a1 + 1100)) {
    return 0;
  }
  uint64_t v11 = lookup_purgeable_record(a1, a2, a5, 0, 0, &v31);
  if (v11)
  {
    uint64_t inserted = v11;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      merge_ino_purgeable_flags_cold_6();
    }
    return inserted;
  }
  BOOL v12 = v32 == 0;
  if (v32 || (uint64_t v20 = fs_tx_enter(a1, 1, 2, 0, &v32), !v20))
  {
    int v13 = filter_purgeable_flags_for_vol(a1, *((_DWORD *)v31 + 12) & ~a4 | a3);
    uint64_t v15 = v31;
    unint64_t v14 = v32;
    *((_DWORD *)v31 + 12) = v13;
    if (apfs_has_secondary_fsroot(a1)) {
      int v16 = 8;
    }
    else {
      int v16 = 1;
    }
    if ((*(unsigned char *)(*(void *)(a1 + 376) + 57) & 2) != 0)
    {
      BOOL v18 = *((void *)v15 + 3) != *(void *)(a2 + 8);
      *(void *)int buf = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v19 = lookup_expanded_purgeable_record(a1, a2, v18, (unsigned __int16 **)buf);
      if (v19)
      {
        uint64_t inserted = v19;
        if (v19 != 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          merge_ino_purgeable_flags_cold_3(a1, (uint64_t)(v15 + 12), inserted);
        }
LABEL_37:
        if (!inserted) {
          goto LABEL_40;
        }
LABEL_38:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *(void *)(a2 + 8);
          int v30 = strerror(inserted);
          *(_DWORD *)int buf = 136316674;
          *(void *)&uint8_t buf[4] = "merge_ino_purgeable_flags";
          __int16 v34 = 1024;
          int v35 = 3196;
          __int16 v36 = 2080;
          uint64_t v37 = a1 + 3832;
          __int16 v38 = 2048;
          uint64_t v39 = v29;
          __int16 v40 = 1024;
          int v41 = v13;
          __int16 v42 = 1024;
          int v43 = inserted;
          __int16 v44 = 2080;
          unint64_t v45 = v30;
          _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Failed to update purgeable flags on ino %llu (new flags %u):%d (%s)\n", buf, 0x3Cu);
        }
        goto LABEL_40;
      }
      uint64_t v25 = remove_jobj(a1, v16, *(unsigned __int8 **)buf, v14);
      if (v25)
      {
        uint64_t inserted = v25;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
          merge_ino_purgeable_flags_cold_5();
        }
      }
      else
      {
        uint64_t v26 = *(void *)buf;
        *(void *)(*(void *)buf + 16) = *((void *)v15 + 2);
        int v27 = *((_DWORD *)v15 + 12);
        if (v27) {
          *(_DWORD *)(v26 + 48) = v27;
        }
        uint64_t inserted = insert_jobj(a1, v16, (unsigned __int8 *)v26, v14);
        if (inserted)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            merge_ino_purgeable_flags_cold_4(a1, (uint64_t)(v15 + 12), inserted);
          }
          *(void *)(a2 + 72) &= ~0x80000uLL;
        }
      }
      char v24 = *(unsigned char **)buf;
      uint64_t v23 = a1;
    }
    else
    {
      *(void *)int buf = 0xAAAAAAAAAAAAAAAALL;
      uint64_t purgeable_drec = make_purgeable_drec(a1, *((_DWORD *)v15 + 13), *((void *)v15 + 4), *((void *)v15 + 3), *(void *)(a2 + 8), (unint64_t *)buf);
      if (purgeable_drec)
      {
        uint64_t inserted = purgeable_drec;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          merge_ino_purgeable_flags_cold_2(a1, (uint64_t)(v15 + 12), inserted);
        }
        goto LABEL_38;
      }
      uint64_t v21 = *(void *)buf;
      *(void *)(*(void *)buf + 24) = *((void *)v15 + 2);
      int v22 = *((_DWORD *)v15 + 12);
      if (v22) {
        *(_WORD *)(v21 + 60) = v22;
      }
      *(unsigned char *)(v21 + 1) = 4;
      uint64_t inserted = insert_jobj(a1, v16, (unsigned __int8 *)v21, v14);
      if (inserted && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        merge_ino_purgeable_flags_cold_1(a1, (uint64_t)(v15 + 12), inserted);
      }
      uint64_t v23 = a1;
      char v24 = (unsigned char *)v21;
    }
    jobj_release(v23, v24);
    goto LABEL_37;
  }
  uint64_t inserted = v20;
  BOOL v12 = 0;
LABEL_40:
  if (v31) {
    jobj_release(a1, v31);
  }
  if (v12) {
    fs_tx_leave(a1, 1, 2, 0, v32);
  }
  return inserted;
}

uint64_t lookup_purgeable_drec_as_record(uint64_t a1, uint64_t a2, unint64_t a3, char a4, char a5, void *a6)
{
  unint64_t v8 = a3;
  int v35 = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v36 = a3;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 1) == 0)
  {
    if ((*(_WORD *)(a2 + 104) & 0xF000) == 0x4000)
    {
      uint64_t purgeable_dir_size = get_purgeable_dir_size(a1, a2, &v36);
      if (purgeable_dir_size) {
        return purgeable_dir_size;
      }
      unint64_t v8 = v36;
    }
    else
    {
      unint64_t v8 = ino_phys_size(a1, a2);
      unint64_t v36 = v8;
    }
  }
  unint64_t purgeable_record_id_for_lookup = get_purgeable_record_id_for_lookup(a1, a2, a5);
  uint64_t inode = a2;
  if (purgeable_record_id_for_lookup != *(void *)(a2 + 8))
  {
    uint64_t inode = fs_get_inode(a1, purgeable_record_id_for_lookup);
    if (!inode)
    {
      uint64_t inode = a2;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        lookup_purgeable_drec_as_record_cold_4();
        uint64_t inode = a2;
      }
    }
  }
  uint64_t v37 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  uint64_t purgeable_dir_size = make_purgeable_drec(a1, *(_DWORD *)(inode + 96), v8, purgeable_record_id_for_lookup, *(void *)(inode + 8), (unint64_t *)&v37);
  if (inode != a2) {
    jobj_release(a1, (unsigned char *)inode);
  }
  if (purgeable_dir_size)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      lookup_purgeable_drec_as_record_cold_3(a1, purgeable_dir_size);
    }
  }
  else
  {
    unint64_t v14 = v37;
    uint64_t purgeable_dir_size = lookup_jobj(a1, 1, 0, v37, &v35);
    if (purgeable_dir_size) {
      int v35 = 0;
    }
    jobj_release(a1, v14);
  }
  if (purgeable_dir_size)
  {
    if (purgeable_dir_size != 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      lookup_purgeable_drec_as_record_cold_1();
    }
  }
  else
  {
    uint64_t v15 = _apfs_calloc(1uLL, 0x50uLL);
    if (v15)
    {
      int v16 = v15;
      *(_DWORD *)uint64_t v15 = 5243152;
      v15[1] = 7;
      BOOL v17 = v35;
      v15[2] = *((void *)v35 + 3);
      *((_DWORD *)v15 + 12) = filter_purgeable_flags_for_vol(a1, v17[30]);
      BOOL v18 = v35;
      v16[3] = *((void *)v35 + 2);
      v16[5] = *(void *)(a2 + 32);
      uint64_t v19 = (unsigned char *)*((void *)v18 + 8);
      unint64_t v20 = v18[31];
      *((_DWORD *)v16 + 13) = 0;
      if (v20 >= 3 && *v19 == 48 && v19[1] == 120)
      {
        unint64_t v21 = (unint64_t)&v19[v20];
        unint64_t v22 = (unint64_t)(v19 + 2);
        do
        {
          if (!*(unsigned char *)v22) {
            break;
          }
          if ((*(unsigned char *)v22 - 48) >= 0xAu)
          {
            unsigned int v23 = *(unsigned __int8 *)v22 - 65;
            BOOL v24 = v23 > 0x25;
            uint64_t v25 = (1 << v23) & 0x3F0000003FLL;
            if (v24 || v25 == 0) {
              break;
            }
          }
          ++v22;
        }
        while (v22 < v21);
        if (v22 < v21)
        {
          int v27 = &v19[v20 - v22];
          while (*(unsigned char *)v22 && *(unsigned char *)v22 != 58)
          {
            ++v22;
            if (!--v27)
            {
              unint64_t v22 = (unint64_t)&v19[v20];
              break;
            }
          }
        }
        uint64_t v28 = (unsigned __int8 *)(v22 + 1);
        if (v22 + 1 < v21 && *(unsigned char *)v22 == 58)
        {
          int v29 = 0;
          int v30 = &v19[v20 + ~v22];
          do
          {
            int v31 = *v28;
            if ((v31 - 48) > 9) {
              break;
            }
            int v29 = v31 + 10 * v29 - 48;
            ++v28;
            --v30;
          }
          while (v30);
          *((_DWORD *)v16 + 13) = v29;
        }
      }
      v16[4] = v8;
      if (xf_get(v18 + 16, 2, 0, (char *)&v34, 8uLL)
        || (uint64_t v32 = xf_set((unsigned __int16 *)v16 + 28, 1, 0, &v34, 8uLL), !v32))
      {
        uint64_t purgeable_dir_size = 0;
        *a6 = v16;
      }
      else
      {
        uint64_t purgeable_dir_size = v32;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          lookup_purgeable_drec_as_record_cold_2();
        }
        jobj_release(a1, v16);
      }
    }
    else
    {
      uint64_t purgeable_dir_size = 12;
    }
    jobj_release(a1, v35);
  }
  return purgeable_dir_size;
}

uint64_t lookup_expanded_purgeable_record(uint64_t a1, uint64_t a2, int a3, unsigned __int16 **a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL has_secondary_fsroot = apfs_has_secondary_fsroot(a1);
  long long v15 = xmmword_22CB69AA0;
  LODWORD(v15) = 5242896;
  uint64_t v16 = *(void *)(a2 + 64);
  unint64_t purgeable_record_id_for_lookup = get_purgeable_record_id_for_lookup(a1, a2, a3);
  unint64_t v17 = purgeable_record_id_for_lookup;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (a3)
  {
    unint64_t v10 = purgeable_record_id_for_lookup;
    uint64_t inode = fs_get_inode(a1, purgeable_record_id_for_lookup);
    if (inode)
    {
      uint64_t v16 = *(void *)(inode + 64);
      jobj_release(a1, (unsigned char *)inode);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a2 + 8);
      *(_DWORD *)int buf = 136316162;
      unint64_t v22 = "lookup_expanded_purgeable_record";
      __int16 v23 = 1024;
      int v24 = 1063;
      __int16 v25 = 2080;
      uint64_t v26 = a1 + 3832;
      __int16 v27 = 2048;
      unint64_t v28 = v10;
      __int16 v29 = 2048;
      uint64_t v30 = v12;
      _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s failed to find host inode (id %llu) for purgeable rec lookup, falling back to ino %llu's atime\n", buf, 0x30u);
    }
  }
  if (has_secondary_fsroot) {
    int v13 = 8;
  }
  else {
    int v13 = 1;
  }
  return lookup_jobj(a1, v13, 0, (unsigned __int8 *)&v15, a4);
}

unint64_t get_purgeable_record_id_for_lookup(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3)
  {
    unint64_t __dst = 0xAAAAAAAAAAAAAAAALL;
    p_dst = &__dst;
    if (xf_get((unsigned __int16 *)(a2 + 416), 18, 0, (char *)&__dst, 8uLL))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a2 + 8);
        *(_DWORD *)int buf = 136315906;
        unint64_t v10 = "get_purgeable_record_id_for_lookup";
        __int16 v11 = 1024;
        int v12 = 577;
        __int16 v13 = 2080;
        uint64_t v14 = a1 + 3832;
        __int16 v15 = 2048;
        uint64_t v16 = v6;
        _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s ino %lld did not have a source-purge-id\n", buf, 0x26u);
      }
      p_dst = (unint64_t *)(a2 + 32);
    }
  }
  else
  {
    p_dst = (unint64_t *)(a2 + 8);
  }
  return *p_dst;
}

uint64_t make_purgeable_drec(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v9;
  long long v21 = v9;
  long long v18 = v9;
  long long v19 = v9;
  long long v16 = v9;
  long long v17 = v9;
  *(_OWORD *)__str = v9;
  long long v15 = v9;
  int v10 = snprintf(__str, 0x80uLL, "0x%llx-0x%llx:%d", a3, a4, a2);
  if (v10 <= 0) {
    size_t v11 = v10;
  }
  else {
    size_t v11 = (v10 + 1);
  }
  if ((int)v11 < 1) {
    return 12;
  }
  uint64_t result = dir_rec_alloc(a1, 1, __str, v11, 7, a5, &v13);
  if (!result) {
    *a6 = v13;
  }
  return result;
}

uint64_t _remove_purgeable_record_cb(uint64_t a1, unsigned int a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v9 = *(void *)a5;
  if ((*(void *)(*(void *)(*(void *)a5 + 376) + 56) & 0x200) != 0) {
    int v10 = 16;
  }
  else {
    int v10 = 9;
  }
  int v11 = jobj_type_from_possibly_large_key(*(void *)a5, a1);
  if (*(void *)(a5 + 16))
  {
    int v12 = *(_DWORD *)(a5 + 24) + 1;
    *(_DWORD *)(a5 + 24) = v12;
    if ((v12 & 0x3F) == 0)
    {
      if (tx_is_closing(*(void *)(v9 + 392)))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a5 + 8);
          *(_DWORD *)int buf = 136315906;
          *(void *)&uint8_t buf[4] = "_remove_purgeable_record_cb";
          __int16 v22 = 1024;
          int v23 = 1579;
          __int16 v24 = 2080;
          uint64_t v25 = v9 + 3832;
          __int16 v26 = 2048;
          uint64_t v27 = v13;
          _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s Aborting iterative purgeable record removal for id %llu because transaction is closing\n", buf, 0x26u);
        }
        return 0x80000000;
      }
    }
  }
  if (v11 != v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      _remove_purgeable_record_cb_cold_3();
    }
    return 0x80000000;
  }
  uint64_t v14 = *(void *)a1 >> 60;
  if (v14 == 14) {
    LODWORD(v14) = *(unsigned __int8 *)(a1 + 8);
  }
  if (v14 != 9)
  {
    if (v14 != 16)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        _remove_purgeable_record_cb_cold_2();
      }
      goto LABEL_33;
    }
    a3 = (void *)(a1 + 20);
  }
  if (*a3)
  {
    if (*a3 == *(void *)(a5 + 8))
    {
      unint64_t v15 = *(void *)(a5 + 16);
      *(void *)int buf = v15;
      if (apfs_has_secondary_fsroot(v9)) {
        int v16 = 8;
      }
      else {
        int v16 = 1;
      }
      long long v20 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v17 = v15;
      if (!v15)
      {
        int tree = fs_tx_enter(v9, 2, 1, 0, (uint64_t *)buf);
        if (tree)
        {
LABEL_38:
          *(_DWORD *)(a5 + 28) = tree;
          return 0x80000000;
        }
        unint64_t v17 = *(void *)buf;
      }
      int tree = jfs_get_tree(v9, v16, v17, (uint64_t *)&v20);
      if (!tree)
      {
        int tree = bt_remove(v20, *(void *)(v9 + 432), (unint64_t *)a1, a2, *(uint64_t *)buf);
        obj_release(v20);
      }
      if (!v15) {
        fs_tx_leave(v9, 2, 1, 0, *(uint64_t *)buf);
      }
      goto LABEL_38;
    }
    return 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136315650;
    *(void *)&uint8_t buf[4] = "get_purgeable_record_details";
    __int16 v22 = 1024;
    int v23 = 1823;
    __int16 v24 = 2080;
    uint64_t v25 = v9 + 3832;
    _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s Found purgeable record with file ID 0!\n", buf, 0x1Cu);
  }
LABEL_33:
  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (!result) {
    return result;
  }
  _remove_purgeable_record_cb_cold_1();
  return 0;
}

void OUTLINED_FUNCTION_21_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t tx_mgr_init(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = *(unsigned int *)(*(void *)(a1 + 376) + 36);
  uint64_t v7 = (pthread_mutex_t *)_apfs_calloc(1uLL, 0x130uLL);
  if (!v7) {
    return 12;
  }
  uint64_t v8 = (uint64_t)v7;
  v7[1].__sig = a2;
  *(void *)v7[1].__opaque = 0;
  *(void *)&v7[1].__opaque[40] = 0;
  *(_DWORD *)&v7[1].__opaque[8] = 0;
  *(_DWORD *)&v7[1].__opaque[12] = (v6 - 40) / 0x28uLL;
  *(void *)&v7[1].__opaque[48] = (char *)v7 + 112;
  v7[2].__sig = 0;
  *(void *)v7[2].__opaque = v7 + 2;
  uint64_t inited = new_lock(v7);
  if (!inited)
  {
    uint64_t v10 = new_cv((pthread_cond_t *)(v8 + 256));
    if (v10)
    {
      uint64_t inited = v10;
      free_lock((pthread_mutex_t *)v8);
    }
    else if (*(unsigned char *)(a1 + 627) || (uint64_t inited = tx_mgr_init_tx(v8, v6), !inited))
    {
      uint64_t inited = 0;
      uint64_t v12 = *(void *)(a1 + 376);
      int v13 = *(_DWORD *)(v12 + 104) & 0x7FFFFFFF;
      int v14 = *(_DWORD *)(v12 + 108) & 0x7FFFFFFF;
      *(_DWORD *)(v8 + 88) = v13;
      *(_DWORD *)(v8 + 92) = v14;
      *(void *)(v8 + 96) = *(void *)(v12 + 128);
      *(_DWORD *)(v8 + 104) = v13;
      *(_DWORD *)(v8 + 108) = v14;
      *a3 = v8;
      return inited;
    }
  }
  _apfs_free((void *)v8, 304);
  return inited;
}

uint64_t tx_mgr_init_tx(uint64_t a1, unsigned int a2)
{
  size_t v3 = a2;
  int v4 = 4;
  while (1)
  {
    __int16 v5 = _apfs_calloc(1uLL, 0x78uLL);
    if (!v5) {
      break;
    }
    uint64_t v6 = v5;
    v5[7] = _apfs_malloc(v3);
    v6[8] = _apfs_malloc(v3);
    uint64_t v7 = *(void **)(a1 + 120);
    *uint64_t v6 = 0;
    v6[1] = v7;
    *uint64_t v7 = v6;
    *(void *)(a1 + 120) = v6;
    if (!v6[7] || !v6[8]) {
      break;
    }
    if (!--v4) {
      return 0;
    }
  }
  while (1)
  {
    int v13 = *(uint64_t **)(a1 + 112);
    if (!v13) {
      break;
    }
    uint64_t v9 = *v13;
    uint64_t v10 = (void *)v13[1];
    if (*v13)
    {
      *(void *)(v9 + 8) = v10;
      uint64_t v10 = (void *)v13[1];
    }
    else
    {
      *(void *)(a1 + 120) = v10;
    }
    *uint64_t v10 = v9;
    int v11 = (void *)v13[7];
    if (v11) {
      _apfs_free(v11, v3);
    }
    uint64_t v12 = (void *)v13[8];
    if (v12) {
      _apfs_free(v12, v3);
    }
    _apfs_free(v13, 120);
  }
  return 12;
}

void tx_mgr_free_tx(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)a2[18];
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 384) + 208;
      uint64_t v15 = v6[2];
      int v19 = 136315906;
      long long v20 = "tx_mgr_free_tx";
      __int16 v21 = 1024;
      int v22 = 189;
      __int16 v23 = 2080;
      uint64_t v24 = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Trash unfinished tx xid=0x%llx\n", (uint8_t *)&v19, 0x26u);
      uint64_t v6 = (void *)a2[18];
    }
    *uint64_t v6 = 0;
    uint64_t v7 = (void *)a2[15];
    v6[1] = v7;
    *uint64_t v7 = v6;
    a2[15] = a2[18];
    a2[18] = 0;
  }
  uint64_t v8 = a2[16];
  if (v8)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v16 = *(void *)(a1 + 384) + 208;
    uint64_t v17 = *(void *)(v8 + 16);
    uint64_t v18 = *(void *)(**(void **)(a2[17] + 8) + 16);
    int v19 = 136316162;
    long long v20 = "tx_mgr_free_tx";
    __int16 v21 = 1024;
    int v22 = 197;
    __int16 v23 = 2080;
    uint64_t v24 = v16;
    __int16 v25 = 2048;
    uint64_t v26 = v17;
    __int16 v27 = 2048;
    uint64_t v28 = v18;
    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Trash unfinished pending tx, xid range = 0x%llx - 0x%llx\n", (uint8_t *)&v19, 0x30u);
    uint64_t v8 = a2[16];
    if (v8)
    {
LABEL_7:
      *(void *)a2[15] = v8;
      *(void *)(a2[16] + 8) = a2[15];
      a2[15] = a2[17];
      a2[16] = 0;
      a2[17] = a2 + 16;
    }
  }
  uint64_t v9 = (void *)a2[14];
  if (v9)
  {
    do
    {
      int v11 = (void *)*v9;
      uint64_t v10 = (void *)v9[1];
      if (*v9)
      {
        v11[1] = v10;
        uint64_t v10 = (void *)v9[1];
      }
      else
      {
        a2[15] = v10;
      }
      *uint64_t v10 = v11;
      uint64_t v12 = (void *)v9[7];
      if (v12) {
        _apfs_free(v12, a3);
      }
      int v13 = (void *)v9[8];
      if (v13) {
        _apfs_free(v13, a3);
      }
      _apfs_free(v9, 120);
      uint64_t v9 = v11;
    }
    while (v11);
  }
}

void tx_mgr_destroy(uint64_t a1, uint64_t a2, unsigned int a3)
{
  tx_mgr_free_tx(a1, (void *)a2, a3);
  free_lock((pthread_mutex_t *)a2);
  free_cv((pthread_cond_t *)(a2 + 256));

  _apfs_free((void *)a2, 304);
}

BOOL xid_is_current_tx(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 624))
  {
    unint64_t v2 = (void *)(*(void *)(a1 + 376) + 96);
    return *v2 == a2;
  }
  uint64_t v3 = *(void *)(a1 + 400);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 144);
    if (v4)
    {
      unint64_t v2 = (void *)(v4 + 16);
      return *v2 == a2;
    }
  }
  return 0;
}

uint64_t tx_checkpoint_space_check(uint64_t a1, uint64_t a2, int a3)
{
  int v4 = 0;
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 400);
  while (1)
  {
    unsigned int v6 = *(_DWORD *)(v5 + 96);
    unsigned int v7 = *(_DWORD *)(v5 + 104);
    unsigned int v8 = v7;
    if (v6 > v7) {
      unsigned int v8 = *(_DWORD *)(v5 + 88) + v7;
    }
    unsigned int v9 = *(_DWORD *)(v5 + 100);
    unsigned int v10 = *(_DWORD *)(v5 + 108);
    unsigned int v11 = v10;
    if (v9 > v10) {
      unsigned int v11 = *(_DWORD *)(v5 + 92) + v10;
    }
    unsigned int v12 = v8 - v6;
    unsigned int v13 = v11 - v9;
    unsigned int v14 = *(_DWORD *)(a2 + 40) + 1;
    BOOL v15 = v14 > v8 - v6;
    unsigned int v16 = *(_DWORD *)(a2 + 48) + a3;
    if (v16 <= v11 - v9 && ((v4 | v15) & 1) == 0) {
      return 0;
    }
    if ((v4 & 1) != 0 || !*(void *)(v5 + 128)) {
      break;
    }
    tx_barrier_internal(a1, 0x50u, 0);
    int v4 = 1;
  }
  if (!*(_WORD *)(v5 + 82) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 384) + 208;
    uint64_t v19 = *(void *)(a2 + 16);
    *(_DWORD *)int buf = 136317954;
    __int16 v23 = "tx_checkpoint_space_check";
    __int16 v24 = 1024;
    int v25 = 495;
    __int16 v26 = 2080;
    uint64_t v27 = v18;
    __int16 v28 = 1024;
    unsigned int v29 = v7;
    __int16 v30 = 1024;
    unsigned int v31 = v10;
    __int16 v32 = 1024;
    unsigned int v33 = v6;
    __int16 v34 = 1024;
    unsigned int v35 = v9;
    __int16 v36 = 1024;
    unsigned int v37 = v12;
    __int16 v38 = 1024;
    unsigned int v39 = v13;
    __int16 v40 = 2048;
    uint64_t v41 = v19;
    __int16 v42 = 1024;
    unsigned int v43 = v14;
    __int16 v44 = 1024;
    unsigned int v45 = v16;
    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s checkpoint area out of space: stable: %d %d - next %d %d available %d %d tx[%lld] %d %d\n", buf, 0x56u);
  }
  *(_WORD *)(v5 + 82) = 1;
  return 28;
}

uint64_t tx_barrier_internal(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v6 = *(void *)(a1 + 400);
  if ((a2 & 0x40) != 0)
  {
    uint64_t v7 = *(void *)(v6 + 128);
    if (!v7 || (*(unsigned char *)(v7 + 24) & 0x40) == 0) {
      return 0;
    }
  }
  if (a3) {
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 400));
  }
  uint64_t v8 = dev_barrier(*(void *)(a1 + 384), (a2 >> 4) & 1);
  if (a3) {
    pthread_mutex_lock((pthread_mutex_t *)v6);
  }
  if (v8 == 25 || v8 == 0)
  {
    unsigned int v10 = *(uint64_t **)(v6 + 128);
    if (v10)
    {
      do
      {
        unsigned int v11 = (uint64_t *)*v10;
        int v12 = *((_DWORD *)v10 + 6);
        if ((v12 & 0x40) != 0)
        {
          *((_DWORD *)v10 + 6) = v12 & 0xFFFFFFBF;
          v20.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v20.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &v20);
          __darwin_time_t v13 = 1000000 * v20.tv_sec + SLODWORD(v20.tv_nsec) / 1000;
          __darwin_time_t v14 = v13 - v10[9];
          v10[9] = v13;
          v10[13] += v14;
          unint64_t v15 = v10[2];
          if (!*(unsigned char *)(a1 + 632) || v15 < *(void *)(*(void *)(a1 + 376) + 1408))
          {
            *(_DWORD *)(v6 + 104) = *((_DWORD *)v10 + 9);
            *(_DWORD *)(v6 + 108) = *((_DWORD *)v10 + 11);
          }
          spaceman_tx_complete((void *)a1, v15);
          uint64_t v16 = *v10;
          uint64_t v17 = (void *)v10[1];
          if (*v10)
          {
            *(void *)(v16 + 8) = v17;
            uint64_t v17 = (void *)v10[1];
          }
          else
          {
            *(void *)(v6 + 136) = v17;
          }
          void *v17 = v16;
          *unsigned int v10 = 0;
          uint64_t v18 = *(void **)(v6 + 120);
          v10[1] = (uint64_t)v18;
          *uint64_t v18 = v10;
          *(void *)(v6 + 120) = v10;
          cv_wakeup((pthread_cond_t *)(v6 + 256));
        }
        unsigned int v10 = v11;
      }
      while (v11);
    }
    return 0;
  }
  return v8;
}

uint64_t tx_checkpoint_write_prepare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = (*(_DWORD *)(*(void *)(a1 + 376) + 36) + *(_DWORD *)(a3 + 48) - 1)
     / *(_DWORD *)(*(void *)(a1 + 376) + 36);
  uint64_t v6 = *(void *)(a2 + 64);
  if (*(_DWORD *)(v6 + 36) == *(_DWORD *)(*(void *)(a1 + 400) + 84))
  {
    ++*(_DWORD *)(a2 + 40);
    *(_DWORD *)(v6 + 36) = 0;
  }
  uint64_t v7 = tx_checkpoint_space_check(a1, a2, v5);
  if (!v7)
  {
    if ((*(unsigned char *)(a3 + 19) & 0x20) == 0)
    {
      unsigned int v10 = *(void **)(a3 + 56);
      v8.i64[0] = *(void *)(a3 + 36);
      unint64_t v10[3] = v8.i64[0];
      uint64_t v11 = *(void *)(a2 + 16);
      v10[1] = *(void *)(a3 + 112);
      v10[2] = v11;
      obj_checksum_set(a3, v8, v9);
    }
    *(void *)(a3 + 120) = *(void *)(a2 + 16);
    *(void *)(a3 + 144) = 0;
    ++*(_DWORD *)(*(void *)(a2 + 64) + 36);
    *(_DWORD *)(a2 + 48) += v5;
  }
  return v7;
}

uint64_t tx_checkpoint_write(void *a1, uint64_t a2, uint64_t a3, int8x16_t a4, int8x16_t a5)
{
  int8x16_t v8 = (_DWORD *)a1[50];
  unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  size_t v9 = *(unsigned int *)(a1[47] + 36);
  int v10 = *(_DWORD *)(a3 + 48);
  int v12 = (uint64_t *)(a2 + 64);
  uint64_t v11 = *(void *)(a2 + 64);
  if (*(_DWORD *)(v11 + 36) == v8[21])
  {
    obj_checksum_set_phys((uint64_t)a1, v11, *(_DWORD *)(a1[47] + 36), a4, a5);
    uint64_t v13 = dev_write(a1[48], *(void *)(*v12 + 8));
    if (v13)
    {
      uint64_t v14 = v13;
      if (!v8[19] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        tx_checkpoint_write_cold_4();
      }
      return v14;
    }
    unint64_t v15 = (*(_DWORD *)(a2 + 40) + v8[24]) % v8[22];
    unint64_t v39 = -1;
    uint64_t v16 = nx_checkpoint_desc_block_address((uint64_t)a1, v15, &v39);
    if (v16)
    {
      uint64_t v14 = v16;
      if (!v8[19] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        tx_checkpoint_write_cold_3();
      }
      return v14;
    }
    bzero(*(void **)(a2 + 64), v9);
    uint64_t v17 = *(void *)(a2 + 64);
    *(_DWORD *)(v17 + 24) = 1073741836;
    *(void *)(v17 + 8) = v39;
    *(void *)(v17 + 16) = *(void *)(a2 + 16);
    ++*(_DWORD *)(a2 + 40);
  }
  unint64_t v18 = (*(_DWORD *)(a2 + 48) + v8[25]) % v8[23];
  uint64_t v38 = -1;
  uint64_t v19 = nx_checkpoint_data_block_address((uint64_t)a1, v18, &v38, &v37);
  if (v19)
  {
    uint64_t v14 = v19;
    if (!v8[19] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      tx_checkpoint_write_cold_2();
    }
  }
  else
  {
    uint64_t v35 = a2;
    signed int v20 = ((int)v9 + v10 - 1) / v9;
    pthread_mutex_lock((pthread_mutex_t *)(a1[49] + 328));
    for (int i = (atomic_uint *)(a3 + 32);
          (atomic_fetch_or_explicit(i, 8u, memory_order_relaxed) & 8) != 0;
          int i = (atomic_uint *)(a3 + 32))
    {
      pthread_mutex_unlock((pthread_mutex_t *)(a1[49] + 328));
      pthread_mutex_lock((pthread_mutex_t *)(a1[49] + 328));
    }
    __int16 v36 = *(char **)(a3 + 64);
    *(void *)(a3 + 128) = v38;
    if (v20 < 1)
    {
LABEL_30:
      if (v36 == *(char **)(a3 + 56)) {
        __int16 v26 = 0;
      }
      else {
        __int16 v26 = v36;
      }
      *(void *)(a3 + 64) = 0;
      uint64_t v27 = a1[49];
      uint64_t v28 = *(void *)(*(void *)(v27 + 848) + 104);
      *(void *)(v27 + 848) = v28;
      if (!v28) {
        *(void *)(v27 + 856) = v27 + 848;
      }
      *(void *)(a3 + 104) = 3735928559;
      atomic_fetch_and_explicit((atomic_uint *volatile)(a3 + 32), 0xFFFFFFF7, memory_order_relaxed);
      pthread_mutex_unlock((pthread_mutex_t *)(a1[49] + 328));
      uint64_t v29 = *v12;
      unsigned int v30 = *(_DWORD *)(*v12 + 36);
      uint64_t v31 = *v12 + 40 * v30;
      *(void *)(v31 + 40) = *(void *)(a3 + 36);
      *(void *)(v31 + 48) = *(unsigned int *)(a3 + 48);
      uint64_t v32 = *(void *)(a3 + 8);
      if (v32)
      {
        uint64_t v32 = obj_oid(v32);
        uint64_t v29 = *v12;
        unsigned int v30 = *(_DWORD *)(*v12 + 36);
      }
      unsigned int v33 = (void *)(v29 + 40 * v30);
      v33[7] = v32;
      v33[8] = *(void *)(a3 + 112);
      v33[9] = *(void *)(a3 + 128);
      *(_DWORD *)(v29 + 36) = v30 + 1;
      *(_DWORD *)(v35 + 48) += v20;
      if (v26) {
        fs_obj_zfree_oc(v26, *(unsigned int *)(a3 + 48), *(void *)(a3 + 16), a1[49]);
      }
      return 0;
    }
    else
    {
      int v22 = v36;
      unsigned int v23 = ((int)v9 + v10 - 1) / v9;
      while (1)
      {
        unint64_t v24 = v37 >= v23 ? v23 : v37;
        uint64_t v25 = dev_write(a1[48], v38);
        if (v25) {
          break;
        }
        v23 -= v24;
        if (!v23) {
          goto LABEL_30;
        }
        unint64_t v18 = (int)v18 + (int)v24 >= (*(_DWORD *)(a1[47] + 108) & 0x7FFFFFFFu) ? 0 : (v18 + v24);
        uint64_t v25 = nx_checkpoint_data_block_address((uint64_t)a1, v18, &v38, &v37);
        if (v25) {
          break;
        }
        v22 += v24 * v9;
        if ((int)v23 <= 0) {
          goto LABEL_30;
        }
      }
      uint64_t v14 = v25;
      atomic_fetch_and_explicit((atomic_uint *volatile)(a3 + 32), 0xFFFFFFF7, memory_order_relaxed);
      pthread_mutex_unlock((pthread_mutex_t *)(a1[49] + 328));
      if (!v8[19] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        tx_checkpoint_write_cold_1();
      }
    }
  }
  return v14;
}

uint64_t tx_barrier(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 400);
  if ((a2 & 0x80) != 0 && (uint64_t v5 = *(void *)(v4 + 144)) != 0 && (*(unsigned char *)(v5 + 24) & 8) != 0)
  {
    int v6 = 0;
    if ((a2 & 0x40) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 400));
    int v6 = 1;
    if ((a2 & 0x40) == 0) {
      goto LABEL_11;
    }
  }
  uint64_t v7 = *(void *)(v4 + 128);
  if (!v7 || (*(unsigned char *)(v7 + 24) & 0x40) == 0)
  {
    if (v6) {
      pthread_mutex_unlock((pthread_mutex_t *)v4);
    }
    return 0;
  }
LABEL_11:
  uint64_t v8 = tx_barrier_internal(a1, a2, 0);
  if (v6) {
    pthread_mutex_unlock((pthread_mutex_t *)v4);
  }
  return v8;
}

void tx_unmount(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 400);
  pthread_mutex_lock((pthread_mutex_t *)v2);
  *(_DWORD *)(v2 + 72) |= 1u;
  pthread_mutex_unlock((pthread_mutex_t *)v2);
  uint64_t v3 = &_os_log_internal;
  while (1)
  {
    int v4 = tx_finish(a1, 8);
    if (v4 != 16) {
      break;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 384) + 208;
      *(_DWORD *)int buf = 136315650;
      int v10 = "tx_unmount";
      __int16 v11 = 1024;
      int v12 = 1880;
      __int16 v13 = 2080;
      uint64_t v14 = v5;
      _os_log_debug_impl(&dword_22CAAC000, v3, OS_LOG_TYPE_DEBUG, "%s:%d: %s waiting for transaction to finish\n", buf, 0x1Cu);
    }
    sleep(1u);
  }
  if (!v4)
  {
    if (*(unsigned char *)(a1 + 629)) {
      return;
    }
    pthread_mutex_lock((pthread_mutex_t *)v2);
    if ((*(unsigned char *)(v2 + 72) & 2) != 0)
    {
      if (tx_barrier_internal(a1, 0x10u, 0)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        tx_unmount_cold_5();
      }
      obj_checksum_set(a1, v6, v7);
      if (dev_write(*(void *)(a1 + 384), 0)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        tx_unmount_cold_4();
      }
      uint64_t v8 = *(unsigned char **)(a1 + 376);
      if ((v8[65] & 1) != 0
        && nx_fusion_superblock_write(a1, v8)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        tx_unmount_cold_3();
      }
      if (tx_barrier_internal(a1, 0x10u, 0)
        && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        tx_unmount_cold_2();
      }
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    tx_unmount_cold_1();
  }
  if (!*(unsigned char *)(a1 + 629))
  {
    pthread_mutex_lock((pthread_mutex_t *)v2);
LABEL_26:
    pthread_mutex_unlock((pthread_mutex_t *)v2);
  }
}

uint64_t tx_finish(uint64_t a1, __int16 a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 627)) {
    return 30;
  }
  uint64_t v5 = *(void *)(a1 + 400);
  pthread_mutex_lock((pthread_mutex_t *)v5);
  int v6 = *(_DWORD *)(v5 + 72);
  if ((a2 & 8) != 0 || (v6 & 1) == 0)
  {
    while (1)
    {
      uint64_t v7 = *(void *)(v5 + 144);
      if ((v6 & 0x40) == 0) {
        break;
      }
      if (v7) {
        *(_DWORD *)(v7 + 24) |= 0x100000u;
      }
      if ((a2 & 0x100) != 0)
      {
        *(_DWORD *)(v5 + 72) = v6 & 0xFFFFFFF3;
        cv_wakeup((pthread_cond_t *)(v5 + 256));
        uint64_t v7 = *(void *)(v5 + 144);
      }
      if (v7)
      {
        uint64_t v2 = *(unsigned int *)(v7 + 52);
        if (v2) {
          goto LABEL_66;
        }
      }
      cv_wait((pthread_cond_t *)(v5 + 256), (pthread_mutex_t *)v5, 8, (uint64_t)"nx_tx_finish_wait_for_dirty_data", 0);
      uint64_t v8 = *(void *)(v5 + 144);
      if (v8)
      {
        unsigned int v9 = *(_DWORD *)(v8 + 52);
        if (v9 | a2 & 0x100)
        {
          if (v9) {
            uint64_t v2 = v9;
          }
          else {
            uint64_t v2 = 35;
          }
          goto LABEL_66;
        }
      }
      else if ((a2 & 0x100) != 0)
      {
        uint64_t v2 = 35;
LABEL_66:
        pthread_mutex_unlock((pthread_mutex_t *)v5);
        return v2;
      }
      int v6 = *(_DWORD *)(v5 + 72);
      if (a2 & 8) == 0 && (v6) {
        goto LABEL_18;
      }
    }
    if (!v7)
    {
      uint64_t v7 = **(void **)(*(void *)(v5 + 136) + 8);
      if (!v7 || (*(unsigned char *)(v7 + 24) & 0x30) == 0)
      {
        if ((a2 & 0x11) != 0) {
          uint64_t v2 = tx_barrier_internal(a1, a2 & 0x10, 0);
        }
        else {
          uint64_t v2 = 0;
        }
        goto LABEL_66;
      }
    }
    if ((a2 & 2) == 0 && (v6 & 0xC) == 8)
    {
      pthread_mutex_unlock((pthread_mutex_t *)v5);
      return 16;
    }
    uint64_t v10 = *(void *)(v7 + 16);
    if ((a2 & 8) == 0) {
      ++*(void *)(v5 + 176);
    }
    int v11 = *(_DWORD *)(v7 + 24);
    int v12 = a2 & 1;
    if (v11 & 0x100000 | a2 & 0x10 | v12 | a2 & 0x20) {
      *(_DWORD *)(v7 + 24) = ((a2 & 0x30) << 14) | (v12 << 17) | v11 & 0xFFEFFFFF;
    }
    if (v11) {
      tx_transition(v7, 1, 2);
    }
    if (*(_DWORD *)(v7 + 28))
    {
      uint64_t v2 = (16 * v12) ^ 0x10u;
    }
    else
    {
      if ((*(unsigned char *)(v7 + 24) & 2) != 0)
      {
        unint64_t v13 = tx_transition(v7, 2, 4);
        if (v13 >= 0xF4241 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 384) + 208;
          uint64_t v15 = *(void *)(v7 + 16);
          int v21 = 136316162;
          int v22 = "tx_finish";
          __int16 v23 = 1024;
          int v24 = 2149;
          __int16 v25 = 2080;
          uint64_t v26 = v14;
          __int16 v27 = 2048;
          uint64_t v28 = v15;
          __int16 v29 = 2048;
          unint64_t v30 = v13;
          _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to close\n", (uint8_t *)&v21, 0x30u);
        }
        *(void *)(v5 + 248) = (*(void *)(v5 + 248) + v13) >> 1;
      }
      uint64_t v2 = tx_flush_initiate(a1);
      if (!v2)
      {
        int v16 = *(_DWORD *)(v5 + 72);
        if ((v16 & 0x40) != 0)
        {
          *(_DWORD *)(v5 + 72) = v16 & 0xFFFFFFF3;
          if ((a2 & 0x100) != 0)
          {
LABEL_68:
            pthread_mutex_unlock((pthread_mutex_t *)v5);
            return 35;
          }
          cv_wakeup((pthread_cond_t *)(v5 + 256));
        }
        uint64_t v2 = 0;
      }
    }
    if ((a2 & 9) != 0)
    {
      if (a2) {
        int v17 = 126;
      }
      else {
        int v17 = 62;
      }
      do
      {
        if (*(void *)(v7 + 16) != v10 || (*(_DWORD *)(v7 + 24) & v17) == 0) {
          break;
        }
        if (!v2) {
          cv_wait((pthread_cond_t *)(v5 + 256), (pthread_mutex_t *)v5, 8, (uint64_t)"nx_tx_finish_wait", 0);
        }
        int v18 = *(_DWORD *)(v5 + 72);
        if (a2 & 8) == 0 && (v18) {
          goto LABEL_18;
        }
        if ((a2 & 0x100) != 0 && (v18 & 4) == 0) {
          goto LABEL_68;
        }
      }
      while (!*(_DWORD *)(v5 + 76));
      uint64_t v19 = **(void **)(*(void *)(v5 + 136) + 8);
      if (!v19 || (uint64_t v2 = *(unsigned int *)(v19 + 52), !v2)) {
        uint64_t v2 = *(unsigned int *)(v7 + 52);
      }
    }
    goto LABEL_66;
  }
LABEL_18:
  pthread_mutex_unlock((pthread_mutex_t *)v5);
  return 1;
}

uint64_t tx_enter_internal(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 627)) {
    return 30;
  }
  uint64_t v7 = *(void *)(a1 + 400);
  pthread_mutex_lock((pthread_mutex_t *)v7);
  if (*(_DWORD *)(v7 + 72))
  {
LABEL_37:
    pthread_mutex_unlock((pthread_mutex_t *)v7);
    return 1;
  }
  uint64_t v8 = *a2;
  if (*a2 != -1)
  {
    if (v8) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
  uint64_t v11 = *(void *)(v7 + 144);
  if (v11) {
    BOOL v12 = (*(_DWORD *)(v7 + 72) & 0xC) == 8;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || (*(unsigned char *)(v11 + 24) & 0x1C) != 0)
  {
    *a2 = 0;
LABEL_15:
    memset(__tp, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
    uint64_t v15 = 0;
    uint64_t v42 = *(_DWORD *)&__tp[8] / 1000;
    uint64_t v43 = *(void *)__tp;
    while (1)
    {
      uint64_t v9 = *(void *)(v7 + 144);
      if (v9 && (*(unsigned char *)(v9 + 24) & 0x1E) != 0)
      {
        if (*(_WORD *)(v7 + 80)) {
          goto LABEL_79;
        }
        int v16 = "nx_tx_wait";
        if ((a3 & 2) != 0)
        {
LABEL_20:
          int v17 = *(_DWORD *)(v9 + 24);
          uint64_t v15 = "nx_tx_wait_closing";
          if ((v17 & 2) == 0)
          {
            if ((v17 & 4) != 0)
            {
              uint64_t v18 = **(void **)(*(void *)(v7 + 136) + 8);
              if (!v18 || (uint64_t v15 = "nx_tx_wait_closed_prev_flushing", (*(unsigned char *)(v18 + 24) & 0x30) == 0)) {
                uint64_t v15 = "nx_tx_wait_closed";
              }
            }
            else if ((v17 & 0x18) != 0)
            {
              uint64_t v15 = "nx_tx_wait_flush";
            }
            else
            {
              uint64_t v15 = v16;
            }
          }
          goto LABEL_36;
        }
      }
      else
      {
        if ((a3 & 2) != 0 || (*(unsigned char *)(v7 + 72) & 8) == 0)
        {
          uint64_t v3 = 0;
          int v44 = 0;
          uint64_t v19 = &_os_log_internal;
          v13.i64[0] = 136316162;
          if (!v9) {
            goto LABEL_42;
          }
LABEL_40:
          if (*(unsigned char *)(v9 + 24))
          {
            if (!v3)
            {
              ++*(_DWORD *)(v9 + 28);
              *a2 = *(void *)(v9 + 16);
              if (v15)
              {
                int v10 = v44;
                if (v44)
                {
                  if (strcmp(v15, "nx_tx_wait_frozen"))
                  {
                    memset(__tp, 170, 16);
                    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
                    unint64_t v34 = 1000000 * (*(void *)__tp - v43) - v42 + *(_DWORD *)&__tp[8] / 1000;
                    *(void *)(v7 + 168) += v34;
                    if (v34 > 0xF4240
                      && nx_ratelimit_log_allowed(a1)
                      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v35 = *(void *)(a1 + 384) + 208;
                      uint64_t v36 = *(void *)(v9 + 16);
                      *(_DWORD *)__tp = 136316418;
                      *(void *)&__tp[4] = "tx_enter_internal";
                      *(_WORD *)&__tp[12] = 1024;
                      *(_DWORD *)&__tp[14] = 2414;
                      __int16 v46 = 2080;
                      uint64_t v47 = v35;
                      __int16 v48 = 2048;
                      unint64_t v49 = v34;
                      __int16 v50 = 2048;
                      uint64_t v51 = v36;
                      __int16 v52 = 2080;
                      __int16 v53 = v15;
                      _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s waited %lld us to open tx xid %lld (%s)\n", __tp, 0x3Au);
                    }
                    ++*(void *)(v7 + 160);
                  }
                  int v10 = 1;
                }
              }
              else
              {
                int v10 = v44;
              }
LABEL_94:
              ++*(_DWORD *)(v9 + 32);
              pthread_mutex_unlock((pthread_mutex_t *)v7);
              if (v10) {
                spaceman_manage_free_queues((pthread_mutex_t **)a1, v9);
              }
              return 0;
            }
LABEL_92:
            pthread_mutex_unlock((pthread_mutex_t *)v7);
            return v3;
          }
          while (1)
          {
            int v24 = *(_DWORD *)(v9 + 24);
            if ((v24 & 1) == 0) {
              break;
            }
            do
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v32 = *(void *)(a1 + 384) + 208;
                unint64_t v33 = *(void *)(v7 + 64);
                *(_DWORD *)__tp = 136315906;
                *(void *)&__tp[4] = "tx_enter_internal";
                *(_WORD *)&__tp[12] = 1024;
                *(_DWORD *)&__tp[14] = 2399;
                __int16 v46 = 2080;
                uint64_t v47 = v32;
                __int16 v48 = 2048;
                unint64_t v49 = v33;
                _os_log_debug_impl(&dword_22CAAC000, v19, OS_LOG_TYPE_DEBUG, "%s:%d: %s waiting for available tx to open: xid %lld\n", __tp, 0x26u);
              }
              cv_wait((pthread_cond_t *)(v7 + 256), (pthread_mutex_t *)v7, 8, (uint64_t)"nx_tx_wait_open", 0);
LABEL_67:
              uint64_t v9 = *(void *)(v7 + 144);
              if (v9) {
                goto LABEL_40;
              }
LABEL_42:
              signed int v20 = *(uint64_t **)(v7 + 112);
            }
            while (!v20);
            *(void *)(v7 + 144) = v20;
            uint64_t v21 = *v20;
            int v22 = (void *)v20[1];
            if (*v20)
            {
              *(void *)(v21 + 8) = v22;
              int v22 = (void *)v20[1];
            }
            else
            {
              *(void *)(v7 + 120) = v22;
            }
            *int v22 = v21;
            uint64_t v23 = *(void *)(v7 + 64);
            *(void *)(v7 + 64) = v23 + 1;
            uint64_t v9 = *(void *)(v7 + 144);
            *(void *)(v9 + 16) = v23;
            *(void *)(v9 + 24) = 0;
            *(_DWORD *)(v9 + 32) = 0;
            *(_DWORD *)(v9 + 52) = 0;
          }
          if (*(unsigned char *)(a1 + 626))
          {
            obj_checksum_set(a1, v13, v14);
            uint64_t v3 = dev_write(*(void *)(a1 + 384), 0);
            if (v3) {
              goto LABEL_50;
            }
            __int16 v29 = *(unsigned char **)(a1 + 376);
            if (v29[65])
            {
              uint64_t v30 = nx_fusion_superblock_write(a1, v29);
              if (v30)
              {
                uint64_t v3 = v30;
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v31 = *(void *)(a1 + 384) + 208;
                  *(_DWORD *)__tp = 136315906;
                  *(void *)&__tp[4] = "tx_enter_internal";
                  *(_WORD *)&__tp[12] = 1024;
                  *(_DWORD *)&__tp[14] = 2371;
                  __int16 v46 = 2080;
                  uint64_t v47 = v31;
                  __int16 v48 = 1024;
                  LODWORD(v49) = v3;
                  _os_log_error_impl(&dword_22CAAC000, v19, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to write superblock to fusion tier2 device block 0: %d\n", __tp, 0x22u);
                }
LABEL_50:
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v25 = *(void *)(a1 + 384) + 208;
                  unint64_t v26 = *(void *)(*(void *)(v7 + 144) + 16);
                  *(_DWORD *)__tp = 136316162;
                  *(void *)&__tp[4] = "tx_enter_internal";
                  *(_WORD *)&__tp[12] = 1024;
                  *(_DWORD *)&__tp[14] = 2377;
                  __int16 v46 = 2080;
                  uint64_t v47 = v25;
                  __int16 v48 = 2048;
                  unint64_t v49 = v26;
                  __int16 v50 = 1024;
                  LODWORD(v51) = v3;
                  _os_log_error_impl(&dword_22CAAC000, v19, OS_LOG_TYPE_ERROR, "%s:%d: %s Error: tx[%lld] failed to unclean superblock: %d\n", __tp, 0x2Cu);
                }
LABEL_56:
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v27 = *(void *)(a1 + 384) + 208;
                  unint64_t v28 = *(void *)(*(void *)(v7 + 144) + 16);
                  *(_DWORD *)__tp = 136316162;
                  *(void *)&__tp[4] = "tx_enter_internal";
                  *(_WORD *)&__tp[12] = 1024;
                  *(_DWORD *)&__tp[14] = 2381;
                  __int16 v46 = 2080;
                  uint64_t v47 = v27;
                  __int16 v48 = 2048;
                  unint64_t v49 = v28;
                  __int16 v50 = 1024;
                  LODWORD(v51) = v3;
                  _os_log_error_impl(&dword_22CAAC000, v19, OS_LOG_TYPE_ERROR, "%s:%d: %s Error: tx[%lld] failed to start: %d\n", __tp, 0x2Cu);
                }
                goto LABEL_67;
              }
            }
            *(unsigned char *)(a1 + 626) = 0;
            uint64_t v9 = *(void *)(v7 + 144);
            int v24 = *(_DWORD *)(v9 + 24);
            if (v24) {
              panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v24, 1, 0);
            }
          }
          else if (v3)
          {
            goto LABEL_56;
          }
          *(_DWORD *)(v9 + 24) = v24 | 1;
          memset(__tp, 170, 16);
          clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
          *(void *)(v9 + 72) = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
          if ((a3 & 2) != 0) {
            *(_DWORD *)(*(void *)(v7 + 144) + 24) |= 0x10000u;
          }
          cv_wakeup((pthread_cond_t *)(v7 + 256));
          uint64_t v3 = 0;
          int v44 = 1;
          goto LABEL_67;
        }
        if (*(_WORD *)(v7 + 80))
        {
LABEL_79:
          uint64_t v37 = **(void **)(*(void *)(v7 + 136) + 8);
          if (v37)
          {
            if (*(_DWORD *)(v37 + 24) & 0x30)
            {
              BOOL v39 = 0;
            }
            else
            {
              uint64_t v37 = *(void *)(v7 + 144);
              BOOL v39 = v9 == 0;
            }
            if (!v39)
            {
              uint64_t v9 = v37;
              goto LABEL_88;
            }
          }
          else if (v9)
          {
LABEL_88:
            unsigned int v40 = *(_DWORD *)(v9 + 52);
            if (v40) {
              uint64_t v3 = v40;
            }
            else {
              uint64_t v3 = 5;
            }
            goto LABEL_92;
          }
          uint64_t v3 = 5;
          goto LABEL_92;
        }
      }
      if ((*(_DWORD *)(v7 + 72) & 8) != 0) {
        int v16 = "nx_tx_wait_frozen";
      }
      else {
        int v16 = "nx_tx_wait";
      }
      if (v9) {
        goto LABEL_20;
      }
      uint64_t v15 = v16;
LABEL_36:
      cv_wait((pthread_cond_t *)(v7 + 256), (pthread_mutex_t *)v7, 8, (uint64_t)v15, 0);
      if (*(unsigned char *)(v7 + 72)) {
        goto LABEL_37;
      }
    }
  }
  uint64_t v8 = *(void *)(v11 + 16);
  *a2 = v8;
  if (!v8) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v9 = *(void *)(v7 + 144);
  if (v9 && v8 == *(void *)(v9 + 16))
  {
    int v10 = 0;
    ++*(_DWORD *)(v9 + 28);
    goto LABEL_94;
  }
  pthread_mutex_unlock((pthread_mutex_t *)v7);
  return 22;
}

__darwin_time_t tx_transition(uint64_t a1, int a2, int a3)
{
  if (a2)
  {
    int v4 = *(_DWORD *)(a1 + 24);
    if ((v4 & a2) == 0) {
      panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v4, a3, a2);
    }
  }
  if (a3)
  {
    int v5 = *(_DWORD *)(a1 + 24);
    if ((v5 & a3) != 0) {
      panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v5, a3, a2);
    }
  }
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a1 + 24) & ~a2 | a3;
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp);
  __darwin_time_t v6 = 1000000 * __tp.tv_sec + SLODWORD(__tp.tv_nsec) / 1000;
  __darwin_time_t result = v6 - *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v6;
  return result;
}

uint64_t tx_flush_initiate(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 400);
  for (int i = *(_DWORD *)(v2 + 72); (i & 0x10) != 0; int i = *(_DWORD *)(v2 + 72))
  {
    *(_DWORD *)(v2 + 72) = i | 0x20;
    cv_wait((pthread_cond_t *)(v2 + 256), (pthread_mutex_t *)v2, 8, (uint64_t)"nx_tx_flush_busy", 0);
  }
  *(_DWORD *)(v2 + 72) = i | 0x10;
  uint64_t v4 = **(void **)(*(void *)(v2 + 136) + 8);
  if (!v4 || (int v5 = *(_DWORD *)(v4 + 24), (v5 & 0x10) == 0))
  {
    uint64_t v4 = *(void *)(v2 + 144);
    if (!v4) {
      goto LABEL_9;
    }
    int v5 = *(_DWORD *)(v4 + 24);
  }
  if ((v5 & 0x14) == 0 || (uint64_t v6 = tx_flush(a1, v4), !v6))
  {
LABEL_9:
    uint64_t v7 = *(void *)(v2 + 144);
    if (v7 && (*(unsigned char *)(v7 + 24) & 4) != 0) {
      uint64_t v6 = tx_flush(a1, v7);
    }
    else {
      uint64_t v6 = 0;
    }
  }
  int v8 = *(_DWORD *)(v2 + 72);
  *(_DWORD *)(v2 + 72) = v8 & 0xFFFFFFCF;
  if ((v8 & 0x20) != 0) {
    cv_wakeup((pthread_cond_t *)(v2 + 256));
  }
  return v6;
}

uint64_t tx_enter(uint64_t a1, uint64_t *a2)
{
  return tx_enter_internal(a1, a2, 0);
}

uint64_t tx_enter_frozen(uint64_t a1, uint64_t *a2)
{
  return tx_enter_internal(a1, a2, 2);
}

uint64_t tx_leave(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 627))
  {
    uint64_t v7 = *(void *)(a1 + 400);
    pthread_mutex_lock((pthread_mutex_t *)v7);
    uint64_t v8 = *(void *)(v7 + 144);
    if ((*(unsigned char *)(v8 + 24) & 1) == 0) {
      goto LABEL_22;
    }
    if ((a3 & 4) != 0)
    {
      BOOL v9 = 0;
      ++*(void *)(v7 + 176);
    }
    else
    {
      if (*(_DWORD *)(v8 + 32) <= 0x186A0u && !obj_cache_tx_start_closing(*(void *)(a1 + 392)))
      {
        int started = spaceman_tx_start_closing((pthread_mutex_t **)a1);
        BOOL v9 = started == 0;
        BOOL v10 = started != 0;
LABEL_10:
        if ((*(unsigned char *)(v7 + 72) & 0x40) != 0)
        {
          if (!v9) {
            *(_DWORD *)(v8 + 24) |= 0x100000u;
          }
        }
        else
        {
          int v11 = *(_DWORD *)(v8 + 24);
          if ((v11 & 0x100000) != 0)
          {
            v11 &= ~0x100000u;
            *(_DWORD *)(v8 + 24) = v11;
          }
          else if (!v10)
          {
            goto LABEL_22;
          }
          if ((v11 & 1) == 0) {
            panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v11, 2, 1);
          }
          if ((v11 & 2) != 0) {
            panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v11, 2, 1);
          }
          *(_DWORD *)(v8 + 24) = v11 & 0xFFFFFFFC | 2;
          memset(__tp, 170, 16);
          clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
          *(void *)(v8 + 72) = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
        }
LABEL_22:
        if ((~a3 & 5) != 0)
        {
          if ((a3 & 0x10) != 0)
          {
LABEL_24:
            *(_DWORD *)(v8 + 24) |= 0x40000u;
            if ((a3 & 0x20) == 0) {
              goto LABEL_29;
            }
            goto LABEL_28;
          }
        }
        else
        {
          *(_DWORD *)(v8 + 24) |= 0x20000u;
          if ((a3 & 0x10) != 0) {
            goto LABEL_24;
          }
        }
        if ((a3 & 0x20) == 0)
        {
LABEL_29:
          int v12 = *(_DWORD *)(v8 + 28) - 1;
          *(_DWORD *)(v8 + 28) = v12;
          if (!v12 && (int v13 = *(_DWORD *)(v8 + 24), (v13 & 2) != 0))
          {
            if ((v13 & 4) != 0) {
              panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v13, 4, 2);
            }
            *(_DWORD *)(v8 + 24) = v13 & 0xFFFFFFF9 | 4;
            memset(__tp, 170, 16);
            clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
            uint64_t v16 = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
            unint64_t v17 = v16 - *(void *)(v8 + 72);
            *(void *)(v8 + 72) = v16;
            if (v17 > 0xF4240 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = *(void *)(a1 + 384) + 208;
              uint64_t v19 = *(void *)(v8 + 16);
              *(_DWORD *)timespec __tp = 136316162;
              *(void *)&__tp[4] = "tx_leave";
              *(_WORD *)&__tp[12] = 1024;
              *(_DWORD *)&__tp[14] = 2545;
              __int16 v22 = 2080;
              uint64_t v23 = v18;
              __int16 v24 = 2048;
              uint64_t v25 = v19;
              __int16 v26 = 2048;
              unint64_t v27 = v17;
              _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to close\n", __tp, 0x30u);
            }
            *(void *)(v7 + 248) = (*(void *)(v7 + 248) + v17) >> 1;
            uint64_t v3 = tx_flush_initiate(a1);
            if ((a3 & 1) == 0) {
              goto LABEL_41;
            }
          }
          else
          {
            uint64_t v3 = 0;
            if ((a3 & 1) == 0)
            {
LABEL_41:
              pthread_mutex_unlock((pthread_mutex_t *)v7);
              return v3;
            }
          }
          if ((a3 & 4) != 0) {
            int v14 = 127;
          }
          else {
            int v14 = 63;
          }
          do
          {
            if (*(void *)(v8 + 16) != a2 || (*(_DWORD *)(v8 + 24) & v14) == 0) {
              break;
            }
            if (!v3) {
              cv_wait((pthread_cond_t *)(v7 + 256), (pthread_mutex_t *)v7, 8, (uint64_t)"nx_tx_finish_wait", 0);
            }
          }
          while (!*(_DWORD *)(v7 + 76));
          uint64_t v3 = *(unsigned int *)(v8 + 52);
          goto LABEL_41;
        }
LABEL_28:
        *(_DWORD *)(v8 + 24) |= 0x80000u;
        goto LABEL_29;
      }
      BOOL v9 = 0;
    }
    BOOL v10 = 1;
    goto LABEL_10;
  }
  return 30;
}

uint64_t tx_is_closing(uint64_t a1)
{
  return (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 400) + 144) + 24) >> 1) & 1;
}

uint64_t tx_flush(uint64_t a1, uint64_t a2)
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 392);
  uint64_t v4 = *(void *)(a1 + 400);
  unint64_t v150 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = **(void **)(*(void *)(v4 + 136) + 8);
  if (v6 && (*(unsigned char *)(v6 + 24) & 0x10) != 0)
  {
    if (v6 != a2) {
      panic("not handling the flushing tx!\n");
    }
  }
  else
  {
    if (*(void *)(v4 + 144) != a2) {
      panic("not handling the current tx!\n");
    }
    if ((*(unsigned char *)(a2 + 24) & 0x14) == 0) {
      panic("current tx not closed/flushing?!\n");
    }
  }
  int v7 = *(_DWORD *)(a2 + 24);
  if ((v7 & 0x10) != 0)
  {
LABEL_49:
    if (*(unsigned char *)(a1 + 629))
    {
      int v29 = *(_DWORD *)(a2 + 24);
      if ((v29 & 0x10) == 0) {
        panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v29, 1, 16);
      }
      if (v29) {
        panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v29, 1, 16);
      }
      *(_DWORD *)(a2 + 24) = v29 & 0xFFFFFFEE | 1;
      memset(__tp, 170, 16);
      clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
      *(void *)(a2 + 72) = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
      *(_DWORD *)(a2 + 32) = 0;
      *(_DWORD *)(a2 + 52) = 0;
    }
    else if (*(void *)(v4 + 144) == a2)
    {
      *(void *)a2 = 0;
      uint64_t v30 = *(uint64_t **)(v4 + 136);
      *(void *)(a2 + 8) = v30;
      *uint64_t v30 = a2;
      *(void *)(v4 + 136) = a2;
      *(void *)(v4 + 144) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)v4);
    cv_wakeup((pthread_cond_t *)(v4 + 256));
    uint64_t v31 = obj_cache_flush_write((pthread_mutex_t *)v5, 2 * (*(unsigned char *)(a1 + 629) == 0));
    if (*(unsigned char *)(a1 + 629))
    {
      pthread_mutex_lock((pthread_mutex_t *)v4);
      obj_cache_flush_unprepare(v5);
      tx_barrier_internal(a1, 0, 0);
      cv_wakeup((pthread_cond_t *)(v4 + 256));
      uint64_t v14 = 0;
      *(_DWORD *)(a2 + 52) = 0;
      return v14;
    }
    uint64_t v14 = v31;
    if (v31)
    {
      pthread_mutex_lock((pthread_mutex_t *)v4);
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        tx_flush_cold_5();
      }
      int v34 = 1122;
      goto LABEL_81;
    }
    while (1)
    {
      uint64_t v36 = *(uint64_t **)(v5 + 848);
      if (!v36) {
        break;
      }
      uint64_t v35 = tx_checkpoint_write((void *)a1, a2, *(void *)(v5 + 848), v32, v33);
      if (v35)
      {
        uint64_t v14 = v35;
        pthread_mutex_lock((pthread_mutex_t *)v4);
        if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v126 = *(void *)(a1 + 384) + 208;
          uint64_t v127 = *(void *)(a2 + 16);
          uint64_t v128 = v36[16];
          *(_DWORD *)timespec __tp = 136316418;
          *(void *)&__tp[4] = "tx_flush";
          *(_WORD *)&__tp[12] = 1024;
          *(_DWORD *)&__tp[14] = 1136;
          __int16 v152 = 2080;
          uint64_t v153 = v126;
          __int16 v154 = 2048;
          uint64_t v155 = v127;
          __int16 v156 = 2048;
          *(void *)uint64_t v157 = v128;
          *(_WORD *)&v157[8] = 1024;
          *(_DWORD *)__int16 v158 = v14;
          _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld failed to write checkpoint data @ 0x%llx: %d\n", __tp, 0x36u);
        }
        int v34 = 1138;
        goto LABEL_81;
      }
      obj_checkpoint_done((uint64_t)v36);
      obj_release(v36);
    }
    uint64_t v37 = *(void *)(a2 + 64);
    *(_DWORD *)(v37 + 32) |= 1u;
    obj_checksum_set_phys(a1, v37, *(_DWORD *)(*(void *)(a1 + 376) + 36), v32, v33);
    uint64_t v38 = (uint64_t *)(a1 + 384);
    uint64_t v39 = dev_write(*(void *)(a1 + 384), *(void *)(*(void *)(a2 + 64) + 8));
    if (v39)
    {
      uint64_t v14 = v39;
      pthread_mutex_lock((pthread_mutex_t *)v4);
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v123 = *v38 + 208;
        uint64_t v124 = *(void *)(a2 + 16);
        uint64_t v125 = *(void *)(*(void *)(a2 + 64) + 8);
        *(_DWORD *)timespec __tp = 136316418;
        *(void *)&__tp[4] = "tx_flush";
        *(_WORD *)&__tp[12] = 1024;
        *(_DWORD *)&__tp[14] = 1155;
        __int16 v152 = 2080;
        uint64_t v153 = v123;
        __int16 v154 = 2048;
        uint64_t v155 = v124;
        __int16 v156 = 2048;
        *(void *)uint64_t v157 = v125;
        *(_WORD *)&v157[8] = 1024;
        *(_DWORD *)__int16 v158 = v14;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld failed to write last checkpoint map block %lld: %d\n", __tp, 0x36u);
      }
      int v34 = 1157;
LABEL_81:
      *(_DWORD *)(v4 + 76) = v34;
      ++*(_WORD *)(v4 + 80);
LABEL_82:
      __int16 v22 = (pthread_cond_t *)(v4 + 256);
      goto LABEL_83;
    }
    ++*(_DWORD *)(a2 + 40);
    pthread_mutex_lock((pthread_mutex_t *)v4);
    int v53 = *(_DWORD *)(a2 + 40);
    uint64_t v54 = *(_DWORD **)(a2 + 56);
    int v55 = *(_DWORD *)(a2 + 48);
    int v56 = v54[37];
    if (v53 != v54[35] || v55 != v56) {
      panic("flush phase checkpoint lengths (%d %d) don't match prepare phase (%d %d)\n", v53, v55, v54[35], v56);
    }
    unint64_t v58 = *(_DWORD **)(a1 + 376);
    v58[34] = v54[34];
    v58[35] = v53;
    v58[36] = v54[36];
    v58[37] = v55;
    int v59 = *(_DWORD *)(a2 + 24);
    if ((v59 & 0x10) == 0) {
      panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v59, 32, 16);
    }
    if ((v59 & 0x20) != 0) {
      panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v59, 32, 16);
    }
    *(_DWORD *)(a2 + 24) = v59 & 0xFFFFFFCF | 0x20;
    memset(__tp, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
    uint64_t v60 = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
    unint64_t v61 = v60 - *(void *)(a2 + 72);
    *(void *)(a2 + 72) = v60;
    if (v61 > 0xF4240 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v62 = *v38 + 208;
      uint64_t v63 = *(void *)(a2 + 16);
      *(_DWORD *)timespec __tp = 136316162;
      *(void *)&__tp[4] = "tx_flush";
      *(_WORD *)&__tp[12] = 1024;
      *(_DWORD *)&__tp[14] = 1184;
      __int16 v152 = 2080;
      uint64_t v153 = v62;
      __int16 v154 = 2048;
      uint64_t v155 = v63;
      __int16 v156 = 2048;
      *(void *)uint64_t v157 = v61;
      _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to flush\n", __tp, 0x30u);
    }
    *(void *)(a2 + 104) = v61;
    cv_wakeup((pthread_cond_t *)(v4 + 256));
    uint64_t v64 = tx_barrier_internal(a1, 0, 1);
    if (v64)
    {
      uint64_t v14 = v64;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        tx_flush_cold_4();
      }
      int v65 = 1195;
      goto LABEL_125;
    }
    pthread_mutex_unlock((pthread_mutex_t *)v4);
    if (*(unsigned char *)(a1 + 632))
    {
      *(_DWORD *)(a2 + 24) |= 0x80000u;
      bzero(*(void **)(a2 + 64), *(unsigned int *)(*(void *)(a1 + 376) + 36));
    }
    uint64_t v66 = dev_write(*v38, *(void *)(a2 + 112));
    if (v66)
    {
      uint64_t v14 = v66;
      pthread_mutex_lock((pthread_mutex_t *)v4);
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v130 = *v38 + 208;
        uint64_t v131 = *(void *)(a2 + 16);
        uint64_t v132 = *(void *)(a2 + 112);
        *(_DWORD *)timespec __tp = 136316418;
        *(void *)&__tp[4] = "tx_flush";
        *(_WORD *)&__tp[12] = 1024;
        *(_DWORD *)&__tp[14] = 1222;
        __int16 v152 = 2080;
        uint64_t v153 = v130;
        __int16 v154 = 2048;
        uint64_t v155 = v131;
        __int16 v156 = 2048;
        *(void *)uint64_t v157 = v132;
        *(_WORD *)&v157[8] = 1024;
        *(_DWORD *)__int16 v158 = v14;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld failed to write checkpoint superblock %lld: %d\n", __tp, 0x36u);
      }
      int v65 = 1224;
      goto LABEL_125;
    }
    if ((*(unsigned char *)(a2 + 26) & 8) == 0)
    {
LABEL_128:
      pthread_mutex_lock((pthread_mutex_t *)v4);
      unint64_t v69 = tx_transition(a2, 32, 64);
      if (v69 > 0xF4240 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v70 = *v38 + 208;
        uint64_t v71 = *(void *)(a2 + 16);
        *(_DWORD *)timespec __tp = 136316162;
        *(void *)&__tp[4] = "tx_flush";
        *(_WORD *)&__tp[12] = 1024;
        *(_DWORD *)&__tp[14] = 1285;
        __int16 v152 = 2080;
        uint64_t v153 = v70;
        __int16 v154 = 2048;
        uint64_t v155 = v71;
        __int16 v156 = 2048;
        *(void *)uint64_t v157 = v69;
        _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to sync and write superblock\n", __tp, 0x30u);
      }
      *(void *)(a2 + 104) += v69;
      unsigned int v72 = *(_DWORD *)(a2 + 24);
      if ((v72 & 0x20000) == 0) {
        goto LABEL_168;
      }
      ++*(void *)(v4 + 184);
      if ((v72 & 0x40000) != 0) {
        ++*(void *)(v4 + 192);
      }
      uint64_t v73 = tx_barrier_internal(a1, (v72 >> 14) & 0x10, 0);
      if (!v73)
      {
LABEL_168:
        *(_DWORD *)(a2 + 52) = 0;
        *(_DWORD *)(v4 + 72) |= 2u;
        *(void *)(v4 + 76) = 0;
        uint64_t v98 = *(void *)(a2 + 56);
        int v99 = *(_DWORD *)(v98 + 128);
        uint64_t v100 = *(void *)(a1 + 376);
        *(_DWORD *)(v100 + 128) = v99;
        *(_DWORD *)(v4 + 96) = v99;
        int v101 = *(_DWORD *)(v98 + 132);
        *(_DWORD *)(v100 + 132) = v101;
        *(_DWORD *)(v4 + 100) = v101;
        *(void *)(v100 + 16) = *(void *)(v98 + 16);
        uint64_t v102 = *(void *)(v4 + 152);
        *(void *)(v4 + 152) = v102 + 1;
        if (v102)
        {
          v103.i64[0] = *(unsigned int *)(a2 + 32);
          v103.i64[1] = *(void *)(a2 + 80);
          *(uint64x2_t *)(v4 + 200) = vshrq_n_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(v4 + 200), v103), 1uLL);
          *(uint64x2_t *)(v4 + 216) = vshrq_n_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(a2 + 88), *(int64x2_t *)(v4 + 216)), 1uLL);
          *(void *)(v4 + 240) = (*(void *)(a2 + 104) + *(void *)(v4 + 240)) >> 1;
          if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * (v102 + 1), 2) <= 0xCCCCCCCCCCCCCCCuLL
            && nx_ratelimit_log_allowed(a1)
            && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v104 = *v38 + 208;
            uint64_t v105 = *(void *)(a2 + 16);
            uint64_t v106 = *(void *)(v4 + 152);
            unint64_t v107 = *(void *)(v4 + 160);
            if (v107 <= 1) {
              unint64_t v108 = 1;
            }
            else {
              unint64_t v108 = *(void *)(v4 + 160);
            }
            unint64_t v109 = *(void *)(v4 + 168);
            uint64_t v110 = *(void *)(v4 + 176);
            uint64_t v111 = *(void *)(v4 + 184);
            uint64_t v112 = *(void *)(v4 + 192);
            uint64_t v113 = *(void *)(v4 + 216);
            uint64_t v114 = *(void *)(v4 + 224);
            uint64_t v115 = *(void *)(v4 + 200);
            uint64_t v116 = *(void *)(v4 + 208);
            uint64_t v118 = *(void *)(v4 + 240);
            uint64_t v117 = *(void *)(v4 + 248);
            *(void *)&__tp[4] = "tx_flush";
            *(_WORD *)&__tp[12] = 1024;
            *(_DWORD *)&__tp[14] = 1349;
            __int16 v152 = 2080;
            uint64_t v119 = *(void *)(v4 + 232);
            *(_DWORD *)timespec __tp = 136319234;
            uint64_t v153 = v104;
            __int16 v154 = 2048;
            uint64_t v155 = v105;
            __int16 v156 = 2048;
            *(void *)uint64_t v157 = v106;
            *(_WORD *)&v157[8] = 2048;
            *(void *)__int16 v158 = v107;
            *(_WORD *)&v158[8] = 2048;
            unint64_t v159 = v109 / v108;
            __int16 v160 = 2048;
            uint64_t v161 = v110;
            __int16 v162 = 2048;
            uint64_t v163 = v111;
            __int16 v164 = 2048;
            uint64_t v165 = v112;
            __int16 v166 = 2048;
            uint64_t v167 = v115;
            __int16 v168 = 2048;
            uint64_t v169 = v113;
            __int16 v170 = 2048;
            uint64_t v171 = v114;
            __int16 v172 = 2048;
            uint64_t v173 = v116;
            __int16 v174 = 2048;
            uint64_t v175 = v117;
            __int16 v176 = 2048;
            uint64_t v177 = v119;
            __int16 v178 = 2048;
            uint64_t v179 = v118;
            _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s xid %llu tx stats: # %llu owait %llu %lluus finish %llu bar2 %lld f %lld enter %llu fq %llu %llu %lluus close %lluus prep %lluus flush %lluus\n", __tp, 0xA8u);
          }
        }
        else
        {
          *(void *)(v4 + 200) = *(unsigned int *)(a2 + 32);
          *(_OWORD *)(v4 + 208) = *(_OWORD *)(a2 + 80);
          *(void *)(v4 + 224) = *(void *)(a2 + 96);
          *(void *)(v4 + 240) = *(void *)(a2 + 104);
        }
        cv_wakeup((pthread_cond_t *)(v4 + 256));
        return 0;
      }
      uint64_t v14 = v73;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        tx_flush_cold_1();
      }
      *(_DWORD *)(v4 + 76) = 1299;
      ++*(_WORD *)(v4 + 80);
      --*(_DWORD *)(a2 + 40);
      uint64_t v67 = a2;
      int v68 = 64;
LABEL_126:
      *(void *)(a2 + 104) += tx_transition(v67, v68, 16);
      goto LABEL_82;
    }
    uint64_t v97 = dev_write(*v38, 0);
    if (v97)
    {
      uint64_t v14 = v97;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        tx_flush_cold_3();
      }
    }
    else
    {
      if ((*(unsigned char *)(*(void *)(a1 + 376) + 65) & 1) == 0) {
        goto LABEL_128;
      }
      uint64_t v129 = nx_fusion_superblock_write(a1, *(const void **)(a2 + 56));
      if (!v129) {
        goto LABEL_128;
      }
      uint64_t v14 = v129;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        tx_flush_cold_2();
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)v4);
    int v65 = 1259;
LABEL_125:
    *(_DWORD *)(v4 + 76) = v65;
    ++*(_WORD *)(v4 + 80);
    --*(_DWORD *)(a2 + 40);
    uint64_t v67 = a2;
    int v68 = 32;
    goto LABEL_126;
  }
  if ((v7 & 4) == 0) {
    panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v7, 8, 4);
  }
  if ((v7 & 8) != 0) {
    panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v7, 8, 4);
  }
  *(_DWORD *)(a2 + 24) = v7 & 0xFFFFFFF3 | 8;
  memset(__tp, 170, 16);
  clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
  uint64_t v8 = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
  unint64_t v9 = v8 - *(void *)(a2 + 72);
  *(void *)(a2 + 72) = v8;
  if (v9 > 0xF4240 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 384) + 208;
    uint64_t v11 = *(void *)(a2 + 16);
    *(_DWORD *)timespec __tp = 136316162;
    *(void *)&__tp[4] = "tx_flush";
    *(_WORD *)&__tp[12] = 1024;
    *(_DWORD *)&__tp[14] = 853;
    __int16 v152 = 2080;
    uint64_t v153 = v10;
    __int16 v154 = 2048;
    uint64_t v155 = v11;
    __int16 v156 = 2048;
    *(void *)uint64_t v157 = v9;
    _os_log_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld was closed for %lld us waiting to prepare to flush\n", __tp, 0x30u);
  }
  int v12 = (uint64_t *)(a2 + 16);
  uint64_t v13 = obj_cache_flush_prepare(v5, 0, 2 * (*(unsigned char *)(a1 + 629) == 0), *(void *)(a2 + 16));
  if (v13)
  {
    uint64_t v14 = v13;
    if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      tx_flush_cold_6();
    }
    int v15 = 861;
    goto LABEL_22;
  }
  if (*(unsigned char *)(a1 + 629))
  {
    int v23 = *(_DWORD *)(a2 + 24);
    if ((v23 & 8) == 0) {
      panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v23, 16, 8);
    }
    if ((v23 & 0x10) != 0) {
      panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v23, 16, 8);
    }
    *(_DWORD *)(a2 + 24) = v23 & 0xFFFFFFE7 | 0x10;
    memset(__tp, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
    uint64_t v24 = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
    unint64_t v25 = v24 - *(void *)(a2 + 72);
    *(void *)(a2 + 72) = v24;
    if (v25 <= 0xF4240 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_48;
    }
    uint64_t v26 = *(void *)(a1 + 384) + 208;
    uint64_t v27 = *v12;
    *(_DWORD *)timespec __tp = 136316162;
    *(void *)&__tp[4] = "tx_flush";
    *(_WORD *)&__tp[12] = 1024;
    *(_DWORD *)&__tp[14] = 871;
    __int16 v152 = 2080;
    uint64_t v153 = v26;
    __int16 v154 = 2048;
    uint64_t v155 = v27;
    __int16 v156 = 2048;
    *(void *)uint64_t v157 = v25;
    uint64_t v28 = &_os_log_internal;
LABEL_47:
    _os_log_impl(&dword_22CAAC000, v28, OS_LOG_TYPE_DEFAULT, "%s:%d: %s tx xid %lld took %lld us to prepare to flush\n", __tp, 0x30u);
LABEL_48:
    *(void *)(v4 + 232) = (*(void *)(v4 + 232) + v25) >> 1;
    goto LABEL_49;
  }
  *(_DWORD *)(a2 + 36) = *(_DWORD *)(v4 + 96);
  *(_DWORD *)(a2 + 44) = *(_DWORD *)(v4 + 100);
  *(_DWORD *)(a2 + 48) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  unint64_t v150 = -1;
  uint64_t v40 = nx_checkpoint_desc_block_address(a1, *(unsigned int *)(*(void *)(a1 + 376) + 128), &v150);
  if (v40)
  {
    uint64_t v14 = v40;
    if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v120 = *(void *)(a1 + 384) + 208;
      uint64_t v121 = *v12;
      int v122 = *(_DWORD *)(*(void *)(a1 + 376) + 128);
      *(_DWORD *)timespec __tp = 136316418;
      *(void *)&__tp[4] = "tx_flush";
      *(_WORD *)&__tp[12] = 1024;
      *(_DWORD *)&__tp[14] = 891;
      __int16 v152 = 2080;
      uint64_t v153 = v120;
      __int16 v154 = 2048;
      uint64_t v155 = v121;
      __int16 v156 = 1024;
      *(_DWORD *)uint64_t v157 = v122;
      *(_WORD *)&v157[4] = 1024;
      *(_DWORD *)&v157[6] = v14;
      _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld error getting first checkpoint map block address %d: %d\n", __tp, 0x32u);
    }
    int v15 = 893;
    goto LABEL_22;
  }
  bzero(*(void **)(a2 + 64), *(unsigned int *)(*(void *)(a1 + 376) + 36));
  uint64_t v42 = *(void *)(a2 + 64);
  *(_DWORD *)(v42 + 24) = 1073741836;
  *(void *)(v42 + 8) = v150;
  *(void *)(v42 + 16) = *(void *)(a2 + 16);
  ++*(_DWORD *)(a2 + 40);
  uint64_t v14 = nx_checkpoint_traverse(a1, a2, 1);
  if (v14) {
    goto LABEL_23;
  }
  uint64_t v43 = *(void *)(v5 + 736);
  if (!v43)
  {
LABEL_96:
    int v50 = *(_DWORD *)(v4 + 96);
    *(void *)(a2 + 112) = -1;
    unsigned int v51 = (*(_DWORD *)(a2 + 40) + v50) % *(_DWORD *)(v4 + 88);
    uint64_t v52 = nx_checkpoint_desc_block_address(a1, v51, (void *)(a2 + 112));
    if (v52)
    {
      uint64_t v14 = v52;
      if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v133 = *(void *)(a1 + 384) + 208;
        uint64_t v134 = *v12;
        *(_DWORD *)timespec __tp = 136316418;
        *(void *)&__tp[4] = "tx_flush";
        *(_WORD *)&__tp[12] = 1024;
        *(_DWORD *)&__tp[14] = 940;
        __int16 v152 = 2080;
        uint64_t v153 = v133;
        __int16 v154 = 2048;
        uint64_t v155 = v134;
        __int16 v156 = 1024;
        *(_DWORD *)uint64_t v157 = v51;
        *(_WORD *)&v157[4] = 1024;
        *(_DWORD *)&v157[6] = v14;
        _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld error getting next checkpoint superblock address %d: %d\n", __tp, 0x32u);
      }
      int v15 = 942;
      goto LABEL_22;
    }
    ++*(_DWORD *)(a2 + 40);
    int v74 = *(_DWORD *)(a2 + 48);
    int v75 = *(_DWORD *)(v5 + 900) - 1;
    if (v74 != v75 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v135 = *(void *)(a1 + 384) + 208;
      uint64_t v136 = *v12;
      *(_DWORD *)timespec __tp = 136316418;
      *(void *)&__tp[4] = "tx_flush";
      *(_WORD *)&__tp[12] = 1024;
      *(_DWORD *)&__tp[14] = 992;
      __int16 v152 = 2080;
      uint64_t v153 = v135;
      __int16 v154 = 2048;
      uint64_t v155 = v136;
      __int16 v156 = 1024;
      *(_DWORD *)uint64_t v157 = v74;
      *(_WORD *)&v157[4] = 1024;
      *(_DWORD *)&v157[6] = v75;
      _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld checkpoint data block count is not value tracked by cache: %d != %d\n", __tp, 0x32u);
    }
    uint64_t v76 = *(void *)(a1 + 376);
    *(void *)(v76 + 88) = *(void *)(v5 + 400);
    *(void *)(v76 + 96) = *(void *)(v4 + 64);
    memcpy(*(void **)(a2 + 56), (const void *)v76, *(unsigned int *)(v76 + 36));
    uint64_t v79 = *(void *)(a2 + 16);
    uint64_t v80 = *(void *)(a2 + 56);
    *(void *)(v80 + 16) = v79;
    int v81 = *(_DWORD *)(v4 + 96);
    *(_DWORD *)(v80 + 136) = v81;
    int v82 = *(_DWORD *)(v4 + 100);
    *(_DWORD *)(v80 + 144) = v82;
    unsigned int v83 = *(_DWORD *)(a2 + 40);
    *(_DWORD *)(v80 + 140) = v83;
    unsigned int v84 = *(_DWORD *)(a2 + 48);
    *(_DWORD *)(v80 + 148) = v84;
    unsigned int v86 = *(_DWORD *)(v4 + 88);
    unsigned int v85 = *(_DWORD *)(v4 + 92);
    unsigned int v87 = (v83 + v81) % v86;
    unsigned int v88 = (v84 + v82) % v85;
    if (!*(_DWORD *)(v4 + 76))
    {
      unsigned int v148 = (v84 + v82) % v85;
      unsigned int v149 = v87;
      if (v83 > v86 >> 2)
      {
        uint64_t v147 = v79;
        BOOL v89 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        unsigned int v88 = v148;
        unsigned int v87 = v149;
        if (v89)
        {
          uint64_t v142 = *(void *)(a1 + 384) + 208;
          *(_DWORD *)timespec __tp = 136316418;
          *(void *)&__tp[4] = "tx_flush";
          *(_WORD *)&__tp[12] = 1024;
          *(_DWORD *)&__tp[14] = 1017;
          __int16 v152 = 2080;
          uint64_t v153 = v142;
          __int16 v154 = 2048;
          uint64_t v155 = v147;
          __int16 v156 = 1024;
          *(_DWORD *)uint64_t v157 = v83;
          *(_WORD *)&v157[4] = 1024;
          *(_DWORD *)&v157[6] = v86 >> 2;
          _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld checkpoint descriptor count is larger than expected: %d > %d\n", __tp, 0x32u);
          unsigned int v88 = v148;
          unsigned int v87 = v149;
          unsigned int v84 = *(_DWORD *)(a2 + 48);
          unsigned int v85 = *(_DWORD *)(v4 + 92);
        }
      }
      if (v84 > v85 >> 2)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v143 = *(void *)(a1 + 384) + 208;
          uint64_t v144 = *(void *)(a2 + 16);
          *(_DWORD *)timespec __tp = 136316418;
          *(void *)&__tp[4] = "tx_flush";
          *(_WORD *)&__tp[12] = 1024;
          *(_DWORD *)&__tp[14] = 1021;
          __int16 v152 = 2080;
          uint64_t v153 = v143;
          __int16 v154 = 2048;
          uint64_t v155 = v144;
          __int16 v156 = 1024;
          *(_DWORD *)uint64_t v157 = v84;
          *(_WORD *)&v157[4] = 1024;
          *(_DWORD *)&v157[6] = v85 >> 2;
          _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld checkpoint data block count is larger than expected: %d > %d\n", __tp, 0x32u);
          unsigned int v84 = *(_DWORD *)(a2 + 48);
        }
        unsigned int v88 = v148;
        unsigned int v87 = v149;
      }
      int v90 = *(_DWORD *)(v5 + 900) - 1;
      if (v84 != v90)
      {
        BOOL v91 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        unsigned int v88 = v148;
        unsigned int v87 = v149;
        if (v91)
        {
          uint64_t v145 = *(void *)(a1 + 384) + 208;
          uint64_t v146 = *v12;
          *(_DWORD *)timespec __tp = 136316418;
          *(void *)&__tp[4] = "tx_flush";
          *(_WORD *)&__tp[12] = 1024;
          *(_DWORD *)&__tp[14] = 1025;
          __int16 v152 = 2080;
          uint64_t v153 = v145;
          __int16 v154 = 2048;
          uint64_t v155 = v146;
          __int16 v156 = 1024;
          *(_DWORD *)uint64_t v157 = v84;
          *(_WORD *)&v157[4] = 1024;
          *(_DWORD *)&v157[6] = v90;
          _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld checkpoint data block count is not value tracked by cache: %d != %d\n", __tp, 0x32u);
          unsigned int v88 = v148;
          unsigned int v87 = v149;
        }
      }
    }
    uint64_t v92 = *(void *)(a2 + 56);
    *(_DWORD *)(v92 + 128) = v87;
    *(_DWORD *)(v92 + 132) = v88;
    obj_checksum_set_phys(a1, v92, *(_DWORD *)(*(void *)(a1 + 376) + 36), v77, v78);
    *(_DWORD *)(a2 + 48) = 0;
    *(_DWORD *)(a2 + 40) = 1;
    *(_DWORD *)(*(void *)(a2 + 64) + 36) = 0;
    int v93 = *(_DWORD *)(a2 + 24);
    if ((v93 & 8) == 0) {
      panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v93, 16, 8);
    }
    if ((v93 & 0x10) != 0) {
      panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v93, 16, 8);
    }
    *(_DWORD *)(a2 + 24) = v93 & 0xFFFFFFE7 | 0x10;
    memset(__tp, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
    uint64_t v94 = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
    unint64_t v25 = v94 - *(void *)(a2 + 72);
    *(void *)(a2 + 72) = v94;
    if (v25 <= 0xF4240 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_48;
    }
    uint64_t v95 = *(void *)(a1 + 384) + 208;
    uint64_t v96 = *v12;
    *(_DWORD *)timespec __tp = 136316162;
    *(void *)&__tp[4] = "tx_flush";
    *(_WORD *)&__tp[12] = 1024;
    *(_DWORD *)&__tp[14] = 1048;
    __int16 v152 = 2080;
    uint64_t v153 = v95;
    __int16 v154 = 2048;
    uint64_t v155 = v96;
    __int16 v156 = 2048;
    *(void *)uint64_t v157 = v25;
    uint64_t v28 = &_os_log_internal;
    goto LABEL_47;
  }
  int v44 = &_os_log_internal;
  while (v43 == a1)
  {
LABEL_95:
    uint64_t v43 = *(void *)(v43 + 88);
    if (!v43) {
      goto LABEL_96;
    }
  }
  uint64_t v45 = tx_checkpoint_write_prepare(a1, a2, v43);
  if (!v45)
  {
    obj_retain_ephemeral_no_ref(v43);
    if ((*(unsigned char *)(v43 + 32) & 4) == 0
      && (*(unsigned char *)(v43 + 20) & 0x20) == 0
      && os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = *(void *)(a1 + 384) + 208;
      uint64_t v47 = *(void *)(v43 + 112);
      int v48 = *(_DWORD *)(v43 + 36);
      int v49 = *(_DWORD *)(v43 + 40);
      *(_DWORD *)timespec __tp = 136316418;
      *(void *)&__tp[4] = "tx_flush";
      *(_WORD *)&__tp[12] = 1024;
      *(_DWORD *)&__tp[14] = 928;
      __int16 v152 = 2080;
      uint64_t v153 = v46;
      __int16 v154 = 2048;
      uint64_t v155 = v47;
      __int16 v156 = 1024;
      *(_DWORD *)uint64_t v157 = v48;
      *(_WORD *)&v157[4] = 1024;
      *(_DWORD *)&v157[6] = v49;
      _os_log_impl(&dword_22CAAC000, v44, OS_LOG_TYPE_DEFAULT, "%s:%d: %s Unknown NEW persistent ephemeral object found: oid 0x%llx type 0x%x/0x%x\n", __tp, 0x32u);
    }
    *(void *)(v43 + 64) = *(void *)(v43 + 56);
    *(void *)(v43 + 104) = 0;
    **(void **)(v5 + 856) = v43;
    *(void *)(v5 + 856) = v43 + 104;
    goto LABEL_95;
  }
  uint64_t v14 = v45;
  if (!*(_DWORD *)(v4 + 76) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v137 = *(void *)(a1 + 384) + 208;
    uint64_t v138 = *v12;
    uint64_t v139 = *(void *)(v43 + 112);
    int v140 = *(_DWORD *)(v43 + 36);
    int v141 = *(_DWORD *)(v43 + 40);
    *(_DWORD *)timespec __tp = 136316930;
    *(void *)&__tp[4] = "tx_flush";
    *(_WORD *)&__tp[12] = 1024;
    *(_DWORD *)&__tp[14] = 919;
    __int16 v152 = 2080;
    uint64_t v153 = v137;
    __int16 v154 = 2048;
    uint64_t v155 = v138;
    __int16 v156 = 2048;
    *(void *)uint64_t v157 = v139;
    *(_WORD *)&v157[8] = 1024;
    *(_DWORD *)__int16 v158 = v140;
    *(_WORD *)&v158[4] = 1024;
    *(_DWORD *)&v158[6] = v141;
    LOWORD(v159) = 1024;
    *(_DWORD *)((char *)&v159 + 2) = v14;
    _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s xid %lld error preparing ephemeral object (oid 0x%llx type 0x%x/0x%x): %d\n", __tp, 0x42u);
  }
  int v15 = 921;
LABEL_22:
  *(_DWORD *)(v4 + 76) = v15;
  ++*(_WORD *)(v4 + 80);
LABEL_23:
  obj_cache_flush_unprepare(v5);
  uint64_t v16 = *(uint64_t **)(v5 + 848);
  if (v16)
  {
    unint64_t v17 = (uint64_t **)(v5 + 848);
    do
    {
      uint64_t v18 = v16[13];
      void *v17 = (uint64_t *)v18;
      if (!v18) {
        *(void *)(v5 + 856) = v17;
      }
      v16[13] = 3735928559;
      v16[8] = 0;
      obj_checkpoint_done((uint64_t)v16);
      obj_release(v16);
      uint64_t v16 = *v17;
    }
    while (*v17);
  }
  for (uint64_t i = *(void *)(v5 + 736); i; uint64_t i = *(void *)(i + 88))
  {
    if ((*(unsigned char *)(i + 32) & 4) != 0) {
      obj_checkpoint_done(i);
    }
  }
  int v20 = *(_DWORD *)(v4 + 72);
  if ((v20 & 0x40) != 0) {
    *(_DWORD *)(v4 + 72) = v20 & 0xFFFFFFBF;
  }
  int v21 = *(_DWORD *)(a2 + 24);
  if ((v21 & 8) == 0) {
    panic("can't transition from tx flags 0x%x to 0x%x (expected 0x%x)\n", v21, 1, 8);
  }
  if (v21) {
    panic("bad transition tx flags 0x%x to 0x%x (expected 0x%x)\n", v21, 1, 8);
  }
  *(_DWORD *)(a2 + 24) = v21 & 0xFFFFFFF6 | 1;
  memset(__tp, 170, 16);
  clock_gettime(_CLOCK_UPTIME_RAW_APPROX, (timespec *)__tp);
  *(void *)(a2 + 72) = 1000000 * *(void *)__tp + *(_DWORD *)&__tp[8] / 1000;
  __int16 v22 = (pthread_cond_t *)(v4 + 256);
LABEL_83:
  cv_wakeup(v22);
  *(_DWORD *)(a2 + 52) = v14;
  return v14;
}

void OUTLINED_FUNCTION_5_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t fv_get_effective_info_size()
{
  return 8;
}

uint64_t fv_kek_global_policy_eval(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 120);
  if ((v1 & 0x20) == 0)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 8) == 0xAA11000064C0C6EBLL && *(void *)(result + 16) == 0xACEC4365300011AALL)
    {
      __darwin_time_t result = fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s personal recovery key%s\n", "aks", "", "", "", "fv_kek_global_policy_eval");
    }
    else if (*(void *)(result + 8) == 0xD64E18B6D92A1CECLL && *(void *)(result + 16) == 0x775C261F3508DBDLL)
    {
      __darwin_time_t result = fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s icloud recovery key%s\n", "aks", "", "", "", "fv_kek_global_policy_eval");
    }
    else
    {
      if (*(void *)(result + 8) != 0xE74DFFBA0014A32FLL || *(void *)(result + 16) != 0x40D31F6EAAC32AAELL) {
        goto LABEL_19;
      }
      __darwin_time_t result = fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s institutional recovery key%s\n", "aks", "", "", "", "fv_kek_global_policy_eval");
    }
    int v1 = *(_DWORD *)(v2 + 120) | 0x10;
LABEL_19:
    *(_DWORD *)(v2 + 120) = v1 | 0x20;
  }
  return result;
}

uint64_t fv_encode_vek_blob(uint64_t *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  memset(v7, 0, sizeof(v7));
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  if (*(unsigned char *)(a2 + 37)) {
    platform_read_random((uint64_t)&v8 + 8, 8u);
  }
  else {
    *((void *)&v8 + 1) = *(void *)a2;
  }
  if (*(void *)(a2 + 8) || *(unsigned char *)(a2 + 37))
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s error %d%s\n", "aks", "", "", "", "fv_encode_vek_blob", ":", 765, "", 0, "", -12, "");
    return 0;
  }
  else
  {
    uint64_t result = MEMORY[0x230F731A0](a1, 0x8000000000000003, 40, a2 + 56);
    if (result)
    {
      uint64_t result = MEMORY[0x230F731A0](a1, 0x8000000000000002, 8, a2 + 32);
      if (result)
      {
        uint64_t result = MEMORY[0x230F731A0](a1, 0x8000000000000001, 16, a2 + 16);
        if (result)
        {
          uint64_t result = ccder_blob_encode_implicit_uint64();
          if (result)
          {
            uint64_t result = ccder_blob_encode_tl();
            if (result)
            {
              uint64_t result = _encode_blob_header((uint64_t)a1, v7, *(_DWORD *)(a2 + 32), v5 + a1[1] - *a1, v4 - a1[1]);
              if (result) {
                return ccder_blob_encode_tl();
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _encode_blob_header(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  if (*a2) {
    return 0;
  }
  a2[1] = a4;
  a2[2] = a5;
  if (!_blob_digest(a2, a3)
    || !MEMORY[0x230F731A0](a1, 0x8000000000000002, 8, a2 + 7)
    || !MEMORY[0x230F731A0](a1, 0x8000000000000001, 32, a2 + 3))
  {
    return 0;
  }

  return ccder_blob_encode_implicit_uint64();
}

uint64_t fv_decode_info(uint64_t a1, uint64_t a2, int *a3, _OWORD *a4, void *a5, _OWORD *a6, void *a7, int a8)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  *(void *)&long long v22 = a1;
  *((void *)&v22 + 1) = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  if (a1 == a2) {
    return 4294967277;
  }
  uint64_t v21 = 0;
  long long v25 = 0uLL;
  if (!ccder_blob_decode_range()) {
    return 4294967277;
  }
  if (der_utils_decode_implicit_uint64(&v22, 0x8000000000000000, &v26))
  {
    if ((void)v26) {
      return 4294967277;
    }
  }
  else
  {
    *(void *)&long long v26 = 0;
  }
  if (!der_utils_decode_implicit_raw_octet_string_copy(&v22, 0x8000000000000001, (uint64_t)&v27 + 8, 32)) {
    return 4294967277;
  }
  if (!der_utils_decode_implicit_raw_octet_string_copy(&v22, 0x8000000000000002, (uint64_t)&v29 + 8, 8)) {
    return 4294967277;
  }
  uint64_t v14 = v22;
  __src[0] = 0;
  unint64_t v24 = 0;
  if (!ccder_blob_decode_tag()) {
    return 4294967277;
  }
  if (!ccder_blob_decode_len()) {
    return 4294967277;
  }
  if ((v24 & 0xFFFFFFFFFFFFFFEFLL) != 0xA000000000000003) {
    return 4294967277;
  }
  *((void *)&v26 + 1) = v14;
  *(void *)&long long v27 = (char *)__src[0] + v22 - v14;
  if (!der_utils_decode_implicit_uint64(&v22, 0x8000000000000000, &v21)) {
    return 4294967277;
  }
  if (!der_utils_decode_implicit_raw_octet_string_copy(&v22, 0x8000000000000001, (uint64_t)&v25, 16)) {
    return 4294967277;
  }
  unint64_t v24 = 0;
  *(_OWORD *)uint64_t __src = v22;
  if (!ccder_blob_decode_tl()) {
    return 4294967277;
  }
  unint64_t v15 = v24;
  if (v24 > 4)
  {
    uint64_t v16 = (char *)__src[0];
    if (v24 >= 0x16) {
      size_t v17 = 22;
    }
    else {
      size_t v17 = v24;
    }
    memcpy(a3, __src[0], v17);
    *(void *)&long long v22 = &v16[v15];
  }
  else
  {
    uint64_t v23 = 0;
    if (der_utils_decode_implicit_uint64(&v22, 0x8000000000000002, &v23)) {
      *a3 = v23;
    }
  }
  int v18 = *a3;
  *(_OWORD *)uint64_t __src = 0u;
  long long v31 = 0u;
  if ((void)v26)
  {
    uint64_t result = 4294967284;
  }
  else
  {
    int v20 = _blob_digest(&v26, v18);
    uint64_t result = 4294967290;
    if (v20)
    {
      if ((uint64_t)__src[0] ^ *((void *)&v27 + 1) | (unint64_t)__src[1] ^ (unint64_t)v28 | (unint64_t)v31 ^ *((void *)&v28 + 1) | *((void *)&v31 + 1) ^ (unint64_t)v29) {
        uint64_t result = 4294967290;
      }
      else {
        uint64_t result = 0;
      }
    }
  }
  if (((result == -6) & ~a8) != 0 || !result)
  {
    if (a5) {
      *a5 = v21;
    }
    if (a6) {
      *a6 = v25;
    }
    if (a4) {
      *a4 = v22;
    }
    if (a7)
    {
      if ((void)v26)
      {
        return 4294967284;
      }
      else
      {
        uint64_t result = 0;
        *a7 = *((void *)&v29 + 1);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t fv_decode_vek_blob_opts(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  long long v8 = 0uLL;
  if (a1 == a2) {
    return 4294967277;
  }
  uint64_t v5 = (unsigned char *)(a3 + 32);
  uint64_t v6 = (void *)(a3 + 8);
  uint64_t result = fv_decode_info(a1, a2, (int *)(a3 + 32), &v8, (void *)(a3 + 8), (_OWORD *)(a3 + 16), (void *)a3, a4);
  if (result) {
    return result;
  }
  if (*(unsigned char *)(a3 + 36))
  {
    if (*(unsigned char *)(a3 + 36) == 1) {
      goto LABEL_7;
    }
    return 4294967277;
  }
  if ((*v5 & 4) != 0) {
    return 4294967277;
  }
  *(unsigned char *)(a3 + 36) = 1;
LABEL_7:
  if (*v6 || *(unsigned char *)(a3 + 37)) {
    return 4294967284;
  }
  if (der_utils_decode_implicit_raw_octet_string_copy(&v8, 0x8000000000000003, a3 + 56, 40)) {
    return 0;
  }
  return 4294967277;
}

uint64_t fv_decode_vek_blob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return fv_decode_vek_blob_opts(a1, a2, a3, 1);
}

uint64_t fv_encode_kek_blob(uint64_t *a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  v11[0] = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = 0;
  platform_read_random((uint64_t)v11, 8u);
  if (*(void *)a2) {
    return 0;
  }
  if ((*(unsigned char *)(a2 + 24) & 0x80) == 0 || (uint64_t result = ccder_blob_encode_implicit_uint64(), result))
  {
    if (*(unsigned char *)(a2 + 29) == 1)
    {
      uint64_t result = MEMORY[0x230F731A0](a1, 0x8000000000000003, 40, a2 + 48);
      if (!result) {
        return result;
      }
      goto LABEL_12;
    }
    if (*(unsigned char *)(a2 + 29)) {
      return 0;
    }
    uint64_t result = MEMORY[0x230F731A0](a1, 0x8000000000000005, 16, a2 + 96);
    if (result)
    {
      uint64_t result = ccder_blob_encode_implicit_uint64();
      if (result)
      {
        if ((MEMORY[0x230F731A0](a1, 0x8000000000000003, 40, a2 + 48) & 1) == 0) {
          return 0;
        }
LABEL_12:
        uint64_t result = MEMORY[0x230F731A0](a1, 0x8000000000000002, 8, a2 + 24);
        if (result)
        {
          uint64_t result = MEMORY[0x230F731A0](a1, 0x8000000000000001, 16, a2 + 8);
          if (result)
          {
            uint64_t result = ccder_blob_encode_implicit_uint64();
            if (result)
            {
              uint64_t result = ccder_blob_encode_tl();
              if (result)
              {
                uint64_t result = _encode_blob_header((uint64_t)a1, &v7, *(_DWORD *)(a2 + 24), v5 + a1[1] - *a1, v4 - a1[1]);
                if (result) {
                  return ccder_blob_encode_tl();
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t fv_decode_kek_blob_opts(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  long long v9 = 0uLL;
  if (a1 == a2) {
    return 4294967277;
  }
  uint64_t v5 = (int *)(a3 + 24);
  uint64_t result = fv_decode_info(a1, a2, (int *)(a3 + 24), &v9, (void *)a3, (_OWORD *)(a3 + 8), 0, a4);
  if (result) {
    return result;
  }
  if (*(unsigned char *)(a3 + 28))
  {
    if (*(unsigned char *)(a3 + 28) != 2) {
      return 4294967277;
    }
  }
  else
  {
    *(unsigned char *)(a3 + 28) = 2;
    int v7 = *(_DWORD *)(a3 + 24);
    if (!*(unsigned char *)(a3 + 29) && (v7 & 4) != 0) {
      *(unsigned char *)(a3 + 29) = 1;
    }
    if ((v7 & 2) == 0) {
      *(_DWORD *)(a3 + 120) |= 1u;
    }
  }
  if (*(void *)a3) {
    return 4294967284;
  }
  if (*(unsigned char *)(a3 + 29) == 1)
  {
    if (!der_utils_decode_implicit_raw_octet_string_copy(&v9, 0x8000000000000003, a3 + 48, 40)) {
      return 4294967277;
    }
  }
  else
  {
    if (*(unsigned char *)(a3 + 29)) {
      return 4294967284;
    }
    if (!der_utils_decode_implicit_raw_octet_string_copy(&v9, 0x8000000000000003, a3 + 48, 40)
      || !der_utils_decode_implicit_uint64(&v9, 0x8000000000000004, (void *)(a3 + 88))
      || (der_utils_decode_implicit_raw_octet_string_copy(&v9, 0x8000000000000005, a3 + 96, 16) & 1) == 0)
    {
      return 4294967277;
    }
  }
  int v8 = *v5;
  if ((*v5 & 0x80) != 0)
  {
    if (!der_utils_decode_implicit_uint64(&v9, 0x8000000000000006, (void *)(a3 + 112))) {
      return 4294967277;
    }
    int v8 = *v5;
  }
  if ((v8 & 0x100) != 0)
  {
    if ((v8 & 2) != 0)
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s kek constraint violation 1%s\n", "aks", "", "", "", "fv_decode_kek_blob_opts");
    }
    else
    {
      if (v8) {
        goto LABEL_25;
      }
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s kek constraint violation 2%s\n", "aks", "", "", "", "fv_decode_kek_blob_opts");
    }
    return 4294967277;
  }
LABEL_25:
  fv_kek_global_policy_eval(a3);
  return 0;
}

uint64_t fv_decode_kek_blob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return fv_decode_kek_blob_opts(a1, a2, a3, 1);
}

uint64_t fv_get_size(uint64_t a1, int a2, uint64_t *a3)
{
  if ((a2 - 2) >= 2)
  {
    if (a2 != 1) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v4 = ccder_sizeof_vek_blob_message_length;
    if (!ccder_sizeof_vek_blob_message_length)
    {
      ccder_sizeof_implicit_uint64();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_implicit_uint64();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof();
      ccder_sizeof_raw_octet_string();
      uint64_t v4 = ccder_sizeof_blob_header();
      ccder_sizeof_vek_blob_message_length = v4;
    }
  }
  else
  {
    uint64_t v4 = ccder_sizeof_kek_blob_message_length;
    if (!ccder_sizeof_kek_blob_message_length)
    {
      ccder_sizeof_implicit_uint64();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_raw_octet_string();
      ccder_sizeof_implicit_uint64();
      ccder_sizeof_implicit_uint64();
      uint64_t v4 = ccder_sizeof_blob_header();
      ccder_sizeof_kek_blob_message_length = v4;
    }
  }
  uint64_t v5 = 0xFFFFFFFFLL;
  if (a3 && v4)
  {
    uint64_t v5 = 0;
    *a3 = v4;
  }
  return v5;
}

uint64_t _blob_digest(void *a1, char a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  __int16 v11 = 1301;
  v10[2] = 387978753;
  memset(__s, 0, sizeof(__s));
  uint64_t v4 = ccsha256_di();
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v10 - v5;
  bzero((char *)v10 - v5, v7);
  if (*a1
    || (ccdigest_init(),
        ccdigest_update(),
        ccdigest_update(),
        (*(void (**)(uint64_t, char *, _OWORD *))(v4 + 56))(v4, v6, __s),
        cc_clear(),
        (a2 & 1) != 0)
    && !fv_hw_crypt(1, &firebloom_null_iv, __s, __s, 32))
  {
    uint64_t v8 = 0;
  }
  else
  {
    cchmac();
    uint64_t v8 = 1;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v8;
}

uint64_t ccder_sizeof_blob_header()
{
  ccder_sizeof();
  ccder_sizeof_implicit_uint64();
  ccder_sizeof_raw_octet_string();
  ccder_sizeof_raw_octet_string();

  return ccder_sizeof();
}

uint64_t der_utils_decode_implicit_raw_octet_string_copy(long long *a1, uint64_t a2, uint64_t a3, int a4)
{
  long long v8 = *a1;
  if ((ccder_blob_decode_range() & 1) == 0 || a3 && a4) {
    return 0;
  }
  *a1 = v8;
  return 1;
}

uint64_t der_utils_decode_implicit_uint64(long long *a1, uint64_t a2, void *a3)
{
  if (a3) {
    *a3 = 0;
  }
  long long v6 = *a1;
  uint64_t result = ccder_blob_decode_range();
  if (result)
  {
    if (ccn_read_uint())
    {
      return 0;
    }
    else
    {
      *a1 = v6;
      if (a3) {
        *a3 = 0;
      }
      return 1;
    }
  }
  return result;
}

uint64_t platform_rng()
{
  REQUIRE_func(&lib_platform_callbacks != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_26E030F60 != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  v0 = (uint64_t (__cdecl *)())unk_26E030F60;

  return v0();
}

uint64_t platform_read_random(uint64_t a1, unsigned int a2)
{
  REQUIRE_func(&lib_platform_callbacks != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  REQUIRE_func(unk_26E030F68 != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  uint64_t v4 = (uint64_t (*)(uint64_t, unsigned int))unk_26E030F68;

  return v4(a1, a2);
}

uint64_t lib_platform_rng()
{
  uint64_t v0 = ccrng();
  REQUIRE_func(v0 != 0, 22, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  REQUIRE_func(0, 23, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
  return v0;
}

uint64_t lib_platform_read_random(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(unsigned int (**)(uint64_t, void, uint64_t))platform_rng();
  uint64_t v5 = platform_rng();
  BOOL v6 = v4(v5, a2, a1) == 0;

  return REQUIRE_func(v6, 31, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform_lib.c");
}

unint64_t time_absolute_to_nanoseconds(uint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

BOOL is_non_zero(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  int v2 = 0;
  do
  {
    int v3 = *a1++;
    v2 |= v3;
    --a2;
  }
  while (a2);
  return v2 != 0;
}

uint64_t dump_bytes_internal(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = a1;
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)__str = 0u;
  long long v17 = 0u;
  uint64_t v5 = (FILE **)MEMORY[0x263EF8358];
  if (a3 >= 0x41)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 786, "", 0, "", "", a1, a3, "", "");
    uint64_t v4 = "";
  }
  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }
  unint64_t v6 = 0;
  unint64_t v15 = v3;
  do
  {
    size_t v7 = v5;
    if (v3 - v6 >= 0x40) {
      uint64_t v8 = 64;
    }
    else {
      uint64_t v8 = v3 - v6;
    }
    if (v8)
    {
      long long v9 = (unsigned __int8 *)(a2 + v6);
      long long v10 = __str;
      uint64_t v11 = v8;
      do
      {
        int v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }
      while (v11);
    }
    uint64_t v5 = v7;
    fprintf(*v7, "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 796, "", 0, "", "", v4, "", v6, v8 + v6, "", __str,
      "",
      "");
    v6 += v8;
    unint64_t v3 = v15;
  }
  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

unsigned char *bytes_to_str_hint(unsigned __int8 *a1, unint64_t a2)
{
  if (a2 >= 0x10) {
    uint64_t v2 = 16;
  }
  else {
    uint64_t v2 = a2;
  }
  if (v2)
  {
    uint64_t v4 = bytes_to_str_hint_buf;
    uint64_t v5 = v2;
    do
    {
      int v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }
    while (v5);
  }
  bytes_to_str_hint_buf[2 * v2] = 0;
  return bytes_to_str_hint_buf;
}

uint64_t err_sks_to_aks(uint64_t result)
{
  if (result == 0 || result >= 0xFFFFFFDA) {
    return dword_22CB69AD0[(int)result + 38];
  }
  return result;
}

uint64_t fv_init_cred_from_secret(void *a1, uint64_t a2, char a3)
{
  memset_s(a1, 0x10uLL, 0, 0x10uLL);
  if (a3) {
    return 4294967285;
  }
  if (a2 && *(void *)a2 && (size_t v7 = *(void *)(a2 + 8)) != 0)
  {
    uint64_t v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      long long v9 = *(const void **)a2;
      a1[1] = *(void *)(a2 + 8);
      memcpy(v8, v9, *(void *)(a2 + 8));
      return 0;
    }
    else
    {
      return 4294967279;
    }
  }
  else
  {
    uint64_t result = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t REQUIRE_func(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n", "aks", "", "", "", "REQUIRE_func", ":", 1047, "", 0, "", a3, a2, "");
    abort();
  }
  return result;
}

uint64_t lib_fv_new_sibling_vek()
{
  return 3758097126;
}

uint64_t fv_stash_create()
{
  return 4294967284;
}

uint64_t lib_get_file_vault_services(void *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a1 = _g_lib_fv_services;
  return result;
}

uint64_t lib_fv_new_vek(uint64_t a1, void *a2, uint64_t *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  if (a1) {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v6 = 0;
  }
  v9[0] = v6;
  v9[1] = 0;
  if (!a2) {
    a2 = &empty_fv_data;
  }
  uint64_t v7 = fv_new_vek(v9, (uint64_t)a2, a3, a4, a5, a6);
  return err_sks_to_aks(v7);
}

uint64_t lib_fv_unwrap_vek(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  if (a1) {
    uint64_t v8 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v8 = 0;
  }
  v12[0] = v8;
  v12[1] = 0;
  if (a2) {
    long long v9 = a2;
  }
  else {
    long long v9 = &empty_fv_data;
  }
  uint64_t v10 = fv_unwrap_vek(v12, 0, (uint64_t)v9, a3, a4, 0, a5);
  return err_sks_to_aks(v10);
}

uint64_t lib_fv_new_kek(uint64_t a1, unsigned int a2, void *a3, const unsigned __int8 *a4, uint64_t a5)
{
  if (a1) {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v5 = 0;
  }
  v8[0] = v5;
  v8[1] = 0;
  if (!a3) {
    a3 = &empty_fv_data;
  }
  uint64_t v6 = fv_new_kek(v8, a2, (uint64_t)a3, a4, a5);
  return err_sks_to_aks(v6);
}

uint64_t lib_fv_rewrap_kek(uint64_t a1, void *a2, uint64_t *a3, const unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  if (a1) {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v6 = 0;
  }
  v9[0] = v6;
  v9[1] = 0;
  if (!a2) {
    a2 = &empty_fv_data;
  }
  uint64_t v7 = fv_rewrap_kek(v9, (uint64_t)a2, a3, a4, a5, a6);
  return err_sks_to_aks(v7);
}

uint64_t lib_fv_get_size(uint64_t a1, int a2, uint64_t *a3)
{
  if (a1) {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  v6[0] = v3;
  v6[1] = 0;
  uint64_t size = fv_get_size((uint64_t)v6, a2, a3);
  return err_sks_to_aks(size);
}

uint64_t lib_fv_new_media_key()
{
  return 3758097126;
}

uint64_t lib_fv_unwrap_media_key()
{
  return 3758097126;
}

uint64_t lib_fv_get_blob_state(uint64_t a1, uint64_t *a2, char *a3)
{
  if (a1) {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  v6[0] = v3;
  v6[1] = 0;
  uint64_t blob_state = fv_get_blob_state((int)v6, a2, a3);
  return err_sks_to_aks(blob_state);
}

uint64_t lib_fv_set_protection(uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  if (a1) {
    uint64_t v7 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  v10[0] = v7;
  v10[1] = 0;
  if (!a4) {
    a4 = &empty_fv_data;
  }
  uint64_t v8 = fv_set_protection(v10, a2, a3, (uint64_t)a4, a5, a6, a7);
  return err_sks_to_aks(v8);
}

uint64_t lib_fv_unwrap_vek_opts(uint64_t a1, unsigned int a2, void *a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  if (a1) {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v6 = 0;
  }
  v9[0] = v6;
  v9[1] = 0;
  if (!a3) {
    a3 = &empty_fv_data;
  }
  uint64_t v7 = fv_unwrap_vek(v9, a2, (uint64_t)a3, a4, a5, 0, a6);
  return err_sks_to_aks(v7);
}

uint64_t fv_decrypt_vek(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  memset(v32, 0, sizeof(v32));
  int v31 = 32;
  int v4 = *(_DWORD *)(a3 + 32);
  if ((v4 & 2) != 0) {
    uint64_t v5 = 24;
  }
  else {
    uint64_t v5 = 40;
  }
  if (*(void *)(a3 + 8)) {
    goto LABEL_5;
  }
  if (*(unsigned char *)(a3 + 37) == 1)
  {
    *(double *)&long long v12 = ((double (*)(void))MEMORY[0x270FA5388])();
    uint64_t v29 = 0;
    long long v27 = v12;
    long long v28 = v12;
    LODWORD(__s) = 0;
    uint64_t v6 = 4294967285;
    if (!rfc3394_unwrapped_size_legacy(0x28u, (unsigned int *)&__s) || __s > 0x20) {
      goto LABEL_44;
    }
    if (a1)
    {
      long long v13 = *(_OWORD *)(a3 + 112);
      long long v27 = *(_OWORD *)(a3 + 96);
      long long v28 = v13;
      uint64_t v29 = *(void *)(a3 + 128);
      if (*(unsigned char *)(a3 + 32))
      {
        char v14 = needs_ctx();
        uint64_t v6 = 0xFFFFFFFFLL;
        if (HIDWORD(a2) || (v14 & 1) == 0) {
          goto LABEL_44;
        }
LABEL_28:
        if (a1) {
          unsigned int v19 = a2;
        }
        else {
          unsigned int v19 = 0;
        }
        if (a1) {
          long long v20 = 0;
        }
        else {
          long long v20 = _fv_hw_crypt;
        }
        if (rfc3394_unwrap_legacy(a1, v19, 0xA6A6A6A6A6A6A6A6, (uint64_t (*)(void, void *, unint64_t *, unint64_t *, uint64_t))v20, &v27, 0x28u, (void *)a4, &v31))
        {
          fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s kek failed to unwrap vek; mix-n-match?%s\n",
            "aks",
            "",
            "",
            "",
            "fv_decrypt_vek",
            ":",
            568,
            "",
            0,
            "",
            "");
          uint64_t v6 = 4294967294;
          goto LABEL_44;
        }
        goto LABEL_40;
      }
    }
    else
    {
      long long v18 = *(_OWORD *)(a3 + 72);
      long long v27 = *(_OWORD *)(a3 + 56);
      long long v28 = v18;
      uint64_t v29 = *(void *)(a3 + 88);
    }
    if (HIDWORD(a2))
    {
      uint64_t v6 = 0xFFFFFFFFLL;
      goto LABEL_44;
    }
    goto LABEL_28;
  }
  if (*(unsigned char *)(a3 + 37))
  {
LABEL_5:
    uint64_t v6 = 4294967284;
    goto LABEL_44;
  }
  if ((v4 & 0x1000) != 0)
  {
    unint64_t v30 = 0;
    uint64_t v6 = 4294967285;
    if (rfc3394_unwrapped_size(v5, &v30) && v30 <= 0x20)
    {
      long long v15 = *(_OWORD *)(a3 + 72);
      long long __s = *(_OWORD *)(a3 + 56);
      long long v34 = v15;
      uint64_t v35 = *(void *)(a3 + 88);
      if (_volume_entropy_d_derive_from_vek_data(a3, v32)) {
        goto LABEL_45;
      }
      uint64_t v16 = v32;
      unsigned int v17 = 32;
LABEL_39:
      if (!rfc3394_unwrap_legacy((uint64_t)v16, v17, 0xA6A6A6A6A6A6A6A6, 0, &__s, v5, (void *)a4, &v31))
      {
LABEL_40:
        if ((*(unsigned char *)(a3 + 32) & 2) == 0)
        {
LABEL_43:
          uint64_t v6 = 0;
          goto LABEL_44;
        }
        if (v31 == 16)
        {
          uint64_t v22 = ccsha256_di();
          MEMORY[0x270FA5388]();
          char v24 = (char *)&v30 - v23;
          bzero((char *)&v30 - v23, v25);
          long long __s = 0u;
          long long v34 = 0u;
          ccdigest_init();
          ccdigest_update();
          ccdigest_update();
          (*(void (**)(uint64_t, char *, long long *))(v22 + 56))(v22, v24, &__s);
          cc_clear();
          *(_OWORD *)(a4 + 16) = __s;
          memset_s(&__s, 0x20uLL, 0, 0x20uLL);
          goto LABEL_43;
        }
LABEL_45:
        uint64_t v6 = 0xFFFFFFFFLL;
        goto LABEL_44;
      }
LABEL_46:
      uint64_t v6 = 4294967294;
    }
  }
  else
  {
    if (!a1) {
      goto LABEL_46;
    }
    LODWORD(v30) = 0;
    uint64_t v6 = 4294967285;
    if (rfc3394_unwrapped_size_legacy(v5, (unsigned int *)&v30) && v30 <= 0x20)
    {
      long long v11 = *(_OWORD *)(a3 + 72);
      long long __s = *(_OWORD *)(a3 + 56);
      long long v34 = v11;
      uint64_t v35 = *(void *)(a3 + 88);
      if ((v4 & 1) == 0)
      {
        if (HIDWORD(a2)) {
          goto LABEL_45;
        }
        goto LABEL_38;
      }
      char v21 = needs_ctx();
      uint64_t v6 = 0xFFFFFFFFLL;
      if (!HIDWORD(a2) && (v21 & 1) != 0)
      {
LABEL_38:
        uint64_t v16 = (_OWORD *)a1;
        unsigned int v17 = a2;
        goto LABEL_39;
      }
    }
  }
LABEL_44:
  memset_s(v32, 0x20uLL, 0, 0x20uLL);
  return v6;
}

uint64_t _volume_entropy_d_derive_from_vek_data(uint64_t a1, _OWORD *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  memset(v9, 0, sizeof(v9));
  long long __s = 0u;
  long long v8 = 0u;
  if (*(unsigned char *)(a1 + 37))
  {
    uint64_t v2 = 4294967284;
  }
  else
  {
    DWORD1(v10) = 32;
    *(void *)&v9[0] = *(void *)a1;
    ccsha256_di();
    if (cchkdf() || (*(unsigned char *)(a1 + 32) & 1) != 0 && !needs_ctx())
    {
      uint64_t v2 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v2 = 0;
      long long v5 = v8;
      *a2 = __s;
      a2[1] = v5;
    }
  }
  memset_s(&__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v2;
}

uint64_t fv_get_kek_from_blob(char a1, int a2, uint64_t a3, uint64_t *a4, void *a5, size_t *a6, _DWORD *a7, unsigned __int8 *a8, unsigned __int8 *a9, void **a10)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = 4294967285;
  memset(v24, 0, sizeof(v24));
  if (a4)
  {
    if (a9)
    {
      if (a3)
      {
        if (a5)
        {
          if (a6)
          {
            if (a7)
            {
              if (a8)
              {
                if (*a4)
                {
                  uint64_t v17 = a4[1];
                  if (v17)
                  {
                    uint64_t v19 = fv_decode_kek_blob(*a4, *a4 + v17, (uint64_t)v24);
                    if (!v19)
                    {
                      uuid_copy(a8, (const unsigned __int8 *)v24 + 8);
                      uuid_copy(a9, (const unsigned __int8 *)&v24[1] + 14);
                      int v20 = DWORD2(v25);
                      *a7 = DWORD2(v24[1]);
                      unsigned int v21 = v20 & 0xFFFFFFF7;
                      if (a2) {
                        int v22 = 0;
                      }
                      else {
                        int v22 = 8;
                      }
                      DWORD2(v25) = v21 | v22;
                      uint64_t v19 = _fv_verify_secret_opts(a3, (uint64_t)v24, a5, a6, a1, a10);
                    }
                    uint64_t v10 = v19;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  memset_s(v24, 0xB0uLL, 0, 0xB0uLL);
  return v10;
}

uint64_t filevault_purge_group(int a1, unsigned __int8 *uu)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  memset(out, 0, 37);
  uuid_to_string(uu, out);
  return fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s purging %s%s\n", "aks", "", "", "", "filevault_purge_group", ":", 2957, "", 0, "", out, "");
}

uint64_t fv_set_protection(uint64_t *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v7 = 4294967284;
  switch(a2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 12:
      uint64_t v13 = *a1;
      size_t v38 = 0;
      long long v62 = 0u;
      long long v63 = 0u;
      *(_OWORD *)__smax = 0u;
      long long v44 = 0u;
      uint64_t v61 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
      long long v46 = 0u;
      memset(v47, 0, sizeof(v47));
      long long __s = 0u;
      memset(v42, 0, sizeof(v42));
      uint64_t v36 = 0;
      rsize_t __n = 0;
      size_t __count = 0;
      memset(dst, 0, sizeof(dst));
      long long v40 = 0uLL;
      int v34 = 0;
      uint64_t size = fv_get_size(0, 1, (uint64_t *)&__count);
      if (size) {
        goto LABEL_99;
      }
      if (!__count) {
        goto LABEL_111;
      }
      if (!a6 || !*a6) {
        goto LABEL_50;
      }
      uint64_t v7 = 4294967285;
      if (!a7) {
        goto LABEL_51;
      }
      uint64_t v15 = a6[1];
      if (!v15) {
        goto LABEL_51;
      }
      uint64_t size = fv_decode_vek_blob(*a6, *a6 + v15, (uint64_t)&__s);
      if (size) {
        goto LABEL_99;
      }
      if ((v13 & 0x40) != 0)
      {
        if (!a5 || *(void *)(a5 + 8) != 16)
        {
LABEL_50:
          uint64_t v7 = 4294967285;
          goto LABEL_51;
        }
        uuid_copy(dst, *(const unsigned __int8 **)a5);
        goto LABEL_49;
      }
      uint64_t size = fv_get_kek_from_blob(v13, 1, a4, (uint64_t *)a5, &v62, &v38, &v34, dst, (unsigned __int8 *)&v40, &v36);
      if (size) {
        goto LABEL_99;
      }
      if (a2 != 3)
      {
        if (a2 == 2)
        {
          if (BYTE5(v47[0]) != 1) {
            fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s unsupported vek type for sys disable%s\n", "aks", "", "", "", "_cmd_handle_vek");
          }
        }
        else if (a2 == 1 && BYTE5(v47[0]) != 1)
        {
          fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s unsupported vek type for sys enable%s\n", "aks", "", "", "", "_cmd_handle_vek");
        }
        goto LABEL_49;
      }
      if (BYTE5(v47[0]) != 1)
      {
        if (BYTE5(v47[0])) {
          goto LABEL_49;
        }
        if ((v47[0] & 0x1000) != 0)
        {
          if ((v47[0] & 2) == 0)
          {
            if (((v34 ^ LODWORD(v47[0])) & 1) == 0)
            {
              uint64_t size = fv_decrypt_vek(0, 0, (uint64_t)&__s, (uint64_t)__smax);
              if (!size)
              {
                uint64_t size = _bind_unmanaged_vek((uint64_t)&__s, (unsigned __int8 *)&v62, v38, (unsigned __int8 *)__smax);
                if (!size)
                {
                  *(_OWORD *)((char *)v47 + 6) = v40;
                  goto LABEL_74;
                }
              }
LABEL_99:
              uint64_t v7 = size;
              goto LABEL_51;
            }
            fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s kek and unmanaged vek device protection mismatch%s\n", "aks", "", "", "", "_cmd_handle_vek", ":", 2678, "", 0, "", "");
LABEL_108:
            uint64_t v7 = 4294967287;
            goto LABEL_51;
          }
LABEL_49:
          uint64_t v7 = 4294967284;
LABEL_51:
          fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s cmd: %d, result: %d%s\n", "aks", "", "", "", "_cmd_handle_vek", ":", 2873, "", 0, "", a2, v7, "");
          goto LABEL_52;
        }
LABEL_104:
        uint64_t v7 = 4294967288;
        goto LABEL_51;
      }
      if ((v61 & 2) != 0) {
        goto LABEL_104;
      }
      if ((v34 & 1) == 0) {
        goto LABEL_108;
      }
      uint64_t size = fv_decrypt_vek(0, 0, (uint64_t)&__s, (uint64_t)__smax);
      if (size) {
        goto LABEL_99;
      }
      LODWORD(v32) = 0;
      if (!is_non_zero((unsigned __int8 *)&v62, 32))
      {
        fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s Internal Error: Null KEK, file radar%s\n", "aks", "", "", "", "_enable_user_kek");
LABEL_111:
        uint64_t v7 = 4294967286;
        goto LABEL_51;
      }
      if (!is_non_zero((unsigned __int8 *)__smax, 32))
      {
        fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s Internal Error: Null VEK, file radar%s\n", "aks", "", "", "", "_enable_user_kek");
        goto LABEL_111;
      }
      if (*((void *)&__s + 1)) {
        goto LABEL_49;
      }
      LODWORD(v61) = v61 | 2;
      int v39 = 40;
      uint64_t v7 = 4294967285;
      if (!rfc3394_wrapped_size_legacy(0x20u, &v32) || v32 > 0x28) {
        goto LABEL_51;
      }
      if (rfc3394_wrap_legacy((uint64_t)&v62, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)__smax, 0x20u, &v50, &v39)|| (v47[0] & 1) != 0 && (needs_ctx() & 1) == 0)
      {
        uint64_t v7 = 0xFFFFFFFFLL;
        goto LABEL_51;
      }
      *(_OWORD *)((char *)v47 + 6) = v40;
      if (*((void *)&__s + 1)) {
        goto LABEL_49;
      }
      LODWORD(v61) = v61 & 0xFFFFFFFE;
LABEL_74:
      long long v26 = (char *)calloc(__count, 1uLL);
      if (!v26)
      {
        uint64_t v7 = 4294967279;
        goto LABEL_51;
      }
      long long v27 = v26;
      uint64_t v32 = v26;
      int8x16_t v33 = &v26[__count];
      if (!fv_encode_vek_blob((uint64_t *)&v32, (uint64_t)&__s))
      {
        uint64_t v31 = 4294967273;
        goto LABEL_98;
      }
      long long v28 = v33;
      size_t v29 = &v27[__count] - v33;
      unint64_t v30 = *(void **)a7;
      if (!*(void *)a7)
      {
        unint64_t v30 = calloc(&v27[__count] - v33, 1uLL);
        if (!v30)
        {
          uint64_t v31 = 4294967279;
          goto LABEL_98;
        }
        *(void *)a7 = v30;
        long long v28 = v33;
        goto LABEL_97;
      }
      if (v29 <= *(void *)(a7 + 8))
      {
LABEL_97:
        *(void *)(a7 + 8) = v29;
        memcpy(v30, &v27[v28 - v32], v29);
        uint64_t v31 = 0;
        goto LABEL_98;
      }
      uint64_t v31 = 0xFFFFFFFFLL;
LABEL_98:
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s cmd: %d, result: %d%s\n", "aks", "", "", "", "_cmd_handle_vek", ":", 2873, "", 0, "", 3, v31, "");
      memset_s(v27, __count, 0, __count);
      free(v27);
      uint64_t v7 = v31;
LABEL_52:
      memset_s(&v62, 0x20uLL, 0, 0x20uLL);
      memset_s(__smax, 0x20uLL, 0, 0x20uLL);
      memset_s(v42, 0x20uLL, 0, 0x20uLL);
      if (v36)
      {
        memset_s(v36, __n, 0, __n);
        free(v36);
      }
      return v7;
    case 5:
      uint64_t v61 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
      long long v46 = 0u;
      memset(v47, 0, sizeof(v47));
      long long __s = 0u;
      if (!a6) {
        return 4294967285;
      }
      if (!*a6) {
        return 4294967285;
      }
      uint64_t v18 = a6[1];
      if (!v18) {
        return 4294967285;
      }
      uint64_t v19 = fv_decode_vek_blob(*a6, *a6 + v18, (uint64_t)&__s);
      if (v19) {
        return v19;
      }
      if (BYTE5(v47[0]) == 1) {
        return 0;
      }
      else {
        return 4294967285;
      }
    case 6:
      uint64_t v61 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
      long long v46 = 0u;
      memset(v47, 0, sizeof(v47));
      long long __s = 0u;
      if (!a6) {
        return 4294967285;
      }
      if (!*a6) {
        return 4294967285;
      }
      uint64_t v20 = a6[1];
      if (!v20) {
        return 4294967285;
      }
      return fv_decode_vek_blob_opts(*a6, *a6 + v20, (uint64_t)&__s, 1);
    case 7:
      uint64_t v21 = *a1;
      *(void *)&v42[0] = 0;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
      long long v46 = 0u;
      memset(v47, 0, sizeof(v47));
      long long __s = 0u;
      __smax[0] = 0;
      __smax[1] = 0;
      if (a4 && *(void *)a4 && *(void *)(a4 + 8))
      {
        if (!a5) {
          goto LABEL_40;
        }
        const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v22 = *(const unsigned __int8 **)a5;
        if (!*(void *)a5) {
          goto LABEL_40;
        }
        uint64_t v23 = *(void *)(a5 + 8);
        if (!v23) {
          goto LABEL_40;
        }
      }
      else
      {
        if (!a5) {
          goto LABEL_63;
        }
        const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v22 = *(const unsigned __int8 **)a5;
        if (!*(void *)a5) {
          goto LABEL_63;
        }
        uint64_t v23 = *(void *)(a5 + 8);
        if (!v23) {
          goto LABEL_63;
        }
        if (!a4)
        {
LABEL_40:
          uint64_t v7 = 4294967285;
          goto LABEL_64;
        }
      }
      uint64_t v25 = fv_decode_kek_blob((uint64_t)v22, (uint64_t)&v22[v23], (uint64_t)&__s);
      if (v25
        || (uint64_t v25 = _fv_verify_secret_opts(a4, (uint64_t)&__s, &v62, (size_t *)v42, v21, (void **)__smax), v25)
        || (v21 & 8) != 0 && (uint64_t v25 = fv_stash_create(), v25))
      {
        uint64_t v7 = v25;
LABEL_64:
        memset_s(&v62, 0x20uLL, 0, 0x20uLL);
        if (__smax[0])
        {
          memset_s((void *)__smax[0], __smax[1], 0, __smax[1]);
          free((void *)__smax[0]);
        }
        goto LABEL_21;
      }
LABEL_63:
      uint64_t v7 = 0;
      goto LABEL_64;
    case 10:
      return 0;
    case 11:
    case 15:
    case 22:
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
      long long v46 = 0u;
      memset(v47, 0, sizeof(v47));
      long long __s = 0u;
      if (a5)
      {
        if (*(void *)a5
          && (uint64_t v16 = *(void *)(a5 + 8)) != 0
          && (uint64_t v17 = fv_decode_kek_blob_opts(*(void *)a5, *(void *)a5 + v16, (uint64_t)&__s, 1), v17))
        {
          uint64_t v7 = v17;
        }
        else
        {
          uint64_t v7 = 0;
        }
      }
      else
      {
        uint64_t v7 = 0xFFFFFFFFLL;
      }
LABEL_21:
      memset_s(&__s, 0xB0uLL, 0, 0xB0uLL);
      return v7;
    case 28:
      if (!a4 || !*(void *)a4 || *(void *)(a4 + 8) != 16) {
        return 4294967285;
      }
      long long __s = *(_OWORD *)*(void *)a4;
      filevault_purge_group(0, (unsigned __int8 *)&__s);
      return 0;
    default:
      return v7;
  }
}

uint64_t fv_get_blob_state(int a1, uint64_t *a2, char *__s)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  memset(v28, 0, sizeof(v28));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long __sa = 0u;
  memset(v16, 0, 22);
  if (!a2 || !*a2)
  {
    uint64_t v5 = 4294967285;
    goto LABEL_13;
  }
  uint64_t v5 = 4294967285;
  if (__s && a2[1])
  {
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    uint64_t v6 = fv_decode_info(*a2, *a2 + a2[1], v16, 0, 0, __s + 4, 0, 1);
    int v7 = v6;
    uint64_t v5 = v6;
    if (v6 == -6)
    {
      *((_DWORD *)__s + 9) |= 0x2000000u;
      uint64_t v5 = fv_decode_info(*a2, *a2 + a2[1], v16, 0, 0, __s + 4, 0, 0);
    }
    if (v5)
    {
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s failed to decode blob%s\n", "aks", "", "", "", "fv_get_blob_state");
      goto LABEL_13;
    }
    *(_OWORD *)(__s + 20) = *(_OWORD *)((char *)&v16[1] + 2);
    __int16 v8 = v16[0];
    int v9 = LOBYTE(v16[1]);
    if (!LOBYTE(v16[1]))
    {
      if (!fv_decode_kek_blob_opts(*a2, *a2 + a2[1], (uint64_t)&__sa, v7 != -6))
      {
        LOBYTE(v16[1]) = 2;
LABEL_18:
        uint64_t v11 = fv_decode_kek_blob_opts(*a2, *a2 + a2[1], (uint64_t)&__sa, v7 != -6);
        if (v11)
        {
          uint64_t v5 = v11;
          fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s failed to decode kek%s\n", "aks", "", "", "", "fv_get_blob_state");
          goto LABEL_13;
        }
        *(_DWORD *)long long __s = 2;
        *((_DWORD *)__s + 10) = __sa;
        __s[65] = BYTE13(v18);
LABEL_31:
        if ((v8 & 0x40) != 0)
        {
          *((_DWORD *)__s + 9) |= 0x80u;
          if ((v8 & 0x20) == 0)
          {
LABEL_33:
            if ((v8 & 0x800) == 0) {
              goto LABEL_34;
            }
            goto LABEL_46;
          }
        }
        else if ((v8 & 0x20) == 0)
        {
          goto LABEL_33;
        }
        *((_DWORD *)__s + 9) |= 0x40u;
        if ((v8 & 0x800) == 0)
        {
LABEL_34:
          if ((v8 & 2) == 0) {
            goto LABEL_35;
          }
          goto LABEL_47;
        }
LABEL_46:
        *((_DWORD *)__s + 9) |= 0x1000000u;
        if ((v8 & 2) == 0)
        {
LABEL_35:
          if ((v8 & 1) == 0) {
            goto LABEL_36;
          }
          goto LABEL_48;
        }
LABEL_47:
        *((_DWORD *)__s + 9) |= 0x10u;
        if ((v8 & 1) == 0)
        {
LABEL_36:
          if ((v8 & 8) == 0) {
            goto LABEL_37;
          }
          goto LABEL_49;
        }
LABEL_48:
        *((_DWORD *)__s + 9) |= 1u;
        if ((v8 & 8) == 0)
        {
LABEL_37:
          if ((v8 & 0x80) == 0) {
            goto LABEL_38;
          }
          goto LABEL_50;
        }
LABEL_49:
        *((_DWORD *)__s + 9) |= 0x20u;
        if ((v8 & 0x80) == 0)
        {
LABEL_38:
          if ((v8 & 0x10) == 0) {
            goto LABEL_39;
          }
          goto LABEL_51;
        }
LABEL_50:
        *((_DWORD *)__s + 9) |= 0x400u;
        *((void *)__s + 9) = v24;
        if ((v8 & 0x10) == 0)
        {
LABEL_39:
          if ((v8 & 4) == 0) {
            goto LABEL_40;
          }
          goto LABEL_52;
        }
LABEL_51:
        __s[64] |= 1u;
        if ((v8 & 4) == 0)
        {
LABEL_40:
          if ((v8 & 0x400) == 0) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }
LABEL_52:
        __s[64] |= 2u;
        if ((v8 & 0x400) == 0)
        {
LABEL_42:
          uint64_t v5 = 0;
          if ((v8 & 0x200) != 0) {
            *((_DWORD *)__s + 9) |= 0x80000u;
          }
          goto LABEL_13;
        }
LABEL_41:
        *((_DWORD *)__s + 9) |= 0x100000u;
        goto LABEL_42;
      }
      if (!fv_decode_vek_blob_opts(*a2, *a2 + a2[1], (uint64_t)v28, v7 != -6))
      {
        LOBYTE(v16[1]) = 1;
        goto LABEL_21;
      }
      int v9 = LOBYTE(v16[1]);
    }
    if (v9 != 1)
    {
      if (v9 != 2)
      {
        fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s unknown blob type %i%s\n", "aks", "", "", "", "fv_get_blob_state", ":", 3483, "", 0, "", v9, "");
        uint64_t v5 = 0xFFFFFFFFLL;
        goto LABEL_13;
      }
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v12 = fv_decode_vek_blob_opts(*a2, *a2 + a2[1], (uint64_t)v28, v7 != -6);
    if (v12)
    {
      uint64_t v5 = v12;
      fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s failed to decode vek%s\n", "aks", "", "", "", "fv_get_blob_state");
      goto LABEL_13;
    }
    *(_DWORD *)long long __s = 1;
    int v13 = BYTE5(v29);
    __s[65] = BYTE5(v29);
    *((_DWORD *)__s + 10) = v28[1];
    if (v13)
    {
      if (v13 != 1) {
        goto LABEL_31;
      }
      char v14 = v44;
      if (v44) {
        *((_DWORD *)__s + 9) |= 8u;
      }
      if ((v14 & 2) == 0) {
        goto LABEL_31;
      }
      int v15 = *((_DWORD *)__s + 9) | 4;
    }
    else
    {
      if ((BYTE1(v29) & 0x10) == 0) {
        goto LABEL_31;
      }
      int v15 = *((_DWORD *)__s + 9) | 0x8000000;
    }
    *((_DWORD *)__s + 9) = v15;
    goto LABEL_31;
  }
LABEL_13:
  memset_s(&__sa, 0xB0uLL, 0, 0xB0uLL);
  return v5;
}

uint64_t fv_new_vek(void *a1, uint64_t a2, uint64_t *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  memset(v35, 0, sizeof(v35));
  size_t v27 = 32;
  uint64_t v30 = 0;
  memset(v29, 0, sizeof(v29));
  memset(__s, 0, sizeof(__s));
  size_t __count = 0;
  BOOL v12 = a3 && *a3 && a3[1] != 0;
  long long v33 = 0uLL;
  long long v34 = 0uLL;
  long long v31 = 0uLL;
  long long v32 = 0uLL;
  uint64_t size = fv_get_size(0, 1, (uint64_t *)&__count);
  if (size)
  {
LABEL_30:
    vek_uint64_t data = size;
    goto LABEL_20;
  }
  if (!__count)
  {
    vek_uint64_t data = 4294967286;
    goto LABEL_20;
  }
  vek_uint64_t data = 4294967285;
  if (!a4 || !a5 || !*(void *)a5 || __count > *(void *)(a5 + 8)) {
    goto LABEL_20;
  }
  if (v12)
  {
    if (!a3) {
      goto LABEL_20;
    }
    if (!*a3) {
      goto LABEL_20;
    }
    uint64_t v15 = a3[1];
    if (!v15) {
      goto LABEL_20;
    }
    uint64_t size = fv_decode_kek_blob(*a3, *a3 + v15, (uint64_t)__s);
    if (!size)
    {
      uint64_t size = _fv_verify_secret_opts(a2, (uint64_t)__s, v35, &v27, *a1, 0);
      if (!size)
      {
        uint64_t size = _create_vek_data(a4, BYTE8(__s[1]) & 9, (unsigned __int8 *)v35, v27, (uint64_t)v29, (unsigned __int8 *)&v31);
        if (!size)
        {
          *(_OWORD *)((char *)&v29[2] + 6) = *(_OWORD *)((char *)&__s[1] + 14);
          goto LABEL_21;
        }
      }
    }
    goto LABEL_30;
  }
  vek_uint64_t data = _create_vek_data(a4, 0, 0, 0, (uint64_t)v29, (unsigned __int8 *)&v31);
  if (vek_data)
  {
LABEL_20:
    memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
    goto LABEL_29;
  }
LABEL_21:
  uint64_t v16 = (char *)calloc(__count, 1uLL);
  if (!v16)
  {
    vek_uint64_t data = 4294967279;
    goto LABEL_20;
  }
  uint64_t v17 = v16;
  uint64_t v24 = (uint64_t)v16;
  long long v25 = &v16[__count];
  if (fv_encode_vek_blob(&v24, (uint64_t)v29))
  {
    long long v18 = v25;
    uint64_t v19 = v24;
    size_t v20 = &v17[__count] - v25;
    *(void *)(a5 + 8) = v20;
    memcpy(*(void **)a5, &v18[(void)v17 - v19], v20);
    if (a6)
    {
      long long v21 = *(_OWORD **)a6;
      if (*(void *)a6 && *(void *)(a6 + 8) >= 0x20uLL)
      {
        vek_uint64_t data = 0;
        *(void *)(a6 + 8) = 32;
        long long v22 = v32;
        *long long v21 = v31;
        v21[1] = v22;
      }
      else
      {
        vek_uint64_t data = 0xFFFFFFFFLL;
      }
    }
    else
    {
      vek_uint64_t data = 0;
    }
  }
  else
  {
    vek_uint64_t data = 4294967273;
  }
  memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
  memset_s(v17, __count, 0, __count);
  free(v17);
LABEL_29:
  memset_s(v35, 0x20uLL, 0, 0x20uLL);
  memset_s(&v31, 0x40uLL, 0, 0x40uLL);
  return vek_data;
}

uint64_t _create_vek_data(unsigned __int8 *src, int a2, unsigned __int8 *a3, unsigned int a4, uint64_t a5, unsigned __int8 *a6)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(v16, 0, sizeof(v16));
  unsigned int v14 = 0;
  memset(__s, 0, sizeof(__s));
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  *(_OWORD *)(a5 + 144) = 0u;
  *(_OWORD *)(a5 + 160) = 0u;
  *(_OWORD *)(a5 + 176) = 0u;
  *(_OWORD *)(a5 + 192) = 0u;
  *(_OWORD *)(a5 + 208) = 0u;
  *(_OWORD *)(a5 + 224) = 0u;
  *(_OWORD *)(a5 + 240) = 0u;
  *(_OWORD *)(a5 + 256) = 0u;
  *(void *)(a5 + 272) = 0;
  *(_OWORD *)(a5 + 16) = 0u;
  *(unsigned char *)(a5 + 36) = 1;
  *(_DWORD *)(a5 + 32) = a2 & 0xFFFFFFFD;
  uuid_copy((unsigned __int8 *)(a5 + 16), src);
  platform_read_random(a5, 8u);
  platform_read_random((uint64_t)a6, 0x20u);
  if (*(void *)(a5 + 8) || *(unsigned char *)(a5 + 37))
  {
    uint64_t v10 = 4294967284;
    goto LABEL_4;
  }
  if (a3)
  {
    if (_bind_unmanaged_vek(a5, a3, a4, a6))
    {
LABEL_14:
      uint64_t v10 = 0xFFFFFFFFLL;
      goto LABEL_4;
    }
LABEL_13:
    uint64_t v10 = 0;
    goto LABEL_4;
  }
  int v13 = 40;
  uint64_t v10 = 4294967285;
  if (rfc3394_wrapped_size_legacy(0x20u, &v14) && v14 <= 0x28)
  {
    uint64_t v12 = _volume_entropy_d_derive_from_vek_data(a5, __s);
    if (v12)
    {
      uint64_t v10 = v12;
      goto LABEL_4;
    }
    if (rfc3394_wrap_legacy((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a6, 0x20u, (void *)(a5 + 56), &v13))goto LABEL_14; {
    *(_DWORD *)(a5 + 32) |= 0x1000u;
    }
    goto LABEL_13;
  }
LABEL_4:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v16, 0x20uLL, 0, 0x20uLL);
  return v10;
}

uint64_t fv_unwrap_vek(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  memset(__s, 0, 32);
  size_t v29 = 32;
  uint64_t v35 = 0;
  long long v33 = 0u;
  memset(v34, 0, sizeof(v34));
  long long v32 = 0u;
  BOOL v9 = a4 && *a4 && a4[1] != 0;
  long long v38 = 0uLL;
  long long v39 = 0uLL;
  long long v36 = 0uLL;
  long long v37 = 0uLL;
  size_t v27 = 0;
  rsize_t __n = 0;
  memset(dst, 0, sizeof(dst));
  memset(v30, 0, sizeof(v30));
  int v26 = 0;
  if (!a5) {
    goto LABEL_48;
  }
  if (!*a5) {
    goto LABEL_48;
  }
  uint64_t v10 = a5[1];
  if (!v10) {
    goto LABEL_48;
  }
  if (v9)
  {
    uint64_t v11 = *a1;
    if ((v11 & 0x40) == 0)
    {
      uint64_t kek_from_blob = fv_get_kek_from_blob(v11, (a2 >> 1) & 1, a3, a4, __s, &v29, &v26, v30, dst, &v27);
      if (!kek_from_blob)
      {
        uint64_t kek_from_blob = fv_decode_vek_blob(*a5, *a5 + a5[1], (uint64_t)&v32);
        if (!kek_from_blob)
        {
          int v13 = __s;
          goto LABEL_15;
        }
      }
LABEL_49:
      uint64_t v17 = kek_from_blob;
      goto LABEL_39;
    }
    if (a4 && a4[1] == 16)
    {
      uuid_copy(v30, (const unsigned __int8 *)*a4);
      uint64_t v17 = 4294967284;
      goto LABEL_39;
    }
LABEL_48:
    uint64_t v17 = 4294967285;
    goto LABEL_39;
  }
  uint64_t kek_from_blob = fv_decode_vek_blob(*a5, *a5 + v10, (uint64_t)&v32);
  if (kek_from_blob) {
    goto LABEL_49;
  }
  uuid_copy(dst, (const unsigned __int8 *)v34 + 6);
  int v13 = 0;
LABEL_15:
  if (v9) {
    unint64_t v14 = v29;
  }
  else {
    unint64_t v14 = 0;
  }
  uint64_t kek_from_blob = fv_decrypt_vek((uint64_t)v13, v14, (uint64_t)&v32, (uint64_t)&v36);
  if (kek_from_blob) {
    goto LABEL_49;
  }
  if (!a7)
  {
LABEL_23:
    uint64_t v17 = 0;
    int v18 = 1;
LABEL_24:
    long long v43 = v33;
    goto LABEL_25;
  }
  uint64_t v15 = *(_OWORD **)a7;
  if (*(void *)a7 && *(void *)(a7 + 8) >= 0x20uLL)
  {
    *(void *)(a7 + 8) = 32;
    long long v16 = v37;
    *uint64_t v15 = v36;
    v15[1] = v16;
    goto LABEL_23;
  }
  uint64_t v17 = 0xFFFFFFFFLL;
LABEL_39:
  long long v43 = 0uLL;
  if ((_akslog_filter & 1) == 0)
  {
    int v18 = 0;
    goto LABEL_24;
  }
  uint64_t v41 = 0;
  v42[0] = 0;
  *(void *)((char *)v42 + 6) = 0;
  if (v9) {
    dump_bytes_internal("kek group", (uint64_t)dst, 0x10uLL);
  }
  if (a5)
  {
    if (*a5)
    {
      uint64_t v25 = a5[1];
      if (v25)
      {
        fv_decode_info(*a5, *a5 + v25, (int *)&v41, 0, 0, &v43, 0, 1);
        dump_bytes_internal("vek group", (uint64_t)&v41 + 6, 0x10uLL);
      }
    }
  }
  int v18 = 0;
LABEL_25:
  uint64_t v19 = (FILE *)*MEMORY[0x263EF8358];
  if (v9) {
    size_t v20 = v30;
  }
  else {
    size_t v20 = (unsigned __int8 *)&v43;
  }
  if (v9) {
    long long v21 = "user";
  }
  else {
    long long v21 = "volume";
  }
  long long v22 = bytes_to_str_hint(v20, 0x10uLL);
  long long v23 = "failed";
  if (v18) {
    long long v23 = "successful";
  }
  fprintf(v19, "%s%s:%s%s%s%s%u:%s%u:%s %s %s unlock %s (%d)%s\n", "aks", "", "", "", "_unlock_result", ":", 3849, "", 0, "", v21, v22, v23, v17, "");
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(&v36, 0x40uLL, 0, 0x40uLL);
  if (v27)
  {
    memset_s(v27, __n, 0, __n);
    free(v27);
  }
  return v17;
}

uint64_t fv_new_kek(unsigned char *a1, unsigned int a2, uint64_t a3, const unsigned __int8 *a4, uint64_t a5)
{
  return fv_create_kek(a1, a2, a3, a4, UUID_NULL, 0, a5);
}

uint64_t fv_create_kek(unsigned char *a1, unsigned int a2, uint64_t a3, const unsigned __int8 *a4, const unsigned __int8 *a5, long long *a6, uint64_t a7)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  size_t __count = 0;
  uint64_t size = fv_get_size(0, 2, (uint64_t *)&__count);
  if (size) {
    goto LABEL_13;
  }
  if (!__count)
  {
    uint64_t v20 = 4294967286;
    goto LABEL_16;
  }
  if (!a7 || !*(void *)a7 || __count > *(void *)(a7 + 8))
  {
    uint64_t v20 = 4294967285;
LABEL_16:
    memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
    return v20;
  }
  uint64_t size = _create_kek_data(a5, a4, a2 & 1 | (((a2 >> 2) & 1) << 11), a3, a6, (uint64_t)__s, *a1 & 4);
  if (size)
  {
LABEL_13:
    uint64_t v20 = size;
    goto LABEL_16;
  }
  uint64_t v15 = (char *)calloc(__count, 1uLL);
  if (!v15)
  {
    uint64_t v20 = 4294967279;
    goto LABEL_16;
  }
  long long v16 = v15;
  uint64_t v22 = (uint64_t)v15;
  long long v23 = &v15[__count];
  if (fv_encode_kek_blob(&v22, (uint64_t)__s))
  {
    uint64_t v17 = v23;
    uint64_t v18 = v22;
    size_t v19 = &v16[__count] - v23;
    *(void *)(a7 + 8) = v19;
    memcpy(*(void **)a7, &v17[(void)v16 - v18], v19);
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 4294967273;
  }
  memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
  memset_s(v16, __count, 0, __count);
  free(v16);
  return v20;
}

uint64_t _create_kek_data(const unsigned __int8 *a1, const unsigned __int8 *a2, int a3, uint64_t a4, long long *a5, uint64_t a6, char a7)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  memset(v32, 0, sizeof(v32));
  rsize_t __n = 0;
  size_t v29 = 32;
  long long v30 = 0u;
  long long v31 = 0u;
  size_t v27 = 0;
  unsigned int v26 = 0;
  if (!a2)
  {
    uint64_t v16 = 0xFFFFFFFFLL;
    goto LABEL_39;
  }
  if (!a6)
  {
    uint64_t v16 = 4294967285;
    goto LABEL_37;
  }
  uint64_t inited = fv_init_cred_from_secret(&v27, a4, (a7 & 4) != 0);
  if (inited) {
    goto LABEL_40;
  }
  if (a5)
  {
    long long v13 = a5[1];
    long long v30 = *a5;
    long long v31 = v13;
  }
  else
  {
    platform_read_random((uint64_t)&v30, 0x20u);
  }
  *(_OWORD *)a6 = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_DWORD *)(a6 + 24) = (8 * a3) & 0x10 | a3 & 0xFFFFF9BD;
  unint64_t v14 = (unsigned char *)(a6 + 24);
  *(_OWORD *)(a6 + 144) = 0u;
  *(_OWORD *)(a6 + 160) = 0u;
  *(_OWORD *)(a6 + 112) = 0u;
  *(_OWORD *)(a6 + 128) = 0u;
  *(_OWORD *)(a6 + 80) = 0u;
  *(_OWORD *)(a6 + 96) = 0u;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(unsigned char *)(a6 + 28) = 2;
  uint64_t v15 = (_OWORD *)(a6 + 30);
  if (uuid_compare(UUID_NULL, a1))
  {
    *uint64_t v15 = *(_OWORD *)a1;
  }
  else
  {
    uint64_t v17 = 16;
    while (1)
    {
      MEMORY[0x230F73720](a6 + 30);
      if (*(unsigned char *)v15 || *(unsigned char *)(a6 + 31)) {
        break;
      }
      if (!--v17)
      {
        fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s failed to generate valid kek group uuid after 16 attempts%s\n", "aks", "", "", "", "_create_kek_data", ":", 4174, "", 0, "", "");
        uint64_t v16 = 4294967286;
        goto LABEL_37;
      }
    }
  }
  uuid_copy((unsigned __int8 *)(a6 + 8), a2);
  fv_kek_global_policy_eval(a6);
  if (*(void *)a6) {
    goto LABEL_10;
  }
  if (*(unsigned char *)(a6 + 29) != 1)
  {
    if (*(unsigned char *)(a6 + 29))
    {
LABEL_10:
      uint64_t v16 = 4294967284;
      goto LABEL_37;
    }
    platform_read_random(a6 + 96, 0x10u);
    memset(__s, 0, sizeof(__s));
    uint64_t v18 = mach_continuous_time();
    ccsha256_di();
    if (ccpbkdf2_hmac())
    {
      unint64_t v21 = 0;
    }
    else
    {
      uint64_t v19 = mach_continuous_time();
      memset_s(__s, 0x20uLL, 0, 0x20uLL);
      unint64_t v20 = time_absolute_to_nanoseconds(v19 - v18);
      unint64_t v21 = 100000;
      if (v20) {
        unint64_t v21 = 0x174876E800 / v20;
      }
    }
    if (v21 <= 0x186A0) {
      unint64_t v21 = 100000;
    }
    *(void *)(a6 + 88) = v21;
    uint64_t inited = _fv_master_key_derive(a6, v27, __n, v32, &v29);
    if (!inited)
    {
      LODWORD(__s[0]) = 40;
      uint64_t v16 = 4294967285;
      if (rfc3394_wrapped_size_legacy(0x20u, &v26) && v26 <= 0x28)
      {
        uint64_t v22 = (void *)(a6 + 48);
        unsigned int v23 = v29;
LABEL_31:
        if (rfc3394_wrap_legacy((uint64_t)v32, v23, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)&v30, 0x20u, v22, __s)|| (*v14 & 1) != 0 && (needs_ctx() & 1) == 0)
        {
          uint64_t v16 = 0xFFFFFFFFLL;
        }
        else
        {
          effective_info_uint64_t size = fv_get_effective_info_size();
          if (effective_info_size <= 0x15) {
            bzero(&v14[effective_info_size], 22 - effective_info_size);
          }
          uint64_t v16 = 0;
        }
        goto LABEL_37;
      }
      goto LABEL_37;
    }
LABEL_40:
    uint64_t v16 = inited;
    goto LABEL_37;
  }
  uint64_t inited = _fv_master_key_derive(a6, v27, __n, v32, &v29);
  if (inited) {
    goto LABEL_40;
  }
  LODWORD(__s[0]) = 40;
  uint64_t v16 = 4294967285;
  if (rfc3394_wrapped_size_legacy(0x20u, &v26) && v26 <= 0x28)
  {
    unsigned int v23 = v29;
    uint64_t v22 = (void *)(a6 + 48);
    goto LABEL_31;
  }
LABEL_37:
  if (v27)
  {
    memset_s(v27, __n, 0, __n);
    free(v27);
  }
LABEL_39:
  memset_s(v32, 0x20uLL, 0, 0x20uLL);
  memset_s(&v30, 0x20uLL, 0, 0x20uLL);
  return v16;
}

uint64_t fv_rewrap_kek(void *a1, uint64_t a2, uint64_t *a3, const unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  memset(v45, 0, sizeof(v45));
  memset(v44, 0, sizeof(v44));
  size_t __count = 0;
  size_t v27 = 32;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  memset(__s, 0, sizeof(__s));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t size = fv_get_size(0, 2, (uint64_t *)&__count);
  if (size) {
    goto LABEL_26;
  }
  if (!__count)
  {
    unint64_t v14 = 0;
    int v13 = 0;
    uint64_t v15 = 4294967286;
    goto LABEL_21;
  }
  int v13 = 0;
  unint64_t v14 = 0;
  uint64_t v15 = 4294967285;
  if (a4 && a5 && a6)
  {
    if (!*(void *)a6) {
      goto LABEL_27;
    }
    size_t v16 = *(void *)(a6 + 8);
    if (!v16) {
      goto LABEL_27;
    }
    int v13 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = 4294967285;
    if (a3 && __count <= v16)
    {
      if (*a3)
      {
        uint64_t v17 = a3[1];
        if (v17)
        {
          uint64_t size = fv_decode_kek_blob(*a3, *a3 + v17, (uint64_t)__s);
          if (!size)
          {
            if ((BYTE8(__s[1]) & 0x80) != 0 && (void)v40)
            {
              unint64_t v14 = 0;
              int v13 = 0;
              uint64_t v15 = 4294967263;
              goto LABEL_21;
            }
            uint64_t size = _fv_verify_secret_opts(a2, (uint64_t)__s, v45, &v27, *a1, 0);
            if (!size)
            {
              int v13 = DWORD2(__s[1]);
              kek_uint64_t data = _create_kek_data((const unsigned __int8 *)&__s[1] + 14, a4, SDWORD2(__s[1]), a5, v45, (uint64_t)&v28, *a1);
              if (kek_data)
              {
                uint64_t v15 = kek_data;
                unint64_t v14 = 0;
              }
              else
              {
                uint64_t v19 = (char *)calloc(__count, 1uLL);
                unint64_t v14 = v19;
                if (v19)
                {
                  uint64_t v24 = (uint64_t)v19;
                  uint64_t v25 = &v19[__count];
                  if (fv_encode_kek_blob(&v24, (uint64_t)&v28))
                  {
                    unint64_t v20 = v25;
                    uint64_t v21 = v24;
                    size_t v22 = &v14[__count] - v25;
                    *(void *)(a6 + 8) = v22;
                    memcpy(*(void **)a6, &v20[(void)v14 - v21], v22);
                    uint64_t v15 = 0;
                  }
                  else
                  {
                    uint64_t v15 = 4294967273;
                  }
                }
                else
                {
                  uint64_t v15 = 4294967279;
                }
              }
              goto LABEL_21;
            }
          }
LABEL_26:
          uint64_t v15 = size;
          unint64_t v14 = 0;
          int v13 = 0;
          goto LABEL_21;
        }
      }
LABEL_27:
      unint64_t v14 = 0;
      int v13 = 0;
      uint64_t v15 = 4294967285;
    }
  }
LABEL_21:
  if (_akslog_filter) {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s %sresult: %d; passcode_change: %d; cf: 0x%x; of: 0x%x; nf: 0x%x%s\n",
  }
      "aks",
      "",
      "",
      "",
      "fv_rewrap_kek",
      ":",
      4586,
      "",
      0,
      "",
      "",
      v15,
      0,
      v13,
      DWORD2(__s[1]),
      DWORD2(v29),
      "");
  memset_s(__s, 0xB0uLL, 0, 0xB0uLL);
  memset_s(&v28, 0xB0uLL, 0, 0xB0uLL);
  if (v14)
  {
    memset_s(v14, __count, 0, __count);
    free(v14);
  }
  memset_s(v45, 0x20uLL, 0, 0x20uLL);
  memset_s(v44, 0x20uLL, 0, 0x20uLL);
  return v15;
}

uint64_t _fv_verify_secret_opts(uint64_t a1, uint64_t a2, void *a3, size_t *a4, char a5, void **a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  *(void *)&__n[1] = 32;
  long long __src = 0u;
  long long v19 = 0u;
  __n[0] = 32;
  uint64_t v15 = 0;
  rsize_t __smax = 0;
  uint64_t v6 = 4294967285;
  if (a1 && a2)
  {
    uint64_t inited = fv_init_cred_from_secret(&v15, a1, (a5 & 4) != 0);
    if (inited
      || (uint64_t inited = _fv_master_key_derive(a2, v15, __smax, __s, (size_t *)&__n[1]), inited)
      || (uint64_t inited = _fv_decrypt_kek(a2, (uint64_t)__s, __n[1], &__src, __n), inited))
    {
      uint64_t v6 = inited;
    }
    else
    {
      if (a3 && a4)
      {
        if ((*(unsigned char *)(a2 + 120) & 1) != 0 && !is_non_zero((unsigned __int8 *)&v19, 16)) {
          *(_DWORD *)(a2 + 24) |= 0x10u;
        }
        if ((*(unsigned char *)(a2 + 24) & 0x10) != 0)
        {
          size_t v12 = 16;
          __n[0] = 16;
        }
        else
        {
          size_t v12 = __n[0];
        }
        memcpy(a3, &__src, v12);
        *a4 = v12;
      }
      uint64_t v6 = 0;
      if (a6)
      {
        rsize_t v13 = __smax;
        *a6 = v15;
        a6[1] = (void *)v13;
        uint64_t v15 = 0;
        rsize_t __smax = 0;
      }
    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(&__src, 0x20uLL, 0, 0x20uLL);
  if (v15)
  {
    memset_s(v15, __smax, 0, __smax);
    free(v15);
  }
  return v6;
}

uint64_t _fv_master_key_derive(uint64_t a1, void *__src, size_t __n, void *a4, size_t *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(v18, 0, sizeof(v18));
  if (*(unsigned char *)(a1 + 28) != 2 || *a5 != 32)
  {
    uint64_t v14 = 4294967285;
    goto LABEL_24;
  }
  int v10 = *(_DWORD *)(a1 + 24);
  if ((v10 & 2) != 0) {
    size_t v11 = 16;
  }
  else {
    size_t v11 = 32;
  }
  if (v10)
  {
    uint64_t v12 = ccsha256_di();
    if (__src) {
      size_t v13 = __n;
    }
    else {
      size_t v13 = 0;
    }
    if (firebloom_ccpbkdf2_hmac(v12, v13, __src, 16, a1 + 96, 1, v11, v18)) {
      goto LABEL_20;
    }
    if (!needs_ctx()) {
      goto LABEL_26;
    }
  }
  if (!*(void *)a1)
  {
    if (*(unsigned char *)(a1 + 29) != 1)
    {
      if (*(unsigned char *)(a1 + 29)) {
        goto LABEL_13;
      }
      uint64_t v15 = ccsha256_di();
      if (__src) {
        size_t v16 = __n;
      }
      else {
        size_t v16 = 0;
      }
      if (firebloom_ccpbkdf2_hmac(v15, v16, __src, 16, a1 + 96, *(void *)(a1 + 88), v11, v18))
      {
LABEL_20:
        uint64_t v14 = 4294967274;
        goto LABEL_24;
      }
LABEL_23:
      memcpy(a4, v18, v11);
      uint64_t v14 = 0;
      *a5 = v11;
      goto LABEL_24;
    }
    if (__n <= 0x20)
    {
      memcpy(v18, __src, __n);
      size_t v11 = __n;
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v14 = 0xFFFFFFFFLL;
    goto LABEL_24;
  }
LABEL_13:
  uint64_t v14 = 4294967284;
LABEL_24:
  memset_s(v18, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t _fv_decrypt_kek(uint64_t a1, uint64_t a2, unsigned int a3, void *a4, _DWORD *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*a5 != 32) {
    return 4294967285;
  }
  if (*(void *)a1 || *(unsigned __int8 *)(a1 + 29) > 1u) {
    return 4294967284;
  }
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    *a5 = 16;
    unsigned int v10 = 24;
  }
  else
  {
    unsigned int v10 = 40;
  }
  size_t v12 = v10;
  unsigned int v13 = MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v16 - v14;
  HIDWORD(v16) = 0;
  if (!rfc3394_unwrapped_size_legacy(v13, (unsigned int *)&v16 + 1) || HIDWORD(v16) > *a5) {
    return 4294967285;
  }
  memcpy(v15, (const void *)(a1 + 48), v12);
  if ((*(unsigned char *)(a1 + 24) & 1) != 0 && !needs_ctx()) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = rfc3394_unwrap_legacy(a2, a3, 0xA6A6A6A6A6A6A6A6, 0, v15, v12, a4, a5);
  if (result) {
    return 4294967291;
  }
  return result;
}

uint64_t _bind_unmanaged_vek(uint64_t a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4)
{
  unsigned int v11 = 0;
  if (!is_non_zero(a2, 32))
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s Internal Error: Null KEK, file radar%s\n", "aks", "", "", "", "_bind_unmanaged_vek");
    return 4294967286;
  }
  if (!is_non_zero(a4, 32))
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s%s:%s%s%s%s%u:%s%u:%s Internal Error: Null VEK, file radar%s\n", "aks", "", "", "", "_bind_unmanaged_vek");
    return 4294967286;
  }
  if (*(void *)(a1 + 8)) {
    return 4294967284;
  }
  int v9 = rfc3394_wrapped_size_legacy(0x20u, &v11);
  uint64_t result = 4294967285;
  if (v9 && v11 <= 0x28)
  {
    if (!rfc3394_wrap_legacy((uint64_t)a2, a3, 0xA6A6A6A6A6A6A6A6, 0, (uint64_t *)a4, 0x20u, (void *)(a1 + 56), &v11))
    {
      int v10 = *(_DWORD *)(a1 + 32);
      if ((v10 & 1) == 0)
      {
LABEL_11:
        uint64_t result = 0;
        *(_DWORD *)(a1 + 32) = v10 & 0xFFFFEFFF;
        return result;
      }
      if (needs_ctx())
      {
        int v10 = *(_DWORD *)(a1 + 32);
        goto LABEL_11;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t firebloom_cbc_update_f(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return MEMORY[0x270ED8840](a1, a2, a3, a4 >> 4);
}

uint64_t rfc3394_wrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unint64_t a6, void *a7, unint64_t *a8)
{
  uint64_t v41 = a1;
  uint64_t v42 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  uint64_t v14 = ccaes_cbc_encrypt_mode();
  MEMORY[0x270FA5388]();
  uint64_t v43 = (uint64_t)&v36 - v15;
  bzero((char *)&v36 - v15, v15);
  MEMORY[0x270FA5388]();
  uint64_t v17 = (char *)&v36 - v16;
  bzero((char *)&v36 - v16, v16);
  uint64_t v18 = 0xFFFFFFFFLL;
  if (HIDWORD(a6) || (a6 - 40) < 0xFFFFFFE0) {
    goto LABEL_30;
  }
  long long v39 = &v36;
  long long v40 = a8;
  long long v38 = a7;
  if (!a4)
  {
    BOOL v20 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v20 || !a8 || *a8 < a6 + 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_31;
    }
    unint64_t v37 = a6 + 8;
    cccbc_init();
    goto LABEL_15;
  }
  if (a8)
  {
    unint64_t v19 = *v40;
    unint64_t v37 = a6 + 8;
    if (v19 >= a6 + 8)
    {
LABEL_15:
      uint64_t v21 = 0;
      unsigned int v22 = a6 >> 3;
      if (a6 >> 3 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v22;
      }
      do
      {
        uint64_t v24 = *a5++;
        *((void *)&__s[v21++] + 1) = v24;
      }
      while (v23 != v21);
      uint64_t v25 = 0;
      *(void *)&__s[0] = v42;
      uint64_t v26 = 1;
      uint64_t v41 = v22;
      do
      {
        uint64_t v42 = v25;
        uint64_t v27 = 0;
        long long v28 = (uint64_t *)__s;
        do
        {
          if (a4)
          {
            if ((a4(1, &firebloom_null_iv, v28, v28, 16) & 1) == 0) {
              goto LABEL_6;
            }
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f(v14, v43, (uint64_t)v17, 0x10uLL);
          }
          uint64_t v29 = *v28;
          v28 += 2;
          unint64_t v30 = v29 ^ bswap64(v26 + v27++);
          *(void *)&__s[v27 % v22] = v30;
        }
        while (v23 != v27);
        uint64_t v25 = v42 + 1;
        v26 += v41;
      }
      while (v42 != 5);
      long long v31 = v38;
      *long long v38 = *(void *)&__s[0];
      long long v32 = v31 + 1;
      long long v33 = (uint64_t *)__s + 1;
      do
      {
        uint64_t v34 = *v33;
        v33 += 2;
        *v32++ = v34;
        --v23;
      }
      while (v23);
      uint64_t v18 = 0;
      unint64_t *v40 = v37 & 0xFFFFFFF8;
LABEL_30:
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      if (a4) {
        return v18;
      }
LABEL_31:
      cc_clear();
      return v18;
    }
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_wrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), uint64_t *a5, unsigned int a6, void *a7, _DWORD *a8)
{
  unint64_t v11 = *a8;
  uint64_t v9 = rfc3394_wrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_unwrap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, void *, unint64_t *, unint64_t *, uint64_t), void *a5, unint64_t a6, void *a7, void *a8)
{
  uint64_t v45 = a5;
  uint64_t v43 = a1;
  uint64_t v48 = *MEMORY[0x263EF8340];
  memset(__s, 0, sizeof(__s));
  uint64_t v14 = ccaes_cbc_decrypt_mode();
  MEMORY[0x270FA5388]();
  uint64_t v46 = (uint64_t)&v37 - v15;
  bzero((char *)&v37 - v15, v15);
  MEMORY[0x270FA5388]();
  uint64_t v17 = (char *)&v37 - v16;
  bzero((char *)&v37 - v16, v16);
  uint64_t v18 = 0xFFFFFFFFLL;
  if (HIDWORD(a6)) {
    goto LABEL_33;
  }
  uint64_t v39 = a3;
  unsigned int v19 = a6 >> 3;
  if ((a6 >> 3) - 6 < 0xFFFFFFFC) {
    goto LABEL_33;
  }
  long long v40 = &v37;
  uint64_t v41 = a8;
  long long v38 = a7;
  unint64_t v44 = a6;
  if (!a4)
  {
    BOOL v20 = (a2 & 0xFFFFFFFFFFFFFFF7) == 0x10 || a2 == 32;
    if (!v20 || !a8 || *a8 < a6 - 8)
    {
      memset_s(__s, 0x40uLL, 0, 0x40uLL);
      goto LABEL_34;
    }
    cccbc_init();
    goto LABEL_15;
  }
  if (a8 && *v41 >= v44 - 8)
  {
LABEL_15:
    *(void *)&__s[0] = *v45;
    uint64_t v21 = v19 - 1;
    if (v19 != 1)
    {
      unsigned int v22 = (void *)__s + 1;
      uint64_t v23 = v45 + 1;
      uint64_t v24 = v19 - 1;
      do
      {
        uint64_t v25 = *v23++;
        *unsigned int v22 = v25;
        v22 += 2;
        --v24;
      }
      while (v24);
    }
    int v26 = 6 * v19 - 6;
    LODWORD(v43) = 1 - v19;
    int v27 = 5;
    uint64_t v42 = (unint64_t *)&__s[v19 - 2];
    do
    {
      LODWORD(v45) = v27;
      if (v44 >= 0x10)
      {
        long long v28 = v42;
        int v29 = v21;
        unsigned int v30 = v26;
        do
        {
          *long long v28 = *(void *)&__s[v29 % v21] ^ bswap64(v30);
          if (a4)
          {
            if ((a4(0, &firebloom_null_iv, v28, v28, 16) & 1) == 0) {
              goto LABEL_6;
            }
          }
          else
          {
            cccbc_clear_iv();
            firebloom_cbc_update_f(v14, v46, (uint64_t)v17, 0x10uLL);
          }
          --v30;
          v28 -= 2;
          BOOL v31 = __OFSUB__(v29--, 1);
        }
        while (!((v29 < 0) ^ v31 | (v29 == 0)));
      }
      int v27 = v45 - 1;
      v26 += v43;
    }
    while (v45);
    if (*(void *)&__s[0] == v39)
    {
      long long v32 = v38;
      if (v21)
      {
        long long v33 = (uint64_t *)__s + 1;
        uint64_t v34 = v21;
        do
        {
          uint64_t v35 = *v33;
          v33 += 2;
          *v32++ = v35;
          --v34;
        }
        while (v34);
      }
      uint64_t v18 = 0;
      void *v41 = (8 * v21);
    }
    else
    {
      uint64_t v18 = 0xFFFFFFFFLL;
    }
LABEL_33:
    memset_s(__s, 0x40uLL, 0, 0x40uLL);
    if (a4) {
      return v18;
    }
LABEL_34:
    cc_clear();
    return v18;
  }
LABEL_6:
  memset_s(__s, 0x40uLL, 0, 0x40uLL);
  return 0xFFFFFFFFLL;
}

uint64_t rfc3394_unwrap_legacy(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(void, void *, unint64_t *, unint64_t *, uint64_t), void *a5, unsigned int a6, void *a7, _DWORD *a8)
{
  uint64_t v11 = *a8;
  uint64_t v9 = rfc3394_unwrap(a1, a2, a3, a4, a5, a6, a7, &v11);
  REQUIRE_func(HIDWORD(v11) == 0, 261, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/aeskeywrap.c");
  *a8 = v11;
  return v9;
}

uint64_t rfc3394_wrapped_size_legacy(unsigned int a1, _DWORD *a2)
{
  uint64_t v2 = a1 + 15;
  uint64_t v3 = v2 << 31 >> 31;
  BOOL v4 = v3 != v2 || v3 < 0;
  int v5 = v4;
  if (!v4) {
    *a2 = v3 & 0xFFFFFFF8;
  }
  return v5 ^ 1u;
}

BOOL rfc3394_unwrapped_size_legacy(unsigned int a1, unsigned int *a2)
{
  unsigned int v2 = a1 - 8;
  BOOL result = a1 > 7;
  *a2 = v2;
  return result;
}

BOOL rfc3394_unwrapped_size(unint64_t a1, unint64_t *a2)
{
  unint64_t v2 = a1 - 8;
  BOOL result = a1 > 7;
  *a2 = v2;
  return result;
}

void authapfs_valid_hash_type_cold_1(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 136315650;
  unint64_t v2 = "authapfs_valid_hash_type";
  __int16 v3 = 1024;
  int v4 = 50;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Invalid or unknown hash type: %d\n", (uint8_t *)&v1, 0x18u);
}

void io_get_device_features_cold_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: can't get solidstate for device (%s)\n", v2, v3, v4, v5, 2u);
}

void io_get_device_features_cold_2(_WORD *a1, unsigned int *a2, int a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = *a1 & 0xF000;
  unsigned int v4 = *a2;
  int v5 = 136316674;
  int v6 = "io_get_device_features";
  __int16 v7 = 1024;
  int v8 = 230;
  __int16 v9 = 1024;
  int v10 = a3;
  __int16 v11 = 1024;
  int v12 = v3;
  __int16 v13 = 1024;
  unsigned int v14 = v4;
  __int16 v15 = 1024;
  unsigned int v16 = HIBYTE(v4);
  __int16 v17 = 1024;
  int v18 = v4 & 0xFFFFFF;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: fd %d is type %o rdev %d (%d, %d): I/O registry entry not found\n", (uint8_t *)&v5, 0x30u);
}

void io_get_device_features_cold_3()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: can't get features for device (%s)\n", v2, v3, v4, v5, 2u);
}

void container_keybag_operation_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 528;
  v1[9] = 2080;
  uint64_t v2 = "APFS/container";
  __int16 v3 = v0;
  int v4 = 45;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: unable to wipe %s keybag (%d)\n", (uint8_t *)v1, 0x22u);
}

void container_keybag_operation_cold_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)__int16 v0 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v0[7] = 466;
  v0[9] = 2080;
  uint64_t v1 = "APFS/container";
  __int16 v2 = 2080;
  __int16 v3 = "";
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: malformed %s keybag%s\n", (uint8_t *)v0, 0x26u);
}

void apfs_keybag_init_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to initialize volume keybag, err = %d\n", v1, v2, v3, v4, 2u);
}

void apfs_keybag_init_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to get apfs volume keybag, err = %d\n", v1, v2, v3, v4, 2u);
}

void container_kb_get_cold_1()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3[0] = 136316418;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  __int16 v4 = 2048;
  uint64_t v5 = 16;
  __int16 v6 = v0;
  int v7 = v1;
  __int16 v8 = 2048;
  uint64_t v9 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %d >= %lu && %d <= %lu\n", (uint8_t *)v3, 0x32u);
}

void container_kb_get_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Checksum failure\n", v1, v2, v3, v4, 2u);
}

void container_kb_get_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: dev_read_data failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_keybag_load_class_keys_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: call to load volume class keys does not exist\n", v1, v2, v3, v4, 2u);
}

void apfs_keybag_load_class_keys_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 3350;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: successfully loaded volume class keys\n", (uint8_t *)v0, 0x12u);
}

void apfs_keybag_load_class_keys_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to load volume class keys, error = %x\n", v1, v2, v3, v4, 2u);
}

void apfs_keybag_load_class_keys_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to find volume key to load class keys, error = %d\n", v1, v2, v3, v4, 2u);
}

void apfs_keybag_load_class_keys_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to find unlock record to load class keys, error = %d\n", v1, v2, v3, v4, 2u);
}

void apfs_keybag_unlock_record_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to unwrap volume key, err = %d\n", v1, v2, v3, v4, 2u);
}

void apfs_keybag_unlock_record_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to unwrap proposed volume key, err = %d\n", v1, v2, v3, v4, 2u);
}

void apfs_keybag_unlock_record_tag_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to unwrap volume key, err = 0x%x (tag = %u)\n", (uint8_t *)v2, 0x1Eu);
}

void apfs_is_dir_empty_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 8);
  int v4 = 136316162;
  uint64_t v5 = "apfs_is_dir_empty";
  __int16 v6 = 1024;
  int v7 = 115;
  __int16 v8 = 2080;
  uint64_t v9 = a1 + 3832;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  __int16 v12 = 1024;
  int v13 = a3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Failed to iterate directory %lld, error %d\n", (uint8_t *)&v4, 0x2Cu);
}

void apfs_set_file_size_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v3 = "no";
  __int16 v4 = *(_WORD *)(a2 + 104);
  __int16 v6 = "apfs_set_file_size";
  __int16 v7 = 1024;
  int v5 = 136316162;
  int v8 = 358;
  if ((v4 & 0xF000) == 0x8000) {
    uint64_t v3 = "yes";
  }
  __int16 v9 = 2080;
  uint64_t v10 = a1 + 3832;
  __int16 v11 = 2048;
  uint64_t v12 = v2;
  __int16 v13 = 2080;
  uint64_t v14 = v3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to create dstream on ino %lld (isreg: %s)\n", (uint8_t *)&v5, 0x30u);
}

void doc_id_tree_create_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s doc-id tree creation failed: %d\n", v1, v2, v3, v4, v5);
}

void doc_id_tree_destroy_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, v5);
}

void doc_id_tree_destroy_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, 2u);
}

void doc_id_tree_destroy_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, 2u);
}

void doc_id_tree_destroy_cold_4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 175;
  v1[9] = 2080;
  uint64_t v2 = v0;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s not enough space to enter transaction\n", (uint8_t *)v1, 0x1Cu);
}

void doc_id_tree_destroy_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, 2u);
}

void doc_id_tree_destroy_cold_6()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136315906;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v3[7] = 155;
  v3[9] = 2080;
  uint64_t v4 = v0;
  __int16 v5 = v1;
  int v6 = v2;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s stop background work requested, stopping tree destroy, prev %d\n", (uint8_t *)v3, 0x22u);
}

void doc_id_tree_destroy_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, v5);
}

void doc_id_tree_destroy_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, v5);
}

void doc_id_tree_destroy_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get doc-id tree, error %d\n", v1, v2, v3, v4, v5);
}

void doc_id_tree_destroy_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get doc-id tree key count, error %d\n", v1, v2, v3, v4, v5);
}

void doc_id_tree_destroy_cold_11(uint64_t a1, uint64_t *a2)
{
  obj_type(*a2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s unsupported tree type, %d\n", v3, v4, v5, v6, 2u);
}

void userfs_data_cryptor_cold_1(char a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = "Decryption";
  uint64_t v4 = "userfs_data_cryptor";
  int v6 = 200;
  __int16 v7 = 2080;
  int v3 = 136315906;
  __int16 v5 = 1024;
  if (a1) {
    uint64_t v2 = "Encryption";
  }
  int v8 = v2;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed (E%d)\n", (uint8_t *)&v3, 0x22u);
}

void userfs_data_cryptor_cold_2(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 136315650;
  uint64_t v2 = "userfs_data_cryptor";
  __int16 v3 = 1024;
  int v4 = 174;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: CCCryptorCreateWithMode failed (E%d)\n", (uint8_t *)&v1, 0x18u);
}

void AKS_FV_service_cold_1(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 136315650;
  uint64_t v2 = "AKS_FV_service";
  __int16 v3 = 1024;
  int v4 = 234;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: lib_get_file_vault_services failed (E%d)\n", (uint8_t *)&v1, 0x18u);
}

void userfs_meta_crypto_state_unwrap_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 400);
  int v2 = 136315906;
  __int16 v3 = "userfs_meta_crypto_state_unwrap";
  __int16 v4 = 1024;
  int v5 = 262;
  __int16 v6 = 2080;
  uint64_t v7 = a1 + 3832;
  __int16 v8 = 2080;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Failed to unlock volume '%s'\n", (uint8_t *)&v2, 0x26u);
}

void btree_node_check_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  v0[0] = 136315650;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s btree_node is null\n", (uint8_t *)v0, 0x1Cu);
}

void btree_node_check_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s btree_node is null\n", (uint8_t *)v0, 0x1Cu);
}

void btree_node_check_cold_3(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): non-leaf node has no children?\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_4(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): non-leaf node has no children?\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_5(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): node's max key is not less than next sibling's entry in parent\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_6(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): node's max key is not less than next sibling's entry in parent\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_7()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_0(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_14(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key %d compare error: %d\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_8()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_0(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_14(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): can't get key %d: %d\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_9(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): minkey not correct\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_10(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): minkey not correct\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_11(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): minkey not in sync\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_12(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): minkey not in sync\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_13()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_0(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): minkey compare error: %d\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_14()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5_0(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): can't get key %d: %d\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_15(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): table space length smaller than minimum\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_16(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): table space length smaller than minimum\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_17(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key count larger than TOC space\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_18(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key count larger than TOC space\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_19(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): invalid key offset\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_20(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): invalid key offset\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_21(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): val location extends beyond val space\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_22(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): val location extends beyond val space\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_23(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): invalid val offset has non-zero length\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_24(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): invalid val offset has non-zero length\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_25(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): invalid key offset\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_26(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): invalid key offset\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_27(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): val location extends beyond val space\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_28(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): val location extends beyond val space\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_29(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): tree says kv sizes are fixed, but leaf says kv size is variable\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_30(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): tree says kv sizes are fixed, but leaf says kv size is variable\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_31(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): node says kv size is fixed, but tree says val size is variable\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_32(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): node says kv size is fixed, but tree says val size is variable\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_33(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): tree says key size is fixed, but node says kv size is variable\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_34(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): tree says key size is fixed, but node says kv size is variable\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_35(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): node says kv size is fixed, but tree says key size is variable\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_36(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): node says kv size is fixed, but tree says key size is variable\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_37(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): val free list entry extends beyond val space available\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_38(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): val free list entry extends beyond val space available\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_39(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): val free list entry overlaps with other free space\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_40(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): val free list entry overlaps with other free space\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_41(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry len value too small\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_42(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry len value too small\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_43(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry starts beyond key space available\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_44(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry starts beyond key space available\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_45(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry extends beyond key space available\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_46(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry extends beyond key space available\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_47(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry overlaps with other free space\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_48(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry overlaps with other free space\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_49(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key free list entry len value too small\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_50(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key free list entry len value too small\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_51(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): couldn't allocate bitmap to check btree node space usage\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_52(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): couldn't allocate bitmap to check btree node space usage\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_53(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): val free list head beyond end of node\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_54(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): val free list head beyond end of node\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_55(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): val free list head beyond val space available\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_56(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): val free list head beyond val space available\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_57(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): val free list space larger than val space available\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_58(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): val free list space larger than val space available\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_59(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key free list head beyond key space available\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_60(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key free list head beyond key space available\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_61(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key free list space larger than key space available\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_62(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key free list space larger than key space available\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_63(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): invalid vals[] pointer\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_64(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): invalid vals[] pointer\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_65(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): invalid vals[] pointer\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_66(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): invalid vals[] pointer\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_67(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): invalid keys[] pointer\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_68(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): invalid keys[] pointer\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_69(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): invalid TOC[] pointer\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_70(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): invalid TOC[] pointer\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_71(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key count larger than gross key space\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_72(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key count larger than gross key space\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_73(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): key count larger than possible\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_74(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): key count larger than possible\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_75(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): free space extends beyond end of node\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_76(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): free space extends beyond end of node\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_77(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): free space offset too large\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_78(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): free space offset too large\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_79(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): table space length larger than available data space\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_80(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): table space length larger than available data space\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_81(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): invalid table space offset\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_82(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): invalid table space offset\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_83(uint64_t a1)
{
  OUTLINED_FUNCTION_5_0(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): node level greater than root level %d\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_84(uint64_t a1)
{
  OUTLINED_FUNCTION_2_1(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s oid 0x%llx (level %d): leaf node has non-zero level\n", v2, v3, v4, v5, 2u);
}

void btree_node_check_cold_85(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_3_2(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s oid 0x%llx (level %d): leaf node has non-zero level\n", v3, v4, v5, v6, 2u);
}

void btree_node_check_cold_86(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(*(void *)(*(void *)a1 + 392) + 384) + 208;
  uint64_t v6 = obj_oid(a1);
  LODWORD(a2) = *(unsigned __int16 *)(*(void *)a2 + 34);
  obj_oid(a3);
  v10[0] = 136316674;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13();
  uint64_t v11 = v5;
  __int16 v12 = 2048;
  uint64_t v13 = v6;
  __int16 v14 = v7;
  int v15 = a2;
  __int16 v16 = 2048;
  uint64_t v17 = v8;
  __int16 v18 = v7;
  int v19 = v9;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s oid 0x%llx (level %d): root node has a parent 0x%llx (level %d)\n", (uint8_t *)v10, 0x3Cu);
}

void btree_check_ext_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_5_0(a1, *MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v6 = 136316418;
  OUTLINED_FUNCTION_11();
  *(_DWORD *)&v6[7] = 681;
  v6[9] = 2080;
  uint64_t v7 = v1;
  __int16 v8 = 2048;
  uint64_t v9 = v2;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  __int16 v12 = v4;
  int v13 = v5;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s oid 0x%llx: btree key count (%llu) doesn't match # leaf entries (%u)\n", (uint8_t *)v6, 0x36u);
}

void btree_check_ext_cold_2()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  v2[0] = 136315906;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13();
  uint64_t v3 = v0;
  __int16 v4 = v1;
  int v5 = 22;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s btree check called with non-root btree node: %d\n", (uint8_t *)v2, 0x22u);
}

void btree_check_ext_cold_3()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315906;
  uint64_t v3 = "btree_check_ext";
  __int16 v4 = 1024;
  OUTLINED_FUNCTION_13();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  int v7 = 22;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s btree check called with non-root btree node: %d\n", (uint8_t *)&v2, 0x22u);
}

void btree_check_recent_sanity_cold_1(uint64_t a1, int a2, uint64_t a3)
{
  obj_oid(*(void *)(a3 + 16 * a2 - 16));
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s node 0x%llx (level %d) index %d: more levels than expected\n", v4, v5, v6, v7, 2u);
}

void btree_check_recent_sanity_cold_2(uint64_t a1, int a2, uint64_t a3)
{
  obj_oid(*(void *)(a3 + 16 * a2 - 16));
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s node 0x%llx (level %d) index %d: more levels than expected\n", v4, v5, v6, v7, 2u);
}

void gbitmap_reap_cold_1(uint64_t *a1)
{
  obj_oid(*a1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s Tree delete oid %llu threw %d\n", v2, v3, v4, v5, 2u);
}

void gbitmap_reap_cold_2(uint64_t a1, uint64_t *a2)
{
  obj_oid(*a2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Tree delete oid %llu threw %d\n", v3, v4, v5, v6, 2u);
}

void gbitmap_reap_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void gbitmap_reap_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void gbitmap_reap_cold_5()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315906;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Can't get tree: %d\n", (uint8_t *)v0, 0x22u);
}

void gbitmap_reap_cold_6()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315906;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Can't get tree: %d\n", (uint8_t *)v0, 0x22u);
}

void gbitmap_reap_cold_7(uint64_t a1)
{
  obj_oid(a1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s obj_modify(fs %lld) failed: %d\n", v2, v3, v4, v5, 2u);
}

void gbitmap_reap_cold_8(uint64_t a1)
{
  obj_oid(a1);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s obj_modify(fs %lld) failed: %d\n", v2, v3, v4, v5, 2u);
}

void should_embed_xattr_cold_1(int a1, int a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = 136316162;
  uint64_t v4 = "should_embed_xattr";
  __int16 v5 = 1024;
  int v6 = 326;
  __int16 v7 = 1024;
  int v8 = a1;
  __int16 v9 = 1024;
  int v10 = a2;
  __int16 v11 = 1024;
  int v12 = a3;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: error, %d, when checking tree entry size %u, %u\n", (uint8_t *)&v3, 0x24u);
}

void alloc_xattr_tmp_ino_cold_1()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't remove xattr inode %llu from disk, %d\n", v1, v2, v3, v4, 2u);
}

void alloc_xattr_tmp_ino_cold_2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136315906;
  OUTLINED_FUNCTION_11();
  *(_DWORD *)&v2[7] = 756;
  v2[9] = 2080;
  uint64_t v3 = v0;
  __int16 v4 = 2048;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s couldn't find drec for ino %llu\n", (uint8_t *)v2, 0x26u);
}

void alloc_xattr_tmp_ino_cold_3()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't remove drec ino %llu, err %d\n", v1, v2, v3, v4, 2u);
}

void alloc_xattr_tmp_ino_cold_4()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to decrement dstream_id for deletion for ino %llu, err %d\n", v1, v2, v3, v4, 2u);
}

void alloc_xattr_tmp_ino_cold_5()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 136316162;
  OUTLINED_FUNCTION_11();
  *(_DWORD *)&v3[7] = 713;
  v3[9] = 2080;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s cannot allocate %llu bytes under %llu\n", (uint8_t *)v3, 0x30u);
}

void alloc_xattr_tmp_ino_cold_6()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136316162;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s failed to create temporary inode under %llu with %d\n", (uint8_t *)v0, 0x2Cu);
}

void fs_insert_snapshot_metadata_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Inserting snap_name failed, %d\n", v1, v2, v3, v4, v5);
}

void fs_insert_snapshot_metadata_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Inserting snap_meta failed, %d\n", v1, v2, v3, v4, v5);
}

void fs_lookup_snapshot_metadata_by_xid_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't find snap_meta for xid %llu: %d\n", v1, v2, v3, v4, 2u);
}

void fs_remove_snapshot_metadata_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to remove snap_meta record!\n", v1, v2, v3, v4, v5);
}

void fs_remove_snapshot_metadata_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to remove snap_name record!\n", v1, v2, v3, v4, v5);
}

void fs_remove_snapshot_metadata_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't find name for snap_xid %llu\n", v1, v2, v3, v4, 2u);
}

void fs_rename_snapshot_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fs_update_snap_metadata() returned %d\n", v1, v2, v3, v4, v5);
}

void fs_rename_snapshot_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s remove_jobj(old-snap-name) returned %d\n", v1, v2, v3, v4, v5);
}

void revert_extents_to_snapshot_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s free'ing extents in main extentref tree %lld\n", v1, v2, v3, v4, 2u);
}

void revert_extents_to_snapshot_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fs extentref tree creation failed: %d\n", v1, v2, v3, v4, v5);
}

void create_empty_extentref_tree_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tree creation failed: %d\n", v1, v2, v3, v4, v5);
}

void free_allocated_snapshot_extents_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s processed %d extents and free'd %lld blocks\n", v1, v2, v3, v4, 2u);
}

void free_allocated_snapshot_extents_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get the snapshot blockref tree for delta_tree_oid %lld!\n", v1, v2, v3, v4, 2u);
}

void revert_to_snapshot_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DONE reverting to snapshot w/xid %lld\n", v1, v2, v3, v4, 2u);
}

void revert_to_snapshot_cold_2()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s waiting for snapshot deletion to finish (id %lld) failed: %d\n", v1, v2, v3, v4, v5);
}

void revert_to_snapshot_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to check if doc-id index is stale (error %d)\n", v1, v2, v3, v4, v5);
}

void revert_to_snapshot_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to mark doc-id index for rebuild (error %d)\n", v1, v2, v3, v4, v5);
}

void revert_to_snapshot_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to modify the apfs object (err %d) to be able to revert the fs.\n", v1, v2, v3, v4, v5);
}

void revert_to_snapshot_cold_6()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s could not start txn to revert to snapshot w/xid %lld : txerr %d\n", v1, v2, v3, v4, 2u);
}

void revert_to_snapshot_cold_7()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136316162;
  uint64_t v3 = "revert_to_snapshot";
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14_0();
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s Reverting to snapshot w/xid %lld and old sblock oid %lld.\n", (uint8_t *)&v2, 0x30u);
}

void revert_to_snapshot_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s must mount read-write after revert to unsealed snapshot\n", v1, v2, v3, v4, v5);
}

void revert_to_snapshot_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s could not locate old super block w/sblock_oid %lld\n", v1, v2, v3, v4, 2u);
}

void revert_to_snapshot_cold_10()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s was asked to revert to snapshot w/xid %llu but got error %d\n", v1, v2, v3, v4, 2u);
}

void revert_to_snapshot_cold_11()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s volume was marked for revert while mounted RO, skip revert to xid %lld\n", v1, v2, v3, v4, 2u);
}

void move_snapshot_to_purgatory_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  int v4 = 1865;
  __int16 v5 = 2080;
  uint64_t v6 = v0;
  __int16 v7 = 2048;
  uint64_t v8 = v1;
  __int16 v9 = 2080;
  uint64_t v10 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Couldn't rename snap %llx to %s\n", v3, 0x30u);
}

void orphan_snap_check_iterator_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't move snap xid %llu to purgatory, err %d\n", v1, v2, v3, v4, v5);
}

void orphan_snap_check_iterator_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s snap xid %llu is an orphan... moving it to purgatory\n", v1, v2, v3, v4, 2u);
}

void orphan_snap_check_iterator_cold_3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s find_next_snap(%llu) returned %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_cold_1()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s omap check failed with error: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_cold_2()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get omap: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_cold_3()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s reaper check failed with error: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_cold_4()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get reap list head: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_cold_5()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get reaper: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_cold_6()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_omap_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_omap_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_cold_1()
{
  OUTLINED_FUNCTION_6_0(*MEMORY[0x263EF8340]);
  int v0 = 136316162;
  uint64_t v1 = "nx_check_recent_sanity";
  __int16 v2 = 1024;
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s omap check failed for omap %lld: %d\n", (uint8_t *)&v0, 0x2Cu);
}

void nx_check_recent_sanity_cold_2()
{
  OUTLINED_FUNCTION_6_0(*MEMORY[0x263EF8340]);
  int v0 = 136316162;
  uint64_t v1 = "nx_check_recent_sanity";
  __int16 v2 = 1024;
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s unable to get omap %lld: %d\n", (uint8_t *)&v0, 0x2Cu);
}

void nx_check_recent_sanity_cold_3()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s omap check failed with error: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_cold_4()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get omap: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_cold_5()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_omap_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get omap snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_omap_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get omap snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_omap_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get omap tree: %d\n", v1, v2, v3, v4, 2u);
}

void nx_check_recent_sanity_omap_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get omap tree: %d\n", v1, v2, v3, v4, 2u);
}

void nx_corruption_detected_int_cold_1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v3[7] = 39;
  v3[9] = 2080;
  uint64_t v4 = v0;
  __int16 v5 = v1;
  int v6 = v2;
  _os_log_fault_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s:%d: Container corruption detected by %s:%u!\n", (uint8_t *)v3, 0x22u);
}

void nx_corruption_detected_int_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 384) + 208;
  int v4 = 136316162;
  __int16 v5 = "nx_corruption_detected_int";
  __int16 v6 = 1024;
  int v7 = 37;
  __int16 v8 = 2080;
  uint64_t v9 = v3;
  __int16 v10 = 2080;
  uint64_t v11 = a2;
  __int16 v12 = 1024;
  int v13 = a3;
  _os_log_fault_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s:%d: %s Container corruption detected by %s:%u!\n", (uint8_t *)&v4, 0x2Cu);
}

void obj_checksum_verify_phys_cold_1(uint64_t *a1, uint64_t *a2, int a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = *((_DWORD *)a1 + 6);
  int v6 = *((_DWORD *)a1 + 7);
  int v7 = 136316674;
  __int16 v8 = "obj_checksum_verify_phys";
  __int16 v9 = 1024;
  int v10 = 52;
  __int16 v11 = 2048;
  uint64_t v12 = v3;
  __int16 v13 = 2048;
  uint64_t v14 = v4;
  __int16 v15 = 1024;
  int v16 = v5;
  __int16 v17 = 1024;
  int v18 = v6;
  __int16 v19 = 1024;
  int v20 = a3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed: cksum 0x%016llx, oid 0x%llx, type 0x%x/0x%x, size %d\n", (uint8_t *)&v7, 0x38u);
}

void apfs_release_objects_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 319;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: obj is NULL or not apfs object!", (uint8_t *)v0, 0x12u);
}

void apfs_release_objects_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ROSV: failed to delete shadow fs_root: %d\n", v1, v2, v3, v4, v5);
}

void apfs_release_objects_cold_3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 324;
  v1[9] = 2080;
  uint64_t v2 = v0;
  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s ROSV: Deleting the shadow_fs_root tree 0x%llx\n", (uint8_t *)v1, 0x26u);
}

void apfs_reap_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bogus phase, %u\n", v1, v2, v3, v4, v5);
}

void apfs_reap_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s omap_destroy returned %d!\n", v1, v2, v3, v4, v5);
}

void apfs_reap_cold_3(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s supplemental_tree_destroy(pfkur_tree) failed: %d (%s)\n", v3, v4, v5, v6, 2u);
}

void apfs_reap_cold_4(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s supplemental_tree_destroy(fext_tree) failed: %d (%s)\n", v3, v4, v5, v6, 2u);
}

void apfs_reap_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to modify the apfs_t before reaping (error %d).\n", v1, v2, v3, v4, v5);
}

void apfs_checkpoint_traverse_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136316162;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s omap checkpoint traverse (op %d) failed: %d\n", (uint8_t *)v2, 0x28u);
}

void apfs_checkpoint_traverse_cold_2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get omap %lld: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_update_cow_exempt_file_count_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed with err %d while getting the cow-exempt-file-count xattr on the root dir\n", v1, v2, v3, v4, v5);
}

void apfs_update_cow_exempt_file_count_cold_2()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136316162;
  OUTLINED_FUNCTION_8_0();
  *(_DWORD *)&v3[7] = 1433;
  v3[9] = 2080;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_7_1();
  __int16 v5 = v1;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s COW exempt file count underflow: %lld (delta %lld).  capping to zero.\n", (uint8_t *)v3, 0x30u);
}

void apfs_update_cow_exempt_file_count_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to add initial cow-exempt-count xattr! err %d\n", v1, v2, v3, v4, v5);
}

void apfs_create_doc_id_tree_if_needed_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 1512;
  v1[9] = 2080;
  uint64_t v2 = v0;
  OUTLINED_FUNCTION_7_1();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s created doc-id tree, oid %llu\n", (uint8_t *)v1, 0x26u);
}

void apfs_create_doc_id_tree_if_needed_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to create doc-id tree, error %d\n", v1, v2, v3, v4, v5);
}

void apfs_reap_snapshots_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Hit %d looking up first snapshot\n", v1, v2, v3, v4, v5);
}

void apfs_reap_snapshots_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s lookup_next_snapshot() returned %d\n", v1, v2, v3, v4, v5);
}

void apfs_reap_snapshots_cold_3()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't find snapshot metadata for xid %llu\n", v1, v2, v3, v4, v5);
}

void apfs_reap_extentref_blocks_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s iter_next returned %d\n", v1, v2, v3, v4, 2u);
}

void apfs_reap_extentref_blocks_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tree_iter_init() returned %d\n", v1, v2, v3, v4, v5);
}

void apfs_reap_extentref_blocks_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: apfs_get_extentref_tree(oid=%llu) returned %d\n", v1, v2, v3, v4, 2u);
}

void scandir_strstr_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v2[7] = 283;
  v2[9] = v0;
  int v3 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Failed to find substring in input name, error %d\n", (uint8_t *)v2, 0x18u);
}

void scandir_strstr_cold_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v2[7] = 254;
  v2[9] = v0;
  int v3 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Failed to normalizeOptCaseFold substring, error %d\n", (uint8_t *)v2, 0x18u);
}

void userfs_process_dirent_cb_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 496;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: no memory for a new directory entry\n", (uint8_t *)v0, 0x12u);
}

void userfs_process_dirent_cb_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 485;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: no memory for a new directory entry\n", (uint8_t *)v0, 0x12u);
}

void userfs_process_dirent_cb_cold_3(uint64_t *a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315906;
  uint64_t v4 = "userfs_process_dirent_cb";
  __int16 v5 = 1024;
  int v6 = 459;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to load inode %llu (error %d), skipping entry\n", (uint8_t *)&v3, 0x22u);
}

void add_entry_to_dir_stack_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to allocate %d dir stack entries (%zu bytes)\n", v1, v2, v3, v4, 2u);
}

void jobj_release_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: *** Can't release unknown obj type %d\n", v1, v2, v3, v4, 2u);
}

void apfs_unlock_id_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: unlocking id %llu, which is not locked\n", v1, v2, v3, v4, 2u);
}

void make_jkey_from_jobj_cold_1()
{
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ***: expanded obj type %d (obj_id %llu) found on unsupported volume\n", v1, v2, v3, v4, 2u);
}

void make_jkey_from_jobj_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_55(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ***: expanded type seen on in-memory obj!\n", v1, v2, v3, v4, v5);
}

void make_jkey_from_jobj_cold_3()
{
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Cannot make large jkey from unknown type %d (obj_id %llu)\n", v1, v2, v3, v4, 2u);
}

void jobj_to_key_val_cold_1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s expanded obj type %hhu found on unsupported volume\n", v1, v2, v3, v4, 2u);
}

void jobj_to_key_val_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s large key size (%u) on record (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_to_key_val_cold_3()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to serialize purgeable %llu into jval of size %u\n", v1, v2, v3, v4, v5);
}

void jobj_to_key_val_cold_4()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to serialize dir-stats %lld into jval of size %u\n", v1, v2, v3, v4, v5);
}

void jobj_to_key_val_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_78();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x28u);
}

void jobj_to_key_val_cold_6()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to serialize ino %lld into jval of size %u\n", v1, v2, v3, v4, v5);
}

void jobj_to_key_val_cold_7()
{
  OUTLINED_FUNCTION_89(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to serialize drec %lld/%s into jval of size %u\n", v1, v2, v3, v4, 2u);
}

void jobj_to_key_val_cold_8()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to serialize file info with obj_id <%lld> into jval of size <%u>\n", v1, v2, v3, v4, v5);
}

void jobj_to_key_val_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_55(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ***: expanded type seen on in-memory obj!\n", v1, v2, v3, v4, v5);
}

void key_size_for_jobj_cold_1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_63(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ***: expanded obj type %d found on unsupported volume\n", v1, v2, v3, v4, 2u);
}

void key_size_for_jobj_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: ***: unknown obj type %d\n", v1, v2, v3, v4, 2u);
}

void key_size_for_jobj_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_55(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ***: expanded type seen on in-memory obj!\n", v1, v2, v3, v4, v5);
}

void val_size_for_jobj_cold_1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_63(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ***: expanded obj type %d found on unsupported volume\n", v1, v2, v3, v4, 2u);
}

void val_size_for_jobj_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: ***: unknown obj type %d\n", v1, v2, v3, v4, 2u);
}

void val_size_for_jobj_cold_3()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Unknown subtype %d for file info object %lld\n", v1, v2, v3, v4, 2u);
}

void val_size_for_jobj_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ***: expanded type seen on in-memory obj\n", v1, v2, v3, v4, v5);
}

void jobj_validate_key_val_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s key size (%zu) on expanded record (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_validate_large_key_val_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ***: expanded obj type found on unsupported volume\n", v1, v2, v3, v4, v5);
}

void jobj_validate_large_key_val_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s value size (%zu) on unknown record (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_validate_large_key_val_cold_3()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s key size (%zu) on purgeable record (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_validate_large_key_val_cold_4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s value size (%zu) on purgeable record (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_validate_large_key_val_cold_5()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s key size (%zu) on purgeable tombstone (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_validate_large_key_val_cold_6()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s value size (%zu) on purgeable tombstone (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_validate_large_key_val_cold_7()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s value size (%zu) on dir stats (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_validate_large_key_val_cold_8()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s key size (%zu) on clone mapping (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void jobj_validate_large_key_val_cold_9()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s value size (%zu) on clone mapping (%llu) is too small\n", v1, v2, v3, v4, 2u);
}

void fs_destroy_shadow_fs_root_tree_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Shadow fs_root does not exist\n", v1, v2, v3, v4, v5);
}

void fs_destroy_shadow_fs_root_tree_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Deleted the shadow_fs_root tree %p\n", v1, v2, v3, v4, 2u);
}

void fs_obj_create_name_checked_cold_1()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged to maintain dir-stats but has no dir-stats key\n", v1, v2, v3, v4, 2u);
}

void fs_obj_create_name_checked_cold_2()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s *** failed to set rdev as an extended field of ino %lld (ret %d)\n", v1, v2, v3, v4, v5);
}

void jobj_refcnt_merge_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: don't know how to merge refcounts on objects of type %d\n", v1, v2, v3, v4, 2u);
}

void jobj_refcnt_merge_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: don't know how to merge refcounts on objects of file info type %llu\n", v1, v2, v3, v4, 2u);
}

void jobj_refcnt_merge_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: don't know how to merge refcounts on objects of expanded type %d\n", v1, v2, v3, v4, 2u);
}

void jobj_refcnt_merge_cold_4()
{
  OUTLINED_FUNCTION_97(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fixing DIR_STATS_IS_SHADOW flag for dir-stats %llu\n", v1, v2, v3, v4, 2u);
}

void jobj_refcnt_merge_cold_5(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_51(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s could not update purgeable rsrc size for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void jobj_refcnt_merge_cold_6(int a1, int a2, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s could not update purgeable rsrc size for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void jobj_refcnt_merge_cold_7(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_51(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s could not update purgeable size for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void jobj_refcnt_merge_cold_8(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_51(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s could not update clone size for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void jobj_refcnt_merge_cold_9(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_77(a3, *MEMORY[0x263EF8340]);
  v3[0] = 136316674;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_47();
  _os_log_fault_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s:%d: %s clone mapping <%llu, %llu>: failed to update attribution tag: %s (%d)\n", (uint8_t *)v3, 0x40u);
}

void jobj_refcnt_merge_cold_10(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_77(a3, *MEMORY[0x263EF8340]);
  v3[0] = 136316674;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_47();
  _os_log_fault_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s:%d: %s clone mapping <%llu, %llu>: failed to update dir-stats key: %s (%d)\n", (uint8_t *)v3, 0x40u);
}

void match_jobj_type_to_tree_type_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s expanded obj type %hhu found on unsupported volume\n", v1, v2, v3, v4, v5);
}

void insert_jobj_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to insert fext in fext_tree: %d\n", v1, v2, v3, v4, v5);
}

void insert_jobj_cold_2()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s X %d\n", v1, v2, v3, v4, 2u);
}

void update_jobj_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fext_tree_update returned %d\n", v1, v2, v3, v4, v5);
}

void remove_jobj_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fext_tree_remove returned %d\n", v1, v2, v3, v4, v5);
}

void key_val_to_jobj_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: *** unknown obj type %d\n", v1, v2, v3, v4, 2u);
}

void key_val_to_jobj_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: *** Can't allocate unknown obj type %d\n", v1, v2, v3, v4, 2u);
}

void key_val_to_jobj_cold_3()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_32(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to init extended fields on inode %lld from blob (xfret %d).\n", v1, v2, v3, v4, 2u);
}

void key_val_to_jobj_cold_4()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to init extended fields on drec %lld from blob.\n", v1, v2, v3, v4, 2u);
}

void key_val_to_jobj_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, a3, "%s:%d: %s size (%d) of FILE_INFO_TAG_EXT_TYPE_SIGNING_ID in attribution tag record with s_hash <%llu> <= 0 \n", a5, a6, a7, a8, 2u);
}

void key_val_to_jobj_cold_6(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: failed to init extended fields on attribution tag record with objid <%lld> from blob due to error <%d> %s\n", v3, v4, v5, v6, 2u);
}

void key_val_to_jobj_cold_7()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136316418;
  uint64_t v3 = "key_val_to_jobj";
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_6();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  __int16 v6 = v0;
  uint64_t v7 = 26;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s s_hash <%llu> finfo attribution tag value <%zu> is less than sizeof(j_file_attribution_tag_val_t) <%lu\n", (uint8_t *)&v2, 0x3Au);
}

void key_val_to_jobj_cold_8()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s cannot translate key-val (%llu) into valid jobj\n", v1, v2, v3, v4, 2u);
}

void key_val_to_jobj_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: *** Unknown file info type %llu\n", v1, v2, v3, v4, 2u);
}

void key_val_to_jobj_cold_10()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315906;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_80();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: unknown expanded type (%hhu) on record (%u)\n", (uint8_t *)v0, 0x1Eu);
}

void key_val_to_jobj_cold_11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_63(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s *** unknown expanded obj type %hhu\n", v1, v2, v3, v4, v5);
}

void large_key_val_to_jobj_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unknown expanded type (%hhu) on record (%u)\n", v1, v2, v3, v4, 2u);
}

void large_key_val_to_jobj_cold_2()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to init extended fields on purgeable %llu from blob\n", v1, v2, v3, v4, 2u);
}

void large_key_val_to_jobj_cold_3()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to init extended fields on dir-stats %llu from blob\n", v1, v2, v3, v4, 2u);
}

void large_key_val_to_jobj_cold_4()
{
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to init extended fields on clone mapping <%llu/%llu> from blob\n", v1, v2, v3, v4, 2u);
}

void update_file_extent_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fext_tree_update returned %d\n", v1, v2, v3, v4, v5);
}

void apfs_update_phys_range_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s invalid ref count %d for non NULL zero ref tree\n", v1, v2, v3, v4, v5);
}

void apfs_update_phys_range_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s invalid zero len, paddr %llu\n", v1, v2, v3, v4, 2u);
}

void apfs_update_phys_range_cold_3(int a1)
{
  strerror(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s failed to get next physical extent, error %s(%d)\n", v2, v3, v4, v5, 2u);
}

void apfs_update_phys_range_cold_4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tree_remove(%llu) failed\n", v1, v2, v3, v4, 2u);
}

void apfs_update_phys_range_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tree_remove(%llu) failed\n", v1, v2, v3, v4, 2u);
}

void insert_phys_extent_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't insert extent, err=%d\n", v1, v2, v3, v4, v5);
}

void insert_phys_extent_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s key.hdr.kind != NEW && numsnapshots == 0\n", v1, v2, v3, v4, v5);
}

void insert_phys_extent_cold_3()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't remove extent at pbn %llu, err=%d\n", v1, v2, v3, v4, 2u);
}

void insert_phys_extent_cold_4()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't remove extent at pbn %llu, err=%d\n", v1, v2, v3, v4, 2u);
}

void jobj_type_from_possibly_large_key_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_55(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s expanded record found on unsupported volume\n", v1, v2, v3, v4, v5);
}

void get_new_crypto_id_cold_1()
{
  OUTLINED_FUNCTION_18();
  if (!v0) {
    panic("assertion failed: %s", "ino");
  }
  panic("assertion failed: %s", "ino_has_vnode(ino)");
}

#error "22CB487C0: call analysis failed (funcsize=22)"

void cp_get_ek2_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: cannot get ino %llu ek %llu, %d\n", v1, v2, v3, v4, 2u);
}

void cp_get_ek2_cold_2()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_32(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: cannot get ino %llu ekwk %d\n", v1, v2, v3, v4, 2u);
}

void legacy_get_ek_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Only CRYPTO_ONEKEY_ID supported under UserFS!\n", v1, v2, v3, v4, v5);
}

void legacy_get_ek_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Init does not have a cpx!\n", v1, v2, v3, v4, v5);
}

void fext_collector_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_30(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: DANGER! got the same extent for logical addr %lld twice!\n", v1, v2, v3, v4, 2u);
}

void retain_xdstream_crypto_states_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s get_cp_class_for_crypto_id failed (crypto id %llu, error %d)\n", v1, v2, v3, v4, 2u);
}

void ino_phys_size_ext_cold_1()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s inode %llu was marked sparse but didn't have a sparse bytes extended field?\n", v1, v2, v3, v4, 2u);
}

void fs_create_dstream_cold_1()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s *** failed to fetch the dstream pointer for %lld (ret %d)\n", v1, v2, v3, v4, v5);
}

void fs_create_dstream_cold_2()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to insert new dstream_id %llu (ret %d)", v1, v2, v3, v4, v5);
}

void fs_create_dstream_cold_3()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s *** failed to set dstream as an extended field of ino %lld (ret %d)\n", v1, v2, v3, v4, v5);
}

void move_inode_to_purgatory_ext_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to insert drec associated with purgatory_dir and ino %llu, error = %d\n", v1, v2, v3, v4, v5);
}

void remove_purgatory_entry_cold_1()
{
  OUTLINED_FUNCTION_96(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_90();
  __int16 v7 = v0;
  int v8 = v1;
  __int16 v9 = 2048;
  uint64_t v10 = v2;
  __int16 v11 = v3;
  uint64_t v12 = v4;
  __int16 v13 = 2048;
  uint64_t v14 = v5;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s error %d removing purgatory entry %lld/%s for ino %lld\n", v6, 0x40u);
}

void remove_purgatory_entry_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s update of the purgatory dir failed! err %d xid %lld\n", v1, v2, v3, v4, 2u);
}

void insert_linkid_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: couldn't allocate memory for link origin\n", v1, v2, v3, v4, 2u);
}

void child_remover_cb_cold_1()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_64(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get ino %lld in dir %lld\n", v1, v2, v3, v4, 2u);
}

void child_remover_cb_cold_2()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to move ino %lld from dir %lld to purgatory : %d\n", v1, v2, v3, v4, 2u);
}

void child_remover_cb_cold_3()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s link count == %d for inum %lld?!\n", v1, v2, v3, v4, v5);
}

void fs_delete_inode_internal_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fs_delete_inode_internal_cold_2()
{
  OUTLINED_FUNCTION_95(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_64(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s decrement dstream id returned ENOENT for private-id %lld (ino %lld)\n", v1, v2, v3, v4, 2u);
}

void fs_delete_inode_internal_cold_3()
{
  OUTLINED_FUNCTION_95(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_64(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s removing xattrs returned ENOENT for private-id %lld (ino %lld)\n", v1, v2, v3, v4, 2u);
}

void remove_extent_of_file_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to decrement crypto state = %llu, err %d\n", v1, v2, v3, v4, 2u);
}

void remove_extent_of_file_cold_2()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_75();
  int v5 = 11976;
  __int16 v6 = 2080;
  OUTLINED_FUNCTION_54();
  __int16 v7 = v0;
  uint64_t v8 = v1;
  __int16 v9 = v2;
  int v10 = v3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to remove extent for extent-id %lld @ logical offset %lld:%lld err %d\n", v4, 0x40u);
}

void remove_hash_file_info_record_cold_1()
{
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to remove hash file info for id %llu @ logical offset %llu err %u\n", v1, v2, v3, v4, 2u);
}

void update_sparse_bytes_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Sparse bytes removed from inode %lld that didn't have an extended field.\n", v1, v2, v3, v4, 2u);
}

void update_sparse_bytes_cold_2()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Failed to remove sparse bytes attribute from ino %lld, but it was successfully got, errro %d\n", v1, v2, v3, v4, 2u);
}

void update_sparse_bytes_cold_3()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Couldn't set sparse bytes extended attribute on ino %lld, error %d\n", v1, v2, v3, v4, 2u);
}

void fs_delete_inode_with_name_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to fetch sub-dir ino %lld\n", v1, v2, v3, v4, 2u);
}

void get_dstream_id_refcnt_cold_1(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Error looking up dstream id %llu: %d (%s)\n", v3, v4, v5, v6, 2u);
}

void decrement_dstream_id_for_deletion_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to restore refcnt on dstream id %llu, err: %d\n", v1, v2, v3, v4, v5);
}

void decrement_dstream_id_for_deletion_cold_2()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s trying to restore refcnt on dstream id %llu\n", v1, v2, v3, v4, 2u);
}

void decrement_dstream_id_for_deletion_cold_3()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to update dstream id %lld err %d\n", v1, v2, v3, v4, v5);
}

void alloc_tmp_ino_helper_cold_1()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't remove xattr inode %llu from disk, %d\n", v1, v2, v3, v4, v5);
}

void alloc_tmp_ino_helper_cold_2()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't find drec for ino %llu\n", v1, v2, v3, v4, 2u);
}

void alloc_tmp_ino_helper_cold_3()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't remove drec ino %llu, err %d\n", v1, v2, v3, v4, v5);
}

void alloc_tmp_ino_helper_cold_4()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s cannot add new dstream to %llu, err %d\n", v1, v2, v3, v4, v5);
}

void alloc_tmp_ino_helper_cold_5()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s cannot persist dstream to %llu, err %d\n", v1, v2, v3, v4, v5);
}

void alloc_tmp_ino_helper_cold_6()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s cannot set dstream on %llu, err %d\n", v1, v2, v3, v4, v5);
}

void alloc_tmp_ino_helper_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to create temporary inode under %llu with %d\n", v1, v2, v3, v4, v5);
}

void alloc_tmp_ino_helper_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't enter transaction for %llu records, %llu blocks, err %d\n", v1, v2, v3, v4, v5);
}

void free_tmp_ino_helper_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't remove dstream id %lld, %d\n", v1, v2, v3, v4, v5);
}

void free_tmp_ino_helper_cold_2()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_84(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't find drec for ino %llu\n", v1, v2, v3, v4, 2u);
}

void free_tmp_ino_helper_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_63(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't find name from tmp ino %d\n", v1, v2, v3, v4, v5);
}

void free_tmp_ino_helper_cold_4()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't enter transaction to delete tmp xattr inode %llu, err %d!\n", v1, v2, v3, v4, v5);
}

void iterative_fext_cloner_cold_1()
{
  OUTLINED_FUNCTION_66(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to insert extent for ino %lld @ logical offset %lld\n", v1, v2, v3, v4, 2u);
}

void get_new_crypto_id_if_needed_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s proposed crypto id %llu already in use, making a new one\n", v1, v2, v3, v4, 2u);
}

void is_non_iterative_extent_manipulation_faster_cold_1(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s lookup_file_extent failed: %s (%d)\n", v3, v4, v5, v6, 2u);
}

void remove_dstream_id_and_fexts_copy_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to remove extents of dstream %llu (err %d)\n", v1, v2, v3, v4, 2u);
}

void remove_dstream_id_and_fexts_copy_cold_2()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to remove dstream_id %llu (err %d)\n", v1, v2, v3, v4, v5);
}

void clone_extents_if_needed_with_gst_cold_1()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s cannot update ino %llu, %d\n", v1, v2, v3, v4, v5);
}

void clone_extents_if_needed_with_gst_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to restore refcnt on dstream id %llu, err: %d\n", v1, v2, v3, v4, 2u);
}

void clone_extents_if_needed_with_gst_cold_3()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to restore clone attributes for ino %llu (err %d)\n", v1, v2, v3, v4, v5);
}

void clone_extents_if_needed_with_gst_cold_4()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to restore refcnt on cloned dstream id %llu, err: %d\n", v1, v2, v3, v4, 2u);
}

void clone_extents_if_needed_with_gst_cold_5()
{
  OUTLINED_FUNCTION_86(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 136316418;
  OUTLINED_FUNCTION_21_0();
  *(_DWORD *)&v3[7] = 15461;
  v3[9] = 2080;
  OUTLINED_FUNCTION_59();
  int v4 = v0;
  __int16 v5 = v1;
  int v6 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to get new crypto id for clone ino %lld (cret %d; clone prot class %d)\n",
    (uint8_t *)v3,
    0x32u);
}

void clone_extents_if_needed_with_gst_cold_6()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to decrement refcnt from cloned dstream id %llu, err: %d\n", v1, v2, v3, v4, 2u);
}

void clone_extents_if_needed_with_gst_cold_7()
{
  OUTLINED_FUNCTION_94(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v1 = 136316162;
  OUTLINED_FUNCTION_21_0();
  *(_DWORD *)&v1[7] = 15125;
  v1[9] = 2080;
  OUTLINED_FUNCTION_59();
  uint64_t v2 = v0;
  _os_log_fault_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s:%d: %s couldn't find drec for tmp_ino %llu (%s)\n", (uint8_t *)v1, 0x30u);
}

void clone_extents_if_needed_with_gst_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_63(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't find name from tmp ino %d\n", v1, v2, v3, v4, v5);
}

void clone_extents_if_needed_with_gst_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't enter the cleanup transaction... ret %d\n", v1, v2, v3, v4, v5);
}

void clone_extents_if_needed_with_gst_cold_10()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_40(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to decrement refcnt from cloned dstream id %llu, err: %d\n", v1, v2, v3, v4, v5);
}

void clone_extents_if_needed_with_gst_cold_11()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_84(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dstream id %llu had refcount == 0\n", v1, v2, v3, v4, 2u);
}

void clone_extents_if_needed_with_gst_cold_12()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s cloning extents failed with %d (base_xid %lld)\n", v1, v2, v3, v4, 2u);
}

void fs_get_inode_with_hint_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to load inode %lld ret %d on volume: %s\n", v1, v2, v3, v4, 2u);
}

void jdev_fext_read_data_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to fetch crypto for crypto_id %lld\n", v1, v2, v3, v4, 2u);
}

void jdev_fext_write_data_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to fetch crypto for crypto_id %lld\n", v1, v2, v3, v4, 2u);
}

void alloc_space_for_write_with_hint_and_spino_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to allocate temporary block memory\n", v1, v2, v3, v4, 2u);
}

void alloc_space_for_write_with_hint_and_spino_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to allocate temporary block memory\n", v1, v2, v3, v4, 2u);
}

void zero_tail_of_last_block_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to lookup pos %lld in obj-id %lld\n", v1, v2, v3, v4, 2u);
}

void fs_map_file_offset_ext_cold_1()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v4 = 136316418;
  OUTLINED_FUNCTION_21_0();
  *(_DWORD *)&v4[7] = 21337;
  v4[9] = 2080;
  uint64_t v5 = v0;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  __int16 v8 = 2048;
  uint64_t v9 = v2;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Unexpected unwritten extent for offset %lld of data stream %lld in inode %lld\n", (uint8_t *)v4, 0x3Au);
}

void fs_map_file_offset_ext_cold_2(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Cannot start transaction with XID %lld: %s(%d)\n", v3, v4, v5, v6, 2u);
}

void _fs_add_xattr_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get a new default crypto-id, ino %lld\n", v1, v2, v3, v4, 2u);
}

void fs_tx_enter_internal_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to compare currently available space: error %d\n", v1, v2, v3, v4, v5);
}

void fs_tx_enter_internal_cold_2()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tx_enter() failed: %d\n", v1, v2, v3, v4, 2u);
}

void fs_tx_enter_internal_cold_3()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tx_enter_frozen() failed: %d\n", v1, v2, v3, v4, 2u);
}

void fs_tx_leave_ext_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tx_leave failed: %d\n", v1, v2, v3, v4, v5);
}

void mark_doc_id_index_for_rebuild_if_needed_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, v5);
}

void mark_doc_id_index_for_rebuild_if_needed_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to delete prev doc-id tree (no tracked files), error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to leave tx, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to create doc-id tree, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to enter tx, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to delete prev doc-id tree, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to delete doc-id tree, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_7()
{
  OUTLINED_FUNCTION_78();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x42u);
}

void check_stale_doc_id_index_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to clean up doc-id trees, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to delete prev doc-id tree, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to delete doc-id tree, error %d\n", v1, v2, v3, v4, v5);
}

void check_stale_doc_id_index_cold_11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to mark doc-id index for rebuild, error %d\n", v1, v2, v3, v4, v5);
}

void apfs_mount_livefs_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s set cloneinfo_id_epoch to %llu\n", v1, v2, v3, v4, 2u);
}

void apfs_mount_livefs_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_32(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't enter transaction to set apfs_cloneinfo_id_epoch, %d\n", v1, v2, v3, v4, v5);
}

void apfs_mount_livefs_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to check if doc-id index is stale (error %d)\n", v1, v2, v3, v4, v5);
}

void apfs_mount_livefs_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to fetch the pfkur tree (error %d)\n", v1, v2, v3, v4, v5);
}

void apfs_mount_livefs_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to fetch the extentref tree (error %d)\n", v1, v2, v3, v4, v5);
}

void apfs_mount_livefs_cold_6(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Cannot load the secondary filesystem root tree: %s(%d)\n", v3, v4, v5, v6, 2u);
}

void apfs_mount_livefs_cold_7(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Cannot load the filesystem root tree: %s(%d)\n", v3, v4, v5, v6, 2u);
}

void apfs_mount_livefs_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_30(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s overprovisioning volume can only mount r/o\n", v1, v2, v3, v4, v5);
}

void apfs_mount_livefs_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unsupported apfs_readonly_compatible_features (%llx): mount r/o\n", v1, v2, v3, v4, 2u);
}

void apfs_mount_livefs_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to mount livefs as volume is restoring or mounted\n", v1, v2, v3, v4, v5);
}

void setup_demo_mode_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't create extentref tree for demo mode: %d\n", v1, v2, v3, v4, v5);
}

void setup_demo_mode_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Couldn't enter TX on mount for demo mode: %d\n", v1, v2, v3, v4, v5);
}

void apfs_mount_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unsupported apfs_incompatible_features (%llx): unable to mount\n", v1, v2, v3, v4, 2u);
}

void apfs_mount_cold_2()
{
  OUTLINED_FUNCTION_20_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to unwrap metadata crypto state: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_mount_cold_3()
{
  OUTLINED_FUNCTION_20_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_30(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s resizing will be cancelled as the user volume is encrypted and is changing mount state to mounted\n", v1, v2, v3, v4, 2u);
}

void apfs_mount_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Volume is incompletely restored and needs to be cleaned up\n", v1, v2, v3, v4, v5);
}

void apfs_mount_cold_5()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s encryption type %llx unsupported\n", v1, v2, v3, v4, 2u);
}

void apfs_mount_cold_6()
{
  OUTLINED_FUNCTION_20_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Can't mount a volume undergoing restore/livefs-create\n", v1, v2, v3, v4, 2u);
}

void apfs_mount_cold_7()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s EALREADY; rooted from snap, apfs %p\n",
    v1,
    v2,
    v3,
    v4,
    2u);
}

void apfs_mount_cold_8()
{
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get fsys oid %lld: %d\n", v1, v2, v3, v4, v5);
}

void get_unwrapped_ekwk_snap_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_32(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: cannot get on-disk ekwk %llu, %d\n", v1, v2, v3, v4, 2u);
}

void icp_dec_ref_cold_1()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s danger - crypto id %lld had refcnt %d\n", v1, v2, v3, v4, 2u);
}

void icp_dec_ref_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s was NOT able to update/decrement crypto state %lld, err = %d\n", v1, v2, v3, v4, 2u);
}

void free_fext_resources_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s cannot deref crypto id %llu, %d\n", v1, v2, v3, v4, 2u);
}

void clone_file_fexts_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: cannot deref ino %llu old ekwk %llu, %d\n", v1, v2, v3, v4, 2u);
}

void clone_file_fexts_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't enter the cleanup transaction, ret %d\n", v1, v2, v3, v4, v5);
}

void clone_file_fexts_cold_3()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_32(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: cannot get unwrapped ekwk ino %llu, %d\n", v1, v2, v3, v4, 2u);
}

void clone_fexts__cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't enter the cleanup transaction, ret %d\n", v1, v2, v3, v4, 2u);
}

void clone_fexts__cold_2()
{
  OUTLINED_FUNCTION_89(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: cannot clone split fext %llu -> %llu, %d\n", v1, v2, v3, v4, 2u);
}

void apfs_mark_inconsistent__cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Volume inconsistency detected by %s:%u!\n", v1, v2, v3, v4, 2u);
}

void extent_remover_callback_cold_1()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't add dir %llu for recursive extent deletion\n", v1, v2, v3, v4, 2u);
}

void extent_remover_callback_cold_2()
{
  OUTLINED_FUNCTION_28(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_18_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get ino %lld\n", v1, v2, v3, v4, 2u);
}

void extent_remover_callback_cold_3()
{
  OUTLINED_FUNCTION_46(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error %d while removing extents on %lld\n", v1, v2, v3, v4, v5);
}

void ino_get_ekwk__cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_21(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to load ekwk for ino %llu, id %llu, class %d, decode error\n", v1, v2, v3, v4, 2u);
}

void ino_get_ekwk__cold_2()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_30(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: ino %llu has no ekwk id\n", v1, v2, v3, v4, 2u);
}

void clone_split_fext_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: cannot free fext %llu %llu:+%llu, %d\n", v1, v2, v3, v4, 2u);
}

void userfs_get_file_sizes_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: could not determine allocated size for compressed file ino %lld: error %d\n", v1, v2, v3, v4, 2u);
}

void userfs_combine_block_and_buf_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to read block at pbn %llu, err %d\n", v1, v2, v3, v4, 2u);
}

void userfs_combine_block_and_buf_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: blockmap failed: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_internal_blockmap_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 1321;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: NULL blockmap args.\n", (uint8_t *)v0, 0x12u);
}

void userfs_internal_blockmap_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 1337;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: NULL blockmap arguments.\n", (uint8_t *)v0, 0x12u);
}

void userfs_internal_blockmap_cold_3()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = 136316162;
  uint64_t v3 = "userfs_internal_blockmap";
  __int16 v4 = 1024;
  OUTLINED_FUNCTION_6_2();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Unexpected unwritten extent for offset %lld in data stream %lld of the inode %lld\n", (uint8_t *)&v2, 0x30u);
}

void userfs_set_file_size_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: No file extent found during truncate up: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_set_file_size_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to zero-fill tail during truncate up: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_set_file_size_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to remove prev_fsize after truncation: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_set_file_size_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: no txn for remove_prev_fsize: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_set_file_size_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to zero-fill tail during truncate down: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_set_file_size_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: No file extent found during truncate down: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_set_file_size_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to remove file extents: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_zero_tail_of_block_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to write 1 block to disk at pbn %llu, err %d\n", v1, v2, v3, v4, 2u);
}

void userfs_zero_tail_of_block_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: zero-filling blockmap failed: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_set_ufa_common_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to update inode attributes: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_set_ufa_common_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to set file size: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_reclaim_with_flags_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: fs_delete_inode failed with error %d\n", v1, v2, v3, v4, 2u);
}

void userfs_create_common_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to create symlink xattr on ino %llu, error %d\n", v1, v2, v3, v4, 2u);
}

void userfs_create_common_cold_2()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v4 = 136316162;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v4[7] = 1735;
  v4[9] = 2080;
  uint64_t v5 = v0;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  __int16 v8 = v2;
  int v9 = v3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to create object named %s in dir w/obj-id %lld error %d\n", (uint8_t *)v4, 0x2Cu);
}

void userfs_create_common_cold_3()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  v0[0] = 136315650;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Inode %llu not a directory. Aborting.\n", (uint8_t *)v0, 0x1Cu);
}

void userfs_internal_remove_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  int v2 = 136316162;
  int v3 = "userfs_internal_remove";
  __int16 v4 = 1024;
  OUTLINED_FUNCTION_6_2();
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Failed to move ino %lld to purgatory from dir %lld : %d\n", (uint8_t *)&v2, 0x2Cu);
}

void userfs_internal_remove_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: fs_delete_inode_with_xid failed with err %d\n", v1, v2, v3, v4, 2u);
}

void userfs_internal_remove_cold_3()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: link count == %d for inum %lld?!\n", v1, v2, v3, v4, 2u);
}

void userfs_internal_remove_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: remove_dir_entry failed, err %d\n", v1, v2, v3, v4, 2u);
}

void userfs_internal_remove_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to enter a delete transaction, err %d\n", v1, v2, v3, v4, 2u);
}

void userfs_internal_remove_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
}

void userfs_internal_remove_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_internal_lookup returned %d\n", v1, v2, v3, v4, 2u);
}

void apfs_get_node_name_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  v0[0] = 136315650;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: ino %lld does not have a NAME!\n", (uint8_t *)v0, 0x1Cu);
}

void apfs_getinfo_from_id_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Failed to get name for ino %lld, error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_getinfo_from_id_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
}

void userfs_apfs_preallocate_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to clone extents for ino %llu, err %d\n", v1, v2, v3, v4, 2u);
}

void io_get_device_block_size_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  uint64_t v0 = __error();
  strerror(*v0);
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: can't get the device block size (%s). assuming 512\n", (uint8_t *)v1, 0x1Cu);
}

void dev_write_data_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 338;
  v1[9] = 2048;
  uint64_t v2 = v0;
  _os_log_fault_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s:%d: data write (%zu blocks) over superblock!\n", (uint8_t *)v1, 0x1Cu);
}

void fd_dev_close_cold_1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v3[7] = 370;
  v3[9] = v0;
  int v4 = v1;
  __int16 v5 = 2080;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Hit an error flushing the cache, %d dev_name = %s\n", (uint8_t *)v3, 0x22u);
}

void dev_init_common_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  __int16 v0 = __error();
  strerror(*v0);
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: can't get block count (%s)\n", (uint8_t *)v1, 0x1Cu);
}

void dev_init_common_cold_2(int *a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  int v3 = 136316162;
  int v4 = "dev_init_common";
  __int16 v5 = 1024;
  int v6 = 983;
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 1024;
  int v10 = a2;
  __int16 v11 = 2080;
  uint64_t v12 = a1 + 52;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Couldn't fstat dev_fd (%d), err %d dev_name = %s\n", (uint8_t *)&v3, 0x28u);
}

void dev_init_cold_1(int a1, int __errnum)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  strerror(__errnum);
  v2[0] = 136315906;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to open volume device %s: %s\n", (uint8_t *)v2, 0x26u);
}

void dev_init_cold_2(int a1, int __errnum)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  strerror(__errnum);
  v2[0] = 136315906;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to open container device %s: %s\n", (uint8_t *)v2, 0x26u);
}

void fd_dev_read_helper_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = 136316418;
  int v1 = "fd_dev_read_helper";
  __int16 v2 = 1024;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: blknum %lld size %zu blksize %u invalid, dev_name = %s\n", (uint8_t *)&v0, 0x36u);
}

void _fd_dev_write_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = 136316418;
  int v1 = "_fd_dev_write";
  __int16 v2 = 1024;
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: blknum %lld size %zu blksize %u invalid, dev_name = %s\n", (uint8_t *)&v0, 0x36u);
}

void nx_superblock_agrees_with_main_superblock_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s<->superblock mismatch on checkpoint data base address: %lld %lld\n", v1, v2, v3, v4, 2u);
}

void nx_superblock_agrees_with_main_superblock_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s<->superblock mismatch on checkpoint descriptor base address: %lld %lld\n", v1, v2, v3, v4, 2u);
}

void nx_superblock_agrees_with_main_superblock_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s<->superblock mismatch on checkpoint data block count: %d %d\n", v1, v2, v3, v4, 2u);
}

void nx_superblock_agrees_with_main_superblock_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s<->superblock mismatch on checkpoint descriptor block count: %d %d\n", v1, v2, v3, v4, 2u);
}

void nx_superblock_agrees_with_main_superblock_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s<->superblock mismatch on block count: %lld %lld\n", v1, v2, v3, v4, 2u);
}

void nx_superblock_agrees_with_main_superblock_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s<->superblock mismatch on block size: %d %d\n", v1, v2, v3, v4, 2u);
}

void nx_superblock_agrees_with_main_superblock_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: the %s superblock has a lower XID %lld than the main superblock %lld\n", v1, v2, v3, v4, 2u);
}

void nx_superblock_agrees_with_main_superblock_cold_8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s<->superblock mismatch on fusion uuid, tier2=%d\n", v1, v2, v3, v4, 2u);
}

void nx_superblock_agrees_with_main_superblock_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s<->superblock mismatch on uuid\n", v1, v2, v3, v4, 2u);
}

void nx_checkpoint_find_valid_checkpoint_cold_1()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  v0[0] = 136315906;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_1();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s unsupported nx_incompatible_features (0x%llx): unable to mount\n", (uint8_t *)v0, 0x26u);
}

void nx_checkpoint_load_data_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't allocate memory for checkpoint map block\n", v1, v2, v3, v4, 2u);
}

void nx_checkpoint_load_data_cold_2()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unexpected checkpoint map entry address: 0x%llx, expected 0x%llx\n", v1, v2, v3, v4, v5);
}

void nx_dev_init_cold_1()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't allocate memory for superblock of size %d\n", v1, v2, v3, v4, 2u);
}

void nx_dev_init_cold_2()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s superblock failed sanity checks: %d\n", v1, v2, v3, v4, 2u);
}

void nx_dev_init_cold_3()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't allocate memory for superblock of size %d\n", v1, v2, v3, v4, 2u);
}

void nx_dev_init_cold_4()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tier2 device superblock doesn't agree with main superblock\n", v1, v2, v3, v4, 2u);
}

void nx_dev_init_cold_5()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't read tier2 device superblock of size %d\n", v1, v2, v3, v4, 2u);
}

void nx_dev_init_cold_6()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s container block size too small for tier2 device block size (%d < %d)\n", v1, v2, v3, v4, v5);
}

void nx_dev_init_cold_7()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to set tier2 device: %d\n", v1, v2, v3, v4, 2u);
}

void nx_dev_init_cold_8()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s container block size too small for device block size (%d < %d)\n", v1, v2, v3, v4, v5);
}

void nx_dev_init_cold_9()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s couldn't read superblock of size %d\n", v1, v2, v3, v4, 2u);
}

void nx_dev_init_cold_10()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s block size %d is not an even multiple of device block size %d\n", v1, v2, v3, v4, v5);
}

void nx_dev_init_cold_11()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: tier2 device initialization failed: %d\n", v1, v2, v3, v4, 2u);
}

void nx_dev_init_cold_12()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: device initialization failed: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: device initialization failed: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_2()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to allocate buffer for checkpoint superblock\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_3()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s No temporary checkpoint start xid!  Aborting!\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_4()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s checkpoint descriptor block %d doesn't agree with main superblock\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_5()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s nx_unblock_physical_range failed with error: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_6()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to set up sm allocation metadata: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_7()
{
  OUTLINED_FUNCTION_16_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to write superblock to block %lld: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_8()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed nx_check sanity: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_9()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tx manager initialization failed: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_10()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to set up spaceman for demo mode: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_11()
{
  OUTLINED_FUNCTION_16_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s checkpoint xid %lld failed to load spaceman metadata ranges (overlap?): %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_12()
{
  OUTLINED_FUNCTION_16_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s checkpoint xid %lld failed to get spaceman: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_13()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s sanity check of recently-changed structures failed: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_14()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to fix up checkpoint data: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_15()
{
  OUTLINED_FUNCTION_22_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s data for checkpoint at index %d couldn't be loaded: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_16()
{
  OUTLINED_FUNCTION_22_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s validation failed for checkpoint at index %d: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_17()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s checkpoint superblock index %d doesn't match index block was found at: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_18()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  v0[0] = 136315906;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13_1();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s unsupported nx_incompatible_features (0x%llx): unable to mount\n", (uint8_t *)v0, 0x26u);
}

void nx_mount_cold_19()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s checkpoint descriptor block %d superblock failed sanity checks: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_20()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to find valid checkpoint: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_21()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to scan checkpoint descriptor area for largest xid: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_22()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s checkpoint descriptor length is bad.  Container cleanly-unmounted flag ignored\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_23()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s checkpoint data length is bad.  Container cleanly-unmounted flag ignored\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_24()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s storage is untrusted. Container cleanly-unmounted flag ignored\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_25()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fragmented checkpoint area failed sanity check: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_26()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s object cache bootstrap failed: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_27()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s object cache initialization failed: %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_28()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136316162;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v2[7] = 1293;
  v2[9] = 2080;
  uint64_t v3 = v0;
  __int16 v4 = v1;
  int v5 = 256;
  __int16 v6 = v1;
  int v7 = 4096;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s initializing cache w/hash_size %u and cache size %u\n", (uint8_t *)v2, 0x28u);
}

void nx_mount_cold_29()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: conflicting mount options: load from temporary checkpoint AND checkpoint descriptor index %d\n", v1, v2, v3, v4, 2u);
}

void nx_mount_cold_30()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 1086;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: conflicting mount options: is_system_graft but not is_graft\n", (uint8_t *)v0, 0x12u);
}

void nx_mount_initiate_free_space_trims_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s *** trim'ing free blocks returned: %d\n", v1, v2, v3, v4, 2u);
}

void obj_mem_mgr_init_cold_1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136315906;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v3[7] = 7200;
  v3[9] = v0;
  int v4 = v1;
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: object memory manager initialized with feature flags: 0x%x, apfs_mem_max: %lld\n", (uint8_t *)v3, 0x22u);
}

void obj_mem_mgr_init_cold_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v2[7] = 7179;
  v2[9] = v0;
  int v3 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: object memory manager failed to create lock, error: %d\n", (uint8_t *)v2, 0x18u);
}

void obj_cache_flush_prepare_cold_1()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_7_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error preparing for write: %d\n", v1, v2, v3, v4, 2u);
}

void obj_cache_flush_prepare_cold_2()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error preparing for write: %d\n", v1, v2, v3, v4, 2u);
}

void obj_cache_flush_prepare_cold_3()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_7_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error preparing for write: %d\n", v1, v2, v3, v4, 2u);
}

void obj_cache_flush_prepare_cold_4()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_7_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error preparing for write: %d\n", v1, v2, v3, v4, 2u);
}

void obj_write_prepare_cold_1()
{
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_6_4(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x non-virtual object missing paddr!\n", v1, v2, v3, v4, 2u);
}

void obj_write_prepare_cold_2()
{
  OUTLINED_FUNCTION_23(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_6_4(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x non-virtual object missing paddr!\n", v1, v2, v3, v4, 2u);
}

void obj_cache_remove_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error unreserving tier2 space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
}

void obj_cache_remove_cold_2()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error unreserving tier2 space, %lld blocks: %d\n", v1, v2, v3, v4, v5);
}

void obj_cache_remove_cold_3()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error unreserving space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
}

void obj_cache_remove_cold_4()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error unreserving space, %lld blocks: %d\n", v1, v2, v3, v4, v5);
}

void obj_cache_remove_reverted_fs_objects_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error unreserving tier2 space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
}

void obj_cache_remove_reverted_fs_objects_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315906;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18_3();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s unreserving %lld blocks for reverted fs objects\n", (uint8_t *)v0, 0x26u);
}

void obj_cache_remove_reverted_fs_objects_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error unreserving space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
}

void obj_cache_remove_reverted_fs_objects_cold_4()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315906;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18_3();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s unreserving %lld blocks for reverted fs objects\n", (uint8_t *)v0, 0x26u);
}

void obj_cache_remove_reverted_fs_objects_cold_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 112);
  int v4 = 136316418;
  uint8_t v5 = "obj_cache_remove_reverted_fs_objects";
  __int16 v6 = 1024;
  int v7 = 1784;
  __int16 v8 = 2080;
  uint64_t v9 = a1 + 3832;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2048;
  uint64_t v15 = a3;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s removing reverted fs objects for fs %lld: %lld - %lld\n", (uint8_t *)&v4, 0x3Au);
}

void obj_cache_remove_new_fs_objects_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error unreserving tier2 space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
}

void obj_cache_remove_new_fs_objects_cold_2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error unreserving space, %lld blocks: %d\n", v1, v2, v3, v4, 2u);
}

void obj_alloc_cold_1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v3 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v3[7] = 2156;
  v3[9] = v0;
  int v4 = v1;
  __int16 v5 = v0;
  int v6 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: invalid object size: %d size_phys %d\n", (uint8_t *)v3, 0x1Eu);
}

void obj_alloc_cold_2()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  int v5 = 2154;
  __int16 v6 = 2080;
  uint64_t v7 = v0;
  __int16 v8 = v1;
  int v9 = v2;
  __int16 v10 = v1;
  int v11 = v3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s invalid object size: %d size_phys %d\n", v4, 0x28u);
}

void obj_alloc_cold_3()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error destroying: %d\n", v1, v2, v3, v4, 2u);
}

void obj_alloc_cold_4()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_7_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x error destroying: %d\n", v1, v2, v3, v4, 2u);
}

void obj_delete_and_free_by_oid_cold_1()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get fs object 0x%llx: %d\n", v1, v2, v3, v4, v5);
}

void obj_read_cold_1()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_6_4(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x object missing paddr!\n", v1, v2, v3, v4, 2u);
}

void obj_read_cold_2()
{
  OUTLINED_FUNCTION_5_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_3_8();
  OUTLINED_FUNCTION_6_4(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x object missing paddr!\n", v1, v2, v3, v4, 2u);
}

void obj_modify_cold_1()
{
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_6_4(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x can't modify object before read completes\n", v1, v2, v3, v4, 2u);
}

void obj_modify_cold_2()
{
  OUTLINED_FUNCTION_23(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_6_4(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx 0x%x type 0x%x/0x%x can't modify object before read completes\n", v1, v2, v3, v4, 2u);
}

void obj_destroy_complete_cold_1()
{
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_6_4(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx type 0x%x/0x%x error destroying: %d\n", v1, v2, v3, v4, 2u);
}

void obj_destroy_complete_cold_2()
{
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_6_4(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s oid 0x%llx flags 0x%llx type 0x%x/0x%x error destroying: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tree_delete() failed: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tree_delete() failed: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get omap snapshot tree for reaping: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get omap snapshot tree for reaping: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tree_delete() failed: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_6()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tree_delete() failed: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get omap tree for reaping: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_8()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get omap tree for reaping: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s obj_modify() failed: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_10()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s obj_modify() failed: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_12()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_13()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_14()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_15()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_16()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_17()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error deleting empty snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_18()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error deleting empty snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_19()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error updating snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_20()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error updating snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_21()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_22()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_23()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s lookup returned unexpected error while iterating: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_24()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s lookup returned unexpected error while iterating: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_25()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3[0] = 136316162;
  OUTLINED_FUNCTION_18_4();
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s started cleaning snapshots %lld-%lld\n", (uint8_t *)v3, 0x30u);
}

void omap_reap_cold_26()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  v3[0] = 136316162;
  OUTLINED_FUNCTION_18_4();
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s started cleaning snapshots %lld-%lld\n", (uint8_t *)v3, 0x30u);
}

void omap_reap_cold_27()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_28()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_29()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error getting mapping tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_30()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error getting mapping tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_reap_cold_31()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error modifying omap: %d\n", v1, v2, v3, v4, v5);
}

void omap_reap_cold_32()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error modifying omap: %d\n", v1, v2, v3, v4, 2u);
}

void omap_destroy_cold_1()
{
  OUTLINED_FUNCTION_18();
  obj_oid(*v0);
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s error adding omap 0x%llx type 0x%x to reap list: %d\n", v2, v3, v4, v5, 2u);
}

void omap_destroy_cold_2()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_20_2(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: %s error adding omap 0x%llx type 0x%x to reap list: %d\n", v2, v3, v4, v5, 2u);
}

void omap_set_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, v5);
}

void omap_set_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get spaceman: %d\n", v1, v2, v3, v4, 2u);
}

void omap_find_next_snapshot_xid_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_find_next_snapshot_xid_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_find_next_snapshot_xid_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_find_next_snapshot_xid_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_find_next_snapshot_xid_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get omap: %d\n", v1, v2, v3, v4, v5);
}

void omap_find_next_snapshot_xid_cold_6()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get omap: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_create_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error adding snapshot: %d\n", v1, v2, v3, v4, v5);
}

void _omap_snapshot_create_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error adding snapshot: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_create_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to create snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void _omap_snapshot_create_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to create snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_create_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void _omap_snapshot_create_cold_6()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_delete_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void _omap_snapshot_delete_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_delete_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void _omap_snapshot_delete_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_delete_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void _omap_snapshot_delete_cold_6()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_delete_cold_7()
{
  OUTLINED_FUNCTION_18();
  obj_oid(v1);
  obj_type_and_flags(v0);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s error adding omap 0x%llx type 0x%x to reap list for cleaning: %d\n", v3, v4, v5, v6, 2u);
}

void _omap_snapshot_delete_cold_8()
{
  OUTLINED_FUNCTION_18();
  obj_oid(v1);
  obj_type_and_flags(v0);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s error adding omap 0x%llx type 0x%x to reap list for cleaning: %d\n", v3, v4, v5, v6, 2u);
}

void _omap_snapshot_delete_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error updating snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void _omap_snapshot_delete_cold_10()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error updating snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_delete_cold_11()
{
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to find snapshot %lld: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_delete_cold_12()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to find snapshot %lld: %d\n", v1, v2, v3, v4, 2u);
}

void _omap_snapshot_delete_cold_13()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void _omap_snapshot_delete_cold_14()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_revert_to_snapshot_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_revert_to_snapshot_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_revert_to_snapshot_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Unable to look up any snapshot greater than %lld ?: %d\n", v1, v2, v3, v4, v5);
}

void omap_revert_to_snapshot_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Unable to look up any snapshot greater than %lld ?: %d\n", v1, v2, v3, v4, 2u);
}

void omap_revert_to_snapshot_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to create snapshot for reversion: %d\n", v1, v2, v3, v4, v5);
}

void omap_revert_to_snapshot_cold_6()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to create snapshot for reversion: %d\n", v1, v2, v3, v4, 2u);
}

void omap_revert_to_snapshot_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, v5);
}

void omap_revert_to_snapshot_cold_8()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get snapshot tree: %d\n", v1, v2, v3, v4, 2u);
}

void omap_revert_to_snapshot_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't revert because a revert is still pending to be cleaned up: %d\n", v1, v2, v3, v4, 2u);
}

void omap_revert_to_snapshot_cold_10()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s can't revert because a revert is still pending to be cleaned up: %d\n", v1, v2, v3, v4, 2u);
}

void omap_revert_to_snapshot_cold_11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Manually managed omaps don't support snapshots\n", v1, v2, v3, v4, v5);
}

void omap_revert_to_snapshot_cold_12()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Manually managed omaps don't support snapshots\n", v1, v2, v3, v4, 2u);
}

void supplemental_tree_node_count_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = 136315906;
  uint64_t v1 = "supplemental_tree_get";
  __int16 v2 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s unsupported tree type: %d\n", (uint8_t *)&v0, 0x22u);
}

void supplemental_tree_get_descriptor_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = 136315906;
  uint64_t v1 = "supplemental_tree_get_descriptor";
  __int16 v2 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s unsupported tree type: %d\n", (uint8_t *)&v0, 0x22u);
}

void supplemental_tree_destroy_cold_1(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to delete supplemental tree (type %d): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void supplemental_tree_copy_cold_1(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to copy supplemental tree (type %d): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void supplemental_tree_copy_cold_2(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to copy supplemental tree (type %d): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void apfs_uvfsop_mount_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: no memory for root node, exiting\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_mount_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_apfs_mount failed: error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_mount_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_nx_mount failed: error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_sync_cold_1(uint64_t a1, int __errnum)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 384) + 208;
  strerror(__errnum);
  *(_DWORD *)uint64_t v6 = 136316162;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v6[7] = 581;
  v6[9] = 2080;
  uint64_t v7 = v3;
  __int16 v8 = 2080;
  uint64_t v9 = v4;
  __int16 v10 = v5;
  int v11 = __errnum;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s: failed to finish all transactions in apfs_uvfsop_sync() - %s(%d)\n", (uint8_t *)v6, 0x2Cu);
}

void apfs_uvfsop_getfsattr_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: spaceman_size_info failed: error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_getfsattr_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void apfs_uvfsop_getfsattr_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a3 + 400);
  int v5 = 136316162;
  uint64_t v6 = "apfs_uvfsop_getfsattr";
  __int16 v7 = 1024;
  int v8 = 676;
  __int16 v9 = 2080;
  uint64_t v10 = a1;
  __int16 v11 = 2048;
  uint64_t v12 = v3;
  __int16 v13 = 2080;
  uint64_t v14 = v4;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: Getting file-system attribute(%s) on node with ino: %llu, inside volume %s\n", (uint8_t *)&v5, 0x30u);
}

void apfs_uvfsop_setfsattr_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Asked to set empty volume name, exiting...\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_setfsattr_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Failed to finish transaction to rename volume: error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_check_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 282;
  v1[9] = 2048;
  uint64_t v2 = v0;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Passed-in vol_id %llu is invalid\n", (uint8_t *)v1, 0x1Cu);
}

void apfs_uvfsop_check_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: posix_spawnattr_destroy returned error: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_check_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: posix_spawn_file_actions_destroy returned error: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_check_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: waitpid returned with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_check_cold_5(int a1)
{
  strsignal(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: fsck_apfs killed by signal %d (%s)", v2, v3, v4, v5, 2u);
}

void apfs_uvfsop_check_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: fsck_apfs exited with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_check_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: fsck_apfs status unknown %d", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_check_cold_8(int a1)
{
  strsignal(a1 >> 8);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v1, "%s:%d: fsck_apfs stopped by signal %d (%s)", v2, v3, v4, v5, 2u);
}

void apfs_uvfsop_check_cold_9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: invalid how flag set for check, proceeding with quick check\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_scanvols_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to get next vol: error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_uvfsop_scanvols_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_nx_mount failed: error %d\n", v1, v2, v3, v4, 2u);
}

void dir_stats_op_ext_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315906;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  _os_log_fault_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s:%d: %s invalid op_flags for setting dir-stats: 0x%llx\n", (uint8_t *)v0, 0x26u);
}

void dir_stats_op_ext_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to set fast-path SAF dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void dir_stats_op_ext_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to enter tx to set the SAF flag on dir-stats for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void dir_stats_op_ext_cold_4()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 136316162;
  uint64_t v2 = "dir_stats_op_ext";
  __int16 v3 = 1024;
  int v4 = 3224;
  __int16 v5 = 2080;
  OUTLINED_FUNCTION_20_3();
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s cannot set dir-stats (%llu) for ino %llu because its current dir-stats has unknown flags\n", (uint8_t *)&v1, 0x30u);
}

void dir_stats_set_purgeable_state_cold_1()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, v5);
}

void dir_stats_get_all_ancestors_attributes_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s stopped updating dir-stats due to chain being too long\n", v1, v2, v3, v4, 2u);
}

void get_dir_stats_by_key_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to look up shadow dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void get_dir_stats_by_key_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dir-stats key %llu is busy even though we hold the inode lock\n", v1, v2, v3, v4, 2u);
}

void get_dir_stats_cold_1()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, v5);
}

void init_dir_stats_xfields_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_18_5(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to init xfield %d for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void init_dir_stats_xfields_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_18_5(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to init xfield %d for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void init_dir_stats_xfields_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_18_5(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to init xfield %d for dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void size_tracking_ino_moved_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to init extended fields for dir-stats object on ino %llu: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void size_tracking_ino_moved_cold_2()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged to maintain dir-stats but has no dir-stats key\n", v1, v2, v3, v4, v5);
}

void size_tracking_ino_moved_cold_3()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, v5);
}

void size_tracking_untrack_inode_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to remove shadow dir-stats object (id %llu): %s (%d)\n", v4, v5, v6, v7, 2u);
}

void size_tracking_untrack_inode_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to remove dir-stats object (id %llu): %s (%d)\n", v4, v5, v6, v7, 2u);
}

void update_size_tracking_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to enter tx to update size tracking for ino %llu: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void update_dir_stats_cold_1()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged to maintain dir-stats but has no dir-stats key\n", v1, v2, v3, v4, v5);
}

void update_size_tracking_purgeable_size_cold_1()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged to maintain dir-stats but has no dir-stats key\n", v1, v2, v3, v4, v5);
}

void update_dir_stats_by_key_ext_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s stopped updating dir-stats due to chain being too long\n", v1, v2, v3, v4, 2u);
}

void sanitize_op_flags_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dir-stats can either be set or unset, but not both and not neither\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s no special dir-stats op flags are allowed on non-expanded volumes\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_ONLY_SPACE_ATTRIBUTION can't be specified alone\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_SET_BY_SPACE_ATTRIBUTION cannot be passed along with DS_OP_UNSET_BY_SPACE_ATTRIBUTION\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_SET_FOR_SPACE_ATTRIBUTION cannot be passed along with DS_OP_UNSET_FOR_SPACE_ATTRIBUTION\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_SET_BY_SPACE_ATTRIBUTION cannot be passed without DS_OP_SET_FOR_SPACE_ATTRIBUTION\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_SET_SPEC_TELEMETRY cannot be passed along with DS_OP_UNSET_SPEC_TELEMETRY\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_[UN]SET_BY_SPACE_ATTRIBUTION can't be used internally\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_TRACK_PURGEABLE_RSRC_SIZE can only be used with DS_OP_TRACK_RSRC_FORKS and DS_OP_TRACK_PURGEABLE_SIZE\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_ONLY_SPACE_ATTRIBUTION can only be used with SAF flags\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s DS_OP_ONLY_SPACE_ATTRIBUTION can't be used externally\n", v1, v2, v3, v4, v5);
}

void sanitize_op_flags_cold_12()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s invalid dir-stats UNSET flags: 0x%llx\n", v1, v2, v3, v4, 2u);
}

void sanitize_op_flags_cold_13()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unknown dir-stats op flags: 0x%llx\n", v1, v2, v3, v4, 2u);
}

void set_dir_stats_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to update ino %llu as dir-stats origin: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_cold_2(int a1, int __errnum)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  strerror(__errnum);
  v2[0] = 136316162;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_29();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to enter tx to finalize calculation: %s (%d)\n", (uint8_t *)v2, 0x2Cu);
}

void set_dir_stats_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to set up dir-stats for ino %llu: %s (%d);  size tracking may be out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void set_dir_stats_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to make dir-stats %llu shadow: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_cold_5(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to update dir-stats key for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_cold_6()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to insert dir-stats object on ino %llu\n", v1, v2, v3, v4, v5);
}

void set_dir_stats_cold_7(int a1, int __errnum)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  strerror(__errnum);
  v2[0] = 136316162;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_29();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to set shadow dir-stats key new dir-stats: %s (%d)\n", (uint8_t *)v2, 0x2Cu);
}

void set_dir_stats_cold_8(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to retrieve existing dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_cold_9()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, v5);
}

void unset_dir_stats_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to remove dir-stats for unsetting %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void unset_dir_stats_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to enter tx to remove dir-stats for unsetting %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void unset_dir_stats_cold_3()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 136316162;
  uint64_t v2 = "unset_dir_stats";
  __int16 v3 = 1024;
  int v4 = 2539;
  __int16 v5 = 2080;
  OUTLINED_FUNCTION_20_3();
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s can't UNSET dir-stats for inode (id %llu, internal_flags 0x%llx) that is not origin\n", (uint8_t *)&v1, 0x30u);
}

void unset_dir_stats_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to unset dir-stats for ino %llu: %s (%d);  size tracking may be out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void unset_dir_stats_cold_5(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to update dir-stats state for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void unset_dir_stats_cold_6(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to enter tx to unset dir-stats for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void unset_dir_stats_cold_7(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to retrieve existing dir-stats %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void unset_dir_stats_cold_8()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, 2u);
}

void unset_dir_stats_cold_9()
{
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is flagged as dir-stats origin but has no dir-stats key\n", v1, v2, v3, v4, 2u);
}

void dir_stats_get_flags_cold_1(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s could not get dir-stats %llu: %s (%d)\n", v3, v4, v5, v6, 2u);
}

void dir_stats_required_op_from_flags_cold_1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  int v4 = 1251;
  __int16 v5 = 2080;
  uint64_t v6 = v0;
  __int16 v7 = v1;
  int v8 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s invalid dir-stats flags 0x%x\n", v3, 0x22u);
}

void _setup_dir_stats_cb_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to update dir-stats state for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void _setup_dir_stats_cb_cold_2(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v4 = 136316162;
  uint64_t v5 = "_setup_dir_stats_cb";
  uint64_t v3 = "setting";
  __int16 v6 = 1024;
  int v7 = 2096;
  uint64_t v9 = a1 + 3832;
  __int16 v8 = 2080;
  if (a2) {
    uint64_t v3 = "unsetting";
  }
  __int16 v10 = 2080;
  __int16 v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = a3;
  _os_log_fault_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s:%d: %s invalid op_flags for %s dir-stats: 0x%llx\n", (uint8_t *)&v4, 0x30u);
}

void set_dir_stats_handle_origin_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to make dir-stats %llu shadow: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_handle_origin_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to update ino %llu on-disk: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_handle_origin_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to insert new dir-stats object on ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_handle_origin_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to init set shadow key for dir-stats object on ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_handle_origin_cold_5(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to init extended fields for dir-stats object on ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void set_dir_stats_handle_origin_cold_6(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to init extended fields for dir-stats object on ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void unset_dir_stats_handle_origin_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s failed to unset SAF flag for ino %llu: %s (%d)\n", v4, v5, v6, v7, 2u);
}

void delta_from_dir_stats_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_19_2(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s dir-stats %llu maintains purgeable rsrc size but failed to get the xfield: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void delta_from_dir_stats_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_19_2(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s dir-stats %llu maintains purgeable size but failed to get the xfield: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void delta_from_dir_stats_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_4_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_19_2(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s dir-stats %llu maintains clone size but failed to get the xfield: %s (%d); size tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void dir_stats_move_regular_origin_cold_1(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s failed to init extended fields for dir-stats object on ino %llu: %s (%d); size tracking may go out of sync\n",
    v3,
    v4,
    v5,
    v6,
    2u);
}

void spaceman_metazone_init_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)__int16 v1 = 136315650;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v1[7] = 72;
  v1[9] = 2080;
  uint64_t v2 = v0;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s Skipping metazone_init() as backing store is sparse\n", (uint8_t *)v1, 0x1Cu);
}

void spaceman_get_metazone_alloc_index_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tried to get metazone alloc index for unknown type: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_get_metazone_alloc_index_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tried to get metazone alloc index for unknown type: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_allocation_init_cold_1()
{
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to initialize data zone for allocations of size %llu, error %d\n", v1, v2, v3, v4, v5);
}

void spaceman_datazone_init_cold_1(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 384) + 208;
  uint64_t v4 = *a2;
  int v5 = 136316418;
  uint64_t v6 = "spaceman_datazone_init";
  __int16 v7 = 1024;
  int v8 = 611;
  __int16 v9 = 2080;
  uint64_t v10 = v3;
  __int16 v11 = 1024;
  int v12 = 0;
  __int16 v13 = 2048;
  uint64_t v14 = a3;
  __int16 v15 = 2048;
  uint64_t v16 = v4;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s allocation zone on dev %d for allocations of %llu blocks starting at paddr %llu\n", (uint8_t *)&v5, 0x36u);
}

void spaceman_datazone_init_cold_2()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to initialize allocation zone for allocations of %llu blocks from disk: error %d\n", v1, v2, v3, v4, v5);
}

void spaceman_initialize_allocation_zone_from_disk_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to update allocation zone boundaries: error %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_initialize_allocation_zone_from_disk_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to update allocation zone boundaries: error %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_evaluate_chunk_for_disabled_allocation_zones_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  v0[0] = 136316162;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_11();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to assign chunk %llu to allocation zone %llu\n", (uint8_t *)v0, 0x30u);
}

void spaceman_evaluate_chunk_for_disabled_allocation_zones_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = 136316162;
  uint64_t v1 = "spaceman_evaluate_chunk_for_disabled_allocation_zones";
  __int16 v2 = 1024;
  OUTLINED_FUNCTION_3_11();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s failed to assign chunk %llu to allocation zone %llu\n", (uint8_t *)&v0, 0x30u);
}

void spaceman_get_new_chunk_for_allocation_zone_cold_1()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to update allocate zone %llu: error %d\n", v1, v2, v3, v4, v5);
}

void spaceman_get_new_chunk_for_allocation_zone_cold_2()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s error getting cib %d: %d\n", v0, 0x28u);
}

void spaceman_get_new_chunk_for_allocation_zone_cold_3()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s error getting cab %d: %d\n", v0, 0x28u);
}

void spaceman_free_extent_cache_reset_cold_1()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Error reinitializing %s free extent cache: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_free_extent_cache_insert_cold_1()
{
  OUTLINED_FUNCTION_9_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Error %d, reinitializing\n", v1, v2, v3, v4, 2u);
}

void spaceman_free_extent_cache_insert_cold_2()
{
  OUTLINED_FUNCTION_9_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_18_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Failed to find successor node in length tree: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_fxc_tree_node_recycle_smallest_if_full_cold_1()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Failed to find smallest extent in paddr tree: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_fxc_tree_node_recycle_smallest_if_full_cold_2()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  v3[0] = 136316418;
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_6_5();
  __int16 v4 = v0;
  int v5 = v1;
  __int16 v6 = v0;
  int v7 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s dev %d Failed to find smallest extent %d in length tree: %d\n", (uint8_t *)v3, 0x2Eu);
}

void spaceman_fxc_tree_node_recycle_smallest_if_full_cold_3()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Failed to find next smallest extent in length tree: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_fxc_update_length_cold_1()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 136315906;
  OUTLINED_FUNCTION_11();
  *(_DWORD *)&v3[7] = 1463;
  v3[9] = 2080;
  uint64_t v4 = v0;
  __int16 v5 = v1;
  int v6 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s dev %d Failed to find length tree predecessor for node that wasn't the smallest\n", (uint8_t *)v3, 0x22u);
}

void spaceman_fxc_update_smallest_with_successor_cold_1()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Failed to find successor node from length tree while updating smallest: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_free_extent_cache_remove_cold_1()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Error %d, reinitializing\n", v1, v2, v3, v4, 2u);
}

void spaceman_free_extent_cache_remove_cold_2()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Failed to update partially-covered node in length tree: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_free_extent_cache_remove_cold_3()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Failed to get next extent: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_free_extent_cache_remove_cold_4()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Failed to delete covered node from length tree: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_free_extent_cache_search_cold_1()
{
  OUTLINED_FUNCTION_58(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d Error searching %s free extent cache: %d; Reinitializing.\n",
    v1,
    v2,
    v3,
    v4,
    2u);
}

void spaceman_fxtp_add_child_cold_1()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s dev %d %s tree: PATH TOO LONG: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_ip_block_alloc_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to find free IP block or to free pending free IP blocks\n", v1, v2, v3, v4, 2u);
}

void spaceman_scan_free_blocks_cold_1()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v7 = "spaceman_scan_free_blocks";
  __int16 v8 = 1024;
  int v9 = 4130;
  __int16 v10 = 2080;
  int v6 = 136316674;
  OUTLINED_FUNCTION_24_0();
  uint64_t v11 = v0;
  __int16 v12 = v1;
  uint64_t v13 = v2;
  __int16 v14 = v1;
  uint64_t v15 = v5 - v4 * v3;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s trims dropped: %lld blocks %lld extents, avg %lld.%02lld \n", (uint8_t *)&v6, 0x44u);
}

void spaceman_scan_free_blocks_cold_2()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  int v5 = 136317186;
  int v6 = "spaceman_scan_free_blocks";
  __int16 v7 = 1024;
  int v8 = 4122;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_54();
  __int16 v10 = v0;
  uint64_t v11 = v1;
  __int16 v12 = v0;
  uint64_t v13 = v2;
  __int16 v14 = v0;
  uint64_t v15 = v3;
  __int16 v16 = v0;
  uint64_t v17 = v4;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s trim distribution 1:%lld 2+:%lld 4+:%lld 16+:%lld 64+:%lld 256+:%lld\n", (uint8_t *)&v5, 0x58u);
}

void spaceman_scan_free_blocks_cold_3()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  int v3 = 136316674;
  uint64_t v4 = "spaceman_scan_free_blocks";
  __int16 v5 = 1024;
  int v6 = 4110;
  __int16 v7 = 2080;
  OUTLINED_FUNCTION_21_2();
  __int16 v8 = v0;
  uint64_t v9 = v1;
  __int16 v10 = v0;
  uint64_t v11 = v2;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s %lld blocks free in %lld extents, avg %lld.%02lld\n", (uint8_t *)&v3, 0x44u);
}

void spaceman_scan_free_blocks_cold_4()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_64(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s scan took %lld.%06lld s (no trims)\n", v1, v2, v3, v4, 2u);
}

void spaceman_fq_tree_find_overlap_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error searching spaceman free queue tree: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_ip_block_index_cold_1(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s failed to get next internal pool reverse mapping, error %s(%d)\n", v3, v4, v5, v6, 2u);
}

void spaceman_alloc_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_64(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Space outside soft block-out range seems fragmented (requested %llu, but could alloc only %llu), disable soft block-out range\n", v1, v2, v3, v4, 2u);
}

void spaceman_alloc_cold_2()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_64(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Space outside soft block-out range seems fragmented (requested %llu, but could alloc only %llu), disable soft block-out range\n", v1, v2, v3, v4, 2u);
}

void spaceman_alloc_cold_3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 8085;
  v1[9] = 2080;
  uint64_t v2 = v0;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s Found enough data to allocate outside the soft block-out range, re-enable soft block-out range\n", (uint8_t *)v1, 0x1Cu);
}

void spaceman_alloc_cold_4()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  v0[0] = 136315650;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s Found enough data to allocate outside the soft block-out range, re-enable soft block-out range\n", (uint8_t *)v0, 0x1Cu);
}

void spaceman_alloc_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to update chunk for alloc zone %d: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_alloc_cold_6()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to update chunk for alloc zone %d: %d\n", v1, v2, v3, v4, v5);
}

void spaceman_alloc_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to move roving pointer for dev %d error %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_alloc_cold_8()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to move roving pointer for dev %d error %d\n", v1, v2, v3, v4, v5);
}

void spaceman_modify_bits_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to free internal pool block %lld: %d\n", v1, v2, v3, v4, v5);
}

void spaceman_modify_bits_cold_2()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to create bitmap object %lld: %d\n", v1, v2, v3, v4, v5);
}

void spaceman_modify_bits_cold_3()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to allocate block from internal pool: %d\n", v1, v2, v3, v4, 2u);
}

uint64_t spaceman_modify_bits_cold_4(uint64_t a1, uint64_t a2, char a3)
{
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v4, "%s:%d: %s failed to allocate block from internal pool: %d\n", v5, v6, v7, v8, v10);
  return a3 & 1;
}

void spaceman_modify_bits_cold_5()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to free internal pool block %lld: %d\n", v1, v2, v3, v4, v5);
}

void spaceman_modify_bits_cold_6()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to allocate block from internal pool: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_free_fs_deduct_block_counts_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s spaceman fs reserve alloc count underflow: %lld (%lld)\n", v1, v2, v3, v4, 2u);
}

void spaceman_fq_tree_insert_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s removal of replaced free extent failed: %d\n", v1, v2, v3, v4, 2u);
}

void spaceman_unreserve_cold_1()
{
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_21_2();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fs reserved space underflow: %lld (%lld)\n", v1, v2, v3, v4, 2u);
}

void spaceman_unreserve_cold_2()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s fs reserved space underflow: %lld (%lld)\n", v1, v2, v3, v4, 2u);
}

void spaceman_fs_bounds_clear_cold_1(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  obj_oid(a1);
  v1[0] = 136316418;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_3();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s file system %lld fs reserve alloc count %lld larger than global fs reserve alloc count %lld\n", (uint8_t *)v1, 0x3Au);
}

void spaceman_fs_bounds_clear_cold_2(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  obj_oid(a1);
  v1[0] = 136316418;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_3();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s file system %lld fs reserve block count %lld larger than global fs reserve block count %lld\n", (uint8_t *)v1, 0x3Au);
}

void spaceman_ip_freed_cold_1()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s attempt to free block(s) outside of internal pool: 0x%llx:0x%llx\n", v1, v2, v3, v4, v5);
}

void btree_node_reap_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  obj_oid(a2);
  v2[0] = 136316162;
  OUTLINED_FUNCTION_15_4();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s obj_modify(fs %lld) failed: %d\n", (uint8_t *)v2, 0x2Cu);
}

void btree_node_reap_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  obj_oid(a2);
  v2[0] = 136316162;
  OUTLINED_FUNCTION_15_4();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s obj_modify(fs %lld) failed: %d\n", (uint8_t *)v2, 0x2Cu);
}

void bt_insert_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_insert_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_insert_cold_3()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_insert_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_insert_cold_5()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_insert_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, v5);
}

void bt_insert_cold_7()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_insert_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, v5);
}

void bt_insert_cold_9()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_insert_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_shift_or_split failed with error: %d\n", v1, v2, v3, v4, v5);
}

void btree_node_entry_update_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, 2u);
}

void btree_node_entry_update_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, v5);
}

void btree_node_entry_update_cold_3()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, 2u);
}

void btree_node_entry_update_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, v5);
}

void btree_node_entry_update_cold_5()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to reclaim just-freed val space on error path: %d\n", v1, v2, v3, v4, 2u);
}

void btree_node_entry_update_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to reclaim just-freed val space on error path: %d\n", v1, v2, v3, v4, v5);
}

void btree_node_entry_update_cold_7()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to reclaim just-freed key space on error path: %d\n", v1, v2, v3, v4, 2u);
}

void btree_node_entry_update_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to reclaim just-freed key space on error path: %d\n", v1, v2, v3, v4, v5);
}

void btree_node_insert_internal_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, 2u);
}

void btree_node_insert_internal_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, v5);
}

void btree_node_insert_internal_cold_3()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, 2u);
}

void btree_node_insert_internal_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable allocate space that should be there: %d\n", v1, v2, v3, v4, v5);
}

void btree_node_child_id_update_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s invalid relative OID: %llu < root OID: %llu\n", v1, v2, v3, v4, 2u);
}

void btree_node_child_id_update_cold_2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s invalid relative OID: %llu < root OID: %llu\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_3()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_4()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_5()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_insert() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_6()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_insert() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_7()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_8()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_9()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_10()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_11()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_12()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_13()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_14()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries() failed (%d) while trying to revert changes due to error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_15()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_16()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_17()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s reverting on error: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_18()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s reverting on error: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_19()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_20()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_21()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get newnode minkey: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_22()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get newnode minkey: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_23()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_24()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_25()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_26()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_27()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_28()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_insert failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_29()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_30()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_31()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_32()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_33()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_34()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_35()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_36()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_37()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_38()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_shift_or_split_cold_39()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_shift_or_split_cold_40()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s bt_move_entries %d failed: %d\n", v1, v2, v3, v4, v5);
}

void btree_node_insert_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s invalid relative OID: %llu < root OID: %llu\n", v1, v2, v3, v4, 2u);
}

void btree_node_insert_cold_2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s invalid relative OID: %llu < root OID: %llu\n", v1, v2, v3, v4, 2u);
}

void bt_remove_internal_cold_1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_21_3(*MEMORY[0x263EF8340]);
  obj_oid(v3);
  obj_subtype(a2);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v4, "%s:%d: %s minkey update traversal unexpectedly found the removed key in level 1 node; oid %llu subtype 0x%x level %d\n",
    v5,
    v6,
    v7,
    v8,
    2u);
}

void bt_remove_internal_cold_2(uint64_t a1, uint64_t a2)
{
  obj_oid(a2);
  obj_subtype(a2);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s minkey update traversal unexpectedly found the removed key in level 1 node; oid %llu subtype 0x%x level %d\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void bt_remove_internal_cold_3()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_remove_internal_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_remove_internal_cold_5()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_remove_internal_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
}

void bt_merge_up_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s updating grandparent failed w/%d\n", v1, v2, v3, v4, 2u);
}

void bt_merge_up_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s updating grandparent failed w/%d\n", v1, v2, v3, v4, v5);
}

void btree_iterate_nodes_cold_1(uint64_t a1, int a2, uint64_t a3)
{
  OUTLINED_FUNCTION_22_3(a1, a2, a3);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s level %d node 0x%llx index %d: more levels than expected\n", v4, v5, v6, v7, 2u);
}

void btree_iterate_nodes_cold_2(uint64_t a1, int a2, uint64_t a3)
{
  OUTLINED_FUNCTION_22_3(a1, a2, a3);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s level %d node 0x%llx index %d: more levels than expected\n", v4, v5, v6, v7, 2u);
}

void btree_delete_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_21_3(*MEMORY[0x263EF8340]);
  obj_oid(v2);
  obj_type_and_flags(a1);
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s error adding btree 0x%llx type 0x%x to reap list: %d\n", v4, v5, v6, v7, 2u);
}

void btree_delete_cold_2(uint64_t a1, uint64_t a2)
{
  obj_oid(a2);
  obj_type_and_flags(a2);
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_10(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s error adding btree 0x%llx type 0x%x to reap list: %d\n", v4, v5, v6, v7, 2u);
}

void bt_update_last_leaf_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to update rightmost leaf field: %d\n", v1, v2, v3, v4, 2u);
}

void bt_update_last_leaf_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to update rightmost leaf field: %d\n", v1, v2, v3, v4, v5);
}

void bt_merge_nodes_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to move all entries: %d\n", v1, v2, v3, v4, 2u);
}

void bt_merge_nodes_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to move all entries: %d\n", v1, v2, v3, v4, v5);
}

void bt_merge_nodes_cold_3()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, 2u);
}

void bt_merge_nodes_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s btree_node_key_update failed: %d\n", v1, v2, v3, v4, v5);
}

void userfs_fd_is_apfs_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: couldn't allocate memory for superblock of size %d\n", v1, v2, v3, v4, 2u);
}

void userfs_fd_is_apfs_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: superblock does not look reasonable: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_fd_is_apfs_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: couldn't read superblock of size %d\n", v1, v2, v3, v4, 2u);
}

void userfs_fd_is_apfs_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to initialize device: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_apfs_get_next_vol_cold_1(void *a1, uint64_t a2, int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*a1 + 8 * a2 + 184);
  int v4 = 136315906;
  uint8_t v5 = "userfs_apfs_get_next_vol";
  __int16 v6 = 1024;
  int v7 = 103;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  __int16 v10 = 1024;
  int v11 = a3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: failed to get fs oid %lld: %d\n", (uint8_t *)&v4, 0x22u);
}

void userfs_apfs_mount_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_apfs_load_nodes failed, err: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_apfs_mount_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: No entry for root dir!\n", v1, v2, v3, v4, 2u);
}

void userfs_apfs_mount_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: FAILED TO LOAD THE ROOT INODE!\n", v1, v2, v3, v4, 2u);
}

void userfs_apfs_mount_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: No entry for private metadata dir!\n", v1, v2, v3, v4, 2u);
}

void userfs_apfs_mount_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: FAILED TO LOAD THE PRIVATE DIR INODE!\n", v1, v2, v3, v4, 2u);
}

void userfs_apfs_mount_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to revert snapshot, err: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_apfs_mount_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: apfs_mount failed, err: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_nx_mount_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: nx_mount failed: %d\n", v1, v2, v3, v4, 2u);
}

void userfs_nx_mount_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: device initialization failed: %d\n", v1, v2, v3, v4, 2u);
}

void nx_get_evict_mapping_tree_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_30(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s found mapping tree with old subtype\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_checkpoint_traverse_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get reap list object oid %lld: %d\n", v1, v2, v3, v4, v5);
}

void nx_reaper_checkpoint_traverse_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get object oid %lld: %d\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_obj_get_cold_1()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get object 0x%llx: %d\n", v1, v2, v3, v4, v5);
}

void nx_reaper_obj_get_cold_2()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s unable to get fs object 0x%llx: %d\n", v1, v2, v3, v4, v5);
}

void nx_reaper_add_cold_1()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s object type 0x%x not reapable: %d\n", v1, v2, v3, v4, v5);
}

void nx_reaper_add_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s reap list object free list erroneously empty?\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_add_cold_3()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s reap list object free list erroneously empty?\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_add_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to create reap list: %d\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_add_cold_5()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get reap list tail: %d\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_add_sub_object_cold_1()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_83(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s object type 0x%x not reapable: %d\n", v1, v2, v3, v4, v5);
}

void nx_reaper_add_sub_object_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s reap list object free list erroneously empty?\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_add_sub_object_cold_3()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s reap list object free list erroneously empty?\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_add_sub_object_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get reap list head: %d\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_add_sub_object_cold_5()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to create reap list: %d\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_add_sub_object_cold_6()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get reap list head: %d\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)((char *)&v0[3] + 2) = 1792;
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: reaper thread is exiting, returning EBUSY\n", (uint8_t *)v0, 0x12u);
}

void nx_reaper_wait_cold_1()
{
  OUTLINED_FUNCTION_22_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s invalid reap_id (%llu), must be smaller than nr_next_reap_id (%llu)\n", v1, v2, v3, v4, v5);
}

void nx_metadata_range_add_cold_1(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_34(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s failed to get next extent in metadata fragmented extent list tree, error %s(%d)\n", v3, v4, v5, v6, 2u);
}

void nx_metadata_range_optimize_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error removing coalesced extent from metadata ranges tree: %d\n", v1, v2, v3, v4, 2u);
}

void nx_metadata_range_optimize_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s error updating metadata ranges tree: %d\n", v1, v2, v3, v4, 2u);
}

void nx_unblock_physical_range_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tx_leave failed with error: %d\n", v1, v2, v3, v4, 2u);
}

void nx_unblock_physical_range_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s spaceman_unset_block_out_range failed with error %u\n", v1, v2, v3, v4, 2u);
}

void nx_unblock_physical_range_cold_3()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to delete mapping, error: %d\n", v1, v2, v3, v4, 2u);
}

void nx_unblock_physical_range_cold_4()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get mapping tree, error: %d\n", v1, v2, v3, v4, 2u);
}

void nx_reaper_next_record_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to get reap list head: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_udirop_rmdir_internal_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a2 + 8);
  int v5 = 136316162;
  uint64_t v6 = "apfs_udirop_rmdir_internal";
  __int16 v7 = 1024;
  int v8 = 119;
  __int16 v9 = 2048;
  uint64_t v10 = v3;
  __int16 v11 = 2048;
  uint64_t v12 = v4;
  __int16 v13 = 1024;
  int v14 = a3;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Failed to move ino %lld to purgatory from dir %lld : %d\n", (uint8_t *)&v5, 0x2Cu);
}

void apfs_udirop_rmdir_internal_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: remove_dir_entry failed, err %d\n", v1, v2, v3, v4, 2u);
}

void apfs_udirop_rmdir_internal_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to enter delete txn for removal of directory, err %d\n", v1, v2, v3, v4, 2u);
}

void apfs_udirop_rmdir_internal_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
}

void apfs_udirop_rmdir_internal_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_internal_lookup returned %d\n", v1, v2, v3, v4, 2u);
}

void apfs_udirop_mkdir_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: apfs_udirop_rmdir_internal failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_udirop_mkdir_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_set_ufa_common failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_udirop_scanids_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v1[7] = 627;
  v1[9] = 2048;
  uint64_t v2 = v0;
  __int16 v3 = 2048;
  uint64_t v4 = 0x3FFFLL;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: File-system does not support some of the requested attributes 0x%llx, supported attributes 0x%llu\n", (uint8_t *)v1, 0x26u);
}

void apfs_ufileop_setattr_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_set_ufa_common failed: error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_lookup_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Inode %llu not a directory. Aborting.\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_symlink_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_internal_remove failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_symlink_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_set_ufa_common failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_link_cold_1()
{
  OUTLINED_FUNCTION_89(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to create sibling link entry on child of %llu pointing to %llu, error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_link_cold_2()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to create sibling link for ino %llu, error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_link_cold_3()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to set the sibling id on ino %llu\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_link_cold_4()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to look up drec for inode %llu, error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_read_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Read: danger! read on a dead inode (%llu)!\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_read_cold_2()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 136316162;
  OUTLINED_FUNCTION_11();
  *(_DWORD *)&v3[7] = 975;
  v3[9] = 2048;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: Unaligned read starts at non zero offset %llu for obj-id %lld/%lld\n", (uint8_t *)v3, 0x30u);
}

void apfs_ufileop_read_cold_3()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Failed to allocate read block buffer while attempting to read inode (%llu)!\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: No memory for unaligned write buffer (for inode %llu)!\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_2()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to create dstream (ino %llu), error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to remove prev_fsize: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_4()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_5();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to write %llu blocks to disk at pbn %llu, err %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to read-modify during write: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: write blockmap failed: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: alloc_space_for_write failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: clone_extents_if_needed failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_write_cold_9()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Cannot write to dead inode (%llu)\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_getxattr_data_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: unknown style of xattr (flags 0x%x) on xattr %s\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_setxattr_cold_1()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: ino %llu, xattr '%s', xattr tmp inode deallocation failed, err %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_setxattr_cold_2()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: tree_lookup() under ino %llu, xattr '%s' failed, err %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_setxattr_cold_3()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: ino %llu, xattr '%s', removing the old xattr failed with %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_setxattr_cold_4()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  v0[0] = 136316162;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_15_5();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: failed to enter transaction sized %llu on ino %llu, err %d\n", (uint8_t *)v0, 0x2Cu);
}

void apfs_ufileop_setxattr_cold_5()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: couldn't get dstream from tmp inode %llu, owner %llu\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_setxattr_cold_6()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: ino %llu, xattr '%s', couldn't look up the fsroot tree, err %d\n", v1, v2, v3, v4, 2u);
}

void userfs_write_xattr_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  *(_DWORD *)uint64_t v3 = 136316162;
  OUTLINED_FUNCTION_2_0();
  *(_DWORD *)&v3[7] = 2065;
  v3[9] = 2048;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: attempting to write past (%zu bytes) the allocated size (%llu bytes) of a temporary xattr inode: %llu\n", (uint8_t *)v3, 0x30u);
}

void userfs_write_xattr_cold_2()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: xattr-dstream-obj-id %lld has a hole at offset %lld\n", v1, v2, v3, v4, 2u);
}

void userfs_write_xattr_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: mapped %llu blocks for writing the partial last block, expencted 1 block.\n", v1, v2, v3, v4, 2u);
}

void userfs_write_xattr_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_20_4();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: write offset (%llu bytes) not aligned to file-system block size (%u bytes)", v1, v2, v3, v4, 2u);
}

void userfs_write_xattr_cold_5()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to allocate write block buffer while attempting to write xattr temporary inode (%llu)!\n", v1, v2, v3, v4, 2u);
}

void userfs_free_old_xattr_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: removing xattr extents under ino %llu, id %llu, failed with %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_create_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_internal_remove failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_create_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_set_ufa_common failed with error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_1()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to delete target inode (%llu) that was renamed-over: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: there is no drec for ino %lld\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_3(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: could not re-set dir-stats on ino %llu after rename failure: %s (%d); space tracking may go out of sync\n",
    v3,
    v4,
    v5,
    v6,
    2u);
}

void apfs_ufileop_rename_cold_4()
{
  OUTLINED_FUNCTION_24_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to RE-insert orig from_drec %lld:%s ino %lld error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_5()
{
  OUTLINED_FUNCTION_24_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to insert updated to_drec %lld:%s ino %lld error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_6()
{
  OUTLINED_FUNCTION_89(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to set the drec SIBLING id %lld for ino %lld\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_7()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: Failed to move ino %lld to purgatory from dir %lld : %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_8()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: failed to update ino %lld error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_9()
{
  OUTLINED_FUNCTION_42(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: *** to ino %lld has nlink %d!\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_10(int a1, int a2, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: could not set dir-stats on ino %llu before it is moved to dir %llu: %s (%d); space tracking may go out of sync\n",
    v4,
    v5,
    v6,
    v7,
    2u);
}

void apfs_ufileop_rename_cold_11()
{
  OUTLINED_FUNCTION_89(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: *#*#*#* from_ino %lld has nlink %d but no sibling link on the drec %lld:%s\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_12()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_13()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: the source inode for rename has been deleted and does not match the looked up inode, source ino %llu, looked up ino %llu\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_14()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_load_inode returned %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_rename_cold_15()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: userfs_internal_lookup returned %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_stream_lookup_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: fs_get_xattr_dstream(): error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_stream_lookup_cold_2()
{
  OUTLINED_FUNCTION_57(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: fs_get_xattr(%lld, %s): error %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_stream_read_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: fs_calloc of %d failed\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_stream_read_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_20_4();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: dev_read_data of %lu blocks failed: %d\n", v1, v2, v3, v4, 2u);
}

void apfs_ufileop_stream_read_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: lookup_file_extent failed: %d\n", v1, v2, v3, v4, 2u);
}

void set_ino_purgeable_state_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_19_4();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Volume has unsupported purgeable record type: %u\n", v1, v2, v3, v4, 2u);
}

void set_ino_purgeable_state_cold_2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136316418;
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_14_1();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s did not find purgeable record for ino %lld (parent id %lld) (fsize %lld)\n", (uint8_t *)v2, 0x3Au);
}

void set_ino_purgeable_state_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s Failed to mark the dir-stats record for ino %llu as purgeable: error %d (%s)\n", v4, v5, v6, v7, 2u);
}

void set_ino_purgeable_state_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s Failed to set purgeable start time for ino %lld: error %d (%s)\n", v4, v5, v6, v7, 2u);
}

void set_ino_purgeable_state_cold_5()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to set the dir-gen-count xf field on the purgeable rec for ino %lld : err %d\n", v1, v2, v3, v4, v5);
}

void set_ino_purgeable_state_cold_6()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s ino %llu is compressed and this volume does not support compressed purgeable files.\n", v1, v2, v3, v4, 2u);
}

void set_ino_purgeable_state_cold_7()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s The directory hierarchy rooted at ino %llu was modified - please retry.\n", v1, v2, v3, v4, 2u);
}

void child_size_calculator_cb_cold_1()
{
  OUTLINED_FUNCTION_21_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s directory has an illegal hardlinked child (dir: %lld ; child ino %lld)\n",
    v1,
    v2,
    v3,
    v4,
    2u);
}

void child_size_calculator_cb_cold_2()
{
  OUTLINED_FUNCTION_21_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s directory has an illegal sub-directory (dir: %lld ; sub-dir ino %lld)\n",
    v1,
    v2,
    v3,
    v4,
    2u);
}

void child_size_calculator_cb_cold_3()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  v0[0] = 136315906;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s directory sizing aborted (dir: %lld)\n", (uint8_t *)v0, 0x26u);
}

void insert_purgeable_record_cold_1()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Cannot insert purgeable record with zero atime (ino %llu).\n", v1, v2, v3, v4, 2u);
}

void insert_purgeable_record_cold_2(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to insert purgeable record (drec): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void insert_purgeable_record_cold_3(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to create purgeable record (drec): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void insert_purgeable_record_cold_4()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Purgeable start time (%llu) is unsupported on purgeable drecs.\n", v1, v2, v3, v4, 2u);
}

void insert_purgeable_record_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to set purgeable drec's dir gen-count: error %d\n", v1, v2, v3, v4, v5);
}

void insert_purgeable_record_cold_6(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to insert purgeable record (record): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void remove_purgeable_record_cold_1()
{
  OUTLINED_FUNCTION_38(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_16_0(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Cannot remove purgeable record with zero atime (ino %llu).\n", v1, v2, v3, v4, 2u);
}

void remove_purgeable_record_cold_2(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to remove purgeable record (drec): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void remove_purgeable_record_cold_3(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to create purgeable record (drec) for removal: %d (%s)\n", v3, v4, v5, v6, 2u);
}

void remove_purgeable_record_cold_4(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_50(a2, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to remove purgeable record (record): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void lookup_and_remove_purgeable_record_cold_1()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to lookup purgeable record for removal (ino %llu): error %d\n", v1, v2, v3, v4, v5);
}

void lookup_and_remove_purgeable_record_cold_2()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to remove purgeable record (ino %llu): error %d\n", v1, v2, v3, v4, v5);
}

void merge_ino_purgeable_flags_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s Failed to update purgeable record (drec) time/flags (ino %llu): %d (%s)\n", v4, v5, v6, v7, 2u);
}

void merge_ino_purgeable_flags_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s Failed to create purgeable record (drec) for time/flags modification (ino %llu): %d (%s)\n", v4, v5, v6, v7, 2u);
}

void merge_ino_purgeable_flags_cold_3(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s Failed to lookup purgeable record (record) for time/flags modification (ino %llu): %d (%s)\n", v4, v5, v6, v7, 2u);
}

void merge_ino_purgeable_flags_cold_4(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_5_3(a3, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v3, "%s:%d: %s Failed to insert purgeable record (record) for time/flags modification (ino %llu): %d (%s)\n", v4, v5, v6, v7, 2u);
}

void merge_ino_purgeable_flags_cold_5()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s:%d: %s Failed to remove existing purgeable record (ino %llu): %d\n", v0, 0x2Cu);
}

void merge_ino_purgeable_flags_cold_6()
{
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to find purgeable record (ino %llu) for flags merging: %d\n", v1, v2, v3, v4, v5);
}

void lookup_purgeable_drec_as_record_cold_1()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to lookup purgeable drec (id %llu): error %d\n", v1, v2, v3, v4, v5);
}

void lookup_purgeable_drec_as_record_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to set purgeable rec's dir gen-count: error %d\n", v1, v2, v3, v4, v5);
}

void lookup_purgeable_drec_as_record_cold_3(int a1, int __errnum)
{
  strerror(__errnum);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_35(&dword_22CAAC000, &_os_log_internal, v2, "%s:%d: %s Failed to create purgeable record (drec) for lookup (ino %llu): %d (%s)\n", v3, v4, v5, v6, 2u);
}

void lookup_purgeable_drec_as_record_cold_4()
{
  OUTLINED_FUNCTION_22(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_19_4();
  OUTLINED_FUNCTION_18_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to find host inode (id %llu) for purgeable drec lookup, falling back to ino %llu\n", v1, v2, v3, v4, v5);
}

void _remove_purgeable_record_cb_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Failed to get file ID from purgeable record key/val: error %d\n", v1, v2, v3, v4, v5);
}

void _remove_purgeable_record_cb_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Unknown purgeable record type (%hhu)\n", v1, v2, v3, v4, v5);
}

void _remove_purgeable_record_cb_cold_3()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = 136316162;
  uint64_t v3 = "_remove_purgeable_record_cb";
  __int16 v4 = 1024;
  OUTLINED_FUNCTION_0_0();
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s Invalid purgeable record type %u found on volume expecting type %u\n", (uint8_t *)&v2, 0x28u);
}

void tx_checkpoint_write_cold_1()
{
  OUTLINED_FUNCTION_9_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to write checkpoint data block %lld: %d\n", v1, v2, v3, v4, 2u);
}

void tx_checkpoint_write_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136316162;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s error getting next checkpoint data block address %d: %d\n", (uint8_t *)v0, 0x28u);
}

void tx_checkpoint_write_cold_3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136316162;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_22CAAC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:%d: %s error getting next checkpoint map block address %d: %d\n", (uint8_t *)v0, 0x28u);
}

void tx_checkpoint_write_cold_4()
{
  OUTLINED_FUNCTION_9_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to write checkpoint map block %lld: %d\n", v1, v2, v3, v4, 2u);
}

void tx_unmount_cold_1()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s tx_finish() failed, %d\n", v1, v2, v3, v4, 2u);
}

void tx_unmount_cold_2()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s Final sync/barrier failed: %d\n", v1, v2, v3, v4, 2u);
}

void tx_unmount_cold_3()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to write superblock to fusion tier2 device block 0: %d\n", v1, v2, v3, v4, 2u);
}

void tx_unmount_cold_4()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s failed to write superblock to block 0: %d\n", v1, v2, v3, v4, 2u);
}

void tx_unmount_cold_5()
{
  OUTLINED_FUNCTION_3_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s First sync/barrier failed: %d\n", v1, v2, v3, v4, 2u);
}

void tx_flush_cold_1()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s xid %lld second sync/barrier failed: %d\n", v1, v2, v3, v4, 2u);
}

void tx_flush_cold_2()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s xid %lld failed to write superblock to fusion tier2 device block 0: %d\n", v1, v2, v3, v4, 2u);
}

void tx_flush_cold_3()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s xid %lld failed to write block 0 superblock: %d\n", v1, v2, v3, v4, 2u);
}

void tx_flush_cold_4()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s xid %lld sync/barrier failed: %d\n", v1, v2, v3, v4, 2u);
}

void tx_flush_cold_5()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s xid %lld error flushing objects from the cache: %d\n", v1, v2, v3, v4, 2u);
}

void tx_flush_cold_6()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_2(&dword_22CAAC000, &_os_log_internal, v0, "%s:%d: %s xid %lld error preparing to flush object cache: %d\n", v1, v2, v3, v4, 2u);
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78D0](*(void *)&op, *(void *)&mode, *(void *)&alg, *(void *)&padding, iv, key, keyLength, tweak);
}

uint64_t CCCryptorDecryptDataBlock()
{
  return MEMORY[0x270ED78D8]();
}

uint64_t CCCryptorEncryptDataBlock()
{
  return MEMORY[0x270ED78E0]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF3EE8](*(void *)&mainPort, *(void *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetParentIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF4A20](*(void *)&entry, plane, iterator);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _get_cpu_capabilities()
{
  return MEMORY[0x270ED7FF8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int aio_error(const aiocb *aiocbp)
{
  return MEMORY[0x270ED85B8](aiocbp);
}

int aio_read(aiocb *aiocbp)
{
  return MEMORY[0x270ED85C0](aiocbp);
}

ssize_t aio_return(aiocb *aiocbp)
{
  return MEMORY[0x270ED85C8](aiocbp);
}

int aio_suspend(const aiocb *const aiocblist[], int nent, const timespec *timeoutp)
{
  return MEMORY[0x270ED85D0](aiocblist, *(void *)&nent, timeoutp);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x270ED87D0]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x270ED87E0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x270ED87E8]();
}

uint64_t cccbc_clear_iv()
{
  return MEMORY[0x270ED8820]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x270ED8828]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x270ED8890]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x270ED88A0]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x270ED88B0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x270ED88B8]();
}

uint64_t ccder_blob_encode_implicit_raw_octet_string()
{
  return MEMORY[0x270ED88D8]();
}

uint64_t ccder_blob_encode_implicit_uint64()
{
  return MEMORY[0x270ED88E0]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x270ED88E8]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x270ED8980]();
}

uint64_t ccder_sizeof_implicit_uint64()
{
  return MEMORY[0x270ED8990]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x270ED89B0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t cchkdf()
{
  return MEMORY[0x270ED8BA8]();
}

uint64_t cchmac()
{
  return MEMORY[0x270ED8BC0]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x270ED8C40]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x270ED8C88]();
}

uint64_t ccrng()
{
  return MEMORY[0x270ED8C90]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

uint64_t freemntopts()
{
  return MEMORY[0x270F9BA00]();
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

uint64_t getmntoptnum()
{
  return MEMORY[0x270F9BA08]();
}

uint64_t getmntopts()
{
  return MEMORY[0x270F9BA10]();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x270EDA618](__rqtp, __rmtp);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void panic(const char *a1, ...)
{
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x270EDAC88](a1, *(void *)&a2);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDAC98](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x270EDACA0](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACA8](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACB8](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x270EDACC8](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x270EDAEB0](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
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

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x270EDB650](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

char *__cdecl strsignal(int __sig)
{
  return (char *)MEMORY[0x270EDB690](*(void *)&__sig);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x270EDB6D0](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}