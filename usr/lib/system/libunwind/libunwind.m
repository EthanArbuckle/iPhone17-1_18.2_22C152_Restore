uint64_t __libunwind_Registers_arm64_jumpto(uint64_t a1)
{
  return *(void *)a1;
}

int unw_getcontext(unw_context_t *a1)
{
  a1->data[0] = (uint64_t)a1;
  a1->data[1] = v1;
  a1->data[2] = v2;
  a1->data[3] = v3;
  a1->data[4] = v4;
  a1->data[5] = v5;
  a1->data[6] = v6;
  a1->data[7] = v7;
  a1->data[8] = v8;
  a1->data[9] = v9;
  a1->data[10] = v10;
  a1->data[11] = v11;
  a1->data[12] = v12;
  a1->data[13] = v13;
  a1->data[14] = v14;
  a1->data[15] = v15;
  a1->data[16] = v16;
  a1->data[17] = v17;
  a1->data[18] = v18;
  a1->data[19] = v19;
  a1->data[20] = v20;
  a1->data[21] = v21;
  a1->data[22] = v22;
  a1->data[23] = v23;
  a1->data[24] = v24;
  a1->data[25] = v25;
  a1->data[26] = v26;
  a1->data[27] = v27;
  a1->data[28] = v28;
  a1->data[29] = v29;
  a1->data[30] = v30;
  a1->data[31] = (uint64_t)&v64;
  a1->data[32] = v30;
  a1->data[34] = v31;
  a1->data[35] = v32;
  a1->data[36] = v33;
  a1->data[37] = v34;
  a1->data[38] = v35;
  a1->data[39] = v36;
  a1->data[40] = v37;
  a1->data[41] = v38;
  a1->data[42] = v39;
  a1->data[43] = v40;
  a1->data[44] = v41;
  a1->data[45] = v42;
  a1->data[46] = v43;
  a1->data[47] = v44;
  a1->data[48] = v45;
  a1->data[49] = v46;
  a1->data[50] = v47;
  a1->data[51] = v48;
  a1->data[52] = v49;
  a1->data[53] = v50;
  a1->data[54] = v51;
  a1->data[55] = v52;
  a1->data[56] = v53;
  a1->data[57] = v54;
  a1->data[58] = v55;
  a1->data[59] = v56;
  a1->data[60] = v57;
  a1->data[61] = v58;
  a1->data[62] = v59;
  a1->data[63] = v60;
  a1->data[64] = v61;
  a1->data[65] = v62;
  return 0;
}

int unw_init_local(unw_cursor_t *a1, unw_context_t *a2)
{
  a1->data[0] = (uint64_t)&unk_26C224DD0;
  a1->data[1] = (uint64_t)&libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(&a1->data[2], a2, 0x110uLL);
  long long v4 = *(_OWORD *)&a2->data[40];
  long long v6 = *(_OWORD *)&a2->data[34];
  long long v5 = *(_OWORD *)&a2->data[36];
  *(_OWORD *)&a1->data[40] = *(_OWORD *)&a2->data[38];
  *(_OWORD *)&a1->data[42] = v4;
  *(_OWORD *)&a1->data[36] = v6;
  *(_OWORD *)&a1->data[38] = v5;
  long long v7 = *(_OWORD *)&a2->data[48];
  long long v9 = *(_OWORD *)&a2->data[42];
  long long v8 = *(_OWORD *)&a2->data[44];
  *(_OWORD *)&a1->data[48] = *(_OWORD *)&a2->data[46];
  *(_OWORD *)&a1->data[50] = v7;
  *(_OWORD *)&a1->data[44] = v9;
  *(_OWORD *)&a1->data[46] = v8;
  long long v10 = *(_OWORD *)&a2->data[56];
  long long v12 = *(_OWORD *)&a2->data[50];
  long long v11 = *(_OWORD *)&a2->data[52];
  *(_OWORD *)&a1->data[56] = *(_OWORD *)&a2->data[54];
  *(_OWORD *)&a1->data[58] = v10;
  *(_OWORD *)&a1->data[52] = v12;
  *(_OWORD *)&a1->data[54] = v11;
  long long v13 = *(_OWORD *)&a2->data[64];
  long long v15 = *(_OWORD *)&a2->data[58];
  long long v14 = *(_OWORD *)&a2->data[60];
  *(_OWORD *)&a1->data[64] = *(_OWORD *)&a2->data[62];
  *(_OWORD *)&a1->data[66] = v13;
  *(_OWORD *)&a1->data[60] = v15;
  *(_OWORD *)&a1->data[62] = v14;
  a1->data[34] = a1->data[34];
  *(_OWORD *)&a1->data[68] = 0u;
  *(_OWORD *)&a1->data[70] = 0u;
  *(_OWORD *)&a1->data[72] = 0u;
  *(_OWORD *)&a1->data[74] = 0u;
  *(_OWORD *)((char *)&a1->data[75] + 2) = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister((uint64_t)a1, 0);
  return 0;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister(uint64_t a1, unsigned int a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, 0xFFFFFFFFLL);
  if (!result) {
    goto LABEL_147;
  }
  unint64_t v5 = result - a2;
  uint64_t v86 = 0;
  long long v84 = 0u;
  long long v85 = 0u;
  if (_dyld_find_unwind_sections())
  {
    if (v74) {
      uint64_t v6 = v74;
    }
    else {
      uint64_t v6 = 0;
    }
    *(void *)&long long v84 = v6;
    if (v75) {
      uint64_t v8 = v75;
    }
    else {
      uint64_t v8 = 0;
    }
    *((void *)&v84 + 1) = v8;
    *(void *)&long long v85 = v76;
    if (v77) {
      long long v9 = v77;
    }
    else {
      long long v9 = 0;
    }
    *((void *)&v85 + 1) = v9;
    uint64_t v10 = v78;
  }
  else
  {
    pthread_rwlock_rdlock(&libunwind::findDynamicUnwindSectionsLock);
    if (!libunwind::numDynamicUnwindSectionsFinders)
    {
LABEL_9:
      pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
LABEL_138:
      pthread_rwlock_rdlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
      for (i = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]; ; i += 2)
      {
        if (i >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
        {
          uint64_t result = pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
          goto LABEL_147;
        }
        if (*((void *)i + 1) <= v5 && *((void *)i + 2) > v5) {
          break;
        }
      }
      v71 = (unsigned int *)*((void *)i + 3);
      uint64_t result = pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
      if (!v71) {
        goto LABEL_147;
      }
      uint64_t result = (uint64_t)libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(v71, &v79, (uint64_t)&v74, 0, v72, v73);
      if (result) {
        goto LABEL_147;
      }
      uint64_t result = libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromFdeCie();
      if ((result & 1) == 0) {
        goto LABEL_147;
      }
      return result;
    }
    uint64_t v7 = 0;
    while (!(*((unsigned int (**)(unint64_t, uint64_t *))&libunwind::dynamicUnwindSectionsFinders + v7))(v5, &v79))
    {
      if (++v7 == libunwind::numDynamicUnwindSectionsFinders) {
        goto LABEL_9;
      }
    }
    pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
    if (v79) {
      uint64_t v6 = v79;
    }
    else {
      uint64_t v6 = 0;
    }
    *(void *)&long long v84 = v6;
    if (v80) {
      uint64_t v8 = v80;
    }
    else {
      uint64_t v8 = 0;
    }
    *((void *)&v84 + 1) = v8;
    *(void *)&long long v85 = v81;
    if (v82) {
      long long v9 = v82;
    }
    else {
      long long v9 = 0;
    }
    *((void *)&v85 + 1) = v9;
    uint64_t v10 = v83;
  }
  uint64_t v86 = v10;
  if (!v9 || *v9 != 1) {
    goto LABEL_136;
  }
  if (v6) {
    uint64_t v11 = v6;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v5 - v11;
  unsigned int v13 = v9[6];
  long long v14 = (char *)v9 + v9[5];
  if (!v13)
  {
    unsigned int v17 = 0;
    goto LABEL_43;
  }
  unsigned int v15 = 0;
  unsigned int v16 = v13 - 1;
  while (1)
  {
    unsigned int v17 = (v13 + v15) >> 1;
    if (v12 < *(unsigned int *)&v14[12 * v17])
    {
      unsigned int v13 = (v13 + v15) >> 1;
      goto LABEL_36;
    }
    if (v17 == v16) {
      break;
    }
    unsigned int v15 = v17 + 1;
    if (v12 < *(unsigned int *)&v14[12 * v17 + 12]) {
      goto LABEL_43;
    }
LABEL_36:
    unsigned int v17 = v15;
    if (v15 >= v13) {
      goto LABEL_43;
    }
  }
  unsigned int v17 = v16;
LABEL_43:
  uint64_t v18 = 12 * v17;
  uint64_t v19 = &v14[v18];
  uint64_t v20 = 12 * (v17 + 1);
  unint64_t v21 = *(unsigned int *)&v14[v20];
  uint64_t v22 = (char *)v9 + *(unsigned int *)&v14[v18 + 4];
  uint64_t v23 = v14 + 8;
  uint64_t v24 = *(unsigned int *)&v14[v18 + 8];
  int v25 = *(_DWORD *)&v23[v20];
  if (*(_DWORD *)v22 == 3)
  {
    uint64_t result = *(unsigned int *)v19;
    uint64_t v32 = &v22[*((unsigned __int16 *)v22 + 2)];
    unsigned int v33 = *((unsigned __int16 *)v22 + 3);
    unsigned int v34 = v33 - 1;
    if (*((_WORD *)v22 + 3))
    {
      unsigned int v35 = 0;
      unsigned int v36 = v12 - result;
      while (1)
      {
        unsigned int v37 = (v33 + v35) >> 1;
        if ((*(_DWORD *)&v32[4 * v37] & 0xFFFFFFu) > v36)
        {
          unsigned int v33 = (v33 + v35) >> 1;
        }
        else
        {
          if (v37 == v34)
          {
            unsigned int v37 = v34;
            goto LABEL_68;
          }
          unsigned int v35 = v37 + 1;
          if ((*(_DWORD *)&v32[4 * v37 + 4] & 0xFFFFFFu) > v36) {
            goto LABEL_68;
          }
        }
        unsigned int v37 = v35;
        if (v35 >= v33) {
          goto LABEL_68;
        }
      }
    }
    unsigned int v37 = 0;
LABEL_68:
    unint64_t v38 = *(unsigned int *)&v32[4 * v37];
    unint64_t v39 = (v38 & 0xFFFFFF) + result;
    if (v6)
    {
      uint64_t v40 = v6;
      v39 += v6;
      uint64_t v41 = v6;
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v41 = 0;
    }
    if (v37 < v34)
    {
      LODWORD(v21) = (*(_DWORD *)&v32[4 * v37 + 4] & 0xFFFFFF) + result;
      uint64_t v41 = v40;
    }
    unint64_t v21 = v41 + v21;
    if (v39 > v5 || v21 < v5) {
      goto LABEL_136;
    }
    unint64_t v43 = v38 >> 24;
    unsigned int v44 = v9[2];
    if (v44 <= HIBYTE(*(_DWORD *)&v32[4 * v37]))
    {
      uint64_t v46 = 4 * (unsigned __int16)(v43 - v44);
      uint64_t v45 = &v22[*((unsigned __int16 *)v22 + 4)];
    }
    else
    {
      uint64_t v45 = (char *)v9[1];
      uint64_t v46 = (uint64_t)&v9[v43];
    }
    unsigned int v47 = *(_DWORD *)&v45[v46];
    goto LABEL_93;
  }
  if (*(_DWORD *)v22 != 2) {
    goto LABEL_136;
  }
  uint64_t result = (uint64_t)&v22[*((unsigned __int16 *)v22 + 2)];
  unsigned int v26 = *((unsigned __int16 *)v22 + 3);
  if (!*((_WORD *)v22 + 3))
  {
    unsigned int v28 = 0;
    unint64_t v21 = 0;
    goto LABEL_85;
  }
  unsigned int v27 = 0;
  unsigned int v28 = v26 - 1;
  while (2)
  {
    unsigned int v29 = (v26 + v27) >> 1;
    if (v12 < *(unsigned int *)(8 * v29 + result))
    {
      unsigned int v26 = (v26 + v27) >> 1;
LABEL_48:
      if (v27 >= v26)
      {
        unint64_t v21 = 0;
        unsigned int v28 = v27;
        goto LABEL_85;
      }
      continue;
    }
    break;
  }
  if (v29 != v28)
  {
    unsigned int v27 = v29 + 1;
    unint64_t v30 = *(unsigned int *)(8 * (v29 + 1) + result);
    if (v12 < v30)
    {
      if (v6) {
        uint64_t v31 = v6;
      }
      else {
        uint64_t v31 = 0;
      }
      unint64_t v21 = v31 + v30;
      unsigned int v28 = v29;
      goto LABEL_85;
    }
    goto LABEL_48;
  }
  if (v6) {
    v21 += v6;
  }
LABEL_85:
  uint64_t v48 = *(unsigned int *)(result + 8 * v28);
  unsigned int v47 = *(_DWORD *)(result + 8 * v28 + 4);
  if (v6)
  {
    uint64_t result = (uint64_t)&v84;
    uint64_t v49 = v6;
  }
  else
  {
    uint64_t v49 = 0;
  }
  unint64_t v39 = v49 + v48;
  if (v39 > v5 || v21 < v5)
  {
LABEL_136:
    if (!v8) {
      goto LABEL_138;
    }
    uint64_t result = libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromDwarfSection(a1, v5, (uint64_t *)&v84, 0);
    if ((result & 1) == 0) {
      goto LABEL_138;
    }
    return result;
  }
LABEL_93:
  if ((v47 & 0x40000000) != 0)
  {
    if (v6) {
      int v56 = v6;
    }
    else {
      int v56 = 0;
    }
    unsigned int v58 = v25 - v24;
    if ((v25 - v24) < 8) {
      goto LABEL_136;
    }
    unsigned int v59 = 0;
    uint64_t v60 = (char *)v9 + v24;
    unsigned int v61 = v39 - v56;
    unsigned int v62 = v58 >> 3;
    while (1)
    {
      uint64_t result = (v62 + v59) >> 1;
      unsigned int v63 = *(_DWORD *)&v60[8 * result];
      if (v63 == v61) {
        break;
      }
      if (v63 >= v61) {
        unsigned int v62 = result;
      }
      else {
        unsigned int v59 = result + 1;
      }
      if (v59 >= v62) {
        goto LABEL_136;
      }
    }
    uint64_t v64 = *(unsigned int *)&v60[8 * result + 4];
    uint64_t v65 = v6 ? v6 : 0;
    uint64_t v51 = v65 + v64;
    if (!v51) {
      goto LABEL_136;
    }
  }
  else
  {
    uint64_t v51 = 0;
  }
  int v52 = (v47 >> 28) & 3;
  if (v52)
  {
    unsigned int v53 = v52 - 1;
    if (v53 >= v9[4]) {
      goto LABEL_136;
    }
    uint64_t v54 = *(int *)((char *)&v9[v53] + v9[3]);
    if (v6) {
      uint64_t v55 = v6;
    }
    else {
      uint64_t v55 = 0;
    }
    uint64_t v57 = *(void *)(v55 + v54);
  }
  else
  {
    uint64_t v57 = 0;
  }
  if (v39) {
    unint64_t v66 = v39;
  }
  else {
    unint64_t v66 = 0;
  }
  *(void *)(a1 + 544) = v66;
  if (v21) {
    unint64_t v67 = v21;
  }
  else {
    unint64_t v67 = 0;
  }
  *(void *)(a1 + 552) = v67;
  if (v51) {
    uint64_t v68 = v51;
  }
  else {
    uint64_t v68 = 0;
  }
  *(void *)(a1 + 560) = v68;
  *(void *)(a1 + 568) = v57;
  *(void *)(a1 + 584) = 0;
  *(void *)(a1 + 576) = 0;
  *(_DWORD *)(a1 + 592) = v47;
  *(void *)(a1 + 600) = 0;
  v69 = (void *)(a1 + 608);
  *(_DWORD *)(a1 + 596) = 0;
  if (v6)
  {
    void *v69 = v6;
    if ((*(_DWORD *)(v6 + 8) & 0xFFFFFF) != 2) {
      *(void *)(a1 + 584) = 1;
    }
  }
  else
  {
    void *v69 = 0;
  }
  if (v8 && (v47 & 0xF000000) == 0x3000000)
  {
    uint64_t result = libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromDwarfSection(a1, v5, (uint64_t *)&v84, v47 & 0xFFFFFF);
    if (result) {
      return result;
    }
    unsigned int v47 = *(_DWORD *)(a1 + 592);
  }
  if (!v47) {
LABEL_147:
  }
    *(unsigned char *)(a1 + 616) = 1;
  return result;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromDwarfSection(uint64_t a1, unint64_t a2, uint64_t *a3, unsigned int a4)
{
  if (!a4) {
    goto LABEL_12;
  }
  uint64_t v7 = a3[1];
  if (v7) {
    uint64_t v8 = (unint64_t *)a3[1];
  }
  else {
    uint64_t v8 = 0;
  }
  if (a3[2])
  {
    uint64_t v9 = a3[2];
    if (v7)
    {
LABEL_7:
      uint64_t v10 = v7;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_7;
    }
  }
  uint64_t v10 = 0;
LABEL_10:
  if (libunwind::CFI_Parser<libunwind::LocalAddressSpace>::findFDE(a2, v8, v9, (unint64_t *)(v10 + a4), v24, v23))
  {
    char v11 = 0;
LABEL_40:
    uint64_t result = libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromFdeCie();
    if (result)
    {
      if (a4) {
        char v21 = 1;
      }
      else {
        char v21 = v11;
      }
      if ((v21 & 1) == 0)
      {
        if (*a3) {
          uint64_t v22 = *a3;
        }
        else {
          uint64_t v22 = 0;
        }
        libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(v22, (uint64_t)v24[3], (uint64_t)v24[4], (uint64_t)v24[0]);
      }
      return 1;
    }
    return result;
  }
LABEL_12:
  if (*a3) {
    uint64_t v12 = *a3;
  }
  else {
    uint64_t v12 = 0;
  }
  pthread_rwlock_rdlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  for (i = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]; ; i += 2)
  {
    if (i >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
    {
      pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
      goto LABEL_26;
    }
    if ((v12 == -1 || *(void *)i == v12) && *((void *)i + 1) <= a2 && *((void *)i + 2) > a2) {
      break;
    }
  }
  long long v14 = (unint64_t *)*((void *)i + 3);
  pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  if (v14)
  {
    unsigned int v15 = a3[1] ? (unint64_t *)a3[1] : 0;
    uint64_t v20 = a3[2] ? a3[2] : 0;
    if (libunwind::CFI_Parser<libunwind::LocalAddressSpace>::findFDE(a2, v15, v20, v14, v24, v23))
    {
      char v11 = 1;
      goto LABEL_40;
    }
  }
LABEL_26:
  if (a3[1]) {
    unsigned int v16 = (unint64_t *)a3[1];
  }
  else {
    unsigned int v16 = 0;
  }
  if (a3[2]) {
    uint64_t v17 = a3[2];
  }
  else {
    uint64_t v17 = 0;
  }
  int FDE = libunwind::CFI_Parser<libunwind::LocalAddressSpace>::findFDE(a2, v16, v17, 0, v24, v23);
  char v11 = 0;
  uint64_t result = 0;
  if (FDE) {
    goto LABEL_40;
  }
  return result;
}

const char *libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(unsigned int *a1, void *a2, uint64_t a3, int a4, unint64_t a5, unint64_t *a6)
{
  uint64_t v10 = a1 + 1;
  uint64_t v9 = *a1;
  if (v9 != -1)
  {
    if (*a1) {
      goto LABEL_3;
    }
    return "FDE has zero length";
  }
  uint64_t v9 = *(void *)(a1 + 1);
  uint64_t v10 = a1 + 3;
  if (!v9) {
    return "FDE has zero length";
  }
LABEL_3:
  uint64_t v11 = *v10;
  if (!v11) {
    return "FDE is really a CIE";
  }
  uint64_t v12 = (unsigned int *)((char *)v10 - v11);
  if (a4)
  {
    if (*(unsigned int **)a3 != v12) {
      return "CIE start does not match";
    }
  }
  else
  {
    uint64_t result = libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseCIE(v12, a3);
    if (result) {
      return result;
    }
  }
  long long v14 = (unint64_t *)((char *)v10 + v9);
  unsigned int v27 = (unint64_t *)(v10 + 1);
  uint64_t EncodedP = libunwind::LocalAddressSpace::getEncodedP(&v27, v14, *(unsigned __int8 *)(a3 + 24), 0, a5, a6);
  uint64_t v18 = libunwind::LocalAddressSpace::getEncodedP(&v27, v14, *(unsigned char *)(a3 + 24) & 0xF, 0, v16, v17);
  a2[5] = 0;
  if (*(unsigned char *)(a3 + 49))
  {
    uint64_t ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v27, v14);
    uint64_t v22 = v27;
    uint64_t v23 = (unint64_t *)((char *)v27 + ULEB128);
    int v24 = *(unsigned __int8 *)(a3 + 25);
    if (v24 != 255)
    {
      if (libunwind::LocalAddressSpace::getEncodedP(&v27, v14, v24 & 0xF, 0, v20, v21))
      {
        unsigned int v27 = v22;
        a2[5] = libunwind::LocalAddressSpace::getEncodedP(&v27, v14, *(unsigned __int8 *)(a3 + 25), 0, v25, v26);
      }
    }
  }
  else
  {
    uint64_t v23 = v27;
  }
  uint64_t result = 0;
  *a2 = a1;
  a2[1] = (char *)v14 - (char *)a1;
  a2[2] = v23;
  a2[3] = EncodedP;
  a2[4] = v18 + EncodedP;
  return result;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfoFromFdeCie()
{
  uint64_t v0 = MEMORY[0x270FA53B0]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = v0;
  bzero(v10, 0x1218uLL);
  uint64_t result = libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseFDEInstructions();
  if (result)
  {
    *(void *)(v7 + 544) = v6[3];
    *(void *)(v7 + 552) = v6[4];
    *(void *)(v7 + 560) = v6[5];
    *(void *)(v7 + 568) = *(void *)(v4 + 32);
    *(void *)(v7 + 576) = v11;
    *(void *)(v7 + 584) = 0;
    *(_DWORD *)(v7 + 592) = 50331648;
    *(void *)(v7 + 600) = *v6;
    *(_DWORD *)(v7 + 596) = v6[1];
    uint64_t v9 = (void *)(v7 + 608);
    if (v2)
    {
      *uint64_t v9 = v2;
      if ((*(_DWORD *)(v2 + 8) & 0xFFFFFF) != 2) {
        *(void *)(v7 + 584) = 1;
      }
    }
    else
    {
      *uint64_t v9 = 0;
    }
  }
  return result;
}

uint64_t libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseFDEInstructions()
{
  uint64_t result = MEMORY[0x270FA53B0]();
  uint64_t v3 = (_DWORD *)v2;
  unint64_t v5 = v4;
  uint64_t v6 = (void *)result;
  LODWORD(result) = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v117[6] = *MEMORY[0x263EF8C08];
  uint64_t v10 = v4[1] + *v4;
  v117[0] = v4[2];
  v117[1] = v10;
  uint64_t v11 = v6[1] + *v6;
  uint64_t v13 = v6[2];
  uint64_t v12 = v6[3];
  v117[2] = -1;
  v117[3] = v13;
  long long v14 = (_OWORD *)(v2 + 568);
  v112 = &v115;
  v117[4] = v11;
  v117[5] = v15 - v12;
  while (1)
  {
    int v113 = result;
    unint64_t v16 = (unint64_t **)&v117[3 * v8];
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    unint64_t v19 = (unint64_t)v16[2];
    if (*v16 < v18 && v19 != 0) {
      break;
    }
LABEL_2:
    uint64_t result = 1;
    uint64_t v8 = 1;
    if (v113) {
      return result;
    }
  }
  unint64_t EncodedP = 0;
  while (2)
  {
    int v24 = (unint64_t *)((char *)v17 + 1);
    int v23 = *(unsigned __int8 *)v17;
    v116 = (unint64_t *)((char *)v17 + 1);
    switch(v23)
    {
      case 0:
        goto LABEL_9;
      case 1:
        unint64_t EncodedP = libunwind::LocalAddressSpace::getEncodedP(&v116, v18, *((unsigned __int8 *)v5 + 24), 0, v0, v1);
        goto LABEL_9;
      case 2:
        EncodedP += *((_DWORD *)v5 + 10) * *((unsigned __int8 *)v17 + 1);
        v116 = (unint64_t *)((char *)v17 + 2);
        goto LABEL_9;
      case 3:
        EncodedP += *((_DWORD *)v5 + 10) * *(unsigned __int16 *)((char *)v17 + 1);
        v116 = (unint64_t *)((char *)v17 + 3);
        goto LABEL_9;
      case 4:
        EncodedP += (*((_DWORD *)v5 + 10) * *(_DWORD *)((char *)v17 + 1));
        v116 = (unint64_t *)((char *)v17 + 5);
        goto LABEL_9;
      case 5:
        unint64_t ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        uint64_t v26 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (ULEB128 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_offset_extended DWARF unwind, reg too big\n";
          size_t v110 = 70;
          goto LABEL_132;
        }
        uint64_t v27 = *((int *)v5 + 11);
        unsigned int v28 = &v3[4 * ULEB128];
        if (!*((unsigned char *)v28 + 28))
        {
          *(_OWORD *)((char *)&v114[ULEB128 + 1] + 8) = *(_OWORD *)&v3[4 * ULEB128 + 6];
          *((unsigned char *)v28 + 28) = 1;
        }
        uint64_t v29 = v26 * v27;
        goto LABEL_109;
      case 6:
        unint64_t v30 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v30 < 0x120)
        {
          if (LOBYTE(v3[4 * v30 + 7]))
          {
            uint64_t v31 = &v3[4 * v30];
            uint64_t v32 = &v114[v30];
LABEL_114:
            *(_OWORD *)(v31 + 6) = *(_OWORD *)((char *)v32 + 24);
          }
          goto LABEL_9;
        }
        v108 = (FILE *)*MEMORY[0x263EF8C10];
        v109 = "libunwind: malformed DW_CFA_restore_extended DWARF unwind, reg too big\n";
        goto LABEL_122;
      case 7:
        unint64_t v33 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v33 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_undefined DWARF unwind, reg too big\n";
          goto LABEL_131;
        }
        unsigned int v34 = &v3[4 * v33];
        int v36 = *((unsigned __int8 *)v34 + 28);
        unsigned int v35 = v34 + 7;
        if (!v36)
        {
          *(_OWORD *)((char *)&v114[v33 + 1] + 8) = *(_OWORD *)&v3[4 * v33 + 6];
          *unsigned int v35 = 1;
        }
        v3[4 * v33 + 6] = 1;
        goto LABEL_9;
      case 8:
        unint64_t v37 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v37 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_same_value DWARF unwind, reg too big\n";
          size_t v110 = 65;
          goto LABEL_132;
        }
        unint64_t v38 = &v3[4 * v37];
        int v40 = *((unsigned __int8 *)v38 + 28);
        unint64_t v39 = v38 + 7;
        if (!v40)
        {
          *(_OWORD *)((char *)&v114[v37 + 1] + 8) = *(_OWORD *)&v3[4 * v37 + 6];
          *unint64_t v39 = 1;
        }
        v3[4 * v37 + 6] = 0;
        goto LABEL_9;
      case 9:
        unint64_t v41 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        unint64_t v42 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v41 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_register DWARF unwind, reg too big\n";
          size_t v110 = 63;
          goto LABEL_132;
        }
        if (v42 < 0x120)
        {
          unint64_t v43 = &v3[4 * v41];
          if (!*((unsigned char *)v43 + 28))
          {
            *(_OWORD *)((char *)&v114[v41 + 1] + 8) = *(_OWORD *)&v3[4 * v41 + 6];
            *((unsigned char *)v43 + 28) = 1;
          }
          v43[6] = 5;
          *((void *)v43 + 4) = v42;
LABEL_9:
          uint64_t v17 = v116;
          if (v116 >= v18 || EncodedP >= v19) {
            goto LABEL_2;
          }
          continue;
        }
        v108 = (FILE *)*MEMORY[0x263EF8C10];
        v109 = "libunwind: malformed DW_CFA_register DWARF unwind, reg2 too big\n";
LABEL_131:
        size_t v110 = 64;
LABEL_132:
        fwrite(v109, v110, 1uLL, v108);
LABEL_133:
        fflush((FILE *)*MEMORY[0x263EF8C10]);
        return 0;
      case 10:
        MEMORY[0x270FA53B0]();
        *(&v112 - 580) = v9;
        memcpy(&v112 - 579, v3, 0x1218uLL);
        uint64_t v9 = (uint64_t *)(&v112 - 580);
        goto LABEL_9;
      case 11:
        if (!v9) {
          return 0;
        }
        memcpy(v3, v9 + 1, 0x1218uLL);
        uint64_t v9 = (uint64_t *)*v9;
        goto LABEL_9;
      case 12:
        unint64_t v44 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        int v45 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v44 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_def_cfa DWARF unwind, reg too big\n";
          size_t v110 = 62;
          goto LABEL_132;
        }
        *uint64_t v3 = v44;
        v3[1] = v45;
        goto LABEL_9;
      case 13:
        unint64_t v46 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v46 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_def_cfa_register DWARF unwind, reg too big\n";
LABEL_122:
          size_t v110 = 71;
          goto LABEL_132;
        }
        *uint64_t v3 = v46;
        goto LABEL_9;
      case 14:
        v3[1] = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        goto LABEL_9;
      case 15:
        *uint64_t v3 = 0;
        *((void *)v3 + 1) = v24;
        goto LABEL_95;
      case 16:
        unint64_t v47 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v47 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_expression DWARF unwind, reg too big\n";
          size_t v110 = 65;
          goto LABEL_132;
        }
        uint64_t v48 = &v3[4 * v47];
        if (!*((unsigned char *)v48 + 28))
        {
          *(_OWORD *)((char *)&v114[v47 + 1] + 8) = *(_OWORD *)&v3[4 * v47 + 6];
          *((unsigned char *)v48 + 28) = 1;
        }
        uint64_t v49 = v116;
        int v50 = 6;
        goto LABEL_94;
      case 17:
        unint64_t v51 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v51 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_offset_extended_sf DWARF unwind, reg too big\n";
          size_t v110 = 73;
          goto LABEL_132;
        }
        uint64_t v52 = 0;
        unsigned int v53 = v116;
        unsigned int v54 = -7;
        do
        {
          if (v53 == v18) {
            goto LABEL_136;
          }
          char v55 = v54;
          v54 += 7;
          unsigned int v57 = *(unsigned __int8 *)v53;
          unsigned int v53 = (unint64_t *)((char *)v53 + 1);
          unsigned int v56 = v57;
          v52 |= (unint64_t)(v57 & 0x7F) << v54;
        }
        while ((v57 & 0x80) != 0);
        uint64_t v58 = -1 << (v55 + 14);
        if (((v54 < 0x39) & (v56 >> 6)) != 0) {
          uint64_t v59 = v58;
        }
        else {
          uint64_t v59 = 0;
        }
        v116 = v53;
        uint64_t v60 = *((int *)v5 + 11);
        unsigned int v61 = &v3[4 * v51];
        if (!*((unsigned char *)v61 + 28))
        {
          *(_OWORD *)((char *)&v114[v51 + 1] + 8) = *(_OWORD *)&v3[4 * v51 + 6];
          *((unsigned char *)v61 + 28) = 1;
        }
        uint64_t v62 = (v52 | v59) * v60;
        int v63 = 2;
        goto LABEL_89;
      case 18:
        unint64_t v64 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        uint64_t v65 = 0;
        unint64_t v66 = v116;
        unsigned int v67 = -7;
        do
        {
          if (v66 == v18) {
            goto LABEL_136;
          }
          char v68 = v67;
          v67 += 7;
          unsigned int v70 = *(unsigned __int8 *)v66;
          unint64_t v66 = (unint64_t *)((char *)v66 + 1);
          unsigned int v69 = v70;
          v65 |= (unint64_t)(v70 & 0x7F) << v67;
        }
        while ((v70 & 0x80) != 0);
        v116 = v66;
        if (v64 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_def_cfa_sf DWARF unwind, reg too big\n";
          size_t v110 = 65;
          goto LABEL_132;
        }
        uint64_t v71 = -1 << (v68 + 14);
        if (((v67 < 0x39) & (v69 >> 6)) == 0) {
          LODWORD(v71) = 0;
        }
        int v72 = *((_DWORD *)v5 + 11) * (v65 | v71);
        *uint64_t v3 = v64;
        v3[1] = v72;
        goto LABEL_9;
      case 19:
        uint64_t v73 = 0;
        unsigned int v74 = -7;
        do
        {
          if (v24 == v18) {
            goto LABEL_136;
          }
          char v75 = v74;
          v74 += 7;
          unsigned int v77 = *(unsigned __int8 *)v24;
          int v24 = (unint64_t *)((char *)v24 + 1);
          unsigned int v76 = v77;
          v73 |= (unint64_t)(v77 & 0x7F) << v74;
        }
        while ((v77 & 0x80) != 0);
        uint64_t v78 = -1 << (v75 + 14);
        if (((v74 < 0x39) & (v76 >> 6)) != 0) {
          int v79 = v78;
        }
        else {
          int v79 = 0;
        }
        v116 = v24;
        v3[1] = *((_DWORD *)v5 + 11) * (v73 | v79);
        goto LABEL_9;
      case 20:
        unint64_t v80 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v80 >= 0x120)
        {
          fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: malformed DW_CFA_val_offset DWARF unwind, reg (%llu) out of range\n\n", v80);
          goto LABEL_133;
        }
        uint64_t v81 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        uint64_t v82 = *((int *)v5 + 11);
        unsigned int v28 = &v3[4 * v80];
        if (!*((unsigned char *)v28 + 28))
        {
          *(_OWORD *)((char *)&v114[v80 + 1] + 8) = *(_OWORD *)&v3[4 * v80 + 6];
          *((unsigned char *)v28 + 28) = 1;
        }
        uint64_t v29 = v81 * v82;
        int v83 = 4;
LABEL_110:
        v28[6] = v83;
        *((void *)v28 + 4) = v29;
        goto LABEL_9;
      case 21:
        unint64_t v84 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v84 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_val_offset_sf DWARF unwind, reg too big\n";
          size_t v110 = 68;
          goto LABEL_132;
        }
        uint64_t v85 = 0;
        uint64_t v86 = v116;
        unsigned int v87 = -7;
        do
        {
          if (v86 == v18)
          {
LABEL_136:
            v111 = (FILE **)MEMORY[0x263EF8C10];
            fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "getSLEB128", "truncated sleb128 expression");
            fflush(*v111);
            abort();
          }
          char v88 = v87;
          v87 += 7;
          unsigned int v90 = *(unsigned __int8 *)v86;
          uint64_t v86 = (unint64_t *)((char *)v86 + 1);
          unsigned int v89 = v90;
          v85 |= (unint64_t)(v90 & 0x7F) << v87;
        }
        while ((v90 & 0x80) != 0);
        uint64_t v91 = -1 << (v88 + 14);
        if (((v87 < 0x39) & (v89 >> 6)) != 0) {
          uint64_t v92 = v91;
        }
        else {
          uint64_t v92 = 0;
        }
        v116 = v86;
        uint64_t v93 = *((int *)v5 + 11);
        unsigned int v61 = &v3[4 * v84];
        if (!*((unsigned char *)v61 + 28))
        {
          *(_OWORD *)((char *)&v114[v84 + 1] + 8) = *(_OWORD *)&v3[4 * v84 + 6];
          *((unsigned char *)v61 + 28) = 1;
        }
        uint64_t v62 = (v85 | v92) * v93;
        int v63 = 4;
LABEL_89:
        v61[6] = v63;
        *((void *)v61 + 4) = v62;
        goto LABEL_9;
      case 22:
        unint64_t v94 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v94 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_val_expression DWARF unwind, reg too big\n";
          size_t v110 = 69;
          goto LABEL_132;
        }
        uint64_t v48 = &v3[4 * v94];
        if (!*((unsigned char *)v48 + 28))
        {
          *(_OWORD *)((char *)&v114[v94 + 1] + 8) = *(_OWORD *)&v3[4 * v94 + 6];
          *((unsigned char *)v48 + 28) = 1;
        }
        uint64_t v49 = v116;
        int v50 = 7;
LABEL_94:
        v48[6] = v50;
        *((void *)v48 + 4) = v49;
LABEL_95:
        uint64_t v95 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        v116 = (unint64_t *)((char *)v116 + v95);
        goto LABEL_9;
      case 45:
        if (!*((unsigned char *)v3 + 572))
        {
          *(_OWORD *)v112 = *v14;
          *((unsigned char *)v3 + 572) = 1;
        }
        *((void *)v3 + 72) ^= 1uLL;
        goto LABEL_9;
      case 46:
        v3[4] = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        goto LABEL_9;
      case 47:
        unint64_t v104 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        if (v104 >= 0x120)
        {
          v108 = (FILE *)*MEMORY[0x263EF8C10];
          v109 = "libunwind: malformed DW_CFA_GNU_negative_offset_extended DWARF unwind, reg too big\n";
          size_t v110 = 83;
          goto LABEL_132;
        }
        unint64_t v105 = v104;
        uint64_t v106 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
        uint64_t v107 = *((int *)v5 + 11);
        unsigned int v28 = &v3[4 * v105];
        if (!*((unsigned char *)v28 + 28))
        {
          *(_OWORD *)((char *)&v114[v105 + 1] + 8) = *(_OWORD *)&v3[4 * v105 + 6];
          *((unsigned char *)v28 + 28) = 1;
        }
        uint64_t v29 = -(v106 * v107);
LABEL_109:
        int v83 = 2;
        goto LABEL_110;
      default:
        uint64_t v96 = v23 & 0x3F;
        int v97 = v23 & 0xC0;
        if (v97 == 64)
        {
          EncodedP += (*((_DWORD *)v5 + 10) * v96);
          goto LABEL_9;
        }
        if (v97 != 192)
        {
          if (v97 != 128) {
            return 0;
          }
          uint64_t v98 = libunwind::LocalAddressSpace::getULEB128(&v116, v18);
          uint64_t v99 = *((int *)v5 + 11);
          v100 = &v3[4 * v96];
          int v102 = *((unsigned __int8 *)v100 + 28);
          v101 = v100 + 7;
          if (!v102)
          {
            *(_OWORD *)((char *)&v114[v96 + 1] + 8) = *(_OWORD *)&v3[4 * v96 + 6];
            unsigned char *v101 = 1;
          }
          v103 = &v3[4 * v96];
          v103[6] = 2;
          *((void *)v103 + 4) = v98 * v99;
          goto LABEL_9;
        }
        if (!LOBYTE(v3[4 * v96 + 7])) {
          goto LABEL_9;
        }
        uint64_t v31 = &v3[4 * v96];
        uint64_t v32 = &v114[v96];
        goto LABEL_114;
    }
  }
}

uint64_t libunwind::LocalAddressSpace::getEncodedP(unint64_t **this, unint64_t *a2, unsigned int a3, uint64_t *a4, unint64_t a5, unint64_t *a6)
{
  uint64_t v8 = (uint64_t)*this;
  switch(a3 & 0xF)
  {
    case 0u:
    case 4u:
    case 0xCu:
      uint64_t v10 = (unint64_t *)(v8 + 8);
      uint64_t ULEB128 = *(void *)v8;
      goto LABEL_15;
    case 1u:
      uint64_t ULEB128 = libunwind::LocalAddressSpace::getULEB128(this, a2);
      goto LABEL_16;
    case 2u:
      uint64_t v10 = (unint64_t *)(v8 + 2);
      uint64_t ULEB128 = *(unsigned __int16 *)v8;
      goto LABEL_15;
    case 3u:
      uint64_t v10 = (unint64_t *)(v8 + 4);
      uint64_t ULEB128 = *(unsigned int *)v8;
      goto LABEL_15;
    case 9u:
      uint64_t v11 = 0;
      unsigned int v12 = -7;
      uint64_t v10 = *this;
      do
      {
        if (v10 == a2)
        {
          unint64_t v19 = (FILE **)MEMORY[0x263EF8C10];
          unint64_t v20 = (FILE *)*MEMORY[0x263EF8C10];
          char v21 = "truncated sleb128 expression";
          uint64_t v22 = "getSLEB128";
LABEL_32:
          fprintf(v20, "libunwind: %s - %s\n", v22, v21);
          fflush(*v19);
          abort();
        }
        char v13 = v12;
        v12 += 7;
        unsigned int v15 = *(unsigned __int8 *)v10;
        uint64_t v10 = (unint64_t *)((char *)v10 + 1);
        unsigned int v14 = v15;
        v11 |= (unint64_t)(v15 & 0x7F) << v12;
      }
      while ((v15 & 0x80) != 0);
      uint64_t v16 = -1 << (v13 + 14);
      if (((v12 < 0x39) & (v14 >> 6)) != 0) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
      uint64_t ULEB128 = v11 | v17;
LABEL_15:
      *this = v10;
LABEL_16:
      switch((a3 >> 4) & 7)
      {
        case 0u:
          goto LABEL_18;
        case 1u:
          ULEB128 += v8;
LABEL_18:
          if ((a3 & 0x80) != 0)
          {
            if (a4) {
              *a4 = ULEB128;
            }
            return *(void *)ULEB128;
          }
          else if (a4)
          {
            *a4 = v8;
          }
          return ULEB128;
        case 2u:
          unint64_t v19 = (FILE **)MEMORY[0x263EF8C10];
          unint64_t v20 = (FILE *)*MEMORY[0x263EF8C10];
          char v21 = "DW_EH_PE_textrel pointer encoding not supported";
          goto LABEL_31;
        case 3u:
          unint64_t v19 = (FILE **)MEMORY[0x263EF8C10];
          unint64_t v20 = (FILE *)*MEMORY[0x263EF8C10];
          char v21 = "DW_EH_PE_datarel is invalid with a datarelBase of 0";
          goto LABEL_31;
        case 4u:
          unint64_t v19 = (FILE **)MEMORY[0x263EF8C10];
          unint64_t v20 = (FILE *)*MEMORY[0x263EF8C10];
          char v21 = "DW_EH_PE_funcrel pointer encoding not supported";
          goto LABEL_31;
        case 5u:
          unint64_t v19 = (FILE **)MEMORY[0x263EF8C10];
          unint64_t v20 = (FILE *)*MEMORY[0x263EF8C10];
          char v21 = "DW_EH_PE_aligned pointer encoding not supported";
          goto LABEL_31;
        default:
          goto LABEL_26;
      }
    case 0xAu:
      uint64_t v10 = (unint64_t *)(v8 + 2);
      uint64_t ULEB128 = *(__int16 *)v8;
      goto LABEL_15;
    case 0xBu:
      uint64_t v10 = (unint64_t *)(v8 + 4);
      uint64_t ULEB128 = *(int *)v8;
      goto LABEL_15;
    default:
LABEL_26:
      unint64_t v19 = (FILE **)MEMORY[0x263EF8C10];
      unint64_t v20 = (FILE *)*MEMORY[0x263EF8C10];
      char v21 = "unknown pointer encoding";
LABEL_31:
      uint64_t v22 = "getEncodedP";
      goto LABEL_32;
  }
}

uint64_t libunwind::LocalAddressSpace::getULEB128(unint64_t **this, unint64_t *a2)
{
  uint64_t v2 = *this;
  if (*this == a2) {
    goto LABEL_25;
  }
  uint64_t v3 = (unint64_t *)((char *)v2 + 1);
  uint64_t v4 = *(unsigned char *)v2 & 0x7F;
  if ((*(unsigned char *)v2 & 0x80) != 0)
  {
    if (v3 == a2) {
      goto LABEL_25;
    }
    int v5 = *((char *)v2 + 1);
    v4 |= (unint64_t)(v5 & 0x7F) << 7;
    uint64_t v3 = (unint64_t *)((char *)v2 + 2);
    if (v5 < 0)
    {
      if (v3 == a2) {
        goto LABEL_25;
      }
      int v6 = *((char *)v2 + 2);
      v4 |= (unint64_t)(v6 & 0x7F) << 14;
      uint64_t v3 = (unint64_t *)((char *)v2 + 3);
      if (v6 < 0)
      {
        if (v3 == a2) {
          goto LABEL_25;
        }
        int v7 = *((char *)v2 + 3);
        v4 |= (unint64_t)(v7 & 0x7F) << 21;
        uint64_t v3 = (unint64_t *)((char *)v2 + 4);
        if (v7 < 0)
        {
          if (v3 == a2) {
            goto LABEL_25;
          }
          int v8 = *((char *)v2 + 4);
          v4 |= (unint64_t)(v8 & 0x7F) << 28;
          uint64_t v3 = (unint64_t *)((char *)v2 + 5);
          if (v8 < 0)
          {
            if (v3 == a2) {
              goto LABEL_25;
            }
            int v9 = *((char *)v2 + 5);
            v4 |= (unint64_t)(v9 & 0x7F) << 35;
            uint64_t v3 = (unint64_t *)((char *)v2 + 6);
            if (v9 < 0)
            {
              if (v3 == a2) {
                goto LABEL_25;
              }
              int v10 = *((char *)v2 + 6);
              v4 |= (unint64_t)(v10 & 0x7F) << 42;
              uint64_t v3 = (unint64_t *)((char *)v2 + 7);
              if (v10 < 0)
              {
                if (v3 == a2) {
                  goto LABEL_25;
                }
                int v11 = *((char *)v2 + 7);
                v4 |= (unint64_t)(v11 & 0x7F) << 49;
                uint64_t v3 = v2 + 1;
                if (v11 < 0)
                {
                  if (v3 == a2) {
                    goto LABEL_25;
                  }
                  int v12 = *((char *)v2 + 8);
                  v4 |= (unint64_t)(v12 & 0x7F) << 56;
                  uint64_t v3 = (unint64_t *)((char *)v2 + 9);
                  if (v12 < 0)
                  {
                    if (v3 != a2)
                    {
                      uint64_t v13 = *(unsigned __int8 *)v3;
                      if ((v13 & 0x7E) != 0) {
                        goto LABEL_27;
                      }
                      uint64_t v3 = (unint64_t *)((char *)v2 + 10);
                      if ((v13 & 0x80) == 0)
                      {
                        v4 |= v13 << 63;
                        goto LABEL_23;
                      }
                      if (v3 != a2)
                      {
LABEL_27:
                        unsigned int v15 = (FILE **)MEMORY[0x263EF8C10];
                        uint64_t v16 = (FILE *)*MEMORY[0x263EF8C10];
                        uint64_t v17 = "malformed uleb128 expression";
LABEL_26:
                        fprintf(v16, "libunwind: %s - %s\n", "getULEB128", v17);
                        fflush(*v15);
                        abort();
                      }
                    }
LABEL_25:
                    unsigned int v15 = (FILE **)MEMORY[0x263EF8C10];
                    uint64_t v16 = (FILE *)*MEMORY[0x263EF8C10];
                    uint64_t v17 = "truncated uleb128 expression";
                    goto LABEL_26;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_23:
  *this = v3;
  return v4;
}

const char *libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseCIE(unsigned int *a1, uint64_t a2)
{
  char v3 = (char)a1;
  *(_DWORD *)(a2 + 24) = 65280;
  *(void *)(a2 + 32) = 0;
  uint64_t v4 = (uint64_t *)(a2 + 32);
  *(_WORD *)(a2 + 51) = 0;
  *(void *)(a2 + 40) = 0;
  *(_WORD *)(a2 + 48) = 0;
  *(void *)a2 = a1;
  int v5 = a1 + 1;
  uint64_t v6 = *a1;
  if (v6 != -1)
  {
    int v7 = (unint64_t *)((char *)v5 + v6);
    if (*a1) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v9 = *(void *)(a1 + 1);
  int v5 = a1 + 3;
  int v7 = (unint64_t *)((char *)a1 + v9 + 12);
  if (!v9) {
    return 0;
  }
LABEL_3:
  if (*v5) {
    return "CIE ID is not zero";
  }
  int v10 = *((unsigned __int8 *)v5 + 4);
  if ((v10 & 0xFFFFFFFD) != 1) {
    return "CIE version is not 1 or 3";
  }
  int v11 = (char *)v5 + 5;
  int v12 = (unint64_t *)((char *)v5 + 5);
  do
  {
    int v13 = *(unsigned __int8 *)v12;
    int v12 = (unint64_t *)((char *)v12 + 1);
  }
  while (v13);
  unsigned int v34 = v12;
  int ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v34, v7);
  uint64_t v15 = 0;
  *(_DWORD *)(a2 + 40) = ULEB128;
  uint64_t v16 = v34;
  unsigned int v17 = -7;
  do
  {
    if (v16 == v7)
    {
      uint64_t v32 = (FILE **)MEMORY[0x263EF8C10];
      fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "getSLEB128", "truncated sleb128 expression");
      fflush(*v32);
      abort();
    }
    char v18 = v17;
    v17 += 7;
    unsigned int v20 = *(unsigned __int8 *)v16;
    uint64_t v16 = (unint64_t *)((char *)v16 + 1);
    unsigned int v19 = v20;
    v15 |= (unint64_t)(v20 & 0x7F) << v17;
  }
  while ((v20 & 0x80) != 0);
  uint64_t v21 = -1 << (v18 + 14);
  if (((v17 < 0x39) & (v19 >> 6)) != 0) {
    int v22 = v21;
  }
  else {
    int v22 = 0;
  }
  unsigned int v34 = v16;
  *(_DWORD *)(a2 + 44) = v15 | v22;
  if (v10 == 1)
  {
    char v23 = *(unsigned char *)v16;
    unsigned int v34 = (unint64_t *)((char *)v16 + 1);
  }
  else
  {
    char v23 = libunwind::LocalAddressSpace::getULEB128(&v34, v7);
  }
  *(unsigned char *)(a2 + 50) = v23;
  uint64_t v33 = 0;
  if (*v11 == 122)
  {
    libunwind::LocalAddressSpace::getULEB128(&v34, v7);
    while (1)
    {
      switch(*v11)
      {
        case 'B':
          *(unsigned char *)(a2 + 51) = 1;
          ++v11;
          continue;
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'M':
        case 'N':
        case 'O':
        case 'Q':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
        case '[':
        case '\\':
        case ']':
        case '^':
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
          goto LABEL_23;
        case 'G':
          *(unsigned char *)(a2 + 52) = 1;
          goto LABEL_23;
        case 'L':
          uint64_t v26 = (unint64_t *)((char *)v34 + 1);
          *(unsigned char *)(a2 + 25) = *(unsigned char *)v34;
          unsigned int v34 = v26;
          ++v11;
          continue;
        case 'P':
          unsigned int v28 = (unint64_t *)((char *)v34 + 1);
          unsigned int v27 = *(unsigned __int8 *)v34;
          *(unsigned char *)(a2 + 26) = v27;
          unsigned int v34 = v28;
          *(unsigned char *)(a2 + 27) = (_BYTE)v28 - v3;
          uint64_t EncodedP = libunwind::LocalAddressSpace::getEncodedP(&v34, v7, v27, &v33, v24, v25);
          if (EncodedP) {
            *uint64_t v4 = EncodedP;
          }
          else {
            *uint64_t v4 = 0;
          }
          ++v11;
          continue;
        case 'R':
          unint64_t v30 = (unint64_t *)((char *)v34 + 1);
          *(unsigned char *)(a2 + 24) = *(unsigned char *)v34;
          unsigned int v34 = v30;
          ++v11;
          continue;
        case 'S':
          *(unsigned char *)(a2 + 48) = 1;
          ++v11;
          continue;
        case 'z':
          *(unsigned char *)(a2 + 49) = 1;
          ++v11;
          continue;
        default:
          if (!*v11) {
            goto LABEL_36;
          }
LABEL_23:
          ++v11;
          break;
      }
    }
  }
LABEL_36:
  uint64_t result = 0;
  uint64_t v31 = v34;
  *(void *)(a2 + 8) = (char *)v7 - *(void *)a2;
  *(void *)(a2 + 16) = v31;
  return result;
}

uint64_t libunwind::CFI_Parser<libunwind::LocalAddressSpace>::findFDE(unint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, unint64_t **a5, unsigned __int8 *a6)
{
  if (a4) {
    uint64_t v6 = a4;
  }
  else {
    uint64_t v6 = a2;
  }
  if (a3 == -1) {
    unint64_t v7 = -1;
  }
  else {
    unint64_t v7 = (unint64_t)a2 + a3;
  }
  for (; (unint64_t)v6 < v7; unsigned int v34 = v6)
  {
    int v12 = v6;
    unsigned int v14 = (unsigned int *)v6 + 1;
    uint64_t v13 = *(unsigned int *)v6;
    if (v13 == -1)
    {
      uint64_t v13 = *(unint64_t *)((char *)v6 + 4);
      unsigned int v14 = (unsigned int *)v6 + 3;
    }
    if (!v13) {
      break;
    }
    uint64_t v15 = *v14;
    uint64_t v6 = (unint64_t *)((char *)v14 + v13);
    if (v15)
    {
      uint64_t v16 = (unsigned int *)((char *)v14 - v15);
      if ((char *)v14 - v15 >= (char *)a2
        && (unint64_t)v16 < v7
        && !libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseCIE(v16, (uint64_t)a6))
      {
        unsigned int v34 = (unint64_t *)(v14 + 1);
        unint64_t EncodedP = libunwind::LocalAddressSpace::getEncodedP(&v34, v6, a6[24], 0, v18, v19);
        uint64_t v23 = libunwind::LocalAddressSpace::getEncodedP(&v34, v6, a6[24] & 0xF, 0, v21, v22);
        if (EncodedP < a1)
        {
          unint64_t v24 = v23 + EncodedP;
          if (v23 + EncodedP >= a1)
          {
            a5[5] = 0;
            if (a6[49])
            {
              uint64_t ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v34, v6);
              unsigned int v28 = v34;
              uint64_t v29 = (unint64_t *)((char *)v34 + ULEB128);
              int v30 = a6[25];
              if (v30 != 255)
              {
                if (libunwind::LocalAddressSpace::getEncodedP(&v34, v6, v30 & 0xF, 0, v26, v27))
                {
                  unsigned int v34 = v28;
                  a5[5] = (unint64_t *)libunwind::LocalAddressSpace::getEncodedP(&v34, v6, a6[25], 0, v31, v32);
                }
              }
            }
            else
            {
              uint64_t v29 = v34;
            }
            *a5 = v12;
            a5[1] = (unint64_t *)((char *)v6 - (char *)v12);
            a5[2] = v29;
            a5[3] = (unint64_t *)EncodedP;
            uint64_t result = 1;
            a5[4] = (unint64_t *)v24;
            return result;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  int v8 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if ((unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd)
  {
    size_t v9 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd
       - (unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    int64_t v10 = (int64_t)(libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd
                         - (unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]) >> 5;
    int64_t v14 = (int64_t)(libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd
                         - (unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]) >> 3;
    int v11 = (char *)malloc_type_malloc(4* (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd- (unint64_t)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0]), 0x1000040E0EAB150uLL);
    int v12 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    memcpy(v11, libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0], v9);
    if (v12 != &libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_initialBuffer) {
      free(v12);
    }
    libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] = (long long *)v11;
    int v8 = (long long *)&v11[32 * v10];
    libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferEnd = (uint64_t)&v11[32 * v14];
  }
  *(void *)int v8 = a1;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 2) = a3;
  *((void *)v8 + 3) = a4;
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v8 + 2;
  if ((libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_registeredForDyldUnloads & 1) == 0)
  {
    _dyld_register_func_for_remove_image((void (__cdecl *)(const mach_header *, intptr_t))libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::dyldUnloadHook);
    libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_registeredForDyldUnloads = 1;
  }

  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

uint64_t libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::dyldUnloadHook(uint64_t a1)
{
  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  uint64_t v2 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  char v3 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
  {
    uint64_t v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  }
  else
  {
    uint64_t v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    do
    {
      if (*(void *)v2 != a1)
      {
        if (v2 != v4)
        {
          long long v5 = v2[1];
          *uint64_t v4 = *v2;
          v4[1] = v5;
        }
        v4 += 2;
      }
      v2 += 2;
    }
    while (v2 < v3);
  }
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v4;

  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

const char *libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getRegisterName(uint64_t a1, int a2)
{
  if ((a2 + 2) > 0x61) {
    return "unknown register";
  }
  else {
    return (&off_264116438)[a2 + 2];
  }
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getFunctionName(uint64_t a1, char *a2, size_t a3, void *a4)
{
  unint64_t v7 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, 0xFFFFFFFFLL);
  if (dladdr(v7, &v11)) {
    BOOL v8 = v11.dli_sname == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = !v8;
  if (!v8)
  {
    strlcpy(a2, v11.dli_sname, a3);
    *a4 = (unsigned char *)v7 - (char *)v11.dli_saddr;
  }
  return v9;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::isSignalFrame(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 617);
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::jumpto(uint64_t a1)
{
  return __libunwind_Registers_arm64_jumpto(a1 + 16);
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getInfo(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 616))
  {
    *(void *)(a2 + 64) = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    *(void *)a2 = *(void *)(result + 544);
    *(void *)(a2 + 8) = *(void *)(result + 552);
    *(void *)(a2 + 16) = *(void *)(result + 560);
    uint64_t v2 = *(void *)(result + 576);
    *(void *)(a2 + 24) = *(void *)(result + 568);
    *(void *)(a2 + 32) = v2;
    *(void *)(a2 + 40) = *(void *)(result + 584);
    *(void *)(a2 + 48) = *(void *)(result + 592);
    *(void *)(a2 + 56) = *(void *)(result + 600);
    *(void *)(a2 + 64) = *(void *)(result + 608);
  }
  return result;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::step()
{
  uint64_t v0 = MEMORY[0x270FA53B0]();
  if (!*(unsigned char *)(v0 + 616))
  {
    uint64_t v4 = v0;
    unint64_t v5 = *(unsigned int *)(v0 + 592);
    int v6 = v5 & 0xF000000;
    if ((v5 & 0xF000000) == 0x3000000)
    {
      int v7 = v1;
      (*(void (**)(uint64_t, uint64_t))(*(void *)v0 + 24))(v0, 0xFFFFFFFFLL);
      if (*(void *)(v4 + 600))
      {
        int64_t v10 = *(unsigned int **)(v4 + 600);
        uint64_t v11 = *(void *)(v4 + 584);
        if (v11)
        {
LABEL_7:
          uint64_t v12 = v11;
          goto LABEL_29;
        }
      }
      else
      {
        int64_t v10 = 0;
        uint64_t v11 = *(void *)(v4 + 584);
        if (v11) {
          goto LABEL_7;
        }
      }
      uint64_t v12 = 0;
LABEL_29:
      if (libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(v10, v109, (uint64_t)v106, 0, v8, v9)) {
        return 4294960750;
      }
      bzero(v101, 0x1218uLL);
      if ((libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseFDEInstructions() & 1) == 0) {
        return 4294960750;
      }
      if (v101[0])
      {
        uint64_t Register = libunwind::Registers_arm64::getRegister((libunwind::Registers_arm64 *)(v4 + 16), v101[0]);
        unint64_t v19 = Register + v101[1];
      }
      else
      {
        unint64_t v19 = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(v102, (libunwind::Registers_arm64 *)(v4 + 16), 0);
      }
      uint64_t v20 = *(void *)(v4 + 264);
      if (v7)
      {
        if (v108)
        {
          for (_X8 = v20 & 0xFFFFFFFFFFFFFFF0; _X8 < v19; _X8 += 16)
            __asm { STG             X8, [X8] }
        }
      }
      uint64_t v65 = v12;
      memcpy(__dst, (const void *)(v4 + 16), sizeof(__dst));
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      long long v28 = *(_OWORD *)(v4 + 496);
      uint64_t v29 = (long long *)(v4 + 288);
      long long v97 = *(_OWORD *)(v4 + 480);
      long long v98 = v28;
      long long v30 = *(_OWORD *)(v4 + 528);
      long long v99 = *(_OWORD *)(v4 + 512);
      long long v100 = v30;
      long long v31 = *(_OWORD *)(v4 + 432);
      long long v93 = *(_OWORD *)(v4 + 416);
      long long v94 = v31;
      long long v32 = *(_OWORD *)(v4 + 464);
      long long v95 = *(_OWORD *)(v4 + 448);
      long long v96 = v32;
      long long v33 = *(_OWORD *)(v4 + 368);
      long long v89 = *(_OWORD *)(v4 + 352);
      long long v90 = v33;
      long long v34 = *(_OWORD *)(v4 + 400);
      long long v91 = *(_OWORD *)(v4 + 384);
      long long v92 = v34;
      long long v35 = *(_OWORD *)(v4 + 304);
      long long v85 = *(_OWORD *)(v4 + 288);
      long long v86 = v35;
      long long v36 = *(_OWORD *)(v4 + 336);
      long long v87 = *(_OWORD *)(v4 + 320);
      long long v88 = v36;
      __dst[32] = *(void *)(v4 + 272);
      unint64_t v37 = (unint64_t **)&v103;
      __dst[29] = *(void *)(v4 + 248);
      __dst[31] = v19;
      while (1)
      {
        int v39 = *((_DWORD *)v37 - 2);
        if (v39)
        {
          if ((v27 & 0x7FFFFFE0) == 0x40)
          {
            if (v39 == 1)
            {
              uint64_t v42 = 0;
            }
            else
            {
              if (v39 == 6)
              {
                int v40 = (uint64_t *)libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(*v37, (libunwind::Registers_arm64 *)(v4 + 16), v19);
              }
              else
              {
                if (v39 != 2)
                {
                  unsigned int v61 = (FILE **)MEMORY[0x263EF8C10];
                  uint64_t v62 = (FILE *)*MEMORY[0x263EF8C10];
                  int v63 = "unsupported restore location for float register";
                  unint64_t v64 = "getSavedFloatRegister";
                  goto LABEL_106;
                }
                int v40 = (uint64_t *)((char *)*v37 + v19);
              }
              uint64_t v42 = *v40;
            }
            __dst[(v27 - 64) + 34] = v42;
            goto LABEL_74;
          }
          if (v27 != v107)
          {
            if (v27 != 34 && (v27 - 64) > 0xFFFFFFE0) {
              return 4294960754;
            }
            Saveduint64_t Register = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister((libunwind::Registers_arm64 *)(v4 + 16), v19, v39, *v37);
            libunwind::Registers_arm64::setRegister(__dst, v27, SavedRegister);
            goto LABEL_74;
          }
          uint64_t v38 = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister((libunwind::Registers_arm64 *)(v4 + 16), v19, v39, *v37);
        }
        else
        {
          if (v27 != v107) {
            goto LABEL_74;
          }
          uint64_t v38 = libunwind::Registers_arm64::getRegister((libunwind::Registers_arm64 *)(v4 + 16), v107);
        }
        uint64_t v26 = v38;
        uint64_t v83 = v38;
LABEL_74:
        ++v27;
        v37 += 2;
        if (v27 == 96)
        {
          *(unsigned char *)(v4 + 617) = v106[48];
          memcpy(v66, (const void *)(v4 + 16), sizeof(v66));
          long long v43 = *(_OWORD *)(v4 + 496);
          long long v79 = *(_OWORD *)(v4 + 480);
          long long v80 = v43;
          long long v44 = *(_OWORD *)(v4 + 528);
          long long v81 = *(_OWORD *)(v4 + 512);
          long long v82 = v44;
          long long v45 = *(_OWORD *)(v4 + 432);
          long long v75 = *(_OWORD *)(v4 + 416);
          long long v76 = v45;
          long long v46 = *(_OWORD *)(v4 + 464);
          long long v77 = *(_OWORD *)(v4 + 448);
          long long v78 = v46;
          long long v47 = *(_OWORD *)(v4 + 368);
          long long v71 = *(_OWORD *)(v4 + 352);
          long long v72 = v47;
          long long v48 = *(_OWORD *)(v4 + 400);
          long long v73 = *(_OWORD *)(v4 + 384);
          long long v74 = v48;
          long long v49 = *(_OWORD *)(v4 + 304);
          long long v67 = *v29;
          long long v68 = v49;
          long long v50 = *(_OWORD *)(v4 + 336);
          long long v69 = *(_OWORD *)(v4 + 320);
          long long v70 = v50;
          uint64_t v51 = *(void *)(v4 + 248);
          v66[32] = *(void *)(v4 + 272);
          v66[29] = v51;
          char v52 = v105[0];
          if (v104) {
            char v52 = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister((libunwind::Registers_arm64 *)v66, v19, v104, *(unint64_t **)v105);
          }
          if ((v52 & 1) != 0 && v26) {
            return 4294960746;
          }
          if (v65 != 1 || __unw_is_pointer_auth_enabled() || !__unw_is_pointer_auth_enabled())
          {
            __dst[32] = v26;
            memcpy((void *)(v4 + 16), __dst, 0x110uLL);
            long long v53 = v98;
            *(_OWORD *)(v4 + 480) = v97;
            *(_OWORD *)(v4 + 496) = v53;
            long long v54 = v100;
            *(_OWORD *)(v4 + 512) = v99;
            *(_OWORD *)(v4 + 528) = v54;
            long long v55 = v94;
            *(_OWORD *)(v4 + 416) = v93;
            *(_OWORD *)(v4 + 432) = v55;
            long long v56 = v96;
            *(_OWORD *)(v4 + 448) = v95;
            *(_OWORD *)(v4 + 464) = v56;
            long long v57 = v90;
            *(_OWORD *)(v4 + 352) = v89;
            *(_OWORD *)(v4 + 368) = v57;
            long long v58 = v92;
            *(_OWORD *)(v4 + 384) = v91;
            *(_OWORD *)(v4 + 400) = v58;
            long long v59 = v86;
            *uint64_t v29 = v85;
            *(_OWORD *)(v4 + 304) = v59;
            long long v60 = v88;
            *(_OWORD *)(v4 + 320) = v87;
            *(_OWORD *)(v4 + 336) = v60;
            *(void *)(v4 + 272) = v26;
            *(void *)(v4 + 248) = __dst[29];
            goto LABEL_48;
          }
          uint64_t v83 = -1;
LABEL_105:
          unsigned int v61 = (FILE **)MEMORY[0x263EF8C10];
          uint64_t v62 = (FILE *)*MEMORY[0x263EF8C10];
          int v63 = "Inconsistent invalid authentication state";
          unint64_t v64 = "normalizeNewLinkRegister";
LABEL_106:
          fprintf(v62, "libunwind: %s - %s\n", v64, v63);
          fflush(*v61);
          abort();
        }
      }
    }
    uint64_t v13 = *(void *)(v0 + 584);
    if (v6 != 0x2000000)
    {
      if (v6 != 0x4000000)
      {
        unsigned int v61 = (FILE **)MEMORY[0x263EF8C10];
        uint64_t v62 = (FILE *)*MEMORY[0x263EF8C10];
        int v63 = "invalid compact unwind encoding";
        unint64_t v64 = "stepWithCompactEncoding";
        goto LABEL_106;
      }
      uint64_t v14 = *(void *)(v0 + 248);
      if (v5)
      {
        *(void *)(v0 + 168) = *(void *)(v14 - 8);
        *(void *)(v0 + 176) = *(void *)(v14 - 16);
        uint64_t v15 = (void *)(v14 - 24);
        if ((v5 & 2) == 0) {
          goto LABEL_36;
        }
      }
      else
      {
        uint64_t v15 = (void *)(v14 - 8);
        if ((v5 & 2) == 0)
        {
LABEL_36:
          if ((v5 & 4) != 0)
          {
            *(void *)(v0 + 200) = *v15;
            *(void *)(v0 + 208) = *(v15 - 1);
            v15 -= 2;
            if ((v5 & 8) == 0)
            {
LABEL_38:
              if ((v5 & 0x10) == 0) {
                goto LABEL_39;
              }
              goto LABEL_61;
            }
          }
          else if ((v5 & 8) == 0)
          {
            goto LABEL_38;
          }
          *(void *)(v0 + 216) = *v15;
          *(void *)(v0 + 224) = *(v15 - 1);
          v15 -= 2;
          if ((v5 & 0x10) == 0)
          {
LABEL_39:
            if ((v5 & 0x100) == 0) {
              goto LABEL_40;
            }
            goto LABEL_62;
          }
LABEL_61:
          *(void *)(v0 + 232) = *v15;
          *(void *)(v0 + 240) = *(v15 - 1);
          v15 -= 2;
          if ((v5 & 0x100) == 0)
          {
LABEL_40:
            if ((v5 & 0x200) == 0) {
              goto LABEL_41;
            }
            goto LABEL_63;
          }
LABEL_62:
          *(void *)(v0 + 352) = *v15;
          *(void *)(v0 + 360) = *(v15 - 1);
          v15 -= 2;
          if ((v5 & 0x200) == 0)
          {
LABEL_41:
            if ((v5 & 0x400) == 0) {
              goto LABEL_42;
            }
            goto LABEL_64;
          }
LABEL_63:
          *(void *)(v0 + 368) = *v15;
          *(void *)(v0 + 376) = *(v15 - 1);
          v15 -= 2;
          if ((v5 & 0x400) == 0)
          {
LABEL_42:
            if ((v5 & 0x800) == 0) {
              goto LABEL_44;
            }
            goto LABEL_43;
          }
LABEL_64:
          *(void *)(v0 + 384) = *v15;
          *(void *)(v0 + 392) = *(v15 - 1);
          v15 -= 2;
          if ((v5 & 0x800) == 0)
          {
LABEL_44:
            *(void *)(v0 + 264) = (v14 & 0xFFFFFFFFFFFFFFLL) + 16;
            *(void *)(v0 + 248) = *(void *)(v14 & 0xFFFFFFFFFFFFFFLL);
            uint64_t v17 = *(void *)((v14 & 0xFFFFFFFFFFFFFFLL) + 8);
            if (v13 != 1 || __unw_is_pointer_auth_enabled() || !__unw_is_pointer_auth_enabled()) {
              goto LABEL_47;
            }
            *(void *)v101 = -1;
            goto LABEL_104;
          }
LABEL_43:
          *(void *)(v0 + 400) = *v15;
          *(void *)(v0 + 408) = *(v15 - 1);
          goto LABEL_44;
        }
      }
      *(void *)(v0 + 184) = *v15;
      *(void *)(v0 + 192) = *(v15 - 1);
      v15 -= 2;
      goto LABEL_36;
    }
    uint64_t v16 = (void *)(*(void *)(v0 + 264) + ((v5 >> 8) & 0xFFF0));
    if (v5)
    {
      *(void *)(v0 + 168) = *v16;
      *(void *)(v0 + 176) = *(v16 - 1);
      v16 -= 2;
      if ((v5 & 2) == 0)
      {
LABEL_15:
        if ((v5 & 4) == 0) {
          goto LABEL_16;
        }
        goto LABEL_52;
      }
    }
    else if ((v5 & 2) == 0)
    {
      goto LABEL_15;
    }
    *(void *)(v0 + 184) = *v16;
    *(void *)(v0 + 192) = *(v16 - 1);
    v16 -= 2;
    if ((v5 & 4) == 0)
    {
LABEL_16:
      if ((v5 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_53;
    }
LABEL_52:
    *(void *)(v0 + 200) = *v16;
    *(void *)(v0 + 208) = *(v16 - 1);
    v16 -= 2;
    if ((v5 & 8) == 0)
    {
LABEL_17:
      if ((v5 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_54;
    }
LABEL_53:
    *(void *)(v0 + 216) = *v16;
    *(void *)(v0 + 224) = *(v16 - 1);
    v16 -= 2;
    if ((v5 & 0x10) == 0)
    {
LABEL_18:
      if ((v5 & 0x100) == 0) {
        goto LABEL_19;
      }
      goto LABEL_55;
    }
LABEL_54:
    *(void *)(v0 + 232) = *v16;
    *(void *)(v0 + 240) = *(v16 - 1);
    v16 -= 2;
    if ((v5 & 0x100) == 0)
    {
LABEL_19:
      if ((v5 & 0x200) == 0) {
        goto LABEL_20;
      }
      goto LABEL_56;
    }
LABEL_55:
    *(void *)(v0 + 352) = *v16;
    *(void *)(v0 + 360) = *(v16 - 1);
    v16 -= 2;
    if ((v5 & 0x200) == 0)
    {
LABEL_20:
      if ((v5 & 0x400) == 0) {
        goto LABEL_21;
      }
      goto LABEL_57;
    }
LABEL_56:
    *(void *)(v0 + 368) = *v16;
    *(void *)(v0 + 376) = *(v16 - 1);
    v16 -= 2;
    if ((v5 & 0x400) == 0)
    {
LABEL_21:
      if ((v5 & 0x800) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
LABEL_57:
    *(void *)(v0 + 384) = *v16;
    *(void *)(v0 + 392) = *(v16 - 1);
    v16 -= 2;
    if ((v5 & 0x800) == 0)
    {
LABEL_23:
      uint64_t v17 = *(void *)(v0 + 256);
      *(void *)(v0 + 264) = v16;
      if (v13 != 1 || __unw_is_pointer_auth_enabled() || !__unw_is_pointer_auth_enabled())
      {
LABEL_47:
        *(void *)(v4 + 272) = v17;
LABEL_48:
        uint64_t v2 = 1;
        (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 104))(v4, 1);
        if (!*(unsigned char *)(v4 + 616)) {
          return v2;
        }
        return 0;
      }
      *(void *)v101 = -1;
LABEL_104:
      *(void *)v101 = -1;
      goto LABEL_105;
    }
LABEL_22:
    *(void *)(v0 + 400) = *v16;
    *(void *)(v0 + 408) = *(v16 - 1);
    v16 -= 2;
    goto LABEL_23;
  }
  return 0;
}

uint64_t __unw_is_pointer_auth_enabled()
{
  uint64_t v0 = __unw_is_pointer_auth_enabled::mode;
  if (!__unw_is_pointer_auth_enabled::mode)
  {
    int v5 = 0;
    size_t v4 = 4;
    if (!sysctlbyname("machdep.ptrauth_enabled", &v5, &v4, 0, 0) && v5) {
      uint64_t v1 = 37099;
    }
    else {
      uint64_t v1 = 24269;
    }
    uint64_t v0 = v1;
    __unw_is_pointer_auth_enabled::mode = v1;
  }
  if (v0 == 24269) {
    return 0;
  }
  if (v0 != 37099)
  {
    char v3 = (FILE **)MEMORY[0x263EF8C10];
    fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "__unw_is_pointer_auth_enabled", "Invalid authentication state");
    fflush(*v3);
    abort();
  }
  return 1;
}

uint64_t libunwind::Registers_arm64::getRegister(libunwind::Registers_arm64 *this, unsigned int a2)
{
  switch(a2)
  {
    case 0xFFFFFFFE:
    case 0x1Fu:
      uint64_t result = *((void *)this + 31);
      break;
    case 0xFFFFFFFF:
    case 0x20u:
      uint64_t result = *((void *)this + 32);
      break;
    case 0x1Du:
      uint64_t result = *((void *)this + 29);
      break;
    case 0x1Eu:
      uint64_t result = *((void *)this + 30);
      break;
    case 0x22u:
      uint64_t result = *((void *)this + 33);
      break;
    default:
      if (a2 > 0x1C)
      {
        char v3 = (FILE **)MEMORY[0x263EF8C10];
        fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "getRegister", "unsupported arm64 register");
        fflush(*v3);
        abort();
      }
      uint64_t result = *((void *)this + a2);
      break;
  }
  return result;
}

unint64_t libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(unint64_t *a1, libunwind::Registers_arm64 *a2, uint64_t a3)
{
  v88[99] = *MEMORY[0x263EF8C08];
  long long v87 = a1;
  uint64_t ULEB128 = libunwind::LocalAddressSpace::getULEB128(&v87, (unint64_t *)((char *)a1 + 20));
  int v6 = v87;
  int v7 = (unint64_t *)((char *)v87 + ULEB128);
  v88[0] = a3;
  if (v87 < (unint64_t *)((char *)v87 + ULEB128))
  {
    unint64_t v8 = v88;
    do
    {
      int64_t v10 = (unint64_t *)((char *)v6 + 1);
      int v11 = *(unsigned __int8 *)v6;
      long long v87 = (unint64_t *)((char *)v6 + 1);
      switch(v11)
      {
        case 3:
        case 14:
        case 15:
          unint64_t v9 = *(unint64_t *)((char *)v6 + 1);
          unint64_t v25 = (unint64_t *)((char *)v6 + 9);
          goto LABEL_43;
        case 6:
          long long v47 = (unint64_t *)*v8;
LABEL_35:
          *unint64_t v8 = *v47;
          goto LABEL_5;
        case 8:
          unint64_t v9 = *((unsigned __int8 *)v6 + 1);
          goto LABEL_38;
        case 9:
          unint64_t v9 = *((char *)v6 + 1);
LABEL_38:
          unint64_t v25 = (unint64_t *)((char *)v6 + 2);
          goto LABEL_43;
        case 10:
          unint64_t v9 = *(unsigned __int16 *)((char *)v6 + 1);
          unint64_t v25 = (unint64_t *)((char *)v6 + 3);
          goto LABEL_43;
        case 11:
          unint64_t v9 = *(__int16 *)((char *)v6 + 1);
          unint64_t v25 = (unint64_t *)((char *)v6 + 3);
          goto LABEL_43;
        case 12:
          unint64_t v9 = *(unsigned int *)((char *)v6 + 1);
          goto LABEL_42;
        case 13:
          unint64_t v9 = *(int *)((char *)v6 + 1);
LABEL_42:
          unint64_t v25 = (unint64_t *)((char *)v6 + 5);
LABEL_43:
          long long v87 = v25;
          goto LABEL_4;
        case 16:
          uint64_t Register = libunwind::LocalAddressSpace::getULEB128(&v87, v7);
          goto LABEL_9;
        case 17:
          uint64_t v48 = 0;
          unsigned int v49 = -7;
          do
          {
            if (v10 == v7) {
              goto LABEL_85;
            }
            char v50 = v49;
            v49 += 7;
            unsigned int v52 = *(unsigned __int8 *)v10;
            int64_t v10 = (unint64_t *)((char *)v10 + 1);
            unsigned int v51 = v52;
            v48 |= (unint64_t)(v52 & 0x7F) << v49;
          }
          while ((v52 & 0x80) != 0);
          uint64_t v53 = -1 << (v50 + 14);
          if (((v49 < 0x39) & (v51 >> 6)) != 0) {
            uint64_t v54 = v53;
          }
          else {
            uint64_t v54 = 0;
          }
          long long v87 = v10;
          v8[1] = v48 | v54;
          ++v8;
          goto LABEL_5;
        case 18:
          unint64_t v9 = *v8;
          goto LABEL_4;
        case 19:
          --v8;
          goto LABEL_5;
        case 20:
          unint64_t v9 = *(v8 - 1);
          goto LABEL_4;
        case 21:
          uint64_t v55 = *((unsigned __int8 *)v6 + 1);
          long long v87 = (unint64_t *)((char *)v6 + 2);
          unint64_t v9 = v8[-v55];
          goto LABEL_4;
        case 22:
          *(int8x16_t *)(v8 - 1) = vextq_s8(*(int8x16_t *)(v8 - 1), *(int8x16_t *)(v8 - 1), 8uLL);
          goto LABEL_5;
        case 23:
          long long v56 = (void *)*v8;
          *(_OWORD *)(v8 - 1) = *((_OWORD *)v8 - 1);
          *(v8 - 2) = (unint64_t)v56;
          goto LABEL_5;
        case 24:
          *(v8 - 1) = *(void *)*v8;
          --v8;
          goto LABEL_5;
        case 25:
          uint64_t v57 = *v8;
          if ((*v8 & 0x8000000000000000) != 0) {
            goto LABEL_66;
          }
          goto LABEL_5;
        case 26:
          unint64_t v58 = *v8;
          uint64_t v59 = *--v8;
          *unint64_t v8 = v59 & v58;
          goto LABEL_5;
        case 27:
          uint64_t v60 = *v8;
          uint64_t v61 = *--v8;
          *unint64_t v8 = v61 / v60;
          goto LABEL_5;
        case 28:
          uint64_t v62 = (void *)*v8;
          uint64_t v63 = *--v8;
          *unint64_t v8 = v63 - (void)v62;
          goto LABEL_5;
        case 29:
          uint64_t v26 = *v8;
          uint64_t v27 = *--v8;
          *unint64_t v8 = v27 % v26;
          goto LABEL_5;
        case 30:
          unint64_t v64 = *v8;
          uint64_t v65 = *--v8;
          *unint64_t v8 = v65 * v64;
          goto LABEL_5;
        case 31:
          uint64_t v57 = *v8;
LABEL_66:
          *unint64_t v8 = -v57;
          goto LABEL_5;
        case 32:
          *unint64_t v8 = ~*v8;
          goto LABEL_5;
        case 33:
          unint64_t v66 = *v8;
          uint64_t v67 = *--v8;
          *unint64_t v8 = v67 | v66;
          goto LABEL_5;
        case 34:
          long long v68 = (void *)*v8;
          uint64_t v69 = *--v8;
          *unint64_t v8 = (unint64_t)v68 + v69;
          goto LABEL_5;
        case 35:
          *v8 += libunwind::LocalAddressSpace::getULEB128(&v87, v7);
          goto LABEL_5;
        case 36:
          long long v70 = (void *)*v8;
          uint64_t v71 = *--v8;
          *unint64_t v8 = v71 << (char)v70;
          goto LABEL_5;
        case 37:
          long long v72 = (void *)*v8;
          unint64_t v73 = *--v8;
          *unint64_t v8 = v73 >> (char)v72;
          goto LABEL_5;
        case 38:
          long long v74 = (void *)*v8;
          uint64_t v75 = *--v8;
          *unint64_t v8 = v75 >> (char)v74;
          goto LABEL_5;
        case 39:
          unint64_t v76 = *v8;
          uint64_t v77 = *--v8;
          *unint64_t v8 = v77 ^ v76;
          goto LABEL_5;
        case 40:
          uint64_t v28 = *(__int16 *)((char *)v6 + 1);
          uint64_t v29 = (unint64_t *)((char *)v6 + 3);
          long long v87 = v29;
          if (*v8--) {
            long long v87 = (unint64_t *)((char *)v29 + v28);
          }
          goto LABEL_5;
        case 41:
          long long v31 = (void *)*v8;
          long long v32 = (void *)*--v8;
          *unint64_t v8 = v32 == v31;
          goto LABEL_5;
        case 42:
          long long v33 = (void *)*v8;
          unint64_t v34 = *--v8;
          *unint64_t v8 = v34 >= (unint64_t)v33;
          goto LABEL_5;
        case 43:
          long long v78 = (void *)*v8;
          unint64_t v79 = *--v8;
          *unint64_t v8 = v79 > (unint64_t)v78;
          goto LABEL_5;
        case 44:
          long long v35 = (void *)*v8;
          unint64_t v36 = *--v8;
          *unint64_t v8 = v36 <= (unint64_t)v35;
          goto LABEL_5;
        case 45:
          unint64_t v37 = (void *)*v8;
          unint64_t v38 = *--v8;
          *unint64_t v8 = v38 < (unint64_t)v37;
          goto LABEL_5;
        case 46:
          long long v80 = (void *)*v8;
          long long v81 = (void *)*--v8;
          *unint64_t v8 = v81 != v80;
          goto LABEL_5;
        case 47:
          long long v87 = (unint64_t *)((char *)v6 + *(__int16 *)((char *)v6 + 1) + 3);
          goto LABEL_5;
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
          unint64_t v9 = (v11 - 48);
          goto LABEL_4;
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 111:
          unsigned int v12 = v11 - 80;
          uint64_t v13 = a2;
          goto LABEL_8;
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
        case 129:
        case 130:
        case 131:
        case 132:
        case 133:
        case 134:
        case 135:
        case 136:
        case 137:
        case 138:
        case 139:
        case 140:
        case 141:
        case 142:
        case 143:
          uint64_t v15 = 0;
          unsigned int v16 = v11 - 112;
          unsigned int v17 = -7;
          do
          {
            if (v10 == v7) {
              goto LABEL_85;
            }
            char v18 = v17;
            v17 += 7;
            unsigned int v20 = *(unsigned __int8 *)v10;
            int64_t v10 = (unint64_t *)((char *)v10 + 1);
            unsigned int v19 = v20;
            v15 |= (unint64_t)(v20 & 0x7F) << v17;
          }
          while ((v20 & 0x80) != 0);
          uint64_t v21 = -1 << (v18 + 14);
          if (((v17 < 0x39) & (v19 >> 6)) != 0) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = 0;
          }
          uint64_t v23 = v15 | v22;
          long long v87 = v10;
          unint64_t v24 = a2;
          break;
        case 144:
          unsigned int v12 = libunwind::LocalAddressSpace::getULEB128(&v87, v7);
          uint64_t v13 = a2;
LABEL_8:
          uint64_t Register = libunwind::Registers_arm64::getRegister(v13, v12);
LABEL_9:
          v8[1] = Register;
          ++v8;
          goto LABEL_5;
        case 145:
          uint64_t v83 = (FILE **)MEMORY[0x263EF8C10];
          unint64_t v84 = (FILE *)*MEMORY[0x263EF8C10];
          long long v85 = "DW_OP_fbreg not implemented";
          goto LABEL_91;
        case 146:
          unsigned int v16 = libunwind::LocalAddressSpace::getULEB128(&v87, v7);
          uint64_t v39 = 0;
          int v40 = v87;
          unsigned int v41 = -7;
          do
          {
            if (v40 == v7)
            {
LABEL_85:
              uint64_t v83 = (FILE **)MEMORY[0x263EF8C10];
              unint64_t v84 = (FILE *)*MEMORY[0x263EF8C10];
              long long v85 = "truncated sleb128 expression";
              long long v86 = "getSLEB128";
LABEL_86:
              fprintf(v84, "libunwind: %s - %s\n", v86, v85);
              fflush(*v83);
              abort();
            }
            char v42 = v41;
            v41 += 7;
            unsigned int v44 = *(unsigned __int8 *)v40;
            int v40 = (unint64_t *)((char *)v40 + 1);
            unsigned int v43 = v44;
            v39 |= (unint64_t)(v44 & 0x7F) << v41;
          }
          while ((v44 & 0x80) != 0);
          uint64_t v45 = -1 << (v42 + 14);
          if (((v41 < 0x39) & (v43 >> 6)) != 0) {
            uint64_t v46 = v45;
          }
          else {
            uint64_t v46 = 0;
          }
          uint64_t v23 = v39 | v46;
          long long v87 = v40;
          unint64_t v24 = a2;
          break;
        case 147:
          uint64_t v83 = (FILE **)MEMORY[0x263EF8C10];
          unint64_t v84 = (FILE *)*MEMORY[0x263EF8C10];
          long long v85 = "DW_OP_piece not implemented";
          goto LABEL_91;
        case 148:
          long long v47 = (unint64_t *)*v8;
          long long v87 = (unint64_t *)((char *)v6 + 2);
          switch(*((unsigned char *)v6 + 1))
          {
            case 1:
              *unint64_t v8 = *(unsigned __int8 *)v47;
              goto LABEL_5;
            case 2:
              *unint64_t v8 = *(unsigned __int16 *)v47;
              goto LABEL_5;
            case 4:
              *unint64_t v8 = *(unsigned int *)v47;
              goto LABEL_5;
            case 8:
              goto LABEL_35;
            default:
              uint64_t v83 = (FILE **)MEMORY[0x263EF8C10];
              unint64_t v84 = (FILE *)*MEMORY[0x263EF8C10];
              long long v85 = "DW_OP_deref_size with bad size";
              goto LABEL_91;
          }
        default:
          uint64_t v83 = (FILE **)MEMORY[0x263EF8C10];
          unint64_t v84 = (FILE *)*MEMORY[0x263EF8C10];
          long long v85 = "DWARF opcode not implemented";
LABEL_91:
          long long v86 = "evaluateExpression";
          goto LABEL_86;
      }
      unint64_t v9 = libunwind::Registers_arm64::getRegister(v24, v16) + v23;
LABEL_4:
      v8[1] = v9;
      ++v8;
LABEL_5:
      int v6 = v87;
    }
    while (v87 < v7);
    return *v8;
  }
  return a3;
}

uint64_t libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getSavedRegister(libunwind::Registers_arm64 *this, uint64_t a2, int a3, unint64_t *a4)
{
  uint64_t result = 0;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
    case 3:
      uint64_t result = *(unint64_t *)((char *)a4 + a2);
      break;
    case 5:
      uint64_t result = libunwind::Registers_arm64::getRegister(this, a4);
      break;
    case 6:
      uint64_t result = *(void *)libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(a4, this, a2);
      break;
    case 7:
      uint64_t result = libunwind::DwarfInstructions<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::evaluateExpression(a4, this, a2);
      break;
    default:
      int v7 = (FILE **)MEMORY[0x263EF8C10];
      fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "getSavedRegister", "unsupported restore location for register");
      fflush(*v7);
      abort();
  }
  return result;
}

void *libunwind::Registers_arm64::setRegister(void *this, unsigned int a2, uint64_t a3)
{
  switch(a2)
  {
    case 0xFFFFFFFE:
    case 0x1Fu:
      this[31] = a3;
      break;
    case 0xFFFFFFFF:
    case 0x20u:
      this[32] = a3;
      break;
    case 0x1Du:
      this[29] = a3;
      break;
    case 0x1Eu:
      this[30] = a3;
      break;
    case 0x22u:
      this[33] = a3;
      break;
    default:
      if (a2 > 0x1C)
      {
        char v3 = (FILE **)MEMORY[0x263EF8C10];
        fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "setRegister", "unsupported arm64 register");
        fflush(*v3);
        abort();
      }
      this[a2] = a3;
      break;
  }
  return this;
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setFloatReg(uint64_t result, int a2, double a3)
{
  *(double *)(result + 8 * a2 - 224) = a3;
  return result;
}

double libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getFloatReg(uint64_t a1, int a2)
{
  return *(double *)(a1 + 8 * a2 - 224);
}

BOOL libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::validFloatReg(uint64_t a1, int a2)
{
  return (a2 & 0xFFFFFFE0) == 64;
}

void *libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setReg(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return libunwind::Registers_arm64::setRegister((void *)(a1 + 16), a2, a3);
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::getReg(uint64_t a1, unsigned int a2)
{
  return libunwind::Registers_arm64::getRegister((libunwind::Registers_arm64 *)(a1 + 16), a2);
}

uint64_t libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::validReg(uint64_t a1, unsigned int a2)
{
  BOOL v2 = a2 == 34 || a2 - 64 < 0xFFFFFFE1;
  if (a2 > 0x5F) {
    BOOL v2 = 0;
  }
  return a2 > 0xFFFFFFFD || v2;
}

int unw_get_reg(unw_cursor_t *a1, unw_regnum_t a2, unw_word_t *a3)
{
  uint64_t v4 = *(void *)&a2;
  if (!(*(unsigned int (**)(unw_cursor_t *))(a1->data[0] + 16))(a1)) {
    return -6542;
  }
  unw_word_t v6 = (*(uint64_t (**)(unw_cursor_t *, uint64_t))(a1->data[0] + 24))(a1, v4);
  int result = 0;
  *a3 = v6;
  return result;
}

int unw_set_reg(unw_cursor_t *a1, unw_regnum_t a2, unw_word_t a3)
{
  uint64_t v4 = *(void *)&a2;
  unw_word_t v11 = a3;
  if (!(*(unsigned int (**)(unw_cursor_t *))(a1->data[0] + 16))(a1)) {
    return -6542;
  }
  if (v4 == -1)
  {
    (*(void (**)(unw_cursor_t *, unsigned char *))(a1->data[0] + 72))(a1, v9);
    uint64_t v7 = (*(uint64_t (**)(unw_cursor_t *, uint64_t))(a1->data[0] + 24))(a1, 4294967294);
    (*(void (**)(unw_cursor_t *, uint64_t))(a1->data[0] + 24))(a1, 0xFFFFFFFFLL);
    if (v10)
    {
      (*(void (**)(unw_cursor_t *, uint64_t, uint64_t))(a1->data[0] + 32))(a1, 4294967294, v10 + v7);
      if (!__unw_is_pointer_auth_enabled())
      {
        unw_word_t v11 = a3;
        if (__unw_is_pointer_auth_enabled())
        {
          unw_word_t v11 = -1;
          goto LABEL_14;
        }
      }
    }
    else if (!__unw_is_pointer_auth_enabled())
    {
      unw_word_t v11 = a3;
      if (__unw_is_pointer_auth_enabled())
      {
        unw_word_t v11 = -1;
LABEL_14:
        unw_word_t v11 = -1;
        unint64_t v8 = (FILE **)MEMORY[0x263EF8C10];
        fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "__unw_set_reg", "Inconsistent invalid authentication state");
        fflush(*v8);
        abort();
      }
    }
    (*(void (**)(unw_cursor_t *, uint64_t, unw_word_t))(a1->data[0] + 32))(a1, 0xFFFFFFFFLL, v11);
    (*(void (**)(unw_cursor_t *, void))(a1->data[0] + 104))(a1, 0);
    return 0;
  }
  (*(void (**)(unw_cursor_t *, uint64_t, unw_word_t))(a1->data[0] + 32))(a1, v4, a3);
  return 0;
}

int unw_get_fpreg(unw_cursor_t *a1, unw_regnum_t a2, unw_fpreg_t *a3)
{
  uint64_t v4 = *(void *)&a2;
  if (!(*(unsigned int (**)(unw_cursor_t *))(a1->data[0] + 40))(a1)) {
    return -6542;
  }
  unw_fpreg_t v6 = (*(double (**)(unw_cursor_t *, uint64_t))(a1->data[0] + 48))(a1, v4);
  int result = 0;
  *a3 = v6;
  return result;
}

int unw_set_fpreg(unw_cursor_t *a1, unw_regnum_t a2, unw_fpreg_t a3)
{
  uint64_t v4 = *(void *)&a2;
  if (!(*(unsigned int (**)(unw_cursor_t *))(a1->data[0] + 40))(a1)) {
    return -6542;
  }
  (*(void (**)(unw_cursor_t *, uint64_t, unw_fpreg_t))(a1->data[0] + 56))(a1, v4, a3);
  return 0;
}

int unw_step(unw_cursor_t *a1)
{
  return (*(uint64_t (**)(unw_cursor_t *, void))(a1->data[0] + 64))(a1, 0);
}

int unw_get_proc_info(unw_cursor_t *a1, unw_proc_info_t *a2)
{
  if (a2->end_ip) {
    return 0;
  }
  else {
    return -6549;
  }
}

int unw_resume(unw_cursor_t *a1)
{
  return -6540;
}

int unw_get_proc_name(unw_cursor_t *a1, char *a2, size_t a3, unw_word_t *a4)
{
  if ((*(unsigned int (**)(unw_cursor_t *, char *, size_t, unw_word_t *))(a1->data[0] + 96))(a1, a2, a3, a4)) {
    return 0;
  }
  else {
    return -6540;
  }
}

int unw_is_fpreg(unw_cursor_t *a1, unw_regnum_t a2)
{
  return (*(uint64_t (**)(unw_cursor_t *, void))(a1->data[0] + 40))(a1, *(void *)&a2);
}

const char *__cdecl unw_regname(unw_cursor_t *a1, unw_regnum_t a2)
{
  return (const char *)(*(uint64_t (**)(unw_cursor_t *, void))(a1->data[0] + 112))(a1, *(void *)&a2);
}

int unw_is_signal_frame(unw_cursor_t *a1)
{
  return (*(uint64_t (**)(unw_cursor_t *))(a1->data[0] + 88))(a1);
}

uint64_t unw_iterate_dwarf_unwind_cache(void (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  for (i = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
        i < libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
        i += 2)
  {
    uint64_t v3 = *((void *)i + 2);
    uint64_t v4 = *((void *)i + 3);
    uint64_t v6 = *(void *)i;
    uint64_t v5 = *((void *)i + 1);
    a1(v5, v3, v4, v6);
  }

  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

const char *__unw_add_dynamic_fde(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  int result = libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(a1, v8, (uint64_t)v7, 0, a5, a6);
  if (!result) {
    return (const char *)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(v8[0], v8[3], v8[4], v8[0]);
  }
  return result;
}

uint64_t __unw_remove_dynamic_fde(uint64_t a1)
{
  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  BOOL v2 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  uint64_t v3 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
  {
    uint64_t v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  }
  else
  {
    uint64_t v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    do
    {
      if (*(void *)v2 != a1)
      {
        if (v2 != v4)
        {
          long long v5 = v2[1];
          *uint64_t v4 = *v2;
          v4[1] = v5;
        }
        v4 += 2;
      }
      v2 += 2;
    }
    while (v2 < v3);
  }
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v4;

  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

unsigned int *__unw_add_dynamic_eh_frame_section(unsigned int *result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  if (*result)
  {
    uint64_t v6 = (uint64_t)result;
    uint64_t v7 = result;
    do
    {
      if (libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE(v7, &v9, (uint64_t)v11, 1, a5, a6))
      {
        int result = (unsigned int *)libunwind::CFI_Parser<libunwind::LocalAddressSpace>::parseCIE(v7, (uint64_t)v11);
        unint64_t v8 = &v12;
        if (result) {
          return result;
        }
      }
      else
      {
        int result = (unsigned int *)libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(v6, v10[2], v10[3], v9);
        unint64_t v8 = v10;
      }
      uint64_t v7 = (unsigned int *)((char *)v7 + *v8);
    }
    while (*v7);
  }
  return result;
}

uint64_t __unw_remove_dynamic_eh_frame_section(uint64_t a1)
{
  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  BOOL v2 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  uint64_t v3 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
  {
    uint64_t v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  }
  else
  {
    uint64_t v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    do
    {
      if (*(void *)v2 != a1)
      {
        if (v2 != v4)
        {
          long long v5 = v2[1];
          *uint64_t v4 = *v2;
          v4[1] = v5;
        }
        v4 += 2;
      }
      v2 += 2;
    }
    while (v2 < v3);
  }
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v4;

  return pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

BOOL libunwind::findDynamicUnwindSections(uint64_t a1, uint64_t a2)
{
  pthread_rwlock_rdlock(&libunwind::findDynamicUnwindSectionsLock);
  if (libunwind::numDynamicUnwindSectionsFinders)
  {
    uint64_t v4 = 0;
    while (1)
    {
      int v5 = (*((uint64_t (**)(uint64_t, uint64_t))&libunwind::dynamicUnwindSectionsFinders + v4))(a1, a2);
      BOOL v6 = v5 != 0;
      if (v5) {
        break;
      }
      if (++v4 == libunwind::numDynamicUnwindSectionsFinders) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    BOOL v6 = 0;
  }
  pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
  return v6;
}

uint64_t __unw_add_find_dynamic_unwind_sections(uint64_t a1)
{
  pthread_rwlock_wrlock(&libunwind::findDynamicUnwindSectionsLock);
  uint64_t v2 = libunwind::numDynamicUnwindSectionsFinders;
  if (libunwind::numDynamicUnwindSectionsFinders)
  {
    if (libunwind::numDynamicUnwindSectionsFinders == 8)
    {
      uint64_t v3 = 4294960755;
    }
    else
    {
      uint64_t v4 = &libunwind::dynamicUnwindSectionsFinders;
      uint64_t v5 = libunwind::numDynamicUnwindSectionsFinders;
      while (*(void *)v4 != a1)
      {
        uint64_t v4 = (long long *)((char *)v4 + 8);
        if (!--v5) {
          goto LABEL_7;
        }
      }
      uint64_t v3 = 4294960749;
    }
  }
  else
  {
LABEL_7:
    uint64_t v3 = 0;
    ++libunwind::numDynamicUnwindSectionsFinders;
    *((void *)&libunwind::dynamicUnwindSectionsFinders + v2) = a1;
  }
  pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
  return v3;
}

uint64_t __unw_remove_find_dynamic_unwind_sections(uint64_t a1)
{
  pthread_rwlock_wrlock(&libunwind::findDynamicUnwindSectionsLock);
  uint64_t v2 = libunwind::numDynamicUnwindSectionsFinders;
  if (libunwind::numDynamicUnwindSectionsFinders)
  {
    uint64_t v3 = 0;
    uint64_t v4 = &unk_267704310;
    while (*((void *)v4 - 2) != a1)
    {
      ++v3;
      uint64_t v4 = (_OWORD *)((char *)v4 + 8);
      if (libunwind::numDynamicUnwindSectionsFinders == v3) {
        goto LABEL_7;
      }
    }
    if (libunwind::numDynamicUnwindSectionsFinders != v3)
    {
      uint64_t v7 = libunwind::numDynamicUnwindSectionsFinders - 1;
      unint64_t v8 = libunwind::numDynamicUnwindSectionsFinders - 1 - v3;
      if (libunwind::numDynamicUnwindSectionsFinders - 1 != v3)
      {
        if (v8 > 3)
        {
          unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFCLL;
          unint64_t v10 = (~v3 + libunwind::numDynamicUnwindSectionsFinders) & 0xFFFFFFFFFFFFFFFCLL;
          do
          {
            long long v11 = *(_OWORD *)((char *)v4 + 8);
            *(v4 - 1) = *(_OWORD *)((char *)v4 - 8);
            *uint64_t v4 = v11;
            v4 += 2;
            v10 -= 4;
          }
          while (v10);
          if (v8 == v9) {
            goto LABEL_17;
          }
          v3 += v9;
        }
        uint64_t v12 = (void *)&libunwind::dynamicUnwindSectionsFinders + v3 + 1;
        uint64_t v13 = ~v3 + v2;
        do
        {
          *(v12 - 1) = *v12;
          ++v12;
          --v13;
        }
        while (v13);
      }
LABEL_17:
      uint64_t v5 = 0;
      libunwind::numDynamicUnwindSectionsFinders = v7;
      *((void *)&libunwind::dynamicUnwindSectionsFinders + v7) = 0;
      goto LABEL_8;
    }
  }
LABEL_7:
  uint64_t v5 = 4294960749;
LABEL_8:
  pthread_rwlock_unlock(&libunwind::findDynamicUnwindSectionsLock);
  return v5;
}

_Unwind_Reason_Code _Unwind_RaiseException(_Unwind_Exception *exception_object)
{
  memset(&__src, 0, 512);
  unw_getcontext(&__src);
  exception_object->private_1 = 0;
  exception_object->private_2 = 0;
  v6[0] = &unk_26C224DD0;
  v6[1] = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(v7, &__src, sizeof(v7));
  long long v20 = *(_OWORD *)&__src.data[58];
  long long v21 = *(_OWORD *)&__src.data[60];
  long long v22 = *(_OWORD *)&__src.data[62];
  long long v23 = *(_OWORD *)&__src.data[64];
  long long v16 = *(_OWORD *)&__src.data[50];
  long long v17 = *(_OWORD *)&__src.data[52];
  long long v18 = *(_OWORD *)&__src.data[54];
  long long v19 = *(_OWORD *)&__src.data[56];
  long long v12 = *(_OWORD *)&__src.data[42];
  long long v13 = *(_OWORD *)&__src.data[44];
  long long v14 = *(_OWORD *)&__src.data[46];
  long long v15 = *(_OWORD *)&__src.data[48];
  long long v8 = *(_OWORD *)&__src.data[34];
  long long v9 = *(_OWORD *)&__src.data[36];
  long long v10 = *(_OWORD *)&__src.data[38];
  long long v11 = *(_OWORD *)&__src.data[40];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  memset(v27, 0, sizeof(v27));
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister((uint64_t)v6, 0);
  while (1)
  {
    int v2 = (*(uint64_t (**)(void *, void))(v6[0] + 64))(v6, 0);
    if (!v2) {
      return 5;
    }
    if ((v2 & 0x80000000) == 0)
    {
      uint64_t v33 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      (*(void (**)(void *, long long *))(v6[0] + 72))(v6, &v29);
      if (*((void *)&v29 + 1)) {
        continue;
      }
    }
    return 3;
    if (*((void *)&v30 + 1))
    {
      int v3 = (*((uint64_t (**)(uint64_t, uint64_t, _Unwind_Exception_Class, _Unwind_Exception *, void *))&v30 + 1))(1, 1, exception_object->exception_class, exception_object, v6);
      if (v3 != 8) {
        break;
      }
    }
  }
  if (v3 != 6) {
    return 3;
  }
  if ((*(unsigned int (**)(void *, uint64_t))(v6[0] + 16))(v6, 4294967294)) {
    uintptr_t v4 = (*(uint64_t (**)(void *, uint64_t))(v6[0] + 24))(v6, 4294967294);
  }
  else {
    uintptr_t v4 = 0;
  }
  exception_object->private_2 = v4;
  return unwind_phase2(&__src, (uint64_t)v6, exception_object);
}

uint64_t unwind_phase2(void *__src, uint64_t a2, void *a3)
{
  *(void *)a2 = &unk_26C224DD0;
  *(void *)(a2 + 8) = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy((void *)(a2 + 16), __src, 0x110uLL);
  long long v6 = *((_OWORD *)__src + 20);
  long long v8 = *((_OWORD *)__src + 17);
  long long v7 = *((_OWORD *)__src + 18);
  *(_OWORD *)(a2 + 320) = *((_OWORD *)__src + 19);
  *(_OWORD *)(a2 + 336) = v6;
  *(_OWORD *)(a2 + 288) = v8;
  *(_OWORD *)(a2 + 304) = v7;
  long long v9 = *((_OWORD *)__src + 24);
  long long v11 = *((_OWORD *)__src + 21);
  long long v10 = *((_OWORD *)__src + 22);
  *(_OWORD *)(a2 + 384) = *((_OWORD *)__src + 23);
  *(_OWORD *)(a2 + 400) = v9;
  *(_OWORD *)(a2 + 352) = v11;
  *(_OWORD *)(a2 + 368) = v10;
  long long v12 = *((_OWORD *)__src + 28);
  long long v14 = *((_OWORD *)__src + 25);
  long long v13 = *((_OWORD *)__src + 26);
  *(_OWORD *)(a2 + 448) = *((_OWORD *)__src + 27);
  *(_OWORD *)(a2 + 464) = v12;
  *(_OWORD *)(a2 + 416) = v14;
  *(_OWORD *)(a2 + 432) = v13;
  long long v15 = *((_OWORD *)__src + 32);
  long long v17 = *((_OWORD *)__src + 29);
  long long v16 = *((_OWORD *)__src + 30);
  *(_OWORD *)(a2 + 512) = *((_OWORD *)__src + 31);
  *(_OWORD *)(a2 + 528) = v15;
  *(_OWORD *)(a2 + 480) = v17;
  *(_OWORD *)(a2 + 496) = v16;
  *(void *)(a2 + 272) = *(void *)(a2 + 272);
  *(_OWORD *)(a2 + 544) = 0u;
  *(_OWORD *)(a2 + 560) = 0u;
  *(_OWORD *)(a2 + 576) = 0u;
  *(_OWORD *)(a2 + 592) = 0u;
  *(_OWORD *)(a2 + 602) = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister(a2, 0);
  while (1)
  {
    int v18 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 64))(a2, 1);
    if (!v18) {
      return 5;
    }
    if (v18 < 0) {
      break;
    }
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v19 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)a2 + 16))(a2, 4294967294)) {
      uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 24))(a2, 4294967294);
    }
    (*(void (**)(uint64_t, long long *))(*(void *)a2 + 72))(a2, &v24);
    if (!*((void *)&v24 + 1)) {
      break;
    }
    if (*((void *)&v25 + 1))
    {
      if (v19 == a3[3]) {
        uint64_t v20 = 6;
      }
      else {
        uint64_t v20 = 2;
      }
      int v21 = (*((uint64_t (**)(uint64_t, uint64_t, void, void *, uint64_t))&v25 + 1))(1, v20, *a3, a3, a2);
      if (v21 != 8)
      {
        if (v21 == 7) {
          (*(void (**)(uint64_t))(*(void *)a2 + 80))(a2);
        }
        return 2;
      }
      if (v19 == a3[3])
      {
        long long v22 = (FILE **)MEMORY[0x263EF8C10];
        fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "unwind_phase2", "during phase1 personality function said it would stop here, but now in phase2 it did not stop here");
        fflush(*v22);
        abort();
      }
    }
  }
  return 2;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  memset(&__src, 0, 512);
  memset(v4, 0, 512);
  unw_getcontext(&__src);
  private_1 = (uint64_t (*)(uint64_t, uint64_t, void, void *, uint64_t, uint64_t))exception_object->private_1;
  if (private_1) {
    unwind_phase2_forced(&__src, (uint64_t)v4, exception_object, private_1, exception_object->private_2);
  }
  else {
    unwind_phase2(&__src, (uint64_t)v4, exception_object);
  }
  int v3 = (FILE **)MEMORY[0x263EF8C10];
  fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "_Unwind_Resume", "_Unwind_Resume() can't return");
  fflush(*v3);
  abort();
}

uint64_t unwind_phase2_forced(void *__src, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t, void, void *, uint64_t, uint64_t), uint64_t a5)
{
  *(void *)a2 = &unk_26C224DD0;
  *(void *)(a2 + 8) = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy((void *)(a2 + 16), __src, 0x110uLL);
  long long v10 = *((_OWORD *)__src + 20);
  long long v12 = *((_OWORD *)__src + 17);
  long long v11 = *((_OWORD *)__src + 18);
  *(_OWORD *)(a2 + 320) = *((_OWORD *)__src + 19);
  *(_OWORD *)(a2 + 336) = v10;
  *(_OWORD *)(a2 + 288) = v12;
  *(_OWORD *)(a2 + 304) = v11;
  long long v13 = *((_OWORD *)__src + 24);
  long long v15 = *((_OWORD *)__src + 21);
  long long v14 = *((_OWORD *)__src + 22);
  *(_OWORD *)(a2 + 384) = *((_OWORD *)__src + 23);
  *(_OWORD *)(a2 + 400) = v13;
  *(_OWORD *)(a2 + 352) = v15;
  *(_OWORD *)(a2 + 368) = v14;
  long long v16 = *((_OWORD *)__src + 28);
  long long v18 = *((_OWORD *)__src + 25);
  long long v17 = *((_OWORD *)__src + 26);
  *(_OWORD *)(a2 + 448) = *((_OWORD *)__src + 27);
  *(_OWORD *)(a2 + 464) = v16;
  *(_OWORD *)(a2 + 416) = v18;
  *(_OWORD *)(a2 + 432) = v17;
  long long v19 = *((_OWORD *)__src + 32);
  long long v21 = *((_OWORD *)__src + 29);
  long long v20 = *((_OWORD *)__src + 30);
  *(_OWORD *)(a2 + 512) = *((_OWORD *)__src + 31);
  *(_OWORD *)(a2 + 528) = v19;
  *(_OWORD *)(a2 + 480) = v21;
  *(_OWORD *)(a2 + 496) = v20;
  *(void *)(a2 + 272) = *(void *)(a2 + 272);
  *(_OWORD *)(a2 + 544) = 0u;
  *(_OWORD *)(a2 + 560) = 0u;
  *(_OWORD *)(a2 + 576) = 0u;
  *(_OWORD *)(a2 + 592) = 0u;
  *(_OWORD *)(a2 + 602) = 0u;
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister(a2, 0);
  while ((*(int (**)(uint64_t, uint64_t))(*(void *)a2 + 64))(a2, 1) >= 1)
  {
    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t result = (*(uint64_t (**)(uint64_t, long long *))(*(void *)a2 + 72))(a2, &v23);
    if (!*((void *)&v23 + 1)) {
      return result;
    }
    uint64_t result = a4(1, 10, *a3, a3, a2, a5);
    if (result) {
      return result;
    }
    if (*((void *)&v24 + 1))
    {
      uint64_t result = (*((uint64_t (**)(uint64_t, uint64_t, void, void *, uint64_t))&v24 + 1))(1, 10, *a3, a3, a2);
      if (result != 8)
      {
        if (result != 7) {
          return result;
        }
        (*(void (**)(uint64_t))(*(void *)a2 + 80))(a2);
      }
    }
  }
  return a4(1, 26, *a3, a3, a2, a5);
}

_Unwind_Reason_Code _Unwind_ForcedUnwind(_Unwind_Exception *exception_object, _Unwind_Stop_Fn stop, void *stop_parameter)
{
  memset(&__src, 0, 512);
  memset(v7, 0, 512);
  unw_getcontext(&__src);
  exception_object->private_1 = (uintptr_t)stop;
  exception_object->private_2 = (uintptr_t)stop_parameter;
  unwind_phase2_forced(&__src, (uint64_t)v7, exception_object, (uint64_t (*)(uint64_t, uint64_t, void, void *, uint64_t, uint64_t))stop, (uint64_t)stop_parameter);
  return 2;
}

uintptr_t _Unwind_GetLanguageSpecificData(_Unwind_Context *context)
{
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  long long v2 = 0u;
  long long v3 = 0u;
  (*(void (**)(_Unwind_Context *, long long *))(*(void *)context + 72))(context, &v2);
  if (*((void *)&v2 + 1) && (void)v3) {
    return v3;
  }
  else {
    return 0;
  }
}

uintptr_t _Unwind_GetRegionStart(_Unwind_Context *context)
{
  uint64_t v3 = 0;
  memset(v2, 0, sizeof(v2));
  (*(void (**)(_Unwind_Context *, _OWORD *))(*(void *)context + 72))(context, v2);
  if (*((void *)&v2[0] + 1) && *(void *)&v2[0]) {
    return *(void *)&v2[0];
  }
  else {
    return 0;
  }
}

void _Unwind_DeleteException(_Unwind_Exception *exception_object)
{
  exception_cleanup = exception_object->exception_cleanup;
  if (exception_cleanup) {
    ((void (*)(uint64_t, _Unwind_Exception *))exception_cleanup)(1, exception_object);
  }
}

uintptr_t _Unwind_GetGR(_Unwind_Context *context, int index)
{
  uint64_t v2 = *(void *)&index;
  if (!(*(unsigned int (**)(_Unwind_Context *))(*(void *)context + 16))(context)) {
    return 0;
  }
  long long v4 = *(uint64_t (**)(_Unwind_Context *, uint64_t))(*(void *)context + 24);

  return v4(context, v2);
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  if ((*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(void *)context + 16))(context, 0xFFFFFFFFLL)) {
    uintptr_t v2 = (*(uint64_t (**)(_Unwind_Context *, uint64_t))(*(void *)context + 24))(context, 0xFFFFFFFFLL);
  }
  else {
    uintptr_t v2 = 0;
  }
  if ((*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(void *)context + 16))(context, 4294967294)) {
    (*(void (**)(_Unwind_Context *, uint64_t))(*(void *)context + 24))(context, 4294967294);
  }
  return v2;
}

void _Unwind_SetIP(_Unwind_Context *a1, uintptr_t new_value)
{
}

_Unwind_Reason_Code _Unwind_Resume_or_Rethrow(_Unwind_Exception *exception_object)
{
  if (exception_object->private_1) {
    _Unwind_Resume(exception_object);
  }

  return _Unwind_RaiseException(exception_object);
}

uintptr_t _Unwind_GetDataRelBase(_Unwind_Context *context)
{
  uint64_t v1 = (FILE **)MEMORY[0x263EF8C10];
  fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "_Unwind_GetDataRelBase", "_Unwind_GetDataRelBase() not implemented");
  fflush(*v1);
  abort();
}

uintptr_t _Unwind_GetTextRelBase(_Unwind_Context *context)
{
  uint64_t v1 = (FILE **)MEMORY[0x263EF8C10];
  fprintf((FILE *)*MEMORY[0x263EF8C10], "libunwind: %s - %s\n", "_Unwind_GetTextRelBase", "_Unwind_GetTextRelBase() not implemented");
  fflush(*v1);
  abort();
}

void *__cdecl _Unwind_FindEnclosingFunction(void *pc)
{
  memset(&__src, 0, 512);
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  unw_getcontext(&__src);
  v6.data[0] = (uint64_t)&unk_26C224DD0;
  v6.data[1] = (uint64_t)&libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(&v6.data[2], &__src, 0x110uLL);
  *(_OWORD *)&v6.data[60] = *(_OWORD *)&__src.data[58];
  *(_OWORD *)&v6.data[62] = *(_OWORD *)&__src.data[60];
  *(_OWORD *)&v6.data[64] = *(_OWORD *)&__src.data[62];
  *(_OWORD *)&v6.data[66] = *(_OWORD *)&__src.data[64];
  *(_OWORD *)&v6.data[52] = *(_OWORD *)&__src.data[50];
  *(_OWORD *)&v6.data[54] = *(_OWORD *)&__src.data[52];
  *(_OWORD *)&v6.data[56] = *(_OWORD *)&__src.data[54];
  *(_OWORD *)&v6.data[58] = *(_OWORD *)&__src.data[56];
  *(_OWORD *)&v6.data[44] = *(_OWORD *)&__src.data[42];
  *(_OWORD *)&v6.data[46] = *(_OWORD *)&__src.data[44];
  *(_OWORD *)&v6.data[48] = *(_OWORD *)&__src.data[46];
  *(_OWORD *)&v6.data[50] = *(_OWORD *)&__src.data[48];
  *(_OWORD *)&v6.data[36] = *(_OWORD *)&__src.data[34];
  *(_OWORD *)&v6.data[38] = *(_OWORD *)&__src.data[36];
  *(_OWORD *)&v6.data[40] = *(_OWORD *)&__src.data[38];
  *(_OWORD *)&v6.data[42] = *(_OWORD *)&__src.data[40];
  memset(&v6.data[68], 0, 74);
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister((uint64_t)&v6, 0);
  unw_set_reg(&v6, -1, (unw_word_t)pc);
  (*(void (**)(unw_cursor_t *, _OWORD *))(v6.data[0] + 72))(&v6, v3);
  if (*((void *)&v3[0] + 1) && *(void *)&v3[0]) {
    return *(void **)&v3[0];
  }
  else {
    return 0;
  }
}

_Unwind_Reason_Code _Unwind_Backtrace(_Unwind_Trace_Fn a1, void *a2)
{
  memset(&v5, 0, 512);
  unw_getcontext(&v5);
  v6[0] = &unk_26C224DD0;
  v6[1] = &libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(v7, &v5, sizeof(v7));
  long long v20 = *(_OWORD *)&v5.data[58];
  long long v21 = *(_OWORD *)&v5.data[60];
  long long v22 = *(_OWORD *)&v5.data[62];
  long long v23 = *(_OWORD *)&v5.data[64];
  long long v16 = *(_OWORD *)&v5.data[50];
  long long v17 = *(_OWORD *)&v5.data[52];
  long long v18 = *(_OWORD *)&v5.data[54];
  long long v19 = *(_OWORD *)&v5.data[56];
  long long v12 = *(_OWORD *)&v5.data[42];
  long long v13 = *(_OWORD *)&v5.data[44];
  long long v14 = *(_OWORD *)&v5.data[46];
  long long v15 = *(_OWORD *)&v5.data[48];
  long long v8 = *(_OWORD *)&v5.data[34];
  long long v9 = *(_OWORD *)&v5.data[36];
  long long v10 = *(_OWORD *)&v5.data[38];
  long long v11 = *(_OWORD *)&v5.data[40];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  memset(v27, 0, sizeof(v27));
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister((uint64_t)v6, 0);
  while ((*(int (**)(void *, void))(v6[0] + 64))(v6, 0) >= 1)
  {
    _Unwind_Reason_Code result = ((unsigned int (*)(void *, void *))a1)(v6, a2);
    if (result) {
      return result;
    }
  }
  return 5;
}

const void *__cdecl _Unwind_Find_FDE(const void *pc, dwarf_eh_bases *a2)
{
  memset(&__src, 0, 512);
  uintptr_t v7 = 0;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  unw_getcontext(&__src);
  v9.data[0] = (uint64_t)&unk_26C224DD0;
  v9.data[1] = (uint64_t)&libunwind::LocalAddressSpace::sThisAddressSpace;
  memcpy(&v9.data[2], &__src, 0x110uLL);
  *(_OWORD *)&v9.data[60] = *(_OWORD *)&__src.data[58];
  *(_OWORD *)&v9.data[62] = *(_OWORD *)&__src.data[60];
  *(_OWORD *)&v9.data[64] = *(_OWORD *)&__src.data[62];
  *(_OWORD *)&v9.data[66] = *(_OWORD *)&__src.data[64];
  *(_OWORD *)&v9.data[52] = *(_OWORD *)&__src.data[50];
  *(_OWORD *)&v9.data[54] = *(_OWORD *)&__src.data[52];
  *(_OWORD *)&v9.data[56] = *(_OWORD *)&__src.data[54];
  *(_OWORD *)&v9.data[58] = *(_OWORD *)&__src.data[56];
  *(_OWORD *)&v9.data[44] = *(_OWORD *)&__src.data[42];
  *(_OWORD *)&v9.data[46] = *(_OWORD *)&__src.data[44];
  *(_OWORD *)&v9.data[48] = *(_OWORD *)&__src.data[46];
  *(_OWORD *)&v9.data[50] = *(_OWORD *)&__src.data[48];
  *(_OWORD *)&v9.data[36] = *(_OWORD *)&__src.data[34];
  *(_OWORD *)&v9.data[38] = *(_OWORD *)&__src.data[36];
  *(_OWORD *)&v9.data[40] = *(_OWORD *)&__src.data[38];
  *(_OWORD *)&v9.data[42] = *(_OWORD *)&__src.data[40];
  memset(&v9.data[68], 0, 74);
  libunwind::UnwindCursor<libunwind::LocalAddressSpace,libunwind::Registers_arm64>::setInfoBasedOnIPRegister((uint64_t)&v9, 0);
  unw_set_reg(&v9, -1, (unw_word_t)pc);
  (*(void (**)(unw_cursor_t *, _OWORD *))(v9.data[0] + 72))(&v9, v5);
  a2->tbase = v7;
  a2->dbase = 0;
  a2->func = *(void *)&v5[0];
  if (*((void *)&v6 + 1)) {
    return (const void *)*((void *)&v6 + 1);
  }
  else {
    return 0;
  }
}

uintptr_t _Unwind_GetCFA(_Unwind_Context *a1)
{
  if (!(*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(void *)a1 + 16))(a1, 4294967294)) {
    return 0;
  }
  uintptr_t v2 = *(uint64_t (**)(_Unwind_Context *, uint64_t))(*(void *)a1 + 24);

  return v2(a1, 4294967294);
}

uintptr_t _Unwind_GetIPInfo(_Unwind_Context *context, int *ipBefore)
{
  *ipBefore = (*(uint64_t (**)(_Unwind_Context *))(*(void *)context + 88))(context);
  if ((*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(void *)context + 16))(context, 0xFFFFFFFFLL)) {
    uintptr_t v3 = (*(uint64_t (**)(_Unwind_Context *, uint64_t))(*(void *)context + 24))(context, 0xFFFFFFFFLL);
  }
  else {
    uintptr_t v3 = 0;
  }
  if ((*(unsigned int (**)(_Unwind_Context *, uint64_t))(*(void *)context + 16))(context, 4294967294)) {
    (*(void (**)(_Unwind_Context *, uint64_t))(*(void *)context + 24))(context, 4294967294);
  }
  return v3;
}

void __register_frame(const void *fde)
{
  if (!libunwind::CFI_Parser<libunwind::LocalAddressSpace>::decodeFDE((unsigned int *)fde, v4, (uint64_t)v3, 0, v1, v2)) {
    libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::add(v4[0], v4[3], v4[4], v4[0]);
  }
}

void __deregister_frame(const void *fde)
{
  pthread_rwlock_wrlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
  uintptr_t v2 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  uintptr_t v3 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed;
  if (libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0] >= libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed)
  {
    uint64_t v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
  }
  else
  {
    uint64_t v4 = libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_buffer[0];
    do
    {
      if (*(const void **)v2 != fde)
      {
        if (v2 != v4)
        {
          long long v5 = v2[1];
          *uint64_t v4 = *v2;
          v4[1] = v5;
        }
        v4 += 2;
      }
      v2 += 2;
    }
    while (v2 < v3);
  }
  libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_bufferUsed = v4;

  pthread_rwlock_unlock(&libunwind::DwarfFDECache<libunwind::LocalAddressSpace>::_lock);
}

uint64_t _dyld_find_unwind_sections()
{
  return MEMORY[0x270EDCDA8]();
}

void _dyld_register_func_for_remove_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270EDCE20](a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270EDD088](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270EDD0C8](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270EDD128](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDD188](__dst, __src, __n);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDDCC0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDDCC8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDDCD0](a1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDD2D8](__dst, __source, __size);
}