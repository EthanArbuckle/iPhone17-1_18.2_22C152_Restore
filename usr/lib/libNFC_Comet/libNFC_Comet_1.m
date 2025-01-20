uint64_t sub_225A23184(unsigned int *a1, int a2, unsigned char **a3)
{
  uint64_t v6;

  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MFCTransferResp");
  v6 = 1;
  if (a1 && a3)
  {
    if (a2 || **a3 != 10)
    {
      sub_2259A0EAC(1, a1 + 4842, 4u, 1u, (uint64_t)"Transfer/Restore Command Header failed!");
      v6 = 255;
    }
    else
    {
      sub_2259A0EAC(1, a1 + 4842, 4u, 4u, (uint64_t)"Transfer/Restore Command Header success");
      v6 = 0;
    }
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MFCTransferResp");
  return v6;
}

uint64_t sub_225A2325C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendAuthCmd");
  uint64_t v5 = 1;
  if (a1)
  {
    if (a3)
    {
      uint64_t v6 = *(void *)(a1 + 1456);
      if (v6)
      {
        if (sub_225A57604(*(unsigned int **)(a1 + 3040), v6))
        {
          *(void *)(a1 + 1456) = 0;
          *(void *)(a1 + 1464) = 0;
        }
        *(void *)(a1 + 2616) = phOsalNfc_GetMemory();
        phOsalNfc_MemCopy();
        uint64_t v7 = *(void *)(a1 + 1456);
        if (v7 && *(void *)(a1 + 2616))
        {
          uint64_t v5 = sub_225A120D0(a1, *(_DWORD *)(v7 + 4), a3, (uint64_t)v9);
          if (!v5)
          {
            uint64_t v5 = sub_225A53150(*(void *)(a1 + 3040), *(void *)(a1 + 1456), (uint64_t)v9, (uint64_t)sub_2259B5A70, a1);
            if (v5 == 13) {
              *(unsigned char *)(*(void *)(a1 + 2616) + 4) = BYTE4(v9[0]);
            }
          }
        }
        else
        {
          uint64_t v5 = 1;
        }
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendAuthCmd");
  return v5;
}

uint64_t sub_225A2339C(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendAuthCmdResp");
  if (a1)
  {
    v4 = *(_DWORD **)(a1 + 2616);
    if (v4)
    {
      if (((*v4 - 97) & 0xFFFFFFDF) != 0) {
        char v5 = 0;
      }
      else {
        char v5 = 0x80;
      }
    }
    else
    {
      char v5 = 0;
    }
    if (!a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Authentication command success");
      uint64_t v6 = *(int **)(a1 + 2616);
      if (v6)
      {
        int v7 = *v6;
        if ((*v6 & 0xFFFFFFFE) == 0x80)
        {
          a2 = 0;
          *(_DWORD *)(a1 + 2568) = v7;
          *(unsigned char *)(a1 + 2572) = *((unsigned char *)v6 + 4);
          *(unsigned char *)(a1 + 2573) = *((unsigned char *)v6 + 5) | v5;
          goto LABEL_15;
        }
        *(_DWORD *)(a1 + 2568) = v7;
        *(unsigned char *)(a1 + 2572) = *((unsigned char *)v6 + 4);
        *(unsigned char *)(a1 + 2573) = v5 | 0x10;
        phOsalNfc_MemCopy();
      }
      a2 = 0;
      goto LABEL_15;
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Authentication command failed!");
    sub_225A1364C(a1);
  }
  else
  {
    a2 = 1;
  }
LABEL_15:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendAuthCmdResp");
  return a2;
}

uint64_t sub_225A234EC(uint64_t a1, char a2)
{
  LOBYTE(v2) = a2;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MFCSendAuthCmdComplete");
  if (a1)
  {
    uint64_t v2 = v2;
    phOsalNfc_SetMemory();
    uint64_t v4 = *(void *)(a1 + 2616);
    if (v4)
    {
      if (*(void *)(v4 + 48))
      {
        uint64_t v7 = *(void *)(v4 + 48);
        LODWORD(v8) = 0;
      }
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 2616) = 0;
      uint64_t v5 = *(void *)(a1 + 2696);
      if (v5)
      {
        if (*(void *)(v5 + 32))
        {
          phOsalNfc_FreeMemory();
          *(void *)(*(void *)(a1 + 2696) + 32) = 0;
        }
        phOsalNfc_FreeMemory();
        *(void *)(a1 + 2696) = 0;
      }
    }
  }
  else
  {
    phOsalNfc_SetMemory();
    uint64_t v2 = 1;
  }
  sub_2259E2E14(a1, v2, (uint64_t)&v7);
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MFCSendAuthCmdComplete");
  return v2;
}

uint64_t sub_225A23604(uint64_t a1)
{
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MfcChkPresAuth");
  if (a1 && *(void *)(a1 + 1456))
  {
    *(unsigned char *)(a1 + 1486) = *(_DWORD *)(a1 + 2568);
    *(_WORD *)(a1 + 1487) = *(_WORD *)(a1 + 2572);
    phOsalNfc_MemCopy();
    phOsalNfc_SetMemory();
    LODWORD(v4) = 4;
    BYTE4(v4) = *(unsigned char *)(a1 + 2572);
    *(void *)&long long v5 = a1 + 1486;
    DWORD2(v5) = 9;
    *(void *)&long long v6 = a1 + 2016;
    DWORD2(v6) = 530;
    uint64_t v2 = sub_225A53150(*(void *)(a1 + 3040), *(void *)(a1 + 1456), (uint64_t)&v4, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MfcChkPresAuth");
  return v2;
}

uint64_t sub_225A2372C(unsigned int *a1, uint64_t a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MfcChkPresAuthProc");
  if (a1)
  {
    long long v4 = a1 + 4842;
    if (a2)
    {
      sub_2259A0EAC(1, v4, 4u, 1u, (uint64_t)"Authentication command failed!");
      sub_225A1364C((uint64_t)a1);
    }
    else
    {
      sub_2259A0EAC(1, v4, 4u, 4u, (uint64_t)"Authentication command success");
    }
  }
  else
  {
    a2 = 1;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MfcChkPresAuthProc");
  return a2;
}

uint64_t sub_225A237E0(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MfcChkPresAuthComplete");
  if (a1)
  {
    if (*(void *)(a1 + 2616))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 2616) = 0;
    }
    long long v4 = (unsigned int *)(a1 + 19368);
    if (a2)
    {
      sub_2259A0EAC(1, v4, 4u, 2u, (uint64_t)"Mifare classic - Auth failed");
      sub_225A1364C(a1);
      long long v5 = &qword_26B608888;
      if (*(unsigned char *)(a1 + 1483) == 1) {
        long long v5 = &qword_26B606BB0;
      }
      *(void *)(a1 + 2912) = v5;
      *(unsigned char *)(a1 + 2904) = 0;
      *(unsigned char *)(a1 + 2906) = 0;
      uint64_t v6 = *v5;
      if (*v5)
      {
        LOBYTE(v6) = 0;
        uint64_t v7 = v5 + 2;
        do
        {
          LOBYTE(v6) = v6 + 1;
          uint64_t v8 = *v7;
          v7 += 2;
        }
        while (v8);
      }
      *(unsigned char *)(a1 + 2905) = v6;
      a2 = sub_2259B528C(a1, 0, 0);
    }
    else
    {
      sub_2259A0EAC(1, v4, 4u, 4u, (uint64_t)"Auth command of Mifare classic Success");
      uint64_t v10 = 0;
      LODWORD(v11) = 0;
      sub_225A131B4(a1, (uint64_t)&v10, 0);
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid LibNfc Context passed by lower layer");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MfcChkPresAuthComplete");
  return a2;
}

uint64_t sub_225A23944(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MfcRawtoCmd");
  uint64_t v8 = 255;
  if (!a1) {
    goto LABEL_25;
  }
  if (!a3) {
    goto LABEL_25;
  }
  v9 = *(unsigned char **)(a3 + 32);
  if (!v9) {
    goto LABEL_25;
  }
  int v10 = *(_DWORD *)(a3 + 40);
  if (!v10 || !*(void *)(a3 + 48) || !a2 || !*(_DWORD *)(a3 + 56)) {
    goto LABEL_25;
  }
  if (v10 == 18)
  {
    if (*v9 != 160) {
      goto LABEL_25;
    }
    *(void *)(a1 + 2696) = 0;
    uint64_t v11 = (unsigned int *)(a1 + 19368);
    uint64_t Memory = phOsalNfc_GetMemory();
    *(void *)(a1 + 2696) = Memory;
    if (Memory)
    {
      *(void *)(Memory + 32) = 0;
      uint64_t v18 = phOsalNfc_GetMemory();
      uint64_t v19 = *(void *)(a1 + 2696);
      *(void *)(v19 + 32) = v18;
      if (v18)
      {
        *(_DWORD *)(v19 + 40) = 16;
        uint64_t v20 = *(void *)(a3 + 48);
        *(void *)(v19 + 48) = v20;
        int v21 = *(_DWORD *)(a3 + 56);
        *(_DWORD *)(v19 + 56) = v21;
        uint64_t v8 = 255;
        if (v20 && v21) {
          goto LABEL_22;
        }
        goto LABEL_25;
      }
LABEL_24:
      sub_2259A0EAC(1, v11, 4u, 1u, (uint64_t)"Failed to allocate memory, Insufficient Resources");
      uint64_t v8 = 255;
      goto LABEL_25;
    }
LABEL_23:
    sub_2259A0EAC(1, v11, 4u, 1u, (uint64_t)"Failed to allocate memory, Insufficient Resources");
    goto LABEL_25;
  }
  if (v10 != 12) {
    goto LABEL_25;
  }
  if ((*v9 & 0xFE) != 0x60) {
    goto LABEL_25;
  }
  uint64_t v11 = (unsigned int *)(a1 + 19368);
  if (phOsalNfc_MemCompare()) {
    goto LABEL_25;
  }
  *(void *)(a1 + 2696) = 0;
  uint64_t v12 = phOsalNfc_GetMemory();
  *(void *)(a1 + 2696) = v12;
  if (!v12) {
    goto LABEL_23;
  }
  *(void *)(v12 + 32) = 0;
  uint64_t v13 = phOsalNfc_GetMemory();
  uint64_t v14 = *(void *)(a1 + 2696);
  *(void *)(v14 + 32) = v13;
  if (!v13) {
    goto LABEL_24;
  }
  *(_DWORD *)(v14 + 40) = 10;
  uint64_t v15 = *(void *)(a3 + 48);
  *(void *)(v14 + 48) = v15;
  int v16 = *(_DWORD *)(a3 + 56);
  *(_DWORD *)(v14 + 56) = v16;
  uint64_t v8 = 255;
  if (v15 && v16)
  {
LABEL_22:
    phOsalNfc_SetMemory();
    phOsalNfc_SetMemory();
    **(_DWORD **)(a1 + 2696) = **(unsigned __int8 **)(a3 + 32);
    *(unsigned char *)(*(void *)(a1 + 2696) + 4) = *(unsigned char *)(*(void *)(a3 + 32) + 1);
    phOsalNfc_MemCopy();
    uint64_t v8 = 0;
    *a4 = *(void *)(a1 + 2696);
  }
LABEL_25:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MfcRawtoCmd");
  return v8;
}

uint64_t sub_225A23C14(unsigned int *a1, int *a2, uint64_t a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ChkMFCAuthWrtCmd");
  uint64_t v6 = 255;
  if (a2)
  {
    if (a3)
    {
      if (!sub_225A23D60(a1, a3))
      {
        uint64_t v6 = 0;
        int v7 = *a2;
        if (((*a2 - 128) > 0x20 || ((1 << (*(unsigned char *)a2 + 0x80)) & 0x100000003) == 0)
          && (v7 - 96) >= 2)
        {
          if (!v7)
          {
            uint64_t v8 = (unsigned __int8 *)*((void *)a2 + 4);
            if (!v8)
            {
LABEL_23:
              uint64_t v6 = 255;
              goto LABEL_24;
            }
            int v9 = *v8;
            int v10 = a2[10];
            if (v9 == 160)
            {
              if (v10 != 18) {
                goto LABEL_23;
              }
            }
            else if ((v9 & 0xFE) != 0x60 || v10 != 12)
            {
              goto LABEL_23;
            }
            goto LABEL_22;
          }
          if ((v7 & 0xFFFFFFFE) == 0xC0 && *((void *)a2 + 4) && a2[10] == 4)
          {
LABEL_22:
            uint64_t v6 = 0;
            goto LABEL_24;
          }
          uint64_t v6 = 0;
          if (v7 != 3 && v7 != 176 && v7 != 194) {
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ChkMFCAuthWrtCmd");
  return v6;
}

uint64_t sub_225A23D60(unsigned int *a1, uint64_t a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ChkMfCTag");
  if (!a2
    || *(_DWORD *)(a2 + 20)
    || *(_DWORD *)(a2 + 16) != 128
    || ((v4 = 0, unsigned int v5 = *(unsigned __int8 *)(a2 + 96), v5 > 0x38) || ((1 << v5) & 0x100010003000302) == 0)
    && ((unsigned int v6 = v5 - 136, v6 > 0x30) || ((1 << v6) & 0x1000000010001) == 0))
  {
    uint64_t v4 = 255;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ChkMfCTag");
  return v4;
}

uint64_t sub_225A23E34(uint64_t a1, uint64_t a2)
{
  unsigned int v6 = 0;
  uint64_t v7 = 0;
  char v5 = 1;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateMFCComplete");
  if (a1)
  {
    *(unsigned char *)(a1 + 1483) = a2 != 0;
    unsigned int v6 = &v5;
    LODWORD(v7) = 1;
    sub_2259E2E14(a1, a2, (uint64_t)&v6);
    *(unsigned char *)(a1 + 1484) = 0;
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid libnfc context received from lower layer!");
    a2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateMFCComplete");
  return a2;
}

uint64_t sub_225A23F04(uint64_t a1, uint64_t a2)
{
  char v6 = 1;
  v5[1] = 1;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateMFCComplete1");
  v5[0] = &v6;
  if (a1)
  {
    if (a2 != 121)
    {
      if (a2)
      {
        *(unsigned char *)(a1 + 1483) = 1;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Reactivation of Mifare classic failed!");
        a2 = 44;
      }
      else
      {
        *(unsigned char *)(a1 + 1483) = 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Reactivation of Mifare classic Success");
      }
    }
    sub_225A131B4(a1, (uint64_t)v5, a2);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid LibNfc Context passed by lower layer");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateMFCComplete1");
  return a2;
}

uint64_t sub_225A24014(uint64_t a1, unsigned int a2)
{
  unsigned int v8 = a2;
  sub_2259A0FB0(1, &v8, 5u, 5u, (uint64_t)"phLibNfc_SM_Init");
  if (v8 == 1)
  {
    if (!LODWORD(qword_26ABD83A0[0]))
    {
      uint64_t v2 = 0;
      v3 = qword_26ABD83A0;
      qword_26ABD83A0[0] = 0xC00000001;
      dword_26ABD83A8 = 0;
      do
      {
        uint64_t v4 = &qword_26ABD83A0[v2];
        v4[2] = 0x600000000;
        *((_DWORD *)v4 + 6) = 0;
        v2 += 2;
      }
      while (v2 != 8);
LABEL_9:
      *((_DWORD *)v3 + 20) = 0;
      *((_DWORD *)v3 + 21) = 6;
      *((_DWORD *)v3 + 22) = 0;
    }
  }
  else if (!LODWORD(qword_26ABD8330[0]))
  {
    uint64_t v5 = 0;
    v3 = qword_26ABD8330;
    qword_26ABD8330[0] = 0xC00000001;
    dword_26ABD8338 = 0;
    do
    {
      char v6 = &qword_26ABD8330[v5];
      v6[2] = 0x600000000;
      *((_DWORD *)v6 + 6) = 0;
      v5 += 2;
    }
    while (v5 != 8);
    goto LABEL_9;
  }
  sub_2259A10B4(1, &v8, 5u, 5u, (uint64_t)"phLibNfc_SM_Init");
  return 1;
}

uint64_t sub_225A24128(uint64_t a1, int a2)
{
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_IsVirtual");
  uint64_t v3 = 0;
  char v4 = 1;
  uint64_t v5 = &qword_26ABD8330;
  while (1)
  {
    char v6 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v10) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1) {
    uint64_t v5 = &qword_26ABD83A0;
  }
LABEL_7:
  int v7 = a2 - 1;
  if ((a2 - 1) > 6)
  {
    uint64_t v8 = 255;
  }
  else
  {
    uint64_t v8 = 255;
    if ((0x53u >> v7))
    {
      if (LODWORD(v5[2 * qword_225A5FB58[v7] + 2]) == 2) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = 255;
      }
    }
  }
  sub_2259A10B4(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_IsVirtual");
  return v8;
}

uint64_t sub_225A24230(uint64_t a1, int a2)
{
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_IsApdu");
  uint64_t v3 = 0;
  char v4 = 1;
  while (1)
  {
    char v5 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v10) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v5 & 1) == 0)
    {
      int v6 = dword_26ABD8350;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1) {
    int v7 = (int *)&unk_26ABD83C0;
  }
  else {
    int v7 = &dword_26ABD8350;
  }
  int v6 = *v7;
LABEL_9:
  sub_2259A10B4(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_IsApdu");
  if (v6 == 3 && a2 == 1) {
    return 0;
  }
  else {
    return 255;
  }
}

uint64_t sub_225A24310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v30 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v30, 5u, 5u, (uint64_t)"phLibNfc_SM_MainStateHandler");
  uint64_t v9 = 0;
  char v10 = 1;
  while (1)
  {
    char v11 = v10;
    if (*((void *)&unk_26ABD79B8 + 14 * v9) == v30) {
      break;
    }
    char v10 = 0;
    uint64_t v9 = 1;
    if ((v11 & 1) == 0)
    {
      int v12 = 255;
      goto LABEL_6;
    }
  }
  int v12 = *((_DWORD *)&unk_26ABD79B8 + 28 * v9 + 2);
LABEL_6:
  if (a2 == 1)
  {
    if (v30 == 1) {
      uint64_t v13 = &qword_26ABD83A0;
    }
    else {
      uint64_t v13 = &qword_26ABD8330;
    }
    unsigned int v14 = *(_DWORD *)v13;
    int v12 = v30;
    goto LABEL_15;
  }
  if (v12 == 1) {
    uint64_t v13 = &qword_26ABD83A0;
  }
  else {
    uint64_t v13 = &qword_26ABD8330;
  }
  unsigned int v14 = *(_DWORD *)v13;
  if (a2 <= 0x8E)
  {
LABEL_15:
    if (a2 != 4 && *((_DWORD *)v13 + 2) == 1) {
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if ((a2 - 145) > 9)
  {
LABEL_17:
    uint64_t v15 = 111;
    goto LABEL_55;
  }
LABEL_19:
  uint64_t v31 = v30;
  sub_2259A0FB0(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_RetrieveMainTable");
  int v16 = (int *)qword_264761018[2 * v14 + 1];
  sub_2259A10B4(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_RetrieveMainTable");
  uint64_t v31 = v30;
  sub_2259A0FB0(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_SearchTable");
  for (int i = *v16; i != 235 && i != a2; int i = v19)
  {
    int v19 = v16[4];
    v16 += 4;
  }
  sub_2259A10B4(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_SearchTable");
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v16 + 1);
  if (!v20)
  {
    uint64_t v15 = 147;
    goto LABEL_55;
  }
  if ((a2 - 145) <= 9)
  {
    if (a2 == 146)
    {
      *((_DWORD *)v13 + 2) = 0;
      a2 = *((unsigned int *)v13 + 3);
      if (a2 == 5) {
        *((_DWORD *)v13 + 1) = 12;
      }
    }
    else
    {
      if (a2 == 145)
      {
        int v21 = *((_DWORD *)v13 + 1);
        v16[1] = v21;
        *(_DWORD *)uint64_t v13 = v21;
        *((_DWORD *)v13 + 2) = 0;
        a2 = *((unsigned int *)v13 + 3);
        goto LABEL_46;
      }
      uint64_t v31 = v30;
      sub_2259A0FB0(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_HandleInternalEvent");
      uint64_t v22 = 0;
      char v23 = 1;
      while (1)
      {
        char v24 = v23;
        if (*((void *)&unk_26ABD79B8 + 14 * v22) == v31) {
          break;
        }
        char v23 = 0;
        uint64_t v22 = 1;
        if ((v24 & 1) == 0)
        {
          int v25 = 255;
          goto LABEL_38;
        }
      }
      int v25 = *((_DWORD *)&unk_26ABD79B8 + 28 * v22 + 2);
LABEL_38:
      if ((a2 - 147) > 7)
      {
        uint64_t v15 = 147;
        goto LABEL_57;
      }
      if (((1 << (a2 + 109)) & 0x78) == 0)
      {
        v26 = v25 == 1 ? &dword_26ABD83A8 : &dword_26ABD8338;
        if (*v26)
        {
          uint64_t v15 = 111;
LABEL_57:
          sub_2259A10B4(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_HandleInternalEvent");
          goto LABEL_55;
        }
      }
      sub_2259A10B4(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_HandleInternalEvent");
      uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v16 + 1);
    }
  }
LABEL_46:
  uint64_t v27 = v20(v30, a2, a3, a4, a5);
  uint64_t v15 = v27;
  if (!v27)
  {
    *(_DWORD *)uint64_t v13 = v16[1];
LABEL_50:
    if (a2 != 4) {
      *((_DWORD *)v13 + 2) = 0;
    }
    goto LABEL_52;
  }
  if (v27 != 13) {
    goto LABEL_50;
  }
  *((_DWORD *)v13 + 1) = v16[1];
  *((_DWORD *)v13 + 2) = 1;
  *((_DWORD *)v13 + 3) = a2;
LABEL_52:
  v28 = &dword_26ABD8410;
  if (!v12) {
    v28 = &dword_26ABD8328;
  }
  int *v28 = ((*(_DWORD *)v13 & 0x1F) << 18) & 0xF07DFFFF | ((*((_DWORD *)v13 + 1) & 0x1F) << 23) | *v28 & 0xF001FFFF | ((v13[1] & 1) << 17);
LABEL_55:
  sub_2259A10B4(0, (unsigned int *)&v30, 5u, 5u, (uint64_t)"phLibNfc_SM_MainStateHandler");
  return v15;
}

uint64_t sub_225A246D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v61 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v61, 5u, 5u, (uint64_t)"phLibNfc_SM_SEStateHandler");
  uint64_t v9 = 0;
  char v10 = 1;
  while (1)
  {
    char v11 = v10;
    if (*((void *)&unk_26ABD79B8 + 14 * v9) == v61) {
      break;
    }
    char v10 = 0;
    uint64_t v9 = 1;
    if ((v11 & 1) == 0)
    {
      int v12 = &qword_26ABD8330;
      goto LABEL_8;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v9 + 2) == 1) {
    int v12 = &qword_26ABD83A0;
  }
  else {
    int v12 = &qword_26ABD8330;
  }
LABEL_8:
  uint64_t v62 = v61;
  sub_2259A0FB0(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SM_RetrieveSEState");
  uint64_t v13 = 0;
  char v14 = 1;
  while (1)
  {
    char v15 = v14;
    if (*((void *)&unk_26ABD79B8 + 14 * v13) == v62) {
      break;
    }
    char v14 = 0;
    uint64_t v13 = 1;
    if ((v15 & 1) == 0)
    {
      BOOL v16 = 0;
      int v17 = dword_26ABD8338;
      goto LABEL_15;
    }
  }
  BOOL v29 = *((_DWORD *)&unk_26ABD79B8 + 28 * v13 + 2) == 1;
  BOOL v16 = v29;
  uint64_t v18 = &dword_26ABD83A8;
  if (!v29) {
    uint64_t v18 = &dword_26ABD8338;
  }
  int v17 = *v18;
LABEL_15:
  if ((a2 - 187) >= 0x10 && (a2 - 169) >= 2 && v17 == 1) {
    goto LABEL_18;
  }
  int v21 = &qword_26ABD83A0;
  if (!v16) {
    int v21 = &qword_26ABD8330;
  }
  int v22 = *((_DWORD *)v21 + 6);
  if ((a2 - 157) <= 0x1B)
  {
    if (v16) {
      char v23 = (int *)&unk_26ABD83C8;
    }
    else {
      char v23 = (int *)&unk_26ABD8358;
    }
    int v24 = *v23;
    int v25 = (int *)&unk_26ABD83D8;
    if (!v16) {
      int v25 = (int *)&unk_26ABD8368;
    }
    int v26 = *v25;
    uint64_t v27 = (int *)&unk_26ABD83E8;
    if (!v16) {
      uint64_t v27 = &dword_26ABD8378;
    }
    int v28 = *v27;
    BOOL v29 = v22 == 1 || v24 == 1;
    BOOL v30 = v29 || v26 == 1;
    if (v30 || v28 == 1)
    {
LABEL_18:
      uint64_t v19 = 111;
LABEL_19:
      sub_2259A10B4(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SM_RetrieveSEState");
      goto LABEL_20;
    }
  }
  uint64_t v32 = 0;
  BOOL v34 = (a2 - 158) < 3 && v22 != 1;
  int v35 = a2 & 0xFFFFFFFE;
  v36 = (int *)&unk_26ABD8340;
  v37 = (int *)&unk_26ABD83B0;
  if ((a2 & 0xFFFFFFFE) != 0xBC && !v34)
  {
    v37 = (int *)&unk_26ABD83C0;
    v36 = &dword_26ABD8350;
    v38 = v16 ? &unk_26ABD83C0 : &dword_26ABD8350;
    BOOL v39 = (a2 - 163) >= 0xA || v38[2] == 1;
    BOOL v40 = !v39;
    uint64_t v32 = 1;
    if (v35 != 192 && !v40)
    {
      v37 = (int *)&unk_26ABD83D0;
      v36 = (int *)&unk_26ABD8360;
      v41 = v16 ? &unk_26ABD83D0 : &unk_26ABD8360;
      BOOL v42 = (a2 - 175) >= 3 || v41[2] == 1;
      BOOL v43 = !v42;
      uint64_t v32 = 2;
      if (v35 != 196 && !v43)
      {
        v37 = (int *)&unk_26ABD83E0;
        v36 = &dword_26ABD8370;
        v44 = v16 ? &unk_26ABD83E0 : &dword_26ABD8370;
        BOOL v45 = (a2 & 0xFFFFFFFC) != 0xB4 || v44[2] == 1;
        BOOL v46 = !v45;
        uint64_t v32 = 3;
        if (v35 != 200 && !v46)
        {
          uint64_t v19 = 147;
          goto LABEL_19;
        }
      }
    }
  }
  if (v16) {
    v47 = v37;
  }
  else {
    v47 = v36;
  }
  uint64_t v48 = *v47;
  sub_2259A10B4(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SM_RetrieveSEState");
  uint64_t v62 = v61;
  sub_2259A0FB0(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_RetrieveSETable");
  v49 = (int *)qword_2647610D8[2 * v48 + 1];
  sub_2259A10B4(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_RetrieveSETable");
  uint64_t v62 = v61;
  sub_2259A0FB0(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SearchSETable");
  for (int i = *v49; i != 235 && i != a2; int i = v52)
  {
    int v52 = v49[4];
    v49 += 4;
  }
  sub_2259A10B4(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SearchSETable");
  v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v49 + 1);
  if (!v53)
  {
    uint64_t v19 = 147;
    goto LABEL_20;
  }
  if ((a2 - 187) <= 0xF && (a2 - 188) <= 0xD)
  {
    int v54 = 1 << (a2 + 68);
    if ((v54 & 0x1111) != 0)
    {
      v55 = &v12[2 * v32];
      int v56 = *((_DWORD *)v55 + 5);
      v49[1] = v56;
      *((_DWORD *)v55 + 4) = v56;
    }
    else if ((v54 & 0x2222) == 0)
    {
      goto LABEL_101;
    }
    v57 = &v12[2 * v32];
    *((_DWORD *)v57 + 6) = 0;
    a2 = *((unsigned int *)v57 + 7);
  }
LABEL_101:
  uint64_t v58 = v53(v61, a2, a3, a4, a5);
  uint64_t v19 = v58;
  if (v58)
  {
    if (v58 == 13)
    {
      v59 = &v12[2 * v32];
      *((_DWORD *)v59 + 5) = v49[1];
      *((_DWORD *)v59 + 6) = 1;
      *((_DWORD *)v59 + 7) = a2;
    }
    else
    {
      LODWORD(v12[2 * v32 + 3]) = 0;
    }
  }
  else
  {
    v60 = &v12[2 * v32];
    *((_DWORD *)v60 + 4) = v49[1];
    *((_DWORD *)v60 + 6) = 0;
  }
LABEL_20:
  sub_2259A10B4(0, (unsigned int *)&v61, 5u, 5u, (uint64_t)"phLibNfc_SM_SEStateHandler");
  return v19;
}

uint64_t sub_225A24B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v35 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v35, 5u, 5u, (uint64_t)"phLibNfc_SM_DnldStateHandler");
  uint64_t v9 = 0;
  unsigned int v34 = 255;
  LOBYTE(v10) = 1;
  char v11 = &dword_26ABD8380;
  while (*((void *)&unk_26ABD79B8 + 14 * v9) != v35)
  {
    BOOL v12 = v10;
    BOOL v10 = 0;
    uint64_t v9 = 1;
    if (!v12) {
      goto LABEL_7;
    }
  }
  unsigned int v34 = *((_DWORD *)&unk_26ABD79B8 + 28 * v9 + 2);
  BOOL v10 = v34 == 1;
  if (v34 == 1) {
    char v11 = &dword_26ABD83F0;
  }
LABEL_7:
  uint64_t v13 = *v11;
  if (a2 > 0xD8) {
    goto LABEL_30;
  }
  char v14 = &qword_26ABD83A0;
  if (!v10) {
    char v14 = &qword_26ABD8330;
  }
  if (a2 != 205 && *((_DWORD *)v14 + 22) == 1)
  {
LABEL_30:
    if ((a2 - 212) >= 5 && a2 != 8 && (a2 - 219) > 0xE)
    {
      uint64_t v24 = 111;
      goto LABEL_59;
    }
  }
  uint64_t v36 = v35;
  sub_2259A0FB0(0, (unsigned int *)&v36, 5u, 5u, (uint64_t)"phLibNfc_RetrieveDnldTable");
  char v15 = (int *)qword_264761138[2 * v13 + 1];
  sub_2259A10B4(0, (unsigned int *)&v36, 5u, 5u, (uint64_t)"phLibNfc_RetrieveDnldTable");
  uint64_t v36 = v35;
  sub_2259A0FB0(0, (unsigned int *)&v36, 5u, 5u, (uint64_t)"phLibNfc_SearchDnldTable");
  for (int i = *v15; i != 235 && i != a2; int i = v18)
  {
    int v18 = v15[4];
    v15 += 4;
  }
  sub_2259A10B4(0, (unsigned int *)&v36, 5u, 5u, (uint64_t)"phLibNfc_SearchDnldTable");
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((void *)v15 + 1);
  if (!v19)
  {
    uint64_t v24 = 147;
    goto LABEL_59;
  }
  if ((a2 - 219) <= 0xE)
  {
    int v20 = 1 << (a2 + 37);
    if ((v20 & 0x67E9) != 0)
    {
      *char v11 = v15[1];
      if (v10) {
        int v21 = &qword_26ABD83A0;
      }
      else {
        int v21 = &qword_26ABD8330;
      }
      *((_DWORD *)v21 + 22) = 0;
      int v22 = &dword_26ABD838C;
      if (v10) {
        int v22 = (int *)&unk_26ABD83FC;
      }
      a2 = *v22;
      *((_DWORD *)v21 + 2) = 0;
      sub_22599F9EC(1, &v34, 5u, 4u, (uint64_t)"Dnld TransStatus");
      uint64_t v23 = (*((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v15 + 1))(v35, a2, a3, a4, a5);
      goto LABEL_40;
    }
    if ((v20 & 0x1812) != 0)
    {
      *char v11 = v15[1];
      if (v10) {
        int v25 = &qword_26ABD83A0;
      }
      else {
        int v25 = &qword_26ABD8330;
      }
      *((_DWORD *)v25 + 22) = 0;
      int v26 = &dword_26ABD838C;
      if (v10) {
        int v26 = (int *)&unk_26ABD83FC;
      }
      a2 = *v26;
      *((_DWORD *)v25 + 2) = 0;
    }
    else
    {
      *char v11 = v15[1];
      if (v10) {
        uint64_t v32 = &qword_26ABD83A0;
      }
      else {
        uint64_t v32 = &qword_26ABD8330;
      }
      *((_DWORD *)v32 + 22) = 1;
      v33 = &dword_26ABD838C;
      if (v10) {
        v33 = (int *)&unk_26ABD83FC;
      }
      a2 = *v33;
    }
  }
  uint64_t v23 = v19(v35, a2, a3, a4, a5);
LABEL_40:
  uint64_t v24 = v23;
  if (v23)
  {
    if (v23 == 13)
    {
      *char v11 = v15[1];
      if ((a2 - 217) <= 0xFFFFFFFA)
      {
        uint64_t v27 = &qword_26ABD8330;
        if (v10) {
          uint64_t v27 = &qword_26ABD83A0;
        }
        *((_DWORD *)v27 + 22) = 1;
        *((_DWORD *)v27 + 23) = a2;
      }
      int v28 = &qword_26ABD8330;
      if (v10) {
        int v28 = &qword_26ABD83A0;
      }
      *((_DWORD *)v28 + 2) = 1;
      sub_22599F9EC(1, &v34, 5u, 4u, (uint64_t)"NFCSTATUS_PENDING");
      uint64_t v24 = 13;
    }
    else if (a2 != 8 && a2 != 205)
    {
      BOOL v30 = &qword_26ABD8330;
      if (v10) {
        BOOL v30 = &qword_26ABD83A0;
      }
      *((_DWORD *)v30 + 2) = 0;
      *((_DWORD *)v30 + 22) = 0;
    }
  }
  else
  {
    *char v11 = v15[1];
    if (a2 != 8 && a2 != 205)
    {
      uint64_t v24 = 0;
      BOOL v29 = &qword_26ABD8330;
      if (v10) {
        BOOL v29 = &qword_26ABD83A0;
      }
      *((_DWORD *)v29 + 22) = 0;
      *((_DWORD *)v29 + 2) = 0;
    }
  }
LABEL_59:
  sub_2259A10B4(0, (unsigned int *)&v35, 5u, 5u, (uint64_t)"phLibNfc_SM_DnldStateHandler");
  return v24;
}

uint64_t sub_225A24FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v19, 5u, 5u, (uint64_t)"phLibNfc_SM_StateHandler");
  if (a2 == 1)
  {
    uint64_t v9 = a3;
    uint64_t v19 = a3;
    unsigned int v10 = a3;
  }
  else
  {
    uint64_t v12 = 0;
    char v13 = 1;
    while (1)
    {
      char v14 = v13;
      if (*((void *)&unk_26ABD79B8 + 14 * v12) == v19) {
        break;
      }
      char v13 = 0;
      uint64_t v12 = 1;
      if ((v14 & 1) == 0)
      {
        unsigned int v10 = 255;
        goto LABEL_11;
      }
    }
    unsigned int v10 = *((_DWORD *)&unk_26ABD79B8 + 28 * v12 + 2);
    if (v10 < 2) {
      goto LABEL_12;
    }
LABEL_11:
    sub_2259A0EAC(0, (unsigned int *)&v19, 5u, 1u, (uint64_t)"Driver handle is not mapped with NFCC type: Critical Failure");
LABEL_12:
    if (a2 > 0xE9)
    {
      uint64_t v15 = 147;
      goto LABEL_36;
    }
    uint64_t v9 = v19;
    if ((a2 - 136) <= 5)
    {
      uint64_t v11 = sub_225A251E8(a2, v19);
      if (v11) {
        goto LABEL_21;
      }
      uint64_t v9 = v19;
    }
  }
  uint64_t v11 = sub_225A254B8(a2, v9);
  if (!v11)
  {
    if ((a2 - 1) > 0x99)
    {
      if ((a2 - 157) > 0x2D)
      {
        if (a2 < 0xCD)
        {
          uint64_t v15 = 147;
          goto LABEL_22;
        }
        uint64_t v11 = sub_225A24B90(v19, a2, a3, a4, a5);
      }
      else
      {
        uint64_t v11 = sub_225A246D8(v19, a2, a3, a4, a5);
      }
    }
    else
    {
      uint64_t v11 = sub_225A24310(v19, a2, a3, a4, a5);
    }
  }
LABEL_21:
  uint64_t v15 = v11;
LABEL_22:
  if (v10 <= 1)
  {
    uint64_t v16 = *((void *)&unk_26ABD79B8 + 14 * v10 + 10);
    if (v16)
    {
      if (v15) {
        BOOL v17 = v15 == 13;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17 || a2 == 76 || a2 == 141)
      {
        if (!*(_WORD *)(v16 + 152) && a2 != 76 && a2 != 141) {
          sub_225A25710(v19, a2);
        }
      }
      else
      {
        sub_225A25710(v19, a2);
        *(_WORD *)(v16 + 152) = 0;
      }
    }
  }
LABEL_36:
  sub_2259A10B4(0, (unsigned int *)&v19, 5u, 5u, (uint64_t)"phLibNfc_SM_StateHandler");
  return v15;
}

uint64_t sub_225A251E8(int a1, uint64_t a2)
{
  uint64_t v17 = a2;
  sub_2259A0FB0(0, (unsigned int *)&v17, 5u, 5u, (uint64_t)"phLibNfc_HandlePriorityEvent");
  uint64_t v3 = 0;
  LOBYTE(v4) = 1;
  char v5 = &qword_26ABD8330;
  while (1)
  {
    BOOL v6 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v17) {
      break;
    }
    BOOL v4 = 0;
    uint64_t v3 = 1;
    if (!v6)
    {
      int v7 = &qword_26ABD8330;
      goto LABEL_8;
    }
  }
  BOOL v4 = *((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1;
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1) {
    int v7 = &qword_26ABD83A0;
  }
  else {
    int v7 = &qword_26ABD8330;
  }
LABEL_8:
  if ((a1 - 139) > 2)
  {
    if ((a1 & 0xFFFFFFFE) != 0x88)
    {
      uint64_t v9 = a1 != 138;
      goto LABEL_49;
    }
    int v10 = *(_DWORD *)v7;
    if (v4) {
      uint64_t v11 = &qword_26ABD83A0;
    }
    else {
      uint64_t v11 = &qword_26ABD8330;
    }
    int v12 = *((_DWORD *)v11 + 1);
    if ((v10 - 7) <= 1 && v12 == 9 || v10 == 9 && v12 == 8) {
      goto LABEL_24;
    }
    if (v10 == 4)
    {
      if (a1 == 137 && v12 == 4)
      {
        if (v4) {
          char v5 = &qword_26ABD83A0;
        }
        *((_DWORD *)v5 + 2) = 0;
        *((_DWORD *)v11 + 1) = 12;
        char v13 = "Stop Discovery priority raised";
        goto LABEL_27;
      }
    }
    else if (v10 == 6 || v10 == 5 && v12 == 6)
    {
LABEL_24:
      if (v4) {
        char v5 = &qword_26ABD83A0;
      }
      *((_DWORD *)v5 + 2) = 0;
      *((_DWORD *)v11 + 1) = 12;
      char v13 = "Discovery priority raised";
      goto LABEL_27;
    }
    char v13 = "No change in Discovery priority";
LABEL_27:
    sub_2259A0EAC(0, (unsigned int *)&v17, 5u, 4u, (uint64_t)v13);
    goto LABEL_48;
  }
  int v8 = *(_DWORD *)v7;
  if (*(_DWORD *)v7 > 2u)
  {
    if (v4) {
      char v5 = &qword_26ABD83A0;
    }
    if (v8 == 11 && *((_DWORD *)v5 + 2) == 1)
    {
      if (a1 == 139) {
        uint64_t v9 = 111;
      }
      else {
        uint64_t v9 = 145;
      }
      sub_2259A0EAC(0, (unsigned int *)&v17, 5u, 4u, (uint64_t)"Shutdown already in progress");
      goto LABEL_49;
    }
    if (a1 == 141 || a1 == 139) {
      *(_DWORD *)int v7 = 11;
    }
    *((_DWORD *)v5 + 2) = 0;
    sub_2259A0EAC(0, (unsigned int *)&v17, 5u, 4u, (uint64_t)"State Machine is ready for shutdown");
    for (uint64_t i = 0; i != 8; i += 2)
    {
      uint64_t v15 = &v7[i];
      v15[2] = 0x600000000;
      *((_DWORD *)v15 + 6) = 0;
    }
LABEL_48:
    uint64_t v9 = 0;
    goto LABEL_49;
  }
  if (a1 == 141)
  {
    uint64_t v9 = 0;
    *(_DWORD *)int v7 = 1;
  }
  else
  {
    uint64_t v9 = 49;
    if (a1 != 140 || v8 == 1) {
      goto LABEL_49;
    }
    uint64_t v9 = 0;
  }
  if (v4) {
    char v5 = &qword_26ABD83A0;
  }
  *((_DWORD *)v5 + 2) = 0;
LABEL_49:
  sub_2259A10B4(0, (unsigned int *)&v17, 5u, 5u, (uint64_t)"phLibNfc_HandlePriorityEvent");
  return v9;
}

uint64_t sub_225A254B8(int a1, uint64_t a2)
{
  uint64_t v22 = a2;
  sub_2259A0FB0(0, (unsigned int *)&v22, 5u, 5u, (uint64_t)"phLibNfc_ValidateSMState");
  uint64_t v3 = 0;
  char v4 = 1;
  while (1)
  {
    char v5 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v22) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v5 & 1) == 0)
    {
      int v6 = 255;
      goto LABEL_6;
    }
  }
  int v6 = *((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2);
LABEL_6:
  if (a1 == 1) {
    int v7 = v22;
  }
  else {
    int v7 = v6;
  }
  int v8 = &qword_26ABD83A0;
  if (v7 != 1) {
    int v8 = &qword_26ABD8330;
  }
  unsigned int v9 = *(_DWORD *)v8;
  if (v9 > 2)
  {
    char v14 = &dword_26ABD83A8;
    if (v7 != 1) {
      char v14 = &dword_26ABD8338;
    }
    int v15 = *v14;
    if (v9 == 11 && v15 == 1)
    {
      uint64_t v17 = (int *)&unk_26ABD83AC;
      if (v7 != 1) {
        uint64_t v17 = &dword_26ABD833C;
      }
      int v18 = *v17;
      if (v18 == 141)
      {
        if (v7 == 1) {
          int v20 = (char *)&qword_26ABD83A0 + 4;
        }
        else {
          int v20 = (char *)&qword_26ABD8330 + 4;
        }
        uint64_t v12 = 145;
        char v13 = "####### LibNfc Stack Shutdown in progress #######";
        if (a1 != 145 || *(_DWORD *)v20 != 3) {
          goto LABEL_47;
        }
      }
      else
      {
        if (v18 != 139)
        {
          uint64_t v12 = 145;
          char v13 = "####### LibNfc Stack Shutdown in progress #######";
          goto LABEL_47;
        }
        if (v7 == 1) {
          uint64_t v19 = (char *)&qword_26ABD83A0 + 4;
        }
        else {
          uint64_t v19 = (char *)&qword_26ABD8330 + 4;
        }
        uint64_t v12 = 145;
        char v13 = "####### LibNfc Stack Shutdown in progress #######";
        if (a1 != 145 || *(_DWORD *)v19 != 1) {
          goto LABEL_47;
        }
      }
    }
    goto LABEL_29;
  }
  int v10 = (char *)&qword_26ABD83A0 + 4;
  if (v7 != 1) {
    int v10 = (char *)&qword_26ABD8330 + 4;
  }
  if (*(_DWORD *)v10 != 3 || (v7 != 1 ? (uint64_t v11 = &dword_26ABD8338) : (uint64_t v11 = &dword_26ABD83A8), *v11 != 1))
  {
LABEL_29:
    uint64_t v12 = 0;
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  if (((a1 - 141) > 5 || ((1 << (a1 + 115)) & 0x31) == 0) && a1 != 4)
  {
    char v13 = "####### LibNfc Stack Not Initialised #######";
    uint64_t v12 = 49;
LABEL_47:
    sub_2259A0EAC(0, (unsigned int *)&v22, 5u, 1u, (uint64_t)v13);
  }
LABEL_48:
  sub_2259A10B4(0, (unsigned int *)&v22, 5u, 5u, (uint64_t)"phLibNfc_ValidateSMState");
  return v12;
}

uint64_t sub_225A25710(uint64_t a1, int a2)
{
  uint64_t v11 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v11, 5u, 5u, (uint64_t)"phLibNfc_GetMwApi");
  uint64_t v3 = 0;
  char v4 = 1;
  while (1)
  {
    char v5 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v11) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
  }
  unsigned int v6 = *((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2);
  if (v6 > 1 || (uint64_t v7 = *((void *)&unk_26ABD79B8 + 14 * v6 + 10)) == 0)
  {
LABEL_10:
    uint64_t v8 = 136;
    goto LABEL_11;
  }
  if ((a2 - 1) < 0x8E || (a2 - 157) < 0x1C)
  {
    uint64_t v8 = 136;
    if ((a2 - 158) <= 0x16 && ((1 << (a2 + 98)) & 0x420021) != 0 || a2 == 76) {
      goto LABEL_11;
    }
  }
  else if ((a2 - 205) >= 0xC)
  {
    goto LABEL_10;
  }
  uint64_t v10 = 0;
  uint64_t v8 = 136;
  while ((unsigned __int16)word_268112BE0[v10] != a2)
  {
    v10 += 2;
    if (v10 == 264) {
      goto LABEL_11;
    }
  }
  uint64_t v8 = (unsigned __int16)word_268112BE0[v10 + 1];
  *(_DWORD *)(v7 + 156) = v8;
LABEL_11:
  sub_2259A10B4(0, (unsigned int *)&v11, 5u, 5u, (uint64_t)"phLibNfc_GetMwApi");
  return v8;
}

uint64_t sub_225A2586C(uint64_t a1)
{
  uint64_t v7 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetCurrState");
  uint64_t v1 = 0;
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    if (*((void *)&unk_26ABD79B8 + 14 * v1) == v7) {
      break;
    }
    char v2 = 0;
    uint64_t v1 = 1;
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = qword_26ABD8330;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v1 + 2) == 1) {
    char v5 = &qword_26ABD83A0;
  }
  else {
    char v5 = &qword_26ABD8330;
  }
  uint64_t v4 = *(unsigned int *)v5;
LABEL_9:
  sub_2259A10B4(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetCurrState");
  return v4;
}

uint64_t sub_225A2593C(uint64_t a1)
{
  uint64_t v7 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTargetState");
  uint64_t v1 = 0;
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    if (*((void *)&unk_26ABD79B8 + 14 * v1) == v7) {
      break;
    }
    char v2 = 0;
    uint64_t v1 = 1;
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = HIDWORD(qword_26ABD8330);
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v1 + 2) == 1) {
    char v5 = (char *)&qword_26ABD83A0 + 4;
  }
  else {
    char v5 = (char *)&qword_26ABD8330 + 4;
  }
  uint64_t v4 = *(unsigned int *)v5;
LABEL_9:
  sub_2259A10B4(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTargetState");
  return v4;
}

uint64_t sub_225A25A0C(uint64_t a1)
{
  uint64_t v7 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTransStatus");
  uint64_t v1 = 0;
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    if (*((void *)&unk_26ABD79B8 + 14 * v1) == v7) {
      break;
    }
    char v2 = 0;
    uint64_t v1 = 1;
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = dword_26ABD8338;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v1 + 2) == 1) {
    char v5 = &dword_26ABD83A8;
  }
  else {
    char v5 = &dword_26ABD8338;
  }
  uint64_t v4 = *v5;
LABEL_9:
  sub_2259A10B4(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTransStatus");
  return v4;
}

uint64_t sub_225A25ADC(uint64_t a1)
{
  uint64_t v7 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTransEvent");
  uint64_t v1 = 0;
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    if (*((void *)&unk_26ABD79B8 + 14 * v1) == v7) {
      break;
    }
    char v2 = 0;
    uint64_t v1 = 1;
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = dword_26ABD833C;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v1 + 2) == 1) {
    char v5 = (int *)&unk_26ABD83AC;
  }
  else {
    char v5 = &dword_26ABD833C;
  }
  uint64_t v4 = *v5;
LABEL_9:
  sub_2259A10B4(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTransEvent");
  return v4;
}

uint64_t sub_225A25BAC(uint64_t a1, int a2)
{
  uint64_t v8 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTransEvent");
  uint64_t v3 = 0;
  char v4 = 1;
  char v5 = &dword_26ABD833C;
  while (1)
  {
    char v6 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v8) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1) {
    char v5 = (int *)&unk_26ABD83AC;
  }
LABEL_7:
  *char v5 = a2;
  sub_2259A10B4(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTransEvent");
  return 0;
}

uint64_t sub_225A25C78(uint64_t a1, int a2)
{
  uint64_t v8 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTransStatus");
  uint64_t v3 = 0;
  char v4 = 1;
  char v5 = &dword_26ABD8338;
  while (1)
  {
    char v6 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v8) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1) {
    char v5 = &dword_26ABD83A8;
  }
LABEL_7:
  *char v5 = a2;
  sub_2259A10B4(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTransStatus");
  return 0;
}

uint64_t sub_225A25D44(uint64_t a1, int a2)
{
  uint64_t v8 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetCurrState");
  uint64_t v3 = 0;
  char v4 = 1;
  char v5 = &qword_26ABD8330;
  while (1)
  {
    char v6 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v8) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1) {
    char v5 = &qword_26ABD83A0;
  }
LABEL_7:
  *(_DWORD *)char v5 = a2;
  sub_2259A10B4(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetCurrState");
  return 0;
}

uint64_t sub_225A25E10(uint64_t a1, int a2)
{
  uint64_t v8 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTargetState");
  uint64_t v3 = 0;
  char v4 = 1;
  char v5 = (char *)&qword_26ABD8330 + 4;
  while (1)
  {
    char v6 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v8) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1) {
    char v5 = (char *)&qword_26ABD83A0 + 4;
  }
LABEL_7:
  *(_DWORD *)char v5 = a2;
  sub_2259A10B4(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTargetState");
  return 0;
}

uint64_t sub_225A25EDC(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_SetSECurrState");
  uint64_t v5 = 0;
  char v6 = 1;
  uint64_t v7 = &qword_26ABD8330;
  while (1)
  {
    char v8 = v6;
    if (*((void *)&unk_26ABD79B8 + 14 * v5) == v10) {
      break;
    }
    char v6 = 0;
    uint64_t v5 = 1;
    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v5 + 2) == 1) {
    uint64_t v7 = &qword_26ABD83A0;
  }
LABEL_7:
  LODWORD(v7[2 * a2 + 2]) = a3;
  sub_2259A10B4(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_SetSECurrState");
  return 0;
}

uint64_t sub_225A25FB0(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_SetSETransStatus");
  uint64_t v5 = 0;
  char v6 = 1;
  uint64_t v7 = &qword_26ABD8330;
  while (1)
  {
    char v8 = v6;
    if (*((void *)&unk_26ABD79B8 + 14 * v5) == v10) {
      break;
    }
    char v6 = 0;
    uint64_t v5 = 1;
    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v5 + 2) == 1) {
    uint64_t v7 = &qword_26ABD83A0;
  }
LABEL_7:
  LODWORD(v7[2 * a2 + 3]) = a3;
  sub_2259A10B4(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_SetSETransStatus");
  return 0;
}

uint64_t sub_225A26084(uint64_t a1, unsigned int a2)
{
  uint64_t v9 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v9, 5u, 5u, (uint64_t)"phLibNfc_SM_GetSETransStatus");
  uint64_t v3 = 0;
  char v4 = 1;
  uint64_t v5 = &qword_26ABD8330;
  while (1)
  {
    char v6 = v4;
    if (*((void *)&unk_26ABD79B8 + 14 * v3) == v9) {
      break;
    }
    char v4 = 0;
    uint64_t v3 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v3 + 2) == 1) {
    uint64_t v5 = &qword_26ABD83A0;
  }
LABEL_7:
  uint64_t v7 = LODWORD(v5[2 * a2 + 3]);
  sub_2259A10B4(0, (unsigned int *)&v9, 5u, 5u, (uint64_t)"phLibNfc_SM_GetSETransStatus");
  return v7;
}

uint64_t sub_225A26154(uint64_t a1)
{
  uint64_t v7 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetDnldTransEvent");
  uint64_t v1 = 0;
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    if (*((void *)&unk_26ABD79B8 + 14 * v1) == v7) {
      break;
    }
    char v2 = 0;
    uint64_t v1 = 1;
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = dword_26ABD838C;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_26ABD79B8 + 28 * v1 + 2) == 1) {
    uint64_t v5 = (int *)&unk_26ABD83FC;
  }
  else {
    uint64_t v5 = &dword_26ABD838C;
  }
  uint64_t v4 = *v5;
LABEL_9:
  sub_2259A10B4(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetDnldTransEvent");
  return v4;
}

uint64_t sub_225A26224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v11, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_ChkNdef");
  sub_2259E0420(v11, &v10);
  uint64_t v5 = 1;
  if (a3)
  {
    if (a2)
    {
      uint64_t v6 = v10;
      if (v10)
      {
        *(void *)(v10 + 8) = a2;
        *(void *)(v6 + 40) = a3;
        *(unsigned char *)(v6 + 540) = 1;
        *(unsigned char *)(v6 + 547) = 1;
        *(unsigned char *)(v6 + 644) = 0;
        *(_WORD *)(v6 + 642) = 1;
        *(unsigned char *)(v6 + 544) = 4;
        if (*(unsigned char *)(v6 + 65))
        {
          phOsalNfc_MemCopy();
          uint64_t v6 = v10;
          int v7 = *(unsigned __int8 *)(v10 + 65);
          *(unsigned char *)uint64_t v10 = 4;
          *(unsigned char *)(v6 + 540) = 1;
          *(_DWORD *)(v6 + 232) = 0;
          if (v7)
          {
            char v8 = 0;
            *(unsigned char *)uint64_t v6 = 5;
          }
          else
          {
            char v8 = 120;
          }
        }
        else
        {
          *(unsigned char *)uint64_t v6 = 4;
          *(unsigned char *)(v6 + 540) = 1;
          char v8 = 120;
          *(_DWORD *)(v6 + 232) = 0;
        }
        *(unsigned char *)(v6 + 266) = v8;
        uint64_t v5 = sub_225A26354(v6, *(unsigned char *)(v6 + 642), *(unsigned char *)(v6 + 643));
      }
    }
  }
  sub_2259A10B4(0, (unsigned int *)&v11, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_ChkNdef");
  return v5;
}

uint64_t sub_225A26354(uint64_t a1, char a2, char a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RdBytes");
  *(unsigned char *)(a1 + 204) &= 0xFCu;
  *(unsigned char *)(a1 + 208) = 0;
  *(void *)(a1 + 48) = sub_225A26B14;
  *(void *)(a1 + 56) = a1;
  *(_WORD *)(a1 + 264) = 260;
  int v6 = *(unsigned __int8 *)(a1 + 266);
  if (!*(unsigned char *)(a1 + 266))
  {
    *(_DWORD *)(a1 + 232) = 0;
    *(_WORD *)(a1 + 266) = 0;
LABEL_8:
    *(unsigned char *)(a1 + 268) = 0;
    phOsalNfc_MemCopy();
    *(_WORD *)(a1 + 526) = 7;
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    *(_DWORD *)(a1 + 232) = 0;
    *(unsigned char *)(a1 + 266) = 1;
    *(unsigned char *)(a1 + 267) = a3 + 8 * a2;
    goto LABEL_8;
  }
  if (v6 != 120)
  {
    uint64_t v7 = 245;
    goto LABEL_11;
  }
  *(_DWORD *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 266) = 120;
  phOsalNfc_SetMemory();
  *(_WORD *)(a1 + 526) = 7;
  if (*(unsigned char *)(a1 + 65)) {
    phOsalNfc_MemCopy();
  }
LABEL_9:
  uint64_t v7 = sub_2259D97A4(a1, (uint64_t)sub_225A2771C);
LABEL_11:
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RdBytes");
  return v7;
}

uint64_t sub_225A264AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = 0;
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_ConvertToReadOnly");
  sub_2259E0420(v10, &v9);
  uint64_t v5 = 1;
  if (a2)
  {
    uint64_t v6 = v9;
    if (v9)
    {
      *(void *)(v9 + 32) = a2;
      *(void *)(v6 + 40) = a3;
      *(unsigned char *)(v6 + 547) = 6;
      *(unsigned char *)(v6 + 644) = 0;
      *(unsigned char *)(v6 + 544) = 4;
      if (sub_2259CC2AC(*(void *)(v6 + 2712)) == 1) {
        char v7 = 0;
      }
      else {
        char v7 = 15;
      }
      uint64_t v5 = sub_225A26598(v9, 1, 3, v7);
      if (v5 == 13) {
        *(unsigned char *)uint64_t v9 = 9;
      }
    }
  }
  sub_2259A10B4(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_ConvertToReadOnly");
  return v5;
}

uint64_t sub_225A26598(uint64_t a1, char a2, char a3, char a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrAByte");
  *(unsigned char *)(a1 + 204) &= 0xFCu;
  *(unsigned char *)(a1 + 208) = 0;
  *(void *)(a1 + 48) = sub_225A26B14;
  *(void *)(a1 + 56) = a1;
  *(_WORD *)(a1 + 264) = 260;
  *(_DWORD *)(a1 + 232) = 0;
  *(unsigned char *)(a1 + 266) = 83;
  *(unsigned char *)(a1 + 267) = a3 + 8 * a2;
  *(unsigned char *)(a1 + 268) = a4;
  phOsalNfc_MemCopy();
  *(_WORD *)(a1 + 526) = 7;
  uint64_t v8 = sub_2259D97A4(a1, (uint64_t)sub_225A2771C);
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrAByte");
  return v8;
}

uint64_t sub_225A2668C(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = 0;
  uint64_t v15 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v15, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_RdNdef");
  sub_2259E0420(v15, &v14);
  uint64_t v11 = 1;
  if (a4 <= 1)
  {
    if (a3)
    {
      if (a2)
      {
        if (a5)
        {
          uint64_t v12 = v14;
          if (v14)
          {
            *(void *)(v14 + 16) = a5;
            *(void *)(v12 + 40) = a6;
            *(unsigned char *)(v12 + 547) = 2;
            *(void *)(v12 + 240) = a2;
            *(_DWORD *)(v12 + 248) = *a3;
            *(void *)(v12 + 552) = a3;
            *a3 = 0;
            *(_WORD *)(v12 + 252) = 0;
            *(unsigned char *)(v12 + 560) = a4;
            *(unsigned char *)(v12 + 644) = 1;
            if (a4 == 1 || *(unsigned char *)(v12 + 540) == 3)
            {
              *(unsigned char *)(v12 + 560) = 1;
              *(_WORD *)(v12 + 642) = 1;
              *(unsigned char *)uint64_t v12 = 5;
              *(unsigned char *)(v12 + 645) = 0;
              *(_DWORD *)(v12 + 232) = 0;
              *(unsigned char *)(v12 + 266) = 0;
              *(unsigned char *)(v12 + 540) = 2;
              if (a4)
              {
                uint64_t v11 = sub_225A26354(v12, 1, 0);
                goto LABEL_13;
              }
            }
            else
            {
              *(unsigned char *)(v12 + 540) = 2;
              if (*(unsigned char *)(v12 + 645) == 1)
              {
                uint64_t v11 = 26;
                goto LABEL_13;
              }
            }
            sub_225A267E0(v12);
            uint64_t v11 = 0;
          }
        }
      }
    }
  }
LABEL_13:
  sub_2259A10B4(0, (unsigned int *)&v15, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_RdNdef");
  return v11;
}

uint64_t sub_225A267E0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CpDataToUsrBuf");
  if (*(_DWORD *)(a1 + 248) >= *(unsigned __int16 *)(a1 + 78))
  {
    phOsalNfc_MemCopy();
    char v3 = 0;
    __int16 v5 = 0;
    int v6 = *(unsigned __int16 *)(a1 + 78);
    **(_DWORD **)(a1 + 552) = v6;
    *(unsigned char *)(a1 + 645) = 1;
    __int16 v4 = *(_WORD *)(a1 + 640) - v6;
  }
  else
  {
    phOsalNfc_MemCopy();
    **(_DWORD **)(a1 + 552) = *(_DWORD *)(a1 + 248);
    int v2 = *(_DWORD *)(a1 + 248);
    char v3 = *(unsigned char *)(a1 + 643) + v2;
    __int16 v4 = *(_WORD *)(a1 + 640) - v2;
    __int16 v5 = *(_WORD *)(a1 + 78) - v2;
  }
  *(unsigned char *)(a1 + 643) = v3;
  *(_WORD *)(a1 + 640) = v4;
  *(_WORD *)(a1 + 78) = v5;
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CpDataToUsrBuf");
  return 0;
}

uint64_t sub_225A268C8(uint64_t a1, char *a2, _DWORD *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v21 = 0;
  uint64_t v22 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v22, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_WrNdef");
  sub_2259E0420(v22, &v21);
  uint64_t v11 = 1;
  if (a3 && a5 && v21)
  {
    phOsalNfc_MemCopy();
    uint64_t v12 = v21;
    *(_DWORD *)(v21 + 2740) = 3;
    *(void *)(v12 + 24) = a5;
    *(void *)(v12 + 40) = a6;
    *(unsigned char *)(v12 + 547) = 3;
    *(_WORD *)(v12 + 252) = 0;
    **(_WORD **)(v12 + 528) = 0;
    uint64_t v13 = v21;
    uint64_t v14 = (_DWORD *)(v21 + 2740);
    if (*a3)
    {
      uint64_t v14 = a3;
      uint64_t v15 = a2;
    }
    else
    {
      uint64_t v15 = (char *)(v21 + 2736);
    }
    *(void *)(v21 + 240) = v15;
    *(_DWORD *)(v13 + 248) = *v14;
    *(_WORD *)(v13 + 252) = 0;
    *(void *)(v13 + 256) = v14;
    *uint64_t v14 = 0;
    *(unsigned char *)(v13 + 644) = 2;
    *(unsigned char *)(v13 + 560) = a4;
    if (a4 == 1 || *(unsigned char *)(v13 + 540) == 2)
    {
      *(unsigned char *)(v13 + 560) = 1;
      *(_WORD *)(v13 + 642) = 1;
      *(unsigned char *)uint64_t v13 = 5;
      *(_DWORD *)(v13 + 232) = 0;
      *(unsigned char *)(v13 + 266) = 0;
      *(unsigned char *)(v13 + 645) = 0;
      *(_WORD *)(v13 + 640) = *(_WORD *)(v13 + 202);
      uint64_t v15 = (char *)(v13 + 267);
    }
    else
    {
      *(unsigned char *)uint64_t v13 = 2;
    }
    char v16 = *v15;
    *(unsigned char *)(v13 + 540) = 3;
    if (a4 || *(unsigned char *)(v13 + 645) != 1)
    {
      sub_225A26A94(v13);
      char v17 = *(unsigned char *)(v21 + 642);
      char v18 = *(unsigned char *)(v21 + 643);
      if (*(unsigned char *)(v21 + 560) == 1) {
        uint64_t v19 = sub_225A26354(v21, v17, v18);
      }
      else {
        uint64_t v19 = sub_225A26598(v21, v17, v18, v16);
      }
      uint64_t v11 = v19;
    }
    else
    {
      uint64_t v11 = 26;
    }
  }
  sub_2259A10B4(0, (unsigned int *)&v22, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_WrNdef");
  return v11;
}

uint64_t sub_225A26A94(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_BlkChk");
  unsigned int v2 = *(unsigned __int8 *)(a1 + 643);
  char v3 = *(unsigned char *)(a1 + 642);
  if (v2 > 7) {
    ++v3;
  }
  *(unsigned char *)(a1 + 642) = v3;
  *(unsigned char *)(a1 + 643) = v2 & 7;

  return sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_BlkChk");
}

uint64_t sub_225A26B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v32 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v32, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_Process");
  if (!(_BYTE)a3)
  {
    uint64_t v5 = 245;
    switch(*(unsigned char *)a2)
    {
      case 2:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProWrUsrData");
        uint64_t v6 = *(unsigned __int16 *)(a2 + 252);
        if (*(unsigned __int8 *)(a2 + 266) == *(unsigned __int8 *)(*(void *)(a2 + 240) + v6)
          && *(_WORD *)(a2 + 264) == 1)
        {
          *(_WORD *)(a2 + 252) = v6 + 1;
          --*(_WORD *)(a2 + 640);
          ++*(unsigned char *)(a2 + 643);
          sub_225A26A94(a2);
          uint64_t v7 = *(unsigned __int16 *)(a2 + 252);
          if (*(_DWORD *)(a2 + 248) == v7 || !*(_WORD *)(a2 + 640))
          {
            *(unsigned char *)(a2 + 645) = *(unsigned __int16 *)(a2 + 640) == 0;
            sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrLByte");
            unsigned int v25 = *(unsigned __int16 *)(a2 + 68);
            char v26 = *(unsigned char *)(a2 + 70);
            *(unsigned char *)a2 = 7;
            *(unsigned char *)(a2 + 646) = 8;
            __int16 v27 = *(_WORD *)(a2 + 252);
            if (*(unsigned char *)(a2 + 560) != 1) {
              LOBYTE(v27) = *(unsigned char *)(a2 + 78) + v27;
            }
            if (v25 > 6) {
              ++v26;
            }
            a3 = sub_225A26598(a2, v26, (v25 + 1) & 7, v27);
            sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrLByte");
          }
          else
          {
            *(unsigned char *)a2 = 2;
            a3 = sub_225A26598(a2, *(unsigned char *)(a2 + 642), *(unsigned char *)(a2 + 643), *(unsigned char *)(*(void *)(a2 + 240) + v7));
          }
        }
        else
        {
          a3 = 27;
        }
        char v17 = "phFriNfc_Tpz_H_ProWrUsrData";
        goto LABEL_140;
      case 4:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProReadID");
        if (*(unsigned char *)(a2 + 266) == 17 && *(_WORD *)(a2 + 264) == 6)
        {
          phOsalNfc_MemCopy();
          *(unsigned char *)a2 = 5;
          *(_DWORD *)(a2 + 232) = 0;
          *(unsigned char *)(a2 + 266) = 0;
          a3 = sub_225A26354(a2, *(unsigned __int8 *)(a2 + 642), *(unsigned __int8 *)(a2 + 643));
        }
        else
        {
          a3 = 27;
        }
        char v17 = "phFriNfc_Tpz_H_ProReadID";
        goto LABEL_140;
      case 5:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProReadAll");
        BOOL v13 = *(unsigned __int8 *)(a2 + 648) == *(unsigned __int8 *)(a2 + 268)
           && *(unsigned __int8 *)(a2 + 649) == *(unsigned __int8 *)(a2 + 269)
           && *(unsigned __int8 *)(a2 + 650) == *(unsigned __int8 *)(a2 + 270)
           && *(unsigned __int8 *)(a2 + 651) == *(unsigned __int8 *)(a2 + 271);
        if (*(unsigned char *)(a2 + 266) != 17) {
          goto LABEL_65;
        }
        char v15 = !v13;
        if (*(_WORD *)(a2 + 264) != 122) {
          char v15 = 1;
        }
        if (v15)
        {
LABEL_65:
          a3 = 27;
        }
        else
        {
          phOsalNfc_MemCopy();
          sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkLockBits");
          if (*(unsigned char *)(a2 + 380) == 1
            && (*(unsigned __int8 *)(a2 + 381) | 0x80) == 0xE0
            && *(unsigned char *)(a2 + 279) != 15)
          {
            if (*(unsigned char *)(a2 + 279)) {
              char v16 = 3;
            }
            else {
              char v16 = 2;
            }
          }
          else
          {
            char v16 = 1;
          }
          *(unsigned char *)(a2 + 545) = v16;
          sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkLockBits");
          sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CallNxtOp");
          int v21 = *(unsigned __int8 *)(a2 + 540);
          if (v21 == 2)
          {
            if (sub_225A279EC(a2))
            {
              a3 = 28;
            }
            else
            {
              a3 = sub_225A27858(a2);
              if (!a3)
              {
                *(unsigned char *)(a2 + 643) += 2;
                sub_225A267E0(a2);
              }
            }
          }
          else if (v21 == 1)
          {
            sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkCCinChkNdef");
            int v22 = 22;
            if (*(unsigned __int8 *)(a2 + 661) == 225)
            {
              unsigned int v23 = *(unsigned __int8 *)(a2 + 664);
              if (v23 >= 0x10) {
                int v22 = 22;
              }
              else {
                int v22 = 0;
              }
              if (v23 >= 0x10) {
                __int16 v24 = *(_WORD *)(a2 + 202);
              }
              else {
                __int16 v24 = 92;
              }
              *(_WORD *)(a2 + 640) = v24;
              *(_WORD *)(a2 + 202) = v24;
            }
            if (*(unsigned char *)(a2 + 545) != 1)
            {
              if (v22) {
                char v30 = 3;
              }
              else {
                char v30 = 0;
              }
              *(unsigned char *)(a2 + 545) = v30;
            }
            sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkCCinChkNdef");
            if (*(unsigned char *)(a2 + 545) == 3)
            {
              a3 = 0;
              *(unsigned char *)(a2 + 545) = 0;
              *(_WORD *)(a2 + 640) = 90;
              *(_WORD *)(a2 + 202) = 90;
            }
            else
            {
              a3 = sub_225A277B4((unsigned int *)a2, *(unsigned __int8 *)(a2 + 662));
              if (!a3)
              {
                if (*(unsigned __int8 *)(a2 + 663) <= 0xEu) {
                  sub_225A27858(a2);
                }
                a3 = 0;
              }
            }
          }
          else if ((*(unsigned __int8 *)(a2 + 545) | 2) == 2)
          {
            if (sub_225A279EC(a2))
            {
              char v29 = 0;
              *(_WORD *)(a2 + 68) = 4;
              *(unsigned char *)(a2 + 70) = 1;
              *(unsigned char *)(a2 + 643) = 4;
            }
            else
            {
              sub_225A27858(a2);
              char v29 = 4;
            }
            *(unsigned char *)(a2 + 646) = v29;
            a3 = sub_225A27AF8(a2);
          }
          else
          {
            a3 = 27;
          }
          sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CallNxtOp");
        }
        char v17 = "phFriNfc_Tpz_H_ProReadAll";
        goto LABEL_140;
      case 6:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProWrNMN");
        int v8 = *(unsigned __int8 *)(a2 + 646);
        if (v8 == 6)
        {
          if (*(unsigned __int8 *)(a2 + 266) == 225 && *(_WORD *)(a2 + 264) == 1)
          {
            a3 = 0;
            char v18 = *(unsigned char *)(a2 + 545);
            if (!v18) {
              char v18 = 2;
            }
            *(unsigned char *)(a2 + 545) = v18;
            **(_DWORD **)(a2 + 256) = *(unsigned __int16 *)(a2 + 252);
            goto LABEL_72;
          }
        }
        else if (v8 == 5 && !*(unsigned char *)(a2 + 266) && *(_WORD *)(a2 + 264) == 1)
        {
          *(unsigned char *)a2 = 7;
          unsigned int v9 = *(unsigned __int16 *)(a2 + 68);
          char v10 = *(unsigned char *)(a2 + 70);
          if (v9 > 6) {
            ++v10;
          }
          *(unsigned char *)(a2 + 646) = 7;
          a3 = sub_225A26598(a2, v10, (v9 + 1) & 7, 0);
LABEL_72:
          char v17 = "phFriNfc_Tpz_H_ProWrNMN";
LABEL_140:
          sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)v17);
          break;
        }
        a3 = 27;
        goto LABEL_72;
      case 7:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProWrTLV");
        int v11 = *(unsigned __int8 *)(a2 + 646);
        if (v11 != 8)
        {
          if (v11 == 7 && !*(unsigned char *)(a2 + 266) && *(_WORD *)(a2 + 264) == 1)
          {
            *(unsigned char *)a2 = 2;
            ++*(unsigned char *)(a2 + 643);
            sub_225A26A94(a2);
            a3 = sub_225A26598(a2, *(unsigned char *)(a2 + 642), *(unsigned char *)(a2 + 643), *(unsigned char *)(*(void *)(a2 + 240) + *(unsigned __int16 *)(a2 + 252)));
            goto LABEL_113;
          }
LABEL_112:
          a3 = 27;
LABEL_113:
          char v17 = "phFriNfc_Tpz_H_ProWrTLV";
          goto LABEL_140;
        }
        if (*(unsigned char *)(a2 + 560))
        {
          if (*(unsigned char *)(a2 + 560) != 1) {
            goto LABEL_112;
          }
          int v19 = *(unsigned __int16 *)(a2 + 252);
          if (v19 != *(unsigned __int8 *)(a2 + 266) || *(_WORD *)(a2 + 264) != 1) {
            goto LABEL_112;
          }
        }
        else
        {
          int v19 = *(unsigned __int16 *)(a2 + 252);
          int v28 = *(unsigned __int16 *)(a2 + 78);
          if (v28 + v19 != *(unsigned __int8 *)(a2 + 266) || *(_WORD *)(a2 + 264) != 1) {
            goto LABEL_112;
          }
          LOWORD(v19) = v28 + v19;
        }
        *(_WORD *)(a2 + 78) = v19;
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrByte0ValE1");
        *(unsigned char *)a2 = 6;
        *(unsigned char *)(a2 + 646) = 6;
        a3 = sub_225A26598(a2, 1, 0, 225);
        sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrByte0ValE1");
        goto LABEL_113;
      case 8:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProCCTLV");
        switch(*(unsigned char *)(a2 + 646))
        {
          case 0:
            if (*(unsigned __int8 *)(a2 + 266) == 225)
            {
              int v12 = *(unsigned __int16 *)(a2 + 264);
              if (v12 == 1) {
                goto LABEL_90;
              }
            }
            goto LABEL_92;
          case 1:
            if (*(unsigned char *)(a2 + 266) != 16 || *(_WORD *)(a2 + 264) != 1) {
              goto LABEL_92;
            }
            LOBYTE(v12) = 2;
            goto LABEL_90;
          case 2:
            if (*(unsigned char *)(a2 + 266) != 14 || *(_WORD *)(a2 + 264) != 1) {
              goto LABEL_92;
            }
            LOBYTE(v12) = 3;
            goto LABEL_90;
          case 3:
            if (*(unsigned char *)(a2 + 266) || *(_WORD *)(a2 + 264) != 1) {
              goto LABEL_92;
            }
            LOBYTE(v12) = 4;
LABEL_90:
            *(unsigned char *)(a2 + 646) = v12;
            uint64_t v20 = sub_225A27AF8(a2);
            goto LABEL_91;
          default:
            if (*(unsigned char *)(a2 + 266) == 3 && *(_WORD *)(a2 + 264) == 1)
            {
              ++*(unsigned char *)(a2 + 643);
              sub_225A26A94(a2);
              *(unsigned char *)a2 = 6;
              *(unsigned char *)(a2 + 646) = 5;
              uint64_t v20 = sub_225A26598(a2, 1, 0, 0);
LABEL_91:
              a3 = v20;
            }
            else
            {
LABEL_92:
              a3 = 27;
            }
            char v17 = "phFriNfc_Tpz_H_ProCCTLV";
            break;
        }
        goto LABEL_140;
      case 9:
        if (*(unsigned char *)(a2 + 266) != 15 || *(_WORD *)(a2 + 264) != 1) {
          goto LABEL_60;
        }
        byte_268112F86 = 0;
        *(unsigned char *)(a2 + 266) = 1;
        a3 = sub_225A26354(a2, 14, 0);
        if (a3 != 13) {
          break;
        }
        char v14 = 10;
        goto LABEL_48;
      case 0xA:
        if (*(_WORD *)(a2 + 264) != 1) {
          break;
        }
        a3 = sub_225A26598(a2, 14, 0, 255);
        if (a3 != 13) {
          break;
        }
        char v14 = 11;
        goto LABEL_48;
      case 0xB:
        if (*(unsigned __int8 *)(a2 + 266) != 255 || *(_WORD *)(a2 + 264) != 1) {
          goto LABEL_60;
        }
        *(unsigned char *)(a2 + 266) = 1;
        a3 = sub_225A26354(a2, 14, 1);
        if (a3 != 13) {
          break;
        }
        char v14 = 12;
LABEL_48:
        *(unsigned char *)a2 = v14;
        break;
      case 0xC:
        if (*(_WORD *)(a2 + 264) != 1) {
          break;
        }
        byte_268112F86 = *(unsigned char *)(a2 + 266) | 0x7F;
        a3 = sub_225A26598(a2, 14, 1, byte_268112F86);
        char v14 = a3;
        if (a3 != 13) {
          break;
        }
        goto LABEL_48;
      case 0xD:
        if (byte_268112F86 == *(unsigned char *)(a2 + 266) && *(_WORD *)(a2 + 264) == 1)
        {
          byte_268112F86 = 0;
          break;
        }
        byte_268112F86 = 0;
LABEL_60:
        uint64_t v5 = 27;
        goto LABEL_142;
      default:
        goto LABEL_142;
    }
  }
  uint64_t v5 = a3;
  if (a3 != 13) {
LABEL_142:
  }
    sub_225A2757C(a2, v5);
  return sub_2259A10B4(0, (unsigned int *)&v32, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_Process");
}

uint64_t sub_225A2757C(uint64_t a1, uint64_t a2)
{
  int v12 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_Complete");
  *(unsigned char *)a1 = 0;
  switch(*(unsigned char *)(a1 + 547))
  {
    case 1:
      if (a2)
      {
        *(unsigned char *)(a1 + 546) = 0;
        LOBYTE(v11) = 3;
        if (((1 << a2) & 0x14400000) != 0) {
          unsigned int v4 = 152;
        }
        else {
          unsigned int v4 = a2;
        }
        if (a2 <= 0x1Cu) {
          uint64_t v5 = v4;
        }
        else {
          uint64_t v5 = a2;
        }
      }
      else
      {
        *(unsigned char *)(a1 + 546) = 1;
        LOBYTE(v11) = *(unsigned char *)(a1 + 545);
        uint64_t v5 = 0;
        if (*(unsigned char *)(*(void *)(a1 + 224) + 19) == 17)
        {
          int v6 = *(unsigned __int16 *)(a1 + 78);
          int v7 = *(unsigned __int16 *)(a1 + 640);
        }
        else
        {
          int v6 = *(unsigned __int16 *)(a1 + 922);
          int v7 = *(unsigned __int16 *)(a1 + 924);
        }
        HIDWORD(v11) = v6;
        int v12 = v7;
      }
      (*(void (**)(void, uint64_t, uint64_t *))(a1 + 8))(*(void *)(a1 + 40), v5, &v11);
      break;
    case 2:
      if (!a2)
      {
        LODWORD(v10) = **(_DWORD **)(a1 + 552);
        uint64_t v9 = *(void *)(a1 + 240);
      }
      (*(void (**)(void, uint64_t, uint64_t *))(a1 + 16))(*(void *)(a1 + 40), a2, &v9);
      break;
    case 3:
      *(unsigned char *)(a1 + 545) = 2 * (*(_WORD *)(a1 + 922) != 0);
      (*(void (**)(void, uint64_t))(a1 + 24))(*(void *)(a1 + 40), a2);
      break;
    case 6:
      (*(void (**)(void, uint64_t))(a1 + 32))(*(void *)(a1 + 40), a2);
      break;
    default:
      return sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_Complete");
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_Complete");
}

uint64_t sub_225A2771C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = 0;
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_Topaz_CB_Transceive");
  sub_2259E0420(v10, &v9);
  uint64_t v7 = v9;
  if (v9)
  {
    if (a4) {
      *(_WORD *)(v9 + 264) = *(_DWORD *)(a4 + 8);
    }
    (*(void (**)(void, uint64_t, uint64_t))(v7 + 48))(*(void *)(v7 + 2712), v7, a5);
  }
  return sub_2259A10B4(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_Topaz_CB_Transceive");
}

uint64_t sub_225A277B4(unsigned int *a1, unsigned int a2)
{
  sub_2259A0FB0(2, a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkSpcVer");
  if (a2)
  {
    unsigned int v4 = a2 & 0xF;
    if ((a2 & 0xF0) == 0x10 && v4 < 3)
    {
      uint64_t v5 = 0;
    }
    else if ((v4 <= 2 || (a2 & 0xF0) != 16) && a2 >= 0x20)
    {
      uint64_t v5 = 28;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 28;
  }
  sub_2259A10B4(2, a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkSpcVer");
  return v5;
}

uint64_t sub_225A27858(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_findNDEFTLV");
  uint64_t v2 = a1 + 661;
  int v3 = *(unsigned __int16 *)(a1 + 640);
  int v4 = 4;
  while ((unsigned __int16)v3 >= 3u)
  {
    int v5 = *(unsigned __int8 *)(v2 + v4);
    if (*(unsigned char *)(v2 + v4))
    {
      if (v5 == 254) {
        break;
      }
      if (v5 == 3)
      {
        uint64_t v8 = v2 + v4;
        *(_WORD *)(a1 + 640) = v3 - 2;
        int v9 = sub_2259DCB2C(a1, *(unsigned __int8 *)(v8 + 1));
        unsigned int v10 = *(unsigned __int8 *)(v8 + 1);
        if (*(unsigned __int16 *)(a1 + 640) >= v10 && (*(unsigned char *)(v8 + 1) || *(unsigned char *)(a1 + 540) != 2) && !v9)
        {
          uint64_t v11 = 0;
          *(_WORD *)(a1 + 78) = v10;
          *(_WORD *)(a1 + 68) = v4 & 7;
          *(unsigned char *)(a1 + 70) = (v4 >> 3) + 1;
          *(unsigned char *)(a1 + 66) = 1;
          *(unsigned char *)(a1 + 643) = (v4 & 7 | (8 * ((v4 >> 3) + 1))) - 8;
          goto LABEL_21;
        }
        break;
      }
      int v6 = v3 - 2;
      *(_WORD *)(a1 + 640) = v6;
      unsigned int v7 = *(unsigned __int8 *)(v2 + v4 + 1);
      if (v7 > (unsigned __int16)v6) {
        break;
      }
      int v3 = v6 - v7;
      *(_WORD *)(a1 + 640) = v3;
      v4 += v7 + 2;
    }
    else
    {
      *(_WORD *)(a1 + 640) = --v3;
      ++v4;
    }
    if (v4 >= 0x60u) {
      break;
    }
  }
  uint64_t v11 = 22;
  if (!*(unsigned char *)(a1 + 66))
  {
    int v12 = *(unsigned __int8 *)(a1 + 540);
    if (v12 == 2) {
      uint64_t v11 = 26;
    }
    else {
      uint64_t v11 = 22;
    }
    if ((v12 | 2) == 3)
    {
      *(_WORD *)(a1 + 68) = 4;
      *(unsigned char *)(a1 + 70) = 1;
      *(unsigned char *)(a1 + 643) = 4;
      *(_WORD *)(a1 + 640) = 90;
    }
  }
LABEL_21:
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_findNDEFTLV");
  return v11;
}

uint64_t sub_225A279EC(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkCCBytes");
  if (*(unsigned __int8 *)(a1 + 661) == 225)
  {
    unsigned int v2 = sub_225A277B4((unsigned int *)a1, *(unsigned __int8 *)(a1 + 662));
    BOOL v3 = *(unsigned __int8 *)(a1 + 663) < 0xFu && v2 == 0;
    if (v3) {
      uint64_t v4 = v2;
    }
    else {
      uint64_t v4 = 26;
    }
    if (*(unsigned __int8 *)(a1 + 663) < 0xFu && v2 == 0) {
      __int16 v5 = 92;
    }
    else {
      __int16 v5 = *(_WORD *)(a1 + 202);
    }
    *(_WORD *)(a1 + 202) = v5;
    *(_WORD *)(a1 + 640) = v5;
    int v6 = *(unsigned __int8 *)(a1 + 540);
    if (v6 == 2)
    {
      if (*(unsigned char *)(a1 + 664) == 15) {
        int v8 = v2;
      }
      else {
        int v8 = 28;
      }
      if (v3) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = 26;
      }
      if (*(unsigned char *)(a1 + 664)) {
        uint64_t v4 = v9;
      }
      else {
        uint64_t v4 = v4;
      }
    }
    else if (v6 == 3)
    {
      if (*(unsigned char *)(a1 + 664)) {
        unsigned int v7 = 28;
      }
      else {
        unsigned int v7 = v2;
      }
      if (v3) {
        uint64_t v4 = v7;
      }
      else {
        uint64_t v4 = 26;
      }
    }
  }
  else
  {
    uint64_t v4 = 22;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkCCBytes");
  return v4;
}

uint64_t sub_225A27AF8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrCCorTLV");
  unsigned int v2 = *(unsigned __int8 *)(a1 + 646);
  if (v2 >= 4)
  {
    LOBYTE(v2) = *(unsigned char *)(a1 + 68);
    char v4 = *(unsigned char *)(a1 + 70);
    LOBYTE(v3) = 3;
  }
  else
  {
    unsigned int v3 = 0xE10E1u >> (8 * v2);
    char v4 = 1;
  }
  *(unsigned char *)a1 = 8;
  uint64_t v5 = sub_225A26598(a1, v4, v2, v3);
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrCCorTLV");
  return v5;
}

uint64_t sub_225A27BA0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendDeactIdleCmd");
  if (a1)
  {
    sub_2259D9704(*(void *)(a1 + 19360));
    uint64_t v2 = sub_225A52124(*(void *)(a1 + 3040), 0, (uint64_t)sub_2259B5A70, a1);
    if (v2 == 13)
    {
      if (*(unsigned char *)(a1 + 19353) == 1)
      {
        unsigned int v3 = *(void **)(a1 + 3040);
        if (v3)
        {
          uint64_t v4 = v3[430];
          if (v4)
          {
            v3[96] = v4;
            v3[97] = v3[471];
          }
        }
        *(unsigned char *)(a1 + 19353) = 0;
      }
      uint64_t v2 = 13;
    }
  }
  else
  {
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendDeactIdleCmd");
  return v2;
}

uint64_t sub_225A27C74(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_DWORD *)(a1 + 3564) |= 0x10000u;
    if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
    {
      *(_DWORD *)(a1 + 5096) |= 0x300u;
    }
    else if ((*(unsigned char *)(a1 + 5097) & 3) == 0)
    {
      goto LABEL_8;
    }
    a2 = sub_225A52F04(*(void *)(a1 + 3040), a1 + 3560, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    a2 = 255;
  }
LABEL_8:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdConfig");
  return a2;
}

uint64_t sub_225A27D78(unsigned int *a1, uint64_t a2)
{
  if (!a1 || a2)
  {
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"phLibNfc_GetLpcdConfigProc: FAILED");
    a2 = 255;
  }
  else
  {
    sub_2259A0EAC(1, a1 + 4842, 4u, 4u, (uint64_t)"phLibNfc_GetLpcdConfigProc- SUCCESS");
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdConfigProc");
  return a2;
}

uint64_t sub_225A27E24(unsigned int *a1)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetConfigSeq");
  if (a1) {
    uint64_t v2 = sub_225A29F34((uint64_t)a1, a1 + 250);
  }
  else {
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetConfigSeq");
  return v2;
}

uint64_t sub_225A27E9C(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetConfigSeqEnd");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 2);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    int v8 = (unsigned int *)(a1 + 19368);
    if (a2)
    {
      sub_2259A0EAC(1, v8, 4u, 1u, (uint64_t)"Set Config before Start Disc Failed!");
    }
    else
    {
      sub_2259A0EAC(1, v8, 4u, 4u, (uint64_t)"Set Config before Start Disc success");
      sub_2259B5118(*(void *)(a1 + 3040), 0);
    }
  }
  else
  {
LABEL_6:
    a2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetConfigSeqEnd");
  return a2;
}

uint64_t sub_225A27F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v7 = 0;
  uint64_t v6 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetISODepToFrameRfMapping");
  if (a1)
  {
    if (*(unsigned char *)(a1 + 1092) == 1)
    {
      *(unsigned char *)(a1 + 1422) = 1;
      phOsalNfc_SetMemory();
      BYTE4(v6) = BYTE4(v6) & 0xFC | 1;
      int v7 = 1;
      LODWORD(v6) = 4;
      uint64_t v4 = sub_225A528A0(*(void *)(a1 + 3040), 1, (int *)&v6, (uint64_t)sub_2259B5A70, a1);
    }
    else
    {
      uint64_t v4 = sub_2259E4EE8(a1);
    }
    a2 = v4;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetISODepToFrameRfMapping");
  return a2;
}

uint64_t sub_225A280BC(unsigned int *a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_225A28124(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscSeq");
  if (!a1) {
    goto LABEL_6;
  }
  char v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = *((void *)&unk_26ABD79B8 + 14 * v3 + 2);
    if (v2) {
      break;
    }
    char v2 = 1;
    uint64_t v3 = 1;
  }
  while (v4 != a1);
  if (v4 != a1)
  {
LABEL_6:
    uint64_t v5 = 1;
    goto LABEL_7;
  }
  if (!sub_225A2A5E4(a1, a1 + 1000))
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    int v37 = 0;
    sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDisc");
    sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetDiscPayload");
    unsigned int v9 = *(_DWORD *)(a1 + 1000);
    if (*(_DWORD *)(a1 + 1088) == 2)
    {
      LOBYTE(v35) = v9 & 1;
      int v10 = (v9 >> 1) & 1;
      BYTE2(v35) = (v9 & 2) != 0;
      if (v9)
      {
        int v11 = *(unsigned __int8 *)(a1 + 1017);
        if ((v11 - 11) < 0xFFFFFFF6) {
          LOBYTE(v11) = 1;
        }
        BYTE1(v35) = v11;
      }
      if (v10)
      {
        int v12 = *(unsigned __int8 *)(a1 + 1019);
        if ((v12 - 11) <= 0xFFFFFFF5) {
          LOBYTE(v12) = 1;
        }
        BYTE3(v35) = v12;
      }
LABEL_88:
      sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetDiscPayload");
      uint64_t v5 = sub_225A50BE8(*(void *)(a1 + 3040), &v35, (uint64_t)sub_2259B5A70, a1);
      sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDisc");
      goto LABEL_7;
    }
    if (v9)
    {
      int v13 = *(_DWORD *)(a1 + 1000) & 1;
      LOBYTE(v35) = v9 & 1;
      int v14 = (v9 >> 1) & 1;
      BYTE2(v35) = (v9 & 2) != 0;
      int v15 = (v9 & 0xC) != 0;
      BYTE4(v35) = (v9 & 0xC) != 0;
      int v16 = (v9 >> 6) & 1;
      BYTE4(v36) = (v9 & 0x40) != 0;
      int v17 = (v9 >> 4) & 1;
      BYTE6(v36) = (v9 & 0x10) != 0;
      LOBYTE(v37) = (v9 & 0x200) != 0;
      int v18 = (v9 >> 12) & 0xFFF80;
      BYTE2(v37) = (v9 >> 12) & 0x80;
      int v19 = (v9 >> 15) & 1;
      BYTE2(v36) = (v9 & 0x8000) != 0;
      int v20 = HIWORD(v9) & 1;
      BYTE6(v35) = BYTE2(v9) & 1;
      int v21 = (v9 >> 17) & 1;
      LOBYTE(v36) = (v9 & 0x20000) != 0;
      if (((v9 >> 12) & 0x80) != 0 && (*(unsigned char *)(a1 + 1012) & 7) != 0)
      {
        sub_2259B5224(*(unsigned int **)(a1 + 3040), 1u);
        *(unsigned char *)(a1 + 1425) = 1;
        unsigned int v9 = *(_DWORD *)(a1 + 1000);
      }
      if ((v9 & 0x40000) != 0)
      {
LABEL_43:
        if ((v9 & 0x20) != 0)
        {
          LOBYTE(v18) = v18 & 0x9F;
          BYTE2(v37) = v18;
          unsigned int v25 = *(unsigned __int8 *)(a1 + 1006);
          if ((v25 & 0x70) != 0)
          {
            if ((v25 & 0x60) != 0) {
              LOBYTE(v18) = (2 * v25) & 0x20 | v18 | 0x40;
            }
            else {
              LOBYTE(v18) = (2 * v25) & 0x20 | v18;
            }
            BYTE2(v37) = v18;
          }
        }
        else
        {
          unsigned int v25 = *(unsigned __int8 *)(a1 + 1006);
          v13 |= v25 & 1;
          LOBYTE(v35) = v13;
          if (v15 | v25 & 2) {
            int v15 = 1;
          }
          else {
            int v15 = (v25 >> 2) & 1;
          }
          BYTE4(v35) = v15;
        }
        if ((~v25 & 0xF) == 0)
        {
          int v15 = 1;
          LOBYTE(v35) = 1;
          BYTE4(v35) = 1;
          LOBYTE(v18) = v18 | 0x60;
          BYTE2(v37) = v18;
          int v13 = 1;
        }
        if (*(unsigned char *)(a1 + 1007)) {
          goto LABEL_56;
        }
        char v34 = *(unsigned char *)(a1 + 1008);
        if (!v34)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SetDiscPayload:None of the Technologies are configured for P2P Target Mode");
          goto LABEL_56;
        }
        if (*(unsigned char *)(a1 + 1008))
        {
          LOBYTE(v18) = v18 | 1;
          BYTE2(v37) = v18;
          if ((v34 & 2) == 0)
          {
LABEL_92:
            if ((v34 & 4) == 0) {
              goto LABEL_93;
            }
            goto LABEL_98;
          }
        }
        else if ((*(unsigned char *)(a1 + 1008) & 2) == 0)
        {
          goto LABEL_92;
        }
        LOBYTE(v18) = v18 | 4;
        BYTE2(v37) = v18;
        if ((v34 & 4) == 0)
        {
LABEL_93:
          if ((v34 & 8) != 0) {
            goto LABEL_99;
          }
          goto LABEL_56;
        }
LABEL_98:
        LOBYTE(v18) = v18 | 8;
        BYTE2(v37) = v18;
        if ((v34 & 8) != 0) {
LABEL_99:
        }
          BYTE2(v37) = v18 | 0x10;
LABEL_56:
        if (v13)
        {
          int v26 = *(unsigned __int8 *)(a1 + 1017);
          if ((v26 - 11) < 0xFFFFFFF6) {
            LOBYTE(v26) = 1;
          }
          BYTE1(v35) = v26;
        }
        if (v14)
        {
          int v27 = *(unsigned __int8 *)(a1 + 1019);
          if ((v27 - 11) < 0xFFFFFFF6) {
            LOBYTE(v27) = 1;
          }
          BYTE3(v35) = v27;
        }
        if (v15)
        {
          int v28 = *(unsigned __int8 *)(a1 + 1021);
          if ((v28 - 11) < 0xFFFFFFF6) {
            LOBYTE(v28) = 1;
          }
          BYTE5(v35) = v28;
        }
        if (v17)
        {
          int v29 = *(unsigned __int8 *)(a1 + 1025);
          if ((v29 - 11) < 0xFFFFFFF6) {
            LOBYTE(v29) = 1;
          }
          HIBYTE(v36) = v29;
        }
        if (v16)
        {
          int v30 = *(unsigned __int8 *)(a1 + 1029);
          if ((v30 - 11) < 0xFFFFFFF6) {
            LOBYTE(v30) = 1;
          }
          BYTE5(v36) = v30;
        }
        if (v19)
        {
          int v31 = *(unsigned __int8 *)(a1 + 1043);
          if ((v31 - 11) < 0xFFFFFFF6) {
            LOBYTE(v31) = 1;
          }
          BYTE3(v36) = v31;
        }
        if (v20)
        {
          int v32 = *(unsigned __int8 *)(a1 + 1045);
          if ((v32 - 11) < 0xFFFFFFF6) {
            LOBYTE(v32) = 1;
          }
          HIBYTE(v35) = v32;
        }
        if (v21)
        {
          int v33 = *(unsigned __int8 *)(a1 + 1047);
          if ((v33 - 11) <= 0xFFFFFFF5) {
            LOBYTE(v33) = 1;
          }
          BYTE1(v36) = v33;
        }
        goto LABEL_88;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
      int v13 = 0;
      int v15 = 0;
      int v14 = 0;
      int v17 = 0;
      int v16 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
    }
    char v22 = *(unsigned char *)(a1 + 1009);
    if (v22)
    {
      LOBYTE(v18) = v18 | 1;
      BYTE2(v37) = v18;
    }
    if ((v22 & 2) != 0)
    {
      LOBYTE(v18) = v18 | 2;
      BYTE2(v37) = v18;
    }
    char v23 = v22 & 4;
    if ((v22 & 0xF) == 0) {
      char v23 = 7;
    }
    int v24 = (char)(v18 | v23);
    if ((v22 & 4) != 0 || (v22 & 0xF) == 0)
    {
      BYTE2(v37) = v24;
      LOBYTE(v18) = v24;
    }
    if ((v24 & 0x80000000) == 0)
    {
      sub_2259B5224(*(unsigned int **)(a1 + 3040), 1u);
      *(unsigned char *)(a1 + 1425) = 1;
      unsigned int v9 = *(_DWORD *)(a1 + 1000);
    }
    goto LABEL_43;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Recovery Seq: Discovery 'AddConfig' empty, passing SUCCESS to caller");
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DummyDisc");
  uint64_t v7 = phOsalNfc_Timer_Create();
  if (v7 && (uint64_t v8 = v7, v7 != 0xFFFFFFFFFFFFLL))
  {
    if (!phOsalNfc_Timer_Start())
    {
      sub_2259D730C(1, (unsigned int *)(a1 + 19368), v8, 4u, 4u, (uint64_t)"phLibNfc_DummyDisc", (uint64_t)"DummyDiscovery", 1);
      uint64_t v5 = 13;
      goto LABEL_7;
    }
    phOsalNfc_Timer_Delete();
  }
  else
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to create Timer!");
  }
  uint64_t v5 = 255;
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscSeq");
  return v5;
}

uint64_t sub_225A286B4(unsigned int *a1, uint64_t a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscSeqEnd");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = (unsigned int *)*((void *)&unk_26ABD79B8 + 14 * v5 + 2);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    uint64_t v8 = a1 + 4842;
    if (a2) {
      sub_2259A0EAC(1, v8, 4u, 1u, (uint64_t)"Discover start Failed!");
    }
    else {
      sub_2259A0EAC(1, v8, 4u, 4u, (uint64_t)"Discovery started...");
    }
  }
  else
  {
LABEL_6:
    a2 = 255;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscSeqEnd");
  return a2;
}

uint64_t sub_225A28798(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscoverSeqComplete");
  if (!a1) {
    goto LABEL_16;
  }
  if (a2 > 0x9Du)
  {
    if (a2 == 158 || a2 == 189) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if ((_BYTE)a2)
  {
    if (a2 == 81)
    {
LABEL_11:
      sub_2259B5224(*(unsigned int **)(a1 + 3040), 0);
      goto LABEL_12;
    }
LABEL_8:
    if (a2 == 143) {
      a2 = a2;
    }
    else {
      a2 = 255;
    }
    goto LABEL_11;
  }
LABEL_12:
  if (a2) {
    uint64_t v4 = 146;
  }
  else {
    uint64_t v4 = 145;
  }
  a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
LABEL_16:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscoverSeqComplete");
  return a2;
}

uint64_t sub_225A28868(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  bzero(&v8, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnDisMultiTagSeq");
  if (!a1)
  {
    uint64_t v4 = "phLibNfc_EnDisMultiTagSeq Fail : invalid context";
    int v5 = 2;
    uint64_t v6 = 0;
LABEL_6:
    sub_2259A0EAC(v5, v6, 4u, 1u, (uint64_t)v4);
    uint64_t v3 = 255;
    goto LABEL_7;
  }
  phOsalNfc_SetMemory();
  unsigned int v2 = *(unsigned __int8 *)(a1 + 1086);
  if (v2 > 1)
  {
    uint64_t v4 = "phLibNfc_EnDisMultiTagSeq Fail : invalid config";
    int v5 = 1;
    uint64_t v6 = (unsigned int *)(a1 + 19368);
    goto LABEL_6;
  }
  v10 |= 0x10000u;
  char v11 = v2;
  int v8 = *(_DWORD *)(a1 + 19368);
  v9 |= 0x10000u;
  uint64_t v3 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)&v8, (uint64_t)sub_2259B5A70, a1);
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnDisMultiTagSeq");
  return v3;
}

uint64_t sub_225A289B4(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnDisMultiTagSeqComplete");
  if (a1)
  {
    if (a2) {
      uint64_t v4 = 146;
    }
    else {
      uint64_t v4 = 145;
    }
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnDisMultiTagSeqComplete");
  return a2;
}

uint64_t sub_225A28A3C(uint64_t a1)
{
  *(void *)&v15[221] = *MEMORY[0x263EF8340];
  bzero(&v10, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigSeReaderEmvCoSeq");
  if (a1)
  {
    char v2 = 0;
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *((void *)&unk_26ABD79B8 + 14 * v3 + 2);
      if (v2) {
        break;
      }
      char v2 = 1;
      uint64_t v3 = 1;
    }
    while (v4 != a1);
    if (v4 == a1)
    {
      phOsalNfc_SetMemory();
      int v6 = v11;
      v11 |= 0x8000u;
      v12 |= 0x10u;
      int v7 = *(_DWORD *)(a1 + 1088);
      if (v7 == 1)
      {
        int v8 = &v13;
      }
      else
      {
        if (v7 != 2)
        {
LABEL_12:
          int v10 = *(_DWORD *)(a1 + 19368);
          uint64_t v5 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)&v10, (uint64_t)sub_2259B5A70, a1);
          goto LABEL_13;
        }
        char v13 = 1;
        int v11 = v6 | 0x18000;
        v14 |= 0x800u;
        int v8 = v15;
      }
      *int v8 = 0;
      goto LABEL_12;
    }
  }
  uint64_t v5 = 49;
LABEL_13:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigSeReaderEmvCoSeq");
  return v5;
}

uint64_t sub_225A28BCC(unsigned int *a1, uint64_t a2)
{
  if (!a1 || a2) {
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"Set Config enable se reader Failed!");
  }
  else {
    sub_2259A0EAC(1, a1 + 4842, 4u, 4u, (uint64_t)"Set Config enable se reader success");
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeReaderEnableEmvCoSeqEnd");
  return a2;
}

uint64_t sub_225A28C74(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v6 = 0;
  uint64_t v5 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeDepMapping");
  if (a1)
  {
    phOsalNfc_SetMemory();
    BYTE4(v5) = BYTE4(v5) & 0xFC | 1;
    int v6 = 131;
    LODWORD(v5) = 4;
    a2 = sub_225A528A0(*(void *)(a1 + 3040), 1, (int *)&v5, (uint64_t)sub_2259B5A70, a1);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeDepMapping");
  return a2;
}

uint64_t sub_225A28D7C(unsigned int *a1, uint64_t a2)
{
  if (a2) {
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"Set Config se reader Failed!");
  }
  else {
    sub_2259A0EAC(1, a1 + 4842, 4u, 4u, (uint64_t)"Set Config disable se reader success");
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeReaderDisableEmvCoSeqEnd");
  return a2;
}

uint64_t sub_225A28E20(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    sub_2259B5224(*(unsigned int **)(a1 + 3040), 0);
    a2 = sub_225A52124(*(void *)(a1 + 3040), 4, (uint64_t)sub_2259B5A70, a1);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendEMVCoTagDetection");
  return a2;
}

uint64_t sub_225A28EB4(unsigned int *a1, uint64_t a2, unsigned __int16 *a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessEmvCoTagRemDeactResp");
  uint64_t v5 = 255;
  if (a1 && a3) {
    uint64_t v5 = *a3;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessEmvCoTagRemDeactResp");
  return v5;
}

uint64_t sub_225A28F2C(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EMVCoTagRemSeqComplete");
  if (a1)
  {
    if (a2) {
      uint64_t v4 = 146;
    }
    else {
      uint64_t v4 = 145;
    }
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EMVCoTagRemSeqComplete");
  return a2;
}

uint64_t sub_225A28FB4(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReConfigSeq");
  if (!a1)
  {
    uint64_t v4 = "Invalid LibNfc context";
    uint64_t v2 = 1;
    int v5 = 2;
    uint64_t v3 = 0;
LABEL_6:
    sub_2259A0EAC(v5, v3, 4u, 1u, (uint64_t)v4);
    goto LABEL_7;
  }
  sub_2259B5118(*(void *)(a1 + 3040), *(unsigned char *)(a1 + 1425));
  uint64_t v2 = sub_225A29F34(a1, (unsigned int *)(a1 + 1000));
  uint64_t v3 = (unsigned int *)(a1 + 19368);
  if (v2 != 13)
  {
    uint64_t v4 = "Re-configure failed!";
    int v5 = 1;
    goto LABEL_6;
  }
  sub_2259A0EAC(1, v3, 4u, 4u, (uint64_t)"Re-configure success");
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReConfigSeq");
  return v2;
}

uint64_t sub_225A2908C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v12 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReDiscoveryComplete");
  if (a1)
  {
    if ((_BYTE)a2)
    {
      sub_2259B51A0(*(void *)(a1 + 3040), &v12);
      if (v12 == 1 && *(unsigned char *)(a1 + 1425) == 1)
      {
        if (*(unsigned __int8 *)(a1 + 1426) > 3u)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ReDiscoveryComplete: All retries for set config Failed");
          sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"pLibCtx->tDiscCtx.bRetryCfgCount");
          *(unsigned char *)(a1 + 1426) = 0;
          sub_2259B5118(*(void *)(a1 + 3040), 0);
        }
        else
        {
          phOsalNfc_Delay();
          sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ReDiscoveryComplete: Retry set config");
          sub_2259B5118(*(void *)(a1 + 3040), 1);
          *(void *)(a1 + 2912) = &qword_26B608F68;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          char v6 = qword_26B608F68;
          if (qword_26B608F68)
          {
            char v6 = 0;
            uint64_t v7 = off_26B608F78;
            do
            {
              ++v6;
              int v8 = *v7;
              v7 += 2;
            }
            while (v8);
          }
          *(unsigned char *)(a1 + 2905) = v6;
          a2 = sub_2259B528C(a1, 0, a3);
          if (a2 == 13) {
            ++*(unsigned char *)(a1 + 1426);
          }
        }
      }
      sub_2259B5224(*(unsigned int **)(a1 + 3040), 0);
    }
    if (!a2)
    {
      uint64_t v10 = 145;
LABEL_27:
      sub_225A136C0(a1);
      a2 = sub_225A24FAC(*(void *)(a1 + 19360), v10, a2, 0, 0);
      goto LABEL_28;
    }
    if (a2 != 13)
    {
      *(unsigned char *)(a1 + 1425) = 0;
      if (a2 == 143) {
        unsigned int v9 = a2;
      }
      else {
        unsigned int v9 = 255;
      }
      if (a2 == 189) {
        unsigned int v9 = a2;
      }
      if (a2 == 158) {
        unsigned int v9 = a2;
      }
      if (a2 == 81) {
        a2 = a2;
      }
      else {
        a2 = v9;
      }
      uint64_t v10 = 146;
      goto LABEL_27;
    }
  }
LABEL_28:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReDiscoveryComplete");
  return a2;
}

uint64_t sub_225A292B8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendDeactSleepCmd");
  if (a1)
  {
    uint64_t v2 = a1 + 1456;
    if (sub_225A57604(*(unsigned int **)(a1 + 3040), *(void *)(a1 + 1456)))
    {
      *(void *)uint64_t v2 = 0;
      *(void *)(a1 + 1464) = 0;
      int v3 = 1;
    }
    else
    {
      int v3 = 1;
      if (*(void *)v2)
      {
        if (*(_DWORD *)(*(void *)v2 + 16) == 5) {
          int v3 = 2;
        }
        else {
          int v3 = 1;
        }
      }
    }
    uint64_t v4 = sub_225A52124(*(void *)(a1 + 3040), v3, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v4 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendDeactSleepCmd");
  return v4;
}

uint64_t sub_225A29378(uint64_t a1, uint64_t a2)
{
  char v6 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDeactComplete");
  if (a1)
  {
    if (!(_BYTE)a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Lower layer has returned NFCSTATUS_SUCCESS");
      if (a2) {
        uint64_t v4 = 146;
      }
      else {
        uint64_t v4 = 145;
      }
      *(void *)(a1 + 1464) = 0;
      *(void *)(a1 + 1456) = 0;
      goto LABEL_14;
    }
    if (a2 != 81)
    {
      if (a2 != 143)
      {
        if (a2 == 121)
        {
          uint64_t v4 = 150;
        }
        else
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Buffer passed by Lower layer is NULL");
          uint64_t v4 = 146;
          a2 = 255;
        }
        goto LABEL_14;
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ProcessDeactComplete: Failed, non-heap memory access violation");
    }
    uint64_t v4 = 146;
LABEL_14:
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, (uint64_t)&v6);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDeactComplete");
  return a2;
}

uint64_t sub_225A294B0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetProtoColToRfInterFaceMapping");
  if (a1)
  {
    sub_2259B5118(*(void *)(a1 + 3040), *(unsigned char *)(a1 + 1425));
    uint64_t v2 = sub_2259E4EE8(a1);
  }
  else
  {
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetProtoColToRfInterFaceMapping");
  return v2;
}

uint64_t sub_225A29548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v15 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DiscDeactivateComplete");
  if (a1)
  {
    char v6 = (void *)(a1 + 1456);
    if (sub_225A57604(*(unsigned int **)(a1 + 3040), *(void *)(a1 + 1456)))
    {
      *char v6 = 0;
      *(void *)(a1 + 1464) = 0;
    }
    if ((_BYTE)a2)
    {
      sub_2259B51A0(*(void *)(a1 + 3040), &v15);
      if (v15 == 1 && *(unsigned char *)(a1 + 1425) == 1)
      {
        if (*(unsigned __int8 *)(a1 + 1426) > 3u)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_DiscDeactivateComplete: Retry set mapping Failed");
          sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"pLibCtx->tDiscCtx.bRetryCfgCount");
          *(unsigned char *)(a1 + 1426) = 0;
          sub_2259B5118(*(void *)(a1 + 3040), 0);
        }
        else
        {
          phOsalNfc_Delay();
          sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_DiscDeactivateComplete: Retry set mapping cmd");
          sub_2259B5118(*(void *)(a1 + 3040), 1);
          uint64_t v7 = *(uint64_t (***)())(a1 + 2912);
          if (v7 == off_26B608E98 || v7 == (uint64_t (**)())&qword_26B608E48) {
            unsigned int v9 = off_26B608E98;
          }
          else {
            unsigned int v9 = off_26B608E28;
          }
          *(void *)(a1 + 2912) = v9;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          uint64_t v10 = *v9;
          if (*v9)
          {
            LOBYTE(v10) = 0;
            int v11 = (uint64_t *)(v9 + 2);
            do
            {
              LOBYTE(v10) = (_BYTE)v10 + 1;
              uint64_t v12 = *v11;
              v11 += 2;
            }
            while (v12);
          }
          *(unsigned char *)(a1 + 2905) = (_BYTE)v10;
          a2 = sub_2259B528C(a1, 0, a3);
          if (a2 == 13)
          {
            ++*(unsigned char *)(a1 + 1426);
            goto LABEL_29;
          }
        }
      }
    }
    else
    {
      *char v6 = 0;
      *(void *)(a1 + 1464) = 0;
    }
    if (a2 == 13) {
      goto LABEL_29;
    }
    if (a2)
    {
      *(_WORD *)(a1 + 1425) = 0;
      sub_2259B5118(*(void *)(a1 + 3040), 0);
      if (a2 != 81)
      {
        if (a2 != 143)
        {
          sub_2259B5224(*(unsigned int **)(a1 + 3040), 0);
          uint64_t v13 = 146;
          a2 = 255;
          goto LABEL_28;
        }
        sub_2259B5224(*(unsigned int **)(a1 + 3040), 0);
      }
      uint64_t v13 = 146;
    }
    else
    {
      *(unsigned char *)(a1 + 1426) = 0;
      sub_2259B5118(*(void *)(a1 + 3040), 0);
      uint64_t v13 = 145;
    }
LABEL_28:
    *(_WORD *)(a1 + 1422) = 0;
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v13, a2, 0, 0);
  }
LABEL_29:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DiscDeactivateComplete");
  return a2;
}

uint64_t sub_225A297B8(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  bzero(v4, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClearExpModeSParams");
  if (a1)
  {
    if (*(unsigned char *)(a1 + 2936) == 1
      && ((*(_DWORD *)(a1 + 2980) & 0xFD) == 0xFC || *(_DWORD *)(a1 + 2980) - 1 <= 0x9E))
    {
      v4[1] = 0x10000;
      v4[384] = 64;
      char v5 = 0;
    }
    if (sub_225A2A878((unsigned int *)a1, (uint64_t)v4))
    {
      v4[0] = *(_DWORD *)(a1 + 19368);
      sub_2259B5118(*(void *)(a1 + 3040), *(unsigned char *)(a1 + 1425));
      uint64_t v2 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)v4, (uint64_t)sub_2259B5A70, a1);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClearExpModeSParams");
  return v2;
}

uint64_t sub_225A29900(uint64_t a1, uint64_t a2)
{
  if (a1) {
    a2 = sub_225A569C4(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectCmd");
  return a2;
}

uint64_t sub_225A29984(unsigned int *a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_225A299EC(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectComplete");
  if (a1)
  {
    if (a2) {
      uint64_t v4 = 146;
    }
    else {
      uint64_t v4 = 145;
    }
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectComplete");
  return a2;
}

uint64_t sub_225A29A74(unsigned int *a1, uint64_t a2, _WORD *a3)
{
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, a1 + 4842, 4u, 1u, (uint64_t)"Deactivate discovery failed!");
      goto LABEL_13;
    }
    if (!a3)
    {
LABEL_12:
      a2 = 255;
      goto LABEL_13;
    }
    a2 = (unsigned __int16)*a3;
    if ((unsigned __int16)*a3 <= 0x50u)
    {
      if (!*a3) {
        goto LABEL_13;
      }
      if (a2 == 47 || a2 == 58)
      {
        sub_2259A0EAC(1, a1 + 4842, 4u, 4u, (uint64_t)"Deactivation to discovery success");
        a2 = 0;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    if ((a2 - 81) > 0x3E || ((1 << (a2 - 81)) & 0x4000010000000001) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDeactToDiscResp");
  return a2;
}

uint64_t sub_225A29B84(uint64_t a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDiscReq");
  if (a1)
  {
    if (a2 != 1)
    {
      if (a2)
      {
        uint64_t v13 = (unsigned int *)(a1 + 19368);
        int v14 = "Invalid Request Mode ";
      }
      else
      {
        if (a3)
        {
          uint64_t v6 = off_26B608C58;
          if (*(_DWORD *)(a3 + 88) == 2) {
            uint64_t v6 = off_26B608CF8;
          }
          *(void *)(a1 + 2912) = v6;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          uint64_t v7 = *v6;
          if (*v6)
          {
            LOBYTE(v7) = 0;
            int v8 = (uint64_t *)(v6 + 2);
            do
            {
              LOBYTE(v7) = (_BYTE)v7 + 1;
              uint64_t v9 = *v8;
              v8 += 2;
            }
            while (v9);
          }
LABEL_15:
          *(unsigned char *)(a1 + 2905) = (_BYTE)v7;
          uint64_t v10 = sub_2259B528C(a1, 0, a3);
          goto LABEL_19;
        }
        uint64_t v13 = (unsigned int *)(a1 + 19368);
        int v14 = "pADDSetup is NULL ";
      }
      uint64_t v10 = 1;
      sub_2259A0EAC(1, v13, 4u, 1u, (uint64_t)v14);
      goto LABEL_19;
    }
    *(void *)(a1 + 2912) = &qword_26B608DA8;
    *(unsigned char *)(a1 + 2904) = 0;
    *(unsigned char *)(a1 + 2906) = 0;
    LOBYTE(v7) = qword_26B608DA8;
    if (qword_26B608DA8)
    {
      LOBYTE(v7) = 0;
      int v11 = off_26B608DB8;
      do
      {
        LOBYTE(v7) = (_BYTE)v7 + 1;
        uint64_t v12 = *v11;
        v11 += 2;
      }
      while (v12);
    }
    goto LABEL_15;
  }
  uint64_t v10 = 49;
LABEL_19:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDiscReq");
  return v10;
}

uint64_t sub_225A29CE0(uint64_t a1, int a2, uint64_t a3)
{
  char v22 = 0;
  uint64_t v23 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessReDiscReq");
  if (a1)
  {
    uint64_t v6 = (uint64_t *)(a1 + 1456);
    if (sub_225A57604(*(unsigned int **)(a1 + 3040), *(void *)(a1 + 1456)))
    {
      *uint64_t v6 = 0;
      *(void *)(a1 + 1464) = 0;
LABEL_4:
      uint64_t v7 = 0;
      switch(a2)
      {
        case 0:
          if (!a3) {
            goto LABEL_22;
          }
          int v8 = off_26B608EF8;
          if (*(_DWORD *)(a3 + 88) == 2) {
            int v8 = off_26B608CF8;
          }
          *(void *)(a1 + 2912) = v8;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          uint64_t v9 = *v8;
          if (*v8)
          {
            LOBYTE(v9) = 0;
            uint64_t v10 = (uint64_t *)(v8 + 2);
            do
            {
              LOBYTE(v9) = (_BYTE)v9 + 1;
              uint64_t v11 = *v10;
              v10 += 2;
            }
            while (v11);
          }
          *(unsigned char *)(a1 + 2905) = (_BYTE)v9;
          uint64_t v12 = a1;
          uint64_t v13 = a3;
          goto LABEL_31;
        case 1:
          *(void *)(a1 + 2912) = &qword_26B608DA8;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          char v14 = qword_26B608DA8;
          if (qword_26B608DA8)
          {
            char v14 = 0;
            int v17 = off_26B608DB8;
            do
            {
              ++v14;
              int v18 = *v17;
              v17 += 2;
            }
            while (v18);
          }
          goto LABEL_30;
        case 3:
          goto LABEL_18;
        case 4:
          *(void *)(a1 + 2912) = &qword_26B606AE0;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          char v14 = qword_26B606AE0;
          if (qword_26B606AE0)
          {
            char v14 = 0;
            int v19 = &qword_26B606AF0;
            do
            {
              ++v14;
              uint64_t v20 = *v19;
              v19 += 2;
            }
            while (v20);
          }
          goto LABEL_30;
        case 6:
          goto LABEL_32;
        default:
LABEL_22:
          uint64_t v7 = 1;
          goto LABEL_32;
      }
    }
    if (!*v6) {
      goto LABEL_4;
    }
    uint64_t v23 = *v6;
    if (sub_225A111DC(a1, &v22, &v23, 0)
      || !v22
      || *v22 && sub_225A23D60((unsigned int *)a1, v23))
    {
      goto LABEL_4;
    }
LABEL_18:
    *(void *)(a1 + 2912) = &qword_26B608DF8;
    *(unsigned char *)(a1 + 2904) = 0;
    *(unsigned char *)(a1 + 2906) = 0;
    char v14 = qword_26B608DF8;
    if (qword_26B608DF8)
    {
      char v14 = 0;
      char v15 = off_26B608E08;
      do
      {
        ++v14;
        int v16 = *v15;
        v15 += 2;
      }
      while (v16);
    }
LABEL_30:
    *(unsigned char *)(a1 + 2905) = v14;
    uint64_t v12 = a1;
    uint64_t v13 = 0;
LABEL_31:
    uint64_t v7 = sub_2259B528C(v12, 0, v13);
  }
  else
  {
    uint64_t v7 = 49;
  }
LABEL_32:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessReDiscReq");
  return v7;
}

uint64_t sub_225A29F34(uint64_t a1, unsigned int *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  bzero(&v30, 0x6E8uLL);
  int v29 = 0;
  long long v28 = 0u;
  memset(v27, 0, sizeof(v27));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigDiscParams");
  if (!a2)
  {
    uint64_t v6 = 1;
    goto LABEL_110;
  }
  unsigned int v4 = *a2;
  if (*a2) {
    int v5 = 1;
  }
  else {
    int v5 = *((unsigned char *)a2 + 6) & 1;
  }
  *a2 = v4 & 0xFFFFFFFE | v5;
  char v7 = 1;
  if ((v4 & 4) != 0) {
    goto LABEL_10;
  }
  if ((v4 & 8) != 0)
  {
    char v7 = 2;
LABEL_10:
    int v8 = 4;
    int v31 = 4;
    char v32 = 1;
    char v33 = v7;
    goto LABEL_11;
  }
  int v8 = 0;
LABEL_11:
  sub_2259EC2EC((uint64_t)v27, a1);
  int v9 = *(unsigned __int8 *)(a1 + 2937);
  if (v9 != 1
    && *(unsigned char *)(a1 + 2938) != 1
    && *(unsigned char *)(a1 + 2944) != 1
    && (*(unsigned char *)(a1 + 2936) != 1 || (*(_DWORD *)(a1 + 2980) & 0xFEu) < 0x32))
  {
    int v12 = 0;
    goto LABEL_29;
  }
  if (v29 != 1 && *(unsigned char *)(a1 + 2938) != 1 && *(unsigned char *)(a1 + 2944) != 1)
  {
    int v12 = 0;
    int v38 = 0;
    goto LABEL_29;
  }
  v8 |= 0x10000u;
  int v38 = 2048;
  unsigned int v10 = *a2;
  if ((*a2 & 0x800) != 0)
  {
    char v11 = 1;
LABEL_22:
    char v40 = v11;
    goto LABEL_23;
  }
  if ((v10 & 0x1000) != 0)
  {
    char v11 = 3;
    goto LABEL_22;
  }
  char v11 = 0;
  char v40 = 0;
LABEL_23:
  if (!*(unsigned char *)(a1 + 2936))
  {
    if ((v10 & 0x2000) != 0)
    {
      v11 |= 4u;
      char v40 = v11;
    }
    if ((v10 & 0x4000) != 0) {
      char v40 = v11 | 8;
    }
  }
  int v12 = 2048;
LABEL_29:
  char v36 = 1;
  unsigned int v13 = *((unsigned __int16 *)a2 + 2);
  if (v13 <= 0x12B
    && (v9 != 1 && *(unsigned char *)(a1 + 2938) != 1 && *(unsigned char *)(a1 + 2944) != 1
     || (*a2 & 0x40000) == 0
     || !*((_WORD *)a2 + 2)
     || (*a2 & 0x80000) != 0
     || (a2[20] & 1) != 0))
  {
    LOWORD(v13) = 300;
  }
  __int16 v37 = v13;
  int v14 = v8 | 0x480;
  int v31 = v8 | 0x480;
  char v34 = 2;
  BOOL v35 = *((unsigned char *)a2 + 7) == 0;
  int v15 = *(unsigned __int8 *)(a1 + 2944);
  if ((v15 == 1 || (v9 == 1 || *(unsigned char *)(a1 + 2938) == 1) && *(_DWORD *)(a1 + 3148) == 1)
    && (*((unsigned char *)a2 + 2) & 0xC) == 0
    && *((unsigned char *)a2 + 93) == 1)
  {
    int v14 = v8 | 0x10480;
    v12 |= 0x80000u;
    int v31 = v8 | 0x10480;
    int v38 = v12;
    char v41 = 1;
  }
  else
  {
    int v38 = v12;
  }
  char v39 = 0;
  if (BYTE12(v28) & 1) != 0 && (v14 |= 0x10000u, v12 |= 0x40u, int v31 = v14, v38 = v12, (a2[3]))
  {
    char v16 = 0x80;
    char v39 = 0x80;
    int v17 = 1;
  }
  else
  {
    char v16 = 0;
    int v17 = 0;
  }
  if ((BYTE12(v28) & 2) != 0)
  {
    v14 |= 0x10000u;
    v12 |= 0x40u;
    int v31 = v14;
    int v38 = v12;
    if ((a2[3] & 2) != 0)
    {
      v16 |= 0x40u;
      char v39 = v16;
      int v17 = 1;
    }
  }
  if ((BYTE12(v28) & 4) != 0)
  {
    v14 |= 0x10000u;
    v12 |= 0x40u;
    int v31 = v14;
    int v38 = v12;
    if ((a2[3] & 4) != 0)
    {
      v16 |= 0x20u;
      char v39 = v16;
      int v17 = 1;
    }
  }
  if ((BYTE12(v28) & 8) != 0)
  {
    v14 |= 0x10000u;
    v12 |= 0x40u;
    int v31 = v14;
    int v38 = v12;
    char v18 = *((unsigned char *)a2 + 12);
    if ((v18 & 8) != 0)
    {
      v16 |= 0x10u;
      char v39 = v16;
      goto LABEL_62;
    }
  }
  else
  {
    char v18 = *((unsigned char *)a2 + 12);
  }
  if (!v17)
  {
    *((unsigned char *)a2 + 12) = v18 & 0xCF;
LABEL_75:
    if (*(unsigned char *)(a1 + 2936) == 1)
    {
      char v42 = 0;
      v14 |= 0x10000u;
      v12 |= 0x80u;
      int v31 = v14;
      int v38 = v12;
      if (a2[20])
      {
        if (*a2)
        {
          if ((a2[20] & 2) != 0) {
            char v20 = -127;
          }
          else {
            char v20 = 1;
          }
          char v42 = v20;
        }
      }
    }
    goto LABEL_82;
  }
LABEL_62:
  if ((v18 & 0x10) != 0)
  {
    v16 |= 1u;
    char v39 = v16;
  }
  if ((v18 & 0x20) != 0)
  {
    char v19 = 2;
    goto LABEL_69;
  }
  if ((v18 & 0x18) != 0)
  {
LABEL_70:
    if (v15 == 1 || (v9 == 1 || *(unsigned char *)(a1 + 2938) == 1) && *(_DWORD *)(a1 + 3148) == 1)
    {
      v12 |= 0x80000u;
      int v38 = v12;
      char v41 = 0;
    }
    goto LABEL_75;
  }
  if (v9 == 1) {
    goto LABEL_67;
  }
  char v19 = 4;
  if (v15 == 1 || *(unsigned char *)(a1 + 2938) == 1) {
    goto LABEL_69;
  }
  if (*(unsigned char *)(a1 + 2936) == 1)
  {
LABEL_67:
    char v19 = 4;
LABEL_69:
    char v39 = v19 | v16;
    goto LABEL_70;
  }
LABEL_82:
  int v21 = *(unsigned __int8 *)(a1 + 2937);
  if (v21 == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
  {
    char v22 = (char *)(a1 + 5127);
    if (*(unsigned char *)(a1 + 5168))
    {
      int v31 = v14 | 0x10000;
      int v38 = v12 | 0x100;
      char v23 = *v22;
      *v22 &= ~0x80u;
      if ((a2[20] & 1) != 0 && *a2) {
        *char v22 = v23 | 0x80;
      }
      phOsalNfc_MemCopy();
      char v43 = *(unsigned char *)(a1 + 5168);
      int v21 = *(unsigned __int8 *)(a1 + 2937);
    }
    if ((v21 == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1) && *(unsigned char *)(a1 + 5219))
    {
      sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkForListnModeConfig");
      if (((*a2 & 0x40000) != 0 || (*((unsigned char *)a2 + 9) & 0xF) == 8) && !(*a2 & 0x80000 | a2[3] & 0xF))
      {
        sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkForListnModeConfig");
      }
      else
      {
        sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkForListnModeConfig");
        int v24 = (unsigned char *)(a1 + 5169);
        char v25 = *(unsigned char *)(a1 + 5169);
        v38 |= 0x200u;
        *(unsigned char *)(a1 + 5169) = v25 & 0xF6;
        if (*((unsigned char *)a2 + 84) == 1)
        {
          *int v24 = v25 & 0xF6 | 1;
          if (*((unsigned char *)a2 + 85) == 1) {
            *int v24 = v25 | 9;
          }
        }
        phOsalNfc_MemCopy();
        char v44 = *(unsigned char *)(a1 + 5219);
      }
    }
  }
  if (*(unsigned char *)(a1 + 2939) == 1
    && (*(unsigned char *)(a1 + 2943) == 1 || *(unsigned char *)(a1 + 2942) == 1 || *(unsigned char *)(a1 + 3088) == 2))
  {
    v31 |= 0x10000u;
    v38 |= 0x10000u;
    char v45 = 0;
  }
  if (sub_225A2A878((unsigned int *)a1, (uint64_t)&v30))
  {
    int v30 = *(_DWORD *)(a1 + 19368);
    uint64_t v6 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)&v30, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v6 = 255;
  }
LABEL_110:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigDiscParams");
  return v6;
}

uint64_t sub_225A2A5E4(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryType");
  if (!a2)
  {
    uint64_t v6 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid input parameters");
    goto LABEL_6;
  }
  if ((*(_DWORD *)a2 & 0xB83DF) == 0)
  {
    int v8 = *(unsigned __int8 *)(a2 + 6);
    if (*(unsigned char *)(a2 + 6) && v8 != 255 && (v8 == 15 || (v8 & 0x77777777) != 0))
    {
      unsigned int v4 = (unsigned int *)(a1 + 19368);
      int v5 = "P2P Initiator is enabled";
      goto LABEL_4;
    }
    if ((*(_DWORD *)a2 & 0x40000) != 0)
    {
      if (!*(unsigned char *)(a2 + 7))
      {
        unsigned int v4 = (unsigned int *)(a1 + 19368);
        int v5 = "P2P Target mode is enabled";
        goto LABEL_4;
      }
      int v9 = *(_DWORD *)(a2 + 88);
      if (v9 == 1 || v9 == 3)
      {
        uint64_t v6 = 1;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"SE reader mode is Disabled or EMVCO tag removal detection is enabled");
        goto LABEL_6;
      }
      if (v9 == 2)
      {
        unsigned int v4 = (unsigned int *)(a1 + 19368);
        int v5 = "SE reader mode is Enabled";
        goto LABEL_4;
      }
    }
    else if (a1 && *(unsigned char *)(a1 + 314))
    {
      unsigned int v4 = (unsigned int *)(a1 + 19368);
      int v5 = "Card emulation is enabled";
      goto LABEL_4;
    }
    uint64_t v6 = 1;
    goto LABEL_6;
  }
  unsigned int v4 = (unsigned int *)(a1 + 19368);
  int v5 = "Poll is enabled";
LABEL_4:
  sub_2259A0EAC(1, v4, 4u, 4u, (uint64_t)v5);
  uint64_t v6 = 0;
LABEL_6:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryType");
  return v6;
}

uint64_t sub_225A2A778(uint64_t a1, unsigned int *a2)
{
  sub_2259D730C(2, a2, a1, 4u, 4u, (uint64_t)"phLibNfc_DelayDiscTimerCb", (uint64_t)"Timeout:DelayDiscTimerCb", 0);
  sub_2259A0FB0(2, a2, 4u, 5u, (uint64_t)"phLibNfc_DelayDiscTimerCb");
  if (a2)
  {
    char v3 = 0;
    uint64_t v4 = 0;
    do
    {
      int v5 = (unsigned int *)*((void *)&unk_26ABD79B8 + 14 * v4 + 2);
      if (v3) {
        break;
      }
      char v3 = 1;
      uint64_t v4 = 1;
    }
    while (v5 != a2);
    if (v5 == a2)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      sub_2259B528C((uint64_t)a2, 0, 0);
    }
  }

  return sub_2259A10B4(2, a2, 4u, 5u, (uint64_t)"phLibNfc_DelayDiscTimerCb");
}

BOOL sub_225A2A878(unsigned int *a1, uint64_t a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetconfEntryCheck");
  BOOL v4 = (*(_DWORD *)(a2 + 4) & 0x1B7FF) != 0;
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetconfEntryCheck");
  return v4;
}

uint64_t sub_225A2A8F4(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendSelectCmd");
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v2 = (uint64_t *)(a1 + 1456);
  if (sub_225A57604(*(unsigned int **)(a1 + 3040), *(void *)(a1 + 1456)))
  {
    *uint64_t v2 = 0;
    *(void *)(a1 + 1464) = 0;
LABEL_4:
    uint64_t v3 = 1;
    goto LABEL_5;
  }
  uint64_t v5 = *v2;
  if (!*v2) {
    goto LABEL_4;
  }
  if (*(unsigned char *)(a1 + 1472)) {
    uint64_t v6 = (_DWORD *)(a1 + 1476);
  }
  else {
    uint64_t v6 = (_DWORD *)(v5 + 12);
  }
  uint64_t v3 = sub_225A51F64(*(void *)(a1 + 3040), v5, *v6, (uint64_t)sub_2259B5A70, a1);
  if (v3 == 13) {
    *(unsigned char *)(a1 + 19352) = 1;
  }
LABEL_5:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendSelectCmd");
  return v3;
}

uint64_t sub_225A2A9C8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendSelectCmd1");
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v2 = (uint64_t *)(a1 + 1456);
  if (sub_225A57604(*(unsigned int **)(a1 + 3040), *(void *)(a1 + 1456)))
  {
    *uint64_t v2 = 0;
    *(void *)(a1 + 1464) = 0;
LABEL_4:
    uint64_t v3 = 1;
    goto LABEL_5;
  }
  if (!*v2) {
    goto LABEL_4;
  }
  uint64_t v3 = sub_225A51F64(*(void *)(a1 + 3040), *v2, *(_DWORD *)(*v2 + 12), (uint64_t)sub_2259B5A70, a1);
  if (v3 == 13) {
    *(unsigned char *)(a1 + 19352) = 1;
  }
LABEL_5:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendSelectCmd1");
  return v3;
}

uint64_t sub_225A2AA88(uint64_t a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SelectCmdResp");
  if (!a1 || a2)
  {
    uint64_t v6 = "Discovery select command failed!";
    int v7 = 2;
    int v8 = (unsigned int *)a1;
LABEL_7:
    sub_2259A0EAC(v7, v8, 4u, 1u, (uint64_t)v6);
    a3 = 255;
    goto LABEL_8;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Discovery select command success");
  if (a3)
  {
    if (*(void *)(a1 + 1456) == a3)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Valid remoteDev Handle!!");
      a3 = 0;
      goto LABEL_8;
    }
    uint64_t v6 = "Invalid remoteDev Handle!!";
    int v7 = 1;
    int v8 = (unsigned int *)(a1 + 19368);
    goto LABEL_7;
  }
LABEL_8:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SelectCmdResp");
  return a3;
}

uint64_t sub_225A2AB88(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReqInfoComplete");
  if (a1)
  {
    if (a2 != 10 && a2)
    {
      uint64_t v4 = 235;
      uint64_t v5 = 255;
    }
    else
    {
      uint64_t v4 = *(unsigned int *)(a1 + 816);
      uint64_t v5 = a2;
    }
    sub_225A2AC2C(a1, v4, *(void *)(a1 + 808), a2);
  }
  else
  {
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReqInfoComplete");
  return v5;
}

uint64_t sub_225A2AC2C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDevInfo");
  if (a4 > 0x37 || ((1 << a4) & 0x80010000000001) == 0)
  {
    if (a3
      && a4 == 10
      && *(_DWORD *)a3 == 1
      && (uint64_t v10 = *(void *)(a3 + 8)) != 0
      && *(_DWORD *)(v10 + 4) == 19
      && (uint64_t v11 = *(unsigned int *)(a1 + 816), v12 = sub_225A56F2C(*(void *)(a1 + 3040)), (v12 & 0xFFFE) == 0xBA))
    {
      sub_225A24FAC(*(void *)(a1 + 19360), v11, v12, a3, 0);
    }
    else
    {
      sub_225A2AED4(a1);
    }
    goto LABEL_31;
  }
  int v8 = sub_225A24FAC(*(void *)(a1 + 19360), a2, 0, a3, 0);
  if (a4 == 55 || a4 == 40)
  {
    int v9 = (unsigned int *)(a1 + 19368);
    switch(v8)
    {
      case 0:
        sub_22599F8E0(1, v9, 4u, 4u, (uint64_t)"State machine has returned NFCSTATUS_SUCCESS ");
        if (*(unsigned char *)(a1 + 716) == 16) {
          goto LABEL_24;
        }
LABEL_30:
        *(unsigned char *)(a1 + 716) = 16;
        goto LABEL_31;
      case 119:
        a4 = 119;
        sub_22599F8E0(1, v9, 4u, 4u, (uint64_t)"State machine has returned NFCSTATUS_UNKNOWN_TAG_PROTOCOL ");
        break;
      case 111:
        a4 = 111;
        sub_22599F8E0(1, v9, 4u, 2u, (uint64_t)"State machine has returned NFCSTATUS_BUSY ");
        break;
      default:
        a4 = 255;
        sub_22599F8E0(1, v9, 4u, 1u, (uint64_t)"State machine has returned NFCSTATUS_FAILED ");
        break;
    }
  }
  if (*(unsigned char *)(a1 + 716) != 16) {
    goto LABEL_30;
  }
  if (a4) {
    sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ProcessDevInfo: status returned is other than success wStatus");
  }
LABEL_24:
  if (!*(unsigned char *)(a1 + 714)) {
    goto LABEL_31;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Invoking upper layer callback function ");
  unsigned int v13 = *(_DWORD **)(a3 + 8);
  int v14 = v13[3];
  if (v14 == 1)
  {
    if (v13[4] == 3 && v13[5] == 130) {
      goto LABEL_36;
    }
  }
  else if (v14 == 2 && v13[4] == 4 && (v13[5] & 0xFFFFFFFE) == 0x80)
  {
LABEL_36:
    *(unsigned char *)(a1 + 486) = 1;
  }
LABEL_31:

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDevInfo");
}

uint64_t sub_225A2AED4(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RestartDiscovery");
  *(_DWORD *)(a1 + 984) = 0;
  sub_225A24FAC(*(void *)(a1 + 19360), 136, 0, a1 + 984, a1 + 1000);

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RestartDiscovery");
}

uint64_t sub_225A2AF54(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_InvokeDiscDisconnCb");
  unsigned int v4 = *(_DWORD *)(a1 + 984);
  if (v4 > 6 || ((1 << v4) & 0x43) == 0)
  {
    int v8 = 0;
    int v7 = (void *)(a1 + 6216);
    uint64_t v6 = *(void (**)(void, uint64_t, void, uint64_t))(a1 + 6216);
    uint64_t v9 = 6224;
  }
  else
  {
    uint64_t v6 = 0;
    int v7 = (void *)(a1 + 6248);
    int v8 = *(void (**)(void, uint64_t, uint64_t))(a1 + 6248);
    uint64_t v9 = 6256;
  }
  uint64_t v10 = *(void *)(a1 + v9);
  *int v7 = 0;
  v7[1] = 0;
  if (v4 > 6 || ((1 << v4) & 0x43) == 0)
  {
    uint64_t v12 = (unsigned int *)(a1 + 19368);
    if (v6)
    {
      sub_2259D6F6C(1, v12, 4u, 130, (uint64_t)"phLibNfc_InvokeDiscDisconnCb", (uint64_t)"phLibNfc_InvokeDiscDisconnCb", 0);
      v6(*(void *)(a1 + 19360), v10, 0, a2);
      goto LABEL_16;
    }
    uint64_t v11 = "InvokeDiscDisconnCb: Upper layer call back function (pDisconnNtfCb) not found";
LABEL_15:
    sub_2259A0EAC(1, v12, 4u, 4u, (uint64_t)v11);
    goto LABEL_16;
  }
  if (!v8)
  {
    uint64_t v11 = "InvokeDiscDisconnCb: Upper layer call back function (pDiscNtfCb) not found";
    uint64_t v12 = (unsigned int *)(a1 + 19368);
    goto LABEL_15;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"InvokeDiscDisconnCb: Invoking upper layer call back function");
  sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 114, (uint64_t)"phLibNfc_InvokeDiscDisconnCb", (uint64_t)"phLibNfc_InvokeDiscDisconnCb", 0);
  v8(*(void *)(a1 + 19360), v10, a2);
LABEL_16:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_InvokeDiscDisconnCb");
  return a2;
}

uint64_t sub_225A2B108(uint64_t a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RequestMoreInfo");
  uint64_t v6 = *(void *)(a1 + 808);
  if ((a3 == 55 || a3 == 40) && *(_DWORD *)v6 == 1)
  {
    uint64_t v7 = *(void *)(v6 + 8);
    if (v7)
    {
      if (*(_DWORD *)(v7 + 16) == 1 && !*(unsigned char *)(v7 + 46))
      {
        if ((sub_225A25ADC(*(void *)(a1 + 19360)) == 136
           || sub_225A25ADC(*(void *)(a1 + 19360)) == 137)
          && sub_225A25A0C(*(void *)(a1 + 19360)) == 1)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_RequestMoreInfo : RID Sequence Dropped due to ongoing Discovery Sequence");
          a3 = 13;
        }
        else
        {
          *(void *)(a1 + 2912) = &qword_26B608B38;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          char v8 = qword_26B608B38;
          if (qword_26B608B38)
          {
            char v8 = 0;
            uint64_t v9 = off_26B608B48;
            do
            {
              ++v8;
              uint64_t v10 = *v9;
              v9 += 2;
            }
            while (v10);
          }
          *(unsigned char *)(a1 + 2905) = v8;
          *(_DWORD *)(a1 + 816) = a2;
          *(unsigned char *)(a1 + 1481) = 0;
          a3 = sub_2259B528C(a1, 0, 0);
        }
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RequestMoreInfo");
  return a3;
}

uint64_t sub_225A2B258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseDiscActivatedRemDevInfo");
  if (a1 && a3)
  {
    unsigned int v6 = *(_DWORD *)(a3 + 20);
    switch(v6)
    {
      case 0u:
      case 3u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
LABEL_4:
        int v7 = *(_DWORD *)(a3 + 16);
        switch(v7)
        {
          case 1:
            *(_DWORD *)(a2 + 4) = 22;
            sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevAJewel");
            uint64_t v16 = *(void *)(a3 + 43);
            if (BYTE3(v16) > 0xAu)
            {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received UID length exceeded max UID length");
            }
            else
            {
              *(unsigned char *)(a2 + 18) = BYTE3(v16);
              phOsalNfc_MemCopy();
            }
            *(unsigned char *)(a2 + 19) = *(unsigned char *)(a3 + 49);
            *(unsigned char *)(a2 + 20) = *(unsigned char *)(a3 + 50);
            sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevAJewel");
            if (BYTE3(v16) >= 0xBu) {
              goto LABEL_56;
            }
            goto LABEL_59;
          case 2:
            goto LABEL_15;
          case 3:
            goto LABEL_56;
          case 4:
            int v10 = *(_DWORD *)(a3 + 4);
            unsigned int v11 = v10 & 0xFFFFFFFC;
            int v12 = v10 + 8;
            if (v11 != 4) {
              int v12 = 11;
            }
            *(_DWORD *)(a2 + 4) = v12;
            if (*(_DWORD *)(a3 + 12) == 1 && *(unsigned char *)(a1 + 1422) == 1) {
              *(unsigned char *)(a1 + 1423) = 1;
            }
            goto LABEL_42;
          case 5:
            *(_DWORD *)(a2 + 4) = 26;
            if (!sub_225A19AC4((unsigned int *)a1, a2 + 8, a3 + 36, v6)) {
              goto LABEL_59;
            }
            goto LABEL_56;
          default:
            if (v7 == 138)
            {
              *(_DWORD *)(a2 + 4) = 25;
              sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevKovio");
              long long v15 = *(_OWORD *)(a3 + 36);
              *(unsigned char *)(a2 + 8) = v15;
              if (v15 == 16) {
                phOsalNfc_MemCopy();
              }
              else {
                sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid TagID: TagID < 16 Bytes");
              }
              sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevKovio");
              goto LABEL_59;
            }
            if (v7 != 128) {
              goto LABEL_56;
            }
LABEL_15:
            if (*(_DWORD *)(a3 + 4) == 4) {
              int v9 = 12;
            }
            else {
              int v9 = 16;
            }
            *(_DWORD *)(a2 + 4) = v9;
LABEL_42:
            if (!sub_225A2B77C(a1, a2, a3)) {
              goto LABEL_59;
            }
            goto LABEL_56;
        }
      case 1u:
        if (*(_DWORD *)(a3 + 4) == 25)
        {
          *(_DWORD *)(a2 + 4) = 18;
          if (*(_DWORD *)(a3 + 12) == 1 && *(unsigned char *)(a1 + 1422) == 1) {
            *(unsigned char *)(a1 + 1423) = 1;
          }
        }
        else if (*(_DWORD *)(a3 + 16) == 4)
        {
          int v13 = *(_DWORD *)(a3 + 12);
          if (v13 == 131 || v13 == 2) {
            *(_DWORD *)(a2 + 4) = 19;
          }
        }
LABEL_52:
        if (!sub_225A2BA48((unsigned int *)a1, (unsigned char *)(a2 + 8), a3)) {
          goto LABEL_59;
        }
        goto LABEL_56;
      case 2u:
      case 5u:
        if (*(_DWORD *)(a3 + 16) == 3)
        {
          *(_DWORD *)(a2 + 4) = 21;
LABEL_23:
          if (!sub_225A2BC0C((unsigned int *)a1, a2 + 8)) {
            goto LABEL_59;
          }
        }
        goto LABEL_56;
      case 4u:
      case 7u:
      case 8u:
      case 9u:
LABEL_26:
        uint64_t v8 = 0;
        *(_DWORD *)(a2 + 4) = 28;
        break;
      case 6u:
        if (*(_DWORD *)(a3 + 16) != 6
          || (*(_DWORD *)(a2 + 4) = 23, sub_2259B2224((unsigned int *)a1, a2 + 8, a3 + 36)))
        {
LABEL_56:
          *(_DWORD *)(a2 + 4) = 28;
          uint64_t v8 = 255;
        }
        else
        {
LABEL_59:
          uint64_t v8 = 0;
        }
        break;
      default:
        switch(v6)
        {
          case 0x80u:
          case 0x83u:
            if (*(_DWORD *)(a3 + 16) == 4)
            {
              *(_DWORD *)(a2 + 4) = 1;
              if (sub_2259E22BC(a1) == 13
                && !sub_2259E2344((unsigned int *)a1, (unsigned char *)(a2 + 8), (unsigned __int8 *)a3))
              {
                goto LABEL_59;
              }
            }
            goto LABEL_56;
          case 0x81u:
            if (*(_DWORD *)(a3 + 16) != 4) {
              goto LABEL_56;
            }
            *(_DWORD *)(a2 + 4) = 2;
            if (sub_2259E22BC(a1) != 13) {
              goto LABEL_56;
            }
            goto LABEL_52;
          case 0x82u:
          case 0x85u:
            if (*(_DWORD *)(a3 + 16) == 3)
            {
              *(_DWORD *)(a2 + 4) = 4;
              if (sub_2259E22BC(a1) == 13) {
                goto LABEL_23;
              }
            }
            goto LABEL_56;
          case 0x84u:
            goto LABEL_26;
          default:
            if (v6 != 112) {
              goto LABEL_26;
            }
            goto LABEL_4;
        }
    }
  }
  else
  {
    uint64_t v8 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid Input info!");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseDiscActivatedRemDevInfo");
  return v8;
}

uint64_t sub_225A2B77C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  memset(v18, 0, 26);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  unsigned int v13 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevA");
  if (!a2)
  {
    uint64_t v6 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid input parameter!");
    goto LABEL_20;
  }
  if (sub_225A2BD2C((unsigned int *)a1, *(unsigned __int8 *)(a3 + 32), &v13))
  {
    uint64_t v6 = 255;
    goto LABEL_20;
  }
  *(unsigned char *)(a2 + 71) = v13;
  long long v7 = *(_OWORD *)(a3 + 100);
  long long v8 = *(_OWORD *)(a3 + 68);
  long long v17 = *(_OWORD *)(a3 + 84);
  v18[0] = v7;
  *(_OWORD *)((char *)v18 + 10) = *(_OWORD *)(a3 + 110);
  long long v9 = *(_OWORD *)(a3 + 52);
  long long v14 = *(_OWORD *)(a3 + 36);
  long long v15 = v9;
  long long v16 = v8;
  if (BYTE3(v7)) {
    *(unsigned char *)(a2 + 68) = BYTE12(v17);
  }
  unsigned int v10 = BYTE10(v14);
  *(unsigned char *)(a2 + 18) = BYTE10(v14);
  if (!v10) {
    goto LABEL_10;
  }
  if (v10 <= 0xA)
  {
    phOsalNfc_MemCopy();
LABEL_10:
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received UID length exceeded max UID length");
  uint64_t v6 = 255;
LABEL_12:
  if (BYTE4(v18[0]) - 2 <= 0x32)
  {
    unsigned int v11 = BYTE9(v18[1]);
    *(unsigned char *)(a2 + 67) = BYTE9(v18[1]);
    if (v11)
    {
      if (v11 > 0x30)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received AppData length exceeded max ATR length");
        uint64_t v6 = 255;
      }
      else
      {
        phOsalNfc_MemCopy();
      }
    }
  }
  *(unsigned char *)(a2 + 72) = v18[0];
  *(_WORD *)(a2 + 69) = *(_WORD *)((char *)v18 + 1);
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Check for MergeSak");
  if ((BYTE12(v17) & 0xF7) == 0x60)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"MergeSak detected, update remote device detected to P2P Target");
    *(_DWORD *)(a2 + 4) = 26;
    *(unsigned char *)(a2 + 67) = 0;
    *(_WORD *)(a2 + 72) = 0;
    *(unsigned char *)(a2 + 18) = 0;
    *(unsigned char *)(a2 + 71) = ((*(_DWORD *)(a3 + 20) - 3) & 0xFFFFFF7D) == 0;
    *(_DWORD *)(a2 + 76) = 0;
    *(unsigned char *)(a2 + 68) = 64;
    *(void *)(a3 + 12) = 0x500000003;
    *(_DWORD *)(a3 + 4) = 23;
    *(unsigned char *)(a1 + 1442) = 1;
  }
  else
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"MergeSak not found");
  }
LABEL_20:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevA");
  return v6;
}

uint64_t sub_225A2BA48(unsigned int *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  memset(v18, 0, 30);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v12 = 0;
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevB");
  if (a2)
  {
    if (sub_225A2BD2C(a1, *(unsigned __int8 *)(a3 + 32), &v12))
    {
      uint64_t v6 = 255;
    }
    else
    {
      a2[63] = v12;
      long long v7 = *(_OWORD *)(a3 + 84);
      long long v8 = *(_OWORD *)(a3 + 116);
      long long v17 = *(_OWORD *)(a3 + 100);
      v18[0] = v8;
      *(_OWORD *)((char *)v18 + 14) = *(_OWORD *)(a3 + 130);
      long long v9 = *(_OWORD *)(a3 + 52);
      long long v13 = *(_OWORD *)(a3 + 36);
      long long v14 = v9;
      long long v15 = *(_OWORD *)(a3 + 68);
      long long v16 = v7;
      a2[62] = BYTE12(v7);
      phOsalNfc_MemCopy();
      phOsalNfc_MemCopy();
      phOsalNfc_MemCopy();
      char v10 = BYTE14(v16);
      if (BYTE14(v16) == 12) {
        a2[11] = (BYTE10(v17) >> 4) | (16 * BYTE10(v17));
      }
      a2[12] = v10;
      a2[61] = BYTE11(v16);
      phOsalNfc_MemCopy();
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 1;
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"Invalid input parameter!");
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevB");
  return v6;
}

uint64_t sub_225A2BC0C(unsigned int *a1, uint64_t a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevFelica");
  if (a2)
  {
    *(unsigned char *)(a2 + 10) = 8;
    phOsalNfc_MemCopy();
    phOsalNfc_MemCopy();
    phOsalNfc_MemCopy();
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 255;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevFelica");
  return v4;
}

uint64_t sub_225A2BD2C(unsigned int *a1, unsigned int a2, unsigned int *a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapBitRate");
  if (a3)
  {
    uint64_t v6 = 0;
    if (a2 <= 5) {
      *a3 = a2;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapBitRate");
  return v6;
}

uint64_t sub_225A2BDBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyResponse");
  if (a1)
  {
    uint64_t v6 = 1;
    if (a2 && a3)
    {
      if ((*(_DWORD *)(a3 + 4) & 0xFFFFFFFE) == 0x12)
      {
        if (*(_DWORD *)(a2 + 8)) {
          uint64_t v6 = 0;
        }
        else {
          uint64_t v6 = 44;
        }
      }
      else if ((*(unsigned __int8 *)(a1 + 1481) | 2) == 0xA2)
      {
        long long v7 = *(unsigned char **)a2;
        if (*(void *)a2 && *v7 == 10 && *(_DWORD *)(a2 + 8) == 1)
        {
          uint64_t v6 = 0;
          *(_DWORD *)(a2 + 8) = 0;
          *long long v7 = 0;
        }
        else
        {
          uint64_t v6 = 255;
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
    *(unsigned char *)(a1 + 1481) = -1;
  }
  else
  {
    uint64_t v6 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyResponse");
  return v6;
}

uint64_t sub_225A2BEB8(uint64_t a1, uint64_t a2, char *a3)
{
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Lower layer has returned Null LibNfc context");
    goto LABEL_11;
  }
  *(unsigned char *)(a1 + 1472) = 0;
  if (!a3
    || a2 - 81 <= 0x3E
    && ((1 << (a2 - 81)) & 0x4000010000000001) != 0)
  {
    if (a2) {
      goto LABEL_6;
    }
LABEL_10:
    *(unsigned char *)(a1 + 1483) = 0;
    goto LABEL_11;
  }
  if ((_BYTE)a2)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Buffer passed by Lower layer is NULL");
    a2 = 255;
    goto LABEL_6;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Lower layer has returned NFCSTATUS_SUCCESS");
  if (!a2) {
    goto LABEL_10;
  }
LABEL_6:
  *(unsigned char *)(a1 + 1483) = 1;
LABEL_11:
  sub_225A11DF8(a1, a2, a3);
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateComplete");
  return a2;
}

uint64_t sub_225A2BFF0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StateDiscoveredEntry");
  if (!a1) {
    goto LABEL_22;
  }
  if (!*(unsigned char *)(a1 + 714))
  {
    unsigned __int16 v6 = 0;
    *(unsigned char *)(a1 + 714) = 0;
    goto LABEL_25;
  }
  uint64_t v2 = *(unsigned int **)(a1 + 808);
  *(unsigned char *)(a1 + 717) = 3;
  if (*(void *)(a1 + 1352))
  {
    phOsalNfc_FreeMemory();
    *(void *)(a1 + 1456) = 0;
    *(unsigned char *)(a1 + 717) = 3;
  }
  uint64_t Memory = phOsalNfc_GetMemory();
  *(void *)(a1 + 1352) = Memory;
  if (!Memory)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory, Insufficient Resources");
    unsigned __int16 v6 = 12;
    goto LABEL_25;
  }
  phOsalNfc_SetMemory();
  if (v2 && (unsigned int v4 = *(unsigned __int8 *)(a1 + 714), *(unsigned char *)(a1 + 714)))
  {
    unint64_t v5 = 0;
    unsigned __int16 v6 = 0;
    unsigned __int8 v7 = 0;
    do
    {
      unsigned int v8 = *v2;
      if (*v2)
      {
        unsigned __int8 v9 = 0;
        uint64_t v10 = *(void *)(a1 + 8 * v5 + 728);
        while (1)
        {
          unsigned int v11 = &v2[2 * v9];
          uint64_t v13 = *((void *)v11 + 1);
          unsigned int v12 = (uint64_t *)(v11 + 2);
          if (v10 == v13) {
            break;
          }
          if (v8 <= ++v9) {
            goto LABEL_20;
          }
        }
        if (v8 == 1) {
          *(void *)(a1 + 1464) = v10;
        }
        uint64_t v14 = *(void *)(a1 + 1352) + 80 * v7;
        uint64_t v15 = a1 + 16 * v7;
        *(int64x2_t *)(v15 + 824) = vdupq_n_s64(v14);
        *(void *)(v15 + 1192) = v14;
        *(void *)(v15 + 1200) = *v12;
        *(unsigned char *)(a1 + 1442) = 0;
        if (sub_225A2B258(a1, v14, *v12))
        {
          unsigned __int16 v6 = 255;
        }
        else
        {
          ++v7;
          unsigned __int16 v6 = 0;
        }
        unsigned int v4 = *(unsigned __int8 *)(a1 + 714);
      }
LABEL_20:
      ++v5;
    }
    while (v5 < v4);
  }
  else
  {
LABEL_22:
    unsigned __int16 v6 = 0;
  }
LABEL_25:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StateDiscoveredEntry");
  return v6;
}

uint64_t sub_225A2C1C0(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t result = 1;
  if (a1 && a2 && a3)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 20);
    if (v5 <= 0xC && ((1 << v5) & 0x1C6F) != 0) {
      goto LABEL_8;
    }
    unsigned int v7 = v5 - 112;
    if (v7 <= 0x15)
    {
      int v8 = 1 << v7;
      if ((v8 & 0x2F0000) != 0)
      {
        *a2 = 0;
        if (*(_DWORD *)(a1 + 12) == 3)
        {
          uint64_t result = 0;
          *a3 = 0;
        }
        else
        {
          uint64_t result = 0;
          *a3 = 1;
        }
      }
      else if ((v8 & 5) != 0)
      {
LABEL_8:
        *a2 = 1;
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_225A2C260(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
  if (!a1) {
    goto LABEL_21;
  }
  if (!*(void *)(a1 + 6136)) {
    goto LABEL_88;
  }
  if (*(void *)(a1 + 6152))
  {
    uint64_t v2 = *(void *)(a1 + 6160);
    sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 15, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
    uint64_t v3 = *(void (**)(uint64_t, uint64_t, void, void, uint64_t))(a1 + 6152);
LABEL_5:
    uint64_t v4 = *(void *)(a1 + 19360);
    uint64_t v5 = v2;
LABEL_6:
    v3(v4, v5, 0, 0, 145);
    goto LABEL_21;
  }
  if (*(void *)(a1 + 6216))
  {
    uint64_t v6 = *(void *)(a1 + 6224);
    sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 130, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
    unsigned int v7 = *(void (**)(void, uint64_t, void, uint64_t))(a1 + 6216);
LABEL_10:
    v7(*(void *)(a1 + 19360), v6, 0, 145);
    goto LABEL_21;
  }
  if (!*(void *)(a1 + 6248))
  {
    if (*(void *)(a1 + 6424))
    {
      uint64_t v8 = *(void *)(a1 + 6432);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 22, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6424);
      goto LABEL_18;
    }
    if (*(void *)(a1 + 6440))
    {
      uint64_t v8 = *(void *)(a1 + 6448);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 37, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6440);
      goto LABEL_18;
    }
    if (*(void *)(a1 + 6184))
    {
      uint64_t v2 = *(void *)(a1 + 6192);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 17, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      uint64_t v3 = *(void (**)(uint64_t, uint64_t, void, void, uint64_t))(a1 + 6184);
      goto LABEL_5;
    }
    if (*(void *)(a1 + 6168))
    {
      uint64_t v2 = *(void *)(a1 + 6176);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 16, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      uint64_t v3 = *(void (**)(uint64_t, uint64_t, void, void, uint64_t))(a1 + 6168);
      goto LABEL_5;
    }
    if (*(void *)(a1 + 6680))
    {
      uint64_t v14 = *(void *)(a1 + 6688);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 134, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, uint64_t, void, uint64_t, uint64_t))(a1 + 6680))(*(void *)(a1 + 19360), v14, **(void **)(a1 + 512), 127, 145);
      goto LABEL_21;
    }
    if (*(void *)(a1 + 6536))
    {
      uint64_t v15 = (void *)(a1 + 6536);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 126, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, void, uint64_t))(a1 + 6536))(*(void *)(a1 + 19360), *(void *)(a1 + 6544), 0, 145);
LABEL_40:
      uint64_t v13 = 0;
      *uint64_t v15 = 0;
      v15[1] = 0;
      goto LABEL_89;
    }
    if (*(void *)(a1 + 6584))
    {
      uint64_t v15 = (void *)(a1 + 6584);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 46, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, uint64_t))(a1 + 6584))(*(void *)(a1 + 19360), *(void *)(a1 + 6592), 145);
      goto LABEL_40;
    }
    if (*(void *)(a1 + 6104))
    {
      uint64_t v15 = (void *)(a1 + 6104);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 42, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, uint64_t))(a1 + 6104))(*(void *)(a1 + 19360), *(void *)(a1 + 6112), 145);
      goto LABEL_40;
    }
    if (*(void *)(a1 + 6600))
    {
      uint64_t v15 = (void *)(a1 + 6600);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 48, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, uint64_t))(a1 + 6600))(*(void *)(a1 + 19360), *(void *)(a1 + 6608), 145);
      goto LABEL_40;
    }
    if (*(void *)(a1 + 6616))
    {
      uint64_t v15 = (void *)(a1 + 6616);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 49, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, uint64_t))(a1 + 6616))(*(void *)(a1 + 19360), *(void *)(a1 + 6624), 145);
      goto LABEL_40;
    }
    if (*(void *)(a1 + 6552))
    {
      uint64_t v15 = (void *)(a1 + 6552);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 4, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, uint64_t))(a1 + 6552))(*(void *)(a1 + 19360), *(void *)(a1 + 6560), 145);
      goto LABEL_40;
    }
    if (*(void *)(a1 + 6296))
    {
      uint64_t v15 = (void *)(a1 + 6296);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 124, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, void, void, uint64_t, uint64_t))(a1 + 6296))(*(void *)(a1 + 19360), *(void *)(a1 + 6304), 0, 0, 255, 145);
      goto LABEL_40;
    }
    if (*(void *)(a1 + 6312))
    {
      uint64_t v15 = (void *)(a1 + 6312);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 125, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, void, void, uint64_t))(a1 + 6312))(*(void *)(a1 + 19360), *(void *)(a1 + 6320), 0, 0, 145);
      goto LABEL_40;
    }
    if (*(void *)(a1 + 6344))
    {
      uint64_t v15 = (void *)(a1 + 6344);
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"CntDiscntDisvrychkprsn_Cb :EvtWtxCb");
      (*(void (**)(void, void, void, void, uint64_t))(a1 + 6344))(*(void *)(a1 + 19360), *(void *)(a1 + 6352), 0, 0, 145);
      goto LABEL_40;
    }
    if (*(void *)(a1 + 6456))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 40, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, uint64_t))(a1 + 6456))(*(void *)(a1 + 19360), *(void *)(a1 + 6464), 145);
      uint64_t v13 = 0;
      *(void *)(a1 + 6344) = 0;
      *(void *)(a1 + 6464) = 0;
      goto LABEL_89;
    }
    if (*(void *)(a1 + 6040))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 47, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, void, uint64_t))(a1 + 6040))(*(void *)(a1 + 19360), *(void *)(a1 + 6048), 0, 145);
      goto LABEL_21;
    }
    if (*(void *)(a1 + 6088))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 43, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6088);
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6096);
      goto LABEL_19;
    }
    unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6120);
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6128);
      goto LABEL_19;
    }
    if (*(void *)(a1 + 6264))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 23, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, void, void, uint64_t))(a1 + 6264))(*(void *)(a1 + 19360), *(void *)(a1 + 6272), 0, 0, 145);
      goto LABEL_21;
    }
    if (*(void *)(a1 + 6280))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 17, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, void, void, uint64_t))(a1 + 6280))(*(void *)(a1 + 19360), *(void *)(a1 + 6192), 0, 0, 145);
      goto LABEL_21;
    }
    uint64_t v3 = *(void (**)(uint64_t, uint64_t, void, void, uint64_t))(a1 + 6328);
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 19360);
      uint64_t v5 = *(void *)(a1 + 6336);
      goto LABEL_6;
    }
    if (*(void *)(a1 + 6360))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 24, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6360);
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6368);
      goto LABEL_19;
    }
    if (*(void *)(a1 + 6376))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 25, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6376);
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6384);
      goto LABEL_19;
    }
    if (*(void *)(a1 + 6392))
    {
      *(unsigned char *)(a1 + 19372) = 0;
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 27, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6392);
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6400);
      goto LABEL_19;
    }
    if (*(void *)(a1 + 6472))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 7, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      (*(void (**)(void, void, uint64_t, void))(a1 + 6472))(*(void *)(a1 + 19360), *(void *)(a1 + 6480), 145, 0);
      goto LABEL_21;
    }
    unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6488);
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6496);
      goto LABEL_19;
    }
    unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6504);
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6512);
      uint64_t v12 = 2;
      goto LABEL_20;
    }
    unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6520);
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6528);
      goto LABEL_19;
    }
    if (*(void *)(a1 + 6632))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 5, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6632);
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6640);
      goto LABEL_19;
    }
    if (*(void *)(a1 + 6648))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 50, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6648);
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6656);
      goto LABEL_19;
    }
    if (*(void *)(a1 + 6664))
    {
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 51, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6664);
      uint64_t v10 = *(void *)(a1 + 19360);
      uint64_t v11 = *(void *)(a1 + 6672);
      goto LABEL_19;
    }
    if (*(void *)(a1 + 6776))
    {
      uint64_t v6 = *(void *)(a1 + 6784);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 131, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned int v7 = *(void (**)(void, uint64_t, void, uint64_t))(a1 + 6776);
      goto LABEL_10;
    }
    if (*(void *)(a1 + 6792))
    {
      uint64_t v8 = *(void *)(a1 + 6800);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 132, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6792);
      goto LABEL_18;
    }
    if (*(void *)(a1 + 6808))
    {
      uint64_t v6 = *(void *)(a1 + 6816);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 44, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
      unsigned int v7 = *(void (**)(void, uint64_t, void, uint64_t))(a1 + 6808);
      goto LABEL_10;
    }
LABEL_88:
    uint64_t v13 = 255;
    goto LABEL_89;
  }
  uint64_t v8 = *(void *)(a1 + 6256);
  sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 114, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb", 0);
  unsigned __int8 v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6248);
LABEL_18:
  uint64_t v10 = *(void *)(a1 + 19360);
  uint64_t v11 = v8;
LABEL_19:
  uint64_t v12 = 145;
LABEL_20:
  v9(v10, v11, v12);
LABEL_21:
  uint64_t v13 = 0;
LABEL_89:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
  return v13;
}

uint64_t sub_225A2CC14(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Init2InitEnDisMultiTag");
  if (a1)
  {
    *(void *)(a1 + 2912) = &qword_26B608CC8;
    *(unsigned char *)(a1 + 2904) = 0;
    *(unsigned char *)(a1 + 2906) = 0;
    char v2 = qword_26B608CC8;
    if (qword_26B608CC8)
    {
      char v2 = 0;
      uint64_t v3 = off_26B608CD8;
      do
      {
        ++v2;
        uint64_t v4 = *v3;
        v3 += 2;
      }
      while (v4);
    }
    *(unsigned char *)(a1 + 2905) = v2;
    uint64_t v5 = sub_2259B528C(a1, 0, 0);
  }
  else
  {
    uint64_t v5 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Init2InitEnDisMultiTag");
  return v5;
}

uint64_t sub_225A2CCCC(unsigned int *a1, int *a2, uint64_t a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_Init2Discovery");
  uint64_t v6 = 1;
  if (a1 && a2 && a3)
  {
    int v7 = *a2;
    a1[357] = *a2;
    uint64_t v6 = sub_225A29B84((uint64_t)a1, v7, a3);
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_Init2Discovery");
  return v6;
}

uint64_t sub_225A2CD60(uint64_t a1, int *a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Actv2Discovery");
  uint64_t v6 = 1;
  if (a1 && a2 && a3)
  {
    if (*(unsigned char *)(a1 + 697) == 1 && !sub_225A24230(*(void *)(a1 + 19360), 1))
    {
      *(void *)(a1 + 512) = a1 + 392;
      *(_DWORD *)(a1 + 524) = 0;
      sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeTransEvent");
      sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeTransEvent");
      sub_225A24FAC(*(void *)(a1 + 19360), 167, 1, 0, 0);
      *(unsigned char *)(a1 + 697) = 0;
    }
    *(unsigned char *)(a1 + 1424) = 0;
    int v7 = *a2;
    *(_DWORD *)(a1 + 1432) = *a2;
    uint64_t v6 = sub_225A29CE0(a1, v7, a3);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Actv2Discovery");
  return v6;
}

uint64_t sub_225A2CE74(uint64_t a1, int *a2, uint64_t a3)
{
  unsigned int v17 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Actv2Init");
  if (a1 && a2 && a3)
  {
    uint64_t v6 = 0;
    if (*(_DWORD *)(a1 + 984)) {
      uint64_t v7 = a1 + 1000;
    }
    else {
      uint64_t v7 = a3;
    }
    int v8 = *a2;
    *(_DWORD *)(a1 + 1436) = *a2;
    if (v8 != 2 && v8 != 7)
    {
      if (*(unsigned char *)(a1 + 19355) == 1)
      {
        *(_WORD *)(a1 + 19354) = 1;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Stop Discovery priority raised");
        uint64_t v6 = 13;
      }
      else
      {
        if (*(unsigned char *)(a1 + 2936) == 1)
        {
          *(void *)(a1 + 2912) = &qword_26B608E48;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          char v10 = qword_26B608E48;
          if (qword_26B608E48)
          {
            char v10 = 0;
            uint64_t v11 = off_26B608E58;
            do
            {
              ++v10;
              uint64_t v12 = *v11;
              v11 += 2;
            }
            while (v12);
          }
        }
        else if (*(_DWORD *)(v7 + 88) == 1)
        {
          *(void *)(a1 + 2912) = &qword_26B608D48;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          char v10 = qword_26B608D48;
          if (qword_26B608D48)
          {
            char v10 = 0;
            uint64_t v13 = off_26B608D58;
            do
            {
              ++v10;
              uint64_t v14 = *v13;
              v13 += 2;
            }
            while (v14);
          }
        }
        else
        {
          if (*(unsigned char *)(a1 + 697) == 1 && !sub_225A24230(*(void *)(a1 + 19360), 1))
          {
            *(void *)(a1 + 512) = a1 + 392;
            *(_DWORD *)(a1 + 524) = 0;
            sub_225A341B4((unsigned int *)a1, 1, 0, (int *)&v17);
            sub_225A24FAC(*(void *)(a1 + 19360), v17, 1, 0, 0);
            *(unsigned char *)(a1 + 697) = 0;
          }
          *(unsigned char *)(a1 + 1424) = 0;
          *(void *)(a1 + 2912) = off_26B608FB8;
          *(unsigned char *)(a1 + 2904) = 0;
          *(unsigned char *)(a1 + 2906) = 0;
          char v10 = (char)off_26B608FB8[0];
          if (off_26B608FB8[0])
          {
            char v10 = 0;
            uint64_t v15 = off_26B608FC8;
            do
            {
              ++v10;
              long long v16 = *v15;
              v15 += 2;
            }
            while (v16);
          }
        }
        *(unsigned char *)(a1 + 2905) = v10;
        uint64_t v6 = sub_2259B528C(a1, 0, 0);
      }
    }
  }
  else
  {
    uint64_t v6 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid LibNfc context passed or Invalid parameter");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Actv2Init");
  return v6;
}

uint64_t sub_225A2D0C4(unsigned int *a1, _DWORD *a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_DummyInit");
  if (a1 && a2)
  {
    if (*a2)
    {
      uint64_t v4 = "DummyInit: No previous configuration available, discovery failed!";
    }
    else
    {
      uint64_t v6 = phOsalNfc_Timer_Create();
      if (v6) {
        BOOL v7 = v6 == 0xFFFFFFFFFFFFLL;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7)
      {
        uint64_t v9 = v6;
        if (!phOsalNfc_Timer_Start())
        {
          sub_2259D730C(1, a1 + 4842, v9, 4u, 4u, (uint64_t)"phLibNfc_DummyInit", (uint64_t)"DummyInit", 1);
          sub_2259A0EAC(1, a1 + 4842, 4u, 4u, (uint64_t)"DummyInit: Timer started");
          uint64_t v5 = 13;
          goto LABEL_14;
        }
        sub_2259A0EAC(1, a1 + 4842, 4u, 1u, (uint64_t)"DummyInit: Failed start timer");
        phOsalNfc_Timer_Delete();
        goto LABEL_13;
      }
      uint64_t v4 = "DummyInit: Failed to create Timer!";
    }
    sub_2259A0EAC(1, a1 + 4842, 4u, 1u, (uint64_t)v4);
LABEL_13:
    uint64_t v5 = 255;
    goto LABEL_14;
  }
  uint64_t v5 = 1;
  sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"Invalid LibNfc context passed or Invalid Parameter");
LABEL_14:
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_DummyInit");
  return v5;
}

uint64_t sub_225A2D254(uint64_t a1, uint64_t a2)
{
  sub_2259D730C(2, (unsigned int *)a2, a1, 4u, 4u, (uint64_t)"phLibNfc_DummyInitTimerCb", (uint64_t)"Timeout:DummyInit", 0);
  sub_2259A0FB0(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phLibNfc_DummyInitTimerCb");
  if (!a2) {
    goto LABEL_6;
  }
  char v3 = 0;
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = *((void *)&unk_26ABD79B8 + 14 * v4 + 2);
    if (v3) {
      break;
    }
    char v3 = 1;
    uint64_t v4 = 1;
  }
  while (v5 != a2);
  if (v5 == a2)
  {
    phOsalNfc_Timer_Stop();
    phOsalNfc_Timer_Delete();
    sub_2259A0EAC(1, (unsigned int *)(a2 + 19368), 4u, 4u, (uint64_t)"DummyInitTimerCb: Timer stopped and deleted");
    sub_225A24FAC(*(void *)(a2 + 19360), 145, 0, 0, 0);
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a2, 4u, 1u, (uint64_t)"DummyInitTimerCb: Invalid 'pLibCtx', can not invoke upper layer call back");
  }

  return sub_2259A10B4(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phLibNfc_DummyInitTimerCb");
}

uint64_t sub_225A2D39C(uint64_t a1, int a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Process_ConfigDisc");
  uint64_t v9 = 255;
  if (!a1 || !a4 || !a5) {
    goto LABEL_132;
  }
  if (*a4 == 3)
  {
    int v10 = 0;
    goto LABEL_8;
  }
  if (*a4 == 1)
  {
    int v10 = 0;
    a5 = a1 + 1000;
LABEL_8:
    int v11 = 1;
    goto LABEL_10;
  }
  int v11 = 0;
  int v10 = 1;
LABEL_10:
  uint64_t v12 = (uint64_t *)(a1 + 1456);
  if (!sub_225A57604(*(unsigned int **)(a1 + 3040), *(void *)(a1 + 1456)))
  {
    if (!*v12) {
      goto LABEL_12;
    }
    uint64_t v61 = *v12;
    sub_225A2DF60(a1);
    int v17 = sub_225A111DC(a1, &v60, &v61, 0);
    if (*(_DWORD *)(v61 + 4) == 23 && !v17)
    {
      uint64_t v15 = (unsigned int *)(a1 + 19368);
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"P2P Target detected as remote device type, try priority discovery");
      if (!*(void *)(a1 + 6184))
      {
        BOOL v35 = "In P2P Initiator mode: No P2P Transceive call back found";
LABEL_43:
        sub_2259A0EAC(1, v15, 4u, 4u, (uint64_t)v35);
        goto LABEL_44;
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Found pClientTranscvCb as valid");
      char v18 = *(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t))(a1 + 6184);
      uint64_t v19 = *(void *)(a1 + 6192);
      *(void *)(a1 + 6184) = 0;
      *(void *)(a1 + 6192) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Invoking pClientTranscvCb...");
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 17, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
      uint64_t v20 = *(void *)(a1 + 19360);
      uint64_t v21 = v60;
      uint64_t v22 = v19;
      uint64_t v23 = 146;
      goto LABEL_27;
    }
    if (!*(void *)(a1 + 6184) || v17)
    {
      long long v28 = *(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t))(a1 + 6168);
      if (!v28)
      {
        if (a2 == 137 && *(void *)(a1 + 6424) && !v17)
        {
          sub_225A55104(*(void *)(a1 + 3040), 1);
          v47 = *(void (**)(void, uint64_t, uint64_t))(a1 + 6424);
          uint64_t v48 = *(void *)(a1 + 6432);
          *(void *)(a1 + 6424) = 0;
          *(void *)(a1 + 6432) = 0;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Presence Check");
          sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 22, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
          v47(*(void *)(a1 + 19360), v48, 150);
          goto LABEL_44;
        }
        if (a2 != 137 || !*(void *)(a1 + 6152) || v17)
        {
          if (a2 == 137 && *(void *)(a1 + 6264) && !v17)
          {
            sub_225A55104(*(void *)(a1 + 3040), 1);
            sub_2259CC17C(a1);
            v50 = *(void (**)(void, uint64_t, void, void, uint64_t))(a1 + 6264);
            uint64_t v51 = *(void *)(a1 + 6272);
            *(void *)(a1 + 6264) = 0;
            *(void *)(a1 + 6272) = 0;
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Check NDEF");
            sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 23, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
            v50(*(void *)(a1 + 19360), v51, 0, 0, 150);
          }
          else
          {
            if (a2 == 137 && *(void *)(a1 + 6360) && !v17)
            {
              sub_225A55104(*(void *)(a1 + 3040), 1);
              sub_2259CC17C(a1);
              v53 = *(void (**)(void, uint64_t, uint64_t))(a1 + 6360);
              uint64_t v54 = *(void *)(a1 + 6368);
              *(void *)(a1 + 6360) = 0;
              *(void *)(a1 + 6368) = 0;
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Read NDEF");
              v55 = (unsigned int *)(a1 + 19368);
              uint64_t v56 = 24;
            }
            else
            {
              if (a2 != 137 || !*(void *)(a1 + 6376) || v17)
              {
                if (*(void *)(a1 + 6200) && !v17)
                {
                  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Internal Remote Device Transceive inprogress");
                  v57 = *(void (**)(void, uint64_t, uint64_t, void, uint64_t))(a1 + 6200);
                  uint64_t v58 = *(void *)(a1 + 6208);
                  *(void *)(a1 + 6200) = 0;
                  *(void *)(a1 + 6208) = 0;
                  sub_225A55104(*(void *)(a1 + 3040), 1);
                  sub_2259CC17C(a1);
                  if (a2 == 137) {
                    uint64_t v59 = 150;
                  }
                  else {
                    uint64_t v59 = 146;
                  }
                  v57(*(void *)(a1 + 19360), v58, v60, 0, v59);
                }
                goto LABEL_44;
              }
              sub_225A55104(*(void *)(a1 + 3040), 1);
              sub_2259CC17C(a1);
              v53 = *(void (**)(void, uint64_t, uint64_t))(a1 + 6376);
              uint64_t v54 = *(void *)(a1 + 6384);
              *(void *)(a1 + 6376) = 0;
              *(void *)(a1 + 6384) = 0;
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Write NDEF");
              v55 = (unsigned int *)(a1 + 19368);
              uint64_t v56 = 25;
            }
            sub_2259D6F6C(1, v55, 4u, v56, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
            v53(*(void *)(a1 + 19360), v54, 150);
          }
          if (*(void *)(a1 + 6200)) {
            *(void *)(a1 + 6200) = 0;
          }
          goto LABEL_44;
        }
        if ((**(unsigned char **)(a1 + 808) & 0xFE) != 0 && *(unsigned char *)(a1 + 19352) == 1)
        {
          sub_225A55104(*(void *)(a1 + 3040), 0);
          *(unsigned char *)(a1 + 19352) = 0;
        }
        else
        {
          sub_225A55104(*(void *)(a1 + 3040), 1);
        }
        char v18 = *(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t))(a1 + 6152);
        uint64_t v52 = *(void *)(a1 + 6160);
        *(void *)(a1 + 6152) = 0;
        *(void *)(a1 + 6160) = 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Connect");
        sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 15, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
        uint64_t v20 = *(void *)(a1 + 19360);
        uint64_t v22 = v52;
        uint64_t v21 = 0;
        uint64_t v23 = 150;
LABEL_27:
        v18(v20, v22, v21, 0, v23);
        goto LABEL_44;
      }
      uint64_t v34 = *(void *)(a1 + 6176);
      *(void *)(a1 + 6168) = 0;
      *(void *)(a1 + 6176) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Found pClientNfcIpRxCb as valid, invoking the same");
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 16, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
      uint64_t v30 = *(void *)(a1 + 19360);
      uint64_t v32 = v34;
      uint64_t v31 = 0;
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Remote Device Transceive inprogress");
      long long v28 = *(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t))(a1 + 6184);
      uint64_t v29 = *(void *)(a1 + 6192);
      *(void *)(a1 + 6184) = 0;
      *(void *)(a1 + 6192) = 0;
      sub_225A55104(*(void *)(a1 + 3040), 1);
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 17, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
      uint64_t v30 = *(void *)(a1 + 19360);
      uint64_t v31 = v60;
      uint64_t v32 = v29;
      if (a2 == 137)
      {
        uint64_t v33 = 150;
LABEL_40:
        v28(v30, v32, v31, 0, v33);
        goto LABEL_44;
      }
    }
    uint64_t v33 = 146;
    goto LABEL_40;
  }
  *uint64_t v12 = 0;
  *(void *)(a1 + 1464) = 0;
LABEL_12:
  uint64_t v13 = *(void *)(a1 + 1352);
  if (v13)
  {
    unsigned int v14 = *(_DWORD *)(v13 + 4);
    if (v14 <= 0x1B && ((1 << v14) & 0x8000006) != 0)
    {
      uint64_t v15 = (unsigned int *)(a1 + 19368);
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"P2P Initiator/HCE detected as remote device type, try priority discovery");
      if (sub_225A2586C(*(void *)(a1 + 19360)) == 8
        && sub_225A2593C(*(void *)(a1 + 19360)) == 9
        || sub_225A2586C(*(void *)(a1 + 19360)) == 7
        && sub_225A2593C(*(void *)(a1 + 19360)) == 9
        || sub_225A2586C(*(void *)(a1 + 19360)) == 9
        && sub_225A2593C(*(void *)(a1 + 19360)) == 8)
      {
        *(_WORD *)(a1 + 2904) = 0;
        *(void *)(a1 + 2912) = 0;
        long long v16 = "Discovery priority raised";
      }
      else
      {
        long long v16 = "No change in Discovery priority";
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v16);
      sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnablePriorityDiscovery");
      sub_225A2DF60(a1);
      int v24 = *(void (**)(void, uint64_t, void, uint64_t))(a1 + 6760);
      if (v24)
      {
        uint64_t v25 = *(void *)(a1 + 6768);
        *(void *)(a1 + 6760) = 0;
        *(void *)(a1 + 6768) = 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Found pClientNfcIpRxCb as valid, invoking the same");
        sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 30, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
        v24(*(void *)(a1 + 19360), v25, 0, 146);
        goto LABEL_44;
      }
      int v26 = *(void (**)(void, uint64_t, uint64_t))(a1 + 6744);
      if (v26)
      {
        uint64_t v27 = *(void *)(a1 + 6752);
        *(void *)(a1 + 6744) = 0;
        *(void *)(a1 + 6752) = 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Found pClientNfcIpTxCb as valid, invoking the same");
        sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 31, (uint64_t)"phLibNfc_Process_ConfigDisc", (uint64_t)"phLibNfc_Process_ConfigDisc", 0);
        v26(*(void *)(a1 + 19360), v27, 146);
        goto LABEL_44;
      }
      BOOL v35 = "In P2P Target/HCE mode: No P2P Send/Receive call back found";
      goto LABEL_43;
    }
  }
LABEL_44:
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryTypeAndMode");
  if ((*(_DWORD *)a5 & 0xB83DF) != 0)
  {
    char v36 = "Poll is enabled";
LABEL_46:
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v36);
LABEL_47:
    sub_225A2586C(*(void *)(a1 + 19360));
    goto LABEL_48;
  }
  int v38 = *(unsigned __int8 *)(a5 + 6);
  if (*(unsigned char *)(a5 + 6))
  {
    if (v38 != 255)
    {
      char v36 = "P2P Initiator is enabled";
      if (v38 == 15 || (v38 & 0x77777777) != 0) {
        goto LABEL_46;
      }
    }
  }
  if ((*(_DWORD *)a5 & 0x40000) != 0)
  {
    if (*(unsigned char *)(a5 + 7))
    {
      int v41 = sub_225A2586C(*(void *)(a1 + 19360));
      BOOL v42 = (a2 & 0xFFFFFFFE) == 0x88 && v41 == 4;
      if (v42) {
        unsigned int v43 = 136;
      }
      else {
        unsigned int v43 = a2 & 0xFFFFFFFE;
      }
      if (v42 && ((v10 ^ 1) & 1) == 0) {
        goto LABEL_47;
      }
      goto LABEL_105;
    }
    if (*(unsigned char *)(a5 + 8))
    {
      char v36 = "P2P Target mode is enabled";
      goto LABEL_46;
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 314))
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Card emulation is enabled");
      int v39 = 0;
    }
    else
    {
      int v39 = 1;
    }
    if (!*(unsigned char *)(a5 + 9)) {
      int v39 = 2;
    }
    if (!v39) {
      goto LABEL_47;
    }
    if (v39 != 2)
    {
      unsigned int v43 = a2 & 0xFFFFFFFE;
LABEL_105:
      int v44 = sub_225A2586C(*(void *)(a1 + 19360));
      if (v43 == 136 && v44 == 3) {
        char v46 = v10;
      }
      else {
        char v46 = 1;
      }
      if ((v46 & 1) == 0) {
        goto LABEL_131;
      }
      goto LABEL_48;
    }
  }
  if (v10) {
    goto LABEL_131;
  }
LABEL_48:
  if (*(unsigned char *)(a1 + 2936) == 1)
  {
    if ((*(unsigned char *)(a5 + 80) & 3) == 2)
    {
      __int16 v37 = "LPCD Trace mode is wrongly enabled";
LABEL_130:
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v37);
LABEL_131:
      sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryTypeAndMode");
      uint64_t v9 = 1;
      goto LABEL_132;
    }
    if (*(unsigned char *)(a1 + 2937) != 1 && *(unsigned char *)(a1 + 2938) != 1 && *(unsigned char *)(a1 + 2944) != 1) {
      goto LABEL_70;
    }
  }
  else if (*(unsigned char *)(a1 + 2937) != 1 && *(unsigned char *)(a1 + 2938) != 1 && *(unsigned char *)(a1 + 2944) != 1)
  {
    if (*(unsigned char *)(a5 + 12))
    {
      __int16 v37 = "SUICA is wrongly enabled";
      goto LABEL_130;
    }
    if ((*(unsigned char *)(a5 + 12) & 2) != 0)
    {
      __int16 v37 = "VAS Express is wrongly enabled";
      goto LABEL_130;
    }
    if ((*(unsigned char *)(a5 + 12) & 4) != 0)
    {
      __int16 v37 = "Generic-A Express is wrongly enabled";
      goto LABEL_130;
    }
    if ((*(unsigned char *)(a5 + 80) & 3) != 0)
    {
      __int16 v37 = "LPCD is wrongly enabled";
      goto LABEL_130;
    }
    goto LABEL_70;
  }
  if ((*(unsigned char *)(a5 + 80) & 2) != 0)
  {
    __int16 v37 = "LPCD Trace mode is not applicable for this platform";
    goto LABEL_130;
  }
LABEL_70:
  if (*(unsigned char *)(a5 + 84) == 1
    && (*(_DWORD *)a5 & 0x40000) != 0
    && !(*(_DWORD *)a5 & 0x80000 | *(unsigned char *)(a5 + 12) & 7))
  {
    __int16 v37 = "LPCD Assistance mode cannot be enabled without CE/express/RF Detect enabled";
    goto LABEL_130;
  }
  if (*(unsigned __int8 *)(a5 + 86) > 1u)
  {
    __int16 v37 = "Multi-Tag Enable Invalid Input Parameter";
    goto LABEL_130;
  }
  int v40 = *(_DWORD *)(a5 + 88);
  if (v40 == 1 || v40 == 3)
  {
    if ((*(_DWORD *)a5 & 0xF83DF) != 0x40000 || !*(unsigned char *)(a5 + 7) || *(unsigned char *)(a5 + 9)) {
      goto LABEL_96;
    }
  }
  else if (v40 == 2 && (*(unsigned char *)a5 & 3) == 0)
  {
LABEL_96:
    __int16 v37 = "eSE reader mode Invalid Input Parameter";
    goto LABEL_130;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryTypeAndMode");
  uint64_t v9 = sub_225A5523C(*(void *)(a1 + 3040));
  if (!v9) {
    *(_DWORD *)(a1 + 984) = v11;
  }
LABEL_132:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Process_ConfigDisc");
  return v9;
}

uint64_t sub_225A2DF60(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 448);
    if (v2) {
      BOOL v3 = v2 == 0xFFFFFFFFFFFFLL;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(void *)(a1 + 448) = 0;
    }
    *(unsigned char *)(a1 + 486) = 0;
    if (*(void *)(a1 + 488))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 488) = 0;
      *(_DWORD *)(a1 + 496) = 0;
      *(unsigned char *)(a1 + 485) = 0;
    }
    sub_225A55320(*(void *)(a1 + 3040), 0);
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AbortHceData");
  return v4;
}

uint64_t sub_225A2E010(_DWORD *a1)
{
  if (!a1) {
    return 1;
  }
  int v1 = a1[3];
  if (v1 == 1)
  {
    if (a1[4] != 3 || a1[5] != 130) {
      return 255;
    }
    return 0;
  }
  if (v1 == 2 && a1[4] == 4 && (a1[5] & 0xFFFFFFFE) == 0x80) {
    return 0;
  }
  return 255;
}

uint64_t sub_225A2E078(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_NtfRegRespCb");
  if (!a1)
  {
    uint64_t v9 = "phLibNfc_NtfRegRespCb: Lower layer has returned invalid                                LibNfc context";
    int v10 = 2;
    int v11 = 0;
LABEL_21:
    sub_2259A0EAC(v10, v11, 4u, 1u, (uint64_t)v9);
    goto LABEL_22;
  }
  if (sub_225A25A0C(*(void *)(a1 + 19360)) || !*a3)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"Activated Notification received when SM is busy");
    if (*(void *)(a1 + 6248))
    {
      BOOL v7 = *(void **)(a1 + 3040);
      if (v7)
      {
        uint64_t v8 = v7[430];
        if (v8)
        {
          v7[96] = v8;
          v7[97] = v7[471];
        }
      }
    }
    else
    {
      *(unsigned char *)(a1 + 19353) = 1;
    }
  }
  else
  {
    if (a4 == 188)
    {
      sub_225A136C0(a1);
      sub_225A0F66C(a1);
      *(void *)(a1 + 808) = *a3;
      sub_225A24FAC(*(void *)(a1 + 19360), 147, 188, 0, 0);
      int v11 = (unsigned int *)(a1 + 19368);
      uint64_t v9 = "phLibNfc_NtfRegRespCb: Lower layer has returned NFCSTATUS_RF_ACTV_NTF_ERROR";
LABEL_20:
      int v10 = 1;
      goto LABEL_21;
    }
    if ((_BYTE)a4 == 0xFF)
    {
      int v11 = (unsigned int *)(a1 + 19368);
      uint64_t v9 = "phLibNfc_NtfRegRespCb: Lower layer has returned NFCSTATUS_FAILED";
      goto LABEL_20;
    }
    if (!*(void *)(a1 + 1352)
      || sub_225A2586C(*(void *)(a1 + 19360)) != 7
      || *(_DWORD *)(*(void *)(a1 + 1352) + 4) != 25
      || *(unsigned char *)(a1 + 1485))
    {
      *(unsigned char *)(a1 + 716) = 16;
      *(unsigned char *)(a1 + 1442) = 0;
      if (*(unsigned char *)(a1 + 1424) == 1)
      {
        int v11 = (unsigned int *)(a1 + 19368);
        uint64_t v9 = "phLibNfc_NtfRegRespCb: Ignoring HCE Activation in Exp + HCE mode ";
        goto LABEL_20;
      }
      if (!*(unsigned char *)(a1 + 1485))
      {
        sub_225A136C0(a1);
        sub_225A0F66C(a1);
        *(void *)(a1 + 808) = *a3;
      }
      *(unsigned char *)(a1 + 486) = 0;
      if (a4 == 40)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Lower layer has returned status NFCSTATUS_SINGLE_TAG_ACTIVATED");
        if (sub_225A2C1C0(*(void *)(*a3 + 8), (unsigned char *)(a1 + 712), (unsigned char *)(a1 + 713)))
        {
          uint64_t v13 = 143;
        }
        else if (sub_225A2E010(*(_DWORD **)(*a3 + 8)))
        {
          uint64_t v13 = 147;
        }
        else
        {
          uint64_t v13 = 148;
        }
      }
      else if (a4 == 55)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Lower layer has returned status NFCSTATUS_MULTIPLE_TAGS");
        uint64_t v13 = 147;
      }
      else
      {
        uint64_t v13 = 235;
      }
      if (sub_225A2E380(a1))
      {
        *(unsigned char *)(a1 + 19355) = 1;
        sub_225A2AED4(a1);
      }
      else
      {
        *(unsigned char *)(a1 + 19355) = 0;
        if (sub_225A2B108(a1, v13, a4) != 13)
        {
          if (sub_225A2EC28(a1)) {
            uint64_t v13 = 147;
          }
          else {
            sub_225A2ECA4((unsigned int *)a1);
          }
          sub_225A2AC2C(a1, v13, *a3, a4);
        }
      }
    }
  }
LABEL_22:

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_NtfRegRespCb");
}

BOOL sub_225A2E380(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConnIsRfListnerRegisterd");
  uint64_t v2 = *(void *)(a1 + 808);
  if (!v2)
  {
    BOOL v8 = 1;
    *(unsigned char *)(a1 + 715) = 1;
    goto LABEL_94;
  }
  if (!*(_DWORD *)v2 || (uint64_t v4 = (uint64_t *)(v2 + 8), (v3 = *(void *)(v2 + 8)) == 0))
  {
    BOOL v8 = 1;
LABEL_87:
    *(unsigned char *)(a1 + 715) = 1;
    goto LABEL_94;
  }
  unsigned __int8 v5 = 0;
  char v6 = 0;
  while (2)
  {
    int v7 = *(_DWORD *)(v3 + 20);
    BOOL v8 = 1;
    switch(v7)
    {
      case 0:
      case 3:
      case 10:
      case 11:
      case 12:
        sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCAPoll");
        uint64_t v9 = *v4;
        int v10 = *(_DWORD *)(*v4 + 16);
        int v11 = 255;
        switch(v10)
        {
          case 1:
            if (!sub_225A2ED08((unsigned int *)a1, 22, 0))
            {
              int v12 = 128;
              goto LABEL_53;
            }
            goto LABEL_73;
          case 2:
            goto LABEL_27;
          case 3:
            goto LABEL_73;
          case 4:
            int v11 = 0;
            switch(*(_DWORD *)(v9 + 4))
            {
              case 3:
                if (sub_225A2ED08((unsigned int *)a1, 11, 0)) {
                  goto LABEL_72;
                }
                int v12 = 4;
                goto LABEL_53;
              case 5:
                if (sub_225A2ED08((unsigned int *)a1, 13, 0)) {
                  goto LABEL_72;
                }
                int v12 = 0x4000;
                goto LABEL_53;
              case 6:
                if (sub_225A2ED08((unsigned int *)a1, 14, 0)) {
                  goto LABEL_72;
                }
                int v12 = 0x8000;
                goto LABEL_53;
              case 7:
                if (sub_225A2ED08((unsigned int *)a1, 15, 0)) {
                  goto LABEL_72;
                }
                int v12 = 0x10000;
                goto LABEL_53;
              default:
                goto LABEL_73;
            }
            goto LABEL_73;
          case 5:
            if (sub_225A2ED08((unsigned int *)a1, 26, 0)) {
              goto LABEL_73;
            }
            int v12 = 64;
            goto LABEL_53;
          default:
            if (v10 != 128) {
              goto LABEL_73;
            }
LABEL_27:
            uint64_t v20 = *(unsigned __int8 *)(v9 + 96);
            int v11 = sub_225A2ED08((unsigned int *)a1, 16, *(unsigned __int8 *)(v9 + 96));
            if (v11) {
              goto LABEL_73;
            }
            if (v20 > 0x38) {
              goto LABEL_31;
            }
            if (((1 << v20) & 0x100010003030302) != 0) {
              goto LABEL_33;
            }
            if (!v20) {
              goto LABEL_85;
            }
LABEL_31:
            if ((v20 - 136) <= 0x30 && ((1 << (v20 + 120)) & 0x1000000010001) != 0)
            {
LABEL_33:
              int v12 = 2;
LABEL_53:
              int v11 = 0;
              *(_DWORD *)(a1 + 996) |= v12;
              goto LABEL_73;
            }
            if (*(_DWORD *)(*v4 + 16) == 2)
            {
LABEL_85:
              int v12 = 1;
              goto LABEL_53;
            }
LABEL_72:
            int v11 = 255;
LABEL_73:
            sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCAPoll");
            BOOL v23 = v11 == 0;
            BOOL v8 = v11 != 0;
            if (v23) {
              char v6 = 1;
            }
            break;
        }
        goto LABEL_80;
      case 1:
        sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCBPoll");
        uint64_t v21 = *v4;
        if (*(_DWORD *)(*v4 + 16) == 4
          && ((int v22 = *(_DWORD *)(v21 + 12), v22 != 131) ? (v23 = v22 == 2) : (v23 = 1), v23))
        {
          if (sub_225A2ED08((unsigned int *)a1, 19, 0)) {
            goto LABEL_58;
          }
          int v24 = 8;
        }
        else
        {
          if (*(_DWORD *)(v21 + 4) != 25 || sub_225A2ED08((unsigned int *)a1, 17, 0))
          {
LABEL_58:
            uint64_t v15 = (unsigned int *)a1;
            long long v16 = "phLibNfc_ChkRfListnerforNFCBPoll";
            goto LABEL_59;
          }
          int v24 = 0x2000;
        }
        *(_DWORD *)(a1 + 996) |= v24;
        int v26 = (unsigned int *)a1;
        uint64_t v27 = "phLibNfc_ChkRfListnerforNFCBPoll";
LABEL_79:
        sub_2259A10B4(2, v26, 4u, 5u, (uint64_t)v27);
        BOOL v8 = 0;
        char v6 = 1;
        goto LABEL_80;
      case 2:
      case 5:
        sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCFPoll");
        int v17 = *(_DWORD *)(*v4 + 16);
        if (v17 == 3)
        {
          if (!sub_225A2ED08((unsigned int *)a1, 21, 0))
          {
            int v18 = 32;
            goto LABEL_65;
          }
        }
        else if (v17 == 5 && !sub_225A2ED08((unsigned int *)a1, 26, 0))
        {
          int v18 = 64;
LABEL_65:
          *(_DWORD *)(a1 + 996) |= v18;
          int v26 = (unsigned int *)a1;
          uint64_t v27 = "phLibNfc_ChkRfListnerforNFCFPoll";
          goto LABEL_79;
        }
        uint64_t v15 = (unsigned int *)a1;
        long long v16 = "phLibNfc_ChkRfListnerforNFCFPoll";
LABEL_59:
        sub_2259A10B4(2, v15, 4u, 5u, (uint64_t)v16);
LABEL_80:
        ++v5;
        unsigned int v28 = *(_DWORD *)v2;
        if (*(_DWORD *)v2 > v5)
        {
          uint64_t v29 = v2 + 8 * v5;
          uint64_t v30 = *(void *)(v29 + 8);
          uint64_t v4 = (uint64_t *)(v29 + 8);
          uint64_t v3 = v30;
          if (v30) {
            continue;
          }
        }
        if (!v6) {
          goto LABEL_87;
        }
        unsigned __int8 v31 = 0;
        if (v28)
        {
          do
          {
            uint64_t v32 = v2 + 8 * v31;
            *(void *)(a1 + 712 + 8 * v31 + 16) = *(void *)(v32 + 8);
            *(void *)(a1 + 712 + 16 * v31++ + 488) = *(void *)(v32 + 8);
          }
          while (v28 > v31);
          *(unsigned char *)(a1 + 715) = 0;
        }
        BOOL v8 = 0;
        *(unsigned char *)(a1 + 714) = v31;
LABEL_94:
        sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConnIsRfListnerRegisterd");
        return v8;
      case 4:
      case 7:
      case 8:
      case 9:
        goto LABEL_80;
      case 6:
        sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCISO15693Poll");
        if (*(_DWORD *)(*v4 + 16) != 6 || sub_225A2ED08((unsigned int *)a1, 23, 0))
        {
          sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCISO15693Poll");
          BOOL v8 = 1;
          goto LABEL_80;
        }
        *(_DWORD *)(a1 + 996) |= 0x10u;
        int v26 = (unsigned int *)a1;
        uint64_t v27 = "phLibNfc_ChkRfListnerforNFCISO15693Poll";
        goto LABEL_79;
      default:
        int v13 = v7 - 128;
        switch(v13)
        {
          case 0:
          case 3:
            sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCAListen");
            int v14 = *(_DWORD *)(*v4 + 16);
            if (v14 == 4)
            {
              sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
              sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
            }
            else if (v14 != 5 || sub_225A2ED08((unsigned int *)a1, 27, 0))
            {
              uint64_t v15 = (unsigned int *)a1;
              long long v16 = "phLibNfc_ChkRfListnerforNFCAListen";
              goto LABEL_59;
            }
            *(_DWORD *)(a1 + 996) |= 0x40u;
            int v26 = (unsigned int *)a1;
            uint64_t v27 = "phLibNfc_ChkRfListnerforNFCAListen";
            goto LABEL_79;
          case 1:
            sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCBListen");
            int v25 = *(_DWORD *)(*v4 + 16);
            BOOL v8 = v25 != 4;
            if (v25 == 4)
            {
              sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
              sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
              *(_DWORD *)(a1 + 996) |= 0x40u;
              char v6 = 1;
            }
            uint64_t v15 = (unsigned int *)a1;
            long long v16 = "phLibNfc_ChkRfListnerforNFCBListen";
            goto LABEL_59;
          case 2:
          case 5:
            sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCFListen");
            int v19 = *(_DWORD *)(*v4 + 16);
            if (v19 == 3)
            {
              sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
              sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
            }
            else if (v19 != 5 || sub_225A2ED08((unsigned int *)a1, 27, 0))
            {
              uint64_t v15 = (unsigned int *)a1;
              long long v16 = "phLibNfc_ChkRfListnerforNFCFListen";
              goto LABEL_59;
            }
            *(_DWORD *)(a1 + 996) |= 0x40u;
            int v26 = (unsigned int *)a1;
            uint64_t v27 = "phLibNfc_ChkRfListnerforNFCFListen";
            goto LABEL_79;
          case 4:
            goto LABEL_80;
          default:
            if (v13 != 112) {
              goto LABEL_80;
            }
            sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforKovioPoll");
            if (*(_DWORD *)(*v4 + 16) != 138 || sub_225A2ED08((unsigned int *)a1, 25, 0))
            {
              uint64_t v15 = (unsigned int *)a1;
              long long v16 = "phLibNfc_ChkRfListnerforKovioPoll";
              goto LABEL_59;
            }
            *(_DWORD *)(a1 + 996) |= 0x200u;
            int v26 = (unsigned int *)a1;
            uint64_t v27 = "phLibNfc_ChkRfListnerforKovioPoll";
            break;
        }
        goto LABEL_79;
    }
  }
}

BOOL sub_225A2EC28(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConnChkDevType");
  BOOL v2 = *(unsigned char *)(a1 + 712) == 1 || *(unsigned __int8 *)(a1 + 714) > 1u;
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConnChkDevType");
  return v2;
}

uint64_t sub_225A2ECA4(unsigned int *a1)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConnChkTgtType");

  return sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConnChkTgtType");
}

uint64_t sub_225A2ED08(unsigned int *a1, int a2, unsigned int a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
  uint64_t v6 = 255;
  int v7 = 128;
  switch(a2)
  {
    case 11:
      int v7 = 4;
      goto LABEL_18;
    case 13:
      int v7 = 0x4000;
      goto LABEL_18;
    case 14:
      int v7 = 0x8000;
      goto LABEL_18;
    case 15:
      int v7 = 0x10000;
      goto LABEL_18;
    case 16:
      if (a3 <= 0x38 && ((1 << a3) & 0x100010003030302) != 0
        || (int v7 = 1, a3 - 136 <= 0x30) && ((1 << (a3 + 120)) & 0x1000000010001) != 0)
      {
        int v7 = 2;
      }
      goto LABEL_18;
    case 17:
      int v7 = 0x2000;
      goto LABEL_18;
    case 19:
      int v7 = 8;
      goto LABEL_18;
    case 21:
      int v7 = 32;
      goto LABEL_18;
    case 22:
      goto LABEL_18;
    case 23:
      int v7 = 16;
      goto LABEL_18;
    case 24:
      int v7 = 4096;
      goto LABEL_18;
    case 25:
      int v7 = 512;
      goto LABEL_18;
    case 26:
    case 27:
      int v7 = 64;
LABEL_18:
      if ((a1[248] & v7) != 0) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = 255;
      }
      break;
    default:
      break;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
  return v6;
}

uint64_t sub_225A2EEA8(unsigned int *a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_Process_Disconnect");
  uint64_t v8 = 1;
  if (a1 && a4 && a5)
  {
    uint64_t v12 = a5;
    unsigned int v9 = *a4;
    if (sub_225A111DC((uint64_t)a1, &v12, &v13, 1))
    {
      uint64_t v8 = 149;
      int v10 = "Mapping of LibNfc RemoteDev Handle to NCI RemoteDev handle Failed";
    }
    else if (sub_2259CC038(a1, v13))
    {
      uint64_t v8 = 149;
      int v10 = "Validation of  NCI RemoteDev handle Failed";
    }
    else
    {
      a1[246] = v9;
      if (v13)
      {
        uint64_t v8 = 0;
        goto LABEL_9;
      }
      uint64_t v8 = 1;
      int v10 = "Remote Device Handle NULL!!!";
    }
    sub_2259A0EAC(1, a1 + 4842, 4u, 1u, (uint64_t)v10);
  }
LABEL_9:
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_Process_Disconnect");
  return v8;
}

uint64_t sub_225A2EFB8(unsigned int *a1, unsigned int a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDeActType");
  if (a2 >= 8) {
    char v4 = 0;
  }
  else {
    char v4 = 0x100010000010000uLL >> (8 * a2);
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDeActType");
  return v4 & 1;
}

uint64_t sub_225A2F03C(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t v4 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v4, 4u, 5u, (uint64_t)"phLibNfc_H_RetreiveConnectedHandle");
  sub_2259E02A4(v4, &v3);
  if (v3) {
    uint64_t v1 = *(void *)(v3 + 1456);
  }
  else {
    uint64_t v1 = 0;
  }
  sub_2259A10B4(0, (unsigned int *)&v4, 4u, 5u, (uint64_t)"phLibNfc_H_RetreiveConnectedHandle");
  return v1;
}

uint64_t sub_225A2F0C0(uint64_t a1, unsigned char *a2)
{
  uint64_t v10 = 0;
  uint64_t v11 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v11, 4u, 5u, (uint64_t)"phLibNfc_H_GetFSC");
  sub_2259E02A4(v11, &v10);
  uint64_t v3 = 255;
  if (a2 && v10)
  {
    int v4 = sub_225A57604(*(unsigned int **)(v10 + 3040), *(void *)(v10 + 1456));
    unsigned __int8 v5 = (uint64_t *)(v10 + 1456);
    if (v4)
    {
      *unsigned __int8 v5 = 0;
      v5[1] = 0;
      goto LABEL_12;
    }
    uint64_t v6 = *v5;
    if (!v6) {
      goto LABEL_12;
    }
    int v7 = *(_DWORD *)(v6 + 4);
    if ((v7 - 5) >= 3)
    {
      if (v7 == 16)
      {
        uint64_t v3 = 0;
        char v8 = *(unsigned char *)(v6 + 145);
        goto LABEL_11;
      }
      if (v7 != 3) {
        goto LABEL_12;
      }
    }
    uint64_t v3 = 0;
    char v8 = *(unsigned char *)(v6 + 106);
LABEL_11:
    *a2 = v8;
  }
LABEL_12:
  sub_2259A0FB0(0, (unsigned int *)&v11, 4u, 5u, (uint64_t)"phLibNfc_H_GetFSC");
  return v3;
}

uint64_t sub_225A2F1A4(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Recv4AResp");
  if (a1)
  {
    if (!a2 && (unsigned int v4 = *(_DWORD *)(a1 + 3824)) != 0 && *(void *)(a1 + 3816))
    {
      if (v4 >= *(_DWORD *)(a1 + 4616)) {
        int v5 = *(_DWORD *)(a1 + 4616);
      }
      else {
        int v5 = *(_DWORD *)(a1 + 3824);
      }
      phOsalNfc_MemCopy();
      uint64_t v6 = 0;
      *(_DWORD *)(a1 + 4616) = v5;
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Data Receive Failed..");
      uint64_t v6 = 255;
    }
    *(_WORD *)(a1 + 4648) = v6;
    if (*(void *)(a1 + 4656))
    {
      *(_DWORD *)(a1 + 4664) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Freeing Send Request Payload Buffer..");
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 4656) = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
    uint64_t v6 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Recv4AResp");
  return v6;
}

uint64_t sub_225A2F2D4(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Send4AData");
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 4568);
    if (v2)
    {
      if (*(_DWORD *)(a1 + 4600))
      {
        phOsalNfc_SetMemory();
        LODWORD(v7) = 0;
        if (sub_2259C9408((unsigned int *)a1, v2, (unsigned char *)((unint64_t)&v7 | 0xC)))
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Couldn't Get ConnId..");
          uint64_t v3 = 255;
        }
        else
        {
          int v5 = *(_DWORD *)(a1 + 4600);
          *(_DWORD *)(a1 + 4664) = 0;
          *(void *)(a1 + 4656) = 0;
          uint64_t Memory = phOsalNfc_GetMemory();
          *(void *)(a1 + 4656) = Memory;
          if (Memory)
          {
            *(_DWORD *)(a1 + 4664) = v5;
            phOsalNfc_SetMemory();
            if (v5) {
              phOsalNfc_MemCopy();
            }
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" 4A Payload created successfully..");
            *(void *)&long long v8 = *(void *)(a1 + 4656);
            DWORD2(v8) = *(_DWORD *)(a1 + 4664);
            uint64_t v3 = sub_225A47614(a1 + 920, (uint64_t)&v7, a1 + 3816, *(unsigned __int16 *)(a1 + 4582), (uint64_t)sub_225A45B24, a1);
            *(_WORD *)(a1 + 4582) = 0;
            if (v3 != 13)
            {
              phOsalNfc_FreeMemory();
              *(void *)(a1 + 4656) = 0;
              *(_DWORD *)(a1 + 4664) = 0;
            }
          }
          else
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Payload MemAlloc for Send request Failed..");
            uint64_t v3 = 12;
          }
        }
      }
      else
      {
        uint64_t v3 = 1;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Invalid Length..");
      }
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Invalid Device..");
      uint64_t v3 = 6;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
    uint64_t v3 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Send4AData");
  return v3;
}

uint64_t sub_225A2F514(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciOpenAdmPipe");
  if (!a1)
  {
    uint64_t v6 = "phLibNfc_HciOpenAdmPipe: Invalid LibNfc context passed!";
    uint64_t v7 = 1;
    int v8 = 2;
    int v5 = 0;
    goto LABEL_9;
  }
  uint64_t v2 = *(void *)(a1 + 464);
  uint64_t v3 = *(void *)(a1 + 472);
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    int v5 = (unsigned int *)(a1 + 19368);
    uint64_t v6 = "phLibNfc_HciOpenAdmPipe: Invalid Hci context passed!";
    uint64_t v7 = 1;
    int v8 = 1;
LABEL_9:
    sub_2259A0EAC(v8, v5, 4u, 1u, (uint64_t)v6);
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 2944) == 1 || *(unsigned char *)(a1 + 2936) == 1 && *(unsigned char *)(v3 + 1) == 1 && *(_DWORD *)(v3 + 4) == 1)
  {
    uint64_t v7 = 0;
  }
  else if (sub_2259DE730(v2, 1, (uint64_t)sub_2259B5A70, a1) == 13)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciOpenAdmPipe:ADM Open pipe Cmd Sent to NCI");
    uint64_t v7 = 13;
  }
  else
  {
    sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciOpenAdmPipe:Failed to create pipe for ADM, error");
    uint64_t v7 = 255;
  }
LABEL_18:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciOpenAdmPipe");
  return v7;
}

uint64_t sub_225A2F670(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciOpenAdmPipeProc");
  if (!a1)
  {
    int v5 = "phLibNfc_HciOpenAdmPipeProc: Invalid LibNfc context received!";
    a2 = 1;
    int v6 = 2;
    uint64_t v7 = 0;
LABEL_7:
    sub_2259A0EAC(v6, v7, 4u, 1u, (uint64_t)v5);
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 464))
  {
    uint64_t v7 = (unsigned int *)(a1 + 19368);
    int v5 = "phLibNfc_HciOpenAdmPipeProc: Invalid Hci context received!";
    a2 = 1;
    int v6 = 1;
    goto LABEL_7;
  }
  BOOL v4 = (unsigned int *)(a1 + 19368);
  if (a2)
  {
    sub_2259A0EAC(1, v4, 4u, 1u, (uint64_t)"phLibNfc_HciOpenAdmPipe: Failed to open ADM pipe");
    a2 = 255;
  }
  else
  {
    sub_2259A0EAC(1, v4, 4u, 4u, (uint64_t)"ADM pipe successfully opened");
  }
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciOpenAdmPipeProc");
  return a2;
}

uint64_t sub_225A2F760(uint64_t a1)
{
  char v10 = -1;
  __int16 v9 = -1;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciSetAllowList");
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 472);
    if (*(void *)(a1 + 464)) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      BOOL v4 = (unsigned int *)(a1 + 19368);
      int v5 = "phLibNfc_HciSetAllowList: Invalid Hci context received!";
      uint64_t v6 = 1;
    }
    else
    {
      if (*(unsigned char *)(a1 + 2944) == 1)
      {
LABEL_13:
        uint64_t v6 = 0;
        goto LABEL_11;
      }
      if (*(unsigned char *)(a1 + 2936) == 1)
      {
        if (*(unsigned char *)(v2 + 1) == 1 && *(_DWORD *)(v2 + 4) == 1) {
          goto LABEL_13;
        }
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList: Setting all secure elements to allow list");
        __int16 v9 = -32320;
        char v10 = 2;
        LODWORD(v6) = 3;
      }
      else
      {
        if ((*(unsigned __int8 *)(a1 + 318) | 2) == 3)
        {
          LOBYTE(v9) = -64;
          uint64_t v6 = 1;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList: Setting eSE to Allow list");
        }
        else
        {
          uint64_t v6 = 0;
        }
        if ((*(unsigned __int8 *)(a1 + 319) | 2) == 3)
        {
          *(unsigned char *)((unint64_t)&v9 | v6) = -127;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList: Setting SE2 Se Allow list");
          uint64_t v6 = (v6 + 1);
        }
        if ((*(unsigned __int8 *)(a1 + 317) | 2) == 3)
        {
          *((unsigned char *)&v9 + v6) = 2;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList: Setting UICC to Allow list");
          LODWORD(v6) = v6 + 1;
        }
        else if (!v6)
        {
          goto LABEL_11;
        }
      }
      uint64_t v6 = sub_2259DE4F0(*(void *)(a1 + 464), 3, 1, v6, (uint64_t)&v9, (uint64_t)sub_2259B5A70, a1);
      BOOL v4 = (unsigned int *)(a1 + 19368);
      if (v6 == 13)
      {
        sub_2259A0EAC(1, v4, 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList:Cmd Sent to NCI");
        goto LABEL_11;
      }
      int v5 = "phLibNfc_HciSetAllowList:Failed to Send Cmd to NCI";
    }
    int v7 = 1;
  }
  else
  {
    int v5 = "phLibNfc_HciSetAllowList: Invalid LibNfc context received!";
    uint64_t v6 = 1;
    int v7 = 2;
    BOOL v4 = 0;
  }
  sub_2259A0EAC(v7, v4, 4u, 1u, (uint64_t)v5);
LABEL_11:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciSetAllowList");
  return v6;
}

uint64_t sub_225A2F9DC(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciSetAllowListProc");
  if (!a1)
  {
    int v5 = "phLibNfc_HciSetAllowListProc: Invalid LibNfc context received!";
    a2 = 1;
    int v6 = 2;
    BOOL v4 = 0;
LABEL_6:
    sub_2259A0EAC(v6, v4, 4u, 1u, (uint64_t)v5);
    goto LABEL_7;
  }
  BOOL v4 = (unsigned int *)(a1 + 19368);
  if (!*(void *)(a1 + 464))
  {
    int v5 = "phLibNfc_HciSetAllowListProc: Invalid Hci context received!";
    a2 = 1;
    int v6 = 1;
    goto LABEL_6;
  }
  sub_2259A0EAC(1, v4, 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowListProc: Sucessfull");
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciSetAllowListProc");
  return a2;
}

uint64_t sub_225A2FAA0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ModeSetHciNwk");
  if (!a1) {
    goto LABEL_6;
  }
  char v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = *((void *)&unk_26ABD79B8 + 14 * v3 + 2);
    if (v2) {
      break;
    }
    char v2 = 1;
    uint64_t v3 = 1;
  }
  while (v4 != a1);
  if (v4 == a1)
  {
    *(unsigned char *)(a1 + 2881) = 0;
    *(_DWORD *)(a1 + 544) = 0;
    uint64_t v7 = *(void *)(a1 + 472);
    if ((*(unsigned __int8 *)(a1 + 318) | 2) == 3 && !*(unsigned char *)(a1 + 504))
    {
      *(_DWORD *)(a1 + 544) = 4000;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Add Delay Wait for EoOP of p61");
    }
    if ((*(unsigned __int8 *)(a1 + 317) | 2) == 3 && !*(unsigned char *)(a1 + 505))
    {
      *(_DWORD *)(a1 + 544) += 2000;
      *(unsigned char *)(a1 + 2881) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Add Delay Wait for EoOP of UICC");
    }
    if ((*(unsigned __int8 *)(a1 + 319) | 2) == 3 && !*(unsigned char *)(a1 + 506))
    {
      *(_DWORD *)(a1 + 544) += 2000;
      *(unsigned char *)(a1 + 2881) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Add Delay Wait for EoOP of SE2");
    }
    if (*(unsigned char *)(v7 + 1) == 1 && *(_DWORD *)(v7 + 4) == 1)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ModeSetHciNwk:HCI Network is already Enabled");
      if (*(_DWORD *)(a1 + 544)) {
        sub_2259B5C90(a1, 1);
      }
      uint64_t v5 = 0;
    }
    else
    {
      *(_DWORD *)(a1 + 524) = 0;
      int v8 = sub_225A51154(*(void *)(a1 + 3040), **(void **)(a1 + 512), 1u, (uint64_t)sub_2259B5A70, a1);
      if (v8 == 13)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ModeSetHciNwk:Cmd Sent to lower layer");
        uint64_t v5 = 13;
      }
      else
      {
        __int16 v9 = (unsigned int *)(a1 + 19368);
        if (v8 == 111)
        {
          sub_2259A0EAC(1, v9, 4u, 2u, (uint64_t)"phLibNfc_ModeSetHciNwk: NCI returned Busy status");
          uint64_t v5 = 111;
        }
        else
        {
          sub_22599F9EC(1, v9, 4u, 1u, (uint64_t)"phLibNfc_ModeSetHciNwk: Failed to set mode, error");
          uint64_t v5 = 255;
        }
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t v5 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid Context passed from lower layer!");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ModeSetHciNwk");
  return v5;
}

uint64_t sub_225A2FD38(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ModeSetHciNwkProc");
  if (a1)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 2);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != a1);
    if (v6 == a1)
    {
      if (a2)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ModeSetHciNwkProc: Set Mode Failed!");
      }
      else
      {
        if (*(_DWORD *)(a1 + 544)) {
          sub_2259B5C90(a1, 1);
        }
        *(_DWORD *)(*(void *)(a1 + 512) + 12) = *(_DWORD *)(a1 + 524) != 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ModeSetHciNwkProc: Set Mode success");
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ModeSetHciNwkProc");
  return a2;
}

uint64_t sub_225A2FE44(unsigned int *a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t)a1;
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_HciInitComplete");
  if (!v3)
  {
    __int16 v9 = "phLibNfc_HciInitComplete: Invalid LibNfc context received!";
    a2 = 1;
    int v10 = 2;
    uint64_t v11 = 0;
LABEL_9:
    sub_2259A0EAC(v10, v11, 4u, 1u, (uint64_t)v9);
    goto LABEL_17;
  }
  uint64_t v4 = *(void *)(v3 + 464);
  *(_WORD *)(v3 + 704) = 0;
  *(unsigned char *)(v3 + 696) = 0;
  if (!v4)
  {
    uint64_t v11 = (unsigned int *)(v3 + 19368);
    __int16 v9 = "phLibNfc_HciInitComplete: Invalid Hci context received!";
    a2 = 1;
    int v10 = 1;
    goto LABEL_9;
  }
  uint64_t v5 = (unsigned int *)(v3 + 19368);
  if (!a2)
  {
    sub_2259A0EAC(1, (unsigned int *)(v3 + 19368), 4u, 4u, (uint64_t)"Hci network initialization success");
    *(unsigned char *)(v3 + 322) = 2;
    if (*(unsigned char *)(v3 + 2944) == 1)
    {
      a2 = sub_2259E963C(v3);
      if (a2) {
        goto LABEL_20;
      }
      if (*(unsigned char *)(v3 + 504))
      {
        if (*(unsigned char *)(v3 + 505))
        {
          *(_WORD *)(v4 + 832) = 16650;
LABEL_32:
          sub_2259A0EAC(1, v5, 4u, 4u, (uint64_t)"HCI Init Comp- Static feature config");
          a2 = sub_2259EBCD0(v3);
          if (a2 == 13)
          {
            sub_2259A0EAC(1, v5, 4u, 4u, (uint64_t)"phLibNfc_HciInitComplete: Static feature config seq started");
            goto LABEL_17;
          }
          uint64_t v6 = "phLibNfc_HciInitComplete: Static feature config seq failed";
          goto LABEL_5;
        }
        goto LABEL_31;
      }
      if (*(unsigned char *)(v3 + 318) != 1)
      {
        if (*(unsigned char *)(v3 + 505)) {
          goto LABEL_32;
        }
LABEL_31:
        if (*(unsigned char *)(v3 + 317) != 1) {
          goto LABEL_32;
        }
LABEL_21:
        if (*(unsigned char *)(v3 + 2936) == 1 && (uint64_t v13 = sub_225A33D88(v3, 4u), v13 != 255)
          || (uint64_t v13 = sub_225A33D88(v3, 2u), v13 != 255))
        {
          a2 = v13;
          goto LABEL_17;
        }
        if (*(unsigned char *)(v3 + 317) == 2 && *(unsigned char *)(v3 + 318) == 2 && *(unsigned char *)(v3 + 319) == 2) {
          sub_2259A0EAC(1, v5, 4u, 4u, (uint64_t)"phLibNfc_HciInitComplete: UICC, SE2 and eSE are Removed");
        }
        goto LABEL_32;
      }
    }
    a2 = sub_225A33D88(v3, 3u);
LABEL_20:
    if (a2 != 255) {
      goto LABEL_17;
    }
    goto LABEL_21;
  }
  uint64_t v6 = "phLibNfc_HciInitComplete: Hci network initialization FAILED";
LABEL_5:
  sub_2259A0EAC(1, v5, 4u, 1u, (uint64_t)v6);
  if (*(unsigned char *)(v3 + 2883))
  {
    uint64_t v7 = (unsigned int *)v3;
    uint64_t v8 = 137;
  }
  else
  {
    sub_225A30160(v3);
    uint64_t v7 = (unsigned int *)v3;
    uint64_t v8 = 255;
  }
  sub_2259EA938(v7, v8);
  uint64_t v3 = 0;
LABEL_17:
  sub_2259A10B4(2, (unsigned int *)v3, 4u, 5u, (uint64_t)"phLibNfc_HciInitComplete");
  return a2;
}

uint64_t sub_225A300D8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    *(unsigned char *)(a1 + 509) = 0;
  }
  else {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SeReInitSeqComplete: Invalid parameter!");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeReInitSeqComplete");
  return a2;
}

uint64_t sub_225A30160(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDeInit");
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 464);
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + 936);
      if (v3) {
        BOOL v4 = v3 == 0xFFFFFFFFFFFFLL;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4)
      {
        phOsalNfc_Timer_Delete();
        *(void *)(v2 + 936) = 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDeInit:dwHciResendPacketTimerId Deleted");
      }
      *(void *)(v2 + 792) = *(void *)(a1 + 3040);
      sub_2259DA2A4(v2);
      sub_2259DB0C0(v2);
      phOsalNfc_FreeMemory();
      sub_2259E10B0(*(_DWORD *)(a1 + 19368), 0);
      *(void *)(a1 + 464) = 0;
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDeInit:Invalid HCI Context");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_HciDeInit:Invalid LibNfc Context");
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDeInit");
}

uint64_t sub_225A3028C(uint64_t a1)
{
  uint64_t v12 = 0;
  unsigned __int8 v11 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDataSend");
  if (!a1)
  {
    uint64_t v6 = "phLibNfc_HciDataSend: Invalid LibNfc context received!";
    uint64_t v3 = 1;
    int v7 = 2;
    uint64_t v8 = 0;
LABEL_21:
    sub_2259A0EAC(v7, v8, 4u, 1u, (uint64_t)v6);
    goto LABEL_22;
  }
  uint64_t v2 = *(void *)(a1 + 464);
  if (!v2)
  {
    uint64_t v8 = (unsigned int *)(a1 + 19368);
    uint64_t v6 = "phLibNfc_HciDataSend: Invalid Hci context received!";
    uint64_t v3 = 1;
    int v7 = 1;
    goto LABEL_21;
  }
  uint64_t v3 = sub_2259DFE4C(*(void *)(a1 + 464), *(_DWORD *)(a1 + 596), (char *)&v11);
  if (v3 == 147) {
    uint64_t v3 = sub_2259DE984(*(void *)(a1 + 464), 240, &v11);
  }
  sub_22599F9EC(1, (unsigned int *)(v2 + 956), 7u, 4u, (uint64_t)"PIPE ID");
  if (v3 || v11 == 255)
  {
    uint64_t v6 = "phLibNfc_HciDataSend: Failure with phHciNfc_GetPipeId!";
LABEL_20:
    int v7 = 1;
    uint64_t v8 = (unsigned int *)(a1 + 19368);
    goto LABEL_21;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_RegisterForResponses:APDU Pipe");
  LODWORD(v12) = 2;
  BYTE4(v12) = v11;
  sub_2259DE340((unsigned int *)v2, (uint64_t)&v12, (uint64_t)sub_225A3050C, (unsigned int *)v2);
  *(unsigned char *)(v2 + 1236) = 0;
  *(unsigned char *)(v2 + 1232) = 0;
  *(unsigned char *)(a1 + 706) = 0;
  uint64_t v4 = sub_225A306C4(*(void *)(a1 + 464), v11, 16, 1, *(_DWORD *)(a1 + 568), *(void *)(a1 + 560), 0);
  if (v4 != 13)
  {
    uint64_t v3 = v4;
    uint64_t v6 = "phLibNfc_HciDataSend: Failed Status from Lower Layer";
    goto LABEL_20;
  }
  *(void *)(v2 + 184) = sub_225A3617C;
  *(void *)(v2 + 192) = a1;
  unsigned int v5 = *(unsigned __int16 *)(a1 + 708);
  if (v5 < 0x7D0)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 592);
    if (v5 >> 4 < 0x271) {
      unsigned int v5 = 10000;
    }
  }
  *(_DWORD *)(v2 + 852) = v5;
  if (!sub_225A35F34(v2))
  {
    uint64_t v9 = *(void *)(a1 + 464);
    if (!phOsalNfc_Timer_Start()) {
      goto LABEL_13;
    }
    uint64_t v3 = phOsalNfc_Timer_Delete();
    *(void *)(v9 + 840) = 0xFFFFFFFFFFFFLL;
    uint64_t v6 = "phLibNfc_HciDataSend: SE TxRx Timer Start Failed";
    goto LABEL_20;
  }
  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSend: SE TxRx Timer Started with Timeout");
LABEL_13:
  uint64_t v3 = 13;
LABEL_22:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDataSend");
  return v3;
}

uint64_t sub_225A3050C(uint64_t a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessRspsOnApduPipe");
  if (a1)
  {
    if (a3)
    {
      if (!a2)
      {
        uint64_t v6 = *(void *)(a1 + 960);
        if (v6)
        {
          int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyENotConnected received";
          switch(*(unsigned char *)(a3 + 1))
          {
            case 0:
              sub_2259A0EAC(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyOk Not Expected From APDU Pipe");
              break;
            case 1:
              goto LABEL_18;
            case 2:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyECmdParUnknown received";
              goto LABEL_18;
            case 3:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyENok received";
              goto LABEL_18;
            case 4:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyEPipesFull received";
              goto LABEL_18;
            case 5:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyERegParUnknown received";
              goto LABEL_18;
            case 6:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyEPipeNotOpened received";
              goto LABEL_18;
            case 7:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyECmdNotSupported received";
              goto LABEL_18;
            case 8:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyEInhibited received";
              goto LABEL_18;
            case 9:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyETimeout received";
              goto LABEL_18;
            case 0xA:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyERegAccessDenied received";
              goto LABEL_18;
            case 0xB:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyEPipeAccessDenied received";
              goto LABEL_18;
            default:
              int v7 = "phHciNfc_ProcessRspsOnApduPipe:Unknown Response INS received";
LABEL_18:
              sub_2259A0EAC(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)v7);
              sub_225A30838(v6, 255, a3);
              break;
          }
        }
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessRspsOnApduPipe");
}

uint64_t sub_225A306C4(uint64_t a1, char a2, char a3, char a4, int a5, uint64_t a6, uint64_t a7)
{
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_Transceive");
  if (a1 && (uint64_t v14 = *(void *)(a1 + 960)) != 0)
  {
    LOBYTE(v18) = a2;
    BYTE1(v18) = a3;
    BYTE2(v18) = a4;
    *((void *)&v18 + 1) = a6;
    DWORD1(v18) = a5;
    *(unsigned char *)(a1 + 953) = 0;
    if (*(unsigned char *)(v14 + 2944) == 1 || *(unsigned char *)(v14 + 2939) == 1) {
      *(unsigned char *)(a1 + 953) = 1;
    }
    if (a7) {
      uint64_t v15 = sub_2259DDA30;
    }
    else {
      uint64_t v15 = sub_2259DD968;
    }
    uint64_t v16 = sub_2259DA6F8(a1, &v18, (uint64_t)v15, a1);
    if (v16 == 13)
    {
      *(_OWORD *)(a1 + 200) = 0u;
      *(_OWORD *)(a1 + 184) = 0u;
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 956), 7u, 1u, (uint64_t)"phHciNfc_Transceive:Failed Status from Lower layer");
      *(unsigned char *)(a1 + 953) = 0;
    }
  }
  else
  {
    uint64_t v16 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 7u, 1u, (uint64_t)"phHciNfc_Transceive:Invalid HCI Context");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_Transceive");
  return v16;
}

uint64_t sub_225A30838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v21 = 191;
  uint64_t v20 = 0;
  __int16 v19 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDataSendProc");
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 464);
    if (!v6)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciDataSendProc:Invalid HCI Context");
      a2 = 255;
      goto LABEL_37;
    }
    if (a2 == 44) {
      goto LABEL_53;
    }
    uint64_t v8 = &dword_26ABD8410;
    if (!*(_DWORD *)(v6 + 956)) {
      uint64_t v8 = &dword_26ABD8328;
    }
    *v8 &= ~8u;
    if (a2 || !a3 || !*(void *)(a1 + 6296))
    {
LABEL_53:
      if (*(void *)(a1 + 6312))
      {
        sub_225A30D34(a1, a2, a3);
      }
      else
      {
        if (a2 != 65)
        {
          if (a2 == 217 && !a3)
          {
            if (*(_DWORD *)(a1 + 584))
            {
              phOsalNfc_MemCopy();
              *(_DWORD *)(a1 + 584) = 1;
            }
            a2 = 217;
            goto LABEL_31;
          }
          *(_DWORD *)(a1 + 584) = 0;
          unsigned __int8 v11 = (unsigned int *)(a1 + 19368);
          uint64_t v12 = "phLibNfc_HciDataSendProc:Failed Status received from lower layer";
LABEL_30:
          sub_2259A0EAC(1, v11, 4u, 1u, (uint64_t)v12);
          goto LABEL_31;
        }
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:RECOVERY SUCCESS");
      }
    }
    else
    {
      if (*(_WORD *)(a3 + 4) && *(void *)(a3 + 8))
      {
        uint64_t v9 = sub_225A30C6C(a1);
        if (v9 == 111)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:Received valid data");
          if (*(void *)(a1 + 576) && (unsigned int v10 = *(_DWORD *)(a1 + 584)) != 0)
          {
            if (v10 >= *(unsigned __int16 *)(a3 + 4))
            {
              phOsalNfc_MemCopy();
              a2 = 0;
              *(_DWORD *)(a1 + 584) = *(unsigned __int16 *)(a3 + 4);
            }
            else
            {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciDataSendProc:Could not copy entire received data");
              a2 = 8;
            }
          }
          else
          {
            a2 = 0;
          }
          goto LABEL_31;
        }
        a2 = v9;
        uint64_t v12 = "phLibNfc_HciDataSendProc:eSE Transeive received data after Timeout";
        unsigned __int8 v11 = (unsigned int *)(a1 + 19368);
        goto LABEL_30;
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciDataSendProc:Invalid data received!");
      a2 = 255;
    }
LABEL_31:
    uint64_t v13 = *(void *)(v6 + 840);
    if (v13) {
      BOOL v14 = v13 == 0xFFFFFFFFFFFFLL;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(void *)(v6 + 840) = 0xFFFFFFFFFFFFLL;
      *(_DWORD *)(v6 + 852) = 10000;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:SE TxRx Timer Deleted");
    }
    sub_2259DE984(*(void *)(a1 + 464), 240, (unsigned char *)&v19 + 1);
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_UnRegisterCmdRspEvt:APDU Pipe");
    LODWORD(v20) = 2;
    BYTE4(v20) = HIBYTE(v19);
    sub_2259DEA88((unsigned int *)v6, (int *)&v20, (uint64_t)sub_225A3050C);
    unsigned int v15 = sub_2259DA5A8((unsigned int *)v6, v6, HIBYTE(v19));
    sub_225A1A108((unsigned int *)v6, v6, v15);
    *(unsigned char *)(v6 + 953) = 0;
LABEL_37:
    uint64_t v16 = *(void *)(a1 + 512);
    if (v16) {
      sub_225A350B0((unsigned int *)a1, *(_DWORD *)(v16 + 8), a2, (int *)&v21);
    }
    if (*(unsigned char *)(a1 + 2944) != 1 && *(unsigned char *)(a1 + 2939) != 1
      || !sub_225A02A00(*(void *)(a1 + 2952), 20))
    {
      goto LABEL_46;
    }
    if (sub_2259E0AB0(*(void *)(a1 + 19360), &v19))
    {
      a2 = 255;
      int v17 = "phLibNfc_HciDataSendProc-Fialed to retrieve bIgnoreWkUpRet from Util module";
    }
    else
    {
      if ((_BYTE)v19) {
        goto LABEL_46;
      }
      int v17 = "phLibNfc_HciDataSendProc-Fialed to De-Assert Wake Up Line";
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v17);
LABEL_46:
    uint64_t v7 = sub_225A24FAC(*(void *)(a1 + 19360), v21, a2, 0, 0);
    goto LABEL_47;
  }
  sub_2259A0EAC(2, 0, 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:Invalid Lib Context");
  uint64_t v7 = 1;
LABEL_47:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDataSendProc");
  return v7;
}

uint64_t sub_225A30C6C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phHciNfc_CheckTransOnApduPipe");
  if (a1)
  {
    if (*(void *)(a1 + 6296) || *(void *)(a1 + 6312) || *(void *)(a1 + 6536))
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_CheckTransOnApduPipe:eSE Transeive or Get ATR API in progress");
      uint64_t v2 = 111;
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phHciNfc_CheckTransOnApduPipe:Invalid Context");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phHciNfc_CheckTransOnApduPipe");
  return v2;
}

uint64_t sub_225A30D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v16 = 191;
  uint64_t v15 = 0;
  char v14 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciRawDataSendProc");
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 464);
    if (!v6)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciRawDataSendProc:Invalid HCI Context");
      a2 = 255;
      goto LABEL_34;
    }
    if (!a2 && a3)
    {
      if (sub_225A30C6C(a1) != 111)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciDataSendProc:Invalid data received!");
        a2 = 255;
        goto LABEL_28;
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:Received valid data");
      *(_WORD *)(a1 + 632) = *(_WORD *)a3;
      *(unsigned char *)(a1 + 634) = *(unsigned char *)(a3 + 2);
      if (!*(void *)(a1 + 640) || !*(_WORD *)(a1 + 636))
      {
        a2 = 0;
        goto LABEL_28;
      }
      if (*(unsigned __int16 *)(a3 + 4) <= *(unsigned __int16 *)(a1 + 636))
      {
        phOsalNfc_MemCopy();
        a2 = 0;
        *(_WORD *)(a1 + 636) = *(_WORD *)(a3 + 4);
        goto LABEL_28;
      }
      uint64_t v7 = (unsigned int *)(a1 + 19368);
LABEL_18:
      sub_2259A0EAC(1, v7, 4u, 1u, (uint64_t)"phLibNfc_HciRawDataSendProc:Could not copy entire received data");
      a2 = 8;
LABEL_28:
      uint64_t v10 = *(void *)(v6 + 840);
      if (v10) {
        BOOL v11 = v10 == 0xFFFFFFFFFFFFLL;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        phOsalNfc_Timer_Stop();
        phOsalNfc_Timer_Delete();
        *(void *)(v6 + 840) = 0xFFFFFFFFFFFFLL;
        *(_DWORD *)(v6 + 852) = 10000;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:SE TxRx Timer Deleted");
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_UnRegisterCmdRspEvt:APDU Pipe");
      LODWORD(v15) = *(unsigned __int8 *)(a1 + 610);
      BYTE4(v15) = *(unsigned char *)(a1 + 608);
      sub_2259DEA88((unsigned int *)v6, (int *)&v15, (uint64_t)sub_225A3050C);
      *(unsigned char *)(v6 + 953) = 0;
LABEL_34:
      sub_225A350B0((unsigned int *)a1, *(_DWORD *)(*(void *)(a1 + 512) + 8), a2, (int *)&v16);
      if (*(unsigned char *)(a1 + 2944) != 1 && *(unsigned char *)(a1 + 2939) != 1
        || !sub_225A02A00(*(void *)(a1 + 2952), 20))
      {
        goto LABEL_41;
      }
      if (sub_2259E0AB0(*(void *)(a1 + 19360), &v14))
      {
        uint64_t v12 = "phLibNfc_HciRawDataSendProc-Fialed to retrieve bIgnoreWkUpRet from Util module";
      }
      else
      {
        if (v14) {
          goto LABEL_41;
        }
        uint64_t v12 = "phLibNfc_HciRawDataSendProc-Fialed to De-Assert Wake Up Line";
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v12);
LABEL_41:
      uint64_t v8 = sub_225A24FAC(*(void *)(a1 + 19360), v16, a2, 0, 0);
      goto LABEL_42;
    }
    if (a2 != 217)
    {
      *(unsigned char *)(a1 + 634) = 0;
      *(_WORD *)(a1 + 632) = 0;
      *(_WORD *)(a1 + 636) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciRawDataSendProc:Failed Status received from lower layer");
      goto LABEL_28;
    }
    if (a3)
    {
      *(_WORD *)(a1 + 632) = *(_WORD *)a3;
      *(unsigned char *)(a1 + 634) = *(unsigned char *)(a3 + 2);
      if (!*(void *)(a1 + 640) || !*(_WORD *)(a1 + 636)) {
        goto LABEL_27;
      }
      if (*(unsigned __int16 *)(a3 + 4) > *(unsigned __int16 *)(a1 + 636))
      {
        uint64_t v7 = (unsigned int *)(a1 + 19368);
        goto LABEL_18;
      }
      phOsalNfc_MemCopy();
      __int16 v9 = *(_WORD *)(a3 + 4);
    }
    else
    {
      *(unsigned char *)(a1 + 634) = 1;
      *(_WORD *)(a1 + 632) = 8193;
      if (*(unsigned __int16 *)(a1 + 636) < 2u)
      {
LABEL_27:
        a2 = 217;
        goto LABEL_28;
      }
      **(unsigned char **)(a1 + 640) = *(unsigned char *)(v6 + 1232);
      *(unsigned char *)(*(void *)(a1 + 640) + 1) = *(unsigned char *)(v6 + 1236);
      __int16 v9 = 2;
    }
    *(_WORD *)(a1 + 636) = v9;
    goto LABEL_27;
  }
  sub_2259A0EAC(2, 0, 4u, 4u, (uint64_t)"phLibNfc_HciRawDataSendProc:Invalid Lib Context");
  uint64_t v8 = 1;
LABEL_42:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciRawDataSendProc");
  return v8;
}

uint64_t sub_225A31104(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 v10 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyHciRawInfo");
  if (!a1)
  {
    uint64_t v4 = 255;
    goto LABEL_20;
  }
  if (!a2
    || (uint64_t v4 = sub_2259DFE4C(*(void *)(a1 + 464), *((_DWORD *)a2 + 10), (char *)&v10), v4 == 147)
    && ((uint64_t v5 = sub_2259DE984(*(void *)(a1 + 464), 240, &v10), v10 != 25) || (v4 = v5, *a2 != 25)))
  {
    uint64_t v4 = 1;
    goto LABEL_20;
  }
  if (!v4)
  {
    unsigned int v6 = v10;
    if (v10 == 255)
    {
      unsigned int v6 = *a2;
      unsigned __int8 v10 = *a2;
    }
    uint64_t v4 = 1;
    if (v6 <= 0x29 && ((1 << v6) & 0x38002000000) != 0 && a2[2] == 1)
    {
      int v7 = a2[1];
      if (v7 == 65)
      {
        uint64_t v4 = 147;
        if (v6 == 40 || *((_DWORD *)a2 + 10) == 2) {
          goto LABEL_20;
        }
        goto LABEL_24;
      }
      if (v7 != 81 || !*((_DWORD *)a2 + 1) || (uint64_t v8 = (unsigned __int8 *)*((void *)a2 + 1)) == 0)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_VerifyHciRawInfo: Event not supported");
        goto LABEL_20;
      }
      if (*v8 - 1 <= 2)
      {
LABEL_24:
        uint64_t v4 = 0;
        if (*((_DWORD *)a2 + 4) <= 0x7CFu) {
          *((_DWORD *)a2 + 4) = 2000;
        }
      }
    }
  }
LABEL_20:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyHciRawInfo");
  return v4;
}

uint64_t sub_225A312B8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciResponseTimerRestartRequestNtfHandler");
  if (!a1 || a4) {
    goto LABEL_7;
  }
  char v6 = 0;
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = *((void *)&unk_26ABD79B8 + 14 * v7 + 2);
    if (v6) {
      break;
    }
    char v6 = 1;
    uint64_t v7 = 1;
  }
  while (v8 != a1);
  if (v8 != a1) {
    goto LABEL_7;
  }
  uint64_t v10 = *(void *)(a1 + 464);
  if (!v10) {
    goto LABEL_7;
  }
  char v11 = 0;
  uint64_t v12 = 0;
  do
  {
    uint64_t v13 = *((void *)&unk_26ABD79B8 + 14 * v12 + 13);
    if (v11) {
      break;
    }
    char v11 = 1;
    uint64_t v12 = 1;
  }
  while (v13 != v10);
  if (v13 != v10 || *(unsigned char *)(a1 + 444) != 1 || *(unsigned char *)(a1 + 2944) != 1 || *(unsigned char *)(a1 + 2946)) {
    goto LABEL_7;
  }
  unsigned int v14 = *(unsigned __int16 *)(a1 + 708);
  if (v14 < 0x7D0 && (unsigned int v14 = *(_DWORD *)(a1 + 592), v14 >> 4 <= 0x270))
  {
    unsigned int v16 = (uint64_t *)(v10 + 840);
    uint64_t v15 = (_DWORD *)(v10 + 852);
  }
  else
  {
    uint64_t v15 = (_DWORD *)(v10 + 852);
    unsigned int v16 = (uint64_t *)(v10 + 840);
    *(_DWORD *)(v10 + 852) = v14;
    if (v14 > 0xAFC7) {
      goto LABEL_24;
    }
  }
  *uint64_t v15 = 45000;
LABEL_24:
  uint64_t v17 = *v16;
  if (!*v16 || v17 == 0xFFFFFFFFFFFFLL)
  {
    long long v18 = (unsigned int *)(a1 + 19368);
    __int16 v19 = "phLibNfc_HciResponseTimerRestartRequestNtfHandler: SE Transeive Timer Already deleted";
LABEL_29:
    sub_2259A0EAC(1, v18, 4u, 1u, (uint64_t)v19);
    goto LABEL_7;
  }
  sub_225A43EF0(*(_DWORD *)(v10 + 956), v17);
  if (phOsalNfc_Timer_Start())
  {
    phOsalNfc_Timer_Delete();
    *(void *)(v10 + 840) = 0xFFFFFFFFFFFFLL;
    long long v18 = (unsigned int *)(a1 + 19368);
    __int16 v19 = "phLibNfc_HciResponseTimerRestartRequestNtfHandler: SE TxRx Timer Re-Start Failed";
    goto LABEL_29;
  }
  sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciResponseTimerRestartRequestNtfHandler: eSe Transeive Timer restarted,Timeout");
LABEL_7:

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciResponseTimerRestartRequestNtfHandler");
}

uint64_t sub_225A314C0(uint64_t a1)
{
  uint64_t v9 = 0;
  unsigned __int8 v8 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciRawDataSend");
  if (!a1 || (uint64_t v2 = *(void *)(a1 + 464)) == 0)
  {
    uint64_t v4 = 1;
    goto LABEL_15;
  }
  if (!sub_2259DFE4C(*(void *)(a1 + 464), *(_DWORD *)(a1 + 648), (char *)&v8) && v8 != 255) {
    *(unsigned char *)(a1 + 608) = v8;
  }
  *(unsigned char *)(v2 + 1236) = 0;
  *(unsigned char *)(v2 + 1232) = 0;
  *(unsigned char *)(a1 + 706) = 0;
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_RegisterForResponses:APDU Pipe");
  LODWORD(v9) = *(unsigned __int8 *)(a1 + 610);
  BYTE4(v9) = *(unsigned char *)(a1 + 608);
  sub_2259DE340((unsigned int *)v2, (uint64_t)&v9, (uint64_t)sub_225A3050C, (unsigned int *)v2);
  uint64_t v3 = sub_225A306C4(*(void *)(a1 + 464), *(unsigned char *)(a1 + 608), *(unsigned char *)(a1 + 609), *(unsigned char *)(a1 + 610), *(_DWORD *)(a1 + 612), *(void *)(a1 + 616), (uint64_t)sub_2259B5A70);
  if (v3 != 13)
  {
    uint64_t v4 = v3;
    uint64_t v5 = "phLibNfc_HciRawDataSend: Failed Status from Lower Layer";
    goto LABEL_14;
  }
  *(void *)(v2 + 184) = sub_225A3623C;
  *(void *)(v2 + 192) = a1;
  *(_DWORD *)(v2 + 852) = *(_DWORD *)(a1 + 624);
  if (!sub_225A35F34(v2))
  {
    uint64_t v6 = *(void *)(a1 + 464);
    if (!phOsalNfc_Timer_Start()) {
      goto LABEL_9;
    }
    uint64_t v4 = phOsalNfc_Timer_Delete();
    *(void *)(v6 + 840) = 0xFFFFFFFFFFFFLL;
    uint64_t v5 = "phLibNfc_HciRawDataSend: SE TxRx Timer Start Failed";
LABEL_14:
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v5);
    goto LABEL_15;
  }
  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciRawDataSend: SE TxRx Timer Started with Timeout");
LABEL_9:
  uint64_t v4 = 13;
LABEL_15:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciRawDataSend");
  return v4;
}

uint64_t sub_225A316BC(uint64_t a1, int a2, unsigned __int8 *a3)
{
  uint64_t v31 = 0;
  memset(v30, 0, sizeof(v30));
  sub_2259A0FB0(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  if (!a1) {
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  }
  if (a2) {
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  }
  if (!a3) {
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  }
  uint64_t v6 = *(void *)(a1 + 960);
  if (!v6) {
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  }
  unsigned int v7 = a3[1];
  if (v7 > 0x10)
  {
    if (v7 != 17)
    {
      if (v7 != 18) {
        return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
      }
      uint64_t v10 = *(void *)(v6 + 6312);
      if (*(unsigned char *)(v6 + 2944) == 1)
      {
        if (!v10) {
          return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
        }
        int v11 = *(unsigned __int8 *)(a1 + 8);
        if ((v11 + 1) <= 2u) {
          int v11 = *(unsigned __int8 *)(v6 + 608);
        }
        uint64_t v9 = (unsigned int *)(v6 + 19368);
        if (*((_WORD *)a3 + 2) || v11 != *a3)
        {
          unsigned __int8 v8 = "phHciNfc_ProcessEventsOnApduPipe: Unexpected, SE Soft Reset or Event ATR, PipeID";
          goto LABEL_20;
        }
      }
      else
      {
        if (!v10 || *((_WORD *)a3 + 2)) {
          return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
        }
        uint64_t v9 = (unsigned int *)(v6 + 19368);
      }
      sub_2259A0EAC(1, v9, 4u, 4u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe:Soft Reset response received");
      goto LABEL_39;
    }
    sub_2259A0EAC(1, (unsigned int *)(v6 + 19368), 4u, 4u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe:EVENT_WTX_REQ received");
    if (*(void *)(v6 + 6344))
    {
      unsigned int v16 = (unsigned __int8 *)*((void *)a3 + 1);
      if (v16)
      {
        unsigned int v17 = sub_225A31CCC(*(_DWORD *)(v6 + 19368), *v16);
        if (v17 <= 0x7CF) {
          int v18 = v17 + 400;
        }
        else {
          int v18 = v17;
        }
      }
      else
      {
        int v18 = 2000;
      }
      uint64_t v20 = 0;
      *(_DWORD *)(v6 + 656) = v18;
      *(_DWORD *)(a1 + 852) = v18;
      while (*(_DWORD *)(v6 + v20 + 352) != 1)
      {
        v20 += 16;
        if (v20 == 80)
        {
          uint64_t v21 = 0;
          goto LABEL_50;
        }
      }
      uint64_t v21 = *(void *)(v6 + v20 + 344);
LABEL_50:
      sub_2259A2E90(1, (unsigned int *)(v6 + 19368), 7u, 4u, (uint64_t)"ProcessEventsOnApduPipe :EvtWtxCb[WTX Ntf]");
      (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(v6 + 6344))(*(void *)(v6 + 19360), *(void *)(v6 + 6352), v21, v6 + 656, 74);
      uint64_t v22 = *(void *)(a1 + 840);
      if (!v22 || v22 == 0xFFFFFFFFFFFFLL)
      {
        sub_2259A0EAC(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: SE Transeive Timer Already deleted");
        BOOL v23 = "phHciNfc_ProcessEventsOnApduPipe: SE Transeive user provided timeout should be incremented";
LABEL_55:
        sub_2259A0EAC(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)v23);
        return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
      }
      sub_225A43EF0(*(_DWORD *)(a1 + 956), v22);
      if (phOsalNfc_Timer_Start())
      {
        phOsalNfc_Timer_Delete();
        *(void *)(a1 + 840) = 0xFFFFFFFFFFFFLL;
        BOOL v23 = "phLibNfc_HciDataSend: SE TxRx Timer Start Failed";
        goto LABEL_55;
      }
      __int16 v19 = "phHciNfc_ProcessEventsOnApduPipe:                                        eSe Transeive Timer restarted with "
            "WTX timeout value";
    }
    else
    {
      __int16 v19 = "phHciNfc_ProcessEventsOnApduPipe:WTX Call Back not defined by App";
    }
    sub_2259A0EAC(1, (unsigned int *)(v6 + 19368), 4u, 4u, (uint64_t)v19);
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  }
  if (v7 == 2)
  {
    if (*(unsigned char *)(v6 + 2944) != 1)
    {
      sub_22599F9EC(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: Ignoring eSE OS Reset, PipeID");
      return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
    }
    int v14 = *(unsigned __int8 *)(a1 + 8);
    if (*(void *)(v6 + 6312))
    {
      if (v14 == 1) {
        int v14 = *(unsigned __int8 *)(a1 + 1232);
      }
      if ((v14 + 1) <= 1u) {
        int v14 = *(unsigned __int8 *)(v6 + 608);
      }
      uint64_t v15 = (unsigned int *)(v6 + 19368);
      if (v14 == *a3)
      {
        if (*(unsigned char *)(v6 + 609) == 65)
        {
          sub_22599F9EC(1, (unsigned int *)(v6 + 19368), 4u, 4u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: OS Reset Success,PipeID");
          goto LABEL_39;
        }
        uint64_t v27 = "phHciNfc_ProcessEventsOnApduPipe: OS Reset Received,PipeID";
        int v26 = (unsigned int *)(v6 + 19368);
LABEL_66:
        sub_22599F9EC(1, v26, 4u, 2u, (uint64_t)v27);
        sub_225A55320(*(void *)(v6 + 3040), 1);
        uint64_t v12 = v6;
        uint64_t v13 = 217;
        goto LABEL_40;
      }
      if (*(void *)(v6 + 6696))
      {
        sub_22599F9EC(1, (unsigned int *)(v6 + 19368), 4u, 2u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: SE OS Reset (SE-raw transceive), PipeID");
        phOsalNfc_SetMemory();
        LODWORD(v31) = sub_2259DFD70(*v15, *a3);
        unsigned int v28 = "ProcessEventsOnApduPipe:pSeListenerNtfCb[OS Reset Ntf during Warm reset]";
LABEL_71:
        sub_2259A2E90(1, v15, 4u, 4u, (uint64_t)v28);
        (*(void (**)(void, void, uint64_t, void, _OWORD *, uint64_t))(v6 + 6696))(*(void *)(v6 + 19360), *(void *)(v6 + 6704), 27, *(void *)(v6 + 392), v30, 217);
        return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
      }
      uint64_t v29 = "phHciNfc_ProcessEventsOnApduPipe:Droping as SE NTF Handler is not registered, PipeID";
    }
    else
    {
      int v25 = *a3;
      if (*(void *)(v6 + 6296) && v14 == v25)
      {
        int v26 = (unsigned int *)(v6 + 19368);
        uint64_t v27 = "phHciNfc_ProcessEventsOnApduPipe: OS Reset (SE-transceive),PipeID";
        goto LABEL_66;
      }
      if (*(void *)(v6 + 6536) && v14 == v25)
      {
        sub_22599F9EC(1, (unsigned int *)(v6 + 19368), 4u, 2u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: OS Reset (SE Get ATR),PipeID");
        sub_225A55320(*(void *)(v6 + 3040), 1);
        sub_225A348DC(v6, 217, (uint64_t)a3);
        return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
      }
      uint64_t v15 = (unsigned int *)(v6 + 19368);
      if (*(void *)(v6 + 6696))
      {
        sub_22599F9EC(1, (unsigned int *)(v6 + 19368), 4u, 2u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: Independent SE OS Reset, PipeID");
        phOsalNfc_SetMemory();
        LODWORD(v31) = sub_2259DFD70(*v15, *a3);
        unsigned int v28 = "ProcessEventsOnApduPipe:pSeListenerNtfCb[OS Reset Ntf]";
        goto LABEL_71;
      }
      uint64_t v29 = "phHciNfc_ProcessEventsOnApduPipe: Ignoring SE OS Reset, PipeID";
    }
    sub_22599F9EC(1, v15, 4u, 2u, (uint64_t)v29);
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  }
  if (v7 == 16)
  {
    if (*(void *)(v6 + 6312) && (*(unsigned __int8 *)(v6 + 609) | 0x10) == 0x51)
    {
      sub_22599F9EC(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: Undesired Data Packet received, PipeID");
      sub_22599F9EC(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"pReceivedParams->bIns");
      sub_22599F9EC(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"pReceivedParams->bMsgType");
      unsigned __int8 v8 = "pReceivedParams->wLen";
      uint64_t v9 = (unsigned int *)(v6 + 19368);
LABEL_20:
      sub_22599F9EC(1, v9, 4u, 1u, (uint64_t)v8);
      uint64_t v12 = v6;
      uint64_t v13 = 255;
LABEL_40:
      sub_225A30838(v12, v13, (uint64_t)a3);
      return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
    }
LABEL_39:
    uint64_t v12 = v6;
    uint64_t v13 = 0;
    goto LABEL_40;
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
}

uint64_t sub_225A31CCC(unsigned int a1, unsigned int a2)
{
  unsigned int v5 = a1;
  sub_2259A0FB0(1, &v5, 7u, 5u, (uint64_t)"phHciNfc_CalcWtxTimeout");
  uint64_t v3 = (float)((float)((float)sub_225A31D80(v5, 2u, a2 >> 4) / 10.0) * 1000.0);
  sub_22599F9EC(1, &v5, 7u, 4u, (uint64_t)"phHciNfc_CalcWtxTimeout:WTX Timeout");
  sub_2259A10B4(1, &v5, 7u, 5u, (uint64_t)"phHciNfc_CalcWtxTimeout");
  return v3;
}

uint64_t sub_225A31D80(unsigned int a1, unsigned int a2, int a3)
{
  unsigned int v13 = a1;
  uint64_t v5 = 1;
  sub_2259A0FB0(1, &v13, 7u, 5u, (uint64_t)"phHciNfc_CalcPower");
  if (a3)
  {
    int v6 = 0;
    uint32x4_t v7 = (uint32x4_t)vdupq_n_s32(a3 - 1);
    int32x4_t v8 = vdupq_n_s32(a2);
    v9.i64[0] = 0x100000001;
    v9.i64[1] = 0x100000001;
    do
    {
      int8x16_t v10 = (int8x16_t)v9;
      int32x4_t v9 = vmulq_s32(v9, v8);
      v6 += 4;
    }
    while (((a3 + 3) & 0x1FFFC) != v6);
    int8x16_t v11 = vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v6 - 4), (int8x16_t)xmmword_225A5FBA0), v7), v10, (int8x16_t)v9);
    *(int32x2_t *)v11.i8 = vmul_s32(*(int32x2_t *)v11.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
    uint64_t v5 = (v11.i32[0] * v11.i32[1]);
  }
  sub_2259A10B4(1, &v13, 7u, 5u, (uint64_t)"phHciNfc_CalcPower");
  return v5;
}

uint64_t sub_225A31E5C(uint64_t a1, int a2)
{
  uint64_t v6 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_RegisterForEvents");
  if (*(unsigned __int8 *)(a1 + 816) == a2
    || *(unsigned __int8 *)(a1 + 820) == a2
    || *(unsigned __int8 *)(a1 + 824) == a2
    || *(unsigned __int8 *)(a1 + 828) == a2)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 956), 4u, 4u, (uint64_t)"phHciNfc_RegisterForEvents:APDU Pipe");
    LODWORD(v6) = 1;
    BYTE4(v6) = a2;
    uint64_t v4 = sub_225A316BC;
  }
  else
  {
    if (*(unsigned __int8 *)(a1 + 818) != a2
      && *(unsigned __int8 *)(a1 + 822) != a2
      && *(unsigned __int8 *)(a1 + 826) != a2
      && *(unsigned __int8 *)(a1 + 830) != a2
      && !*(unsigned char *)(a1 + 832)
      && !*(unsigned char *)(a1 + 834))
    {
      sub_22599F8E0(1, (unsigned int *)(a1 + 956), 7u, 1u, (uint64_t)"No registerations done for PipeId");
      return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_RegisterForEvents");
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 956), 4u, 4u, (uint64_t)"phHciNfc_RegisterForEvents:Connectivity Pipe");
    LODWORD(v6) = 1;
    BYTE4(v6) = a2;
    uint64_t v4 = sub_2259DF918;
  }
  sub_2259DE340((unsigned int *)a1, (uint64_t)&v6, (uint64_t)v4, (unsigned int *)a1);
  return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_RegisterForEvents");
}

uint64_t sub_225A31FE0(unsigned int *a1)
{
  sub_2259A0FB0(2, a1, 7u, 5u, (uint64_t)"phLibNfc_PrintHciCritInfo");
  if (a1)
  {
    sub_22599F8E0(1, a1 + 239, 4u, 1u, (uint64_t)"HCI pHciContext->bResendPacket =");
    sub_22599F8E0(1, a1 + 239, 4u, 1u, (uint64_t)"HCI Resend Info,bMsgType =");
    sub_22599F8E0(1, a1 + 239, 4u, 1u, (uint64_t)"HCI Resend Info,bPipeId =");
    sub_22599F8E0(1, a1 + 239, 4u, 1u, (uint64_t)"HCI Resend Info,bIns =");
    sub_22599F8E0(1, a1 + 239, 4u, 1u, (uint64_t)"HCI aSEPipeList[0].bGateId =");
    sub_22599F8E0(1, a1 + 239, 4u, 1u, (uint64_t)"HCI aSEPipeList[0].bPipeId =");
    sub_22599F8E0(1, a1 + 239, 4u, 1u, (uint64_t)"HCI aSEPipeList[1].bGateId =");
    sub_22599F8E0(1, a1 + 239, 4u, 1u, (uint64_t)"HCI aSEPipeList[1].bPipeId =");
  }

  return sub_2259A10B4(2, a1, 7u, 5u, (uint64_t)"phLibNfc_PrintHciCritInfo");
}

uint64_t sub_225A3214C(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SysEoOpNtfHandler");
  if (a1)
  {
    if (a3)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SysEoOpNtfHandler: Received EoOP");
      if (*(void *)a3)
      {
        if (a3[2])
        {
          sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UpdateEoOP");
          int v5 = **(unsigned __int8 **)a3;
          if (v5 == 192)
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RXD eSE EOP");
            *(unsigned char *)(a1 + 504) = 1;
            if (!*(unsigned char *)(*(void *)a3 + 1)) {
              sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"P61 EVT ATR wait status");
            }
          }
          else if (v5 == 129 && *(unsigned char *)(a1 + 2936) == 1)
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RXD SE2 EOP");
            *(unsigned char *)(a1 + 506) = 1;
          }
          else if (v5 == 2)
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RXD UICC EOP");
            *(unsigned char *)(a1 + 505) = 1;
          }
          else
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_UpdateEoOP: Invalid EoOP received");
          }
          sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UpdateEoOP");
          sub_2259EC558(a1);
        }
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SysEoOpNtfHandler");
}

uint64_t sub_225A32320(unsigned int *a1, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int8 v20 = 0;
  sub_2259A0FB0(2, a1, 7u, 5u, (uint64_t)"phHciNfc_ReceiveHandler");
  if (!a1 || !a2)
  {
    int32x4_t v8 = "phHciNfc_ReceiveHandler:Failed, Invalid Context or Rxd Params";
    int v9 = 2;
    int8x16_t v10 = a1;
LABEL_8:
    sub_2259A0EAC(v9, v10, 7u, 1u, (uint64_t)v8);
    return sub_2259A10B4(2, a1, 7u, 5u, (uint64_t)"phHciNfc_ReceiveHandler");
  }
  int v6 = a2[2];
  if (v6 == 2)
  {
    uint64_t v7 = (uint64_t)(a1 + 90);
    goto LABEL_10;
  }
  if (v6 == 1)
  {
    uint64_t v7 = (uint64_t)(a1 + 126);
    int v11 = 12;
    goto LABEL_12;
  }
  if (a2[2])
  {
    sub_2259A0EAC(1, a1 + 239, 7u, 1u, (uint64_t)"phHciNfc_ReceiveHandler:Failed, Invalid HCI bMsgType received");
    int32x4_t v8 = "phHciNfc_ReceiveHandler:Failed, List Empty";
    int v9 = 1;
    int8x16_t v10 = a1 + 239;
    goto LABEL_8;
  }
  uint64_t v7 = (uint64_t)(a1 + 54);
LABEL_10:
  int v11 = 6;
LABEL_12:
  if (sub_2259DEF84(a1, v7, v11, *a2, &v20)
    || (unsigned int v12 = v20,
        uint64_t v13 = v7 + 24 * v20,
        (int v14 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *))(v13 + 16)) == 0))
  {
    sub_2259A0EAC(1, a1 + 239, 7u, 2u, (uint64_t)"phHciNfc_ReceiveHandler:Failed, Invalid Pipe Id rxd");
  }
  else
  {
    uint64_t v15 = v7 + 24 * v20;
    uint64_t v18 = *(void *)(v15 + 8);
    unsigned int v17 = (void *)(v15 + 8);
    uint64_t v16 = v18;
    if (a2[2] == 2)
    {
      *(unsigned char *)uint64_t v13 = 0;
      *(unsigned char *)(v7 + 24 * v12 + 1) = 0;
      *unsigned int v17 = 0;
      v17[1] = 0;
    }
    v14(v16, a3, a2);
  }
  return sub_2259A10B4(2, a1, 7u, 5u, (uint64_t)"phHciNfc_ReceiveHandler");
}

uint64_t sub_225A324A8(unsigned __int8 *a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetPowerModeSeq");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    int v6 = (unsigned __int8 *)*((void *)&unk_26ABD79B8 + 14 * v5 + 2);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    if (!a2)
    {
      unsigned __int8 v8 = a1[2];
      int v9 = (v8 & a1[1]);
      a1[1] &= v8;
      if (*a1 == v9)
      {
        a2 = 0;
        a1[2] = 1;
      }
      else if ((a1[2937] == 1 || a1[2938] == 1 || a1[2944] == 1) {
             && *((_DWORD *)a1 + 787) == 2
      }
             && v9 == 1
             && (a1[6024] & 3) == 3)
      {
        a2 = 0;
      }
      else
      {
        a2 = sub_225A51404(*((void *)a1 + 380), v9, (uint64_t)sub_2259B5A70, (uint64_t)a1);
        if (a2 == 13)
        {
          int v10 = *(_DWORD *)(*((void *)a1 + 64) + 8);
          if (v10 == 1)
          {
            a1[504] = 0;
          }
          else if (a1[2936] == 1)
          {
            if (v10 == 2)
            {
              a1[505] = 0;
            }
            else if (v10 == 7)
            {
              a1[506] = 0;
            }
          }
          a2 = 13;
        }
      }
    }
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid Context passed from lower layer!");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetPowerModeSeq");
  return a2;
}

uint64_t sub_225A32654(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetPowerModeSeqEnd");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 2);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    unsigned __int8 v8 = (unsigned int *)(a1 + 19368);
    if (a2)
    {
      sub_2259A0EAC(1, v8, 4u, 1u, (uint64_t)"Set Power Mode Failed!");
    }
    else
    {
      sub_2259A0EAC(1, v8, 4u, 4u, (uint64_t)"Set Power Mode success");
      int v9 = *(unsigned __int8 *)(a1 + 1);
      *(unsigned char *)a1 = v9;
      *(unsigned char *)(a1 + 1) = v9 == 0;
      *(unsigned char *)(a1 + 2) = 1;
    }
  }
  else
  {
LABEL_6:
    a2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetPowerModeSeqEnd");
  return a2;
}

uint64_t sub_225A3275C(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetModeSeq");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 2);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    if (!a2)
    {
      *(unsigned char *)(a1 + 2881) = 0;
      *(_DWORD *)(a1 + 544) = 0;
      a2 = sub_225A51154(*(void *)(a1 + 3040), **(void **)(a1 + 512), *(_DWORD *)(a1 + 520), (uint64_t)sub_2259B5A70, a1);
      if (a2 == 13)
      {
        int v8 = *(_DWORD *)(*(void *)(a1 + 512) + 8);
        if (v8 == 1)
        {
          *(unsigned char *)(a1 + 504) = 0;
        }
        else if (*(unsigned char *)(a1 + 2936) == 1)
        {
          if (v8 == 2)
          {
            *(unsigned char *)(a1 + 505) = 0;
          }
          else if (v8 == 7)
          {
            *(unsigned char *)(a1 + 506) = 0;
          }
        }
        a2 = 13;
      }
    }
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid Context passed from lower layer!");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetModeSeq");
  return a2;
}

uint64_t sub_225A3289C(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetModeSeqEnd");
  if (a1)
  {
    char v6 = 0;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = *((void *)&unk_26ABD79B8 + 14 * v7 + 2);
      if (v6) {
        break;
      }
      char v6 = 1;
      uint64_t v7 = 1;
    }
    while (v8 != a1);
    if (v8 == a1)
    {
      int v9 = (unsigned int *)(a1 + 19368);
      if (a2)
      {
        sub_2259A0EAC(1, v9, 4u, 1u, (uint64_t)"Set Se Mode Failed!");
      }
      else
      {
        sub_2259A0EAC(1, v9, 4u, 4u, (uint64_t)"Set Se Mode success");
        if (a3) {
          int v11 = *a3;
        }
        else {
          int v11 = 0;
        }
        int v12 = *(_DWORD *)(a1 + 520);
        if (v12)
        {
          if (v12 == 1)
          {
            a2 = 0;
            switch(*(_DWORD *)(*(void *)(a1 + 512) + 8))
            {
              case 1:
                uint64_t v13 = *(void *)(a1 + 464);
                if (v13) {
                  sub_2259DA498(v13);
                }
                a2 = 0;
                *(unsigned char *)(a1 + 504) = 1;
                *(unsigned char *)(a1 + 318) = 1;
                break;
              case 2:
                a2 = 0;
                *(unsigned char *)(a1 + 505) = 1;
                *(unsigned char *)(a1 + 317) = 1;
                break;
              case 5:
                break;
              case 7:
                a2 = 0;
                *(unsigned char *)(a1 + 506) = 1;
                *(unsigned char *)(a1 + 319) = 1;
                break;
              default:
                goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
            a2 = 255;
          }
        }
        else
        {
          a2 = 0;
          *(_DWORD *)(a1 + 528) = v11;
        }
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetModeSeqEnd");
  return a2;
}

uint64_t sub_225A32A50(uint64_t a1, uint64_t a2)
{
  unsigned int v9 = 235;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeModeSeqComplete");
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = *(void *)(a1 + 536);
      if (v4 && v4 != 0xFFFFFFFFFFFFLL)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"SeModeSet/DelayForSE Ntf timer is still active, stopping and deleting the same");
        phOsalNfc_Timer_Stop();
        phOsalNfc_Timer_Delete();
        *(void *)(a1 + 536) = 0xFFFFFFFFFFFFLL;
      }
      if (a2 == 67 || a2 == 81 || a2 == 143) {
        a2 = a2;
      }
      else {
        a2 = 255;
      }
      uint64_t v7 = *(void *)(a1 + 512);
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 512);
      *(_DWORD *)(v7 + 12) = *(_DWORD *)(a1 + 524);
    }
    *(unsigned char *)(a1 + 697) = 0;
    sub_225A350B0((unsigned int *)a1, *(_DWORD *)(v7 + 8), a2, (int *)&v9);
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v9, a2, 0, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid input parameter!");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeModeSeqComplete");
  return a2;
}

uint64_t sub_225A32BA8(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSePowerCycleSetModeSeqEnd");
  if (a1)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 2);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != a1);
    if (v6 == a1)
    {
      uint64_t v7 = (unsigned int *)(a1 + 19368);
      if (a2)
      {
        sub_2259A0EAC(1, v7, 4u, 1u, (uint64_t)"Set Se Mode Failed!");
      }
      else
      {
        sub_2259A0EAC(1, v7, 4u, 4u, (uint64_t)"Set Se Mode success");
        *(unsigned char *)(a1 + 1) = 0;
        *(_DWORD *)(a1 + 520) = 1;
        *(unsigned char *)(a1 + 2881) = 0;
        *(_DWORD *)(a1 + 544) = 4000;
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSePowerCycleSetModeSeqEnd");
  return a2;
}

uint64_t sub_225A32CA4(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2 != 143 && a2 != 81)
    {
      if (a2)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"eSE Power Cycle Sequence Failed !!");
        a2 = 66;
      }
      else
      {
        *(_DWORD *)(a1 + 404) = 2;
        *(unsigned char *)(a1 + 318) = 3;
        sub_225A25EDC(*(void *)(a1 + 19360), 1u, 3);
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"eSE Power Cycle Sequence Success !!");
        a2 = 65;
      }
    }
    sub_225A25C78(*(void *)(a1 + 19360), 0);
    sub_225A33CA0(a1, a2);
    *(unsigned char *)(a1 + 507) = 0;
    if (a2 == 66) {
      *(_DWORD *)(a1 + 404) = 4;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid input parameter!");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSePowerCycleSeqComplete");
  return a2;
}

uint64_t sub_225A32DD4(uint64_t a1)
{
  __int16 v5 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlCmd");
  if (a1)
  {
    if (*(unsigned char *)(a1 + 2936) == 1
      || *(unsigned char *)(a1 + 2937) == 1
      || *(unsigned char *)(a1 + 2938) == 1
      || *(unsigned char *)(a1 + 2944) == 1)
    {
      LOBYTE(v5) = *(unsigned char *)(a1 + 323);
      unsigned int v2 = 1;
    }
    else
    {
      unsigned int v2 = 0;
    }
    *(unsigned char *)((unint64_t)&v5 | v2) = *(_DWORD *)(a1 + 480);
    uint64_t v3 = sub_2259FEE2C(*(void *)(a1 + 3040), (uint64_t)&v5, v2 + 1, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v3 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid Libnc context !!");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlCmd");
  return v3;
}

uint64_t sub_225A32EE4(unsigned int *a1, uint64_t a2)
{
  if (a2) {
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"SVDD Config Failed");
  }
  else {
    sub_2259A0EAC(2, a1, 4u, 4u, (uint64_t)"SVDD Config Success");
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlResp");
  return a2;
}

uint64_t sub_225A32F84(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlSeqComplete");
  if (a1)
  {
    char v4 = (unsigned int *)(a1 + 19368);
    if (a2)
    {
      sub_2259A0EAC(1, v4, 4u, 1u, (uint64_t)"phLibNfc_SeSvddCtrlSeqComplete: Se SVDDD failed");
      uint64_t v5 = 146;
    }
    else
    {
      sub_2259A0EAC(1, v4, 4u, 4u, (uint64_t)"phLibNfc_SeSvddCtrlSeqComplete: Se SVDDD Success");
      uint64_t v5 = 145;
    }
    uint64_t v6 = sub_225A24FAC(*(void *)(a1 + 19360), v5, a2, 0, 0);
  }
  else
  {
    uint64_t v6 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlSeqComplete");
  return v6;
}

uint64_t sub_225A33050(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VirtualeSeRecoveryComp");
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = 66;
    }
    else
    {
      if (*(_DWORD *)(a1 + 700) == 2) {
        int v5 = 3;
      }
      else {
        int v5 = 2;
      }
      *(_DWORD *)(a1 + 404) = 2 * (*(_DWORD *)(a1 + 700) == 2);
      sub_225A25EDC(*(void *)(a1 + 19360), 1u, v5);
      *(unsigned char *)(a1 + 318) = 1;
      uint64_t v4 = 65;
    }
    if (*(void *)(a1 + 6536) || *(void *)(a1 + 6296) || *(void *)(a1 + 6312))
    {
      sub_225A33CA0(a1, v4);
    }
    else
    {
      uint64_t v7 = *(void (**)(void, uint64_t, uint64_t, void, void, uint64_t))(a1 + 6696);
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 6704);
        sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_VirtualeSeRecoveryComp :EvtESERemoved");
        v7(*(void *)(a1 + 19360), v8, 16, *(void *)(a1 + 392), 0, v4);
      }
    }
    if (a2) {
      *(_DWORD *)(a1 + 404) = 4;
    }
    *(unsigned char *)(a1 + 507) = 0;
    sub_225A25C78(*(void *)(a1 + 19360), 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VirtualeSeRecoveryComp");
  return a2;
}

uint64_t sub_225A33190(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfg");
  if (a1) {
    uint64_t v2 = sub_225A52F04(*(void *)(a1 + 3040), a1 + 3560, (uint64_t)sub_2259B5A70, a1);
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfg");
  return v2;
}

uint64_t sub_225A3321C(unsigned int *a1, uint64_t a2)
{
  if (!a1) {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SeGetRfCfgProc: Invalid input parameter");
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfgProc");
  return a2;
}

uint64_t sub_225A3329C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfgSeqComplete");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid LibNfc context passed by lower layer");
    sub_225A430B8(0xFFu);
    phOsalNfc_RaiseException();
    goto LABEL_5;
  }
  uint64_t v6 = a2;
  if (a2) {
    goto LABEL_3;
  }
  if (!a3)
  {
    a2 = 0;
    uint64_t v6 = 255;
    goto LABEL_3;
  }
  if ((*(unsigned char *)(a3 + 5) & 0x20) == 0)
  {
LABEL_8:
    uint64_t v6 = 0;
    a2 = 255;
LABEL_3:
    sub_225A24FAC(*(void *)(a1 + 19360), 146, a2, 0, 0);
    a2 = v6;
    goto LABEL_5;
  }
  if ((*(_WORD *)(a3 + 1144) & 0x200) != 0)
  {
    uint64_t v8 = (unsigned char *)(a3 + 1177);
  }
  else if ((*(_WORD *)(a3 + 1144) & 0x400) != 0)
  {
    uint64_t v8 = (unsigned char *)(a3 + 1246);
  }
  else
  {
    if ((*(_WORD *)(a3 + 1144) & 0x100) == 0) {
      goto LABEL_8;
    }
    uint64_t v8 = (unsigned char *)(a3 + 1315);
  }
  uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
  uint64_t v10 = (uint64_t)Memory;
  *uint64_t Memory = *v8;
  Memory[1] = v8[1];
  Memory[2] = v8[2];
  for (uint64_t i = 3; i != 13; ++i)
    Memory[i] = v8[i];
  Memory[13] = v8[13];
  Memory[14] = v8[14];
  Memory[15] = v8[15];
  Memory[16] = v8[16];
  for (uint64_t j = 17; j != 32; ++j)
    Memory[j] = v8[j];
  Memory[32] = v8[32];
  Memory[33] = v8[33];
  Memory[34] = v8[34];
  for (uint64_t k = 35; k != 38; ++k)
    Memory[k] = v8[k];
  Memory[38] = v8[38];
  Memory[39] = v8[39];
  Memory[40] = v8[40];
  for (uint64_t m = 41; m != 45; ++m)
    Memory[m] = v8[m];
  Memory[45] = v8[45];
  for (uint64_t n = 46; n != 50; ++n)
    Memory[n] = v8[n];
  Memory[50] = v8[50];
  for (iuint64_t i = 51; ii != 66; ++ii)
    Memory[ii] = v8[ii];
  do
  {
    Memory[ii] = v8[ii];
    ++ii;
  }
  while (ii != 69);
  uint64_t v20 = *(void *)(a1 + 19360);
  sub_2259A0FB0(0, (unsigned int *)&v20, 4u, 5u, (uint64_t)"phLibNfc_DisplaySeRFParameters");
  sub_2259A0EAC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"RF Technology A parameters");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"PipeStatusCeA ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bModeCeA ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bUidRegSizeCeA ");
  for (juint64_t j = 3; jj != 13; ++jj)
    sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aUidRegCeA ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bSakCeA ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQACeA[0] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQACeA[1] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bApplicationDataSizeCeA ");
  for (kuint64_t k = 17; kk != 32; ++kk)
    sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aApplicationDataCeA ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bFWI_SFGICeA ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bCidSupportCeA ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bCltSupportCeA ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeA[0] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeA[1] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeA[2] ");
  sub_2259A0EAC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"RF Technology B parameters");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bPipeStatusCeB ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bModeCeB ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aPupiRegCeB[0] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aPupiRegCeB[1] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aPupiRegCeB[2] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aPupiRegCeB[3] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bAfiCeB ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQBCeB[0] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQBCeB[1] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQBCeB[2] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQBCeB[3] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bHighLayerRspSizeCeB ");
  for (muint64_t m = 51; mm != 66; ++mm)
    sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aHighLayerRspCeB ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeB[0] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeB[1] ");
  sub_22599F9EC(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeB[2] ");
  sub_2259A10B4(0, (unsigned int *)&v20, 4u, 5u, (uint64_t)"phLibNfc_DisplaySeRFParameters");
  sub_225A24FAC(*(void *)(a1 + 19360), 145, 0, v10, 0);
  phOsalNfc_FreeMemory();
  a2 = 0;
LABEL_5:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfgSeqComplete");
  return a2;
}

uint64_t sub_225A339D0(uint64_t a1, unsigned __int8 *a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UpdateNfceeDiscTechnType");
  if (a2)
  {
    unsigned int v4 = *a2;
    if (*a2)
    {
      uint64_t v5 = 0;
      for (unint64_t i = 0; i < v4; ++i)
      {
        uint64_t v7 = *((void *)a2 + 1);
        if (*(unsigned __int8 *)(v7 + v5) <= 1u)
        {
          int v8 = *(_DWORD *)(v7 + v5 + 4);
          if (v8 <= 127)
          {
            if (!v8)
            {
              char v9 = 1;
              uint64_t v10 = "phLibNfc_UpdateNfceeDiscTechnType: poll Nfc-A tech supp";
              goto LABEL_16;
            }
            if (v8 == 1)
            {
              char v9 = 2;
              uint64_t v10 = "phLibNfc_UpdateNfceeDiscTechnType: poll Nfc-B tech supp";
              goto LABEL_16;
            }
          }
          else
          {
            switch(v8)
            {
              case 128:
                char v9 = 1;
                uint64_t v10 = "phLibNfc_UpdateNfceeDiscTechnType: Listen Nfc-A tech supp";
                goto LABEL_16;
              case 130:
                char v9 = 4;
                uint64_t v10 = "phLibNfc_UpdateNfceeDiscTechnType: Listen Nfc-F tech supp";
                goto LABEL_16;
              case 129:
                char v9 = 2;
                uint64_t v10 = "phLibNfc_UpdateNfceeDiscTechnType: Listen Nfc-B tech supp";
LABEL_16:
                *(unsigned char *)(a1 + 313) |= v9;
                sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v10);
                unsigned int v4 = *a2;
                break;
            }
          }
        }
        v5 += 12;
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UpdateNfceeDiscTechnType");
}

uint64_t sub_225A33B4C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MuxCheckAbortTrans");
  if (*(void *)(a1 + 6744) || *(void *)(a1 + 6760))
  {
    sub_225A55320(*(void *)(a1 + 3040), 3);
    uint64_t v2 = *(void (**)(void, uint64_t, uint64_t))(a1 + 6744);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 6752);
      *(void *)(a1 + 6744) = 0;
      *(void *)(a1 + 6752) = 0;
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 31, (uint64_t)"phLibNfc_MuxCheckAbortTrans", (uint64_t)"phLibNfc_MuxCheckAbortTrans", 0);
      v2(*(void *)(a1 + 19360), v3, 255);
    }
    else
    {
      unsigned int v4 = *(void (**)(void, uint64_t, void, uint64_t))(a1 + 6760);
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 6768);
        *(void *)(a1 + 6760) = 0;
        *(void *)(a1 + 6768) = 0;
        sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 30, (uint64_t)"phLibNfc_MuxCheckAbortTrans", (uint64_t)"phLibNfc_MuxCheckAbortTrans", 0);
        v4(*(void *)(a1 + 19360), v5, 0, 255);
      }
    }
  }
  if (*(void *)(a1 + 6296) || *(void *)(a1 + 6536) || *(void *)(a1 + 6312)) {
    sub_225A55320(*(void *)(a1 + 3040), 3);
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MuxCheckAbortTrans");
}

uint64_t sub_225A33CA0(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phHciNfc_ProcessSERemovedNtf");
  if (*(void *)(a1 + 6536))
  {
    sub_225A348DC(a1, a2, 0);
    if (a2 != 65) {
      goto LABEL_10;
    }
    unsigned int v4 = "Rxd eSE Removed Ntf, eSE Get ATR CB Invoked";
  }
  else if (*(void *)(a1 + 6296) || *(void *)(a1 + 6312))
  {
    sub_225A30838(a1, a2, 0);
    if (a2 != 65) {
      goto LABEL_10;
    }
    unsigned int v4 = "phLibNfc_UpdateSeInfo:Rxd eSE Removed Ntf, eSE Transeive CB Invoked";
  }
  else
  {
    unsigned int v4 = "phLibNfc_UpdateSeInfo:No Upper layer Invoked";
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v4);
LABEL_10:

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phHciNfc_ProcessSERemovedNtf");
}

uint64_t sub_225A33D88(uint64_t a1, unsigned int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LaunchChildDeviceSequence");
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + a2 + 315) == 2) {
      goto LABEL_10;
    }
    uint64_t v4 = a1 + 16 * a2;
    if (!*(void *)(v4 + 344)) {
      goto LABEL_10;
    }
    *(_DWORD *)(a1 + 544) = 100;
    *(unsigned char *)(a1 + 2881) = 10;
    *(unsigned char *)(a1 + 322) = 1;
    *(void *)(a1 + 512) = v4 + 344;
    int v5 = *(_DWORD *)(v4 + 352);
    if (v5 == 2)
    {
      uint64_t v6 = off_26B6090B8;
      uint64_t v7 = "UICC Sequence";
    }
    else if (v5 == 7)
    {
      uint64_t v6 = off_26B6090F8;
      uint64_t v7 = "SE2 Sequence";
    }
    else
    {
      uint64_t v6 = off_26B609138;
      uint64_t v7 = "eSE Sequence";
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v7);
    *(void *)(a1 + 2912) = v6;
    *(unsigned char *)(a1 + 2904) = 0;
    *(unsigned char *)(a1 + 2906) = 0;
    uint64_t v13 = *v6;
    if (*v6)
    {
      LOBYTE(v13) = 0;
      int v14 = (uint64_t *)(v6 + 2);
      do
      {
        LOBYTE(v13) = (_BYTE)v13 + 1;
        uint64_t v15 = *v14;
        v14 += 2;
      }
      while (v15);
    }
    *(unsigned char *)(a1 + 2905) = (_BYTE)v13;
    if (sub_2259B528C(a1, 0, 0) == 13)
    {
      sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_LaunchChildDeviceSequence:Started for SE Type");
      uint64_t v11 = 13;
      goto LABEL_11;
    }
    int v8 = "phLibNfc_LaunchChildDeviceSequence:Could not start!";
    int v9 = 1;
    uint64_t v10 = (unsigned int *)(a1 + 19368);
  }
  else
  {
    int v8 = "phLibNfc_LaunchChildDeviceSequence:Invalid LibContext or HCI Network ID Passed";
    int v9 = 2;
    uint64_t v10 = (unsigned int *)a1;
  }
  sub_2259A0EAC(v9, v10, 4u, 1u, (uint64_t)v8);
LABEL_10:
  uint64_t v11 = 255;
LABEL_11:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LaunchChildDeviceSequence");
  return v11;
}

uint64_t sub_225A33F44(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  uint64_t result = sub_2259D730C(2, (unsigned int *)a2, a1, 4u, 4u, (uint64_t)"phLibNfc_eSEVasNtfTimeOutCb", (uint64_t)"Timeout:dwVasNtfTimer", 0);
  if (a2)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 2);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != a2);
    if (v6 == a2)
    {
      phOsalNfc_SetMemory();
      uint64_t v7 = *(void *)(a2 + 720);
      if (v7 && v7 != 0xFFFFFFFFFFFFLL)
      {
        phOsalNfc_Timer_Delete();
        *(void *)(a2 + 720) = 0xFFFFFFFFFFFFLL;
      }
      LODWORD(v9[0]) = *(_DWORD *)(a2 + 1360);
      *(_DWORD *)(a2 + 1360) = 6;
      phOsalNfc_SetMemory();
      uint64_t result = phOsalNfc_SetMemory();
      *(unsigned char *)(a2 + 1401) = 0;
      int v8 = *(uint64_t (**)(void, void, uint64_t, void, _OWORD *, void))(a2 + 6696);
      if (v8) {
        return v8(*(void *)(a2 + 19360), *(void *)(a2 + 6704), 24, *(void *)(a2 + 392), v9, 0);
      }
    }
  }
  return result;
}

uint64_t sub_225A340F8(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetSeRmvdReasonCode");
  if (a2)
  {
    uint64_t v6 = *(unsigned __int8 *)(a3 + 24);
    if (*(unsigned char *)(a3 + 24))
    {
      uint64_t v7 = (unsigned char *)(a3 + 52);
      while (*((_DWORD *)v7 - 5) != 160 || *((_DWORD *)v7 - 4) != 1)
      {
        v7 += 24;
        if (!--v6) {
          goto LABEL_9;
        }
      }
      *(_DWORD *)a2 = *((_DWORD *)v7 - 1);
      *(unsigned char *)(a2 + 4) = *v7;
    }
  }
LABEL_9:

  return sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetSeRmvdReasonCode");
}

uint64_t sub_225A341B4(unsigned int *a1, int a2, int a3, int *a4)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeTransEvent");
  if (a4)
  {
    switch(a3)
    {
      case 0:
        int v8 = a2 - 1;
        if (a2 - 1) < 7 && ((0x53u >> v8))
        {
          int v9 = &unk_225A5FBDC;
          goto LABEL_12;
        }
        break;
      case 1:
        int v8 = a2 - 1;
        if (a2 - 1) < 7 && ((0x53u >> v8))
        {
          int v9 = &unk_225A5FBC0;
LABEL_12:
          int v10 = v9[v8];
          goto LABEL_19;
        }
        break;
      case 2:
        if (a2 == 1)
        {
          int v10 = 168;
          goto LABEL_19;
        }
        if (a2 == 7)
        {
          int v10 = 183;
          goto LABEL_19;
        }
        break;
      case 4:
        if (a2 == 1)
        {
          int v10 = 165;
          goto LABEL_19;
        }
        break;
      default:
        if (a2 == 1 && a3 == 3)
        {
          int v10 = 166;
LABEL_19:
          *a4 = v10;
        }
        break;
    }
  }

  return sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeTransEvent");
}

uint64_t sub_225A34304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v19 = -1;
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_2259A0FB0(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  if (!a1) {
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  }
  uint64_t v5 = *(void *)(a1 + 960);
  if (!v5) {
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  }
  if (!a3)
  {
    uint64_t v7 = (unsigned int *)(v5 + 19368);
    int v8 = "phLibNfc_OsResetRcvd_AdminPipe: pReceivedParams Invalid";
    goto LABEL_12;
  }
  if (!*(void *)(a3 + 8) || !*(_WORD *)(a3 + 4))
  {
    uint64_t v7 = (unsigned int *)(v5 + 19368);
    int v8 = "phLibNfc_OsResetRcvd_AdminPipe: SE OS Reset, Pipe Info error";
LABEL_12:
    sub_2259A0EAC(1, v7, 4u, 1u, (uint64_t)v8);
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  }
  if (*(unsigned char *)(v5 + 2944) != 1)
  {
    sub_22599F9EC(1, (unsigned int *)(v5 + 19368), 4u, 2u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe: Ignoring eSE OS Reset, PipeID on Admin Pipe");
    return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  }
  BOOL v6 = *(unsigned __int8 *)(a1 + 1235) == 1;
  if (*(void *)(v5 + 6312))
  {
    sub_2259DFE4C(a1, *(_DWORD *)(v5 + 648), (char *)&v19);
    if (v19 == 255) {
      unsigned __int8 v19 = *(unsigned char *)(v5 + 608);
    }
    goto LABEL_20;
  }
  if (*(void *)(v5 + 6296))
  {
    int v10 = *(_DWORD *)(v5 + 596);
    uint64_t v11 = a1;
LABEL_19:
    sub_2259DFE4C(v11, v10, (char *)&v19);
    goto LABEL_20;
  }
  if (*(void *)(v5 + 6536))
  {
    uint64_t v11 = a1;
    int v10 = 0;
    goto LABEL_19;
  }
LABEL_20:
  int v12 = v19;
  *(unsigned char *)(a1 + 1232) = v19;
  unsigned int v13 = **(unsigned __int8 **)(a3 + 8);
  *(unsigned char *)(a1 + v6 + 1233) = v13;
  if (*(unsigned __int16 *)(a3 + 4) < 2u) {
    char v14 = -1;
  }
  else {
    char v14 = *(unsigned char *)(*(void *)(a3 + 8) + 1);
  }
  uint64_t v15 = (unsigned __int8 *)(a1 + v6 + 1233);
  *(unsigned char *)(a1 + 1236) = v14;
  if (v13 == v12 && (*(void *)(v5 + 6296) || *(void *)(v5 + 6312) || *(void *)(v5 + 6536)))
  {
    sub_2259A0EAC(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Aborting HCI Data");
    sub_225A55320(*(void *)(v5 + 3040), 1);
    unsigned int v13 = *v15;
    int v16 = v19;
  }
  else
  {
    int v16 = 255;
    unsigned __int8 v19 = -1;
  }
  if (v13 != v16)
  {
    if (*(void *)(v5 + 6696))
    {
      phOsalNfc_SetMemory();
      LODWORD(v17[0]) = sub_2259DFD70(*(_DWORD *)(v5 + 19368), *v15);
      BYTE4(v17[0]) = *(unsigned char *)(a1 + 1236);
      sub_22599F9EC(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Invoke SE-listner Ntf CB with Os Reset, PipeID");
      sub_2259A2E90(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"OsResetRcvd_AdminPipe:pSeListenerNtfCb[OS Reset Ntf]");
      (*(void (**)(void, void, uint64_t, void, _OWORD *, uint64_t))(v5 + 6696))(*(void *)(v5 + 19360), *(void *)(v5 + 6704), 27, *(void *)(v5 + 392), v17, 217);
    }
    else if (*(void *)(v5 + 6056) && *(void *)(v5 + 6568))
    {
      LODWORD(v17[0]) = sub_2259DFD70(*(_DWORD *)(v5 + 19368), v13);
      BYTE4(v17[0]) = *(unsigned char *)(a1 + 1236);
      sub_22599F9EC(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Invoke General Ntf CB with Os Reset (during Init), PipeID");
      sub_2259A2E90(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"OsResetRcvd_AdminPipe:pGenericNtfCb[OS Reset Ntf During Init]");
      (*(void (**)(void, void, uint64_t, _OWORD *))(v5 + 6568))(*(void *)(v5 + 19360), *(void *)(v5 + 6576), 217, v17);
    }
  }
  sub_22599F9EC(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Sending through admin pipe, os_reset_Acknowledgement for OS with pipeid");
  sub_2259D7054(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Sending through admin pipe, os_reset_Acknowledgement for OS @");
  if (sub_225A306C4(a1, *(unsigned char *)a3, 12, 1, 1, (uint64_t)v15, (uint64_t)sub_2259B5A70) == 13)
  {
    *(unsigned char *)(a1 + 1235) = 1;
    *(void *)(a1 + 184) = sub_225A34784;
    *(void *)(a1 + 192) = v5;
  }
  else
  {
    sub_22599F9EC(1, (unsigned int *)(v5 + 19368), 4u, 2u, (uint64_t)"Sending os_reset_Acknowledgement failed for OS with pipeid");
    if (*(unsigned __int8 *)(a1 + 1232) == *v15)
    {
      if (*(void *)(v5 + 6296) || *(void *)(v5 + 6312))
      {
        sub_2259A0EAC(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Invoke Transcv Response CB");
        sub_225A30838(v5, 217, 0);
      }
      else if (*(void *)(v5 + 6536))
      {
        sub_2259A0EAC(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Invoke Get Atr Response CB");
        sub_225A348DC(v5, 217, 0);
      }
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
}

uint64_t sub_225A34784(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeOsResetRsp_SendCb");
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 464);
    if (v4)
    {
      sub_2259D7054(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SeOsResetRsp_SendCb rcvd pdata @");
      *(unsigned char *)(v4 + 1235) = 0;
      if (a2)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"SeSendCb: Call back received with sttus != success");
      }
      else
      {
        BOOL v6 = *(unsigned __int8 **)(v4 + 16);
        if (v6 && *(unsigned __int8 *)(v4 + 1232) == *v6)
        {
          if (*(void *)(a1 + 6296) || *(void *)(a1 + 6312))
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Invoke Transcv Response CB");
            sub_225A30838(a1, 217, 0);
          }
          else if (*(void *)(a1 + 6536))
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Invoke Get Atr Response CB");
            sub_225A348DC(a1, 217, 0);
          }
        }
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeOsResetRsp_SendCb");
}

uint64_t sub_225A348DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSE_GetAtrProc");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_eSE_GetAtrProc: LibNfc context invalid");
    goto LABEL_42;
  }
  uint64_t v6 = *(void *)(a1 + 464);
  if (!v6) {
    goto LABEL_13;
  }
  uint64_t v7 = *(void *)(v6 + 856);
  if (v7) {
    BOOL v8 = v7 == 0xFFFFFFFFFFFFLL;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    phOsalNfc_Timer_Stop();
    phOsalNfc_Timer_Delete();
    *(void *)(v6 + 856) = 0xFFFFFFFFFFFFLL;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:SE Get Atr Timer Deleted");
  }
  uint64_t v9 = *(void *)(v6 + 872);
  if (!v9 || v9 == 0xFFFFFFFFFFFFLL)
  {
LABEL_13:
    if (a2) {
      goto LABEL_22;
    }
  }
  else
  {
    phOsalNfc_Timer_Stop();
    phOsalNfc_Timer_Delete();
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_HciCmdRspCb : HCI Command Response timer deleted successfully");
    *(_DWORD *)(v6 + 884) = 2000;
    *(void *)(v6 + 872) = 0xFFFFFFFFFFFFLL;
    if (a2) {
      goto LABEL_22;
    }
  }
  if (a3)
  {
    if (*(void *)(a1 + 464))
    {
      uint64_t v11 = sub_225A30C6C(a1);
      if (v11 == 111)
      {
        uint64_t v12 = *(void *)(a1 + 552);
        if (v12 && (unsigned int v13 = *(unsigned __int16 *)(a3 + 4), *(_DWORD *)(v12 + 8) >= v13))
        {
          *(_DWORD *)(v12 + 8) = v13;
          phOsalNfc_MemCopy();
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_eSE_GetAtrProc: Sucessfull");
          a2 = 0;
          uint64_t v14 = 192;
        }
        else
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_eSE_GetAtrProc: Invalid Input Buffer Length");
          uint64_t v14 = 193;
          a2 = 3;
        }
      }
      else
      {
        a2 = v11;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_eSE_GetAtrProc:eSE Get Atr received data after Timeout!!!");
        uint64_t v14 = 193;
      }
      goto LABEL_41;
    }
    unsigned int v17 = (unsigned int *)(a1 + 19368);
    uint64_t v18 = "phLibNfc_eSE_GetAtrProc: Invalid Hci context received!";
    goto LABEL_36;
  }
LABEL_22:
  uint64_t v15 = *(void *)(a1 + 552);
  if (v15) {
    *(_DWORD *)(v15 + 8) = 0;
  }
  uint64_t v14 = 193;
  if ((int)a2 <= 216)
  {
    if ((a2 - 65) < 2 || a2 == 214) {
      goto LABEL_41;
    }
    goto LABEL_35;
  }
  if (a2 != 218)
  {
    if (a2 == 217)
    {
      if (v15)
      {
        if (v6) {
          char v16 = *(unsigned char *)(v6 + 1236);
        }
        else {
          char v16 = -1;
        }
        *(unsigned char *)(v15 + 12) = v16;
      }
      a2 = 217;
      goto LABEL_41;
    }
LABEL_35:
    unsigned int v17 = (unsigned int *)(a1 + 19368);
    uint64_t v18 = "phLibNfc_eSE_GetAtrProc: Received FAILED status or pInfo Invalid";
LABEL_36:
    sub_2259A0EAC(1, v17, 4u, 1u, (uint64_t)v18);
    uint64_t v14 = 193;
    a2 = 255;
  }
LABEL_41:
  sub_225A24FAC(*(void *)(a1 + 19360), v14, a2, 0, 0);
LABEL_42:

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSE_GetAtrProc");
}

uint64_t sub_225A34BAC(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciEvtEndofOptRcvd");
  if (a1)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HciEvtEndofOptRcvd: Evt End Of Operation received");
    *(unsigned char *)(a1 + 504) = 1;
    uint64_t v2 = *(void *)(a1 + 536);
    if (v2 && v2 != 0xFFFFFFFFFFFFLL && *(_DWORD *)(a1 + 544) == 4000)
    {
      phOsalNfc_Timer_Stop();
      sub_2259D730C(1, (unsigned int *)(a1 + 19368), v2, 4u, 4u, (uint64_t)"phLibNfc_HciEvtEndofOptRcvd", (uint64_t)"hModeSetTimerId", 0);
      phOsalNfc_Timer_Delete();
      *(void *)(a1 + 536) = 0xFFFFFFFFFFFFLL;
      *(_DWORD *)(a1 + 544) = 0;
      *(unsigned char *)(a1 + 2881) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HciEvtEndofOptRcvd: SE Mode Set timer, stopping the timer");
      sub_2259B528C(a1, 0, 0);
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"HciEvtEndofOptRcvd: Fast ntf received and dropped");
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciEvtEndofOptRcvd");
}

uint64_t sub_225A34D08(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_InvokeSeNtfCallback");
  if (a1)
  {
    uint64_t v10 = *(void *)(a1 + 960);
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      do
      {
        if (*(unsigned __int8 *)(a1 + 832) == a4 && *(_DWORD *)(v10 + v11 + 352) == 2
          || (*(unsigned __int8 *)(a1 + 816) == a4 || *(unsigned __int8 *)(a1 + 818) == a4)
          && *(_DWORD *)(v10 + v11 + 352) == 1)
        {
          uint64_t v12 = *(void *)(v10 + v11 + 344);
        }
        v11 += 16;
      }
      while (v11 != 80);
      if (a2 && *(void *)(v10 + 6696))
      {
        sub_2259A2E90(1, (unsigned int *)(v10 + 19368), 4u, 4u, (uint64_t)"InvokeSeNtfCallback :HCI Events");
        (*(void (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 6696))(*(void *)(v10 + 19360), *(void *)(v10 + 6704), a5, v12, a2, a3);
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_InvokeSeNtfCallback");
}

uint64_t sub_225A34E4C(uint64_t a1, int a2, unsigned __int8 *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyRxdRtngTable");
  if (a1 && !a2 && a3)
  {
    if (*a3 != *(unsigned __int8 *)(a1 + 312)) {
      goto LABEL_28;
    }
    uint64_t v6 = *(void *)(a1 + 328);
    sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"VerifyRoutingTable");
    if (!v6) {
      goto LABEL_24;
    }
    uint64_t v7 = 0;
    LODWORD(v8) = *a3;
LABEL_7:
    if (v8)
    {
      unint64_t v9 = 0;
      uint64_t v10 = v6;
      do
      {
        uint64_t v11 = *((void *)a3 + 1);
        unsigned int v12 = *(_DWORD *)(v11 + 32 * v7);
        if (v12 == *(_DWORD *)v10)
        {
          if (v12 == 2)
          {
            if (*(unsigned __int8 *)(v11 + 32 * v7 + 28) == *(unsigned __int8 *)(v10 + 28)
              && !phOsalNfc_MemCompare())
            {
              uint64_t v14 = *((void *)a3 + 1) + 32 * v7;
              if (*(unsigned __int8 *)(v14 + 4) == *(unsigned __int8 *)(v10 + 4)
                && ((*(unsigned char *)(v10 + 8) ^ *(unsigned char *)(v14 + 8)) & 7) == 0)
              {
                LODWORD(v8) = *a3;
LABEL_23:
                if (++v7 >= (unint64_t)v8)
                {
LABEL_24:
                  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"VerifyRoutingTable");
                  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_VerifyRxdRtngTable: Routing Table configuration Success");
                  goto LABEL_26;
                }
                goto LABEL_7;
              }
            }
          }
          else if (v12 <= 1)
          {
            uint64_t v13 = v11 + 32 * v7;
            if (*(_DWORD *)(v13 + 12) == *(_DWORD *)(v10 + 12)
              && *(unsigned __int8 *)(v13 + 4) == *(unsigned __int8 *)(v10 + 4)
              && ((*(unsigned char *)(v10 + 8) ^ *(unsigned char *)(v11 + 32 * v7 + 8)) & 7) == 0)
            {
              goto LABEL_23;
            }
          }
        }
        ++v9;
        unint64_t v8 = *a3;
        v10 += 32;
      }
      while (v9 < v8);
    }
    sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"VerifyRoutingTable");
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_VerifyRxdRtngTable: Routing Table configuration failed");
LABEL_28:
    uint64_t v15 = 255;
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_VerifyRxdRtngTable: Routing Table configuration failed");
LABEL_26:
    uint64_t v15 = 0;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyRxdRtngTable");
  return v15;
}

uint64_t sub_225A350B0(unsigned int *a1, int a2, int a3, int *a4)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeIntEvent");
  if (a4)
  {
    *a4 = 235;
    switch(a2)
    {
      case 1:
        BOOL v8 = a3 == 0;
        int v9 = 192;
        goto LABEL_7;
      case 2:
        BOOL v8 = a3 == 0;
        int v9 = 196;
        goto LABEL_7;
      case 5:
        BOOL v8 = a3 == 0;
        int v9 = 188;
        goto LABEL_7;
      case 7:
        BOOL v8 = a3 == 0;
        int v9 = 200;
LABEL_7:
        if (!v8) {
          ++v9;
        }
        *a4 = v9;
        break;
      default:
        break;
    }
  }

  return sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeIntEvent");
}

uint64_t sub_225A351B0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_InitCompleteWdTimer");
  if (!a1) {
    goto LABEL_6;
  }
  char v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = *((void *)&unk_26ABD79B8 + 14 * v3 + 2);
    if (v2) {
      break;
    }
    char v2 = 1;
    uint64_t v3 = 1;
  }
  while (v4 != a1);
  if (v4 != a1)
  {
LABEL_6:
    uint64_t v5 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid LibNfc context passed");
    goto LABEL_16;
  }
  uint64_t v6 = phOsalNfc_Timer_Create();
  if (v6) {
    BOOL v7 = v6 == 0xFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to create Timer!");
LABEL_15:
    uint64_t v5 = 255;
    goto LABEL_16;
  }
  uint64_t v8 = v6;
  if (phOsalNfc_Timer_Start())
  {
    phOsalNfc_Timer_Delete();
    *(void *)(a1 + 2888) = 0;
    goto LABEL_15;
  }
  sub_2259D730C(1, (unsigned int *)(a1 + 19368), v8, 4u, 4u, (uint64_t)"phLibNfc_InitCompleteWdTimer", (uint64_t)"dwInitWdTimerId", 1);
  uint64_t v5 = 0;
  if (*(_DWORD *)(a1 + 19368)) {
    uint64_t v11 = &dword_26ABD8410;
  }
  else {
    uint64_t v11 = &dword_26ABD8328;
  }
  v11[1] &= ~0x2000000u;
  *(void *)(a1 + 2888) = v8;
  *(unsigned char *)(a1 + 2880) = 8;
LABEL_16:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_InitCompleteWdTimer");
  return v5;
}

uint64_t sub_225A35360(uint64_t a1, unsigned int *a2)
{
  char v2 = a2;
  sub_2259D730C(2, a2, a1, 4u, 4u, (uint64_t)"phLibNfc_InitCompleteWdTimerCb", (uint64_t)"Timeout:dwInitWdTimerId", 0);
  sub_2259A0FB0(2, v2, 4u, 5u, (uint64_t)"phLibNfc_InitCompleteWdTimerCb");
  if (v2)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = (unsigned int *)*((void *)&unk_26ABD79B8 + 14 * v5 + 2);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != v2);
    if (v6 == v2)
    {
      if (*((unsigned char *)v2 + 2880))
      {
        sub_2259A0EAC(1, v2 + 4842, 4u, 4u, (uint64_t)"\n\nTimer expired: Restarting timer");
        sub_225A43EF0(v2[4842], a1);
        if (phOsalNfc_Timer_Start())
        {
          sub_2259A0EAC(1, v2 + 4842, 4u, 2u, (uint64_t)"\n\nTimer expired: Failed to restarting timer");
          if (a1 && a1 != 0xFFFFFFFFFFFFLL)
          {
            phOsalNfc_Timer_Stop();
            phOsalNfc_Timer_Delete();
            *((void *)v2 + 361) = 0xFFFFFFFFFFFFLL;
          }
        }
        else
        {
          uint64_t v13 = &dword_26ABD8410;
          if (!v2[4842]) {
            uint64_t v13 = &dword_26ABD8328;
          }
          v13[1] &= ~0x2000000u;
          sub_2259D730C(1, v2 + 4842, a1, 4u, 4u, (uint64_t)"phLibNfc_InitCompleteWdTimerCb", (uint64_t)"dwInitWdTimerId", 1);
          --*((unsigned char *)v2 + 2880);
          sub_22599F8E0(1, v2 + 4842, 4u, 4u, (uint64_t)"\n\nTimer Count");
        }
      }
      else
      {
        char v8 = sub_2259EB1A8(v2, *((void *)v2 + 364));
        if (v2[4842]) {
          int v9 = &dword_26ABD8410;
        }
        else {
          int v9 = &dword_26ABD8328;
        }
        int v10 = v9[1] | 0x2000000;
        int *v9 = *v9 & 0xFFFE003F | ((v8 & 0x3F) << 11) | ((v2[726] & 0x1F) << 6);
        v9[1] = v10;
        sub_2259A0EAC(1, v2 + 4842, 4u, 2u, (uint64_t)"\n\nTimer expired: Timer restart count reached limit");
        if (a1 && a1 != 0xFFFFFFFFFFFFLL)
        {
          phOsalNfc_Timer_Stop();
          phOsalNfc_Timer_Delete();
          *((void *)v2 + 361) = 0xFFFFFFFFFFFFLL;
        }
        sub_2259DA2A4(*((void *)v2 + 58));
        uint64_t v11 = *((void *)v2 + 67);
        if (v11 && v11 != 0xFFFFFFFFFFFFLL)
        {
          sub_2259A0EAC(1, v2 + 4842, 4u, 4u, (uint64_t)"SeModeSet/DelayForSE Ntf timer is still active, stopping and deleting the same");
          phOsalNfc_Timer_Stop();
          phOsalNfc_Timer_Delete();
          *((void *)v2 + 67) = 0xFFFFFFFFFFFFLL;
        }
        *((unsigned char *)v2 + 2881) = 0;
        v2[136] = 0;
        if (*((unsigned char *)v2 + 2883) == 1) {
          uint64_t v12 = 137;
        }
        else {
          uint64_t v12 = 255;
        }
        sub_2259EA938(v2, v12);
        char v2 = 0;
      }
    }
  }

  return sub_2259A10B4(2, v2, 4u, 5u, (uint64_t)"phLibNfc_InitCompleteWdTimerCb");
}

uint64_t sub_225A35678(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  bzero(v7, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SwpIntfControl");
  if (a1)
  {
    v7[1] = 0x2000;
    BOOL v2 = *(unsigned char *)(a1 + 2946) == 0;
    if (*(unsigned char *)(a1 + 2946)) {
      char v3 = 4;
    }
    else {
      char v3 = 5;
    }
    char v8 = v3;
    int v4 = *(_DWORD *)(a1 + 440);
    char v9 = v2 & v4;
    BOOL v11 = (v4 & 2) != 0;
    char v10 = 0;
    uint64_t v5 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)v7, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v5 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SwpIntfControl");
  return v5;
}

uint64_t sub_225A35784(unsigned int *a1)
{
  return 0;
}

uint64_t sub_225A357E0(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DelayForSeNtf");
  if (a1 && !a2)
  {
    if (*(unsigned char *)(a1 + 704) == 1 && (*(_DWORD *)(a1 + 440) & 0xB) == 2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_DelayForSeNtf: Do not start the InitModeSet Timer, returning SUCCESS\n");
      a2 = 0;
      *(unsigned char *)(a1 + 704) = 0;
    }
    else if (*(_DWORD *)(a1 + 544))
    {
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"DelayForSeNtf: Delay Timer(ms) ");
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"DelayForSeNtf: Timer Count");
      uint64_t v4 = phOsalNfc_Timer_Create();
      a2 = 12;
      if (v4)
      {
        uint64_t v5 = v4;
        if (v4 != 0xFFFFFFFFFFFFLL)
        {
          if (phOsalNfc_Timer_Start())
          {
            phOsalNfc_Timer_Delete();
            a2 = 255;
          }
          else
          {
            sub_2259D730C(1, (unsigned int *)(a1 + 19368), v5, 4u, 4u, (uint64_t)"phLibNfc_DelayForSeNtf", (uint64_t)"hModeSetTimerId", 1);
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"DelayForSeNtf: Timer started");
            *(void *)(a1 + 536) = v5;
            *(unsigned char *)(a1 + 705) = 1;
            a2 = 13;
          }
        }
      }
    }
    else
    {
      a2 = 0;
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DelayForSeNtf");
  return a2;
}

uint64_t sub_225A359A4(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DelayForSeNtfProc");
  uint64_t v4 = 0;
  if (a1 && !a2)
  {
    *(unsigned char *)(a1 + 705) = 0;
    if (*(unsigned char *)(a1 + 2881))
    {
      sub_2259B5E14(a1, *(void *)(a1 + 2912), 2u);
    }
    else
    {
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HCI NWK Delay Timer(ms) Expired");
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Timer Count");
    }
    if (*(unsigned char *)(a1 + 508) == 1)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Session Id is not retrieved in 10 tries ");
      *(unsigned char *)(a1 + 508) = 0;
      uint64_t v4 = 255;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DelayForSeNtfProc");
  return v4;
}

uint64_t sub_225A35ABC(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeModeSeq");
  if (a1)
  {
    *(_DWORD *)(a1 + 544) = 0;
    *(unsigned char *)(a1 + 2881) = 0;
    uint64_t v2 = *(void *)(a1 + 344);
    if (v2 && *(_DWORD *)(a1 + 356) != 1)
    {
      uint64_t v3 = sub_225A51154(*(void *)(a1 + 3040), v2, 0, (uint64_t)sub_2259B5A70, a1);
      if (v3 != 13) {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Disable Nfcee mode failed!");
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeModeSeq");
  return v3;
}

uint64_t sub_225A35B94(unsigned int *a1, uint64_t a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeModeSeqEnd");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = (unsigned int *)*((void *)&unk_26ABD79B8 + 14 * v5 + 2);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    if (a2 != 143 && a2 != 81)
    {
      char v8 = a1 + 4842;
      if (a2)
      {
        sub_2259A0EAC(1, v8, 4u, 1u, (uint64_t)"Set Nfcee mode Failed!");
      }
      else
      {
        sub_2259A0EAC(1, v8, 4u, 4u, (uint64_t)"Set Nfcee mode success!");
        unsigned int v9 = a1[130];
        if (v9 == 1)
        {
          a2 = 0;
          a1[89] = 0;
          goto LABEL_7;
        }
        if (!v9)
        {
          a2 = 0;
          a1[89] = 1;
          goto LABEL_7;
        }
      }
      a2 = 0;
    }
  }
  else
  {
LABEL_6:
    a2 = 255;
  }
LABEL_7:
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeModeSeqEnd");
  return a2;
}

uint64_t sub_225A35CB4(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phHciNfc_eSEGetAtrTimeOutCb");
  sub_2259A0EAC(2, (unsigned int *)a2, 4u, 1u, (uint64_t)"******HCI SE Get Atr Timer Expired********");
  if (!a2) {
    goto LABEL_6;
  }
  char v3 = 0;
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = *((void *)&unk_26ABD79B8 + 14 * v4 + 2);
    if (v3) {
      break;
    }
    char v3 = 1;
    uint64_t v4 = 1;
  }
  while (v5 != a2);
  if (v5 == a2)
  {
    uint64_t v6 = *(void *)(a2 + 464);
    if (v6)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(void *)(v6 + 856) = 0xFFFFFFFFFFFFLL;
      if (*(void *)(v6 + 152))
      {
        sub_2259A0EAC(1, (unsigned int *)(v6 + 956), 7u, 4u, (uint64_t)"phHciNfc_eSEGetAtrTimeOutCb: Releasing memory");
        if (*(void *)(*(void *)(v6 + 152) + 8))
        {
          phOsalNfc_FreeMemory();
          *(void *)(*(void *)(v6 + 152) + 8) = 0;
        }
        phOsalNfc_FreeMemory();
        *(void *)(v6 + 152) = 0;
      }
    }
    uint64_t v7 = *(void *)(a2 + 552);
    if (v7)
    {
      *(void *)uint64_t v7 = 0;
      *(_DWORD *)(v7 + 8) = 0;
    }
    if (*(_DWORD *)(a2 + 19368)) {
      char v8 = &dword_26ABD8410;
    }
    else {
      char v8 = &dword_26ABD8328;
    }
    *v8 |= 8u;
    if (*(unsigned char *)(a2 + 706))
    {
      *(unsigned char *)(a2 + 706) = 0;
      uint64_t v9 = a2;
      uint64_t v10 = 218;
    }
    else
    {
      uint64_t v9 = a2;
      uint64_t v10 = 44;
    }
    sub_225A348DC(v9, v10, 0);
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a2, 4u, 1u, (uint64_t)"phHciNfc_eSEGetAtrTimeOutCb:Invalid Context");
  }

  return sub_2259A10B4(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phHciNfc_eSEGetAtrTimeOutCb");
}

uint64_t sub_225A35E74(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_CreateSEGetAtrTimer");
  uint64_t v2 = phOsalNfc_Timer_Create();
  *(void *)(a1 + 856) = v2;
  if (v2 == 0xFFFFFFFFFFFFLL || v2 == 0)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 956), 4u, 1u, (uint64_t)"HCI SE Get Atr Timer Create failed");
    uint64_t v4 = 12;
  }
  else
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 956), 4u, 4u, (uint64_t)"HCI SE Get Atr Timer Created Successfully");
    uint64_t v4 = 0;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_CreateSEGetAtrTimer");
  return v4;
}

uint64_t sub_225A35F34(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_CreateSETranseiveTimer");
  uint64_t v2 = phOsalNfc_Timer_Create();
  *(void *)(a1 + 840) = v2;
  if (v2 == 0xFFFFFFFFFFFFLL || v2 == 0)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 956), 4u, 1u, (uint64_t)"HCI SE TxRx Timer Create failed");
    uint64_t v4 = 12;
  }
  else
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 956), 4u, 4u, (uint64_t)"HCI SE TxRx Timer Created Successfully");
    uint64_t v4 = 0;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_CreateSETranseiveTimer");
  return v4;
}

uint64_t sub_225A35FF4(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phHciNfc_eSETranseiveTimeOutCb");
  sub_2259A0EAC(2, (unsigned int *)a2, 4u, 2u, (uint64_t)"******HCI SE TxRx Timer Expired********");
  if (!a2) {
    goto LABEL_6;
  }
  char v3 = 0;
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = *((void *)&unk_26ABD79B8 + 14 * v4 + 2);
    if (v3) {
      break;
    }
    char v3 = 1;
    uint64_t v4 = 1;
  }
  while (v5 != a2);
  if (v5 == a2)
  {
    uint64_t v6 = *(void *)(a2 + 464);
    phOsalNfc_Timer_Stop();
    phOsalNfc_Timer_Delete();
    *(_DWORD *)(v6 + 852) = 10000;
    *(void *)(v6 + 840) = 0xFFFFFFFFFFFFLL;
    sub_2259D7178(*(void *)(a2 + 19360), 44);
    if (*(_DWORD *)(v6 + 956)) {
      uint64_t v7 = &dword_26ABD8410;
    }
    else {
      uint64_t v7 = &dword_26ABD8328;
    }
    *v7 |= 8u;
    sub_225A55320(*(void *)(a2 + 3040), 1);
    if (*(unsigned char *)(a2 + 706) == 1)
    {
      *(unsigned char *)(a2 + 706) = 0;
      uint64_t v8 = a2;
      uint64_t v9 = 218;
    }
    else
    {
      sub_2259CA420(*(void *)(a2 + 3040), 0);
      uint64_t v8 = a2;
      uint64_t v9 = 44;
    }
    sub_225A30838(v8, v9, 0);
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a2, 4u, 1u, (uint64_t)"phHciNfc_eSETranseiveTimeOutCb:Invalid Context");
  }

  return sub_2259A10B4(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phHciNfc_eSETranseiveTimeOutCb");
}

uint64_t sub_225A3617C(uint64_t a1, int a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSendCb");
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = *(void *)(a1 + 464);
      if (v4)
      {
        BYTE2(v6) = *(unsigned char *)(v4 + 10);
        LOWORD(v6) = *(_WORD *)(v4 + 8);
        uint64_t v7 = 0;
        WORD2(v6) = 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"SeSendCb: Call back received with sttus != success");
        sub_225A32320((unsigned int *)v4, (unsigned __int8 *)&v6, 0);
      }
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSendCb");
}

uint64_t sub_225A3623C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeRawSendCb");
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = *(unsigned int **)(a1 + 464);
      if (v4)
      {
        if (*(_DWORD *)(a1 + 624))
        {
          sub_225A30D34(a1, a2, 0);
        }
        else
        {
          *(_WORD *)((char *)&v6 + 1) = 274;
          LOBYTE(v6) = *(unsigned char *)(a1 + 608);
          uint64_t v7 = 0;
          WORD2(v6) = 0;
          sub_225A32320(v4, (unsigned __int8 *)&v6, 0);
        }
      }
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeRawSendCb");
}

uint64_t sub_225A362F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Notify");
  if (a1)
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 3440);
    if (v6)
    {
      *(unsigned char *)(a1 + 6522) = 0;
      uint64_t v7 = *(void *)(a1 + 3768);
      *(void *)(a1 + 3440) = 0;
      *(void *)(a1 + 3768) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Invoking upper layer call back function");
      v6(v7, a2, a3);
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Dropping as there is NO upper layer call back function");
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Notify");
}

uint64_t sub_225A363E4(uint64_t a1)
{
  *(unsigned char *)(a1 + 158) = 0;
  phOsalNfc_MemCopy();
  *(_DWORD *)(a1 + 126) = 0;
  return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Reset");
}

uint64_t sub_225A3646C(uint64_t a1)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Format");
  *(unsigned char *)(a1 + 158) = 0;
  phOsalNfc_MemCopy();
  *(unsigned char *)(a1 + 25) = 1;
  *(unsigned char *)(a1 + 158) = 2;
  uint64_t v2 = sub_225A36518(a1);
  sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Format");
  return v2;
}

uint64_t sub_225A36518(uint64_t a1)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_WrRd");
  sub_225A37560(a1, *(unsigned char *)(a1 + 158));
  uint64_t v2 = sub_225A378C8(a1);
  sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_WrRd");
  return v2;
}

uint64_t sub_225A36594(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Process");
  if (a2) {
    goto LABEL_2;
  }
  a2 = 0;
  switch(*(unsigned char *)(a1 + 25))
  {
    case 1:
      sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_ProRd16Bytes");
      uint64_t v5 = *(unsigned char **)(a1 + 96);
      if (v5[3]) {
        goto LABEL_9;
      }
      int v15 = v5[8];
      if (v15 == 255)
      {
        if (v5[9] == 255)
        {
          *(unsigned char *)(a1 + 24) = 1;
          goto LABEL_62;
        }
      }
      else if (v15 == 2 && !v5[9])
      {
        *(unsigned char *)(a1 + 24) = 10;
LABEL_62:
        phOsalNfc_MemCopy();
        goto LABEL_69;
      }
      sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_ChkOtpFindTagType");
      if (phOsalNfc_MemCompare())
      {
        if (phOsalNfc_MemCompare())
        {
          if (phOsalNfc_MemCompare())
          {
            if (phOsalNfc_MemCompare())
            {
              if (phOsalNfc_MemCompare())
              {
                if (phOsalNfc_MemCompare())
                {
                  if (phOsalNfc_MemCompare()) {
                    goto LABEL_68;
                  }
                  *(unsigned char *)(a1 + 24) = 11;
                }
                else
                {
                  *(unsigned char *)(a1 + 24) = 11;
                }
              }
              else
              {
                *(unsigned char *)(a1 + 24) = 11;
              }
            }
            else
            {
              *(unsigned char *)(a1 + 24) = 11;
            }
          }
          else
          {
            *(unsigned char *)(a1 + 24) = 11;
          }
        }
        else
        {
          *(unsigned char *)(a1 + 24) = 11;
        }
        phOsalNfc_MemCopy();
      }
      else
      {
        *(unsigned char *)(a1 + 24) = 11;
      }
LABEL_68:
      sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_ChkOtpFindTagType");
LABEL_69:
      char v16 = 4;
      if (phOsalNfc_MemCompare())
      {
        if (phOsalNfc_MemCompare())
        {
LABEL_9:
          unsigned int v6 = *(unsigned __int8 *)(a1 + 25);
          goto LABEL_77;
        }
        int v17 = *(unsigned __int8 *)(a1 + 24);
        unsigned int v6 = 2;
        char v16 = 3;
        if (v17 != 10 && v17 != 1)
        {
          unsigned int v6 = 13;
          goto LABEL_76;
        }
      }
      else
      {
        unsigned int v6 = 3;
      }
      *(unsigned char *)(a1 + 158) = v16;
LABEL_76:
      *(unsigned char *)(a1 + 25) = v6;
LABEL_77:
      a2 = 35;
      if (v6 <= 0xD && ((1 << v6) & 0x200C) != 0)
      {
        unsigned int v18 = *(unsigned __int8 *)(a1 + 24);
        if (v18 <= 0xB && ((1 << v18) & 0xC02) != 0) {
          a2 = sub_225A36518(a1);
        }
      }
      uint64_t v8 = "phFriNfc_MfUL_H_ProRd16Bytes";
      uint64_t v7 = (unsigned int *)a1;
LABEL_83:
      sub_2259A10B4(3, v7, 8u, 5u, (uint64_t)v8);
LABEL_2:
      if (a2 != 13) {
LABEL_3:
      }
        sub_2259E2408(a1, a2);
      return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Process");
    case 2:
      sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_ProWrOTPBytes");
      *(unsigned char *)(a1 + 25) = 3;
      *(unsigned char *)(a1 + 158) = 4;
      a2 = sub_225A36518(a1);
      uint64_t v7 = (unsigned int *)a1;
      uint64_t v8 = "phFriNfc_MfUL_H_ProWrOTPBytes";
      goto LABEL_83;
    case 3:
      if (*(unsigned char *)(a1 + 24) == 10)
      {
        *(unsigned char *)(a1 + 158) = 5;
        char v9 = 4;
        goto LABEL_46;
      }
      a2 = 0;
      goto LABEL_3;
    case 4:
    case 6:
      goto LABEL_3;
    case 5:
      if (**(_WORD **)(a1 + 88) != 16) {
        goto LABEL_36;
      }
      phOsalNfc_MemCopy();
      *(unsigned char *)(a1 + 128) |= 0xF8u;
      *(unsigned char *)(a1 + 129) = -1;
      phOsalNfc_MemCopy();
      *(unsigned char *)(a1 + 125) = 15;
      int v10 = *(unsigned __int8 *)(a1 + 124);
      if (v10 == 18)
      {
        *(unsigned char *)(a1 + 25) = 12;
        *(unsigned char *)(a1 + 158) = 4;
        goto LABEL_47;
      }
      if (v10 != 6)
      {
LABEL_23:
        a2 = 245;
        goto LABEL_3;
      }
LABEL_37:
      char v9 = 7;
      goto LABEL_46;
    case 7:
      int v11 = *(unsigned __int8 *)(a1 + 124);
      if (v11 != 18 && v11 != 6) {
        goto LABEL_23;
      }
      char v9 = 6;
      goto LABEL_46;
    case 8:
      if (**(_WORD **)(a1 + 88) != 16) {
        goto LABEL_36;
      }
      phOsalNfc_MemCopy();
      *(unsigned char *)(a1 + 146) = 0;
      goto LABEL_29;
    case 9:
      *(unsigned char *)(a1 + 146) += 4;
      if (!sub_225A373DC(a1)) {
        goto LABEL_37;
      }
      if (*(unsigned __int8 *)(a1 + 146) <= 0xFu && sub_225A373DC(a1))
      {
LABEL_29:
        uint64_t v13 = sub_225A37204(a1);
      }
      else
      {
        char v14 = *(unsigned char *)(a1 + 158) + 4;
LABEL_40:
        *(unsigned char *)(a1 + 158) = v14;
        uint64_t v13 = sub_225A37130(a1);
      }
      goto LABEL_48;
    case 0xC:
      if (**(_WORD **)(a1 + 88) != 16) {
        goto LABEL_36;
      }
      a2 = sub_225A36BD4(a1, *(void *)(a1 + 96));
      if (a2) {
        goto LABEL_2;
      }
      char v14 = *(unsigned char *)(a1 + 154);
      goto LABEL_40;
    case 0xD:
      *(unsigned char *)(a1 + 146) = 0;
      if (**(_WORD **)(a1 + 88) != 8)
      {
LABEL_36:
        a2 = 27;
        goto LABEL_3;
      }
      phOsalNfc_MemCopy();
      if (sub_225A3744C(a1))
      {
        a2 = 1;
        goto LABEL_3;
      }
      char v9 = 14;
LABEL_46:
      *(unsigned char *)(a1 + 25) = v9;
LABEL_47:
      uint64_t v13 = sub_225A36518(a1);
LABEL_48:
      a2 = v13;
      goto LABEL_2;
    default:
      goto LABEL_23;
  }
}

uint64_t sub_225A36BD4(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_ParseTLVs");
  int v3 = HIWORD(dword_26ABD82E0);
  if (!HIWORD(dword_26ABD82E0))
  {
    int v3 = 8 * *(unsigned __int8 *)(a1 + 124);
    HIWORD(dword_26ABD82E0) = 8 * *(unsigned __int8 *)(a1 + 124);
  }
  int v4 = dword_26ABD82E8;
  BOOL v5 = dword_26ABD82E8 == 5 || v3 == 0;
  if (!v5)
  {
    int v8 = 0;
    int v9 = 0;
    while (1)
    {
      unsigned int v10 = BYTE1(dword_26ABD82E0);
      if (!BYTE1(dword_26ABD82E0))
      {
        int v13 = *(unsigned __int8 *)(a1 + 158);
        sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetSkipSize");
        if (*(unsigned char *)(a1 + 156)
          || *(unsigned __int8 *)(a1 + 154) != v13
          || *(unsigned __int8 *)(a1 + 153) != v9)
        {
          sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetSkipSize");
          BYTE1(dword_26ABD82E0) = 0;
LABEL_26:
          switch(dword_26ABD82E8)
          {
            case 0:
              int v16 = *(unsigned __int8 *)(a2 + v9);
              if (!*(unsigned char *)(a2 + v9)) {
                goto LABEL_51;
              }
              if (v16 == 3)
              {
                dword_26ABD82E8 = 4;
                *(unsigned char *)(a1 + 156) = 1;
                unsigned int v18 = "phFriNfc_MfUL_GetDefaultLockBytesInfo";
                sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetDefaultLockBytesInfo");
                int v22 = *(unsigned __int8 *)(a1 + 124);
                *(unsigned char *)(a1 + 154) = (8 * v22 + 16) >> 2;
                *(unsigned char *)(a1 + 153) = 0;
                *(unsigned char *)(a1 + 155) = v22 - 6;
                goto LABEL_50;
              }
              if (v16 == 1)
              {
                uint64_t v6 = 0;
                goto LABEL_39;
              }
              dword_26ABD82E8 = 0;
              goto LABEL_48;
            case 1:
              if (*(unsigned char *)(a2 + v9) != 3) {
                goto LABEL_47;
              }
              uint64_t v6 = 0;
              int v16 = 2;
              goto LABEL_39;
            case 2:
              uint64_t v17 = dword_26ABD82E0;
              if (dword_26ABD82E0 < 2u)
              {
                uint64_t v6 = 0;
                *(unsigned char *)(a1 + 156) = 0;
                *(unsigned char *)(a1 + v17 + 147) = *(unsigned char *)(a2 + v9);
                LOBYTE(dword_26ABD82E0) = v17 + 1;
                break;
              }
              if (dword_26ABD82E0 == 2)
              {
                *(unsigned char *)(a1 + 149) = *(unsigned char *)(a2 + v9);
                dword_26ABD82E8 = 3;
                LOBYTE(dword_26ABD82E0) = 0;
                unsigned int v18 = "phFriNfc_MfUL_GetLockBytesInfo";
                sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetLockBytesInfo");
                unsigned int v19 = *(unsigned __int8 *)(a1 + 147);
                *(unsigned char *)(a1 + 155) = *(unsigned char *)(a1 + 148);
                unsigned int v20 = *(unsigned __int8 *)(a1 + 149);
                *(unsigned char *)(a1 + 152) = v20 & 0xF;
                *(unsigned char *)(a1 + 151) = v20 >> 4;
                int v21 = (v19 & 0xF) + (v19 >> 4 << (v20 & 0xF));
                *(unsigned char *)(a1 + 154) = v21 >> 2;
                *(unsigned char *)(a1 + 153) = v21 & 3;
LABEL_50:
                sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)v18);
                goto LABEL_51;
              }
LABEL_47:
              BYTE1(dword_26ABD82E0) = 0;
              dword_26ABD82E8 = 0;
LABEL_48:
              uint64_t v6 = 22;
              break;
            case 3:
              if (!*(unsigned char *)(a2 + v9)) {
                goto LABEL_51;
              }
              if (*(unsigned char *)(a2 + v9) != 3) {
                goto LABEL_47;
              }
              uint64_t v6 = 0;
              int v16 = 4;
LABEL_39:
              dword_26ABD82E8 = v16;
              break;
            case 4:
              if (dword_26ABD82E0 == 2)
              {
                uint64_t v6 = 0;
                word_26ABD82E4 |= *(unsigned __int8 *)(a2 + v9);
                dword_26ABD82E8 = 5;
                LOBYTE(dword_26ABD82E0) = 0;
              }
              else if (dword_26ABD82E0 == 1)
              {
                uint64_t v6 = 0;
                word_26ABD82E4 = *(unsigned __int8 *)(a2 + v9) << 8;
              }
              else if ((_BYTE)dword_26ABD82E0)
              {
LABEL_51:
                uint64_t v6 = 0;
              }
              else
              {
                uint64_t v6 = 0;
                if (*(unsigned __int8 *)(a2 + v9) == 255)
                {
                  LOBYTE(dword_26ABD82E0) = 1;
                }
                else
                {
                  word_26ABD82E4 = *(unsigned __int8 *)(a2 + v9);
                  dword_26ABD82E8 = 5;
                  LOBYTE(dword_26ABD82E0) = 0;
                }
              }
              break;
            default:
              goto LABEL_47;
          }
          int v12 = HIWORD(dword_26ABD82E0);
          goto LABEL_53;
        }
        unsigned int v14 = *(unsigned __int8 *)(a1 + 155);
        BOOL v5 = (v14 & 7) == 0;
        unsigned int v15 = v14 >> 3;
        if (v5) {
          unsigned int v10 = v15;
        }
        else {
          unsigned int v10 = v15 + 1;
        }
        sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetSkipSize");
        BYTE1(dword_26ABD82E0) = v10;
        if (!v10) {
          goto LABEL_26;
        }
        int v3 = HIWORD(dword_26ABD82E0);
      }
      int v11 = 16 - v8;
      uint64_t v6 = 0;
      if (16 - v8 <= v10)
      {
        int v12 = v3 - v11;
        HIWORD(dword_26ABD82E0) = v3 - v11;
        BYTE1(dword_26ABD82E0) = v10 - v11;
        int v9 = 16;
      }
      else
      {
        int v12 = v3 - v10;
        HIWORD(dword_26ABD82E0) = v3 - v10;
        v9 += v10;
        BYTE1(dword_26ABD82E0) = 0;
      }
LABEL_53:
      if ((_WORD)v12)
      {
        int v4 = dword_26ABD82E8;
        if (dword_26ABD82E8 == 5)
        {
          int v3 = 0;
          if (*(unsigned __int8 *)(a1 + 124) <= 0x1Fu) {
            int v23 = -1;
          }
          else {
            int v23 = -3;
          }
          if (v23 + (unsigned __int16)v12 >= (unsigned __int16)word_26ABD82E4) {
            uint64_t v6 = v6;
          }
          else {
            uint64_t v6 = 22;
          }
          dword_26ABD82E0 = 0;
          int v4 = 5;
        }
        else
        {
          ++v9;
          int v3 = v12 - 1;
          HIWORD(dword_26ABD82E0) = v12 - 1;
        }
      }
      else
      {
        int v3 = 0;
        int v4 = 0;
        BYTE1(dword_26ABD82E0) = 0;
        dword_26ABD82E8 = 0;
        uint64_t v6 = 22;
      }
      if ((_WORD)v3)
      {
        if (v4 != 5 && v9 <= 0xFu)
        {
          int v8 = v9;
          if (!v6) {
            continue;
          }
        }
      }
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
LABEL_9:
  if (v4 != 5 && v6 == 0)
  {
    *(unsigned char *)(a1 + 25) = 12;
    *(unsigned char *)(a1 + 158) += 4;
    uint64_t v6 = sub_225A36518(a1);
  }
  else
  {
    dword_26ABD82E8 = 0;
  }
  if (v6 != 13) {
    dword_26ABD82E0 = 0;
  }
  sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_ParseTLVs");
  return v6;
}

uint64_t sub_225A37130(uint64_t a1)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_ReadWriteLockBytes");
  if ((*(unsigned char *)(a1 + 153)
     || *(unsigned __int8 *)(a1 + 158) != *(unsigned __int8 *)(a1 + 154)
     || sub_225A373DC(a1) <= 0x1F)
    && (*(unsigned __int8 *)(a1 + 158) == *(unsigned __int8 *)(a1 + 154) || sub_225A373DC(a1) < 0x20))
  {
    char v2 = 8;
  }
  else
  {
    phOsalNfc_SetMemory();
    char v2 = 9;
  }
  *(unsigned char *)(a1 + 25) = v2;
  uint64_t v3 = sub_225A36518(a1);
  sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_ReadWriteLockBytes");
  return v3;
}

uint64_t sub_225A37204(uint64_t a1)
{
  int v10 = 0;
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_UpdateAndWriteLockBits");
  phOsalNfc_MemCopy();
  unsigned int v2 = sub_225A373DC(a1);
  int v3 = 0;
  if (*(unsigned __int8 *)(a1 + 158) == *(unsigned __int8 *)(a1 + 154)) {
    int v3 = *(unsigned __int8 *)(a1 + 153);
  }
  unsigned __int8 v4 = 32 - 8 * v3;
  if ((v4 & 0xF8u) >= v2)
  {
    if ((v2 & 7) != 0)
    {
      if (v2 < 9)
      {
        LOBYTE(v10) = v10 & (-1 << (v2 & 7)) | 1;
      }
      else
      {
        LOBYTE(v5) = 0;
        do
        {
          *((unsigned char *)&v10 + v3) = -1;
          LOBYTE(v3) = v3 + 1;
          unsigned int v5 = (v5 + 1);
        }
        while (v5 < v2 >> 3);
        *((unsigned char *)&v10 + v3) = 1;
      }
    }
    else if (v2 >= 8)
    {
      LOBYTE(v7) = 0;
      do
      {
        *((unsigned char *)&v10 + v3++) = -1;
        unsigned int v7 = (v7 + 1);
      }
      while (v7 < v2 >> 3);
    }
  }
  else if ((8 * v3) == 32)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    LOBYTE(v6) = 0;
    do
    {
      *((unsigned char *)&v10 + v3++) = -1;
      unsigned int v6 = (v6 + 1);
    }
    while (v6 < v4 >> 3);
    LOBYTE(v2) = v4;
  }
  *(unsigned char *)(a1 + 157) += v2;
  phOsalNfc_MemCopy();
  *(unsigned char *)(a1 + 25) = 9;
  uint64_t v8 = sub_225A36518(a1);
  sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_UpdateAndWriteLockBits");
  return v8;
}

uint64_t sub_225A373DC(uint64_t a1)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_CalcRemainingLockBits");
  unsigned __int8 v2 = *(unsigned char *)(a1 + 155) - *(unsigned char *)(a1 + 157);
  sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_CalcRemainingLockBits");
  return v2;
}

uint64_t sub_225A3744C(uint64_t a1)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_FindNtagSize");
  uint64_t v2 = 1;
  if (a1)
  {
    int v3 = 1 << (*(unsigned char *)(a1 + 165) >> 1);
    if (*(unsigned char *)(a1 + 165))
    {
      sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_MapNtagSize");
      if ((unsigned __int16)v3 <= 0xFFu)
      {
        if ((unsigned __int16)v3 == 32)
        {
          LOWORD(v3) = 48;
        }
        else if ((unsigned __int16)v3 == 128)
        {
          LOWORD(v3) = 144;
        }
      }
      else
      {
        switch((unsigned __int16)v3)
        {
          case 0x100u:
            LOWORD(v3) = 504;
            break;
          case 0x200u:
            LOWORD(v3) = 888;
            break;
          case 0x400u:
            LOWORD(v3) = 1904;
            break;
        }
      }
      sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_MapNtagSize");
    }
    uint64_t v2 = 0;
    *(_WORD *)(a1 + 168) = v3;
  }
  sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_FindNtagSize");
  return v2;
}

uint64_t sub_225A37560(uint64_t a1, char a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
  **(unsigned char **)(a1 + 96) = a2;
  switch(*(unsigned char *)(a1 + 25))
  {
    case 1:
      *(_DWORD *)(a1 + 80) = 48;
      goto LABEL_19;
    case 2:
      *(_WORD *)(a1 + 104) = 5;
      *(_DWORD *)(a1 + 80) = 162;
      goto LABEL_23;
    case 3:
      *(_WORD *)(a1 + 104) = 5;
      *(_DWORD *)(a1 + 80) = 162;
      int v4 = *(unsigned __int8 *)(a1 + 24);
      if (v4 == 1 || v4 == 11 || v4 == 10) {
        goto LABEL_23;
      }
      return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    case 4:
      if (*(unsigned char *)(a1 + 24) != 10) {
        return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
      }
      *(_WORD *)(a1 + 104) = 5;
      *(_DWORD *)(a1 + 80) = 162;
      goto LABEL_23;
    case 5:
      *(_DWORD *)(a1 + 80) = 48;
      **(unsigned char **)(a1 + 96) = 2;
      goto LABEL_19;
    case 6:
      *(_DWORD *)(a1 + 80) = 162;
      *(_WORD *)(a1 + 104) = 5;
      **(unsigned char **)(a1 + 96) = 2;
      goto LABEL_23;
    case 7:
      *(_DWORD *)(a1 + 80) = 162;
      *(_WORD *)(a1 + 104) = 5;
      **(unsigned char **)(a1 + 96) = 3;
      goto LABEL_23;
    case 8:
    case 0xC:
      *(_DWORD *)(a1 + 80) = 48;
      **(unsigned char **)(a1 + 96) = *(unsigned char *)(a1 + 158);
LABEL_19:
      *(_WORD *)(a1 + 104) = 1;
      return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    case 9:
      *(_DWORD *)(a1 + 80) = 162;
      *(_WORD *)(a1 + 104) = 5;
      **(unsigned char **)(a1 + 96) = *(unsigned char *)(a1 + 158);
LABEL_23:
      phOsalNfc_MemCopy();
      return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    case 0xD:
      *(_DWORD *)(a1 + 80) = 96;
      *(_WORD *)(a1 + 104) = 0;
      return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    case 0xE:
      *(_WORD *)(a1 + 104) = 5;
      *(_DWORD *)(a1 + 80) = 162;
      *(unsigned char *)(a1 + 158) = 3;
      unsigned int v5 = *(unsigned __int16 *)(a1 + 168);
      if (v5 > 0x1F7)
      {
        if (v5 == 504 || v5 == 888 || v5 == 1904) {
          goto LABEL_28;
        }
      }
      else if (v5 == 48 || v5 == 128 || v5 == 144)
      {
LABEL_28:
        phOsalNfc_MemCopy();
      }
      phOsalNfc_MemCopy();
      *(unsigned char *)(a1 + 25) = 2;
      return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    default:
      return sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
  }
}

uint64_t sub_225A378C8(uint64_t a1)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_Transceive");
  *(unsigned char *)(a1 + 8) &= 0xFCu;
  *(unsigned char *)(a1 + 12) = 0;
  *(void *)(a1 + 64) = sub_2259E2798;
  *(void *)(a1 + 72) = a1;
  int v3 = *(unsigned __int16 **)(a1 + 88);
  uint64_t v2 = *(unsigned char **)(a1 + 96);
  unsigned __int16 *v3 = 252;
  uint64_t v4 = sub_225A0E0A8(*(void *)a1, (_OWORD *)(a1 + 64), *(void *)(a1 + 16), *(_DWORD *)(a1 + 80), a1 + 8, v2, *(unsigned __int16 *)(a1 + 104), (uint64_t)v2, v3);
  sub_2259A10B4(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_Transceive");
  return v4;
}

uint64_t sub_225A3798C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEepromSettings");
  if (a1)
  {
    uint64_t Memory = phOsalNfc_GetMemory();
    *(void *)(a1 + 3232) = Memory;
    if (Memory)
    {
      phOsalNfc_SetMemory();
      if ((*(_DWORD *)(a1 + 3156) | 2) == 2)
      {
        *(_DWORD *)(*(void *)(a1 + 3232) + 4) |= 0x10u;
        *(unsigned char *)(*(void *)(a1 + 3232) + 88) |= 1u;
        *(_DWORD *)(*(void *)(a1 + 3232) + 4) |= 0x100u;
        *(unsigned char *)(*(void *)(a1 + 3232) + 380) |= 8u;
        *(_DWORD *)(*(void *)(a1 + 3232) + 4) |= 0x20u;
        *(unsigned char *)(*(void *)(a1 + 3232) + 148) |= 4u;
      }
      if (*(unsigned char *)(a1 + 2937) != 1 && *(unsigned char *)(a1 + 2938) != 1 && *(unsigned char *)(a1 + 2944) != 1)
      {
        *(_DWORD *)(*(void *)(a1 + 3232) + 4) |= 0x1000u;
        *(_DWORD *)(*(void *)(a1 + 3232) + 580) |= 0x4000u;
        *(_DWORD *)(*(void *)(a1 + 3232) + 580) |= 0x8000u;
        *(_DWORD *)(*(void *)(a1 + 3232) + 580) |= 2u;
        *(_DWORD *)(*(void *)(a1 + 3232) + 580) |= 8u;
        *(_DWORD *)(*(void *)(a1 + 3232) + 580) |= 0x40u;
        *(_DWORD *)(*(void *)(a1 + 3232) + 580) |= 0x10000u;
      }
      if (*(unsigned char *)(a1 + 2936) != 1
        && *(unsigned char *)(a1 + 2937) != 1
        && *(unsigned char *)(a1 + 2938) != 1
        && *(unsigned char *)(a1 + 2944) != 1)
      {
        *(_DWORD *)(*(void *)(a1 + 3232) + 580) |= 0x20u;
      }
      *(_DWORD *)(*(void *)(a1 + 3232) + 4) |= 0x400u;
      if ((*(_DWORD *)(a1 + 3156) | 2) == 2)
      {
        *(unsigned char *)(*(void *)(a1 + 3232) + 544) |= 4u;
        *(unsigned char *)(*(void *)(a1 + 3232) + 544) |= 8u;
      }
      *(_DWORD *)(*(void *)(a1 + 3232) + 4) |= 0x2000u;
      if (*(unsigned char *)(a1 + 2946) != 1) {
        *(unsigned char *)(*(void *)(a1 + 3232) + 1132) |= 1u;
      }
      *(unsigned char *)(*(void *)(a1 + 3232) + 1132) |= 4u;
      if (*(unsigned char *)(a1 + 2936) == 1)
      {
        *(unsigned char *)(*(void *)(a1 + 3232) + 1132) &= ~2u;
        *(unsigned char *)(*(void *)(a1 + 3232) + 1132) |= 8u;
      }
      if ((*(_DWORD *)(a1 + 3156) | 2) == 2)
      {
        *(_DWORD *)(*(void *)(a1 + 3232) + 4) |= 0x8000u;
        *(_WORD *)(*(void *)(a1 + 3232) + 1408) |= 0x10u;
      }
      uint64_t v3 = sub_225A52F04(*(void *)(a1 + 3040), *(void *)(a1 + 3232), (uint64_t)sub_2259B5A70, a1);
      if (v3 != 13)
      {
        phOsalNfc_FreeMemory();
        *(void *)(a1 + 3232) = 0;
      }
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory, Insufficient Resources");
      uint64_t v3 = 12;
    }
  }
  else
  {
    uint64_t v3 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEepromSettings");
  return v3;
}

uint64_t sub_225A37CC4(uint64_t a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEepromSettingsProc");
  uint64_t v6 = 0;
  if (a1 && !a2 && a3)
  {
    sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckPollParams");
    if (*(unsigned char *)(a3 + 92) == 1) {
      *(unsigned char *)(a3 + 88) &= ~1u;
    }
    else {
      *(unsigned char *)(a3 + 92) = 1;
    }
    sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckPollParams");
    sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckListenParams");
    char v7 = *(unsigned char *)(a3 + 156);
    if ((v7 & 7) == 1)
    {
      char v8 = *(unsigned char *)(a3 + 148) & 0xFB;
    }
    else
    {
      *(unsigned char *)(a3 + 156) = v7 & 0xFC | 1;
      char v8 = *(unsigned char *)(a3 + 148) | 4;
    }
    *(unsigned char *)(a3 + 148) = v8;
    if (*(unsigned char *)(a3 + 204)) {
      *(unsigned char *)(a3 + 204) &= ~1u;
    }
    else {
      *(unsigned char *)(a3 + 196) &= ~2u;
    }
    char v9 = *(unsigned char *)(a3 + 380);
    if (*(unsigned char *)(a3 + 483))
    {
      char v10 = v9 | 8;
      *(unsigned char *)(a3 + 483) = 0;
    }
    else
    {
      char v10 = v9 & 0xF7;
    }
    *(unsigned char *)(a3 + 380) = v10;
    sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckListenParams");
    sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckSysConfigParams");
    int v11 = *(_DWORD *)(a3 + 580);
    char v12 = *(unsigned char *)(a3 + 1132);
    *(unsigned char *)(a3 + 1132) = v12 & 0xF7;
    unsigned int v13 = v11 & 0xFFFE3F91;
    *(_DWORD *)(a3 + 580) = v13;
    if (*(unsigned char *)(a1 + 2937) != 1
      && *(unsigned char *)(a1 + 2938) != 1
      && *(unsigned char *)(a1 + 2944) != 1
      && *(_DWORD *)(a3 + 932) != 2)
    {
      *(_DWORD *)(a3 + 932) = 2;
      v13 |= 0x4000u;
      *(_DWORD *)(a3 + 580) = v13;
    }
    if (*(unsigned char *)(a1 + 2936))
    {
      if (*(unsigned char *)(a1 + 2936) != 1 || *(_DWORD *)(a3 + 936) == 10) {
        goto LABEL_30;
      }
      v13 |= 0x8000u;
      *(_DWORD *)(a3 + 580) = v13;
      int v14 = 10;
    }
    else
    {
      int v15 = *(unsigned __int8 *)(a1 + 2937);
      if (*(unsigned char *)(a1 + 2937))
      {
LABEL_31:
        if (v15 != 1 && *(unsigned char *)(a1 + 2938) != 1 && *(unsigned char *)(a1 + 2944) != 1 && *(unsigned char *)(a3 + 586) != 1)
        {
          *(unsigned char *)(a3 + 586) = 1;
          v13 |= 2u;
          *(_DWORD *)(a3 + 580) = v13;
        }
        if (*(unsigned char *)(a1 + 2936) == 1 && *(unsigned char *)(a3 + 587) != 12)
        {
          *(unsigned char *)(a3 + 587) = 12;
          v13 |= 8u;
          *(_DWORD *)(a3 + 580) = v13;
        }
        int v16 = *(unsigned __int8 *)(a1 + 2937);
        if (v16 != 1)
        {
          if (*(unsigned char *)(a1 + 2938) != 1
            && *(unsigned char *)(a1 + 2944) != 1
            && (*(_DWORD *)(a3 + 604) || *(_DWORD *)(a3 + 608) != 1))
          {
            *(void *)(a3 + 604) = 0x100000000;
            v13 |= 0x40u;
            *(_DWORD *)(a3 + 580) = v13;
            int v16 = *(unsigned __int8 *)(a1 + 2937);
          }
          if (!v16 && !*(unsigned char *)(a1 + 2938) && !*(unsigned char *)(a1 + 2944) && *(unsigned __int8 *)(a3 + 940) != 238)
          {
            *(unsigned char *)(a3 + 940) = -18;
            v13 |= 0x10000u;
            *(_DWORD *)(a3 + 580) = v13;
          }
        }
        if (*(unsigned char *)(a1 + 2936) != 1
          || *(unsigned char *)(a3 + 1173) != 1
          && (*(unsigned char *)(a3 + 1173) = 1, *(unsigned char *)(a3 + 1132) = v12 | 8, *(unsigned char *)(a1 + 2936) != 1))
        {
          if (*(unsigned char *)(a3 + 601))
          {
            *(unsigned char *)(a3 + 601) = 0;
            *(_DWORD *)(a3 + 580) = v13 | 0x20;
          }
        }
        sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckSysConfigParams");
        sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckComDiscParams");
        if (*(unsigned char *)(a3 + 551) == 1) {
          *(unsigned char *)(a3 + 544) &= ~4u;
        }
        else {
          *(unsigned char *)(a3 + 551) = 1;
        }
        if (*(unsigned char *)(a3 + 552) == 1) {
          *(unsigned char *)(a3 + 544) &= ~8u;
        }
        else {
          *(unsigned char *)(a3 + 552) = 1;
        }
        sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckComDiscParams");
        sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckSwpConfigParams");
        int v17 = *(_DWORD *)(a1 + 440);
        if (v17)
        {
          if (*(unsigned char *)(a3 + 1170) != 1)
          {
            *(unsigned char *)(a3 + 1170) = 1;
            goto LABEL_67;
          }
        }
        else if (*(unsigned char *)(a3 + 1170))
        {
          *(unsigned char *)(a3 + 1170) = 0;
LABEL_67:
          char v18 = *(unsigned char *)(a3 + 1132) | 1;
LABEL_68:
          if ((v17 & 2) != 0)
          {
            if (*(unsigned char *)(a3 + 1172) != 1)
            {
              *(unsigned char *)(a3 + 1172) = 1;
              goto LABEL_74;
            }
          }
          else if (*(unsigned char *)(a3 + 1172))
          {
            *(unsigned char *)(a3 + 1172) = 0;
LABEL_74:
            char v19 = v18 | 4;
LABEL_75:
            *(unsigned char *)(a3 + 1132) = v19;
            sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckSwpConfigParams");
            sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckNxpExtnRfDiscParams");
            if (*(unsigned char *)(a3 + 1421))
            {
              *(unsigned char *)(a3 + 1421) = 0;
              __int16 v20 = *(_WORD *)(a3 + 1408) | 0x10;
            }
            else
            {
              __int16 v20 = *(_WORD *)(a3 + 1408) & 0xFFEF;
            }
            *(_WORD *)(a3 + 1408) = v20;
            sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckNxpExtnRfDiscParams");
            sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckDisableConfigBit");
            if (!*(_DWORD *)(a3 + 88)) {
              *(_DWORD *)(a3 + 4) &= ~0x10u;
            }
            if (!*(_DWORD *)(a3 + 148)) {
              *(_DWORD *)(a3 + 4) &= ~0x20u;
            }
            if (!*(_DWORD *)(a3 + 196)) {
              *(_DWORD *)(a3 + 4) &= ~0x80u;
            }
            if (!*(_DWORD *)(a3 + 380)) {
              *(_DWORD *)(a3 + 4) &= ~0x100u;
            }
            if (!*(_DWORD *)(a3 + 580)) {
              *(_DWORD *)(a3 + 4) &= ~0x1000u;
            }
            if (!*(_DWORD *)(a3 + 544)) {
              *(_DWORD *)(a3 + 4) &= ~0x400u;
            }
            if (!*(_DWORD *)(a3 + 1132)) {
              *(_DWORD *)(a3 + 4) &= ~0x2000u;
            }
            if (!*(_DWORD *)(a3 + 1408)) {
              *(_DWORD *)(a3 + 4) &= ~0x8000u;
            }
            sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckDisableConfigBit");
            if ((*(_DWORD *)(a3 + 4) & 0x1B5B0) != 0)
            {
              unsigned int v21 = *(unsigned __int8 *)(a1 + 3225);
              *(void *)(a1 + 5392) = a3;
              if (v21 >= 2)
              {
                sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetEepromSettingsProc-Retry Failed to Configs Entries");
                uint64_t v6 = 255;
                goto LABEL_102;
              }
            }
            else
            {
              phOsalNfc_FreeMemory();
              sub_2259B5D34(a1, (uint64_t)off_26B609398, 1);
              if (*(void *)(a1 + 5392)) {
                *(void *)(a1 + 5392) = 0;
              }
              if (*(void *)(a1 + 3232))
              {
                uint64_t v6 = 0;
                *(void *)(a1 + 3232) = 0;
                goto LABEL_102;
              }
            }
            uint64_t v6 = 0;
            goto LABEL_102;
          }
          char v19 = v18 & 0xFB;
          goto LABEL_75;
        }
        char v18 = *(unsigned char *)(a3 + 1132) & 0xFE;
        goto LABEL_68;
      }
      if (*(unsigned char *)(a1 + 2938) || *(unsigned char *)(a1 + 2944) || *(_DWORD *)(a3 + 936) == 4)
      {
LABEL_30:
        int v15 = *(unsigned __int8 *)(a1 + 2937);
        goto LABEL_31;
      }
      v13 |= 0x8000u;
      *(_DWORD *)(a3 + 580) = v13;
      int v14 = 4;
    }
    *(_DWORD *)(a3 + 936) = v14;
    goto LABEL_30;
  }
LABEL_102:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEepromSettingsProc");
  return v6;
}

uint64_t sub_225A38364(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetEepromStngs");
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 5392);
    if (v4) {
      a2 = sub_225A522FC(*(void *)(a1 + 3040), v4, (uint64_t)sub_2259B5A70, a1);
    }
  }
  else
  {
    a2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetEepromStngs :Invlaid LibNfc Ctx ");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetEepromStngs");
  return a2;
}

uint64_t sub_225A38414(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (*(void *)(a1 + 3232))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 3232) = 0;
    }
    *(void *)(a1 + 5392) = 0;
    ++*(unsigned char *)(a1 + 3225);
    sub_2259B5E14(a1, (uint64_t)off_26B609398, 2u);
  }
  else
  {
    a2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetEepromStngsProc :Invlaid LibNfc Ctx");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetEepromStngsProc");
  return a2;
}

uint64_t sub_225A384D8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetRtngTable");
  if (a1)
  {
    if (*(_DWORD *)(a1 + 3156) == 1 && *(void *)(a1 + 6664)) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = sub_225A52DAC(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
    }
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetRtngTable");
  return v2;
}

uint64_t sub_225A38598(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetRtngTableProc");
  if (!a1)
  {
    a2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
    goto LABEL_10;
  }
  if (!a2)
  {
    if (a3 && *a3 && *a3 != 255)
    {
      if (sub_2259CAAC0((unsigned int *)a1, (uint64_t)a3) != 1)
      {
        sub_2259B5D34(a1, (uint64_t)off_26B609398, 1);
        goto LABEL_8;
      }
      uint64_t v6 = (unsigned int *)(a1 + 19368);
      if (*(unsigned __int8 *)(a1 + 3226) >= 2u)
      {
        sub_2259A0EAC(1, v6, 4u, 1u, (uint64_t)"phLibNfc_GetRtngTableProc-Retry Failed to Restore Routing Entries");
        a2 = 255;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v6 = (unsigned int *)(a1 + 19368);
    }
    sub_2259A0EAC(1, v6, 4u, 4u, (uint64_t)"phLibNfc_GetRtngTableProc:Continue sequence which will perform basic routing entries");
LABEL_8:
    a2 = 0;
  }
LABEL_10:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetRtngTableProc");
  return a2;
}

uint64_t sub_225A386C8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ValSetLstnModeRtngProc");
  if (a1)
  {
    ++*(unsigned char *)(a1 + 3226);
    sub_2259B5E14(a1, (uint64_t)off_26B609398, 2u);
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ValSetLstnModeRtngProc");
  return v2;
}

uint64_t sub_225A38770(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
    {
      a2 = sub_2259E4EE8(a1);
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_RfDiscMapping : skip RF_DISCOVER_MAP_CMD ");
      a2 = 0;
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfDiscMapping");
  return a2;
}

uint64_t sub_225A38840(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldteEepromStngsComp");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"VldteEepromStngsComp :Invlaid LibNfc Ctx received from NCI");
    uint64_t v4 = 49;
    goto LABEL_14;
  }
  if (*(void *)(a1 + 5392))
  {
    phOsalNfc_FreeMemory();
    *(void *)(a1 + 5392) = 0;
LABEL_7:
    *(void *)(a1 + 3232) = 0;
    goto LABEL_8;
  }
  if (*(void *)(a1 + 3232))
  {
    phOsalNfc_FreeMemory();
    goto LABEL_7;
  }
LABEL_8:
  if (a2)
  {
    if (a2 == 143)
    {
      uint64_t v5 = 146;
    }
    else
    {
      sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_VldteEepromStngsComp: Internal LibNfc status = ");
      uint64_t v5 = 146;
      a2 = 255;
    }
  }
  else
  {
    uint64_t v5 = 145;
  }
  uint64_t v4 = sub_225A24FAC(*(void *)(a1 + 19360), v5, a2, 0, 0);
LABEL_14:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldteEepromStngsComp");
  return v4;
}

uint64_t sub_225A3895C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsCmd");
  if (!a1) {
    goto LABEL_16;
  }
  if (!*(unsigned char *)(a1 + 3248))
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetRfSettingsCmd: Number of configurations to be set is 0");
LABEL_16:
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  *(unsigned char *)(a1 + 3249) = 0;
  phOsalNfc_SetMemory();
  unsigned int v2 = 0;
  char v3 = 0;
  if (*(unsigned __int8 *)(a1 + 3248) >= 0xAu) {
    unsigned int v4 = 10;
  }
  else {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 3248);
  }
  if (v4 <= 1) {
    char v5 = 1;
  }
  else {
    char v5 = v4;
  }
  int v6 = 1;
  while (1)
  {
    uint64_t v7 = *(void *)(a1 + 3240);
    unsigned int v8 = v2 + (*(unsigned char *)(v7 + v2 + 2) + 3);
    if (v8 > 0xFE) {
      break;
    }
    int v9 = (*(unsigned char *)(v7 + v2 + 2) + 3);
    phOsalNfc_MemCopy();
    unsigned int v2 = v8;
    v6 += v9;
    if (v4 <= ++v3)
    {
      uint64_t v7 = *(void *)(a1 + 3240);
      char v3 = v5;
      break;
    }
  }
  *(unsigned char *)(a1 + 3248) -= v3;
  *(void *)(a1 + 3240) = v7 + v2;
  *(unsigned char *)(a1 + 3250) = v3;
  *(unsigned char *)(a1 + 3249) = v2 + 1;
  uint64_t v10 = sub_225A54DD4(*(void *)(a1 + 3040), a1 + 3250, (v2 + 1), (uint64_t)sub_2259B5A70, a1);
  if (v10 == 111)
  {
    *(unsigned char *)(a1 + 3248) += v3;
    *(void *)(a1 + 3240) -= v2;
  }
LABEL_17:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsCmd");
  return v10;
}

uint64_t sub_225A38B10(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    a2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetRfSettingsProc : Invalid Param");
    goto LABEL_12;
  }
  if (*(unsigned char *)(a1 + 2937) != 1 && *(unsigned char *)(a1 + 2938) != 1)
  {
    if (a2 || *(unsigned char *)(a1 + 2944) != 1) {
      goto LABEL_5;
    }
LABEL_9:
    if (*(_DWORD *)(a1 + 3512) >= *(_DWORD *)(a1 + 3508) || !*(unsigned char *)(a1 + 3248))
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"All Rf configs are set");
      a2 = 0;
      goto LABEL_12;
    }
    goto LABEL_5;
  }
  if (!a2) {
    goto LABEL_9;
  }
LABEL_5:
  sub_2259B5D34(a1, *(void *)(a1 + 2912), 1);
LABEL_12:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsProc");
  return a2;
}

uint64_t sub_225A38C14(uint64_t a1, uint64_t a2)
{
  char v23 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsSeqComplete");
  if (a1)
  {
    if (a2)
    {
      BOOL v4 = *(_DWORD *)(a1 + 3148) == 2;
      BOOL v5 = a2 == 147;
      if (a2 == 143) {
        unsigned int v6 = 143;
      }
      else {
        unsigned int v6 = 255;
      }
      if (v5 && v4) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = v6;
      }
      if (v5 && v4) {
        uint64_t v8 = 145;
      }
      else {
        uint64_t v8 = 146;
      }
      char v23 = 1;
      goto LABEL_35;
    }
    if (*(unsigned char *)(a1 + 3248))
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Re-Initialize the sequence to perform set config");
      *(void *)(a1 + 2912) = off_26B609528;
      *(unsigned char *)(a1 + 2904) = 0;
      *(unsigned char *)(a1 + 2906) = 0;
      char v9 = (char)off_26B609528[0];
      if (off_26B609528[0])
      {
        char v9 = 0;
        uint64_t v10 = off_26B609538;
        do
        {
          ++v9;
          int v11 = *v10;
          v10 += 2;
        }
        while (v11);
      }
      *(unsigned char *)(a1 + 2905) = v9;
      int v12 = sub_2259B528C(a1, 0, 0);
      if (v12 == 13)
      {
LABEL_19:
        a2 = 13;
        goto LABEL_36;
      }
      int v15 = v12;
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Set Rf Settings sequence failed to Set remaining configurations, failed with status=");
      char v23 = 1;
      if (v15 == 143) {
        uint64_t v7 = 143;
      }
      else {
        uint64_t v7 = 255;
      }
LABEL_34:
      uint64_t v8 = 146;
LABEL_35:
      a2 = sub_225A24FAC(*(void *)(a1 + 19360), v8, v7, 0, (uint64_t)&v23);
      goto LABEL_36;
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"All Rf configs are set");
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC Hard reset success, verifying TML baud rate");
    if (*(unsigned char *)(a1 + 2939) == 1 || *(unsigned char *)(a1 + 2944) == 1 || *(_DWORD *)(a1 + 3056) == 2)
    {
      unsigned int v13 = "Configuring of baud rate is not necessary.";
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HSU baud rate different, changing it to the default baud rate (115200)");
      if (phTmlNfc_ConfigHsuBaudRate())
      {
        char v23 = 1;
        sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"SetRfSettingsSeqComplete : Config Hsu Baud Rate failed Status ");
        goto LABEL_33;
      }
      unsigned int v13 = "SetRfSettingsSeqComplete: TML HSU Baudrate Set to default baud rate";
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v13);
    if (*(_DWORD *)(a1 + 3176) == 1)
    {
      if (phTmlNfc_IoCtl())
      {
LABEL_32:
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to Hard reset the controller, return failed");
        char v23 = 1;
LABEL_33:
        uint64_t v7 = 255;
        goto LABEL_34;
      }
      int v14 = sub_2259E8C30(*(unsigned int *)(a1 + 19368), *(void *)(a1 + 2952));
    }
    else
    {
      int v14 = phTmlNfc_IoCtl();
    }
    if (!v14)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC hard resetted, performing Re-Init");
      *(unsigned char *)(a1 + 2882) = 0;
      phOsalNfc_SetMemory();
      *(unsigned char *)(a1 + 2883) = 1;
      if (*(unsigned char *)(a1 + 2936) == 1
        || *(unsigned char *)(a1 + 2937) == 1
        || *(unsigned char *)(a1 + 2938) == 1
        || *(unsigned char *)(a1 + 2944) == 1)
      {
        sub_225A562D0(*(void *)(a1 + 3040), 0);
        sub_225A56234(*(void *)(a1 + 3040), 0);
      }
      *(unsigned char *)(a1 + 2884) = 1;
      *(void *)(a1 + 2912) = off_26B606C70;
      *(unsigned char *)(a1 + 2904) = 0;
      *(unsigned char *)(a1 + 2906) = 0;
      char v17 = (char)off_26B606C70[0];
      if (off_26B606C70[0])
      {
        char v17 = 0;
        char v18 = off_26B606C80;
        do
        {
          ++v17;
          char v19 = *v18;
          v18 += 2;
        }
        while (v19);
      }
      *(unsigned char *)(a1 + 2905) = v17;
      int v20 = sub_2259B528C(a1, 0, 0);
      if (v20 != 13)
      {
        int v21 = v20;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"NFCC Re-Init failed, return failed");
        sub_2259CAFDC(a1);
        char v23 = 1;
        if (v21 == 143) {
          unsigned int v22 = 143;
        }
        else {
          unsigned int v22 = 137;
        }
        uint64_t v8 = 146;
        if (v21 == 179) {
          uint64_t v7 = 180;
        }
        else {
          uint64_t v7 = v22;
        }
        goto LABEL_35;
      }
      goto LABEL_19;
    }
    goto LABEL_32;
  }
  sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetRfSettingsSeqComplete: Invalid input parameter");
LABEL_36:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsSeqComplete");
  return a2;
}

uint64_t sub_225A39034(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCfgSignedCmd");
  if (!a1)
  {
    char v17 = "Invalid parameter, Libnfc Context is Invalid";
    a2 = 1;
    int v18 = 2;
    char v19 = 0;
LABEL_23:
    sub_2259A0EAC(v18, v19, 4u, 1u, (uint64_t)v17);
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 3512) >= *(_DWORD *)(a1 + 3508))
  {
    char v19 = (unsigned int *)(a1 + 19368);
    char v17 = "phLibNfc_SetRfSignedCmd: Number of configurations to be set is 0";
    int v18 = 1;
    goto LABEL_23;
  }
  *(unsigned char *)(a1 + 3249) = 0;
  phOsalNfc_SetMemory();
  uint64_t v4 = *(void *)(a1 + 3240);
  uint64_t v5 = *(unsigned int *)(a1 + 3512);
  unsigned int v6 = *(_DWORD *)(a1 + 3508) - v5;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_BuildSetCfgSignedCmdPayload");
  if (v4) {
    BOOL v7 = v6 > 0xF;
  }
  else {
    BOOL v7 = 0;
  }
  int v8 = v7;
  if (v8 == 1)
  {
    char v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = v4 + v5;
    while (1)
    {
      int v12 = *(unsigned char *)(v11 + v10) & 0xFE;
      BOOL v13 = v12 == 160;
      if (v12 == 160) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 3;
      }
      if (v13) {
        char v15 = 3;
      }
      else {
        char v15 = 4;
      }
      unsigned int v16 = (v15 + *(unsigned char *)(v11 + v14 + v10)) + v10;
      if (v16 >= 0xFF)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_BuildSetCfgSignedCmdPayload:data payload size exeeded, signature not copied");
        goto LABEL_28;
      }
      phOsalNfc_MemCopy();
      if (*(unsigned __int8 *)(v11 + v10) == 240) {
        break;
      }
      ++v9;
      uint64_t v10 = v16;
      if ((~v16 & 0xFE) == 0) {
        goto LABEL_28;
      }
    }
    LOBYTE(v10) = v16;
LABEL_28:
    sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_BuildSetCfgSignedCmdPayload");
    if (v9 != 0)
    {
      *(unsigned char *)(a1 + 3250) = v9;
      a2 = sub_225A54F6C(*(void *)(a1 + 3040), a1 + 3250, v10 + 1, (uint64_t)sub_2259B5A70, a1);
      if (a2 == 13) {
        *(_DWORD *)(a1 + 3512) += v10;
      }
      else {
        *(_DWORD *)(a1 + 3512) = 0;
      }
    }
    else
    {
      a2 = 0;
    }
  }
  else
  {
    sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_BuildSetCfgSignedCmdPayload");
    a2 = 1;
  }
LABEL_24:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCfgSignedCmd");
  return a2;
}

uint64_t sub_225A392C4(uint64_t a1, uint64_t a2)
{
  char v19 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSignedSeqComplete");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetRfSignedSeqComplete: Invalid input parameter");
    goto LABEL_14;
  }
  if (a2)
  {
    uint64_t v4 = 145;
    if (a2 != 130 && a2 != 143)
    {
      BOOL v5 = *(_DWORD *)(a1 + 3148) == 2;
      BOOL v6 = a2 == 147;
      if (v6 && v5) {
        a2 = 0;
      }
      else {
        a2 = 255;
      }
      if (v6 && v5) {
        uint64_t v4 = 145;
      }
      else {
        uint64_t v4 = 146;
      }
    }
    char v19 = 1;
    goto LABEL_12;
  }
  if (*(_DWORD *)(a1 + 3512) < *(_DWORD *)(a1 + 3508))
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Re-Initialize the sequence to perform set signed config");
    *(void *)(a1 + 2912) = off_26B609558;
    *(unsigned char *)(a1 + 2904) = 0;
    *(unsigned char *)(a1 + 2906) = 0;
    char v8 = (char)off_26B609558[0];
    if (off_26B609558[0])
    {
      char v8 = 0;
      char v9 = off_26B609568;
      do
      {
        ++v8;
        uint64_t v10 = *v9;
        v9 += 2;
      }
      while (v10);
    }
    *(unsigned char *)(a1 + 2905) = v8;
    if (sub_2259B528C(a1, 0, 0) == 13)
    {
LABEL_20:
      a2 = 13;
      goto LABEL_14;
    }
    BOOL v13 = "Set Rf signed config sequence failed to Set remaining configurations, return failed";
    goto LABEL_32;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"All Rf configs are set");
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC Hard reset success, verifying TML baud rate");
  if (*(unsigned char *)(a1 + 2939) == 1 || *(unsigned char *)(a1 + 2944) == 1 || *(_DWORD *)(a1 + 3056) == 2)
  {
    uint64_t v11 = "TML HSU baud rate is set to default, perform LibNfc Re-Init";
  }
  else
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HSU baud rate different, changing it to the default baud rate (115200)");
    if (phTmlNfc_ConfigHsuBaudRate())
    {
      char v19 = 1;
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"SetRfSignedSeqComplete : Config Hsu Baud Rate failed ");
      goto LABEL_33;
    }
    uint64_t v11 = "SetRfSignedSeqComplete: TML HSU Baud rate Set to default baud rate";
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v11);
  if (*(_DWORD *)(a1 + 3176) == 1)
  {
    if (phTmlNfc_IoCtl())
    {
LABEL_31:
      BOOL v13 = "Failed to Hard reset the controller, return failed";
LABEL_32:
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v13);
      char v19 = 1;
LABEL_33:
      a2 = 255;
      goto LABEL_34;
    }
    int v12 = sub_2259E8C30(*(unsigned int *)(a1 + 19368), *(void *)(a1 + 2952));
  }
  else
  {
    int v12 = phTmlNfc_IoCtl();
  }
  if (v12) {
    goto LABEL_31;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC hard resetted, performing Re-Init");
  *(unsigned char *)(a1 + 2882) = 0;
  phOsalNfc_SetMemory();
  *(unsigned char *)(a1 + 2883) = 1;
  if (*(unsigned char *)(a1 + 2936) == 1
    || *(unsigned char *)(a1 + 2937) == 1
    || *(unsigned char *)(a1 + 2938) == 1
    || *(unsigned char *)(a1 + 2944) == 1)
  {
    sub_225A562D0(*(void *)(a1 + 3040), 0);
    sub_225A56234(*(void *)(a1 + 3040), 0);
  }
  *(unsigned char *)(a1 + 2884) = 1;
  *(void *)(a1 + 2912) = off_26B606C70;
  *(unsigned char *)(a1 + 2904) = 0;
  *(unsigned char *)(a1 + 2906) = 0;
  char v14 = (char)off_26B606C70[0];
  if (off_26B606C70[0])
  {
    char v14 = 0;
    char v15 = off_26B606C80;
    do
    {
      ++v14;
      unsigned int v16 = *v15;
      v15 += 2;
    }
    while (v16);
  }
  *(unsigned char *)(a1 + 2905) = v14;
  int v17 = sub_2259B528C(a1, 0, 0);
  if (v17 == 13) {
    goto LABEL_20;
  }
  int v18 = v17;
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"NFCC Re-Init failed, return failed");
  sub_2259CAFDC(a1);
  char v19 = 1;
  if (v18 == 179) {
    a2 = 180;
  }
  else {
    a2 = 137;
  }
LABEL_34:
  uint64_t v4 = 146;
LABEL_12:
  a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, (uint64_t)&v19);
LABEL_14:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSignedSeqComplete");
  return a2;
}

uint64_t sub_225A396B8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrCmd");
  if (!a1 || *(unsigned char *)(a1 + 2939) == 1 || *(unsigned char *)(a1 + 2944) == 1)
  {
    uint64_t HsuMaxBaudRate = 0;
  }
  else if (!*(void *)(a1 + 6056) {
         || *(_DWORD *)(a1 + 3156) > 1u
  }
         || (sub_2259BC888(*(void *)(a1 + 19360), *(unsigned __int8 *)(a1 + 2988), *(unsigned __int8 *)(a1 + 3088)),
             uint64_t HsuMaxBaudRate = phTmlNfc_GetHsuMaxBaudRate(),
             !HsuMaxBaudRate))
  {
    if (phTmlNfc_ConfigHsuBaudRate())
    {
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrCmd : Check Hsu Baud Rate failed status");
      uint64_t HsuMaxBaudRate = 51;
    }
    else
    {
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigHsuBrCmd: Check succeeded with baudrate");
      phOsalNfc_Delay();
      uint64_t v4 = phTmlNfc_ConfigHsuBaudRate();
      if (v4)
      {
        uint64_t HsuMaxBaudRate = v4;
        sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrCmd : Re-Config to exixting Baud Rate failed status");
      }
      else
      {
        sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigHsuBrCmd: Re-Config to exixting Baud Rate succeeded");
        phOsalNfc_Delay();
        uint64_t HsuMaxBaudRate = sub_225A51598(*(void *)(a1 + 3040), *(_DWORD *)(a1 + 2948), (uint64_t)sub_2259B5A70, a1);
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrCmd");
  return HsuMaxBaudRate;
}

uint64_t sub_225A39878(uint64_t a1, uint64_t a2, _WORD *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrResp");
  if (!a1 || !a3)
  {
    BOOL v6 = "phLibNfc_ConfigHsuBrResp : Libnfc Context or pInfo is Invalid";
    int v7 = 2;
    char v8 = (unsigned int *)a1;
LABEL_6:
    sub_2259A0EAC(v7, v8, 4u, 1u, (uint64_t)v6);
LABEL_7:
    a2 = 255;
    goto LABEL_8;
  }
  if (a2)
  {
    sub_22599F8E0(2, 0, 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrResp: Failed to configure NFCC HSU baud rate");
    goto LABEL_8;
  }
  a2 = (unsigned __int16)*a3;
  if (!*a3)
  {
    if (*(unsigned char *)(a1 + 3161))
    {
      *(unsigned char *)(a1 + 3161) = 0;
      *(_DWORD *)(a1 + 3056) = *(_DWORD *)(a1 + 2948);
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC Configure HSU baud rate success after bBrRetryCnt");
      a2 = 0;
    }
    else
    {
      sub_2259B5D34(a1, *(void *)(a1 + 2912), 1);
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC Configure HSU baud rate success");
      a2 = phTmlNfc_ConfigHsuBaudRate();
      if (a2)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrResp: Failed to updated TML HSU baud rate");
      }
      else
      {
        *(_DWORD *)(a1 + 3056) = *(_DWORD *)(a1 + 2948);
        sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigHsuBrResp: TML HSU Baud rate Set to");
        phOsalNfc_Delay();
      }
    }
    goto LABEL_8;
  }
  if (a2 != 44)
  {
    sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"NFCC Configure HSU baud rate Failed after bBrRetryCnt");
    *(unsigned char *)(a1 + 3161) = 0;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(a1 + 3040);
  sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"New HSU BR request failed, bBrRetryCnt");
  if (*(unsigned __int8 *)(a1 + 3161) > 2u)
  {
    sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Baudrate retry reached max count, bBrRetryCnt");
    *(unsigned char *)(a1 + 3161) = 0;
    goto LABEL_7;
  }
  phTmlNfc_ReadAbort();
  phTmlNfc_FlushTxRxBuffers();
  int v11 = phTmlNfc_ConfigHsuBaudRate();
  if (!v10 || v11)
  {
    *(unsigned char *)(a1 + 3161) = 0;
    BOOL v6 = "phLibNfc_ConfigHsuBrResp: Cfg TML to new BR Failed";
    int v7 = 1;
    char v8 = (unsigned int *)(a1 + 19368);
    goto LABEL_6;
  }
  phOsalNfc_Delay();
  if (sub_22599F048(v10 + 920, 0, 3) == 13)
  {
    if (*(unsigned char *)(a1 + 3161))
    {
      sub_2259B5E14(a1, *(void *)(a1 + 2912), 1u);
      a2 = 0;
      char v12 = *(unsigned char *)(a1 + 3161) + 1;
    }
    else
    {
      a2 = 0;
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 1;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrResp: Nci Read request failed");
    sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"pLibContext->tPlatformInfo.bBrRetryCnt");
    a2 = 255;
  }
  *(unsigned char *)(a1 + 3161) = v12;
LABEL_8:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrResp");
  return a2;
}

uint64_t sub_225A39B88(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReApplyHsuBrCmd");
  if (a1)
  {
    if (*(unsigned char *)(a1 + 2939) == 1 || *(unsigned char *)(a1 + 2944) == 1)
    {
      uint64_t v2 = 0;
    }
    else
    {
      int v4 = sub_2259EB1A8((unsigned int *)a1, *(void *)(a1 + 2912));
      if (*(_DWORD *)(a1 + 3056) == 2 && v4 == 5)
      {
        uint64_t v2 = 0;
        *(unsigned char *)(a1 + 3161) = 0;
      }
      else
      {
        uint64_t v2 = sub_225A51598(*(void *)(a1 + 3040), *(_DWORD *)(a1 + 2948), (uint64_t)sub_2259B5A70, a1);
      }
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_ReApplyHsuBrCmd: Invalid LIBNFC context!!");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReApplyHsuBrCmd");
  return v2;
}

uint64_t sub_225A39C7C(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrSeqComplete");
  if (a1)
  {
    if (a2)
    {
      *(_DWORD *)(a1 + 3056) = 2;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"ConfigHsuBrSeqComplete: NFCC Config Baudrate failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invlaid LibNfc Ctx received from NCI");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrSeqComplete");
  return a2;
}

uint64_t sub_225A39D50(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartRfFieldOn");
  if (a1)
  {
    *(unsigned char *)(a1 + 6004) = 1;
    uint64_t v2 = sub_225A54864(*(void *)(a1 + 3040), 1, (uint64_t)sub_2259B5A70, a1);
    if (v2 != 13) {
      *(unsigned char *)(a1 + 6004) = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_AntennaTestCmd:Invalid Context");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartRfFieldOn");
  return v2;
}

uint64_t sub_225A39E1C(uint64_t a1)
{
  uint64_t v4 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetAntennaTestParams");
    LOBYTE(v4) = v4 & 0xFE | *(unsigned char *)(a1 + 5988) & 1;
    sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetAntennaTestParams");
    phOsalNfc_Delay();
    uint64_t v2 = sub_225A5470C(*(void *)(a1 + 3040), &v4, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 255;
    phOsalNfc_SetMemory();
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_AntennaTestCmd:Invalid Context");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestCmd");
  return v2;
}

uint64_t sub_225A39F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestResp");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if (!a2 && a3 && (BOOL v6 = *(unsigned char **)a3) != 0 && *(_DWORD *)(a3 + 8) == 3)
    {
      if (*v6)
      {
        int v7 = "phLibNfc_AntennaTestResp: received failed status";
      }
      else
      {
        if (*(unsigned char *)(a1 + 5988))
        {
          a2 = 0;
          int v9 = v6[1];
          *(_DWORD *)(a1 + 6000) = v9;
          *(_DWORD *)(a1 + 6000) = v9 | (v6[2] << 8);
          *(unsigned char *)(a1 + 5996) |= 1u;
          goto LABEL_10;
        }
        int v7 = "phLibNfc_AntennaTestResp: no of configs none";
      }
    }
    else
    {
      int v7 = "phLibNfc_AntennaTestResp: Antenna Self Test failed";
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v7);
    a2 = 255;
  }
LABEL_10:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestResp");
  return a2;
}

uint64_t sub_225A3A088(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StopRfFieldOn");
  if (a1)
  {
    uint64_t v2 = sub_225A54864(*(void *)(a1 + 3040), 0, (uint64_t)sub_2259B5A70, a1);
    if (v2 == 13) {
      *(unsigned char *)(a1 + 6004) = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_AntennaTestCmd:Invalid Context");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StopRfFieldOn");
  return v2;
}

uint64_t sub_225A3A140(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestSeqComplete");
  if (a1)
  {
    if (a2 == 143)
    {
      uint64_t v4 = 143;
LABEL_21:
      uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), 145, v4, 0, 0);
      goto LABEL_22;
    }
    if (!*(unsigned char *)(a1 + 6004) || *(uint64_t **)(a1 + 2912) == &qword_26B609498)
    {
      if (a2)
      {
        int v9 = (unsigned int *)(a1 + 19368);
        uint64_t v10 = "phLibNfc_AntennaTestSeqComplete: Failed status received from NFCC";
      }
      else
      {
        if (*(unsigned char *)(a1 + 5988) & 1) == 0 || (*(unsigned char *)(a1 + 5996))
        {
          uint64_t v4 = 0;
          goto LABEL_21;
        }
        int v9 = (unsigned int *)(a1 + 19368);
        uint64_t v10 = "phLibNfc_AntennaTestSeqComplete:TxLDO Current requested,same is not received";
      }
      sub_2259A0EAC(1, v9, 4u, 2u, (uint64_t)v10);
    }
    else
    {
      *(void *)(a1 + 2912) = &qword_26B609498;
      *(unsigned char *)(a1 + 2904) = 0;
      *(unsigned char *)(a1 + 2906) = 0;
      char v6 = qword_26B609498;
      if (qword_26B609498)
      {
        char v6 = 0;
        int v7 = &qword_26B6094A8;
        do
        {
          ++v6;
          uint64_t v8 = *v7;
          v7 += 2;
        }
        while (v8);
      }
      *(unsigned char *)(a1 + 2905) = v6;
      if (sub_2259B528C(a1, 0, 0) == 13)
      {
        uint64_t v5 = 13;
        goto LABEL_22;
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_AntennaTestSeqComplete: could not start RF Off sequence");
    }
    uint64_t v4 = 255;
    goto LABEL_21;
  }
  sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_AntennaTestSeqComplete: Invalid LibNfc Ctx received from NCI");
  uint64_t v5 = 255;
LABEL_22:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestSeqComplete");
  return v5;
}

uint64_t sub_225A3A2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  bzero(v15, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigLoggingCmd");
  if (a1)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 104);
    v15[1] = 0x10000;
    int v16 = 16;
    char v18 = 0;
    unsigned int v5 = v4 >> 4;
    if ((v4 & 0x5E7F) != 0x5E7F)
    {
      if ((v4 & 0x5E7F) != 0)
      {
        __int16 v9 = *(unsigned __int8 *)(a1 + 2944);
        int v7 = *(unsigned __int8 *)(a1 + 2937);
        int8x8_t v10 = vand_s8(vand_s8((int8x8_t)vdup_n_s16((unsigned __int16)v4 >> 3), (int8x8_t)0x200010000400080), (int8x8_t)vshl_u16((uint16x4_t)vdup_n_s16((*(unsigned char *)(a1 + 2938) | v7 | v9)), (uint16x4_t)0x9000800060007));
        int v6 = v10.i32[0] | v10.i32[1] | v4 & 3 | ((*(void *)&v10 | HIDWORD(*(void *)&v10)) >> 16) | (v4 >> 1) & 0x3C | (unsigned __int16)v5 & (unsigned __int16)(v9 << 10) & 0x400;
      }
      else
      {
        LOWORD(v6) = 0;
        int v7 = *(unsigned __int8 *)(a1 + 2937);
      }
LABEL_12:
      __int16 v17 = v6;
      if (*(unsigned char *)(a1 + 2936) == 1)
      {
        int v16 = 1040;
        char v18 = BYTE1(v4) & 1;
        if (v7 == 1) {
          goto LABEL_22;
        }
        int v13 = *(unsigned __int8 *)(a1 + 2938);
      }
      else
      {
        if (v7 == 1)
        {
          int v16 = 1040;
          char v18 = BYTE1(v4) & 1;
          goto LABEL_22;
        }
        int v13 = *(unsigned __int8 *)(a1 + 2938);
        if (v13 != 1 && *(unsigned char *)(a1 + 2944) != 1) {
          goto LABEL_21;
        }
        int v16 = 1040;
        char v18 = BYTE1(v4) & 1;
      }
      if (v13 == 1) {
        goto LABEL_22;
      }
LABEL_21:
      if (*(unsigned char *)(a1 + 2944) != 1)
      {
LABEL_23:
        a2 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)v15, (uint64_t)sub_2259B5A70, a1);
        goto LABEL_24;
      }
LABEL_22:
      __int16 v17 = v6 & 0xF7FF | v5 & 0x800;
      goto LABEL_23;
    }
    int v7 = *(unsigned __int8 *)(a1 + 2937);
    char v8 = *(unsigned char *)(a1 + 2937);
    if (*(unsigned char *)(a1 + 2936) != 1)
    {
      if (v7 == 1)
      {
        char v8 = 1;
      }
      else
      {
        char v8 = *(unsigned char *)(a1 + 2937);
        if (*(unsigned char *)(a1 + 2938) != 1)
        {
          char v8 = *(unsigned char *)(a1 + 2937);
          if (*(unsigned char *)(a1 + 2944) != 1)
          {
            LOWORD(v6) = 3;
            goto LABEL_12;
          }
        }
      }
    }
    char v11 = *(unsigned char *)(a1 + 2944);
    char v12 = *(unsigned char *)(a1 + 2938) | v8 | v11;
    LOWORD(v6) = ((v12 << 7) | ((v12 & 1) << 6)) | 0x1F | ((v12 & 1) << 8) | (32 * (v12 & 1)) | ((v12 & 1) << 9) | ((v11 & 1) << 10);
    goto LABEL_12;
  }
LABEL_24:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigLoggingCmd");
  return a2;
}

uint64_t sub_225A3A580(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
      && (*(unsigned char *)(a1 + 104) & 3) != 0)
    {
      phOsalNfc_SetMemory();
      *(_DWORD *)(a1 + 3564) |= 0x10000u;
      *(_DWORD *)(a1 + 5096) |= 0x40000u;
      a2 = sub_225A52F04(*(void *)(a1 + 3040), a1 + 3560, (uint64_t)sub_2259B5A70, a1);
    }
  }
  else
  {
    a2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMeasuredFsRssiCfgCmd");
  return a2;
}

uint64_t sub_225A3A674(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMeasuredFsRssiCfgProc");
  if (a1)
  {
    if (a2)
    {
      unsigned int v4 = (unsigned int *)(a1 + 19368);
      unsigned int v5 = "phLibNfc_GetMeasuredFsRssiCfgProc: Status Failed!";
    }
    else
    {
      if (*(unsigned char *)(a1 + 2937) == 1 && *(unsigned char *)(a1 + 5295) == 4
        || *(unsigned char *)(a1 + 2938) == 1 && *(unsigned char *)(a1 + 5295) == 5
        || *(unsigned char *)(a1 + 2944) == 1 && *(unsigned char *)(a1 + 5295) == 8)
      {
        uint64_t v7 = 0;
        *(unsigned char *)(a1 + 306) = *(unsigned char *)(a1 + 5283);
        *(_WORD *)(a1 + 304) = *(_WORD *)(a1 + 5281);
        goto LABEL_7;
      }
      unsigned int v4 = (unsigned int *)(a1 + 19368);
      unsigned int v5 = "phLibNfc_GetMeasuredFsRssiCfgProc: Invalid length received!";
    }
    int v6 = 1;
  }
  else
  {
    unsigned int v5 = "phLibNfc_GetMeasuredFsRssiCfgProc:Context is Null";
    int v6 = 2;
    unsigned int v4 = 0;
  }
  sub_2259A0EAC(v6, v4, 4u, 1u, (uint64_t)v5);
  uint64_t v7 = 255;
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMeasuredFsRssiCfgProc");
  return v7;
}

uint64_t sub_225A3A790(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigLoggingSeqComp");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"ConfigureLogging: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigLoggingSeqComp");
  return a2;
}

uint64_t sub_225A3A83C(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  bzero(v5, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigAssertLoggingCmd");
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 32);
    v5[1] = 0x10000;
    v5[384] = 32;
    char v6 = v2;
    uint64_t v3 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)v5, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v3 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigAssertLoggingCmd");
  return v3;
}

uint64_t sub_225A3A944(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigAssertLoggingSeqComp");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"ConfigureAssertionLogging: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigAssertLoggingSeqComp");
  return a2;
}

uint64_t sub_225A3A9F0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfOnNtf");
  if (a1)
  {
    uint64_t v2 = sub_225A54A54(*(void *)(a1 + 3040), *(unsigned __int8 *)(a1 + 718), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_TriggerRfOnNtf:Invalid Context");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfOnNtf");
  return v2;
}

uint64_t sub_225A3AA98(unsigned int *a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_225A3AB00(uint64_t a1, uint64_t a2)
{
  if (a1) {
    a2 = sub_225A24FAC(*(void *)(a1 + 19360), 145, a2, 0, 0);
  }
  else {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_TriggerRfSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfSeqComplete");
  return a2;
}

uint64_t sub_225A3ABA0(uint64_t a1)
{
  __int16 v5 = 0;
  int v4 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPageCountCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    LOBYTE(v4) = 0;
    uint64_t v2 = sub_225A55ECC(*(void *)(a1 + 3040), (uint64_t)&v4, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPageCountCmd");
  return v2;
}

uint64_t sub_225A3AC74(uint64_t a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPageCountProc");
  if (a1 && !a2 && a3 && (char v6 = *(unsigned char **)a3) != 0)
  {
    if (*v6 || *(_DWORD *)(a3 + 8) != 5)
    {
      __int16 v9 = (unsigned int *)(a1 + 19368);
      int8x8_t v10 = "phLibNfc_GetPageCountProc: received failed status or invalid response length";
    }
    else
    {
      int v7 = v6[3];
      *(_WORD *)(a1 + 5832) = v7;
      int v8 = v7 | (v6[4] << 8);
      *(_WORD *)(a1 + 5832) = v8;
      if ((v8 - 65) >= 0xFFFFFFC0)
      {
        if (!*(void *)(a1 + 5840))
        {
          uint64_t Memory = phOsalNfc_GetMemory();
          *(void *)(a1 + 5840) = Memory;
          if (!Memory)
          {
            int8x8_t v10 = "phLibNfc_GetPageCountProc: Failed to allocate memory";
            int v11 = 1;
            __int16 v9 = (unsigned int *)(a1 + 19368);
            goto LABEL_12;
          }
          phOsalNfc_SetMemory();
        }
        uint64_t v12 = 0;
        goto LABEL_13;
      }
      __int16 v9 = (unsigned int *)(a1 + 19368);
      int8x8_t v10 = "phLibNfc_GetPageCountProc: Total page count is zero or exceeded maximum number of flash page count ";
    }
    int v11 = 1;
  }
  else
  {
    int8x8_t v10 = "phLibNfc_GetPageCountProc: Get page count operation failed";
    int v11 = 2;
    __int16 v9 = (unsigned int *)a1;
  }
LABEL_12:
  sub_2259A0EAC(v11, v9, 4u, 1u, (uint64_t)v10);
  uint64_t v12 = 255;
LABEL_13:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPageCountProc");
  return v12;
}

uint64_t sub_225A3ADCC(uint64_t a1)
{
  __int16 v5 = 0;
  int v4 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    LOBYTE(v4) = 1;
    HIWORD(v4) = *(_WORD *)(a1 + 5834);
    __int16 v5 = 32;
    if (*(unsigned __int16 *)(a1 + 5832) - HIWORD(v4) <= 31) {
      __int16 v5 = *(_WORD *)(a1 + 5832) - HIWORD(v4);
    }
    uint64_t v2 = sub_225A55ECC(*(void *)(a1 + 3040), (uint64_t)&v4, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterCmd");
  return v2;
}

uint64_t sub_225A3AEC8(uint64_t a1, int a2, uint64_t *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterProc");
  if (!a1 || a2 || !a3 || (uint64_t v6 = *a3) == 0)
  {
    int v13 = "phLibNfc_GetEraseCounterProc: Get erase counter operation failed";
    int v14 = 2;
    int8x8_t v10 = (unsigned int *)a1;
LABEL_17:
    sub_2259A0EAC(v14, v10, 4u, 1u, (uint64_t)v13);
    uint64_t v12 = 255;
    goto LABEL_18;
  }
  if (*(unsigned char *)v6 || (int v7 = *((_DWORD *)a3 + 2), (v7 - 9) > 0x7D))
  {
    int8x8_t v10 = (unsigned int *)(a1 + 19368);
    int v13 = "phLibNfc_GetEraseCounterProc: received failed status or invalid response length";
LABEL_16:
    int v14 = 1;
    goto LABEL_17;
  }
  int v8 = *(unsigned __int16 *)(v6 + 1);
  if (v8 != *(unsigned __int16 *)(a1 + 5834)
    || (int v9 = *(unsigned __int16 *)(v6 + 3), v9 > *(unsigned __int16 *)(a1 + 5832) - v8)
    || v7 - 5 != 4 * v9)
  {
    int8x8_t v10 = (unsigned int *)(a1 + 19368);
    int v13 = "phLibNfc_GetEraseCounterProc: Invalid data received from NFCC";
    goto LABEL_16;
  }
  int8x8_t v10 = (unsigned int *)(a1 + 19368);
  if (!*(void *)(a1 + 5840))
  {
    int v13 = "phLibNfc_GetEraseCounterProc: Invalid memory";
    goto LABEL_16;
  }
  phOsalNfc_MemCopy();
  unsigned __int16 v11 = *(_WORD *)(a1 + 5834) + v9;
  *(_WORD *)(a1 + 5834) = v11;
  if (*(unsigned __int16 *)(a1 + 5832) > v11) {
    sub_2259B5E14(a1, *(void *)(a1 + 2912), 1u);
  }
  uint64_t v12 = 0;
LABEL_18:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterProc");
  return v12;
}

uint64_t sub_225A3B03C(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(v16, 0, sizeof(v16));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterSeqComplete");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetEraseCounterSeqComplete: Failed");
      int v4 = 0;
      uint64_t v5 = 146;
    }
    else
    {
      LODWORD(v16[0]) = 10;
      WORD4(v16[0]) = *(_WORD *)(a1 + 5834);
      if (WORD4(v16[0]))
      {
        uint64_t v7 = 0;
        uint64_t v8 = *(void *)(a1 + 5840);
        uint64_t v9 = 4 * WORD4(v16[0]);
        do
        {
          int v10 = *(unsigned __int8 *)(v8 + (unsigned __int16)v7);
          int v4 = v16;
          unsigned __int16 v11 = (char *)v16 + v7;
          *((_DWORD *)v11 + 3) = v10;
          int v12 = v10 | (*(unsigned __int8 *)(v8 + ((unsigned __int16)v7 | 1)) << 8);
          *((_DWORD *)v11 + 3) = v12;
          uint64_t v13 = (unsigned __int16)v7 | 3;
          int v14 = v12 | (*(unsigned __int8 *)(v8 + ((unsigned __int16)v7 | 2)) << 16);
          *((_DWORD *)v11 + 3) = v14;
          v7 += 4;
          *((_DWORD *)v11 + 3) = v14 | (*(unsigned __int8 *)(v8 + v13) << 24);
        }
        while (v9 != v7);
      }
      else
      {
        int v4 = v16;
      }
      uint64_t v5 = 145;
    }
    uint64_t v6 = sub_225A24FAC(*(void *)(a1 + 19360), v5, a2, (uint64_t)v4, 0);
    if (*(void *)(a1 + 5840))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 5840) = 0;
    }
    phOsalNfc_SetMemory();
  }
  else
  {
    uint64_t v6 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetEraseCounterSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterSeqComplete");
  return v6;
}

uint64_t sub_225A3B238(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetProhibitTimerStsCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A55FFC(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetProhibitTimerStsCmd: Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetProhibitTimerStsCmd");
  return v2;
}

uint64_t sub_225A3B2DC(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v11, 0, sizeof(v11));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete");
  if (a1 && a3)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete: Failed");
      uint64_t v6 = 0;
      uint64_t v7 = 146;
    }
    else
    {
      phOsalNfc_SetMemory();
      unsigned int v9 = *a3;
      if (v9 <= 0xB && ((1 << v9) & 0xC01) != 0)
      {
        a2 = 0;
        LODWORD(v11[0]) = 11;
        DWORD2(v11[0]) = v9;
        HIDWORD(v11[0]) = *(_DWORD *)(a3 + 2);
        uint64_t v6 = v11;
        uint64_t v7 = 145;
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete: Failed, Received unknown Timer ID");
        uint64_t v6 = 0;
        uint64_t v7 = 146;
        a2 = 255;
      }
    }
    uint64_t v8 = sub_225A24FAC(*(void *)(a1 + 19360), v7, a2, (uint64_t)v6, 0);
  }
  else
  {
    uint64_t v8 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete: Invalid LibNfc Ctx received from NCI");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete");
  return v8;
}

uint64_t sub_225A3B4A0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPowerTrackDataCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A56118(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPowerTrackDataCmd");
  return v2;
}

uint64_t sub_225A3B544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
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
  long long v11 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPowerTrackDataSeqComplete");
  if (a1 && a3)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetPowerTrackDataSeqComplete: Failed");
      uint64_t v6 = 0;
      uint64_t v7 = 146;
    }
    else
    {
      uint64_t v6 = &v11;
      phOsalNfc_SetMemory();
      LODWORD(v11) = 0;
      *((void *)&v11 + 1) = *(void *)a3;
      LODWORD(v12) = *(_DWORD *)(a3 + 8);
      BYTE4(v12) = *(unsigned char *)(a3 + 12);
      *(_WORD *)((char *)&v12 + 5) = *(_WORD *)(a3 + 13);
      *((void *)&v12 + 1) = *(void *)(a3 + 16);
      unsigned int v9 = *(_DWORD *)(a3 + 24);
      DWORD2(v13) = 0;
      uint64_t v7 = 145;
      *(void *)&long long v13 = v9;
    }
    uint64_t v8 = sub_225A24FAC(*(void *)(a1 + 19360), v7, a2, (uint64_t)v6, 0);
  }
  else
  {
    uint64_t v8 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_GetPowerTrackDataSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPowerTrackDataSeqComplete");
  return v8;
}

uint64_t sub_225A3B6DC(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwio1VoltageCmd");
  if (a1)
  {
    *(unsigned char *)(a1 + 6025) = 1;
    uint64_t v2 = sub_225A55C98(*(void *)(a1 + 3040), 1, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSwio1VoltageCmd: Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwio1VoltageCmd");
  return v2;
}

uint64_t sub_225A3B790(uint64_t a1, int a2, unsigned char **a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwioPadVoltageProc");
  if (!a1)
  {
    uint64_t v8 = "phLibNfc_GetSwioPadVoltageProc: Invalid parameter, Libnfc Context is Invalid";
    int v9 = 2;
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  if (a2 || !a3 || (uint64_t v6 = *a3) == 0)
  {
    uint64_t v7 = (unsigned int *)(a1 + 19368);
    uint64_t v8 = "phLibNfc_GetSwioPadVoltageProc: read voltage of SWIO operation failed";
    goto LABEL_8;
  }
  if (*v6)
  {
    uint64_t v7 = (unsigned int *)(a1 + 19368);
    uint64_t v8 = "phLibNfc_GetSwioPadVoltageProc: received failed status";
LABEL_8:
    int v9 = 1;
LABEL_10:
    sub_2259A0EAC(v9, v7, 4u, 1u, (uint64_t)v8);
    goto LABEL_11;
  }
  int v12 = *(unsigned __int8 *)(a1 + 6025);
  if (v12 == 2)
  {
    uint64_t v10 = 0;
    __int16 v14 = v6[1];
    *(_WORD *)(a1 + 5570) = v14;
    *(_WORD *)(a1 + 5570) = v14 | (v6[2] << 8);
    goto LABEL_12;
  }
  if (v12 == 1)
  {
    uint64_t v10 = 0;
    __int16 v13 = v6[1];
    *(_WORD *)(a1 + 5568) = v13;
    *(_WORD *)(a1 + 5568) = v13 | (v6[2] << 8);
    goto LABEL_12;
  }
  sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetSwioPadVoltageProc: Unknown SWIO pad no");
LABEL_11:
  uint64_t v10 = 255;
LABEL_12:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwioPadVoltageProc");
  return v10;
}

uint64_t sub_225A3B8D8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwio2VoltageCmd");
  if (a1)
  {
    *(unsigned char *)(a1 + 6025) = 2;
    uint64_t v2 = sub_225A55C98(*(void *)(a1 + 3040), 2, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSwio2VoltageCmd: Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwio2VoltageCmd");
  return v2;
}

uint64_t sub_225A3B98C(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(v7, 0, sizeof(v7));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwioPadVoltageSeqComplete");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetSwioPadVoltageSeqComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      LODWORD(v7[0]) = 8;
      phOsalNfc_MemCopy();
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, (uint64_t)v7, 0);
    *(unsigned char *)(a1 + 6025) = 0;
  }
  else
  {
    uint64_t v5 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSwioPadVoltageSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwioPadVoltageSeqComplete");
  return v5;
}

uint64_t sub_225A3BB10(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A55DB8(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSwio1VoltageCmd: Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerCmd");
  return v2;
}

uint64_t sub_225A3BBB4(uint64_t a1, int a2, unsigned char **a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerProc");
  if (a1)
  {
    if (!a2 && a3 && (uint64_t v6 = *a3) != 0)
    {
      if (!*v6)
      {
        uint64_t v10 = 0;
        __int16 v12 = v6[1];
        *(_WORD *)(a1 + 5568) = v12;
        *(_WORD *)(a1 + 5568) = v12 | (v6[2] << 8);
        goto LABEL_11;
      }
      uint64_t v7 = (unsigned int *)(a1 + 19368);
      uint64_t v8 = "phLibNfc_GetTrimVerProc: received failed status";
    }
    else
    {
      uint64_t v7 = (unsigned int *)(a1 + 19368);
      uint64_t v8 = "phLibNfc_GetTrimVerProc: Get Trim version operation failed";
    }
    int v9 = 1;
  }
  else
  {
    uint64_t v8 = "phLibNfc_GetTrimVerProc: Invalid parameter, Libnfc Context is Invalid";
    int v9 = 2;
    uint64_t v7 = 0;
  }
  sub_2259A0EAC(v9, v7, 4u, 1u, (uint64_t)v8);
  uint64_t v10 = 255;
LABEL_11:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerProc");
  return v10;
}

uint64_t sub_225A3BCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(v7, 0, sizeof(v7));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerSeqComplete");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetTrimVerSeqComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      LODWORD(v7[0]) = 9;
      WORD4(v7[0]) = *(_WORD *)(a1 + 5568);
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, (uint64_t)v7, 0);
  }
  else
  {
    uint64_t v5 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetTrimVerSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerSeqComplete");
  return v5;
}

uint64_t sub_225A3BE00(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSmbLogCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A564F4(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSmbLogCmd");
  return v2;
}

uint64_t sub_225A3BEA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
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
  long long v9 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSmbLogProcComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetSmbLogProcComplete: Failed");
      uint64_t v6 = 146;
    }
    else
    {
      phOsalNfc_SetMemory();
      LODWORD(v9) = 1;
      if (a3 && *(_DWORD *)(a3 + 8) && *(void *)a3)
      {
        LODWORD(v10) = *(_DWORD *)(a3 + 8);
        *((void *)&v9 + 1) = phOsalNfc_GetMemory();
        if (*((void *)&v9 + 1)) {
          phOsalNfc_MemCopy();
        }
      }
      else
      {
        LODWORD(v10) = 0;
        *((void *)&v9 + 1) = 0;
      }
      uint64_t v6 = 145;
    }
    uint64_t v7 = sub_225A24FAC(*(void *)(a1 + 19360), v6, a2, (uint64_t)&v9, 0);
    if (*((void *)&v9 + 1))
    {
      phOsalNfc_FreeMemory();
      *((void *)&v9 + 1) = 0;
    }
  }
  else
  {
    uint64_t v7 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSmbLogProcComplete: Invlaid LibNfc Ctx");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSmbLogProcComplete");
  return v7;
}

uint64_t sub_225A3C060(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetHlmDbgLogCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A5671C(*(void *)(a1 + 3040), 0, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetHlmDbgLogCmd");
  return v2;
}

uint64_t sub_225A3C108(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetHlmDbgLogProcComplete");
  if (!a1)
  {
    uint64_t v6 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSmbLogProcComplete: Invlaid LibNfc Ctx");
    goto LABEL_13;
  }
  phOsalNfc_SetMemory();
  *(_DWORD *)(a1 + 5560) = 5;
  if (a2 || !a3)
  {
    if (a3) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = 255;
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetHlmDbgLogProcComplete: Failed");
    *(void *)(a1 + 5576) = 0;
    uint64_t v8 = *(void *)(a1 + 19360);
    uint64_t v9 = 146;
    uint64_t v10 = v7;
    goto LABEL_12;
  }
  *(unsigned char *)(a1 + 5568) = *(unsigned char *)a3;
  *(unsigned char *)(a1 + 5569) = *(unsigned char *)(a3 + 1);
  uint64_t v12 = *(void *)(a3 + 8);
  LODWORD(v13) = *(unsigned __int16 *)(a3 + 2);
  if (!v13)
  {
    uint64_t v8 = *(void *)(a1 + 19360);
    uint64_t v9 = 145;
    uint64_t v10 = 0;
LABEL_12:
    uint64_t v6 = sub_225A24FAC(v8, v9, v10, a1 + 5560, 0);
    goto LABEL_13;
  }
  sub_225A3FCD8(a1, 9, &v12);
  uint64_t v6 = 0;
LABEL_13:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetHlmDbgLogProcComplete");
  return v6;
}

uint64_t sub_225A3C284(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A56608(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntCmd");
  return v2;
}

uint64_t sub_225A3C328(unsigned int *a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc: Libnfc Context is Invalid");
LABEL_7:
    uint64_t v7 = 255;
    goto LABEL_8;
  }
  uint64_t v6 = a1 + 4842;
  if (a2 || !a3)
  {
    sub_2259A0EAC(1, v6, 4u, 2u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc: operation failed");
    goto LABEL_7;
  }
  sub_2259A0EAC(1, v6, 4u, 4u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc: operation success");
  uint64_t v7 = 0;
LABEL_8:
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc");
  return v7;
}

uint64_t sub_225A3C404(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v10, 0, sizeof(v10));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntComplete");
  if (a1)
  {
    if (a2 || !a3)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntComplete: Failed");
      uint64_t v7 = 146;
      uint64_t v6 = 255;
    }
    else
    {
      phOsalNfc_SetMemory();
      LODWORD(v10[0]) = 3;
      phOsalNfc_MemCopy();
      phOsalNfc_MemCopy();
      phOsalNfc_MemCopy();
      uint64_t v6 = 0;
      uint64_t v7 = 145;
    }
    uint64_t v8 = sub_225A24FAC(*(void *)(a1 + 19360), v7, v6, (uint64_t)v10, 0);
  }
  else
  {
    uint64_t v8 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntComplete: Invalid LibNfc Ctx");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntComplete");
  return v8;
}

uint64_t sub_225A3C5AC(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetVasCodeCfgCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A56C64(*(void *)(a1 + 3040), 4, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetVasCodeCfgCmd : Libnfc Context is Invalid");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetVasCodeCfgCmd");
  return v2;
}

uint64_t sub_225A3C654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetVasCodeCfgComplete");
  if (a1)
  {
    if (a2 || !a3)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetVasCodeCfgComplete: Failed");
      a3 = 0;
      uint64_t v6 = 146;
    }
    else
    {
      uint64_t v6 = 145;
    }
    uint64_t v7 = sub_225A24FAC(*(void *)(a1 + 19360), v6, a2, a3, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSetRfTransRegCfgComplete: Invlaid LibNfc Ctx");
    uint64_t v7 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetVasCodeCfgComplete");
  return v7;
}

uint64_t sub_225A3C738(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSuicaSysCodeCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_DWORD *)(a1 + 3564) |= 0x10000u;
    *(_DWORD *)(a1 + 5096) |= 0x8000u;
    uint64_t v2 = sub_225A52F04(*(void *)(a1 + 3040), a1 + 3560, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSuicaSysCodeCmd : Libnfc Context is Invalid");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSuicaSysCodeCmd");
  return v2;
}

uint64_t sub_225A3C814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSuicaSysCodeComplete");
  if (a1)
  {
    if (a2 || !a3)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetSuicaSysCodeComplete: Failed");
      uint64_t v6 = 146;
    }
    else
    {
      phOsalNfc_SetMemory();
      *(_DWORD *)(a1 + 5560) = 6;
      *(unsigned char *)(a1 + 5568) = *(unsigned char *)(a3 + 1662);
      *(unsigned char *)(a1 + 5569) = *(unsigned char *)(a3 + 1663);
      *(_WORD *)(a1 + 5570) = *(_WORD *)(a3 + 1664);
      *(_WORD *)(a1 + 5572) = *(_WORD *)(a3 + 1666);
      uint64_t v6 = 145;
    }
    uint64_t v7 = sub_225A24FAC(*(void *)(a1 + 19360), v6, a2, a1 + 5560, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSetRfTransRegCfgComplete: Invlaid LibNfc Ctx");
    uint64_t v7 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSuicaSysCodeComplete");
  return v7;
}

uint64_t sub_225A3C940(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  bzero(v4, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSmbCfgCmd");
  if (a1)
  {
    int v5 = 0x4000;
    char v6 = 1;
    phOsalNfc_MemCopy();
    if (*(_DWORD *)(a1 + 5424) == 1)
    {
      char v8 = 0;
      v6 |= 6u;
      phOsalNfc_MemCopy();
      v6 |= 8u;
      phOsalNfc_MemCopy();
    }
    else
    {
      char v7 = 0;
    }
    uint64_t v2 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)v4, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetSmbCfgCmd : Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSmbCfgCmd");
  return v2;
}

uint64_t sub_225A3CAE0(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSmbCfgComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetSmbCfgComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    uint64_t v5 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetSmbCfgComplete: Invlaid LibNfc Ctx");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSmbCfgComplete");
  return v5;
}

uint64_t sub_225A3CBB0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  bzero(v4, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetHLMCfgCmd");
  if (a1)
  {
    v4[1] = 0x10000;
    v4[384] = 4096;
    char v5 = *(_DWORD *)(a1 + 5424);
    uint64_t v2 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)v4, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetHLMCfgCmd : Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetHLMCfgCmd");
  return v2;
}

uint64_t sub_225A3CCB8(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HLMCfgComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HLMCfgComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    uint64_t v5 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_HLMCfgComplete: Invlaid LibNfc Ctx");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HLMCfgComplete");
  return v5;
}

uint64_t sub_225A3CD88(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  bzero(v6, 0x6E8uLL);
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetMultiTagCfgCmd");
  if (!a1)
  {
    uint64_t v4 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetMultiTagCfgCmd : Libnfc Context is Invalid");
    goto LABEL_17;
  }
  v6[1] = 0x10000;
  v6[384] = 0x20000;
  phOsalNfc_SetMemory();
  char v2 = *(unsigned char *)(a1 + 5424);
  if ((v2 & 8) != 0)
  {
    v7 |= 1u;
    if ((v2 & 1) == 0)
    {
LABEL_4:
      if ((v2 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)(a1 + 5424) & 1) == 0)
  {
    goto LABEL_4;
  }
  v7 |= 2u;
  if ((v2 & 2) == 0)
  {
LABEL_5:
    if ((v2 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v7 |= 4u;
  if ((v2 & 4) == 0)
  {
LABEL_6:
    if ((v2 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v7 |= 8u;
  if ((v2 & 0x10) == 0)
  {
LABEL_7:
    if ((v2 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v7 |= 0x10u;
  if ((v2 & 0x20) == 0)
  {
LABEL_8:
    if ((v2 & 0x40) == 0) {
      goto LABEL_9;
    }
LABEL_24:
    v7 |= 0x40u;
    if ((v2 & 0x80) == 0) {
      goto LABEL_10;
    }
LABEL_25:
    v7 |= 0x80u;
    goto LABEL_10;
  }
LABEL_23:
  v7 |= 0x20u;
  if ((v2 & 0x40) != 0) {
    goto LABEL_24;
  }
LABEL_9:
  if (v2 < 0) {
    goto LABEL_25;
  }
LABEL_10:
  __int16 v8 = *(_WORD *)(a1 + 5428);
  if (*(unsigned char *)(a1 + 5435) == 1) {
    v9 |= 1u;
  }
  char v10 = *(unsigned char *)(a1 + 5436);
  if (*(unsigned __int16 *)(a1 + 5438) <= 0x9F6u) {
    char v3 = *(_WORD *)(a1 + 5438) / 0xAu;
  }
  else {
    char v3 = -1;
  }
  char v11 = v3;
  char v12 = 8;
  uint64_t v4 = sub_225A522FC(*(void *)(a1 + 3040), (uint64_t)v6, (uint64_t)sub_2259B5A70, a1);
LABEL_17:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetMultiTagCfgCmd");
  return v4;
}

uint64_t sub_225A3CFA0(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetClearMultiTagCfgComp");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetClearMultiTagCfgComp: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    uint64_t v5 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetClearMultiTagCfgComp: Invlaid LibNfc Ctx");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetClearMultiTagCfgComp");
  return v5;
}

uint64_t sub_225A3D070(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A517A4(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoCmd : Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoCmd");
  return v2;
}

uint64_t sub_225A3D114(uint64_t a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoProc");
  if (!a1)
  {
    char v7 = "phLibNfc_GetMultiTagInfoProc : Libnfc Context is Invalid";
    int v8 = 2;
    char v9 = 0;
    goto LABEL_10;
  }
  if (a2 || !a3 || (uint64_t v6 = *(unsigned char **)a3) == 0 || !*(_DWORD *)(a3 + 8))
  {
    char v9 = (unsigned int *)(a1 + 19368);
    char v7 = "phLibNfc_GetMultiTagInfoProc: operation failed";
    int v8 = 1;
    goto LABEL_10;
  }
  if (*v6)
  {
    char v7 = "phLibNfc_GetMultiTagInfoProc: received failed status";
    int v8 = 1;
    char v9 = (unsigned int *)(a1 + 19368);
LABEL_10:
    sub_2259A0EAC(v8, v9, 4u, 1u, (uint64_t)v7);
    goto LABEL_11;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_GetMultiTagInfoProc: Get Multi-tag info response received with success");
  phOsalNfc_SetMemory();
  *(_DWORD *)(a1 + 5560) = 7;
  *(unsigned char *)(a1 + 5568) = v6[1];
  unsigned __int8 v16 = 3;
  int v12 = v6[2];
  *(unsigned char *)(a1 + 5569) = v12;
  unsigned __int8 v13 = 5 * v12 + 4;
  if (v12)
  {
    if (*(_DWORD *)(a3 + 8) >= v13)
    {
      *(void *)(a1 + 5576) = phOsalNfc_GetMemory();
      phOsalNfc_SetMemory();
      sub_225A411D4((unsigned int *)a1, &v16, *(unsigned __int8 *)(a1 + 5569), 0, *(unsigned char **)(a1 + 5576), (uint64_t *)a3);
      uint64_t v10 = 0;
      unsigned int v14 = v16;
      goto LABEL_19;
    }
    *(void *)(a1 + 5576) = 0;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoProc: Tag of interest detected but partial info received");
    sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"bNumTags");
    uint64_t v10 = 255;
  }
  else
  {
    uint64_t v10 = 0;
    *(void *)(a1 + 5576) = 0;
  }
  unsigned int v14 = 3;
LABEL_19:
  unsigned __int8 v16 = v14 + 1;
  int v15 = v6[v14];
  *(unsigned char *)(a1 + 5584) = v15;
  if (!v15)
  {
    *(void *)(a1 + 5592) = 0;
    goto LABEL_12;
  }
  if (*(_DWORD *)(a3 + 8) >= (v15 + v13))
  {
    *(void *)(a1 + 5592) = phOsalNfc_GetMemory();
    phOsalNfc_SetMemory();
    sub_225A411D4((unsigned int *)a1, &v16, *(unsigned __int8 *)(a1 + 5584), 1, *(unsigned char **)(a1 + 5592), (uint64_t *)a3);
    goto LABEL_12;
  }
  *(void *)(a1 + 5592) = 0;
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoProc: Tag of Not interest detected but partial info received");
  sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"bNumTags");
LABEL_11:
  uint64_t v10 = 255;
LABEL_12:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoProc");
  return v10;
}

uint64_t sub_225A3D3E0(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoComp");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoComp: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, a1 + 5560, 0);
    if (*(void *)(a1 + 5576))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 5576) = 0;
    }
    if (*(void *)(a1 + 5592))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 5592) = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoComp: Invalid LibNfc Ctx");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoComp");
  return v5;
}

uint64_t sub_225A3D4F0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClearMultiTagInfoCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A518C4(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_ClearMultiTagInfoCmd : Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClearMultiTagInfoCmd");
  return v2;
}

uint64_t sub_225A3D594(uint64_t a1)
{
  __int16 v4 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestMode");
  if (a1)
  {
    uint64_t v2 = sub_225A500C4(*(void *)(a1 + 2952), (uint64_t)&v4, (uint64_t)sub_2259B528C, a1, 0, 0);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestMode");
  return v2;
}

uint64_t sub_225A3D650(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeRspCb");
  if (a1 && a3)
  {
    uint64_t v6 = (unsigned __int16 *)a3[1];
    int v7 = a2;
    if (v6 && (int v7 = *v6, v7 == 44))
    {
      sub_2259B5E14(a1, (uint64_t)off_26B6096C8, 1u);
    }
    else if (!v7)
    {
      uint64_t v8 = *a3;
      *(void *)(a1 + 3040) = *a3;
      if (sub_2259E8F40(a1, v8)
        || !sub_2259BC888(*(void *)(a1 + 19360), *(unsigned __int8 *)(a1 + 2988), *(unsigned __int8 *)(a1 + 3088)))
      {
        a2 = 255;
      }
      else if (*(_DWORD *)(a1 + 19328) == 1)
      {
        sub_2259B5D34(a1, *(void *)(a1 + 2912), 1);
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeRspCb");
  return a2;
}

uint64_t sub_225A3D748(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeComplete");
  if (a1)
  {
    if (a2) {
      uint64_t v4 = 146;
    }
    else {
      uint64_t v4 = 145;
    }
    sub_225A24FAC(*(void *)(a1 + 2952), v4, a2, 0, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeComplete");
  return a2;
}

uint64_t sub_225A3D7CC(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetVasCodeCfgCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A56AD8(*(void *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetVasCodeCfgCmd : Libnfc Context is Invalid");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetVasCodeCfgCmd");
  return v2;
}

uint64_t sub_225A3D878(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetVasCodeCfgComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetVasCodeCfgComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetVasCodeCfgComplete: Invlaid LibNfc Ctx");
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetVasCodeCfgComplete");
  return v5;
}

uint64_t sub_225A3D948(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RFParaUpdateCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A56AD8(*(void *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_RFParaUpdateCmd : Libnfc Context is Invalid");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RFParaUpdateCmd");
  return v2;
}

uint64_t sub_225A3D9F4(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RFParaUpdateComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_RFParaUpdateComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_RFParaUpdateComplete: Invlaid LibNfc Ctx");
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RFParaUpdateComplete");
  return v5;
}

uint64_t sub_225A3DAC4(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_DWORD *)(a1 + 3564) |= 0x10000u;
    *(_DWORD *)(a1 + 5096) |= 0x8000u;
    *(_WORD *)(a1 + 5222) = *(_WORD *)(a1 + 5424);
    *(_DWORD *)(a1 + 5224) = *(_DWORD *)(a1 + 5426);
    uint64_t v2 = sub_225A522FC(*(void *)(a1 + 3040), a1 + 3560, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeCmd : Libnfc Context is Invalid");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeCmd");
  return v2;
}

uint64_t sub_225A3DBC8(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeComplete: Invlaid LibNfc Ctx");
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeComplete");
  return v5;
}

uint64_t sub_225A3DC98(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOff");
  if (a1)
  {
    uint64_t v2 = sub_225A542B4(*(unsigned int **)(a1 + 3040), 0, (uint64_t)sub_2259B528C, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOff");
  return v2;
}

uint64_t sub_225A3DD40(unsigned int *a1, uint64_t a2)
{
  if (a2) {
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"ConfigTestModeOff: Failed");
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOffRspCb");
  return a2;
}

uint64_t sub_225A3DDC0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    sub_225A24FAC(*(void *)(a1 + 2952), 145, a2, 0, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOffComplete");
  return a2;
}

uint64_t sub_225A3DE3C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd");
  if (a1)
  {
    uint64_t v2 = sub_225A56AD8(*(void *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd : Libnfc Context is Invalid");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd");
  return v2;
}

uint64_t sub_225A3DEE8(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgComplete: Invlaid LibNfc Ctx");
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgComplete");
  return v5;
}

uint64_t sub_225A3DFB8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCWRFCfgCmd");
  if (!a1)
  {
    uint64_t v4 = "phLibNfc_SetCWRFCfgCmd:Invalid Context";
    int v5 = 2;
    uint64_t v6 = 0;
LABEL_11:
    sub_2259A0EAC(v5, v6, 4u, 1u, (uint64_t)v4);
    uint64_t v7 = 255;
    goto LABEL_12;
  }
  if (*(_DWORD *)(a1 + 5424) == 1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 5428);
    if (v2 == 1) {
      int v3 = 1;
    }
    else {
      int v3 = 2 * (v2 == 2);
    }
  }
  else
  {
    int v3 = 0;
  }
  if (sub_225A54864(*(void *)(a1 + 3040), v3, (uint64_t)sub_2259B5A70, a1) != 13)
  {
    uint64_t v6 = (unsigned int *)(a1 + 19368);
    uint64_t v4 = "phLibNfc_SetCWRFCfgCmd:Sending command failed";
    int v5 = 1;
    goto LABEL_11;
  }
  uint64_t v7 = 13;
LABEL_12:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCWRFCfgCmd");
  return v7;
}

uint64_t sub_225A3E0B0(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCWRFCfgComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"phLibNfc_SetCWRFCfgComplete: Failed status received from NFCC");
      uint64_t v4 = 255;
    }
    else
    {
      uint64_t v4 = 0;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), 145, v4, 0, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetCWRFCfgComplete: Invalid LibNfc Ctx received from NCI");
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCWRFCfgComplete");
  return v5;
}

uint64_t sub_225A3E180(uint64_t a1, unint64_t a2, float *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ApcCalculation2_x");
  if (*(unsigned char *)(a1 + 2936) == 1)
  {
    float v6 = flt_225A5FCE0[3 * ((a2 >> 7) & 3) + 1];
    float v7 = flt_225A5FCE0[3 * ((a2 >> 9) & 0xF)] + v6;
    LOBYTE(v6) = aDbYwvutsrqponm[(a2 >> 1) & 0x1F];
    float v8 = flt_225A5FCE0[3 * ((a2 >> 6) & 1) + 2] * (float)(v7 * (float)((float)LODWORD(v6) / 100.0));
    float v9 = (float)((a2 & 1) + 1);
LABEL_6:
    uint64_t v11 = 0;
    *a3 = v8 * v9;
    goto LABEL_7;
  }
  unsigned int v10 = (a2 >> 8) & 7;
  *a3 = 0.0;
  if (v10 <= 4)
  {
    float v12 = (double)(a2 & 0x1F) * -1.61 * 0.5 / 100.0 + 1.0;
    float v8 = (float)(flt_225A5FDA0[3 * v10] + flt_225A5FDA0[3 * (a2 >> 6) + 1]) * v12;
    float v9 = 2.0 - flt_225A5FDA0[3 * ((a2 >> 5) & 1) + 2] + 1.0;
    goto LABEL_6;
  }
  uint64_t v11 = 255;
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ApcCalculation2_x");
  return v11;
}

uint64_t sub_225A3E304(uint64_t a1, unsigned int a2, unsigned int *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CalcFieldStrength");
  if (a3)
  {
    unsigned int v7 = *(unsigned __int16 *)(a1 + 304);
    if (*(_WORD *)(a1 + 304))
    {
      LOBYTE(v6) = *(unsigned char *)(a1 + 306);
      unsigned int v7 = (float)((float)((float)((float)((float)v6 * 1000.0) * 0.0625) * (float)a2) / (float)v7);
    }
    *a3 = v7;
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CalcFieldStrength");
}

uint64_t sub_225A3E3BC(uint64_t a1, unsigned int a2, float *a3, float *a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ApcCalculation3_0");
  uint64_t v8 = 0;
  if (a3 && a4)
  {
    if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
    {
      uint64_t v8 = 0;
      *a4 = (float)(HIWORD(a2) & 0x7FF) * 0.25;
      float v9 = (double)BYTE1(a2) / 255.0;
      float v10 = (float)((float)((float)(a2 >> 2) / 10.0) + 1.5) * v9;
      float v11 = 1.0;
      if ((a2 & 2) == 0) {
        float v11 = 2.0;
      }
      *a3 = (float)(v11 * v10) * (float)(int)((a2 & 1) + 1);
    }
    else
    {
      uint64_t v8 = 255;
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ApcCalculation3_0");
  return v8;
}

uint64_t sub_225A3E4E0(unsigned int *a1, int a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeL1State");
  if ((a2 - 1) < 0xE) {
    uint64_t v4 = (a2 - 1) + 1;
  }
  else {
    uint64_t v4 = 255;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeL1State");
  return v4;
}

uint64_t sub_225A3E55C(unsigned int *a1, char a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeL1FelicaState");
  if (((a2 - 1) & 0xF8) != 0) {
    uint64_t v4 = 255;
  }
  else {
    uint64_t v4 = (a2 - 1) + 1;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeL1FelicaState");
  return v4;
}

uint64_t sub_225A3E5D8(uint64_t a1, uint64_t a2)
{
  switch((int)a2)
  {
    case 1:
      break;
    case 2:
      a2 = 2;
      break;
    case 3:
      a2 = 3;
      break;
    case 4:
      a2 = 4;
      break;
    case 5:
      a2 = 5;
      break;
    case 6:
      a2 = 6;
      break;
    case 7:
      a2 = 7;
      break;
    case 8:
      a2 = 8;
      break;
    case 9:
      a2 = 9;
      break;
    case 10:
      a2 = 10;
      break;
    case 11:
      a2 = 11;
      break;
    case 12:
      a2 = 12;
      break;
    case 13:
      a2 = 13;
      break;
    case 14:
      a2 = 14;
      break;
    case 15:
      if (*(unsigned char *)(a1 + 2936) == 1 || *(unsigned char *)(a1 + 2937) == 1)
      {
        a2 = 15;
      }
      else
      {
        a2 = 15;
        if (*(unsigned char *)(a1 + 2938) != 1)
        {
          if (*(unsigned char *)(a1 + 2944) == 1) {
            a2 = 15;
          }
          else {
            a2 = 255;
          }
        }
      }
      break;
    default:
      a2 = 255;
      break;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeLxClifTech");
  return a2;
}

uint64_t sub_225A3E750(unsigned int *a1, int a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeDataRxFailure");
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ParseLogNtfDatRxFailure");
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ParseLogNtfDatRxFailure");
  if ((a2 & 0xFFFFFFBF) == 0x84)
  {
    unsigned int v4 = a1[16];
    sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_CheckDpllLock");
    if (v4 - 8 >= 6) {
      unsigned __int8 v5 = -1;
    }
    else {
      unsigned __int8 v5 = 0x848484FF8484uLL >> (8 * (v4 - 8));
    }
    sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_CheckDpllLock");
  }
  else
  {
    unsigned int v6 = a1[16];
    if (v6 == 5) {
      char v7 = a2 & 0xBF;
    }
    else {
      char v7 = -1;
    }
    if (v6 == 7) {
      char v8 = a2 & 0xBF;
    }
    else {
      char v8 = -1;
    }
    if (((a2 & 0xBF) + 123) <= 4u) {
      unsigned __int8 v5 = v8;
    }
    else {
      unsigned __int8 v5 = v7;
    }
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeDataRxFailure");
  return v5;
}

uint64_t sub_225A3E884(unsigned int *a1, int a2, int a3, int a4, int a5)
{
  return a2 | (a3 << 8) | (a4 << 16) | (a5 << 24);
}

unsigned int *sub_225A3E90C(unsigned int *a1, unsigned __int8 **a2)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcSysL1LogStandbyNtf");
  phOsalNfc_SetMemory();
  a1[12] = 1;
  a1[14] = **a2;
  int v4 = a1[15] | (*a2)[1];
  a1[15] = v4;
  int v5 = v4 | ((*a2)[2] << 8);
  a1[15] = v5;
  int v6 = v5 | ((*a2)[3] << 16);
  a1[15] = v6;
  a1[15] = v6 | ((*a2)[4] << 24);
  sub_22599F9EC(1, a1 + 4842, 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-phNfc_SysL1LogEntry.StandbyEvent");
  sub_22599F9EC(1, a1 + 4842, 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-pSysL1StdbyDbgInfoEntry.eStandByDebgInfoTye");
  sub_22599F9EC(1, a1 + 4842, 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-phNfc_sSysL1LoggingEventEntry_t.dwStandbyPrvntnHwRegValue");
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcSysL1LogStandbyNtf");
  return a1 + 10;
}

uint64_t sub_225A3EA58(uint64_t a1, unsigned char **a2)
{
  *(_DWORD *)(a1 + 52) = 1;
  *(unsigned char *)(a1 + 56) = **a2;
  *(unsigned char *)(a1 + 57) = (*a2)[1];
  *(_WORD *)(a1 + 58) = *((_WORD *)*a2 + 1);
  *(unsigned char *)(a1 + 60) = (*a2)[4];
  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-phNfc_sSysL1LoggingEventEntry_t.pSysL1DpcDbgInfoEntry.bDpcVddPaLutIdx");
  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-phNfc_sSysL1LoggingEventEntry_t.pSysL1DpcDbgInfoEntry.wDpcVddPaCurrent");
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcSysL1LogDpcEventNtf");
  return a1 + 40;
}

uint64_t sub_225A3EB5C(uint64_t a1, uint64_t *a2, unsigned __int8 *a3)
{
  int v3 = a3;
  uint64_t v127 = 0;
  *(_DWORD *)a3 = 0;
  a3[4] = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Sn100AndAboveProcSysL2LogNtf");
  if (*((_DWORD *)a2 + 2))
  {
    unsigned int v6 = 0;
    char v7 = (unsigned int *)(a1 + 19368);
    v116 = v3;
    while (2)
    {
      uint64_t v8 = *a2;
      unsigned int v9 = *(unsigned __int8 *)(*a2 + v6);
      int v10 = v9 & 0xF;
      uint64_t v11 = v6 + 1;
      switch(v9 >> 4)
      {
        case 1u:
          int v126 = v9 & 0xF;
          uint64_t v12 = *((void *)v3 + 1);
          unsigned int v13 = *v3;
          *(void *)v128 = 0;
          sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_L2EventProc");
          if (!v12) {
            goto LABEL_135;
          }
          unsigned int v14 = (unsigned __int8 *)(v8 + v11);
          uint64_t v15 = v12 + 52 * v13;
          *(_DWORD *)(v15 + 44) = 0;
          v114 = (_DWORD *)(v15 + 44);
          *(_DWORD *)(v15 + 32) = 0;
          v113 = (_DWORD *)(v15 + 32);
          __int16 v16 = *v14;
          *(_WORD *)uint64_t v15 = v16;
          *(_WORD *)uint64_t v15 = v16 | (v14[1] << 8);
          __int16 v17 = v14[2];
          *(_WORD *)(v15 + 2) = v17;
          *(_WORD *)(v15 + 2) = v17 | (v14[3] << 8);
          if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1)
          {
            if ((v126 - 9) > 1)
            {
              int v18 = 0;
              int v19 = 0;
              uint64_t v20 = 6;
              goto LABEL_45;
            }
LABEL_44:
            int v18 = v14[6];
            int v19 = v14[7];
            uint64_t v20 = 8;
            goto LABEL_45;
          }
          int v18 = 0;
          if ((v126 - 9) <= 1)
          {
            uint64_t v20 = 6;
            int v19 = 0;
            if (*(unsigned char *)(a1 + 2944) != 1) {
              goto LABEL_45;
            }
            goto LABEL_44;
          }
          uint64_t v20 = 6;
          int v19 = 0;
LABEL_45:
          int v117 = v19;
          int v118 = v18;
          int v119 = v14[4];
          int v120 = v14[5];
          unsigned int v115 = v120 | (v119 << 8);
          unsigned int v122 = v13;
          uint64_t v123 = v12;
          v78 = (_DWORD *)(v12 + 52 * v13);
          v78[3] = 255;
          unsigned int v79 = v14[v20] >> 4;
          uint64_t v80 = v20;
          v78[4] = sub_225A3E5D8(a1, v79);
          v124 = v78 + 4;
          uint64_t v121 = v80;
          int v81 = v14[v80] & 0xF;
          *(void *)(v78 + 1) = 0xFF000000FFLL;
          v82 = v78 + 1;
          unsigned int v83 = v81 - 1;
          int v84 = (v81 - 1);
          BOOL v85 = v79 == 15;
          if (v79 == 15) {
            v86 = "phLibNfc_ComputeL2Iso15693ClifState";
          }
          else {
            v86 = "phLibNfc_ComputeL2ClifState";
          }
          if (v85) {
            unsigned int v87 = 10;
          }
          else {
            unsigned int v87 = 15;
          }
          v125 = v82;
          v112 = v82 + 1;
          if (v85) {
            ++v82;
          }
          sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)v86);
          if (v83 < v87) {
            int v88 = v84 + 1;
          }
          else {
            int v88 = 255;
          }
          sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)v86);
          int *v82 = v88;
          if (*(unsigned char *)(a1 + 2936) != 1
            && *(unsigned char *)(a1 + 2937) != 1
            && *(unsigned char *)(a1 + 2938) != 1
            && *(unsigned char *)(a1 + 2944) != 1)
          {
            unsigned int v93 = v122;
            uint64_t v92 = v123;
            uint64_t v104 = v123 + 52 * v122;
            *(_WORD *)(v104 + 24) = v115;
            *(_DWORD *)(v104 + 28) = 0;
            int v3 = v116;
            char v7 = (unsigned int *)(a1 + 19368);
            goto LABEL_105;
          }
          int v89 = v126;
          char v7 = (unsigned int *)(a1 + 19368);
          if ((v126 - 9) <= 1
            && (*v124 & 0xFFFFFFF8) == 8
            && (*(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
            && !*(unsigned char *)(a1 + 2946))
          {
            int v96 = sub_225A3E884((unsigned int *)a1, v119, v120, v118, v117);
            int v89 = v126;
            unsigned int v93 = v122;
            uint64_t v92 = v123;
            *(_DWORD *)(v123 + 52 * v122 + 48) = v96;
            int v3 = v116;
            goto LABEL_106;
          }
          if (*v125 == 10 || *v125 == 7)
          {
            if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
            {
              unsigned int v90 = sub_225A3E884((unsigned int *)a1, v119, v120, v118, v117);
              int v91 = sub_225A3E3BC(a1, v90, &v128[1], v128);
            }
            else
            {
              int v91 = sub_225A3E180(a1, v119 | (v120 << 8), &v128[1]);
            }
            int v3 = v116;
            unsigned int v93 = v122;
            uint64_t v92 = v123;
            if (v91)
            {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)" Vpp Calculation Failed!!!");
            }
            else
            {
              uint64_t v95 = v123 + 52 * v122;
              *(float *)(v95 + 40) = v128[1];
              _DWORD *v114 = LODWORD(v128[0]);
              *(_WORD *)(v95 + 24) = -1;
              *(_DWORD *)(v95 + 28) = 0;
            }
            goto LABEL_105;
          }
          unsigned int v93 = v122;
          uint64_t v92 = v123;
          uint64_t v94 = v123 + 52 * v122;
          *(_DWORD *)(v94 + 40) = 0;
          *(_WORD *)(v94 + 24) = v115;
          int v3 = v116;
          if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
          {
            sub_225A3E304(a1, v115, (unsigned int *)(v123 + 52 * v122 + 28));
LABEL_105:
            int v89 = v126;
            goto LABEL_106;
          }
          *(_DWORD *)(v123 + 52 * v122 + 28) = 0;
LABEL_106:
          if ((v89 | 2) != 0xA) {
            goto LABEL_134;
          }
          unsigned int v105 = v14[v121 | 1];
          if (v89 == 10
            && (*v124 & 0xFFFFFFF8) == 8
            && (*(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
            && !*(unsigned char *)(a1 + 2946))
          {
            goto LABEL_133;
          }
          int v106 = *v125;
          if (*v125 <= 12)
          {
            if (v106 == 5)
            {
              sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseLogNtfDatRxFailure");
              sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseLogNtfDatRxFailure");
LABEL_133:
              *(unsigned char *)(v92 + 52 * v93 + 36) = v105;
              goto LABEL_134;
            }
            if (v106 != 11) {
              goto LABEL_133;
            }
            sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseWupIotReconfigStage");
            if (v105 >= 6) {
              char v108 = -1;
            }
            else {
              char v108 = 0x504030201FFuLL >> (8 * v105);
            }
            sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseWupIotReconfigStage");
            *(unsigned char *)(v92 + 52 * v93 + 36) = v108;
          }
          else if ((v106 - 13) >= 3)
          {
            if (v106 != 255 || *v112 == 10 || *v112 == 6) {
              goto LABEL_133;
            }
          }
          else
          {
            *(unsigned char *)(v92 + 52 * v93 + 36) = v105;
            if ((*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
              && (v106 == 15 && (v105 & 0xFE) == 6 || v106 == 14 && v105 == 8))
            {
              uint64_t v107 = v92 + 52 * v93;
              _DWORD *v113 = *(unsigned __int16 *)(v107 + 24);
              *(_DWORD *)(v107 + 28) = 0;
              *(_WORD *)(v107 + 24) = 0;
              *(void *)(v107 + 40) = 0;
            }
          }
LABEL_134:
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-wTimeStampMillisec");
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-wAmsAgcRegValue");
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-bADCRegValue");
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-wTimeStampMicrosec");
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-wRssiInterpolatedinfo");
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-dwFieldStrength");
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-eDebMgmtL2Tech");
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-eDebMgmtL2State");
          sub_22599F9EC(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-bExtraInfo");
LABEL_135:
          sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_L2EventProc");
          ++*v3;
          LODWORD(v11) = v11 + v126;
LABEL_136:
          unsigned int v6 = v11;
          if (v11 >= *((_DWORD *)a2 + 2)) {
            return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Sn100AndAboveProcSysL2LogNtf");
          }
          continue;
        case 2u:
          uint64_t v21 = *((void *)v3 + 2);
          if (!v21)
          {
            v73 = v7;
            v74 = " FelicaCmdEvent NULL!!!";
            goto LABEL_37;
          }
          __int16 v22 = *(unsigned __int8 *)(v8 + v11);
          uint64_t v23 = v3[1];
          uint64_t v24 = v21 + 16 * v23;
          *(_WORD *)uint64_t v24 = v22;
          *(_WORD *)uint64_t v24 = v22 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
          __int16 v25 = *(unsigned __int8 *)(*a2 + v6 + 3);
          *(_WORD *)(v24 + 2) = v25;
          *(_WORD *)(v24 + 2) = v25 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
          __int16 v26 = *(unsigned __int8 *)(*a2 + v6 + 5);
          *(_WORD *)(v24 + 4) = v26 << 8;
          unsigned __int16 v27 = *(unsigned __int8 *)(*a2 + v6 + 6) | (unsigned __int16)(v26 << 8);
          *(_WORD *)(v24 + 4) = v27;
          if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
          {
            sub_225A3E304(a1, v27, (unsigned int *)(v24 + 8));
            uint64_t v21 = *((void *)v3 + 2);
            uint64_t v23 = v3[1];
          }
          else
          {
            *(_DWORD *)(v21 + 16 * v23 + 8) = 0;
          }
          LODWORD(v11) = v6 + 8;
          uint64_t v28 = v21 + 16 * v23;
          *(unsigned char *)(v28 + 12) = *(unsigned char *)(*a2 + v6 + 7);
          if (v10 == 8)
          {
            char v29 = *(unsigned char *)(*a2 + v11);
            LODWORD(v11) = v6 + 9;
          }
          else
          {
            char v29 = -1;
          }
          *(unsigned char *)(v28 + 13) = v29;
          v3[1] = v23 + 1;
          goto LABEL_136;
        case 3u:
          uint64_t v30 = *((void *)v3 + 4);
          if (!v30)
          {
            v73 = v7;
            v74 = " FelicaSysCode NULL!!!";
            goto LABEL_37;
          }
          __int16 v31 = *(unsigned __int8 *)(v8 + v11);
          unsigned __int8 v32 = v3[2];
          uint64_t v33 = (_WORD *)(v30 + 6 * v32);
          _WORD *v33 = v31;
          _WORD *v33 = v31 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
          __int16 v34 = *(unsigned __int8 *)(*a2 + v6 + 3);
          v33[1] = v34;
          v33[1] = v34 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
          __int16 v35 = *(unsigned __int8 *)(*a2 + v6 + 5);
          v33[2] = v35 << 8;
          LODWORD(v11) = v6 + 7;
          v33[2] = *(unsigned __int8 *)(*a2 + v6 + 6) | (unsigned __int16)(v35 << 8);
          v3[2] = v32 + 1;
          goto LABEL_136;
        case 4u:
          uint64_t v36 = *((void *)v3 + 3);
          if (!v36)
          {
            v73 = v7;
            v74 = " FelicaRspEvent NULL!!!";
            goto LABEL_37;
          }
          uint64_t v37 = v36 + 20 * v3[3];
          *(_DWORD *)(v37 + 16) = 0;
          __int16 v38 = *(unsigned __int8 *)(*a2 + v11);
          *(_WORD *)uint64_t v37 = v38;
          *(_WORD *)uint64_t v37 = v38 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
          __int16 v39 = *(unsigned __int8 *)(*a2 + v6 + 3);
          *(_WORD *)(v37 + 2) = v39;
          *(_WORD *)(v37 + 2) = v39 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
          uint64_t v40 = *a2;
          int v41 = *(unsigned __int8 *)(*a2 + v6 + 5);
          unsigned int v42 = v6 + 7;
          int v43 = *(unsigned __int8 *)(*a2 + v6 + 6);
          if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
          {
            int v44 = *(unsigned __int8 *)(v40 + v42);
            unsigned int v42 = v6 + 9;
            unsigned int v45 = sub_225A3E884((unsigned int *)a1, v41, v43, v44, *(unsigned __int8 *)(v40 + v6 + 8));
            if (sub_225A3E3BC(a1, v45, (float *)&v127 + 1, (float *)&v127))
            {
LABEL_23:
              sub_2259A0EAC(1, v7, 4u, 1u, (uint64_t)" Vpp Calculation Failed!!!");
              uint64_t v46 = *((void *)v3 + 3);
              unsigned int v47 = v3[3];
              goto LABEL_82;
            }
          }
          else if (sub_225A3E180(a1, v41 | (v43 << 8), (float *)&v127 + 1))
          {
            goto LABEL_23;
          }
          uint64_t v46 = *((void *)v3 + 3);
          unsigned int v47 = v3[3];
          uint64_t v97 = v46 + 20 * v3[3];
          *(_DWORD *)(v97 + 12) = HIDWORD(v127);
          *(_DWORD *)(v97 + 16) = v127;
LABEL_82:
          uint64_t v98 = v46 + 20 * v47;
          *(unsigned char *)(v98 + 4) = *(unsigned char *)(*a2 + v42);
          LODWORD(v11) = v42 + 3;
          *(_WORD *)(v98 + 6) = *(unsigned __int8 *)(*a2 + v42 + 2) | (*(unsigned __int8 *)(*a2 + v42 + 1) << 8);
          if (v10 != 10)
          {
            if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1)
            {
              if (v10 != 12)
              {
                char v99 = -1;
LABEL_101:
                *(unsigned char *)(v46 + 20 * v47 + 8) = v99;
                v3[3] = v47 + 1;
                goto LABEL_136;
              }
            }
            else
            {
              char v99 = -1;
              if (v10 != 12 || *(unsigned char *)(a1 + 2944) != 1) {
                goto LABEL_101;
              }
            }
          }
          char v99 = *(unsigned char *)(*a2 + v11);
          LODWORD(v11) = v42 + 4;
          goto LABEL_101;
        case 5u:
          uint64_t v48 = *((void *)v3 + 5);
          if (v48)
          {
            __int16 v49 = *(unsigned __int8 *)(v8 + v11);
            unsigned int v50 = v3[4];
            uint64_t v51 = v48 + 12 * v3[4];
            *(_WORD *)uint64_t v51 = v49;
            *(_WORD *)uint64_t v51 = v49 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
            __int16 v52 = *(unsigned __int8 *)(*a2 + v6 + 3);
            *(_WORD *)(v51 + 2) = v52;
            *(_WORD *)(v51 + 2) = v52 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
            LODWORD(v11) = v6 + 6;
            *(_DWORD *)(v51 + 4) = *(unsigned __int8 *)(*a2 + v6 + 5);
            if (v10 == 6)
            {
              char v53 = *(unsigned char *)(*a2 + v11);
              LODWORD(v11) = v6 + 7;
            }
            else
            {
              char v53 = -1;
            }
            *(unsigned char *)(v48 + 12 * v50 + 8) = v53;
            v3[4] = v50 + 1;
          }
          goto LABEL_136;
        case 6u:
          uint64_t v54 = *((void *)v3 + 6);
          if (!v54)
          {
            v73 = v7;
            v74 = " HLM Event NULL!!!";
            goto LABEL_37;
          }
          __int16 v55 = *(unsigned __int8 *)(v8 + v11);
          unsigned int v56 = v3[5];
          uint64_t v57 = v54 + 28 * v3[5];
          *(_WORD *)(v57 + 4) = v55;
          *(_WORD *)(v57 + 4) = v55 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
          __int16 v58 = *(unsigned __int8 *)(*a2 + v6 + 3);
          *(_WORD *)(v57 + 6) = v58;
          unsigned int v59 = v6 + 5;
          *(_WORD *)(v57 + 6) = v58 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
          uint64_t v60 = v6 + 7;
          switch(*(unsigned char *)(*a2 + v60))
          {
            case 1:
              uint64_t v61 = v54 + 28 * v56;
              *(_DWORD *)uint64_t v61 = 1;
              char v62 = *(unsigned char *)(*a2 + v59);
              *(_WORD *)(v61 + 16) = *(_WORD *)(v61 + 16) & 0xFFFE | v62 & 1;
              uint64_t v63 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v63 + 16) = *(_WORD *)(v63 + 16) & 0xFFFD | v62 & 2;
              uint64_t v64 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v64 + 16) = *(_WORD *)(v64 + 16) & 0xFFFB | v62 & 4;
              uint64_t v65 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v65 + 16) = *(_WORD *)(v65 + 16) & 0xFFF7 | v62 & 8;
              uint64_t v66 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v66 + 16) = *(_WORD *)(v66 + 16) & 0xFFEF | v62 & 0x10;
              uint64_t v67 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v67 + 16) = *(_WORD *)(v67 + 16) & 0xFFDF | v62 & 0x20;
              uint64_t v68 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v68 + 16) = *(_WORD *)(v68 + 16) & 0xFFBF | v62 & 0x40;
              uint64_t v69 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v69 + 16) = *(_WORD *)(v69 + 16) & 0xFF7F | v62 & 0x80;
              unsigned int v70 = *(unsigned __int8 *)(*a2 + v6 + 6);
              uint64_t v71 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v71 + 16) = *(_WORD *)(v71 + 16) & 0xFEFF | ((v70 & 1) << 8);
              uint64_t v72 = *((void *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v72 + 16) = *(_WORD *)(v72 + 16) & 0xFDFF | (((v70 >> 1) & 1) << 9);
              break;
            case 2:
              uint64_t v101 = v54 + 28 * v56;
              *(_DWORD *)uint64_t v101 = 2;
              *(unsigned char *)(v101 + 20) = *(unsigned char *)(*a2 + v59);
              switch(*(unsigned char *)(*a2 + v6 + 6))
              {
                case 0:
                  *(_DWORD *)(v54 + 28 * v56 + 24) = 0;
                  goto LABEL_97;
                case 1:
                  uint64_t v109 = v54 + 28 * v56;
                  int v110 = 1;
                  goto LABEL_144;
                case 2:
                  uint64_t v109 = v54 + 28 * v56;
                  int v110 = 2;
                  goto LABEL_144;
                case 3:
                  uint64_t v109 = v54 + 28 * v56;
                  int v110 = 3;
                  goto LABEL_144;
                default:
                  uint64_t v109 = v54 + 28 * v56;
                  int v110 = 255;
LABEL_144:
                  *(_DWORD *)(v109 + 24) = v110;
                  break;
              }
              break;
            case 3:
              uint64_t v102 = 28 * v56;
              int v103 = 3;
              goto LABEL_96;
            case 4:
              uint64_t v102 = 28 * v56;
              int v103 = 4;
              goto LABEL_96;
            case 5:
              uint64_t v102 = 28 * v56;
              int v103 = 5;
              goto LABEL_96;
            case 6:
              *(_DWORD *)(v54 + 28 * v56) = 6;
              break;
            case 7:
              uint64_t v102 = 28 * v56;
              int v103 = 7;
LABEL_96:
              *(_DWORD *)(v54 + v102) = v103;
              break;
            default:
              v100 = (_DWORD *)(v54 + 28 * v56);
              if ((~*(unsigned __int8 *)(*a2 + v60) & 0xE) != 0)
              {
                _DWORD *v100 = 8;
                sub_22599F8E0(1, v7, 4u, 2u, (uint64_t)" HLM Invalid Event received");
              }
              else
              {
                _DWORD *v100 = 0;
                *(float *)(v54 + 28 * v56 + 8) = (float)(unsigned __int16)(*(unsigned __int8 *)(*a2 + v59) | (*(unsigned __int8 *)(*a2 + v6 + 6) << 8))
                                                 / 142.2;
                *(_DWORD *)(*((void *)v3 + 6) + 28 * v3[5] + 12) = sub_225A3E5D8(a1, *(unsigned __int8 *)(*a2 + v60) >> 4);
              }
              break;
          }
LABEL_97:
          LODWORD(v11) = v6 + 8;
          ++v3[5];
          goto LABEL_136;
        case 0xCu:
          uint64_t v75 = *((void *)v3 + 7);
          if (v75)
          {
            uint64_t v76 = v3[6];
            v77 = (_DWORD *)(v75 + 16 * v76);
            _DWORD *v77 = *(unsigned __int8 *)(v8 + v11);
            v77[1] = *(unsigned __int8 *)(*a2 + v6 + 2);
            v77[2] = *(unsigned __int8 *)(*a2 + v6 + 3);
            LODWORD(v11) = v6 + 5;
            v77[3] = *(unsigned __int8 *)(*a2 + v6 + 4);
            v3[6] = v76 + 1;
          }
          goto LABEL_136;
        default:
          LODWORD(v11) = v11 + v10;
          v73 = v7;
          v74 = " phLibNfc_Sn100AndAboveProcSysL2LogNtf : Invalid tag ID !!!";
LABEL_37:
          sub_2259A0EAC(1, v73, 4u, 2u, (uint64_t)v74);
          goto LABEL_136;
      }
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Sn100AndAboveProcSysL2LogNtf");
}

uint64_t sub_225A3FBEC(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsInitCb");
  if (a1)
  {
    int v4 = *(void (**)(void, uint64_t, uint64_t))(a1 + 6104);
    uint64_t v5 = *(void *)(a1 + 6112);
    *(void *)(a1 + 6112) = 0;
    *(void *)(a1 + 6104) = 0;
    if (v4)
    {
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SetRfSettingsInitCb:Invoking callback function, wStatus = ");
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 42, (uint64_t)"phLibNfc_SetRfSettingsInitCb", (uint64_t)"phLibNfc_SetRfSettingsInitCb", 0);
      v4(*(void *)(a1 + 19360), v5, a2);
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsInitCb");
}

uint64_t sub_225A3FCD8(uint64_t a1, int a2, uint64_t *a3)
{
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  if (!a1) {
    return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  }
  if (!a3) {
    return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_LoggingNtfHandler: Received Lx debug logging Ntf from NFCC");
  unsigned int v6 = (unsigned __int8 *)*a3;
  if (!*a3) {
    return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  }
  unsigned int v7 = *((_DWORD *)a3 + 2);
  if (!v7) {
    return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  }
  if (a2 == 8 && v7 >= 7)
  {
    uint64_t v69 = 0;
    sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_549ProcSysL1LogNtf");
    unsigned int v8 = *((_DWORD *)a3 + 2);
    unsigned int v9 = (long long *)(a1 + 40);
    phOsalNfc_SetMemory();
    *(_DWORD *)(a1 + 96) = 0;
    if (v8 - 7 > 1)
    {
      if (v8 - 9 <= 1)
      {
        int v10 = *(unsigned __int8 *)(a1 + 2937);
        if (v10 == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
        {
LABEL_24:
          *(unsigned char *)(a1 + 40) = *(unsigned char *)(a1 + 40) & 0xFC | 1;
          __int16 v13 = *(unsigned __int8 *)*a3;
          *(_WORD *)(a1 + 56) = v13;
          *(_WORD *)(a1 + 56) = v13 | (*(unsigned __int8 *)(*a3 + 1) << 8);
          __int16 v14 = *(unsigned __int8 *)(*a3 + 2);
          *(_WORD *)(a1 + 58) = v14;
          *(_WORD *)(a1 + 58) = v14 | (*(unsigned __int8 *)(*a3 + 3) << 8);
          int v15 = *(unsigned __int8 *)(*a3 + 4);
          int v16 = *(unsigned __int8 *)(*a3 + 5);
          *(_DWORD *)(a1 + 80) = 0;
          *(_WORD *)(a1 + 76) = v16 | ((_WORD)v15 << 8);
          unsigned int v61 = v8 - 9;
          if (v8 >= 9 && (v10 == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1))
          {
            int v59 = *(unsigned __int8 *)(*a3 + 7);
            int v60 = *(unsigned __int8 *)(*a3 + 6);
            unsigned int v17 = 8;
          }
          else
          {
            int v59 = 0;
            int v60 = 0;
            unsigned int v17 = 6;
          }
          *(unsigned char *)(a1 + 60) = -1;
          unsigned int v24 = *(unsigned __int8 *)(*a3 + v17) >> 4;
          int v62 = sub_225A3E5D8(a1, v24);
          *(_DWORD *)(a1 + 68) = v62;
          int v25 = *(unsigned char *)(*a3 + v17) & 0xF;
          int v26 = *(unsigned __int8 *)(a1 + 2936);
          if (v26 == 1 || *(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1)
          {
            if (v24 == 10 || v24 == 3) {
              goto LABEL_45;
            }
            BOOL v28 = v24 == 15;
            if (v24 == 15 && v26 == 1)
            {
              *(_DWORD *)(a1 + 64) = sub_225A3E4E0((unsigned int *)a1, v25);
              goto LABEL_46;
            }
            __int16 v38 = (unsigned char *)(a1 + 2937);
            if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1)
            {
              if (v24 == 15) {
                goto LABEL_186;
              }
              goto LABEL_189;
            }
            int v40 = *(unsigned __int8 *)(a1 + 2944);
          }
          else
          {
            int v40 = *(unsigned __int8 *)(a1 + 2944);
            if (v24 == 3 && v40 == 1 || v24 == 3) {
              goto LABEL_45;
            }
            __int16 v38 = (unsigned char *)(a1 + 2937);
            if (v24 != 15)
            {
              if (v24 == 10)
              {
LABEL_45:
                *(_DWORD *)(a1 + 84) = sub_225A3E55C((unsigned int *)a1, v25);
                goto LABEL_46;
              }
              goto LABEL_189;
            }
            BOOL v28 = 1;
          }
          if (v28 && v40 == 1)
          {
LABEL_186:
            if (v25 == 8)
            {
              int v49 = 8;
            }
            else if (v25 == 2)
            {
              int v49 = 2;
            }
            else
            {
              int v49 = 255;
            }
            *(_DWORD *)(a1 + 64) = v49;
LABEL_46:
            if ((v8 | 2) != 0xA)
            {
              *(_DWORD *)(a1 + 72) = 255;
              unsigned int v9 = (long long *)(a1 + 40);
              goto LABEL_86;
            }
            int v27 = *(unsigned __int8 *)(*a3 + (v17 | 1));
            unsigned int v9 = (long long *)(a1 + 40);
            if (v8 == 10
              && (v62 & 0xF8) == 8
              && (*(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
              && !*(unsigned char *)(a1 + 2946))
            {
              goto LABEL_85;
            }
            if (v24 != 3)
            {
              if (v24 == 15)
              {
                if (*(_DWORD *)(a1 + 64) == 8)
                {
LABEL_85:
                  *(unsigned char *)(a1 + 88) = v27;
LABEL_86:
                  if (*(unsigned char *)(a1 + 2936) != 1
                    && *(unsigned char *)(a1 + 2937) != 1
                    && *(unsigned char *)(a1 + 2938) != 1
                    && *(unsigned char *)(a1 + 2944) != 1)
                  {
                    unsigned int v9 = (long long *)(a1 + 56);
                  }
                  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-wTimeStampMillisec");
                  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-wTimeStampMicrosec");
                  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-RSSI Interpolatedvalue");
                  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1- Calculated Field Strength");
                  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-eDebMgmtL1Tech");
                  sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-eDebMgmtL1State");
                  if (*(_DWORD *)(a1 + 64) == 5) {
                    sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-eDebMgmtL1DataRxFailure");
                  }
                  goto LABEL_162;
                }
LABEL_82:
                *(_DWORD *)(a1 + 72) = sub_225A3E750((unsigned int *)a1, v27);
                goto LABEL_86;
              }
              if (v24 != 10)
              {
                unsigned int v39 = *(_DWORD *)(a1 + 64);
                if (v39 <= 0xA && ((1 << v39) & 0x5D2) != 0) {
                  goto LABEL_85;
                }
                goto LABEL_82;
              }
            }
            if ((*(_DWORD *)(a1 + 84) - 6) <= 2) {
              goto LABEL_85;
            }
            goto LABEL_82;
          }
LABEL_189:
          unsigned int v58 = v16 | (v15 << 8);
          unsigned int v50 = v38;
          int v51 = sub_225A3E4E0((unsigned int *)a1, v25);
          *(_DWORD *)(a1 + 64) = v51;
          if (*(unsigned char *)(a1 + 2936) != 1 && *v50 != 1 && *(unsigned char *)(a1 + 2938) != 1 && *(unsigned char *)(a1 + 2944) != 1) {
            goto LABEL_46;
          }
          if (v51 - 8 >= 6 && v51 != 1)
          {
            *(_WORD *)(a1 + 76) = v58;
            if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
            {
              sub_225A3E304(a1, v58, (unsigned int *)(a1 + 80));
              if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1)
              {
                *(_DWORD *)(a1 + 44) = 1;
                float v54 = (float)((float)v58 * 1000.0) * 0.00048828;
LABEL_233:
                *(float *)(a1 + 92) = v54;
                goto LABEL_46;
              }
            }
            else
            {
              *(_DWORD *)(a1 + 80) = 0;
            }
            *(_DWORD *)(a1 + 44) = 1;
            float v54 = (float)(int)v58 * 0.0039062;
            goto LABEL_233;
          }
          if (*v50 == 1 || *(unsigned char *)(a1 + 2938) == 1)
          {
            if (v61 > 1)
            {
LABEL_197:
              int v52 = sub_225A3E180(a1, v15 | (v16 << 8), (float *)&v69 + 1);
              int v53 = v62 & 0xF8;
              goto LABEL_216;
            }
          }
          else if (*(unsigned char *)(a1 + 2944) != 1 || v61 >= 2)
          {
            goto LABEL_197;
          }
          unsigned int v55 = sub_225A3E884((unsigned int *)a1, v15, v16, v60, v59);
          int v53 = v62 & 0xF8;
          if (v53 == 8)
          {
            int v56 = *(unsigned __int8 *)(a1 + 2938);
            if ((v56 == 1 || *(unsigned char *)(a1 + 2944) == 1) && !*(unsigned char *)(a1 + 2946))
            {
              int v52 = 0;
              *(_DWORD *)(a1 + 100) = v55;
              goto LABEL_218;
            }
          }
          int v52 = sub_225A3E3BC(a1, v55, (float *)&v69 + 1, (float *)&v69);
LABEL_216:
          if (v53 != 8)
          {
LABEL_221:
            if (v52)
            {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)" APC Calculation Failed!!!");
            }
            else
            {
              *(_DWORD *)(a1 + 44) = 1;
              uint64_t v57 = v69;
              *(_WORD *)(a1 + 76) = -1;
              *(_DWORD *)(a1 + 92) = HIDWORD(v57);
              *(_DWORD *)(a1 + 96) = v57;
            }
            goto LABEL_46;
          }
          int v56 = *(unsigned __int8 *)(a1 + 2938);
LABEL_218:
          if ((v56 == 1 || *(unsigned char *)(a1 + 2944) == 1) && !*(unsigned char *)(a1 + 2946))
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"In case of RM Robustness Info, Vpp/APC info should not be assigned");
            goto LABEL_46;
          }
          goto LABEL_221;
        }
      }
    }
    else
    {
      int v10 = *(unsigned __int8 *)(a1 + 2937);
      if (!*(unsigned char *)(a1 + 2937) || !*(unsigned char *)(a1 + 2938) || !*(unsigned char *)(a1 + 2944)) {
        goto LABEL_24;
      }
    }
    if (v8 != 12 && v8 != 10)
    {
      unsigned int v9 = 0;
LABEL_162:
      sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_549ProcSysL1LogNtf");
      goto LABEL_163;
    }
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a1 + 40) & 0xFC | 2;
    __int16 v18 = *(unsigned __int8 *)*a3;
    *(_WORD *)(a1 + 56) = v18;
    *(_WORD *)(a1 + 56) = v18 | (*(unsigned __int8 *)(*a3 + 1) << 8);
    __int16 v19 = *(unsigned __int8 *)(*a3 + 2);
    *(_WORD *)(a1 + 58) = v19;
    *(_WORD *)(a1 + 58) = v19 | (*(unsigned __int8 *)(*a3 + 3) << 8);
    int v20 = *(unsigned __int8 *)(*a3 + 4);
    int v21 = *(unsigned __int8 *)(*a3 + 5);
    if (*(unsigned char *)(a1 + 2937) == 1 || *(unsigned char *)(a1 + 2938) == 1)
    {
      if (v8 != 12)
      {
LABEL_38:
        int v22 = sub_225A3E180(a1, v20 | (v21 << 8), (float *)&v69 + 1);
        unsigned int v23 = 6;
LABEL_102:
        if (v22)
        {
          *(_DWORD *)(a1 + 44) = 0;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)" APC Calculation Failed!!!");
        }
        else
        {
          *(_DWORD *)(a1 + 44) = 1;
          int v42 = v69;
          *(_DWORD *)(a1 + 92) = HIDWORD(v69);
          *(_DWORD *)(a1 + 96) = v42;
        }
        int v43 = *(unsigned __int8 *)(*a3 + v23) >> 4;
        sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Compute7816ClifTech");
        switch(v43)
        {
          case 1:
            break;
          case 2:
            int v43 = 2;
            break;
          case 3:
            int v43 = 3;
            break;
          case 4:
            int v43 = 4;
            break;
          case 5:
            int v43 = 5;
            break;
          case 6:
            int v43 = 6;
            break;
          case 7:
            int v43 = 7;
            break;
          case 8:
            int v43 = 8;
            break;
          case 9:
            int v43 = 9;
            break;
          case 10:
            int v43 = 10;
            break;
          case 11:
            int v43 = 11;
            break;
          case 12:
            int v43 = 12;
            break;
          case 13:
            int v43 = 13;
            break;
          case 14:
            int v43 = 14;
            break;
          case 15:
            if (*(unsigned char *)(a1 + 2936) == 1 || *(unsigned char *)(a1 + 2937) == 1)
            {
              int v43 = 15;
            }
            else
            {
              int v43 = 15;
              if (*(unsigned char *)(a1 + 2938) != 1)
              {
                if (*(unsigned char *)(a1 + 2944) == 1) {
                  int v43 = 15;
                }
                else {
                  int v43 = 255;
                }
              }
            }
            break;
          default:
            int v43 = 255;
            break;
        }
        sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Compute7816ClifTech");
        *(_DWORD *)(a1 + 64) = v43;
        __int16 v45 = *(unsigned __int8 *)(*a3 + v23 + 2);
        *(_WORD *)(a1 + 68) = v45 << 8;
        *(_WORD *)(a1 + 68) = *(unsigned __int8 *)(*a3 + v23 + 3) | (unsigned __int16)(v45 << 8);
        goto LABEL_162;
      }
    }
    else if (v8 != 12 || *(unsigned char *)(a1 + 2944) != 1)
    {
      goto LABEL_38;
    }
    unsigned int v41 = sub_225A3E884((unsigned int *)a1, v20, v21, *(unsigned __int8 *)(*a3 + 6), *(unsigned __int8 *)(*a3 + 7));
    int v22 = sub_225A3E3BC(a1, v41, (float *)&v69 + 1, (float *)&v69);
    unsigned int v23 = 8;
    goto LABEL_102;
  }
  if (a2 != 8)
  {
    if (a2 != 9) {
      goto LABEL_169;
    }
    if (*(unsigned char *)(a1 + 2936) != 1)
    {
      if (*(unsigned char *)(a1 + 2937) == 1)
      {
        if (v7 < 5) {
          goto LABEL_169;
        }
        goto LABEL_64;
      }
      if (*(unsigned char *)(a1 + 2938) != 1 && *(unsigned char *)(a1 + 2944) != 1)
      {
        if ((v7 & 7) != 0) {
          goto LABEL_169;
        }
LABEL_138:
        if (*(unsigned char *)(a1 + 2936) == 1
          || *(unsigned char *)(a1 + 2937) == 1
          || *(unsigned char *)(a1 + 2938) == 1
          || *(unsigned char *)(a1 + 2944) == 1)
        {
          unsigned int v9 = &v65;
          sub_225A3EB5C(a1, a3, (unsigned __int8 *)&v65);
        }
        else
        {
          unsigned int v9 = 0;
        }
        uint64_t v44 = 63;
LABEL_164:
        LODWORD(v63) = sub_2259BC888(*(void *)(a1 + 19360), *(unsigned __int8 *)(a1 + 2988), *(unsigned __int8 *)(a1 + 3088));
        uint64_t v64 = v9;
        if (*(void *)(a1 + 6776) && *(_DWORD *)(a1 + 5560) == 5)
        {
          *(void *)(a1 + 5576) = &v63;
          sub_225A24FAC(*(void *)(a1 + 19360), 145, v44, a1 + 5560, 0);
        }
        else
        {
          uint64_t v46 = *(void (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
          if (v46)
          {
            uint64_t v47 = *(void *)(a1 + 6576);
            sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler :pGenericNtfCb[LxDebug Ntf]");
            v46(*(void *)(a1 + 19360), v47, v44, &v63);
          }
        }
        goto LABEL_169;
      }
    }
    if (v7 <= 4) {
      goto LABEL_169;
    }
LABEL_64:
    unsigned int v29 = 0;
    char v30 = 0;
    char v31 = 0;
    char v32 = 0;
    char v33 = 0;
    char v34 = 0;
    char v35 = 0;
    char v36 = 0;
    while (2)
    {
      unsigned int v37 = v6[v29];
      switch(v37 >> 4)
      {
        case 1u:
          ++v36;
          goto LABEL_73;
        case 2u:
          ++v35;
          goto LABEL_73;
        case 3u:
          ++v34;
          goto LABEL_73;
        case 4u:
          ++v33;
          goto LABEL_73;
        case 5u:
          ++v32;
          goto LABEL_73;
        case 6u:
          ++v31;
          goto LABEL_73;
        case 0xCu:
          ++v30;
LABEL_73:
          v29 += (v37 & 0xF) + 1;
          if (v29 < v7) {
            continue;
          }
          if (v36)
          {
            *((void *)&v65 + 1) = phOsalNfc_GetMemory();
            if (*((void *)&v65 + 1)) {
              phOsalNfc_SetMemory();
            }
            else {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for L2 debug events");
            }
          }
          if (v35)
          {
            *(void *)&long long v66 = phOsalNfc_GetMemory();
            if ((void)v66) {
              phOsalNfc_SetMemory();
            }
            else {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for Felica cmd events");
            }
          }
          if (v34)
          {
            *(void *)&long long v67 = phOsalNfc_GetMemory();
            if ((void)v67) {
              phOsalNfc_SetMemory();
            }
            else {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_LoggingNtfHandler : Failed to allocate memory for Felica SysCode events");
            }
          }
          if (v33)
          {
            *((void *)&v66 + 1) = phOsalNfc_GetMemory();
            if (*((void *)&v66 + 1)) {
              phOsalNfc_SetMemory();
            }
            else {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for Felica Rsp events");
            }
          }
          if (v32)
          {
            *((void *)&v67 + 1) = phOsalNfc_GetMemory();
            if (*((void *)&v67 + 1)) {
              phOsalNfc_SetMemory();
            }
            else {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for Felica Misc events");
            }
          }
          if (v31)
          {
            *(void *)&long long v68 = phOsalNfc_GetMemory();
            if ((void)v68) {
              phOsalNfc_SetMemory();
            }
            else {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for HLM events");
            }
          }
          if (v30)
          {
            *((void *)&v68 + 1) = phOsalNfc_GetMemory();
            if (*((void *)&v68 + 1)) {
              phOsalNfc_SetMemory();
            }
            else {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for LPCD Assist events");
            }
          }
          break;
        default:
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)" phLibNfc_LoggingNtfHandler : Invalid Type !!!");
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)" phLibNfc_LoggingNtfHandler : Unknown L2 Message!!!");
          goto LABEL_169;
      }
      goto LABEL_138;
    }
  }
  if (v7 == 5)
  {
    int v11 = *(unsigned __int8 *)(a1 + 2944);
    if (v11 == 1 && *v6 == 255)
    {
      uint64_t v12 = sub_225A3EA58(a1, (unsigned char **)a3);
      goto LABEL_112;
    }
    if (*(unsigned char *)(a1 + 2937) == 1 || v11 == 1 || *(unsigned char *)(a1 + 2938) == 1)
    {
      uint64_t v12 = (uint64_t)sub_225A3E90C((unsigned int *)a1, (unsigned __int8 **)a3);
LABEL_112:
      unsigned int v9 = (long long *)v12;
LABEL_163:
      uint64_t v44 = 62;
      goto LABEL_164;
    }
  }
LABEL_169:
  if (*((void *)&v65 + 1))
  {
    phOsalNfc_FreeMemory();
    *((void *)&v65 + 1) = 0;
  }
  if (*((void *)&v66 + 1))
  {
    phOsalNfc_FreeMemory();
    *((void *)&v66 + 1) = 0;
  }
  if ((void)v66)
  {
    phOsalNfc_FreeMemory();
    *(void *)&long long v66 = 0;
  }
  if ((void)v67)
  {
    phOsalNfc_FreeMemory();
    *(void *)&long long v67 = 0;
  }
  if (*((void *)&v67 + 1))
  {
    phOsalNfc_FreeMemory();
    *((void *)&v67 + 1) = 0;
  }
  if ((void)v68)
  {
    phOsalNfc_FreeMemory();
    *(void *)&long long v68 = 0;
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
}

uint64_t sub_225A40CF0(uint64_t a1, int a2, uint64_t a3, int a4)
{
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler- Rxd Failed Status");
LABEL_29:
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler-Corrutped MultiTag NTF received, Reset/Boot MW");
    goto LABEL_30;
  }
  if (a2 != 35 || a4 == 255)
  {
    __int16 v14 = "phLibNfc_PropMultiTagStatNtfHandler- Rxd Failed Status";
    int v15 = 2;
    int v16 = (unsigned int *)a1;
LABEL_12:
    sub_2259A0EAC(v15, v16, 4u, 1u, (uint64_t)v14);
    int v12 = 0;
    char v17 = 0;
    goto LABEL_13;
  }
  if (!*(_DWORD *)(a3 + 8) || (unsigned int v8 = *(unsigned char **)a3) == 0)
  {
    __int16 v14 = "phLibNfc_PropMultiTagStatNtfHandler- Len Error or Null buffer received";
    int v15 = 1;
    int v16 = (unsigned int *)(a1 + 19368);
    goto LABEL_12;
  }
  unsigned int v9 = 1;
  unsigned __int8 v45 = 1;
  LOBYTE(v41) = *v8;
  if ((_BYTE)v41)
  {
    uint64_t Memory = phOsalNfc_GetMemory();
    *((void *)&v41 + 1) = Memory;
    if (Memory)
    {
      int v11 = (unsigned char *)Memory;
      phOsalNfc_SetMemory();
      sub_225A411D4((unsigned int *)a1, &v45, v41, 0, v11, (uint64_t *)a3);
      int v12 = 0;
      int v13 = 1;
      unsigned int v9 = v45;
    }
    else
    {
      int v13 = 0;
      int v12 = 255;
      unsigned int v9 = 1;
    }
  }
  else
  {
    int v12 = 0;
    int v13 = 1;
  }
  uint64_t v27 = *(void *)a3;
  unsigned __int8 v28 = v9 + 1;
  unsigned __int8 v45 = v9 + 1;
  unsigned int v29 = *(unsigned __int8 *)(v27 + v9);
  LOBYTE(v42) = *(unsigned char *)(v27 + v9);
  if (v13 && v29)
  {
    uint64_t v30 = phOsalNfc_GetMemory();
    *((void *)&v42 + 1) = v30;
    if (v30)
    {
      char v31 = (unsigned char *)v30;
      phOsalNfc_SetMemory();
      sub_225A411D4((unsigned int *)a1, &v45, v29, 0, v31, (uint64_t *)a3);
      unsigned __int8 v28 = v45;
    }
    else
    {
      int v12 = 255;
    }
  }
  uint64_t v32 = *(void *)a3;
  unsigned __int8 v33 = v28 + 1;
  unsigned __int8 v45 = v28 + 1;
  unsigned int v34 = *(unsigned __int8 *)(v32 + v28);
  LOBYTE(v43) = *(unsigned char *)(v32 + v28);
  if (!v12 && v34)
  {
    uint64_t v35 = phOsalNfc_GetMemory();
    *((void *)&v43 + 1) = v35;
    if (v35)
    {
      char v36 = (unsigned char *)v35;
      phOsalNfc_SetMemory();
      sub_225A411D4((unsigned int *)a1, &v45, v34, 0, v36, (uint64_t *)a3);
      int v12 = 0;
      unsigned __int8 v33 = v45;
    }
    else
    {
      int v12 = 255;
    }
  }
  uint64_t v37 = *(void *)a3;
  unsigned __int8 v45 = v33 + 1;
  unsigned int v38 = *(unsigned __int8 *)(v37 + v33);
  LOBYTE(v44) = *(unsigned char *)(v37 + v33);
  char v17 = 1;
  if (!v12 && v38)
  {
    uint64_t v39 = phOsalNfc_GetMemory();
    *((void *)&v44 + 1) = v39;
    if (v39)
    {
      int v40 = (unsigned char *)v39;
      phOsalNfc_SetMemory();
      char v17 = 1;
      sub_225A411D4((unsigned int *)a1, &v45, v38, 1, v40, (uint64_t *)a3);
      int v12 = 0;
    }
    else
    {
      char v17 = 1;
      int v12 = 255;
    }
  }
LABEL_13:
  int v18 = 0;
  uint64_t v19 = *(void *)(a1 + 3192);
  if (v19 && v19 != 0xFFFFFFFFFFFFLL)
  {
    phOsalNfc_Timer_Stop();
    *(unsigned char *)(a1 + 6032) = 0;
    int v18 = 1;
    sub_2259D730C(1, (unsigned int *)(a1 + 19368), *(void *)(a1 + 3192), 4u, 4u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler", (uint64_t)"hMultiTagNtfWaitTimerId", 0);
    phOsalNfc_Timer_Delete();
    *(void *)(a1 + 3192) = 0xFFFFFFFFFFFFLL;
  }
  char v20 = v17 ^ 1;
  if (v12) {
    char v20 = 1;
  }
  if (v20) {
    goto LABEL_29;
  }
  int v21 = *(void (**)(void, uint64_t, uint64_t, long long *))(a1 + 6568);
  if (v21)
  {
    uint64_t v22 = *(void *)(a1 + 6576);
    sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"PropMultiTagStatNtfHandler :pGenericNtfCb[Multi-tag Status]");
    v21(*(void *)(a1 + 19360), v22, 155, &v41);
  }
  if (*(void *)(a1 + 6056))
  {
    if (v18 && !*(unsigned char *)(a1 + 3216))
    {
      *(unsigned char *)(a1 + 3216) = 1;
      *(void *)(a1 + 2912) = off_26B606D40;
      *(unsigned char *)(a1 + 2904) = 0;
      *(unsigned char *)(a1 + 2906) = 0;
      char v23 = (char)off_26B606D40[0];
      if (off_26B606D40[0])
      {
        char v23 = 0;
        unsigned int v24 = &qword_26B606D50;
        do
        {
          ++v23;
          uint64_t v25 = *v24;
          v24 += 2;
        }
        while (v25);
      }
      *(unsigned char *)(a1 + 2905) = v23;
      if (sub_2259B528C(a1, 0, 0) != 13) {
        sub_225A41358((unsigned int *)a1, 255);
      }
    }
  }
  else
  {
    *(unsigned char *)(a1 + 3216) = 0;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler- Independant Prop Tag Det NTF Rxd");
  }
LABEL_30:
  if (*((void *)&v41 + 1))
  {
    phOsalNfc_FreeMemory();
    *((void *)&v41 + 1) = 0;
  }
  if (*((void *)&v42 + 1))
  {
    phOsalNfc_FreeMemory();
    *((void *)&v42 + 1) = 0;
  }
  if (*((void *)&v43 + 1))
  {
    phOsalNfc_FreeMemory();
    *((void *)&v43 + 1) = 0;
  }
  if (*((void *)&v44 + 1))
  {
    phOsalNfc_FreeMemory();
    *((void *)&v44 + 1) = 0;
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler");
}

uint64_t sub_225A411D4(unsigned int *a1, unsigned __int8 *a2, unsigned int a3, int a4, unsigned char *a5, uint64_t *a6)
{
  int v21 = 28;
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_PopulateRxdTagInfo");
  if (a4 == 1)
  {
    if (a3)
    {
      unsigned int v12 = 0;
      unsigned __int8 v13 = *a2;
      __int16 v14 = a5 + 2;
      do
      {
        uint64_t v15 = *a6;
        char v16 = *(unsigned char *)(*a6 + v13);
        *(v14 - 1) = (v16 & 0x10) != 0;
        *__int16 v14 = *(unsigned char *)(v15 + *a2) >> 5;
        sub_225A41488(a1, v16 & 0xF, &v21);
        *(v14 - 2) = v21;
        unsigned __int8 v13 = *a2 + 1;
        *a2 = v13;
        ++v12;
        v14 += 3;
      }
      while (v12 < a3);
    }
  }
  else if (a3)
  {
    unsigned int v17 = 0;
    unsigned __int8 v18 = *a2;
    do
    {
      uint64_t v19 = *a6;
      *a2 = v18 + 1;
      sub_225A41488(a1, *(unsigned __int8 *)(v19 + v18), &v21);
      *a5 = v21;
      a5 += 5;
      phOsalNfc_MemCopy();
      unsigned __int8 v18 = *a2 + 4;
      *a2 = v18;
      ++v17;
    }
    while (v17 < a3);
  }

  return sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_PopulateRxdTagInfo");
}

uint64_t sub_225A41358(unsigned int *a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t)a1;
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MultiTagCompleteInit");
  if (!v3 || a2)
  {
    sub_2259A0EAC(2, (unsigned int *)v3, 4u, 1u, (uint64_t)"phLibNfc_MultiTagCompleteInit- GetFwInfoCmd failed");
    sub_2259E53D0((unsigned int *)v3, a2);
    uint64_t v3 = 0;
    goto LABEL_11;
  }
  int v4 = sub_225A50914(*(void *)(v3 + 2952));
  *(void *)(v3 + 3040) = v4;
  if (sub_2259E8F40(v3, (uint64_t)v4))
  {
    uint64_t v5 = (unsigned int *)(v3 + 19368);
    unsigned int v6 = "phLibNfc_MultiTagCompleteInit- GetNfccFeatures failed";
  }
  else if (sub_2259E53D0((unsigned int *)v3, 0))
  {
    uint64_t v5 = (unsigned int *)(v3 + 19368);
    unsigned int v6 = "phLibNfc_MultiTagCompleteInit- INIT Complete failed";
  }
  else
  {
    if (!sub_2259E7228((unsigned int *)v3, 0)) {
      goto LABEL_11;
    }
    uint64_t v5 = (unsigned int *)(v3 + 19368);
    unsigned int v6 = "phLibNfc_MultiTagCompleteInit- Static Seq failed";
  }
  sub_2259A0EAC(1, v5, 4u, 1u, (uint64_t)v6);
LABEL_11:

  return sub_2259A10B4(2, (unsigned int *)v3, 4u, 5u, (uint64_t)"phLibNfc_MultiTagCompleteInit");
}

uint64_t sub_225A41488(unsigned int *a1, int a2, int *a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConvertToRemDevType");
  int v6 = 10;
  switch(a2)
  {
    case 0:
    case 3:
      break;
    case 1:
      int v6 = 17;
      break;
    case 2:
    case 5:
      int v6 = 21;
      break;
    case 4:
    case 7:
    case 8:
    case 9:
      goto LABEL_5;
    case 6:
      int v6 = 23;
      break;
    case 10:
      int v6 = 13;
      break;
    case 11:
      int v6 = 14;
      break;
    case 12:
      int v6 = 15;
      break;
    default:
      if ((a2 - 112) >= 3) {
LABEL_5:
      }
        unsigned int v7 = "phLibNfc_ConvertToRemDevType- RF tech Unknown";
      else {
        unsigned int v7 = "phLibNfc_ConvertToRemDevType- RF tech Not supported";
      }
      sub_2259A0EAC(2, a1, 4u, 2u, (uint64_t)v7);
      int v6 = 0;
      break;
  }
  *a3 = v6;

  return sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConvertToRemDevType");
}

uint64_t sub_225A415CC(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LongVasCwDetNtfHandler");
  if (a2 == 43)
  {
    if (a1)
    {
      if (a4 != 255)
      {
        unsigned int v7 = *(void (**)(void, uint64_t, uint64_t, void))(a1 + 6568);
        if (v7)
        {
          uint64_t v8 = *(void *)(a1 + 6576);
          sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_LongVasCwDetNtfHandler :pGenericNtfCb[Prop Vas Long CW Ntf]");
          v7(*(void *)(a1 + 19360), v8, 78, 0);
        }
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LongVasCwDetNtfHandler");
}

uint64_t sub_225A41694(uint64_t a1, int a2, _DWORD *a3, int a4)
{
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
  if (a2 != 10 || !a1 || a4 == 255) {
    return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
  }
  *(unsigned char *)(a1 + 1401) = 1;
  phOsalNfc_SetMemory();
  if (a3[2])
  {
    uint64_t v8 = *(char **)a3;
    if (*(void *)a3)
    {
      char v9 = *v8;
      char v10 = *v8 & 0xBF;
      LOBYTE(v24) = v24 & 0x40 | v10;
      if ((v9 & 9) != 0)
      {
        if (*(unsigned char *)(a1 + 2937) == 1
          || *(unsigned char *)(a1 + 2938) == 1
          || *(unsigned char *)(a1 + 2944) == 1
          || *(unsigned char *)(a1 + 2936) == 1 && (*(_DWORD *)(a1 + 2980) & 0xFEu) >= 0x32)
        {
          LOBYTE(v24) = (32 * v8[1]) & 0x40 | v10;
          phOsalNfc_MemCopy();
          uint64_t v11 = *(void *)a3;
          LODWORD(v25) = *(unsigned __int8 *)(*(void *)a3 + 4);
          if ((v25 - 1) > 0x13)
          {
            *((void *)&v24 + 1) = 0;
            LODWORD(v25) = 0;
          }
          else
          {
            *((void *)&v24 + 1) = v11 + 5;
          }
        }
        else
        {
          if (v9)
          {
            LODWORD(v25) = 5;
            *uint64_t v8 = 106;
            uint64_t v19 = *(void *)a3;
          }
          else
          {
            uint64_t v19 = 0;
            LODWORD(v25) = 0;
          }
          *((void *)&v24 + 1) = v19;
          phOsalNfc_MemCopy();
        }
      }
      else
      {
        *((void *)&v24 + 1) = 0;
        LODWORD(v25) = 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_PropRdrNtfHandler- Not a Prop Reader");
      }
    }
  }
  if ((*(unsigned char *)(a1 + 1012) & 7) == 0) {
    goto LABEL_25;
  }
  int v12 = *(_DWORD *)(a1 + 1360);
  if ((*(unsigned char *)(a1 + 1012) & 0x38) == 0 && v12 != 6)
  {
    phOsalNfc_SetMemory();
    uint64_t v13 = *(void *)(a1 + 720);
    if (v13 && v13 != 0xFFFFFFFFFFFFLL)
    {
      phOsalNfc_Timer_Delete();
      *(void *)(a1 + 720) = 0xFFFFFFFFFFFFLL;
    }
    LODWORD(v22[0]) = *(_DWORD *)(a1 + 1360);
    *(_DWORD *)(a1 + 1360) = 6;
    *(unsigned char *)(a1 + 1401) = 0;
    phOsalNfc_MemCopy();
    __int16 v14 = *(void (**)(void, void, uint64_t, void, _OWORD *, void))(a1 + 6696);
    if (v14) {
      v14(*(void *)(a1 + 19360), *(void *)(a1 + 6704), 24, *(void *)(a1 + 392), v22, 0);
    }
    return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
  }
  if ((*(unsigned char *)(a1 + 1012) & 0x38) == 0
    && v12 == 6
    && !*(unsigned char *)(a1 + 1400)
    && (*(unsigned char *)(a1 + 2937) == 1
     || *(unsigned char *)(a1 + 2938) == 1
     || *(unsigned char *)(a1 + 2939) == 1
     || *(unsigned char *)(a1 + 2944) == 1
     || *(unsigned char *)(a1 + 2936) == 1))
  {
    uint64_t v18 = *(void *)(a1 + 720);
    if (v18 && v18 != 0xFFFFFFFFFFFFLL)
    {
      phOsalNfc_Timer_Delete();
      *(void *)(a1 + 720) = 0xFFFFFFFFFFFFLL;
    }
    phOsalNfc_MemCopy();
    if (v25)
    {
      if (v25 > 0x14)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received VasUpPayload size exceeded Max vas code length");
        LODWORD(v25) = 0;
      }
      else
      {
        phOsalNfc_MemCopy();
        *(void *)(a1 + 1376) = a1 + 1402;
      }
    }
    uint64_t v20 = *(void *)(a1 + 720);
    if (v20 != 0xFFFFFFFFFFFFLL && v20)
    {
      phOsalNfc_Timer_Stop();
      uint64_t v21 = *(void *)(a1 + 720);
    }
    else
    {
      uint64_t v21 = phOsalNfc_Timer_Create();
      *(void *)(a1 + 720) = v21;
    }
    if (v21 && v21 != 0xFFFFFFFFFFFFLL)
    {
      if (!phOsalNfc_Timer_Start())
      {
        sub_2259D730C(1, (unsigned int *)(a1 + 19368), *(void *)(a1 + 720), 4u, 4u, (uint64_t)"phLibNfc_PropRdrNtfHandler", (uint64_t)"dwVasNtfTimer", 1);
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"Vas Inversion Timer started:Waiting for Express Started NTF after reception of VAS");
        return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Timer Start Failed for VAS NTF timer");
      phOsalNfc_Timer_Delete();
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Timer Create Failed for VAS NTF timer");
    }
    *(void *)(a1 + 720) = 0xFFFFFFFFFFFFLL;
  }
  else
  {
LABEL_25:
    if ((*(unsigned char *)(a1 + 1012) & 0x10) != 0)
    {
      phOsalNfc_MemCopy();
      if (v25)
      {
        if (v25 > 0x14)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received VasUpPayload size exceeded Max vas code length");
          LODWORD(v25) = 0;
        }
        else
        {
          phOsalNfc_MemCopy();
          *(void *)(a1 + 1376) = a1 + 1402;
        }
      }
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RF_ON followed by VAS (Exp Non Entry) received hence propogate VAS NTF to upper");
      *(unsigned char *)(a1 + 1401) = 0;
    }
    uint64_t v15 = *(void (**)(void, uint64_t, uint64_t, long long *))(a1 + 6568);
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 6576);
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_PropRdrNtfHandler :pGenericNtfCb[Prop Rdr Ntf]");
      v15(*(void *)(a1 + 19360), v16, 69, &v24);
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
}

uint64_t sub_225A41BD0(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2259D730C(2, (unsigned int *)a2, a1, 4u, 4u, (uint64_t)"phLibNfc_eSEExpNtfTimeOutCb", (uint64_t)"Timeout:dwVasNtfTimer", 0);
  if (a2)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 2);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != a2);
    if (v6 == a2)
    {
      uint64_t v7 = *(void *)(a2 + 720);
      if (v7 && v7 != 0xFFFFFFFFFFFFLL)
      {
        phOsalNfc_Timer_Delete();
        *(void *)(a2 + 720) = 0xFFFFFFFFFFFFLL;
      }
      sub_2259A0EAC(1, (unsigned int *)(a2 + 19368), 4u, 4u, (uint64_t)"Timer STOPPED phLibNfc_eSEExpNtfTimeOutCb");
      *(unsigned char *)(a2 + 1400) = 0;
      uint64_t v8 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a2 + 6568);
      if (v8)
      {
        uint64_t v9 = *(void *)(a2 + 6576);
        sub_2259A2E90(1, (unsigned int *)(a2 + 19368), 4u, 4u, (uint64_t)"eSEExpNtfTimeOutCb :pGenericNtfCb[exp ntf timeout]");
        v8(*(void *)(a2 + 19360), v9, 69, a2 + 1368);
      }
      *(_DWORD *)(a2 + 1360) = 6;
      phOsalNfc_SetMemory();
      uint64_t result = phOsalNfc_SetMemory();
      *(unsigned char *)(a2 + 1401) = 0;
    }
  }
  return result;
}

uint64_t sub_225A41D24(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
  if (a1)
  {
    char v4 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 6568);
    uint64_t v5 = *(void *)(a1 + 6576);
    if (a2 == 12)
    {
      if (*(void *)(a1 + 6056))
      {
        *(unsigned char *)(a1 + 3153) = 1;
        goto LABEL_15;
      }
      if (v4)
      {
        uint64_t v9 = (unsigned int *)(a1 + 19368);
        if (*(unsigned char *)(a1 + 2944) == 1)
        {
          sub_2259A2E90(1, v9, 4u, 4u, (uint64_t)"PlllostlockNtfHandler :pGenericNtfCb[PLL lost lock]");
          uint64_t v6 = *(void *)(a1 + 19360);
          uint64_t v7 = v5;
          uint64_t v8 = 77;
          goto LABEL_13;
        }
        sub_2259A0EAC(1, v9, 4u, 1u, (uint64_t)"Unknown ntf is received, and dropped ");
      }
    }
    else
    {
      if (a2 != 11) {
        goto LABEL_15;
      }
      if (*(void *)(a1 + 6056))
      {
        *(unsigned char *)(a1 + 3152) = 1;
        goto LABEL_15;
      }
      if (v4)
      {
        sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"PllUnlockedNtfHandler :pGenericNtfCb[PLL UNLOCK]");
        uint64_t v6 = *(void *)(a1 + 19360);
        uint64_t v7 = v5;
        uint64_t v8 = 70;
LABEL_13:
        v4(v6, v7, v8, 0);
      }
    }
  }
LABEL_15:

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
}

uint64_t sub_225A41E6C(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfTxLdoErrorNtfHandler");
  if (a1)
  {
    if (a2 == 13)
    {
      uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 6576);
        if (a3 && *a3 && (int v8 = *((_DWORD *)a3 + 2)) != 0)
        {
          uint64_t v13 = *a3;
          LODWORD(v14) = v8;
          sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_RfTxLdoErrorNtfHandler :pGenericNtfCb[TXLDO ERROR]");
          uint64_t v9 = *(void *)(a1 + 19360);
          char v10 = &v13;
          uint64_t v11 = v7;
        }
        else
        {
          sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_RfTxLdoErrorNtfHandler :pGenericNtfCb[TXLDO ERROR]");
          uint64_t v9 = *(void *)(a1 + 19360);
          uint64_t v11 = v7;
          char v10 = 0;
        }
        v6(v9, v11, 87, v10);
      }
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfTxLdoErrorNtfHandler");
}

uint64_t sub_225A41F7C(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ExtTempNormalNtfHandler");
  if (a1)
  {
    if (a2 == 14)
    {
      char v4 = *(void (**)(void, uint64_t, uint64_t, void))(a1 + 6568);
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 6576);
        sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ExtTempNormalNtfHandler :pGenericNtfCb[GPADC Temperature back To Normal Notification]");
        v4(*(void *)(a1 + 19360), v5, 88, 0);
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ExtTempNormalNtfHandler");
}

uint64_t sub_225A42038(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfXtalErrNtfHandler");
  if (a1 && a2 == 16)
  {
    if (*(void *)(a1 + 6056))
    {
      *(unsigned char *)(a1 + 3154) = 1;
    }
    else
    {
      char v4 = *(void (**)(void, uint64_t, uint64_t, void))(a1 + 6568);
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 6576);
        sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"XtalErrNtfHandler :pGenericNtfCb[XTAL Start Error]");
        v4(*(void *)(a1 + 19360), v5, 90, 0);
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfXtalErrNtfHandler");
}

uint64_t sub_225A42108(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TotalPollDurationNtfHandler");
  if (a3)
  {
    if (a1)
    {
      if (!a4 && a2 == 17)
      {
        int v8 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 6568);
        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 6576);
          sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"TotalPollDurationNtfHandler :pGenericNtfCb[Total POLL Duration]");
          v8(*(void *)(a1 + 19360), v9, 122, a3);
        }
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TotalPollDurationNtfHandler");
}

uint64_t sub_225A421D4(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EmvcoRfCollisionDetNtfHandler");
  if (a1)
  {
    if (!a4 && a2 == 18)
    {
      uint64_t v7 = *(void (**)(void, uint64_t, uint64_t, void))(a1 + 6568);
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 6576);
        sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_EmvcoRfCollisionDetNtfHandler :pGenericNtfCb[EMVCO RF Collision Detected]");
        v7(*(void *)(a1 + 19360), v8, 123, 0);
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EmvcoRfCollisionDetNtfHandler");
}

uint64_t sub_225A42298(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CrcErrorNtfHandler");
  if (a1 && a2 == 28)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, uint64_t, void))(a1 + 6568);
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 6576);
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"CrcErrorNtfHandler :pGenericNtfCb[CRC Err ntf]");
      v7(*(void *)(a1 + 19360), v8, a4, 0);
    }
    if (*(void *)(a1 + 6056)) {
      sub_2259E53D0((unsigned int *)a1, 137);
    }
  }
  else
  {
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_CrcErrorNtfHandler: Can not process Crc error - Invalid input parameters");
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CrcErrorNtfHandler");
}

uint64_t sub_225A42390(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GpadcDebugHandler");
  if (!a1 || a2 != 41 || !a3 || a4)
  {
    char v10 = "phLibNfc_GpadcDebugHandler: Can not process Gpadc debug Ntf - Invalid input parameters";
LABEL_9:
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 4u, (uint64_t)v10);
    return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GpadcDebugHandler");
  }
  uint64_t v8 = *(void (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
  if (!v8)
  {
    char v10 = "phLibNfc_GpadcDebugHandler: Dropping Ntf as there is no registration";
    goto LABEL_9;
  }
  uint64_t v9 = *(void *)(a1 + 6576);
  uint64_t v12 = *a3;
  LODWORD(v13) = *((_DWORD *)a3 + 2);
  sub_2259A2E90(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_GpadcDebugHandler :pGenericNtfCb[Gpadc debug ntf]");
  v8(*(void *)(a1 + 19360), v9, 85, &v12);
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GpadcDebugHandler");
}

uint64_t sub_225A42494(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EraseCounterNtfHandler");
  if (a1 && a2 == 42 && a3 && !a4)
  {
    phOsalNfc_SetMemory();
    uint64_t v8 = *(void (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 6576);
      uint64_t v11 = *a3;
      LODWORD(v12) = *((_DWORD *)a3 + 2);
      sub_2259A2E90(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_EraseCounterNtfHandler :pGenericNtfCb[erase counter exceed limit ntf]");
      v8(*(void *)(a1 + 19360), v9, 86, &v11);
    }
    else
    {
      sub_2259A0EAC(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_EraseCounterNtfHandler: Dropping Ntf as there is no registration");
    }
  }
  else
  {
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_EraseCounterNtfHandler: Can not process Erase counter exceed limit Ntf - Invalid input parameters");
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EraseCounterNtfHandler");
}

uint64_t sub_225A425C4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CustTrimErrorNtfHandler");
  if (a1 && a2 == 31)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, uint64_t, void))(a1 + 6568);
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 6576);
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"CustTrimErrorNtfHandler :pGenericNtfCb[Trim Err ntf]");
      v7(*(void *)(a1 + 19360), v8, a4, 0);
    }
    if (*(void *)(a1 + 6248))
    {
      sub_225A55104(*(void *)(a1 + 3040), 0);
      *(void *)(a1 + 2912) = 0;
      *(_WORD *)(a1 + 2904) = 0;
      *(unsigned char *)(a1 + 2906) = 0;
      uint64_t v9 = *(void (**)(void, uint64_t, uint64_t))(a1 + 6248);
      uint64_t v10 = *(void *)(a1 + 6256);
      *(void *)(a1 + 6248) = 0;
      *(void *)(a1 + 6256) = 0;
      v9(*(void *)(a1 + 19360), v10, 136);
    }
    if (*(void *)(a1 + 6056)) {
      sub_2259E53D0((unsigned int *)a1, 136);
    }
  }
  else
  {
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_CustTrimErrorNtfHandler: Can not process Cust Trim error - Invalid input parameters");
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CustTrimErrorNtfHandler");
}

uint64_t sub_225A426FC(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TrimmingErrorNtfHandler");
  if (a2 == 46 && a1 && a3)
  {
    uint64_t v6 = *(void (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
    if (v6 && (uint64_t v7 = *a3) != 0 && (v8 = *((_DWORD *)a3 + 2)) != 0)
    {
      uint64_t v9 = *(void *)(a1 + 6576);
      uint64_t v11 = v7;
      LODWORD(v12) = v8;
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_TrimmingErrorNtfHandler :pGenericNtfCb[Trimming Failure ntf]");
      v6(*(void *)(a1 + 19360), v9, 89, &v11);
    }
    else
    {
      sub_2259A0EAC(2, (unsigned int *)a1, 4u, 2u, (uint64_t)"phLibNfc_TrimmingErrorNtfHandler: Dropping - Trimming Failure Info Ntf");
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TrimmingErrorNtfHandler");
}

uint64_t sub_225A427F8(uint64_t a1, int a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler");
  if (a1 && a2 == 47)
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6568);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 6576);
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler :pGenericNtfCb[Spmi Status RegInfo ntf]");
      if (a3)
      {
        uint64_t v8 = *(void *)(a1 + 19360);
        uint64_t v9 = v7;
        uint64_t v10 = a3;
      }
      else
      {
        sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler: Read Spmi Status Failed - pInfo set to NULL");
        uint64_t v8 = *(void *)(a1 + 19360);
        uint64_t v9 = v7;
        uint64_t v10 = 0;
      }
      v6(v8, v9, 91, v10);
    }
    else
    {
      sub_2259A0EAC(2, (unsigned int *)a1, 4u, 2u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler: Dropping - Spmi Status Register Info Ntf");
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler");
}

uint64_t sub_225A4290C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RssiStatsHandler");
  if (a3 && a1 && !a4)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 6568);
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 6576);
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RssiStatsHandler :pGenericNtfCb[RSSI STATS ntf]");
      v7(*(void *)(a1 + 19360), v8, 83, a3);
    }
  }
  else
  {
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_RssiStatsHandler: Can not process RSSI Stats NTF - Invalid input parameters");
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RssiStatsHandler");
}

uint64_t sub_225A429EC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UartCommnErrorHandler");
  if (a1 && a4 == 80)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 6568);
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 6576);
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"UartCommnErrorHandler :pGenericNtfCb[COMM ERR]");
      v7(*(void *)(a1 + 19360), v8, 80, a3);
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_UartCommnErrorHandler: Droping as no Registrations Exist");
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UartCommnErrorHandler");
}

uint64_t sub_225A42AD0(uint64_t a1, uint64_t a2, int *a3, uint64_t a4)
{
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
  if (!a1) {
    goto LABEL_9;
  }
  char v7 = 0;
  uint64_t v8 = 0;
  do
  {
    uint64_t v9 = *((void *)&unk_26ABD79B8 + 14 * v8 + 2);
    if (v7) {
      break;
    }
    char v7 = 1;
    uint64_t v8 = 1;
  }
  while (v9 != a1);
  if (!a3 || v9 != a1)
  {
LABEL_9:
    uint64_t v12 = "Invalid Params received!!";
    int v13 = 2;
    uint64_t v11 = (unsigned int *)a1;
LABEL_39:
    sub_2259A0EAC(v13, v11, 4u, 1u, (uint64_t)v12);
    return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
  }
  int v10 = *a3;
  switch(*a3)
  {
    case 1:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_Rejected";
      goto LABEL_38;
    case 2:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_RfFrameCorrupted";
      goto LABEL_38;
    case 3:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_Failed";
      goto LABEL_38;
    case 4:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_NotInitiatlized";
      goto LABEL_38;
    case 5:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_SyntaxErr";
      goto LABEL_38;
    case 6:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_SemanticErr";
      goto LABEL_38;
    case 7:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_InvalidParam";
      goto LABEL_38;
    case 8:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_MsgSizeExceeded";
      goto LABEL_38;
    case 9:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_DiscAlreadyStarted";
      goto LABEL_38;
    case 10:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_DiscTgtActvnFailed";
      goto LABEL_38;
    case 11:
      uint64_t v11 = (unsigned int *)(a1 + 19368);
      uint64_t v12 = "Generic error received: phNciNfc_e_DiscTearDown";
      goto LABEL_38;
    default:
      if (v10 == 237)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Generic error received: phNciNfc_e_CustTrimAreaAssert");
        sub_225A425C4(a1, 31, v14, a4);
        return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
      }
      if (v10 == 247)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"Generic error received: phNciNfc_e_SmbTxBlocked");
        if (*(void *)(a1 + 6296) || *(void *)(a1 + 6312) || *(void *)(a1 + 6536)) {
          *(unsigned char *)(a1 + 706) = 1;
        }
        if (*(void *)(a1 + 6696))
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"phLibNfc_GenericErrorHandler: Independent SMB TX Blocked Received");
          phOsalNfc_SetMemory();
          LODWORD(v28) = 255;
          sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_GenericErrorHandler:pSeListenerNtfCb[SMB TX BLOCKED]");
          (*(void (**)(void, void, uint64_t, void, _OWORD *, void))(a1 + 6696))(*(void *)(a1 + 19360), *(void *)(a1 + 6704), 28, *(void *)(a1 + 392), v27, 0);
        }
        return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
      }
      if (a4 != 133)
      {
        uint64_t v11 = (unsigned int *)(a1 + 19368);
        uint64_t v12 = "Generic error received: phNciNfc_e_ErrorNotDefined -Unknown error code";
LABEL_38:
        int v13 = 1;
        goto LABEL_39;
      }
      if (*(void *)(a1 + 6568))
      {
        sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"GenericErrorHandler :pGenericNtfCb[GENERIC ERR Ntf]");
        (*(void (**)(void, void, uint64_t, int *))(a1 + 6568))(*(void *)(a1 + 19360), *(void *)(a1 + 6576), 133, a3 + 1);
      }
      uint64_t v15 = *(void *)(a1 + 6056);
      int v16 = a3[1];
      if (v15 && (v16 - 229) <= 0x11)
      {
        int v17 = 1 << (v16 + 27);
        if ((v17 & 0x43) != 0)
        {
LABEL_48:
          uint64_t v18 = (unsigned int *)a1;
          uint64_t v19 = 137;
          goto LABEL_49;
        }
        if ((v17 & 0x20024) != 0)
        {
          uint64_t v18 = (unsigned int *)a1;
          uint64_t v19 = 136;
LABEL_49:
          sub_2259E53D0(v18, v19);
          return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
        }
      }
      if ((v16 - 251) > 3) {
        return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
      }
      int v21 = 0;
      uint64_t v22 = *(void *)(a1 + 3192);
      if (v22 && v22 != 0xFFFFFFFFFFFFLL)
      {
        phOsalNfc_Timer_Stop();
        *(unsigned char *)(a1 + 6032) = 0;
        int v21 = 1;
        sub_2259D730C(1, (unsigned int *)(a1 + 19368), *(void *)(a1 + 3192), 4u, 4u, (uint64_t)"phLibNfc_GenericErrorHandler", (uint64_t)"hMultiTagNtfWaitTimerId", 0);
        phOsalNfc_Timer_Delete();
        *(void *)(a1 + 3192) = 0xFFFFFFFFFFFFLL;
        uint64_t v15 = *(void *)(a1 + 6056);
      }
      uint64_t v23 = (unsigned int *)(a1 + 19368);
      if (!v15)
      {
        *(unsigned char *)(a1 + 3216) = 0;
        sub_2259A0EAC(1, v23, 4u, 4u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler- Independant Prop Tag Det NTF Rxd");
        return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
      }
      if (a3[1] == 253)
      {
        sub_2259A0EAC(1, v23, 4u, 1u, (uint64_t)"Generic error received: UNEXPECTED MULTI TAG DETECTION ERROR");
        goto LABEL_48;
      }
      sub_2259A0EAC(1, v23, 4u, 2u, (uint64_t)"Generic error received: MULTI_TAG ERROR");
      if (v21 && !*(unsigned char *)(a1 + 3216))
      {
        *(unsigned char *)(a1 + 3216) = 1;
        *(void *)(a1 + 2912) = off_26B606D40;
        *(unsigned char *)(a1 + 2904) = 0;
        *(unsigned char *)(a1 + 2906) = 0;
        char v24 = (char)off_26B606D40[0];
        if (off_26B606D40[0])
        {
          char v24 = 0;
          long long v25 = &qword_26B606D50;
          do
          {
            ++v24;
            uint64_t v26 = *v25;
            v25 += 2;
          }
          while (v26);
        }
        *(unsigned char *)(a1 + 2905) = v24;
        if (sub_2259B528C(a1, 0, 0) != 13) {
          sub_225A41358((unsigned int *)a1, 255);
        }
      }
      return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
  }
}

uint64_t sub_225A43008(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerAssertCb");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"TriggerNfccAssertion: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, 0, 0);
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerAssertCb");
}

unint64_t sub_225A430B8(unsigned int a1)
{
  unsigned int v13 = a1;
  sub_2259A0FB0(1, &v13, 4u, 5u, (uint64_t)"phLibNfc_FrameDebugParam");
  if (v13)
  {
    if (v13 != 1)
    {
      sub_2259A0EAC(1, &v13, 4u, 1u, (uint64_t)"phLibNfc_FrameDebugParam: passed controller type is unknown");
      unint64_t v11 = 0;
      goto LABEL_7;
    }
    uint64_t v1 = &dword_26ABD8410;
  }
  else
  {
    uint64_t v1 = &dword_26ABD8328;
  }
  unsigned int v3 = *v1;
  unsigned int v2 = v1[1];
  int8x16_t v4 = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v3), (uint32x4_t)xmmword_225A5FC20), (int8x16_t)xmmword_225A5FC30);
  v5.i64[0] = v4.u32[0];
  v5.i64[1] = v4.u32[1];
  uint64x2_t v6 = v5;
  v5.i64[0] = v4.u32[2];
  v5.i64[1] = v4.u32[3];
  uint32x4_t v7 = (uint32x4_t)vdupq_n_s32(v2);
  int8x16_t v8 = (int8x16_t)vshlq_u32(v7, (uint32x4_t)xmmword_225A5FC60);
  v8.i32[3] = vshlq_u32(v7, (uint32x4_t)xmmword_225A5FC80).i32[3];
  int8x16_t v9 = vorrq_s8(vandq_s8(v8, (int8x16_t)xmmword_225A5FC90), vorrq_s8(vandq_s8((int8x16_t)vshlq_u32(v7, (uint32x4_t)xmmword_225A5FC70), (int8x16_t)xmmword_225A5FCA0), vandq_s8((int8x16_t)vshlq_u32(v7, (uint32x4_t)xmmword_225A5FCB0), (int8x16_t)xmmword_225A5FCC0)));
  *(int8x8_t *)v9.i8 = vorr_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
  int8x16_t v10 = vorrq_s8((int8x16_t)vshlq_u64(v6, (uint64x2_t)xmmword_225A5FC50), (int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_225A5FC40));
  unint64_t v11 = *(void *)&vorr_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)) | ((unint64_t)((v3 >> 17) & 1) << 46) | ((unint64_t)((v3 >> 23) & 0x1F) << 36) | ((unint64_t)((v3 >> 18) & 0x1F) << 41) | (v2 << 31) | ((unint64_t)(v3 >> 28) << 32) | (v2 << 29) & 0x40000000 | (v2 >> 31) | (v2 << 25) & 0x10000000 | (((v2 >> 2) & 1) << 29) | v9.i32[0] | (v2 >> 29) & 2 | v9.i32[1];
LABEL_7:
  sub_2259A10B4(1, &v13, 4u, 5u, (uint64_t)"phLibNfc_FrameDebugParam");
  return v11;
}

uint64_t sub_225A4328C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeEnd");
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 2952);
    if (*(_DWORD *)(a1 + 3176) != 1) {
      phTmlNfc_IoCtl();
    }
    sub_225A0EB08(a1);
    phOsalNfc_FreeMemory();
    sub_2259E0368(v2, 0);
  }

  return sub_2259A10B4(2, 0, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeEnd");
}

uint64_t sub_225A43334(uint64_t a1, uint64_t a2)
{
  __int16 v20 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  int v17 = 8;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigNciMode");
  if (!a1)
  {
    int8x16_t v9 = "FAILURE, Libnfc or Download Context is Invalid";
    int v10 = 2;
    unint64_t v11 = 0;
LABEL_17:
    sub_2259A0EAC(v10, v11, 4u, 1u, (uint64_t)v9);
    a2 = 255;
    goto LABEL_28;
  }
  uint64_t v4 = *(void *)(a1 + 2952);
  sub_2259E0934(v4, &v18);
  sub_2259E01E4(v4, &v17);
  sub_2259E0024(v4, &v19);
  uint64_t v5 = 0;
  char v6 = 1;
  while (1)
  {
    char v7 = v6;
    if (*((void *)&unk_26ABD79B8 + 14 * v5) == v4) {
      break;
    }
    char v6 = 0;
    uint64_t v5 = 1;
    if ((v7 & 1) == 0)
    {
      int v8 = 255;
      goto LABEL_8;
    }
  }
  int v8 = *((_DWORD *)&unk_26ABD79B8 + 28 * v5 + 2);
LABEL_8:
  if (!v19 || !v18)
  {
    unint64_t v11 = (unsigned int *)(a1 + 19368);
    int8x16_t v9 = "FAILURE, IOCTL/DNLD Context is Invalid";
    int v10 = 1;
    goto LABEL_17;
  }
  int v12 = sub_2259BC888(*(void *)(v19 + 8), *(unsigned __int8 *)(v19 + 92), *(unsigned __int8 *)(v19 + 94));
  if ((v17 & 0xFFFFFFFD) != 4) {
    goto LABEL_27;
  }
  if (v12 == 6) {
    goto LABEL_14;
  }
  if (v12 == 3)
  {
    if (*(unsigned char *)(v19 + 94) == 1)
    {
LABEL_14:
      if (v8 != 1) {
        goto LABEL_27;
      }
      goto LABEL_23;
    }
LABEL_27:
    sub_2259B5D34(a1, *(void *)(a1 + 2912), 1);
    goto LABEL_28;
  }
  if (v12 != 7 || v8 != 1) {
    goto LABEL_27;
  }
LABEL_23:
  phTmlNfc_IoCtl();
  a2 = phTmlNfc_IoCtl();
  sub_2259D73B8(1, (unsigned int *)(a1 + 19368), 4u, 3u, (uint64_t)"phLibNfc_ConfigNciMode: Assert Wakeup Status=");
  if (a2 == 179)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigNciMode: NFCSTATUS_SPMI_NACK1");
    phOsalNfc_Delay();
    a2 = phTmlNfc_IoCtl();
    sub_2259D73B8(1, (unsigned int *)(a1 + 19368), 4u, 3u, (uint64_t)"phLibNfc_ConfigNciMode: Assert Wakeup Status=");
  }
  if (a2 != 179)
  {
    if (!a2) {
      goto LABEL_27;
    }
    int v16 = "phLibNfc_ConfigNciMode Unexpected Driver Error";
LABEL_32:
    sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v16);
    goto LABEL_28;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigNciMode: NFCSTATUS_SPMI_NACK2");
  sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigNciMode: Update client-ID to Secondary client ID(0x0B)");
  uint64_t v15 = phTmlNfc_ConfigureSpmi();
  if (v15)
  {
    a2 = v15;
    int v16 = "phLibNfc_ConfigNciMode - client ID update failed";
    goto LABEL_32;
  }
  phTmlNfc_ReadAbort();
  phTmlNfc_FlushTxRxBuffers();
  if (!sub_2259E0DA4(v4)) {
    phTmlNfc_WriteAbort();
  }
  *(void *)(a1 + 2952) = v4;
  *(void *)(a1 + 19360) = v4;
  if (sub_225A500C4(v4, (uint64_t)&v20, (uint64_t)sub_2259B528C, a1, 1, 0) == 13) {
    a2 = 13;
  }
  else {
    a2 = 255;
  }
LABEL_28:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigNciMode");
  return a2;
}

uint64_t sub_225A4366C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SysConfigInitRspCb");
  if (a1 && a3)
  {
    char v6 = (unsigned __int16 *)a3[1];
    int v7 = a2;
    if (v6) {
      int v7 = *v6;
    }
    if (!v7)
    {
      uint64_t v8 = *a3;
      *(void *)(a1 + 3040) = *a3;
      if (sub_2259E8F40(a1, v8)
        || !sub_2259BC888(*(void *)(a1 + 19360), *(unsigned __int8 *)(a1 + 2988), *(unsigned __int8 *)(a1 + 3088)))
      {
        a2 = 255;
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SysConfigInitRspCb");
  return a2;
}

uint64_t sub_225A43720(unsigned int *a1, uint64_t a2, unsigned int a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ParseRfConfigSignedInputBuffer");
  if (!a2 || !a3 || !a4)
  {
    if (a4) {
      *a4 = 0;
    }
    uint64_t v15 = 1;
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"Invalid input parameter");
    goto LABEL_23;
  }
  __int16 v8 = 0;
  char v9 = 0;
  unsigned int v10 = 0;
  while (1)
  {
    int v11 = *(unsigned __int8 *)(a2 + v10);
    if ((v11 - 160) >= 2) {
      break;
    }
    int v12 = 0;
    unsigned int v13 = v10 + 2;
    v8 += *(unsigned __int8 *)(a2 + v10 + 2) + 3;
    ++v9;
    unsigned int v14 = v10 + 3;
LABEL_13:
    unsigned int v10 = v12 + v14 + *(unsigned __int8 *)(a2 + v12 + v13);
    if (v10 >= a3) {
      goto LABEL_19;
    }
  }
  if (v11 != 240) {
    goto LABEL_19;
  }
  if (*(unsigned char *)(a2 + v10 + 1) != 2) {
    goto LABEL_19;
  }
  unsigned int v13 = v10 + 2;
  if (*(unsigned char *)(a2 + v10 + 2)) {
    goto LABEL_19;
  }
  unsigned int v14 = v10 + 3;
  if (*(unsigned char *)(a2 + v10 + 3) != 8) {
    goto LABEL_19;
  }
  if ((unsigned __int16)(v8 - 1) < 0xF2u)
  {
    __int16 v8 = 0;
    int v12 = 1;
    goto LABEL_13;
  }
  sub_2259A0EAC(2, a1, 4u, 2u, (uint64_t)"phLibNfc_ParseRfConfigSignedInputBuffer: Payload Len issue");
LABEL_19:
  if (v10 == a3 && v9)
  {
    uint64_t v15 = 0;
    *a4 = v9;
  }
  else
  {
    *a4 = 0;
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"Inconsistent input buffer!");
    uint64_t v15 = 255;
  }
LABEL_23:
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ParseRfConfigSignedInputBuffer");
  return v15;
}

uint64_t sub_225A438D0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LpcdTraceNtfHandler");
  if (a3 && a1 && !a4)
  {
    int v7 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 6568);
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 6576);
      sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LpcdTraceNtfHandler :pGenericNtfCb[Lpcd Trace Ntf]");
      v7(*(void *)(a1 + 19360), v8, 82, a3);
    }
  }
  else
  {
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_LpcdTraceNtfHandler: Can not process LPCD Trace NTF - Invalid input parameters");
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LpcdTraceNtfHandler");
}

uint64_t sub_225A439B0(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReConfigHsuBrCmd");
  if (a1)
  {
    if (*(unsigned char *)(a1 + 2939) == 1 || *(unsigned char *)(a1 + 2944) == 1 || (unsigned int v2 = *(_DWORD *)(a1 + 3056), v2 == 2)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = sub_225A51598(*(void *)(a1 + 3040), v2, (uint64_t)sub_2259B5A70, a1);
    }
  }
  else
  {
    uint64_t v3 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReConfigHsuBrCmd");
  return v3;
}

uint64_t sub_225A43A64(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClrRetAssertDataCb");
  if (a1)
  {
    if (a2) {
      uint64_t v4 = 146;
    }
    else {
      uint64_t v4 = 145;
    }
    sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, a1 + 8, 0);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_ClrRetAssertDataCb:Context is Null");
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClrRetAssertDataCb");
}

uint64_t sub_225A43B10(uint64_t a1, unsigned __int8 *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseAssertionData");
  if (!a1) {
    goto LABEL_22;
  }
  if (a2[1])
  {
    int v12 = (unsigned int *)(a1 + 19368);
    unsigned int v13 = "phLibNfc_ParseAssertionData:Failed Status Received From Lower Layer";
LABEL_21:
    sub_2259A0EAC(1, v12, 4u, 1u, (uint64_t)v13);
LABEL_22:
    uint64_t v19 = 255;
    goto LABEL_23;
  }
  int v14 = *(unsigned __int8 *)(a1 + 2936);
  if (v14 == 1)
  {
    unsigned int v15 = 146;
  }
  else if (*(unsigned char *)(a1 + 2938) == 1)
  {
    unsigned int v15 = 186;
  }
  else if (*(unsigned char *)(a1 + 2946) == 1)
  {
    unsigned int v15 = 126;
  }
  else
  {
    unsigned int v15 = 166;
  }
  unsigned int v16 = *a2;
  if (v15 != v16)
  {
    int v12 = (unsigned int *)(a1 + 19368);
    unsigned int v13 = "phLibNfc_ParseAssertionData:INvalid Length Received from Lower Layer";
    goto LABEL_21;
  }
  if (v16 >= 3)
  {
    uint64_t v17 = 0;
    uint64_t v18 = v15 - 2;
    while (a2[v17 + 3] != 160 || a2[v17 + 4] != 26 || a2[v17 + 5] != 4)
    {
      if (v18 == ++v17) {
        goto LABEL_18;
      }
    }
    uint64_t v19 = 0;
    *a3 = v17 + 6;
    if (!v14) {
      goto LABEL_25;
    }
LABEL_19:
    int v20 = 64;
    goto LABEL_28;
  }
LABEL_18:
  uint64_t v19 = 255;
  if (*(unsigned char *)(a1 + 2936)) {
    goto LABEL_19;
  }
LABEL_25:
  if (*(unsigned char *)(a1 + 2938) == 1) {
    int v20 = 96;
  }
  else {
    int v20 = 80;
  }
LABEL_28:
  uint64_t v22 = *a2;
  if (v22 >= 3)
  {
    uint64_t v24 = 2;
    while (a2[v24 + 1] != 160 || a2[v24 + 2] != 27 || v20 != a2[v24 + 3])
    {
      if (v22 == ++v24) {
        goto LABEL_35;
      }
    }
    uint64_t v19 = 0;
    *a4 = v24 + 4;
    LODWORD(v22) = *a2;
LABEL_35:
    unsigned int v23 = v22;
    if (v22 <= 2) {
      goto LABEL_41;
    }
    uint64_t v25 = 2;
    while (a2[v25 + 1] != 160 || a2[v25 + 2] != 28 || a2[v25 + 3] != 44)
    {
      if (v22 == ++v25) {
        goto LABEL_41;
      }
    }
    uint64_t v19 = 0;
    *a6 = v25 + 4;
    LODWORD(v22) = *a2;
  }
  unsigned int v23 = v22;
LABEL_41:
  if (v14 == 1) {
    unsigned __int8 v26 = 20;
  }
  else {
    unsigned __int8 v26 = 24;
  }
  if (*(unsigned char *)(a1 + 2938) == 1) {
    v26 += 4;
  }
  if (*(unsigned char *)(a1 + 2946) == 1) {
    v26 -= 8;
  }
  if (v23 >= 3)
  {
    uint64_t v27 = 0;
    uint64_t v28 = v22 - 2;
    while (a2[v27 + 3] != 160 || a2[v27 + 4] != 39 || a2[v27 + 5] != v26)
    {
      if (v28 == ++v27) {
        goto LABEL_23;
      }
    }
    uint64_t v19 = 0;
    *a5 = v27 + 6;
  }
LABEL_23:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseAssertionData");
  return v19;
}

uint64_t sub_225A43DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetNfccParamsCallback");
  if (a1)
  {
    char v6 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 6776);
    uint64_t v7 = *(void *)(a1 + 6784);
    *(_OWORD *)(a1 + 6776) = 0u;
    if (v6)
    {
      sub_22599F8E0(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SM_eGetNfcParams: Invoking callback, wStatus = ");
      sub_2259D6F6C(1, (unsigned int *)(a1 + 19368), 4u, 131, (uint64_t)"phLibNfc_GetNfccParamsCallback", (uint64_t)"phLibNfc_GetNfccParamsCallback", 0);
      v6(*(void *)(a1 + 19360), v7, a2, a3);
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetNfccParamsCallback");
}

uint64_t sub_225A43EF0(unsigned int a1, uint64_t a2)
{
  unsigned int v4 = a1;
  sub_2259A0FB0(1, &v4, 4u, 5u, (uint64_t)"phLibNfc_StopTimer");
  if (a2 && a2 != 0xFFFFFFFFFFFFLL && phOsalNfc_Timer_Stop()) {
    sub_22599F8E0(1, &v4, 4u, 4u, (uint64_t)"LibNfc Timer_Stop failed,Stat=");
  }
  return sub_2259A10B4(1, &v4, 4u, 5u, (uint64_t)"phLibNfc_StopTimer");
}

uint64_t sub_225A43F94(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetFwTypeCmd");
  if (a1)
  {
    if (*(unsigned char *)(a1 + 3216) == 1
      || ((unsigned int v2 = *(unsigned __int8 *)(a1 + 2980), v3 = *(unsigned __int8 *)(a1 + 2937), v3 == 1)
        ? (BOOL v4 = v2 > 0xA)
        : (BOOL v4 = 0),
          v4 || *(unsigned char *)(a1 + 2938) == 1 || *(unsigned char *)(a1 + 2944) == 1))
    {
      uint64_t v5 = sub_225A568B0(*(void *)(a1 + 3040), (uint64_t)sub_2259B5A70, a1);
    }
    else
    {
      if ((v2 & 0xFFFFFFFD) != 0xFC && (v3 == 1 || *(unsigned char *)(a1 + 2936) == 1))
      {
        uint64_t v5 = 0;
        if (v2 - 160 > 0x3F) {
          int v7 = 1;
        }
        else {
          int v7 = 2;
        }
      }
      else
      {
        uint64_t v5 = 0;
        int v7 = 3;
      }
      *(_DWORD *)(a1 + 3148) = v7;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetFwTypeCmd");
  return v5;
}

uint64_t sub_225A440C4(unsigned int *a1, uint64_t a2, unsigned __int8 **a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetFwTypeProc");
  if (a1 && a3)
  {
    if (!a2 && *a3 && *((_DWORD *)a3 + 2))
    {
      sub_2259A0EAC(1, a1 + 4842, 4u, 4u, (uint64_t)"phLibNfc_GetFwTypeProc: operation success");
      int v6 = **a3;
      if ((v6 - 1) >= 2)
      {
        **a3 = 3;
        int v6 = **a3;
      }
      a2 = 0;
    }
    else
    {
      sub_2259A0EAC(1, a1 + 4842, 4u, 1u, (uint64_t)"phLibNfc_GetFwTypeProc: operation failed");
      int v6 = 3;
    }
    a1[787] = v6;
  }
  else
  {
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"phLibNfc_GetFwTypeProc: Libnfc Context is Invalid");
    a2 = 255;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetFwTypeProc");
  return a2;
}

uint64_t sub_225A441E4(unsigned int *a1, uint64_t a2, unsigned __int8 **a3)
{
  sub_2259A0FB0(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc");
  if (a1 && a3)
  {
    if (!a2 && *a3 && *((_DWORD *)a3 + 2))
    {
      sub_2259A0EAC(1, a1 + 4842, 4u, 4u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc: operation success");
      int v7 = *a3;
      unsigned int v8 = **a3;
      if (v8 - 1 >= 2)
      {
        *int v7 = 3;
        int v7 = *a3;
        unsigned int v8 = **a3;
      }
      a2 = 0;
      a1[787] = v8;
      int v9 = a1[746] | (v7[1] << 24);
      a1[746] = v9;
      int v10 = v9 | (v7[2] << 16);
      a1[746] = v10;
      int v11 = v10 | (v7[3] << 8);
      a1[746] = v11;
      a1[746] = v11 | v7[4];
    }
    else
    {
      sub_2259A0EAC(1, a1 + 4842, 4u, 1u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc: operation failed");
      a1[787] = 3;
      a1[746] = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, a1, 4u, 1u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc: Libnfc Context is Invalid");
    a2 = 255;
  }
  sub_2259A10B4(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc");
  return a2;
}

uint64_t sub_225A44340(unsigned int *a1, uint64_t a2)
{
  if (a1)
  {
    sub_225A41358(a1, a2);
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_MultiTagGetFwInfoComplete: Libnfc Context is Invalid");
    a2 = 255;
  }
  sub_2259A10B4(2, 0, 4u, 5u, (uint64_t)"phLibNfc_MultiTagGetFwInfoComplete");
  return a2;
}

uint64_t sub_225A443D4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropTagRemDetNtfHandler");
  if (a1)
  {
    if (a2 == 32)
    {
      sub_225A24FAC(*(void *)(a1 + 19360), 152, 0, 0, 0);
      int v7 = *(void (**)(void, uint64_t, void, void, uint64_t))(a1 + 6232);
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 6240);
        sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"TagRemDetNtfHandler :RemDevNtfCB[TagRemDetNtf]");
        v7(*(void *)(a1 + 19360), v8, 0, 0, a4);
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropTagRemDetNtfHandler");
}

uint64_t sub_225A444B0(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropLpcdDebugNtfHandler");
  if (a3 && a2 == 33 && a1 && !a4 && *(void *)(a1 + 6568))
  {
    sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"PropLpcdDebugNtfHandler :pGenericNtfCb[Lpcd Dbg Ntf]");
    (*(void (**)(void, void, uint64_t, uint64_t))(a1 + 6568))(*(void *)(a1 + 19360), *(void *)(a1 + 6576), 75, a3);
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropLpcdDebugNtfHandler");
}

uint64_t sub_225A4457C(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfLpcdAssistExitNtfHandler");
  if (a2 == 45 && a1 && !a4 && *(void *)(a1 + 6568))
  {
    sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RfLpcdAssistExitNtfHandler :pGenericNtfCb[Lpcd Assistance Exit Ntf]");
    (*(void (**)(void, void, uint64_t, void))(a1 + 6568))(*(void *)(a1 + 19360), *(void *)(a1 + 6576), 79, 0);
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfLpcdAssistExitNtfHandler");
}

uint64_t sub_225A44640(uint64_t a1, int a2, _DWORD *a3, int a4)
{
  int v16 = 0;
  uint64_t v15 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler");
  if (a1)
  {
    char v8 = 0;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *((void *)&unk_26ABD79B8 + 14 * v9 + 2);
      if (v8) {
        break;
      }
      char v8 = 1;
      uint64_t v9 = 1;
    }
    while (v10 != a1);
    if (v10 == a1)
    {
      if (a3 && a2 == 36 && !a4)
      {
        if (a3[2] == 11 && *(void *)a3)
        {
          phOsalNfc_SetMemory();
          int v11 = *(unsigned __int8 **)a3;
          LODWORD(v15) = v15 | **(unsigned __int8 **)a3 | (*(unsigned __int8 *)(*(void *)a3 + 1) << 8) | (*(unsigned __int8 *)(*(void *)a3 + 2) << 16);
          int v12 = HIDWORD(v15) | v11[4];
          LODWORD(v15) = v15 | (v11[3] << 24);
          HIDWORD(v15) = v12;
          HIDWORD(v15) = v12 | (v11[5] << 8) | (v11[6] << 16);
          int v13 = v16 | v11[8];
          HIDWORD(v15) |= v11[7] << 24;
          int v16 = v13;
          int v16 = v13 | (v11[9] << 8) | (v11[10] << 16);
          if (*(void *)(a1 + 6568))
          {
            sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler :pGenericNtfCb[Relay Attack Detection Ntf]");
            (*(void (**)(void, void, uint64_t, uint64_t *))(a1 + 6568))(*(void *)(a1 + 19360), *(void *)(a1 + 6576), 159, &v15);
          }
          else
          {
            sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler: pGenericNtfCb is NULL");
          }
        }
        else
        {
          sub_2259A0EAC(2, (unsigned int *)a1, 4u, 2u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler: Received Len is zero");
        }
      }
      else
      {
        sub_22599F9EC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler: Failed status");
      }
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler");
}

uint64_t sub_225A44860(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgValReInit");
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 6024) & 0xFE) == 2 && *(void *)(a1 + 6008) && *(_DWORD *)(a1 + 6016))
    {
      *(_DWORD *)(a1 + 5416) = 5;
      *(_DWORD *)(a1 + 5424) = 2;
      *(void *)(a1 + 5432) = a1 + 6008;
      uint64_t v2 = sub_225A56AD8(*(void *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_2259B5A70, a1);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd : Libnfc Context is Invalid");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgValReInit");
  return v2;
}

uint64_t sub_225A44954(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgStartReInit");
  if (a1)
  {
    if (*(unsigned char *)(a1 + 6024) == 3 && *(void *)(a1 + 6008) && *(_DWORD *)(a1 + 6016))
    {
      *(_DWORD *)(a1 + 5416) = 5;
      *(_DWORD *)(a1 + 5424) = 1;
      uint64_t v2 = sub_225A56AD8(*(void *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_2259B5A70, a1);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd : Libnfc Context is Invalid");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgStartReInit");
  return v2;
}

uint64_t sub_225A44A38(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropChipScopeLoggingNtfHandler");
  if (a1)
  {
    if (a3 && a2 == 34 && !a4)
    {
      if (*(_DWORD *)(a3 + 8) && *(void *)a3)
      {
        char v8 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 6568);
        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 6576);
          sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"ChipScopeLoggingNtfHandler :pGenericNtfCb[Chip Scope Dbg Ntf]");
          v8(*(void *)(a1 + 19360), v9, 134, a3);
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"PropChipScopeLoggingNtfHandler: Received Len is zero");
      }
    }
    else
    {
      sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"PropChipScopeLoggingNtfHandler: Failed status");
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropChipScopeLoggingNtfHandler");
}

uint64_t sub_225A44B60(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler");
  if (a1)
  {
    char v8 = 0;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *((void *)&unk_26ABD79B8 + 14 * v9 + 2);
      if (v8) {
        break;
      }
      char v8 = 1;
      uint64_t v9 = 1;
    }
    while (v10 != a1);
    if (v10 == a1)
    {
      if (a3 && a2 == 44 && !a4)
      {
        if (*(_DWORD *)(a3 + 8) && *(void *)a3)
        {
          int v11 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(a1 + 6568);
          if (v11)
          {
            uint64_t v12 = *(void *)(a1 + 6576);
            sub_2259A2E90(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler :pGenericNtfCb[Smb Logging Ntf]");
            v11(*(void *)(a1 + 19360), v12, 142, a3);
          }
        }
        else
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler: Received Len is zero");
        }
      }
      else
      {
        sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler: Failed status");
      }
    }
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler");
}

uint64_t sub_225A44CC0(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertRegCmd");
  if (a1)
  {
    BYTE8(v4[0]) = 39;
    *(void *)&v4[0] = 0xA01CA01BA01AA004;
    uint64_t v2 = sub_225A52594(*(void *)(a1 + 3040), (uint64_t)v4, 9, (uint64_t)sub_2259B5A70, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetAssertRegCmd: Invalid Libnfc Context");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertRegCmd");
  return v2;
}

uint64_t sub_225A44DD0(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  memset(v12, 0, sizeof(v12));
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertRegRsp");
  if (!a1)
  {
    int v7 = "phLibNfc_ClrRetAssertDataCb:Context is Null";
    int v8 = 2;
    uint64_t v6 = 0;
LABEL_10:
    sub_2259A0EAC(v8, v6, 4u, 1u, (uint64_t)v7);
    a2 = 255;
    goto LABEL_11;
  }
  if (!a2)
  {
    if (!a3 || !*(void *)(a1 + 8))
    {
      uint64_t v6 = (unsigned int *)(a1 + 19368);
      int v7 = "phLibNfc_ClrRetAssertDataCb:User Buffer is Null";
      goto LABEL_9;
    }
    if (sub_225A43B10(a1, a3, (_DWORD *)&v11 + 1, &v11, (_DWORD *)&v10 + 1, &v10))
    {
      uint64_t v6 = (unsigned int *)(a1 + 19368);
      int v7 = "phLibNfc_ClrRetAssertDataCb:Parsing Assertion Data Failed";
LABEL_9:
      int v8 = 1;
      goto LABEL_10;
    }
    if (HIDWORD(v11))
    {
      phOsalNfc_MemCopy();
      sub_22599F9EC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Assert Reg Program Counter");
    }
    if (v11)
    {
      phOsalNfc_SetMemory();
      phOsalNfc_MemCopy();
      sub_2259CB4DC(a1, *(void *)(a1 + 8) + 4, (uint64_t)v12);
    }
    if (HIDWORD(v10))
    {
      phOsalNfc_SetMemory();
      phOsalNfc_MemCopy();
      sub_2259CBD90(a1, *(void *)(a1 + 8) + 144, (uint64_t)v12);
    }
    a2 = v10;
    if (v10)
    {
      phOsalNfc_SetMemory();
      phOsalNfc_MemCopy();
      sub_2259CBAE4(*(_DWORD *)(a1 + 19368), *(void *)(a1 + 8) + 100, (uint64_t)v12);
      a2 = 0;
    }
  }
LABEL_11:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertRegRsp");
  return a2;
}

uint64_t sub_225A45080(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogCmd");
  if (!a1 || a2)
  {
    uint64_t v5 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  else if (*(unsigned char *)(a1 + 2936) == 1)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4)
    {
      *(void *)(v4 + 176) = 0;
      *(_DWORD *)(v4 + 184) = 0;
    }
    uint64_t v5 = 0;
    *(void *)(a1 + 288) = 0;
    *(_DWORD *)(a1 + 296) = 0;
  }
  else
  {
    uint64_t v5 = sub_225A5671C(*(void *)(a1 + 3040), 3, (uint64_t)sub_2259B5A70, a1);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogCmd");
  return v5;
}

uint64_t sub_225A4515C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogApiProc");
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6 && (*(void *)(v6 + 176) = 0, *(_DWORD *)(v6 + 184) = 0, !a2) && a3)
    {
      if (*(void *)(a3 + 8) && *(_WORD *)(a3 + 2))
      {
        uint64_t Memory = phOsalNfc_GetMemory();
        *(void *)(a1 + 288) = Memory;
        if (!Memory)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Failed to allocate memory");
          a2 = 12;
          goto LABEL_12;
        }
        phOsalNfc_SetMemory();
        phOsalNfc_MemCopy();
        int v8 = *(unsigned __int16 *)(a3 + 2);
        *(_DWORD *)(a1 + 296) = v8;
        *(void *)(v6 + 176) = *(void *)(a1 + 288);
        *(_DWORD *)(v6 + 184) = v8;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Operation success");
      }
      a2 = 0;
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: operation failed");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Libnfc Context is Invalid");
    a2 = 255;
  }
LABEL_12:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogApiProc");
  return a2;
}

uint64_t sub_225A452D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogProc");
  if (a1)
  {
    *(void *)(a1 + 288) = 0;
    *(_DWORD *)(a1 + 296) = 0;
    if (a2 || !a3)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: operation failed");
    }
    else
    {
      if (*(void *)(a3 + 8) && *(_WORD *)(a3 + 2))
      {
        uint64_t Memory = phOsalNfc_GetMemory();
        *(void *)(a1 + 288) = Memory;
        if (!Memory)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Failed to allocate memory");
          a2 = 12;
          goto LABEL_11;
        }
        phOsalNfc_SetMemory();
        phOsalNfc_MemCopy();
        *(_DWORD *)(a1 + 296) = *(unsigned __int16 *)(a3 + 2);
        sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Operation success");
      }
      a2 = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Libnfc Context is Invalid");
    a2 = 255;
  }
LABEL_11:
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogProc");
  return a2;
}

uint64_t sub_225A45438(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetClrAssertComplete");
  if (a1)
  {
    if (a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetClrAssertComplete: Failed");
      uint64_t v4 = 146;
    }
    else
    {
      uint64_t v4 = 145;
    }
    uint64_t v5 = sub_225A24FAC(*(void *)(a1 + 19360), v4, a2, a1 + 8, 0);
    if (*(void *)(a1 + 288))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 288) = 0;
      *(_DWORD *)(a1 + 296) = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetClrAssertComplete: Invalid LibNfc Ctx");
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetClrAssertComplete");
  return v5;
}

uint64_t sub_225A45530(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtInit");
  if (!a2 || !a1 || !a3)
  {
    sub_2259A0EAC(2, (unsigned int *)a1, 3u, 4u, (uint64_t)" Invalid Param(s)..");
    uint64_t v10 = 1;
    goto LABEL_15;
  }
  if (a4 > 0xA)
  {
    if (*(void *)(a1 + 4816) || (uint64_t Memory = phOsalNfc_GetMemory(), (*(void *)(a1 + 4816) = Memory) != 0))
    {
      phOsalNfc_SetMemory();
      if (!sub_225A456B8((unsigned int *)a1, a2, a3, a4))
      {
        *(void *)(a1 + 4568) = a2;
        if (!sub_2259A91F0(a1))
        {
          uint64_t v10 = 0;
          goto LABEL_15;
        }
      }
      goto LABEL_12;
    }
    int v8 = (unsigned int *)(a1 + 6532);
    uint64_t v9 = " DataXchg SequenceHandler pointer MemAlloc Failed..";
  }
  else
  {
    int v8 = (unsigned int *)(a1 + 6532);
    uint64_t v9 = " Intf Actvd Payload Incomplete..";
  }
  sub_2259A0EAC(1, v8, 3u, 4u, (uint64_t)v9);
LABEL_12:
  if (*(void *)(a1 + 4816))
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Freeing RdrDataXchgSeq Mem..");
    phOsalNfc_FreeMemory();
    *(void *)(a1 + 4816) = 0;
  }
  uint64_t v10 = 188;
LABEL_15:
  sub_2259D3E5C((unsigned int *)a1, a2);
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtInit");
  return v10;
}

uint64_t sub_225A456B8(unsigned int *a1, uint64_t a2, unsigned char *a3, int a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateRemDevInfo");
  if (a1 && a2 && a3 && a4)
  {
    *(unsigned char *)(a2 + 8) = *a3;
    int v8 = a3[1];
    *(_DWORD *)(a2 + 12) = v8;
    if (v8)
    {
      *(_DWORD *)(a2 + 16) = a3[2];
      int v9 = a3[3];
      *(_DWORD *)(a2 + 20) = v9;
      *(unsigned char *)(a2 + 24) = a3[4];
      *(unsigned char *)(a2 + 25) = a3[5];
      uint64_t v10 = a3[6];
      *(unsigned char *)(a2 + 26) = v10;
      uint64_t v11 = &a3[v10];
      *(_DWORD *)(a2 + 28) = v11[7];
      *(unsigned char *)(a2 + 32) = v11[8];
      *(unsigned char *)(a2 + 33) = v11[9];
      switch(v9)
      {
        case 0:
        case 3:
        case 10:
        case 11:
        case 12:
          uint64_t v12 = sub_2259B1A6C((uint64_t)a1, a2, (uint64_t)a3, a4);
          goto LABEL_16;
        case 1:
          uint64_t v12 = sub_2259D6A94((uint64_t)a1, a2, a3, a4);
          goto LABEL_16;
        case 2:
        case 5:
          uint64_t v12 = sub_2259DB5C0((uint64_t)a1, a2, (uint64_t)a3, a4);
          goto LABEL_16;
        case 4:
        case 7:
        case 8:
        case 9:
          goto LABEL_13;
        case 6:
          uint64_t v12 = sub_2259E1144((uint64_t)a1, a2, a3, a4);
          goto LABEL_16;
        default:
          if (v9 == 112)
          {
            uint64_t v12 = sub_2259B1FC0(a1, a2, (uint64_t)a3, a4);
LABEL_16:
            uint64_t v13 = v12;
          }
          else
          {
LABEL_13:
            sub_2259A0EAC(1, a1 + 1633, 3u, 1u, (uint64_t)"Rf Technology and mode not supported");
            uint64_t v13 = 255;
          }
          break;
      }
    }
    else
    {
      sub_2259A0EAC(1, a1 + 1633, 3u, 2u, (uint64_t)"Interface is NFCEE Direct RF,subsequent payload contents ignored..");
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 1;
    sub_2259A0EAC(2, a1, 3u, 1u, (uint64_t)" Invalid Param(s)..");
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateRemDevInfo");
  return v13;
}

uint64_t sub_225A458E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtXchgData");
  if (a1)
  {
    if (!a2)
    {
      uint64_t v10 = (unsigned int *)(a1 + 6532);
      uint64_t v11 = " Invalid Device Handle Param..";
      goto LABEL_17;
    }
    if (*(void *)(a3 + 16) && *(_DWORD *)(a3 + 24))
    {
      if (*(void *)(a3 + 32) && *(_DWORD *)(a3 + 40) || *(_DWORD *)a3 == 4)
      {
        if (a4 && a5)
        {
          if (*(void *)(a1 + 4568) != a2)
          {
            uint64_t v10 = (unsigned int *)(a1 + 6532);
            uint64_t v11 = " Device Handle not Valid..";
LABEL_17:
            sub_2259A0EAC(1, v10, 3u, 4u, (uint64_t)v11);
            uint64_t v12 = 6;
            goto LABEL_18;
          }
          int v16 = *(void **)(a1 + 4816);
          if (!v16)
          {
            uint64_t v12 = 255;
            goto LABEL_18;
          }
          *(_DWORD *)(a1 + 4576) = *(_DWORD *)a3;
          *(_WORD *)(a1 + 4580) = *(_WORD *)(a3 + 4);
          *(_OWORD *)(a1 + 4592) = *(_OWORD *)(a3 + 16);
          *(_OWORD *)(a1 + 4608) = *(_OWORD *)(a3 + 32);
          *(_DWORD *)(a1 + 4582) = *(_DWORD *)(a3 + 6);
          *(unsigned char *)(a1 + 4624) = *(unsigned char *)(a3 + 48);
          *(void *)(a1 + 4632) = a4;
          *(void *)(a1 + 4640) = a5;
          *(void *)(a1 + 3792) = v16;
          *(unsigned char *)(a1 + 3992) = 0;
          *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, v16);
          uint64_t v12 = sub_225A45B24(a1, 0, 0);
          sub_22599F9EC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"RdrDataXchgSeq status received is..");
          if (v12 == 13)
          {
            *(unsigned char *)(a1 + 6491) = 1;
            goto LABEL_18;
          }
          int v14 = "Data Exchange Request Failed..";
          uint64_t v13 = (unsigned int *)(a1 + 6532);
          goto LABEL_15;
        }
        uint64_t v13 = (unsigned int *)(a1 + 6532);
        int v14 = "Invalid Upper layer inputs..";
      }
      else
      {
        uint64_t v13 = (unsigned int *)(a1 + 6532);
        int v14 = " Invalid Recv Buff Params..";
      }
    }
    else
    {
      uint64_t v13 = (unsigned int *)(a1 + 6532);
      int v14 = " Invalid Send Buff Params..";
    }
    uint64_t v12 = 1;
LABEL_15:
    sub_2259A0EAC(1, v13, 3u, 4u, (uint64_t)v14);
    goto LABEL_18;
  }
  sub_2259A0EAC(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
  uint64_t v12 = 1;
LABEL_18:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtXchgData");
  return v12;
}

uint64_t sub_225A45B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrDataXchgSequence");
  if (a1 && a2)
  {
    *(void *)(a1 + 3816) = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 3824) = *(_DWORD *)(a2 + 16);
  }
  uint64_t v6 = sub_2259CD490(a1, a3);
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrDataXchgSequence");
  return v6;
}

uint64_t sub_225A45BB8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtRelease");
  if (a1)
  {
    if (*(void *)(a1 + 4816))
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Freeing RdrDataXchgSeq Mem..");
      phOsalNfc_FreeMemory();
      uint64_t v2 = 0;
      *(void *)(a1 + 4816) = 0;
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtRelease");
  return v2;
}

uint64_t sub_225A45C80(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 6672) = 0;
    *(unsigned char *)(a1 + 6670) = 0;
    *(unsigned char *)(a1 + 4792) = 0;
    if (*(void *)(a1 + 4632))
    {
      sub_22599F9EC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Status received is...");
      if (!a2) {
        goto LABEL_7;
      }
      if (*(void *)(a1 + 4656))
      {
        phOsalNfc_FreeMemory();
        *(void *)(a1 + 4656) = 0;
        *(_DWORD *)(a1 + 4664) = 0;
      }
      if (a2 != 185)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Resetting received length to 0 for this Failed Scenario!!");
        *(_DWORD *)(a1 + 4616) = 0;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Invoking upper layer call back function");
        if (a2 == 44 && *(unsigned char *)(a1 + 4624) == 1) {
          *(unsigned char *)(a1 + 6505) = 1;
        }
      }
      else
      {
LABEL_7:
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Invoking upper layer call back function");
      }
      (*(void (**)(void, uint64_t, uint64_t))(a1 + 4632))(*(void *)(a1 + 4640), a2, a1 + 4608);
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)" Invalid Caller Param(s)..");
      a2 = 255;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
    a2 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteDataXchgSequence");
  return a2;
}

uint64_t sub_225A45E28(uint64_t a1, _WORD *a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkDataRetransmission");
  if (a1 && a2)
  {
    if (*(unsigned char *)(a1 + 6670) == 1
      && *a2 == 181
      && *(_DWORD *)(a1 + 6672) <= 3u
      && (sub_22599F8E0(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"phNciNfc_ChkDataRetransmission: Re-transmitting Data pkt Attempt.."), (char v4 = *(unsigned char *)(a1 + 3992)) != 0))
    {
      uint64_t v5 = 0;
      *a2 = 0;
      *(_WORD *)(a1 + 4582) = *(_DWORD *)(a1 + 6676);
      *(unsigned char *)(a1 + 3992) = v4 - 1;
      ++*(_DWORD *)(a1 + 6672);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 1;
    sub_2259A0EAC(2, (unsigned int *)a1, 3u, 1u, (uint64_t)" phNciNfc_ChkDataRetransmission: Invalid Nci Context or status parm");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkDataRetransmission");
  return v5;
}

uint64_t sub_225A45F3C(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TrigRfOnPropCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0xF00000001;
    DWORD2(v4) = 40;
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = 1;
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_2259A9684, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TrigRfOnPropCmd");
  return v2;
}

uint64_t sub_225A46034(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TrigRfOnPropCmdRsp");
  if (!a1)
  {
    long long v5 = "Trigger RF Feild On Ntf Invalid Parameter";
    a2 = 1;
    int v6 = 2;
    long long v4 = 0;
LABEL_6:
    sub_2259A0EAC(v6, v4, 3u, 1u, (uint64_t)v5);
    goto LABEL_7;
  }
  if (a2)
  {
    long long v4 = (unsigned int *)(a1 + 6532);
    long long v5 = "Trigger RF Feild On Ntf resposne received with failure status";
LABEL_4:
    int v6 = 1;
    goto LABEL_6;
  }
  if (*(_DWORD *)(a1 + 3824) == 1)
  {
    a2 = 147;
    switch(**(unsigned char **)(a1 + 3816))
    {
      case 0:
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Trigger RF Feild On Ntf command accepted by NFCC");
        a2 = 0;
        break;
      case 1:
        long long v4 = (unsigned int *)(a1 + 6532);
        long long v5 = "Trigger RF Feild On Ntf command rejected by NFCC";
        goto LABEL_4;
      case 3:
        int v8 = (unsigned int *)(a1 + 6532);
        int v9 = "Trigger RF Feild On Ntf command failed by NFCC";
        goto LABEL_12;
      case 6:
        break;
      default:
        goto LABEL_13;
    }
  }
  else
  {
    int v8 = (unsigned int *)(a1 + 6532);
    int v9 = "Trigger RF Feild On Ntf response received with invalid payload length";
LABEL_12:
    sub_2259A0EAC(1, v8, 3u, 1u, (uint64_t)v9);
LABEL_13:
    a2 = 255;
  }
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TrigRfOnPropCmdRsp");
  return a2;
}

uint64_t sub_225A461A8(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TurnRfOnOffPropCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0xF00000001;
    DWORD2(v4) = 51;
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = *(_DWORD *)(a1 + 888);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_2259A9684, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TurnRfOnOffPropCmd");
  return v2;
}

uint64_t sub_225A462A0(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TurnRfOnOffPropCmdRsp");
  if (!a1)
  {
    long long v4 = "Turn RF ON or OFF command Invalid Parameter";
    int v5 = 2;
    int v6 = 0;
    goto LABEL_11;
  }
  if (!a2)
  {
    if (*(_DWORD *)(a1 + 3824) == 1)
    {
      int v7 = **(unsigned __int8 **)(a1 + 3816);
      if (v7 == 6)
      {
        int v9 = (unsigned int *)(a1 + 6532);
        uint64_t v10 = "Turn RF ON or OFF command Symantic Error";
      }
      else
      {
        if (v7 != 1)
        {
          if (!**(unsigned char **)(a1 + 3816))
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Turn RF ON or OFF command accepted by NFCC");
            a2 = 0;
            goto LABEL_13;
          }
LABEL_12:
          a2 = 255;
          goto LABEL_13;
        }
        int v9 = (unsigned int *)(a1 + 6532);
        uint64_t v10 = "Turn RF ON or OFF command rejected by NFCC";
      }
      sub_2259A0EAC(1, v9, 3u, 1u, (uint64_t)v10);
      a2 = 147;
      goto LABEL_13;
    }
    int v6 = (unsigned int *)(a1 + 6532);
    long long v4 = "Turn RF ON or OFF response received with invalid payload length";
    int v5 = 1;
LABEL_11:
    sub_2259A0EAC(v5, v6, 3u, 1u, (uint64_t)v4);
    goto LABEL_12;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Turn RF ON or OFF resposne received with failure status");
LABEL_13:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TurnRfOnOffPropCmdRsp");
  return a2;
}

uint64_t sub_225A463F0(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0xF00000001;
    DWORD2(v4) = 50;
    *(void *)&long long v5 = a1 + 3744;
    DWORD2(v5) = *(unsigned __int8 *)(a1 + 3754);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_2259A9684, a1);
  }
  else
  {
    uint64_t v2 = 1;
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter");
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropCmd");
  return v2;
}

uint64_t sub_225A464E8(unsigned int *a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_225A46550(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(unsigned char *)(a1 + 3754) = 0;
    sub_225A362F4(a1, a2, a1 + 3816);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropSeqComplete");
  return a2;
}

uint64_t sub_225A465C8(unsigned int *a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0xF00000001;
    DWORD2(v4) = 17;
    *(void *)&long long v5 = 0;
    DWORD2(v5) = 0;
    uint64_t v2 = sub_225A47614((uint64_t)(a1 + 230), (uint64_t)&v4, (uint64_t)(a1 + 954), 2000, (uint64_t)sub_225A471B4, (uint64_t)a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnCmd");
  return v2;
}

uint64_t sub_225A466B8(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnRsp");
  if (!a1)
  {
    a2 = 1;
    goto LABEL_14;
  }
  if (!a2)
  {
    if (*(_DWORD *)(a1 + 3824) == 1)
    {
      int v4 = **(unsigned __int8 **)(a1 + 3816);
      if (v4 != 6)
      {
        if (v4 == 1)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Presence check extension command rejected by NFCC");
          a2 = 147;
          goto LABEL_14;
        }
        if (!**(unsigned char **)(a1 + 3816))
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Presence check extension command accepted by NFCC");
          a2 = 0;
          goto LABEL_14;
        }
LABEL_13:
        a2 = 255;
        goto LABEL_14;
      }
      long long v5 = (unsigned int *)(a1 + 6532);
      int v6 = "Presence check extension semantic error received";
    }
    else
    {
      long long v5 = (unsigned int *)(a1 + 6532);
      int v6 = "Presence check extension response received with invalid payload length";
    }
    sub_2259A0EAC(1, v5, 3u, 2u, (uint64_t)v6);
    goto LABEL_13;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Presence check extension response received with failure status");
LABEL_14:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnRsp");
  return a2;
}

uint64_t sub_225A467FC(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteChkPresExtnSeq");
  if (a1)
  {
    if (!a2)
    {
      uint64_t v18 = 0xF00000003;
      LODWORD(v19) = 17;
      int v4 = sub_225A478A8((unsigned int *)(a1 + 920), (uint64_t)&v18, (uint64_t)sub_225A47248, a1);
      switch(v4)
      {
        case 255:
          int v7 = (unsigned int *)(a1 + 6532);
          int v8 = "Check presence extension notification registration failed!";
          break;
        case 53:
          int v7 = (unsigned int *)(a1 + 6532);
          int v8 = "Check presence extension notification already registered";
          break;
        case 0:
          long long v5 = (unsigned int *)(a1 + 6532);
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Check presence extension notification registered");
          uint64_t v6 = *(void *)(a1 + 4712);
          if (v6 == 0xFFFFFFFFFFFFLL)
          {
            sub_2259A0EAC(1, v5, 3u, 1u, (uint64_t)"Timer Create had failed\n#\n");
LABEL_33:
            sub_2259A0EAC(1, v5, 3u, 4u, (uint64_t)"Waiting for Check presence extension notification...");
            a2 = 0;
            goto LABEL_13;
          }
          uint64_t v10 = *(void *)(a1 + 4568);
          if (v10)
          {
            int v11 = *(_DWORD *)(v10 + 4);
            if ((v11 - 5) < 3) {
              goto LABEL_18;
            }
            if (v11 == 16)
            {
              double v15 = (double)(1 << (*(unsigned char *)(v10 + 109) >> 4)) * 302.064897 / 1000.0;
              if ((int)v15 >= 0x54) {
                __int16 v16 = 19796;
              }
              else {
                __int16 v16 = 236 * (int)v15;
              }
              if ((v16 & 0xFFF0u) > 0x7CF) {
                goto LABEL_30;
              }
LABEL_28:
              int v14 = "FWT timeout is less than default, hence using default timeout: ";
              goto LABEL_29;
            }
            if (v11 == 3)
            {
LABEL_18:
              double v12 = (double)(1 << (*(unsigned char *)(v10 + 108) >> 4)) * 302.064897 / 1000.0;
              if ((int)v12 >= 0x54) {
                __int16 v13 = 19796;
              }
              else {
                __int16 v13 = 236 * (int)v12;
              }
              if ((v13 & 0xFFF0u) >= 0x7D0) {
                goto LABEL_30;
              }
              goto LABEL_28;
            }
          }
          int v14 = "Using default timeout: ";
LABEL_29:
          sub_22599F8E0(1, v5, 3u, 4u, (uint64_t)v14);
          uint64_t v6 = *(void *)(a1 + 4712);
LABEL_30:
          sub_2259DD7E4(*(_DWORD *)(a1 + 6532), v6);
          *(unsigned char *)(a1 + 6520) = 0;
          uint64_t v17 = phOsalNfc_Timer_Start();
          if (!v17)
          {
            sub_2259D730C(1, v5, *(void *)(a1 + 4712), 3u, 4u, (uint64_t)"phNciNfc_CompleteChkPresExtnSeq", (uint64_t)"pNciCtx->dwNtfTimerId", 1);
            *(void *)(a1 + 848) = *(void *)(a1 + 3440);
            *(void *)(a1 + 856) = *(void *)(a1 + 3768);
            *(void *)(a1 + 3440) = 0;
            sub_2259A0EAC(1, v5, 3u, 4u, (uint64_t)"Chk Pres ntf timer started\n");
            goto LABEL_33;
          }
          a2 = v17;
          sub_2259A0EAC(1, v5, 3u, 1u, (uint64_t)"Chk Pres ntf timer start FAILED\n\n");
          goto LABEL_12;
        default:
          int v7 = (unsigned int *)(a1 + 6532);
          int v8 = "Invalid parameter sent";
          break;
      }
      sub_2259A0EAC(1, v7, 3u, 4u, (uint64_t)v8);
      a2 = 255;
    }
LABEL_12:
    sub_225A362F4(a1, a2, 0);
  }
LABEL_13:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteChkPresExtnSeq");
  return a2;
}

uint64_t sub_225A46B54(unsigned int *a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_EnableExtnCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0xF00000001;
    DWORD2(v4) = 2;
    *(void *)&long long v5 = 0;
    DWORD2(v5) = 0;
    uint64_t v2 = sub_225A47614((uint64_t)(a1 + 230), (uint64_t)&v4, (uint64_t)(a1 + 954), 2000, (uint64_t)sub_2259A9684, (uint64_t)a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_EnableExtnCmd");
  return v2;
}

uint64_t sub_225A46C44(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnableExtnRsp");
  if (a1)
  {
    if (a2)
    {
      long long v4 = (unsigned int *)(a1 + 6532);
      long long v5 = "Iso-Dep presence check resposne received with failure status";
LABEL_4:
      sub_2259A0EAC(1, v4, 3u, 2u, (uint64_t)v5);
    }
    else
    {
      int v6 = *(_DWORD *)(a1 + 3824);
      if (v6 == 1)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Enabling extension failed!");
        a2 = 255;
        switch(**(unsigned char **)(a1 + 3816))
        {
          case 0:
            long long v5 = "Information field missing in Response Payload field";
            goto LABEL_21;
          case 1:
            uint64_t v10 = "Enabling extension command rejected by NFCC";
            goto LABEL_23;
          case 3:
            long long v5 = "Enabling extension command failed by NFCC";
            goto LABEL_21;
          case 5:
            long long v5 = "Enabling extension command Syntax error received";
LABEL_21:
            long long v4 = (unsigned int *)(a1 + 6532);
            goto LABEL_4;
          case 6:
            uint64_t v10 = "Enabling extension command Semantic error received";
LABEL_23:
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)v10);
            a2 = 147;
            goto LABEL_15;
          default:
            goto LABEL_15;
        }
      }
      if (v6 == 5)
      {
        a2 = 147;
        switch(**(unsigned char **)(a1 + 3816))
        {
          case 0:
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Enabling extension command accepted by NFCC");
            a2 = 0;
            break;
          case 1:
            long long v4 = (unsigned int *)(a1 + 6532);
            long long v5 = "Enabling extension command rejected by NFCC";
            goto LABEL_4;
          case 3:
            int v7 = (unsigned int *)(a1 + 6532);
            int v8 = "Enabling extension command failed by NFCC";
            goto LABEL_13;
          case 6:
            break;
          default:
            goto LABEL_14;
        }
      }
      else
      {
        int v7 = (unsigned int *)(a1 + 6532);
        int v8 = "Enabling extension response received with invalid payload length";
LABEL_13:
        sub_2259A0EAC(1, v7, 3u, 2u, (uint64_t)v8);
LABEL_14:
        a2 = 255;
      }
    }
  }
  else
  {
    a2 = 1;
  }
LABEL_15:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnableExtnRsp");
  return a2;
}

uint64_t sub_225A46E88(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteEnableExtnSeq");
  if (a1)
  {
    long long v4 = (unsigned char *)(a1 + 6720);
    *(unsigned char *)(a1 + 6720) = -1;
    if (a2 == 44)
    {
      unsigned char *v4 = 44;
      uint64_t v5 = a1;
      uint64_t v6 = 0;
    }
    else
    {
      long long v4 = *(unsigned char **)(a1 + 3816);
      uint64_t v5 = a1;
      uint64_t v6 = a2;
    }
    sub_225A362F4(v5, v6, (uint64_t)v4);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteEnableExtnSeq");
  return a2;
}

uint64_t sub_225A46F28(unsigned int *a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_FlushDataCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0xF00000001;
    DWORD2(v4) = 33;
    *(void *)&long long v5 = 0;
    DWORD2(v5) = 0;
    uint64_t v2 = sub_225A47614((uint64_t)(a1 + 230), (uint64_t)&v4, (uint64_t)(a1 + 954), 2000, (uint64_t)sub_2259A9684, (uint64_t)a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_FlushDataCmd");
  return v2;
}

uint64_t sub_225A47018(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FlushDataRsp");
  if (a1)
  {
    if (a2)
    {
      long long v4 = (unsigned int *)(a1 + 6532);
      long long v5 = "Flush Data resposne received with failure status";
LABEL_4:
      sub_2259A0EAC(1, v4, 3u, 2u, (uint64_t)v5);
    }
    else if (*(_DWORD *)(a1 + 3824) == 1)
    {
      a2 = 0;
      switch(**(unsigned char **)(a1 + 3816))
      {
        case 0:
          break;
        case 1:
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Flush Data command rejected by NFCC");
          a2 = 147;
          break;
        case 6:
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Flush Data command Semantic error received");
          a2 = 0;
          break;
        case 9:
          long long v4 = (unsigned int *)(a1 + 6532);
          long long v5 = "Flush Data response Invalid parameter received";
          a2 = 1;
          goto LABEL_4;
        default:
          uint64_t v6 = (unsigned int *)(a1 + 6532);
          int v7 = "Flush Data failed!";
          goto LABEL_10;
      }
    }
    else
    {
      uint64_t v6 = (unsigned int *)(a1 + 6532);
      int v7 = "Flush Data response received with invalid payload length";
LABEL_10:
      sub_2259A0EAC(1, v6, 3u, 2u, (uint64_t)v7);
      a2 = 255;
    }
  }
  else
  {
    a2 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FlushDataRsp");
  return a2;
}

uint64_t sub_225A471B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_IsoDepPresChkSequence");
  if (a1 && a2)
  {
    *(void *)(a1 + 3816) = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 3824) = *(_DWORD *)(a2 + 16);
  }
  uint64_t v6 = sub_2259CD490(a1, a3);
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_IsoDepPresChkSequence");
  return v6;
}

uint64_t sub_225A47248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  __int16 v13 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnNtfCb");
  if (!a1 || !a2)
  {
    sub_2259A0EAC(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"Proc pres chk : Invalid input parameters");
    goto LABEL_24;
  }
  if (a3)
  {
    uint64_t v6 = "Proc Iso-Dep pres chk ntf: Receiption failed";
  }
  else
  {
    phOsalNfc_Timer_Stop();
    *(unsigned char *)(a1 + 6520) = 0;
    sub_2259D730C(1, (unsigned int *)(a1 + 6532), *(void *)(a1 + 4712), 3u, 4u, (uint64_t)"phNciNfc_ChkPresExtnNtfCb", (uint64_t)"pNciCtx->dwNtfTimerId", 0);
    if (*(_DWORD *)(a2 + 16) == 1)
    {
      if (**(unsigned char **)(a2 + 8) == 1)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Target is still in the fied");
        a3 = 0;
        goto LABEL_14;
      }
      if (!**(unsigned char **)(a2 + 8))
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Target is not in the fied: Target Lost!");
        a3 = 146;
        goto LABEL_14;
      }
      uint64_t v6 = "ChkPresence Extn: invalid ntf";
    }
    else
    {
      uint64_t v6 = "Proc Iso-Dep pres chk ntf: Invalid length of payload";
    }
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)v6);
  a3 = 255;
LABEL_14:
  *(_WORD *)((char *)&v11 + 1) = 4367;
  uint64_t v12 = a1;
  __int16 v13 = sub_225A47248;
  int v7 = sub_2259B0948(a1 + 920, (uint64_t)&v11, 3);
  switch(v7)
  {
    case 255:
      int v8 = "De-register pres chk extension ntf call back failed!";
      break;
    case 52:
      int v8 = "Pres chk extension ntf call back not registered!";
      break;
    case 0:
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"De-register pres chk extension ntf call back success");
      goto LABEL_22;
    default:
      int v8 = "Invalid parameter passed (phNciNfc_ChkPresExtnNtfCb)!";
      break;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)v8);
LABEL_22:
  int v9 = *(void (**)(void, uint64_t, void))(a1 + 848);
  if (v9)
  {
    *(void *)(a1 + 848) = 0;
    v9(*(void *)(a1 + 856), a3, 0);
  }
LABEL_24:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnNtfCb");
  return a3;
}

uint64_t sub_225A47484(uint64_t a1, uint64_t a2)
{
  memset(v9, 0, sizeof(v9));
  uint64_t result = sub_2259A0FB0(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnNtfTimeoutHandler");
  if (a2)
  {
    char v5 = 0;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *((void *)&unk_26ABD79B8 + 14 * v6 + 4);
      if (v5) {
        break;
      }
      char v5 = 1;
      uint64_t v6 = 1;
    }
    while (v7 != a2);
    if (v7 == a2)
    {
      int v8 = (unsigned char *)(a2 + 6520);
      if (!*(unsigned char *)(a2 + 6520))
      {
        sub_2259DD7E4(*(_DWORD *)(a2 + 6532), *(void *)(a2 + 4712));
        if (!phOsalNfc_Timer_Start())
        {
          uint64_t result = sub_2259A0EAC(1, (unsigned int *)(a2 + 6532), 3u, 4u, (uint64_t)"Chk Pres ntf timer restarted for extended time\n");
          *int v8 = 1;
          return result;
        }
        sub_2259A0EAC(1, (unsigned int *)(a2 + 6532), 3u, 1u, (uint64_t)"Chk Pres ntf timer failed to start for extended time\n\n");
      }
      sub_2259D730C(2, (unsigned int *)a2, a1, 3u, 4u, (uint64_t)"phNciNfc_ChkPresExtnNtfTimeoutHandler", (uint64_t)"Timeout:pNciCtx->dwNtfTimerId", 0);
      phOsalNfc_Timer_Stop();
      *int v8 = 0;
      sub_225A47248(a2, (uint64_t)v9, 255);
      return sub_2259A10B4(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnNtfTimeoutHandler");
    }
  }
  return result;
}

uint64_t sub_225A47614(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = 0;
  long long v16 = 0u;
  memset(v15, 0, sizeof(v15));
  sub_2259A0FB0(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfTxRx");
  uint64_t v12 = 0;
  if (a1 && a2 && a3 && a5)
  {
    BYTE14(v16) = 0;
    LODWORD(v17) = a4;
    if (*(_DWORD *)a2 == 1)
    {
      *(unsigned char *)(a1 + 616) = 0;
      *(unsigned char *)(a2 + 12) = 0;
      unsigned int v13 = 2;
    }
    else
    {
      unsigned int v13 = 0;
      *(_DWORD *)(a2 + 4) = 0;
      *(_DWORD *)(a2 + 8) = 0;
    }
    phOsalNfc_MemCopy();
    uint64_t v12 = sub_2259CF608(*(void *)a1, v13, (uint64_t)v15, a5, a6);
  }
  sub_2259A10B4(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfTxRx");
  return v12;
}

uint64_t sub_225A47734(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = 0;
  long long v15 = 0u;
  memset(v14, 0, sizeof(v14));
  sub_2259A0FB0(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfTxOnly");
  if (!a1) {
    goto LABEL_6;
  }
  char v8 = 0;
  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = *((void *)&unk_26ABD79B8 + 14 * v9 + 5);
    if (v8) {
      break;
    }
    char v8 = 1;
    uint64_t v9 = 1;
  }
  while (v10 != a1);
  if (v10 == a1)
  {
    uint64_t v11 = 1;
    if (a3)
    {
      if (a2)
      {
        uint64_t v13 = *(void *)a1;
        if (*(void *)a1)
        {
          BYTE14(v15) = 1;
          phOsalNfc_MemCopy();
          *(unsigned char *)(a1 + 616) = 0;
          if (*a2 == 1)
          {
            uint64_t v11 = sub_2259CF608(v13, 2u, (uint64_t)v14, a3, a4);
            *(unsigned char *)(v13 + 5446) = 1;
          }
          else
          {
            *(void *)((char *)v14 + 4) = 0;
            uint64_t v11 = sub_2259CF608(v13, 0, (uint64_t)v14, a3, a4);
          }
        }
      }
    }
  }
  else
  {
LABEL_6:
    uint64_t v11 = 1;
  }
  sub_2259A10B4(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfTxOnly");
  return v11;
}

uint64_t sub_225A478A8(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_2259A0FB0(3, a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfRegRspNtf");
  uint64_t v8 = 1;
  if (!a1 || !a2 || !a3) {
    goto LABEL_12;
  }
  uint64_t v14 = a4;
  uint64_t v15 = a3;
  int v9 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == 3)
  {
    char v10 = 2;
LABEL_10:
    LOBYTE(v13) = v10;
    int v11 = *(_DWORD *)(a2 + 8);
    BYTE1(v13) = *(_DWORD *)(a2 + 4);
    BYTE2(v13) = v11;
    goto LABEL_11;
  }
  if (v9 == 2)
  {
    char v10 = 1;
    goto LABEL_10;
  }
  if (!v9)
  {
    LOBYTE(v13) = *(unsigned char *)(a2 + 13);
    BYTE3(v13) = *(unsigned char *)(a2 + 12);
LABEL_11:
    uint64_t v8 = sub_2259B05CC((uint64_t)a1, (uint64_t)&v13, v9);
  }
LABEL_12:
  sub_2259A10B4(3, a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfRegRspNtf");
  return v8;
}

uint64_t sub_225A4799C(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  v10[0] = 0;
  v10[1] = 0;
  uint64_t v11 = 0;
  sub_2259A0FB0(3, a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfUnRegRspNtf");
  uint64_t v6 = 1;
  if (a1 && a2)
  {
    uint64_t v11 = a3;
    int v7 = *(_DWORD *)a2;
    if (*(_DWORD *)a2 == 3 || v7 == 2)
    {
      int v8 = *(_DWORD *)(a2 + 8);
      BYTE1(v10[0]) = *(_DWORD *)(a2 + 4);
      BYTE2(v10[0]) = v8;
      goto LABEL_8;
    }
    if (!v7)
    {
      BYTE3(v10[0]) = *(unsigned char *)(a2 + 12);
LABEL_8:
      uint64_t v6 = sub_2259B0948((uint64_t)a1, (uint64_t)v10, v7);
    }
  }
  sub_2259A10B4(3, a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfUnRegRspNtf");
  return v6;
}

uint64_t sub_225A47A68(uint64_t a1, char a2, char a3)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetInitialCredit");
  if (a1)
  {
    uint64_t v6 = 0;
    *(unsigned char *)(a1 + 961) = a2;
    *(unsigned char *)(a1 + 960) = a3;
  }
  else
  {
    uint64_t v6 = 1;
  }
  sub_2259A10B4(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetInitialCredit");
  return v6;
}

uint64_t sub_225A47AEC(uint64_t a1, char a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetMaxCtrlPacketSize");
  if (a1)
  {
    uint64_t v4 = 0;
    *(unsigned char *)(a1 + 624) = a2;
  }
  else
  {
    uint64_t v4 = 1;
  }
  sub_2259A10B4(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetMaxCtrlPacketSize");
  return v4;
}

uint64_t sub_225A47B68(uint64_t a1, int a2, int a3)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetMaxDataPacketSize");
  uint64_t v6 = 1;
  if (a1 && a3)
  {
    if (*(unsigned __int8 *)(a1 + 961) == a2)
    {
      uint64_t v6 = 0;
      *(unsigned char *)(a1 + 962) = a3;
    }
    else
    {
      uint64_t v6 = 3;
    }
  }
  sub_2259A10B4(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetMaxDataPacketSize");
  return v6;
}

uint64_t sub_225A47BFC(uint64_t a1)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfFlushDataOnLogChnlZero");
  if (a1)
  {
    char v2 = 0;
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *((void *)&unk_26ABD79B8 + 14 * v3 + 5);
      if (v2) {
        break;
      }
      char v2 = 1;
      uint64_t v3 = 1;
    }
    while (v4 != a1);
    if (v4 == a1)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 2492), 3u, 4u, (uint64_t)"Flushing data on ConnID Zero if already present");
      if (sub_2259A24F4((unsigned int *)a1) != 1)
      {
        uint64_t v5 = 0;
        while (1)
        {
          uint64_t v6 = *(void *)(a1 + 928 + v5);
          if (v6)
          {
            if ((*(unsigned char *)v6 & 0xEF) == 0) {
              break;
            }
          }
          v5 += 8;
          if (v5 == 24) {
            goto LABEL_18;
          }
        }
        uint64_t v7 = a1 + 928;
        if (v6 == a1 + 640)
        {
          *(void *)(v7 + v5) = 0;
          *(void *)(a1 + 904) = 0;
          *(_WORD *)(a1 + 900) = 0;
        }
        else
        {
          for (uint64_t i = *(void *)(v6 + 264); i; uint64_t i = *(void *)(v9 + 264))
          {
            uint64_t v9 = i;
            phOsalNfc_FreeMemory();
          }
          phOsalNfc_FreeMemory();
          *(void *)(v7 + v5) = 0;
        }
      }
    }
  }
LABEL_18:

  return sub_2259A10B4(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfFlushDataOnLogChnlZero");
}

uint64_t sub_225A47D60(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 1;
    DWORD2(v4) = 2;
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = *(_DWORD *)(a1 + 888);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_225A49154, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfig");
  return v2;
}

uint64_t sub_225A47E58(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRsp");
  if (!a1)
  {
    uint64_t v5 = 1;
    goto LABEL_23;
  }
  uint64_t v2 = (unsigned char *)(a1 + 6648);
  *(unsigned char *)(a1 + 6649) = 0;
  if (*(_DWORD *)(a1 + 3824) < 2u || (uint64_t v3 = *(unsigned char **)(a1 + 3816)) == 0)
  {
LABEL_22:
    uint64_t v5 = 255;
    goto LABEL_23;
  }
  sub_2259D25DC((unsigned int *)a1, v3);
  unsigned int v4 = **(unsigned __int8 **)(a1 + 3816);
  if (v4 > 0xF0)
  {
    switch(v4)
    {
      case 0xF1u:
        uint64_t v7 = (unsigned int *)(a1 + 6532);
        int v8 = "Set Config failed with NOK express mode enabled Error";
        break;
      case 0xF9u:
        uint64_t v5 = 135;
        goto LABEL_23;
      case 0xFCu:
        uint64_t v5 = 158;
        goto LABEL_23;
      default:
LABEL_19:
        uint64_t v7 = (unsigned int *)(a1 + 6532);
        int v8 = "Set Config failed";
        break;
    }
    sub_2259A0EAC(1, v7, 3u, 2u, (uint64_t)v8);
    if (*v2 == 1) {
      *(unsigned char *)(a1 + 6649) = 1;
    }
    goto LABEL_22;
  }
  uint64_t v5 = 0;
  switch(**(unsigned char **)(a1 + 3816))
  {
    case 0:
      break;
    case 1:
    case 5:
    case 9:
      uint64_t v6 = *(void *)(a1 + 880);
      if (v6 && *(_DWORD *)(a1 + 888) >= 2u) {
        sub_2259A1C74(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Set Cfg Rsp returned not supported, Tag ID (All):", v6 + 1);
      }
      if (*v2 == 1) {
        *(unsigned char *)(a1 + 6649) = 1;
      }
      uint64_t v5 = 147;
      break;
    default:
      goto LABEL_19;
  }
LABEL_23:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRsp");
  return v5;
}

uint64_t sub_225A4801C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 3800) = 4;
    if (*(void *)(a1 + 880))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
    }
    sub_225A362F4(a1, a2, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteSetConfig");
  return a2;
}

uint64_t sub_225A480B0(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSigned");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0xF00000001;
    DWORD2(v4) = 44;
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = *(_DWORD *)(a1 + 888);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_225A49154, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSigned");
  return v2;
}

uint64_t sub_225A481A8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfSignedRsp");
  if (a1 && (uint64_t v2 = *(unsigned char **)(a1 + 3816)) != 0)
  {
    if (*(_DWORD *)(a1 + 3824) >= 2u)
    {
      switch(*v2)
      {
        case 0:
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Rf Signed Config response success");
          uint64_t v4 = 0;
          goto LABEL_14;
        case 1:
        case 5:
        case 9:
          uint64_t v3 = *(void *)(a1 + 880);
          if (v3 && *(_DWORD *)(a1 + 888) >= 2u) {
            sub_2259A1C74(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Rf Signed Config error, Tag ID (All):", v3 + 1);
          }
          uint64_t v4 = 147;
          goto LABEL_14;
        case 2:
        case 3:
        case 4:
        case 6:
        case 7:
        case 8:
          goto LABEL_12;
        default:
          if (*v2 == 242)
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Rf Signed Config response signature error");
            uint64_t v4 = 130;
            goto LABEL_14;
          }
LABEL_12:
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Rf Signed Config response failed!");
          break;
      }
    }
    uint64_t v4 = 255;
  }
  else
  {
    uint64_t v4 = 1;
  }
LABEL_14:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfSignedRsp");
  return v4;
}

uint64_t sub_225A48338(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProtoIfMap");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0x100000001;
    DWORD2(v4) = 0;
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = *(_DWORD *)(a1 + 888);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_225A49280, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProtoIfMap");
  return v2;
}

uint64_t sub_225A48428(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProtoIfMapRsp");
  if (a1)
  {
    *(unsigned char *)(a1 + 6649) = 0;
    if (*(_DWORD *)(a1 + 3824) == 1)
    {
      uint64_t v2 = *(unsigned char **)(a1 + 3816);
      if (v2)
      {
        uint64_t v3 = (unsigned int *)(a1 + 6532);
        if (!*v2)
        {
          sub_2259A0EAC(1, v3, 3u, 4u, (uint64_t)"Rf Proto Intf mapping: SUCCESS");
          uint64_t v4 = 0;
          goto LABEL_9;
        }
        sub_2259A0EAC(1, v3, 3u, 2u, (uint64_t)"Rf Proto Intf mapping: FAILED");
        if (*(unsigned char *)(a1 + 6648) == 1) {
          *(unsigned char *)(a1 + 6649) = 1;
        }
      }
    }
    uint64_t v4 = 255;
  }
  else
  {
    uint64_t v4 = 1;
  }
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProtoIfMapRsp");
  return v4;
}

uint64_t sub_225A48518(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 3800) = 4;
    if (*(void *)(a1 + 880))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
    }
    sub_225A362F4(a1, a2, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteProtoIfMap");
  return a2;
}

uint64_t sub_225A485AC(unsigned int *a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0x100000001;
    DWORD2(v4) = 2;
    *(void *)&long long v5 = 0;
    DWORD2(v5) = 0;
    uint64_t v2 = sub_225A47614((uint64_t)(a1 + 230), (uint64_t)&v4, (uint64_t)(a1 + 954), 2000, (uint64_t)sub_225A493A8, (uint64_t)a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfig");
  return v2;
}

uint64_t sub_225A48698(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetRtngConfig");
  if (a1)
  {
    if (!a2)
    {
      uint64_t v11 = 0x100000003;
      LODWORD(v12) = 2;
      int v4 = sub_225A478A8((unsigned int *)(a1 + 920), (uint64_t)&v11, (uint64_t)sub_225A4CFE0, a1);
      switch(v4)
      {
        case 255:
          int v8 = (unsigned int *)(a1 + 6532);
          uint64_t v9 = "Get Listen mode routing notification registration failed!";
          break;
        case 53:
          int v8 = (unsigned int *)(a1 + 6532);
          uint64_t v9 = "Get Listen mode routing notification already registered";
          break;
        case 0:
          long long v5 = (unsigned int *)(a1 + 6532);
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Get Listen mode routing notification registered");
          *(unsigned char *)(a1 + 896) = 0;
          *(unsigned char *)(a1 + 898) = 0;
          *(void *)(a1 + 904) = 0;
          *(_WORD *)(a1 + 912) = 0;
          uint64_t v6 = *(void *)(a1 + 4712);
          if (v6 == 0xFFFFFFFFFFFFLL)
          {
            a2 = 255;
            uint64_t v7 = "Timer Create had failed\n#\n";
          }
          else
          {
            sub_2259DD7E4(*(_DWORD *)(a1 + 6532), v6);
            *(unsigned char *)(a1 + 6520) = 0;
            a2 = phOsalNfc_Timer_Start();
            if (!a2)
            {
              sub_2259D730C(1, v5, *(void *)(a1 + 4712), 3u, 4u, (uint64_t)"phNciNfc_CompleteGetRtngConfig", (uint64_t)"pNciCtx->dwNtfTimerId", 1);
              sub_2259A0EAC(1, v5, 3u, 4u, (uint64_t)"Get Listen Mode Ntf Handler timer started\n");
              sub_2259A0EAC(1, v5, 3u, 4u, (uint64_t)"Waiting for Get listen mode routing notification...");
              goto LABEL_16;
            }
            uint64_t v7 = "Get Listen Mode Ntf Handler timer start FAILED\n\n";
          }
          sub_2259A0EAC(1, v5, 3u, 1u, (uint64_t)v7);
          sub_225A4799C((unsigned int *)(a1 + 920), (uint64_t)&v11, (uint64_t)sub_225A4CFE0);
          goto LABEL_15;
        default:
          int v8 = (unsigned int *)(a1 + 6532);
          uint64_t v9 = "Invalid parameter sent";
          break;
      }
      sub_2259A0EAC(1, v8, 3u, 1u, (uint64_t)v9);
      a2 = 255;
    }
LABEL_15:
    sub_225A362F4(a1, a2, 0);
  }
LABEL_16:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetRtngConfig");
  return a2;
}

uint64_t sub_225A488E4(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0x100000001;
    DWORD2(v4) = 1;
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = *(_DWORD *)(a1 + 888);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_225A49314, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngConfig");
  return v2;
}

uint64_t sub_225A489D8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (*(void *)(a1 + 880))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
    }
    if (!*(unsigned char *)(a1 + 896))
    {
      *(_WORD *)(a1 + 897) = 0;
      *(_WORD *)(a1 + 912) = 0;
    }
    sub_225A362F4(a1, a2, 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteSetRtngConfig");
  return a2;
}

uint64_t sub_225A48A78(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 1;
    DWORD2(v4) = 3;
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = *(_DWORD *)(a1 + 888);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_225A491E8, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter (phNciNfc_SetConfig)\n");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfig");
  return v2;
}

uint64_t sub_225A48B70(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRsp");
  if (a1)
  {
    if (!a2)
    {
      long long v4 = *(unsigned __int8 **)(a1 + 3816);
      if (v4)
      {
        int v5 = *v4;
        if (v5 != 10)
        {
          if (v5 == 9)
          {
            uint64_t v6 = sub_225A4DF78(a1, (*(unsigned char *)(a1 + 3824) - 2), (uint64_t)(v4 + 2), 0);
LABEL_13:
            a2 = v6;
            goto LABEL_19;
          }
          if (!*v4 && *(unsigned __int8 *)(a1 + 864) == v4[1])
          {
            uint64_t v6 = sub_225A4DF78(a1, (*(unsigned char *)(a1 + 3824) - 2), (uint64_t)(v4 + 2), 1);
            if (!*(unsigned char *)(a1 + 864))
            {
              uint64_t v7 = *(unsigned char **)(a1 + 3816);
              unsigned int v8 = *(_DWORD *)(a1 + 3824) - 1;
              goto LABEL_17;
            }
            goto LABEL_13;
          }
          goto LABEL_11;
        }
        if (*(unsigned __int8 *)(a1 + 864) < v4[1])
        {
LABEL_11:
          a2 = 255;
          goto LABEL_19;
        }
        a2 = 1;
        if (!sub_225A4DF78(a1, (*(unsigned char *)(a1 + 3824) - 2), (uint64_t)(v4 + 2), 1))
        {
          if (!*(unsigned char *)(a1 + 864))
          {
LABEL_18:
            a2 = 0;
            goto LABEL_19;
          }
          uint64_t v7 = *(unsigned char **)(a1 + 3816);
          unsigned int v8 = *(_DWORD *)(a1 + 3824);
LABEL_17:
          sub_2259D14A8((unsigned int *)a1, v7, v8);
          goto LABEL_18;
        }
      }
    }
  }
LABEL_19:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRsp");
  return a2;
}

uint64_t sub_225A48CB8(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetConfig");
  if (!a1) {
    goto LABEL_12;
  }
  if (!*(void *)(a1 + 872))
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Do not invoke upper layer as Deinit is in progress");
LABEL_12:
    uint64_t v2 = 0;
    goto LABEL_13;
  }
  if (v2)
  {
    if (*(void *)(a1 + 880))
    {
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
    }
    sub_225A4F624(a1);
    if (v2 == 1) {
      uint64_t v2 = 255;
    }
    else {
      uint64_t v2 = v2;
    }
    uint64_t v4 = *(void *)(a1 + 4704);
    uint64_t v5 = a1;
    uint64_t v6 = v2;
  }
  else
  {
    if (*(unsigned char *)(a1 + 864))
    {
      *(void *)(a1 + 3792) = off_26B6099E8;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6099E8);
      *(void *)(a1 + 880) = *(void *)(a1 + 872);
      *(_DWORD *)(a1 + 888) = *(unsigned __int8 *)(a1 + 865) + 1;
      uint64_t v2 = sub_225A491E8(a1, 0, 0);
      goto LABEL_13;
    }
    if (*(void *)(a1 + 880))
    {
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
    }
    uint64_t v2 = sub_225A4F624(a1);
    uint64_t v4 = *(void *)(a1 + 4704);
    uint64_t v5 = a1;
    uint64_t v6 = 0;
  }
  sub_225A362F4(v5, v6, v4);
LABEL_13:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetConfig");
  return v2;
}

uint64_t sub_225A48E00(unsigned int *a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_225A48E68(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetConfigRaw");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if (*(void *)(a1 + 880))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
    }
    if (!a2)
    {
      int v4 = *(_DWORD *)(a1 + 3824);
      *(unsigned char *)(a1 + 6724) = v4;
      if ((_BYTE)v4) {
        phOsalNfc_MemCopy();
      }
    }
    sub_225A362F4(a1, a2, a1 + 6724);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetConfigRaw");
  return a2;
}

uint64_t sub_225A48F40(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTxValue");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(void *)&long long v4 = 0xF00000001;
    DWORD2(v4) = 20;
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = *(_DWORD *)(a1 + 888);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, 2000, (uint64_t)sub_225A491E8, a1);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter (phNciNfc_SetConfig)\n");
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTxValue");
  return v2;
}

uint64_t sub_225A49038(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTxValRsp");
  if (a1)
  {
    if (!v2)
    {
      long long v4 = *(unsigned char **)(a1 + 3816);
      if (v4)
      {
        LOWORD(v2) = 255;
        switch(*v4)
        {
          case 0:
            unsigned __int8 v6 = v4[1] - 1;
            if (v6 >= 4u) {
              LOWORD(v2) = 255;
            }
            else {
              unint64_t v2 = 0xFF00000000uLL >> (16 * v6);
            }
            break;
          case 1:
          case 5:
          case 9:
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"GetTransition reg resp failed");
            LOWORD(v2) = 147;
            break;
          default:
            break;
        }
      }
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTxValRsp");
  return (unsigned __int16)v2;
}

uint64_t sub_225A49154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSequence");
  if (a1 && a2)
  {
    *(void *)(a1 + 3816) = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 3824) = *(_DWORD *)(a2 + 16);
  }
  uint64_t v6 = sub_2259CD490(a1, a3);
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSequence");
  return v6;
}

uint64_t sub_225A491E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigSequence");
  if (a1 && a2 && !a3)
  {
    *(void *)(a1 + 3816) = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 3824) = *(_DWORD *)(a2 + 16);
  }
  uint64_t v6 = sub_2259CD490(a1, a3);
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigSequence");
  return v6;
}

uint64_t sub_225A49280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ConfigMappingSequence");
  if (a1 && a2)
  {
    *(void *)(a1 + 3816) = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 3824) = *(_DWORD *)(a2 + 16);
  }
  uint64_t v6 = sub_2259CD490(a1, a3);
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ConfigMappingSequence");
  return v6;
}

uint64_t sub_225A49314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngConfigSequence");
  if (a1 && a2)
  {
    *(void *)(a1 + 3816) = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 3824) = *(_DWORD *)(a2 + 16);
  }
  uint64_t v6 = sub_2259CD490(a1, a3);
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngConfigSequence");
  return v6;
}

uint64_t sub_225A493A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfigSequence");
  if (a1 && a2)
  {
    *(void *)(a1 + 3816) = *(void *)(a2 + 8);
    *(_DWORD *)(a1 + 3824) = *(_DWORD *)(a2 + 16);
  }
  uint64_t v6 = sub_2259CD490(a1, a3);
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfigSequence");
  return v6;
}

uint64_t sub_225A4943C(unsigned int *a1, unsigned int a2, int *a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateDiscMapParams");
  if (!a3)
  {
LABEL_13:
    uint64_t v9 = 1;
    goto LABEL_14;
  }
  if (a2)
  {
    uint64_t v7 = a2;
    unsigned int v8 = (unsigned int *)(a3 + 2);
    while (1)
    {
      if (sub_2259A8758(a1, *(v8 - 2)) == 1)
      {
        char v10 = "Invalid RF procotol";
        goto LABEL_12;
      }
      unint64_t v3 = v3 & 0xFFFFFFFF00000000 | *(v8 - 1);
      if (sub_225A49560(a1, v3))
      {
        char v10 = "Invalid mode";
        goto LABEL_12;
      }
      if (sub_2259A86CC(a1, *v8) == 1) {
        break;
      }
      v8 += 3;
      if (!--v7) {
        goto LABEL_8;
      }
    }
    char v10 = "Invalid RF interface";
LABEL_12:
    sub_2259A0EAC(2, a1, 3u, 4u, (uint64_t)v10);
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v9 = sub_225A495D0(a1, a2, a3);
LABEL_14:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateDiscMapParams");
  return v9;
}

BOOL sub_225A49560(unsigned int *a1, char a2)
{
  return (a2 & 3) == 0;
}

uint64_t sub_225A495D0(unsigned int *a1, unsigned int a2, int *a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VerifyRfProtocols");
  if (a2 < 2)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    unsigned __int8 v7 = 0;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = a3;
      do
      {
        int v10 = *v9;
        v9 += 3;
        if (a3[3 * v6] == v10 && v6 != v8) {
          unsigned __int8 v7 = 1;
        }
        ++v8;
      }
      while (a2 != v8);
      ++v6;
    }
    while (v6 != a2);
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VerifyRfProtocols");
  return v7;
}

uint64_t sub_225A49694(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_VerifySupportedRfIntfs");
  if (*(unsigned char *)(a1 + 4))
  {
    if (a2)
    {
      unsigned int v4 = 0;
      do
      {
        sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CheckRfIntfs");
        sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CheckRfIntfs");
        ++v4;
      }
      while (v4 < a2);
      a2 = 0;
    }
  }
  else
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"NFCC does not supported any RF interface");
    a2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_VerifySupportedRfIntfs");
  return a2;
}

uint64_t sub_225A4977C(unsigned int *a1, unsigned char *a2, unsigned int a3, uint64_t a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildDiscMapCmdPayload");
  *a2 = a3;
  if (a3)
  {
    uint64_t v8 = a3;
    uint64_t v9 = (char *)(a4 + 4);
    int v10 = 1;
    do
    {
      a2[v10] = *((_DWORD *)v9 - 1);
      uint64_t v11 = (v10 + 1);
      a2[v11] = 0;
      char v12 = *v9;
      a2[v11] = *v9 & 1;
      a2[v11] = *v9 & 2 | v12 & 1;
      LOBYTE(v11) = v10 + 2;
      v10 += 3;
      a2[v11] = *((_DWORD *)v9 + 1);
      v9 += 12;
      --v8;
    }
    while (v8);
  }

  return sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildDiscMapCmdPayload");
}

uint64_t sub_225A4985C(unsigned int *a1, uint64_t a2, _WORD *a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSetConfParams");
  uint64_t v8 = 1;
  if (a2 && a3 && a4)
  {
    sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_SetconfEntryCheck");
    int v9 = *(_DWORD *)(a2 + 4) & 0x1F7FF;
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_SetconfEntryCheck");
    if (v9)
    {
      int v10 = *(_DWORD *)(a2 + 4);
      if ((v10 & 4) != 0)
      {
        sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcFParams");
        if ((*(unsigned char *)(a2 + 24) & 1) == 0)
        {
          sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcFParams");
LABEL_24:
          uint64_t v14 = "phNciNfc_ValidatePollNfcFParams failed";
LABEL_104:
          uint64_t v8 = 1;
          sub_2259A0EAC(2, a1, 3u, 1u, (uint64_t)v14);
          goto LABEL_105;
        }
        ++*a4;
        ++*a3;
        int v11 = *(unsigned __int8 *)(a2 + 28);
        sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcFParams");
        if ((v11 - 1) >= 2 && v11 != 128) {
          goto LABEL_24;
        }
        int v10 = *(_DWORD *)(a2 + 4);
      }
      if ((v10 & 0x10) == 0)
      {
LABEL_20:
        if ((v10 & 0x20) == 0) {
          goto LABEL_41;
        }
        sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcAParams");
        int v13 = *(_DWORD *)(a2 + 148);
        if (v13)
        {
          if ((v13 & 4) != 0)
          {
            ++*a4;
            ++*a3;
            LOBYTE(v13) = *(unsigned char *)(a2 + 148);
          }
          if (v13)
          {
            ++*a4;
            ++*a3;
            LOBYTE(v13) = *(unsigned char *)(a2 + 148);
          }
          if ((v13 & 2) != 0)
          {
            ++*a4;
            if (*(unsigned __int8 *)(a2 + 153) > 0xFu) {
              goto LABEL_45;
            }
            ++*a3;
            LOBYTE(v13) = *(unsigned char *)(a2 + 148);
          }
          if ((v13 & 8) == 0)
          {
LABEL_40:
            sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcAParams");
            int v10 = *(_DWORD *)(a2 + 4);
LABEL_41:
            if ((v10 & 0x40) == 0) {
              goto LABEL_54;
            }
            sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcBParams");
            int v16 = *(_DWORD *)(a2 + 172);
            if (!v16)
            {
              sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcBParams");
              uint64_t v14 = "phNciNfc_ValidateLstnNfcBParams failed";
              goto LABEL_104;
            }
            if (v16)
            {
              ++*a4;
              ++*a3;
              LOBYTE(v16) = *(unsigned char *)(a2 + 172);
            }
            if ((v16 & 2) != 0)
            {
              ++*a4;
              *a3 += 4;
              LOBYTE(v16) = *(unsigned char *)(a2 + 172);
              if ((v16 & 4) == 0)
              {
LABEL_50:
                if ((v16 & 8) == 0) {
                  goto LABEL_51;
                }
                goto LABEL_60;
              }
            }
            else if ((v16 & 4) == 0)
            {
              goto LABEL_50;
            }
            ++*a4;
            *a3 += 4;
            LOBYTE(v16) = *(unsigned char *)(a2 + 172);
            if ((v16 & 8) == 0)
            {
LABEL_51:
              if ((v16 & 0x10) == 0)
              {
LABEL_53:
                sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcBParams");
                int v10 = *(_DWORD *)(a2 + 4);
LABEL_54:
                if ((v10 & 0x80) == 0) {
                  goto LABEL_77;
                }
                sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcFParams");
                int v17 = *(_DWORD *)(a2 + 196);
                if (!v17)
                {
                  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcFParams");
                  uint64_t v14 = "phNciNfc_ValidateLstnNfcFParams failed";
                  goto LABEL_104;
                }
                if (v17)
                {
                  ++*a4;
                  ++*a3;
                  LOBYTE(v17) = *(unsigned char *)(a2 + 196);
                }
                if ((v17 & 2) != 0)
                {
                  ++*a4;
                  ++*a3;
                  LOBYTE(v17) = *(unsigned char *)(a2 + 196);
                  if ((v17 & 8) == 0)
                  {
LABEL_66:
                    if ((v17 & 0x10) == 0) {
                      goto LABEL_67;
                    }
                    goto LABEL_71;
                  }
                }
                else if ((v17 & 8) == 0)
                {
                  goto LABEL_66;
                }
                ++*a4;
                *a3 += 8;
                LOBYTE(v17) = *(unsigned char *)(a2 + 196);
                if ((v17 & 0x10) == 0)
                {
LABEL_67:
                  if ((v17 & 4) == 0) {
                    goto LABEL_76;
                  }
                  goto LABEL_72;
                }
LABEL_71:
                ++*a4;
                *a3 += 2;
                if ((*(unsigned char *)(a2 + 196) & 4) == 0)
                {
LABEL_76:
                  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcFParams");
                  int v10 = *(_DWORD *)(a2 + 4);
LABEL_77:
                  if ((v10 & 0x100) != 0)
                  {
                    if (sub_225A49FD0(a1, (int *)(a2 + 380), a3, a4))
                    {
                      uint64_t v14 = "phNciNfc_ValidateLstnIsoDepParams failed";
                      goto LABEL_104;
                    }
                    int v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x400) != 0)
                  {
                    if (sub_225A4A0FC(a1, (int *)(a2 + 544), a3, a4))
                    {
                      uint64_t v14 = "phNciNfc_ValidateCommonParams failed";
                      goto LABEL_104;
                    }
                    int v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x1000) != 0)
                  {
                    if (sub_225A4A250(a1, (unsigned __int8 *)(a2 + 580), a3, a4))
                    {
                      uint64_t v14 = "phNciNfc_ValidateSysConfigParams failed";
                      goto LABEL_104;
                    }
                    int v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x2000) != 0)
                  {
                    if (sub_225A4A780(a1, (int *)(a2 + 1128), a3, a4))
                    {
                      uint64_t v14 = "phNciNfc_ValidateSwpConfigParams failed";
                      goto LABEL_104;
                    }
                    int v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x4000) != 0)
                  {
                    if (sub_225A4AB48(a1, (int *)(a2 + 1740), a3, a4))
                    {
                      uint64_t v14 = "phNciNfc_ValidateSmbCfgParams failed";
                      goto LABEL_104;
                    }
                    int v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x8000) != 0)
                  {
                    if (sub_225A4AC58(a1, (int *)(a2 + 1408), a3, a4))
                    {
                      uint64_t v14 = "phNciNfc_ValidateNxpExtnRfDiscConfigParams failed";
                      goto LABEL_104;
                    }
                    int v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x10000) == 0 || !sub_225A4B108(a1, (int *)(a2 + 1536), a3, a4))
                  {
                    uint64_t v8 = 0;
                    goto LABEL_105;
                  }
                  uint64_t v14 = "phNciNfc_ValidatePropConfigParams failed";
                  goto LABEL_104;
                }
LABEL_72:
                for (int i = 0; i != 16; ++i)
                {
                  if ((*(unsigned __int16 *)(a2 + 378) >> i))
                  {
                    ++*a4;
                    *a3 += 10;
                  }
                }
                goto LABEL_76;
              }
LABEL_52:
              ++*a4;
              ++*a3;
              goto LABEL_53;
            }
LABEL_60:
            ++*a4;
            ++*a3;
            if ((*(unsigned char *)(a2 + 172) & 0x10) == 0) {
              goto LABEL_53;
            }
            goto LABEL_52;
          }
          ++*a4;
          unsigned int v15 = *(unsigned __int8 *)(a2 + 170);
          if (v15 <= 0xA && ((1 << v15) & 0x491) != 0)
          {
            *a3 += v15;
            goto LABEL_40;
          }
        }
LABEL_45:
        sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcAParams");
        uint64_t v14 = "phNciNfc_ValidateLstnNfcAParams failed";
        goto LABEL_104;
      }
      sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcDepParams");
      int v12 = *(_DWORD *)(a2 + 88);
      if (v12)
      {
        if ((v12 & 1) == 0)
        {
          if ((v12 & 4) == 0)
          {
LABEL_17:
            if ((v12 & 2) != 0)
            {
              ++*a4;
              *a3 += *(unsigned __int8 *)(a2 + 141);
            }
            sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcDepParams");
            int v10 = *(_DWORD *)(a2 + 4);
            goto LABEL_20;
          }
LABEL_16:
          ++*a4;
          ++*a3;
          LOBYTE(v12) = *(unsigned char *)(a2 + 88);
          goto LABEL_17;
        }
        if (*(unsigned __int8 *)(a2 + 92) <= 1u)
        {
          ++*a4;
          ++*a3;
          LOBYTE(v12) = *(unsigned char *)(a2 + 88);
          if ((v12 & 4) == 0) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      else
      {
        sub_2259A0EAC(2, a1, 3u, 2u, (uint64_t)"No Poll Nfc-Dep parameters are being requested by the user to configure");
      }
      sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcDepParams");
      uint64_t v14 = "phNciNfc_ValidatePollNfcDepParams failed";
      goto LABEL_104;
    }
    sub_2259A0EAC(2, a1, 3u, 4u, (uint64_t)"No set config entries");
    uint64_t v8 = 1;
  }
LABEL_105:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSetConfParams");
  return v8;
}

uint64_t sub_225A49FD0(unsigned int *a1, int *a2, _WORD *a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnIsoDepParams");
  int v8 = *a2;
  if (!*a2) {
    goto LABEL_13;
  }
  if (v8)
  {
    ++*a4;
    ++*a3;
    LOBYTE(v8) = *(unsigned char *)a2;
    if ((*(unsigned char *)a2 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((v8 & 2) != 0)
  {
LABEL_6:
    ++*a4;
    *a3 += *((unsigned __int8 *)a2 + 53);
    LOBYTE(v8) = *(unsigned char *)a2;
  }
LABEL_7:
  if ((v8 & 4) != 0)
  {
    ++*a4;
    *a3 += *((unsigned __int8 *)a2 + 102);
    if ((*(unsigned char *)a2 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_11;
  }
  if ((v8 & 8) != 0)
  {
LABEL_11:
    ++*a4;
    if (*((unsigned __int8 *)a2 + 103) <= 6u)
    {
      uint64_t v9 = 0;
      ++*a3;
      goto LABEL_14;
    }
LABEL_13:
    uint64_t v9 = 1;
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v9 = 0;
LABEL_14:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnIsoDepParams");
  return v9;
}

uint64_t sub_225A4A0FC(unsigned int *a1, int *a2, _WORD *a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateCommonParams");
  int v8 = *a2;
  if (!*a2) {
    goto LABEL_17;
  }
  if (v8)
  {
    ++*a4;
    *a3 += 2;
    LOBYTE(v8) = *(unsigned char *)a2;
    if ((*(unsigned char *)a2 & 2) == 0) {
      goto LABEL_8;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_8;
  }
  if (*((unsigned char *)a2 + 6))
  {
    ++*a4;
    ++*a3;
    LOBYTE(v8) = *(unsigned char *)a2;
  }
LABEL_8:
  if ((v8 & 0x10) != 0)
  {
    ++*a4;
    ++*a3;
    LOBYTE(v8) = *(unsigned char *)a2;
  }
  if ((v8 & 4) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 7) > 1u) {
      goto LABEL_17;
    }
    ++*a3;
    LOBYTE(v8) = *(unsigned char *)a2;
  }
  if ((v8 & 8) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 8) <= 1u)
    {
      uint64_t v9 = 0;
      ++*a3;
      goto LABEL_18;
    }
LABEL_17:
    uint64_t v9 = 1;
    goto LABEL_18;
  }
  uint64_t v9 = 0;
LABEL_18:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateCommonParams");
  return v9;
}

uint64_t sub_225A4A250(unsigned int *a1, unsigned __int8 *a2, _WORD *a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSysConfigParams");
  if (!*(_DWORD *)a2) {
    goto LABEL_47;
  }
  sub_225A4DED4(a1, *(_DWORD *)a2 & 1, 3, a3, a4);
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysClkParams");
  unsigned int v8 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 2) != 0)
  {
    ++*a4;
    if (a2[6] >= 3u)
    {
      sub_225A4DED4(a1, a2[8], 5, a3, a4);
      goto LABEL_43;
    }
    *a3 += 2;
    sub_225A4DED4(a1, a2[8], 5, a3, a4);
    unsigned int v8 = *(_DWORD *)a2;
  }
  sub_225A4DED4(a1, (v8 >> 3) & 1, 2, a3, a4);
  if ((*a2 & 4) == 0) {
    goto LABEL_9;
  }
  ++*a4;
  if (!*((_DWORD *)a2 + 2) || *((_DWORD *)a2 + 3) > 7u)
  {
LABEL_43:
    int v13 = "phNciNfc_ParseSysClkParams";
LABEL_46:
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)v13);
    goto LABEL_47;
  }
  *a3 += 2;
LABEL_9:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysClkParams");
  unsigned int v9 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 0x10) != 0)
  {
    ++*a4;
    if (a2[20] > 1u) {
      goto LABEL_47;
    }
    *a3 += 2;
    unsigned int v9 = *(_DWORD *)a2;
  }
  if ((v9 & 0x20) == 0) {
    goto LABEL_15;
  }
  ++*a4;
  if (a2[21] > 1u)
  {
LABEL_47:
    uint64_t v12 = 1;
    goto LABEL_48;
  }
  *a3 += 2;
  unsigned int v9 = *(_DWORD *)a2;
LABEL_15:
  sub_225A4DED4(a1, (v9 >> 6) & 1, 2, a3, a4);
  sub_225A4DED4(a1, *a2 >> 7, 65, a3, a4);
  sub_225A4DED4(a1, (*(_DWORD *)a2 >> 8) & 1, 3, a3, a4);
  sub_225A4DED4(a1, (*(_DWORD *)a2 >> 9) & 1, 3, a3, a4);
  sub_225A4DED4(a1, (*(_DWORD *)a2 >> 10) & 1, 2, a3, a4);
  sub_225A4DED4(a1, (*(_DWORD *)a2 >> 11) & 1, 2, a3, a4);
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysParams");
  int v10 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 0x1000) != 0)
  {
    if (a2[102] > 0x1Fu) {
      goto LABEL_45;
    }
    ++*a4;
    *a3 += a2[102] + 1;
    int v10 = *(_DWORD *)a2;
  }
  if ((v10 & 0x2000) != 0)
  {
    if (a2[134] > 0xD6u) {
      goto LABEL_45;
    }
    ++*a4;
    *a3 += a2[134] + 1;
    int v10 = *(_DWORD *)a2;
  }
  if ((v10 & 0x4000) != 0)
  {
    if ((*((_DWORD *)a2 + 88) | 2) != 2) {
      goto LABEL_45;
    }
    ++*a4;
    *a3 += 2;
    int v10 = *(_DWORD *)a2;
  }
  if ((v10 & 0x8000) == 0) {
    goto LABEL_27;
  }
  if (*((_DWORD *)a2 + 89) > 0xAu)
  {
LABEL_45:
    int v13 = "phNciNfc_ParseSysParams";
    goto LABEL_46;
  }
  ++*a4;
  *a3 += 2;
  int v10 = *(_DWORD *)a2;
LABEL_27:
  if ((v10 & 0x10000) != 0)
  {
    ++*a4;
    *a3 += 2;
  }
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysAssertParams");
  int v11 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 0x20000) != 0)
  {
    if (a2[365] - 1 > 3) {
      goto LABEL_44;
    }
    ++*a4;
    *a3 += a2[365] + 1;
    int v11 = *(_DWORD *)a2;
  }
  if ((v11 & 0x40000) != 0)
  {
    if (a2[462] - 1 > 0x5F) {
      goto LABEL_44;
    }
    ++*a4;
    *a3 += a2[462] + 1;
    int v11 = *(_DWORD *)a2;
  }
  if ((v11 & 0x80000) == 0) {
    goto LABEL_38;
  }
  if (a2[491] - 1 > 0x1B)
  {
LABEL_44:
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysAssertParams");
    goto LABEL_45;
  }
  ++*a4;
  *a3 += a2[491] + 1;
  int v11 = *(_DWORD *)a2;
LABEL_38:
  if ((v11 & 0x100000) != 0)
  {
    if (a2[536] - 1 <= 0x2B)
    {
      ++*a4;
      *a3 += a2[536] + 1;
      goto LABEL_41;
    }
    goto LABEL_44;
  }
LABEL_41:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysAssertParams");
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysParams");
  sub_225A4DED4(a1, (*(_DWORD *)a2 >> 21) & 1, 2, a3, a4);
  sub_225A4DED4(a1, (*(_DWORD *)a2 >> 22) & 1, 7, a3, a4);
  uint64_t v12 = 0;
LABEL_48:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSysConfigParams");
  return v12;
}

uint64_t sub_225A4A780(unsigned int *a1, int *a2, _WORD *a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSwpConfigParams");
  if (!*a2)
  {
    if (!a2[1])
    {
      if ((a2[4] & 0x80) != 0)
      {
        __int16 v10 = 9;
LABEL_61:
        uint64_t v12 = 0;
        ++*a4;
        *a3 += v10;
        goto LABEL_53;
      }
      goto LABEL_52;
    }
    goto LABEL_6;
  }
  if ((*a2 & 1) == 0)
  {
LABEL_6:
    int v8 = 0;
    goto LABEL_8;
  }
  ++*a4;
  if (*((unsigned __int8 *)a2 + 8) - 8 >= 0xFFFFFFF9)
  {
    int v8 = 0;
    *a3 += 2;
  }
  else
  {
    int v8 = 1;
  }
LABEL_8:
  if ((*(unsigned char *)a2 & 2) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 9) - 8 >= 0xFFFFFFF9) {
      *a3 += 2;
    }
    else {
      int v8 = 1;
    }
  }
  if ((*((unsigned char *)a2 + 1) & 0x10) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 28) - 101 >= 0xFFFFFF9C) {
      *a3 += 2;
    }
    else {
      int v8 = 1;
    }
  }
  if ((*((unsigned char *)a2 + 1) & 0x20) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 29) - 104 < 0xFFFFFF99) {
      goto LABEL_52;
    }
    *a3 += 2;
  }
  if (v8) {
    goto LABEL_52;
  }
  int v9 = *a2;
  if ((*a2 & 4) != 0)
  {
    ++*a4;
    *a3 += 2;
    int v9 = *a2;
    if ((*a2 & 8) == 0)
    {
LABEL_22:
      if ((v9 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_34;
    }
  }
  else if ((v9 & 8) == 0)
  {
    goto LABEL_22;
  }
  ++*a4;
  *a3 += 2;
  int v9 = *a2;
  if ((*a2 & 0x10) == 0)
  {
LABEL_23:
    if ((v9 & 0x20) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_34:
  ++*a4;
  if (*((unsigned __int8 *)a2 + 20) - 2 > 2) {
    goto LABEL_52;
  }
  *a3 += 2;
  int v9 = *a2;
  if ((*a2 & 0x20) != 0)
  {
LABEL_24:
    ++*a4;
    *a3 += 2;
    int v9 = *a2;
  }
LABEL_25:
  if ((v9 & 0x40) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 22) > 3u) {
      goto LABEL_52;
    }
    *a3 += 2;
    int v9 = *a2;
  }
  if ((v9 & 0x80) == 0)
  {
    if ((v9 & 0x100) == 0) {
      goto LABEL_30;
    }
LABEL_40:
    ++*a4;
    *a3 += 2;
    if ((*a2 & 0x800000) == 0) {
      goto LABEL_43;
    }
LABEL_41:
    ++*a4;
    if (*((unsigned __int8 *)a2 + 40) <= 2u)
    {
      *a3 += 2;
      goto LABEL_43;
    }
LABEL_52:
    uint64_t v12 = 1;
    goto LABEL_53;
  }
  ++*a4;
  *a3 += 2;
  int v9 = *a2;
  if ((*a2 & 0x100) != 0) {
    goto LABEL_40;
  }
LABEL_30:
  if ((v9 & 0x800000) != 0) {
    goto LABEL_41;
  }
LABEL_43:
  char v11 = *((unsigned char *)a2 + 4);
  if (v11)
  {
    ++*a4;
    *a3 += 2;
    char v11 = *((unsigned char *)a2 + 4);
    if ((v11 & 2) == 0)
    {
LABEL_45:
      if ((v11 & 4) == 0) {
        goto LABEL_46;
      }
      goto LABEL_56;
    }
  }
  else if ((a2[1] & 2) == 0)
  {
    goto LABEL_45;
  }
  ++*a4;
  *a3 += 2;
  char v11 = *((unsigned char *)a2 + 4);
  if ((v11 & 4) == 0)
  {
LABEL_46:
    if ((v11 & 8) == 0) {
      goto LABEL_47;
    }
    goto LABEL_57;
  }
LABEL_56:
  ++*a4;
  *a3 += 2;
  char v11 = *((unsigned char *)a2 + 4);
  if ((v11 & 8) == 0)
  {
LABEL_47:
    if ((v11 & 0x10) == 0) {
      goto LABEL_48;
    }
    goto LABEL_58;
  }
LABEL_57:
  ++*a4;
  *a3 += 2;
  char v11 = *((unsigned char *)a2 + 4);
  if ((v11 & 0x10) == 0)
  {
LABEL_48:
    if ((v11 & 0x20) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_58:
  ++*a4;
  *a3 += 2;
  if ((a2[1] & 0x20) != 0)
  {
LABEL_49:
    ++*a4;
    *a3 += 2;
  }
LABEL_50:
  if (*((unsigned char *)a2 + 3))
  {
    __int16 v10 = 2;
    goto LABEL_61;
  }
  uint64_t v12 = 0;
LABEL_53:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSwpConfigParams");
  return v12;
}

uint64_t sub_225A4AB48(unsigned int *a1, int *a2, _WORD *a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSmbCfgParams");
  if (!a2 || (int v8 = *a2) == 0)
  {
    uint64_t v9 = 1;
    goto LABEL_13;
  }
  if ((v8 & 1) == 0)
  {
    if ((v8 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  ++*a4;
  *a3 += 4;
  LOBYTE(v8) = *(unsigned char *)a2;
  if ((*(unsigned char *)a2 & 2) != 0)
  {
LABEL_8:
    ++*a4;
    *a3 += 2;
    LOBYTE(v8) = *(unsigned char *)a2;
  }
LABEL_9:
  if ((v8 & 4) != 0)
  {
    ++*a4;
    *a3 += 3;
    LOBYTE(v8) = *(unsigned char *)a2;
  }
  uint64_t v9 = 0;
  if ((v8 & 8) != 0)
  {
    ++*a4;
    *a3 += 17;
  }
LABEL_13:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSmbCfgParams");
  return v9;
}

uint64_t sub_225A4AC58(unsigned int *a1, int *a2, _WORD *a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateNxpExtnRfDiscConfigParams");
  int v8 = *a2;
  if (*a2)
  {
    if (v8)
    {
      ++*a4;
      if (*((unsigned __int8 *)a2 + 8) > 0x83u) {
        goto LABEL_54;
      }
      *a3 += 2;
      LOWORD(v8) = *(_WORD *)a2;
      if ((*(_WORD *)a2 & 2) == 0)
      {
LABEL_4:
        if ((v8 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_51;
      }
    }
    else if ((v8 & 2) == 0)
    {
      goto LABEL_4;
    }
    ++*a4;
    if (*((unsigned __int8 *)a2 + 9) > 0xFu) {
      goto LABEL_54;
    }
    *a3 += 2;
    LOWORD(v8) = *(_WORD *)a2;
    if ((*(_WORD *)a2 & 4) == 0)
    {
LABEL_5:
      if ((v8 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
LABEL_51:
    ++*a4;
    if (*((unsigned __int16 *)a2 + 5) - 32 > 0x7B0) {
      goto LABEL_54;
    }
    *a3 += 3;
    LOWORD(v8) = *(_WORD *)a2;
    if ((*(_WORD *)a2 & 8) == 0)
    {
LABEL_7:
      if ((v8 & 0x10) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 13) > 1u) {
          goto LABEL_54;
        }
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x20) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 14) > 1u) {
          goto LABEL_54;
        }
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x40) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 15) > 1u) {
          goto LABEL_54;
        }
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x80) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 16) > 1u) {
          goto LABEL_54;
        }
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x100) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 17) > 1u) {
          goto LABEL_54;
        }
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x200) != 0)
      {
        ++*a4;
        if (!*((_WORD *)a2 + 9)) {
          goto LABEL_54;
        }
        *a3 += 3;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x2000) == 0) {
        goto LABEL_29;
      }
      ++*a4;
      if (*((_WORD *)a2 + 13))
      {
        *a3 += 2;
        goto LABEL_29;
      }
LABEL_54:
      uint64_t v10 = 1;
      goto LABEL_55;
    }
LABEL_6:
    ++*a4;
    *a3 += 2;
    LOWORD(v8) = *(_WORD *)a2;
    goto LABEL_7;
  }
  if (!a2[1]) {
    goto LABEL_54;
  }
LABEL_29:
  __int16 v9 = *((_WORD *)a2 + 2);
  if (v9)
  {
    ++*a4;
    *a3 += 7;
    __int16 v9 = *((_WORD *)a2 + 2);
    if ((v9 & 2) == 0)
    {
LABEL_31:
      if ((v9 & 4) == 0) {
        goto LABEL_32;
      }
      goto LABEL_58;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_31;
  }
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 4) == 0)
  {
LABEL_32:
    if ((v9 & 8) == 0) {
      goto LABEL_33;
    }
    goto LABEL_59;
  }
LABEL_58:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 8) == 0)
  {
LABEL_33:
    if ((v9 & 0x10) == 0) {
      goto LABEL_34;
    }
    goto LABEL_60;
  }
LABEL_59:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x10) == 0)
  {
LABEL_34:
    if ((v9 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_61;
  }
LABEL_60:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x20) == 0)
  {
LABEL_35:
    if ((v9 & 0x40) == 0) {
      goto LABEL_36;
    }
    goto LABEL_62;
  }
LABEL_61:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x40) == 0)
  {
LABEL_36:
    if ((v9 & 0x80) == 0) {
      goto LABEL_37;
    }
    goto LABEL_63;
  }
LABEL_62:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x80) == 0)
  {
LABEL_37:
    if ((v9 & 0x100) == 0) {
      goto LABEL_38;
    }
    goto LABEL_64;
  }
LABEL_63:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x100) == 0)
  {
LABEL_38:
    if ((v9 & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_65;
  }
LABEL_64:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x200) == 0)
  {
LABEL_39:
    if ((v9 & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_66;
  }
LABEL_65:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x400) == 0)
  {
LABEL_40:
    if ((v9 & 0x800) == 0) {
      goto LABEL_41;
    }
    goto LABEL_67;
  }
LABEL_66:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x800) == 0)
  {
LABEL_41:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_68;
  }
LABEL_67:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x1000) == 0)
  {
LABEL_42:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_69;
  }
LABEL_68:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x2000) == 0)
  {
LABEL_43:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_69:
  ++*a4;
  *a3 += 7;
  __int16 v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x4000) != 0)
  {
LABEL_44:
    ++*a4;
    *a3 += 7;
    __int16 v9 = *((_WORD *)a2 + 2);
  }
LABEL_45:
  uint64_t v10 = 0;
  if (v9 < 0)
  {
    ++*a4;
    *a3 += 7;
  }
LABEL_55:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateNxpExtnRfDiscConfigParams");
  return v10;
}

uint64_t sub_225A4B108(unsigned int *a1, int *a2, _WORD *a3, unsigned char *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePropConfigParams");
  int v8 = *a2;
  if (!*a2)
  {
    uint64_t v9 = 1;
    goto LABEL_30;
  }
  if (v8)
  {
    ++*a4;
    *a3 += 2;
    int v8 = *a2;
    if ((*a2 & 2) == 0)
    {
LABEL_4:
      if ((v8 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_10:
      ++*a4;
      *a3 += 2;
      if ((*a2 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_4;
  }
  ++*a4;
  *a3 += 3;
  int v8 = *a2;
  if ((*a2 & 4) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v8 & 8) == 0)
  {
LABEL_6:
    uint64_t v9 = 0;
    goto LABEL_14;
  }
LABEL_11:
  ++*a4;
  if (*((unsigned __int8 *)a2 + 9) > 1u)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    *a3 += 2;
  }
LABEL_14:
  int v10 = *a2;
  if ((*a2 & 0x10) != 0)
  {
    ++*a4;
    *a3 += 3;
    int v10 = *a2;
    if ((*a2 & 0x20) == 0)
    {
LABEL_16:
      if ((v10 & 0x40) == 0) {
        goto LABEL_17;
      }
      goto LABEL_33;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  ++*a4;
  *a3 += 2;
  int v10 = *a2;
  if ((*a2 & 0x40) == 0)
  {
LABEL_17:
    if ((v10 & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  ++*a4;
  *a3 += 2;
  int v10 = *a2;
  if ((*a2 & 0x80) == 0)
  {
LABEL_18:
    if ((v10 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  ++*a4;
  *a3 += 2;
  int v10 = *a2;
  if ((*a2 & 0x100) == 0)
  {
LABEL_19:
    if ((v10 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  ++*a4;
  *a3 += (*((unsigned char *)a2 + 72) + 1);
  int v10 = *a2;
  if ((*a2 & 0x200) == 0)
  {
LABEL_20:
    if ((v10 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
LABEL_36:
  ++*a4;
  *a3 += (*((unsigned char *)a2 + 123) + 1);
  int v10 = *a2;
  if ((*a2 & 0x400) == 0)
  {
LABEL_21:
    if ((v10 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  ++*a4;
  *a3 += 2;
  int v10 = *a2;
  if ((*a2 & 0x800) == 0)
  {
LABEL_22:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_39;
  }
LABEL_38:
  ++*a4;
  *a3 += 2;
  int v10 = *a2;
  if ((*a2 & 0x1000) == 0)
  {
LABEL_23:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_40;
  }
LABEL_39:
  ++*a4;
  *a3 += 2;
  int v10 = *a2;
  if ((*a2 & 0x2000) == 0)
  {
LABEL_24:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_41;
  }
LABEL_40:
  ++*a4;
  *a3 += 5;
  int v10 = *a2;
  if ((*a2 & 0x4000) == 0)
  {
LABEL_25:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_42;
  }
LABEL_41:
  ++*a4;
  *a3 += 2;
  int v10 = *a2;
  if ((*a2 & 0x10000) == 0)
  {
LABEL_26:
    if ((v10 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_43;
  }
LABEL_42:
  ++*a4;
  *a3 += 2;
  int v10 = *a2;
  if ((*a2 & 0x8000) == 0)
  {
LABEL_27:
    if ((v10 & 0x20000) == 0) {
      goto LABEL_28;
    }
LABEL_44:
    ++*a4;
    *a3 += (*((unsigned char *)a2 + 183) + 1);
    if ((*a2 & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_43:
  ++*a4;
  *a3 += 6;
  int v10 = *a2;
  if ((*a2 & 0x20000) != 0) {
    goto LABEL_44;
  }
LABEL_28:
  if ((v10 & 0x80000) != 0)
  {
LABEL_29:
    ++*a4;
    *a3 += 2;
  }
LABEL_30:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePropConfigParams");
  return v9;
}

uint64_t sub_225A4B46C(unsigned int *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetConfPayload");
  if (a2 && a3)
  {
    uint64_t v10 = a3;
    LODWORD(v11) = 1;
    HIDWORD(v11) = a4;
    uint64_t v8 = sub_225A4B534(a1, a2, &v10);
  }
  else
  {
    sub_2259A0EAC(2, a1, 3u, 2u, (uint64_t)"Invalid input parameters");
    uint64_t v8 = 1;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetConfPayload");
  return v8;
}

uint64_t sub_225A4B534(unsigned int *a1, uint64_t a2, uint64_t *a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetConfCmdPayload");
  int v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 4) == 0)
  {
    if ((v6 & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_13:
    if ((v6 & 0x20) != 0) {
      goto LABEL_29;
    }
LABEL_14:
    if ((v6 & 0x40) != 0) {
      goto LABEL_43;
    }
LABEL_15:
    if ((v6 & 0x80) != 0) {
      goto LABEL_60;
    }
LABEL_16:
    if ((v6 & 0x100) != 0) {
      goto LABEL_82;
    }
LABEL_17:
    if ((v6 & 0x400) == 0) {
      goto LABEL_102;
    }
LABEL_18:
    sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildCommonParams");
    char v9 = *(unsigned char *)(a2 + 544);
    if (v9)
    {
      if (sub_225A06918(a1, a3, 0, 2, a2 + 548))
      {
LABEL_23:
        uint64_t v8 = "phNciNfc_BuildCommonParams";
        goto LABEL_184;
      }
      char v9 = *(unsigned char *)(a2 + 544);
    }
    if ((v9 & 4) != 0)
    {
      if (sub_225A06918(a1, a3, 0x80u, 1, a2 + 551)) {
        goto LABEL_23;
      }
      char v9 = *(unsigned char *)(a2 + 544);
    }
    if ((v9 & 8) != 0)
    {
      int v21 = sub_225A06918(a1, a3, 0x81u, 1, a2 + 552);
      sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildCommonParams");
      if (v21) {
        goto LABEL_185;
      }
    }
    else
    {
      sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildCommonParams");
    }
    int v6 = *(_DWORD *)(a2 + 4);
    goto LABEL_102;
  }
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcFParams");
  if ((*(unsigned char *)(a2 + 24) & 1) == 0 || sub_225A06918(a1, a3, 0x18u, 1, a2 + 28))
  {
    sub_2259A0EAC(2, a1, 3u, 2u, (uint64_t)"Poll Nfc-F disc config framing failed");
    uint64_t v8 = "phNciNfc_BuildPollNfcFParams";
    goto LABEL_184;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcFParams");
  int v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_3:
  char v30 = 0;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcDepParams");
  char v7 = *(unsigned char *)(a2 + 88);
  if (v7)
  {
    if (sub_225A06918(a1, a3, 0x28u, 1, a2 + 92))
    {
LABEL_8:
      uint64_t v8 = "phNciNfc_BuildPollNfcDepParams";
LABEL_184:
      sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)v8);
      goto LABEL_185;
    }
    char v7 = *(unsigned char *)(a2 + 88);
  }
  if ((v7 & 2) != 0)
  {
    if (sub_225A06918(a1, a3, 0x29u, *(unsigned __int8 *)(a2 + 141), a2 + 93)) {
      goto LABEL_8;
    }
    char v7 = *(unsigned char *)(a2 + 88);
  }
  if ((v7 & 4) != 0)
  {
    char v30 = (8 * *(unsigned char *)(a2 + 144)) & 0x30 | (4 * (*(unsigned char *)(a2 + 144) & 1));
    int v10 = sub_225A06918(a1, a3, 0x2Au, 1, (uint64_t)&v30);
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcDepParams");
    if (v10) {
      goto LABEL_185;
    }
  }
  else
  {
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcDepParams");
  }
  int v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_29:
  char v31 = 0;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcAParams");
  char v11 = *(unsigned char *)(a2 + 148);
  if (v11)
  {
    if (sub_225A06918(a1, a3, 0x30u, 1, a2 + 152)) {
      goto LABEL_37;
    }
    char v11 = *(unsigned char *)(a2 + 148);
  }
  if ((v11 & 2) == 0) {
    goto LABEL_35;
  }
  if (sub_225A06918(a1, a3, 0x31u, 1, a2 + 153))
  {
LABEL_37:
    uint64_t v8 = "phNciNfc_BuildLstnNfcAParams";
    goto LABEL_184;
  }
  char v11 = *(unsigned char *)(a2 + 148);
LABEL_35:
  if ((v11 & 4) != 0)
  {
    char v31 = 32 * (*(unsigned char *)(a2 + 156) & 3);
    if (sub_225A06918(a1, a3, 0x32u, 1, (uint64_t)&v31)) {
      goto LABEL_37;
    }
    char v11 = *(unsigned char *)(a2 + 148);
  }
  if ((v11 & 8) != 0)
  {
    int v12 = sub_225A06918(a1, a3, 0x33u, *(unsigned __int8 *)(a2 + 170), a2 + 160);
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcAParams");
    if (v12) {
      goto LABEL_185;
    }
  }
  else
  {
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcAParams");
  }
  int v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_43:
  __int16 v32 = 0;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcBParams");
  char v13 = *(unsigned char *)(a2 + 172);
  if (v13)
  {
    HIBYTE(v32) = *(unsigned char *)(a2 + 176) & 1;
    if (sub_225A06918(a1, a3, 0x38u, 1, (uint64_t)&v32 + 1)) {
      goto LABEL_54;
    }
    char v13 = *(unsigned char *)(a2 + 172);
  }
  if ((v13 & 2) != 0)
  {
    if (sub_225A06918(a1, a3, 0x39u, 4, a2 + 180)) {
      goto LABEL_54;
    }
    char v13 = *(unsigned char *)(a2 + 172);
  }
  if ((v13 & 4) == 0) {
    goto LABEL_52;
  }
  if (sub_225A06918(a1, a3, 0x3Au, 4, a2 + 184))
  {
LABEL_54:
    uint64_t v8 = "phNciNfc_BuildLstnNfcBParams";
    goto LABEL_184;
  }
  char v13 = *(unsigned char *)(a2 + 172);
LABEL_52:
  if ((v13 & 8) != 0)
  {
    if (sub_225A06918(a1, a3, 0x3Bu, 1, a2 + 188)) {
      goto LABEL_54;
    }
    char v13 = *(unsigned char *)(a2 + 172);
  }
  if ((v13 & 0x10) != 0)
  {
    LOBYTE(v32) = *(unsigned char *)(a2 + 192) & 1 | (4 * ((*(unsigned char *)(a2 + 192) >> 1) & 3));
    int v14 = sub_225A06918(a1, a3, 0x3Cu, 1, (uint64_t)&v32);
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcBParams");
    if (v14) {
      goto LABEL_185;
    }
  }
  else
  {
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcBParams");
  }
  int v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_60:
  __int16 v34 = 0;
  __int16 v33 = 0;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcFParams");
  char v15 = *(unsigned char *)(a2 + 196);
  if (v15)
  {
    HIBYTE(v34) = 2 * (*(unsigned char *)(a2 + 200) & 3);
    if (sub_225A06918(a1, a3, 0x54u, 1, (uint64_t)&v34 + 1)) {
      goto LABEL_71;
    }
    char v15 = *(unsigned char *)(a2 + 196);
  }
  if ((v15 & 2) != 0)
  {
    LOBYTE(v34) = 2 * (*(unsigned char *)(a2 + 204) & 1);
    if (sub_225A06918(a1, a3, 0x50u, 1, (uint64_t)&v34)) {
      goto LABEL_71;
    }
    char v15 = *(unsigned char *)(a2 + 196);
  }
  if ((v15 & 8) == 0) {
    goto LABEL_69;
  }
  if (sub_225A06918(a1, a3, 0x51u, 8, a2 + 369))
  {
LABEL_71:
    uint64_t v8 = "phNciNfc_BuildLstnNfcFParams";
    goto LABEL_184;
  }
  char v15 = *(unsigned char *)(a2 + 196);
LABEL_69:
  if ((v15 & 0x10) != 0)
  {
    __int16 v33 = bswap32(*(unsigned __int16 *)(a2 + 378)) >> 16;
    if (sub_225A06918(a1, a3, 0x53u, 2, (uint64_t)&v33)) {
      goto LABEL_71;
    }
    char v15 = *(unsigned char *)(a2 + 196);
  }
  if ((v15 & 4) != 0)
  {
    uint64_t v16 = 0;
    uint64_t v17 = a2 + 209;
    do
    {
      if ((*(unsigned __int16 *)(a2 + 378) >> v16))
      {
        sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetT3tTagId");
        unsigned int v18 = (v16 & 0xFC) != 0 ? 0 : v16 + 64;
        sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetT3tTagId");
        if (sub_225A06918(a1, a3, v18, 10, v17)) {
          goto LABEL_71;
        }
      }
      ++v16;
      v17 += 10;
    }
    while (v16 != 16);
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcFParams");
  int v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x100) == 0) {
    goto LABEL_17;
  }
LABEL_82:
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnIsoDepParams");
  char v19 = *(unsigned char *)(a2 + 380);
  if (v19)
  {
    if (sub_225A06918(a1, a3, 0x58u, 1, a2 + 384)) {
      goto LABEL_90;
    }
    char v19 = *(unsigned char *)(a2 + 380);
  }
  if ((v19 & 2) == 0) {
    goto LABEL_88;
  }
  if (sub_225A06918(a1, a3, 0x59u, *(unsigned __int8 *)(a2 + 433), a2 + 385))
  {
LABEL_90:
    uint64_t v8 = "phNciNfc_BuildLstnIsoDepParams";
    goto LABEL_184;
  }
  char v19 = *(unsigned char *)(a2 + 380);
LABEL_88:
  if ((v19 & 4) != 0)
  {
    if (sub_225A06918(a1, a3, 0x5Au, *(unsigned __int8 *)(a2 + 482), a2 + 434)) {
      goto LABEL_90;
    }
    char v19 = *(unsigned char *)(a2 + 380);
  }
  if ((v19 & 8) != 0)
  {
    int v20 = sub_225A06918(a1, a3, 0x5Bu, 1, a2 + 483);
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnIsoDepParams");
    if (v20) {
      goto LABEL_185;
    }
  }
  else
  {
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnIsoDepParams");
  }
  int v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x400) != 0) {
    goto LABEL_18;
  }
LABEL_102:
  if ((v6 & 0x1000) == 0)
  {
    if ((v6 & 0x2000) == 0) {
      goto LABEL_104;
    }
LABEL_162:
    sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSwpConfigParams");
    int v26 = *(_DWORD *)(a2 + 1128);
    if ((v26 & 2) != 0)
    {
      if (sub_225A06918(a1, a3, 0xA0D1u, 2, a2 + 1137)) {
        goto LABEL_183;
      }
      int v26 = *(_DWORD *)(a2 + 1128);
    }
    if ((v26 & 0x2000) != 0 && sub_225A06918(a1, a3, 0xA0D3u, 2, a2 + 1157)) {
      goto LABEL_183;
    }
    char v27 = *(unsigned char *)(a2 + 1132);
    if (v27)
    {
      if (sub_225A06918(a1, a3, 0xA0ECu, 2, a2 + 1170)) {
        goto LABEL_183;
      }
      char v27 = *(unsigned char *)(a2 + 1132);
    }
    if ((v27 & 2) != 0)
    {
      if (sub_225A06918(a1, a3, 0xA0D4u, 2, a2 + 1171)) {
        goto LABEL_183;
      }
      char v27 = *(unsigned char *)(a2 + 1132);
    }
    if ((v27 & 4) != 0)
    {
      if (sub_225A06918(a1, a3, 0xA0EDu, 2, a2 + 1172)) {
        goto LABEL_183;
      }
      char v27 = *(unsigned char *)(a2 + 1132);
    }
    if ((v27 & 8) != 0)
    {
      if (sub_225A06918(a1, a3, 0xA0A2u, 2, a2 + 1173)) {
        goto LABEL_183;
      }
      char v27 = *(unsigned char *)(a2 + 1132);
    }
    if (((v27 & 0x20) == 0 || !sub_225A06918(a1, a3, 0xA0F2u, 2, a2 + 1175))
      && ((*(unsigned char *)(a2 + 1131) & 1) == 0 || !sub_225A06918(a1, a3, 0xA0F5u, 2, a2 + 1176)))
    {
      if ((*(_WORD *)(a2 + 1144) & 0x80) != 0)
      {
        int v29 = sub_225A06918(a1, a3, 0xA0EBu, 9, a2 + 1392);
        sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSwpConfigParams");
        if (v29) {
          goto LABEL_185;
        }
      }
      else
      {
        sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSwpConfigParams");
      }
      int v6 = *(_DWORD *)(a2 + 4);
      if ((v6 & 0x8000) == 0) {
        goto LABEL_107;
      }
      goto LABEL_105;
    }
LABEL_183:
    uint64_t v8 = "phNciNfc_BuildSwpConfigParams";
    goto LABEL_184;
  }
  __int16 v35 = 0;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSysConfigParams");
  int v23 = *(_DWORD *)(a2 + 580);
  if ((v23 & 2) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA002u, 2, a2 + 586)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 8) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA004u, 2, a2 + 587)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 4) != 0)
  {
    HIBYTE(v35) = (*(unsigned char *)(a2 + 592) | (8 * *(unsigned char *)(a2 + 588))) & 0xF;
    int v24 = sub_225A06918(a1, a3, 0xA003u, 2, (uint64_t)&v35 + 1);
    if (*(_DWORD *)(a2 + 588) == 1) {
      int v24 = sub_225A06918(a1, a3, 0xA011u, 5, a2 + 596);
    }
    if (v24) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x20) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA006u, 2, a2 + 601)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x40) != 0)
  {
    LOBYTE(v35) = *(unsigned char *)(a2 + 604) | (2 * *(unsigned char *)(a2 + 608));
    if (sub_225A06918(a1, a3, 0xA007u, 2, (uint64_t)&v35)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x80) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA00Fu, 65, a2 + 612)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x1000) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA017u, (*(unsigned char *)(a2 + 682) + 1), a2 + 683)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x2000) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA018u, (*(unsigned char *)(a2 + 714) + 1), a2 + 715)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x4000) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA019u, 2, a2 + 932)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x8000) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA0D5u, 2, a2 + 936)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x20000) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA01Au, (*(unsigned char *)(a2 + 945) + 1), a2 + 941)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x40000) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA01Bu, (*(unsigned char *)(a2 + 1042) + 1), a2 + 946)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x80000) == 0) {
    goto LABEL_154;
  }
  if (sub_225A06918(a1, a3, 0xA027u, (*(unsigned char *)(a2 + 1071) + 1), a2 + 1043))
  {
LABEL_156:
    uint64_t v8 = "phNciNfc_BuildSysConfigParams";
    goto LABEL_184;
  }
  int v23 = *(_DWORD *)(a2 + 580);
LABEL_154:
  if ((v23 & 0x100000) != 0)
  {
    if (sub_225A06918(a1, a3, 0xA01Cu, (*(unsigned char *)(a2 + 1116) + 1), a2 + 1072)) {
      goto LABEL_156;
    }
    int v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x10000) != 0)
  {
    int v25 = sub_225A06918(a1, a3, 0xA037u, 2, a2 + 940);
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSysConfigParams");
    if (v25) {
      goto LABEL_185;
    }
  }
  else
  {
    sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSysConfigParams");
  }
  int v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x2000) != 0) {
    goto LABEL_162;
  }
LABEL_104:
  if ((v6 & 0x8000) == 0) {
    goto LABEL_107;
  }
LABEL_105:
  if (sub_225A4D768(a1, a3, (_WORD *)(a2 + 1408))) {
    goto LABEL_185;
  }
  int v6 = *(_DWORD *)(a2 + 4);
LABEL_107:
  if ((v6 & 0x10000) != 0)
  {
    if (!sub_225A4DA44(a1, a3, (int *)(a2 + 1536)))
    {
      int v6 = *(_DWORD *)(a2 + 4);
      goto LABEL_110;
    }
LABEL_185:
    sub_2259A0EAC(2, a1, 3u, 1u, (uint64_t)"Framing failed!");
    uint64_t v22 = 255;
    goto LABEL_186;
  }
LABEL_110:
  if ((v6 & 0x4000) != 0 && sub_225A4DDC0(a1, a3, (char *)(a2 + 1740))) {
    goto LABEL_185;
  }
  uint64_t v22 = 0;
LABEL_186:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetConfCmdPayload");
  return v22;
}

uint64_t sub_225A4C274(unsigned int *a1, unsigned int a2, int *a3, _WORD *a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSetRtngParams");
  uint64_t v8 = 1;
  if (!a2 || !a3 || !a4) {
    goto LABEL_17;
  }
  uint64_t v8 = a2;
  while (1)
  {
    int v9 = *a3;
    if (*a3 == 2)
    {
      if (sub_225A4C4AC(a1, (uint64_t)a3, a4)) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    if (v9 != 1) {
      break;
    }
    if (sub_225A4C41C(a1, (uint64_t)a3, a4)) {
      goto LABEL_16;
    }
LABEL_13:
    a3 += 8;
    if (!--v8) {
      goto LABEL_17;
    }
  }
  if (!v9)
  {
    if (sub_225A4C38C(a1, (uint64_t)a3, a4)) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  sub_2259A0EAC(2, a1, 3u, 2u, (uint64_t)"Invalid routing type");
LABEL_16:
  uint64_t v8 = 1;
LABEL_17:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSetRtngParams");
  return v8;
}

uint64_t sub_225A4C38C(unsigned int *a1, uint64_t a2, _WORD *a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateTechBasedParams");
  if (*(unsigned __int8 *)(a2 + 4) == 255)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    *a3 += 5;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateTechBasedParams");
  return v6;
}

uint64_t sub_225A4C41C(unsigned int *a1, uint64_t a2, _WORD *a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateProtoBasedParams");
  if (*(unsigned __int8 *)(a2 + 4) == 255)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    *a3 += 5;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateProtoBasedParams");
  return v6;
}

uint64_t sub_225A4C4AC(unsigned int *a1, uint64_t a2, _WORD *a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateAidBasedParams");
  if (*(unsigned __int8 *)(a2 + 4) == 255 || (int v6 = *(unsigned __int8 *)(a2 + 28), (v6 - 5) > 0xB))
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    *a3 += v6 + 4;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateAidBasedParams");
  return v7;
}

uint64_t sub_225A4C550(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  char v15 = 0;
  __int16 v14 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngCmdHandler");
  if (a1)
  {
    unsigned int v8 = sub_225A4C6D8(a1, &v15, &v14);
    int v9 = (unsigned __int16)(v14 + 2);
    uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
    char v11 = v15;
    sub_225A4C7FC((unsigned int *)a1, Memory, v8, (int *)(*(void *)(a1 + 4704) + 32 * *(unsigned __int8 *)(a1 + 897)), v15);
    *a3 = v11;
    *(unsigned char *)(a1 + 897) += v8;
    *(unsigned char *)(a1 + 896) = v11;
    *(void *)(a1 + 3792) = off_26B609A08;
    *(unsigned char *)(a1 + 3992) = 0;
    *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609A08);
    *(void *)(a1 + 880) = Memory;
    *(_DWORD *)(a1 + 888) = v9;
    *(void *)(a1 + 3440) = a2;
    *(void *)(a1 + 3768) = a4;
    uint64_t v12 = sub_225A49314(a1, 0, 0);
    if (v12 != 13)
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
      *(_WORD *)(a1 + 896) = 0;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Set Rtng table Sequence failed!");
    }
  }
  else
  {
    uint64_t v12 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngCmdHandler");
  return v12;
}

uint64_t sub_225A4C6D8(uint64_t a1, unsigned char *a2, _WORD *a3)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 898);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 897);
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CalNumEntries");
  *a2 = 1;
  if (v6 <= v7)
  {
    __int16 v13 = 0;
LABEL_9:
    *a3 += v13;
    unsigned __int8 v9 = 1;
    goto LABEL_10;
  }
  unsigned __int16 v8 = 0;
  unsigned __int8 v9 = 0;
  unsigned __int8 v10 = v6 - v7;
  uint64_t v11 = v6 - v7;
  uint64_t v12 = (int *)(*(void *)(a1 + 4704) + 32 * v7);
  while (1)
  {
    __int16 v13 = sub_225A4CD54((unsigned int *)a1, v12);
    v8 += v13;
    if (*(unsigned __int8 *)(a1 + 16) <= v8) {
      break;
    }
    *a3 += v13;
    ++v9;
    v12 += 8;
    if (!--v11)
    {
      unsigned __int8 v9 = v10;
      break;
    }
  }
  if (!v9) {
    goto LABEL_9;
  }
LABEL_10:
  if (*(unsigned __int8 *)(a1 + 897) + v9 >= v6) {
    *a2 = 0;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CalNumEntries");
  return v9;
}

uint64_t sub_225A4C7FC(unsigned int *a1, unsigned char *a2, unsigned int a3, int *a4, char a5)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetLstnRtngCmdPayload");
  *a2 = a5;
  a2[1] = a3;
  if (a3)
  {
    uint64_t v10 = a3;
    int v11 = 2;
    do
    {
      int v12 = *a4;
      if (*a4 == 2)
      {
        v11 += sub_225A4CC74(a1, &a2[v11], (uint64_t)a4);
      }
      else
      {
        if (v12 == 1)
        {
          sub_225A4CBB0(a1, &a2[v11], (uint64_t)a4);
        }
        else
        {
          if (v12)
          {
            sub_2259A0EAC(2, a1, 3u, 2u, (uint64_t)"Unknown routing type");
            goto LABEL_11;
          }
          sub_225A4CAEC(a1, &a2[v11], (uint64_t)a4);
        }
        v11 += 5;
      }
LABEL_11:
      a4 += 8;
      --v10;
    }
    while (v10);
  }

  return sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetLstnRtngCmdPayload");
}

uint64_t sub_225A4C91C(unsigned int *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VerifySupportedRouting");
  LOWORD(v8) = 1;
  if (!a2 || !a4) {
    goto LABEL_30;
  }
  if (!a3)
  {
    LOWORD(v8) = 0;
    goto LABEL_30;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  int v8 = 0;
  uint64_t v11 = a3;
  int v12 = (unsigned char *)(a4 + 8);
  __int16 v13 = "Techn based routing request but not supported by NFCC";
  while (1)
  {
    int v14 = *((_DWORD *)v12 - 2);
    switch(v14)
    {
      case 2:
        uint64_t v10 = v12;
        if ((*(unsigned char *)(a2 + 4) & 1) == 0)
        {
          __int16 v13 = "Aid based routing request but not supported by NFCC";
          goto LABEL_28;
        }
        break;
      case 1:
        if ((*(unsigned char *)(a2 + 4) & 2) == 0)
        {
          __int16 v13 = "Protocol based routing request but not supported by NFCC";
          goto LABEL_28;
        }
        goto LABEL_13;
      case 0:
        if ((*(unsigned char *)(a2 + 4) & 4) == 0) {
          goto LABEL_28;
        }
LABEL_13:
        uint64_t v10 = (unsigned char *)(a4 + 32 * v9 + 8);
        break;
    }
    if (v8 || !v10) {
      goto LABEL_23;
    }
    if ((*v10 & 4) == 0 || (*(unsigned char *)(a2 + 8) & 2) != 0) {
      break;
    }
    sub_2259A0EAC(2, a1, 3u, 2u, (uint64_t)"Battery off pow state requested but not supported");
    int v8 = 255;
    char v15 = 1;
    if ((*v10 & 2) != 0) {
      goto LABEL_21;
    }
LABEL_22:
    if (v15) {
      goto LABEL_29;
    }
LABEL_23:
    ++v9;
    v12 += 32;
    if (!--v11) {
      goto LABEL_30;
    }
  }
  char v15 = 0;
  int v8 = 0;
  if ((*v10 & 2) == 0) {
    goto LABEL_22;
  }
LABEL_21:
  if (*(unsigned char *)(a2 + 8)) {
    goto LABEL_22;
  }
  __int16 v13 = "Switched off pow state requested but not supported";
LABEL_28:
  sub_2259A0EAC(2, a1, 3u, 2u, (uint64_t)v13);
LABEL_29:
  sub_2259A0EAC(2, a1, 3u, 2u, (uint64_t)"Input Routing type not supported by NFCC");
  LOWORD(v8) = 255;
LABEL_30:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VerifySupportedRouting");
  return (unsigned __int16)v8;
}

uint64_t sub_225A4CAEC(unsigned int *a1, unsigned char *a2, uint64_t a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateTechRtngParams");
  *a2 = *(_DWORD *)a3;
  a2[1] = 3;
  a2[2] = *(unsigned char *)(a3 + 4);
  a2[3] = 0;
  char v6 = *(unsigned char *)(a3 + 8);
  a2[3] = v6 & 1;
  char v7 = *(unsigned char *)(a3 + 8) & 2 | v6 & 1;
  a2[3] = v7;
  a2[3] = *(unsigned char *)(a3 + 8) & 4 | v7;
  a2[4] = *(_DWORD *)(a3 + 12);
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateTechRtngParams");
  return 5;
}

uint64_t sub_225A4CBB0(unsigned int *a1, unsigned char *a2, uint64_t a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateProtoRtngParams");
  *a2 = *(_DWORD *)a3;
  a2[1] = 3;
  a2[2] = *(unsigned char *)(a3 + 4);
  a2[3] = 0;
  char v6 = *(unsigned char *)(a3 + 8);
  a2[3] = v6 & 1;
  char v7 = *(unsigned char *)(a3 + 8) & 2 | v6 & 1;
  a2[3] = v7;
  a2[3] = *(unsigned char *)(a3 + 8) & 4 | v7;
  a2[4] = *(_DWORD *)(a3 + 12);
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateProtoRtngParams");
  return 5;
}

uint64_t sub_225A4CC74(unsigned int *a1, unsigned char *a2, uint64_t a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateAidRtngParams");
  *a2 = *(_DWORD *)a3;
  a2[1] = *(unsigned char *)(a3 + 28) + 2;
  a2[2] = *(unsigned char *)(a3 + 4);
  a2[3] = 0;
  char v6 = *(unsigned char *)(a3 + 8);
  a2[3] = v6 & 1;
  char v7 = *(unsigned char *)(a3 + 8) & 2 | v6 & 1;
  a2[3] = v7;
  a2[3] = *(unsigned char *)(a3 + 8) & 4 | v7;
  phOsalNfc_MemCopy();
  LOBYTE(a3) = *(unsigned char *)(a3 + 28) + 4;
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateAidRtngParams");
  return a3;
}

uint64_t sub_225A4CD54(unsigned int *a1, int *a2)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_EntrySize");
  int v4 = *a2;
  if (*a2 == 2)
  {
    unsigned __int8 v6 = *((unsigned char *)a2 + 28) + 4;
  }
  else
  {
    if (v4) {
      char v5 = 0;
    }
    else {
      char v5 = 5;
    }
    if (v4 == 1) {
      unsigned __int8 v6 = 5;
    }
    else {
      unsigned __int8 v6 = v5;
    }
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_EntrySize");
  return v6;
}

uint64_t sub_225A4CDE4(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  sub_2259A0FB0(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_GetLstnNtfTimeoutHandler");
  if (!a2) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 4);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a2);
  if (v6 == a2)
  {
    char v7 = (unsigned char *)(a2 + 6520);
    if (!*(unsigned char *)(a2 + 6520))
    {
      sub_2259DD7E4(*(_DWORD *)(a2 + 6532), *(void *)(a2 + 4712));
      if (!phOsalNfc_Timer_Start())
      {
        sub_2259A0EAC(1, (unsigned int *)(a2 + 6532), 3u, 4u, (uint64_t)"Get Listen Mode Ntf Handler timer restarted for extended time\n");
        *char v7 = 1;
        return sub_2259A10B4(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_GetLstnNtfTimeoutHandler");
      }
      sub_2259A0EAC(1, (unsigned int *)(a2 + 6532), 3u, 1u, (uint64_t)"Get Listen Mode Ntf Handler timer failed to start for extended time\n\n");
    }
    sub_2259D730C(2, (unsigned int *)a2, a1, 3u, 4u, (uint64_t)"phNciNfc_GetLstnNtfTimeoutHandler", (uint64_t)"Timeout: pNciContext->dwNtfTimerId", 0);
    sub_2259A0EAC(1, (unsigned int *)(a2 + 6532), 3u, 4u, (uint64_t)"#######Get Listen Mode routing notification TIMEOUT########\n");
    phOsalNfc_Timer_Stop();
    *char v7 = 0;
    uint64_t v9 = 0x100000003;
    LODWORD(v10) = 2;
    sub_225A4799C((unsigned int *)(a2 + 920), (uint64_t)&v9, (uint64_t)sub_225A4CFE0);
    sub_225A362F4(a2, 255, 0);
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a2, 3u, 1u, (uint64_t)"Nci context null (phNciNfc_GetLstnNtfTimeoutHandler)\n");
  }
  return sub_2259A10B4(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_GetLstnNtfTimeoutHandler");
}

uint64_t sub_225A4CFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfigNtfCb");
  if (!a1 || !a2) {
    goto LABEL_72;
  }
  phOsalNfc_Timer_Stop();
  *(unsigned char *)(a1 + 6520) = 0;
  sub_2259D730C(1, (unsigned int *)(a1 + 6532), *(void *)(a1 + 4712), 3u, 4u, (uint64_t)"phNciNfc_GetRtngConfigNtfCb", (uint64_t)"pNciCtx->dwNtfTimerId", 0);
  phOsalNfc_SetMemory();
  if (a3 || (unsigned int v6 = *(_DWORD *)(a2 + 16), v6 < 2))
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid notification payload length!");
    goto LABEL_9;
  }
  char v7 = *(unsigned __int8 **)(a2 + 8);
  int v8 = *v7;
  int v9 = v7[1];
  unsigned __int8 v10 = v6 - 2;
  int v11 = *(unsigned __int8 *)(a1 + 896);
  BOOL v12 = (v11 | v8) == 0;
  if (v11 | v8)
  {
    if (*(unsigned char *)(a1 + 896) || v8 != 1)
    {
      if (v11 == 1 && v8 == 1)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Received next Rtng ntf with more set to '1'");
        int v15 = 0;
        uint64_t v16 = *(void *)(a1 + 904);
        *(unsigned char *)(a1 + 896) = 1;
        if (!v16) {
          goto LABEL_48;
        }
      }
      else
      {
        int v15 = 1;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Received last Rtng ntf with more set to '0'");
        *(unsigned char *)(a1 + 896) = v8;
        if (!*(void *)(a1 + 904)) {
          goto LABEL_23;
        }
      }
LABEL_22:
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Copying received Rtng ntf payload to ntf buffer");
      phOsalNfc_MemCopy();
      *(_WORD *)(a1 + 912) += v10;
      *(unsigned char *)(a1 + 898) += v9;
      if (v15) {
        goto LABEL_23;
      }
LABEL_48:
      a3 = 0;
      goto LABEL_72;
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Received first Rtng ntf with more set to '1'");
    if (*(void *)(a1 + 904))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 904) = 0;
    }
    uint64_t Memory = phOsalNfc_GetMemory();
    *(void *)(a1 + 904) = Memory;
    if (Memory)
    {
      int v15 = 0;
      *(unsigned char *)(a1 + 896) = 1;
      goto LABEL_22;
    }
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Failed to allocate memory for storing notification payload");
    *(unsigned char *)(a1 + 896) = 1;
LABEL_9:
    LOBYTE(v42) = 0;
    int v13 = 1;
    goto LABEL_58;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Only one notification is received to read listen mode routing table");
  *(unsigned char *)(a1 + 896) = 0;
  *(unsigned char *)(a1 + 898) = v9;
  if (v9)
  {
    *(void *)(a1 + 904) = *(void *)(a2 + 8) + 2;
    *(_WORD *)(a1 + 912) = v10;
  }
  else
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Listen mode routing table is empty. No of entries: 0");
  }
LABEL_23:
  int v13 = !v12;
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Processing Rtng ntf...");
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v17 = *(unsigned __int8 *)(a1 + 898);
  __int16 v45 = 0;
  long long v44 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessGetRtngNtf");
  LOBYTE(v42) = 0;
  if (v17)
  {
    int v18 = sub_225A06AC0((unsigned int *)a1, *(void *)(a1 + 904), *(unsigned __int16 *)(a1 + 912));
    if (v18 == 255)
    {
      char v36 = "Inconsistent TLVs received!";
    }
    else if (v18)
    {
      char v36 = "Invalid input parameter sent!";
    }
    else
    {
      if (v43)
      {
        phOsalNfc_FreeMemory();
        uint64_t v43 = 0;
      }
      uint64_t v43 = phOsalNfc_GetMemory();
      if (v43)
      {
        uint64_t v19 = 0;
        LOBYTE(v42) = v17;
        uint64_t v46 = *(void *)(a1 + 904);
        int v20 = *(unsigned __int16 *)(a1 + 912);
        LODWORD(v47) = 0;
        HIDWORD(v47) = v20;
        while (1)
        {
          int v21 = sub_225A06B94((unsigned int *)a1, &v46, (unsigned char *)&v45 + 1, &v45, &v44);
          if (v21) {
            break;
          }
          int v22 = HIBYTE(v45);
          int v23 = v45;
          uint64_t v24 = v43;
          int v25 = v44;
          sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRtngEntry");
          if (v22 == 2)
          {
            uint64_t v27 = v43 + v19;
            *(_DWORD *)uint64_t v27 = 2;
            *(unsigned char *)(v27 + 4) = *v25;
            unsigned int v28 = v25[1];
            if (v28 > 0xF)
            {
              int v29 = 255;
            }
            else
            {
              int v29 = 0;
              char v30 = *(unsigned char *)(v27 + 8) & 0xFE | v28 & 1;
              *(unsigned char *)(v27 + 8) = v30;
              char v31 = v30 & 0xFD | v25[1] & 2;
              *(unsigned char *)(v27 + 8) = v31;
              *(unsigned char *)(v27 + 8) = v31 & 0xFB | v25[1] & 4;
            }
            unsigned int v35 = v23 - 2;
            if (v35 >= 0x11)
            {
              sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Received AID length exceeded Max AID Length");
LABEL_75:
              sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRtngEntry");
              goto LABEL_57;
            }
            phOsalNfc_MemCopy();
            *(unsigned char *)(v24 + v19 + 28) = v35;
          }
          else
          {
            if (v22 == 1)
            {
              uint64_t v26 = v43 + v19;
              *(_DWORD *)(v43 + v19) = 1;
            }
            else
            {
              if (v22) {
                goto LABEL_75;
              }
              uint64_t v26 = v43 + v19;
              *(_DWORD *)(v43 + v19) = 0;
            }
            *(unsigned char *)(v26 + 4) = *v25;
            unsigned int v32 = v25[1];
            if (v32 > 0xF)
            {
              int v29 = 255;
            }
            else
            {
              int v29 = 0;
              char v33 = *(unsigned char *)(v26 + 8) & 0xFE | v32 & 1;
              *(unsigned char *)(v26 + 8) = v33;
              char v34 = v33 & 0xFD | v25[1] & 2;
              *(unsigned char *)(v26 + 8) = v34;
              *(unsigned char *)(v26 + 8) = v34 & 0xFB | v25[1] & 4;
            }
            *(_DWORD *)(v26 + 12) = v25[2];
          }
          sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRtngEntry");
          if (v29) {
            goto LABEL_57;
          }
          v19 += 32;
          if (!--v17) {
            goto LABEL_47;
          }
        }
        if (v21 == 255) {
          char v36 = "Get Tlv failed!";
        }
        else {
          char v36 = "Invalid parameter passed";
        }
      }
      else
      {
        char v36 = "Failed to allocate trans info buffer!";
      }
    }
    sub_2259A0EAC(2, (unsigned int *)a1, 3u, 1u, (uint64_t)v36);
LABEL_57:
    sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessGetRtngNtf");
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Rxd Routing Entries Validation Failed!");
    LOBYTE(v42) = 0;
  }
  else
  {
LABEL_47:
    sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessGetRtngNtf");
  }
LABEL_58:
  uint64_t v40 = 0x100000003;
  LODWORD(v41) = 2;
  uint64_t v37 = sub_225A4799C((unsigned int *)(a1 + 920), (uint64_t)&v40, (uint64_t)sub_225A4CFE0);
  a3 = v37;
  if (v37 == 255)
  {
    unsigned int v38 = "De-register Rtng Notificaion call back failed!";
LABEL_65:
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)v38);
    goto LABEL_66;
  }
  if (v37 == 52)
  {
    unsigned int v38 = "Rtng Notificaion call back not registered!";
    goto LABEL_65;
  }
  if (v37)
  {
    unsigned int v38 = "Invalid parameter passed!";
    goto LABEL_65;
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"De-register Rtng ntf call back success");
LABEL_66:
  if (*(void *)(a1 + 904))
  {
    if (v13) {
      phOsalNfc_FreeMemory();
    }
    *(void *)(a1 + 904) = 0;
    *(_WORD *)(a1 + 912) = 0;
    *(unsigned char *)(a1 + 898) = 0;
    *(unsigned char *)(a1 + 896) = 0;
  }
  sub_2259D2750((unsigned int *)a1, (unsigned __int8 *)&v42, a3);
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Notifying upper layer...");
  phOsalNfc_MemCopy();
  sub_225A362F4(a1, a3, a1 + 6984);
  if (v43)
  {
    phOsalNfc_FreeMemory();
    uint64_t v43 = 0;
  }
LABEL_72:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfigNtfCb");
  return a3;
}

BOOL sub_225A4D768(unsigned int *a1, uint64_t *a2, _WORD *a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildNxpRfDiscConfigParams");
  if ((*a3 & 0x10) == 0 || (int v6 = sub_225A06918(a1, a2, 0xA044u, 2, (uint64_t)a3 + 13)) == 0)
  {
    __int16 v7 = a3[2];
    if (v7)
    {
      int v6 = sub_225A06918(a1, a2, 0xA04Du, 7, (uint64_t)a3 + 29);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 2) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA04Eu, 7, (uint64_t)a3 + 35);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 4) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA04Fu, 7, (uint64_t)a3 + 41);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 8) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA050u, 7, (uint64_t)a3 + 47);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x10) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA051u, 7, (uint64_t)a3 + 53);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x20) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA052u, 7, (uint64_t)a3 + 59);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x40) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA053u, 7, (uint64_t)a3 + 65);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x80) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA054u, 7, (uint64_t)a3 + 71);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x100) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA055u, 7, (uint64_t)a3 + 77);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x200) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA056u, 7, (uint64_t)a3 + 83);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x400) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA057u, 7, (uint64_t)a3 + 89);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x800) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA058u, 7, (uint64_t)a3 + 95);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x1000) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA059u, 7, (uint64_t)a3 + 101);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x2000) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA05Au, 7, (uint64_t)a3 + 107);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if ((v7 & 0x4000) != 0)
    {
      int v6 = sub_225A06918(a1, a2, 0xA05Bu, 7, (uint64_t)a3 + 113);
      if (v6) {
        goto LABEL_51;
      }
      __int16 v7 = a3[2];
    }
    if (v7 < 0) {
      int v6 = sub_225A06918(a1, a2, 0xA05Cu, 7, (uint64_t)a3 + 119);
    }
    else {
      int v6 = 0;
    }
  }
LABEL_51:
  BOOL v8 = v6 != 0;
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildNxpRfDiscConfigParams");
  return v8;
}

BOOL sub_225A4DA44(unsigned int *a1, uint64_t *a2, int *a3)
{
  __int16 v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPropConfigParams");
  int v6 = *a3;
  if ((*a3 & 0x10) == 0) {
    goto LABEL_20;
  }
  unsigned int v7 = *((unsigned __int16 *)a3 + 8);
  int v8 = v7 & 0x22;
  if ((v7 & 0x1F) == 0 && v8 != 34)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    char v9 = 2;
    HIBYTE(v15) = 2;
    if ((v7 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v8 == 34) {
    char v10 = (v7 >> 1) & 7 | (16 * (v7 & 1)) & 0xBF | (((v7 & 0x10) != 0) << 6) | 8;
  }
  else {
    char v10 = (v7 >> 1) & 7 | (16 * (v7 & 1)) & 0xBF | (((v7 & 0x10) != 0) << 6);
  }
  LOBYTE(v15) = v10;
  if ((v7 & 0x40) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  char v9 = 0;
  if ((v7 & 0x80) != 0)
  {
LABEL_12:
    v9 |= 4u;
    HIBYTE(v15) = v9;
  }
LABEL_13:
  if ((v7 & 0x100) != 0)
  {
    v9 |= 8u;
    HIBYTE(v15) = v9;
    if ((v7 & 0x200) == 0)
    {
LABEL_15:
      if ((v7 & 0x400) == 0) {
        goto LABEL_16;
      }
LABEL_63:
      v9 |= 0x40u;
      HIBYTE(v15) = v9;
      if ((v7 & 0x800) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x200) == 0)
  {
    goto LABEL_15;
  }
  v9 |= 0x10u;
  HIBYTE(v15) = v9;
  if ((v7 & 0x400) != 0) {
    goto LABEL_63;
  }
LABEL_16:
  if ((v7 & 0x800) != 0) {
LABEL_17:
  }
    HIBYTE(v15) = v9 | 0x20;
LABEL_18:
  int v11 = sub_225A06918(a1, a2, 0xA01Du, 3, (uint64_t)&v15);
  if (v11) {
    goto LABEL_66;
  }
  int v6 = *a3;
LABEL_20:
  if ((v6 & 0x20) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA039u, 2, (uint64_t)(a3 + 5));
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x40) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA0FAu, 2, (uint64_t)a3 + 10);
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x80) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA040u, 2, (uint64_t)a3 + 21);
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x100) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA068u, (*((unsigned char *)a3 + 72) + 1), (uint64_t)a3 + 22);
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x200) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA0C4u, (*((unsigned char *)a3 + 123) + 1), (uint64_t)a3 + 73);
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x400) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA0BCu, 2, (uint64_t)(a3 + 31));
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x800) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA08Fu, 2, (uint64_t)a3 + 11);
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x1000) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA08Eu, 2, (uint64_t)a3 + 125);
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x2000) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA00Du, 5, (uint64_t)(a3 + 50));
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x4000) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA0BFu, 2, (uint64_t)(a3 + 3));
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x10000) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA111u, 2, (uint64_t)(a3 + 33));
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x20000) != 0)
  {
    int v11 = sub_225A06918(a1, a2, 0xA110u, (*((unsigned char *)a3 + 183) + 1), (uint64_t)a3 + 133);
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x8000) != 0)
  {
    v14[0] = *((unsigned char *)a3 + 126) | (2 * *((unsigned char *)a3 + 127));
    *(_DWORD *)&v14[1] = a3[32];
    int v11 = sub_225A06918(a1, a2, 0xA0E7u, 6, (uint64_t)v14);
    if (v11) {
      goto LABEL_66;
    }
    int v6 = *a3;
  }
  if ((v6 & 0x80000) != 0) {
    int v11 = sub_225A06918(a1, a2, 0xA137u, 2, (uint64_t)a3 + 13);
  }
  else {
    int v11 = 0;
  }
LABEL_66:
  BOOL v12 = v11 != 0;
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPropConfigParams");
  return v12;
}

BOOL sub_225A4DDC0(unsigned int *a1, uint64_t *a2, char *a3)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSmbConfigParams");
  if (a3)
  {
    char v6 = *a3;
    if (*a3)
    {
      int v7 = sub_225A06918(a1, a2, 0xA070u, 4, (uint64_t)(a3 + 4));
      if (v7) {
        goto LABEL_15;
      }
      char v6 = *a3;
    }
    if ((v6 & 2) != 0)
    {
      int v7 = sub_225A06918(a1, a2, 0xA071u, 2, (uint64_t)(a3 + 7));
      if (v7) {
        goto LABEL_15;
      }
      char v6 = *a3;
    }
    if ((v6 & 4) == 0) {
      goto LABEL_11;
    }
    int v7 = sub_225A06918(a1, a2, 0xA077u, 3, (uint64_t)(a3 + 8));
    if (!v7)
    {
      char v6 = *a3;
LABEL_11:
      if ((v6 & 8) != 0) {
        int v7 = sub_225A06918(a1, a2, 0xA07Au, 17, (uint64_t)(a3 + 10));
      }
      else {
        int v7 = 0;
      }
    }
LABEL_15:
    BOOL v8 = v7 != 0;
    goto LABEL_16;
  }
  BOOL v8 = 1;
LABEL_16:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSmbConfigParams");
  return v8;
}

uint64_t sub_225A4DED4(unsigned int *a1, int a2, __int16 a3, _WORD *a4, unsigned char *a5)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysConfigParams");
  if (a2 == 1)
  {
    ++*a5;
    *a4 += a3;
  }

  return sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysConfigParams");
}

uint64_t sub_225A4DF78(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRfParams");
  if (a2)
  {
    unsigned int v8 = 0;
    int v9 = 0;
    char v10 = 0;
    int v11 = 0;
    int v73 = a4;
    while (1)
    {
      BOOL v12 = (char *)(a3 + v11);
      if (a4 != 1)
      {
        char v17 = *v12;
        if ((*v12 & 0xFE) == 0xA0) {
          int v18 = *(unsigned __int8 *)(a3 + v8 + 2);
        }
        else {
          int v18 = *(unsigned __int8 *)(a3 + v8 + 1);
        }
        BOOL v16 = v18 != 0;
        goto LABEL_214;
      }
      uint64_t v13 = a2;
      uint64_t v14 = *(void *)(a1 + 4704);
      sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreRfParams");
      int v15 = *v12;
      if (v15 == 24)
      {
        sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StorePollABFParams");
        if (v12[1] == 1 && *v12 == 24)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 28) = v12[2];
          *(_DWORD *)(v14 + 4) |= 4u;
          *(unsigned char *)(v14 + 24) |= 1u;
        }
        else
        {
          BOOL v16 = 1;
        }
        int v21 = (unsigned int *)a1;
        int v22 = "phNciNfc_StorePollABFParams";
        goto LABEL_212;
      }
      if (*v12) {
        break;
      }
      if (v12[1] != 2) {
        goto LABEL_80;
      }
      phOsalNfc_MemCopy();
      BOOL v16 = 0;
      *(_DWORD *)(v14 + 4) |= 0x400u;
      *(unsigned char *)(v14 + 544) |= 1u;
LABEL_213:
      a2 = v13;
      sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreRfParams");
      char v17 = *v12;
      a4 = v73;
LABEL_214:
      if ((v17 & 0xFE) == 0xA0)
      {
        v74[v9] = v17;
        char v17 = *(unsigned char *)(a3 + v8 + 1);
        int v45 = 3;
        unsigned int v46 = 2;
        ++v9;
      }
      else
      {
        int v45 = 2;
        unsigned int v46 = 1;
      }
      v74[v9] = v17;
      int v47 = *(unsigned __int8 *)(a3 + v46 + (unint64_t)v8);
      int v48 = v45 + v11;
      int v11 = v48 + v47;
      ++v9;
      ++v10;
      unsigned int v8 = (v48 + v47);
      if (v8 >= a2 || v16) {
        goto LABEL_241;
      }
    }
    if ((v15 - 40) <= 2)
    {
      sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StorePollIsoNfcDepParams");
      int v19 = *v12;
      switch(v19)
      {
        case '*':
          int v25 = v12[2];
          if ((~v25 & 0x30) == 0)
          {
            *(unsigned char *)(v14 + 144) |= 1u;
            LOBYTE(v25) = v12[2];
          }
          if ((v25 & 4) != 0) {
            *(unsigned char *)(v14 + 144) = *(unsigned char *)(v14 + 144) & 0xF9 | 2;
          }
          char v20 = 4;
          break;
        case ')':
          unsigned int v26 = v12[1];
          if (v26 > 0x30) {
            goto LABEL_40;
          }
          *(unsigned char *)(v14 + 141) = v26;
          phOsalNfc_MemCopy();
          char v20 = 2;
          break;
        case '(':
          *(unsigned char *)(v14 + 92) = v12[2];
          char v20 = 1;
          break;
        default:
LABEL_40:
          BOOL v16 = 1;
LABEL_41:
          int v21 = (unsigned int *)a1;
          int v22 = "phNciNfc_StorePollIsoNfcDepParams";
          goto LABEL_212;
      }
      BOOL v16 = 0;
      *(_DWORD *)(v14 + 4) |= 0x10u;
      *(unsigned char *)(v14 + 88) |= v20;
      goto LABEL_41;
    }
    if ((v15 & 0xFC) == 0x30)
    {
      sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreListenAParams");
      switch(*v12)
      {
        case '0':
          if (v12[1] != 1) {
            goto LABEL_55;
          }
          *(unsigned char *)(v14 + 152) = v12[2];
          char v23 = 1;
          goto LABEL_210;
        case '1':
          if (v12[1] != 1) {
            goto LABEL_55;
          }
          *(unsigned char *)(v14 + 153) = v12[2];
          char v23 = 2;
          goto LABEL_210;
        case '2':
          if (v12[1] != 1) {
            goto LABEL_55;
          }
          HIDWORD(v29) = v12[2];
          LODWORD(v29) = HIDWORD(v29);
          switch((v29 >> 5))
          {
            case 0u:
              char v30 = *(unsigned char *)(v14 + 156) & 0xFC;
              break;
            case 1u:
              char v30 = *(unsigned char *)(v14 + 156) | 1;
              break;
            case 2u:
              char v30 = *(unsigned char *)(v14 + 156) | 2;
              break;
            case 3u:
              char v30 = *(unsigned char *)(v14 + 156) | 3;
              break;
            default:
              char v30 = *(unsigned char *)(v14 + 156) | 4;
              break;
          }
          *(unsigned char *)(v14 + 156) = v30;
          char v23 = 4;
          goto LABEL_210;
        case '3':
          unsigned int v31 = v12[1];
          BOOL v16 = 1;
          if (v31 > 0xA || ((1 << v31) & 0x490) == 0) {
            break;
          }
          *(unsigned char *)(v14 + 170) = v31;
          phOsalNfc_MemCopy();
          char v23 = 8;
LABEL_210:
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x20u;
          *(unsigned char *)(v14 + 148) |= v23;
          break;
        default:
LABEL_55:
          BOOL v16 = 1;
          break;
      }
      int v21 = (unsigned int *)a1;
      int v22 = "phNciNfc_StoreListenAParams";
      goto LABEL_212;
    }
    if ((v15 - 56) <= 4)
    {
      sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreListenBParams");
      BOOL v16 = 1;
      switch(*v12)
      {
        case '8':
          if (v12[1] == 1)
          {
            if (v12[2]) {
              *(unsigned char *)(v14 + 176) |= 1u;
            }
            char v24 = 1;
            goto LABEL_72;
          }
          break;
        case '9':
          if (v12[1] == 4)
          {
            phOsalNfc_MemCopy();
            char v24 = 2;
            goto LABEL_72;
          }
          break;
        case ':':
          if (v12[1] == 4)
          {
            phOsalNfc_MemCopy();
            char v24 = 4;
            goto LABEL_72;
          }
          break;
        case '<':
          if (v12[1] == 1)
          {
            unsigned int v34 = v12[2];
            char v35 = *(unsigned char *)(v14 + 192);
            if (v34)
            {
              v35 |= 1u;
              *(unsigned char *)(v14 + 192) = v35;
              unsigned int v34 = v12[2];
            }
            *(unsigned char *)(v14 + 192) = (v34 >> 1) & 6 | v35 & 0xF9;
            char v24 = 16;
LABEL_72:
            BOOL v16 = 0;
            *(_DWORD *)(v14 + 4) |= 0x40u;
            *(unsigned char *)(v14 + 172) |= v24;
          }
          break;
        default:
          break;
      }
      int v21 = (unsigned int *)a1;
      int v22 = "phNciNfc_StoreListenBParams";
      goto LABEL_212;
    }
    if ((v15 - 64) <= 0x14)
    {
      sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreListenFParams");
      BOOL v16 = 1;
      switch(*v12)
      {
        case '@':
          if (v12[1] == 10) {
            goto LABEL_86;
          }
          break;
        case 'A':
          if (v12[1] == 10) {
            goto LABEL_86;
          }
          break;
        case 'B':
          if (v12[1] == 10) {
            goto LABEL_86;
          }
          break;
        case 'C':
          if (v12[1] == 10)
          {
LABEL_86:
            phOsalNfc_MemCopy();
            BOOL v16 = 0;
            goto LABEL_87;
          }
          break;
        case 'P':
          if (v12[1] == 1)
          {
            if ((v12[2] & 2) != 0) {
              *(unsigned char *)(v14 + 204) |= 1u;
            }
            BOOL v16 = 0;
            *(_DWORD *)(v14 + 4) |= 0x80u;
            char v37 = *(unsigned char *)(v14 + 196) | 2;
            goto LABEL_98;
          }
          break;
        case 'Q':
          if (v12[1] == 8)
          {
            phOsalNfc_MemCopy();
            BOOL v16 = 0;
            *(_DWORD *)(v14 + 4) |= 0x80u;
            char v37 = *(unsigned char *)(v14 + 196) | 8;
            goto LABEL_98;
          }
          break;
        case 'R':
          if (v12[1] == 1)
          {
            BOOL v16 = 0;
            *(unsigned char *)(v14 + 208) = v12[2];
            *(_DWORD *)(v14 + 4) |= 0x80u;
            char v37 = *(unsigned char *)(v14 + 196) | 0x20;
            goto LABEL_98;
          }
          break;
        case 'S':
          if (v12[1] == 2)
          {
            phOsalNfc_MemCopy();
            BOOL v16 = 0;
            *(_DWORD *)(v14 + 4) |= 0x80u;
            char v37 = *(unsigned char *)(v14 + 196) | 0x10;
LABEL_98:
            *(unsigned char *)(v14 + 196) = v37;
          }
          break;
        case 'T':
          if (v12[1] == 1)
          {
            unsigned __int8 v38 = v12[2];
            if ((v38 & 2) != 0)
            {
              *(unsigned char *)(v14 + 200) |= 1u;
              unsigned __int8 v38 = v12[2];
            }
            if ((v38 & 4) != 0) {
              *(unsigned char *)(v14 + 200) |= 2u;
            }
            BOOL v16 = 0;
            *(unsigned char *)(v14 + 196) |= 1u;
LABEL_87:
            *(_DWORD *)(v14 + 4) |= 0x80u;
          }
          break;
        default:
          break;
      }
      int v21 = (unsigned int *)a1;
      int v22 = "phNciNfc_StoreListenFParams";
      goto LABEL_212;
    }
    if ((v15 - 88) <= 0xA)
    {
      sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreListenIsoNfcDepParams");
      BOOL v16 = 1;
      switch(*v12)
      {
        case 'X':
          if (v12[1] == 1)
          {
            uint64_t v27 = (unsigned char *)(v14 + 380);
            *(unsigned char *)(v14 + 384) = v12[2];
            char v28 = 1;
            goto LABEL_228;
          }
          break;
        case 'Y':
          unsigned int v50 = v12[1];
          if (v50 <= 0x30)
          {
            *(unsigned char *)(v14 + 433) = v50;
            phOsalNfc_MemCopy();
            uint64_t v27 = (unsigned char *)(v14 + 380);
            char v28 = 2;
            goto LABEL_228;
          }
          break;
        case 'Z':
          unsigned int v51 = v12[1];
          if (v51 <= 0x30)
          {
            *(unsigned char *)(v14 + 482) = v51;
            phOsalNfc_MemCopy();
            uint64_t v27 = (unsigned char *)(v14 + 380);
            char v28 = 4;
            goto LABEL_228;
          }
          break;
        case '[':
          if (v12[1] == 1)
          {
            uint64_t v27 = (unsigned char *)(v14 + 380);
            *(unsigned char *)(v14 + 483) = v12[2];
            char v28 = 8;
LABEL_228:
            int v52 = 256;
            goto LABEL_236;
          }
          break;
          if (v12[1] == 1)
          {
            uint64_t v27 = (unsigned char *)(v14 + 484);
            *(unsigned char *)(v14 + 488) = v12[2];
            char v28 = 1;
            goto LABEL_235;
          }
          break;
        case 'a':
          unsigned int v53 = v12[1];
          if (v53 <= 0x30)
          {
            *(unsigned char *)(v14 + 537) = v53;
            phOsalNfc_MemCopy();
            uint64_t v27 = (unsigned char *)(v14 + 484);
            char v28 = 2;
            goto LABEL_235;
          }
          break;
        case 'b':
          if (v12[1] == 1)
          {
            uint64_t v27 = (unsigned char *)(v14 + 484);
            *(unsigned char *)(v14 + 540) = *(unsigned char *)(v14 + 540) & 0xFC | (v12[2] >> 4) & 3;
            char v28 = 4;
LABEL_235:
            int v52 = 512;
LABEL_236:
            BOOL v16 = 0;
            *(_DWORD *)(v14 + 4) |= v52;
            *v27 |= v28;
          }
          break;
        default:
          break;
      }
      int v21 = (unsigned int *)a1;
      int v22 = "phNciNfc_StoreListenIsoNfcDepParams";
      goto LABEL_212;
    }
    if ((char)v15 <= -127)
    {
      sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreConfParams");
      int v32 = *v12;
      if (v32 == 129)
      {
        if (v12[1] != 1) {
          goto LABEL_203;
        }
        *(unsigned char *)(v14 + 552) = v12[2];
        char v33 = 8;
LABEL_202:
        BOOL v16 = 0;
        *(_DWORD *)(v14 + 4) |= 0x400u;
        *(unsigned char *)(v14 + 544) |= v33;
      }
      else
      {
        if (v32 == 128 && v12[1] == 1)
        {
          *(unsigned char *)(v14 + 551) = v12[2];
          char v33 = 4;
          goto LABEL_202;
        }
LABEL_203:
        BOOL v16 = 1;
      }
      int v21 = (unsigned int *)a1;
      int v22 = "phNciNfc_StoreConfParams";
LABEL_212:
      sub_2259A10B4(2, v21, 3u, 5u, (uint64_t)v22);
      goto LABEL_213;
    }
    if ((v15 & 0xFE) == 0xA0)
    {
      sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StorePropParams");
      if (v12[2] && v12[1] == 3)
      {
        unsigned int v36 = v12[3] & 0xF;
        if (v36 > 8)
        {
          BOOL v16 = 0;
          *(void *)(v14 + 588) = 0x800000000;
        }
        else
        {
          *(_DWORD *)(v14 + 580) |= 4u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          BOOL v16 = 0;
          if (v36 == 8)
          {
            *(_DWORD *)(v14 + 588) = 1;
          }
          else
          {
            *(_DWORD *)(v14 + 588) = 2;
            *(_DWORD *)(v14 + 592) = v36;
          }
        }
      }
      else
      {
        BOOL v16 = 1;
      }
      int v39 = v12[1];
      if (v39 == 15)
      {
        if (v12[2] == 64)
        {
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x80u;
          int v39 = v12[1];
          goto LABEL_110;
        }
      }
      else
      {
LABEL_110:
        if (v39 == 23)
        {
          unsigned int v40 = v12[2];
          if (v40 > 0x1F) {
            goto LABEL_199;
          }
          *(unsigned char *)(v14 + 682) = v40;
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 24)
        {
          unsigned int v41 = v12[2];
          if (v41 > 0xD6) {
            goto LABEL_199;
          }
          *(unsigned char *)(v14 + 714) = v41;
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 25)
        {
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 932) = v12[3];
          *(_DWORD *)(v14 + 580) |= 0x4000u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 213)
        {
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 936) = v12[3];
          *(_DWORD *)(v14 + 580) |= 0x8000u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 2)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 586) = v12[3];
          *(_DWORD *)(v14 + 580) |= 2u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 4)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 587) = v12[3];
          *(_DWORD *)(v14 + 580) |= 8u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 7)
        {
          unsigned __int8 v42 = v12[3];
          if (v42)
          {
            *(_DWORD *)(v14 + 604) = 1;
            unsigned __int8 v42 = v12[3];
          }
          if ((v42 & 2) != 0) {
            *(_DWORD *)(v14 + 608) = 1;
          }
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 580) |= 0x40u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 34)
        {
          if (v12[2] != 1) {
            goto LABEL_199;
          }
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1125) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x1000000u;
          int v39 = v12[1];
        }
        if (v39 == 35)
        {
          if (v12[2] != 1) {
            goto LABEL_199;
          }
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1124) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x800000u;
          int v39 = v12[1];
        }
        if (v39 == 36)
        {
          if (v12[2] != 1) {
            goto LABEL_199;
          }
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1126) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x2000000u;
          int v39 = v12[1];
        }
        if (v39 == 233)
        {
          if (v12[2] != 1) {
            goto LABEL_199;
          }
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1127) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x4000000u;
          int v39 = v12[1];
        }
        if (v39 == 236)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1170) = v12[3];
          *(unsigned char *)(v14 + 1132) |= 1u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          int v39 = v12[1];
        }
        if (v39 == 212)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1171) = v12[3];
          *(unsigned char *)(v14 + 1132) |= 2u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          int v39 = v12[1];
        }
        if (v39 == 237)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1172) = v12[3];
          *(unsigned char *)(v14 + 1132) |= 4u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          int v39 = v12[1];
        }
        if (v39 == 162)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1173) = v12[3];
          *(unsigned char *)(v14 + 1132) |= 8u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          int v39 = v12[1];
        }
        if (v39 == 242)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1175) = v12[3];
          *(unsigned char *)(v14 + 1132) |= 0x20u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          int v39 = v12[1];
        }
        if (v39 == 68)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1421) = v12[3];
          *(_WORD *)(v14 + 1408) |= 0x10u;
          *(_DWORD *)(v14 + 4) |= 0x8000u;
          int v39 = v12[1];
        }
        if (v39 == 55)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 940) = v12[3];
          *(_DWORD *)(v14 + 580) |= 0x10000u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 245)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1176) = v12[3];
          *(_DWORD *)(v14 + 1128) |= 0x1000000u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          int v39 = v12[1];
        }
        if (v39 == 6)
        {
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 601) = v12[3];
          *(_DWORD *)(v14 + 580) |= 0x20u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 232)
        {
          if (v12[2] != 69) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x100u;
          int v39 = v12[1];
        }
        if (v39 == 239)
        {
          if (v12[2] != 69) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x200u;
          int v39 = v12[1];
        }
        if (v39 == 240)
        {
          if (v12[2] != 69) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x400u;
          int v39 = v12[1];
        }
        if (v39 == 234)
        {
          if (v12[2] != 8) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x40u;
          int v39 = v12[1];
        }
        if (v39 == 235)
        {
          if (v12[2] != 8) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x80u;
          int v39 = v12[1];
        }
        if (v39 == 30)
        {
          if (v12[2] != 8) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x20u;
          int v39 = v12[1];
        }
        if (v39 == 104)
        {
          if (v12[2] - 1 > 0x31) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1608) = v12[2];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x100u;
          int v39 = v12[1];
        }
        if (v39 == 196)
        {
          if (v12[2] - 1 > 0x31) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1659) = v12[2];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x200u;
          int v39 = v12[1];
        }
        if (v39 == 142)
        {
          if (v12[2] != 1) {
            goto LABEL_199;
          }
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1661) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x1000u;
          int v39 = v12[1];
        }
        if (v39 == 16)
        {
          if (v12[2] - 1 > 0x31) {
            goto LABEL_199;
          }
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1719) = v12[2];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x20000u;
          int v39 = v12[1];
        }
        if (v39 == 17)
        {
          if (v12[2] != 2) {
            goto LABEL_199;
          }
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1668) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x10000u;
          int v39 = v12[1];
        }
        if (v39 == 231)
        {
          if (v12[2] != 5) {
            goto LABEL_199;
          }
          BOOL v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x8000u;
          *(unsigned char *)(v14 + 1662) = v12[3] & 1;
          *(unsigned char *)(v14 + 1663) = (v12[3] & 2) != 0;
          __int16 v43 = v12[4];
          *(_WORD *)(v14 + 1664) = v43;
          *(_WORD *)(v14 + 1664) = v43 | (v12[5] << 8);
          __int16 v44 = v12[6];
          *(_WORD *)(v14 + 1666) = v44;
          *(_WORD *)(v14 + 1666) = v44 | (v12[7] << 8);
          int v39 = v12[1];
        }
        if (v39 == 152 && v12[2] - 1 <= 0xE)
        {
          phOsalNfc_MemCopy();
          BOOL v16 = 0;
          *(unsigned char *)(v14 + 1735) = v12[2];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x40000u;
        }
      }
LABEL_199:
      int v21 = (unsigned int *)a1;
      int v22 = "phNciNfc_StorePropParams";
      goto LABEL_212;
    }
LABEL_80:
    BOOL v16 = 1;
    goto LABEL_213;
  }
  BOOL v16 = 0;
  LOBYTE(v11) = 0;
  char v10 = 0;
  LOBYTE(v9) = 0;
LABEL_241:
  uint64_t v54 = 1;
  if (!v16 && a2 == v11)
  {
    __int16 v76 = 0;
    memset(v75, 0, sizeof(v75));
    sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateReqParamIDs");
    if (!v10) {
      goto LABEL_280;
    }
    uint64_t v55 = *(void *)(a1 + 872);
    if (!v55) {
      goto LABEL_280;
    }
    unsigned int v56 = *(unsigned __int8 *)(a1 + 865);
    if (*(unsigned char *)(a1 + 865))
    {
      unsigned int v57 = 0;
      int v58 = 0;
      int v59 = 0;
      unsigned __int8 v60 = 0;
      uint64_t v61 = v55 + 1;
      do
      {
        int v62 = *(unsigned __int8 *)(v61 + v60);
        if ((_BYTE)v9)
        {
          unint64_t v63 = 0;
          uint64_t v64 = v57 + 1;
          int v65 = v62 & 0xFE;
          do
          {
            int v66 = v74[v63];
            if (v65 != 160 || (v62 == v66 ? (BOOL v67 = v64 >= v56) : (BOOL v67 = 1), v67))
            {
              BOOL v68 = v65 != 160 && v62 == v66;
              ++v63;
            }
            else
            {
              if (++v63 >= v9)
              {
                unsigned __int8 v71 = v58 + 1;
                *((unsigned char *)v75 + v58) = v62;
                goto LABEL_271;
              }
              BOOL v68 = *(unsigned __int8 *)(v61 + v64) == v74[v63];
            }
          }
          while (v63 < v9 && !v68);
          if (!v68) {
            goto LABEL_268;
          }
          char v70 = 1;
        }
        else
        {
          int v65 = v62 & 0xFE;
LABEL_268:
          unsigned __int8 v71 = v58 + 1;
          *((unsigned char *)v75 + v58) = v62;
          if (v65 == 160)
          {
LABEL_271:
            v58 += 2;
            *((unsigned char *)v75 + v71) = *(unsigned char *)(v61 + v57 + 1);
            ++v59;
            char v70 = 2;
          }
          else
          {
            ++v59;
            char v70 = 1;
            ++v58;
          }
        }
        v60 += v70;
        unsigned int v57 = v60;
      }
      while (v60 < v56);
      if ((_BYTE)v59)
      {
        if (v58 > 0x62u)
        {
          uint64_t v54 = 1;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Received Req Param length exceeded Total Param Length");
          goto LABEL_279;
        }
        phOsalNfc_MemCopy();
LABEL_278:
        uint64_t v54 = 0;
LABEL_279:
        *(unsigned char *)(a1 + 864) = v59;
        *(unsigned char *)(a1 + 865) = v58;
        **(unsigned char **)(a1 + 872) = v59;
LABEL_280:
        sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateReqParamIDs");
        goto LABEL_281;
      }
    }
    else
    {
      LOBYTE(v58) = 0;
    }
    LOBYTE(v59) = 0;
    goto LABEL_278;
  }
LABEL_281:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRfParams");
  return v54;
}

uint64_t sub_225A4F624(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ClearConfigParams");
  if (*(void *)(a1 + 872))
  {
    *(unsigned char *)(a1 + 864) = 0;
    phOsalNfc_FreeMemory();
    uint64_t v2 = 0;
    *(void *)(a1 + 872) = 0;
  }
  else
  {
    uint64_t v2 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ClearConfigParams");
  return v2;
}

BOOL sub_225A4F6A4(unsigned int *a1, uint64_t a2, unsigned char *a3, unsigned char *a4, unsigned char *a5)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfParams");
  BOOL v10 = 1;
  if (a3 && a4 && a5)
  {
    int v11 = *(_DWORD *)(a2 + 4);
    if (v11 & 4) != 0 && (*(unsigned char *)(a2 + 24))
    {
      *a3 = 24;
      unsigned int v12 = 1;
      if ((*(_DWORD *)(a2 + 4) & 0x10) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v12 = 0;
      if ((v11 & 0x10) == 0) {
        goto LABEL_13;
      }
    }
    char v13 = *(unsigned char *)(a2 + 88);
    if (v13)
    {
      a3[v12++] = 40;
      char v13 = *(unsigned char *)(a2 + 88);
      if ((v13 & 2) == 0)
      {
LABEL_11:
        if ((v13 & 4) == 0) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    else if ((*(unsigned char *)(a2 + 88) & 2) == 0)
    {
      goto LABEL_11;
    }
    a3[v12++] = 41;
    if ((*(unsigned char *)(a2 + 88) & 4) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)(a2 + 4) & 0x20) == 0) {
        goto LABEL_19;
      }
      char v14 = *(unsigned char *)(a2 + 148);
      if (v14)
      {
        a3[v12++] = 48;
        char v14 = *(unsigned char *)(a2 + 148);
        if ((v14 & 2) == 0)
        {
LABEL_16:
          if ((v14 & 4) == 0) {
            goto LABEL_17;
          }
          goto LABEL_59;
        }
      }
      else if ((*(unsigned char *)(a2 + 148) & 2) == 0)
      {
        goto LABEL_16;
      }
      a3[v12++] = 49;
      char v14 = *(unsigned char *)(a2 + 148);
      if ((v14 & 4) == 0)
      {
LABEL_17:
        if ((v14 & 8) == 0) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
LABEL_59:
      a3[v12++] = 50;
      if ((*(unsigned char *)(a2 + 148) & 8) == 0)
      {
LABEL_19:
        if ((*(unsigned char *)(a2 + 4) & 0x40) == 0) {
          goto LABEL_25;
        }
        char v15 = *(unsigned char *)(a2 + 172);
        if (v15)
        {
          a3[v12++] = 56;
          char v15 = *(unsigned char *)(a2 + 172);
          if ((v15 & 2) == 0)
          {
LABEL_22:
            if ((v15 & 4) == 0) {
              goto LABEL_23;
            }
            goto LABEL_63;
          }
        }
        else if ((*(unsigned char *)(a2 + 172) & 2) == 0)
        {
          goto LABEL_22;
        }
        a3[v12++] = 57;
        char v15 = *(unsigned char *)(a2 + 172);
        if ((v15 & 4) == 0)
        {
LABEL_23:
          if ((v15 & 0x10) == 0) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
LABEL_63:
        a3[v12++] = 58;
        if ((*(unsigned char *)(a2 + 172) & 0x10) == 0)
        {
LABEL_25:
          if ((*(unsigned char *)(a2 + 4) & 0x80) == 0) {
            goto LABEL_33;
          }
          char v16 = *(unsigned char *)(a2 + 196);
          if ((v16 & 4) != 0)
          {
            *(_DWORD *)&a3[v12] = 1128415552;
            v12 += 4;
            char v16 = *(unsigned char *)(a2 + 196);
            if ((v16 & 2) == 0)
            {
LABEL_28:
              if ((v16 & 8) == 0) {
                goto LABEL_29;
              }
              goto LABEL_67;
            }
          }
          else if ((*(unsigned char *)(a2 + 196) & 2) == 0)
          {
            goto LABEL_28;
          }
          a3[v12++] = 80;
          char v16 = *(unsigned char *)(a2 + 196);
          if ((v16 & 8) == 0)
          {
LABEL_29:
            if ((v16 & 0x20) == 0) {
              goto LABEL_30;
            }
            goto LABEL_68;
          }
LABEL_67:
          a3[v12++] = 81;
          char v16 = *(unsigned char *)(a2 + 196);
          if ((v16 & 0x20) == 0)
          {
LABEL_30:
            if ((v16 & 0x10) == 0) {
              goto LABEL_31;
            }
            goto LABEL_69;
          }
LABEL_68:
          a3[v12++] = 82;
          char v16 = *(unsigned char *)(a2 + 196);
          if ((v16 & 0x10) == 0)
          {
LABEL_31:
            if ((v16 & 1) == 0) {
              goto LABEL_33;
            }
            goto LABEL_32;
          }
LABEL_69:
          a3[v12++] = 83;
          if ((*(unsigned char *)(a2 + 196) & 1) == 0)
          {
LABEL_33:
            if ((*(unsigned char *)(a2 + 5) & 1) == 0) {
              goto LABEL_39;
            }
            char v17 = *(unsigned char *)(a2 + 380);
            if (v17)
            {
              a3[v12++] = 88;
              char v17 = *(unsigned char *)(a2 + 380);
              if ((v17 & 2) == 0)
              {
LABEL_36:
                if ((v17 & 4) == 0) {
                  goto LABEL_37;
                }
                goto LABEL_73;
              }
            }
            else if ((*(unsigned char *)(a2 + 380) & 2) == 0)
            {
              goto LABEL_36;
            }
            a3[v12++] = 89;
            char v17 = *(unsigned char *)(a2 + 380);
            if ((v17 & 4) == 0)
            {
LABEL_37:
              if ((v17 & 8) == 0) {
                goto LABEL_39;
              }
              goto LABEL_38;
            }
LABEL_73:
            a3[v12++] = 90;
            if ((*(unsigned char *)(a2 + 380) & 8) == 0)
            {
LABEL_39:
              if ((*(unsigned char *)(a2 + 5) & 2) == 0) {
                goto LABEL_44;
              }
              char v18 = *(unsigned char *)(a2 + 484);
              if (v18)
              {
                a3[v12++] = 96;
                char v18 = *(unsigned char *)(a2 + 484);
                if ((v18 & 2) == 0)
                {
LABEL_42:
                  if ((v18 & 4) == 0) {
                    goto LABEL_44;
                  }
                  goto LABEL_43;
                }
              }
              else if ((*(unsigned char *)(a2 + 484) & 2) == 0)
              {
                goto LABEL_42;
              }
              a3[v12++] = 97;
              if ((*(unsigned char *)(a2 + 484) & 4) == 0)
              {
LABEL_44:
                if ((*(unsigned char *)(a2 + 5) & 4) == 0) {
                  goto LABEL_49;
                }
                char v19 = *(unsigned char *)(a2 + 544);
                if (v19)
                {
                  a3[v12++] = 0;
                  char v19 = *(unsigned char *)(a2 + 544);
                  if ((v19 & 4) == 0)
                  {
LABEL_47:
                    if ((v19 & 8) == 0) {
                      goto LABEL_49;
                    }
                    goto LABEL_48;
                  }
                }
                else if ((*(unsigned char *)(a2 + 544) & 4) == 0)
                {
                  goto LABEL_47;
                }
                a3[v12++] = 0x80;
                if ((*(unsigned char *)(a2 + 544) & 8) == 0)
                {
LABEL_49:
                  if ((*(unsigned char *)(a2 + 5) & 0x10) == 0)
                  {
                    unsigned int v20 = v12;
                    goto LABEL_97;
                  }
                  int v21 = *(_DWORD *)(a2 + 580);
                  if ((v21 & 4) != 0)
                  {
                    *(_WORD *)&a3[v12] = 928;
                    unsigned int v20 = v12 + 2;
                    ++v12;
                    int v21 = *(_DWORD *)(a2 + 580);
                    if ((v21 & 0x80) == 0) {
                      goto LABEL_83;
                    }
                  }
                  else
                  {
                    unsigned int v20 = v12;
                    if ((v21 & 0x80) == 0)
                    {
LABEL_83:
                      if ((v21 & 0x1000000) != 0)
                      {
                        *(_WORD *)&a3[v20] = 8864;
                        v20 += 2;
                        ++v12;
                        int v21 = *(_DWORD *)(a2 + 580);
                        if ((v21 & 0x800000) == 0)
                        {
LABEL_85:
                          if ((v21 & 0x2000000) == 0) {
                            goto LABEL_86;
                          }
                          goto LABEL_128;
                        }
                      }
                      else if ((v21 & 0x800000) == 0)
                      {
                        goto LABEL_85;
                      }
                      *(_WORD *)&a3[v20] = 9120;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x2000000) == 0)
                      {
LABEL_86:
                        if ((v21 & 0x1000) == 0) {
                          goto LABEL_87;
                        }
                        goto LABEL_129;
                      }
LABEL_128:
                      *(_WORD *)&a3[v20] = 9376;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x1000) == 0)
                      {
LABEL_87:
                        if ((v21 & 0x2000) == 0) {
                          goto LABEL_88;
                        }
                        goto LABEL_130;
                      }
LABEL_129:
                      *(_WORD *)&a3[v20] = 6048;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x2000) == 0)
                      {
LABEL_88:
                        if ((v21 & 0x4000) == 0) {
                          goto LABEL_89;
                        }
                        goto LABEL_131;
                      }
LABEL_130:
                      *(_WORD *)&a3[v20] = 6304;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x4000) == 0)
                      {
LABEL_89:
                        if ((v21 & 2) == 0) {
                          goto LABEL_90;
                        }
                        goto LABEL_132;
                      }
LABEL_131:
                      *(_WORD *)&a3[v20] = 6560;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 2) == 0)
                      {
LABEL_90:
                        if ((v21 & 8) == 0) {
                          goto LABEL_91;
                        }
                        goto LABEL_133;
                      }
LABEL_132:
                      *(_WORD *)&a3[v20] = 672;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 8) == 0)
                      {
LABEL_91:
                        if ((v21 & 0x40) == 0) {
                          goto LABEL_92;
                        }
                        goto LABEL_134;
                      }
LABEL_133:
                      *(_WORD *)&a3[v20] = 1184;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x40) == 0)
                      {
LABEL_92:
                        if ((v21 & 0x8000) == 0) {
                          goto LABEL_93;
                        }
                        goto LABEL_135;
                      }
LABEL_134:
                      *(_WORD *)&a3[v20] = 1952;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x8000) == 0)
                      {
LABEL_93:
                        if ((v21 & 0x10000) == 0) {
                          goto LABEL_94;
                        }
                        goto LABEL_136;
                      }
LABEL_135:
                      *(_WORD *)&a3[v20] = -10848;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x10000) == 0)
                      {
LABEL_94:
                        if ((v21 & 0x20) == 0) {
                          goto LABEL_95;
                        }
                        goto LABEL_137;
                      }
LABEL_136:
                      *(_WORD *)&a3[v20] = 14240;
                      v20 += 2;
                      ++v12;
                      int v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x20) == 0)
                      {
LABEL_95:
                        if ((v21 & 0x4000000) == 0) {
                          goto LABEL_97;
                        }
                        goto LABEL_96;
                      }
LABEL_137:
                      *(_WORD *)&a3[v20] = 1696;
                      v20 += 2;
                      ++v12;
                      if ((*(_DWORD *)(a2 + 580) & 0x4000000) == 0)
                      {
LABEL_97:
                        if ((*(unsigned char *)(a2 + 5) & 0x20) == 0) {
                          goto LABEL_113;
                        }
                        char v22 = *(unsigned char *)(a2 + 1132);
                        if (v22)
                        {
                          *(_WORD *)&a3[v20] = -4960;
                          v20 += 2;
                          ++v12;
                          char v22 = *(unsigned char *)(a2 + 1132);
                          if ((v22 & 2) == 0)
                          {
LABEL_100:
                            if ((v22 & 4) == 0) {
                              goto LABEL_101;
                            }
                            goto LABEL_141;
                          }
                        }
                        else if ((*(unsigned char *)(a2 + 1132) & 2) == 0)
                        {
                          goto LABEL_100;
                        }
                        *(_WORD *)&a3[v20] = -11104;
                        v20 += 2;
                        ++v12;
                        char v22 = *(unsigned char *)(a2 + 1132);
                        if ((v22 & 4) == 0)
                        {
LABEL_101:
                          if ((v22 & 8) == 0) {
                            goto LABEL_102;
                          }
                          goto LABEL_142;
                        }
LABEL_141:
                        *(_WORD *)&a3[v20] = -4704;
                        v20 += 2;
                        ++v12;
                        char v22 = *(unsigned char *)(a2 + 1132);
                        if ((v22 & 8) == 0)
                        {
LABEL_102:
                          if ((v22 & 0x20) == 0) {
                            goto LABEL_104;
                          }
                          goto LABEL_103;
                        }
LABEL_142:
                        *(_WORD *)&a3[v20] = -23904;
                        v20 += 2;
                        ++v12;
                        if ((*(unsigned char *)(a2 + 1132) & 0x20) == 0)
                        {
LABEL_104:
                          if (*(unsigned char *)(a2 + 1131))
                          {
                            *(_WORD *)&a3[v20] = -2656;
                            v20 += 2;
                            ++v12;
                          }
                          __int16 v23 = *(_WORD *)(a2 + 1144);
                          if ((v23 & 0x100) != 0)
                          {
                            *(_WORD *)&a3[v20] = -5984;
                            v20 += 2;
                            ++v12;
                            __int16 v23 = *(_WORD *)(a2 + 1144);
                            if ((v23 & 0x200) == 0)
                            {
LABEL_108:
                              if ((v23 & 0x400) == 0) {
                                goto LABEL_109;
                              }
                              goto LABEL_146;
                            }
                          }
                          else if ((*(_WORD *)(a2 + 1144) & 0x200) == 0)
                          {
                            goto LABEL_108;
                          }
                          *(_WORD *)&a3[v20] = -4192;
                          v20 += 2;
                          ++v12;
                          __int16 v23 = *(_WORD *)(a2 + 1144);
                          if ((v23 & 0x400) == 0)
                          {
LABEL_109:
                            if ((v23 & 0x80) == 0) {
                              goto LABEL_110;
                            }
                            goto LABEL_147;
                          }
LABEL_146:
                          *(_WORD *)&a3[v20] = -3936;
                          v20 += 2;
                          ++v12;
                          __int16 v23 = *(_WORD *)(a2 + 1144);
                          if ((v23 & 0x80) == 0)
                          {
LABEL_110:
                            if ((v23 & 0x40) == 0) {
                              goto LABEL_111;
                            }
                            goto LABEL_148;
                          }
LABEL_147:
                          *(_WORD *)&a3[v20] = -5216;
                          v20 += 2;
                          ++v12;
                          __int16 v23 = *(_WORD *)(a2 + 1144);
                          if ((v23 & 0x40) == 0)
                          {
LABEL_111:
                            if ((v23 & 0x20) != 0)
                            {
LABEL_112:
                              *(_WORD *)&a3[v20] = 7840;
                              v20 += 2;
                              ++v12;
                            }
LABEL_113:
                            int v24 = *(_DWORD *)(a2 + 4);
                            if ((v24 & 0x8000) != 0 && (*(_WORD *)(a2 + 1408) & 0x10) != 0)
                            {
                              *(_WORD *)&a3[v20] = 17568;
                              v20 += 2;
                              ++v12;
                              int v24 = *(_DWORD *)(a2 + 4);
                            }
                            if ((v24 & 0x10000) == 0) {
                              goto LABEL_124;
                            }
                            int v25 = *(_DWORD *)(a2 + 1536);
                            if ((v25 & 0x100) != 0)
                            {
                              *(_WORD *)&a3[v20] = 26784;
                              v20 += 2;
                              ++v12;
                              int v25 = *(_DWORD *)(a2 + 1536);
                              if ((v25 & 0x200) == 0)
                              {
LABEL_119:
                                if ((v25 & 0x40000) == 0) {
                                  goto LABEL_120;
                                }
                                goto LABEL_152;
                              }
                            }
                            else if ((v25 & 0x200) == 0)
                            {
                              goto LABEL_119;
                            }
                            *(_WORD *)&a3[v20] = -15200;
                            v20 += 2;
                            ++v12;
                            int v25 = *(_DWORD *)(a2 + 1536);
                            if ((v25 & 0x40000) == 0)
                            {
LABEL_120:
                              if ((v25 & 0x4000) == 0) {
                                goto LABEL_121;
                              }
                              goto LABEL_153;
                            }
LABEL_152:
                            *(_WORD *)&a3[v20] = -26464;
                            v20 += 2;
                            ++v12;
                            int v25 = *(_DWORD *)(a2 + 1536);
                            if ((v25 & 0x4000) == 0)
                            {
LABEL_121:
                              if ((v25 & 0x1000) == 0) {
                                goto LABEL_122;
                              }
                              goto LABEL_154;
                            }
LABEL_153:
                            *(_WORD *)&a3[v20] = -16480;
                            v20 += 2;
                            ++v12;
                            int v25 = *(_DWORD *)(a2 + 1536);
                            if ((v25 & 0x1000) == 0)
                            {
LABEL_122:
                              if ((v25 & 0x8000) == 0)
                              {
LABEL_124:
                                BOOL v10 = v12 == 0;
                                *a4 = v12;
                                *a5 = v20;
                                goto LABEL_125;
                              }
LABEL_123:
                              *(_WORD *)&a3[v20] = -6240;
                              LOBYTE(v20) = v20 + 2;
                              ++v12;
                              goto LABEL_124;
                            }
LABEL_154:
                            *(_WORD *)&a3[v20] = -29024;
                            v20 += 2;
                            ++v12;
                            if ((*(_DWORD *)(a2 + 1536) & 0x8000) == 0) {
                              goto LABEL_124;
                            }
                            goto LABEL_123;
                          }
LABEL_148:
                          *(_WORD *)&a3[v20] = -5472;
                          v20 += 2;
                          ++v12;
                          if ((*(_WORD *)(a2 + 1144) & 0x20) == 0) {
                            goto LABEL_113;
                          }
                          goto LABEL_112;
                        }
LABEL_103:
                        *(_WORD *)&a3[v20] = -3424;
                        v20 += 2;
                        ++v12;
                        goto LABEL_104;
                      }
LABEL_96:
                      *(_WORD *)&a3[v20] = -5728;
                      v20 += 2;
                      ++v12;
                      goto LABEL_97;
                    }
                  }
                  *(_WORD *)&a3[v20] = 4000;
                  v20 += 2;
                  ++v12;
                  int v21 = *(_DWORD *)(a2 + 580);
                  goto LABEL_83;
                }
LABEL_48:
                a3[v12++] = -127;
                goto LABEL_49;
              }
LABEL_43:
              a3[v12++] = 98;
              goto LABEL_44;
            }
LABEL_38:
            a3[v12++] = 91;
            goto LABEL_39;
          }
LABEL_32:
          a3[v12++] = 84;
          goto LABEL_33;
        }
LABEL_24:
        a3[v12++] = 60;
        goto LABEL_25;
      }
LABEL_18:
      a3[v12++] = 51;
      goto LABEL_19;
    }
LABEL_12:
    a3[v12++] = 42;
    goto LABEL_13;
  }
LABEL_125:
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfParams");
  return v10;
}

uint64_t sub_225A4FE04(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_NciCtxInitialize");
  if (a1)
  {
    *(void *)(a1 + 160) = 0;
    *(void *)(a1 + 3440) = 0;
    *(void *)(a1 + 3768) = 0;
    *(void *)(a1 + 3792) = 0;
    *(void *)(a1 + 3816) = 0;
    *(void *)(a1 + 4568) = 0;
    *(void *)(a1 + 4656) = 0;
    *(void *)(a1 + 4672) = 0;
    *(void *)(a1 + 4816) = 0;
    *(void *)(a1 + 4552) = 0;
    *(void *)(a1 + 4704) = 0;
    *(void *)(a1 + 184) = 0;
    *(void *)(a1 + 192) = 0;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(void *)(a1 + 288) = 0;
    *(void *)(a1 + 296) = 0;
    *(void *)(a1 + 880) = 0;
    *(void *)(a1 + 872) = 0;
    *(void *)(a1 + 4640) = 0;
    *(void *)(a1 + 4632) = 0;
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_NciCtxInitialize");
}

uint64_t sub_225A4FEBC(uint64_t a1)
{
  long long v4 = 0u;
  long long v5 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SendTxData");
  if (a1)
  {
    phOsalNfc_SetMemory();
    LODWORD(v4) = 0;
    BYTE12(v4) = *(unsigned char *)(a1 + 3984);
    *(void *)&long long v5 = *(void *)(a1 + 880);
    DWORD2(v5) = *(_DWORD *)(a1 + 888);
    uint64_t v2 = sub_225A47614(a1 + 920, (uint64_t)&v4, a1 + 3816, *(unsigned __int16 *)(a1 + 4582), (uint64_t)sub_2259A9684, a1);
  }
  else
  {
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SendTxData");
  return v2;
}

uint64_t sub_225A4FF90(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (!a2)
    {
      *(void *)(a1 + 4608) = *(void *)(a1 + 3816);
      *(_DWORD *)(a1 + 4616) = *(_DWORD *)(a1 + 3824);
    }
  }
  else
  {
    a2 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessDataRsp");
  return a2;
}

uint64_t sub_225A50010(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteDataSequence");
  if (a1)
  {
    long long v4 = *(void (**)(void, uint64_t, uint64_t))(a1 + 4632);
    *(void *)(a1 + 4632) = 0;
    *(unsigned char *)(a1 + 6491) = 0;
    if (v4) {
      v4(*(void *)(a1 + 4640), a2, a1 + 4608);
    }
    else {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"No CB registered");
    }
    *(void *)(a1 + 880) = 0;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteDataSequence");
  return a2;
}

uint64_t sub_225A500C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6)
{
  unsigned int v34 = 0;
  uint64_t v35 = a1;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  sub_2259A0FB0(0, (unsigned int *)&v35, 3u, 5u, (uint64_t)"phNciNfc_Initialise");
  sub_2259E059C(v35, &v34);
  uint64_t v11 = 0;
  char v12 = 1;
  uint64_t v13 = v35;
  do
  {
    char v14 = v12;
    if (*((void *)&unk_26ABD79B8 + 14 * v11) == v35)
    {
      int v15 = *((_DWORD *)&unk_26ABD79B8 + 28 * v11 + 2);
      if (a3) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
    char v12 = 0;
    uint64_t v11 = 1;
  }
  while ((v14 & 1) != 0);
  int v15 = 255;
  if (!a3) {
    goto LABEL_12;
  }
LABEL_7:
  if (!a2 || !v35)
  {
LABEL_12:
    uint64_t v19 = 1;
    sub_2259A0EAC(0, (unsigned int *)&v35, 3u, 1u, (uint64_t)"Invalid input parameter");
    char v17 = v34;
    BOOL v18 = v34 != 0;
    if (a5 != 1 || !v34)
    {
LABEL_14:
      if (a5 || !v18) {
        goto LABEL_30;
      }
    }
    *((void *)v17 + 430) = a3;
    *((void *)v17 + 471) = a4;
    *((void *)v17 + 474) = off_26B606990;
    *((unsigned char *)v17 + 3992) = 0;
    char v20 = sub_2259CD654(v17, off_26B606990);
    int v21 = v34;
    *((unsigned char *)v34 + 3993) = v20;
    uint64_t v19 = sub_2259A9684((uint64_t)v21, 0, 0);
    goto LABEL_30;
  }
  char v16 = v34;
  if (v34)
  {
    if (a5 != 1)
    {
      sub_2259A0EAC(0, (unsigned int *)&v35, 3u, 4u, (uint64_t)"Stack already initialized");
      char v17 = v34;
      BOOL v18 = v34 != 0;
      uint64_t v19 = 50;
      goto LABEL_14;
    }
LABEL_19:
    *((void *)v16 + 430) = a3;
    *((void *)v16 + 471) = a4;
    *((unsigned char *)v16 + 6530) = a5;
    v16[950] = 0;
    v16[1633] = v15;
    *((void *)v16 + 817) = v13;
    *((void *)v16 + 474) = off_26B606990;
    *((unsigned char *)v16 + 3992) = 0;
    char v23 = sub_2259CD654(v16, off_26B606990);
    int v24 = v34;
    uint64_t v25 = v35;
    *((unsigned char *)v34 + 3993) = v23;
    *((void *)v24 + 194) = v25;
    *((void *)v24 + 184) = 0xFFFFFFFFFFFFLL;
    *((void *)v24 + 115) = v24;
    v24[853] = v15;
    int v26 = sub_225A00D34((uint64_t)(v24 + 230));
    uint64_t v27 = v34;
    if (v26)
    {
      sub_2259A0EAC(1, v34 + 1633, 3u, 1u, (uint64_t)"phNciNfc_CoreInitialise failed!");
      phOsalNfc_FreeMemory();
      unsigned int v34 = 0;
      sub_2259E0724(v35, 0);
      sub_2259E07DC(v35, 0);
      uint64_t v19 = 255;
      goto LABEL_30;
    }
    *((void *)v34 + 476) = 0x300000003;
    v27[9] = a6;
    *((_WORD *)v27 + 20) = 0;
    *((unsigned char *)v27 + 6624) = 0;
    *((unsigned char *)v27 + 6664) = 0;
    *((_WORD *)v27 + 3334) = 0;
    *((_WORD *)v27 + 3149) = 0;
    *((void *)v27 + 611) = 0xFFFFFFFFFFFFLL;
    if (a5 == 2)
    {
      BYTE5(v33) = 2;
      uint64_t v32 = 0xF00000003;
      LODWORD(v33) = 58;
      sub_225A478A8(v27 + 230, (uint64_t)&v32, (uint64_t)sub_2259ABC6C, (uint64_t)v27);
      BYTE5(v33) = 2;
      uint64_t v32 = 3;
      LODWORD(v33) = 0;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259D64D8, (uint64_t)v34);
      BYTE5(v33) = 2;
      uint64_t v32 = 0x100000003;
      LODWORD(v33) = 33;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259ABD4C, (uint64_t)v34);
      BYTE5(v33) = 2;
      uint64_t v32 = 0x100000003;
      LODWORD(v33) = 40;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259ABDF0, (uint64_t)v34);
      BYTE5(v33) = 2;
      uint64_t v32 = 0x100000003;
      LODWORD(v33) = 35;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259ABE94, (uint64_t)v34);
      BYTE5(v33) = 2;
      uint64_t v32 = 0x100000003;
      LODWORD(v33) = 44;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259ABF84, (uint64_t)v34);
      BYTE5(v33) = 2;
      uint64_t v32 = 0x100000003;
      LODWORD(v33) = 36;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259AC028, (uint64_t)v34);
      BYTE5(v33) = 2;
      uint64_t v32 = 0x100000003;
      LODWORD(v33) = 50;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259AA2A4, (uint64_t)v34);
      BYTE5(v33) = 2;
      uint64_t v32 = 0xF00000003;
      LODWORD(v33) = 50;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259A2F50, (uint64_t)v34);
      BYTE5(v33) = 2;
      uint64_t v32 = 0xF00000003;
      LODWORD(v33) = 3;
      sub_225A478A8(v34 + 230, (uint64_t)&v32, (uint64_t)sub_2259ACFD8, (uint64_t)v34);
      uint64_t v19 = sub_2259D58C8((uint64_t)v34);
      if (!v19)
      {
        uint64_t v28 = phOsalNfc_Timer_Create();
        unint64_t v29 = v34;
        *((void *)v34 + 589) = v28;
        if (v28 == 0xFFFFFFFFFFFFLL || !v28)
        {
          sub_2259A0EAC(1, v29 + 1633, 3u, 1u, (uint64_t)"Notification Timer Create failed!!");
          uint64_t v19 = 12;
          goto LABEL_29;
        }
        sub_2259A0EAC(1, v29 + 1633, 3u, 4u, (uint64_t)"Notification Timer Created Successfully");
        uint64_t v31 = sub_225A47AEC((uint64_t)(v34 + 230), 255);
        if (!v31)
        {
          uint64_t v19 = 13;
          goto LABEL_30;
        }
        uint64_t v19 = v31;
        sub_2259A0EAC(1, v34 + 1633, 3u, 1u, (uint64_t)"Failed to Udpate Control Packet size");
      }
    }
    else
    {
      uint64_t v19 = sub_2259A9684((uint64_t)v27, 0, 0);
    }
    if (v19 == 13) {
      goto LABEL_30;
    }
LABEL_29:
    sub_2259A0EAC(1, v34 + 1633, 3u, 2u, (uint64_t)"Init Sequence failed!");
    sub_225A50894((uint64_t)v34);
    sub_225A0113C(v34);
    unsigned int v34 = 0;
    goto LABEL_30;
  }
  char v22 = (unsigned int *)sub_225A50680(v35);
  unsigned int v34 = v22;
  if (v22)
  {
    char v16 = v22;
    uint64_t v13 = v35;
    goto LABEL_19;
  }
  uint64_t v19 = 0;
LABEL_30:
  sub_2259A10B4(0, (unsigned int *)&v35, 3u, 5u, (uint64_t)"phNciNfc_Initialise");
  return v19;
}

uint64_t sub_225A50680(uint64_t a1)
{
  uint64_t v15 = a1;
  uint64_t v14 = 0;
  sub_2259A0FB0(0, (unsigned int *)&v15, 3u, 5u, (uint64_t)"phNciNfc_InitContext");
  int v1 = sub_2259E059C(v15, &v14);
  uint64_t v2 = 0;
  unsigned int v13 = 255;
  char v3 = 1;
  while (1)
  {
    char v4 = v3;
    if (*((void *)&unk_26ABD79B8 + 14 * v2) == v15) {
      break;
    }
    char v3 = 0;
    uint64_t v2 = 1;
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
  }
  unsigned int v13 = *((_DWORD *)&unk_26ABD79B8 + 28 * v2 + 2);
LABEL_6:
  if (!v1 && v14) {
    goto LABEL_19;
  }
  if (v1 || v14)
  {
    int v7 = "Failed to retrieve NCI Context";
    char v6 = (unsigned int *)&v15;
    LODWORD(Memory) = 0;
LABEL_18:
    sub_2259A0EAC(Memory, v6, 3u, 1u, (uint64_t)v7);
    goto LABEL_19;
  }
  uint64_t Memory = phOsalNfc_GetMemory();
  uint64_t v14 = Memory;
  if (!Memory)
  {
    int v7 = "Failed to allocate memory, insufficient resuorces";
    char v6 = (unsigned int *)&v15;
    goto LABEL_18;
  }
  sub_2259D7054(1, &v13, 3u, 4u, (uint64_t)"####DriverHandle");
  sub_2259D7054(1, &v13, 3u, 4u, (uint64_t)"####NCI context");
  sub_2259D7054(1, &v13, 3u, 4u, (uint64_t)"####NCI CORE Context");
  if (sub_2259E0724(v15, v14))
  {
    char v6 = (unsigned int *)(v14 + 6532);
    int v7 = "Failed to assign NCI context to INFRA layer";
LABEL_17:
    LODWORD(Memory) = 1;
    goto LABEL_18;
  }
  phOsalNfc_SetMemory();
  uint64_t v8 = v14;
  *(_DWORD *)(v14 + 6532) = v13;
  sub_225A4FE04(v8);
  uint64_t v9 = v15;
  uint64_t v10 = v14;
  *(void *)(v14 + 6536) = v15;
  *(void *)(v10 + 920) = v10;
  if (sub_2259E07DC(v9, v10 + 920))
  {
    int v7 = "Failed to assign NCI CORE context to INFRA layer";
    char v6 = &v13;
    goto LABEL_17;
  }
  if (v15)
  {
    uint64_t v12 = v14;
    *(void *)(v14 + 1552) = v15;
    *(_DWORD *)(v12 + 3412) = v13;
  }
LABEL_19:
  sub_2259A10B4(0, (unsigned int *)&v15, 3u, 5u, (uint64_t)"phNciNfc_InitContext");
  return v14;
}

uint64_t sub_225A50894(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FreeSendPayloadBuff");
  if (*(void *)(a1 + 880))
  {
    phOsalNfc_FreeMemory();
    *(void *)(a1 + 880) = 0;
    *(void *)(a1 + 872) = 0;
    *(_DWORD *)(a1 + 888) = 0;
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FreeSendPayloadBuff");
}

unsigned int *sub_225A50914(uint64_t a1)
{
  long long v5 = 0;
  int v1 = sub_2259E059C(a1, &v5);
  uint64_t v2 = v5;
  if (v5) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    sub_2259A0EAC(2, v5, 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
    return v5;
  }
  return v2;
}

uint64_t sub_225A5096C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ReInitialise");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 3440) = a2;
      *(void *)(a1 + 3768) = a3;
      *(_DWORD *)(a1 + 36) = 0;
      *(_WORD *)(a1 + 40) = 256;
      *(void *)(a1 + 1472) = 0xFFFFFFFFFFFFLL;
      sub_225A1B338(a1);
      *(unsigned char *)(a1 + 6300) = 0;
      *(_WORD *)(a1 + 4824) = 0;
      *(void *)(a1 + 3792) = off_26B606990;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606990);
      uint64_t v6 = sub_2259A9684(a1, 0, 0);
      if (v6 != 13) {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Re-Initialize Sequence failed!");
      }
    }
    else
    {
      uint64_t v6 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Stack not initialized");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ReInitialise");
  return v6;
}

uint64_t sub_225A50AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetFwInterfaceVersion");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
      *(void *)(a1 + 3440) = a2;
      *(void *)(a1 + 3768) = a3;
      *(void *)(a1 + 3792) = off_26B6069C0;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6069C0);
      uint64_t v6 = sub_2259A9684(a1, 0, 0);
      if (v6 != 13)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Get FW interface version Sequence failed!");
        *(void *)(a1 + 880) = 0;
        *(_DWORD *)(a1 + 888) = 0;
      }
    }
    else
    {
      uint64_t v6 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_GetFwInterfaceVersion)\n");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_GetFwInterfaceVersion)\n");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetFwInterfaceVersion");
  return v6;
}

uint64_t sub_225A50BE8(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StartDiscovery");
  if (a1)
  {
    if (a2 && a3)
    {
      *(_DWORD *)(a1 + 172) = 0;
      sub_2259B3298(a1);
      int v8 = (a2[2] & 1) + (*a2 & 1) + (a2[4] & 1) + (a2[12] & 1) + (a2[14] & 1);
      unsigned int v9 = (char)a2[18];
      if ((v9 & 0x80000000) != 0)
      {
        int v11 = v8 + 1;
      }
      else
      {
        unint64_t v10 = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v9) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
        LOWORD(v10) = vaddv_s16((int16x4_t)v10);
        int v11 = v10 + (v9 & 1) + v8;
      }
      int v13 = ((v9 >> 6) & 1) + (a2[10] & 1) + (a2[6] & 1) + (a2[8] & 1) + ((v9 >> 5) & 1) + v11;
      phOsalNfc_MemCopy();
      *(unsigned char *)(a1 + 168) = (2 * v13) | 1;
      if (*(void *)(a1 + 160)) {
        phOsalNfc_FreeMemory();
      }
      *(void *)(a1 + 160) = 0;
      uint64_t Memory = phOsalNfc_GetMemory();
      *(void *)(a1 + 160) = Memory;
      if (Memory)
      {
        uint64_t v15 = sub_2259B3A4C(a1, a2);
        if (v15)
        {
          uint64_t v12 = v15;
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 160) = 0;
          *(void *)(a1 + 3440) = 0;
          *(void *)(a1 + 3768) = 0;
        }
        else
        {
          **(unsigned char **)(a1 + 160) = v13;
          *(void *)(a1 + 3440) = a3;
          *(void *)(a1 + 3768) = a4;
          *(void *)(a1 + 3792) = off_26B6066A0;
          *(unsigned char *)(a1 + 3992) = 0;
          *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6066A0);
          uint64_t v12 = sub_2259B2D3C(a1, 0, 0);
        }
      }
      else
      {
        uint64_t v12 = 12;
      }
    }
    else
    {
      uint64_t v12 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid input parameter");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Nci stack not initialized");
    uint64_t v12 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StartDiscovery");
  return v12;
}

uint64_t sub_225A50E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_StartDiscovery");
  if (a1)
  {
    if (a2)
    {
      uint64_t Memory = phOsalNfc_GetMemory();
      if (Memory)
      {
        int v7 = (unsigned char *)Memory;
        sub_225A01098(a1);
        *(unsigned char *)(a1 + 4544) = 1;
        *int v7 = 1;
        *(void *)(a1 + 880) = v7;
        *(_DWORD *)(a1 + 888) = 1;
        *(void *)(a1 + 3440) = a2;
        *(void *)(a1 + 3768) = a3;
        *(void *)(a1 + 3792) = off_26B6085E0;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6085E0);
        uint64_t v8 = sub_2259FD7F8(a1, 0, 0);
        if (v8 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Nfcee Discover Sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Nfcee_StartDiscovery)\n");
        uint64_t v8 = 12;
      }
    }
    else
    {
      uint64_t v8 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid upper call back function (phNciNfc_Nfcee_StartDiscovery)\n");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Nfcee_StartDiscovery)\n");
    uint64_t v8 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_StartDiscovery");
  return v8;
}

uint64_t sub_225A50FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_StopDiscovery");
  if (a1)
  {
    if (a2)
    {
      uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
      if (Memory)
      {
        *(unsigned char *)(a1 + 4544) = 0;
        *uint64_t Memory = 0;
        *(void *)(a1 + 880) = Memory;
        *(_DWORD *)(a1 + 888) = 1;
        *(void *)(a1 + 3440) = a2;
        *(void *)(a1 + 3768) = a3;
        *(void *)(a1 + 3792) = off_26B6085E0;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6085E0);
        uint64_t v7 = sub_2259FD7F8(a1, 0, 0);
        if (v7 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Nfcee Discover Sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Nfcee_StopDiscovery)\n");
        uint64_t v7 = 12;
      }
    }
    else
    {
      uint64_t v7 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid upper call back function (phNciNfc_Nfcee_StopDiscovery)\n");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Nfcee_StopDiscovery)\n");
    uint64_t v7 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_StopDiscovery");
  return v7;
}

uint64_t sub_225A51154(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_ModeSet");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Nfcee_ModeSet)\n");
    uint64_t v10 = 49;
    goto LABEL_14;
  }
  if (a3 > 1 || !a4)
  {
    uint64_t v10 = 1;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_Nfcee_ModeSet)\n");
    goto LABEL_14;
  }
  if (!a2)
  {
    uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
    if (Memory)
    {
      *(_DWORD *)(a1 + 4004) = a3;
      *(void *)(a1 + 4008) = 0;
      *uint64_t Memory = 0;
      Memory[1] = a3;
      *(void *)(a1 + 880) = Memory;
      *(_DWORD *)(a1 + 888) = 2;
      *(void *)(a1 + 3440) = a4;
      *(void *)(a1 + 3768) = a5;
      *(void *)(a1 + 3792) = off_26B6085C0;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6085C0);
      uint64_t v10 = sub_2259FDE88(a1, 0, 0);
      if (v10 == 13) {
        goto LABEL_14;
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Nfcee ModeSet Sequence failed!");
LABEL_22:
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 880) = 0;
      goto LABEL_14;
    }
    uint64_t v15 = (unsigned int *)(a1 + 6532);
LABEL_20:
    sub_2259A0EAC(1, v15, 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Nfcee_ModeSet)\n");
    uint64_t v10 = 12;
    goto LABEL_14;
  }
  uint64_t v10 = 1;
  if (!*(unsigned char *)(a2 + 1) || *(unsigned __int8 *)(a2 + 1) == 255) {
    goto LABEL_14;
  }
  int v11 = (unsigned char *)phOsalNfc_GetMemory();
  if (!v11)
  {
    uint64_t v15 = (unsigned int *)(a1 + 6532);
    goto LABEL_20;
  }
  *(_DWORD *)(a1 + 4004) = a3;
  *(void *)(a1 + 4008) = a2;
  *int v11 = *(unsigned char *)(a2 + 1);
  v11[1] = a3;
  *(void *)(a1 + 880) = v11;
  *(_DWORD *)(a1 + 888) = 2;
  *(unsigned char *)(a1 + 6488) = 0;
  *(void *)(a1 + 3792) = off_26B6085C0;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6085C0);
  uint64_t v12 = sub_2259FDE88(a1, 0, 0);
  if (v12 != 13)
  {
    uint64_t v10 = v12;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Nfcee ModeSet Sequence failed!");
    goto LABEL_22;
  }
  *(void *)(a1 + 3440) = a4;
  *(void *)(a1 + 3768) = a5;
  if (a3 == 1 && *(unsigned char *)(a2 + 1) == 1)
  {
    *(void *)(a1 + 800) = 0;
    *(void *)(a1 + 808) = 0;
  }
  else
  {
    *(void *)(a1 + 800) = a4;
    *(void *)(a1 + 808) = a5;
  }
  uint64_t v10 = 13;
LABEL_14:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_ModeSet");
  return v10;
}

uint64_t sub_225A51404(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetPowerMode");
  if (a1)
  {
    if (a3)
    {
      uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
      if (Memory)
      {
        *(_DWORD *)(a1 + 3420) = a2;
        *uint64_t Memory = a2;
        *(void *)(a1 + 880) = Memory;
        *(_DWORD *)(a1 + 888) = 1;
        *(void *)(a1 + 3440) = a3;
        *(void *)(a1 + 3768) = a4;
        *(void *)(a1 + 3792) = off_26B606A20;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606A20);
        uint64_t v9 = sub_2259D5834(a1, 0, 0);
        if (v9 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Set/Reset Standby mode Sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_SetPowerMode)\n");
        uint64_t v9 = 12;
      }
    }
    else
    {
      uint64_t v9 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_SetPowerMode)\n");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_SetPowerMode)\n");
    uint64_t v9 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetPowerMode");
  return v9;
}

uint64_t sub_225A51598(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PropConfigHsuBr");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_SetPowerMode)\n");
    uint64_t v9 = 49;
    goto LABEL_11;
  }
  if (!a3)
  {
    uint64_t v10 = "Invalid parameter passed(phNciNfc_SetPowerMode)\n";
    uint64_t v9 = 1;
    int v11 = 2;
    uint64_t v12 = (unsigned int *)a1;
LABEL_10:
    sub_2259A0EAC(v11, v12, 3u, 1u, (uint64_t)v10);
    goto LABEL_11;
  }
  uint64_t Memory = phOsalNfc_GetMemory();
  *(void *)(a1 + 4832) = Memory;
  if (!Memory)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Memory not available(Config HSU Br)\n");
    uint64_t v9 = 12;
    goto LABEL_11;
  }
  if (a2 > 9)
  {
    uint64_t v10 = "Invalid Baud rate";
    uint64_t v9 = 1;
    int v11 = 1;
    uint64_t v12 = (unsigned int *)(a1 + 6532);
    goto LABEL_10;
  }
  phOsalNfc_MemCopy();
  *(void *)(a1 + 880) = *(void *)(a1 + 4832);
  *(_DWORD *)(a1 + 888) = 8;
  *(void *)(a1 + 3440) = a3;
  *(void *)(a1 + 3768) = a4;
  *(void *)(a1 + 3792) = off_26B606A40;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606A40);
  uint64_t v9 = sub_2259A9684(a1, 0, 0);
  if (v9 != 13)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Configure HSU BR Sequence failed!");
    phOsalNfc_FreeMemory();
    *(void *)(a1 + 880) = 0;
  }
LABEL_11:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PropConfigHsuBr");
  return v9;
}

uint64_t sub_225A517A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetMultiTagInfo");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 3440) = a2;
      *(void *)(a1 + 3768) = a3;
      *(void *)(a1 + 3792) = off_26B606A60;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606A60);
      uint64_t v6 = sub_2259A9684(a1, 0, 0);
      if (v6 != 13) {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Get Multi tag Info Sequence failed!");
      }
    }
    else
    {
      uint64_t v6 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_GetMultiTagInfo)\n");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_GetMultiTagInfo)\n");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetMultiTagInfo");
  return v6;
}

uint64_t sub_225A518C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ClrMultiTagInfo");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 3440) = a2;
      *(void *)(a1 + 3768) = a3;
      *(void *)(a1 + 3792) = off_26B606A80;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606A80);
      uint64_t v6 = sub_2259A9684(a1, 0, 0);
      if (v6 != 13) {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Clear Multi tag List Sequence failed!");
      }
    }
    else
    {
      uint64_t v6 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_PropConfigClrMultiTag)\n");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_PropConfigClrMultiTag)\n");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ClrMultiTagInfo");
  return v6;
}

uint64_t sub_225A519E4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RegisterNotification");
  if (a1)
  {
    if (a3)
    {
      uint64_t v8 = 0;
      switch(a2)
      {
        case 1:
          uint64_t v8 = 0;
          *(void *)(a1 + 208) = a4;
          *(void *)(a1 + 216) = a3;
          break;
        case 2:
          uint64_t v8 = 0;
          *(void *)(a1 + 224) = a4;
          *(void *)(a1 + 232) = a3;
          break;
        case 3:
          uint64_t v8 = 0;
          *(void *)(a1 + 184) = a4;
          *(void *)(a1 + 192) = a3;
          break;
        case 4:
          uint64_t v8 = 0;
          *(void *)(a1 + 240) = a4;
          *(void *)(a1 + 248) = a3;
          break;
        case 5:
          uint64_t v8 = 0;
          *(void *)(a1 + 272) = a4;
          *(void *)(a1 + 280) = a3;
          break;
        case 7:
          uint64_t v8 = 0;
          *(void *)(a1 + 288) = a4;
          *(void *)(a1 + 296) = a3;
          break;
        case 8:
          uint64_t v8 = 0;
          *(void *)(a1 + 304) = a4;
          *(void *)(a1 + 312) = a3;
          break;
        case 9:
          uint64_t v8 = 0;
          *(void *)(a1 + 320) = a4;
          *(void *)(a1 + 328) = a3;
          break;
        case 10:
          uint64_t v8 = 0;
          *(void *)(a1 + 384) = a4;
          *(void *)(a1 + 392) = a3;
          break;
        case 11:
          uint64_t v8 = 0;
          *(void *)(a1 + 256) = a4;
          *(void *)(a1 + 264) = a3;
          break;
        case 12:
          uint64_t v8 = 0;
          *(void *)(a1 + 400) = a4;
          *(void *)(a1 + 408) = a3;
          break;
        case 13:
          uint64_t v8 = 0;
          *(void *)(a1 + 416) = a4;
          *(void *)(a1 + 424) = a3;
          break;
        case 14:
          uint64_t v8 = 0;
          *(void *)(a1 + 432) = a4;
          *(void *)(a1 + 440) = a3;
          break;
        case 16:
          uint64_t v8 = 0;
          *(void *)(a1 + 464) = a4;
          *(void *)(a1 + 472) = a3;
          break;
        case 17:
          uint64_t v8 = 0;
          *(void *)(a1 + 480) = a4;
          *(void *)(a1 + 488) = a3;
          break;
        case 18:
          uint64_t v8 = 0;
          *(void *)(a1 + 520) = a3;
          *(void *)(a1 + 512) = a4;
          break;
        case 19:
          uint64_t v8 = 0;
          *(void *)(a1 + 552) = a3;
          *(void *)(a1 + 544) = a4;
          break;
        case 20:
          uint64_t v8 = 0;
          *(void *)(a1 + 568) = a3;
          *(void *)(a1 + 560) = a4;
          break;
        case 21:
          uint64_t v8 = 0;
          *(void *)(a1 + 584) = a3;
          *(void *)(a1 + 576) = a4;
          break;
        case 23:
          uint64_t v8 = 0;
          *(void *)(a1 + 336) = a4;
          *(void *)(a1 + 344) = a3;
          break;
        case 24:
          uint64_t v8 = 0;
          *(void *)(a1 + 368) = a4;
          *(void *)(a1 + 376) = a3;
          break;
        case 26:
          uint64_t v8 = 0;
          *(void *)(a1 + 536) = a3;
          *(void *)(a1 + 528) = a4;
          break;
        case 27:
          uint64_t v8 = 0;
          *(void *)(a1 + 496) = a4;
          *(void *)(a1 + 504) = a3;
          break;
        case 28:
          uint64_t v8 = 0;
          *(void *)(a1 + 632) = a3;
          *(void *)(a1 + 624) = a4;
          break;
        case 29:
          uint64_t v8 = 0;
          *(void *)(a1 + 352) = a4;
          *(void *)(a1 + 360) = a3;
          break;
        case 30:
          uint64_t v8 = 0;
          *(void *)(a1 + 648) = a3;
          *(void *)(a1 + 640) = a4;
          break;
        case 31:
          uint64_t v8 = 0;
          *(void *)(a1 + 728) = a3;
          *(void *)(a1 + 720) = a4;
          break;
        case 32:
          uint64_t v8 = 0;
          *(void *)(a1 + 664) = a3;
          *(void *)(a1 + 656) = a4;
          break;
        case 33:
          uint64_t v8 = 0;
          *(void *)(a1 + 744) = a3;
          *(void *)(a1 + 736) = a4;
          break;
        case 34:
          uint64_t v8 = 0;
          *(void *)(a1 + 672) = a3;
          *(void *)(a1 + 680) = a4;
          break;
        case 35:
          uint64_t v8 = 0;
          *(void *)(a1 + 696) = a3;
          *(void *)(a1 + 688) = a4;
          break;
        case 36:
          uint64_t v8 = 0;
          *(void *)(a1 + 712) = a3;
          *(void *)(a1 + 704) = a4;
          break;
        default:
          break;
      }
    }
    else
    {
      uint64_t v8 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid input parameter");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Nci stack not initialized");
    uint64_t v8 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RegisterNotification");
  return v8;
}

uint64_t sub_225A51D20(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_NfccRegNtfBeforeNciResetCmd");
  if (a1)
  {
    if (a3)
    {
      uint64_t v8 = 1;
      switch(a2)
      {
        case 4:
          uint64_t v8 = 0;
          *(void *)(a1 + 240) = a4;
          *(void *)(a1 + 248) = a3;
          break;
        case 5:
          uint64_t v8 = 0;
          *(void *)(a1 + 272) = a4;
          *(void *)(a1 + 280) = a3;
          break;
        case 9:
          uint64_t v8 = 0;
          *(void *)(a1 + 320) = a4;
          *(void *)(a1 + 328) = a3;
          break;
        case 14:
          uint64_t v8 = 0;
          *(void *)(a1 + 432) = a4;
          *(void *)(a1 + 440) = a3;
          break;
        case 15:
          uint64_t v8 = 0;
          *(void *)(a1 + 448) = a4;
          *(void *)(a1 + 456) = a3;
          break;
        case 19:
          uint64_t v8 = 0;
          *(void *)(a1 + 552) = a3;
          *(void *)(a1 + 544) = a4;
          break;
        case 20:
          uint64_t v8 = 0;
          *(void *)(a1 + 568) = a3;
          *(void *)(a1 + 560) = a4;
          break;
        case 22:
          uint64_t v8 = 0;
          *(void *)(a1 + 600) = a3;
          *(void *)(a1 + 592) = a4;
          break;
        case 23:
          uint64_t v8 = 0;
          *(void *)(a1 + 336) = a4;
          *(void *)(a1 + 344) = a3;
          break;
        case 25:
          uint64_t v8 = 0;
          *(void *)(a1 + 616) = a3;
          *(void *)(a1 + 608) = a4;
          break;
        case 29:
          uint64_t v8 = 0;
          *(void *)(a1 + 352) = a4;
          *(void *)(a1 + 360) = a3;
          break;
        case 30:
          uint64_t v8 = 0;
          *(void *)(a1 + 648) = a3;
          *(void *)(a1 + 640) = a4;
          break;
        case 31:
          uint64_t v8 = 0;
          *(void *)(a1 + 728) = a3;
          *(void *)(a1 + 720) = a4;
          break;
        case 32:
          uint64_t v8 = 0;
          *(void *)(a1 + 664) = a3;
          *(void *)(a1 + 656) = a4;
          break;
        case 33:
          uint64_t v8 = 0;
          *(void *)(a1 + 744) = a3;
          *(void *)(a1 + 736) = a4;
          break;
        default:
          break;
      }
    }
    else
    {
      uint64_t v8 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid input parameter");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Nci stack not initialized");
    uint64_t v8 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_NfccRegNtfBeforeNciResetCmd");
  return v8;
}

uint64_t sub_225A51F64(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Connect");
  if (a1)
  {
    if (a2 && a4 && *(unsigned char *)(a2 + 8) && *(unsigned __int8 *)(a2 + 8) != 255)
    {
      uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
      if (Memory)
      {
        *uint64_t Memory = *(unsigned char *)(a2 + 8);
        Memory[1] = *(_DWORD *)(a2 + 16);
        Memory[2] = a3;
        *(void *)(a1 + 160) = Memory;
        *(unsigned char *)(a1 + 168) = 3;
        *(void *)(a1 + 3440) = a4;
        *(void *)(a1 + 3768) = a5;
        *(void *)(a1 + 3792) = off_26B6066C0;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6066C0);
        uint64_t v10 = sub_2259B2DD0(a1, 0, 0);
        if (v10 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Connect Sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 160) = 0;
          *(void *)(a1 + 3440) = 0;
          *(void *)(a1 + 3768) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Connect)\n");
        uint64_t v10 = 12;
      }
    }
    else
    {
      uint64_t v10 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_Connect)\n");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Connect)\n");
    uint64_t v10 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Connect");
  return v10;
}

uint64_t sub_225A52124(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Deactivate");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_InterfaceDeactivate)\n");
    uint64_t v11 = 49;
    goto LABEL_14;
  }
  if (!a3)
  {
    uint64_t v11 = 1;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameter passed (phNciNfc_InterfaceDeactivate)\n");
    goto LABEL_14;
  }
  *(_WORD *)(a1 + 3376) = 0;
  uint64_t Memory = phOsalNfc_GetMemory();
  if (!Memory)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Deactivate)\n");
    uint64_t v11 = 12;
    goto LABEL_14;
  }
  uint64_t v9 = (unsigned char *)Memory;
  *(void *)(a1 + 3440) = a3;
  *(void *)(a1 + 3768) = a4;
  uint64_t v10 = sub_2259B2FA0(a1, a1 + 48, a2, (int *)(a1 + 172));
  if (v10)
  {
    uint64_t v11 = v10;
LABEL_6:
    phOsalNfc_FreeMemory();
    *(void *)(a1 + 880) = 0;
    *(_DWORD *)(a1 + 888) = 0;
    goto LABEL_14;
  }
  *(unsigned char *)(a1 + 6666) = 0;
  if (*(void *)(a1 + 4656))
  {
    phOsalNfc_FreeMemory();
    *(void *)(a1 + 4656) = 0;
  }
  sub_2259B31C0((unsigned int *)a1, a1 + 48);
  *(_DWORD *)(a1 + 172) = a2;
  unsigned char *v9 = a2;
  *(void *)(a1 + 880) = v9;
  *(_DWORD *)(a1 + 888) = 1;
  sub_2259B0CA4((unsigned int *)(a1 + 920), 0);
  *(void *)(a1 + 3792) = off_26B6066E0;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6066E0);
  uint64_t v11 = sub_2259B2CA8(a1, 0, 0);
  if (v11 != 13 && *(void *)(a1 + 880)) {
    goto LABEL_6;
  }
LABEL_14:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Deactivate");
  return v11;
}

uint64_t sub_225A522FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int16 v20 = 0;
  unsigned __int8 v19 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRfParameters");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v9 = 49;
    goto LABEL_23;
  }
  if (!a2 || !a3)
  {
    uint64_t v11 = (unsigned int *)(a1 + 6532);
    uint64_t v12 = "Invalid parameters";
    uint64_t v9 = 1;
LABEL_8:
    sub_2259A0EAC(1, v11, 3u, 1u, (uint64_t)v12);
    goto LABEL_23;
  }
  uint64_t v8 = sub_225A4985C((unsigned int *)a1, a2, &v20, &v19);
  if (v8)
  {
    uint64_t v9 = v8;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Set Config parameter validation failed!");
    int v10 = 0;
  }
  else
  {
    int v10 = (unsigned __int16)(v20 + 2 * v19 + 1);
    uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
    *(void *)(a1 + 4832) = Memory;
    if (!Memory)
    {
      uint64_t v14 = (void *)(a1 + 4832);
      uint64_t v9 = 255;
      goto LABEL_20;
    }
    *uint64_t Memory = v19;
    uint64_t v9 = sub_225A4B46C((unsigned int *)a1, a2, *(void *)(a1 + 4832), v10);
  }
  uint64_t v14 = (void *)(a1 + 4832);
  uint64_t v15 = *(void *)(a1 + 4832);
  if (v9 == 1)
  {
    char v16 = (unsigned int *)(a1 + 6532);
    if (v15)
    {
      char v17 = "Build Set config command payload failed!";
      uint64_t v9 = 1;
LABEL_22:
      sub_2259A0EAC(1, v16, 3u, 1u, (uint64_t)v17);
      phOsalNfc_FreeMemory();
      *uint64_t v14 = 0;
      goto LABEL_23;
    }
    uint64_t v12 = "Input parameter validation failed!";
    uint64_t v9 = 1;
    uint64_t v11 = (unsigned int *)(a1 + 6532);
    goto LABEL_8;
  }
  if (!v9 && v15)
  {
    *(void *)(a1 + 3440) = a3;
    *(void *)(a1 + 3768) = a4;
    *(void *)(a1 + 3792) = off_26B609948;
    *(unsigned char *)(a1 + 3992) = 0;
    *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609948);
    *(void *)(a1 + 880) = *(void *)(a1 + 4832);
    *(_DWORD *)(a1 + 888) = v10;
    uint64_t v9 = sub_225A49154(a1, 0, 0);
    if (v9 != 13)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Set Config Sequence failed!");
      sub_225A50894(a1);
    }
    goto LABEL_23;
  }
LABEL_20:
  char v16 = (unsigned int *)(a1 + 6532);
  sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Memory allocation for Set Config Cmd payload failed!");
  if (*(void *)(a1 + 4832))
  {
    char v17 = "Freeing payload memory as Building Set Config payload failed!";
    goto LABEL_22;
  }
LABEL_23:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRfParameters");
  return v9;
}

uint64_t sub_225A52594(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRaw");
  if (a1)
  {
    if (a2 && a3)
    {
      uint64_t Memory = phOsalNfc_GetMemory();
      *(void *)(a1 + 880) = Memory;
      if (Memory)
      {
        phOsalNfc_MemCopy();
        *(void *)(a1 + 3440) = a4;
        *(void *)(a1 + 3768) = a5;
        *(void *)(a1 + 3792) = off_26B609988;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609988);
        *(_DWORD *)(a1 + 888) = a3;
        uint64_t v11 = sub_225A49154(a1, 0, 0);
        if (v11 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Get Config Raw Sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Get Config Raw - memory allocation failed");
        uint64_t v11 = 31;
      }
    }
    else
    {
      uint64_t v11 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v11 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRaw");
  return v11;
}

uint64_t sub_225A5272C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTransitionValue");
  if (a1)
  {
    if (a2 && a3 == 2)
    {
      *(void *)(a1 + 880) = phOsalNfc_GetMemory();
      phOsalNfc_MemCopy();
      *(void *)(a1 + 3440) = a4;
      *(void *)(a1 + 3768) = a5;
      *(void *)(a1 + 3792) = off_26B609A28;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609A28);
      *(_DWORD *)(a1 + 888) = 2;
      uint64_t v10 = sub_225A49154(a1, 0, 0);
      if (v10 != 13)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Get transition Sequence failed!");
        phOsalNfc_FreeMemory();
        *(_DWORD *)(a1 + 888) = 0;
        *(void *)(a1 + 880) = 0;
      }
    }
    else
    {
      uint64_t v10 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v10 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTransitionValue");
  return v10;
}

uint64_t sub_225A528A0(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ConfigMapping");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v12 = 49;
    goto LABEL_16;
  }
  if (!a3 || !a4)
  {
    uint64_t v12 = 1;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters");
    goto LABEL_16;
  }
  if (!a2)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"No entries");
    goto LABEL_13;
  }
  if (sub_225A4943C((unsigned int *)a1, a2, a3))
  {
LABEL_13:
    int v13 = (unsigned int *)(a1 + 6532);
    uint64_t v14 = "Parameter validation failed";
LABEL_14:
    sub_2259A0EAC(1, v13, 3u, 1u, (uint64_t)v14);
    goto LABEL_15;
  }
  if (sub_225A49694(a1, a2))
  {
LABEL_15:
    uint64_t v12 = 255;
    goto LABEL_16;
  }
  uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
  if (!Memory)
  {
    uint64_t v14 = "Memory allcation for command payload failed";
    int v13 = (unsigned int *)(a1 + 6532);
    goto LABEL_14;
  }
  uint64_t v11 = Memory;
  sub_225A4977C((unsigned int *)a1, Memory, a2, (uint64_t)a3);
  *(void *)(a1 + 3440) = a4;
  *(void *)(a1 + 3768) = a5;
  *(void *)(a1 + 3792) = off_26B6099A8;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6099A8);
  *(void *)(a1 + 880) = v11;
  *(_DWORD *)(a1 + 888) = 3 * a2 + 1;
  uint64_t v12 = sub_225A49280(a1, 0, 0);
  if (v12 != 13)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Config Mapping Sequence failed!");
    sub_225A50894(a1);
  }
LABEL_16:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ConfigMapping");
  return v12;
}

uint64_t sub_225A52AA8(uint64_t a1, unsigned int a2, int *a3)
{
  memset(v12, 0, sizeof(v12));
  unsigned __int16 v11 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_VerifyRtngTableConfig");
  if (a1)
  {
    if (!a3)
    {
      uint64_t v6 = (unsigned int *)(a1 + 6532);
      uint64_t v7 = "Invalid parameters";
      goto LABEL_8;
    }
    if (!a2)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"No entries");
      uint64_t v8 = 255;
      goto LABEL_13;
    }
    if (sub_225A4C274((unsigned int *)a1, a2, a3, &v11))
    {
      uint64_t v6 = (unsigned int *)(a1 + 6532);
      uint64_t v7 = "Input parameter validation failed";
LABEL_8:
      uint64_t v8 = 1;
LABEL_9:
      sub_2259A0EAC(1, v6, 3u, 1u, (uint64_t)v7);
      goto LABEL_13;
    }
    if (v11 > *(unsigned __int16 *)(a1 + 14))
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Input Routing config size exceeds Max routing table size                                     supported by NFCC");
      uint64_t v8 = 139;
      goto LABEL_13;
    }
    uint64_t v10 = sub_225A52C58(a1, (uint64_t)v12);
    if (v10)
    {
      uint64_t v8 = v10;
      uint64_t v6 = (unsigned int *)(a1 + 6532);
      uint64_t v7 = "Failed to get NFCC features!";
      goto LABEL_9;
    }
    uint64_t v8 = sub_225A4C91C((unsigned int *)a1, (uint64_t)v12, a2, (uint64_t)a3);
    if (!v8)
    {
      *(unsigned char *)(a1 + 898) = a2;
      *(void *)(a1 + 4704) = a3;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v8 = 49;
  }
LABEL_13:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_VerifyRtngTableConfig");
  return v8;
}

uint64_t sub_225A52C58(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNfccFeatures");
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = 0;
      char v5 = *(unsigned char *)a2 & 0xFB | (4 * (*(unsigned char *)a1 & 1));
      *(unsigned char *)a2 = v5;
      *(unsigned char *)a2 = v5 & 0xFC | (*(unsigned char *)a1 >> 1) & 3;
      int v6 = *(unsigned char *)(a2 + 4) & 0xFB | (4 * ((*(unsigned __int8 *)(a1 + 1) >> 1) & 1));
      *(unsigned char *)(a2 + 4) = v6;
      unsigned int v7 = v6 & 0xFFFFFFFD | (2 * ((*(unsigned __int8 *)(a1 + 1) >> 2) & 1));
      *(unsigned char *)(a2 + 4) = v7;
      *(unsigned char *)(a2 + 4) = v7 & 0xFE | ((*(unsigned char *)(a1 + 1) & 8) != 0);
      LOBYTE(v7) = *(unsigned char *)(a2 + 8) & 0xFD | (2 * (*(unsigned char *)(a1 + 2) & 1));
      *(unsigned char *)(a2 + 8) = v7;
      *(unsigned char *)(a2 + 8) = v7 & 0xFE | ((*(unsigned char *)(a1 + 2) & 2) != 0);
      *(_DWORD *)(a2 + 12) = *(_DWORD *)(a1 + 21);
      *(unsigned char *)(a2 + 16) = *(unsigned char *)(a1 + 25);
      *(unsigned char *)(a2 + 17) = *(unsigned char *)(a1 + 28);
      *(unsigned char *)(a2 + 18) = *(unsigned char *)(a1 + 3);
      *(_WORD *)(a2 + 20) = *(_WORD *)(a1 + 14) - 5;
    }
    else
    {
      uint64_t v4 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid input parameters!");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v4 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNfccFeatures");
  return v4;
}

uint64_t sub_225A52DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngTableConfig");
  if (a1)
  {
    if (a2)
    {
      if (*(_WORD *)(a1 + 14))
      {
        *(void *)(a1 + 3440) = a2;
        *(void *)(a1 + 3768) = a3;
        *(void *)(a1 + 3792) = off_26B6099C8;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6099C8);
        uint64_t v6 = sub_225A493A8(a1, 0, 0);
        if (v6 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Get Rtng Config Sequence failed!");
          sub_225A50894(a1);
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Max Rtng table size is '0', can not read Rtng table!");
        uint64_t v6 = 255;
      }
    }
    else
    {
      uint64_t v6 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngTableConfig");
  return v6;
}

uint64_t sub_225A52F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  __int16 v13 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRfParameters");
  if (a1)
  {
    if (a2 && a3)
    {
      uint64_t v8 = sub_225A4F6A4((unsigned int *)a1, a2, v14, (unsigned char *)&v13 + 1, &v13);
      if (!v8 && HIBYTE(v13))
      {
        int v9 = v13 + 1;
        uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
        if (Memory)
        {
          unsigned __int16 v11 = Memory;
          *uint64_t Memory = HIBYTE(v13);
          phOsalNfc_MemCopy();
          *(void *)(a1 + 3792) = off_26B6099E8;
          *(unsigned char *)(a1 + 3992) = 0;
          *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6099E8);
          *(void *)(a1 + 880) = v11;
          *(_DWORD *)(a1 + 888) = v9;
          *(void *)(a1 + 4704) = a2;
          phOsalNfc_SetMemory();
          *(unsigned char *)(a1 + 864) = HIBYTE(v13);
          *(unsigned char *)(a1 + 865) = v13;
          *(void *)(a1 + 872) = v11;
          uint64_t v8 = sub_225A491E8(a1, 0, 0);
          if (v8 == 13)
          {
            *(void *)(a1 + 3440) = a3;
            *(void *)(a1 + 3768) = a4;
          }
          else
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Lower layer returned failure(phNciNfc_GetConfigRfParameters)\n");
            phOsalNfc_FreeMemory();
            *(void *)(a1 + 4704) = 0;
            *(void *)(a1 + 872) = 0;
            *(void *)(a1 + 880) = 0;
            *(_DWORD *)(a1 + 888) = 0;
          }
        }
        else
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Memory allocation failed (phNciNfc_GetConfigRfParameters)\n");
          uint64_t v8 = 12;
        }
      }
    }
    else
    {
      uint64_t v8 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters (phNciNfc_GetConfigRfParameters)\n");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_GetConfigRfParameters)\n");
    uint64_t v8 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRfParameters");
  return v8;
}

uint64_t sub_225A53150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v22 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Transceive");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Transceive)\n");
    uint64_t v13 = 49;
    goto LABEL_23;
  }
  if (!a2 || !a3 || !a4)
  {
    uint64_t v13 = 1;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters (phNciNfc_Transceive)\n");
    goto LABEL_23;
  }
  if (!*(void *)(a3 + 16) || !*(_DWORD *)(a3 + 24))
  {
    uint64_t v14 = (unsigned int *)(a1 + 6532);
    uint64_t v15 = " Invalid Send Buff Params. (phNciNfc_Transceive)\n";
LABEL_22:
    uint64_t v13 = 1;
    sub_2259A0EAC(1, v14, 3u, 4u, (uint64_t)v15);
    goto LABEL_23;
  }
  if ((!*(void *)(a3 + 32) || !*(_DWORD *)(a3 + 40)) && *(_DWORD *)a3 != 4)
  {
    uint64_t v14 = (unsigned int *)(a1 + 6532);
    uint64_t v15 = " Invalid Recv Buff Params. (phNciNfc_Transceive)\n";
    goto LABEL_22;
  }
  if (*(unsigned __int16 *)(a3 + 6) <= 0x12Bu)
  {
    *(_WORD *)(a3 + 6) = 300;
    sub_22599F8E0(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Input timeout is less than default, hence using default timeout: ");
  }
  uint64_t v10 = *(void *)(a1 + 4568);
  if (!v10) {
    goto LABEL_43;
  }
  if (*(_DWORD *)(v10 + 12) != 1 || *(_DWORD *)(v10 + 16))
  {
    int v11 = *(_DWORD *)(v10 + 4);
    if (v11 > 15)
    {
      if (v11 != 16)
      {
        if (v11 != 18) {
          goto LABEL_36;
        }
        unsigned __int16 v17 = sub_2259DC2AC(a1, a3);
        goto LABEL_34;
      }
      unsigned int v12 = *(unsigned __int8 *)(v10 + 109);
    }
    else
    {
      if ((v11 - 5) >= 3 && v11 != 3) {
        goto LABEL_36;
      }
      unsigned int v12 = *(unsigned __int8 *)(v10 + 108);
    }
    double v18 = (double)(1 << (v12 >> 4)) * 302.064897 / 1000.0;
    if ((int)v18 >= 0x54) {
      unsigned __int16 v17 = 19896;
    }
    else {
      unsigned __int16 v17 = 236 * (int)v18 + 100;
    }
    if ((v17 & 0xFFFCu) <= 0x7CF)
    {
      sub_22599F8E0(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"FWT timeout is less than default, hence using default timeout: ");
      unsigned __int16 v17 = 2000;
    }
LABEL_34:
    if (*(unsigned __int16 *)(a3 + 6) < v17)
    {
      *(_WORD *)(a3 + 6) = v17;
      sub_22599F8E0(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Transceive timeout is greater then default, value ");
    }
  }
LABEL_36:
  sub_22599F8E0(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Transceive timeout value  ");
  if (*(_DWORD *)(*(void *)(a1 + 4568) + 4) == 20 && *(_DWORD *)a3 == 1)
  {
    sub_2259DD7E4(*(_DWORD *)(a1 + 6532), *(void *)(a1 + 4712));
    *(unsigned char *)(a1 + 6520) = 0;
    sub_2259D730C(1, (unsigned int *)(a1 + 6532), *(void *)(a1 + 4712), 3u, 4u, (uint64_t)"phNciNfc_Transceive", (uint64_t)"pNciCtx->dwNtfTimerId", 0);
    unsigned int v19 = *(unsigned __int16 *)(a3 + 8);
    if (v19 >= 0xA)
    {
      if (v19 < 0x33) {
        goto LABEL_43;
      }
      __int16 v20 = 50;
    }
    else
    {
      __int16 v20 = 20;
    }
    *(_WORD *)(a3 + 8) = v20;
  }
LABEL_43:
  uint64_t v13 = sub_2259C9408((unsigned int *)a1, a2, &v22);
  if (!v13)
  {
    char v21 = v22;
    if (v22)
    {
      *(_DWORD *)(a1 + 4576) = *(_DWORD *)a3;
      *(_WORD *)(a1 + 4580) = *(_WORD *)(a3 + 4);
      *(_OWORD *)(a1 + 4592) = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a1 + 4608) = *(_OWORD *)(a3 + 32);
      *(_DWORD *)(a1 + 4582) = *(_DWORD *)(a3 + 6);
      *(unsigned char *)(a1 + 3984) = v21;
      *(void *)(a1 + 880) = *(void *)(a3 + 16);
      *(_DWORD *)(a1 + 888) = *(_DWORD *)(a3 + 24);
      *(void *)(a1 + 3792) = off_26B609A48;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609A48);
      uint64_t v13 = sub_2259A9684(a1, 0, 0);
      if (v13 == 13)
      {
        *(void *)(a1 + 4632) = a4;
        *(void *)(a1 + 4640) = a5;
      }
      else
      {
        *(void *)(a1 + 880) = 0;
      }
    }
    else
    {
      *(unsigned char *)(a1 + 6670) = 1;
      *(_DWORD *)(a1 + 6672) = 0;
      *(_DWORD *)(a1 + 6676) = *(unsigned __int16 *)(a3 + 6);
      uint64_t v13 = sub_225A458E0(a1, a2, a3, a4, a5);
      if (v13 != 13)
      {
        *(unsigned char *)(a1 + 6670) = 0;
        *(_DWORD *)(a1 + 6672) = 0;
      }
    }
  }
LABEL_23:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Transceive");
  return v13;
}

uint64_t sub_225A53598(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  char v28 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RegUnRegSeEvent");
  if (!a1) {
    goto LABEL_6;
  }
  char v10 = 0;
  uint64_t v11 = 0;
  do
  {
    uint64_t v12 = *((void *)&unk_26ABD79B8 + 14 * v11 + 4);
    if (v10) {
      break;
    }
    char v10 = 1;
    uint64_t v11 = 1;
  }
  while (v12 != a1);
  if (v12 == a1)
  {
    if (a2 && a4)
    {
      uint64_t v13 = sub_2259C9408((unsigned int *)a1, a2, &v28);
      if (!v13)
      {
        uint64_t v15 = a1 + 4728;
        if (a3)
        {
          uint64_t v29 = *(void *)(a1 + 6536);
          sub_2259A0FB0(0, (unsigned int *)&v29, 3u, 5u, (uint64_t)"phLibNfc_GetRegisteredSlotIndex");
          uint64_t v16 = 0;
          char v17 = 1;
          while (1)
          {
            char v18 = v17;
            if (*(unsigned char *)(v15 + 32 * v16) == 1)
            {
              uint64_t v19 = v15 + 32 * v16;
              if (*(void *)(v19 + 8) == a2) {
                break;
              }
            }
            char v17 = 0;
            uint64_t v16 = 1;
            if ((v18 & 1) == 0)
            {
              sub_2259A0EAC(0, (unsigned int *)&v29, 3u, 4u, (uint64_t)"phLibNfc_GetAvailableSlotIndex: Registration not found");
              sub_2259A10B4(0, (unsigned int *)&v29, 3u, 5u, (uint64_t)"phLibNfc_GetRegisteredSlotIndex");
              sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"phNciNfc_RegUnRegSeEvent: No registration found!");
              goto LABEL_27;
            }
          }
          sub_2259A10B4(0, (unsigned int *)&v29, 3u, 5u, (uint64_t)"phLibNfc_GetRegisteredSlotIndex");
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"phNciNfc_RegUnRegSeEvent: Unregistering SE event");
          BYTE4(v27) = v28;
          LODWORD(v26) = 0;
          if (!sub_225A4799C((unsigned int *)(a1 + 920), (uint64_t)&v26, a4))
          {
            uint64_t v13 = 0;
            *(unsigned char *)uint64_t v19 = 0;
            *(void *)(v19 + 16) = 0;
            *(void *)(v19 + 24) = 0;
            *(void *)(v19 + 8) = 0;
            goto LABEL_7;
          }
          int v24 = "phNciNfc_RegUnRegSeEvent: Failed to unregister with Nci core";
          char v23 = (unsigned int *)(a1 + 6532);
        }
        else
        {
          uint64_t v29 = *(void *)(a1 + 6536);
          sub_2259A0FB0(0, (unsigned int *)&v29, 3u, 5u, (uint64_t)"phLibNfc_GetAvailableSlotIndex");
          uint64_t v20 = 0;
          char v21 = 1;
          while (1)
          {
            char v22 = v21;
            if (!*(unsigned char *)(v15 + 32 * v20)) {
              break;
            }
            char v21 = 0;
            uint64_t v20 = 1;
            if ((v22 & 1) == 0)
            {
              sub_2259A0EAC(0, (unsigned int *)&v29, 3u, 1u, (uint64_t)"phLibNfc_GetAvailableSlotIndex: No Free slot available");
              sub_2259A10B4(0, (unsigned int *)&v29, 3u, 5u, (uint64_t)"phLibNfc_GetAvailableSlotIndex");
              char v23 = (unsigned int *)(a1 + 6532);
              int v24 = "phNciNfc_RegUnRegSeEvent: No free slots available, registration failed!";
              goto LABEL_26;
            }
          }
          sub_2259A10B4(0, (unsigned int *)&v29, 3u, 5u, (uint64_t)"phLibNfc_GetAvailableSlotIndex");
          *(void *)(a1 + 6656) = a2;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"phNciNfc_RegUnRegSeEvent: Registering SE event with NCI Core");
          BYTE5(v27) = 2;
          BYTE4(v27) = v28;
          LODWORD(v26) = 0;
          if (!sub_225A478A8((unsigned int *)(a1 + 920), (uint64_t)&v26, (uint64_t)sub_225A53978, a1))
          {
            uint64_t v13 = 0;
            uint64_t v25 = v15 + 32 * v20;
            *(void *)(v25 + 16) = a5;
            *(void *)(v25 + 24) = a4;
            *(void *)(v25 + 8) = a2;
            *(unsigned char *)uint64_t v25 = 1;
            goto LABEL_7;
          }
          int v24 = "phNciNfc_RegUnRegSeEvent: Failed to register with Nci core";
          char v23 = (unsigned int *)(a1 + 6532);
        }
LABEL_26:
        sub_2259A0EAC(1, v23, 3u, 1u, (uint64_t)v24);
LABEL_27:
        uint64_t v13 = 255;
      }
    }
    else
    {
      uint64_t v13 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters (phNciNfc_RegUnRegSeEvent)");
    }
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_RegUnRegSeEvent)");
    uint64_t v13 = 49;
  }
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RegUnRegSeEvent");
  return v13;
}

uint64_t sub_225A53978(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeEventCb");
  if (a1)
  {
    if (!a2)
    {
      uint64_t v15 = 0;
      LODWORD(v16) = 0;
      a2 = &v14;
    }
    uint64_t v6 = 0;
    uint64_t v7 = a1 + 4728;
    char v8 = 1;
    do
    {
      char v9 = v8;
      if (*(unsigned char *)(v7 + 32 * v6) == 1)
      {
        uint64_t v10 = v7 + 32 * v6;
        if (*(void *)(a1 + 6656) == *(void *)(v10 + 8))
        {
          uint64_t v11 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v10 + 24);
          if (v11)
          {
            uint64_t v12 = *(void *)(v7 + 32 * v6 + 16);
            *a2 = a1;
            v11(v12, a2, a3);
          }
        }
      }
      char v8 = 0;
      uint64_t v6 = 1;
    }
    while ((v9 & 1) != 0);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeEventCb");
  return 255;
}

uint64_t sub_225A53A74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CreateLogicalConn");
  if (a1)
  {
    if (a2)
    {
      uint64_t Memory = phOsalNfc_GetMemory();
      if (Memory)
      {
        *(_DWORD *)uint64_t Memory = 1;
        *(unsigned char *)(Memory + 4) = 0;
        *(void *)(a1 + 3312) = Memory;
        *(void *)(a1 + 3440) = a2;
        *(void *)(a1 + 3768) = a3;
        uint64_t v7 = sub_2259C8EBC(a1, Memory, (uint64_t)sub_225A53BB8, a1);
        if (v7 != 13)
        {
          *(void *)(a1 + 3440) = 0;
          *(void *)(a1 + 3768) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Failed to Open logical connection in loopback mode");
        uint64_t v7 = 255;
      }
    }
    else
    {
      uint64_t v7 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid input parameters!");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v7 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CreateLogicalConn");
  return v7;
}

uint64_t sub_225A53BB8(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  __int16 v15 = 0;
  unsigned __int8 v14 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_LogicalConnOpen_CB");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Invalid Nci handle passed!");
    a3 = 255;
    goto LABEL_26;
  }
  if (a3 == 81)
  {
    uint64_t v6 = 0;
  }
  else
  {
    if (a3)
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Log conn in loop back mode creation failed!");
      uint64_t v6 = 0;
    }
    else
    {
      *(unsigned char *)(a1 + 3304) = 1;
      *(unsigned char *)(a1 + 3305) = *a2;
      if (*(void *)(a1 + 3312))
      {
        phOsalNfc_FreeMemory();
        *(void *)(a1 + 3312) = 0;
      }
      uint64_t v6 = a1 + 7000;
      if (!sub_2259C9284(a1, 1, 254, a1 + 7000)
        && !sub_2259C9624((unsigned int *)a1, a1 + 7000, (unsigned char *)&v15 + 1)
        && !sub_2259C9744((unsigned int *)a1, a1 + 7000, &v15)
        && !sub_2259C9408((unsigned int *)a1, a1 + 7000, &v14))
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Available num of credits and Max pld size updated in remote dev structure");
        int v13 = v14;
        sub_225A47A68(a1 + 920, v14, SHIBYTE(v15));
        sub_225A47B68(a1 + 920, v13, v15);
        a3 = 0;
        goto LABEL_16;
      }
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Failed due to logical conn or unavailable memory");
      if (*(void *)(a1 + 4568))
      {
        phOsalNfc_FreeMemory();
        uint64_t v6 = 0;
        *(void *)(a1 + 4568) = 0;
      }
    }
    a3 = 255;
  }
LABEL_16:
  uint64_t v7 = *(void (**)(void, uint64_t, uint64_t))(a1 + 3440);
  if (v7)
  {
    if (v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    v7(*(void *)(a1 + 3768), a3, v8);
  }
  char v9 = 0;
  uint64_t v10 = 0;
  do
  {
    uint64_t v11 = *((void *)&unk_26ABD79B8 + 14 * v10 + 4);
    if (v9) {
      break;
    }
    char v9 = 1;
    uint64_t v10 = 1;
  }
  while (v11 != a1);
  if (v11 == a1)
  {
    *(void *)(a1 + 3440) = 0;
    *(void *)(a1 + 3768) = 0;
  }
LABEL_26:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_LogicalConnOpen_CB");
  return a3;
}

uint64_t sub_225A53E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CloseLogicalConn");
  if (a1)
  {
    if (a2)
    {
      if (*(unsigned char *)(a1 + 3304) == 1)
      {
        *(void *)(a1 + 3440) = a2;
        *(void *)(a1 + 3768) = a3;
        uint64_t v6 = sub_2259C9158(a1, 254, (uint64_t)sub_225A53F38, a1);
        if (v6 != 13)
        {
          *(void *)(a1 + 3440) = 0;
          *(void *)(a1 + 3768) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"No Log conn in loop back mode exists");
        uint64_t v6 = 255;
      }
    }
    else
    {
      uint64_t v6 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid input parameters!");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CloseLogicalConn");
  return v6;
}

uint64_t sub_225A53F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_LogicalConnClose_CB");
  if (a1)
  {
    if (a3 != 81)
    {
      if (a3) {
        a3 = 255;
      }
      else {
        *(_WORD *)(a1 + 3304) = -256;
      }
    }
    char v5 = *(void (**)(uint64_t, uint64_t, void))(a1 + 3440);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 3768);
      *(void *)(a1 + 3440) = 0;
      *(void *)(a1 + 3768) = 0;
      v5(v6, a3, 0);
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Invalid Nci handle passed!");
    a3 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_LogicalConnClose_CB");
  return a3;
}

uint64_t sub_225A53FFC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SwpSelfTest");
  if (a1)
  {
    if (a3)
    {
      *(void *)(a1 + 3440) = a3;
      *(void *)(a1 + 3768) = a4;
      *(unsigned char *)(a1 + 3320) = a2;
      *(void *)(a1 + 3792) = off_26B606700;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606700);
      uint64_t v8 = sub_2259A9684(a1, 0, 0);
      if (v8 != 13) {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"SwpSelfTest: Swp self test sequence failed!");
      }
    }
    else
    {
      uint64_t v8 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"SwpSelfTest: Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"SwpSelfTest: Stack not initialized");
    uint64_t v8 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SwpSelfTest");
  return v8;
}

uint64_t sub_225A54124(uint64_t a1, int a2, int a3, __int16 a4, uint64_t a5, uint64_t a6)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PrbsTest");
  if (a1)
  {
    if (a5)
    {
      *(void *)(a1 + 3328) = 0;
      uint64_t Memory = phOsalNfc_GetMemory();
      *(void *)(a1 + 3328) = Memory;
      if (Memory)
      {
        *(void *)(a1 + 3440) = a5;
        *(void *)(a1 + 3768) = a6;
        *(_DWORD *)uint64_t Memory = a2;
        *(_DWORD *)(Memory + 4) = a3;
        *(_WORD *)(Memory + 8) = a4;
        *(void *)(a1 + 3792) = off_26B606730;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606730);
        uint64_t v13 = sub_2259A9684(a1, 0, 0);
        if (v13 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"PrbsTest: Prbs test sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 3328) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"PrbsTest: MemAlloc for Params Failed!");
        uint64_t v13 = 12;
      }
    }
    else
    {
      uint64_t v13 = 1;
      sub_2259A0EAC(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"PrbsTest: Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"PrbsTest: Stack not initialized");
    uint64_t v13 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PrbsTest");
  return v13;
}

uint64_t sub_225A542B4(unsigned int *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1;
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_Reset");
  if (!v7) {
    goto LABEL_6;
  }
  char v8 = 0;
  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = (unsigned int *)*((void *)&unk_26ABD79B8 + 14 * v9 + 4);
    if (v8) {
      break;
    }
    char v8 = 1;
    uint64_t v9 = 1;
  }
  while (v10 != v7);
  if (v10 == v7)
  {
    uint64_t v13 = v7 + 1633;
    if (a2 == 2)
    {
      sub_2259A0EAC(1, v13, 3u, 4u, (uint64_t)"Nci Reset - phNciNfc_NciReset_Mgt_Reset");
      sub_2259D08F4(v7);
      phTmlNfc_WriteAbort();
      sub_2259E0CEC(*((void *)v7 + 194), 0);
      phTmlNfc_ReadAbort();
      uint64_t v11 = sub_225A0113C(v7);
      uint64_t v7 = 0;
    }
    else
    {
      if (a2 == 1)
      {
        sub_2259A0EAC(1, v13, 3u, 4u, (uint64_t)"Nci Reset - phNciNfc_NciReset_DeInit_ResetConfig");
        sub_2259B0524(v7 + 230);
        sub_2259D08F4(v7);
        phTmlNfc_WriteAbort();
        sub_2259E0CEC(*((void *)v7 + 194), 0);
        uint64_t v14 = (uint64_t)v7;
        uint64_t v15 = a3;
        uint64_t v16 = a4;
        int v17 = 1;
      }
      else
      {
        if (a2)
        {
          uint64_t v11 = 1;
          sub_2259A0EAC(1, v13, 3u, 2u, (uint64_t)"Invalid Nci Reset type");
          goto LABEL_7;
        }
        sub_2259A0EAC(1, v13, 3u, 4u, (uint64_t)"Nci Reset - phNciNfc_NciReset_DeInit_KeepConfig");
        sub_2259B0524(v7 + 230);
        sub_2259D08F4(v7);
        phTmlNfc_WriteAbort();
        sub_2259E0CEC(*((void *)v7 + 194), 0);
        uint64_t v14 = (uint64_t)v7;
        uint64_t v15 = a3;
        uint64_t v16 = a4;
        int v17 = 0;
      }
      uint64_t v11 = sub_225A544C0(v14, v15, v16, v17);
    }
  }
  else
  {
LABEL_6:
    uint64_t v11 = 1;
    sub_2259A0EAC(2, v7, 3u, 1u, (uint64_t)"phNciNfc_Reset: Invalid NCINFC context!!");
  }
LABEL_7:
  sub_2259A10B4(2, v7, 3u, 5u, (uint64_t)"phNciNfc_Reset");
  return v11;
}

uint64_t sub_225A544C0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Release");
  uint64_t v8 = 1;
  if (a1 && a2)
  {
    *(void *)(a1 + 3440) = a2;
    *(void *)(a1 + 3768) = a3;
    *(void *)(a1 + 3792) = off_26B606AA0;
    *(unsigned char *)(a1 + 3992) = 0;
    *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606AA0);
    *(_DWORD *)(a1 + 36) = a4;
    uint64_t v8 = sub_2259A9684(a1, 0, 0);
    if (v8 == 13) {
      sub_225A55524(a1);
    }
    else {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Failed to Reset!");
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Release");
  return v8;
}

uint64_t sub_225A545B4(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnterNciRecoveryMode");
  if (a1)
  {
    sub_2259D08F4((unsigned int *)a1);
    phOsalNfc_Timer_Stop();
    *(unsigned char *)(a1 + 6520) = 0;
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnterNciRecoveryMode");
}

uint64_t sub_225A5463C(uint64_t a1, unsigned char *a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateAntennaConfigParams");
  if (a1 && a2)
  {
    phOsalNfc_MemCopy();
    if (*a2)
    {
      uint64_t v5 = 0;
      *(unsigned char *)(a1 + 3744) = 8;
      char v4 = 1;
    }
    else
    {
      char v4 = 0;
      uint64_t v5 = 255;
    }
    *(unsigned char *)(a1 + 3754) = v4;
  }
  else
  {
    sub_2259A0EAC(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"phNciNfc_UpdateAntennaConfigParams: Failed!");
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateAntennaConfigParams");
  return v5;
}

uint64_t sub_225A5470C(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestCmd");
  if (!a1) {
    goto LABEL_6;
  }
  char v8 = 0;
  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = *((void *)&unk_26ABD79B8 + 14 * v9 + 4);
    if (v8) {
      break;
    }
    char v8 = 1;
    uint64_t v9 = 1;
  }
  while (v10 != a1);
  if (v10 == a1)
  {
    uint64_t v11 = 1;
    if (a2)
    {
      if (a3)
      {
        uint64_t v11 = sub_225A5463C(a1, a2);
        if (!v11)
        {
          *(void *)(a1 + 3440) = a3;
          *(void *)(a1 + 3768) = a4;
          *(void *)(a1 + 3792) = off_26B6098C8;
          *(unsigned char *)(a1 + 3992) = 0;
          *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6098C8);
          uint64_t v11 = sub_2259A9684(a1, 0, 0);
          if (v11 != 13) {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Antenna Self Test command failed!");
          }
        }
      }
    }
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v11 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestCmd");
  return v11;
}

uint64_t sub_225A54864(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SendRfOnOffCmd");
  if (!a1) {
    goto LABEL_6;
  }
  char v8 = 0;
  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = *((void *)&unk_26ABD79B8 + 14 * v9 + 4);
    if (v8) {
      break;
    }
    char v8 = 1;
    uint64_t v9 = 1;
  }
  while (v10 != a1);
  if (v10 == a1)
  {
    if (a3)
    {
      uint64_t Memory = phOsalNfc_GetMemory();
      *(void *)(a1 + 880) = Memory;
      if (Memory)
      {
        if (a2 == 2 || a2 == 1) {
          int v14 = 3;
        }
        else {
          int v14 = 1;
        }
        *(_DWORD *)(a1 + 888) = v14;
        phOsalNfc_MemCopy();
        *(void *)(a1 + 3440) = a3;
        *(void *)(a1 + 3768) = a4;
        *(void *)(a1 + 3792) = off_26B6098A8;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6098A8);
        uint64_t v11 = sub_2259A9684(a1, 0, 0);
        if (v11 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Send RF On or Off command failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
        uint64_t v11 = 12;
      }
    }
    else
    {
      uint64_t v11 = 1;
    }
  }
  else
  {
LABEL_6:
    sub_2259A0EAC(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v11 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SendRfOnOffCmd");
  return v11;
}

uint64_t sub_225A54A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerRfOnNtf");
  if (a1)
  {
    if (a3)
    {
      uint64_t Memory = phOsalNfc_GetMemory();
      *(void *)(a1 + 880) = Memory;
      if (Memory)
      {
        *(void *)(a1 + 3440) = a3;
        *(void *)(a1 + 3768) = a4;
        phOsalNfc_MemCopy();
        *(_DWORD *)(a1 + 888) = 1;
        *(void *)(a1 + 3792) = off_26B609888;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609888);
        uint64_t v8 = sub_2259A9684(a1, 0, 0);
        if (v8 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Trigger RF On command failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
        uint64_t v8 = 12;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v8 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerRfOnNtf");
  return v8;
}

uint64_t sub_225A54BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnablePropExtn");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 3440) = a2;
      *(void *)(a1 + 3768) = a3;
      *(void *)(a1 + 3792) = off_26B609908;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609908);
      uint64_t v6 = sub_2259A9684(a1, 0, 0);
      if (v6 != 13) {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Extension Enable command failed!");
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnablePropExtn");
  return v6;
}

uint64_t sub_225A54CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PresenceChk");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 3440) = a2;
      *(void *)(a1 + 3768) = a3;
      *(void *)(a1 + 3792) = off_26B6098E8;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6098E8);
      uint64_t v6 = sub_225A471B4(a1, 0, 0);
      if (v6 != 13) {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Presence check (extension command) failed!");
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PresenceChk");
  return v6;
}

uint64_t sub_225A54DD4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRaw");
  if (a1)
  {
    if (a2 && a3)
    {
      uint64_t Memory = phOsalNfc_GetMemory();
      *(void *)(a1 + 880) = Memory;
      if (Memory)
      {
        phOsalNfc_MemCopy();
        *(void *)(a1 + 3440) = a4;
        *(void *)(a1 + 3768) = a5;
        *(void *)(a1 + 3792) = off_26B609948;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609948);
        *(_DWORD *)(a1 + 888) = a3;
        uint64_t v11 = sub_225A49154(a1, 0, 0);
        if (v11 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Set Config Raw Sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
        uint64_t v11 = 12;
      }
    }
    else
    {
      uint64_t v11 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v11 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRaw");
  return v11;
}

uint64_t sub_225A54F6C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSignedRaw");
  if (a1)
  {
    if (a2 && a3)
    {
      uint64_t Memory = phOsalNfc_GetMemory();
      *(void *)(a1 + 880) = Memory;
      if (Memory)
      {
        phOsalNfc_MemCopy();
        *(void *)(a1 + 3440) = a4;
        *(void *)(a1 + 3768) = a5;
        *(void *)(a1 + 3792) = off_26B609968;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609968);
        *(_DWORD *)(a1 + 888) = a3;
        uint64_t v11 = sub_225A49154(a1, 0, 0);
        if (v11 != 13)
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Set Config Raw Sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
        uint64_t v11 = 12;
      }
    }
    else
    {
      uint64_t v11 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v11 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSignedRaw");
  return v11;
}

uint64_t sub_225A55104(uint64_t a1, char a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortNciCtrPacket");
  if (a1)
  {
    sub_2259D08F4((unsigned int *)a1);
    sub_225A5523C(a1);
    sub_2259B0D84(a1 + 920);
    *(unsigned char *)(a1 + 4792) = 0;
    sub_2259DD7E4(*(_DWORD *)(a1 + 6532), *(void *)(a1 + 4712));
    *(unsigned char *)(a1 + 6520) = 0;
    sub_2259D730C(1, (unsigned int *)(a1 + 6532), *(void *)(a1 + 4712), 3u, 4u, (uint64_t)"phNciNfc_AbortNciCtrPacket", (uint64_t)"pNciCtx->dwNtfTimerId", 0);
    phOsalNfc_SetMemory();
    *(unsigned char *)(a1 + 6529) = a2;
    if (*(void *)(a1 + 4656))
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"De-allocating Send Request Payload Buffer...");
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 4656) = 0;
      *(_DWORD *)(a1 + 4664) = 0;
    }
    sub_225A50894(a1);
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortNciCtrPacket");
}

uint64_t sub_225A5523C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StopRespWaitTimer");
  if (a1)
  {
    if (*(unsigned char *)(a1 + 1912) == 1)
    {
      phOsalNfc_Timer_Stop();
      *(unsigned char *)(a1 + 6520) = 0;
      *(unsigned char *)(a1 + 1912) = 0;
      uint64_t v2 = 0;
      if (*(_DWORD *)(a1 + 6532)) {
        dword_26ABD8414 &= ~0x10u;
      }
      else {
        dword_26ABD832C &= ~0x10u;
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v2 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StopRespWaitTimer");
  return v2;
}

uint64_t sub_225A55320(uint64_t a1, int a2)
{
  char v14 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataTransfer");
  if (a1)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 4);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != a1);
    switch(a2)
    {
      case 0:
        sub_2259D08F4((unsigned int *)a1);
        *(unsigned char *)(a1 + 6491) = 0;
        *(void *)(a1 + 4640) = 0;
        *(void *)(a1 + 4632) = 0;
        if (*(unsigned char *)(a1 + 3344) == 1)
        {
          *(unsigned char *)(a1 + 3344) = 0;
          if (*(void *)(a1 + 3352))
          {
            phOsalNfc_FreeMemory();
            *(void *)(a1 + 3352) = 0;
          }
          *(_DWORD *)(a1 + 3360) = 16711680;
        }
        uint64_t v7 = *(void *)(a1 + 3368);
        if (v7 && v7 != 0xFFFFFFFFFFFFLL)
        {
          phOsalNfc_Timer_Stop();
          phOsalNfc_Timer_Delete();
          *(void *)(a1 + 3368) = 0xFFFFFFFFFFFFLL;
        }
        if (!sub_2259C9408((unsigned int *)a1, *(void *)(a1 + 4568), &v14))
        {
          LOBYTE(v11) = 1;
          char v8 = v14;
          BYTE3(v11) = v14;
          uint64_t v12 = a1;
          uint64_t v13 = sub_2259B139C;
          sub_2259B0948(a1 + 920, (uint64_t)&v11, 0);
          BYTE3(v11) = v8;
          uint64_t v12 = a1;
          uint64_t v13 = sub_2259AAFA8;
          sub_2259B0948(a1 + 920, (uint64_t)&v11, 0);
        }
        *(unsigned char *)(a1 + 6670) = 0;
        return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataTransfer");
      case 1:
        *(unsigned char *)(a1 + 6624) = 0;
        uint64_t v9 = (unsigned int *)a1;
        goto LABEL_19;
      case 2:
        uint64_t v9 = (unsigned int *)a1;
        goto LABEL_19;
      case 3:
        *(unsigned char *)(a1 + 6670) = 0;
        uint64_t v9 = (unsigned int *)a1;
LABEL_19:
        sub_2259D08F4(v9);
        break;
      default:
        return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataTransfer");
    }
  }
  return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataTransfer");
}

uint64_t sub_225A55524(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phLibNfc_ClearSeEvents");
  if (a1)
  {
    *(unsigned char *)(a1 + 4728) = 0;
    *(unsigned char *)(a1 + 4760) = 0;
  }

  return sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phLibNfc_ClearSeEvents");
}

uint64_t sub_225A5559C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerAssertCb");
  if (a1)
  {
    if (*(void *)(a1 + 880))
    {
      phOsalNfc_FreeMemory();
      *(void *)(a1 + 880) = 0;
    }
    uint64_t v5 = *(void (**)(void, uint64_t, void))(a1 + 3440);
    if (v5) {
      v5(*(void *)(a1 + 3768), a3, 0);
    }
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerAssertCb");
  return a3;
}

uint64_t sub_225A5562C(uint64_t a1, char a2, int *a3, uint64_t a4, uint64_t a5)
{
  long long v16 = 0u;
  long long v17 = 0u;
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerNfccAssert");
  if (a1)
  {
    if (a4)
    {
      uint64_t Memory = phOsalNfc_GetMemory();
      if (Memory)
      {
        uint64_t v11 = Memory;
        if (a3)
        {
          int v12 = *a3;
          *(unsigned char *)uint64_t Memory = 5;
          *(_WORD *)(Memory + 1) = v12;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"Configuring NFCC Assert Timeout for MFW");
          *(void *)(a1 + 880) = v11;
          *(_DWORD *)(a1 + 888) = 3;
          *(void *)(a1 + 3792) = off_26B6065A0;
          *(unsigned char *)(a1 + 3992) = 0;
          *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6065A0);
          uint64_t v13 = sub_2259A9684(a1, 0, 0);
        }
        else
        {
          *(unsigned char *)uint64_t Memory = a2;
          *(void *)(a1 + 880) = Memory;
          *(_DWORD *)(a1 + 888) = 1;
          phOsalNfc_SetMemory();
          *(void *)&long long v16 = 0xF00000001;
          DWORD2(v16) = 59;
          *(void *)&long long v17 = *(void *)(a1 + 880);
          DWORD2(v17) = *(_DWORD *)(a1 + 888);
          uint64_t v13 = sub_225A47734(a1 + 920, &v16, (uint64_t)sub_225A5559C, a1);
        }
        uint64_t v14 = v13;
        if (v13 == 13)
        {
          *(void *)(a1 + 3440) = a4;
          *(void *)(a1 + 3768) = a5;
        }
        else
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"phNciNfc_TriggerNfccAssert: Sequence failed!");
          if (*(void *)(a1 + 880)) {
            phOsalNfc_FreeMemory();
          }
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"phNciNfc_TriggerNfccAssert: Insufficient Memory ");
        uint64_t v14 = 12;
      }
    }
    else
    {
      uint64_t v14 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"Invalid input parameter!");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v14 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerNfccAssert");
  return v14;
}

uint64_t sub_225A55884(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v6, 3u, 5u, (uint64_t)"phNciNfc_ValidateNciSendState");
  if (sub_2259E0DA4(v6) == 1)
  {
    if (!a2 || (uint64_t v3 = *(void *)(a2 + 6632)) == 0)
    {
      a2 = 111;
      goto LABEL_13;
    }
  }
  else
  {
    if (!a2) {
      goto LABEL_13;
    }
    uint64_t v3 = 0;
  }
  if (v3) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = 111;
  }
  if (*(unsigned char *)(a2 + 6008)) {
    a2 = v4;
  }
  else {
    a2 = 0;
  }
LABEL_13:
  sub_2259A10B4(0, (unsigned int *)&v6, 3u, 5u, (uint64_t)"phNciNfc_ValidateNciSendState");
  return a2;
}

uint64_t sub_225A55934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRfCalSignedData");
  if (a1)
  {
    if (a2 && *(void *)a2 && a3 && *(_DWORD *)(a2 + 8))
    {
      *(void *)(a1 + 3440) = a3;
      *(void *)(a1 + 3768) = a4;
      *(void *)(a1 + 3336) = a2;
      *(void *)(a1 + 3792) = off_26B606760;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606760);
      uint64_t v8 = sub_2259A9684(a1, 0, 0);
      if (v8 != 13) {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"SetRfCalSignedData: Sequence failed!");
      }
    }
    else
    {
      uint64_t v8 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"SetRfCalSignedData: Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"SetRfCalSignedData: Stack not initialized");
    uint64_t v8 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRfCalSignedData");
  return v8;
}

uint64_t sub_225A55A70(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfCalSignedData");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"GetRfCalSignedData: Stack not initialized");
    uint64_t v8 = 49;
    goto LABEL_10;
  }
  if (!a2 || !a3 || !*a2)
  {
    uint64_t v9 = (unsigned int *)(a1 + 6532);
    uint64_t v10 = "GetRfCalSignedData: Invalid parameters";
    uint64_t v8 = 1;
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a3;
  *(void *)(a1 + 3768) = a4;
  *(void *)(a1 + 3336) = a2;
  *(void *)(a1 + 3792) = off_26B606780;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606780);
  uint64_t v8 = sub_2259A9684(a1, 0, 0);
  if (v8 != 13)
  {
    uint64_t v9 = (unsigned int *)(a1 + 6532);
    uint64_t v10 = "GetRfCalSignedData: Sequence failed!";
LABEL_8:
    sub_2259A0EAC(1, v9, 3u, 2u, (uint64_t)v10);
  }
LABEL_10:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfCalSignedData");
  return v8;
}

uint64_t sub_225A55B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FlushSramToFlash");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 3792) = off_26B609928;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B609928);
      uint64_t v6 = sub_2259A9684(a1, 0, 0);
      if (v6 == 13)
      {
        *(void *)(a1 + 3440) = a2;
        *(void *)(a1 + 3768) = a3;
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"Flush data command failed!");
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FlushSramToFlash");
  return v6;
}

uint64_t sub_225A55C98(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSwioPadVoltage");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"phNciNfc_GetSwioPadVoltage: Stack not initialized");
    uint64_t v8 = 49;
    goto LABEL_9;
  }
  if (!a3)
  {
    uint64_t v9 = (unsigned int *)(a1 + 6532);
    uint64_t v10 = "phNciNfc_GetSwioPadVoltage: Invalid parameters";
    uint64_t v8 = 1;
LABEL_8:
    sub_2259A0EAC(1, v9, 3u, 1u, (uint64_t)v10);
    goto LABEL_9;
  }
  *(unsigned char *)(a1 + 4896) = a2;
  *(void *)(a1 + 3792) = off_26B6064C0;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6064C0);
  uint64_t v8 = sub_2259A9684(a1, 0, 0);
  if (v8 != 13)
  {
    uint64_t v9 = (unsigned int *)(a1 + 6532);
    uint64_t v10 = "phNciNfc_GetSwioPadVoltage: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a3;
  *(void *)(a1 + 3768) = a4;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSwioPadVoltage");
  return v8;
}

uint64_t sub_225A55DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetAteTrimVersion");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"phNciNfc_GetAteTrimVersion: Stack not initialized");
    uint64_t v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetAteTrimVersion: Invalid parameters";
    uint64_t v6 = 1;
LABEL_8:
    sub_2259A0EAC(1, v7, 3u, 1u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(void *)(a1 + 3792) = off_26B6064E0;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6064E0);
  uint64_t v6 = sub_2259A9684(a1, 0, 0);
  if (v6 != 13)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetAteTrimVersion: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a2;
  *(void *)(a1 + 3768) = a3;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetAteTrimVersion");
  return v6;
}

uint64_t sub_225A55ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetEraseCounterInfo");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetEraseCounterInfo: Stack not initialized");
    uint64_t v7 = 49;
    goto LABEL_9;
  }
  if (!a3)
  {
    uint64_t v8 = "phNciNfc_GetEraseCounterInfo: Invalid parameters";
    uint64_t v7 = 1;
LABEL_8:
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  phOsalNfc_MemCopy();
  *(void *)(a1 + 3792) = off_26B606500;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606500);
  uint64_t v7 = sub_2259A9684(a1, 0, 0);
  if (v7 != 13)
  {
    uint64_t v8 = "phNciNfc_GetEraseCounterInfo: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a3;
  *(void *)(a1 + 3768) = a4;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetEraseCounterInfo");
  return v7;
}

uint64_t sub_225A55FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetProhibitTimerStatus");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetProhibitTimerStatus: Stack not initialized");
    uint64_t v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetProhibitTimerStatus: Invalid parameters";
    uint64_t v6 = 1;
LABEL_8:
    sub_2259A0EAC(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(void *)(a1 + 3792) = off_26B606520;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606520);
  uint64_t v6 = sub_2259A9684(a1, 0, 0);
  if (v6 != 13)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetProhibitTimerStatus: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a2;
  *(void *)(a1 + 3768) = a3;
  *(void *)(a1 + 832) = a2;
  *(void *)(a1 + 840) = a3;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetProhibitTimerStatus");
  return v6;
}

uint64_t sub_225A56118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetPwrTrackData");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetPwrTrackData: Stack not initialized");
    uint64_t v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetPwrTrackData: Invalid parameters";
    uint64_t v6 = 1;
LABEL_8:
    sub_2259A0EAC(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(void *)(a1 + 3792) = off_26B606540;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606540);
  uint64_t v6 = sub_2259A9684(a1, 0, 0);
  if (v6 != 13)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetPwrTrackData: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a2;
  *(void *)(a1 + 3768) = a3;
  *(void *)(a1 + 816) = a2;
  *(void *)(a1 + 824) = a3;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetPwrTrackData");
  return v6;
}

uint64_t sub_225A56234(uint64_t a1, char a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcChkFlag");
  if (a1)
  {
    uint64_t v4 = 0;
    *(unsigned char *)(a1 + 6297) = a2;
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    uint64_t v4 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcChkFlag");
  return v4;
}

uint64_t sub_225A562D0(uint64_t a1, char a2)
{
  if (a1) {
    *(unsigned char *)(a1 + 6296) = a2;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcAppendFlag");
  return 0;
}

uint64_t sub_225A5633C(uint64_t a1, char a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcSkpFlag");
  if (a1)
  {
    uint64_t v4 = 0;
    *(unsigned char *)(a1 + 6298) = a2;
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"UpdateCrcSkpFlag: Stack not initialized");
    uint64_t v4 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcSkpFlag");
  return v4;
}

uint64_t sub_225A563D8(uint64_t a1, char a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreReqCrcCfg");
  if (a1)
  {
    uint64_t v4 = 0;
    *(unsigned char *)(a1 + 6299) = a2;
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"StoreReqCrcCfg: Stack not initialized");
    uint64_t v4 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreReqCrcCfg");
  return v4;
}

uint64_t sub_225A56474(uint64_t a1, char a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateDtaStatusFlag");
  if (a1)
  {
    uint64_t v4 = 0;
    *(unsigned char *)(a1 + 4793) = a2;
  }
  else
  {
    uint64_t v4 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateDtaStatusFlag");
  return v4;
}

uint64_t sub_225A564F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSmbLogInfo");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetSmbLogInfo: Stack not initialized");
    uint64_t v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetSmbLogInfo: Invalid parameters";
    uint64_t v6 = 1;
LABEL_8:
    sub_2259A0EAC(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(void *)(a1 + 3792) = off_26B606560;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606560);
  uint64_t v6 = sub_2259A9684(a1, 0, 0);
  if (v6 != 13)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetSmbLogInfo: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a2;
  *(void *)(a1 + 3768) = a3;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSmbLogInfo");
  return v6;
}

uint64_t sub_225A56608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetLpcdCount");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetLpcdCount: Stack not initialized");
    uint64_t v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetLpcdCount: Invalid parameters";
    uint64_t v6 = 1;
LABEL_8:
    sub_2259A0EAC(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(void *)(a1 + 3792) = off_26B6065C0;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6065C0);
  uint64_t v6 = sub_2259A9684(a1, 0, 0);
  if (v6 != 13)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetLpcdCount: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a2;
  *(void *)(a1 + 3768) = a3;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetLpcdCount");
  return v6;
}

uint64_t sub_225A5671C(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo");
  if (a1)
  {
    if (a3)
    {
      uint64_t Memory = (unsigned char *)phOsalNfc_GetMemory();
      if (Memory)
      {
        *uint64_t Memory = a2;
        *(void *)(a1 + 880) = Memory;
        *(_DWORD *)(a1 + 888) = 1;
        *(void *)(a1 + 3792) = off_26B606580;
        *(unsigned char *)(a1 + 3992) = 0;
        *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606580);
        uint64_t v9 = sub_2259A9684(a1, 0, 0);
        if (v9 == 13)
        {
          *(void *)(a1 + 3440) = a3;
          *(void *)(a1 + 3768) = a4;
        }
        else
        {
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo: Sequence failed!");
          phOsalNfc_FreeMemory();
          *(void *)(a1 + 880) = 0;
          *(_DWORD *)(a1 + 888) = 0;
        }
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo: Insufficient Memory ");
        uint64_t v9 = 12;
      }
    }
    else
    {
      uint64_t v9 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo: Invalid parameters");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo: Stack not initialized");
    uint64_t v9 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo");
  return v9;
}

uint64_t sub_225A568B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetFwType");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetFwType: Stack not initialized");
    uint64_t v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetFwType: Invalid parameters";
    uint64_t v6 = 1;
LABEL_8:
    sub_2259A0EAC(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(void *)(a1 + 3792) = off_26B6065E0;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6065E0);
  uint64_t v6 = sub_2259A9684(a1, 0, 0);
  if (v6 != 13)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_GetFwType: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a2;
  *(void *)(a1 + 3768) = a3;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetFwType");
  return v6;
}

uint64_t sub_225A569C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_DetectTagRemoval");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 2u, (uint64_t)"phNciNfc_DetectTagRemoval: Stack not initialized");
    uint64_t v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_DetectTagRemoval: Invalid parameters";
    uint64_t v6 = 1;
LABEL_8:
    sub_2259A0EAC(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(void *)(a1 + 3792) = off_26B606600;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606600);
  uint64_t v6 = sub_2259A9684(a1, 0, 0);
  if (v6 != 13)
  {
    uint64_t v7 = (unsigned int *)(a1 + 6532);
    uint64_t v8 = "phNciNfc_DetectTagRemoval: Sequence failed!";
    goto LABEL_8;
  }
  *(void *)(a1 + 3440) = a2;
  *(void *)(a1 + 3768) = a3;
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_DetectTagRemoval");
  return v6;
}

uint64_t sub_225A56AD8(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetNfccParams");
  if (a1)
  {
    if (a2 && a3)
    {
      *(void *)(a1 + 3448) = a2;
      int v8 = *a2;
      if (*a2 == 3)
      {
        uint64_t v9 = off_26B606620;
      }
      else if (v8 == 8)
      {
        uint64_t v9 = off_26B606640;
      }
      else
      {
        if (v8 != 5)
        {
          uint64_t v10 = 1;
          sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"phNciNfc_SetNfccParams: Invalid eNfccParam");
          *(void *)(a1 + 3448) = 0;
          goto LABEL_15;
        }
        uint64_t v9 = off_26B606680;
      }
      *(void *)(a1 + 3792) = v9;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, v9);
      uint64_t v10 = sub_2259A9684(a1, 0, 0);
      if (v10 == 13)
      {
        *(void *)(a1 + 3440) = a3;
        *(void *)(a1 + 3768) = a4;
        goto LABEL_16;
      }
LABEL_15:
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 2u, (uint64_t)"phNciNfc_SetNfccParams: Sequence failed!");
      goto LABEL_16;
    }
    uint64_t v10 = 1;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"phNciNfc_SetNfccParams: Invalid parameters");
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"phNciNfc_SetNfccParams: Stack not initialized");
    uint64_t v10 = 49;
  }
LABEL_16:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetNfccParams");
  return v10;
}

uint64_t sub_225A56C64(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNfccParams");
  if (!a1)
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"phNciNfc_GetNfccParams: Stack not initialized");
    uint64_t v8 = 49;
    goto LABEL_11;
  }
  if (!a3)
  {
    uint64_t v9 = (unsigned int *)(a1 + 6532);
    uint64_t v10 = "phNciNfc_GetNfccParams: Invalid parameters";
    uint64_t v8 = 1;
LABEL_10:
    sub_2259A0EAC(1, v9, 3u, 1u, (uint64_t)v10);
    goto LABEL_11;
  }
  if (a2 != 4)
  {
    uint64_t v8 = 1;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"phNciNfc_GetNfccParams: Invalid eGetNfccParams");
    goto LABEL_9;
  }
  *(void *)(a1 + 3792) = off_26B606660;
  *(unsigned char *)(a1 + 3992) = 0;
  *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606660);
  uint64_t v8 = sub_2259A9684(a1, 0, 0);
  if (v8 != 13)
  {
LABEL_9:
    uint64_t v9 = (unsigned int *)(a1 + 6532);
    uint64_t v10 = "phNciNfc_GetNfccParams: Sequence failed!";
    goto LABEL_10;
  }
  *(void *)(a1 + 3440) = a3;
  *(void *)(a1 + 3768) = a4;
LABEL_11:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNfccParams");
  return v8;
}

uint64_t sub_225A56DA8(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNciParams");
  if (a1)
  {
    if (a3)
    {
      if (!a2)
      {
        *a3 = *(unsigned char *)(a1 + 6505);
        *(unsigned char *)(a1 + 6505) = 0;
        *(unsigned char *)(a1 + 4624) = 0;
        goto LABEL_9;
      }
      uint64_t v6 = (unsigned int *)(a1 + 6532);
      uint64_t v7 = "phNciNfc_GetNciParams: Invalid Param(eGetNciParams)";
      a2 = 1;
      int v8 = 1;
    }
    else
    {
      uint64_t v7 = "phNciNfc_GetNciParams: Invalid parameters";
      a2 = 1;
      int v8 = 2;
      uint64_t v6 = (unsigned int *)a1;
    }
    sub_2259A0EAC(v8, v6, 3u, 1u, (uint64_t)v7);
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 4u, (uint64_t)"phNciNfc_GetNciParams: Stack not initialized");
    a2 = 49;
  }
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNciParams");
  return a2;
}

uint64_t sub_225A56E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v5, 3u, 5u, (uint64_t)"phNciNfc_ChkFelicaTag");
  if (a2)
  {
    uint64_t v3 = 255;
    if (*(_DWORD *)(a2 + 20) == 2)
    {
      if (*(_DWORD *)(a2 + 16) == 3) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = 255;
      }
    }
  }
  else
  {
    uint64_t v3 = 255;
  }
  sub_2259A10B4(0, (unsigned int *)&v5, 3u, 5u, (uint64_t)"phNciNfc_ChkFelicaTag");
  return v3;
}

uint64_t sub_225A56F2C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfErrorStatus");
  if (a1)
  {
    uint64_t v2 = *(unsigned __int16 *)(a1 + 6626);
    *(_WORD *)(a1 + 6626) = 0;
  }
  else
  {
    uint64_t v2 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfErrorStatus");
  return v2;
}

uint64_t sub_225A56F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreReset");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
      *(void *)(a1 + 3440) = a2;
      *(void *)(a1 + 3768) = a3;
      *(_DWORD *)(a1 + 36) = 0;
      *(void *)(a1 + 3792) = off_26B6069E0;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B6069E0);
      uint64_t v6 = sub_2259A9684(a1, 0, 0);
      if (v6 != 13)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"phNciNfc_CoreReset:gphNciNfc_CoreResetSequence failed");
        *(void *)(a1 + 880) = 0;
        *(_DWORD *)(a1 + 888) = 0;
      }
    }
    else
    {
      uint64_t v6 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"phNciNfc_CoreReset:Invalid parameter passed");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"phNciNfc_CoreReset:Stack not initialized");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreReset");
  return v6;
}

uint64_t sub_225A570D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreInit");
  if (a1)
  {
    if (a2)
    {
      *(void *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 888) = 0;
      *(void *)(a1 + 3440) = a2;
      *(void *)(a1 + 3768) = a3;
      *(_WORD *)(a1 + 40) = 256;
      *(void *)(a1 + 3792) = off_26B606A00;
      *(unsigned char *)(a1 + 3992) = 0;
      *(unsigned char *)(a1 + 3993) = sub_2259CD654((unsigned int *)a1, off_26B606A00);
      uint64_t v6 = sub_2259A9684(a1, 0, 0);
      if (v6 != 13)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"phNciNfc_CoreInit:gphNciNfc_CoreResetSequence failed");
        *(void *)(a1 + 880) = 0;
        *(_DWORD *)(a1 + 888) = 0;
      }
    }
    else
    {
      uint64_t v6 = 1;
      sub_2259A0EAC(1, (unsigned int *)(a1 + 6532), 3u, 1u, (uint64_t)"phNciNfc_CoreInit:Invalid parameter passed");
    }
  }
  else
  {
    sub_2259A0EAC(2, 0, 3u, 1u, (uint64_t)"phNciNfc_CoreInit:Stack not initialized");
    uint64_t v6 = 49;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreInit");
  return v6;
}

uint64_t sub_225A57208(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetDnldCoreContext");
  if (a1)
  {
    uint64_t v4 = 0;
    *(void *)(a1 + 6632) = a2;
  }
  else
  {
    uint64_t v4 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetDnldCoreContext");
  return v4;
}

uint64_t sub_225A57284(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetDnldEseCoreContext");
  if (a1)
  {
    uint64_t v4 = 0;
    *(void *)(a1 + 6640) = a2;
  }
  else
  {
    uint64_t v4 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetDnldEseCoreContext");
  return v4;
}

uint64_t sub_225A57300(uint64_t a1, char a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeDataPktDelayCfg");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 4);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    if (*(unsigned char *)(a1 + 4844) == 1) {
      char v8 = a2;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)(a1 + 6664) = v8;
    sub_22599F8E0(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"phNciNfc_SeDataPktDelayCfg: pNciCtx->bSeTxDelay");
    uint64_t v7 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v7 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeDataPktDelayCfg");
  return v7;
}

uint64_t sub_225A573E0(uint64_t a1, char a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeEUiccSelectCfg");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 4);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    *(unsigned char *)(a1 + 6665) = a2;
    sub_22599F8E0(1, (unsigned int *)(a1 + 6532), 3u, 4u, (uint64_t)"phNciNfc_SeEUiccSelectCfg: pNciCtx->bSeEUiccCfg");
    uint64_t v7 = 0;
  }
  else
  {
LABEL_6:
    uint64_t v7 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeEUiccSelectCfg");
  return v7;
}

uint64_t sub_225A574B4(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSeCreditToStatus");
  if (!a1) {
    goto LABEL_6;
  }
  char v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = *((void *)&unk_26ABD79B8 + 14 * v3 + 4);
    if (v2) {
      break;
    }
    char v2 = 1;
    uint64_t v3 = 1;
  }
  while (v4 != a1);
  if (v4 == a1) {
    uint64_t v5 = *(unsigned __int16 *)(a1 + 6668);
  }
  else {
LABEL_6:
  }
    uint64_t v5 = 255;
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSeCreditToStatus");
  return v5;
}

uint64_t sub_225A57558(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataPktRetransmission");
  if (!a1) {
    goto LABEL_6;
  }
  char v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = *((void *)&unk_26ABD79B8 + 14 * v3 + 4);
    if (v2) {
      break;
    }
    char v2 = 1;
    uint64_t v3 = 1;
  }
  while (v4 != a1);
  if (v4 == a1)
  {
    uint64_t v5 = 0;
    *(unsigned char *)(a1 + 6670) = 0;
  }
  else
  {
LABEL_6:
    uint64_t v5 = 255;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataPktRetransmission");
  return v5;
}

uint64_t sub_225A57604(unsigned int *a1, uint64_t a2)
{
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VldtRmtDevConnectedHandle");
  if (a1)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = (unsigned int *)*((void *)&unk_26ABD79B8 + 14 * v5 + 4);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != a1);
    uint64_t v7 = 255;
    if (a2)
    {
      if (v6 == a1)
      {
        unsigned int v8 = a1[18];
        if (v8)
        {
          unsigned __int8 v9 = 0;
          while (*(void *)&a1[2 * v9 + 20] != a2)
          {
            if (v8 <= ++v9) {
              goto LABEL_11;
            }
          }
          uint64_t v7 = 0;
        }
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t v7 = 255;
  }
  sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VldtRmtDevConnectedHandle");
  return v7;
}

uint64_t sub_225A576E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = 0;
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_ChkNdef");
  sub_2259E0420(v10, &v9);
  uint64_t v5 = 1;
  if (a3)
  {
    if (a2)
    {
      uint64_t v6 = v9;
      if (v9)
      {
        *(void *)(v9 + 8) = a2;
        *(void *)(v6 + 40) = a3;
        *(unsigned char *)(v6 + 540) = 1;
        *(unsigned char *)(v6 + 547) = 1;
        *(unsigned char *)(v6 + 644) = 0;
        *(_WORD *)(v6 + 656) = 0;
        *(unsigned char *)(v6 + 660) = 0;
        *(_DWORD *)(v6 + 918) = 0;
        *(unsigned char *)(v6 + 545) = 3;
        *(unsigned char *)(v6 + 642) = 0;
        phOsalNfc_SetMemory();
        phOsalNfc_SetMemory();
        uint64_t v7 = (unsigned char *)v9;
        *(unsigned char *)(v9 + 544) = 5;
        *uint64_t v7 = 1;
        v7[646] = 9;
        v7[266] = 16;
        uint64_t v5 = sub_225A57800((uint64_t)v7);
      }
    }
  }
  sub_2259A10B4(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_ChkNdef");
  return v5;
}

uint64_t sub_225A57800(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_NxpRead");
  *(unsigned char *)(a1 + 204) &= 0xFCu;
  *(unsigned char *)(a1 + 208) = 0;
  *(void *)(a1 + 48) = sub_225A58170;
  *(void *)(a1 + 56) = a1;
  *(_WORD *)(a1 + 264) = 260;
  *(_DWORD *)(a1 + 232) = 0;
  int v2 = *(unsigned __int8 *)(a1 + 266);
  if (v2 == 120)
  {
    phOsalNfc_MemCopy();
    __int16 v4 = 7;
    if (*(unsigned char *)(a1 + 266) == 120) {
      goto LABEL_10;
    }
  }
  else
  {
    if (v2 == 16)
    {
      char v3 = 16 * *(unsigned char *)(a1 + 660);
    }
    else
    {
      if (v2 != 2)
      {
        uint64_t v5 = 245;
        goto LABEL_12;
      }
      char v3 = *(unsigned char *)(a1 + 642);
    }
    *(unsigned char *)(a1 + 267) = v3;
    __int16 v4 = 2;
  }
  phOsalNfc_MemCopy();
  phOsalNfc_MemCopy();
  v4 += 12;
LABEL_10:
  *(_WORD *)(a1 + 526) = v4;
  uint64_t v5 = sub_2259D97A4(a1, (uint64_t)sub_225A5A2C4);
LABEL_12:
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_NxpRead");
  return v5;
}

uint64_t sub_225A57984(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  v24[33] = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  v24[0] = a1;
  sub_2259A0FB0(0, (unsigned int *)v24, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_RdNdef");
  sub_2259E0420(v24[0], &v23);
  uint64_t v11 = 1;
  if (a4 <= 1)
  {
    if (a3)
    {
      if (a2)
      {
        if (a5)
        {
          uint64_t v12 = v23;
          if (v23)
          {
            if (a4 == 1 || *(unsigned char *)(v23 + 540) != 3)
            {
              *(void *)(v23 + 16) = a5;
              *(void *)(v12 + 40) = a6;
              *(unsigned char *)(v12 + 547) = 2;
              *(void *)(v12 + 240) = a2;
              *(_DWORD *)(v12 + 248) = *a3;
              *(void *)(v12 + 552) = a3;
              *a3 = 0;
              *(_WORD *)(v12 + 252) = 0;
              *(unsigned char *)(v12 + 560) = a4;
              *(unsigned char *)(v12 + 644) = 1;
              *(unsigned char *)(v12 + 647) = 0;
              *(unsigned char *)(v12 + 540) = 2;
              if (a4 || *(unsigned char *)(v12 + 645) != 1)
              {
                if (*(unsigned char *)(v12 + 545) && *(_WORD *)(v12 + 922))
                {
                  if (a4 == 1)
                  {
                    *(unsigned char *)(v12 + 560) = 1;
                    *(_WORD *)(v12 + 656) = 0;
                    *(_WORD *)(v12 + 926) = 0;
                    *(unsigned char *)(v12 + 917) = 0;
                    *(unsigned char *)(v12 + 645) = 0;
                    *(unsigned char *)(v12 + 642) = 0;
                    *(unsigned char *)(v12 + 921) = 0;
                    unsigned int v13 = sub_225A57CB8(v12) >> 7;
                    uint64_t v14 = (char *)v23;
                    *(unsigned char *)(v23 + 660) = v13;
                    BOOL v15 = v14[65] == 0;
                    if (v14[65]) {
                      char v16 = 1;
                    }
                    else {
                      char v16 = 4;
                    }
                    *uint64_t v14 = v16;
                    v14[645] = 0;
                    if (v15) {
                      char v17 = 120;
                    }
                    else {
                      char v17 = 16;
                    }
                    v14[266] = v17;
                    uint64_t v11 = sub_225A57800((uint64_t)v14);
                  }
                  else
                  {
                    *(unsigned char *)uint64_t v12 = 1;
                    sub_2259A0FB0(2, (unsigned int *)v12, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RemainingReadDataCopy");
                    unsigned int v18 = *(unsigned __int8 *)(v12 + 917);
                    int v19 = *(unsigned __int16 *)(v12 + 252);
                    if (*(unsigned char *)(v12 + 917))
                    {
                      unsigned int v20 = *(_DWORD *)(v12 + 248) - v19;
                      phOsalNfc_MemCopy();
                      if (v18 > v20)
                      {
                        phOsalNfc_MemCopy();
                        phOsalNfc_MemCopy();
                        LOWORD(v18) = v20;
                      }
                      LOWORD(v19) = *(_WORD *)(v12 + 252) + v18;
                      *(_WORD *)(v12 + 252) = v19;
                      *(unsigned char *)(v12 + 917) -= v18;
                      __int16 v21 = *(_WORD *)(v12 + 926) - v18;
                      *(_WORD *)(v12 + 926) = v21;
                    }
                    else
                    {
                      __int16 v21 = *(_WORD *)(v12 + 926);
                    }
                    if (v21)
                    {
                      if (*(_DWORD *)(v12 + 248) == (unsigned __int16)v19)
                      {
                        uint64_t v11 = 0;
                        **(_DWORD **)(v12 + 552) = (unsigned __int16)v19;
                      }
                      else
                      {
                        ++*(unsigned char *)(v12 + 660);
                        *(unsigned char *)(v12 + 266) = 16;
                        uint64_t v11 = sub_225A57800(v12);
                      }
                    }
                    else
                    {
                      uint64_t v11 = 0;
                      **(_DWORD **)(v12 + 552) = (unsigned __int16)v19;
                      *(unsigned char *)(v12 + 917) = 0;
                      *(unsigned char *)(v12 + 645) = 1;
                    }
                    sub_2259A10B4(2, (unsigned int *)v12, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RemainingReadDataCopy");
                  }
                }
                else
                {
                  uint64_t v11 = 20;
                }
              }
              else
              {
                uint64_t v11 = 26;
              }
            }
            else
            {
              uint64_t v11 = 245;
            }
          }
        }
      }
    }
  }
  sub_2259A10B4(0, (unsigned int *)v24, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_RdNdef");
  return v11;
}

uint64_t sub_225A57CB8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetNDEFValueFieldAddrForRead");
  LOBYTE(v2) = 0;
  int v3 = *(unsigned __int16 *)(a1 + 918);
  do
  {
    if ((unsigned __int16)(v3 + 1) == 104) {
      int v4 = 128;
    }
    else {
      int v4 = v3 + 1;
    }
    int v3 = v4 + sub_225A5A35C(a1, (unsigned __int16)v4);
    unsigned int v2 = (v2 + 1);
    if (*(unsigned __int16 *)(a1 + 922) <= 0xFEu) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = 3;
    }
  }
  while (v2 < v5);
  if ((unsigned __int16)(v3 + 1) == 104) {
    unsigned __int16 v6 = 128;
  }
  else {
    unsigned __int16 v6 = v3 + 1;
  }
  unsigned __int16 v7 = sub_225A5A35C(a1, v6) + v6;
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetNDEFValueFieldAddrForRead");
  return v7;
}

uint64_t sub_225A57D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = 0;
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_ConvertToReadOnly");
  sub_2259E0420(v10, &v9);
  uint64_t v5 = 1;
  if (a2)
  {
    uint64_t v6 = v9;
    if (v9)
    {
      *(void *)(v9 + 32) = a2;
      *(void *)(v6 + 40) = a3;
      *(unsigned char *)(v6 + 547) = 6;
      *(unsigned char *)uint64_t v6 = 17;
      *(_WORD *)(v6 + 642) = 769;
      *(unsigned char *)(v6 + 266) = 83;
      if (sub_2259CC2AC(*(void *)(v6 + 2712)) == 1) {
        char v7 = 0;
      }
      else {
        char v7 = 15;
      }
      byte_268112EC8 = v7;
      uint64_t v5 = sub_225A57E88(v9, (uint64_t)&byte_268112EC8, 1);
      if (v5 == 13) {
        *(unsigned char *)(v9 + 928) = 0;
      }
    }
  }
  sub_2259A10B4(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_ConvertToReadOnly");
  return v5;
}

uint64_t sub_225A57E88(uint64_t a1, uint64_t a2, char a3)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_NxpWrite");
  *(unsigned char *)(a1 + 204) &= 0xFCu;
  *(unsigned char *)(a1 + 208) = 0;
  *(void *)(a1 + 48) = sub_225A58170;
  *(void *)(a1 + 56) = a1;
  *(_WORD *)(a1 + 264) = 260;
  *(_DWORD *)(a1 + 232) = 0;
  int v5 = *(unsigned __int8 *)(a1 + 266);
  if (v5 == 84)
  {
    char v6 = *(unsigned char *)(a1 + 642);
  }
  else
  {
    if (v5 != 83)
    {
      uint64_t v7 = 245;
      goto LABEL_7;
    }
    char v6 = *(unsigned char *)(a1 + 643) | (8 * *(unsigned char *)(a1 + 642));
  }
  *(unsigned char *)(a1 + 267) = v6;
  phOsalNfc_MemCopy();
  phOsalNfc_MemCopy();
  *(_WORD *)(a1 + 526) = (a3 + 6);
  uint64_t v7 = sub_2259D97A4(a1, (uint64_t)sub_225A5A2C4);
LABEL_7:
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_NxpWrite");
  return v7;
}

uint64_t sub_225A57FB0(uint64_t a1, uint64_t a2, _DWORD *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = 0;
  uint64_t v18 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v18, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_WrNdef");
  sub_2259E0420(v18, &v17);
  uint64_t v11 = 1;
  if (a3 && a5 && v17)
  {
    phOsalNfc_MemCopy();
    uint64_t v12 = v17;
    *(_DWORD *)(v17 + 2740) = 3;
    *(void *)(v12 + 24) = a5;
    *(void *)(v12 + 40) = a6;
    *(unsigned char *)(v12 + 547) = 3;
    *(_WORD *)(v12 + 252) = 0;
    **(_WORD **)(v12 + 528) = 0;
    uint64_t v13 = v17;
    uint64_t v14 = v17 + 2736;
    if (*a3) {
      BOOL v15 = a3;
    }
    else {
      BOOL v15 = (_DWORD *)(v17 + 2740);
    }
    if (*a3) {
      uint64_t v14 = a2;
    }
    *(void *)(v17 + 240) = v14;
    *(_DWORD *)(v13 + 248) = *v15;
    *(_WORD *)(v13 + 252) = 0;
    *(void *)(v13 + 256) = v15;
    *BOOL v15 = 0;
    *(unsigned char *)(v13 + 644) = 2;
    *(unsigned char *)(v13 + 560) = a4;
    *(unsigned char *)(v13 + 540) = 3;
    if (*(unsigned char *)(v13 + 545) == 1)
    {
      uint64_t v11 = 21;
    }
    else if (a4)
    {
      if (*(_WORD *)(v13 + 918))
      {
        if (a4 == 1)
        {
          *(unsigned char *)(v13 + 560) = 1;
          *(_WORD *)(v13 + 656) = 0;
          *(unsigned char *)uint64_t v13 = 1;
          *(unsigned char *)(v13 + 645) = 0;
          *(unsigned char *)(v13 + 660) = 0;
          *(unsigned char *)(v13 + 642) = 1;
          *(unsigned char *)(v13 + 921) = 0;
          *(unsigned char *)(v13 + 266) = 2;
          uint64_t v11 = sub_225A57800(v13);
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        uint64_t v11 = 22;
      }
    }
    else if (*(unsigned char *)(v13 + 645) == 1)
    {
      uint64_t v11 = 26;
    }
    else if (*(_WORD *)(v13 + 918))
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = 22;
    }
  }
  sub_2259A10B4(0, (unsigned int *)&v18, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_WrNdef");
  return v11;
}

uint64_t sub_225A58170(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  v158[1] = *MEMORY[0x263EF8340];
  uint64_t v157 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v157, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_Process");
  if ((_BYTE)a3) {
    goto LABEL_439;
  }
  unsigned int v5 = *a2;
  a3 = 245;
  if (v5 > 3)
  {
    if (v5 == 4)
    {
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkReadID");
      if (*((_WORD *)a2 + 132) == 6)
      {
        if (a2[266] == 18)
        {
          if (phOsalNfc_MemCompare())
          {
            a3 = 22;
          }
          else
          {
            *a2 = 1;
            a2[266] = 16;
            a3 = sub_225A57800(a2);
          }
        }
        else
        {
          a3 = 0;
        }
      }
      else
      {
        a3 = 27;
      }
      uint64_t v35 = "phFriNfc_Tpz_H_ChkReadID";
      goto LABEL_438;
    }
    if (v5 != 16)
    {
      if (v5 == 17)
      {
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProcessReadOnly");
        char v6 = a2[928];
        switch(v6)
        {
          case 0:
            if (*((_WORD *)a2 + 132) != 1)
            {
              char v6 = 0;
              goto LABEL_169;
            }
            a3 = 0;
            char v6 = 0;
            a2[642] = a2[146];
            break;
          case 1:
            if (*((_WORD *)a2 + 132) != 8)
            {
              char v6 = 1;
              goto LABEL_169;
            }
            v158[0] = 0;
            sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateAndWriteLockBits");
            phOsalNfc_MemCopy();
            LOBYTE(v30) = a2[138];
            if (*((_WORD *)a2 + 73) == a2[642])
            {
              int v31 = a2[148];
            }
            else
            {
              int v31 = 0;
              LOBYTE(v30) = v30 - a2[929];
            }
            unsigned __int8 v105 = 64 - 8 * v31;
            if ((v105 & 0xF8u) >= v30)
            {
              if ((v30 & 7) != 0)
              {
                LOBYTE(v158[0]) = LOBYTE(v158[0]) & (255 << (v30 & 7)) | 1;
              }
              else if (v30 >= 8u)
              {
                LOBYTE(v149) = 0;
                do
                {
                  *((unsigned char *)v158 + v31++) = -1;
                  unsigned int v149 = (v149 + 1);
                }
                while (v149 < v30 >> 3);
              }
            }
            else
            {
              unsigned int v30 = v105 >> 3;
              if ((8 * v31) != 64)
              {
                LOBYTE(v106) = 0;
                do
                {
                  *((unsigned char *)v158 + v31++) = -1;
                  unsigned int v106 = (v106 + 1);
                }
                while (v106 < v30);
              }
            }
            a2[929] = v30;
            a2[266] = 84;
            a3 = sub_225A57E88((uint64_t)a2, (uint64_t)v158, 8);
            sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateAndWriteLockBits");
            if (a3 == 13) {
              char v6 = 2;
            }
            else {
              char v6 = 1;
            }
            break;
          case 2:
            if (*((_WORD *)a2 + 132) != 8)
            {
              char v6 = 2;
              goto LABEL_169;
            }
            ++a2[642];
            if (a2[138] == a2[929])
            {
              *((_WORD *)a2 + 321) = 14;
              a2[266] = 2;
              a3 = sub_225A57800(a2);
              char v6 = 3;
            }
            else
            {
              a2[266] = 2;
              a3 = sub_225A57800(a2);
              char v6 = 1;
            }
            break;
          case 3:
            char v6 = 3;
            if (*((_WORD *)a2 + 132) != 8) {
              goto LABEL_169;
            }
            phOsalNfc_MemCopy();
            LOBYTE(v158[0]) = -1;
            goto LABEL_87;
          case 4:
            char v6 = 4;
            if (*((_WORD *)a2 + 132) != 1) {
              goto LABEL_169;
            }
            LOBYTE(v158[0]) = byte_26ABD82EE | 0x7F;
            *((_WORD *)a2 + 321) = 270;
LABEL_87:
            a2[266] = 83;
            a3 = sub_225A57E88((uint64_t)a2, (uint64_t)v158, 1);
            if (a3 == 13) {
              ++v6;
            }
            break;
          case 5:
            if (*((_WORD *)a2 + 132) == 1) {
              a3 = 0;
            }
            else {
              a3 = 27;
            }
            char v6 = 5;
            break;
          default:
LABEL_169:
            a3 = 27;
            break;
        }
        a2[928] = v6;
        uint64_t v35 = "phFriNfc_Tpz_H_ProcessReadOnly";
        goto LABEL_438;
      }
      goto LABEL_440;
    }
    sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProRdForWrResp");
    *a2 = 2;
    if (*((_WORD *)a2 + 132) != 8)
    {
      a3 = 27;
      goto LABEL_412;
    }
    a3 = 0;
    switch(a2[921])
    {
      case 0u:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateNdefTypeField");
        phOsalNfc_MemCopy();
        *((unsigned char *)v158 + a2[643]) = 3;
        *a2 = 2;
        a2[266] = 84;
        a3 = sub_225A57E88((uint64_t)a2, (uint64_t)v158, 8);
        uint64_t v55 = (unsigned int *)a2;
        unsigned int v56 = "phFriNfc_Tpz_H_UpdateNdefTypeField";
        goto LABEL_411;
      case 2u:
      case 3u:
      case 4u:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateLenFieldZeroAfterRead");
        if (*((_DWORD *)a2 + 62) >= *((unsigned __int16 *)a2 + 462)) {
          unsigned __int16 v12 = *((_WORD *)a2 + 462);
        }
        else {
          unsigned __int16 v12 = *((_DWORD *)a2 + 62);
        }
        *a2 = 2;
        phOsalNfc_MemCopy();
        int v13 = a2[921];
        if (v13 == 2) {
          word_26ABD82FA = 0;
        }
        int v14 = *((unsigned __int16 *)a2 + 126);
        __int16 v15 = a2[643];
        if (a2[643]) {
          a2[643] = 0;
        }
        unsigned __int16 v16 = word_26ABD82FA + v15;
        if (v16 > 7u)
        {
          int v45 = v14;
          goto LABEL_400;
        }
        unsigned __int8 v17 = 0;
        while (2)
        {
          if (*((unsigned __int16 *)a2 + 126) == v12) {
            goto LABEL_401;
          }
          unsigned int v18 = v16;
          word_26ABD82FA = 0;
          unsigned int v19 = sub_225A5A35C((uint64_t)a2, 8 * a2[642] + v17);
          word_26ABD82FA = v19;
          if (!v19)
          {
            if ((v13 - 3) >= 2)
            {
              if (v13 == 2)
              {
                *((unsigned char *)v158 + v18) = 0;
                unsigned __int16 v16 = v18 + 1;
                if ((unsigned __int16)(v18 + 1) == 8) {
                  int v20 = 2;
                }
                else {
                  int v20 = 3;
                }
                if (v12 >= 0xFFu) {
                  int v13 = v20;
                }
                else {
                  int v13 = 5;
                }
              }
              else
              {
                uint64_t v21 = *((unsigned __int16 *)a2 + 126);
                *((unsigned char *)v158 + v18) = *(unsigned char *)(*((void *)a2 + 30) + v21);
                unsigned __int16 v16 = v18 + 1;
                *((_WORD *)a2 + 126) = v21 + 1;
              }
            }
            else
            {
              *((unsigned char *)v158 + v18) = 0;
              unsigned __int16 v16 = v18 + 1;
              if (v18 != 7) {
                ++v13;
              }
            }
            unsigned __int8 v17 = a2[643] + 1;
            a2[643] = v17;
LABEL_51:
            if (v16 >= 8u) {
              goto LABEL_399;
            }
            continue;
          }
          break;
        }
        if (8 - v18 > v19)
        {
          unsigned __int8 v17 = a2[643] + v19;
          a2[643] = v17;
          unsigned __int16 v16 = v19 + v18;
          word_26ABD82FA = 0;
          goto LABEL_51;
        }
        word_26ABD82FA = v19 - (8 - v18);
LABEL_399:
        int v45 = *((unsigned __int16 *)a2 + 126);
LABEL_400:
        if (v45 == v12)
        {
LABEL_401:
          LOBYTE(v13) = 5;
          goto LABEL_407;
        }
        if (v13 == 5 && v14 == v45)
        {
          if (v12 >= 0xFFu) {
            LOBYTE(v13) = 4;
          }
          else {
            LOBYTE(v13) = 2;
          }
        }
LABEL_407:
        a2[921] = v13;
        a2[643] = 0;
        a2[266] = 84;
        a3 = sub_225A57E88((uint64_t)a2, (uint64_t)v158, 8);
        unsigned int v56 = "phFriNfc_Tpz_H_UpdateLenFieldZeroAfterRead";
        goto LABEL_410;
      case 5u:
      case 6u:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CopyReadDataAndWrite");
        if (*((_DWORD *)a2 + 62) >= *((unsigned __int16 *)a2 + 462)) {
          unsigned __int16 v32 = *((_WORD *)a2 + 462);
        }
        else {
          unsigned __int16 v32 = *((_DWORD *)a2 + 62);
        }
        phOsalNfc_MemCopy();
        int v33 = a2[642];
        if (v33 == sub_225A59F74((uint64_t)a2, v32) >> 3)
        {
          int v34 = 0;
          word_26ABD82F6 = 0;
        }
        else
        {
          int v34 = (unsigned __int16)word_26ABD82F6;
          if (word_26ABD82F6 && (unsigned __int16)word_26ABD82F6 >= 8u)
          {
            word_26ABD82F6 -= 8;
            unsigned int v57 = (unsigned __int16 *)(a2 + 252);
            LOWORD(v34) = v34 - 8;
            goto LABEL_176;
          }
        }
        unsigned int v57 = (unsigned __int16 *)(a2 + 252);
        if (*((unsigned __int16 *)a2 + 126) == v32) {
          goto LABEL_176;
        }
        unsigned __int8 v100 = a2[643];
        while (2)
        {
          word_26ABD82F6 = 0;
          unsigned int v101 = sub_225A5A35C((uint64_t)a2, 8 * a2[642] + v100);
          word_26ABD82F6 = v101;
          if (!v101)
          {
            uint64_t v104 = *((unsigned __int16 *)a2 + 126);
            *((unsigned char *)v158 + (unsigned __int16)v34++) = *(unsigned char *)(*((void *)a2 + 30) + v104);
            unsigned __int16 v103 = v104 + 1;
            *((_WORD *)a2 + 126) = v103;
            unsigned __int8 v100 = a2[643] + 1;
            a2[643] = v100;
            goto LABEL_271;
          }
          unsigned int v102 = 8 - (unsigned __int16)v34;
          if (v102 > v101)
          {
            unsigned __int8 v100 = a2[643] + v101;
            a2[643] = v100;
            v34 += v101;
            word_26ABD82F6 = 0;
            unsigned __int16 v103 = *((_WORD *)a2 + 126);
LABEL_271:
            if ((unsigned __int16)v34 >= 8u || v32 == v103) {
              goto LABEL_408;
            }
            continue;
          }
          break;
        }
        LOWORD(v34) = v101 - v102;
        word_26ABD82F6 = v101 - v102;
        a2[643] = 0;
LABEL_176:
        if (*v57 != v32 && (_WORD)v34)
        {
          char v58 = 6;
          goto LABEL_409;
        }
LABEL_408:
        char v58 = 5;
LABEL_409:
        a2[921] = v58;
        a2[266] = 84;
        a3 = sub_225A57E88((uint64_t)a2, (uint64_t)v158, 8);
        unsigned int v56 = "phFriNfc_Tpz_H_CopyReadDataAndWrite";
        goto LABEL_410;
      case 7u:
      case 8u:
      case 9u:
        sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateLenFieldValuesAfterRead");
        if (*((_DWORD *)a2 + 62) >= *((unsigned __int16 *)a2 + 462)) {
          unsigned __int16 v27 = *((_WORD *)a2 + 462);
        }
        else {
          unsigned __int16 v27 = *((_DWORD *)a2 + 62);
        }
        *a2 = 2;
        phOsalNfc_MemCopy();
        int v28 = a2[921];
        if (v28 == 7)
        {
          int v29 = 0;
          word_26ABD82F8 = 0;
        }
        else
        {
          int v29 = (unsigned __int16)word_26ABD82F8;
        }
        int v46 = a2[643];
        int v47 = v29 + v46;
        if ((unsigned __int16)(v29 + v46) > 7u) {
          goto LABEL_375;
        }
        while (2)
        {
          word_26ABD82F8 = 0;
          unsigned int v48 = sub_225A5A35C((uint64_t)a2, 8 * a2[642] + v46);
          word_26ABD82F8 = v48;
          if (v48)
          {
            unsigned int v49 = 8 - (unsigned __int16)v47;
            if (v49 > v48)
            {
              int v50 = 0;
              LOBYTE(v46) = a2[643] + v48;
              a2[643] = v46;
              v47 += v48;
              word_26ABD82F8 = 0;
              goto LABEL_161;
            }
            word_26ABD82F8 = v48 - v49;
LABEL_375:
            a2[921] = v28;
            a2[266] = 84;
            a3 = sub_225A57E88((uint64_t)a2, (uint64_t)v158, 8);
            unsigned int v56 = "phFriNfc_Tpz_H_UpdateLenFieldValuesAfterRead";
LABEL_410:
            uint64_t v55 = (unsigned int *)a2;
LABEL_411:
            sub_2259A10B4(2, v55, 8u, 5u, (uint64_t)v56);
LABEL_412:
            uint64_t v35 = "phFriNfc_Tpz_H_ProRdForWrResp";
            goto LABEL_438;
          }
          switch(v28)
          {
            case 9:
              goto LABEL_147;
            case 8:
              int v50 = 0;
              char v51 = a2[253];
              break;
            case 7:
              if (v27 > 0xFEu)
              {
                int v50 = 0;
                char v51 = -1;
              }
              else
              {
LABEL_147:
                char v51 = a2[252];
                int v50 = 1;
              }
              break;
            default:
              int v50 = 0;
LABEL_152:
              if ((unsigned __int16)++v47 != 8 && v28 != 9 && v27 > 0xFEu) {
                ++v28;
              }
              LOBYTE(v46) = a2[643] + 1;
              a2[643] = v46;
LABEL_161:
              if ((unsigned __int16)v47 > 7u || v50 != 0) {
                goto LABEL_375;
              }
              continue;
          }
          break;
        }
        *((unsigned char *)v158 + (unsigned __int16)v47) = v51;
        goto LABEL_152;
      default:
        goto LABEL_412;
    }
  }
  if (v5 != 1)
  {
    if (v5 == 2)
    {
      LOBYTE(v158[0]) = 0;
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProWrResp");
      unsigned __int8 v7 = a2[921];
      unsigned int v8 = *((_DWORD *)a2 + 62);
      if (v8 >= *((unsigned __int16 *)a2 + 462)) {
        unsigned int v8 = *((unsigned __int16 *)a2 + 462);
      }
      switch(a2[921])
      {
        case 0u:
          if (*((_WORD *)a2 + 132) != 8) {
            goto LABEL_136;
          }
          *a2 = 2;
          a2[921] = 1;
          *((_WORD *)a2 + 321) = 1;
          a2[266] = 83;
          goto LABEL_133;
        case 1u:
          if (*((_WORD *)a2 + 132) != 1) {
            goto LABEL_136;
          }
          char v11 = 2;
          goto LABEL_129;
        case 2u:
          if (*((_WORD *)a2 + 132) != 8) {
            goto LABEL_136;
          }
          if (v8 >= 0xFF)
          {
            a2[643] = 0;
            int v36 = a2[642];
            if (v36 == 12) {
              char v37 = 16;
            }
            else {
              char v37 = v36 + 1;
            }
            a2[642] = v37;
            char v11 = 3;
            goto LABEL_129;
          }
LABEL_113:
          unsigned int v38 = sub_225A59F74((uint64_t)a2, (unsigned __int16)v8);
          a2[642] = v38 >> 3;
          a2[921] = 5;
          a2[643] = v38 & 7;
          if ((v38 & 7) != 0) {
            goto LABEL_130;
          }
          goto LABEL_380;
        case 3u:
        case 8u:
          if (*((_WORD *)a2 + 132) != 8) {
            goto LABEL_136;
          }
          a2[643] = 0;
          int v9 = a2[642];
          if (v9 == 12) {
            char v10 = 16;
          }
          else {
            char v10 = v9 + 1;
          }
          a2[642] = v10;
          char v11 = v7 + 1;
          goto LABEL_129;
        case 4u:
          if (*((_WORD *)a2 + 132) == 8) {
            goto LABEL_113;
          }
          goto LABEL_136;
        case 5u:
          if (*((_WORD *)a2 + 132) != 8) {
            goto LABEL_136;
          }
          if (*((unsigned __int16 *)a2 + 126) == (unsigned __int16)v8)
          {
            **((_DWORD **)a2 + 32) = v8;
            char v11 = 7;
            goto LABEL_129;
          }
          a2[643] = 0;
          int v143 = a2[642];
          if (v143 == 12) {
            char v144 = 16;
          }
          else {
            char v144 = v143 + 1;
          }
          a2[642] = v144;
LABEL_380:
          uint64_t v43 = sub_225A5A050((uint64_t)a2);
          break;
        case 6u:
          if (*((_WORD *)a2 + 132) != 8) {
            goto LABEL_136;
          }
          a2[643] = 0;
          int v39 = a2[642];
          if (v39 == 12) {
            char v40 = 16;
          }
          else {
            char v40 = v39 + 1;
          }
          a2[642] = v40;
          goto LABEL_130;
        case 7u:
          if (*((_WORD *)a2 + 132) != 8) {
            goto LABEL_136;
          }
          if (v8 <= 0xFE)
          {
LABEL_132:
            a2[266] = 83;
            *a2 = 2;
            LOBYTE(v158[0]) = -31;
            *((_WORD *)a2 + 321) = 1;
            a2[921] = 10;
LABEL_133:
            uint64_t v43 = sub_225A57E88((uint64_t)a2, (uint64_t)v158, 1);
          }
          else
          {
            a2[643] = 0;
            int v41 = a2[642];
            if (v41 == 12) {
              char v42 = 16;
            }
            else {
              char v42 = v41 + 1;
            }
            a2[642] = v42;
            char v11 = 8;
LABEL_129:
            a2[921] = v11;
LABEL_130:
            uint64_t v43 = sub_225A59E3C((uint64_t)a2);
          }
          break;
        case 9u:
          if (*((_WORD *)a2 + 132) == 8) {
            goto LABEL_132;
          }
          goto LABEL_136;
        case 0xAu:
          if (*((_WORD *)a2 + 132) == 1)
          {
            a3 = 0;
            int v44 = *((unsigned __int16 *)a2 + 126);
            **((_DWORD **)a2 + 32) = v44;
            *((_WORD *)a2 + 461) = v44;
          }
          else
          {
LABEL_136:
            a3 = 27;
          }
          goto LABEL_382;
        default:
          a3 = 0;
          goto LABEL_382;
      }
      a3 = v43;
LABEL_382:
      uint64_t v35 = "phFriNfc_Tpz_H_ProWrResp";
      goto LABEL_438;
    }
    goto LABEL_440;
  }
  LOBYTE(v158[0]) = 0;
  sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProReadResp");
  int v22 = a2[540];
  if (v22 == 3)
  {
    if (*((_WORD *)a2 + 132) == 8)
    {
      phOsalNfc_MemCopy();
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytesForWrite");
      if (a2[652] != 225 && a2[652] || a2[655])
      {
        sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytesForWrite");
        a3 = 22;
      }
      else
      {
        sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytesForWrite");
        if (a2[652] && a2[920] != 6)
        {
          a2[921] = 1;
          *((_WORD *)a2 + 321) = 1;
          *a2 = 2;
          a2[266] = 83;
          uint64_t v108 = sub_225A57E88((uint64_t)a2, (uint64_t)v158, 1);
        }
        else
        {
          *a2 = 16;
          a2[921] = 0;
          unsigned int v107 = *((unsigned __int16 *)a2 + 459);
          a2[642] = v107 >> 3;
          a2[643] = v107 & 7;
          a2[266] = 2;
          uint64_t v108 = sub_225A57800(a2);
        }
        a3 = v108;
      }
      goto LABEL_437;
    }
    goto LABEL_71;
  }
  if (v22 == 2)
  {
    if (*((_WORD *)a2 + 132) == 128)
    {
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CopyReadData");
      if (a2[560]) {
        LOWORD(v26) = *((_WORD *)a2 + 461);
      }
      else {
        LOWORD(v26) = *((_WORD *)a2 + 126) + *((_WORD *)a2 + 463);
      }
      unsigned int v60 = *((unsigned __int16 *)a2 + 132);
      unsigned int v61 = (unsigned __int16)v26;
      if (*((_DWORD *)a2 + 62) >= (unsigned __int16)v26) {
        int v26 = (unsigned __int16)v26;
      }
      else {
        int v26 = *((_DWORD *)a2 + 62);
      }
      int v155 = v26;
      unsigned int v62 = sub_225A57CB8((uint64_t)a2);
      unint64_t v63 = &unk_26ABD8000;
      if (a2[660] == v62 >> 7)
      {
        char v64 = sub_225A57CB8((uint64_t)a2);
        unint64_t v63 = (_WORD *)&unk_26ABD8000;
        unsigned int v65 = v64 & 0x7F;
      }
      else
      {
        unsigned int v65 = (unsigned __int16)word_26ABD82F0;
        if (!word_26ABD82F0)
        {
LABEL_195:
          int v66 = v155;
          unsigned int v154 = v61;
          if (v65 >= v60) {
            goto LABEL_262;
          }
          int v67 = 0;
          int v68 = 0;
          unsigned int v69 = 0;
          int v153 = v61 - v155;
LABEL_197:
          if (!v67 && !a2[660] || (unsigned __int16)v65 <= 0x67u && !a2[660])
          {
            LOWORD(v78) = *((_WORD *)a2 + 132) - 24;
            v63[376] = 24;
            int v67 = 1;
            goto LABEL_233;
          }
          int v70 = a2[130];
          if (v70 == v69)
          {
            unsigned int v71 = 0;
            goto LABEL_215;
          }
          int v72 = a2[660];
          unsigned int v71 = v72 << 7;
          unsigned int v73 = (unsigned __int16)(v65 + ((_WORD)v72 << 7));
          while (1)
          {
            v74 = &a2[4 * v69 + 96];
            unsigned int v75 = *(unsigned __int16 *)v74;
            unsigned int v76 = *((unsigned __int16 *)v74 + 1) + v75;
            if (v72 == v75 >> 7)
            {
              if (v76 >= v73)
              {
                __int16 v79 = sub_225A5A35C((uint64_t)a2, v75);
                unint64_t v63 = &unk_26ABD8000;
                int v66 = v155;
                word_26ABD82F0 = v79;
                unsigned int v71 = v75;
LABEL_214:
                ++v69;
LABEL_215:
                int v80 = a2[184];
                if (v80 == v68)
                {
                  LOWORD(v78) = v71;
                  goto LABEL_233;
                }
                int v81 = a2[660];
                LOWORD(v78) = (_WORD)v81 << 7;
                unsigned int v82 = (unsigned __int16)(v65 + ((_WORD)v81 << 7));
                while (1)
                {
                  unsigned int v83 = &a2[4 * v68 + 150];
                  unsigned int v84 = *(unsigned __int16 *)v83;
                  unsigned int v85 = *((unsigned __int16 *)v83 + 1) + v84;
                  if (v81 == v84 >> 7)
                  {
                    if (v85 >= v82)
                    {
                      unsigned int v69 = (__PAIR64__(v69, v84) - v71) >> 32;
                      if (v84 <= (unsigned __int16)(v71 - 1)) {
                        unsigned int v78 = v84;
                      }
                      else {
                        unsigned int v78 = v71;
                      }
                      if (v78 == v84)
                      {
                        __int16 v87 = sub_225A5A35C((uint64_t)a2, v84);
                        unint64_t v63 = &unk_26ABD8000;
                        int v66 = v155;
                        word_26ABD82F0 = v87;
                        ++v68;
                        LOWORD(v78) = v84;
                      }
LABEL_233:
                      int v88 = (unsigned __int16)v78;
                      __int16 v89 = v78 & 0x7F;
                      if ((_WORD)v78) {
                        int v90 = v78 & 0x7F;
                      }
                      else {
                        int v90 = v60;
                      }
                      if (v90 != (unsigned __int16)v65)
                      {
                        unsigned __int16 v91 = v90 - v65;
                        int v92 = *((unsigned __int16 *)a2 + 126);
                        if (v92 == (unsigned __int16)v66)
                        {
                          if ((_WORD)v88) {
                            unsigned __int16 v93 = v89 - v65;
                          }
                          else {
                            unsigned __int16 v93 = v91;
                          }
                          if (v66 + a2[917] < v154)
                          {
                            if (v153 < v93) {
                              unsigned __int16 v93 = v153;
                            }
                            phOsalNfc_MemCopy();
                            unint64_t v63 = (_WORD *)&unk_26ABD8000;
                            int v66 = v155;
                            a2[917] += v93;
                          }
                          LOWORD(v65) = v93 + v65;
                        }
                        else
                        {
                          if (v91 >= (unsigned __int16)(v66 - v92)) {
                            unsigned __int16 v94 = v66 - v92;
                          }
                          else {
                            unsigned __int16 v94 = v91;
                          }
                          phOsalNfc_MemCopy();
                          unint64_t v63 = &unk_26ABD8000;
                          int v66 = v155;
                          LOWORD(v65) = v94 + v65;
                          *((_WORD *)a2 + 126) += v94;
                          *((_WORD *)a2 + 463) -= v94;
                        }
                      }
                      if ((a2[660] << 7) + (unsigned __int16)v65 == v88)
                      {
                        unsigned int v95 = (unsigned __int16)v65 + (unsigned __int16)v63[376];
                        BOOL v96 = v95 > v60;
                        if (v63[376])
                        {
                          __int16 v97 = v60 - v65;
                          goto LABEL_255;
                        }
                      }
                      else
                      {
                        BOOL v96 = (unsigned __int16)v65 > v60;
                        LOWORD(v95) = v65;
                      }
                      __int16 v97 = 0;
LABEL_255:
                      BOOL v98 = !v96;
                      if (v96) {
                        __int16 v99 = v97;
                      }
                      else {
                        __int16 v99 = 0;
                      }
                      if (v98) {
                        LOWORD(v65) = v95;
                      }
                      else {
                        LOWORD(v65) = v60;
                      }
                      v63[376] = v99;
                      if (v60 <= (unsigned __int16)v65)
                      {
LABEL_262:
                        if (*((unsigned __int16 *)a2 + 126) == (unsigned __int16)v66)
                        {
                          **((_DWORD **)a2 + 69) = (unsigned __int16)v66;
                          a3 = 0;
                          if ((unsigned __int16)v66 == v154)
                          {
                            a2[917] = 0;
                            a2[645] = 1;
                          }
                          else
                          {
                            *((_WORD *)a2 + 463) = v154 - v66;
                          }
                        }
                        else
                        {
                          ++a2[660];
                          a2[266] = 16;
                          a3 = sub_225A57800(a2);
                        }
                        uint64_t v109 = "phFriNfc_Tpz_H_CopyReadData";
                        goto LABEL_436;
                      }
                      goto LABEL_197;
                    }
                  }
                  else if (v81 == v85 >> 7 && v85 >= v82)
                  {
                    ++v68;
                    goto LABEL_233;
                  }
                  if (v80 == ++v68)
                  {
                    LOWORD(v78) = v71;
                    int v68 = a2[184];
                    goto LABEL_233;
                  }
                }
              }
            }
            else if (v72 == v76 >> 7 && v76 >= v73)
            {
              goto LABEL_214;
            }
            if (v70 == ++v69)
            {
              unsigned int v71 = 0;
              unsigned int v69 = a2[130];
              goto LABEL_215;
            }
          }
        }
      }
      v63[376] = 0;
      goto LABEL_195;
    }
LABEL_71:
    a3 = 27;
    goto LABEL_437;
  }
  if (v22 != 1) {
    goto LABEL_437;
  }
  if (*((_WORD *)a2 + 132) != 128) {
    goto LABEL_71;
  }
  if (a2[660]) {
    goto LABEL_58;
  }
  sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytes");
  phOsalNfc_MemCopy();
  if (a2[652] != 225 && a2[652]) {
    goto LABEL_434;
  }
  a3 = sub_225A277B4((unsigned int *)a2, a2[653]);
  if (a3)
  {
LABEL_435:
    a2[545] = 3;
    uint64_t v109 = "phFriNfc_Tpz_H_CheckCCBytes";
    goto LABEL_436;
  }
  if (a2[654] != 63)
  {
LABEL_434:
    a3 = 22;
    goto LABEL_435;
  }
  *((_WORD *)a2 + 101) = 500;
  *((_WORD *)a2 + 320) = 512;
  sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_Dynamic_H_ChkLockBits");
  int v59 = a2[655];
  if (a2[655])
  {
    if (v59 == 15)
    {
      LOBYTE(v59) = 1;
      goto LABEL_186;
    }
    a2[545] = 3;
    sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_Dynamic_H_ChkLockBits");
    goto LABEL_434;
  }
LABEL_186:
  a2[545] = v59;
  sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_Dynamic_H_ChkLockBits");
  sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytes");
LABEL_58:
  int v23 = a2[920];
  sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseTLVs");
  unsigned __int16 v24 = *((_WORD *)a2 + 132);
  if (a2[660])
  {
    unsigned int v25 = 0;
  }
  else
  {
    byte_26ABD82EC[0] = 0;
    *(_DWORD *)&word_26ABD82F2 = 0;
    v24 -= 24;
    unsigned int v25 = 12;
  }
  a3 = 0;
  BOOL v110 = v23 != 8;
  BOOL v111 = 1;
  if (v25 >= v24 || v23 == 8) {
    goto LABEL_385;
  }
  v112 = a2 + 266;
  v156 = a2 + 96;
  while (1)
  {
    int v113 = (unsigned __int16)word_26ABD82F2;
    if (!word_26ABD82F2)
    {
      int v113 = sub_225A5A35C((uint64_t)a2, (unsigned __int16)(v25 + (a2[660] << 7)));
      word_26ABD82F2 = v113;
      if (!v113) {
        break;
      }
    }
    if (v24 - (unsigned __int16)v25 < v113)
    {
      a3 = 0;
      BOOL v111 = 1;
      goto LABEL_384;
    }
    a3 = 0;
    v25 += v113;
    word_26ABD82F2 = 0;
LABEL_296:
    BOOL v111 = a3 == 0;
    BOOL v110 = v23 != 8;
    if ((unsigned __int16)v25 >= v24 || a3 != 0 || v23 == 8) {
      goto LABEL_385;
    }
  }
  switch(v23)
  {
    case 0:
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseLockTLVType");
      int v116 = v112[(unsigned __int16)v25];
      if (v116 == 1) {
        unsigned int v117 = v25 + 1;
      }
      else {
        unsigned int v117 = v25;
      }
      if (v116 == 1) {
        int v118 = 1;
      }
      else {
        int v118 = 3;
      }
      if (v112[(unsigned __int16)v25]) {
        unsigned int v25 = v117;
      }
      else {
        ++v25;
      }
      if (v116) {
        int v23 = v118;
      }
      else {
        int v23 = 0;
      }
      int v119 = (unsigned int *)a2;
      int v120 = "phFriNfc_Tpz_H_ParseLockTLVType";
      goto LABEL_359;
    case 1:
      if (v112[(unsigned __int16)v25] != 3)
      {
        BOOL v111 = 0;
        a3 = 22;
        int v23 = 1;
        goto LABEL_446;
      }
      a3 = 0;
      ++v25;
LABEL_348:
      int v23 = 2;
      goto LABEL_296;
    case 2:
      char v121 = byte_26ABD82EC[0];
      byte_26ABD82EC[byte_26ABD82EC[0] + 16] = v112[(unsigned __int16)v25++];
      byte_26ABD82EC[0] = v121 + 1;
      if ((v121 + 1) != 3)
      {
        a3 = 0;
        goto LABEL_348;
      }
      phOsalNfc_MemCopy();
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetLockBytesInfo");
      int v122 = byte_26ABD82FC >> 4;
      int v123 = byte_26ABD82FC & 0xF;
      if ((byte_26ABD82FD & 7) != 0) {
        int v124 = (byte_26ABD82FD >> 3) + 1;
      }
      else {
        int v124 = byte_26ABD82FD >> 3;
      }
      uint64_t v125 = a2[130];
      int v126 = &v156[4 * v125];
      *((_WORD *)v126 + 1) = v124;
      int v127 = (v122 << (byte_26ABD82FE & 0xF)) + v123;
      *(_WORD *)int v126 = v127;
      if ((unsigned __int16)v127 < 0x78u || v124 + (unsigned __int16)v127 > 8 * a2[654] + 8)
      {
        *(_WORD *)int v126 = 0;
        a3 = 22;
      }
      else
      {
        a3 = 0;
        *((_WORD *)a2 + 73) = (unsigned __int16)v127 >> 3;
        *((_WORD *)a2 + 74) = v127 & 7;
      }
      a2[130] = v125 + 1;
      sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetLockBytesInfo");
      byte_26ABD82EC[0] = 0;
      int v23 = 3;
      goto LABEL_296;
    case 3:
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseMemTLVType");
      int v128 = v112[(unsigned __int16)v25];
      if (v112[(unsigned __int16)v25])
      {
        if (v128 == 2)
        {
          ++v25;
          int v23 = 4;
        }
        else if (v128 == 1)
        {
          ++v25;
          int v23 = 1;
        }
        else
        {
          int v23 = 6;
        }
      }
      else
      {
        ++v25;
        int v23 = 3;
      }
      int v119 = (unsigned int *)a2;
      int v120 = "phFriNfc_Tpz_H_ParseMemTLVType";
LABEL_359:
      sub_2259A10B4(2, v119, 8u, 5u, (uint64_t)v120);
      goto LABEL_360;
    case 4:
      if (v112[(unsigned __int16)v25] != 3)
      {
        BOOL v111 = 0;
        a3 = 22;
        int v23 = 4;
        goto LABEL_446;
      }
      a3 = 0;
      ++v25;
LABEL_350:
      int v23 = 5;
      goto LABEL_296;
    case 5:
      char v129 = byte_26ABD82EC[0];
      byte_26ABD82EC[byte_26ABD82EC[0] + 16] = v112[(unsigned __int16)v25++];
      byte_26ABD82EC[0] = v129 + 1;
      if ((v129 + 1) != 3)
      {
        a3 = 0;
        goto LABEL_350;
      }
      word_26ABD82F4 = v25 + (a2[660] << 7);
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetMemBytesInfo");
      int v130 = byte_26ABD82FC >> 4;
      int v131 = byte_26ABD82FC & 0xF;
      int v132 = byte_26ABD82FD;
      uint64_t v133 = a2[184];
      v134 = &a2[4 * v133 + 150];
      *((_WORD *)v134 + 1) = byte_26ABD82FD;
      int v135 = (v130 << (byte_26ABD82FE & 0xF)) + v131;
      *(_WORD *)v134 = v135;
      uint64_t v136 = a2[130];
      unsigned int v137 = *(unsigned __int16 *)&v156[4 * v136];
      if (v137 <= (unsigned __int16)v135 && *(unsigned __int16 *)&v156[4 * v136 + 2] + v137 > (unsigned __int16)v135) {
        goto LABEL_369;
      }
      unsigned int v138 = (unsigned __int16)v135 + v132;
      if (v138 <= v137)
      {
        if ((unsigned __int16)v135 < 0x78u) {
          goto LABEL_369;
        }
        unsigned int v139 = v137 + *(unsigned __int16 *)&v156[4 * v136 + 2];
      }
      else if ((unsigned __int16)v135 < 0x78u || (unsigned int v139 = v137 + *(unsigned __int16 *)&v156[4 * v136 + 2], v138 <= v139))
      {
LABEL_369:
        *(_WORD *)v134 = 0;
        a3 = 22;
        goto LABEL_370;
      }
      if (v139 > 8 * a2[654]) {
        goto LABEL_369;
      }
      a3 = 0;
      *((_WORD *)a2 + 99) = (unsigned __int16)v135 >> 3;
      *((_WORD *)a2 + 100) = v135 & 7;
LABEL_370:
      a2[184] = v133 + 1;
      sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetMemBytesInfo");
      byte_26ABD82EC[0] = 0;
      int v23 = 6;
      goto LABEL_296;
    case 6:
      sub_2259A0FB0(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseNdefTLVType");
      switch(v112[(unsigned __int16)v25])
      {
        case 0u:
          a3 = 0;
          ++v25;
          int v23 = 6;
          break;
        case 1u:
          a3 = 0;
          ++v25;
          int v23 = 1;
          break;
        case 2u:
          a3 = 0;
          ++v25;
          int v23 = 4;
          break;
        case 3u:
          a3 = 0;
          ++v25;
          int v23 = 7;
          break;
        default:
          int v23 = 0;
          a3 = 22;
          break;
      }
      sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseNdefTLVType");
      goto LABEL_296;
    case 7:
      char v140 = byte_26ABD82EC[0];
      if (byte_26ABD82EC[0])
      {
        byte_26ABD82EC[byte_26ABD82EC[0] + 16] = v112[(unsigned __int16)v25++];
        byte_26ABD82EC[0] = v140 + 1;
        if ((v140 + 1) == 3)
        {
          a3 = 0;
          byte_26ABD82EC[0] = 0;
          *((_WORD *)a2 + 461) = bswap32(*(unsigned __int16 *)&byte_26ABD82FD) >> 16;
          BOOL v111 = 1;
          int v23 = 8;
          goto LABEL_446;
        }
        a3 = 0;
        int v23 = 7;
        goto LABEL_296;
      }
      *((_WORD *)a2 + 459) = v25 + (a2[660] << 7) - 1;
      signed int v141 = v112[(unsigned __int16)v25];
      if ((int)(*((unsigned __int16 *)a2 + 320) + (~(_WORD)v25 | 0xFFFF0000)) >= v141)
      {
        if (v141 == 255)
        {
          byte_26ABD82FC = -1;
          char v142 = 1;
          int v23 = 7;
        }
        else
        {
          char v142 = 0;
          *((_WORD *)a2 + 461) = v141;
          int v23 = 8;
        }
        a3 = 0;
        byte_26ABD82EC[0] = v142;
        ++v25;
        goto LABEL_296;
      }
      BOOL v111 = 0;
      byte_26ABD82EC[0] = 0;
      a3 = 22;
      int v23 = 7;
LABEL_446:
      unsigned __int16 v24 = v25;
LABEL_384:
      BOOL v110 = v23 != 8;
      LOWORD(v25) = v24;
LABEL_385:
      sub_2259DCD00((unsigned int *)a2, (_DWORD *)a2 + 24, a2[130]);
      sub_2259DCD00((unsigned int *)a2, a2 + 150, a2[184]);
      a2[920] = v23;
      int v145 = a2[660];
      __int16 v146 = *((_WORD *)a2 + 320) - v25;
      if (!a2[660]) {
        v146 -= 24;
      }
      *((_WORD *)a2 + 320) = v146;
      if (!v111 || v23 != 8)
      {
        if (a3) {
          BOOL v147 = 0;
        }
        else {
          BOOL v147 = v110;
        }
        if (!v147) {
          goto LABEL_421;
        }
        int v148 = v145 + 1;
        a2[660] = v148;
        if (v148 != 4)
        {
          a2[266] = 16;
          a3 = sub_225A57800(a2);
          goto LABEL_421;
        }
        a3 = 22;
LABEL_423:
        *((_WORD *)a2 + 459) = 0;
        *((_WORD *)a2 + 461) = 0;
        goto LABEL_424;
      }
      a3 = sub_225A5A420((uint64_t)a2);
      if (a2[545] != 1 && *((_WORD *)a2 + 461)) {
        a2[545] = 2;
      }
LABEL_421:
      if (!a3)
      {
LABEL_424:
        if (!a2[652] || v23 == 6 && a2[660] == 4)
        {
          *((_WORD *)a2 + 461) = 0;
          a2[545] = 0;
          unsigned __int16 v150 = word_26ABD82F4;
          if (word_26ABD82F4)
          {
            do
            {
              int v151 = sub_225A5A35C((uint64_t)a2, v150);
              unsigned __int16 v150 = word_26ABD82F4 + v151;
              word_26ABD82F4 += v151;
            }
            while (v151);
            *((_WORD *)a2 + 459) = v150;
            *((_WORD *)a2 + 320) = *((_WORD *)a2 + 101) - v150 - 12;
            sub_225A5A420((uint64_t)a2);
            a3 = 0;
            *((_WORD *)a2 + 462) -= 2;
            word_26ABD82F4 = 0;
          }
        }
        goto LABEL_430;
      }
      if (a3 != 13) {
        goto LABEL_423;
      }
LABEL_430:
      uint64_t v109 = "phFriNfc_Tpz_H_ParseTLVs";
LABEL_436:
      sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)v109);
LABEL_437:
      uint64_t v35 = "phFriNfc_Tpz_H_ProReadResp";
LABEL_438:
      sub_2259A10B4(2, (unsigned int *)a2, 8u, 5u, (uint64_t)v35);
LABEL_439:
      if (a3 != 13) {
LABEL_440:
      }
        sub_225A2757C((uint64_t)a2, a3);
      return sub_2259A10B4(0, (unsigned int *)&v157, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_Process");
    default:
LABEL_360:
      a3 = 0;
      goto LABEL_296;
  }
}

uint64_t sub_225A59E3C(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RdForWrite");
  LOBYTE(v2) = 0;
  unsigned int v3 = *(unsigned __int8 *)(a1 + 921);
  *(unsigned char *)(a1 + 266) = 2;
  *(unsigned char *)a1 = 16;
  if (v3 > 9)
  {
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }
  if (((1 << v3) & 0x318) != 0)
  {
    LOWORD(v2) = *(unsigned __int8 *)(a1 + 643) + 8 * *(unsigned __int8 *)(a1 + 642);
    do
    {
      int v4 = sub_225A5A35C(a1, (unsigned __int16)v2);
      LOWORD(v2) = v4 + v2;
    }
    while (v4);
LABEL_11:
    LOWORD(v6) = (unsigned __int16)v2 >> 3;
    goto LABEL_12;
  }
  if (((1 << v3) & 0x84) != 0)
  {
    unsigned int v2 = *(unsigned __int16 *)(a1 + 918) + 1;
    do
    {
      if ((v2 & 0xFFF8) == 0x68) {
        v2 += 24;
      }
      int v5 = sub_225A5A35C(a1, (unsigned __int16)v2);
      v2 += v5;
    }
    while (v5);
    goto LABEL_11;
  }
  LOBYTE(v6) = 0;
  if (v3 == 6)
  {
    unsigned int v2 = *(unsigned __int8 *)(a1 + 643) + 8 * *(unsigned __int8 *)(a1 + 642);
    unsigned int v6 = v2 >> 3;
  }
LABEL_12:
  *(unsigned char *)(a1 + 642) = v6;
  *(unsigned char *)(a1 + 643) = v2 & 7;
  uint64_t v7 = sub_225A57800(a1);
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RdForWrite");
  return v7;
}

uint64_t sub_225A59F74(uint64_t a1, unsigned int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetNDEFValueFieldAddrForWrite");
  LOBYTE(v4) = 0;
  int v5 = *(unsigned __int16 *)(a1 + 918);
  if (a2 <= 0xFE) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = 3;
  }
  do
  {
    if ((unsigned __int16)(v5 + 1) == 104) {
      int v7 = 128;
    }
    else {
      int v7 = v5 + 1;
    }
    int v5 = v7 + sub_225A5A35C(a1, (unsigned __int16)v7);
    unsigned int v4 = (v4 + 1);
  }
  while (v4 < v6);
  if ((unsigned __int16)(v5 + 1) == 104) {
    unsigned __int16 v8 = 128;
  }
  else {
    unsigned __int16 v8 = v5 + 1;
  }
  unsigned __int16 v9 = sub_225A5A35C(a1, v8) + v8;
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetNDEFValueFieldAddrForWrite");
  return v9;
}

uint64_t sub_225A5A050(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CopySendWrData");
  if (*(_DWORD *)(a1 + 248) >= *(unsigned __int16 *)(a1 + 924)) {
    unsigned __int16 v2 = *(_WORD *)(a1 + 924);
  }
  else {
    unsigned __int16 v2 = *(_DWORD *)(a1 + 248);
  }
  int v3 = *(unsigned __int8 *)(a1 + 642);
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareLockBlocks");
  if (*(unsigned char *)(a1 + 130))
  {
    uint64_t v4 = 0;
    while (1)
    {
      unsigned int v5 = *(unsigned __int16 *)(a1 + v4 + 96);
      if (v3 == v5 >> 3) {
        break;
      }
      v4 += 4;
      if (4 * *(unsigned __int8 *)(a1 + 130) == v4) {
        goto LABEL_8;
      }
    }
    sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareLockBlocks");
    if (v5) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_8:
    sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareLockBlocks");
  }
  int v6 = *(unsigned __int8 *)(a1 + 642);
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareMemBlocks");
  if (*(unsigned char *)(a1 + 184))
  {
    uint64_t v7 = 0;
    while (1)
    {
      unsigned int v8 = *(unsigned __int16 *)(a1 + v7 + 150);
      if (v6 == v8 >> 3) {
        break;
      }
      v7 += 4;
      if (4 * *(unsigned __int8 *)(a1 + 184) == v7) {
        goto LABEL_13;
      }
    }
    sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareMemBlocks");
    if (v8)
    {
LABEL_21:
      *(unsigned char *)(a1 + 921) = 6;
      *(unsigned char *)(a1 + 643) = 0;
      uint64_t v10 = sub_225A59E3C(a1);
      goto LABEL_22;
    }
  }
  else
  {
LABEL_13:
    sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareMemBlocks");
  }
  *(unsigned char *)(a1 + 266) = 84;
  *(unsigned char *)a1 = 2;
  int v9 = v2 - *(unsigned __int16 *)(a1 + 252);
  phOsalNfc_MemCopy();
  if (v9 < 8)
  {
    *(_WORD *)(a1 + 252) += v9;
    phOsalNfc_SetMemory();
  }
  else
  {
    *(_WORD *)(a1 + 252) += 8;
  }
  *(unsigned char *)(a1 + 266) = 84;
  uint64_t v10 = sub_225A57E88(a1, (uint64_t)v13, 8);
LABEL_22:
  uint64_t v11 = v10;
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CopySendWrData");
  return v11;
}

uint64_t sub_225A5A2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = 0;
  uint64_t v10 = a1;
  sub_2259A0FB0(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamic_CB_Transceive");
  sub_2259E0420(v10, &v9);
  uint64_t v7 = v9;
  if (v9)
  {
    if (a4) {
      *(_WORD *)(v9 + 264) = *(_DWORD *)(a4 + 8);
    }
    (*(void (**)(void, uint64_t, uint64_t))(v7 + 48))(*(void *)(v7 + 2712), v7, a5);
  }
  return sub_2259A10B4(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamic_CB_Transceive");
}

uint64_t sub_225A5A35C(uint64_t a1, int a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetSkipSize");
  uint64_t v4 = *(unsigned __int8 *)(a1 + 130);
  if (*(unsigned char *)(a1 + 130))
  {
    unsigned __int16 v5 = 0;
    int v6 = (unsigned __int16 *)(a1 + 98);
    do
    {
      if (*(v6 - 1) == a2) {
        unsigned __int16 v5 = *v6;
      }
      v6 += 2;
      --v4;
    }
    while (v4);
  }
  else
  {
    unsigned __int16 v5 = 0;
  }
  uint64_t v7 = *(unsigned __int8 *)(a1 + 184);
  if (*(unsigned char *)(a1 + 184))
  {
    unsigned int v8 = (unsigned __int16 *)(a1 + 152);
    do
    {
      if (*(v8 - 1) == a2) {
        unsigned __int16 v5 = *v8;
      }
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetSkipSize");
  return v5;
}

uint64_t sub_225A5A420(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ActualCardSize");
  unsigned int v2 = *(unsigned __int16 *)(a1 + 640);
  if (*(unsigned __int16 *)(a1 + 922) > v2) {
    goto LABEL_15;
  }
  unsigned int v3 = sub_225A57CB8(a1);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 130);
  if (*(unsigned char *)(a1 + 130))
  {
    unsigned __int16 v5 = (_WORD *)(a1 + 98);
    do
    {
      unsigned int v6 = (unsigned __int16)*(v5 - 1);
      if (v6 > v3 && (v6 & 0xFFF8) != 0x78) {
        LOWORD(v2) = v2 - *v5;
      }
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  uint64_t v7 = *(unsigned __int8 *)(a1 + 184);
  if (*(unsigned char *)(a1 + 184))
  {
    unsigned int v8 = (_WORD *)(a1 + 152);
    do
    {
      unsigned int v9 = (unsigned __int16)*(v8 - 1);
      if (v9 > v3 && (v9 & 0xFFF8) != 0x78) {
        LOWORD(v2) = v2 - *v8;
      }
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  unsigned int v10 = *(unsigned __int16 *)(a1 + 922);
  if (v10 <= (unsigned __int16)v2)
  {
    if ((unsigned __int16)v2 < 0x100u || v10 > 0xFE)
    {
      if ((unsigned __int16)v2 != 255 || v10 > 0xFE)
      {
        uint64_t v11 = 0;
        *(_WORD *)(a1 + 924) = v2;
        goto LABEL_16;
      }
      uint64_t v11 = 0;
      __int16 v13 = 254;
    }
    else
    {
      uint64_t v11 = 0;
      __int16 v13 = v2 - 2;
    }
    *(_WORD *)(a1 + 924) = v13;
  }
  else
  {
LABEL_15:
    *(_WORD *)(a1 + 922) = 0;
    uint64_t v11 = 22;
  }
LABEL_16:
  sub_2259A10B4(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ActualCardSize");
  return v11;
}

uint64_t sub_225A5A56C(uint64_t a1, char a2)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  sub_2259A0FB0(2, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreInit");
  if (a1)
  {
    sub_2259E0104(*(void *)(a1 + 24), &v15);
    uint64_t v4 = v15;
    if (v15)
    {
      *(void *)(v15 + 48) = *(void *)(a1 + 24);
      *(void *)(a1 + 56) = v4;
      sub_2259D7054(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"####Primary NFCC, DriverHandle");
      sub_2259D7054(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"DOWNLOAD-CORE context");
      uint64_t v5 = v15;
      *(_DWORD *)(v15 + 8492) = *(_DWORD *)(a1 + 48);
      *(unsigned char *)(v5 + 8504) = a2;
      sub_2259E0C28(*(void *)(v5 + 48), &v14);
      uint64_t v6 = sub_2259D08F4(*(unsigned int **)(a1 + 40));
      *(_DWORD *)(a1 + 64) = 0;
      uint64_t v7 = phOsalNfc_Timer_Create();
      if (v7 != 0xFFFFFFFFFFFFLL && (uint64_t v8 = v7) != 0)
      {
        sub_22599F8E0(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"phDnldNfc_CoreInit : Timer Create dwDnldRspTimerId!");
        *(void *)(v15 + 56) = v8;
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 48), 6u, 1u, (uint64_t)"phDnldNfc_CoreInit : Dnld Rsp Timer Create failed!!");
        uint64_t v6 = 12;
      }
      uint64_t v9 = phOsalNfc_Timer_Create();
      if (v9 != 0xFFFFFFFFFFFFLL && (uint64_t v10 = v9) != 0)
      {
        sub_22599F8E0(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"phDnldNfc_CoreInit : Timer Create dwDnldMuxTmlBusyTimerId!");
        *(void *)(v15 + 64) = v10;
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 48), 6u, 1u, (uint64_t)"phDnldNfc_CoreInit : Dnld Mux Tml Timer Create failed!!");
        uint64_t v6 = 12;
      }
      uint64_t v11 = phOsalNfc_Timer_Create();
      if (v11 != 0xFFFFFFFFFFFFLL && (uint64_t v12 = v11) != 0)
      {
        sub_22599F8E0(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"phDnldNfc_CoreInit : Timer Create dwDnldVenRstWaitTimerId!");
        *(void *)(v15 + 72) = v12;
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 48), 6u, 1u, (uint64_t)"phDnldNfc_CoreInit : Dnld Ven Reset wait Timer Create failed!!");
        uint64_t v6 = 12;
      }
    }
    else
    {
      uint64_t v6 = 255;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreInit");
  return v6;
}

uint64_t sub_225A5A7D8(uint64_t a1)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreDeInit");
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 56);
    sub_2259D08F4(*(unsigned int **)(a1 + 40));
    *(_DWORD *)(a1 + 64) = 0;
    uint64_t v3 = *(void *)(v2 + 56);
    if (v3) {
      BOOL v4 = v3 == 0xFFFFFFFFFFFFLL;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(void *)(v2 + 56) = 0xFFFFFFFFFFFFLL;
    }
    uint64_t v5 = *(void *)(v2 + 64);
    if (v5) {
      BOOL v6 = v5 == 0xFFFFFFFFFFFFLL;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(void *)(v2 + 64) = 0xFFFFFFFFFFFFLL;
    }
    uint64_t v7 = *(void *)(v2 + 72);
    if (v7) {
      BOOL v8 = v7 == 0xFFFFFFFFFFFFLL;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(void *)(v2 + 72) = 0xFFFFFFFFFFFFLL;
    }
    phOsalNfc_SetMemory();
    uint64_t v9 = 0;
    *(_DWORD *)(v2 + 8492) = 255;
    *(void *)(a1 + 56) = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }
  sub_2259A10B4(2, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreDeInit");
  return v9;
}

uint64_t sub_225A5A900(uint64_t a1, int *a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_BuildHdllPkt");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_WORD *)(a1 + 124) = 6;
    int v4 = a2[4];
    if (v4 && *((void *)a2 + 1))
    {
      LOWORD(v5) = v4 + 3;
      *(_WORD *)(a1 + 124) = v4 + 3;
      if (*a2 != 192) {
        goto LABEL_46;
      }
      if (*(unsigned char *)(a1 + 117) == 1)
      {
        *(_DWORD *)(a1 + 104) = v4;
        if ((*(_DWORD *)(a1 + 8480) - 8) > 2)
        {
          unsigned int v6 = 0;
          *(_DWORD *)(a1 + 100) = 0;
        }
        else if (*((unsigned char *)a2 + 40))
        {
          unsigned int v6 = a2[1];
          *(_DWORD *)(a1 + 100) = v6;
          *(_DWORD *)(a1 + 104) = v4 - v6 + 12;
        }
        else
        {
          unsigned int v6 = 12;
          *(_DWORD *)(a1 + 100) = 12;
        }
      }
      else
      {
        unsigned int v6 = *(_DWORD *)(a1 + 100);
      }
      sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Offset Address");
      sub_22599F8E0(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"phDnldNfc_BuildHdllPkt wRemBytes");
      if (*(_DWORD *)(a1 + 104) && !*(unsigned char *)(a1 + 116))
      {
        uint64_t v13 = *((void *)a2 + 1);
        __int16 v14 = *(unsigned __int8 *)(v13 + v6);
        *(_WORD *)(a1 + 110) = v14 << 8;
        *(_WORD *)(a1 + 110) = *(unsigned __int8 *)(v13 + v6 + 1) | (v14 << 8);
        sub_22599F8E0(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Size Of DNLD PKT");
      }
      int v15 = *(_DWORD *)(a1 + 8480);
      if (v15 == 8)
      {
        unsigned int v5 = *(unsigned __int16 *)(a1 + 110);
        unsigned int v16 = 4134;
      }
      else
      {
        unsigned int v5 = *(unsigned __int16 *)(a1 + 110);
        if ((v15 - 9) > 1)
        {
          if (v5 >= 0x227)
          {
LABEL_31:
            if (*(unsigned char *)(a1 + 118))
            {
              unsigned int v5 = *(unsigned __int16 *)(a1 + 108);
            }
            else
            {
              *(_WORD *)(a1 + 108) = v5;
              *(_DWORD *)(a1 + 100) += 2;
            }
            if ((v15 - 9) > 1)
            {
              if (v15 == 8)
              {
                if (v5 >= 0x1027)
                {
                  LOWORD(v5) = 4136;
                  goto LABEL_44;
                }
              }
              else if (v5 >= 0x227)
              {
                LOWORD(v5) = 552;
                goto LABEL_44;
              }
            }
            else if (v5 >= 0x102B)
            {
              LOWORD(v5) = 4140;
LABEL_44:
              *(_WORD *)(a1 + 124) = v5;
              *(unsigned char *)(a1 + 116) = 1;
              goto LABEL_46;
            }
            *(_WORD *)(a1 + 124) = v5;
            *(unsigned char *)(a1 + 116) = 0;
            goto LABEL_46;
          }
          goto LABEL_34;
        }
        unsigned int v16 = 4138;
      }
      if (v5 > v16) {
        goto LABEL_31;
      }
LABEL_34:
      LOWORD(v5) = v5 + 2;
      *(_WORD *)(a1 + 124) = v5;
      *(_WORD *)(a1 + 110) = 0;
      goto LABEL_46;
    }
    if (a2[8] && *((void *)a2 + 3))
    {
      int v7 = *a2;
      if (*a2 == 162)
      {
        LOWORD(v5) = 10;
        *(_WORD *)(a1 + 124) = 10;
LABEL_46:
        *(_WORD *)(a1 + 112) = v5;
        unsigned __int8 v17 = (unsigned __int8 *)(a1 + 8444);
        unsigned int v18 = (unsigned char *)(a1 + 126 + *(unsigned __int8 *)(a1 + 8444));
        *unsigned int v18 = (unsigned __int16)(v5 - 2) >> 8;
        v18[1] = v5 - 2;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"phDnldNfc_BuildHdllPkt : Inserting FrameId ..");
        *(unsigned char *)(*(unsigned __int8 *)(a1 + 8444) + a1 + 126 + 2) = *a2;
        int v19 = *a2;
        uint64_t v20 = (*a2 - 162);
        if (v20 > 0x3E) {
          goto LABEL_53;
        }
        if (((1 << (*(unsigned char *)a2 + 94)) & 0x400000000000C020) != 0)
        {
          if (!a2[4] || !*((void *)a2 + 1)) {
            goto LABEL_56;
          }
          goto LABEL_55;
        }
        if (v19 == 162)
        {
          if (*(unsigned char *)(a1 + 116))
          {
            unsigned int v26 = *(_DWORD *)(a1 + 104);
            unsigned int v27 = *(unsigned __int16 *)(a1 + 110);
          }
          else
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"phDnldNfc_BuildHdllPkt : Verifying RspBuffInfo for Read Request..");
            unsigned int v27 = 546;
            *(_WORD *)(a1 + 110) = 546;
            unsigned int v26 = a2[8];
            *(_DWORD *)(a1 + 104) = v26;
            *(_DWORD *)(a1 + 96) = a2[1];
            *(_DWORD *)(a1 + 100) = 0;
            *(_WORD *)(a1 + 114) = 0;
            if (v26 - 547 <= 0xFFFFFDD8) {
              *(unsigned char *)(a1 + 116) = 1;
            }
          }
          if (v26 > v27) {
            LOWORD(v26) = v27;
          }
          *(_WORD *)(a1 + 112) = v26;
          phOsalNfc_MemCopy();
          phOsalNfc_MemCopy();
          ++*(_DWORD *)(a1 + 4280);
          sub_22599F8E0(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"DNL Read COUNT");
          sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"DNL Read Addr");
          goto LABEL_56;
        }
        if (v20 != 30)
        {
LABEL_53:
          unsigned int v21 = v19 - 241;
          if (v21 > 3 || v21 == 2)
          {
            uint64_t v9 = 1;
            sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"phDnldNfc_BuildHdllPkt : Invalid Dnld Opcode!!");
            goto LABEL_57;
          }
        }
LABEL_55:
        phOsalNfc_MemCopy();
LABEL_56:
        uint64_t v9 = 0;
LABEL_57:
        uint64_t v22 = a1 + 126;
        __int16 v23 = sub_2259A2A40(*(void *)(a1 + 48), (unsigned __int8 *)(a1 + 126 + *v17), *(unsigned __int16 *)(a1 + 124));
        uint64_t v24 = *(unsigned __int16 *)(a1 + 124);
        *(unsigned char *)(v22 + *v17 + v24) = HIBYTE(v23);
        *(unsigned char *)(v24 + v22 + *v17 + 1) = v23;
        *(_WORD *)(a1 + 124) = v24 + *v17 + 2;
        sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"phDnldNfc_BuildHdllPkt: Frame created successfully");
        goto LABEL_58;
      }
    }
    else
    {
      int v7 = *a2;
    }
    LOWORD(v5) = 6;
    unsigned int v12 = v7 - 167;
    if (v12 > 0x39 || ((1 << v12) & 0x200000002000001) == 0) {
      goto LABEL_46;
    }
    BOOL v8 = "phDnldNfc_BuildHdllPkt : Invalid Input Parameter(s)!!";
    uint64_t v9 = 1;
    int v10 = 1;
    uint64_t v11 = (unsigned int *)(a1 + 8492);
  }
  else
  {
    BOOL v8 = "Invalid Input Parameter!!";
    uint64_t v9 = 1;
    int v10 = 3;
    uint64_t v11 = 0;
  }
  sub_2259A0EAC(v10, v11, 6u, 1u, (uint64_t)v8);
LABEL_58:
  sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_BuildHdllPkt");
  return v9;
}

uint64_t sub_225A5AEC8(uint64_t a1)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_ReqTmlRead");
  if (a1)
  {
    *(_WORD *)(a1 + 8438) = 0;
    *(_WORD *)(a1 + 8442) = 0;
    if (phTmlNfc_Read() == 13)
    {
      uint64_t v2 = 13;
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Read Request Failure");
      sub_2259D7178(*(void *)(a1 + 48), 195);
      uint64_t v2 = 255;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }
  sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_ReqTmlRead");
  return v2;
}

uint64_t sub_225A5AFA8(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_TmlReadCommonCb");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 12);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1
    && (uint64_t v8 = *(void *)(a1 + 8496)) != 0
    && a2
    && *(void *)(v8 + 6640)
    && (uint64_t v9 = *(char **)(a2 + 8)) != 0
    && *(_WORD *)(a2 + 16)
    && !*(_WORD *)a2
    && *v9 <= -127)
  {
    sub_225A5E7B4(a1, a2);
  }
  else
  {
LABEL_6:
    sub_225A5BDCC(a1, a2);
  }

  return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_TmlReadCommonCb");
}

uint64_t sub_225A5B0A0(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_DnldValidateRxdPkt");
  if (a1)
  {
    if (!*(_WORD *)a2
      && (uint64_t v6 = *(unsigned __int16 *)(a2 + 16), *(_WORD *)(a2 + 16))
      && (int v7 = *(unsigned __int8 **)(a2 + 8)) != 0)
    {
      uint64_t v42 = *(void *)(a1 + 48);
      sub_2259A0FB0(0, (unsigned int *)&v42, 6u, 5u, (uint64_t)"phDnldNfc_DnldVldtCrcRcvd");
      int v8 = sub_2259A2A40(v42, v7, (unsigned __int16)(v6 - 2));
      int v9 = *v7;
      if ((v7[(v6 - 1)] | (v7[v6 - 2] << 8)) != v8)
      {
        if (v9 == 96 && !v7[1] && v7[2] == 2 && v7[3] == 165)
        {
          sub_2259A0EAC(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"RESET NTF- NO UART MSG Received");
          uint64_t v4 = 132;
        }
        else
        {
          sub_2259A0EAC(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"Invalid frame received");
          sub_22599F9EC(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"Received CRC: ");
          sub_22599F9EC(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"Calculated CRC: ");
          uint64_t v4 = 255;
        }
        unsigned int v16 = "phDnldNfc_DnldVldtCrcRcvd";
        unsigned __int8 v17 = (unsigned int *)&v42;
        int v18 = 0;
        goto LABEL_130;
      }
      if ((v7[1] | (v9 << 8)) == (unsigned __int16)(v6 - 4))
      {
        int v10 = (unsigned char *)(a1 + 8445);
        sub_2259A10B4(0, (unsigned int *)&v42, 6u, 5u, (uint64_t)"phDnldNfc_DnldVldtCrcRcvd");
        if (!*(unsigned char *)(*(void *)(a2 + 8) + 2) && !*v10) {
          *int v10 = 1;
        }
        uint64_t v42 = 0;
        sub_2259A0FB0(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_UpdateRsp");
        sub_2259E0934(*(void *)(a1 + 48), &v42);
        int v11 = *(_DWORD *)a1;
        uint64_t v12 = v42;
        if (*(_DWORD *)a1 != 192 && v42 && *(_DWORD *)(v42 + 64) != 2)
        {
          switch(*(unsigned char *)(*(void *)(a2 + 8) + 2))
          {
            case '0':
              goto LABEL_17;
            case '1':
              int v19 = (unsigned int *)(a1 + 8492);
              uint64_t v20 = "EDL_CERT_ERROR:Error during Cert frame processing";
              goto LABEL_68;
            case '2':
              int v19 = (unsigned int *)(a1 + 8492);
              uint64_t v20 = "MISSING_CERTIFICATE:Missing certificate (missing 0xC1 frame)";
              goto LABEL_68;
            case '3':
              int v19 = (unsigned int *)(a1 + 8492);
              uint64_t v20 = "CHIPID_OR_MASK_ERROR:Wrong ChipId or ChipMask in First Frame";
              goto LABEL_68;
            default:
              if (!*(unsigned char *)(*(void *)(a2 + 8) + 2)) {
                goto LABEL_17;
              }
              uint64_t v22 = (unsigned int *)(a1 + 8492);
              break;
          }
          goto LABEL_57;
        }
LABEL_17:
        if (v11 > 223)
        {
          if ((v11 - 241) >= 2)
          {
            if (v11 == 244)
            {
              if (*(_DWORD *)(a1 + 32) && *(void *)(a1 + 24))
              {
                phOsalNfc_MemCopy();
                uint64_t v4 = 0;
                *(_DWORD *)(a1 + 32) = *(unsigned __int16 *)(a2 + 16);
                goto LABEL_129;
              }
              sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Cannot update Response buff with received data!!");
              goto LABEL_128;
            }
            if (v11 != 224) {
              goto LABEL_40;
            }
          }
        }
        else if (v11 <= 175)
        {
          if (v11 == 162)
          {
            uint64_t v23 = *(void *)(a2 + 8);
            if (*(unsigned char *)(v23 + 1) == 4 && *(unsigned char *)(v23 + 2) == 48)
            {
              *(_DWORD *)(a1 + 8508) = 0;
              if (!v12 || *(_DWORD *)(v12 + 64) != 2)
              {
                switch(*(unsigned char *)(a1 + 8484))
                {
                  case 2:
                    *(unsigned char *)(a1 + 8484) = 3;
                    unsigned int v30 = (unsigned int *)(a1 + 8492);
                    sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"FIRST_SUCC FAILED ADDRESS");
                    *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284) + 409;
                    int v31 = "FIRST_SUCC NEXT ADDRESS";
                    goto LABEL_126;
                  case 3:
                    *(unsigned char *)(a1 + 8484) = 5;
                    unsigned int v30 = (unsigned int *)(a1 + 8492);
                    sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"M1 FAILED ADDRESS");
                    ++*(_DWORD *)(a1 + 96);
                    int v31 = "M1 Fallback NEXT ADDRESS";
                    goto LABEL_126;
                  case 4:
                    *(unsigned char *)(a1 + 8484) = 5;
                    unsigned int v30 = (unsigned int *)(a1 + 8492);
                    sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"M2 FAILED ADDRESS");
                    ++*(_DWORD *)(a1 + 96);
                    int v31 = "M2 Fallback NEXT ADDRESS";
                    goto LABEL_126;
                  case 5:
                    unsigned int v30 = (unsigned int *)(a1 + 8492);
                    sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Fallback Error Addr");
                    ++*(_DWORD *)(a1 + 96);
                    int v31 = "Fallback CONTD NEXT ADDR";
LABEL_126:
                    int v39 = v30;
                    goto LABEL_127;
                  default:
                    *(_DWORD *)(a1 + 96) += 546;
                    sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"CHUNK READ ERROR ADDR");
                    uint64_t v4 = 0;
                    *(unsigned char *)(a1 + 8484) = 1;
                    goto LABEL_129;
                }
              }
              sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"Memory Read PH_DL_STATUS_READFLASH_PROTECTED_ERROR !!");
              phOsalNfc_MemCopy();
              *(_DWORD *)(a1 + 32) = 1;
              *(_DWORD *)(a1 + 104) = 0;
              uint64_t v4 = 48;
              goto LABEL_129;
            }
            switch(*(unsigned char *)(a1 + 8484))
            {
              case 1:
                *(unsigned char *)(a1 + 8484) = 2;
                int v24 = *(_DWORD *)(a1 + 96) - 546;
                *(_DWORD *)(a1 + 96) = v24;
                *(_DWORD *)(a1 + 4284) = v24;
                unsigned int v25 = (unsigned int *)(a1 + 8492);
                sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"First Success RD Address");
                *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284) + 273;
                unsigned int v26 = "First Success RD, Midpoint0 read NEXT ADDR";
                goto LABEL_92;
              case 2:
                *(unsigned char *)(a1 + 8484) = 4;
                unsigned int v25 = (unsigned int *)(a1 + 8492);
                sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"FIRST_SUCC,2nd SUCCESS ADDRESS");
                *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284) + 136;
                unsigned int v26 = "FIRST_SUCC NEXT dwAddr";
                goto LABEL_92;
              case 3:
                unsigned int v25 = (unsigned int *)(a1 + 8492);
                sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"M1 Success Addr");
                *(unsigned char *)(a1 + 8484) = 5;
                *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284) + 273;
                unsigned int v26 = "M1 NEXT Addr";
                goto LABEL_92;
              case 4:
                *(unsigned char *)(a1 + 8484) = 5;
                unsigned int v25 = (unsigned int *)(a1 + 8492);
                sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)" M2 Success, 3rd SUCCESS Addr");
                *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284);
                unsigned int v26 = "M2 NEXT dwAddr";
LABEL_92:
                sub_22599F9EC(1, v25, 6u, 4u, (uint64_t)v26);
                *(_WORD *)(a1 + 112) = 0;
                break;
              case 5:
                if (!*(_DWORD *)(a1 + 8508)) {
                  *(_DWORD *)(a1 + 8508) = *(_DWORD *)(a1 + 96);
                }
                sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"FOUND START ADDR");
                *(_DWORD *)(a1 + 104) = *(_DWORD *)(a1 + 120) - *(_DWORD *)(a1 + 96) + 1;
                *(unsigned char *)(a1 + 8484) = 0;
                break;
              default:
                break;
            }
            if (v42)
            {
              uint64_t v32 = *(void *)(a2 + 8);
              if (*(_DWORD *)(v42 + 64) == 2 && *(unsigned char *)(v32 + 2))
              {
                sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"Memory Read Error!!,status");
                uint64_t v4 = 48;
                **(unsigned char **)(a1 + 24) = 48;
                *(_DWORD *)(a1 + 32) = 1;
                goto LABEL_110;
              }
            }
            else
            {
              uint64_t v32 = *(void *)(a2 + 8);
            }
            int v33 = *(unsigned __int16 *)(v32 + 4);
            if (v33 == *(unsigned __int16 *)(a1 + 112))
            {
              if (!*(unsigned char *)(a1 + 8484))
              {
                phOsalNfc_MemCopy();
                uint64_t v4 = 0;
                unsigned __int16 v34 = *(_WORD *)(a1 + 114) + v33;
                *(_WORD *)(a1 + 114) = v34;
                *(_DWORD *)(a1 + 32) = v34;
                unsigned int v35 = *(unsigned __int16 *)(a1 + 112);
                *(_DWORD *)(a1 + 104) -= v35;
                *(int32x2_t *)(a1 + 96) = vadd_s32(*(int32x2_t *)(a1 + 96), vdup_n_s32(v35));
                goto LABEL_129;
              }
              goto LABEL_128;
            }
            if (*(unsigned char *)(a1 + 8484)) {
              goto LABEL_128;
            }
            int v19 = (unsigned int *)(a1 + 8492);
            uint64_t v20 = "Desired Length bytes not received!!";
            goto LABEL_68;
          }
          if (v11 != 167)
          {
LABEL_40:
            int v19 = (unsigned int *)(a1 + 8492);
            uint64_t v20 = "Unknown cmd id passed, while receive!!";
LABEL_68:
            sub_2259A0EAC(1, v19, 6u, 1u, (uint64_t)v20);
            goto LABEL_69;
          }
        }
        else
        {
          if (v11 == 176)
          {
            if (!*(_DWORD *)(a1 + 32) || !*(void *)(a1 + 24)) {
              goto LABEL_128;
            }
            int v21 = (unsigned __int16)(v6 - 5) + 1;
            goto LABEL_48;
          }
          if (v11 != 177)
          {
            if (v11 == 192)
            {
              int v13 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 2);
              if (*(unsigned char *)(*(void *)(a2 + 8) + 2))
              {
                if (*(unsigned char *)(a1 + 118) == 1)
                {
                  if (v13 == 46 && *(unsigned char *)(a1 + 116) == 1)
                  {
                    uint64_t v4 = 0;
                    int v27 = *(unsigned __int16 *)(a1 + 112);
                    *(_WORD *)(a1 + 108) -= v27;
                    int v28 = *(_DWORD *)(a1 + 104) - v27;
                    *(_DWORD *)(a1 + 100) += v27;
                    *(_DWORD *)(a1 + 104) = v28;
                    goto LABEL_129;
                  }
                }
                else if (!*(unsigned char *)(a1 + 118) && v13 == 45 && *(unsigned char *)(a1 + 116) == 1)
                {
                  *(unsigned char *)(a1 + 118) = 1;
                  int v14 = *(unsigned __int16 *)(a1 + 112);
                  *(_WORD *)(a1 + 108) -= v14;
                  int v15 = *(_DWORD *)(a1 + 104) - v14 - 2;
                  *(_DWORD *)(a1 + 100) += v14;
                  *(_DWORD *)(a1 + 104) = v15;
                  if (*(unsigned char *)(a1 + 117) == 1)
                  {
                    sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"First Write Frame Success Status received!!");
                    uint64_t v4 = 0;
                    *(unsigned char *)(a1 + 117) = 0;
LABEL_129:
                    unsigned int v16 = "phDnldNfc_UpdateRsp";
                    int v18 = 3;
                    unsigned __int8 v17 = (unsigned int *)a1;
LABEL_130:
                    sub_2259A10B4(v18, v17, 6u, 5u, (uint64_t)v16);
                    goto LABEL_6;
                  }
LABEL_128:
                  uint64_t v4 = 0;
                  goto LABEL_129;
                }
                if (*(unsigned __int8 *)(*(void *)(a2 + 8) + 2) > 0x20u)
                {
                  switch(v13)
                  {
                    case '!':
                      sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Signature Mismatch Error received!!");
                      int v40 = 33;
                      break;
                    case '1':
                      sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"EDL_CERT_ERROR:Error during Cert frame processing");
                      int v40 = 49;
                      break;
                    case '$':
                      sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Firmware Already Up To Date!!");
                      uint64_t v4 = 0;
                      *(unsigned char *)(a1 + 117) = 0;
                      *(_DWORD *)(a1 + 100) = 0;
                      *(_DWORD *)(a1 + 104) = 0;
                      goto LABEL_129;
                    default:
LABEL_117:
                      sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Unsuccessful Status received!!");
                      int v41 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 2);
                      if (v41 == 51)
                      {
                        uint64_t v20 = "CHIPID_OR_MASK_ERROR:Wrong ChipId or ChipMask in First Frame";
                        goto LABEL_132;
                      }
                      if (v41 == 50)
                      {
                        uint64_t v20 = "MISSING_CERTIFICATE:Missing certificate (missing 0xC1 frame)";
LABEL_132:
                        int v19 = (unsigned int *)(a1 + 8492);
                        goto LABEL_68;
                      }
                      uint64_t v22 = (unsigned int *)(a1 + 8492);
LABEL_57:
                      sub_22599F9EC(1, v22, 6u, 1u, (uint64_t)"Received DNDL Error, Status:");
LABEL_69:
                      uint64_t v4 = 255;
                      goto LABEL_129;
                  }
                  *(_DWORD *)(a1 + 8448) = v40;
                  uint64_t v4 = 147;
                  goto LABEL_129;
                }
                if (v13 == 13)
                {
                  sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"PLL Error Status received!!");
                  *(_DWORD *)(a1 + 8448) = 13;
                  uint64_t v4 = 21;
                  goto LABEL_129;
                }
                if (v13 == 32)
                {
                  sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Mem Busy Status received!!");
                  *(_DWORD *)(a1 + 8448) = 32;
                  goto LABEL_69;
                }
                goto LABEL_117;
              }
              if (*(unsigned char *)(a1 + 117) == 1)
              {
                sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"First Write Frame Success Status received!!");
                *(unsigned char *)(a1 + 117) = 0;
              }
              if (*(unsigned char *)(a1 + 118) == 1)
              {
                int v19 = (unsigned int *)(a1 + 8492);
                if (*(unsigned char *)(a1 + 116))
                {
                  uint64_t v20 = "UnExpected Status received!!";
                  goto LABEL_68;
                }
                sub_2259A0EAC(1, v19, 6u, 4u, (uint64_t)"Chunked Write Frame Success Status received!!");
                int v29 = *(unsigned __int16 *)(a1 + 112);
                *(_WORD *)(a1 + 108) -= v29;
                *(unsigned char *)(a1 + 118) = 0;
              }
              else
              {
                int v29 = *(unsigned __int16 *)(a1 + 112);
              }
              int v36 = *(_DWORD *)(a1 + 104);
              int v37 = *(_DWORD *)(a1 + 100) + v29;
              *(_DWORD *)(a1 + 100) = v37;
              *(_DWORD *)(a1 + 104) = v36 - v29;
              int v38 = *(_DWORD *)(a1 + 4);
              if (*(unsigned char *)(a1 + 40) || v38 != v37)
              {
                if (v38 == v37)
                {
                  int v39 = (unsigned int *)(a1 + 8492);
                  int v31 = "Start of Degraded FW Update, Offset";
LABEL_127:
                  sub_22599F9EC(1, v39, 6u, 4u, (uint64_t)v31);
                }
                else if (v36 == v29)
                {
                  sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Download Completed (Degraded FW)");
                  uint64_t v4 = 0;
                  *(unsigned char *)(a1 + 40) = 0;
                  goto LABEL_129;
                }
                goto LABEL_128;
              }
              sub_22599F9EC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Regular FW Update Complete, Offset");
              uint64_t v4 = 0;
LABEL_110:
              *(_DWORD *)(a1 + 104) = 0;
              goto LABEL_129;
            }
            goto LABEL_40;
          }
        }
        if (!*(_DWORD *)(a1 + 32) || !*(void *)(a1 + 24)) {
          goto LABEL_128;
        }
        int v21 = (unsigned __int16)(v6 - 5);
LABEL_48:
        phOsalNfc_MemCopy();
        uint64_t v4 = 0;
        *(_DWORD *)(a1 + 32) = v21;
        goto LABEL_129;
      }
      sub_2259A0EAC(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"Invalid frame payload length received");
      sub_2259A10B4(0, (unsigned int *)&v42, 6u, 5u, (uint64_t)"phDnldNfc_DnldVldtCrcRcvd");
    }
    else
    {
      sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Dnld Cmd Request Failed!!");
    }
    uint64_t v4 = 255;
  }
  else
  {
    uint64_t v4 = 1;
    sub_2259A0EAC(3, 0, 6u, 1u, (uint64_t)"Invalid Input Parameters!!");
  }
LABEL_6:
  sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_DnldValidateRxdPkt");
  return v4;
}

uint64_t sub_225A5BDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  sub_2259A0FB0(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
  if (!a1) {
    return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
  }
  char v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = (unsigned char *)(a1 + 4288);
  do
  {
    uint64_t v7 = *((void *)&unk_26ABD79B8 + 14 * v5 + 12);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v7 != a1);
  if (v7 != a1) {
    return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
  }
  uint64_t v9 = *(void *)(a1 + 8496);
  if (!v9) {
    return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
  }
  if (!a2
    || (uint64_t v10 = *(void *)(a2 + 8)) == 0
    || v10 != a1 + 4288 + *(unsigned __int16 *)(a1 + 8438)
    || !*(_WORD *)(a2 + 16)
    || *(_WORD *)a2)
  {
    unsigned int v11 = 1;
    goto LABEL_12;
  }
  sub_2259E0C28(*(void *)(a1 + 48), &v37);
  unsigned __int16 v18 = *(_WORD *)(a1 + 8438) + *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 8438) = v18;
  if (v18 <= 1u)
  {
    *(_WORD *)(a1 + 8442) = 2 - v18;
    goto LABEL_30;
  }
  unsigned int v19 = *v6;
  if (*(_DWORD *)a1 != 162)
  {
    if (!*v6)
    {
      int v20 = *(unsigned __int8 *)(a1 + 4289);
      if (*(unsigned char *)(a1 + 4289)) {
        goto LABEL_63;
      }
    }
LABEL_56:
    sub_2259A1C74(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"corrutped dnld packet rxd and dropped", a1 + 4288);
    phTmlNfc_ReadAbort();
    phTmlNfc_FlushTxRxBuffers();
    *(_WORD *)(a1 + 8438) = 0;
    *(_WORD *)(a1 + 8442) = 0;
    unsigned int v26 = phTmlNfc_Read();
    if (v26 == 13) {
      return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
    }
    unsigned int v11 = v26;
    sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldPkt: dnld packet Read Request Failure");
LABEL_58:
    sub_2259D7178(*(void *)(a1 + 48), 195);
    goto LABEL_59;
  }
  if (v19 > 3) {
    goto LABEL_56;
  }
  int v20 = *(unsigned __int8 *)(a1 + 4289);
LABEL_63:
  unsigned int v27 = (v20 & 0xFFFFFCFF | ((v19 & 3) << 8)) + 4;
  *(_WORD *)(a1 + 8442) = v27 - v18;
  if ((unsigned __int16)(v27 - v18) > 0x22Au)
  {
    unsigned int v11 = 255;
    int v31 = "Invalid length : Received size greater than maximum download frame size!!";
  }
  else
  {
    if (v27 == v18)
    {
      *(void *)(a2 + 8) = v6;
      *(_WORD *)(a2 + 16) = v18;
      *(_WORD *)(a1 + 8442) = 0;
      unsigned int v11 = sub_225A5B0A0(a1, a2);
      if (v11 != 48 && (_BYTE)v11)
      {
LABEL_59:
        if (v11 <= 0x30 && ((1 << v11) & 0x1000000002001) != 0) {
          return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
        }
        goto LABEL_12;
      }
      if (sub_225A5AEC8(a1) != 13)
      {
        if (v11 == 48)
        {
          *(_WORD *)a2 = 48;
          *(_DWORD *)(v9 + 6012) = 4;
          sub_2259CDA68(v9, 8, a2);
          if (!v37) {
            return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
          }
          char v32 = 0;
          uint64_t v33 = 0;
          do
          {
            uint64_t v30 = *((void *)&unk_26ABD79B8 + 14 * v33 + 4);
            if (v32) {
              break;
            }
            char v32 = 1;
            uint64_t v33 = 1;
          }
          while (v30 != v9);
LABEL_74:
          if (v30 == v9 && !*(unsigned char *)(v9 + 6008) && !sub_2259E0DA4(*(void *)(v9 + 6536))) {
            sub_225A5C3C0((unsigned int *)v9);
          }
          return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
        }
        if ((_BYTE)v11) {
          goto LABEL_59;
        }
      }
      *(_DWORD *)(v9 + 6012) = 4;
      sub_2259CDA68(v9, 8, a2);
      if (!v37) {
        return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
      }
      char v28 = 0;
      uint64_t v29 = 0;
      do
      {
        uint64_t v30 = *((void *)&unk_26ABD79B8 + 14 * v29 + 4);
        if (v28) {
          break;
        }
        char v28 = 1;
        uint64_t v29 = 1;
      }
      while (v30 != v9);
      goto LABEL_74;
    }
    if (v27 > v18)
    {
LABEL_30:
      unsigned int v11 = phTmlNfc_Read();
      if (v11 == 13) {
        return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
      }
      goto LABEL_58;
    }
    unsigned int v11 = 1;
    int v31 = "Critical failure in Download!!";
  }
  sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)v31);
LABEL_12:
  char v12 = 0;
  uint64_t v13 = 0;
  do
  {
    uint64_t v14 = *((void *)&unk_26ABD79B8 + 14 * v13 + 12);
    if (v12) {
      break;
    }
    char v12 = 1;
    uint64_t v13 = 1;
  }
  while (v14 != a1);
  if (v14 == a1) {
    uint64_t v15 = a1;
  }
  else {
    uint64_t v15 = 0;
  }
  if (a2)
  {
    if (v14 == a1)
    {
      unsigned int v16 = *(unsigned __int8 **)(a2 + 8);
      if (v16)
      {
        if (*(unsigned __int16 *)(v15 + 8438) <= 2u)
        {
          int v17 = *(unsigned __int16 *)(a2 + 16);
          if ((v17 - 3) < 0xFFFFFFFE || *(_WORD *)a2)
          {
LABEL_24:
            sub_2259A1C74(1, (unsigned int *)(v15 + 8492), 6u, 2u, (uint64_t)"corrutped packet rxd and dropped", (uint64_t)v16);
            phTmlNfc_ReadAbort();
            phTmlNfc_FlushTxRxBuffers();
            *(_WORD *)(v15 + 8438) = 0;
            *(_WORD *)(v15 + 8442) = 0;
            if (phTmlNfc_Read() != 13)
            {
              sub_2259A0EAC(1, (unsigned int *)(v15 + 8492), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldPkt: Read Request Failure");
              sub_2259D7178(*(void *)(v15 + 48), 195);
            }
            return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
          }
          if (*(_DWORD *)v15 == 162)
          {
            if (*v16 >= 4u) {
              goto LABEL_24;
            }
          }
          else if (*v16 || v17 == 2 && !v16[1])
          {
            goto LABEL_24;
          }
        }
      }
    }
  }
  if (v11 == 132 || v11 == 147) {
    __int16 v22 = v11;
  }
  else {
    __int16 v22 = 255;
  }
  if (sub_225A5AEC8(v15) != 13)
  {
    sub_2259A0EAC(1, (unsigned int *)(v9 + 6532), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldPkt: Read Request Failure");
    __int16 v22 = 255;
  }
  LOWORD(v34) = v22;
  uint64_t v35 = 0;
  LOWORD(v36) = 0;
  *(_DWORD *)(v9 + 6012) = 4;
  sub_2259CDA68(v9, 9, &v34);
  char v23 = 0;
  uint64_t v24 = 0;
  do
  {
    uint64_t v25 = *((void *)&unk_26ABD79B8 + 14 * v24 + 4);
    if (v23) {
      break;
    }
    char v23 = 1;
    uint64_t v24 = 1;
  }
  while (v25 != v9);
  if (v25 == v9 && *(unsigned char *)(v9 + 6010) == 1)
  {
    *(unsigned char *)(v9 + 6010) = 0;
    *(_DWORD *)(v9 + 6012) = 5;
    sub_2259CDA68(v9, 9, 0);
  }
  return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
}

uint64_t sub_225A5C3C0(unsigned int *a1)
{
  memset(v3, 0, sizeof(v3));
  sub_2259A0FB0(2, a1, 3u, 5u, (uint64_t)"phNciMuxNfc_InitiateNextPkt");
  sub_2259CDA68(a1, 7, v3);
  return sub_2259A10B4(2, a1, 3u, 5u, (uint64_t)"phNciMuxNfc_InitiateNextPkt");
}

uint64_t sub_225A5C43C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(result + 56);
    if (v5) {
      BOOL v6 = v5 == 0xFFFFFFFFFFFFLL;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      uint64_t result = sub_2259DD7E4(*(_DWORD *)(result + 8492), v5);
    }
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8464);
    if (v7)
    {
      uint64_t v8 = *(void *)(v4 + 8472);
      return v7(v8, a3, v4 + 24);
    }
  }
  return result;
}

uint64_t sub_225A5C4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = 0;
  long long v11 = 0u;
  memset(v10, 0, sizeof(v10));
  sub_2259A0FB0(4, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_DnldCoreIfTxRx");
  uint64_t v8 = 1;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        BYTE14(v11) = 1;
        phOsalNfc_MemCopy();
        phOsalNfc_MemCopy();
        *(unsigned char *)(a1 + 117) = 1;
        *(_DWORD *)(a1 + 4280) = 0;
        uint64_t v8 = sub_2259CF608(*(void *)(a1 + 8496), 4u, (uint64_t)v10, (uint64_t)sub_225A5C43C, a1);
        if (v8 == 13)
        {
          *(void *)(a1 + 8464) = a3;
          *(void *)(a1 + 8472) = a4;
        }
      }
    }
  }
  sub_2259A10B4(4, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_DnldCoreIfTxRx");
  return v8;
}

uint64_t sub_225A5C5D0(uint64_t a1, unsigned __int8 *a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreSendCb");
  if (a2)
  {
    unsigned int v4 = *((_DWORD *)a2 + 1);
    if (v4 <= 1) {
      sub_2259E0CEC(*((void *)&unk_26ABD79B8 + 14 * v4), 0);
    }
    if (a1)
    {
      if (*a2 == 179)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"SPMI Nack");
      }
      else if (*a2)
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Tml Write error!!");
      }
      else
      {
        sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Send Success");
      }
      sub_2259CDA68(*(void *)(a1 + 8496), 7, a2);
      goto LABEL_14;
    }
  }
  else if (a1)
  {
    sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Invalid pInfo received from TML!!");
    goto LABEL_14;
  }
  sub_2259A0EAC(3, 0, 6u, 2u, (uint64_t)"Nci context cleared, received send CB!!");
LABEL_14:

  return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreSendCb");
}

uint64_t sub_225A5C738(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = 0;
  sub_2259A0FB0(3, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldNfc_RspTimeOutCb");
  if (a2)
  {
    if (*(void *)(a2 + 8496))
    {
      sub_2259E0C28(*(void *)(a2 + 48), &v9);
      uint64_t v4 = *(void *)(a2 + 8496);
      sub_2259DD7E4(*(_DWORD *)(v4 + 6532), a1);
      if (v4)
      {
        if (*(void *)(a2 + 56) == a1)
        {
          *(_DWORD *)(v4 + 6012) = 4;
          sub_2259CDA68(v4, 10, 0);
          if (v9)
          {
            char v5 = 0;
            uint64_t v6 = 0;
            do
            {
              uint64_t v7 = *((void *)&unk_26ABD79B8 + 14 * v6 + 4);
              if (v5) {
                break;
              }
              char v5 = 1;
              uint64_t v6 = 1;
            }
            while (v7 != v4);
            if (v7 == v4 && !*(unsigned char *)(v4 + 6008) && !sub_2259E0DA4(*(void *)(v4 + 6536))) {
              sub_225A5C3C0((unsigned int *)v4);
            }
          }
        }
      }
    }
  }
  return sub_2259A10B4(3, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldNfc_RspTimeOutCb");
}

uint64_t sub_225A5C854(uint64_t a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = a1;
  uint64_t v14 = 0;
  sub_2259A0FB0(0, (unsigned int *)&v16, 6u, 5u, (uint64_t)"phDnldEseNfc_CoreInit");
  uint64_t v1 = 0;
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    if (*((void *)&unk_26ABD79B8 + 14 * v1) == v16) {
      break;
    }
    char v2 = 0;
    uint64_t v1 = 1;
    if ((v3 & 1) == 0)
    {
      sub_2259E059C(v16, &v14);
LABEL_11:
      uint64_t v5 = 1;
      goto LABEL_12;
    }
  }
  unsigned int v4 = *((_DWORD *)&unk_26ABD79B8 + 28 * v1 + 2);
  sub_2259E059C(v16, &v14);
  if (v4 > 1) {
    goto LABEL_11;
  }
  sub_2259CD260(v4, (uint64_t *)&v15);
  uint64_t v5 = 1;
  if (v16)
  {
    uint64_t v6 = (uint64_t)v15;
    if (v15)
    {
      *uint64_t v15 = v16;
      *(_DWORD *)(v6 + 1368) = v4;
      uint64_t v7 = v14;
      *(void *)(v6 + 1376) = v14;
      *(unsigned char *)(v6 + 1384) = 1;
      sub_225A57284((uint64_t)v7, v6);
      sub_2259D08F4(v14);
      sub_2259D7054(0, (unsigned int *)&v16, 6u, 4u, (uint64_t)"####Primary NFCC, DriverHandle");
      sub_2259D7054(0, (unsigned int *)&v16, 6u, 4u, (uint64_t)"####Primary NFCC, DOWNLOAD-ESE-CORE context");
      uint64_t v8 = phOsalNfc_Timer_Create();
      if (v8 != 0xFFFFFFFFFFFFLL && (uint64_t v9 = v8) != 0)
      {
        sub_22599F8E0(0, (unsigned int *)&v16, 6u, 4u, (uint64_t)"phDnldEseNfc_CoreInit : Timer Create dwRspTimerId!");
        v15[6] = v9;
        uint64_t v12 = phOsalNfc_Timer_Create();
        if (v12 != 0xFFFFFFFFFFFFLL)
        {
          uint64_t v13 = v12;
          if (v12)
          {
            sub_22599F8E0(0, (unsigned int *)&v16, 6u, 4u, (uint64_t)"phDnldEseNfc_CoreInit : Timer Create dwCrdtTimerId!");
            uint64_t v5 = 0;
            v15[7] = v13;
            goto LABEL_12;
          }
        }
        uint64_t v10 = "phDnldEseNfc_CoreInit : Dnld Ese Credit Timer Create failed!!";
      }
      else
      {
        uint64_t v10 = "phDnldEseNfc_CoreInit : Dnld Ese Rsp Timer Create failed!!";
      }
      sub_2259A0EAC(0, (unsigned int *)&v16, 6u, 1u, (uint64_t)v10);
      uint64_t v5 = 12;
    }
  }
LABEL_12:
  sub_2259A10B4(0, (unsigned int *)&v16, 6u, 5u, (uint64_t)"phDnldEseNfc_CoreInit");
  return v5;
}

uint64_t sub_225A5CA70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  long long v12 = 0u;
  memset(v11, 0, sizeof(v11));
  sub_2259A0FB0(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnly");
  uint64_t v8 = 1;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        sub_2259E059C(*(void *)a1, &v14);
        BYTE14(v12) = 1;
        phOsalNfc_SetMemory();
        phOsalNfc_SetMemory();
        phOsalNfc_MemCopy();
        phOsalNfc_MemCopy();
        uint64_t v8 = sub_2259CF608(v14, 5u, (uint64_t)v11, (uint64_t)sub_225A5CC00, a1);
        if (v8 == 13)
        {
          *(void *)(a1 + 80) = a3;
          *(void *)(a1 + 88) = a4;
          uint64_t v9 = *(void *)(a1 + 48);
          if (v9)
          {
            if (v9 != 0xFFFFFFFFFFFFLL)
            {
              if (*(unsigned char *)(a1 + 16) == 1)
              {
                sub_2259DD7E4(*(_DWORD *)(a1 + 1368), v9);
                *(unsigned char *)(a1 + 16) = 0;
              }
              uint64_t v8 = 13;
            }
          }
        }
      }
    }
  }
  sub_2259A10B4(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnly");
  return v8;
}

uint64_t sub_225A5CC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2259A0FB0(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnlyComplete");
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      BOOL v6 = v5 == 0xFFFFFFFFFFFFLL;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      sub_2259DD7E4(*(_DWORD *)(a1 + 1368), v5);
      *(unsigned char *)(a1 + 16) = 0;
    }
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7 && v7 != 0xFFFFFFFFFFFFLL) {
      sub_2259DD7E4(*(_DWORD *)(a1 + 1368), v7);
    }
    uint64_t v8 = *(void (**)(void, uint64_t, uint64_t))(a1 + 80);
    if (v8)
    {
      v8(*(void *)(a1 + 88), a3, a1 + 768);
      char v9 = 0;
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = *((void *)&unk_26ABD79B8 + 14 * v10 + 8);
        if (v9) {
          break;
        }
        char v9 = 1;
        uint64_t v10 = 1;
      }
      while (v11 != a1);
      if (v11 == a1 && !*(void *)(a1 + 264)) {
        *(void *)(a1 + 80) = 0;
      }
    }
  }
  else
  {
    sub_2259A0EAC(4, 0, 6u, 1u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnlyComplete:Invalid Dnld Ese Context!!");
  }

  return sub_2259A10B4(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnlyComplete");
}

uint64_t sub_225A5CD24(uint64_t a1, char a2)
{
  sub_2259A0FB0(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_UpdateCredits");
  uint64_t v4 = *(void *)(a1 + 1376);
  if (v4)
  {
    *(unsigned char *)(a1 + 29) += a2;
    if (*(unsigned char *)(a1 + 17) == 1)
    {
      sub_2259DD7E4(*(_DWORD *)(a1 + 1368), *(void *)(a1 + 56));
      *(unsigned char *)(a1 + 17) = 0;
      *(_DWORD *)(v4 + 6012) = 5;
      sub_2259CDA68(v4, 11, 0);
    }
  }

  return sub_2259A10B4(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_UpdateCredits");
}

uint64_t sub_225A5CDDC(unsigned int *a1, unsigned int a2)
{
  sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciDeleteList");
  if (a1)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t)&a1[a2 + 38];
    *(_DWORD *)(v5 + 80) = 0;
    BOOL v6 = (_DWORD *)(v5 + 80);
    uint64_t v7 = *(void *)&a1[2 * a2 + 38];
    if (v7)
    {
      for (uint64_t i = *(void *)(v7 + 296); i; uint64_t i = *(void *)(v9 + 296))
      {
        uint64_t v9 = i;
        phOsalNfc_FreeMemory();
      }
      phOsalNfc_FreeMemory();
      *(void *)&a1[2 * v4 + 38] = 0;
      *((_WORD *)a1 + v4 + 108) = 1;
    }
    else
    {
      sub_2259A0EAC(1, a1 + 342, 6u, 4u, (uint64_t)"phDnldEseNfc_HciDeleteList:List is empty");
      *((_WORD *)a1 + a2 + 108) = 1;
    }
    *BOOL v6 = 0;
  }
  else
  {
    sub_2259A0EAC(4, 0, 6u, 1u, (uint64_t)"phDnldEseNfc_HciDeleteList:Invalid Dnld Ese Core context!");
  }

  return sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciDeleteList");
}

uint64_t sub_225A5CF04(void *a1, uint64_t a2)
{
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  char v18 = -1;
  sub_2259A0FB0(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts");
  if (a2)
  {
    uint64_t v4 = a1[172];
    if (!v4) {
      goto LABEL_39;
    }
    int v5 = *(unsigned __int8 *)(a2 + 1);
    if (v5 != 2)
    {
      if (v5 == 17)
      {
        sub_2259A0EAC(1, (unsigned int *)a1 + 342, 6u, 4u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts:EVENT_WTX_REQ received");
        uint64_t v7 = (void (*)(void, void, void, void *, uint64_t))a1[83];
        if (!v7)
        {
          sub_2259A0EAC(1, (unsigned int *)a1 + 342, 6u, 4u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts:WTX Call Back not defined by App");
          goto LABEL_39;
        }
        uint64_t v8 = *(unsigned __int8 **)(a2 + 8);
        if (v8)
        {
          unsigned int v9 = sub_225A31CCC(*((_DWORD *)a1 + 342), *v8);
          if (v9 <= 0x7CF) {
            int v10 = v9 + 400;
          }
          else {
            int v10 = v9;
          }
          uint64_t v7 = (void (*)(void, void, void, void *, uint64_t))a1[83];
        }
        else
        {
          int v10 = 2000;
        }
        *((_DWORD *)a1 + 24) = v10;
        *((_DWORD *)a1 + 8) = v10;
        v7(*a1, a1[84], a1[1], a1 + 12, 74);
        uint64_t v13 = a1[6];
        if (v13 == 0xFFFFFFFFFFFFLL) {
          goto LABEL_39;
        }
        sub_2259DD7E4(*((_DWORD *)a1 + 342), v13);
        *((unsigned char *)a1 + 16) = 0;
        a2 = phOsalNfc_Timer_Start();
        if (!a2)
        {
          *((unsigned char *)a1 + 16) = 1;
          goto LABEL_40;
        }
        long long v12 = "phDnldEseNfc_ProcessApduPipeEvts : Response Timer Start failed!!!";
        uint64_t v11 = (unsigned int *)(a1 + 171);
      }
      else
      {
        if (v5 != 16) {
          goto LABEL_39;
        }
        if (a1[8])
        {
          unsigned int v6 = *((_DWORD *)a1 + 18);
          if (v6)
          {
            if (v6 < *(unsigned __int16 *)(a2 + 16))
            {
              sub_2259A0EAC(1, (unsigned int *)a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts:Could not copy entire received data");
              a2 = 8;
              goto LABEL_40;
            }
            phOsalNfc_MemCopy();
            *((_DWORD *)a1 + 18) = *(unsigned __int16 *)(a2 + 16);
            *(_DWORD *)(v4 + 6012) = 5;
            sub_2259CDA68(v4, 8, a2);
            char v14 = 0;
            uint64_t v15 = 0;
            do
            {
              uint64_t v16 = *((void *)&unk_26ABD79B8 + 14 * v15 + 4);
              if (v14) {
                break;
              }
              char v14 = 1;
              uint64_t v15 = 1;
            }
            while (v16 != v4);
            if (v16 == v4 && !*(unsigned char *)(v4 + 6008) && !sub_2259E0DA4(*(void *)(v4 + 6536))) {
              sub_225A5C3C0((unsigned int *)v4);
            }
LABEL_39:
            a2 = 0;
            goto LABEL_40;
          }
        }
        uint64_t v11 = (unsigned int *)(a1 + 171);
        long long v12 = "phDnldEseNfc_ProcessApduPipeEvts:Invalid User response buffer or length";
        a2 = 1;
      }
      sub_2259A0EAC(1, v11, 6u, 1u, (uint64_t)v12);
      goto LABEL_40;
    }
    if (sub_225A5D3DC((uint64_t)a1, *((_DWORD *)a1 + 197), &v18))
    {
      a2 = 1;
      goto LABEL_40;
    }
    if (a1[81] && v18 == *(unsigned char *)a2)
    {
      sub_2259D7178(*a1, 217);
      sub_2259DD7E4(*((_DWORD *)a1 + 342), a1[6]);
      *((unsigned char *)a1 + 16) = 0;
      sub_2259DD7E4(*((_DWORD *)a1 + 342), a1[7]);
      *((unsigned char *)a1 + 17) = 0;
      *(unsigned char *)(v4 + 5996) = 0;
      *(_DWORD *)(v4 + 5988) = 0;
      sub_2259A0EAC(1, (unsigned int *)a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts: OS Reset Event received");
      phDnldEseNfc_ProcOsResetNtf((unsigned int *)a1, 217, 0);
    }
    else if (a1[85])
    {
      phOsalNfc_SetMemory();
      LODWORD(v19[0]) = sub_2259DFD70(*((_DWORD *)a1 + 342), *(unsigned __int8 *)a2);
      ((void (*)(void, void, uint64_t, void, _OWORD *, uint64_t))a1[85])(*a1, a1[86], 27, a1[1], v19, 217);
    }
    else
    {
      sub_22599F9EC(1, (unsigned int *)a1 + 342, 6u, 2u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts: Ignoring SE OS Reset, PipeID");
    }
    goto LABEL_39;
  }
LABEL_40:
  sub_2259A10B4(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts");
  return a2;
}

uint64_t sub_225A5D2A4(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(4, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldEseNfc_RspTimeOutCb");
  if (a2)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 8);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != a2);
    if (v6 == a2)
    {
      uint64_t v8 = *(void *)(a2 + 1376);
      if (v8)
      {
        if (*(void *)(a2 + 48) == a1)
        {
          sub_2259DD7E4(*(_DWORD *)(a2 + 1368), a1);
          *(unsigned char *)(a2 + 16) = 0;
          *(_DWORD *)(v8 + 6012) = 5;
          sub_2259CDA68(v8, 10, 0);
          char v9 = 0;
          uint64_t v10 = 0;
          do
          {
            uint64_t v11 = *((void *)&unk_26ABD79B8 + 14 * v10 + 4);
            if (v9) {
              break;
            }
            char v9 = 1;
            uint64_t v10 = 1;
          }
          while (v11 != v8);
          if (v11 == v8 && !*(unsigned char *)(v8 + 6008) && !sub_2259E0DA4(*(void *)(v8 + 6536))) {
            sub_225A5C3C0((unsigned int *)v8);
          }
        }
      }
    }
  }

  return sub_2259A10B4(4, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldEseNfc_RspTimeOutCb");
}

uint64_t sub_225A5D3DC(uint64_t a1, int a2, unsigned char *a3)
{
  sub_2259A0FB0(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_MultiOSGetPipeId");
  if (a3)
  {
    switch(a2)
    {
      case 0:
        uint64_t v6 = 0;
        char v7 = *(unsigned char *)(a1 + 136);
        goto LABEL_9;
      case 1:
        uint64_t v6 = 0;
        char v7 = *(unsigned char *)(a1 + 140);
        goto LABEL_9;
      case 2:
        uint64_t v6 = 0;
        char v7 = *(unsigned char *)(a1 + 144);
        goto LABEL_9;
      case 3:
        uint64_t v6 = 0;
        char v7 = *(unsigned char *)(a1 + 148);
LABEL_9:
        *a3 = v7;
        break;
      default:
        *a3 = -1;
        uint64_t v6 = 1;
        break;
    }
  }
  else
  {
    uint64_t v6 = 1;
    sub_2259A0EAC(4, (unsigned int *)a1, 6u, 1u, (uint64_t)"phDnldEseNfc_MultiOSGetPipeId:Invalid Context or PipeId");
  }
  sub_2259A10B4(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_MultiOSGetPipeId");
  return v6;
}

uint64_t sub_225A5D4EC(unsigned int *a1, unsigned __int8 *a2)
{
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts");
  if (!a2 || !*((void *)a2 + 1)) {
    goto LABEL_40;
  }
  LODWORD(v28) = sub_2259DFD70(a1[342], *a2);
  unsigned int v4 = a2[1];
  if (v4 <= 0x12)
  {
    if (v4 != 16)
    {
      if (v4 == 18)
      {
        uint64_t v5 = (unsigned __int8 *)*((void *)a2 + 1);
        if (*v5 != 129)
        {
          sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed, error in packet");
          unsigned int v14 = 0;
          unsigned __int8 v15 = 0;
          uint64_t v7 = 255;
          goto LABEL_51;
        }
        int v6 = v5[1];
        DWORD2(v26) = v6;
        *(void *)&long long v26 = v5 + 2;
        if ((v6 - 17) > 0xF3u)
        {
          uint64_t v7 = 0;
        }
        else
        {
          sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed AID Length Evaluation");
          uint64_t v5 = (unsigned __int8 *)*((void *)a2 + 1);
          uint64_t v7 = 255;
        }
        if (v5[(v6 + 2)] != 130)
        {
          sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed, PARAMETER Field is not available");
          unsigned int v14 = 0;
          uint64_t v7 = 255;
          unsigned __int8 v15 = v6 + 2;
          goto LABEL_51;
        }
        unsigned __int8 v20 = v6 + 3;
        unsigned int v14 = v5[(v6 + 3)];
        if ((char)v5[(v6 + 3)] < 0)
        {
          if (v14 != 130)
          {
            if (v14 == 129)
            {
              unsigned __int8 v20 = v6 + 4;
              if ((char)v5[(v6 + 4)] < 0)
              {
                unsigned int v14 = v5[(v6 + 4)];
                unsigned __int8 v15 = v6 + 5;
                goto LABEL_32;
              }
              __int16 v22 = "phDnldEseNfc_ProcessConnPipeEvts:Failed Parsing BER TLV One BYTE";
            }
            else
            {
              __int16 v22 = "phDnldEseNfc_ProcessConnPipeEvts:Failed Parsing BER TLV";
            }
            sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)v22);
            unsigned int v14 = 0;
            uint64_t v7 = 255;
            unsigned __int8 v15 = v20;
            goto LABEL_50;
          }
          unsigned __int8 v23 = v6 + 5;
          int v24 = v5[(v6 + 4)];
          unsigned __int8 v15 = v6 + 6;
          unsigned int v14 = v5[v23] | (v24 << 8);
          if (v14 < 0x100)
          {
            sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed Parsing BER TLV Two BYTE");
            unsigned int v14 = 0;
            uint64_t v7 = 255;
            goto LABEL_50;
          }
        }
        else
        {
          unsigned __int8 v15 = v6 + 4;
        }
LABEL_32:
        DWORD2(v27) = v14;
LABEL_50:
        *(void *)&long long v27 = *((void *)a2 + 1) + v15;
LABEL_51:
        if (v14 + v15 != *((unsigned __int16 *)a2 + 8))
        {
          DWORD2(v27) = 0;
          DWORD2(v26) = 0;
          sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed,BER TLV parsing, Length Mismatch");
          uint64_t v7 = 255;
        }
        uint64_t v25 = (void (*)(void, void, uint64_t, void, long long *, uint64_t))*((void *)a1 + 85);
        if (v25)
        {
          v25(*(void *)a1, *((void *)a1 + 86), 2, *((void *)a1 + 1), &v26, v7);
          goto LABEL_41;
        }
LABEL_55:
        sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Se notification callback is NULL");
        uint64_t v7 = 255;
        goto LABEL_41;
      }
      goto LABEL_20;
    }
    int v11 = *((unsigned __int16 *)a2 + 8);
    if (*((_WORD *)a2 + 8)) {
      uint64_t v12 = *((void *)a2 + 1);
    }
    else {
      uint64_t v12 = 0;
    }
    *(void *)&long long v27 = v12;
    DWORD2(v27) = v11;
    DWORD2(v26) = 0;
    *(void *)&long long v26 = 0;
    uint64_t v16 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, long long *, void))*((void *)a1 + 85);
    if (!v16) {
      goto LABEL_55;
    }
    uint64_t v17 = *((void *)a1 + 86);
    uint64_t v18 = *(void *)a1;
    uint64_t v19 = *((void *)a1 + 1);
    uint64_t v10 = 3;
    goto LABEL_39;
  }
  if (v4 != 19)
  {
    if (v4 != 32)
    {
LABEL_20:
      sub_22599F9EC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts: Unknown HCI Event, Dropped Ins");
LABEL_40:
      uint64_t v7 = 0;
      goto LABEL_41;
    }
    int v8 = *((unsigned __int16 *)a2 + 8);
    if (*((_WORD *)a2 + 8) && (char v9 = (unsigned char *)*((void *)a2 + 1)) != 0)
    {
      if (*v9 == 1)
      {
        uint64_t v10 = 23;
      }
      else if (*v9)
      {
        sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:SE restricted mode Unknown Event\n");
        char v9 = (unsigned char *)*((void *)a2 + 1);
        int v8 = *((unsigned __int16 *)a2 + 8);
        uint64_t v10 = 255;
      }
      else
      {
        LODWORD(v28) = 255;
        uint64_t v10 = 4;
      }
      *(void *)&long long v27 = v9;
      DWORD2(v27) = v8;
      DWORD2(v26) = 0;
      *(void *)&long long v26 = 0;
    }
    else
    {
      *(void *)&long long v26 = 0;
      DWORD2(v26) = 0;
      *(void *)&long long v27 = 0;
      uint64_t v10 = 4;
      LODWORD(v28) = 255;
      DWORD2(v27) = 0;
    }
    uint64_t v16 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, long long *, void))*((void *)a1 + 85);
    if (!v16) {
      goto LABEL_55;
    }
    uint64_t v17 = *((void *)a1 + 86);
    uint64_t v18 = *(void *)a1;
    uint64_t v19 = *((void *)a1 + 1);
LABEL_39:
    v16(v18, v17, v10, v19, &v26, 0);
    goto LABEL_40;
  }
  *(void *)&long long v26 = 0;
  DWORD2(v26) = 0;
  *(void *)&long long v27 = 0;
  DWORD2(v27) = 0;
  uint64_t v13 = (void (*)(void, void, uint64_t, void, long long *, void))*((void *)a1 + 85);
  if (v13)
  {
    v13(*(void *)a1, *((void *)a1 + 86), 17, *((void *)a1 + 1), &v26, 0);
    uint64_t v7 = 0;
  }
  else
  {
    sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Se notification callback is NULL");
    uint64_t v7 = 255;
  }
  sub_22599F9EC(1, a1 + 342, 6u, 4u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts: phLibNfc_eSE_EvtEndOfOperation, Ins");
LABEL_41:
  sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts");
  return v7;
}

uint64_t sub_225A5D96C(unsigned int *a1, int a2)
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GenErrNtfHandler");
  sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_GenErrNtfHandler:Generic Error Notification received");
  int v4 = a2 - 10;
  uint64_t v5 = a2 | 0x100u;
  switch(v4)
  {
    case 0:
      int v6 = "ErrorCode: 0x0A,Message size exceeded maximum size";
      goto LABEL_13;
    case 1:
      int v6 = "ErrorCode: 0x0B,SE is not enabled";
      goto LABEL_13;
    case 2:
      int v6 = "ErrorCode: 0x0C,Invalid Pipe";
      goto LABEL_13;
    case 3:
      int v6 = "ErrorCode: 0x0D,Invalid HCP Packet";
      goto LABEL_13;
    case 4:
      int v6 = "ErrorCode: 0x0E,SE cleared all Pipe";
      goto LABEL_13;
    case 5:
      int v6 = "ErrorCode: 0x0F,SE connectivity Pipe deleted";
      goto LABEL_13;
    case 6:
      int v6 = "ErrorCode: 0x10,SE loopback Pipe deleted";
      goto LABEL_13;
    case 7:
      int v6 = "ErrorCode: 0x11,SE Identity Management Pipe deleted";
      goto LABEL_13;
    case 8:
      int v6 = "ErrorCode: 0x12,SE APDU Pipe deleted";
      goto LABEL_13;
    case 9:
      int v6 = "ErrorCode: 0x13,Temperature Error";
LABEL_13:
      sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)v6);
      break;
    default:
      sub_22599F9EC(1, a1 + 342, 6u, 1u, (uint64_t)"UnknownErrorCode: ");
      uint64_t v5 = 256;
      break;
  }
  uint64_t v7 = (void (*)(void, void, uint64_t, void, _OWORD *, uint64_t))*((void *)a1 + 85);
  if (v7) {
    v7(*(void *)a1, *((void *)a1 + 86), 26, *((void *)a1 + 1), v9, v5);
  }
  return sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GenErrNtfHandler");
}

uint64_t sub_225A5DB2C(unsigned int *a1, uint64_t a2)
{
  sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseValidateRxdPkt");
  if (*(_WORD *)a2
    || (uint64_t v6 = *(unsigned __int16 *)(a2 + 16), !*(_WORD *)(a2 + 16))
    || (uint64_t v7 = *(unsigned __int8 **)(a2 + 8)) == 0)
  {
    sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldNfc_DnldEseValidateRxdPkt:Dnld eSE Cmd Request Failed!!");
LABEL_3:
    uint64_t v4 = 255;
    goto LABEL_4;
  }
  *(void *)&v66[0] = *(void *)a1;
  sub_2259A0FB0(0, (unsigned int *)v66, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd");
  if ((v7[(v6 - 1)] | (v7[v6 - 2] << 8)) != sub_2259A2A40(*(uint64_t *)&v66[0], v7, (unsigned __int16)(v6 - 2)))
  {
    sub_2259A0EAC(0, (unsigned int *)v66, 6u, 1u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd:Invalid frame received");
    sub_22599F9EC(0, (unsigned int *)v66, 6u, 1u, (uint64_t)"Received CRC: ");
    sub_22599F9EC(0, (unsigned int *)v66, 6u, 1u, (uint64_t)"Calculated CRC: ");
LABEL_23:
    sub_2259A10B4(0, (unsigned int *)v66, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd");
    goto LABEL_3;
  }
  if ((v7[1] | ((*v7 & 0x1F) << 8)) != (unsigned __int16)(v6 - 4))
  {
    sub_2259A0EAC(0, (unsigned int *)v66, 6u, 1u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd:Invalid frame payload length received");
    goto LABEL_23;
  }
  sub_2259A10B4(0, (unsigned int *)v66, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd");
  uint64_t v67 = 0;
  memset(v66, 0, sizeof(v66));
  sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_UpdateRsp");
  uint64_t v8 = *((void *)a1 + 172);
  if (!v8 || !*(void *)(v8 + 6632))
  {
    unsigned __int8 v15 = "phDnldEseNfc_UpdateRsp:Invalid Context!!";
    int v16 = 4;
    uint64_t v17 = a1;
LABEL_61:
    sub_2259A0EAC(v16, v17, 6u, 1u, (uint64_t)v15);
    goto LABEL_62;
  }
  unsigned int v9 = a1[186];
  if (v9 > 0x25 || ((1 << v9) & 0x3400000001) == 0)
  {
    uint64_t v17 = a1 + 342;
    unsigned __int8 v15 = "phDnldEseNfc_UpdateRsp:Unsuccessful Status received!!";
    goto LABEL_60;
  }
  uint64_t v10 = *(void *)(a2 + 8);
  if (!v10)
  {
    uint64_t v17 = a1 + 342;
    unsigned __int8 v15 = "phDnldEseNfc_UpdateRsp:Invalid TML buffer received!!";
LABEL_60:
    int v16 = 1;
    goto LABEL_61;
  }
  LOWORD(v6) = v6 - 5;
  int v11 = (unsigned char *)(v8 + 5996);
  unsigned int v12 = *(unsigned __int8 *)(v10 + 2);
  unsigned int v13 = v12 >> 5;
  if (!(v12 >> 5))
  {
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciRecvManager");
    char v18 = *(unsigned char *)(v10 + 3);
    sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetPipeIndx");
    uint64_t v19 = 0;
    uint64_t v20 = 136;
    while (*((unsigned char *)a1 + v20) != (v18 & 0x7F))
    {
      ++v19;
      v20 += 2;
      if (v19 == 8)
      {
        sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetPipeIndx");
        LOBYTE(v19) = 0;
        goto LABEL_39;
      }
    }
    sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetPipeIndx");
    if (v19 >= 8u)
    {
      __int16 v22 = a1 + 342;
      unsigned __int8 v23 = "phDnldEseNfc_HciRecvManager: Data from unknown Pipe ID";
LABEL_41:
      sub_2259A0EAC(1, v22, 6u, 1u, (uint64_t)v23);
      uint64_t v4 = 255;
LABEL_42:
      sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciRecvManager");
      goto LABEL_63;
    }
LABEL_39:
    if ((unsigned __int16)v6 >= 0x11Bu)
    {
      __int16 v22 = a1 + 342;
      unsigned __int8 v23 = "phDnldEseNfc_HciRecvManager: Recvd HCP Pkt > PHDNLDNFC_ESE_HDLL_HCP_MAX_PACKET_SIZE";
      goto LABEL_41;
    }
    sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetNewNode");
    unsigned int v61 = a1 + 38;
    uint64_t v24 = *(void *)&a1[2 * v19 + 38];
    if (v24)
    {
      do
      {
        uint64_t v25 = v24;
        uint64_t v24 = *(void *)(v24 + 296);
      }
      while (v24);
      unsigned int v65 = a1 + 342;
      uint64_t Memory = phOsalNfc_GetMemory();
      *(void *)(v25 + 296) = Memory;
      if (Memory)
      {
        ++*((_WORD *)a1 + v19 + 108);
        phOsalNfc_SetMemory();
        *(void *)(*(void *)(v25 + 296) + 296) = 0;
        uint64_t v27 = *(void *)(v25 + 296);
        int v11 = (unsigned char *)(v8 + 5996);
        a1[v19 + 58] = (unsigned __int16)v6 + a1[v19 + 58] - 1;
        sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetNewNode");
        if (v27)
        {
          char v59 = v18;
          uint64_t v28 = a1 + 342;
          LODWORD(v6) = (unsigned __int16)v6;
LABEL_65:
          unsigned int v65 = v28;
          phOsalNfc_MemCopy();
          *(_DWORD *)(v27 + 288) = v6;
          char v18 = v59;
          goto LABEL_69;
        }
      }
      else
      {
        sub_2259A0EAC(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_GetNewNode:Memory allcation failed while creating new node!");
        sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetNewNode");
      }
      sub_2259A0EAC(1, v65, 6u, 1u, (uint64_t)" phDnldEseNfc_HciRecvManager:Failed To Allocate Memory for Node");
LABEL_69:
      if ((v18 & 0x80) == 0)
      {
        sub_2259A0EAC(1, v65, 6u, 4u, (uint64_t)"phDnldEseNfc_HciRecvManager:Buffered Received Chained HCI packets");
        unsigned int v13 = 0;
        if (*((void *)a1 + 81) && *((unsigned char *)a1 + 1384) == 1)
        {
          *((unsigned char *)a1 + 1384) = 0;
          uint64_t v35 = *((void *)a1 + 6);
          if (v35 == 0xFFFFFFFFFFFFLL)
          {
            sub_2259A0EAC(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_HciRecvManager: Invalid response timer");
          }
          else
          {
            unsigned int v51 = a1[196];
            if (v51 <= 0x2710) {
              unsigned int v51 = 10000;
            }
            a1[8] = v51;
            sub_2259DD7E4(a1[342], v35);
            *((unsigned char *)a1 + 16) = 0;
            uint64_t v52 = phOsalNfc_Timer_Start();
            if (v52)
            {
              uint64_t v4 = v52;
              sub_2259A0EAC(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_HciRecvManager : Response Timer Start failed!!!");
              goto LABEL_42;
            }
            *((unsigned char *)a1 + 16) = 1;
            unsigned int v13 = 0;
          }
        }
        sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciRecvManager");
        goto LABEL_107;
      }
      *((unsigned char *)a1 + 1384) = 1;
      uint64_t v36 = &a1[v19];
      unsigned int v38 = v36[58];
      uint64_t v37 = (int *)(v36 + 58);
      if (v38)
      {
        uint64_t v39 = phOsalNfc_GetMemory();
        if (!v39)
        {
          unsigned __int8 v23 = "phDnldEseNfc_HciRecvManager:Memory Allocation Failed";
          __int16 v22 = v65;
          goto LABEL_41;
        }
      }
      else
      {
        uint64_t v39 = 0;
      }
      char v58 = v37;
      sub_2259A0FB0(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ExtractHciData");
      uint64_t v40 = v61[v19];
      unsigned int v41 = *((unsigned __int16 *)a1 + v19 + 108);
      unsigned int v62 = *(unsigned char *)v40 & 0x7F;
      LOBYTE(v68) = *(unsigned char *)v40 & 0x7F;
      unsigned __int8 v42 = *(unsigned char *)(v40 + 1);
      BYTE2(v68) = v42 >> 6;
      int v63 = v42 & 0x3F;
      BYTE1(v68) = v42 & 0x3F;
      unsigned int v43 = *(_DWORD *)(v40 + 288) - 2;
      phOsalNfc_MemCopy();
      unsigned int v64 = v41;
      uint64_t v60 = v39;
      if (v41 >= 2)
      {
        if (v39) {
          uint64_t v44 = v39 + v43;
        }
        else {
          uint64_t v44 = 0;
        }
        uint64_t v45 = *(void *)(v40 + 296);
        unsigned int v46 = 1;
        do
        {
          int v47 = *(_DWORD *)(v45 + 288);
          unsigned int v48 = v47 - 1;
          if (v47 == 1)
          {
            sub_2259A0EAC(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_ExtractHciData: HCI Core Receive- Zero Payload Len");
          }
          else
          {
            phOsalNfc_MemCopy();
            uint64_t v45 = *(void *)(v45 + 296);
            v43 += v48;
            if (!v45) {
              break;
            }
            v44 += v48;
          }
          ++v46;
        }
        while (v46 < v64);
      }
      int v49 = *v58;
      LOWORD(v70) = *v58;
      uint64_t v69 = v60;
      if (v43 != v49)
      {
        sub_2259A0EAC(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_ExtractHciData:HCI Core Receive- Mismatch in Number of Payload Bytes                Processed and Stored");
        sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ExtractHciData");
        unsigned __int8 v23 = " phDnldEseNfc_HciRecvManager: HCI Packet Extraction Failed";
        __int16 v22 = v65;
        goto LABEL_41;
      }
      sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ExtractHciData");
      sub_225A5CDDC(a1, v19);
      sub_22599F9EC(1, v65, 6u, 4u, (uint64_t)"Rx HCP:PipeID");
      sub_22599F9EC(1, v65, 6u, 4u, (uint64_t)"Rx HCP:MsgType");
      sub_22599F9EC(1, v65, 6u, 4u, (uint64_t)"Rx HCP:Ins");
      sub_2259A1C74(1, v65, 6u, 4u, (uint64_t)"Rx HCP:Data", v60);
      if (v62 <= 0x2D)
      {
        if (((1 << v62) & 0x38002000000) != 0)
        {
          if (v63 == 2 || !a1[186])
          {
            uint64_t v50 = sub_225A5CF04(a1, (uint64_t)&v68);
            goto LABEL_102;
          }
        }
        else if (((1 << v62) & 0x380000400000) != 0)
        {
          uint64_t v50 = sub_225A5D4EC(a1, (unsigned __int8 *)&v68);
LABEL_102:
          uint64_t v4 = v50;
LABEL_103:
          phOsalNfc_FreeMemory();
          sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciRecvManager");
          int v11 = (unsigned char *)(v8 + 5996);
          unsigned int v13 = 0;
          if (!v4) {
            goto LABEL_107;
          }
          goto LABEL_63;
        }
      }
      sub_22599F9EC(1, v65, 6u, 2u, (uint64_t)"phDnldEseNfc_HciRecvManager: Invalid PipeID/response received, packet dropped PipeID");
      uint64_t v4 = 0;
      goto LABEL_103;
    }
    char v59 = v18;
    uint64_t v28 = a1 + 342;
    v61[v19] = phOsalNfc_GetMemory();
    phOsalNfc_SetMemory();
    uint64_t v34 = v61[v19];
    *(_DWORD *)(v34 + 288) = 0;
    *(void *)(v34 + 296) = 0;
    uint64_t v27 = v61[v19];
    *(void *)(v27 + 296) = 0;
    LODWORD(v6) = (unsigned __int16)v6;
    int v11 = (unsigned char *)(v8 + 5996);
    a1[v19 + 58] = (unsigned __int16)v6 - 2;
    sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetNewNode");
    goto LABEL_65;
  }
  if (v13 != 3)
  {
    if (v13 == 2)
    {
      unsigned int v14 = a1[194];
      if (v14 && v14 >= (unsigned __int16)v6 && *((void *)a1 + 96))
      {
        phOsalNfc_MemCopy();
        a1[194] = (unsigned __int16)v6;
LABEL_107:
        a1[10] = 0;
        uint64_t v53 = phTmlNfc_Read();
        uint64_t v4 = 0;
        if (v53 != 13)
        {
          uint64_t v54 = v53;
          sub_2259A0EAC(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_UpdateRsp: dnld packet Read Request Failure");
          sub_2259D7178(*(void *)a1, 195);
          uint64_t v4 = v54;
        }
        if (v13 == 2 && !v4)
        {
          *(_DWORD *)(v8 + 6012) = 5;
          sub_2259CDA68(v8, 8, a2);
          char v55 = 0;
          uint64_t v56 = 0;
          do
          {
            uint64_t v57 = *((void *)&unk_26ABD79B8 + 14 * v56 + 4);
            if (v55) {
              break;
            }
            char v55 = 1;
            uint64_t v56 = 1;
          }
          while (v57 != v8);
          if (v57 == v8 && !v11[12] && !sub_2259E0DA4(*(void *)(v8 + 6536))) {
            sub_225A5C3C0((unsigned int *)v8);
          }
          uint64_t v4 = 0;
        }
        goto LABEL_63;
      }
      uint64_t v4 = 1;
LABEL_63:
      sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_UpdateRsp");
      goto LABEL_4;
    }
    uint64_t v17 = a1 + 342;
    unsigned __int8 v15 = "phDnldEseNfc_UpdateRsp:Unknown Resp passed, while receive!!";
    goto LABEL_60;
  }
  int v21 = v12 & 0x1F;
  if (v21 == 3)
  {
    sub_225A5D96C(a1, *(unsigned __int8 *)(v10 + 3));
LABEL_62:
    uint64_t v4 = 255;
    goto LABEL_63;
  }
  if (v21 != 2)
  {
    if (!v21)
    {
      sub_225A5CD24((uint64_t)a1, *(unsigned char *)(v10 + 3));
      goto LABEL_107;
    }
    uint64_t v17 = a1 + 342;
    unsigned __int8 v15 = "phDnldEseNfc_UpdateRsp:Invalid opcode notification received!!";
    goto LABEL_60;
  }
  sub_2259DD7E4(a1[342], *((void *)a1 + 6));
  *((unsigned char *)a1 + 16) = 0;
  sub_2259DD7E4(a1[342], *((void *)a1 + 7));
  *((unsigned char *)a1 + 17) = 0;
  *int v11 = 0;
  *(_DWORD *)(v8 + 5988) = 0;
  sub_2259A0EAC(1, a1 + 342, 6u, 2u, (uint64_t)"phDnldEseNfc_UpdateRsp:eSE Removed Notification");
  sub_2259D7178(*(void *)a1, 214);
  uint64_t v29 = (void (*)(void, void, uint64_t, void, _OWORD *, void))*((void *)a1 + 85);
  if (v29)
  {
    unsigned int v30 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 3);
    int v31 = 255;
    if (v30 < 0x10 || (v30 & 0xB0) == 0x20 || (v30 >> 4) - 6 >= 0xFFFFFFFE)
    {
      BOOL v32 = v30 > 0xF;
      BOOL v33 = (v30 & 0xF) - 13 < 0xFFFFFFF4;
      int v31 = v32 && v33 ? 255 : *(unsigned __int8 *)(*(void *)(a2 + 8) + 3);
      if (!v32 || !v33) {
        LOBYTE(v30) = 0;
      }
    }
    LODWORD(v66[0]) = v31;
    BYTE4(v66[0]) = v30;
    v29(*(void *)a1, *((void *)a1 + 86), 16, *((void *)a1 + 1), v66, 0);
    uint64_t v4 = 214;
    sub_2259C5D40((uint64_t)a1, 214, a2);
  }
  else
  {
    sub_2259A0EAC(1, a1 + 342, 6u, 2u, (uint64_t)"phDnldEseNfc_UpdateRsp: Dropping SE Removed Notification as no callback registered");
    uint64_t v4 = 214;
  }
LABEL_4:
  sub_2259A10B4(4, a1, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseValidateRxdPkt");
  return v4;
}

uint64_t sub_225A5E7B4(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  if (!a1) {
    goto LABEL_6;
  }
  char v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 12);
    if (v4) {
      break;
    }
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while (v6 != a1);
  if (v6 != a1) {
    goto LABEL_6;
  }
  uint64_t v8 = *(void *)(a1 + 8496);
  if (!v8) {
    goto LABEL_6;
  }
  if (!a2) {
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v8 + 6640);
  if (!v9 || *(_WORD *)a2) {
    goto LABEL_6;
  }
  uint64_t v10 = *(void *)(a2 + 8);
  if (*(_WORD *)(a1 + 8438) || v10 != a1 + 4288 + *(unsigned __int16 *)(a1 + 8438))
  {
    uint64_t v11 = *(unsigned __int16 *)(v9 + 42);
    if (v10 != v9 + v11 + 1075) {
      goto LABEL_6;
    }
  }
  else
  {
    phOsalNfc_MemCopy();
    LOWORD(v11) = *(_WORD *)(v9 + 42);
  }
  unsigned __int16 v12 = *(_WORD *)(a2 + 16) + v11;
  *(_WORD *)(v9 + 42) = v12;
  if (v12 <= 1u)
  {
    *(_WORD *)(v9 + 40) = 2 - v12;
    if (phTmlNfc_Read() != 13) {
      sub_2259D7178(*(void *)v9, 195);
    }
    goto LABEL_6;
  }
  char v13 = *(unsigned char *)(v9 + 1075);
  unsigned int v14 = *(unsigned __int8 *)(v9 + 1076) | ((v13 & 0x1F) << 8);
  unsigned int v15 = v14 + 4;
  *(_WORD *)(v9 + 40) = (*(unsigned __int8 *)(v9 + 1076) | ((v13 & 0x1F) << 8)) + 4;
  if (v14 > 0x120)
  {
    sub_2259A0EAC(1, (unsigned int *)(v9 + 1368), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldEsePkt: Invalid length; Received size greater than maximum download frame size!!");
    goto LABEL_27;
  }
  if (v15 == v12)
  {
    *(void *)(a2 + 8) = v9 + 1075;
    *(_WORD *)(a2 + 16) = v12;
    *(_WORD *)(v9 + 40) = 0;
    int v16 = sub_225A5DB2C((unsigned int *)v9, a2);
    if (!v16) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
  if (v15 <= v12)
  {
    sub_2259A0EAC(1, (unsigned int *)(v9 + 1368), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldEsePkt:Critical failure in Download Ese mode!!");
    goto LABEL_6;
  }
  *(_WORD *)(v9 + 40) = v15 - v12;
  int v24 = phTmlNfc_Read();
  if (v24 != 13)
  {
    int v16 = v24;
    sub_2259D7178(*(void *)v9, 195);
    if (v16)
    {
LABEL_23:
      if (v16 == 13) {
        goto LABEL_6;
      }
      if (v16 != 255)
      {
        int v17 = 0;
LABEL_28:
        char v18 = 0;
        uint64_t v19 = 0;
        do
        {
          uint64_t v20 = *((void *)&unk_26ABD79B8 + 14 * v19 + 8);
          if (v18) {
            break;
          }
          char v18 = 1;
          uint64_t v19 = 1;
        }
        while (v20 != v9);
        if (v20 == v9 && *(void *)v9)
        {
          phTmlNfc_ReadAbort();
          if (v17) {
            phTmlNfc_FlushTxRxBuffers();
          }
          *(_DWORD *)(v9 + 40) = 0;
          if (phTmlNfc_Read() != 13)
          {
            sub_2259A0EAC(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldEsePkt: Read Request Failure");
            sub_2259D7178(*(void *)(a1 + 48), 195);
          }
          *(_WORD *)a2 = v16;
          *(_DWORD *)(v8 + 6012) = 5;
          sub_2259CDA68(v8, 9, a2);
          char v21 = 0;
          uint64_t v22 = 0;
          do
          {
            uint64_t v23 = *((void *)&unk_26ABD79B8 + 14 * v22 + 4);
            if (v21) {
              break;
            }
            char v21 = 1;
            uint64_t v22 = 1;
          }
          while (v23 != v8);
          if (v23 == v8 && !*(unsigned char *)(v8 + 6008) && !sub_2259E0DA4(*(void *)(v8 + 6536))) {
            sub_225A5C3C0((unsigned int *)v8);
          }
        }
        goto LABEL_6;
      }
LABEL_27:
      int v17 = 1;
      sub_2259A1C74(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"phDnldNfc_RecvDnldEsePkt:corrutped packet rxd and dropped", *(void *)(a2 + 8));
      LOWORD(v16) = 255;
      goto LABEL_28;
    }
  }
LABEL_6:

  return sub_2259A10B4(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
}

uint64_t sub_225A5EB84(uint64_t a1, uint64_t a2)
{
  sub_2259A0FB0(4, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldEseNfc_CrdtTimeOutCb");
  if (a2)
  {
    char v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *((void *)&unk_26ABD79B8 + 14 * v5 + 8);
      if (v4) {
        break;
      }
      char v4 = 1;
      uint64_t v5 = 1;
    }
    while (v6 != a2);
    uint64_t v7 = v6 == a2 ? *(void *)(a2 + 1376) : 0;
    if (*(void *)(a2 + 56) == a1)
    {
      sub_2259DD7E4(*(_DWORD *)(a2 + 1368), a1);
      *(unsigned char *)(a2 + 17) = 0;
      if (v7)
      {
        *(_DWORD *)(v7 + 6012) = 5;
        if (*(unsigned char *)(a2 + 29))
        {
          sub_2259CDA68(v7, 11, 0);
        }
        else
        {
          sub_2259CDA68(v7, 12, 0);
          char v8 = 0;
          uint64_t v9 = 0;
          do
          {
            uint64_t v10 = *((void *)&unk_26ABD79B8 + 14 * v9 + 4);
            if (v8) {
              break;
            }
            char v8 = 1;
            uint64_t v9 = 1;
          }
          while (v10 != v7);
          if (v10 == v7 && !*(unsigned char *)(v7 + 6008) && !sub_2259E0DA4(*(void *)(v7 + 6536))) {
            sub_225A5C3C0((unsigned int *)v7);
          }
        }
      }
    }
  }

  return sub_2259A10B4(4, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldEseNfc_CrdtTimeOutCb");
}

uint64_t sub_225A5ECDC(uint64_t a1, int *a2)
{
  sub_2259A0FB0(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phDnldNfc_BuildDnldEsePkt");
  if (!a1 || ((v4 = *(void *)(a1 + 6632), (uint64_t v5 = *(void *)(a1 + 6640)) != 0) ? (v6 = v4 == 0) : (v6 = 1), v6))
  {
    uint64_t v7 = 1;
    int v8 = 2;
    uint64_t v9 = (unsigned int *)a1;
    goto LABEL_8;
  }
  uint64_t v11 = (unsigned int *)(v5 + 1368);
  phOsalNfc_SetMemory();
  *(_WORD *)(v5 + 382) = 0;
  if (!a2[4] || !*((void *)a2 + 1))
  {
    int v12 = *a2;
    if (*a2 == 37) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
    int v8 = 1;
    uint64_t v9 = v11;
LABEL_8:
    sub_2259A0EAC(v8, v9, 6u, 1u, (uint64_t)"phDnldNfc_BuildDnldEsePkt:Invalid Input Parameter!!");
    goto LABEL_9;
  }
  int v12 = *a2;
  if ((*a2 - 36) < 2)
  {
LABEL_18:
    *(unsigned char *)(v5 + 386) = v12;
    if (*a2 != 37) {
      phOsalNfc_MemCopy();
    }
    int v14 = a2[4];
    *(unsigned char *)(v5 + 385) = v14 + 1;
    *(unsigned char *)(v5 + 384) = ((unsigned __int16)(v14 + 1) >> 8) & 0x1F | 0x80;
    unsigned __int16 v15 = v14 + 3;
LABEL_21:
    *(_WORD *)(v5 + 382) = v15;
    unsigned int v16 = sub_2259A2A40(*(void *)v5, (unsigned __int8 *)(v5 + 384), v15);
    uint64_t v17 = *(unsigned __int16 *)(v5 + 382);
    *(_WORD *)(v5 + v17 + 384) = __rev16(v16);
    *(_WORD *)(v5 + 382) = v17 + 2;
    sub_2259A0EAC(1, (unsigned int *)(v5 + 1368), 6u, 4u, (uint64_t)"phDnldNfc_BuildDnldEsePkt: Frame created successfully");
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  if (v12)
  {
    if (v12 != 34)
    {
      char v13 = "phDnldNfc_BuildDnldEsePkt:Invalid Input Parameter!!";
LABEL_16:
      sub_2259A0EAC(1, v11, 6u, 1u, (uint64_t)v13);
      uint64_t v7 = 255;
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  if (*(unsigned char *)(v5 + 29))
  {
    *(unsigned char *)(v5 + 386) = 0;
    *(_WORD *)(v5 + 382) = 1;
    if (*(unsigned char *)(v5 + 380))
    {
      unsigned int v18 = *(_DWORD *)(v5 + 376);
      if (v18 <= 0xFE)
      {
        long long v19 = *((_OWORD *)a2 + 1);
        long long v31 = *(_OWORD *)a2;
        long long v32 = v19;
        long long v33 = *((_OWORD *)a2 + 2);
        int v20 = sub_225A5F09C(v5, (uint64_t)&v31, v18, 1, 1);
        *(unsigned char *)(v5 + 380) = 0;
LABEL_37:
        if (v20)
        {
          uint64_t v7 = 1;
          goto LABEL_9;
        }
        __int16 v29 = *(_WORD *)(v5 + 382);
        *(unsigned char *)(v5 + 385) = v29;
        *(unsigned char *)(v5 + 384) = HIBYTE(v29) & 0x1F | 0x80;
        unsigned __int16 v15 = v29 + 2;
        goto LABEL_21;
      }
      long long v27 = *((_OWORD *)a2 + 1);
      long long v31 = *(_OWORD *)a2;
      long long v32 = v27;
      long long v33 = *((_OWORD *)a2 + 2);
      uint64_t v24 = v5;
      unsigned int v22 = 254;
      char v25 = 0;
      int v26 = 1;
    }
    else
    {
      unsigned int v22 = a2[4];
      *(_DWORD *)(v5 + 376) = v22;
      if (v22 > 0xFD)
      {
        long long v28 = *((_OWORD *)a2 + 1);
        long long v31 = *(_OWORD *)a2;
        long long v32 = v28;
        long long v33 = *((_OWORD *)a2 + 2);
        int v20 = sub_225A5F09C(v5, (uint64_t)&v31, 253, 0, 0);
        *(unsigned char *)(v5 + 380) = 1;
        goto LABEL_37;
      }
      long long v23 = *((_OWORD *)a2 + 1);
      long long v31 = *(_OWORD *)a2;
      long long v32 = v23;
      long long v33 = *((_OWORD *)a2 + 2);
      uint64_t v24 = v5;
      char v25 = 1;
      int v26 = 0;
    }
    int v20 = sub_225A5F09C(v24, (uint64_t)&v31, v22, v25, v26);
    goto LABEL_37;
  }
  uint64_t v21 = *(void *)(v5 + 56);
  if (!v21 || v21 == 0xFFFFFFFFFFFFLL)
  {
    char v13 = "phDnldNfc_BuildDnldEsePkt : Invalid Download Ese CreditTimer ID";
    goto LABEL_16;
  }
  *(_DWORD *)(v5 + 36) = 250;
  *(unsigned char *)(v5 + 17) = 1;
  sub_2259DD7E4(*(_DWORD *)(v5 + 1368), v21);
  if (phOsalNfc_Timer_Start())
  {
    sub_2259A0EAC(1, (unsigned int *)(v5 + 1368), 6u, 1u, (uint64_t)"phDnldNfc_BuildDnldEsePkt : Credit Timer Start failed!!!");
    uint64_t v7 = 255;
  }
  else
  {
    uint64_t v7 = 13;
  }
  uint64_t v30 = *(void *)(v4 + 64);
  if (v30 && v30 != 0xFFFFFFFFFFFFLL && !*(unsigned char *)(v4 + 80))
  {
    if (!phOsalNfc_Timer_Start())
    {
      *(unsigned char *)(v4 + 80) = 1;
      goto LABEL_9;
    }
    char v13 = "phNciCoreMuxNfc_eMuxEvtDnldTxCb : Failed to create start timer";
    goto LABEL_16;
  }
LABEL_9:
  sub_2259A10B4(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phDnldNfc_BuildDnldEsePkt");
  return v7;
}

uint64_t sub_225A5F09C(uint64_t a1, uint64_t a2, int a3, char a4, int a5)
{
  unsigned __int8 v13 = -1;
  sub_2259A0FB0(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_BuildDnldEseHciPkt");
  if (a3)
  {
    phOsalNfc_SetMemory();
    uint64_t v9 = sub_225A5D3DC(a1, *(_DWORD *)(a1 + 788), &v13);
    if (v9 || v13 == 255)
    {
      sub_2259A0EAC(4, (unsigned int *)a1, 6u, 1u, (uint64_t)"phDnldNfc_BuildDnldEseHciPkt:Invalid PipeId");
    }
    else
    {
      *(unsigned char *)(a1 + 792) = v13 | (a4 << 7);
      if (a5)
      {
        phOsalNfc_MemCopy();
        __int16 v10 = 1;
      }
      else
      {
        *(unsigned char *)(a1 + 793) = 80;
        phOsalNfc_MemCopy();
        __int16 v10 = 2;
      }
      __int16 v11 = v10 + a3;
      phOsalNfc_MemCopy();
      uint64_t v9 = 0;
      *(_DWORD *)(a1 + 376) -= a3;
      *(_WORD *)(a1 + 382) += v11;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }
  sub_2259A10B4(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_BuildDnldEseHciPkt");
  return v9;
}

uint64_t sub_225A5F228(uint64_t a1)
{
  sub_2259A0FB0(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_CoreDeInit");
  if (a1)
  {
    sub_2259D08F4(*(unsigned int **)(a1 + 1376));
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2 && v2 != 0xFFFFFFFFFFFFLL)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(void *)(a1 + 48) = 0xFFFFFFFFFFFFLL;
    }
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3 && v3 != 0xFFFFFFFFFFFFLL)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(void *)(a1 + 56) = 0xFFFFFFFFFFFFLL;
    }
    sub_2259CD324(*(_DWORD *)(a1 + 1368));
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }
  sub_2259A10B4(4, 0, 6u, 5u, (uint64_t)"phDnldEseNfc_CoreDeInit");
  return v4;
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint64_t phOsalNfc_CloseLogFile()
{
  return MEMORY[0x270F96390]();
}

uint64_t phOsalNfc_DeInit()
{
  return MEMORY[0x270F96398]();
}

uint64_t phOsalNfc_Delay()
{
  return MEMORY[0x270F963A0]();
}

uint64_t phOsalNfc_FreeLibrary()
{
  return MEMORY[0x270F963A8]();
}

uint64_t phOsalNfc_FreeMemory()
{
  return MEMORY[0x270F963B0]();
}

uint64_t phOsalNfc_GetMemory()
{
  return MEMORY[0x270F963B8]();
}

uint64_t phOsalNfc_Init()
{
  return MEMORY[0x270F963C0]();
}

uint64_t phOsalNfc_LoadLibrary()
{
  return MEMORY[0x270F963C8]();
}

uint64_t phOsalNfc_MemCompare()
{
  return MEMORY[0x270F96400]();
}

uint64_t phOsalNfc_MemCopy()
{
  return MEMORY[0x270F96408]();
}

uint64_t phOsalNfc_OpenLogFile()
{
  return MEMORY[0x270F96410]();
}

uint64_t phOsalNfc_RaiseException()
{
  return MEMORY[0x270F96418]();
}

uint64_t phOsalNfc_SetMemory()
{
  return MEMORY[0x270F96428]();
}

uint64_t phOsalNfc_SignPostLogHexData()
{
  return MEMORY[0x270F96438]();
}

uint64_t phOsalNfc_Timer_Create()
{
  return MEMORY[0x270F96458]();
}

uint64_t phOsalNfc_Timer_Delete()
{
  return MEMORY[0x270F96460]();
}

uint64_t phOsalNfc_Timer_Start()
{
  return MEMORY[0x270F96468]();
}

uint64_t phOsalNfc_Timer_Stop()
{
  return MEMORY[0x270F96470]();
}

uint64_t phTmlNfc_ConfigHsuBaudRate()
{
  return MEMORY[0x270F96480]();
}

uint64_t phTmlNfc_ConfigureSpmi()
{
  return MEMORY[0x270F96488]();
}

uint64_t phTmlNfc_FlushTxRxBuffers()
{
  return MEMORY[0x270F96490]();
}

uint64_t phTmlNfc_GetHsuMaxBaudRate()
{
  return MEMORY[0x270F96498]();
}

uint64_t phTmlNfc_Init()
{
  return MEMORY[0x270F964A0]();
}

uint64_t phTmlNfc_IoCtl()
{
  return MEMORY[0x270F964A8]();
}

uint64_t phTmlNfc_Read()
{
  return MEMORY[0x270F964B0]();
}

uint64_t phTmlNfc_ReadAbort()
{
  return MEMORY[0x270F964B8]();
}

uint64_t phTmlNfc_SetGetSpmiDrvConfigRegs()
{
  return MEMORY[0x270F964C0]();
}

uint64_t phTmlNfc_Shutdown()
{
  return MEMORY[0x270F964C8]();
}

uint64_t phTmlNfc_SpmiDrvErrorStatus()
{
  return MEMORY[0x270F964D0]();
}

uint64_t phTmlNfc_Write()
{
  return MEMORY[0x270F964D8]();
}

uint64_t phTmlNfc_WriteAbort()
{
  return MEMORY[0x270F964E0]();
}