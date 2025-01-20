#error "100004AE0: switch analysis failed: switch information is incomplete or incorrect (funcsize=71)"

void sub_100004B0C(_xpc_connection_s *a1, xpc_object_t xdict)
{
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&out[16] = v4;
  *(_OWORD *)uuid_string_t out = v4;
  string = xpc_dictionary_get_string(xdict, "path");
  if (!string || (v6 = string, (uuid = xpc_dictionary_get_uuid(xdict, "uuid")) == 0))
  {
    int v22 = 22;
    goto LABEL_53;
  }
  uint64_t v8 = (uint64_t)uuid;
  uuid_unparse(uuid, out);
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v52[3] = v9;
  v52[4] = v9;
  v52[1] = v9;
  v52[2] = v9;
  v52[0] = v9;
  xpc_object_t array = xpc_dictionary_get_array(xdict, "sections");
  v11 = array;
  if (array)
  {
    if (xpc_array_get_count(array) == 5)
    {
      size_t v12 = 0;
      v13 = (void *)v52 + 1;
      while (1)
      {
        xpc_object_t value = xpc_array_get_value(v11, v12);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_data) {
          break;
        }
        memset(__str, 170, 16);
        data = xpc_array_get_data(v11, v12, (size_t *)&__str[8]);
        uint64_t v16 = *(void *)&__str[8];
        *(v13 - 1) = data;
        void *v13 = v16;
        ++v12;
        v13 += 2;
        if (v12 == 5) {
          goto LABEL_8;
        }
      }
    }
LABEL_48:
    int v22 = 22;
    goto LABEL_53;
  }
LABEL_8:
  if (!xpc_dictionary_get_BOOL(xdict, "ftab"))
  {
    char v42 = xpc_dictionary_get_BOOL(xdict, "fake_uuid");
    if (v11) {
      v43 = v52;
    }
    else {
      v43 = 0;
    }
    int v22 = sub_1000051E4((uint64_t)v6, v8, (uint64_t)v43, v42);
    goto LABEL_53;
  }
  v17 = xpc_dictionary_get_string(xdict, "role");
  if (!v17) {
    goto LABEL_48;
  }
  uint64_t v18 = (uint64_t)v17;
  size_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  memset(__b, 170, sizeof(__b));
  v19 = opendir("/private/var/tmp/FTABHarvest");
  if (!v19)
  {
    memset(__str, 170, sizeof(__str));
    v45 = __error();
    v46 = strerror(*v45);
    snprintf(__str, 0x400uLL, "Error opening FTAB harvesting folder %s", v46);
    sub_100007FD0((uint64_t)__str);
    int v22 = 9;
    goto LABEL_57;
  }
  v20 = v19;
  v21 = 0;
  int v22 = 0;
  while (1)
  {
    v23 = readdir(v20);
    if (!v23) {
      break;
    }
    int v22 = 2;
    if ((v23->d_type | 2) == 0xA)
    {
      snprintf(__b, 0x400uLL, "%s/%s", "/private/var/tmp/FTABHarvest", v23->d_name);
      uint64_t v24 = _os_trace_mmap_at();
      v21 = (void *)v24;
      if (v24)
      {
        if (v48 >> 31)
        {
          memset(__str, 170, sizeof(__str));
          snprintf(__str, 0x400uLL, "Invalid FTAB size 0x%zx", v48);
          sub_100007FD0((uint64_t)__str);
          munmap(v21, v48);
          int v22 = 2;
        }
        else
        {
          size_t v57 = v48;
          int v51 = -1431655766;
          uint64_t v50 = v24;
          if (v48 < 0x30) {
            goto LABEL_22;
          }
          if (!*(_DWORD *)(v24 + 4) || *(void *)(v24 + 32) != 0x62617466736F6B72) {
            goto LABEL_19;
          }
          uint64_t v27 = v24 + 48;
          uint64_t v28 = *(unsigned int *)(v24 + 40);
          if (16 * v28 + 48 > v48)
          {
LABEL_22:
            int v22 = 22;
            goto LABEL_23;
          }
          if (!v28)
          {
            int v22 = 2;
            goto LABEL_23;
          }
          uint64_t v30 = 0;
          while (2)
          {
            uint64_t v31 = v27 + 16 * v30;
            size_t v32 = *(unsigned int *)(v31 + 4);
            if (v48 >= v32 && (unint64_t v33 = *(unsigned int *)(v31 + 8), v48 - v32 >= v33))
            {
              uint64_t v34 = 0;
              size_t v35 = v24 + v32;
              while (1)
              {
                uint64_t v36 = dword_10000B0D4[v34];
                if (v36 + 64 > v33) {
                  goto LABEL_38;
                }
                uint64_t v37 = v35 + v36;
                if (*(_DWORD *)v37 == 1684632949) {
                  break;
                }
                if (++v34 == 8) {
                  goto LABEL_38;
                }
              }
              *(_OWORD *)__str = *(_OWORD *)(v37 + 16);
              if (*(void *)__str == *(void *)v8 && *(void *)&__str[8] == *(void *)(v8 + 8))
              {
                int v51 = *(_DWORD *)(v27 + 16 * v30);
                int v39 = sub_100007EDC(v24, v48, "_osl", &v50, &v57);
                if (v39)
                {
                  int v40 = v39;
                  memset(__str, 170, sizeof(__str));
                  snprintf(__str, 0x400uLL, "Error finding OS LOG file in FTAB 0x%x");
LABEL_45:
                  sub_100007FD0((uint64_t)__str);
                  int v22 = v40;
                  goto LABEL_24;
                }
                int v41 = sub_100007EDC(v50, v57, &v51, &v49, &v47);
                if (v41)
                {
                  int v40 = v41;
                  memset(__str, 170, sizeof(__str));
                  snprintf(__str, 0x400uLL, "Error finding tag %.4s in OS LOG FTAB 0x%x");
                  goto LABEL_45;
                }
                closedir(v20);
                goto LABEL_60;
              }
LABEL_38:
              ++v30;
              int v22 = 2;
              if (v30 != v28) {
                continue;
              }
            }
            else
            {
LABEL_19:
              int v22 = 9;
            }
            break;
          }
LABEL_23:
          *(void *)&v56[29] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)uuid_string_t v56 = v29;
          *(_OWORD *)&v56[16] = v29;
          uuid_unparse((const unsigned __int8 *)v8, v56);
          memset(__str, 170, sizeof(__str));
          snprintf(__str, 0x400uLL, "Error finding UUID %s in ftab 0x%x", v56, v22);
          sub_100007FD0((uint64_t)__str);
LABEL_24:
          munmap(v21, v48);
        }
      }
      else
      {
        memset(__str, 170, sizeof(__str));
        v25 = __error();
        v26 = strerror(*v25);
        snprintf(__str, 0x400uLL, "Error mapping FTAB: %s err: %s", __b, v26);
        sub_100007FD0((uint64_t)__str);
        int v22 = 2;
      }
    }
  }
  closedir(v20);
  if (v22)
  {
    *(void *)&v56[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v44 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t v56 = v44;
    *(_OWORD *)&v56[16] = v44;
    uuid_unparse((const unsigned __int8 *)v8, v56);
    memset(__str, 170, sizeof(__str));
    snprintf(__str, 0x400uLL, "Error finding OS LOG section for uuid: %s", v56);
    sub_100007FD0((uint64_t)__str);
    goto LABEL_57;
  }
LABEL_60:
  *(_OWORD *)uuid_string_t v56 = xmmword_10000B050;
  LODWORD(v57) = 1;
  HIDWORD(v57) = v47;
  *(void *)__str = v56;
  *(void *)&__str[8] = 16;
  *(void *)&__str[16] = &v57;
  *(void *)&__str[24] = 8;
  *(void *)&__str[32] = v49;
  *(void *)&__str[40] = v47;
  *(void *)&__str[48] = v6;
  *(void *)&__str[56] = strlen(v6) + 1;
  int v22 = sub_100005D9C((unsigned __int8 *)v8, 1u);
  munmap(v21, v48);
  sub_100009EBC(v18);
  if (v22)
  {
LABEL_57:
    memset(__str, 170, sizeof(__str));
    snprintf(__str, 0x400uLL, "Harvesting from ftab failed(uuid: %s, err: 0x%x)");
    goto LABEL_58;
  }
  memset(__str, 170, sizeof(__str));
  snprintf(__str, 0x400uLL, "Harvesting from ftab succeded: %s");
LABEL_58:
  sub_100007FD0((uint64_t)__str);
LABEL_53:
  sub_1000054AC(a1, xdict, v22);
}

uint64_t sub_1000051E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  size_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = (unsigned int *)_os_trace_mmap_at();
  if (!v8) {
    return *__error();
  }
  long long v9 = v8;
  size_t v10 = v31;
  if (v31 >> 31)
  {
    munmap(v8, v31);
    return 34;
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 0x40000000;
  v25 = sub_100005528;
  v26 = &unk_10000C6C8;
  char v30 = a4;
  uint64_t v27 = a2;
  uint64_t v28 = a3;
  uint64_t v29 = a1;
  int v13 = *v8;
  int v12 = 88;
  if ((int)*v8 <= -805638659)
  {
    switch(v13)
    {
      case -1095041334:
        unsigned int v15 = bswap32(v8[1]);
        int v16 = 1;
        break;
      case -889275714:
        int v16 = 0;
        unsigned int v15 = v8[1];
        break;
      case -822415874:
        goto LABEL_15;
      default:
        goto LABEL_16;
    }
    if (20 * v15 == 20 * v15 && v31 - 8 >= 20 * v15)
    {
      unint64_t v18 = v15;
      if (v15)
      {
        v19 = v8 + 5;
        unint64_t v20 = 1;
        while (1)
        {
          unsigned int v21 = *(v19 - 1);
          if (v16)
          {
            unsigned int v21 = bswap32(v21);
            unsigned int v22 = bswap32(*v19);
          }
          else
          {
            unsigned int v22 = *v19;
          }
          if (v10 < v21 || v10 - v21 < v22) {
            break;
          }
          int v12 = v25((uint64_t)v24, (unsigned int *)((char *)v9 + v21), v22);
          v19 += 5;
          if (v12) {
            BOOL v23 = 1;
          }
          else {
            BOOL v23 = v20 >= v18;
          }
          ++v20;
          if (v23) {
            goto LABEL_16;
          }
        }
        int v12 = 88;
      }
      else
      {
        int v12 = 0;
      }
    }
    goto LABEL_16;
  }
  if (v13 != -17958193 && v13 != -17958194 && v13 != -805638658) {
    goto LABEL_16;
  }
LABEL_15:
  int v12 = sub_100005528((uint64_t)v24, v8, v31);
LABEL_16:
  if (munmap(v9, v31) == -1)
  {
    __error();
    _os_assumes_log();
  }
  if (v12) {
    unsigned int v14 = v12;
  }
  else {
    unsigned int v14 = 2;
  }
  if (v12 == 89) {
    return 0;
  }
  else {
    return v14;
  }
}

void sub_1000054AC(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v6 = reply;
    xpc_dictionary_set_int64(reply, "status", a3);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }
}

uint64_t sub_100005528(uint64_t a1, _DWORD *a2, unint64_t a3)
{
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v72[5] = v6;
  v72[6] = v6;
  v72[3] = v6;
  v72[4] = v6;
  v72[1] = v6;
  v72[2] = v6;
  v72[0] = v6;
  unint64_t v71 = 0xAAAAAAAAAAAAAAAALL;
  v70[1] = v6;
  v70[2] = v6;
  memset(uu, 170, sizeof(uu));
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2000000000;
  char v68 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2000000000;
  char v64 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2000000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2000000000;
  uint64_t v56 = 0;
  uint64_t v76 = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v73 = 0u;
  BYTE1(v73) = _dyld_is_memory_immutable() ^ 1;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 0x40000000;
  v52[2] = sub_100005D14;
  v52[3] = &unk_10000C560;
  v52[4] = &v53;
  _OWORD v52[5] = &v73;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 0x40000000;
  long long v44 = sub_100005A7C;
  v45 = &unk_10000C588;
  uint64_t v50 = uu;
  int v51 = &v73;
  v46 = v52;
  uint64_t v47 = &v65;
  size_t v48 = &v57;
  uint64_t v49 = &v61;
  if (a3 >= 4)
  {
    if (*a2 == -17958194)
    {
      if (a3 >= 0x1C)
      {
        unint64_t v7 = a2[5];
        if (a3 - 28 >= v7)
        {
          char v42 = 0;
          uint64_t v8 = a2 + 7;
LABEL_53:
          int v30 = 0;
          unsigned int v31 = a2[4];
          BOOL v32 = v31 == 0;
          if (v31 && v7 >= 8)
          {
            unint64_t v33 = v7;
            unsigned int v34 = 1;
            while (1)
            {
              unint64_t v35 = v8[1];
              BOOL v14 = v33 >= v35;
              v33 -= v35;
              if (!v14) {
                goto LABEL_9;
              }
              int v30 = 0;
              int v36 = *v8;
              if ((int)*v8 > 26)
              {
                switch(v36)
                {
                  case 44:
                    char v39 = v42;
                    if (v35 <= 0x17) {
                      char v39 = 0;
                    }
                    if ((v39 & 1) == 0) {
                      goto LABEL_9;
                    }
                    goto LABEL_83;
                  case 33:
                    char v40 = v42;
                    if (v35 < 0x14) {
                      char v40 = 1;
                    }
                    if (v40) {
                      goto LABEL_9;
                    }
                    goto LABEL_83;
                  case 27:
LABEL_66:
                    if (v35 < 0x18) {
                      goto LABEL_9;
                    }
LABEL_83:
                    int v30 = v44(v43, (uint64_t)v8);
                    break;
                }
              }
              else
              {
                switch(v36)
                {
                  case 1:
                    BOOL v37 = v35 >= 0x38;
                    char v38 = v42;
                    break;
                  case 12:
                    goto LABEL_66;
                  case 25:
                    BOOL v37 = v35 >= 0x48;
                    char v38 = v42 ^ 1;
                    break;
                  default:
                    goto LABEL_84;
                }
                if (!v37) {
                  char v38 = 1;
                }
                if (v38) {
                  goto LABEL_9;
                }
                if (!strcmp((const char *)v8 + 8, "__TEXT")
                  || !strcmp((const char *)v8 + 8, "__CTF")
                  || !strcmp((const char *)v8 + 8, "__OS_LOG"))
                {
                  goto LABEL_83;
                }
                int v30 = 0;
              }
LABEL_84:
              if (v30) {
                BOOL v41 = 1;
              }
              else {
                BOOL v41 = v34 >= v31;
              }
              BOOL v32 = v41;
              if (v33 >= 8)
              {
                uint64_t v8 = (_DWORD *)((char *)v8 + v35);
                ++v34;
                if (!v32) {
                  continue;
                }
              }
              break;
            }
          }
          if (v32) {
            int v9 = v30;
          }
          else {
            int v9 = 88;
          }
          goto LABEL_10;
        }
      }
    }
    else if (*a2 == -17958193 && a3 >= 0x20)
    {
      unint64_t v7 = a2[5];
      if (a3 - 32 >= v7)
      {
        uint64_t v8 = a2 + 8;
        char v42 = 1;
        goto LABEL_53;
      }
    }
  }
LABEL_9:
  int v9 = 88;
LABEL_10:
  if (*((unsigned char *)v62 + 24) && !v75) {
    *(void *)&long long v75 = v54[3];
  }
  for (uint64_t i = 0; i != 40; i += 8)
  {
    unint64_t v11 = *(unsigned int *)((char *)&v74 + i + 4);
    if (v11)
    {
      unint64_t v12 = *(unsigned int *)((char *)&v73 + i + 16);
      BOOL v14 = a3 >= v12;
      unint64_t v13 = a3 - v12;
      BOOL v14 = v14 && v13 >= v11;
      if (!v14) {
        goto LABEL_26;
      }
    }
  }
  if (v9 != 89 && v9 || !*((unsigned char *)v66 + 24) || (uint64_t v15 = v58[3]) == 0)
  {
    uuid_clear(uu);
LABEL_26:
    uint64_t v15 = 0;
  }
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  if (!v15) {
    return 0;
  }
  int v16 = *(unsigned __int8 *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v28 = *(void **)(a1 + 32);
    if (v28)
    {
      if (*v28 != *(void *)uu || v28[1] != *(void *)&uu[8]) {
        return 0;
      }
    }
  }
  if ((_BYTE)v73 && !*(void *)(a1 + 40)) {
    return 1;
  }
  uint64_t v17 = 0;
  unsigned int v18 = 0;
  v70[0] = xmmword_10000B060;
  v19 = (unsigned int *)&v74;
  int v20 = 1;
  while (1)
  {
    uint64_t v21 = v19[1];
    if (v21) {
      break;
    }
LABEL_39:
    v19 += 2;
    v17 += 16;
    if (v17 == 80) {
      goto LABEL_40;
    }
  }
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22)
  {
    if (*(void *)(v22 + v17 + 8) != v21) {
      return 72;
    }
    v72[v20] = *(_OWORD *)(v22 + v17);
  }
  else
  {
    BOOL v23 = &v72[v20];
    void *v23 = (char *)a2 + *v19;
    v23[1] = v21;
  }
  if (v17 != 64)
  {
    uint64_t v24 = (char *)v70 + 8 * v18++;
    HIDWORD(v70[0]) = v18;
    *((void *)v24 + 2) = *(void *)v19;
    ++v20;
    goto LABEL_39;
  }
LABEL_40:
  *(void *)&v72[0] = v70;
  *((void *)&v72[0] + 1) = 8 * v18 + 16;
  v25 = *(const char **)(a1 + 48);
  v26 = (const char **)&v72[v20];
  void *v26 = v25;
  v26[1] = (const char *)(strlen(v25) + 1);
  if (v16) {
    uint64_t v27 = *(unsigned __int8 **)(a1 + 32);
  }
  else {
    uint64_t v27 = uu;
  }
  LODWORD(result) = sub_100005D9C(v27, 1u);
  if (result) {
    return result;
  }
  else {
    return 89;
  }
}

uint64_t sub_100005A7C(void *a1, uint64_t a2)
{
  uint64_t result = 0;
  int v4 = *(_DWORD *)a2;
  if (*(int *)a2 > 26)
  {
    if (v4 == 44 || v4 == 33)
    {
      BOOL v14 = (unsigned char *)a1[9];
      if (!v14 || !*(_DWORD *)(a2 + 16)) {
        goto LABEL_58;
      }
      goto LABEL_29;
    }
    if (v4 != 27) {
      goto LABEL_59;
    }
    unint64_t v11 = (_OWORD *)a1[8];
    if (v11) {
      _OWORD *v11 = *(_OWORD *)(a2 + 8);
    }
    uint64_t v12 = a1[9];
    if (v12) {
      *(void *)(v12 + 8) = a2 + 8;
    }
    unint64_t v13 = a1 + 5;
LABEL_26:
    BOOL v14 = (unsigned char *)(*(void *)(*v13 + 8) + 24);
LABEL_29:
    uint64_t result = 0;
    *BOOL v14 = 1;
    goto LABEL_59;
  }
  switch(v4)
  {
    case 1:
      *(void *)(*(void *)(a1[6] + 8) + 24) = *(unsigned int *)(a2 + 36);
      uint64_t v15 = (unsigned char *)a1[9];
      if (v15)
      {
        if ((*(unsigned char *)(a2 + 52) & 8) != 0) {
          *uint64_t v15 = 1;
        }
        unint64_t v16 = *(unsigned int *)(a2 + 48);
        if (68 * (unint64_t)v16 + 56 <= *(unsigned int *)(a2 + 4))
        {
          if (v16)
          {
            uint64_t v26 = a1[4];
            uint64_t v27 = a2 + 56;
            unint64_t v28 = 1;
            do
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v26 + 16))(v26, v27, *(unsigned int *)(v27 + 40), *(unsigned int *)(v27 + 36));
              if (result) {
                BOOL v29 = 1;
              }
              else {
                BOOL v29 = v28 >= v16;
              }
              ++v28;
              v27 += 68;
            }
            while (!v29);
            break;
          }
          goto LABEL_58;
        }
LABEL_34:
        uint64_t result = 88;
        break;
      }
LABEL_58:
      uint64_t result = 0;
      break;
    case 12:
      unsigned int v18 = *(_DWORD *)(a2 + 4);
      uint64_t v17 = *(unsigned int *)(a2 + 8);
      if (v18 <= v17) {
        return 88;
      }
      if (v18 - v17 < 0x18 || a1[9] == 0) {
        goto LABEL_58;
      }
      int v20 = (uint64_t *)(a2 + v17);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      uint64_t v23 = *(uint64_t *)((char *)v20 + 15);
      BOOL v24 = v21 == 0x6C2F687461707240 && v22 == 0x5F676E616C636269;
      if (!v24 || v23 != 0x6E6173612E74725FLL) {
        goto LABEL_58;
      }
      unint64_t v13 = a1 + 7;
      goto LABEL_26;
    case 25:
      *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a2 + 48);
      v5 = (unsigned char *)a1[9];
      if (v5)
      {
        if ((*(unsigned char *)(a2 + 68) & 8) != 0) {
          unsigned char *v5 = 1;
        }
        unint64_t v6 = *(unsigned int *)(a2 + 64);
        if (80 * (unint64_t)v6 + 72 <= *(unsigned int *)(a2 + 4))
        {
          if (v6)
          {
            uint64_t v7 = a1[4];
            uint64_t v8 = a2 + 72;
            unint64_t v9 = 1;
            while (!HIDWORD(*(void *)(v8 + 40)))
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, v8, *(unsigned int *)(v8 + 48));
              if (result) {
                BOOL v10 = 1;
              }
              else {
                BOOL v10 = v9 >= v6;
              }
              ++v9;
              v8 += 80;
              if (v10) {
                goto LABEL_59;
              }
            }
            uint64_t result = 34;
            break;
          }
          goto LABEL_58;
        }
        goto LABEL_34;
      }
      goto LABEL_58;
  }
LABEL_59:
  if (!a1[9] && *(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 24)) {
      return 89;
    }
  }
  return result;
}

uint64_t sub_100005D14(uint64_t a1, void *a2, int a3, int a4)
{
  uint64_t v4 = 0;
  v5 = "__cstring";
  do
  {
    if (*a2 == *(void *)v5 && a2[1] == *((void *)v5 + 1))
    {
      uint64_t v8 = *(void *)(a1 + 40) + 8 * v4;
      *(_DWORD *)(v8 + 16) = a3;
      uint64_t v7 = (_DWORD *)(v8 + 20);
      goto LABEL_10;
    }
    ++v4;
    v5 += 16;
  }
  while (v4 != 5);
  if (*a2 ^ 0x74736E6F635F5FLL | a2[1]) {
    return 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  uint64_t v7 = (_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 28);
LABEL_10:
  *uint64_t v7 = a4;
  return 0;
}

uint64_t sub_100005D9C(unsigned __int8 *a1, unsigned int a2)
{
  int v7 = -1431655766;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[3] = v2;
  v6[4] = v2;
  v6[1] = v2;
  v6[2] = v2;
  v6[0] = v2;
  sub_100005E4C(a1, a2, (uint64_t)v6);
  uint64_t v4 = v3;
  if (!v3)
  {
    if (_os_trace_writev() == -1) {
      uint64_t v4 = *__error();
    }
    else {
      uint64_t v4 = 0;
    }
  }
  return sub_100006468((uint64_t)v6, v4);
}

void sub_100005E4C(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  memset(__b, 170, sizeof(__b));
  memset(__str, 170, sizeof(__str));
  sub_1000062AC(a1, a2 | 0x10, __b);
  int v6 = mkpath_np(__b, 0x1EDu);
  if (v6 && v6 != 17)
  {
LABEL_35:
    _os_assumes_log();
LABEL_36:
    *(void *)a3 = -1;
    return;
  }
  if (chown(__b, 0x110u, 0x110u) == -1) {
    goto LABEL_33;
  }
  while (1)
  {
    uint64_t v7 = open(__b, 17826052);
    if (v7 == -1)
    {
      __error();
      _os_assumes_log();
      __error();
      goto LABEL_36;
    }
    int v8 = v7;
    if (qword_1000101B8 != -1) {
      dispatch_once(&qword_1000101B8, &stru_10000CA08);
    }
    if (byte_1000101C0)
    {
      uint64_t v21 = 0;
      long long v20 = xmmword_10000B0F8;
      int v19 = 4;
      uint64_t v7 = fsetattrlist(v8, &v20, &v19, 4uLL, 0);
      if (v7 == -1)
      {
LABEL_26:
        __error();
        _os_assumes_log();
        __error();
        goto LABEL_30;
      }
    }
    if (a2 - 1 < 2)
    {
      uint64_t v9 = 1;
      BOOL v10 = (unsigned char *)(a3 + 8);
      do
      {
        *BOOL v10 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
        unint64_t v11 = v10 + 2;
        v10[1] = a0123456789abcd[a1[v9++] & 0xF];
        v10 += 2;
      }
      while (v9 != 16);
      goto LABEL_16;
    }
    if (a2 != 3) {
      break;
    }
    uint64_t v12 = 0;
    unint64_t v13 = (unsigned char *)(a3 + 8);
    do
    {
      unsigned char *v13 = a0123456789abcd[(unint64_t)a1[v12] >> 4];
      unint64_t v11 = v13 + 2;
      v13[1] = a0123456789abcd[a1[v12++] & 0xF];
      v13 += 2;
    }
    while (v12 != 16);
LABEL_16:
    unsigned char *v11 = 0;
    snprintf(__str, 0x400uLL, "%s/%s", __b, (const char *)(a3 + 8));
    __strlcat_chk();
    if (qword_1000101B8 != -1) {
      dispatch_once(&qword_1000101B8, &stru_10000CA08);
    }
    if (byte_1000101C0) {
      BOOL v14 = (unsigned __int8 *)mkstemp_dprotected_np(__str, 4, 0);
    }
    else {
      BOOL v14 = (unsigned __int8 *)mkostemp(__str, 0x1000000);
    }
    a1 = v14;
    if (v14 == -1) {
      goto LABEL_26;
    }
    if (a2 != 2
      || (boot_uuid = (const void *)_os_trace_get_boot_uuid(),
          fsetxattr((int)a1, "com.apple.uuiddb.boot-uuid", boot_uuid, 0x25uLL, 0, 0) != -1))
    {
      if (fchmod((int)a1, 0x1A4u) != -1)
      {
        *(_DWORD *)a3 = v8;
        *(_DWORD *)(a3 + 4) = a1;
        unint64_t v16 = strrchr(__str, 47);
        strcpy((char *)(a3 + 41), v16 + 1);
        return;
      }
    }
    __error();
    _os_assumes_log();
    __error();
    if (unlink(__str) == -1)
    {
      __error();
      _os_assumes_log();
    }
    if (close((int)a1) == -1)
    {
      a2 = *__error();
      uint64_t v7 = *__error();
      if (a2 == 9) {
        goto LABEL_40;
      }
      _os_assumes_log();
    }
LABEL_30:
    if (close(v8) != -1) {
      goto LABEL_36;
    }
    int v17 = *__error();
    uint64_t v18 = *__error();
    if (v17 != 9) {
      goto LABEL_35;
    }
    qword_100010118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100010148 = v18;
    __break(1u);
LABEL_33:
    __error();
    _os_assumes_log();
  }
  qword_100010118 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
  qword_100010148 = a2;
  __break(1u);
LABEL_40:
  qword_100010118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100010148 = v7;
  __break(1u);
}

uint64_t sub_1000062AC(unsigned __int8 *a1, unsigned int a2, char *__str)
{
  if (qword_1000101B0 != -1) {
    dispatch_once(&qword_1000101B0, &stru_10000C9C8);
  }
  uint64_t result = snprintf(__str, 0x400uLL, "%s/", (const char *)qword_1000101A8);
  uint64_t v7 = &__str[(int)result];
  size_t v8 = 1024 - (int)result;
  if (a2 - 17 < 2) {
    return snprintf(v7, v8, "%02X", *a1);
  }
  if (a2 == 3)
  {
    uint64_t result = snprintf(v7, v8, "dsc");
    if ((int)result + 33 < v8)
    {
      uint64_t v9 = 0;
      v7[(int)result] = 47;
      BOOL v10 = &v7[(int)result + 1];
      do
      {
        *BOOL v10 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
        v10[1] = a0123456789abcd[a1[v9] & 0xF];
        v10 += 2;
        ++v9;
      }
      while (v9 != 16);
      *BOOL v10 = 0;
      return result;
    }
LABEL_15:
    qword_100010118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_100010148 = v8;
    __break(1u);
    return result;
  }
  if (a2 != 19)
  {
    qword_100010118 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
    qword_100010148 = a2;
    __break(1u);
    goto LABEL_15;
  }

  return snprintf(v7, v8, "dsc");
}

uint64_t sub_100006468(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!a2)
  {
    if (fchown(*(_DWORD *)(a1 + 4), 0x110u, 0x110u) == -1)
    {
      __error();
      _os_assumes_log();
    }
    if (fsync(*(_DWORD *)(a1 + 4)) == -1)
    {
      __error();
      _os_assumes_log();
    }
    uint64_t v2 = renameat(*(_DWORD *)a1, (const char *)(a1 + 41), *(_DWORD *)a1, (const char *)(a1 + 8));
    if (v2 == -1)
    {
      __error();
      _os_assumes_log();
      uint64_t v2 = *__error();
    }
  }
  if ((*(_DWORD *)(a1 + 4) & 0x80000000) == 0)
  {
    if (v2 && unlinkat(*(_DWORD *)a1, (const char *)(a1 + 41), 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    if (close(*(_DWORD *)(a1 + 4)) == -1)
    {
      int v5 = *__error();
      uint64_t result = *__error();
      if (v5 == 9)
      {
        qword_100010118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_100010148 = result;
        __break(1u);
        goto LABEL_21;
      }
      _os_assumes_log();
    }
  }
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || close(*(_DWORD *)a1) != -1) {
    return v2;
  }
  int v6 = *__error();
  uint64_t result = *__error();
  if (v6 != 9)
  {
    _os_assumes_log();
    return v2;
  }
LABEL_21:
  qword_100010118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100010148 = result;
  __break(1u);
  return result;
}

void sub_100006604()
{
  int v0 = dword_100010090;
  if (dword_100010090 == -1)
  {
    if (qword_1000101B0 != -1) {
      dispatch_once(&qword_1000101B0, &stru_10000C9C8);
    }
    int v0 = open((const char *)qword_100010198, 0x100000);
    dword_100010090 = v0;
    if (v0 < 0)
    {
      uint64_t v12 = *__error();
      qword_100010118 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
      qword_100010148 = v12;
      __break(1u);
      return;
    }
  }
  uint64_t v1 = openat(v0, "roles.plist", 256);
  if (v1 == -1)
  {
    if (*__error() != 2) {
      _os_assumes_log();
    }
    goto LABEL_15;
  }
  id v2 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v1];
  id v14 = 0;
  uint64_t v3 = [v2 readDataToEndOfFileAndReturnError:&v14];
  id v4 = v14;
  int v5 = v4;
  if (!v3)
  {
    NSErrorDomain v7 = [v4 domain];
    NSErrorDomain v8 = v7;
    if (v7 == NSCocoaErrorDomain)
    {
      id v9 = [v5 code];

      if (v9 == (id)260)
      {
LABEL_14:
        [v2 closeFile];

LABEL_15:
        int v6 = 0;
LABEL_16:
        id v13 = objc_alloc_init((Class)NSArray);

        goto LABEL_17;
      }
    }
    else
    {
    }
    _os_assumes_log();
    goto LABEL_14;
  }
  [v2 closeFile];

  int v6 = +[NSPropertyListSerialization propertyListWithData:v3 options:1 format:0 error:0];

  if (!v6) {
    goto LABEL_16;
  }
  id v13 = v6;
  if (([v6 isNSArray] & 1) == 0) {
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v10 = +[NSMutableSet setWithArray:v13];
  unint64_t v11 = (void *)qword_100010158;
  qword_100010158 = v10;
}

void start()
{
  os_trace_set_mode();
  sub_100008510();
  memset(&v0[20], 170, 0x3ECuLL);
  strcpy(v0, "Started logd_helper");
  sub_100007FD0((uint64_t)v0);
  sub_1000068A8();
  dispatch_main();
}

void sub_1000068A8()
{
  qword_100010160 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.logd_helper", 0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.logd_helper", (dispatch_queue_t)qword_100010160, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_10000C5C8);
  xpc_connection_activate(mach_service);
  qword_100010168 = (uint64_t)mach_service;
}

void sub_100006914(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100006988((_xpc_connection_s *)a2);
  }
  else
  {
    qword_100010118 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_100010148 = (uint64_t)type;
    __break(1u);
  }
}

void sub_100006988(_xpc_connection_s *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000;
  v2[2] = sub_1000049DC;
  v2[3] = &unk_10000C5E8;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)qword_100010160);
  xpc_connection_activate(a1);
}

void sub_100006A44(_xpc_connection_s *a1, xpc_object_t xdict)
{
  memset(dst, 170, sizeof(dst));
  uuid = xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
  {
    uint64_t v5 = (uint64_t)uuid;
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v6;
    *(_OWORD *)&out[16] = v6;
    uuid_copy(dst, uuid);
    uuid_unparse(dst, out);
    uint64_t v7 = CSGetBinaryPathForExclaveWithUUIDBytes();
    if (v7)
    {
      int v8 = sub_1000051E4(v7, v5, 0, 0);
      if (v8)
      {
        int v9 = v8;
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "Harvesting from exclave failed (uuid: %s, err: %#x)", out, v9);
        sub_100007FD0((uint64_t)__b);
        uint64_t v10 = a1;
        xpc_object_t v11 = xdict;
        int v12 = v9;
      }
      else
      {
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "Harvesting from exclave succeded: %s", out);
        sub_100007FD0((uint64_t)__b);
        uint64_t v10 = a1;
        xpc_object_t v11 = xdict;
        int v12 = 0;
      }
    }
    else
    {
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "Harvesting from exclave failed (uuid: %s, err: %#x)", out, 2);
      sub_100007FD0((uint64_t)__b);
      uint64_t v10 = a1;
      xpc_object_t v11 = xdict;
      int v12 = 2;
    }
    sub_1000054AC(v10, v11, v12);
  }
  else
  {
    sub_1000054AC(a1, xdict, 22);
  }
}

void sub_100006C30()
{
  int v0 = &stru_10000C988;
  uint64_t v1 = (void *)qword_100010158;
  if (!qword_100010158)
  {
    sub_100006604();
    uint64_t v1 = (void *)qword_100010158;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = v1;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      long long v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        sub_10000A110(&stru_10000C988, (const char *)[*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) UTF8String]);
        long long v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

void sub_100006D5C(_xpc_connection_s *a1, void *a2)
{
}

void sub_100006D64(_xpc_connection_s *a1, void *a2)
{
}

void sub_100006D6C(_xpc_connection_s *a1, xpc_object_t xdict)
{
  unsigned __int8 uint64 = xpc_dictionary_get_uint64(xdict, "directory");
  switch(uint64)
  {
    case 0u:
      if (qword_1000101B0 != -1) {
        dispatch_once(&qword_1000101B0, &stru_10000C9C8);
      }
      uint64_t v5 = (const char *)qword_100010198;
      if (qword_100010198) {
        goto LABEL_13;
      }
      goto LABEL_21;
    case 1u:
      if (qword_1000101B0 != -1) {
        dispatch_once(&qword_1000101B0, &stru_10000C9C8);
      }
      uint64_t v5 = (const char *)qword_1000101A0;
      if (!qword_1000101A0) {
        goto LABEL_21;
      }
      goto LABEL_13;
    case 2u:
      if (qword_1000101B0 != -1) {
        dispatch_once(&qword_1000101B0, &stru_10000C9C8);
      }
      uint64_t v5 = (const char *)qword_1000101A8;
      if (qword_1000101A8) {
        goto LABEL_13;
      }
      goto LABEL_21;
    case 3u:
      uint64_t v5 = (const char *)_os_trace_prefsdir_path();
      if (!v5) {
        goto LABEL_21;
      }
LABEL_13:
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "Migrating: \"%s\"", v5);
      sub_100007FD0((uint64_t)__b);
      mode_t v6 = word_10000B160[6 * uint64 + 4];
      int v7 = mkpathat_np(-2, v5, v6);
      if (v7) {
        BOOL v8 = v7 == 17;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
        if (fchmodat(-2, v5, v6, 32))
        {
          memset(__b, 170, sizeof(__b));
          long long v9 = __error();
          snprintf(__b, 0x400uLL, "Failed to chmod \"%s\", error %d", v5, *v9);
          sub_100007FD0((uint64_t)__b);
          int v10 = 1;
        }
        else
        {
          int v10 = 0;
        }
        v22[0] = (char *)v5;
        v22[1] = 0;
        int v12 = fts_open(v22, 2132, 0);
        if (v12)
        {
          id v13 = v12;
          id v14 = fts_read(v12);
          if (v14)
          {
            uint64_t v15 = v14;
            do
            {
              switch(v15->fts_info)
              {
                case 2u:
                  v15->fts_errno = 62;
                  goto LABEL_31;
                case 4u:
                case 7u:
                case 0xAu:
LABEL_31:
                  memset(__b, 170, sizeof(__b));
                  snprintf(__b, 0x400uLL, "\"%s\", error %d");
                  goto LABEL_32;
                case 6u:
                case 8u:
                  goto LABEL_28;
                case 0xCu:
                case 0xDu:
                  memset(__b, 170, sizeof(__b));
                  snprintf(__b, 0x400uLL, "Warning: \"%s\" is a symlink", v15->fts_path);
                  sub_100007FD0((uint64_t)__b);
LABEL_28:
                  if (fchownat(-2, v15->fts_path, 0x110u, 0x110u, 32))
                  {
                    memset(__b, 170, sizeof(__b));
                    __error();
                    snprintf(__b, 0x400uLL, "Failed to chown \"%s\", error %d");
LABEL_32:
                    sub_100007FD0((uint64_t)__b);
                    ++v10;
                  }
                  break;
                default:
                  break;
              }
              uint64_t v15 = fts_read(v13);
            }
            while (v15);
          }
          fts_close(v13);
          if (!v10)
          {
            memset(__b, 170, sizeof(__b));
            snprintf(__b, 0x400uLL, "%s/%s", v5, ".migrated");
            int v16 = openat(-2, __b, 1538, 420);
            if (v16 < 0)
            {
              memset(__str, 170, sizeof(__str));
              long long v20 = __error();
              snprintf(__str, 0x400uLL, "Failed to create marker file \"%s\", error %d", __b, *v20);
              sub_100007FD0((uint64_t)__str);
            }
            else
            {
              int v17 = v16;
              if (fchown(v16, 0x110u, 0x110u) == -1)
              {
                __error();
                _os_assumes_log();
              }
              if (close(v17) == -1)
              {
                int v18 = *__error();
                uint64_t v19 = *__error();
                if (v18 == 9)
                {
                  qword_100010118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
                  qword_100010148 = v19;
                  __break(1u);
                  JUMPOUT(0x100007294);
                }
                _os_assumes_log();
                __error();
                _os_assumes_log();
              }
            }
          }
          int v11 = 0;
        }
        else
        {
          int v11 = *__error();
          memset(__b, 170, sizeof(__b));
          snprintf(__b, 0x400uLL, "Failed to open \"%s\", error %d", v5, v11);
          sub_100007FD0((uint64_t)__b);
        }
      }
      else
      {
        int v11 = v7;
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "Failed to create \"%s\", error %d", v5, v11);
        sub_100007FD0((uint64_t)__b);
      }
      break;
    default:
LABEL_21:
      int v11 = 22;
      break;
  }

  sub_1000054AC(a1, xdict, v11);
}

void sub_1000072D4(_xpc_connection_s *a1, xpc_object_t xdict)
{
  kern_return_t v12;
  kern_return_t v13;
  kern_return_t v14;
  kern_return_t v15;
  kern_return_t v16;
  kern_return_t v17;
  kern_return_t v18;
  kern_return_t v19;
  kern_return_t v20;
  mach_port_t connection;
  mach_vm_size_t size;
  mach_vm_address_t address;
  long long v24;
  int v25;
  int v26;
  uuid_string_t out;
  long long *v28;
  uint64_t v29;
  mach_vm_address_t v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  _OWORD __b[64];

  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v4;
  *(_OWORD *)&out[16] = v4;
  uuid = xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
  {
    mode_t v6 = (unsigned __int8 *)uuid;
    uuid_unparse(uuid, out);
    if (xpc_dictionary_get_string(xdict, "path"))
    {
      BOOL v7 = xpc_dictionary_get_BOOL(xdict, "coproc_free_only");
      string = xpc_dictionary_get_string(xdict, "role");
      size = 0xAAAAAAAAAAAAAAAALL;
      address = 0;
      connection = -1431655766;
      int v9 = sub_100009B9C(&connection, string, v6);
      if (v9)
      {
        int v10 = v9;
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "Harvesting failed: can't connect to RTBuddyClient(returned: 0x%x, role: %s)", v10, string);
        sub_100007FD0((uint64_t)__b);
        int v11 = 22;
        goto LABEL_15;
      }
      if (v7)
      {
        int v11 = 0;
      }
      else
      {
        *(void *)&__b[0] = 0xAAAAAAAA00000000;
        *((void *)&__b[0] + 1) = &size;
        id v14 = IOConnectCallMethod(connection, 0, 0, 0, __b, 0x10uLL, 0, 0, 0, 0);
        if (v14)
        {
          uint64_t v15 = v14;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "Harvesting failed: can't get OSLog segment size(returned: 0x%x, role: %s)", v15, string);
          sub_100007FD0((uint64_t)__b);
          int v11 = 22;
          goto LABEL_14;
        }
        int v16 = mach_vm_allocate(mach_task_self_, &address, size, 1);
        if (v16)
        {
          int v17 = v16;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "Harvesting failed: can't allocate memory for OSLog segment(returned: 0x%x, vm_size: 0x%llx, role: %s)", v17, size, string);
          sub_100007FD0((uint64_t)__b);
          int v11 = 12;
          goto LABEL_14;
        }
        *(void *)&__b[0] = 0xAAAAAAAA00000001;
        *((void *)&__b[0] + 1) = address;
        int v18 = IOConnectCallMethod(connection, 0, 0, 0, __b, 0x10uLL, 0, 0, 0, 0);
        if (v18)
        {
          uint64_t v19 = v18;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "Harvesting failed: can't copy OSLogSegment to allocated memory(returned: 0x%x, addr: 0x%llx, role: %s)", v19, address, string);
          sub_100007FD0((uint64_t)__b);
          int v11 = 22;
        }
        else
        {
          BOOL v24 = xmmword_10000B050;
          v25 = 1;
          uint64_t v26 = size;
          unint64_t v28 = &v24;
          BOOL v29 = 24;
          int v30 = address;
          unsigned int v31 = size;
          BOOL v32 = string;
          unint64_t v33 = strlen(string) + 1;
          int v11 = sub_100005D9C(v6, 1u);
        }
        long long v20 = mach_vm_deallocate(mach_task_self_, address, size);
        if (v20)
        {
          qword_100010118 = (uint64_t)"BUG IN LIBTRACE: mach_vm_deallocate failed";
          qword_100010148 = v20;
          __break(1u);
        }
      }
      __b[0] = xmmword_10000B070;
      int v12 = IOConnectCallMethod(connection, 0, 0, 0, __b, 0x10uLL, 0, 0, 0, 0);
      if (v12)
      {
        id v13 = v12;
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "OSLog segment memory free failed(returned: 0x%x, role: %s)", v13, string);
        sub_100007FD0((uint64_t)__b);
      }
LABEL_14:
      IOServiceClose(connection);
      sub_100009EBC((uint64_t)string);
      if (!v11)
      {
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "Harvesting from memory succeded: %s");
        goto LABEL_16;
      }
LABEL_15:
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "Harvesting from memory failed(uuid: %s, err: 0x%x)");
LABEL_16:
      sub_100007FD0((uint64_t)__b);
      goto LABEL_17;
    }
  }
  int v11 = 22;
LABEL_17:
  sub_1000054AC(a1, xdict, v11);
}

void sub_100007708(_xpc_connection_s *a1, xpc_object_t xdict)
{
  if (qword_1000101D8 != -1) {
    dispatch_once(&qword_1000101D8, &stru_10000CA88);
  }
  if (!byte_100010108 || (uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid")) == 0)
  {
    int v6 = 22;
    goto LABEL_49;
  }
  uint64_t v5 = uuid;
  if (!sub_10000A29C(uuid))
  {
    address[0] = 0xAAAAAAAAAAAAAAAALL;
    memset(__b, 170, sizeof(__b));
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2000000000;
    int v54 = 0;
    uint64_t v47 = 0;
    size_t v48 = &v47;
    uint64_t v49 = 0x2000000000;
    char v50 = 0;
    CFArrayRef v7 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_1000100A8, 9, &kCFTypeArrayCallBacks);
    if (!v7)
    {
      int v6 = 88;
LABEL_48:
      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v51, 8);
      goto LABEL_49;
    }
    CFArrayRef v8 = v7;
    CFDictionaryRef v9 = (const __CFDictionary *)OSKextCopyLoadedKextInfo();
    if (!v9)
    {
      int v6 = 12;
LABEL_47:
      CFRelease(v8);
      goto LABEL_48;
    }
    CFDictionaryRef v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFDictionaryGetTypeID())
    {
      unsigned int Count = CFDictionaryGetCount(v10);
      vm_size_t v13 = (vm_page_size + 232 * Count + 15) & -(uint64_t)vm_page_size;
      if (!vm_allocate(mach_task_self_, address, v13, 1))
      {
        vm_address_t v14 = address[0];
        vm_address_t v15 = address[0];
        *(void *)address[0] = 0x264736368;
        int v16 = (char *)(v15 + 16);
        unsigned int v37 = 5 * Count;
        context[0] = _NSConcreteStackBlock;
        context[1] = 0x40000000;
        context[2] = sub_1000088F0;
        context[3] = &unk_10000C6F0;
        unsigned int v46 = Count;
        vm_address_t v42 = v14;
        uint64_t v43 = (uint64_t)&v16[120 * Count + 32 * Count];
        context[6] = v14;
        context[7] = v16;
        uint64_t v38 = Count;
        context[4] = &v47;
        context[5] = &v51;
        context[8] = v43 + 40 * Count;
        context[9] = v43;
        __base = &v16[120 * Count];
        context[10] = __base;
        CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)sub_100008DB8, context);
        if (*((unsigned char *)v48 + 24))
        {
          _os_assumes_log();
          int v6 = 88;
          goto LABEL_31;
        }
        vm_size_t v39 = v13;
        CFDictionaryRef v40 = v10;
        size_t v17 = *(unsigned int *)(address[0] + 8);
        size_t v18 = *(unsigned int *)(address[0] + 12);
        qsort_b(v16, v17, 0x18uLL, &stru_10000C730);
        qsort_b((void *)(v43 + 40 * Count), v17, 0x10uLL, &stru_10000C770);
        int v41 = 24 * v17 + 16 + 32 * v18;
        unsigned int v19 = *((_DWORD *)v52 + 6) + v41;
        if (v18)
        {
          vm_address_t v20 = v42 + 24 * v37;
          uint64_t v21 = (CFStringRef *)(v20 + 32 * Count + 48);
          uint64_t v22 = (unsigned int *)(v20 + 44);
          size_t v23 = v18;
          while (1)
          {
            *uint64_t v22 = v19;
            if (!CFStringGetCString(*v21, __b, 1024, 0x8000100u)) {
              break;
            }
            v19 += strnlen(__b, 0x400uLL) + 1;
            v21 += 5;
            v22 += 8;
            if (!--v23) {
              goto LABEL_17;
            }
          }
          int v6 = 2;
          goto LABEL_30;
        }
LABEL_17:
        CFArrayRef v36 = v8;
        qsort_b(__base, v18, 0x20uLL, &stru_10000C7B0);
        if (v17)
        {
          BOOL v24 = (_DWORD *)(v42 + 32);
          size_t v25 = v17;
          int v26 = 24 * v17 + 16 + 32 * v18;
          while (1)
          {
            unint64_t v27 = *(void *)(v43 + 40 * *v24 + 16);
            *(v24 - 2) = v26;
            *BOOL v24 = sub_10000A360((uint64_t)__base, v18, v27);
            int v28 = *(v24 - 1);
            BOOL v29 = __CFADD__(v26, v28);
            v26 += v28;
            if (v29) {
              break;
            }
            v24 += 6;
            if (!--v25) {
              goto LABEL_26;
            }
          }
          int v6 = 88;
          CFArrayRef v8 = v36;
          goto LABEL_30;
        }
        int v26 = 32 * v18 + 16;
LABEL_26:
        if (*((_DWORD *)v52 + 6) + v41 != v26)
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
        }
        int v57 = -1431655766;
        *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v56[3] = v30;
        v56[4] = v30;
        v56[1] = v30;
        v56[2] = v30;
        v56[0] = v30;
        sub_100005E4C(v5, 3u, (uint64_t)v56);
        CFArrayRef v8 = v36;
        if (v31)
        {
          int v6 = 0;
LABEL_30:
          vm_size_t v13 = v39;
          CFDictionaryRef v10 = v40;
LABEL_31:
          vm_deallocate(mach_task_self_, address[0], v13);
LABEL_46:
          CFRelease(v10);
          goto LABEL_47;
        }
        address[1] = address[0];
        address[2] = 24 * v17 + 16;
        address[3] = (vm_address_t)__base;
        address[4] = 32 * v18;
        if (_os_trace_writev() != -1)
        {
          if (!v17)
          {
LABEL_37:
            if (!v18)
            {
LABEL_42:
              vm_size_t v13 = v39;
              CFDictionaryRef v10 = v40;
              if (lseek(SDWORD1(v56[0]), 0, 1) != v19)
              {
                qword_100010118 = (uint64_t)"BUG IN LIBTRACE: Unexpected resulting size";
                qword_100010148 = v19;
                __break(1u);
                return;
              }
              uint64_t v35 = 0;
              goto LABEL_56;
            }
            unsigned int v34 = (CFStringRef *)(32 * v38 + 24 * v37 + v42 + 48);
            while (CFStringGetCString(*v34, __b, 1024, 0x8000100u))
            {
              strnlen(__b, 0x400uLL);
              if (_os_trace_write() == -1) {
                goto LABEL_54;
              }
              v34 += 5;
              if (!--v18) {
                goto LABEL_42;
              }
            }
            uint64_t v35 = 2;
LABEL_55:
            vm_size_t v13 = v39;
            CFDictionaryRef v10 = v40;
LABEL_56:
            int v6 = sub_100006468((uint64_t)v56, v35);
            goto LABEL_31;
          }
          vm_address_t v32 = v42 + 28;
          uint64_t v33 = 24 * v37 + 72 * v38 + v42 + 24;
          while (1)
          {
            v32 += 24;
            if (_os_trace_write() == -1) {
              break;
            }
            v33 += 16;
            if (!--v17) {
              goto LABEL_37;
            }
          }
        }
LABEL_54:
        __error();
        _os_assumes_log();
        uint64_t v35 = *__error();
        goto LABEL_55;
      }
      _os_assumes_log();
    }
    int v6 = 88;
    goto LABEL_46;
  }
  int v6 = 0;
LABEL_49:

  sub_1000054AC(a1, xdict, v6);
}

void sub_100007D50(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid) {
    int v5 = sub_10000857C(uuid);
  }
  else {
    int v5 = 22;
  }

  sub_1000054AC(a1, xdict, v5);
}

void sub_100007DB0(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  if (uuid)
  {
    if (sub_10000A29C(uuid))
    {
      int v5 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      CFArrayRef v7 = &v6;
      uint64_t v8 = 0x2000000000;
      int v9 = 2;
      dyld_for_each_installed_shared_cache();
      int v5 = *((_DWORD *)v7 + 6);
      _Block_object_dispose(&v6, 8);
    }
  }
  else
  {
    int v5 = 22;
  }

  sub_1000054AC(a1, xdict, v5);
}

uint64_t sub_100007EDC(uint64_t a1, unint64_t a2, _DWORD *a3, void *a4, void *a5)
{
  *a4 = 0;
  *a5 = 0;
  uint64_t v5 = 22;
  if (a2 >= 0x30 && a1 && a3)
  {
    if (*(_DWORD *)(a1 + 4) && *(void *)(a1 + 32) == 0x62617466736F6B72)
    {
      uint64_t v7 = *(unsigned int *)(a1 + 40);
      if (16 * v7 + 48 <= a2)
      {
        if (!v7) {
          return 2;
        }
        uint64_t v8 = 0;
        for (uint64_t i = (_DWORD *)(a1 + 48); *i != *a3; i += 4)
        {
          ++v8;
          uint64_t v5 = 2;
          if (v7 == v8) {
            return v5;
          }
        }
        uint64_t v10 = a1 + 48 + 16 * v8;
        unint64_t v11 = *(unsigned int *)(v10 + 4);
        if (a2 >= v11)
        {
          unint64_t v12 = *(unsigned int *)(v10 + 8);
          if (a2 - v11 >= v12)
          {
            uint64_t v5 = 0;
            *a4 = a1 + v11;
            *a5 = v12;
            return v5;
          }
        }
      }
      return 22;
    }
    else
    {
      return 9;
    }
  }
  return v5;
}

uint64_t sub_100007FB4(uint64_t a1)
{
  return 1;
}

void sub_100007FD0(uint64_t a1)
{
  if (qword_100010170 != -1) {
    dispatch_once_f(&qword_100010170, 0, (dispatch_function_t)sub_100008398);
  }
  if (!dispatch_get_specific(off_100010098))
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 0x40000000;
    v2[2] = sub_1000080C0;
    v2[3] = &unk_10000C668;
    v2[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_100010178, v2);
  }
}

uint64_t sub_1000080C0(uint64_t a1)
{
  uint64_t v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010178);
  memset(__b, 170, sizeof(__b));
  memset(v9, 170, 18);
  v7.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.tm_mon = v2;
  *(_OWORD *)&v7.tm_isuuid_t dst = v2;
  *(_OWORD *)&v7.tm_sec = v2;
  time_t v6 = time(0);
  localtime_r(&v6, &v7);
  strftime(v8, 0x1AuLL, "%F %T%z", &v7);
  id v3 = getprogname();
  pid_t v4 = getpid();
  uint64_t result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v8, v3, v4, v1);
  if ((int)result >= 1)
  {
    if (result >= 0x400) {
      __b[1022] = 10;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)qword_100010178);
    sub_100008200();
    uint64_t result = dword_1000100A0;
    if ((dword_1000100A0 & 0x80000000) == 0)
    {
      _os_trace_write();
      return sub_10000825C();
    }
  }
  return result;
}

void sub_100008200()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010178);
  if (dword_1000100A0 < 0)
  {
    sub_100008334();
    if ((dword_1000100A0 & 0x80000000) == 0)
    {
      sub_10000825C();
    }
  }
}

uint64_t sub_10000825C()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100010178);
  off_t v0 = lseek(dword_1000100A0, 0, 2);
  uint64_t result = fsync(dword_1000100A0);
  if (v0 >= 0x100000)
  {
    if (close(dword_1000100A0) == -1)
    {
      int v3 = *__error();
      uint64_t result = *__error();
      if (v3 == 9)
      {
        qword_100010118 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_100010148 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    rename((const std::__fs::filesystem::path *)qword_100010188, (const std::__fs::filesystem::path *)qword_100010190, v2);
    return sub_100008334();
  }
  return result;
}

uint64_t sub_100008334()
{
  uint64_t result = open((const char *)qword_100010188, 778, 420);
  dword_1000100A0 = result;
  if ((result & 0x80000000) == 0)
  {
    return fchown(result, 0x110u, 0x110u);
  }
  return result;
}

int *sub_100008398()
{
  asprintf((char **)&qword_100010180, "com.apple.%s.log", "logd_helper");
  if (!qword_100010180)
  {
    uint64_t v1 = *__error();
    qword_100010118 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_100010148 = v1;
    __break(1u);
LABEL_10:
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_100010118 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_100010148 = v2;
    __break(1u);
    return result;
  }
  qword_100010178 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_100010180, 0, 0);
  dispatch_queue_set_specific((dispatch_queue_t)qword_100010178, off_100010098, (void *)qword_100010178, 0);
  if (qword_1000101B0 != -1) {
    dispatch_once(&qword_1000101B0, &stru_10000C9C8);
  }
  asprintf((char **)&qword_100010188, "%s/%s.0.log", (const char *)qword_100010198, "logd_helper");
  if (qword_1000101B0 != -1) {
    dispatch_once(&qword_1000101B0, &stru_10000C9C8);
  }
  uint64_t result = (int *)asprintf((char **)&qword_100010190, "%s/%s.1.log", (const char *)qword_100010198, "logd_helper");
  if (!qword_100010188 || !qword_100010190) {
    goto LABEL_10;
  }
  return result;
}

void sub_100008510()
{
  if (qword_100010170 != -1) {
    dispatch_once_f(&qword_100010170, 0, (dispatch_function_t)sub_100008398);
  }
  off_t v0 = qword_100010178;

  dispatch_sync(v0, &stru_10000C6A8);
}

uint64_t sub_10000857C(unsigned __int8 *a1)
{
  *(void *)&out.sysname[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out.sysname = v3;
  *(_OWORD *)&out.sysname[16] = v3;
  uuid_unparse(a1, out.sysname);
  values[0] = (void *)CFStringCreateWithCString(kCFAllocatorDefault, out.sysname, 0x8000100u);
  if (values[0])
  {
    CFArrayRef v4 = CFArrayCreate(kCFAllocatorDefault, (const void **)values, 1, &kCFTypeArrayCallBacks);
    if (v4)
    {
      CFArrayRef v5 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_1000100F0, 3, &kCFTypeArrayCallBacks);
      if (v5 && (CFDictionaryRef v6 = (const __CFDictionary *)OSKextCopyLoadedKextInfoByUUID()) != 0)
      {
        CFDictionaryRef v7 = v6;
        Value = CFDictionaryGetValue(v6, values[0]);
        int v9 = Value;
        if (Value) {
          CFRetain(Value);
        }
        CFRelease(v7);
      }
      else
      {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
      CFArrayRef v5 = 0;
    }
    if (values[0]) {
      CFRelease(values[0]);
    }
    if (v4) {
      CFRelease(v4);
    }
    if (v5) {
      CFRelease(v5);
    }
    memset(values, 170, sizeof(values));
    if (v9)
    {
      CFTypeID v10 = CFGetTypeID(v9);
      if (v10 == CFDictionaryGetTypeID())
      {
        uint64_t v1 = &selRef_UTF8String;
        if (qword_1000101D8 == -1) {
          goto LABEL_19;
        }
      }
      else
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      dispatch_once(&qword_1000101D8, &stru_10000CA88);
LABEL_19:
      if (byte_100010108)
      {
        BytePtr = 0;
        unint64_t Length = 0;
      }
      else
      {
        CFDataRef v18 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v9, @"OSBundleLogStrings");
        if (!v18) {
          goto LABEL_29;
        }
        CFDataRef v19 = v18;
        CFTypeID v20 = CFGetTypeID(v18);
        if (v20 != CFDataGetTypeID()) {
          goto LABEL_29;
        }
        BytePtr = CFDataGetBytePtr(v19);
        unint64_t Length = CFDataGetLength(v19);
      }
      CFStringRef v13 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, @"OSBundleExecutablePath");
      if (v13)
      {
        CFStringRef v14 = v13;
        CFTypeID v15 = CFGetTypeID(v13);
        if (v15 != CFStringGetTypeID()
          || (int v16 = (const char *)values, !CFStringGetCString(v14, (char *)values, 1024, 0x8000100u)))
        {
LABEL_29:
          uint64_t v17 = 22;
          goto LABEL_41;
        }
      }
      else
      {
        memset(&out, 170, sizeof(out));
        if (uname(&out) || !strcasestr(out.version, "development")) {
          int v16 = "/kernel";
        }
        else {
          int v16 = "/kernel.development";
        }
      }
      long long v22 = xmmword_10000B060;
      size_t v23 = &v22;
      uint64_t v24 = 16;
      size_t v25 = 0;
      unint64_t v26 = 0;
      unint64_t v27 = v16;
      size_t v28 = 0xAAAAAAAAAAAAAAAALL;
      size_t v28 = strlen(v16) + 1;
      if (v1[59] != (char *)-1) {
        dispatch_once(&qword_1000101D8, &stru_10000CA88);
      }
      if (!byte_100010108)
      {
        uint64_t v17 = 22;
        if (!BytePtr || Length < 8) {
          goto LABEL_41;
        }
        size_t v25 = BytePtr + 8;
        unint64_t v26 = Length - 8;
        HIDWORD(v22) = *((_DWORD *)BytePtr + 1);
      }
      uint64_t v17 = sub_100005D9C(a1, 2u);
LABEL_41:
      CFRelease(v9);
      return v17;
    }
  }
  return 2;
}

unint64_t sub_1000088F0(unint64_t result, CFTypeRef cf, const void *a3)
{
  if (cf)
  {
    unint64_t v3 = result;
    if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
    {
      CFTypeID v5 = CFGetTypeID(cf);
      uint64_t result = CFStringGetTypeID();
      if (a3)
      {
        if (v5 == result)
        {
          CFTypeID v6 = CFGetTypeID(a3);
          uint64_t result = CFDictionaryGetTypeID();
          if (v6 == result)
          {
            CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleExecutablePath");
            if (Value)
            {
              CFStringRef v8 = Value;
              CFTypeID v9 = CFGetTypeID(Value);
              uint64_t result = CFStringGetTypeID();
              if (v9 != result) {
                return result;
              }
            }
            else
            {
              memset(&v40[24], 170, 0x500uLL);
              if (uname((utsname *)&v40[24]) || !strcasestr(&v40[792], "development")) {
                CFStringRef v8 = @"/kernel";
              }
              else {
                CFStringRef v8 = @"/kernel.development";
              }
            }
            uint64_t result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleTextUUID");
            if (result)
            {
              CFTypeID v10 = (const void *)result;
              CFTypeID TypeID = CFDataGetTypeID();
              uint64_t result = CFGetTypeID(v10);
              if (TypeID == result)
              {
                uint64_t result = CFDataGetLength((CFDataRef)v10);
                if (result == 16)
                {
                  CFDataRef v12 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleLogStrings");
                  CFDataRef v13 = v12;
                  if (v12)
                  {
                    CFTypeID v14 = CFGetTypeID(v12);
                    if (v14 == CFDataGetTypeID())
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      uint64_t result = CFDataGetLength(v13);
                      if (result < 8) {
                        return result;
                      }
                      goto LABEL_22;
                    }
                    CFDataRef v13 = 0;
                  }
                  BytePtr = 0;
LABEL_22:
                  memset(v40, 170, 32);
                  uint64_t result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleCacheLoadAddress");
                  if (result)
                  {
                    int v16 = (const void *)result;
                    CFTypeID v17 = CFNumberGetTypeID();
                    uint64_t result = CFGetTypeID(v16);
                    if (v17 == result)
                    {
                      uint64_t result = CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt64Type, &v40[24]);
                      if (result)
                      {
                        uint64_t result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleLoadAddress");
                        if (result)
                        {
                          CFDataRef v18 = (const void *)result;
                          CFTypeID v19 = CFNumberGetTypeID();
                          uint64_t result = CFGetTypeID(v18);
                          if (v19 == result)
                          {
                            uint64_t result = CFNumberGetValue((CFNumberRef)v18, kCFNumberSInt64Type, &v40[16]);
                            if (result)
                            {
                              uint64_t result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleExecLoadAddress");
                              if (result)
                              {
                                CFTypeID v20 = (const void *)result;
                                CFTypeID v21 = CFNumberGetTypeID();
                                uint64_t result = CFGetTypeID(v20);
                                if (v21 == result)
                                {
                                  uint64_t result = CFNumberGetValue((CFNumberRef)v20, kCFNumberSInt64Type, &v40[8]);
                                  if (result)
                                  {
                                    uint64_t result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleExecLoadSize");
                                    if (result)
                                    {
                                      long long v22 = (const void *)result;
                                      CFTypeID v23 = CFNumberGetTypeID();
                                      uint64_t result = CFGetTypeID(v22);
                                      if (v23 == result)
                                      {
                                        uint64_t result = CFNumberGetValue((CFNumberRef)v22, kCFNumberSInt64Type, v40);
                                        if (result)
                                        {
                                          if (*(void *)&v40[16] && *(void *)&v40[8])
                                          {
                                            uint64_t result = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a3, @"OSBundleKextsInKernelText");
                                            if (result) {
                                              *(void *)CFDictionaryRef v40 = 0;
                                            }
                                            uint64_t v24 = *(void *)(v3 + 48);
                                            uint64_t v25 = *(unsigned int *)(v24 + 12);
                                            if (v25 >= *(_DWORD *)(v3 + 88))
                                            {
LABEL_48:
                                              *(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = 1;
                                            }
                                            else
                                            {
                                              unsigned int v26 = *(_DWORD *)(v24 + 8);
                                              if (BytePtr)
                                              {
                                                unint64_t v27 = *((unsigned int *)BytePtr + 1);
                                                if (v27)
                                                {
                                                  unint64_t v28 = 0;
                                                  uint64_t v29 = (uint64_t)&BytePtr[8 * v27 + 8];
                                                  long long v30 = (unsigned int *)(BytePtr + 12);
                                                  do
                                                  {
                                                    int v31 = *v30;
                                                    if (*v30)
                                                    {
                                                      uint64_t v32 = *(void *)(v3 + 56) + 24 * v26;
                                                      *(_DWORD *)(v32 + 16) = v25;
                                                      *(void *)uint64_t v32 = *(void *)&v40[16]
                                                                     + *(v30 - 1)
                                                                     - *(void *)&v40[24];
                                                      *(_DWORD *)(v32 + 12) = v31;
                                                      uint64_t v33 = *(void *)(*(void *)(v3 + 40) + 8);
                                                      int v34 = *(_DWORD *)(v33 + 24);
                                                      *(_DWORD *)(v33 + 24) = v34 + v31;
                                                      if (__CFADD__(v34, v31)) {
                                                        goto LABEL_48;
                                                      }
                                                      *(void *)(*(void *)(v3 + 64) + 16 * v26 + 8) = v29;
                                                      *(void *)(*(void *)(v3 + 64) + 16 * v26) = *(void *)(*(void *)(v3 + 56) + 24 * v26);
                                                      v29 += *v30;
                                                      ++v26;
                                                      unint64_t v27 = *((unsigned int *)BytePtr + 1);
                                                    }
                                                    ++v28;
                                                    v30 += 2;
                                                  }
                                                  while (v28 < v27);
                                                  uint64_t v24 = *(void *)(v3 + 48);
                                                }
                                              }
                                              *(_DWORD *)(v24 + 8) = v26;
                                              *(void *)(*(void *)(v3 + 72) + 40 * v25 + 24) = v13;
                                              *(void *)(*(void *)(v3 + 72) + 40 * v25 + 32) = v8;
                                              uint64_t v35 = *(void *)(v3 + 72) + 40 * v25;
                                              *(void *)(v35 + 8) = *(void *)&v40[16] - *(void *)&v40[24];
                                              uint64_t v36 = *(void *)&v40[8] - *(void *)&v40[24];
                                              *(void *)(v35 + 16) = *(void *)&v40[8] - *(void *)&v40[24];
                                              uint64_t v37 = *(void *)(v3 + 80) + 32 * v25;
                                              *(void *)uint64_t v37 = v36;
                                              *(_DWORD *)(v37 + 8) = *(_DWORD *)v40;
                                              uint64_t v38 = (unsigned __int8 *)(v37 + 12);
                                              vm_size_t v39 = CFDataGetBytePtr((CFDataRef)v10);
                                              uuid_copy(v38, v39);
                                              ++*(_DWORD *)(*(void *)(v3 + 48) + 12);
                                              return sub_10000857C((unsigned __int8 *)(*(void *)(v3 + 80)
                                                                                     + 32 * v25
                                                                                     + 12));
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
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

int sub_100008D70(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

int sub_100008D88(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

int sub_100008DA0(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

uint64_t sub_100008DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void sub_100008DD4(uint64_t a1)
{
  memset(uu, 170, sizeof(uu));
  dyld_shared_cache_copy_uuid();
  uint64_t v2 = *(void **)(a1 + 40);
  if (*v2 == *(void *)uu && v2[1] == *(void *)&uu[8])
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&out[16] = v3;
    *(_OWORD *)uuid_string_t out = v3;
    uuid_unparse(uu, out);
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Harvesting: %s", out);
    sub_100007FD0((uint64_t)__b);
    vm_address_t address = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2000000000;
    int v47 = 0;
    vm_size_t v4 = (vm_page_size + 1760015) & -(uint64_t)vm_page_size;
    if (vm_allocate(mach_task_self_, &address, v4, 1))
    {
      _os_assumes_log();
      int v32 = 12;
LABEL_33:
      _Block_object_dispose(&v44, 8);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v32;
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "Harvest Complete for %s: %d", out, *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
      sub_100007FD0((uint64_t)__b);
      return;
    }
    vm_address_t v5 = address;
    vm_address_t v6 = address;
    *(void *)vm_address_t address = 0x264736368;
    CFDictionaryRef v7 = (void *)(v6 + 16);
    CFStringRef v8 = (void **)(v5 + 1520016);
    uint64_t v40 = 0;
    int v41 = &v40;
    uint64_t v42 = 0x2000000000;
    int v43 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2000000000;
    char v39 = 0;
    uint64_t v9 = v5 + 1200016;
    dyld_shared_cache_get_base_address();
    dyld_shared_cache_for_each_image();
    size_t v10 = *(unsigned int *)(address + 12);
    if (*((_DWORD *)v45 + 6) || *((unsigned char *)v37 + 24))
    {
      _os_assumes_log();
      int v30 = 88;
      goto LABEL_29;
    }
    vm_size_t v34 = v4;
    uint64_t v35 = a1;
    size_t v11 = *(unsigned int *)(address + 8);
    uint64_t v33 = 24 * v11 + 16;
    int v12 = v33 + 32 * v10;
    qsort_b(v7, v11, 0x18uLL, &stru_10000C890);
    unsigned int v13 = *((_DWORD *)v41 + 6) + v12;
    if (v10)
    {
      CFTypeID v14 = (unsigned int *)(v5 + 1200044);
      CFTypeID v15 = (int *)(v5 + 1520024);
      size_t v16 = v10;
      do
      {
        *CFTypeID v14 = v13;
        v14 += 8;
        int v17 = *v15;
        v15 += 6;
        v13 += v17 + 1;
        --v16;
      }
      while (v16);
    }
    qsort_b((void *)(v5 + 1200016), v10, 0x20uLL, &stru_10000C8D0);
    if (v11)
    {
      CFDataRef v18 = (_DWORD *)(v5 + 32);
      int v19 = v33 + 32 * v10;
      while (1)
      {
        unint64_t v20 = (unint64_t)v8[3 * *v18 + 2];
        *(v18 - 2) += v12;
        *CFDataRef v18 = sub_10000A360(v9, v10, v20);
        int v21 = *(v18 - 1);
        BOOL v22 = __CFADD__(v19, v21);
        v19 += v21;
        if (v22) {
          break;
        }
        v18 += 6;
        if (!--v11) {
          goto LABEL_15;
        }
      }
      int v30 = 88;
      vm_size_t v4 = v34;
      a1 = v35;
      goto LABEL_29;
    }
    int v19 = v33 + 32 * v10;
LABEL_15:
    if (*((_DWORD *)v41 + 6) + v12 != v19)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    v62[0] = 0xAAAAAAAAAAAAAAAALL;
    v62[1] = 0xAAAAAAAAAAAAAAAALL;
    dyld_shared_cache_copy_uuid();
    int v61 = -1431655766;
    *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v59 = v23;
    long long v60 = v23;
    long long v57 = v23;
    long long v58 = v23;
    long long v56 = v23;
    sub_100005E4C((unsigned __int8 *)v62, 3u, (uint64_t)&v56);
    vm_size_t v4 = v34;
    a1 = v35;
    if (v24) {
      goto LABEL_30;
    }
    vm_address_t v52 = address;
    uint64_t v53 = v33;
    uint64_t v54 = v9;
    uint64_t v55 = 32 * v10;
    if (_os_trace_writev() != -1)
    {
      __b[0] = _NSConcreteStackBlock;
      __b[1] = 0x40000000;
      *(_OWORD *)&__b[9] = v58;
      *(_OWORD *)&__b[11] = v59;
      *(_OWORD *)&__b[13] = v60;
      *(_OWORD *)&__b[5] = v56;
      __b[2] = sub_1000096F8;
      __b[3] = &unk_10000C948;
      __b[4] = &v44;
      LODWORD(__b[15]) = v61;
      *(_OWORD *)&__b[7] = v57;
      dyld_shared_cache_for_each_image();
      uint64_t v25 = *((unsigned int *)v45 + 6);
      if (v25)
      {
LABEL_27:
        int v30 = sub_100006468((uint64_t)&v56, v25);
LABEL_29:
        *((_DWORD *)v45 + 6) = v30;
LABEL_30:
        if (v10)
        {
          do
          {
            int v31 = *v8;
            v8 += 3;
            free(v31);
            --v10;
          }
          while (v10);
        }
        vm_deallocate(mach_task_self_, address, v4);
        int v32 = *((_DWORD *)v45 + 6);
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
        goto LABEL_33;
      }
      if (!v10)
      {
LABEL_25:
        if (lseek(SDWORD1(v56), 0, 1) != v13)
        {
          qword_100010118 = (uint64_t)"BUG IN LIBTRACE: Unexpected resulting size";
          qword_100010148 = v13;
          __break(1u);
          return;
        }
        uint64_t v25 = *((unsigned int *)v45 + 6);
        goto LABEL_27;
      }
      unsigned int v26 = 1;
      while (1)
      {
        unint64_t v27 = &v8[3 * v26 - 3];
        vm_address_t v52 = (vm_address_t)*v27;
        uint64_t v53 = (*((_DWORD *)v27 + 2) + 1);
        if (v26 < v10)
        {
          unint64_t v28 = &v8[3 * v26];
          uint64_t v54 = (uint64_t)*v28;
          uint64_t v55 = (*((_DWORD *)v28 + 2) + 1);
        }
        if (_os_trace_writev() == -1) {
          break;
        }
        unsigned int v29 = v26 + 1;
        v26 += 2;
        if (v29 >= v10) {
          goto LABEL_25;
        }
      }
    }
    __error();
    _os_assumes_log();
    uint64_t v25 = *__error();
    *((_DWORD *)v45 + 6) = v25;
    goto LABEL_27;
  }
}

void sub_1000093D8(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x2000000000;
    int v19 = -1431655766;
    uint64_t v2 = a1[6];
    int v19 = *(_DWORD *)(v2 + 8);
    uint64_t v3 = *(unsigned int *)(v2 + 12);
    if (v3 >> 4 < 0x271)
    {
      uint64_t v12 = 0;
      unsigned int v13 = &v12;
      uint64_t v14 = 0x2000000000;
      uint64_t v15 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = &v8;
      uint64_t v10 = 0x2000000000;
      uint64_t v11 = 0;
      dyld_image_for_each_segment_info();
      dyld_image_for_each_section_info();
      *(_DWORD *)(a1[6] + 8) = *((_DWORD *)v17 + 6);
      installname = (const char *)dyld_image_get_installname();
      if (!installname)
      {
        memset(&v21[28], 170, 0x3E4uLL);
        strcpy(v21, "Warning: missing image path");
        sub_100007FD0((uint64_t)v21);
        installname = "<missing image path>";
      }
      memset(uu, 170, sizeof(uu));
      if ((dyld_image_copy_uuid() & 1) == 0)
      {
        memset(&v21[28], 170, 0x3E4uLL);
        strcpy(v21, "Warning: missing image uuid");
        sub_100007FD0((uint64_t)v21);
        uuid_clear(uu);
      }
      *(void *)(a1[9] + 24 * v3) = _os_trace_strdup();
      int v5 = strlen(installname);
      uint64_t v6 = a1[9] + 24 * v3;
      *(_DWORD *)(v6 + 8) = v5;
      *(void *)(v6 + 16) = v13[3];
      uint64_t v7 = a1[10] + 32 * v3;
      *(void *)uint64_t v7 = v13[3];
      *(_DWORD *)(v7 + 8) = v9[3];
      *(_OWORD *)(v7 + 12) = *(_OWORD *)uu;
      ++*(_DWORD *)(a1[6] + 12);
      _Block_object_dispose(&v8, 8);
      _Block_object_dispose(&v12, 8);
    }
    else
    {
      memset(&v21[37], 170, 0x3DBuLL);
      strcpy(v21, "Exceeded LOGD_HELPER_MAX_IMAGE_COUNT");
      sub_100007FD0((uint64_t)v21);
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    }
    _Block_object_dispose(&v16, 8);
  }
}

uint64_t sub_1000096F8(uint64_t result)
{
  if (!*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24)) {
    return dyld_image_for_each_section_info();
  }
  return result;
}

uint64_t sub_1000097D0(uint64_t a1, const char *a2, const char *a3)
{
  uint64_t result = sub_1000098C4(a2, a3);
  if (result) {
    return dyld_image_content_for_section();
  }
  return result;
}

BOOL sub_1000098C4(const char *a1, const char *a2)
{
  if (strcmp(a1, "__TEXT") && strcmp(a1, "__CTF")) {
    return 0;
  }
  uint64_t v5 = 0;
  do
  {
    int v6 = strcmp(a2, &aCstring[v5]);
    BOOL result = v6 == 0;
    if (!v6) {
      break;
    }
    BOOL v7 = v5 == 64;
    v5 += 16;
  }
  while (!v7);
  return result;
}

_DWORD *sub_100009954(uint64_t a1)
{
  BOOL result = (_DWORD *)_os_trace_write();
  if (result == (_DWORD *)-1)
  {
    __error();
    _os_assumes_log();
    BOOL result = __error();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *result;
  }
  return result;
}

int sub_1000099AC(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

int sub_1000099C4(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return -1;
  }
  else {
    return *(void *)a2 != *(void *)a3;
  }
}

uint64_t sub_1000099DC(void *a1, char *__s1, unint64_t a3, uint64_t a4)
{
  uint64_t result = strcmp(__s1, "__TEXT");
  if (!result)
  {
    unint64_t v8 = a1[7];
    BOOL v9 = a3 >= v8;
    unint64_t v10 = a3 - v8;
    if (v9)
    {
      *(void *)(*(void *)(a1[5] + 8) + 24) = v10;
      *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
    }
    else
    {
      uint64_t result = _os_assumes_log();
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t sub_100009A64(uint64_t a1, const char *a2, const char *a3, unint64_t a4, uint64_t a5)
{
  uint64_t result = sub_1000098C4(a2, a3);
  if (result)
  {
    unint64_t v9 = *(void *)(a1 + 56);
    BOOL v10 = a4 >= v9;
    unint64_t v11 = a4 - v9;
    if (!v10)
    {
LABEL_3:
      uint64_t result = _os_assumes_log();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      return result;
    }
    unsigned int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v12 >> 4 >= 0xC35)
    {
      _os_assert_log();
      uint64_t result = _os_crash();
      __break(1u);
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 64);
      *(_DWORD *)(v13 + 24 * v12 + 16) = *(_DWORD *)(a1 + 72);
      *(void *)(v13 + 24 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = v11;
      *(_DWORD *)(v13 + 24 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 8) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)(v13 + 24 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 12) = a5;
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(unsigned int *)(v14 + 24);
      BOOL v10 = __CFADD__(v15, a5);
      unint64_t v16 = v15 + a5;
      *(_DWORD *)(v14 + 24) = v16;
      if (v10 || HIDWORD(v16)) {
        goto LABEL_3;
      }
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
  return result;
}

uint64_t sub_100009B9C(io_connect_t *a1, const char *a2, const unsigned __int8 *a3)
{
  kern_return_t v15;
  kern_return_t v16;
  io_iterator_t existing;
  uuid_string_t out;
  void __b[128];

  existing = -1431655766;
  memset(__b, 170, sizeof(__b));
  snprintf((char *)__b, 0x400uLL, "IOP connect to coproc %s\n", a2);
  sub_100007FD0((uint64_t)__b);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  CFDictionaryAddValue(Mutable, @"role", v7);
  unint64_t v8 = IOServiceMatching("RTBuddy");
  CFDictionaryAddValue(v8, @"IOPropertyMatch", Mutable);
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v8, &existing);
  if (MatchingServices)
  {
    uint64_t v10 = MatchingServices;
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "IOServiceGetMatchingServices returned 0x%08X\n", v10);
    sub_100007FD0((uint64_t)__b);
  }
  else
  {
    io_service_t v11 = IOIteratorNext(existing);
    if (v11)
    {
      io_object_t v12 = v11;
      uint64_t v10 = IOServiceOpen(v11, mach_task_self_, 0, a1);
      if (v10)
      {
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "IOServiceOpen returned 0x%08X\n", v10);
        sub_100007FD0((uint64_t)__b);
      }
      if (a3)
      {
        *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)uuid_string_t out = v13;
        *(_OWORD *)&out[16] = v13;
        uuid_unparse(a3, out);
        memset(__b, 170, sizeof(__b));
        snprintf((char *)__b, 0x400uLL, "IOP connect to subrole uuid %s \n", out);
        sub_100007FD0((uint64_t)__b);
        mach_port_t v14 = *a1;
        __b[0] = 0xAAAAAAAAAAAAAAAALL;
        __b[1] = 0xAAAAAAAAAAAAAAAALL;
        uuid_copy((unsigned __int8 *)__b, a3);
        uint64_t v15 = IOConnectCallMethod(v14, 2u, 0, 0, __b, 0x10uLL, 0, 0, 0, 0);
        if (v15)
        {
          unint64_t v16 = v15;
          memset(__b, 170, sizeof(__b));
          snprintf((char *)__b, 0x400uLL, "attach to firmware role using uuid returned 0x%08X\n", v16);
          sub_100007FD0((uint64_t)__b);
        }
      }
      IOObjectRelease(v12);
    }
    else
    {
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "Coprocessor \"%s\" not found.\n", a2);
      sub_100007FD0((uint64_t)__b);
      uint64_t v10 = 4;
    }
    IOObjectRelease(existing);
  }
  CFRelease(Mutable);
  CFRelease(@"IOPropertyMatch");
  CFRelease(@"role");
  CFRelease(v7);
  return v10;
}

void sub_100009EBC(uint64_t a1)
{
  if (!qword_100010158) {
    sub_100006604();
  }
  id v8 = +[NSString stringWithUTF8String:a1];
  if ((objc_msgSend((id)qword_100010158, "containsObject:") & 1) == 0)
  {
    [(id)qword_100010158 addObject:v8];
    if (dword_100010090 == -1)
    {
      if (qword_1000101B0 != -1) {
        dispatch_once(&qword_1000101B0, &stru_10000C9C8);
      }
      dword_100010090 = open((const char *)qword_100010198, 0x100000);
      if (dword_100010090 < 0)
      {
        uint64_t v7 = *__error();
        qword_100010118 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
        qword_100010148 = v7;
        __break(1u);
        return;
      }
    }
    [(id)qword_100010158 allObjects];
    memset(v10, 170, 22);
    *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    snprintf(__str, 0x1EuLL, "%s.tmp", "roles.plist");
    uint64_t v3 = +[NSPropertyListSerialization dataWithPropertyList:v2 format:200 options:0 error:0];

    uint64_t v4 = openat(dword_100010090, __str, 1794, 420);
    if (v4 == -1)
    {
      __error();
      _os_assumes_log();
    }
    else
    {
      uint64_t v5 = v4;
      fchown(v4, 0x110u, 0x110u);
      id v6 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v5];
      [v6 writeData:v3 error:0];
      [v6 synchronizeAndReturnError:0];
      [v6 closeAndReturnError:0];
      if (renameat(dword_100010090, __str, dword_100010090, "roles.plist") == -1)
      {
        __error();
        _os_assumes_log();
      }
    }
  }
}

void sub_10000A110(id a1, const char *a2)
{
  mach_port_t connection = -1431655766;
  if (!sub_100009B9C(&connection, a2, 0))
  {
    long long inputStruct = xmmword_10000B080;
    IOConnectCallMethod(connection, 0, 0, 0, &inputStruct, 0x10uLL, 0, 0, 0, 0);
    IOServiceClose(connection);
  }
}

void sub_10000A1B0(id a1)
{
  qword_100010198 = (uint64_t)"/private/var/db/diagnostics";
  qword_1000101A0 = (uint64_t)"/private/var/db/diagnostics/timesync";
  qword_1000101A8 = (uint64_t)"/private/var/db/uuidtext";
}

void sub_10000A1E4(id a1)
{
  byte_1000101C0 = MKBDeviceFormattedForContentProtection() == 1;
}

void sub_10000A20C(id a1)
{
  if (qword_1000101B0 != -1) {
    dispatch_once(&qword_1000101B0, &stru_10000C9C8);
  }
  byte_1000101D0 = sandbox_check() == 0;
}

BOOL sub_10000A29C(unsigned __int8 *a1)
{
  if (qword_1000101C8 != -1) {
    dispatch_once(&qword_1000101C8, &stru_10000CA48);
  }
  if (!byte_1000101D0) {
    return 0;
  }
  memset(__b, 170, sizeof(__b));
  sub_1000062AC(a1, 3u, __b);
  return access(__b, 0) == 0;
}

uint64_t sub_10000A360(uint64_t a1, unsigned int a2, unint64_t a3)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v3 = 0;
  do
  {
    uint64_t v4 = (a2 + v3) >> 1;
    unint64_t v5 = *(void *)(a1 + 32 * v4);
    BOOL v6 = a3 >= v5;
    unint64_t v7 = a3 - v5;
    if (v6)
    {
      if (v7 < *(unsigned int *)(a1 + 32 * v4 + 8)) {
        return v4;
      }
      unsigned int v3 = v4 + 1;
    }
    else
    {
      a2 = (a2 + v3) >> 1;
    }
  }
  while (v3 < a2);
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  return v4;
}

void sub_10000A3B8(id a1)
{
  memset(__b, 170, sizeof(__b));
  size_t v1 = 1024;
  byte_100010108 = sysctlbyname("kern.filesetuuid", __b, &v1, 0, 0) != 0;
  if (!sysctlbyname("kern.bootargs", __b, &v1, 0, 0))
  {
    if (strstr(__b, "libtrace_kic=0")) {
      byte_100010108 = 0;
    }
    if (strstr(__b, "libtrace_kic=1")) {
      byte_100010108 = 1;
    }
  }
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t CSGetBinaryPathForExclaveWithUUIDBytes()
{
  return _CSGetBinaryPathForExclaveWithUUIDBytes();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return _MKBDeviceFormattedForContentProtection();
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return _OSKextCopyLoadedKextInfo();
}

uint64_t OSKextCopyLoadedKextInfoByUUID()
{
  return _OSKextCopyLoadedKextInfoByUUID();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t _dyld_is_memory_immutable()
{
  return __dyld_is_memory_immutable();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_trace_get_boot_uuid()
{
  return __os_trace_get_boot_uuid();
}

uint64_t _os_trace_mmap_at()
{
  return __os_trace_mmap_at();
}

uint64_t _os_trace_prefsdir_path()
{
  return __os_trace_prefsdir_path();
}

uint64_t _os_trace_strdup()
{
  return __os_trace_strdup();
}

uint64_t _os_trace_write()
{
  return __os_trace_write();
}

uint64_t _os_trace_writev()
{
  return __os_trace_writev();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dyld_for_each_installed_shared_cache()
{
  return _dyld_for_each_installed_shared_cache();
}

uint64_t dyld_image_content_for_section()
{
  return _dyld_image_content_for_section();
}

uint64_t dyld_image_copy_uuid()
{
  return _dyld_image_copy_uuid();
}

uint64_t dyld_image_for_each_section_info()
{
  return _dyld_image_for_each_section_info();
}

uint64_t dyld_image_for_each_segment_info()
{
  return _dyld_image_for_each_segment_info();
}

uint64_t dyld_image_get_installname()
{
  return _dyld_image_get_installname();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return _dyld_shared_cache_copy_uuid();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return _dyld_shared_cache_for_each_image();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return _dyld_shared_cache_get_base_address();
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return _fchmodat(a1, a2, a3, a4);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  return _fchownat(a1, a2, a3, a4, a5);
}

void free(void *a1)
{
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fsetattrlist(a1, a2, a3, a4, a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _fsetxattr(fd, name, value, size, position, options);
}

int fsync(int a1)
{
  return _fsync(a1);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return _mach_vm_allocate(target, address, size, flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return _mach_vm_deallocate(target, address, size);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkostemp(char *path, int oflags)
{
  return _mkostemp(path, oflags);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

int mkpathat_np(int dfd, const char *path, mode_t omode)
{
  return _mkpathat_np(dfd, path, omode);
}

int mkstemp_dprotected_np(char *path, int dpclass, int dpflags)
{
  return _mkstemp_dprotected_np(path, dpclass, dpflags);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

uint64_t os_trace_set_mode()
{
  return _os_trace_set_mode();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return _renameat(a1, a2, a3, a4);
}

uint64_t sandbox_check()
{
  return _sandbox_check();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int uname(utsname *a1)
{
  return _uname(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return _xpc_array_get_data(xarray, index, length);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}