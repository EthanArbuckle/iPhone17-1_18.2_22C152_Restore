void *phOsalNfc_MemCopy(int a1, void *__dst, void *__src, size_t __n)
{
  return memcpy(__dst, __src, __n);
}

void *phOsalNfc_SetMemory(int a1, void *__b, int __c, size_t __len)
{
  if (__b)
  {
    if (__len) {
      return memset(__b, __c, __len);
    }
  }
  return result;
}

void phOsalNfc_FreeMemory(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

uint64_t phTmlNfc_IoCtl(uint64_t a1, int a2)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_226A01B24(a1);
  uint64_t v5 = v4;
  if (a2 != 61680 && !v4)
  {
    v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_IoCtl", 829, "tml!=NULL");
    }
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)buf = 136446722;
    *(void *)&buf[4] = "phTmlNfc_IoCtl";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 829;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = "tml!=NULL";
LABEL_7:
    _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  useconds_t v11 = 15000;
  if (v4)
  {
    if (*(unsigned char *)(v4 + 104)) {
      useconds_t v11 = 100000;
    }
    else {
      useconds_t v11 = 15000;
    }
  }
  if (a2 > 70)
  {
    if (a2 <= 61679)
    {
      switch(a2)
      {
        case 61440:
          uint64_t v18 = a1;
          int v19 = 1;
          goto LABEL_75;
        case 61441:
          uint64_t v18 = a1;
          int v19 = 0;
LABEL_75:
          return sub_226A043B0(v18, v19);
        case 61442:
          uint64_t v36 = **(void **)(v4 + 112);
          v37 = *(unsigned int (**)(void))(v36 + 192);
          if (v37 && v37(*(void *)(v36 + 240))) {
            return 0;
          }
          return 51;
        case 61443:
          uint64_t v38 = sub_226A01B24(a1);
          if (!v38)
          {
            v62 = (const void **)MEMORY[0x263F8C6C0];
            dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
            v63 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v63) {
              v63(3, "%s:%i FAILED: %s", "_phTmlNfc_QuerySPMIErrors", 789, "tml!=NULL");
            }
            dispatch_get_specific(*v62);
            v8 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              *(void *)&buf[4] = "_phTmlNfc_QuerySPMIErrors";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 789;
              *(_WORD *)&buf[18] = 2080;
              *(void *)&buf[20] = "tml!=NULL";
              goto LABEL_7;
            }
            return 49;
          }
          v39 = *(uint64_t **)(v38 + 112);
          if (!v39)
          {
            v78 = (const void **)MEMORY[0x263F8C6C0];
            dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
            v79 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
            if (v79) {
              v79(3, "%s:%i FAILED: %s", "_phTmlNfc_QuerySPMIErrors", 790, "tml->ifc!=NULL");
            }
            dispatch_get_specific(*v78);
            v8 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              *(void *)&buf[4] = "_phTmlNfc_QuerySPMIErrors";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 790;
              *(_WORD *)&buf[18] = 2080;
              *(void *)&buf[20] = "tml->ifc!=NULL";
              goto LABEL_7;
            }
            return 49;
          }
          long long v94 = 0u;
          long long v95 = 0u;
          memset(buf, 0, sizeof(buf));
          unint64_t v85 = 64;
          uint64_t v40 = *v39;
          v41 = *(unsigned int (**)(void, uint8_t *, unint64_t *, uint64_t))(*v39 + 120);
          if (v41 && v41(*(void *)(v40 + 136), buf, &v85, 31))
          {
            if (v85 >= 3)
            {
              uint64_t v42 = 0;
              v43 = (const void **)MEMORY[0x263F8C6C0];
              do
              {
                if (!buf[v42]) {
                  break;
                }
                dispatch_get_specific(*v43);
                v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                if (v44) {
                  v44(3, "%s:%i SPMI register 0x%02X = 0x%02X", "_phTmlNfc_QuerySPMIErrors", 805, buf[v42], buf[v42 + 2]);
                }
                dispatch_get_specific(*v43);
                v45 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  int v46 = buf[v42];
                  int v47 = buf[v42 + 2];
                  *(_DWORD *)v86 = 136446978;
                  v87 = "_phTmlNfc_QuerySPMIErrors";
                  __int16 v88 = 1024;
                  int v89 = 805;
                  __int16 v90 = 1024;
                  *(_DWORD *)v91 = v46;
                  *(_WORD *)&v91[4] = 1024;
                  *(_DWORD *)&v91[6] = v47;
                  _os_log_impl(&dword_2269FD000, v45, OS_LOG_TYPE_ERROR, "%{public}s:%i SPMI register 0x%02X = 0x%02X", v86, 0x1Eu);
                }
                v42 += 3;
              }
              while (v85 >= v42 + 3);
            }
            return 0;
          }
          v68 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          uint64_t v69 = NFLogGetLogger();
          if (v69)
          {
            v70 = (void (*)(uint64_t, const char *, ...))v69;
            v71 = __error();
            v72 = strerror(*v71);
            v73 = __error();
            v70(3, "%s:%i \"%s\" errno=%d Failed to query SPMI error registers", "_phTmlNfc_QuerySPMIErrors", 796, v72, *v73);
          }
          dispatch_get_specific(*v68);
          v74 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            v75 = __error();
            v76 = strerror(*v75);
            int v77 = *__error();
            *(_DWORD *)v86 = 136446978;
            v87 = "_phTmlNfc_QuerySPMIErrors";
            __int16 v88 = 1024;
            int v89 = 796;
            __int16 v90 = 2080;
            *(void *)v91 = v76;
            *(_WORD *)&v91[8] = 1024;
            int v92 = v77;
            _os_log_impl(&dword_2269FD000, v74, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to query SPMI error registers", v86, 0x22u);
          }
          uint64_t v9 = 255;
          break;
        default:
          if (a2 != 71) {
            goto LABEL_114;
          }
          uint64_t v23 = a1;
          int v24 = 0;
          goto LABEL_46;
      }
      return v9;
    }
    if (a2 == 61680)
    {
      NFHardwareSerialDebugDump();
      return 0;
    }
    if (a2 != 61681)
    {
      if (a2 == 61695)
      {
        if (v4) {
          v22 = *(void ***)(v4 + 112);
        }
        else {
          v22 = 0;
        }
        if (NFHardwareDebug(v22)) {
          return 0;
        }
        else {
          return 11;
        }
      }
      goto LABEL_114;
    }
    if (v4)
    {
      if (*(void *)(v4 + 112))
      {
        uint64_t v9 = 0;
        *(unsigned char *)(v4 + 1) = 1;
        return v9;
      }
      v80 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v81 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v81) {
        v81(3, "%s:%i FAILED: %s", "_phTmlNfc_DebugMWUnload", 815, "tml->ifc!=NULL");
      }
      dispatch_get_specific(*v80);
      v66 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 136446722;
      *(void *)&buf[4] = "_phTmlNfc_DebugMWUnload";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 815;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "tml->ifc!=NULL";
    }
    else
    {
      v64 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v65) {
        v65(3, "%s:%i FAILED: %s", "_phTmlNfc_DebugMWUnload", 814, "tml!=NULL");
      }
      dispatch_get_specific(*v64);
      v66 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      *(_DWORD *)buf = 136446722;
      *(void *)&buf[4] = "_phTmlNfc_DebugMWUnload";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 814;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "tml!=NULL";
    }
    _os_log_impl(&dword_2269FD000, v66, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 0;
  }
  if (a2 <= 19)
  {
    switch(a2)
    {
      case 1:
        if (*(unsigned char *)(v4 + 105))
        {
          v12 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v13) {
            v13(6, "%s:%i phTmlNfc_e_EnableDownloadMode", "phTmlNfc_IoCtl", 981);
          }
          dispatch_get_specific(*v12);
          v14 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "phTmlNfc_IoCtl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 981;
            _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_EnableDownloadMode", buf, 0x12u);
          }
        }
        uint64_t v9 = sub_226A041B0(a1, 1);
        if (v9) {
          return v9;
        }
        usleep(0x1F4u);
        uint64_t v9 = sub_226A03F7C(a1, 0);
        if (v9) {
          return v9;
        }
        if ((NFHardwareInterfaceResetSerial(*(uint64_t **)(v5 + 112)) & 1) == 0)
        {
          v15 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v16) {
            v16(3, "%s:%i failed to reset serial", "phTmlNfc_IoCtl", 990);
          }
          dispatch_get_specific(*v15);
          v17 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "phTmlNfc_IoCtl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 990;
            _os_log_impl(&dword_2269FD000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to reset serial", buf, 0x12u);
          }
        }
LABEL_61:
        usleep(v11);
        uint64_t v9 = sub_226A03F7C(a1, 1);
        if (!v9)
        {
          usleep(0x2710u);
          *(unsigned char *)(v5 + 136) = 1;
        }
        break;
      case 2:
        v25 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v26) {
          v26(6, "%s:%i phTmlNfc_e_EnableDownloadMode_NO_VEN", "phTmlNfc_IoCtl", 1025);
        }
        dispatch_get_specific(*v25);
        v27 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = "phTmlNfc_IoCtl";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1025;
          _os_log_impl(&dword_2269FD000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_EnableDownloadMode_NO_VEN", buf, 0x12u);
        }
        uint64_t v28 = a1;
        int v29 = 1;
        goto LABEL_64;
      case 3:
        if (*(unsigned char *)(v4 + 105))
        {
          v30 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v31) {
            v31(6, "%s:%i phTmlNfc_e_EnableNormalMode", "phTmlNfc_IoCtl", 925);
          }
          dispatch_get_specific(*v30);
          v32 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "phTmlNfc_IoCtl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 925;
            _os_log_impl(&dword_2269FD000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_EnableNormalMode", buf, 0x12u);
          }
        }
        uint64_t v9 = sub_226A041B0(a1, 0);
        if (!v9)
        {
          usleep(0x1F4u);
          uint64_t v9 = sub_226A03F7C(a1, 0);
          if (!v9) {
            goto LABEL_61;
          }
        }
        return v9;
      case 4:
        uint64_t v28 = a1;
        int v29 = 0;
LABEL_64:
        uint64_t v9 = sub_226A041B0(v28, v29);
        if (!v9)
        {
          uint64_t v9 = sub_226A03F7C(a1, 1);
          if (!v9)
          {
            usleep(0x2710u);
            phTmlNfc_FlushTxRxBuffers(a1);
          }
        }
        break;
      case 6:
        if (*(unsigned char *)(v4 + 105))
        {
          v33 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v34) {
            v34(6, "%s:%i phTmlNfc_e_PowerOff", "phTmlNfc_IoCtl", 900);
          }
          dispatch_get_specific(*v33);
          v35 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "phTmlNfc_IoCtl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 900;
            _os_log_impl(&dword_2269FD000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_PowerOff", buf, 0x12u);
          }
        }
        *(unsigned char *)(v5 + 136) = 0;
        uint64_t v9 = sub_226A03F7C(a1, 0);
        if (!v9) {
          usleep(v11);
        }
        break;
      default:
        goto LABEL_114;
    }
    return v9;
  }
  if (a2 <= 38)
  {
    if (a2 == 20)
    {
      uint64_t v20 = a1;
      int v21 = 0;
      goto LABEL_95;
    }
    if (a2 == 21)
    {
      uint64_t v20 = a1;
      int v21 = 1;
LABEL_95:
      return sub_226A045B0(v20, v21);
    }
LABEL_114:
    v59 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v60 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v60) {
      v60(3, "%s:%i Invalid code: %d", "phTmlNfc_IoCtl", 1089, a2);
    }
    dispatch_get_specific(*v59);
    v61 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&buf[4] = "phTmlNfc_IoCtl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1089;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a2;
      _os_log_impl(&dword_2269FD000, v61, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid code: %d", buf, 0x18u);
    }
    return 1;
  }
  if (a2 == 39)
  {
    v48 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v49 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v49) {
      v49(6, "%s:%i phTmlNfc_e_Nfc_Rst_Client", "phTmlNfc_IoCtl", 1082);
    }
    dispatch_get_specific(*v48);
    v50 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "phTmlNfc_IoCtl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1082;
      _os_log_impl(&dword_2269FD000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s:%i phTmlNfc_e_Nfc_Rst_Client", buf, 0x12u);
    }
    uint64_t v51 = sub_226A01B24(a1);
    if (!v51)
    {
      dispatch_get_specific(*v48);
      v67 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v67) {
        v67(3, "%s:%i FAILED: %s", "_phTmlNfc_FollowerReset", 772, "tml!=NULL");
      }
      dispatch_get_specific(*v48);
      v8 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        return 49;
      }
      *(_DWORD *)buf = 136446722;
      *(void *)&buf[4] = "_phTmlNfc_FollowerReset";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 772;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "tml!=NULL";
      goto LABEL_7;
    }
    uint64_t v52 = v51;
    v53 = *(uint64_t **)(v51 + 112);
    if (!v53)
    {
      dispatch_get_specific(*v48);
      v82 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v82) {
        v82(3, "%s:%i FAILED: %s", "_phTmlNfc_FollowerReset", 773, "tml->ifc!=NULL");
      }
      dispatch_get_specific(*v48);
      v8 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        return 49;
      }
      *(_DWORD *)buf = 136446722;
      *(void *)&buf[4] = "_phTmlNfc_FollowerReset";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 773;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = "tml->ifc!=NULL";
      goto LABEL_7;
    }
    uint64_t v54 = *v53;
    v55 = *(unsigned int (**)(void))(*v53 + 224);
    if (v55 && v55(*(void *)(v54 + 240)))
    {
      uint64_t v56 = **(void **)(v52 + 112);
      v57 = *(uint64_t (**)(void))(v56 + 216);
      uint64_t v9 = 255;
      if (v57)
      {
        int v58 = v57(*(void *)(v56 + 240));
        if (v58) {
          uint64_t v9 = 179;
        }
        else {
          uint64_t v9 = 255;
        }
      }
      else
      {
        int v58 = 0;
      }
      dispatch_get_specific(*v48);
      v83 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v83) {
        v83(3, "%s:%i Failed to set device wake. NACK = %d", "_phTmlNfc_FollowerReset", 779, v58);
      }
      dispatch_get_specific(*v48);
      v84 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&buf[4] = "_phTmlNfc_FollowerReset";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 779;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v58;
        _os_log_impl(&dword_2269FD000, v84, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to set device wake. NACK = %d", buf, 0x18u);
      }
      return v9;
    }
    usleep(0x2710u);
    return 0;
  }
  if (a2 != 70) {
    goto LABEL_114;
  }
  uint64_t v23 = a1;
  int v24 = 1;
LABEL_46:

  return sub_226A048E8(v23, v24);
}

uint64_t phTmlNfc_Write(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    uint64_t v23 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 361, "pBuffer!=((void *)0)");
    }
    dispatch_get_specific(*v23);
    v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v29 = "phTmlNfc_Write";
      __int16 v30 = 1024;
      int v31 = 361;
      __int16 v32 = 2080;
      v33 = "pBuffer!=((void *)0)";
LABEL_42:
      _os_log_impl(&dword_2269FD000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    }
LABEL_43:
    abort();
  }
  if (!a3)
  {
    v26 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27) {
      v27(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 362, "wLength>0");
    }
    dispatch_get_specific(*v26);
    v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v29 = "phTmlNfc_Write";
      __int16 v30 = 1024;
      int v31 = 362;
      __int16 v32 = 2080;
      v33 = "wLength>0";
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  uint64_t v3 = sub_226A01B24(a1);
  if (!v3)
  {
    useconds_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 365, "tml!=NULL");
    }
    dispatch_get_specific(*v11);
    v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)buf = 136446722;
    int v29 = "phTmlNfc_Write";
    __int16 v30 = 1024;
    int v31 = 365;
    __int16 v32 = 2080;
    v33 = "tml!=NULL";
    v14 = "%{public}s:%i FAILED: %s";
LABEL_25:
    int v19 = v13;
    uint32_t v20 = 28;
    goto LABEL_26;
  }
  uint64_t v4 = (unsigned char *)v3;
  uint64_t v5 = *(void *)(v3 + 112);
  if (!v5)
  {
    v15 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 366, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v15);
    v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)buf = 136446722;
    int v29 = "phTmlNfc_Write";
    __int16 v30 = 1024;
    int v31 = 366;
    __int16 v32 = 2080;
    v33 = "tml->ifc!=NULL";
    v14 = "%{public}s:%i FAILED: %s";
    goto LABEL_25;
  }
  if (!*v4)
  {
    v17 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18) {
      v18(3, "%s:%i FAILED: %s", "phTmlNfc_Write", 367, "tml->isRunning");
    }
    dispatch_get_specific(*v17);
    v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)buf = 136446722;
    int v29 = "phTmlNfc_Write";
    __int16 v30 = 1024;
    int v31 = 367;
    __int16 v32 = 2080;
    v33 = "tml->isRunning";
    v14 = "%{public}s:%i FAILED: %s";
    goto LABEL_25;
  }
  int v6 = NFHardwareInterfaceWriteBlock(v5);
  if (!v6) {
    return 13;
  }
  v7 = (const void **)MEMORY[0x263F8C6C0];
  if (v6 != -1)
  {
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v21) {
      v21(3, "%s:%i Not initialized", "phTmlNfc_Write", 386);
    }
    dispatch_get_specific(*v7);
    v22 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)buf = 136446466;
    int v29 = "phTmlNfc_Write";
    __int16 v30 = 1024;
    int v31 = 386;
    v14 = "%{public}s:%i Not initialized";
    int v19 = v22;
    uint32_t v20 = 18;
LABEL_26:
    _os_log_impl(&dword_2269FD000, v19, OS_LOG_TYPE_ERROR, v14, buf, v20);
    return 49;
  }
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8) {
    v8(3, "%s:%i Busy !", "phTmlNfc_Write", 383);
  }
  dispatch_get_specific(*v7);
  uint64_t v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    int v29 = "phTmlNfc_Write";
    __int16 v30 = 1024;
    int v31 = 383;
    _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Busy !", buf, 0x12u);
  }
  return 111;
}

uint64_t NFHardwareSerialWriteBlock(uint64_t a1, char *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 1;
  }
  if (!a2)
  {
    v22 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 716, "buffer!=((void *)0)");
    }
    dispatch_get_specific(*v22);
    int v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136446722;
    v35 = "NFHardwareSerialWriteBlock";
    __int16 v36 = 1024;
    int v37 = 716;
    __int16 v38 = 2080;
    v39 = "buffer!=((void *)0)";
LABEL_42:
    _os_log_impl(&dword_2269FD000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    goto LABEL_43;
  }
  if (!a3)
  {
    v25 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26) {
      v26(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 717, "length!=0");
    }
    dispatch_get_specific(*v25);
    int v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136446722;
    v35 = "NFHardwareSerialWriteBlock";
    __int16 v36 = 1024;
    int v37 = 717;
    __int16 v38 = 2080;
    v39 = "length!=0";
    goto LABEL_42;
  }
  uint64_t v7 = *(void *)(a1 + 8);
  if (*(void *)(v7 + 152))
  {
    v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v9) {
      v9(3, "%s:%i Failed to write, buffer already pending TX. Bytes left = %zu, bytes written = %d, suspend state = %d", "NFHardwareSerialWriteBlock", 721, *(void *)(*(void *)(a1 + 8) + 160), *(_DWORD *)(*(void *)(a1 + 8) + 168), *(_DWORD *)(*(void *)(a1 + 8) + 144));
    }
    dispatch_get_specific(*v8);
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 8);
      v12 = *(const char **)(v11 + 160);
      int v13 = *(_DWORD *)(v11 + 168);
      LODWORD(v11) = *(_DWORD *)(v11 + 144);
      *(_DWORD *)buf = 136447234;
      v35 = "NFHardwareSerialWriteBlock";
      __int16 v36 = 1024;
      int v37 = 721;
      __int16 v38 = 2048;
      v39 = v12;
      __int16 v40 = 1024;
      int v41 = v13;
      __int16 v42 = 1024;
      int v43 = v11;
      _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to write, buffer already pending TX. Bytes left = %zu, bytes written = %d, suspend state = %d", buf, 0x28u);
    }
    uint64_t v14 = *(void *)(a1 + 8);
    v15 = *(void (**)(void, uint64_t, const char *, char *, unint64_t))(v14 + 80);
    if (v15) {
      v15(*(unsigned __int8 *)(v14 + 96), 7, "[TX>] Failed : Busy", a2, a3);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = *(void (**)(void, uint64_t, const char *, char *, unint64_t))(v7 + 80);
  if (v18)
  {
    v18(*(unsigned __int8 *)(v7 + 96), 7, "[TX>]", a2, a3);
    uint64_t v7 = *(void *)(a1 + 8);
  }
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v7 + 88), 5, a2, a3);
  uint64_t v19 = *(void *)(a1 + 8);
  if (*(void *)(v19 + 152))
  {
    v27 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v28) {
      v28(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 732, "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBuffer == ((void *)0)");
    }
    dispatch_get_specific(*v27);
    int v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136446722;
    v35 = "NFHardwareSerialWriteBlock";
    __int16 v36 = 1024;
    int v37 = 732;
    __int16 v38 = 2080;
    v39 = "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBuffer == ((void *)0)";
    goto LABEL_42;
  }
  if (*(void *)(v19 + 160))
  {
    int v29 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30) {
      v30(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 733, "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBufferSize == 0");
    }
    dispatch_get_specific(*v29);
    int v24 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)buf = 136446722;
    v35 = "NFHardwareSerialWriteBlock";
    __int16 v36 = 1024;
    int v37 = 733;
    __int16 v38 = 2080;
    v39 = "((NFHardwareSerialInternal*)(serial->internal))->currentWriteBufferSize == 0";
    goto LABEL_42;
  }
  if (*(_DWORD *)(v19 + 144) != 1)
  {
    int v31 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v32 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v32) {
      v32(3, "%s:%i FAILED: %s", "NFHardwareSerialWriteBlock", 734, "((NFHardwareSerialInternal*)(serial->internal))->suspendWriteCount == 1");
    }
    dispatch_get_specific(*v31);
    int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v35 = "NFHardwareSerialWriteBlock";
      __int16 v36 = 1024;
      int v37 = 734;
      __int16 v38 = 2080;
      v39 = "((NFHardwareSerialInternal*)(serial->internal))->suspendWriteCount == 1";
      goto LABEL_42;
    }
LABEL_43:
    abort();
  }
  *(void *)(v19 + 152) = a2;
  *(void *)(v19 + 160) = a3;
  *(_DWORD *)(v19 + 168) = 0;
  uint32_t v20 = *(NSObject **)(v19 + 136);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = sub_226A0E7BC;
  handler[3] = &unk_2647C1C98;
  handler[4] = a4;
  handler[5] = a1;
  dispatch_source_set_event_handler(v20, handler);
  uint64_t v21 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v21 + 144))
  {
    *(_DWORD *)(v21 + 144) = 0;
    dispatch_resume(*(dispatch_object_t *)(v21 + 136));
  }
  return 0;
}

uint64_t NFHardwareInterfaceWriteBlock(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v1 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 40);
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)a1 + 136);
    return v1(v2);
  }
  else
  {
    uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i No interface defined for writing", "NFHardwareInterfaceWriteBlock", 375);
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v8 = "NFHardwareInterfaceWriteBlock";
      __int16 v9 = 1024;
      int v10 = 375;
      _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for writing", buf, 0x12u);
    }
    return 1;
  }
}

uint64_t phOsalNfc_Timer_Stop(int a1, const char *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226A05FCC(a1);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (pthread_mutex_t *)(v3 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 176));
    for (uint64_t i = 8; i != 168; i += 16)
    {
      if (*(const char **)(v4 + i) == a2)
      {
        uint64_t v11 = sub_226A063CC(v4 + i, 0);
        goto LABEL_18;
      }
    }
    uint64_t v7 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to get timer %llX from context", "phOsalNfc_Timer_Stop", 364, a2);
    }
    dispatch_get_specific(*v7);
    __int16 v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "phOsalNfc_Timer_Stop";
      __int16 v18 = 1024;
      int v19 = 364;
      __int16 v20 = 2048;
      uint64_t v21 = a2;
      _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer %llX from context", buf, 0x1Cu);
    }
    int v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = a2;
      _os_log_fault_impl(&dword_2269FD000, v10, OS_LOG_TYPE_FAULT, "Error: Failed to get timer 0x%llX from context", buf, 0xCu);
    }
    uint64_t v11 = 1;
LABEL_18:
    pthread_mutex_unlock(v5);
  }
  else
  {
    v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Failed to get timer context", "phOsalNfc_Timer_Stop", 357);
    }
    dispatch_get_specific(*v12);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "phOsalNfc_Timer_Stop";
      __int16 v18 = 1024;
      int v19 = 357;
      _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context", buf, 0x12u);
    }
    return 49;
  }
  return v11;
}

uint64_t phOsalNfc_Timer_Start(int a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a4)
  {
    uint64_t v10 = sub_226A05FCC(a1);
    if (v10)
    {
      uint64_t v11 = v10;
      v12 = (pthread_mutex_t *)(v10 + 176);
      pthread_mutex_lock((pthread_mutex_t *)(v10 + 176));
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = v11 + v13;
        if (*(void *)(v11 + v13 + 8) == a2) {
          break;
        }
        v13 += 16;
        if (v13 == 160)
        {
          v15 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger) {
            Logger(3, "%s:%i Failed to get timer %llX from context", "phOsalNfc_Timer_Start", 331, a2);
          }
          dispatch_get_specific(*v15);
          v17 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "phOsalNfc_Timer_Start";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 331;
            *(_WORD *)&buf[18] = 2048;
            *(void *)&buf[20] = a2;
            _os_log_impl(&dword_2269FD000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer %llX from context", buf, 0x1Cu);
          }
          __int16 v18 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = a2;
            _os_log_fault_impl(&dword_2269FD000, v18, OS_LOG_TYPE_FAULT, "Error: Failed to get timer 0x%llX from context", buf, 0xCu);
          }
          uint64_t v19 = 1;
          goto LABEL_42;
        }
      }
      if (*(void *)(v14 + 16))
      {
        v26 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v27) {
          v27(3, "%s:%i timer %llX already started", "_phOsalNfc_Timer_StartTimer", 142, *(void *)(v14 + 8));
        }
        dispatch_get_specific(*v26);
        uint64_t v28 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *(void *)(v14 + 8);
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "_phOsalNfc_Timer_StartTimer";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 142;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = v29;
          _os_log_impl(&dword_2269FD000, v28, OS_LOG_TYPE_ERROR, "%{public}s:%i timer %llX already started", buf, 0x1Cu);
        }
        uint64_t v19 = 225;
      }
      else
      {
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x2000000000;
        double v41 = 0.0;
        double v41 = (double)a3 / 1000.0 + CFAbsoluteTimeGetCurrent();
        __int16 v30 = dispatch_source_create(MEMORY[0x263EF8400], 1uLL, 0, *(dispatch_queue_t *)(v11 + 168));
        *(void *)(v14 + 16) = v30;
        if (v30)
        {
          *(void *)buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 0x40000000;
          *(void *)&buf[16] = sub_226A069B8;
          *(void *)&buf[24] = &unk_2647C1C18;
          int v47 = a1;
          int v43 = v40;
          uint64_t v44 = a2;
          uint64_t v45 = a4;
          uint64_t v46 = a5;
          dispatch_source_set_event_handler(v30, buf);
          dispatch_activate(*(dispatch_object_t *)(v14 + 16));
          dispatch_time_t v31 = dispatch_time(0, 1000000 * a3);
          unsigned int v32 = a3 / 0x32;
          if (a3 / 0x32 >= 0xEA60) {
            unsigned int v32 = 60000;
          }
          uint64_t v33 = 1000000 * v32;
          if (a3 >= 0x32) {
            uint64_t v34 = v33;
          }
          else {
            uint64_t v34 = 1000000;
          }
          dispatch_source_set_timer(*(dispatch_source_t *)(v14 + 16), v31, 0xFFFFFFFFFFFFFFFFLL, v34);
          uint64_t v19 = 0;
        }
        else
        {
          v35 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          __int16 v36 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v36) {
            v36(3, "%s:%i Can't start timer %llX", "_phOsalNfc_Timer_StartTimer", 170, *(void *)(v14 + 8));
          }
          dispatch_get_specific(*v35);
          int v37 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            uint64_t v38 = *(void *)(v14 + 8);
            *(_DWORD *)buf = 136446722;
            *(void *)&uint8_t buf[4] = "_phOsalNfc_Timer_StartTimer";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 170;
            *(_WORD *)&buf[18] = 2048;
            *(void *)&buf[20] = v38;
            _os_log_impl(&dword_2269FD000, v37, OS_LOG_TYPE_ERROR, "%{public}s:%i Can't start timer %llX", buf, 0x1Cu);
          }
          uint64_t v19 = 1;
        }
        _Block_object_dispose(v40, 8);
      }
LABEL_42:
      pthread_mutex_unlock(v12);
    }
    else
    {
      uint64_t v23 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v24) {
        v24(3, "%s:%i Failed to get timer context", "phOsalNfc_Timer_Start", 324);
      }
      dispatch_get_specific(*v23);
      v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = "phOsalNfc_Timer_Start";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 324;
        _os_log_impl(&dword_2269FD000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context", buf, 0x12u);
      }
      return 49;
    }
  }
  else
  {
    __int16 v20 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v21) {
      v21(3, "%s:%i Invalid parameter", "phOsalNfc_Timer_Start", 318);
    }
    dispatch_get_specific(*v20);
    uint64_t v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "phOsalNfc_Timer_Start";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 318;
      _os_log_impl(&dword_2269FD000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid parameter", buf, 0x12u);
    }
    return 1;
  }
  return v19;
}

uint64_t sub_226A00428(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  size_t v2 = *(void *)(a1 + 40);
  uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 112));
  if (data < v2)
  {
    uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i Only %lu bytes available, requested %zu !", "NFHardwareSerialReadBlock_block_invoke", 677, data, *(void *)(a1 + 40));
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136446978;
      __int16 v36 = "NFHardwareSerialReadBlock_block_invoke";
      __int16 v37 = 1024;
      int v38 = 677;
      __int16 v39 = 2048;
      __int16 v40 = (const char *)data;
      __int16 v41 = 2048;
      uint64_t v42 = v7;
      _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Only %lu bytes available, requested %zu !", buf, 0x26u);
    }
  }
  v8 = *(char **)(a1 + 56);
  if (!v8)
  {
    __int16 v30 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    dispatch_time_t v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31) {
      v31(3, "%s:%i FAILED: %s", "_NFHardwareSerialRead", 633, "buffer!=((void *)0)");
    }
    dispatch_get_specific(*v30);
    unsigned int v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v36 = "_NFHardwareSerialRead";
      __int16 v37 = 1024;
      int v38 = 633;
      __int16 v39 = 2080;
      __int16 v40 = "buffer!=((void *)0)";
LABEL_31:
      _os_log_impl(&dword_2269FD000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    }
LABEL_32:
    abort();
  }
  if (!v2)
  {
    uint64_t v33 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v34) {
      v34(3, "%s:%i FAILED: %s", "_NFHardwareSerialRead", 634, "*length>0");
    }
    dispatch_get_specific(*v33);
    unsigned int v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v36 = "_NFHardwareSerialRead";
      __int16 v37 = 1024;
      int v38 = 634;
      __int16 v39 = 2080;
      __int16 v40 = "*length>0";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  ssize_t v10 = read(*(_DWORD *)v9, *(void **)(a1 + 56), v2);
  if (v10 < 0)
  {
    uint64_t v14 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v15 = NFLogGetLogger();
    if (v15)
    {
      v16 = (void (*)(uint64_t, const char *, ...))v15;
      v17 = __error();
      __int16 v18 = strerror(*v17);
      uint64_t v19 = __error();
      v16(3, "%s:%i \"%s\" errno=%d ", "_NFHardwareSerialRead", 640, v18, *v19);
    }
    dispatch_get_specific(*v14);
    __int16 v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = __error();
      uint64_t v22 = strerror(*v21);
      int v23 = *__error();
      *(_DWORD *)buf = 136446978;
      __int16 v36 = "_NFHardwareSerialRead";
      __int16 v37 = 1024;
      int v38 = 640;
      __int16 v39 = 2080;
      __int16 v40 = v22;
      __int16 v41 = 1024;
      LODWORD(v42) = v23;
      _os_log_impl(&dword_2269FD000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d ", buf, 0x22u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v11 = *(void *)(v9 + 8);
    v12 = *(void (**)(void, uint64_t, const char *, char *, ssize_t))(v11 + 80);
    if (v12)
    {
      v12(*(unsigned __int8 *)(v11 + 96), 7, "[RX<]", v8, v10);
      uint64_t v11 = *(void *)(v9 + 8);
    }
    NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v11 + 88), 3, v8, v10);
    uint64_t v13 = (const char *)v10;
  }
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 112));
  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  ++*(_DWORD *)(v24 + 120);
  *(void *)(v24 + 128) = 0;
  if ((unint64_t)v13 < *(void *)(a1 + 40))
  {
    v25 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26) {
      v26(6, "%s:%i Only got %zu bytes, requested %zu, available %lu.", "NFHardwareSerialReadBlock_block_invoke", 692, (size_t)v13, *(void *)(a1 + 40), data);
    }
    dispatch_get_specific(*v25);
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136447234;
      __int16 v36 = "NFHardwareSerialReadBlock_block_invoke";
      __int16 v37 = 1024;
      int v38 = 692;
      __int16 v39 = 2048;
      __int16 v40 = v13;
      __int16 v41 = 2048;
      uint64_t v42 = v28;
      __int16 v43 = 2048;
      uintptr_t v44 = data;
      _os_log_impl(&dword_2269FD000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Only got %zu bytes, requested %zu, available %lu.", buf, 0x30u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_226A00950(void *a1, unsigned __int16 a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1[4];
  if (a3) {
    unsigned __int16 v5 = 0;
  }
  else {
    unsigned __int16 v5 = 255;
  }
  v16[0] = v5;
  v16[1] = v4;
  v16[2] = a2;
  if ((a3 & 1) == 0)
  {
    int v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to read", "phTmlNfc_Read_block_invoke", 473);
    }
    dispatch_get_specific(*v6);
    v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v18 = "phTmlNfc_Read_block_invoke";
      __int16 v19 = 1024;
      LODWORD(v20) = 473;
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to read", buf, 0x12u);
    }
  }
  uint64_t v9 = (unsigned char *)a1[5];
  HIDWORD(v16[0]) = v9[120];
  if (v9[1])
  {
    ssize_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = (const char *)a1[6];
      uint64_t v12 = a1[7];
      uint64_t v14 = a1[5];
      uint64_t v15 = *(void *)(v14 + 144);
      LODWORD(v14) = *(_DWORD *)(v14 + 152);
      *(_DWORD *)buf = 134218752;
      __int16 v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v15;
      __int16 v23 = 1024;
      int v24 = v14;
      _os_log_fault_impl(&dword_2269FD000, v10, OS_LOG_TYPE_FAULT, "Error : read received after shutdown : %p / %p. Driver context %llu, Controller config type %d", buf, 0x26u);
    }
    uint64_t v9 = (unsigned char *)a1[5];
    v9[1] = 0;
  }
  if (*v9)
  {
    uint64_t v11 = (void (*)(void, void *))a1[6];
    if (v11)
    {
      v9[2] = 0;
      v11(a1[7], v16);
    }
  }
}

uint64_t phTmlNfc_Read(uint64_t a1, uint64_t a2, int a3, const char *a4, const void *a5)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    __int16 v39 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 454, "pBuffer!=((void *)0)");
    }
    dispatch_get_specific(*v39);
    __int16 v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v45 = "phTmlNfc_Read";
      __int16 v46 = 1024;
      *(_DWORD *)int v47 = 454;
      *(_WORD *)&v47[4] = 2080;
      *(void *)&v47[6] = "pBuffer!=((void *)0)";
LABEL_66:
      _os_log_impl(&dword_2269FD000, v41, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    }
LABEL_67:
    abort();
  }
  if (!a3)
  {
    uint64_t v42 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v43 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v43) {
      v43(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 455, "wLength>0");
    }
    dispatch_get_specific(*v42);
    __int16 v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v45 = "phTmlNfc_Read";
      __int16 v46 = 1024;
      *(_DWORD *)int v47 = 455;
      *(_WORD *)&v47[4] = 2080;
      *(void *)&v47[6] = "wLength>0";
      goto LABEL_66;
    }
    goto LABEL_67;
  }
  uint64_t v7 = sub_226A01B24(a1);
  if (!v7)
  {
    uint64_t v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 458, "tml!=NULL");
    }
    dispatch_get_specific(*v12);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v45 = "phTmlNfc_Read";
    __int16 v46 = 1024;
    *(_DWORD *)int v47 = 458;
    *(_WORD *)&v47[4] = 2080;
    *(void *)&v47[6] = "tml!=NULL";
LABEL_26:
    _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  uint64_t v8 = v7;
  if (!*(void *)(v7 + 112))
  {
    uint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 459, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v15);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v45 = "phTmlNfc_Read";
    __int16 v46 = 1024;
    *(_DWORD *)int v47 = 459;
    *(_WORD *)&v47[4] = 2080;
    *(void *)&v47[6] = "tml->ifc!=NULL";
    goto LABEL_26;
  }
  if (!*(unsigned char *)v7)
  {
    v17 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18) {
      v18(3, "%s:%i FAILED: %s", "phTmlNfc_Read", 460, "tml->isRunning");
    }
    dispatch_get_specific(*v17);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)buf = 136446722;
    uint64_t v45 = "phTmlNfc_Read";
    __int16 v46 = 1024;
    *(_DWORD *)int v47 = 460;
    *(_WORD *)&v47[4] = 2080;
    *(void *)&v47[6] = "tml->isRunning";
    goto LABEL_26;
  }
  if (*(unsigned char *)(v7 + 1))
  {
    uint64_t v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v45 = a4;
      __int16 v46 = 2048;
      *(void *)int v47 = a5;
      _os_log_fault_impl(&dword_2269FD000, v9, OS_LOG_TYPE_FAULT, "Error : read received after shutdown : %p / %p", buf, 0x16u);
    }
  }
  int Block = NFHardwareInterfaceReadBlock(*(void *)(v8 + 112));
  if (Block == -1)
  {
    __int16 v19 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v20) {
      v20(3, "%s:%i Failed to read : busy. Pending read = %d", "phTmlNfc_Read", 500, *(unsigned __int8 *)(v8 + 2));
    }
    dispatch_get_specific(*v19);
    __int16 v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = *(unsigned __int8 *)(v8 + 2);
      *(_DWORD *)buf = 136446722;
      uint64_t v45 = "phTmlNfc_Read";
      __int16 v46 = 1024;
      *(_DWORD *)int v47 = 500;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v22;
      _os_log_impl(&dword_2269FD000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to read : busy. Pending read = %d", buf, 0x18u);
    }
    if (!NFIsInternalBuild()) {
      return 111;
    }
    dispatch_get_specific(*v19);
    __int16 v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v23) {
      v23(6, "%s:%i Debug : Pending read cb = %p, context = %p", "phTmlNfc_Read", 502, *(const void **)(v8 + 8), *(const void **)(v8 + 16));
    }
    dispatch_get_specific(*v19);
    int v24 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(v8 + 8);
      v26 = *(const void **)(v8 + 16);
      *(_DWORD *)buf = 136446978;
      uint64_t v45 = "phTmlNfc_Read";
      __int16 v46 = 1024;
      *(_DWORD *)int v47 = 502;
      *(_WORD *)&v47[4] = 2048;
      *(void *)&v47[6] = v25;
      __int16 v48 = 2048;
      v49 = v26;
      _os_log_impl(&dword_2269FD000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Pending read cb = %p, context = %p", buf, 0x26u);
    }
    dispatch_get_specific(*v19);
    v27 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v27) {
      v27(6, "%s:%i Debug : Current read cb = %p, context = %p", "phTmlNfc_Read", 503, a4, a5);
    }
    dispatch_get_specific(*v19);
    uint64_t v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v45 = "phTmlNfc_Read";
      __int16 v46 = 1024;
      *(_DWORD *)int v47 = 503;
      *(_WORD *)&v47[4] = 2048;
      *(void *)&v47[6] = a4;
      __int16 v48 = 2048;
      v49 = a5;
      _os_log_impl(&dword_2269FD000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Current read cb = %p, context = %p", buf, 0x26u);
    }
    *(unsigned char *)(v8 + 2) = 0;
    uint64_t result = 111;
LABEL_56:
    *(void *)(v8 + 8) = 0;
    *(void *)(v8 + 16) = 0;
    return result;
  }
  if (Block)
  {
    uint64_t v29 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30) {
      v30(3, "%s:%i Failed to read : not initialized. Pending read = %d", "phTmlNfc_Read", 510, *(unsigned __int8 *)(v8 + 2));
    }
    dispatch_get_specific(*v29);
    dispatch_time_t v31 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v32 = *(unsigned __int8 *)(v8 + 2);
      *(_DWORD *)buf = 136446722;
      uint64_t v45 = "phTmlNfc_Read";
      __int16 v46 = 1024;
      *(_DWORD *)int v47 = 510;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v32;
      _os_log_impl(&dword_2269FD000, v31, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to read : not initialized. Pending read = %d", buf, 0x18u);
    }
    if (NFIsInternalBuild())
    {
      dispatch_get_specific(*v29);
      uint64_t v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v33) {
        v33(6, "%s:%i Debug : Pending read cb = %p, context = %p", "phTmlNfc_Read", 512, *(const void **)(v8 + 8), *(const void **)(v8 + 16));
      }
      dispatch_get_specific(*v29);
      uint64_t v34 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = *(void *)(v8 + 8);
        __int16 v36 = *(const void **)(v8 + 16);
        *(_DWORD *)buf = 136446978;
        uint64_t v45 = "phTmlNfc_Read";
        __int16 v46 = 1024;
        *(_DWORD *)int v47 = 512;
        *(_WORD *)&v47[4] = 2048;
        *(void *)&v47[6] = v35;
        __int16 v48 = 2048;
        v49 = v36;
        _os_log_impl(&dword_2269FD000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Pending read cb = %p, context = %p", buf, 0x26u);
      }
      dispatch_get_specific(*v29);
      __int16 v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v37) {
        v37(6, "%s:%i Debug : Current read cb = %p, context = %p", "phTmlNfc_Read", 513, a4, a5);
      }
      dispatch_get_specific(*v29);
      int v38 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v45 = "phTmlNfc_Read";
        __int16 v46 = 1024;
        *(_DWORD *)int v47 = 513;
        *(_WORD *)&v47[4] = 2048;
        *(void *)&v47[6] = a4;
        __int16 v48 = 2048;
        v49 = a5;
        _os_log_impl(&dword_2269FD000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Current read cb = %p, context = %p", buf, 0x26u);
      }
      *(unsigned char *)(v8 + 2) = 0;
      uint64_t result = 49;
      goto LABEL_56;
    }
    return 49;
  }
  if (NFIsInternalBuild())
  {
    *(unsigned char *)(v8 + 2) = 1;
    *(void *)(v8 + 8) = a4;
    *(void *)(v8 + 16) = a5;
  }
  return 13;
}

uint64_t NFHardwareSerialReadBlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 1;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v5 + 120))
  {
    int v6 = *(NSObject **)(v5 + 112);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = sub_226A00428;
    handler[3] = &unk_2647C1C70;
    void handler[6] = a1;
    handler[7] = a2;
    handler[4] = a4;
    handler[5] = a3;
    dispatch_source_set_event_handler(v6, handler);
    uint64_t v7 = *(void *)(a1 + 8);
    int v8 = *(_DWORD *)(v7 + 120);
    if (v8)
    {
      *(_DWORD *)(v7 + 120) = v8 - 1;
      uint64_t v9 = mach_continuous_time();
      uint64_t v7 = *(void *)(a1 + 8);
      *(void *)(v7 + 128) = v9;
    }
    dispatch_resume(*(dispatch_object_t *)(v7 + 112));
    return 0;
  }
  else
  {
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
      mach_continuous_time();
      uint64_t ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v13(3, "%s:%i Error : read in progress since %llu", "NFHardwareSerialReadBlock", 664, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v11);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      mach_continuous_time();
      *(_DWORD *)buf = 136446722;
      __int16 v18 = "NFHardwareSerialReadBlock";
      __int16 v19 = 1024;
      int v20 = 664;
      __int16 v21 = 2048;
      uint64_t v22 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_2269FD000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Error : read in progress since %llu", buf, 0x1Cu);
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_2269FD000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Error : read already in progress.", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
}

void NFHardwareSerialDebugLog(os_unfair_lock_s *a1, int a2, char *a3, unint64_t a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v27.tv_sec = 0;
  *(void *)&v27.tv_usec = 0;
  gettimeofday(&v27, 0);
  os_unfair_lock_lock(a1 + 20);
  int v8 = *(char **)&a1[4]._os_unfair_lock_opaque;
  if (v8 && *(void *)&a1[14]._os_unfair_lock_opaque)
  {
    uint64_t v9 = *(char **)&a1[10]._os_unfair_lock_opaque;
    ssize_t v10 = *(char **)v9;
    if (!*(void *)v9)
    {
      *(void *)uint64_t v9 = v8;
      ssize_t v10 = v8;
    }
    unint64_t v11 = (unint64_t)&v8[a1[6]._os_unfair_lock_opaque];
    unint64_t os_unfair_lock_opaque = (int)a1->_os_unfair_lock_opaque;
    if (os_unfair_lock_opaque >= a4) {
      LODWORD(os_unfair_lock_opaque) = a4;
    }
    int v13 = os_unfair_lock_opaque + 37;
    if ((int)os_unfair_lock_opaque + 37 >= 1)
    {
      uint64_t v14 = *(char **)&a1[8]._os_unfair_lock_opaque;
      char v15 = 1;
      v16 = v10;
      while (1)
      {
        uint64_t v17 = v14 - v16;
        if (v14 < v16 || v14 == v9 && v14 == v16 && v16 == v8) {
          break;
        }
        if (v17 >= v13) {
          goto LABEL_24;
        }
        __int16 v19 = *(char **)v14;
        *(void *)&a1[8]._unint64_t os_unfair_lock_opaque = *(void *)v14;
        --a1[16]._os_unfair_lock_opaque;
        if (v14 <= v19)
        {
          LODWORD(v17) = v19 - v16;
          uint64_t v14 = v19;
LABEL_24:
          int v18 = v17;
LABEL_16:
          char v15 = 0;
          v13 -= v18;
          v16 += (int)v17;
          if ((unint64_t)v16 >= v11) {
            v16 = v8;
          }
          goto LABEL_18;
        }
        uint64_t v14 = v19;
LABEL_18:
        if (v13 <= 0) {
          goto LABEL_30;
        }
      }
      LODWORD(v17) = v11 - v16;
      if ((v15 & ((v11 - v16) < 0x25)) != 0) {
        int v18 = 0;
      }
      else {
        int v18 = v11 - v16;
      }
      goto LABEL_16;
    }
LABEL_30:
    if ((unint64_t)(v10 + 37) > v11)
    {
      *(void *)uint64_t v9 = v8;
      ssize_t v10 = v8;
    }
    *(timeval *)(v10 + 8) = v27;
    *((_DWORD *)v10 + 6) = a2;
    *(void *)(v10 + 28) = a4;
    uint64_t v23 = v10 + 36;
    int v24 = v11 - (v10 + 36);
    int v25 = os_unfair_lock_opaque - v24;
    if ((int)os_unfair_lock_opaque > v24)
    {
      memcpy(v10 + 36, a3, v24);
      a3 += v24;
      uint64_t v23 = *(char **)&a1[4]._os_unfair_lock_opaque;
      LODWORD(os_unfair_lock_opaque) = v25;
    }
    if (os_unfair_lock_opaque)
    {
      uint64_t v26 = (int)os_unfair_lock_opaque;
      memcpy(v23, a3, (int)os_unfair_lock_opaque);
      a2 = *((_DWORD *)v10 + 6);
    }
    else
    {
      uint64_t v26 = 0;
    }
    *(void *)ssize_t v10 = &v23[v26];
    *(void *)&a1[10]._unint64_t os_unfair_lock_opaque = v10;
    ++a1[16]._os_unfair_lock_opaque;
    if (a2 == 5) {
      *(void *)&a1[12]._unint64_t os_unfair_lock_opaque = v10;
    }
    os_unfair_lock_unlock(a1 + 20);
  }
  else
  {
    int v20 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Buffers not allocated", "NFHardwareSerialDebugLog", 274);
    }
    dispatch_get_specific(*v20);
    uint64_t v22 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v29 = "NFHardwareSerialDebugLog";
      __int16 v30 = 1024;
      int v31 = 274;
      _os_log_impl(&dword_2269FD000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Buffers not allocated", buf, 0x12u);
    }
  }
}

uint64_t NFHardwareInterfaceReadBlock(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v1 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 24);
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)a1 + 136);
    return v1(v2);
  }
  else
  {
    uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i No interface defined for reading", "NFHardwareInterfaceReadBlock", 356);
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v8 = "NFHardwareInterfaceReadBlock";
      __int16 v9 = 1024;
      int v10 = 356;
      _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for reading", buf, 0x12u);
    }
    return 1;
  }
}

BOOL NFHardwareGPIOSetDeviceWake(uint64_t *a1, unsigned int a2)
{
  uint64_t v4 = *(os_unfair_lock_s **)(*a1 + 16);
  if (a2) {
    int v5 = 7;
  }
  else {
    int v5 = 8;
  }
  NFHardwareSerialDebugLog(v4, v5, 0, 0);
  return sub_226A0B920(a1, 3u, a2) == 0;
}

uint64_t sub_226A01B24(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26ABD8440);
  uint64_t v2 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v4 = i;
    uint64_t v5 = *((void *)&unk_26ABD8440 + v2 + 1);
    if (v5)
    {
      if (*(void *)(v5 + 144) == a1) {
        break;
      }
    }
    uint64_t v2 = 1;
    if ((v4 & 1) == 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD8440);
      return 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD8440);
  return *((void *)&unk_26ABD8440 + v2 + 1);
}

void *phOsalNfc_GetMemory(int a1, size_t size)
{
  if (size) {
    return malloc_type_calloc(1uLL, size, 0xAC8762BEuLL);
  }
  else {
    return 0;
  }
}

void phOsalNfc_SignPostLogStr(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v7 = NFSharedMiddlewareSignpostLog();
  if (v7)
  {
    int v8 = v7;
    switch(a2)
    {
      case 1:
        BOOL v12 = os_signpost_enabled(v7);
        if (a3 == 3)
        {
          if (v12)
          {
            int v23 = 136446210;
            uint64_t v24 = a4;
            int v10 = "PHTMLNFC";
            uint64_t v11 = "%{public}s";
            goto LABEL_13;
          }
        }
        else if (v12)
        {
          uint64_t v21 = qword_2647C1C38[a3];
          int v23 = 136446466;
          uint64_t v24 = v21;
          __int16 v25 = 2082;
          uint64_t v26 = a4;
          int v10 = "PHTMLNFC";
          uint64_t v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 2:
        if (os_signpost_enabled(v7))
        {
          uint64_t v13 = qword_2647C1C38[a3];
          int v23 = 136446466;
          uint64_t v24 = v13;
          __int16 v25 = 2082;
          uint64_t v26 = a4;
          int v10 = "PHOSALNFC";
          uint64_t v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 3:
        BOOL v14 = os_signpost_enabled(v7);
        if (a3 == 3)
        {
          if (v14)
          {
            int v23 = 136446210;
            uint64_t v24 = a4;
            int v10 = "PHNCINFC";
            uint64_t v11 = "%{public}s";
LABEL_13:
            char v15 = v8;
            uint32_t v16 = 12;
            goto LABEL_27;
          }
        }
        else if (v14)
        {
          uint64_t v22 = qword_2647C1C38[a3];
          int v23 = 136446466;
          uint64_t v24 = v22;
          __int16 v25 = 2082;
          uint64_t v26 = a4;
          int v10 = "PHNCINFC";
          uint64_t v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 4:
      case 9:
      case 10:
        if (os_signpost_enabled(v7))
        {
          uint64_t v9 = qword_2647C1C38[a3];
          int v23 = 136446466;
          uint64_t v24 = v9;
          __int16 v25 = 2082;
          uint64_t v26 = a4;
          int v10 = "PHLIBNFC";
          uint64_t v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 5:
        if (os_signpost_enabled(v7))
        {
          uint64_t v17 = qword_2647C1C38[a3];
          int v23 = 136446466;
          uint64_t v24 = v17;
          __int16 v25 = 2082;
          uint64_t v26 = a4;
          int v10 = "PHLIBNFC_INFRA";
          uint64_t v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 6:
        if (os_signpost_enabled(v7))
        {
          uint64_t v18 = qword_2647C1C38[a3];
          int v23 = 136446466;
          uint64_t v24 = v18;
          __int16 v25 = 2082;
          uint64_t v26 = a4;
          int v10 = "PHLIBNFC_DNLD";
          uint64_t v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 7:
        if (os_signpost_enabled(v7))
        {
          uint64_t v19 = qword_2647C1C38[a3];
          int v23 = 136446466;
          uint64_t v24 = v19;
          __int16 v25 = 2082;
          uint64_t v26 = a4;
          int v10 = "PHLIBNFC_HCI";
          uint64_t v11 = "%{public}s%{public}s";
          goto LABEL_26;
        }
        break;
      case 8:
        if (os_signpost_enabled(v7))
        {
          uint64_t v20 = qword_2647C1C38[a3];
          int v23 = 136446466;
          uint64_t v24 = v20;
          __int16 v25 = 2082;
          uint64_t v26 = a4;
          int v10 = "PHLIBNFC_NDEF";
          uint64_t v11 = "%{public}s%{public}s";
LABEL_26:
          char v15 = v8;
          uint32_t v16 = 22;
LABEL_27:
          _os_signpost_emit_with_name_impl(&dword_2269FD000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v10, v11, (uint8_t *)&v23, v16);
        }
        break;
      default:
        return;
    }
  }
}

double phOsalNfc_SignPostLogFunc(unsigned int a1, int a2, const char *a3, char *a4, int a5)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (a1 <= 1) {
    unsigned int v9 = a1;
  }
  else {
    unsigned int v9 = 0;
  }
  int v10 = NFSharedMiddlewareSignpostLog();
  if (v10)
  {
    BOOL v12 = v10;
    uint64_t v13 = (int *)&byte_26ABD8478[264 * v9];
    int v14 = *v13;
    if (a5)
    {
      if (v14 == 2) {
        goto LABEL_9;
      }
      if (v14 != 1)
      {
        if (v14) {
          return result;
        }
LABEL_9:
        BOOL v15 = os_signpost_enabled(v10);
        if (a4)
        {
          if (v15)
          {
            int v51 = 136446722;
            uint64_t v52 = "+";
            __int16 v53 = 2082;
            uint64_t v54 = a3;
            __int16 v55 = 2082;
            uint64_t v56 = a4;
            uint32_t v16 = "%{public}s:%{public}s <- %{public}s";
            uint64_t v17 = v12;
            uint32_t v18 = 32;
LABEL_26:
            _os_signpost_emit_with_name_impl(&dword_2269FD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", v16, (uint8_t *)&v51, v18);
          }
        }
        else if (v15)
        {
          int v51 = 136446466;
          uint64_t v52 = "+";
          __int16 v53 = 2082;
          uint64_t v54 = a3;
          uint32_t v16 = "%{public}s:%{public}s";
          uint64_t v17 = v12;
          uint32_t v18 = 22;
          goto LABEL_26;
        }
        int *v13 = 1;
        byte_26ABD8478[264 * v9 + 4] = a2;
        __strlcpy_chk();
        return result;
      }
      BOOL v23 = os_signpost_enabled(v10);
      if (a4)
      {
        if (v23)
        {
          int v51 = 136446722;
          uint64_t v52 = "+";
          __int16 v53 = 2082;
          uint64_t v54 = a3;
          __int16 v55 = 2082;
          uint64_t v56 = a4;
          uint64_t v24 = "%{public}s:%{public}s <- %{public}s";
          __int16 v25 = v12;
          uint32_t v26 = 32;
LABEL_34:
          _os_signpost_emit_with_name_impl(&dword_2269FD000, v25, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API_NEW", v24, (uint8_t *)&v51, v26);
        }
      }
      else if (v23)
      {
        int v51 = 136446466;
        uint64_t v52 = "+";
        __int16 v53 = 2082;
        uint64_t v54 = a3;
        uint64_t v24 = "%{public}s:%{public}s";
        __int16 v25 = v12;
        uint32_t v26 = 22;
        goto LABEL_34;
      }
      int *v13 = 3;
      __int16 v43 = &byte_26ABD8478[264 * v9];
      v43[5] = a2;
      strlcpy(v43 + 134, a3, 0x80uLL);
      return result;
    }
    if (v14 != 3)
    {
      if (v14 != 1) {
        return result;
      }
      BOOL v19 = os_signpost_enabled(v10);
      if (a4)
      {
        if (v19)
        {
          int v51 = 136446722;
          uint64_t v52 = "-";
          __int16 v53 = 2082;
          uint64_t v54 = &byte_26ABD8478[264 * v9 + 6];
          __int16 v55 = 2082;
          uint64_t v56 = a4;
          uint64_t v20 = "%{public}s:%{public}s :%{public}s";
          uint64_t v21 = v12;
          uint32_t v22 = 32;
LABEL_38:
          _os_signpost_emit_with_name_impl(&dword_2269FD000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", v20, (uint8_t *)&v51, v22);
        }
      }
      else if (v19)
      {
        int v51 = 136446466;
        uint64_t v52 = "-";
        __int16 v53 = 2082;
        uint64_t v54 = &byte_26ABD8478[264 * v9 + 6];
        uint64_t v20 = "%{public}s:%{public}s";
        uint64_t v21 = v12;
        uint32_t v22 = 22;
        goto LABEL_38;
      }
      int *v13 = 2;
      byte_26ABD8478[264 * v9 + 4] = 0;
      return result;
    }
    uint64_t v27 = &byte_26ABD8478[264 * v9];
    int v30 = v27[5];
    uint64_t v29 = v27 + 5;
    int v28 = v30;
    if (v30 == a2)
    {
      BOOL v31 = os_signpost_enabled(v10);
      if (a4)
      {
        if (v31)
        {
          int v51 = 136446722;
          uint64_t v52 = "-";
          __int16 v53 = 2082;
          uint64_t v54 = &byte_26ABD8478[264 * v9 + 134];
          __int16 v55 = 2082;
          uint64_t v56 = a4;
          uint64_t v32 = "%{public}s:%{public}s :%{public}s";
          uint64_t v33 = v12;
          uint32_t v34 = 32;
LABEL_53:
          _os_signpost_emit_with_name_impl(&dword_2269FD000, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API_NEW", v32, (uint8_t *)&v51, v34);
        }
      }
      else if (v31)
      {
        int v51 = 136446466;
        uint64_t v52 = "-";
        __int16 v53 = 2082;
        uint64_t v54 = &byte_26ABD8478[264 * v9 + 134];
        uint64_t v32 = "%{public}s:%{public}s";
        uint64_t v33 = v12;
        uint32_t v34 = 22;
        goto LABEL_53;
      }
      int *v13 = 2;
      *uint64_t v29 = 0;
      return result;
    }
    uint64_t v35 = &byte_26ABD8478[264 * v9];
    int v38 = v35[4];
    __int16 v37 = v35 + 4;
    int v36 = v38;
    if (v38 == a2)
    {
      BOOL v39 = os_signpost_enabled(v10);
      if (a4)
      {
        if (v39)
        {
          int v51 = 136446722;
          uint64_t v52 = "-";
          __int16 v53 = 2082;
          uint64_t v54 = &byte_26ABD8478[264 * v9 + 6];
          __int16 v55 = 2082;
          uint64_t v56 = a4;
          __int16 v40 = "%{public}s:%{public}s :%{public}s";
          __int16 v41 = v12;
          uint32_t v42 = 32;
LABEL_63:
          _os_signpost_emit_with_name_impl(&dword_2269FD000, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", v40, (uint8_t *)&v51, v42);
        }
      }
      else if (v39)
      {
        int v51 = 136446466;
        uint64_t v52 = "-";
        __int16 v53 = 2082;
        uint64_t v54 = &byte_26ABD8478[264 * v9 + 6];
        __int16 v40 = "%{public}s:%{public}s";
        __int16 v41 = v12;
        uint32_t v42 = 22;
        goto LABEL_63;
      }
      *__int16 v37 = 0;
      return result;
    }
    if (v28) {
      BOOL v44 = v36 == 0;
    }
    else {
      BOOL v44 = 1;
    }
    if (v44)
    {
      if (v36)
      {
        if (v28) {
          goto LABEL_72;
        }
        if (os_signpost_enabled(v10))
        {
          int v51 = 136446722;
          uint64_t v52 = "-";
          __int16 v53 = 2082;
          uint64_t v54 = &byte_26ABD8478[264 * v9 + 6];
          __int16 v55 = 2082;
          uint64_t v56 = a4;
          _os_signpost_emit_with_name_impl(&dword_2269FD000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", "%{public}s:%{public}s :%{public}s", (uint8_t *)&v51, 0x20u);
        }
        if (!os_signpost_enabled(v12)) {
          goto LABEL_72;
        }
        int v51 = 136446722;
        uint64_t v52 = a3;
        __int16 v53 = 2082;
        uint64_t v54 = &byte_26ABD8478[264 * v9 + 6];
        __int16 v55 = 1026;
        LODWORD(v56) = a2;
        uint64_t v45 = "-: WARNING: %{public}s: Expected %{public}s eMWApi_Id{wrong}=%{public}d";
      }
      else
      {
        if (!v28) {
          goto LABEL_72;
        }
        if (os_signpost_enabled(v10))
        {
          int v51 = 136446722;
          uint64_t v52 = "-";
          __int16 v53 = 2082;
          uint64_t v54 = &byte_26ABD8478[264 * v9 + 134];
          __int16 v55 = 2082;
          uint64_t v56 = a4;
          _os_signpost_emit_with_name_impl(&dword_2269FD000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API_NEW", "%{public}s:%{public}s :%{public}s", (uint8_t *)&v51, 0x20u);
        }
        if (!os_signpost_enabled(v12)) {
          goto LABEL_72;
        }
        int v51 = 136446722;
        uint64_t v52 = a3;
        __int16 v53 = 2082;
        uint64_t v54 = &byte_26ABD8478[264 * v9 + 134];
        __int16 v55 = 1026;
        LODWORD(v56) = a2;
        uint64_t v45 = "-: WARNING: %{public}s: Expected %{public}s eMWApi{wrong}=%{public}d";
      }
      __int16 v48 = v12;
      uint32_t v49 = 28;
    }
    else
    {
      if (os_signpost_enabled(v10))
      {
        int v51 = 136446722;
        uint64_t v52 = "-";
        __int16 v53 = 2082;
        uint64_t v54 = &byte_26ABD8478[264 * v9 + 6];
        __int16 v55 = 2082;
        uint64_t v56 = a4;
        _os_signpost_emit_with_name_impl(&dword_2269FD000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API", "%{public}s:%{public}s :%{public}s", (uint8_t *)&v51, 0x20u);
      }
      if (os_signpost_enabled(v12))
      {
        int v51 = 136446722;
        uint64_t v52 = "-";
        __int16 v53 = 2082;
        uint64_t v54 = &byte_26ABD8478[264 * v9 + 134];
        __int16 v55 = 2082;
        uint64_t v56 = a4;
        _os_signpost_emit_with_name_impl(&dword_2269FD000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PHLIBNFC_API_NEW", "%{public}s:%{public}s :%{public}s", (uint8_t *)&v51, 0x20u);
      }
      if (!os_signpost_enabled(v12)) {
        goto LABEL_72;
      }
      int v51 = 136446978;
      int v47 = &byte_26ABD8478[264 * v9];
      uint64_t v52 = a3;
      __int16 v53 = 2082;
      uint64_t v54 = v47 + 134;
      __int16 v55 = 2082;
      uint64_t v56 = v47 + 6;
      __int16 v57 = 1026;
      int v58 = a2;
      uint64_t v45 = "-: WARNING: %{public}s: Expected %{public}s OR %{public}s eMWApi{wrong}=%{public}d";
      __int16 v48 = v12;
      uint32_t v49 = 38;
    }
    _os_signpost_emit_with_name_impl(&dword_2269FD000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LIBNFC", v45, (uint8_t *)&v51, v49);
LABEL_72:
    int *v13 = 0;
    *__int16 v37 = 0;
    *uint64_t v29 = 0;
    uint64_t v50 = &byte_26ABD8478[264 * v9];
    double result = 0.0;
    *(_OWORD *)(v50 + 6) = 0u;
    *(_OWORD *)(v50 + 22) = 0u;
    *(_OWORD *)(v50 + 38) = 0u;
    *(_OWORD *)(v50 + 54) = 0u;
    *(_OWORD *)(v50 + 70) = 0u;
    *(_OWORD *)(v50 + 86) = 0u;
    *(_OWORD *)(v50 + 102) = 0u;
    *(_OWORD *)(v50 + 118) = 0u;
    *(_OWORD *)(v50 + 134) = 0u;
    *(_OWORD *)(v50 + 150) = 0u;
    *(_OWORD *)(v50 + 166) = 0u;
    *(_OWORD *)(v50 + 182) = 0u;
    *(_OWORD *)(v50 + 198) = 0u;
    *(_OWORD *)(v50 + 214) = 0u;
    *(_OWORD *)(v50 + 230) = 0u;
    *(_OWORD *)(v50 + 246) = 0u;
  }
  return result;
}

uint64_t phTmlNfc_Init(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v35 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_Init", 144, "pConfig!=((void *)0)");
    }
    dispatch_get_specific(*v35);
    __int16 v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136446722;
    int v47 = "phTmlNfc_Init";
    __int16 v48 = 1024;
    int v49 = 144;
    __int16 v50 = 2080;
    int v51 = "pConfig!=((void *)0)";
    goto LABEL_80;
  }
  if (!*(void *)a1 && !*(void *)(a1 + 8))
  {
    uint32_t v42 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v43 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v43) {
      v43(3, "%s:%i FAILED: %s", "phTmlNfc_Init", 145, "pConfig->pDevNameHsu || pConfig->pDevNameSpmi");
    }
    dispatch_get_specific(*v42);
    __int16 v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136446722;
    int v47 = "phTmlNfc_Init";
    __int16 v48 = 1024;
    int v49 = 145;
    __int16 v50 = 2080;
    int v51 = "pConfig->pDevNameHsu || pConfig->pDevNameSpmi";
    goto LABEL_80;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    int v38 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    BOOL v39 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v39) {
      v39(3, "%s:%i FAILED: %s", "phTmlNfc_Init", 146, "pConfig->pContext");
    }
    dispatch_get_specific(*v38);
    __int16 v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136446722;
    int v47 = "phTmlNfc_Init";
    __int16 v48 = 1024;
    int v49 = 146;
    __int16 v50 = 2080;
    int v51 = "pConfig->pContext";
    goto LABEL_80;
  }
  if (!a2)
  {
    __int16 v40 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v41 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v41) {
      v41(3, "%s:%i FAILED: %s", "phTmlNfc_Init", 147, "pHwRef!=((void *)0)");
    }
    dispatch_get_specific(*v40);
    __int16 v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136446722;
    int v47 = "phTmlNfc_Init";
    __int16 v48 = 1024;
    int v49 = 147;
    __int16 v50 = 2080;
    int v51 = "pHwRef!=((void *)0)";
    goto LABEL_80;
  }
  if (*(unsigned char *)(a1 + 40) == 6) {
    uint64_t v5 = *(char **)(a1 + 16);
  }
  else {
    uint64_t v5 = 0;
  }
  int v6 = *(char **)(a1 + 8 * (*(unsigned char *)(a1 + 40) == 6));
  uint64_t v7 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  int v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8) {
    v8(6, "%s:%i devName: %s  auxDevName: %s", "phTmlNfc_Init", 159, v6, v5);
  }
  dispatch_get_specific(*v7);
  unsigned int v9 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    int v47 = "phTmlNfc_Init";
    __int16 v48 = 1024;
    int v49 = 159;
    __int16 v50 = 2080;
    int v51 = v6;
    __int16 v52 = 2080;
    __int16 v53 = v5;
    _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%i devName: %s  auxDevName: %s", buf, 0x26u);
  }
  int IsSupported = NFHardwareInterfaceIsSupported(v6);
  if (!IsSupported) {
    return 51;
  }
  if (IsSupported < 0) {
    return 255;
  }
  if (!v5)
  {
LABEL_18:
    os_unfair_lock_lock((os_unfair_lock_t)&unk_26ABD8440);
    uint64_t v12 = 0;
    int v13 = *(_DWORD *)(a1 + 24);
    char v14 = 1;
    while (1)
    {
      BOOL v15 = (char *)&unk_26ABD8440 + 8 * v12;
      if (!*((void *)v15 + 1)) {
        break;
      }
      char v16 = v14;
      char v14 = 0;
      uint64_t v12 = 1;
      if ((v16 & 1) == 0)
      {
        dispatch_get_specific(*v7);
        uint64_t v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v17) {
          v17(3, "%s:%i Failed to allocate TML context - no space available.", "_phTmlNfc_CreateTMLContext", 123);
        }
        dispatch_get_specific(*v7);
        uint32_t v18 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          int v47 = "_phTmlNfc_CreateTMLContext";
          __int16 v48 = 1024;
          int v49 = 123;
          _os_log_impl(&dword_2269FD000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate TML context - no space available.", buf, 0x12u);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD8440);
        dispatch_get_specific(*v7);
        BOOL v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v19) {
          v19(3, "%s:%i Failed to create TML context !", "phTmlNfc_Init", 188);
        }
        dispatch_get_specific(*v7);
        uint64_t v20 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          int v47 = "phTmlNfc_Init";
          __int16 v48 = 1024;
          int v49 = 188;
          uint64_t v21 = "%{public}s:%i Failed to create TML context !";
          uint32_t v22 = v20;
          uint32_t v23 = 18;
          goto LABEL_53;
        }
        return 255;
      }
    }
    uint64_t v24 = (char *)malloc_type_calloc(1uLL, 0xA0uLL, 0xAC8762BEuLL);
    *(_OWORD *)uint64_t v24 = 0u;
    *((_OWORD *)v24 + 1) = 0u;
    *((_OWORD *)v24 + 2) = 0u;
    *((_OWORD *)v24 + 3) = 0u;
    *((_OWORD *)v24 + 4) = 0u;
    *((_OWORD *)v24 + 5) = 0u;
    *((_OWORD *)v24 + 6) = 0u;
    *((_OWORD *)v24 + 7) = 0u;
    *((_OWORD *)v24 + 8) = 0u;
    *((_OWORD *)v24 + 9) = 0u;
    *((_DWORD *)v24 + 38) = v13;
    *((void *)v24 + 18) = (v13 + 1);
    *((void *)v15 + 1) = v24;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD8440);
    pthread_mutex_init((pthread_mutex_t *)(v24 + 40), 0);
    *((_DWORD *)v24 + 8) = 0;
    if (!pthread_mutex_lock((pthread_mutex_t *)(v24 + 40)))
    {
      ++*((_DWORD *)v24 + 8);
      if (!pthread_mutex_unlock((pthread_mutex_t *)(v24 + 40)))
      {
        v24[2] = 0;
        *((void *)v24 + 1) = 0;
        *((void *)v24 + 2) = 0;
        __int16 v25 = *(NSObject **)v4;
        if (*(void *)v4)
        {
          *((void *)v24 + 3) = v25;
          dispatch_retain(v25);
          v24[104] = *(unsigned char *)(v4 + 16);
          v24[105] = *(unsigned char *)(v4 + 18);
          uint32_t v26 = NFHardwareInterfaceOpen(v6, *((NSObject **)v24 + 3));
          *((void *)v24 + 14) = v26;
          if (v26)
          {
            uint64_t v27 = *(void (**)(void, void))(*v26 + 88);
            if (v27) {
              v27(*(void *)(*v26 + 136), *(void *)(v4 + 8));
            }
            if (!v5) {
              goto LABEL_40;
            }
            int v28 = NFHardwareInterfaceOpen(v5, *((NSObject **)v24 + 3));
            *((void *)v24 + 16) = v28;
            if (v28)
            {
              uint64_t v29 = *(void (**)(void, void))(*v28 + 88);
              if (v29) {
                v29(*(void *)(*v28 + 136), *(void *)(v4 + 8));
              }
              v24[121] = 1;
LABEL_40:
              if (*(_DWORD *)(a1 + 24) == 1) {
                v24[120] = 1;
              }
              uint64_t result = 0;
              *(_WORD *)uint64_t v24 = 1;
              *a2 = *((void *)v24 + 18);
              return result;
            }
          }
        }
        phTmlNfc_Shutdown(*((void *)v24 + 18));
        return 255;
      }
      dispatch_get_specific(*v7);
      uint64_t v45 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v45) {
        v45(3, "%s:%i FAILED: %s", "retainTML", 264, "!status");
      }
      dispatch_get_specific(*v7);
      __int16 v37 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        int v47 = "retainTML";
        __int16 v48 = 1024;
        int v49 = 264;
        __int16 v50 = 2080;
        int v51 = "!status";
        goto LABEL_80;
      }
LABEL_81:
      abort();
    }
    dispatch_get_specific(*v7);
    BOOL v44 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v44) {
      v44(3, "%s:%i FAILED: %s", "retainTML", 259, "!status");
    }
    dispatch_get_specific(*v7);
    __int16 v37 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136446722;
    int v47 = "retainTML";
    __int16 v48 = 1024;
    int v49 = 259;
    __int16 v50 = 2080;
    int v51 = "!status";
LABEL_80:
    _os_log_impl(&dword_2269FD000, v37, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    goto LABEL_81;
  }
  int v11 = NFHardwareInterfaceIsSupported(v5);
  if (!v11)
  {
    dispatch_get_specific(*v7);
    BOOL v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31) {
      v31(3, "%s:%i Interface %s is not supported?!", "phTmlNfc_Init", 175, v5);
    }
    dispatch_get_specific(*v7);
    uint64_t v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v47 = "phTmlNfc_Init";
      __int16 v48 = 1024;
      int v49 = 175;
      __int16 v50 = 2080;
      int v51 = v5;
      _os_log_impl(&dword_2269FD000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Interface %s is not supported?!", buf, 0x1Cu);
    }
    return 51;
  }
  if ((v11 & 0x80000000) == 0) {
    goto LABEL_18;
  }
  dispatch_get_specific(*v7);
  uint64_t v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v33) {
    v33(3, "%s:%i Error detecting interface %s", "phTmlNfc_Init", 178, v5);
  }
  dispatch_get_specific(*v7);
  uint32_t v34 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    int v47 = "phTmlNfc_Init";
    __int16 v48 = 1024;
    int v49 = 178;
    __int16 v50 = 2080;
    int v51 = v5;
    uint64_t v21 = "%{public}s:%i Error detecting interface %s";
    uint32_t v22 = v34;
    uint32_t v23 = 28;
LABEL_53:
    _os_log_impl(&dword_2269FD000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
  }
  return 255;
}

uint64_t phTmlNfc_Shutdown(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v1 = (_DWORD *)sub_226A01B24(a1);
  uint64_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v1)
  {
    if (Logger) {
      Logger(6, "%s:%i ", "phTmlNfc_Shutdown", 307);
    }
    dispatch_get_specific(*v2);
    uint64_t v4 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__sig) = 136446466;
      *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)"phTmlNfc_Shutdown";
      *(_WORD *)&buf.__opaque[4] = 1024;
      *(_DWORD *)&buf.__opaque[6] = 307;
      _os_log_impl(&dword_2269FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", (uint8_t *)&buf, 0x12u);
    }
    *(unsigned char *)v1 = 0;
    if (*((unsigned char *)v1 + 120))
    {
      if (*((unsigned char *)v1 + 136))
      {
        uint64_t v5 = **((void **)v1 + 14);
        int v6 = *(void (**)(void, uint64_t))(v5 + 112);
        if (v6) {
          v6(*(void *)(v5 + 136), 1);
        }
      }
    }
    uint64_t v7 = (void **)*((void *)v1 + 14);
    if (v7)
    {
      NFHardwareInterfaceClose(v7);
      *((void *)v1 + 14) = 0;
    }
    int v8 = (void **)*((void *)v1 + 16);
    if (v8)
    {
      NFHardwareInterfaceClose(v8);
      *((void *)v1 + 16) = 0;
    }
    if (pthread_mutex_lock((pthread_mutex_t *)(v1 + 10)))
    {
      dispatch_get_specific(*v2);
      uint32_t v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v26) {
        v26(3, "%s:%i FAILED: %s", "releaseTML", 272, "!status");
      }
      dispatch_get_specific(*v2);
      char v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__sig) = 136446722;
        *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)"releaseTML";
        *(_WORD *)&buf.__opaque[4] = 1024;
        *(_DWORD *)&buf.__opaque[6] = 272;
        *(_WORD *)&buf.__opaque[10] = 2080;
        *(void *)&buf.__opaque[12] = "!status";
        goto LABEL_44;
      }
LABEL_46:
      abort();
    }
    int v9 = v1[8];
    BOOL v10 = __OFSUB__(v9, 1);
    int v11 = v9 - 1;
    if (v11 < 0 != v10 || (v1[8] = v11) != 0)
    {
      uint64_t result = pthread_mutex_unlock((pthread_mutex_t *)(v1 + 10));
      if (result)
      {
        dispatch_get_specific(*v2);
        int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v13) {
          v13(3, "%s:%i FAILED: %s", "releaseTML", 298, "!status");
        }
        dispatch_get_specific(*v2);
        char v14 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.__sig) = 136446722;
          *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)"releaseTML";
          *(_WORD *)&buf.__opaque[4] = 1024;
          *(_DWORD *)&buf.__opaque[6] = 298;
          *(_WORD *)&buf.__opaque[10] = 2080;
          *(void *)&buf.__opaque[12] = "!status";
LABEL_44:
          p_pthread_mutex_t buf = (uint8_t *)&buf;
LABEL_45:
          _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", p_buf, 0x1Cu);
          goto LABEL_46;
        }
        goto LABEL_46;
      }
    }
    else
    {
      long long v16 = *(_OWORD *)(v1 + 10);
      long long v17 = *(_OWORD *)(v1 + 14);
      long long v18 = *(_OWORD *)(v1 + 22);
      *(_OWORD *)&buf.__opaque[24] = *(_OWORD *)(v1 + 18);
      *(_OWORD *)&buf.__opaque[40] = v18;
      *(_OWORD *)&buf.__sig = v16;
      *(_OWORD *)&buf.__opaque[8] = v17;
      BOOL v19 = *((void *)v1 + 3);
      if (v19)
      {
        dispatch_release(v19);
        *((void *)v1 + 3) = 0;
      }
      os_unfair_lock_lock((os_unfair_lock_t)&unk_26ABD8440);
      uint64_t v20 = 0;
      char v21 = 1;
      do
      {
        uint32_t v22 = (char *)&unk_26ABD8440 + 8 * v20;
        if (*((_DWORD **)v22 + 1) == v1)
        {
          free(v1);
          *((void *)v22 + 1) = 0;
          goto LABEL_37;
        }
        char v23 = v21;
        char v21 = 0;
        uint64_t v20 = 1;
      }
      while ((v23 & 1) != 0);
      dispatch_get_specific(*v2);
      uint64_t v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v24) {
        v24(3, "%s:%i Failed to release TML context - not found", "_phTmlNfc_FreeTMLContext", 138);
      }
      dispatch_get_specific(*v2);
      __int16 v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v29 = 136446466;
        int v30 = "_phTmlNfc_FreeTMLContext";
        __int16 v31 = 1024;
        int v32 = 138;
        _os_log_impl(&dword_2269FD000, v25, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to release TML context - not found", v29, 0x12u);
      }
LABEL_37:
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD8440);
      if (pthread_mutex_unlock(&buf))
      {
        dispatch_get_specific(*v2);
        int v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v28) {
          v28(3, "%s:%i FAILED: %s", "releaseTML", 290, "!status");
        }
        dispatch_get_specific(*v2);
        char v14 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v29 = 136446722;
          int v30 = "releaseTML";
          __int16 v31 = 1024;
          int v32 = 290;
          __int16 v33 = 2080;
          uint32_t v34 = "!status";
          p_pthread_mutex_t buf = v29;
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      pthread_mutex_destroy(&buf);
      return 0;
    }
  }
  else
  {
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_Shutdown", 305, "tml!=NULL");
    }
    dispatch_get_specific(*v2);
    BOOL v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__sig) = 136446722;
      *(uint64_t *)((char *)&buf.__sig + 4) = (uint64_t)"phTmlNfc_Shutdown";
      *(_WORD *)&buf.__opaque[4] = 1024;
      *(_DWORD *)&buf.__opaque[6] = 305;
      *(_WORD *)&buf.__opaque[10] = 2080;
      *(void *)&buf.__opaque[12] = "tml!=NULL";
      _os_log_impl(&dword_2269FD000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", (uint8_t *)&buf, 0x1Cu);
    }
    return 49;
  }
  return result;
}

void *sub_226A03828(void *result, unsigned __int16 a2, int a3)
{
  if (a3) {
    unsigned __int16 v3 = 0;
  }
  else {
    unsigned __int16 v3 = 255;
  }
  uint64_t v8 = 0;
  uint64_t v7 = v3;
  uint64_t v5 = result[4];
  uint64_t v4 = (unsigned char *)result[5];
  HIDWORD(v7) = v4[120];
  uint64_t v8 = v5;
  uint64_t v9 = a2;
  if (*v4)
  {
    int v6 = (uint64_t (*)(void, uint64_t *))result[6];
    if (v6) {
      return (void *)v6(result[7], &v7);
    }
  }
  return result;
}

uint64_t phTmlNfc_WriteAbort(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_226A01B24(a1);
  if (!v1)
  {
    int v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_WriteAbort", 525, "tml!=NULL");
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v12 = "phTmlNfc_WriteAbort";
    __int16 v13 = 1024;
    int v14 = 525;
    __int16 v15 = 2080;
    long long v16 = "tml!=NULL";
    goto LABEL_15;
  }
  uint64_t v2 = *(uint64_t **)(v1 + 112);
  if (!v2)
  {
    uint64_t v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    BOOL v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v10) {
      v10(3, "%s:%i FAILED: %s", "phTmlNfc_WriteAbort", 526, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v9);
    uint64_t v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v12 = "phTmlNfc_WriteAbort";
    __int16 v13 = 1024;
    int v14 = 526;
    __int16 v15 = 2080;
    long long v16 = "tml->ifc!=NULL";
LABEL_15:
    _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  uint64_t v3 = *v2;
  uint64_t v4 = *(unsigned int (**)(void))(*v2 + 64);
  if (v4 && v4(*(void *)(v3 + 136))) {
    return 255;
  }
  else {
    return 0;
  }
}

uint64_t phTmlNfc_ReadAbort(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_226A01B24(a1);
  if (!v1)
  {
    uint64_t v7 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_ReadAbort", 610, "tml!=NULL");
    }
    dispatch_get_specific(*v7);
    uint64_t v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v20 = "phTmlNfc_ReadAbort";
    __int16 v21 = 1024;
    int v22 = 610;
    __int16 v23 = 2080;
    *(void *)uint64_t v24 = "tml!=NULL";
    goto LABEL_21;
  }
  uint64_t v2 = v1;
  uint64_t v3 = *(uint64_t **)(v1 + 112);
  if (!v3)
  {
    long long v16 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v17) {
      v17(3, "%s:%i FAILED: %s", "phTmlNfc_ReadAbort", 611, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v16);
    uint64_t v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v20 = "phTmlNfc_ReadAbort";
    __int16 v21 = 1024;
    int v22 = 611;
    __int16 v23 = 2080;
    *(void *)uint64_t v24 = "tml->ifc!=NULL";
LABEL_21:
    _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  uint64_t v4 = *v3;
  uint64_t v5 = *(unsigned int (**)(void))(*v3 + 56);
  if (v5 && v5(*(void *)(v4 + 136))) {
    uint64_t v6 = 255;
  }
  else {
    uint64_t v6 = 0;
  }
  if (NFIsInternalBuild())
  {
    BOOL v10 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v11) {
      v11(6, "%s:%i Debug : Pending read %d, read cb = %p, context = %p", "phTmlNfc_ReadAbort", 616, *(unsigned __int8 *)(v2 + 2), *(const void **)(v2 + 8), *(const void **)(v2 + 16));
    }
    dispatch_get_specific(*v10);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *(unsigned __int8 *)(v2 + 2);
      uint64_t v14 = *(void *)(v2 + 8);
      uint64_t v15 = *(void *)(v2 + 16);
      *(_DWORD *)pthread_mutex_t buf = 136447234;
      uint64_t v20 = "phTmlNfc_ReadAbort";
      __int16 v21 = 1024;
      int v22 = 616;
      __int16 v23 = 1024;
      *(_DWORD *)uint64_t v24 = v13;
      *(_WORD *)&v24[4] = 2048;
      *(void *)&v24[6] = v14;
      __int16 v25 = 2048;
      uint64_t v26 = v15;
      _os_log_impl(&dword_2269FD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Debug : Pending read %d, read cb = %p, context = %p", buf, 0x2Cu);
    }
    *(unsigned char *)(v2 + 2) = 0;
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
  }
  return v6;
}

uint64_t phTmlNfc_FlushTxRxBuffers(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_226A01B24(a1);
  if (!v1)
  {
    uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_FlushTxRxBuffers", 708, "tml!=NULL");
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v12 = "phTmlNfc_FlushTxRxBuffers";
    __int16 v13 = 1024;
    int v14 = 708;
    __int16 v15 = 2080;
    long long v16 = "tml!=NULL";
    goto LABEL_14;
  }
  uint64_t v2 = *(uint64_t **)(v1 + 112);
  if (!v2)
  {
    uint64_t v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    BOOL v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v10) {
      v10(3, "%s:%i FAILED: %s", "phTmlNfc_FlushTxRxBuffers", 709, "tml->ifc");
    }
    dispatch_get_specific(*v9);
    uint64_t v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v12 = "phTmlNfc_FlushTxRxBuffers";
    __int16 v13 = 1024;
    int v14 = 709;
    __int16 v15 = 2080;
    long long v16 = "tml->ifc";
LABEL_14:
    _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  uint64_t v3 = *v2;
  uint64_t v4 = *(unsigned int (**)(void))(*v2 + 72);
  if (v4 && !v4(*(void *)(v3 + 136))) {
    return 255;
  }
  else {
    return 0;
  }
}

uint64_t sub_226A03F7C(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226A01B24(a1);
  if (!v3)
  {
    int v14 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetPower", 632, "tml!=NULL");
    }
    dispatch_get_specific(*v14);
    long long v16 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v20 = "_phTmlNfc_SetPower";
    __int16 v21 = 1024;
    int v22 = 632;
    __int16 v23 = 2080;
    uint64_t v24 = "tml!=NULL";
    goto LABEL_21;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(uint64_t **)(v3 + 112);
  if (!v5)
  {
    uint64_t v17 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    long long v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18) {
      v18(3, "%s:%i FAILED: %s", "_phTmlNfc_SetPower", 633, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v17);
    long long v16 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v20 = "_phTmlNfc_SetPower";
    __int16 v21 = 1024;
    int v22 = 633;
    __int16 v23 = 2080;
    uint64_t v24 = "tml->ifc!=NULL";
LABEL_21:
    _os_log_impl(&dword_2269FD000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  int v6 = a2 != 0;
  uint64_t v7 = *v5;
  uint64_t v8 = *(uint64_t (**)(void, BOOL))(*v5 + 152);
  if (v8)
  {
    int v9 = v8(*(void *)(v7 + 240), a2 != 0);
    int v6 = a2 ? v9 : 0;
    if (!v9) {
      return 255;
    }
  }
  if (v6)
  {
    BOOL v10 = *(uint64_t **)(v4 + 112);
    if (v10)
    {
      uint64_t v11 = *v10;
      uint64_t v12 = *(void (**)(void))(*v10 + 72);
      if (v12) {
        v12(*(void *)(v11 + 136));
      }
    }
  }
  return 0;
}

uint64_t sub_226A041B0(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226A01B24(a1);
  if (!v3)
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetDownload", 674, "tml!=NULL");
    }
    dispatch_get_specific(*v8);
    BOOL v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    int v14 = "_phTmlNfc_SetDownload";
    __int16 v15 = 1024;
    int v16 = 674;
    __int16 v17 = 2080;
    long long v18 = "tml!=NULL";
    goto LABEL_14;
  }
  uint64_t v4 = *(uint64_t **)(v3 + 112);
  if (!v4)
  {
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(3, "%s:%i FAILED: %s", "_phTmlNfc_SetDownload", 675, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v11);
    BOOL v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    int v14 = "_phTmlNfc_SetDownload";
    __int16 v15 = 1024;
    int v16 = 675;
    __int16 v17 = 2080;
    long long v18 = "tml->ifc!=NULL";
LABEL_14:
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  uint64_t v5 = *v4;
  int v6 = *(unsigned int (**)(void, BOOL))(*v4 + 176);
  if (v6 && !v6(*(void *)(v5 + 240), a2 != 0)) {
    return 255;
  }
  else {
    return 0;
  }
}

uint64_t sub_226A043B0(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226A01B24(a1);
  if (!v3)
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetPMUStandbyEnabled", 647, "tml!=NULL");
    }
    dispatch_get_specific(*v8);
    BOOL v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    int v14 = "_phTmlNfc_SetPMUStandbyEnabled";
    __int16 v15 = 1024;
    int v16 = 647;
    __int16 v17 = 2080;
    long long v18 = "tml!=NULL";
    goto LABEL_14;
  }
  uint64_t v4 = *(uint64_t **)(v3 + 112);
  if (!v4)
  {
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(3, "%s:%i FAILED: %s", "_phTmlNfc_SetPMUStandbyEnabled", 648, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v11);
    BOOL v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    int v14 = "_phTmlNfc_SetPMUStandbyEnabled";
    __int16 v15 = 1024;
    int v16 = 648;
    __int16 v17 = 2080;
    long long v18 = "tml->ifc!=NULL";
LABEL_14:
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  uint64_t v5 = *v4;
  int v6 = *(unsigned int (**)(void, BOOL))(*v4 + 160);
  if (v6 && !v6(*(void *)(v5 + 240), a2 != 0)) {
    return 255;
  }
  else {
    return 0;
  }
}

uint64_t sub_226A045B0(uint64_t a1, int a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226A01B24(a1);
  if (!v3)
  {
    int v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetDeviceWake", 684, "tml!=NULL");
    }
    dispatch_get_specific(*v9);
    uint64_t v11 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v24 = "_phTmlNfc_SetDeviceWake";
    __int16 v25 = 1024;
    int v26 = 684;
    __int16 v27 = 2080;
    int v28 = "tml!=NULL";
    goto LABEL_14;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(uint64_t **)(v3 + 112);
  if (!v5)
  {
    uint64_t v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i FAILED: %s", "_phTmlNfc_SetDeviceWake", 685, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v12);
    uint64_t v11 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v24 = "_phTmlNfc_SetDeviceWake";
    __int16 v25 = 1024;
    int v26 = 685;
    __int16 v27 = 2080;
    int v28 = "tml->ifc!=NULL";
LABEL_14:
    _os_log_impl(&dword_2269FD000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  uint64_t v6 = *v5;
  uint64_t v7 = *(uint64_t (**)(void, BOOL))(*v5 + 144);
  if (v7 && (v7(*(void *)(v6 + 240), a2 != 0) & 1) == 0)
  {
    uint64_t v15 = **(void **)(v4 + 112);
    int v16 = *(uint64_t (**)(void))(v15 + 216);
    uint64_t v8 = 255;
    if (v16)
    {
      int v17 = v16(*(void *)(v15 + 240));
      if (v17) {
        uint64_t v8 = 179;
      }
      else {
        uint64_t v8 = 255;
      }
    }
    else
    {
      int v17 = 0;
    }
    long long v18 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19) {
      v19(3, "%s:%i Failed to set device wake. NACK = %d", "_phTmlNfc_SetDeviceWake", 691, v17);
    }
    dispatch_get_specific(*v18);
    uint64_t v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v24 = "_phTmlNfc_SetDeviceWake";
      __int16 v25 = 1024;
      int v26 = 691;
      __int16 v27 = 1024;
      LODWORD(v28) = v17;
      _os_log_impl(&dword_2269FD000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to set device wake. NACK = %d", buf, 0x18u);
    }
    char v21 = v17 ^ 1;
    if (!a2) {
      char v21 = 1;
    }
    if ((v21 & 1) == 0)
    {
      int v22 = *(_DWORD *)(v4 + 156);
      *(_DWORD *)(v4 + 156) = v22 + 1;
      if (v22 >= 11)
      {
        NFHardwareSerialDebugDump();
        phOsalNfc_RaiseExceptionWithDescription(2, 0xDEADu);
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    *(_DWORD *)(v4 + 156) = 0;
  }
  return v8;
}

uint64_t sub_226A048E8(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226A01B24(a1);
  if (!v3)
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "_phTmlNfc_SetCRCEnable", 761, "tml!=NULL");
    }
    dispatch_get_specific(*v8);
    BOOL v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    int v14 = "_phTmlNfc_SetCRCEnable";
    __int16 v15 = 1024;
    int v16 = 761;
    __int16 v17 = 2080;
    long long v18 = "tml!=NULL";
    goto LABEL_14;
  }
  uint64_t v4 = *(uint64_t **)(v3 + 112);
  if (!v4)
  {
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(3, "%s:%i FAILED: %s", "_phTmlNfc_SetCRCEnable", 762, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v11);
    BOOL v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    int v14 = "_phTmlNfc_SetCRCEnable";
    __int16 v15 = 1024;
    int v16 = 762;
    __int16 v17 = 2080;
    long long v18 = "tml->ifc!=NULL";
LABEL_14:
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  uint64_t v5 = *v4;
  uint64_t v6 = *(unsigned int (**)(void, BOOL))(*v4 + 104);
  if (v6 && !v6(*(void *)(v5 + 136), a2 != 0)) {
    return 255;
  }
  else {
    return 0;
  }
}

uint64_t phTmlNfc_ConfigHsuBaudRate(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226A01B24(a1);
  if (!v3)
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_ConfigHsuBaudRate", 1099, "tml!=NULL");
    }
    dispatch_get_specific(*v8);
    BOOL v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    __int16 v17 = "phTmlNfc_ConfigHsuBaudRate";
    __int16 v18 = 1024;
    int v19 = 1099;
    __int16 v20 = 2080;
    char v21 = "tml!=NULL";
    goto LABEL_15;
  }
  uint64_t v4 = *(uint64_t **)(v3 + 112);
  if (!v4)
  {
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(3, "%s:%i FAILED: %s", "phTmlNfc_ConfigHsuBaudRate", 1100, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v11);
    BOOL v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    __int16 v17 = "phTmlNfc_ConfigHsuBaudRate";
    __int16 v18 = 1024;
    int v19 = 1100;
    __int16 v20 = 2080;
    char v21 = "tml->ifc!=NULL";
LABEL_15:
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  if ((a2 - 1) >= 9)
  {
    __int16 v13 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14) {
      v14(3, "%s:%i Invalid input baud rate", "phTmlNfc_ConfigHsuBaudRate", 1115);
    }
    dispatch_get_specific(*v13);
    __int16 v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v17 = "phTmlNfc_ConfigHsuBaudRate";
      __int16 v18 = 1024;
      int v19 = 1115;
      _os_log_impl(&dword_2269FD000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid input baud rate", buf, 0x12u);
    }
    return 1;
  }
  else
  {
    uint64_t v5 = *v4;
    uint64_t v6 = *(unsigned int (**)(void, void))(*v4 + 8);
    if (v6 && !v6(*(void *)(v5 + 136), qword_226A15FA8[a2 - 1])) {
      return 255;
    }
    else {
      return 0;
    }
  }
}

uint64_t phTmlNfc_GetHsuMaxBaudRate(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2 >= 2)
  {
    uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Invalid mode parameter", "phTmlNfc_GetHsuMaxBaudRate", 1132);
    }
    dispatch_get_specific(*v4);
    uint64_t v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v8 = "phTmlNfc_GetHsuMaxBaudRate";
      __int16 v9 = 1024;
      int v10 = 1132;
      _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid mode parameter", buf, 0x12u);
    }
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *a3 = 5;
  }
  return result;
}

uint64_t phTmlNfc_SpmiDrvErrorStatus(uint64_t a1, unsigned char *a2, int a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_226A01B24(a1);
  memset(v40, 0, sizeof(v40));
  unint64_t v32 = 64;
  if (!v5)
  {
    uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_SpmiDrvErrorStatus", 1147, "tml!=NULL");
    }
    dispatch_get_specific(*v8);
    int v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint32_t v34 = "phTmlNfc_SpmiDrvErrorStatus";
    __int16 v35 = 1024;
    int v36 = 1147;
    __int16 v37 = 2080;
    *(void *)int v38 = "tml!=NULL";
    goto LABEL_13;
  }
  uint64_t v6 = *(uint64_t **)(v5 + 112);
  if (!v6)
  {
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(3, "%s:%i FAILED: %s", "phTmlNfc_SpmiDrvErrorStatus", 1148, "tml->ifc!=NULL");
    }
    dispatch_get_specific(*v11);
    int v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint32_t v34 = "phTmlNfc_SpmiDrvErrorStatus";
    __int16 v35 = 1024;
    int v36 = 1148;
    __int16 v37 = 2080;
    *(void *)int v38 = "tml->ifc!=NULL";
LABEL_13:
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  if (a3) {
    return 0;
  }
  uint64_t v13 = *v6;
  int v14 = *(unsigned int (**)(void, _OWORD *, unint64_t *, void))(*v6 + 120);
  if (v14 && v14(*(void *)(v13 + 136), v40, &v32, a2[5]))
  {
    if (v32 < 3) {
      return 0;
    }
    uint64_t v15 = 0;
    int v16 = (const void **)MEMORY[0x263F8C6C0];
    do
    {
      uint64_t result = 0;
      __int16 v17 = a2;
      switch(*((unsigned char *)v40 + v15))
      {
        case 0:
          return result;
        case 4:
          goto LABEL_25;
        case 5:
          __int16 v17 = a2 + 1;
          goto LABEL_25;
        case 6:
          __int16 v17 = a2 + 2;
          goto LABEL_25;
        case 7:
          __int16 v17 = a2 + 3;
          goto LABEL_25;
        case 8:
          __int16 v17 = a2 + 4;
LABEL_25:
          unsigned char *v17 = *((unsigned char *)v40 + v15 + 2);
          break;
        default:
          break;
      }
      dispatch_get_specific(*v16);
      __int16 v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v18) {
        v18(3, "%s:%i SPMI register 0x%02X = 0x%02X", "phTmlNfc_SpmiDrvErrorStatus", 1178, *((unsigned __int8 *)v40 + v15), *((unsigned __int8 *)v40 + v15 + 2));
      }
      dispatch_get_specific(*v16);
      int v19 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = *((unsigned __int8 *)v40 + v15);
        int v21 = *((unsigned __int8 *)v40 + v15 + 2);
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        uint32_t v34 = "phTmlNfc_SpmiDrvErrorStatus";
        __int16 v35 = 1024;
        int v36 = 1178;
        __int16 v37 = 1024;
        *(_DWORD *)int v38 = v20;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v21;
        _os_log_impl(&dword_2269FD000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%i SPMI register 0x%02X = 0x%02X", buf, 0x1Eu);
      }
      uint64_t result = 0;
      v15 += 3;
    }
    while (v32 >= v15 + 3);
  }
  else
  {
    uint64_t v22 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      uint64_t v24 = (void (*)(uint64_t, const char *, ...))v23;
      __int16 v25 = __error();
      int v26 = strerror(*v25);
      __int16 v27 = __error();
      v24(3, "%s:%i \"%s\" errno=%d Failed to query SPMI error registers", "phTmlNfc_SpmiDrvErrorStatus", 1157, v26, *v27);
    }
    dispatch_get_specific(*v22);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = __error();
      int v30 = strerror(*v29);
      int v31 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136446978;
      uint32_t v34 = "phTmlNfc_SpmiDrvErrorStatus";
      __int16 v35 = 1024;
      int v36 = 1157;
      __int16 v37 = 2080;
      *(void *)int v38 = v30;
      *(_WORD *)&v38[8] = 1024;
      int v39 = v31;
      _os_log_impl(&dword_2269FD000, v28, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to query SPMI error registers", buf, 0x22u);
    }
    return 255;
  }
  return result;
}

uint64_t phTmlNfc_SetGetSpmiDrvConfigRegs()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Not Implemented!!!", "phTmlNfc_SetGetSpmiDrvConfigRegs", 1194);
  }
  dispatch_get_specific(*v0);
  uint64_t v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    uint64_t v5 = "phTmlNfc_SetGetSpmiDrvConfigRegs";
    __int16 v6 = 1024;
    int v7 = 1194;
    _os_log_impl(&dword_2269FD000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Not Implemented!!!", buf, 0x12u);
  }
  return 0;
}

uint64_t phTmlNfc_ConfigureSpmi(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_226A01B24(a1);
  if (!v2)
  {
    int v10 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "phTmlNfc_ConfigureSpmi", 1204, "tml!=NULL");
    }
    dispatch_get_specific(*v10);
    uint64_t v12 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    __int16 v35 = "phTmlNfc_ConfigureSpmi";
    __int16 v36 = 1024;
    int v37 = 1204;
    __int16 v38 = 2080;
    int v39 = "tml!=NULL";
    goto LABEL_16;
  }
  uint64_t v3 = v2;
  if (*(unsigned char *)(v2 + 120)) {
    uint64_t v4 = "hammerfest-spmi";
  }
  else {
    uint64_t v4 = "stockholm-spmi";
  }
  BOOL v5 = NFHardwareSkipSpmiReconfig(v4);
  if (!*(unsigned char *)(v3 + 120)) {
    return 6;
  }
  __int16 v6 = (const void **)MEMORY[0x263F8C6C0];
  if (v5)
  {
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v7 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v7) {
      v7(4, "%s:%i Skipping SPMI reconfig.", "phTmlNfc_ConfigureSpmi", 1209);
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v35 = "phTmlNfc_ConfigureSpmi";
      __int16 v36 = 1024;
      int v37 = 1209;
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Skipping SPMI reconfig.", buf, 0x12u);
    }
    return 6;
  }
  uint64_t v13 = sub_226A01B24(a1);
  if (!v13)
  {
    dispatch_get_specific(*v6);
    int v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v21) {
      v21(3, "%s:%i FAILED: %s", "_phTmlNfc_ConfigureSPMI", 718, "tml!=NULL");
    }
    dispatch_get_specific(*v6);
    uint64_t v12 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    __int16 v35 = "_phTmlNfc_ConfigureSPMI";
    __int16 v36 = 1024;
    int v37 = 718;
    __int16 v38 = 2080;
    int v39 = "tml!=NULL";
    goto LABEL_16;
  }
  uint64_t v14 = v13;
  if (!*(void *)(v13 + 112) || !*(void *)(v13 + 128))
  {
    dispatch_get_specific(*v6);
    int v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v20) {
      v20(3, "%s:%i FAILED: %s", "_phTmlNfc_ConfigureSPMI", 720, "(tml->ifc && tml->auxIfc)");
    }
    dispatch_get_specific(*v6);
    uint64_t v12 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      return 49;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    __int16 v35 = "_phTmlNfc_ConfigureSPMI";
    __int16 v36 = 1024;
    int v37 = 720;
    __int16 v38 = 2080;
    int v39 = "(tml->ifc && tml->auxIfc)";
LABEL_16:
    _os_log_impl(&dword_2269FD000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    return 49;
  }
  dispatch_get_specific(*v6);
  uint64_t v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v15) {
    v15(6, "%s:%i Validating Hammerfest SPMI config...", "_phTmlNfc_ConfigureSPMI", 730);
  }
  dispatch_get_specific(*v6);
  int v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v35 = "_phTmlNfc_ConfigureSPMI";
    __int16 v36 = 1024;
    int v37 = 730;
    _os_log_impl(&dword_2269FD000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Validating Hammerfest SPMI config...", buf, 0x12u);
  }
  uint64_t v17 = **(void **)(v14 + 112);
  __int16 v18 = *(uint64_t (**)(void))(v17 + 200);
  if (v18) {
    char v19 = v18(*(void *)(v17 + 240));
  }
  else {
    char v19 = 1;
  }
  dispatch_get_specific(*v6);
  uint64_t v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v19)
  {
    if (v22) {
      v22(6, "%s:%i Hammerfest SPMI config is good", "_phTmlNfc_ConfigureSPMI", 736);
    }
    dispatch_get_specific(*v6);
    uint64_t v23 = NFSharedLogGetLogger();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v24)
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v35 = "_phTmlNfc_ConfigureSPMI";
      __int16 v36 = 1024;
      int v37 = 736;
      _os_log_impl(&dword_2269FD000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Hammerfest SPMI config is good", buf, 0x12u);
      return 0;
    }
  }
  else
  {
    if (v22) {
      v22(6, "%s:%i Hammerfest SPMI config is incorrect", "_phTmlNfc_ConfigureSPMI", 733);
    }
    dispatch_get_specific(*v6);
    __int16 v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v35 = "_phTmlNfc_ConfigureSPMI";
      __int16 v36 = 1024;
      int v37 = 733;
      _os_log_impl(&dword_2269FD000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Hammerfest SPMI config is incorrect", buf, 0x12u);
    }
    dispatch_get_specific(*v6);
    int v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26) {
      v26(6, "%s:%i Setting Hammerfest SPMI config...", "_phTmlNfc_ConfigureSPMI", 741);
    }
    dispatch_get_specific(*v6);
    __int16 v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v35 = "_phTmlNfc_ConfigureSPMI";
      __int16 v36 = 1024;
      int v37 = 741;
      _os_log_impl(&dword_2269FD000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Setting Hammerfest SPMI config...", buf, 0x12u);
    }
    uint64_t v28 = **(void **)(v14 + 128);
    uint64_t v29 = *(uint64_t (**)(void))(v28 + 208);
    if (v29) {
      char v30 = v29(*(void *)(v28 + 240));
    }
    else {
      char v30 = 1;
    }
    dispatch_get_specific(*v6);
    int v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v30)
    {
      if (v31) {
        v31(6, "%s:%i Hammerfest SPMI config is set", "_phTmlNfc_ConfigureSPMI", 748);
      }
      dispatch_get_specific(*v6);
      unint64_t v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        __int16 v35 = "_phTmlNfc_ConfigureSPMI";
        __int16 v36 = 1024;
        int v37 = 748;
        _os_log_impl(&dword_2269FD000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Hammerfest SPMI config is set", buf, 0x12u);
      }
      uint64_t result = 0;
      *(unsigned char *)(v14 + 121) = 0;
    }
    else
    {
      if (v31) {
        v31(6, "%s:%i Failed to set Hammerfest SPMI config", "_phTmlNfc_ConfigureSPMI", 745);
      }
      dispatch_get_specific(*v6);
      __int16 v33 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        __int16 v35 = "_phTmlNfc_ConfigureSPMI";
        __int16 v36 = 1024;
        int v37 = 745;
        _os_log_impl(&dword_2269FD000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Failed to set Hammerfest SPMI config", buf, 0x12u);
      }
      return 255;
    }
  }
  return result;
}

uint64_t phOsalNfc_Timer_Init(int a1, NSObject **a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (sub_226A05FCC(a1))
  {
    uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Timer already initialized for config %d", "phOsalNfc_Timer_Init", 208, a1);
    }
    dispatch_get_specific(*v4);
    __int16 v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      *(void *)__int16 v27 = "phOsalNfc_Timer_Init";
      *(_WORD *)&v27[8] = 1024;
      int v28 = 208;
      __int16 v29 = 1024;
      int v30 = a1;
      _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i Timer already initialized for config %d", buf, 0x18u);
    }
    return 50;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_26ABD86B0);
    uint64_t v8 = 0;
    for (char i = 1; ; char i = 0)
    {
      char v10 = i;
      if (!qword_26ABD8688[v8]) {
        break;
      }
      uint64_t v8 = 1;
      if ((v10 & 1) == 0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD86B0);
        uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v12) {
          v12(3, "%s:%i Failed to allocate timer context - no space available.", "_phTmlNfc_AllocateContext", 76);
        }
        dispatch_get_specific(*v11);
        uint64_t v13 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)pthread_mutex_t buf = 136446466;
          *(void *)__int16 v27 = "_phTmlNfc_AllocateContext";
          *(_WORD *)&v27[8] = 1024;
          int v28 = 76;
          _os_log_impl(&dword_2269FD000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate timer context - no space available.", buf, 0x12u);
        }
        dispatch_get_specific(*v11);
        uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v14) {
          v14(3, "%s:%i failed to start timer thread", "phOsalNfc_Timer_Init", 214);
        }
        dispatch_get_specific(*v11);
        uint64_t v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)pthread_mutex_t buf = 136446466;
          *(void *)__int16 v27 = "phOsalNfc_Timer_Init";
          *(_WORD *)&v27[8] = 1024;
          int v28 = 214;
          _os_log_impl(&dword_2269FD000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to start timer thread", buf, 0x12u);
        }
        return 225;
      }
    }
    int v16 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v17 = NFSharedMiddlewareSignpostLog();
    if (!v17) {
      uint64_t v17 = NFSharedSignpostLog();
    }
    if (os_signpost_enabled(v17))
    {
      *(_DWORD *)pthread_mutex_t buf = 67109376;
      *(_DWORD *)__int16 v27 = v8;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = a1;
      _os_signpost_emit_with_name_impl(&dword_2269FD000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Allocated Timer", "slot %d, ctlr %d", buf, 0xEu);
    }
    __int16 v18 = (char *)malloc_type_calloc(1uLL, 0xF8uLL, 0xAC8762BEuLL);
    *((_DWORD *)v18 + 60) = a1;
    qword_26ABD8688[v8] = v18;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD86B0);
    int v19 = pthread_mutex_init((pthread_mutex_t *)(v18 + 176), 0);
    if (v19)
    {
      int v20 = v19;
      dispatch_get_specific(*v16);
      int v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v21) {
        v21(3, "%s:%i Failed to create mutex: %d", "phOsalNfc_Timer_Init", 220, v20);
      }
      dispatch_get_specific(*v16);
      uint64_t v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        *(void *)__int16 v27 = "phOsalNfc_Timer_Init";
        *(_WORD *)&v27[8] = 1024;
        int v28 = 220;
        __int16 v29 = 1024;
        int v30 = v20;
        _os_log_impl(&dword_2269FD000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create mutex: %d", buf, 0x18u);
      }
      sub_226A06060(a1);
      return 255;
    }
    else
    {
      uint64_t v23 = *a2;
      *((void *)v18 + 21) = *a2;
      dispatch_retain(v23);
      for (uint64_t j = 8; j != 168; j += 32)
      {
        __int16 v25 = &v18[j];
        *(_OWORD *)__int16 v25 = xmmword_226A16020;
        *((_OWORD *)v25 + 1) = xmmword_226A16020;
      }
      uint64_t result = 0;
      *(void *)__int16 v18 = 1;
    }
  }
  return result;
}

uint64_t sub_226A05FCC(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26ABD86B0);
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    while (1)
    {
      char v4 = v3;
      uint64_t v5 = qword_26ABD8688[v2];
      if (v5) {
        break;
      }
      char v3 = 0;
      uint64_t v2 = 1;
      if ((v4 & 1) == 0)
      {
        uint64_t v7 = 0;
        goto LABEL_10;
      }
    }
    char v3 = 0;
    int v6 = *(_DWORD *)(v5 + 240);
    uint64_t v2 = 1;
  }
  while ((v4 & (v6 != a1)) != 0);
  if (v6 == a1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
LABEL_10:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD86B0);
  return v7;
}

void sub_226A06060(int a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26ABD86B0);
  uint64_t v2 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v4 = i;
    uint64_t v5 = qword_26ABD8688[v2];
    if (v5)
    {
      if (*(_DWORD *)(v5 + 240) == a1) {
        break;
      }
    }
    uint64_t v2 = 1;
    if ((v4 & 1) == 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD86B0);
      int v6 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i Failed to release timer context - not found", "_phTmlNfc_ReleaseContext", 99);
      }
      dispatch_get_specific(*v6);
      uint64_t v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        *(void *)uint64_t v12 = "_phTmlNfc_ReleaseContext";
        *(_WORD *)&v12[8] = 1024;
        int v13 = 99;
        _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to release timer context - not found", buf, 0x12u);
      }
      return;
    }
  }
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  __int16 v9 = NFSharedMiddlewareSignpostLog();
  if (!v9) {
    __int16 v9 = NFSharedSignpostLog();
  }
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)pthread_mutex_t buf = 67109376;
    *(_DWORD *)uint64_t v12 = v2;
    *(_WORD *)&v12[4] = 1024;
    *(_DWORD *)&v12[6] = a1;
    _os_signpost_emit_with_name_impl(&dword_2269FD000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Released Timer", "slot %d, ctlr %d", buf, 0xEu);
  }
  char v10 = (void *)qword_26ABD8688[v2];
  if (v10) {
    free(v10);
  }
  qword_26ABD8688[v2] = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD86B0);
}

uint64_t phOsalNfc_Timer_Deinit(int a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_226A05FCC(a1);
  if (v2)
  {
    uint64_t v3 = v2;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 168));
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 176));
    for (uint64_t i = 8; i != 168; i += 16)
    {
      if (*(void *)(v3 + i) != 0xFFFFFFFFFFFFLL) {
        sub_226A063CC(v3 + i, 1);
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v3 + 176));
    pthread_mutex_destroy((pthread_mutex_t *)(v3 + 176));
    dispatch_release(*(dispatch_object_t *)(v3 + 168));
    *(void *)(v3 + 168) = 0;
    sub_226A06060(a1);
    return 0;
  }
  else
  {
    int v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to get timer context", "phOsalNfc_Timer_Deinit", 250);
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      char v10 = "phOsalNfc_Timer_Deinit";
      __int16 v11 = 1024;
      int v12 = 250;
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context", buf, 0x12u);
    }
    return 49;
  }
}

uint64_t sub_226A063CC(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    char v4 = *(NSObject **)(a1 + 8);
    if (v4)
    {
      dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
      dispatch_release(*(dispatch_object_t *)(a1 + 8));
      *(void *)(a1 + 8) = 0;
    }
    uint64_t result = 0;
    if (a2) {
      *(void *)a1 = 0xFFFFFFFFFFFFLL;
    }
  }
  else
  {
    int v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Invalid timer", "_phOsalNfc_Timer_ClearTimer", 178);
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      char v10 = "_phOsalNfc_Timer_ClearTimer";
      __int16 v11 = 1024;
      int v12 = 178;
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid timer", buf, 0x12u);
    }
    return 1;
  }
  return result;
}

uint64_t phOsalNfc_Timer_Create(int a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_226A05FCC(a1);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)v2;
    char v4 = (pthread_mutex_t *)(v2 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 176));
    uint64_t v5 = 1;
    while (v3[v5] != 0xFFFFFFFFFFFFLL)
    {
      v5 += 2;
      if (v5 == 21)
      {
        uint64_t v6 = 0xFFFFFFFFFFFFLL;
        goto LABEL_18;
      }
    }
    for (uint64_t i = *v3; i == 0xFFFFFFFFFFFELL || i == -1; ++i)
      ;
    uint64_t v6 = i + 1;
    *uint64_t v3 = i + 1;
    v3[v5] = i + 1;
LABEL_18:
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v12 = NFSharedMiddlewareSignpostLog();
    if (!v12) {
      int v12 = NFSharedSignpostLog();
    }
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)pthread_mutex_t buf = 134218240;
      uint64_t v15 = (const char *)v6;
      __int16 v16 = 1024;
      int v17 = a1;
      _os_signpost_emit_with_name_impl(&dword_2269FD000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Created Timer", "timerId %llX, ctlr %d", buf, 0x12u);
    }
    pthread_mutex_unlock(v4);
  }
  else
  {
    uint64_t v7 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to get timer context for type %d", "phOsalNfc_Timer_Create", 279, a1);
    }
    dispatch_get_specific(*v7);
    __int16 v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v15 = "phOsalNfc_Timer_Create";
      __int16 v16 = 1024;
      int v17 = 279;
      __int16 v18 = 1024;
      int v19 = a1;
      _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context for type %d", buf, 0x18u);
    }
    return 0xFFFFFFFFFFFFLL;
  }
  return v6;
}

uint64_t phOsalNfc_Timer_Delete(int a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_226A05FCC(a1);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (pthread_mutex_t *)(v4 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 176));
    uint64_t v7 = 8;
    while (*(const char **)(v5 + v7) != a2)
    {
      v7 += 16;
      if (v7 == 168)
      {
        uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i Failed to get timer %llX from context", "phOsalNfc_Timer_Delete", 398, a2);
        }
        dispatch_get_specific(*v8);
        char v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)pthread_mutex_t buf = 136446722;
          __int16 v18 = "phOsalNfc_Timer_Delete";
          __int16 v19 = 1024;
          int v20 = 398;
          __int16 v21 = 2048;
          uint64_t v22 = a2;
          _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer %llX from context", buf, 0x1Cu);
        }
        uint64_t v11 = 1;
        goto LABEL_19;
      }
    }
    uint64_t v11 = sub_226A063CC(v5 + v7, 1);
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v15 = NFSharedMiddlewareSignpostLog();
    if (!v15) {
      uint64_t v15 = NFSharedSignpostLog();
    }
    if (os_signpost_enabled(v15))
    {
      *(_DWORD *)pthread_mutex_t buf = 134218240;
      __int16 v18 = a2;
      __int16 v19 = 1024;
      int v20 = a1;
      _os_signpost_emit_with_name_impl(&dword_2269FD000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Deleted Timer", "timerId %llX, ctlr %d", buf, 0x12u);
    }
LABEL_19:
    pthread_mutex_unlock(v6);
  }
  else
  {
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Failed to get timer context", "phOsalNfc_Timer_Delete", 391);
    }
    dispatch_get_specific(*v12);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v18 = "phOsalNfc_Timer_Delete";
      __int16 v19 = 1024;
      int v20 = 391;
      _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to get timer context", buf, 0x12u);
    }
    return 49;
  }
  return v11;
}

uint64_t sub_226A069B8(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = CFAbsoluteTimeGetCurrent() - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2 > 0.100000001)
  {
    uint64_t v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(4, "%s:%i Timer fired late: %f", "_phOsalNfc_Timer_StartTimer_block_invoke", 157, *(void *)&v2);
    }
    dispatch_get_specific(*v3);
    uint64_t v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v8 = "_phOsalNfc_Timer_StartTimer_block_invoke";
      __int16 v9 = 1024;
      int v10 = 157;
      __int16 v11 = 2048;
      double v12 = v2;
      _os_log_impl(&dword_2269FD000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Timer fired late: %f", buf, 0x1Cu);
    }
  }
  phOsalNfc_Timer_Stop(*(_DWORD *)(a1 + 64), *(const char **)(a1 + 40));
  return (*(uint64_t (**)(void, void))(a1 + 48))(*(void *)(a1 + 40), *(void *)(a1 + 56));
}

void phOsalNfc_LogStr(uint64_t a1, uint64_t a2, int a3, const char *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1:
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i %s", "phOsalNfc_LogStr", 65, a4);
      }
      uint64_t v6 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      break;
    case 2:
      uint64_t v7 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v7) {
        v7(4, "%s:%i %s", "phOsalNfc_LogStr", 65, a4);
      }
      uint64_t v6 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        uint64_t v15 = "phOsalNfc_LogStr";
        __int16 v16 = 1024;
        int v17 = 65;
        __int16 v18 = 2080;
        __int16 v19 = a4;
        uint64_t v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        goto LABEL_18;
      }
      break;
    case 4:
      int v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v10) {
        v10(6, "%s:%i %s", "phOsalNfc_LogStr", 65, a4);
      }
      __int16 v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        uint64_t v15 = "phOsalNfc_LogStr";
        __int16 v16 = 1024;
        int v17 = 65;
        __int16 v18 = 2080;
        __int16 v19 = a4;
        uint64_t v8 = v11;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
      break;
    case 5:
      double v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12) {
        v12(7, "%s:%i %s", "phOsalNfc_LogStr", 65, a4);
      }
      uint64_t v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        uint64_t v15 = "phOsalNfc_LogStr";
        __int16 v16 = 1024;
        int v17 = 65;
        __int16 v18 = 2080;
        __int16 v19 = a4;
        uint64_t v8 = v13;
        os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
LABEL_18:
        _os_log_impl(&dword_2269FD000, v8, v9, "%{public}s:%i %s", buf, 0x1Cu);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogU32(uint64_t a1, uint64_t a2, int a3, const char *a4, int a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1:
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i %s=%d", "phOsalNfc_LogU32", 74, a4, a5);
      }
      uint64_t v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      break;
    case 2:
      os_log_type_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9) {
        v9(4, "%s:%i %s=%d", "phOsalNfc_LogU32", 74, a4, a5);
      }
      uint64_t v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogU32";
        __int16 v18 = 1024;
        int v19 = 74;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 1024;
        int v23 = a5;
        int v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        goto LABEL_18;
      }
      break;
    case 4:
      double v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12) {
        v12(6, "%s:%i %s=%d", "phOsalNfc_LogU32", 74, a4, a5);
      }
      uint64_t v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogU32";
        __int16 v18 = 1024;
        int v19 = 74;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 1024;
        int v23 = a5;
        int v10 = v13;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
      break;
    case 5:
      uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v14) {
        v14(7, "%s:%i %s=%d", "phOsalNfc_LogU32", 74, a4, a5);
      }
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogU32";
        __int16 v18 = 1024;
        int v19 = 74;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 1024;
        int v23 = a5;
        int v10 = v15;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_18:
        _os_log_impl(&dword_2269FD000, v10, v11, "%{public}s:%i %s=%d", buf, 0x22u);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogX32(uint64_t a1, uint64_t a2, int a3, const char *a4, int a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1:
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i %s=0x%X", "phOsalNfc_LogX32", 83, a4, a5);
      }
      uint64_t v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      break;
    case 2:
      os_log_type_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9) {
        v9(4, "%s:%i %s=0x%X", "phOsalNfc_LogX32", 83, a4, a5);
      }
      uint64_t v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogX32";
        __int16 v18 = 1024;
        int v19 = 83;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 1024;
        int v23 = a5;
        int v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        goto LABEL_18;
      }
      break;
    case 4:
      double v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12) {
        v12(6, "%s:%i %s=0x%X", "phOsalNfc_LogX32", 83, a4, a5);
      }
      uint64_t v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogX32";
        __int16 v18 = 1024;
        int v19 = 83;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 1024;
        int v23 = a5;
        int v10 = v13;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
      break;
    case 5:
      uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v14) {
        v14(7, "%s:%i %s=0x%X", "phOsalNfc_LogX32", 83, a4, a5);
      }
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogX32";
        __int16 v18 = 1024;
        int v19 = 83;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 1024;
        int v23 = a5;
        int v10 = v15;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_18:
        _os_log_impl(&dword_2269FD000, v10, v11, "%{public}s:%i %s=0x%X", buf, 0x22u);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogX64(uint64_t a1, uint64_t a2, int a3, const char *a4, uint64_t a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1:
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i %s=0x%llX", "phOsalNfc_LogX64", 92, a4, a5);
      }
      uint64_t v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      break;
    case 2:
      os_log_type_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9) {
        v9(4, "%s:%i %s=0x%llX", "phOsalNfc_LogX64", 92, a4, a5);
      }
      uint64_t v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_9:
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogX64";
        __int16 v18 = 1024;
        int v19 = 92;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 2048;
        uint64_t v23 = a5;
        int v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        goto LABEL_18;
      }
      break;
    case 4:
      double v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v12) {
        v12(6, "%s:%i %s=0x%llX", "phOsalNfc_LogX64", 92, a4, a5);
      }
      uint64_t v13 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogX64";
        __int16 v18 = 1024;
        int v19 = 92;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 2048;
        uint64_t v23 = a5;
        int v10 = v13;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_18;
      }
      break;
    case 5:
      uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v14) {
        v14(7, "%s:%i %s=0x%llX", "phOsalNfc_LogX64", 92, a4, a5);
      }
      uint64_t v15 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v17 = "phOsalNfc_LogX64";
        __int16 v18 = 1024;
        int v19 = 92;
        __int16 v20 = 2080;
        __int16 v21 = a4;
        __int16 v22 = 2048;
        uint64_t v23 = a5;
        int v10 = v15;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_18:
        _os_log_impl(&dword_2269FD000, v10, v11, "%{public}s:%i %s=0x%llX", buf, 0x26u);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogBool(uint64_t a1, uint64_t a2, int a3, const char *a4, int a5)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1:
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger)
      {
        uint64_t v8 = "TRUE";
        if (!a5) {
          uint64_t v8 = "FALSE";
        }
        Logger(3, "%s:%i %s=%s", "phOsalNfc_LogBool", 104, a4, v8);
      }
      os_log_type_t v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = "TRUE";
        __int16 v25 = "phOsalNfc_LogBool";
        __int16 v26 = 1024;
        int v27 = 104;
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        __int16 v28 = 2080;
        if (!a5) {
          int v10 = "FALSE";
        }
        __int16 v29 = a4;
        __int16 v30 = 2080;
        uint64_t v31 = v10;
        goto LABEL_18;
      }
      break;
    case 2:
      os_log_type_t v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v11)
      {
        double v12 = "TRUE";
        if (!a5) {
          double v12 = "FALSE";
        }
        v11(4, "%s:%i %s=%s", "phOsalNfc_LogBool", 104, a4, v12);
      }
      os_log_type_t v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = "TRUE";
        __int16 v25 = "phOsalNfc_LogBool";
        __int16 v26 = 1024;
        int v27 = 104;
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        __int16 v28 = 2080;
        if (!a5) {
          uint64_t v13 = "FALSE";
        }
        __int16 v29 = a4;
        __int16 v30 = 2080;
        uint64_t v31 = v13;
LABEL_18:
        uint64_t v14 = v9;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        goto LABEL_37;
      }
      break;
    case 4:
      __int16 v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
      {
        int v17 = "TRUE";
        if (!a5) {
          int v17 = "FALSE";
        }
        v16(6, "%s:%i %s=%s", "phOsalNfc_LogBool", 104, a4, v17);
      }
      __int16 v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = "TRUE";
        __int16 v25 = "phOsalNfc_LogBool";
        __int16 v26 = 1024;
        int v27 = 104;
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        __int16 v28 = 2080;
        if (!a5) {
          int v19 = "FALSE";
        }
        __int16 v29 = a4;
        __int16 v30 = 2080;
        uint64_t v31 = v19;
        uint64_t v14 = v18;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_37;
      }
      break;
    case 5:
      __int16 v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v20)
      {
        if (a5) {
          __int16 v21 = "TRUE";
        }
        else {
          __int16 v21 = "FALSE";
        }
        v20(7, "%s:%i %s=%s", "phOsalNfc_LogBool", 104, a4, v21);
      }
      __int16 v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        if (a5) {
          uint64_t v23 = "TRUE";
        }
        else {
          uint64_t v23 = "FALSE";
        }
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        __int16 v25 = "phOsalNfc_LogBool";
        __int16 v26 = 1024;
        int v27 = 104;
        __int16 v28 = 2080;
        __int16 v29 = a4;
        __int16 v30 = 2080;
        uint64_t v31 = v23;
        uint64_t v14 = v22;
        os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
LABEL_37:
        _os_log_impl(&dword_2269FD000, v14, v15, "%{public}s:%i %s=%s", buf, 0x26u);
      }
      break;
    default:
      return;
  }
}

void phOsalNfc_LogFunc(uint64_t a1, uint64_t a2, const char *a3, int a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    if (a4) {
      uint64_t v7 = "+";
    }
    else {
      uint64_t v7 = "-";
    }
    Logger(7, "%s:%i :%s:%s", "phOsalNfc_LogFunc", 115, v7, a3);
  }
  uint64_t v8 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (a4) {
      os_log_type_t v9 = "+";
    }
    else {
      os_log_type_t v9 = "-";
    }
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    os_log_type_t v11 = "phOsalNfc_LogFunc";
    __int16 v12 = 1024;
    int v13 = 115;
    __int16 v14 = 2080;
    os_log_type_t v15 = v9;
    __int16 v16 = 2080;
    int v17 = a3;
    _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_DEBUG, "%{public}s:%i :%s:%s", buf, 0x26u);
  }
}

void phOsalNfc_SignPostLogX32(uint64_t a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  os_log_type_t v9 = NFSharedMiddlewareSignpostLog();
  if (v9)
  {
    int v10 = v9;
    switch(a2)
    {
      case 1:
        if (os_signpost_enabled(v9))
        {
          uint64_t v13 = qword_2647C1C38[a3];
          int v20 = 136446722;
          uint64_t v21 = v13;
          __int16 v22 = 2082;
          uint64_t v23 = a4;
          __int16 v24 = 1024;
          int v25 = a5;
          __int16 v12 = "PHTMLNFC";
          goto LABEL_19;
        }
        break;
      case 2:
        if (os_signpost_enabled(v9))
        {
          uint64_t v14 = qword_2647C1C38[a3];
          int v20 = 136446722;
          uint64_t v21 = v14;
          __int16 v22 = 2082;
          uint64_t v23 = a4;
          __int16 v24 = 1024;
          int v25 = a5;
          __int16 v12 = "PHOSALNFC";
          goto LABEL_19;
        }
        break;
      case 3:
        if (os_signpost_enabled(v9))
        {
          uint64_t v15 = qword_2647C1C38[a3];
          int v20 = 136446722;
          uint64_t v21 = v15;
          __int16 v22 = 2082;
          uint64_t v23 = a4;
          __int16 v24 = 1024;
          int v25 = a5;
          __int16 v12 = "PHNCINFC";
          goto LABEL_19;
        }
        break;
      case 4:
      case 9:
      case 10:
        if (os_signpost_enabled(v9))
        {
          uint64_t v11 = qword_2647C1C38[a3];
          int v20 = 136446722;
          uint64_t v21 = v11;
          __int16 v22 = 2082;
          uint64_t v23 = a4;
          __int16 v24 = 1024;
          int v25 = a5;
          __int16 v12 = "PHLIBNFC";
          goto LABEL_19;
        }
        break;
      case 5:
        if (os_signpost_enabled(v9))
        {
          uint64_t v16 = qword_2647C1C38[a3];
          int v20 = 136446722;
          uint64_t v21 = v16;
          __int16 v22 = 2082;
          uint64_t v23 = a4;
          __int16 v24 = 1024;
          int v25 = a5;
          __int16 v12 = "PHLIBNFC_INFRA";
          goto LABEL_19;
        }
        break;
      case 6:
        if (os_signpost_enabled(v9))
        {
          uint64_t v17 = qword_2647C1C38[a3];
          int v20 = 136446722;
          uint64_t v21 = v17;
          __int16 v22 = 2082;
          uint64_t v23 = a4;
          __int16 v24 = 1024;
          int v25 = a5;
          __int16 v12 = "PHLIBNFC_DNLD";
          goto LABEL_19;
        }
        break;
      case 7:
        if (os_signpost_enabled(v9))
        {
          uint64_t v18 = qword_2647C1C38[a3];
          int v20 = 136446722;
          uint64_t v21 = v18;
          __int16 v22 = 2082;
          uint64_t v23 = a4;
          __int16 v24 = 1024;
          int v25 = a5;
          __int16 v12 = "PHLIBNFC_HCI";
          goto LABEL_19;
        }
        break;
      case 8:
        if (os_signpost_enabled(v9))
        {
          uint64_t v19 = qword_2647C1C38[a3];
          int v20 = 136446722;
          uint64_t v21 = v19;
          __int16 v22 = 2082;
          uint64_t v23 = a4;
          __int16 v24 = 1024;
          int v25 = a5;
          __int16 v12 = "PHLIBNFC_NDEF";
LABEL_19:
          _os_signpost_emit_with_name_impl(&dword_2269FD000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, "%{public}s%{public}s=0x%08X", (uint8_t *)&v20, 0x1Cu);
        }
        break;
      default:
        return;
    }
  }
}

void phOsalNfc_SignPostLogTimerEvents(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v11 = NFSharedMiddlewareSignpostLog();
  if (v11)
  {
    __int16 v12 = v11;
    uint64_t v13 = sub_226A05FCC(a1);
    uint64_t v14 = 0;
    uint64_t v15 = (uint64_t *)(v13 + 8);
    while (1)
    {
      uint64_t v17 = *v15;
      v15 += 2;
      uint64_t v16 = v17;
      if (v17 != 0xFFFFFFFFFFFFLL && v16 == a2) {
        break;
      }
      if (++v14 == 10)
      {
        LODWORD(v14) = 61680;
        break;
      }
    }
    if (a6)
    {
      if (a5)
      {
        switch((int)v14)
        {
          case 0:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID1";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 1:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID2";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 2:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID3";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 3:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID4";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 4:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID5";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 5:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID6";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 6:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID7";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 7:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID8";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 8:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID9";
              int v20 = "%{public}s:%{public}s <- %{public}s";
              goto LABEL_42;
            }
            break;
          case 9:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446722;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              __int16 v28 = 2082;
              uint64_t v29 = a5;
              uint64_t v19 = "PHLIBNFC_TIMER_ID10";
              int v20 = "%{public}s:%{public}s <- %{public}s";
LABEL_42:
              uint64_t v21 = v12;
              os_signpost_type_t v22 = OS_SIGNPOST_INTERVAL_BEGIN;
              goto LABEL_62;
            }
            break;
          default:
            return;
        }
      }
      else
      {
        switch((int)v14)
        {
          case 0:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID1";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 1:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID2";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 2:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID3";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 3:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID4";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 4:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID5";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 5:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID6";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 6:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID7";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 7:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID8";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 8:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID9";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          case 9:
            if (os_signpost_enabled(v12))
            {
              int v24 = 136446466;
              int v25 = "+";
              __int16 v26 = 2082;
              uint64_t v27 = a4;
              uint64_t v19 = "PHLIBNFC_TIMER_ID10";
              int v20 = "%{public}s:%{public}s";
              goto LABEL_99;
            }
            break;
          default:
            return;
        }
      }
    }
    else if (a5)
    {
      switch((int)v14)
      {
        case 0:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID1";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 1:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID2";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 2:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID3";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 3:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID4";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 4:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID5";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 5:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID6";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 6:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID7";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 7:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID8";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 8:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID9";
            int v20 = "%{public}s:%{public}s <- %{public}s";
            goto LABEL_61;
          }
          break;
        case 9:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446722;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            __int16 v28 = 2082;
            uint64_t v29 = a5;
            uint64_t v19 = "PHLIBNFC_TIMER_ID10";
            int v20 = "%{public}s:%{public}s <- %{public}s";
LABEL_61:
            uint64_t v21 = v12;
            os_signpost_type_t v22 = OS_SIGNPOST_INTERVAL_END;
LABEL_62:
            uint32_t v23 = 32;
            goto LABEL_101;
          }
          break;
        default:
          return;
      }
    }
    else
    {
      switch((int)v14)
      {
        case 0:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID1";
            int v20 = "%{public}s:%{public}s";
            uint64_t v21 = v12;
            os_signpost_type_t v22 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_100;
          }
          break;
        case 1:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID2";
            int v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 2:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID3";
            int v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 3:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID4";
            int v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 4:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID5";
            int v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 5:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID6";
            int v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 6:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID7";
            int v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 7:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID8";
            int v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 8:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID9";
            int v20 = "%{public}s:%{public}s";
            goto LABEL_99;
          }
          break;
        case 9:
          if (os_signpost_enabled(v12))
          {
            int v24 = 136446466;
            int v25 = "-";
            __int16 v26 = 2082;
            uint64_t v27 = a4;
            uint64_t v19 = "PHLIBNFC_TIMER_ID10";
            int v20 = "%{public}s:%{public}s";
LABEL_99:
            uint64_t v21 = v12;
            os_signpost_type_t v22 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_100:
            uint32_t v23 = 22;
LABEL_101:
            _os_signpost_emit_with_name_impl(&dword_2269FD000, v21, v22, 0xEEEEB0B5B2B2EEEELL, v19, v20, (uint8_t *)&v24, v23);
          }
          break;
        default:
          return;
      }
    }
  }
}

void phOsalNfc_SignPostLogHexData(uint64_t a1, int a2, int a3, unsigned char *a4, uint64_t a5, unsigned int a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  memset(v22, 0, sizeof(v22));
  LOBYTE(v10) = *a4;
  uint64_t v11 = v22;
  if (*a4)
  {
    unint64_t v12 = 0;
    do
    {
      v22[v12] = v10;
      unint64_t v13 = v12 + 1;
      if (v12 > 0x1A) {
        break;
      }
      int v10 = a4[++v12];
    }
    while (v10);
    uint64_t v11 = &v22[v13];
  }
  *uint64_t v11 = 58;
  if (a6)
  {
    uint64_t v14 = 0;
    uint64_t v15 = v11 + 1;
    uint64_t v16 = a6;
    do
    {
      unsigned int v17 = *(unsigned __int8 *)(a5 + v14);
      unsigned int v18 = v17 & 0xF;
      int v19 = (v17 >> 4) | 0x30;
      if (v17 >= 0xA0) {
        LOBYTE(v19) = (*(unsigned char *)(a5 + v14) >> 4) + 55;
      }
      *uint64_t v15 = v19;
      char v20 = v17 & 0xF | 0x30;
      char v21 = v18 + 55;
      if (v18 < 0xA) {
        char v21 = v20;
      }
      v15[1] = v21;
      *((_WORD *)v15 + 1) = 32;
      if ((++v14 & 3) != 0)
      {
        v15 += 3;
      }
      else
      {
        v15[5] = 0;
        v15 += 5;
        *((_WORD *)v15 - 1) = 8224;
      }
      if ((v14 & 0xF) == 0)
      {
        *uint64_t v15 = 0;
        uint64_t v15 = v22;
        phOsalNfc_SignPostLogStr(a1, a2, a3, (uint64_t)v22);
        v22[0] = 0;
      }
    }
    while (v16 != v14);
  }
  if (v22[0]) {
    phOsalNfc_SignPostLogStr(a1, a2, a3, (uint64_t)v22);
  }
}

uint64_t NFCalibrationGetRFConfigTLVs(CFStringRef *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v2 = NFHardwareLoad("stockholm");
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t RFConfigTLVs = NFHardwareGetRFConfigTLVs(v2, a1);
    NFHardwareUnload(v3);
    return RFConfigTLVs;
  }
  else
  {
    uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(4, "%s:%i Failed to load hw", "NFCalibrationGetRFConfigTLVs", 18);
    }
    dispatch_get_specific(*v6);
    uint64_t v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      int v10 = "NFCalibrationGetRFConfigTLVs";
      __int16 v11 = 1024;
      int v12 = 18;
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load hw", buf, 0x12u);
    }
    return 0;
  }
}

CFStringRef NFCalibrationCopyAntennaName(const char *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i driverName=%s", "NFCalibrationCopyAntennaName", 33, a1);
  }
  dispatch_get_specific(*v2);
  uint64_t v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    int v12 = "NFCalibrationCopyAntennaName";
    __int16 v13 = 1024;
    int v14 = 33;
    __int16 v15 = 2080;
    uint64_t v16 = a1;
    _os_log_impl(&dword_2269FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i driverName=%s", buf, 0x1Cu);
  }
  uint64_t v5 = NFHardwareLoad(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    CFStringRef v7 = NFHardwareCopyAntennaName(v5);
    NFHardwareUnload(v6);
  }
  else
  {
    dispatch_get_specific(*v2);
    uint64_t v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v8) {
      v8(4, "%s:%i Failed to load hw", "NFCalibrationCopyAntennaName", 36);
    }
    dispatch_get_specific(*v2);
    os_log_type_t v9 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      int v12 = "NFCalibrationCopyAntennaName";
      __int16 v13 = 1024;
      int v14 = 36;
      _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to load hw", buf, 0x12u);
    }
    return 0;
  }
  return v7;
}

uint64_t phOsalNfc_IsHeapMemory()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v0 = malloc_default_zone();
  if (v0)
  {
    claimed_address = (unsigned int (*)(void))v0->claimed_address;
    if (claimed_address)
    {
      if (claimed_address() == 1) {
        return 0;
      }
      else {
        return 255;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i phOsalNfc_IsHeapMemory: malloc_default_zone returned NULL", "phOsalNfc_IsHeapMemory", 198);
    }
    dispatch_get_specific(*v3);
    uint64_t v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      CFStringRef v7 = "phOsalNfc_IsHeapMemory";
      __int16 v8 = 1024;
      int v9 = 198;
      _os_log_impl(&dword_2269FD000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i phOsalNfc_IsHeapMemory: malloc_default_zone returned NULL", buf, 0x12u);
    }
    return 12;
  }
}

uint64_t phOsalNfc_Delay(uint64_t a1, int a2)
{
  return usleep(1000 * a2);
}

uint64_t phOsalNfc_MemCompare(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  uint64_t result = 1;
  if (a2 && a3 && a4)
  {
    int v5 = a4 - 1;
    do
    {
      int v7 = *a3++;
      int v6 = v7;
      int v8 = *a2++;
      uint64_t result = (v6 - v8);
      BOOL v9 = v5-- != 0;
    }
    while (v9 && !result);
  }
  return result;
}

uint64_t phOsalNfc_RaiseExceptionWithDescription(int a1, unsigned int a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i EXCEPTION=%d REASON=%d", "phOsalNfc_RaiseExceptionWithDescription", 290, a1, a2);
  }
  dispatch_get_specific(*v4);
  int v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    BOOL v9 = "phOsalNfc_RaiseExceptionWithDescription";
    __int16 v10 = 1024;
    int v11 = 290;
    __int16 v12 = 1024;
    int v13 = a1;
    __int16 v14 = 1024;
    unsigned int v15 = a2;
    _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i EXCEPTION=%d REASON=%d", buf, 0x1Eu);
  }
  uint64_t result = NFIsRestoreOS();
  if ((result & 1) == 0)
  {
    if (byte_26ABD8438) {
      uint64_t result = postAnalyticsMiddlewareExceptionEvent();
    }
    if (a1 == 2 && a2 >= 0x1000)
    {
      uint64_t result = NFProductIsDevBoard();
      if ((result & 1) == 0)
      {
        NFSimulateCrash();
        exit(1);
      }
    }
  }
  return result;
}

uint64_t phOsalNfc_RaiseException(uint64_t a1, int a2, unsigned int a3)
{
  return phOsalNfc_RaiseExceptionWithDescription(a2, a3);
}

uint64_t phOsalNfc_Init(int a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26ABD8458);
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    uint64_t v7 = *((void *)&unk_26ABD8458 + v4 + 1);
    if (v7 && *(_DWORD *)(v7 + 8) == a1)
    {
      uint64_t v15 = 50;
      goto LABEL_20;
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  uint64_t v8 = 0;
  char v9 = 1;
  while (1)
  {
    __int16 v10 = (char *)&unk_26ABD8458 + 8 * v8;
    if (!*((void *)v10 + 1)) {
      break;
    }
    char v11 = v9;
    char v9 = 0;
    uint64_t v8 = 1;
    if ((v11 & 1) == 0)
    {
      __int16 v12 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i Failed to allocate OSAL context - no space available", "_phOsalNfc_CreateContext", 87);
      }
      dispatch_get_specific(*v12);
      __int16 v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        uint64_t v23 = "_phOsalNfc_CreateContext";
        __int16 v24 = 1024;
        int v25 = 87;
        _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate OSAL context - no space available", buf, 0x12u);
      }
      uint64_t v15 = 255;
      goto LABEL_20;
    }
  }
  uint64_t v16 = malloc_type_calloc(1uLL, 0x70uLL, 0xAC8762BEuLL);
  v16[5] = 0u;
  v16[6] = 0u;
  void v16[3] = 0u;
  v16[4] = 0u;
  v16[1] = 0u;
  v16[2] = 0u;
  _OWORD *v16 = 0u;
  *((_DWORD *)v16 + 2) = a1;
  *((void *)v10 + 1) = v16;
  uint64_t v17 = *(void *)(a2 + 8);
  byte_26ABD8438 = *(unsigned char *)(v17 + 17);
  uint64_t v15 = phOsalNfc_Timer_Init(a1, (NSObject **)v17);
  if (v15)
  {
    unsigned int v18 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19) {
      v19(3, "%s:%i Failed to init timer: %d", "phOsalNfc_Init", 347, v15);
    }
    dispatch_get_specific(*v18);
    char v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v23 = "phOsalNfc_Init";
      __int16 v24 = 1024;
      int v25 = 347;
      __int16 v26 = 1024;
      int v27 = v15;
      _os_log_impl(&dword_2269FD000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to init timer: %d", buf, 0x18u);
    }
    sub_226A099DC(a1);
  }
LABEL_20:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD8458);
  return v15;
}

void sub_226A099DC(int a1)
{
  uint64_t v1 = 0;
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v2 = 1;
  do
  {
    char v3 = v2;
    uint64_t v4 = *((void *)&unk_26ABD8458 + v1 + 1);
    if (v4 && *(_DWORD *)(v4 + 8) == a1)
    {
      free(*((void **)&unk_26ABD8458 + v1 + 1));
      *((void *)&unk_26ABD8458 + v1 + 1) = 0;
      return;
    }
    char v2 = 0;
    uint64_t v1 = 1;
  }
  while ((v3 & 1) != 0);
  char v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Failed to release OSAL context - not found", "_phOsalNfc_FreeContext", 114);
  }
  dispatch_get_specific(*v5);
  uint64_t v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    char v9 = "_phOsalNfc_FreeContext";
    __int16 v10 = 1024;
    int v11 = 114;
    _os_log_impl(&dword_2269FD000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to release OSAL context - not found", buf, 0x12u);
  }
}

uint64_t phOsalNfc_OpenLogFile()
{
  return 0;
}

uint64_t phOsalNfc_CloseLogFile()
{
  return 0;
}

void phOsalNfc_DeInit(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_26ABD8458);
  uint64_t v2 = 0;
  char v3 = 1;
  while (1)
  {
    char v4 = v3;
    uint64_t v5 = *((void *)&unk_26ABD8458 + v2 + 1);
    if (v5)
    {
      if (*(_DWORD *)(v5 + 8) == a1) {
        break;
      }
    }
    char v3 = 0;
    uint64_t v2 = 1;
    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
  }
  phOsalNfc_Timer_Deinit(a1);
  sub_226A099DC(a1);
LABEL_7:

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_26ABD8458);
}

uint64_t phOsalNfc_LoadLibrary(int a1, char *__filename, void *a3, unsigned int *a4)
{
  uint64_t v6 = 0;
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v7 = 1;
  do
  {
    char v8 = v7;
    uint64_t v9 = *((void *)&unk_26ABD8458 + v6 + 1);
    if (v9 && *(_DWORD *)(v9 + 8) == a1)
    {
      __int16 v14 = fopen(__filename, "rb");
      if (!v14)
      {
        unsigned int v18 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i FAILED to load FW binary image file\n", "phOsalNfc_LoadLibrary", 423);
        }
        dispatch_get_specific(*v18);
        char v20 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          return 255;
        }
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        int v27 = "phOsalNfc_LoadLibrary";
        __int16 v28 = 1024;
        int v29 = 423;
        char v21 = "%{public}s:%i FAILED to load FW binary image file\n";
        goto LABEL_28;
      }
      uint64_t v15 = v14;
      fseek(v14, 0, 2);
      unsigned int v16 = MEMORY[0x22A65EA70](v15);
      fseek(v15, 0, 0);
      if (v16)
      {
        uint64_t v17 = malloc_type_calloc(1uLL, v16, 0xAC8762BEuLL);
        *(void *)(v9 + 16) = v17;
        if (v17)
        {
          if (fread(v17, 1uLL, v16, v15) == v16)
          {
            *a3 = *(void *)(v9 + 16);
            *a4 = v16;
            fclose(v15);
            return 0;
          }
          __int16 v24 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          int v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v25) {
            v25(3, "%s:%i error : FAILED Unable to read the specified size from file !!!\n", "phOsalNfc_LoadLibrary", 451);
          }
          dispatch_get_specific(*v24);
          char v20 = NFSharedLogGetLogger();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            return 255;
          }
          *(_DWORD *)pthread_mutex_t buf = 136446466;
          int v27 = "phOsalNfc_LoadLibrary";
          __int16 v28 = 1024;
          int v29 = 451;
          char v21 = "%{public}s:%i error : FAILED Unable to read the specified size from file !!!\n";
          goto LABEL_28;
        }
      }
      else
      {
        *(void *)(v9 + 16) = 0;
      }
      os_signpost_type_t v22 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v23) {
        v23(3, "%s:%i FAILED to allocate Memory to load FW image !!!\n", "phOsalNfc_LoadLibrary", 443);
      }
      dispatch_get_specific(*v22);
      char v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        return 255;
      }
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      int v27 = "phOsalNfc_LoadLibrary";
      __int16 v28 = 1024;
      int v29 = 443;
      char v21 = "%{public}s:%i FAILED to allocate Memory to load FW image !!!\n";
LABEL_28:
      _os_log_impl(&dword_2269FD000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x12u);
      return 255;
    }
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  __int16 v10 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  int v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v11) {
    v11(3, "%s:%i error : OSAL context not initialized\n", "phOsalNfc_LoadLibrary", 415);
  }
  dispatch_get_specific(*v10);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    int v27 = "phOsalNfc_LoadLibrary";
    __int16 v28 = 1024;
    int v29 = 415;
    _os_log_impl(&dword_2269FD000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i error : OSAL context not initialized\n", buf, 0x12u);
  }
  return 49;
}

uint64_t phOsalNfc_FreeLibrary(int a1)
{
  uint64_t v1 = 0;
  uint64_t v13 = *MEMORY[0x263EF8340];
  for (char i = 1; ; char i = 0)
  {
    char v3 = i;
    uint64_t v4 = *((void *)&unk_26ABD8458 + v1 + 1);
    if (v4)
    {
      if (*(_DWORD *)(v4 + 8) == a1) {
        break;
      }
    }
    uint64_t v1 = 1;
    if ((v3 & 1) == 0)
    {
      uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i error : OSAL context not initialized\n", "phOsalNfc_FreeLibrary", 477);
      }
      dispatch_get_specific(*v5);
      char v7 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        __int16 v10 = "phOsalNfc_FreeLibrary";
        __int16 v11 = 1024;
        int v12 = 477;
        _os_log_impl(&dword_2269FD000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i error : OSAL context not initialized\n", buf, 0x12u);
      }
      return 49;
    }
  }
  uint64_t result = *(void *)(v4 + 16);
  if (result)
  {
    free((void *)result);
    return 0;
  }
  return result;
}

uint64_t phOsalNfc_setHardwareType(uint64_t result)
{
  dword_26ABD8470 = result;
  return result;
}

BOOL NFHardwareGetUARTLogEnabled(io_registry_entry_t *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  io_registry_entry_t v1 = *a1;
  if (!v1)
  {
    uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Not connected", "NFHardwareGetUARTLogEnabled", 23);
    }
    dispatch_get_specific(*v6);
    char v8 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    char v20 = "NFHardwareGetUARTLogEnabled";
    __int16 v21 = 1024;
    int v22 = 23;
    uint64_t v9 = "%{public}s:%i Not connected";
    __int16 v10 = v8;
    uint32_t v11 = 18;
    goto LABEL_13;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v1, @"uart.log", 0, 0);
  if (!CFProperty)
  {
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(4, "%s:%i Failed to fetch property: %s", "NFHardwareGetUARTLogEnabled", 30, "uart.log");
    }
    dispatch_get_specific(*v12);
    __int16 v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    char v20 = "NFHardwareGetUARTLogEnabled";
    __int16 v21 = 1024;
    int v22 = 30;
    __int16 v23 = 2080;
    __int16 v24 = "uart.log";
    uint64_t v9 = "%{public}s:%i Failed to fetch property: %s";
    __int16 v10 = v14;
    uint32_t v11 = 28;
LABEL_13:
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    return 0;
  }
  char v3 = CFProperty;
  CFTypeID v4 = CFGetTypeID(CFProperty);
  if (v4 == CFBooleanGetTypeID())
  {
    BOOL v5 = v3 == (const void *)*MEMORY[0x263EFFB40];
  }
  else
  {
    uint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    unsigned int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Unsupported type: %lu", "NFHardwareGetUARTLogEnabled", 39, v4);
    }
    dispatch_get_specific(*v15);
    uint64_t v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      char v20 = "NFHardwareGetUARTLogEnabled";
      __int16 v21 = 1024;
      int v22 = 39;
      __int16 v23 = 2048;
      __int16 v24 = (const char *)v4;
      _os_log_impl(&dword_2269FD000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Unsupported type: %lu", buf, 0x1Cu);
    }
    BOOL v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

uint64_t NFHardwareGetRFConfigTLVs(io_registry_entry_t *a1, CFStringRef *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  if (*a1)
  {
    char v3 = a2 + 1;
    *((_OWORD *)a2 + 1) = 0uLL;
    CFTypeID v4 = a2 + 2;
    *(_OWORD *)a2 = 0uLL;
    BOOL v5 = a2 + 3;
    sub_226A0A734(a1, @"rf-clock-tlv", a2);
    if (sub_226A0A734(a1, @"rf-config-tlvs", v3) && *v3) {
      return 1;
    }
    uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 101, "rf-config-tlvs");
    }
    dispatch_get_specific(*v6);
    char v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      int v19 = "NFHardwareGetRFConfigTLVs";
      __int16 v20 = 1024;
      int v21 = 101;
      __int16 v22 = 2080;
      __int16 v23 = "rf-config-tlvs";
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
    }
    if (!sub_226A0A734(a1, @"rf-config-tlvs-10", v4) || !*v4)
    {
      dispatch_get_specific(*v6);
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v9) {
        v9(4, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 106, "rf-config-tlvs-10");
      }
      dispatch_get_specific(*v6);
      __int16 v10 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        int v19 = "NFHardwareGetRFConfigTLVs";
        __int16 v20 = 1024;
        int v21 = 106;
        __int16 v22 = 2080;
        __int16 v23 = "rf-config-tlvs-10";
        _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
      }
    }
    uint64_t v11 = sub_226A0A734(a1, @"rf-config-tlvs-12", v5);
    if (v11 && *v5)
    {
      return 1;
    }
    else
    {
      dispatch_get_specific(*v6);
      uint64_t v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v15) {
        v15(4, "%s:%i mandatory RF settings %s not present in EDT for this config", "NFHardwareGetRFConfigTLVs", 110, "rf-config-tlvs-12");
      }
      dispatch_get_specific(*v6);
      unsigned int v16 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        int v19 = "NFHardwareGetRFConfigTLVs";
        __int16 v20 = 1024;
        int v21 = 110;
        __int16 v22 = 2080;
        __int16 v23 = "rf-config-tlvs-12";
        _os_log_impl(&dword_2269FD000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i mandatory RF settings %s not present in EDT for this config", buf, 0x1Cu);
      }
    }
  }
  else
  {
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Not connected", "NFHardwareGetRFConfigTLVs", 86);
    }
    dispatch_get_specific(*v12);
    __int16 v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      int v19 = "NFHardwareGetRFConfigTLVs";
      __int16 v20 = 1024;
      int v21 = 86;
      _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Not connected", buf, 0x12u);
    }
    return 0;
  }
  return v11;
}

uint64_t sub_226A0A734(io_registry_entry_t *a1, const __CFString *a2, CFStringRef *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty(*a1, a2, 0, 0);
  if (!result) {
    return result;
  }
  BOOL v5 = (const void *)result;
  CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
  if (v6 != CFDataGetTypeID())
  {
    char v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v10 = (void (*)(uint64_t, const char *, ...))Logger;
      CFTypeID TypeID = CFDataGetTypeID();
      CFTypeID v12 = CFGetTypeID(v5);
      v10(3, "%s:%i Unexpected CFType, exp = %lu, actual = %lu", "_NFHardwareGetRFConfigTLV", 69, TypeID, v12);
    }
    dispatch_get_specific(*v8);
    uint64_t v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446978;
      uint64_t v15 = "_NFHardwareGetRFConfigTLV";
      __int16 v16 = 1024;
      int v17 = 69;
      __int16 v18 = 2048;
      CFTypeID v19 = CFDataGetTypeID();
      __int16 v20 = 2048;
      CFTypeID v21 = CFGetTypeID(v5);
      _os_log_impl(&dword_2269FD000, v13, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected CFType, exp = %lu, actual = %lu", buf, 0x26u);
    }
    CFRelease(v5);
    return 0;
  }
  CFStringRef v7 = CFStringCreateFromExternalRepresentation(0, (CFDataRef)v5, 0x600u);
  if (v7) {
    *a3 = v7;
  }
  CFRelease(v5);
  return 1;
}

CFStringRef NFHardwareCopyAntennaName(io_registry_entry_t *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  io_registry_entry_t v1 = *a1;
  if (!v1)
  {
    CFStringRef v7 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Not connected", "NFHardwareCopyAntennaName", 122);
    }
    dispatch_get_specific(*v7);
    uint64_t v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v20 = "NFHardwareCopyAntennaName";
    __int16 v21 = 1024;
    int v22 = 122;
    __int16 v10 = "%{public}s:%i Not connected";
LABEL_13:
    _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x12u);
    return 0;
  }
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, @"rf-antenna-name", 0, 0);
  if (!CFProperty)
  {
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    CFTypeID v12 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v12) {
      v12(4, "%s:%i antenna name is missing - no RF?", "NFHardwareCopyAntennaName", 131);
    }
    dispatch_get_specific(*v11);
    uint64_t v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v20 = "NFHardwareCopyAntennaName";
    __int16 v21 = 1024;
    int v22 = 131;
    __int16 v10 = "%{public}s:%i antenna name is missing - no RF?";
    goto LABEL_13;
  }
  CFDataRef v3 = CFProperty;
  CFTypeID v4 = CFGetTypeID(CFProperty);
  if (v4 == CFDataGetTypeID())
  {
    CFStringRef v5 = CFStringCreateFromExternalRepresentation(0, v3, 0x600u);
    CFRelease(v3);
    return v5;
  }
  uint64_t v13 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v14 = NFLogGetLogger();
  if (v14)
  {
    uint64_t v15 = (void (*)(uint64_t, const char *, ...))v14;
    CFTypeID TypeID = CFDataGetTypeID();
    CFTypeID v17 = CFGetTypeID(v3);
    v15(3, "%s:%i Unexpected CFType, exp = %lu, actual = %lu", "NFHardwareCopyAntennaName", 143, TypeID, v17);
  }
  dispatch_get_specific(*v13);
  __int16 v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    __int16 v20 = "NFHardwareCopyAntennaName";
    __int16 v21 = 1024;
    int v22 = 143;
    __int16 v23 = 2048;
    CFTypeID v24 = CFDataGetTypeID();
    __int16 v25 = 2048;
    CFTypeID v26 = CFGetTypeID(v3);
    _os_log_impl(&dword_2269FD000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected CFType, exp = %lu, actual = %lu", buf, 0x26u);
  }
  CFRelease(v3);
  return 0;
}

_DWORD *NFHardwareLoad(const char *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceNameMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  *uint64_t v2 = MatchingService;
  if (!MatchingService)
  {
    CFTypeID v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Could not find service: %s", "NFHardwareLoad", 159, a1);
    }
    dispatch_get_specific(*v6);
    char v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v11 = "NFHardwareLoad";
      __int16 v12 = 1024;
      int v13 = 159;
      __int16 v14 = 2080;
      uint64_t v15 = a1;
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
    }
    free(v2);
    return 0;
  }
  return v2;
}

void NFHardwareUnload(io_object_t *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1)
  {
    io_object_t v2 = *a1;
    if (v2 && IOObjectRelease(v2))
    {
      mach_port_t v3 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i Fail to release service", "NFHardwareUnload", 175);
      }
      dispatch_get_specific(*v3);
      CFStringRef v5 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        CFStringRef v7 = "NFHardwareUnload";
        __int16 v8 = 1024;
        int v9 = 175;
        _os_log_impl(&dword_2269FD000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release service", buf, 0x12u);
      }
    }
    free(a1);
  }
}

BOOL NFHardwareHasFollowerReset(const char *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (strcmp(a1, "stockholm-spmi")) {
    return 0;
  }
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching("stockholm-spmi");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
  {
    __int16 v8 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareHasFollowerReset", 206);
    }
    dispatch_get_specific(*v8);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v12 = "NFHardwareHasFollowerReset";
      __int16 v13 = 1024;
      int v14 = 206;
      _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  io_object_t v5 = MatchingService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"spmiFollowerReset", 0, 0);
  BOOL v1 = CFProperty != 0;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  IOObjectRelease(v5);
  return v1;
}

BOOL NFHardwareSupportedSecureTimersInOff()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"se-lpem-enabled", 0, 0);
    BOOL v5 = CFProperty != 0;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v3);
  }
  else
  {
    CFTypeID v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareSupportedSecureTimersInOff", 227);
    }
    dispatch_get_specific(*v6);
    __int16 v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v11 = "NFHardwareSupportedSecureTimersInOff";
      __int16 v12 = 1024;
      int v13 = 227;
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  return v5;
}

uint64_t NFHardwareGetModelID(const char *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v2 = IOServiceNameMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"nfccModel", 0, 0);
    if (CFProperty)
    {
      CFDataRef v6 = CFProperty;
      CFTypeID v7 = CFGetTypeID(CFProperty);
      if (v7 == CFDataGetTypeID() && CFDataGetLength(v6)) {
        uint64_t v8 = *CFDataGetBytePtr(v6);
      }
      else {
        uint64_t v8 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      uint64_t v8 = 0;
    }
    IOObjectRelease(v4);
  }
  else
  {
    int v9 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed find IOKit service", "NFHardwareGetModelID", 253);
    }
    dispatch_get_specific(*v9);
    uint64_t v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v14 = "NFHardwareGetModelID";
      __int16 v15 = 1024;
      int v16 = 253;
      _os_log_impl(&dword_2269FD000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    return 0;
  }
  return v8;
}

BOOL NFHardwareIsEos(const char *a1)
{
  return NFHardwareGetModelID(a1) - 209 < 3;
}

uint64_t NFHardwareAllowsVBATOff()
{
  return 1;
}

BOOL NFHardwareSkipSpmiReconfig(const char *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  BOOL v5 = (const void **)MEMORY[0x263F8C6C0];
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"skip-spmi-reconfig", 0, 0);
    BOOL v8 = CFProperty != 0;
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(v6);
  }
  else
  {
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed find IOKit service %s", "NFHardwareSkipSpmiReconfig", 293, a1);
    }
    dispatch_get_specific(*v5);
    uint64_t v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v17 = "NFHardwareSkipSpmiReconfig";
      __int16 v18 = 1024;
      int v19 = 293;
      __int16 v20 = 2080;
      __int16 v21 = a1;
      _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service %s", buf, 0x1Cu);
    }
    BOOL v8 = 0;
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v11)
  {
    if (v8) {
      __int16 v12 = "not reconfigure";
    }
    else {
      __int16 v12 = "reconfigure";
    }
    v11(6, "%s:%i Will %s spmi for %s", "NFHardwareSkipSpmiReconfig", 296, v12, a1);
  }
  dispatch_get_specific(*v5);
  int v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      uint64_t v14 = "not reconfigure";
    }
    else {
      uint64_t v14 = "reconfigure";
    }
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    uint64_t v17 = "NFHardwareSkipSpmiReconfig";
    __int16 v18 = 1024;
    int v19 = 296;
    __int16 v20 = 2080;
    __int16 v21 = v14;
    __int16 v22 = 2080;
    __int16 v23 = a1;
    _os_log_impl(&dword_2269FD000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Will %s spmi for %s", buf, 0x26u);
  }
  return v8;
}

BOOL NFHardwareHasVirtualGPIO()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"required-gpios", 0, 0);
    CFDataRef v5 = CFProperty;
    if (CFProperty && (CFTypeID v6 = CFGetTypeID(CFProperty), v6 == CFDataGetTypeID()))
    {
      BytePtr = CFDataGetBytePtr(v5);
      CFIndex Length = CFDataGetLength(v5);
      CFStringRef v9 = CFStringCreateWithBytes(0, BytePtr, Length, 0x600u, 0);
      if (v9)
      {
        CFStringRef v10 = v9;
        v35.length = CFStringGetLength(v9);
        v35.location = 0;
        BOOL v11 = CFStringFindWithOptions(v10, @"support_virtual_gpio", v35, 0, 0) != 0;
        CFRelease(v10);
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      __int16 v12 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
        if (v5) {
          CFTypeID v15 = CFGetTypeID(v5);
        }
        else {
          CFTypeID v15 = -1;
        }
        CFTypeID TypeID = CFStringGetTypeID();
        v14(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareHasVirtualGPIO", 324, "required-gpios", v15, TypeID);
      }
      dispatch_get_specific(*v12);
      __int16 v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        if (v5) {
          CFTypeID v22 = CFGetTypeID(v5);
        }
        else {
          CFTypeID v22 = -1;
        }
        *(_DWORD *)pthread_mutex_t buf = 136447234;
        __int16 v25 = "NFHardwareHasVirtualGPIO";
        __int16 v26 = 1024;
        int v27 = 324;
        __int16 v28 = 2080;
        int v29 = "required-gpios";
        __int16 v30 = 2048;
        CFTypeID v31 = v22;
        __int16 v32 = 2048;
        CFTypeID v33 = CFStringGetTypeID();
        _os_log_impl(&dword_2269FD000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      BOOL v11 = 0;
      BOOL v19 = 0;
      if (!v5) {
        goto LABEL_25;
      }
    }
    CFRelease(v5);
    BOOL v19 = v11;
LABEL_25:
    IOObjectRelease(v3);
    return v19;
  }
  int v16 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v17) {
    v17(3, "%s:%i %s doesn't exist", "NFHardwareHasVirtualGPIO", 329, "stockholm");
  }
  dispatch_get_specific(*v16);
  __int16 v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    __int16 v25 = "NFHardwareHasVirtualGPIO";
    __int16 v26 = 1024;
    int v27 = 329;
    __int16 v28 = 2080;
    int v29 = "stockholm";
    _os_log_impl(&dword_2269FD000, v18, OS_LOG_TYPE_ERROR, "%{public}s:%i %s doesn't exist", buf, 0x1Cu);
  }
  return 0;
}

BOOL NFHardwareGPIOSetPower(uint64_t *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetPower", 68, a2);
  }
  dispatch_get_specific(*v4);
  CFTypeID v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    CFStringRef v9 = "NFHardwareGPIOSetPower";
    __int16 v10 = 1024;
    int v11 = 68;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return sub_226A0B920(a1, 0, a2) == 0;
}

uint64_t sub_226A0B920(uint64_t *a1, uint32_t selector, unsigned int a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = a3;
  uint64_t input = a3;
  if (a1)
  {
    uint64_t v6 = *a1;
    mach_port_t v7 = *(_DWORD *)(*a1 + 4);
    if (v7)
    {
      *(unsigned char *)(v6 + 8) = 0;
      uint64_t v8 = IOConnectCallScalarMethod(v7, selector, &input, 1u, 0, 0);
      if (v8)
      {
        CFStringRef v9 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i selector=%d enable=%llu : Failed with %#x", "_NFHardwareGPIOSetBoolean", 56, selector, input, v8);
        }
        dispatch_get_specific(*v9);
        int v11 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)pthread_mutex_t buf = 136447234;
          __int16 v21 = "_NFHardwareGPIOSetBoolean";
          __int16 v22 = 1024;
          int v23 = 56;
          __int16 v24 = 1024;
          uint32_t v25 = selector;
          __int16 v26 = 2048;
          uint64_t v27 = input;
          __int16 v28 = 1024;
          int v29 = v8;
          _os_log_impl(&dword_2269FD000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i selector=%d enable=%llu : Failed with %#x", buf, 0x28u);
        }
        if (v8 == -536870163)
        {
          *(unsigned char *)(*a1 + 8) = 1;
          return 3758097133;
        }
      }
    }
    else
    {
      CFTypeID v15 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16) {
        v16(3, "%s:%i selector=%d enable=%llu : Not connected", "_NFHardwareGPIOSetBoolean", 48, selector, v3);
      }
      dispatch_get_specific(*v15);
      uint64_t v17 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        __int16 v21 = "_NFHardwareGPIOSetBoolean";
        __int16 v22 = 1024;
        int v23 = 48;
        __int16 v24 = 1024;
        uint32_t v25 = selector;
        __int16 v26 = 2048;
        uint64_t v27 = v3;
        _os_log_impl(&dword_2269FD000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i selector=%d enable=%llu : Not connected", buf, 0x22u);
      }
      return 4294967294;
    }
  }
  else
  {
    __int16 v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    unsigned int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Invalid parameter", "_NFHardwareGPIOSetBoolean", 43);
    }
    dispatch_get_specific(*v12);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v21 = "_NFHardwareGPIOSetBoolean";
      __int16 v22 = 1024;
      int v23 = 43;
      _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid parameter", buf, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return v8;
}

BOOL NFHardwareGPIOSetVBAT(uint64_t *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i VBAT enable=%d", "NFHardwareGPIOSetVBAT", 74, a2);
  }
  dispatch_get_specific(*v4);
  uint64_t v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    CFStringRef v9 = "NFHardwareGPIOSetVBAT";
    __int16 v10 = 1024;
    int v11 = 74;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i VBAT enable=%d", buf, 0x18u);
  }
  return sub_226A0B920(a1, 5u, a2) == 0;
}

BOOL NFHardwareGPIOSetDownloadRequest(uint64_t *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetDownloadRequest", 80, a2);
  }
  dispatch_get_specific(*v4);
  uint64_t v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    CFStringRef v9 = "NFHardwareGPIOSetDownloadRequest";
    __int16 v10 = 1024;
    int v11 = 80;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return sub_226A0B920(a1, 1u, a2) == 0;
}

BOOL NFHardwareGPIOSetPMUStandbyPowerEnabled(uint64_t *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i enable=%d", "NFHardwareGPIOSetPMUStandbyPowerEnabled", 86, a2);
  }
  dispatch_get_specific(*v4);
  uint64_t v6 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    CFStringRef v9 = "NFHardwareGPIOSetPMUStandbyPowerEnabled";
    __int16 v10 = 1024;
    int v11 = 86;
    __int16 v12 = 1024;
    unsigned int v13 = a2;
    _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i enable=%d", buf, 0x18u);
  }
  return sub_226A0B920(a1, 2u, a2) == 0;
}

uint64_t NFHardwareGPIOWasItSPMINack(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)a1 + 8);
}

uint64_t NFHardwareGPIOSPMIFollowerReset(uint64_t *a1)
{
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*a1 + 16), 10, 0, 0);

  return sub_226A0B920(a1, 8u, 1u);
}

BOOL NFHardwareGPIOValidateSPMIConfig(uint64_t a1)
{
  kern_return_t v6;
  kern_return_t v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  BOOL result;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  void (*v16)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  kern_return_t v22;
  uint64_t v23;

  int v23 = *MEMORY[0x263EF8340];
  mach_port_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareGPIOValidateSPMIConfig", 114);
  }
  dispatch_get_specific(*v2);
  io_object_t v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v18 = "NFHardwareGPIOValidateSPMIConfig";
    BOOL v19 = 1024;
    __int16 v20 = 114;
    _os_log_impl(&dword_2269FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a1)
  {
    dispatch_get_specific(*v2);
    uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14) {
      v14(3, "%s:%i Invalid parameter", "NFHardwareGPIOValidateSPMIConfig", 117);
    }
    dispatch_get_specific(*v2);
    CFTypeID v15 = NFSharedLogGetLogger();
    uint64_t result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v18 = "NFHardwareGPIOValidateSPMIConfig";
    BOOL v19 = 1024;
    __int16 v20 = 117;
    int v11 = "%{public}s:%i Invalid parameter";
LABEL_20:
    __int16 v12 = v15;
    unsigned int v13 = 18;
    goto LABEL_21;
  }
  mach_port_t v5 = *(_DWORD *)(*(void *)a1 + 4);
  if (!v5)
  {
    dispatch_get_specific(*v2);
    int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Not connected", "NFHardwareGPIOValidateSPMIConfig", 122);
    }
    dispatch_get_specific(*v2);
    CFTypeID v15 = NFSharedLogGetLogger();
    uint64_t result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v18 = "NFHardwareGPIOValidateSPMIConfig";
    BOOL v19 = 1024;
    __int16 v20 = 122;
    int v11 = "%{public}s:%i Not connected";
    goto LABEL_20;
  }
  uint64_t v6 = IOConnectCallScalarMethod(v5, 6u, 0, 0, 0, 0);
  if (!v6) {
    return 1;
  }
  mach_port_t v7 = v6;
  dispatch_get_specific(*v2);
  uint64_t v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8) {
    v8(3, "%s:%i Failed with %#x", "NFHardwareGPIOValidateSPMIConfig", 128, v7);
  }
  dispatch_get_specific(*v2);
  CFStringRef v9 = NFSharedLogGetLogger();
  uint64_t result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    __int16 v18 = "NFHardwareGPIOValidateSPMIConfig";
    BOOL v19 = 1024;
    __int16 v20 = 128;
    __int16 v21 = 1024;
    __int16 v22 = v7;
    int v11 = "%{public}s:%i Failed with %#x";
    __int16 v12 = v9;
    unsigned int v13 = 24;
LABEL_21:
    _os_log_impl(&dword_2269FD000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 0;
  }
  return result;
}

BOOL NFHardwareGPIOConfigureHammerfestSPMI(uint64_t a1)
{
  kern_return_t v6;
  kern_return_t v7;
  void (*v8)(uint64_t, const char *, ...);
  NSObject *v9;
  BOOL result;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  void (*v14)(uint64_t, const char *, ...);
  NSObject *v15;
  void (*v16)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  kern_return_t v22;
  uint64_t v23;

  int v23 = *MEMORY[0x263EF8340];
  mach_port_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareGPIOConfigureHammerfestSPMI", 140);
  }
  dispatch_get_specific(*v2);
  io_object_t v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    BOOL v19 = 1024;
    __int16 v20 = 140;
    _os_log_impl(&dword_2269FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a1)
  {
    dispatch_get_specific(*v2);
    uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14) {
      v14(3, "%s:%i Invalid parameter", "NFHardwareGPIOConfigureHammerfestSPMI", 143);
    }
    dispatch_get_specific(*v2);
    CFTypeID v15 = NFSharedLogGetLogger();
    uint64_t result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    BOOL v19 = 1024;
    __int16 v20 = 143;
    int v11 = "%{public}s:%i Invalid parameter";
LABEL_20:
    __int16 v12 = v15;
    unsigned int v13 = 18;
    goto LABEL_21;
  }
  mach_port_t v5 = *(_DWORD *)(*(void *)a1 + 4);
  if (!v5)
  {
    dispatch_get_specific(*v2);
    int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Not connected", "NFHardwareGPIOConfigureHammerfestSPMI", 148);
    }
    dispatch_get_specific(*v2);
    CFTypeID v15 = NFSharedLogGetLogger();
    uint64_t result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    __int16 v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    BOOL v19 = 1024;
    __int16 v20 = 148;
    int v11 = "%{public}s:%i Not connected";
    goto LABEL_20;
  }
  uint64_t v6 = IOConnectCallScalarMethod(v5, 7u, 0, 0, 0, 0);
  if (!v6) {
    return 1;
  }
  mach_port_t v7 = v6;
  dispatch_get_specific(*v2);
  uint64_t v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v8) {
    v8(3, "%s:%i Failed with %#x", "NFHardwareGPIOConfigureHammerfestSPMI", 154, v7);
  }
  dispatch_get_specific(*v2);
  CFStringRef v9 = NFSharedLogGetLogger();
  uint64_t result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    __int16 v18 = "NFHardwareGPIOConfigureHammerfestSPMI";
    BOOL v19 = 1024;
    __int16 v20 = 154;
    __int16 v21 = 1024;
    __int16 v22 = v7;
    int v11 = "%{public}s:%i Failed with %#x";
    __int16 v12 = v9;
    unsigned int v13 = 24;
LABEL_21:
    _os_log_impl(&dword_2269FD000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return 0;
  }
  return result;
}

void **NFHardwareGPIOOpen(int a1)
{
  kern_return_t v10;
  kern_return_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  void (*v15)(uint64_t, const char *, ...);
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  const void **v20;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v22;
  const void **v23;
  void (*v24)(uint64_t, const char *, ...);
  NSObject *v25;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  CFTypeID v33 = *MEMORY[0x263EF8340];
  mach_port_t v2 = (void **)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  if (v2)
  {
    uint64_t v3 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040D090CC53uLL);
    if (!v3)
    {
LABEL_28:
      free(v2);
      return 0;
    }
    io_object_t v4 = v3;
    *mach_port_t v2 = v3;
    if (a1 == 1)
    {
      uint64_t v6 = "AppleStockholmControl";
      int v5 = 1;
    }
    else
    {
      if (a1 != 2)
      {
        __int16 v20 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i wrong GPIO driver type: %d", "NFHardwareGPIOOpen", 184, a1);
        }
        dispatch_get_specific(*v20);
        __int16 v22 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        __int16 v28 = "NFHardwareGPIOOpen";
        int v29 = 1024;
        uint64_t v30 = 184;
        CFTypeID v31 = 1024;
        LODWORD(v32) = a1;
        uint64_t v17 = "%{public}s:%i wrong GPIO driver type: %d";
        __int16 v18 = v22;
        BOOL v19 = 24;
        goto LABEL_26;
      }
      int v5 = 0;
      uint64_t v6 = "AppleHammerfestControl";
    }
    *((void *)v4 + 2) = NFHardwareSerialDebugger(v5);
    mach_port_t v7 = *MEMORY[0x263F0EC88];
    CFDictionaryRef v8 = IOServiceNameMatching(v6);
    io_service_t MatchingService = IOServiceGetMatchingService(v7, v8);
    *(_DWORD *)io_object_t v4 = MatchingService;
    if (!MatchingService)
    {
      int v23 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      __int16 v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v24) {
        v24(3, "%s:%i Could not find service: %s", "NFHardwareGPIOOpen", 194, v6);
      }
      dispatch_get_specific(*v23);
      uint32_t v25 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      __int16 v28 = "NFHardwareGPIOOpen";
      int v29 = 1024;
      uint64_t v30 = 194;
      CFTypeID v31 = 2080;
      __int16 v32 = v6;
      uint64_t v17 = "%{public}s:%i Could not find service: %s";
      __int16 v18 = v25;
      BOOL v19 = 28;
      goto LABEL_26;
    }
    __int16 v10 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)v4 + 1);
    if (v10)
    {
      int v11 = v10;
      __int16 v12 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      unsigned int v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v13) {
        v13(3, "%s:%i Could not open service (%#x)", "NFHardwareGPIOOpen", 205, v11);
      }
      dispatch_get_specific(*v12);
      uint64_t v14 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        __int16 v28 = "NFHardwareGPIOOpen";
        int v29 = 1024;
        uint64_t v30 = 205;
        CFTypeID v31 = 1024;
        LODWORD(v32) = v11;
        _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not open service (%#x)", buf, 0x18u);
      }
      if (!IOObjectRelease(*(_DWORD *)v4)) {
        goto LABEL_27;
      }
      dispatch_get_specific(*v12);
      CFTypeID v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v15) {
        v15(3, "%s:%i Fail to release service", "NFHardwareGPIOOpen", 207);
      }
      dispatch_get_specific(*v12);
      int v16 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      __int16 v28 = "NFHardwareGPIOOpen";
      int v29 = 1024;
      uint64_t v30 = 207;
      uint64_t v17 = "%{public}s:%i Fail to release service";
      __int16 v18 = v16;
      BOOL v19 = 18;
LABEL_26:
      _os_log_impl(&dword_2269FD000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
LABEL_27:
      free(*v2);
      goto LABEL_28;
    }
  }
  return v2;
}

void NFHardwareGPIOClose(uint64_t *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = MGGetProductType();
    if (v2 == 3402870384 || v2 == 896202454)
    {
      NFHardwareGPIOSetPower(a1, 1u);
      usleep(0x7D0u);
    }
    uint64_t v3 = (io_object_t *)*a1;
    if (*(_DWORD *)(*a1 + 4))
    {
      if (IOConnectRelease(*(_DWORD *)(*a1 + 4)))
      {
        io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(3, "%s:%i Fail to release connection", "NFHardwareGPIOClose", 239);
        }
        dispatch_get_specific(*v4);
        uint64_t v6 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)pthread_mutex_t buf = 136446466;
          int v11 = "NFHardwareGPIOClose";
          __int16 v12 = 1024;
          int v13 = 239;
          _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release connection", buf, 0x12u);
        }
      }
      uint64_t v3 = (io_object_t *)*a1;
      *(_DWORD *)(*a1 + 4) = 0;
    }
    if (*v3)
    {
      if (IOObjectRelease(*v3))
      {
        mach_port_t v7 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        CFDictionaryRef v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v8) {
          v8(3, "%s:%i Fail to release service", "NFHardwareGPIOClose", 246);
        }
        dispatch_get_specific(*v7);
        CFStringRef v9 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)pthread_mutex_t buf = 136446466;
          int v11 = "NFHardwareGPIOClose";
          __int16 v12 = 1024;
          int v13 = 246;
          _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%i Fail to release service", buf, 0x12u);
        }
      }
      uint64_t v3 = (io_object_t *)*a1;
      *(_DWORD *)*a1 = 0;
    }
    free(v3);
    free(a1);
  }
}

uint64_t NFHardwareGPIOIsHostWakeCapable()
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"required-gpios", 0, 0);
    CFDataRef v5 = CFProperty;
    if (CFProperty && (CFTypeID v6 = CFGetTypeID(CFProperty), v6 == CFDataGetTypeID()))
    {
      BytePtr = CFDataGetBytePtr(v5);
      CFIndex Length = CFDataGetLength(v5);
      CFStringRef v9 = CFStringCreateWithBytes(0, BytePtr, Length, 0x600u, 0);
      CFIndex v10 = CFStringGetLength(v9);
      if (!v9) {
        goto LABEL_15;
      }
      CFIndex v11 = v10;
      v55.location = 0;
      v55.length = v10;
      int v12 = CFStringFindWithOptions(v9, @"support_wake_stockholm_soc", v55, 0, 0);
      v56.location = 0;
      v56.length = v11;
      LODWORD(v11) = CFStringFindWithOptions(v9, @"support_wake_stockholm", v56, 0, 0) | v12;
      CFRelease(v9);
      if (v11) {
        uint64_t v13 = 1;
      }
      else {
LABEL_15:
      }
        uint64_t v13 = 0;
      CFRelease(v5);
    }
    else
    {
      uint64_t v14 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v16 = (void (*)(uint64_t, const char *, ...))Logger;
        if (v5) {
          CFTypeID v17 = CFGetTypeID(v5);
        }
        else {
          CFTypeID v17 = -1;
        }
        CFTypeID TypeID = CFStringGetTypeID();
        v16(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareGPIOIsHostWakeCapable", 285, "required-gpios", v17, TypeID);
      }
      dispatch_get_specific(*v14);
      __int16 v22 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        if (v5) {
          CFTypeID v23 = CFGetTypeID(v5);
        }
        else {
          CFTypeID v23 = -1;
        }
        *(_DWORD *)pthread_mutex_t buf = 136447234;
        uint64_t v45 = "NFHardwareGPIOIsHostWakeCapable";
        __int16 v46 = 1024;
        int v47 = 285;
        __int16 v48 = 2080;
        int v49 = "required-gpios";
        __int16 v50 = 2048;
        CFTypeID v51 = v23;
        __int16 v52 = 2048;
        CFTypeID v53 = CFStringGetTypeID();
        _os_log_impl(&dword_2269FD000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      if (v5) {
        CFRelease(v5);
      }
      uint64_t v13 = 0;
    }
    IOObjectRelease(v3);
  }
  else
  {
    __int16 v18 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    BOOL v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19) {
      v19(3, "%s:%i stockholm doesn't exist", "NFHardwareGPIOIsHostWakeCapable", 290);
    }
    dispatch_get_specific(*v18);
    __int16 v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v45 = "NFHardwareGPIOIsHostWakeCapable";
      __int16 v46 = 1024;
      int v47 = 290;
      _os_log_impl(&dword_2269FD000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i stockholm doesn't exist", buf, 0x12u);
    }
    uint64_t v13 = 0;
  }
  CFDictionaryRef v24 = IOServiceNameMatching("stockholm-spmi");
  io_service_t v25 = IOServiceGetMatchingService(v0, v24);
  if (v25)
  {
    io_object_t v26 = v25;
    CFDataRef v27 = (const __CFData *)IORegistryEntryCreateCFProperty(v25, @"required-functions", 0, 0);
    CFDataRef v28 = v27;
    if (v27 && (CFTypeID v29 = CFGetTypeID(v27), v29 == CFDataGetTypeID()))
    {
      uint64_t v30 = CFDataGetBytePtr(v28);
      CFIndex v31 = CFDataGetLength(v28);
      CFStringRef v32 = CFStringCreateWithBytes(0, v30, v31, 0x600u, 0);
      CFIndex v33 = CFStringGetLength(v32);
      if (v32)
      {
        v57.length = v33;
        v57.location = 0;
        int v34 = CFStringFindWithOptions(v32, @"support_host_wake_spmi", v57, 0, 0);
        CFRelease(v32);
        if (v34) {
          uint64_t v13 = 1;
        }
      }
    }
    else
    {
      CFRange v35 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v36 = NFLogGetLogger();
      if (v36)
      {
        int v37 = (void (*)(uint64_t, const char *, ...))v36;
        if (v28) {
          CFTypeID v38 = CFGetTypeID(v28);
        }
        else {
          CFTypeID v38 = -1;
        }
        CFTypeID v39 = CFStringGetTypeID();
        v37(3, "%s:%i %s is of Type %lx, expecting %lx", "NFHardwareGPIOIsHostWakeCapable", 313, "required-functions", v38, v39);
      }
      dispatch_get_specific(*v35);
      uint64_t v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        if (v28) {
          CFTypeID v41 = CFGetTypeID(v28);
        }
        else {
          CFTypeID v41 = -1;
        }
        CFTypeID v42 = CFStringGetTypeID();
        *(_DWORD *)pthread_mutex_t buf = 136447234;
        uint64_t v45 = "NFHardwareGPIOIsHostWakeCapable";
        __int16 v46 = 1024;
        int v47 = 313;
        __int16 v48 = 2080;
        int v49 = "required-functions";
        __int16 v50 = 2048;
        CFTypeID v51 = v41;
        __int16 v52 = 2048;
        CFTypeID v53 = v42;
        _os_log_impl(&dword_2269FD000, v40, OS_LOG_TYPE_ERROR, "%{public}s:%i %s is of Type %lx, expecting %lx", buf, 0x30u);
      }
      if (!v28) {
        goto LABEL_46;
      }
    }
    CFRelease(v28);
LABEL_46:
    IOObjectRelease(v26);
  }
  return v13;
}

uint64_t NFHardwareSerialGetDefaultInterfaceType()
{
  kern_return_t v10;
  BOOL v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  BOOL v15;
  const void **v16;
  void (*v17)(uint64_t, const char *, ...);
  NSObject *v18;
  CFBooleanRef Value;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  CFDataRef v28 = *MEMORY[0x263EF8340];
  properties = 0;
  io_object_t v0 = sub_226A0D49C("AppleStockholmControl", "nfc,primary,gpio");
  if (!v0)
  {
    CFDictionaryRef v1 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i Could not find service, trying slow path: %s", "NFHardwareSerialGetDefaultInterfaceType", 441, "AppleStockholmControl");
    }
    dispatch_get_specific(*v1);
    io_object_t v3 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      CFTypeID v23 = "NFHardwareSerialGetDefaultInterfaceType";
      CFDictionaryRef v24 = 1024;
      io_service_t v25 = 441;
      io_object_t v26 = 2080;
      CFDataRef v27 = "AppleStockholmControl";
      _os_log_impl(&dword_2269FD000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service, trying slow path: %s", buf, 0x1Cu);
    }
    sub_226A0D9B0();
    uint64_t result = sub_226A0DF94("nfc,primary,gpio");
    if (!result) {
      return result;
    }
    io_object_t v0 = result;
    io_object_t v5 = sub_226A0D49C("AppleStockholmControl", "nfc,primary,gpio");
    if (v5) {
      goto LABEL_12;
    }
    unsigned int v6 = 100;
    do
    {
      usleep(0x186A0u);
      io_object_t v5 = sub_226A0D49C("AppleStockholmControl", "nfc,primary,gpio");
      if (v5) {
        break;
      }
    }
    while (v6-- > 1);
    if (v5) {
LABEL_12:
    }
      IOObjectRelease(v5);
  }
  IOObjectRelease(v0);
  io_registry_entry_t v8 = sub_226A0D49C("AppleStockholmSPMI", "nfc,primary,spmi");
  if (v8)
  {
    io_object_t v9 = v8;
    CFIndex v10 = IORegistryEntryCreateCFProperties(v8, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (v10) {
      CFIndex v11 = 1;
    }
    else {
      CFIndex v11 = properties == 0;
    }
    if (v11)
    {
      int v12 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v13) {
        v13(6, "%s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", "NFHardwareSerialGetDefaultInterfaceType", 465, v10);
      }
      dispatch_get_specific(*v12);
      uint64_t v14 = NFSharedLogGetLogger();
      CFTypeID v15 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      CFTypeID v23 = "NFHardwareSerialGetDefaultInterfaceType";
      CFDictionaryRef v24 = 1024;
      io_service_t v25 = 465;
      io_object_t v26 = 1024;
      LODWORD(v27) = v10;
      _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", buf, 0x18u);
    }
    else if (CFDictionaryContainsKey(properties, @"stockholm-spmi-data-socket"))
    {
      Value = (const __CFBoolean *)CFDictionaryGetValue(properties, @"stockholm-spmi-data-socket");
      CFTypeID v15 = CFBooleanGetValue(Value) != 0;
LABEL_31:
      if (properties)
      {
        CFRelease(properties);
        properties = 0;
      }
      IOObjectRelease(v9);
      if (v15) {
        return 3;
      }
      else {
        return 2;
      }
    }
    CFTypeID v15 = 0;
    goto LABEL_31;
  }
  int v16 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  CFTypeID v17 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v17) {
    v17(6, "%s:%i Could not find service: %s", "NFHardwareSerialGetDefaultInterfaceType", 457, "AppleStockholmSPMI");
  }
  dispatch_get_specific(*v16);
  __int16 v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    CFTypeID v23 = "NFHardwareSerialGetDefaultInterfaceType";
    CFDictionaryRef v24 = 1024;
    io_service_t v25 = 457;
    io_object_t v26 = 2080;
    CFDataRef v27 = "AppleStockholmSPMI";
    _os_log_impl(&dword_2269FD000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
  }
  IOObjectRelease(0);
  return 1;
}

uint64_t sub_226A0D49C(const char *a1, const char *a2)
{
  kern_return_t MatchingServices;
  kern_return_t v11;
  const void **v12;
  void (*v13)(uint64_t, const char *, ...);
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const void **v18;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v20;
  const void **v21;
  void (*v22)(uint64_t, const char *, ...);
  NSObject *v23;
  const char *v24;
  const void **v25;
  void (*v26)(uint64_t, const char *, ...);
  uint64_t v27;
  const void **v29;
  void (*v30)(uint64_t, const char *, ...);
  NSObject *v31;
  const void **v32;
  void (*v33)(uint64_t, const char *, ...);
  io_iterator_t existing;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  kern_return_t v40;
  uint64_t v41;

  CFTypeID v41 = *MEMORY[0x263EF8340];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    __int16 v18 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to create property matching dictionary", "_NFHardwareFindMatchingService", 358);
    }
    dispatch_get_specific(*v18);
    __int16 v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v36 = "_NFHardwareFindMatchingService";
      int v37 = 1024;
      CFTypeID v38 = 358;
      _os_log_impl(&dword_2269FD000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create property matching dictionary", buf, 0x12u);
    }
    return 0;
  }
  io_object_t v5 = Mutable;
  CFStringRef v6 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v6)
  {
    __int16 v21 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22) {
      v22(3, "%s:%i Failed to create CF property string", "_NFHardwareFindMatchingService", 363);
    }
    dispatch_get_specific(*v21);
    CFTypeID v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 363;
    CFDictionaryRef v24 = "%{public}s:%i Failed to create CF property string";
    goto LABEL_21;
  }
  CFStringRef v7 = v6;
  CFDictionarySetValue(v5, @"IONameMatched", v6);
  CFRelease(v7);
  io_registry_entry_t v8 = IOServiceMatching(a1);
  if (!v8)
  {
    io_service_t v25 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    io_object_t v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26) {
      v26(3, "%s:%i Failed to create matching dictionary", "_NFHardwareFindMatchingService", 372);
    }
    dispatch_get_specific(*v25);
    CFTypeID v23 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 372;
    CFDictionaryRef v24 = "%{public}s:%i Failed to create matching dictionary";
LABEL_21:
    _os_log_impl(&dword_2269FD000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x12u);
LABEL_22:
    CFRelease(v5);
    return 0;
  }
  CFDictionaryRef v9 = v8;
  CFDictionarySetValue(v8, @"IOPropertyMatch", v5);
  CFRelease(v5);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], v9, &existing);
  if (MatchingServices)
  {
    CFIndex v11 = MatchingServices;
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Failed to lookup service : 0x%x", "_NFHardwareFindMatchingService", 397, v11);
    }
    dispatch_get_specific(*v12);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 397;
    CFTypeID v39 = 1024;
    uint64_t v40 = v11;
    CFTypeID v15 = "%{public}s:%i Failed to lookup service : 0x%x";
    int v16 = v14;
    CFTypeID v17 = 24;
    goto LABEL_37;
  }
  if (!existing || !IOIteratorIsValid(existing))
  {
    CFStringRef v32 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    CFIndex v33 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v33) {
      v33(3, "%s:%i Failed to get iterator for service", "_NFHardwareFindMatchingService", 389);
    }
    dispatch_get_specific(*v32);
    CFIndex v31 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 389;
    CFTypeID v15 = "%{public}s:%i Failed to get iterator for service";
    goto LABEL_36;
  }
  CFDataRef v27 = IOIteratorNext(existing);
  if (v27) {
    goto LABEL_39;
  }
  CFTypeID v29 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v30) {
    v30(3, "%s:%i Failed to get valid service", "_NFHardwareFindMatchingService", 393);
  }
  dispatch_get_specific(*v29);
  CFIndex v31 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    uint64_t v36 = "_NFHardwareFindMatchingService";
    int v37 = 1024;
    CFTypeID v38 = 393;
    CFTypeID v15 = "%{public}s:%i Failed to get valid service";
LABEL_36:
    int v16 = v31;
    CFTypeID v17 = 18;
LABEL_37:
    _os_log_impl(&dword_2269FD000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
LABEL_38:
  CFDataRef v27 = 0;
LABEL_39:
  if (existing) {
    IOObjectRelease(existing);
  }
  return v27;
}

void sub_226A0D9B0()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  io_object_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ----------------------- IOService plane --------------------------", "_NFHardwareDumpIOKit", 316);
  }
  dispatch_get_specific(*v0);
  uint64_t v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 316;
    _os_log_impl(&dword_2269FD000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ----------------------- IOService plane --------------------------", buf, 0x12u);
  }
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceNameMatching("stockholm");
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  dispatch_get_specific(*v0);
  CFStringRef v6 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v6) {
    v6(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 318, "stockholm", MatchingService);
  }
  dispatch_get_specific(*v0);
  CFStringRef v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 318;
    __int16 v30 = 2080;
    CFIndex v31 = "stockholm";
    __int16 v32 = 1024;
    io_service_t v33 = MatchingService;
    _os_log_impl(&dword_2269FD000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(MatchingService);
  CFDictionaryRef v8 = IOServiceNameMatching("stockholm-spmi");
  io_service_t v9 = IOServiceGetMatchingService(v3, v8);
  dispatch_get_specific(*v0);
  CFIndex v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v10) {
    v10(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 322, "stockholm-spmi", v9);
  }
  dispatch_get_specific(*v0);
  CFIndex v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 322;
    __int16 v30 = 2080;
    CFIndex v31 = "stockholm-spmi";
    __int16 v32 = 1024;
    io_service_t v33 = v9;
    _os_log_impl(&dword_2269FD000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v9);
  CFDictionaryRef v12 = IOServiceNameMatching("AppleStockholmSPMI");
  io_service_t v13 = IOServiceGetMatchingService(v3, v12);
  dispatch_get_specific(*v0);
  uint64_t v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v14) {
    v14(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 326, "AppleStockholmSPMI", v13);
  }
  dispatch_get_specific(*v0);
  CFTypeID v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 326;
    __int16 v30 = 2080;
    CFIndex v31 = "AppleStockholmSPMI";
    __int16 v32 = 1024;
    io_service_t v33 = v13;
    _os_log_impl(&dword_2269FD000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v13);
  CFDictionaryRef v16 = IOServiceNameMatching("AppleStockholmControl");
  io_service_t v17 = IOServiceGetMatchingService(v3, v16);
  dispatch_get_specific(*v0);
  __int16 v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v18) {
    v18(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 330, "AppleStockholmControl", v17);
  }
  dispatch_get_specific(*v0);
  BOOL v19 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 330;
    __int16 v30 = 2080;
    CFIndex v31 = "AppleStockholmControl";
    __int16 v32 = 1024;
    io_service_t v33 = v17;
    _os_log_impl(&dword_2269FD000, v19, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v17);
  CFDictionaryRef v20 = IOServiceNameMatching("AppleStockholmControlUserClient");
  io_service_t v21 = IOServiceGetMatchingService(v3, v20);
  dispatch_get_specific(*v0);
  __int16 v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v22) {
    v22(3, "%s:%i Matched name %s, returned 0x%04x", "_NFHardwareDumpIOKit", 334, "AppleStockholmControlUserClient", v21);
  }
  dispatch_get_specific(*v0);
  CFTypeID v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 334;
    __int16 v30 = 2080;
    CFIndex v31 = "AppleStockholmControlUserClient";
    __int16 v32 = 1024;
    io_service_t v33 = v21;
    _os_log_impl(&dword_2269FD000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Matched name %s, returned 0x%04x", buf, 0x22u);
  }
  IOObjectRelease(v21);
  dispatch_get_specific(*v0);
  CFDictionaryRef v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v24) {
    v24(6, "%s:%i ----------------------- IOService plane --------------------------", "_NFHardwareDumpIOKit", 338);
  }
  dispatch_get_specific(*v0);
  io_service_t v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    CFDataRef v27 = "_NFHardwareDumpIOKit";
    __int16 v28 = 1024;
    int v29 = 338;
    _os_log_impl(&dword_2269FD000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ----------------------- IOService plane --------------------------", buf, 0x12u);
  }
  sub_226A11F44("stockholm");
  sub_226A11F44("stockholm-spmi");
  sub_226A11F44("AppleStockholmSPMI");
  sub_226A11F44("AppleStockholmControl");
  sub_226A11F44("AppleStockholmControlUserClient");
  sub_226A11F44("hammerfest");
  sub_226A11F44("AppleHammerfestSPMI");
  sub_226A11F44("AppleHammerfestControl");
}

uint64_t sub_226A0DF94(const char *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  io_object_t object = 0;
  uint64_t RootEntry = IORegistryGetRootEntry(*MEMORY[0x263F0EC88]);
  if (MEMORY[0x22A65E6B0](RootEntry, "IOService", 1, &object))
  {
    mach_port_t v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to create iterator", "_NFHardwareLookInTree", 302);
    }
    dispatch_get_specific(*v3);
    io_object_t v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      CFIndex v10 = "_NFHardwareLookInTree";
      __int16 v11 = 1024;
      int v12 = 302;
      _os_log_impl(&dword_2269FD000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create iterator", buf, 0x12u);
    }
    return 0;
  }
  else
  {
    uint64_t v6 = sub_226A12780(object, a1);
    IOObjectRelease(object);
  }
  return v6;
}

BOOL NFHardwareSerialIsHammerfestAlive()
{
  kern_return_t v5;
  BOOL v6;
  void (*v7)(uint64_t, const char *, ...);
  NSObject *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  BOOL v11;
  CFBooleanRef Value;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  __int16 v22 = *MEMORY[0x263EF8340];
  io_object_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareSerialIsHammerfestAlive", 495);
  }
  dispatch_get_specific(*v0);
  uint64_t v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    io_service_t v17 = "NFHardwareSerialIsHammerfestAlive";
    __int16 v18 = 1024;
    BOOL v19 = 495;
    _os_log_impl(&dword_2269FD000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  io_registry_entry_t v3 = sub_226A0D49C("AppleStockholmSPMI", "nfc,secondary,spmi");
  io_object_t v4 = v3;
  if (v3)
  {
    properties = 0;
    io_object_t v5 = IORegistryEntryCreateCFProperties(v3, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (v5) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = properties == 0;
    }
    if (v6)
    {
      dispatch_get_specific(*v0);
      CFStringRef v7 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v7) {
        v7(3, "%s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", "NFHardwareSerialIsHammerfestAlive", 510, v5);
      }
      dispatch_get_specific(*v0);
      CFDictionaryRef v8 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        io_service_t v17 = "NFHardwareSerialIsHammerfestAlive";
        __int16 v18 = 1024;
        BOOL v19 = 510;
        CFDictionaryRef v20 = 1024;
        LODWORD(v21) = v5;
        _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, "%{public}s:%i Could not get valid dictionary from from IO service object, err: 0x%x.", buf, 0x18u);
      }
    }
    else if (CFDictionaryContainsKey(properties, @"hammerfest-data-available-event"))
    {
      Value = (const __CFBoolean *)CFDictionaryGetValue(properties, @"hammerfest-data-available-event");
      __int16 v11 = CFBooleanGetValue(Value) != 0;
      goto LABEL_22;
    }
    __int16 v11 = 0;
LABEL_22:
    if (properties) {
      CFRelease(properties);
    }
    goto LABEL_24;
  }
  dispatch_get_specific(*v0);
  io_service_t v9 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v9) {
    v9(6, "%s:%i Could not find service: %s", "NFHardwareSerialIsHammerfestAlive", 502, "AppleHammerfestSPMI");
  }
  dispatch_get_specific(*v0);
  CFIndex v10 = NFSharedLogGetLogger();
  __int16 v11 = 0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    io_service_t v17 = "NFHardwareSerialIsHammerfestAlive";
    __int16 v18 = 1024;
    BOOL v19 = 502;
    CFDictionaryRef v20 = 2080;
    io_service_t v21 = "AppleHammerfestSPMI";
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service: %s", buf, 0x1Cu);
    __int16 v11 = 0;
  }
LABEL_24:
  IOObjectRelease(v4);
  return v11;
}

uint64_t NFHardwareSerialIsSupported(const char *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFDictionaryRef v1 = "nfc,primary,gpio";
  if (a1 && strcasestr(a1, "hammerfest")) {
    CFDictionaryRef v1 = "nfc,secondary,gpio";
  }
  LODWORD(result) = sub_226A0D49C("AppleStockholmControl", v1);
  if (result) {
    goto LABEL_10;
  }
  io_registry_entry_t v3 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i Could not find service with: %s, retrying slow path", "NFHardwareSerialIsSupported", 538, v1);
  }
  dispatch_get_specific(*v3);
  io_object_t v5 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446722;
    CFStringRef v7 = "NFHardwareSerialIsSupported";
    __int16 v8 = 1024;
    int v9 = 538;
    __int16 v10 = 2080;
    __int16 v11 = v1;
    _os_log_impl(&dword_2269FD000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Could not find service with: %s, retrying slow path", buf, 0x1Cu);
  }
  sub_226A0D9B0();
  uint64_t result = sub_226A0DF94(v1);
  if (result)
  {
LABEL_10:
    IOObjectRelease(result);
    return 1;
  }
  return result;
}

uint64_t NFHardwareSerialReadBlockAbort(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*(void *)(a1 + 8) + 88), 4, 0, 0);
  uint64_t v2 = *(void *)(a1 + 8);
  if (!*(_DWORD *)(v2 + 120))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 112));
    ++*(_DWORD *)(*(void *)(a1 + 8) + 120);
    io_registry_entry_t v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      io_object_t v5 = (void (*)(uint64_t, const char *, ...))Logger;
      mach_continuous_time();
      uint64_t ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v5(6, "%s:%i Read aborted while in progress since %llu.", "NFHardwareSerialReadBlockAbort", 604, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v3);
    CFStringRef v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      mach_continuous_time();
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      __int16 v10 = "NFHardwareSerialReadBlockAbort";
      __int16 v11 = 1024;
      int v12 = 604;
      __int16 v13 = 2048;
      uint64_t v14 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_2269FD000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Read aborted while in progress since %llu.", buf, 0x1Cu);
    }
    *(void *)(*(void *)(a1 + 8) + 128) = 0;
  }
  return 0;
}

uint64_t NFHardwareSerialWriteBlockAbort(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(*(void *)(a1 + 8) + 88), 6, 0, 0);
  uint64_t v2 = *(void *)(a1 + 8);
  if (!*(_DWORD *)(v2 + 144))
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 136));
    uint64_t v3 = *(void *)(a1 + 8);
    ++*(_DWORD *)(v3 + 144);
    *(void *)(v3 + 152) = 0;
    *(void *)(v3 + 160) = 0;
    *(_DWORD *)(v3 + 168) = 0;
    io_object_t v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i Write aborted while in progress.", "NFHardwareSerialWriteBlockAbort", 622);
    }
    dispatch_get_specific(*v4);
    uint64_t v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      int v9 = "NFHardwareSerialWriteBlockAbort";
      __int16 v10 = 1024;
      int v11 = 622;
      _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Write aborted while in progress.", buf, 0x12u);
    }
  }
  return 0;
}

ssize_t sub_226A0E7BC(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  ssize_t result = write(**(_DWORD **)(a1 + 40), *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 152), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 160));
  if (result < 0)
  {
    uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v8 = (void (*)(uint64_t, const char *, ...))Logger;
      int v9 = __error();
      __int16 v10 = strerror(*v9);
      int v11 = __error();
      v8(3, "%s:%i \"%s\" errno=%d ", "NFHardwareSerialWriteBlock_block_invoke", 746, v10, *v11);
    }
    dispatch_get_specific(*v6);
    uint64_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = __error();
      uint64_t v14 = strerror(*v13);
      int v15 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136446978;
      io_service_t v17 = "NFHardwareSerialWriteBlock_block_invoke";
      __int16 v18 = 1024;
      int v19 = 746;
      __int16 v20 = 2080;
      io_service_t v21 = v14;
      __int16 v22 = 1024;
      int v23 = v15;
      _os_log_impl(&dword_2269FD000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d ", buf, 0x22u);
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v3 + 160) = 0;
    goto LABEL_9;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 152) += result;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 160);
  *(_DWORD *)(v3 + 168) += result;
  ssize_t v5 = v4 - result;
  *(void *)(v3 + 160) = v5;
  if (!v5)
  {
LABEL_9:
    *(void *)(v3 + 152) = 0;
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 136));
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 144);
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t NFHardwareSerialFlush(int *a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)a1 + 1);
  if (*(unsigned char *)(v2 + 97))
  {
    sub_226A0EDA8(a1, 1);
    goto LABEL_5;
  }
  if (*(_DWORD *)(v2 + 120))
  {
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 112), &unk_26DA89BA8);
    dispatch_resume(*(dispatch_object_t *)(v2 + 112));
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 112));
    dispatch_release(*(dispatch_object_t *)(v2 + 112));
    *(void *)(v2 + 112) = 0;
    while (1)
    {
LABEL_5:
      while (1)
      {
        ssize_t v3 = read(*a1, &v27, 1uLL);
        if (v3 < 0) {
          break;
        }
        if (!v3)
        {
          io_service_t v17 = (const void **)MEMORY[0x263F8C6C0];
          dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
          uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (Logger) {
            Logger(3, "%s:%i Unexpected result", "NFHardwareSerialFlush", 819);
          }
          dispatch_get_specific(*v17);
          int v19 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)pthread_mutex_t buf = 136446466;
            int v29 = "NFHardwareSerialFlush";
            __int16 v30 = 1024;
            int v31 = 819;
            uint64_t v14 = "%{public}s:%i Unexpected result";
            int v15 = v19;
            uint32_t v16 = 18;
LABEL_18:
            _os_log_impl(&dword_2269FD000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
          }
          goto LABEL_19;
        }
      }
      if (*__error() == 35) {
        break;
      }
      if (*__error() != 4)
      {
        uint64_t v4 = (const void **)MEMORY[0x263F8C6C0];
        dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
        uint64_t v5 = NFLogGetLogger();
        if (v5)
        {
          uint64_t v6 = (void (*)(uint64_t, const char *, ...))v5;
          CFStringRef v7 = __error();
          __int16 v8 = strerror(*v7);
          int v9 = __error();
          v6(3, "%s:%i \"%s\" errno=%d ", "NFHardwareSerialFlush", 813, v8, *v9);
        }
        dispatch_get_specific(*v4);
        __int16 v10 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v11 = __error();
          uint64_t v12 = strerror(*v11);
          int v13 = *__error();
          *(_DWORD *)pthread_mutex_t buf = 136446978;
          int v29 = "NFHardwareSerialFlush";
          __int16 v30 = 1024;
          int v31 = 813;
          __int16 v32 = 2080;
          uint64_t v33 = (uint64_t)v12;
          __int16 v34 = 1024;
          int v35 = v13;
          uint64_t v14 = "%{public}s:%i \"%s\" errno=%d ";
          int v15 = v10;
          uint32_t v16 = 34;
          goto LABEL_18;
        }
LABEL_19:
        uint64_t v20 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v20 = 1;
LABEL_21:
    if (*(unsigned char *)(v2 + 97))
    {
      sub_226A0EDA8(a1, 0);
    }
    else if (!*(void *)(v2 + 112))
    {
      *(void *)(v2 + 112) = dispatch_source_create(MEMORY[0x263EF83E8], *a1, 0, *(dispatch_queue_t *)(v2 + 104));
      dispatch_set_qos_class_fallback();
      dispatch_source_set_event_handler(*(dispatch_source_t *)(v2 + 112), &unk_26DA89BC8);
      dispatch_source_set_cancel_handler(*(dispatch_source_t *)(v2 + 112), &unk_26DA89BE8);
      dispatch_activate(*(dispatch_object_t *)(v2 + 112));
      dispatch_suspend(*(dispatch_object_t *)(v2 + 112));
      *(_DWORD *)(v2 + 120) = 1;
      *(void *)(*((void *)a1 + 1) + 128) = 0;
    }
    NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v2 + 88), 9, 0, 0);
  }
  else
  {
    __int16 v22 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      uint64_t v24 = (void (*)(uint64_t, const char *, ...))v23;
      mach_continuous_time();
      uint64_t ElapsedTimeInMillisecondsFromMachTime = GetElapsedTimeInMillisecondsFromMachTime();
      v24(3, "%s:%i Error : read in progress since %llu", "NFHardwareSerialFlush", 783, ElapsedTimeInMillisecondsFromMachTime);
    }
    dispatch_get_specific(*v22);
    io_object_t v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      mach_continuous_time();
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      int v29 = "NFHardwareSerialFlush";
      __int16 v30 = 1024;
      int v31 = 783;
      __int16 v32 = 2048;
      uint64_t v33 = GetElapsedTimeInMillisecondsFromMachTime();
      _os_log_impl(&dword_2269FD000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Error : read in progress since %llu", buf, 0x1Cu);
    }
    return 0;
  }
  return v20;
}

BOOL sub_226A0EDA8(int *a1, int a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v4 = fcntl(*a1, 3, 0);
  if (v4 != -1)
  {
    if (a2) {
      int v5 = 4;
    }
    else {
      int v5 = 0;
    }
    if (fcntl(*a1, 4, v4 & 0xFFFFFFFB | v5))
    {
      uint64_t v6 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        __int16 v8 = (void (*)(uint64_t, const char *, ...))Logger;
        int v9 = __error();
        __int16 v10 = strerror(*v9);
        int v11 = __error();
        v8(3, "%s:%i \"%s\" errno=%d Failed to set flags", "_NFHardwareSerialSetNonBlock", 109, v10, *v11);
      }
      dispatch_get_specific(*v6);
      uint64_t v12 = NFSharedLogGetLogger();
      BOOL result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (result)
      {
        uint64_t v14 = __error();
        int v15 = strerror(*v14);
        int v16 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        uint64_t v36 = "_NFHardwareSerialSetNonBlock";
        __int16 v37 = 1024;
        int v38 = 109;
        __int16 v39 = 2080;
        uint64_t v40 = v15;
        __int16 v41 = 1024;
        int v42 = v16;
        io_service_t v17 = "%{public}s:%i \"%s\" errno=%d Failed to set flags";
LABEL_14:
        _os_log_impl(&dword_2269FD000, v12, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
        return 0;
      }
      return result;
    }
    char v27 = fcntl(*a1, 3, 0);
    __int16 v28 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if ((v27 & 4) != 0)
    {
      if (v29) {
        v29(6, "%s:%i Socket is non-blocking", "_NFHardwareSerialSetNonBlock", 114);
      }
      dispatch_get_specific(*v28);
      __int16 v34 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v36 = "_NFHardwareSerialSetNonBlock";
      __int16 v37 = 1024;
      int v38 = 114;
      int v31 = "%{public}s:%i Socket is non-blocking";
      __int16 v32 = v34;
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (v29) {
        v29(3, "%s:%i Socket is blocking !!", "_NFHardwareSerialSetNonBlock", 116);
      }
      dispatch_get_specific(*v28);
      __int16 v30 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        return 1;
      }
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v36 = "_NFHardwareSerialSetNonBlock";
      __int16 v37 = 1024;
      int v38 = 116;
      int v31 = "%{public}s:%i Socket is blocking !!";
      __int16 v32 = v30;
      os_log_type_t v33 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_2269FD000, v32, v33, v31, buf, 0x12u);
    return 1;
  }
  __int16 v18 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v19 = NFLogGetLogger();
  if (v19)
  {
    uint64_t v20 = (void (*)(uint64_t, const char *, ...))v19;
    io_service_t v21 = __error();
    __int16 v22 = strerror(*v21);
    uint64_t v23 = __error();
    v20(3, "%s:%i \"%s\" errno=%d Failed to get flags", "_NFHardwareSerialSetNonBlock", 103, v22, *v23);
  }
  dispatch_get_specific(*v18);
  uint64_t v12 = NFSharedLogGetLogger();
  BOOL result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (result)
  {
    uint64_t v24 = __error();
    io_service_t v25 = strerror(*v24);
    int v26 = *__error();
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    uint64_t v36 = "_NFHardwareSerialSetNonBlock";
    __int16 v37 = 1024;
    int v38 = 103;
    __int16 v39 = 2080;
    uint64_t v40 = v25;
    __int16 v41 = 1024;
    int v42 = v26;
    io_service_t v17 = "%{public}s:%i \"%s\" errno=%d Failed to get flags";
    goto LABEL_14;
  }
  return result;
}

void sub_226A0F15C()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  io_object_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "NFHardwareSerialFlush_block_invoke", 832);
  }
  dispatch_get_specific(*v0);
  uint64_t v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    int v4 = "NFHardwareSerialFlush_block_invoke";
    __int16 v5 = 1024;
    int v6 = 832;
    _os_log_impl(&dword_2269FD000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
}

uint64_t NFHardwareSerialReset(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (**(unsigned char **)(a1 + 8)) {
      return 1;
    }
    int v6 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i ", "NFHardwareSerialReset", 857);
    }
    dispatch_get_specific(*v6);
    __int16 v8 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v23 = "NFHardwareSerialReset";
      __int16 v24 = 1024;
      int v25 = 857;
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
    }
    int v21 = 3;
    if (!setsockopt(*(_DWORD *)a1, 2, -2147191792, &v21, 4u))
    {
      unsigned int v10 = -1;
      while (v10 != 2)
      {
        int v21 = 3;
        ++v10;
        if (setsockopt(*(_DWORD *)a1, 2, -2147191792, &v21, 4u))
        {
          BOOL v2 = v10 > 2;
          unsigned int v9 = v10 + 1;
          goto LABEL_19;
        }
      }
      return 1;
    }
    BOOL v2 = 0;
    unsigned int v9 = 0;
LABEL_19:
    dispatch_get_specific(*v6);
    uint64_t v11 = NFLogGetLogger();
    if (v11)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))v11;
      int v13 = __error();
      uint64_t v14 = strerror(*v13);
      int v15 = __error();
      v12(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:TIOCFLUSH - attempt %d - ", "NFHardwareSerialReset", 865, v14, *v15, v9);
    }
    dispatch_get_specific(*v6);
    int v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      io_service_t v17 = __error();
      __int16 v18 = strerror(*v17);
      int v19 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136447234;
      uint64_t v23 = "NFHardwareSerialReset";
      __int16 v24 = 1024;
      int v25 = 865;
      __int16 v26 = 2080;
      char v27 = v18;
      __int16 v28 = 1024;
      int v29 = v19;
      __int16 v30 = 1024;
      unsigned int v31 = v9;
      _os_log_impl(&dword_2269FD000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:TIOCFLUSH - attempt %d - ", buf, 0x28u);
    }
  }
  else
  {
    ssize_t v3 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    int v4 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v4) {
      v4(3, "%s:%i Serial device not opened!", "NFHardwareSerialReset", 849);
    }
    dispatch_get_specific(*v3);
    __int16 v5 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v23 = "NFHardwareSerialReset";
      __int16 v24 = 1024;
      int v25 = 849;
      _os_log_impl(&dword_2269FD000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%i Serial device not opened!", buf, 0x12u);
    }
    return 0;
  }
  return v2;
}

BOOL NFHardwareSerialSetBaudRate(uint64_t a1, speed_t a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  speed_t v52 = a2;
  if (a1)
  {
    if (**(unsigned char **)(a1 + 8)) {
      return 1;
    }
    uint64_t v11 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(6, "%s:%i baudRate=%lu", "NFHardwareSerialSetBaudRate", 884, a2);
    }
    dispatch_get_specific(*v11);
    int v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v54 = "NFHardwareSerialSetBaudRate";
      __int16 v55 = 1024;
      int v56 = 884;
      __int16 v57 = 2048;
      speed_t v58 = a2;
      _os_log_impl(&dword_2269FD000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s:%i baudRate=%lu", buf, 0x1Cu);
    }
    uint64_t v14 = *(void *)(a1 + 8);
    if (*(unsigned char *)(v14 + 1))
    {
      int v15 = (const void *)(v14 + 8);
      socklen_t v51 = 72;
      if (getsockopt(*(_DWORD *)a1, 2, 1078490131, (void *)(v14 + 8), &v51))
      {
        dispatch_get_specific(*v11);
        uint64_t v16 = NFLogGetLogger();
        if (v16)
        {
          io_service_t v17 = (void (*)(uint64_t, const char *, ...))v16;
          __int16 v18 = __error();
          int v19 = strerror(*v18);
          uint64_t v20 = __error();
          v17(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetBaudRate", 891, v19, *v20);
        }
        dispatch_get_specific(*v11);
        int v21 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        __int16 v22 = __error();
        uint64_t v23 = strerror(*v22);
        int v24 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        uint64_t v54 = "NFHardwareSerialSetBaudRate";
        __int16 v55 = 1024;
        int v56 = 891;
        __int16 v57 = 2080;
        speed_t v58 = (speed_t)v23;
        __int16 v59 = 1024;
        int v60 = v24;
        uint64_t v7 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
        goto LABEL_18;
      }
      if (!cfsetspeed((termios *)(*(void *)(a1 + 8) + 8), a2))
      {
        if (!setsockopt(*(_DWORD *)a1, 2, -2142735340, v15, 0x48u)) {
          return 1;
        }
        dispatch_get_specific(*v11);
        uint64_t v43 = NFLogGetLogger();
        if (v43)
        {
          BOOL v44 = (void (*)(uint64_t, const char *, ...))v43;
          uint64_t v45 = __error();
          __int16 v46 = strerror(*v45);
          int v47 = __error();
          v44(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetBaudRate", 901, v46, *v47);
        }
        dispatch_get_specific(*v11);
        int v21 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          return 0;
        }
        __int16 v48 = __error();
        int v49 = strerror(*v48);
        int v50 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        uint64_t v54 = "NFHardwareSerialSetBaudRate";
        __int16 v55 = 1024;
        int v56 = 901;
        __int16 v57 = 2080;
        speed_t v58 = (speed_t)v49;
        __int16 v59 = 1024;
        int v60 = v50;
        uint64_t v7 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL";
LABEL_18:
        __int16 v8 = v21;
        uint32_t v9 = 34;
        goto LABEL_30;
      }
      dispatch_get_specific(*v11);
      uint64_t v34 = NFLogGetLogger();
      if (v34)
      {
        int v35 = (void (*)(uint64_t, const char *, ...))v34;
        uint64_t v36 = __error();
        __int16 v37 = strerror(*v36);
        int v38 = __error();
        v35(3, "%s:%i \"%s\" errno=%d baudRate=%lu", "NFHardwareSerialSetBaudRate", 896, v37, *v38, a2);
      }
      dispatch_get_specific(*v11);
      __int16 v39 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      uint64_t v40 = __error();
      __int16 v41 = strerror(*v40);
      int v42 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136447234;
      uint64_t v54 = "NFHardwareSerialSetBaudRate";
      __int16 v55 = 1024;
      int v56 = 896;
      __int16 v57 = 2080;
      speed_t v58 = (speed_t)v41;
      __int16 v59 = 1024;
      int v60 = v42;
      __int16 v61 = 2048;
      speed_t v62 = a2;
      uint64_t v7 = "%{public}s:%i \"%s\" errno=%d baudRate=%lu";
      __int16 v8 = v39;
LABEL_29:
      uint32_t v9 = 44;
      goto LABEL_30;
    }
    if ((ioctl(*(_DWORD *)a1, 0x80085402uLL, &v52) & 0x80000000) == 0) {
      return 1;
    }
    dispatch_get_specific(*v11);
    uint64_t v25 = NFLogGetLogger();
    if (v25)
    {
      __int16 v26 = (void (*)(uint64_t, const char *, ...))v25;
      char v27 = __error();
      __int16 v28 = strerror(*v27);
      int v29 = __error();
      v26(3, "%s:%i \"%s\" errno=%d baudRate=%lu", "NFHardwareSerialSetBaudRate", 908, v28, *v29, v52);
    }
    dispatch_get_specific(*v11);
    __int16 v30 = NFSharedLogGetLogger();
    BOOL result = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (result)
    {
      unsigned int v31 = __error();
      uint64_t v32 = strerror(*v31);
      int v33 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136447234;
      uint64_t v54 = "NFHardwareSerialSetBaudRate";
      __int16 v55 = 1024;
      int v56 = 908;
      __int16 v57 = 2080;
      speed_t v58 = (speed_t)v32;
      __int16 v59 = 1024;
      int v60 = v33;
      __int16 v61 = 2048;
      speed_t v62 = v52;
      uint64_t v7 = "%{public}s:%i \"%s\" errno=%d baudRate=%lu";
      __int16 v8 = v30;
      goto LABEL_29;
    }
  }
  else
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    __int16 v5 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v5) {
      v5(3, "%s:%i Serial device not opened!", "NFHardwareSerialSetBaudRate", 875);
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      uint64_t v54 = "NFHardwareSerialSetBaudRate";
      __int16 v55 = 1024;
      int v56 = 875;
      uint64_t v7 = "%{public}s:%i Serial device not opened!";
      __int16 v8 = v6;
      uint32_t v9 = 18;
LABEL_30:
      _os_log_impl(&dword_2269FD000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      return 0;
    }
  }
  return result;
}

uint64_t NFHardwareSerialSetLogFunction(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 8) + 80) = a2;
  return 1;
}

int *NFHardwareSerialOpen(const char *a1, NSObject *a2, BOOL a3)
{
  uint64_t v175 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    v154 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i FAILED: %s", "NFHardwareSerialOpen", 1121, "devicePath != ((void *)0)");
    }
    dispatch_get_specific(*v154);
    v156 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
    {
      LODWORD(handler[0]) = 136446722;
      *(void *)((char *)handler + 4) = "NFHardwareSerialOpen";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 1121;
      WORD1(handler[1]) = 2080;
      *(void *)((char *)&handler[1] + 4) = "devicePath != ((void *)0)";
      _os_log_impl(&dword_2269FD000, v156, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", (uint8_t *)handler, 0x1Cu);
    }
    abort();
  }
  int v6 = (int *)malloc_type_calloc(1uLL, 0x10uLL, 0x10800407411B482uLL);
  if (!v6) {
    goto LABEL_72;
  }
  uint64_t v7 = (BOOL *)malloc_type_calloc(1uLL, 0xB0uLL, 0x10B0040FC08F2D4uLL);
  if (!v7) {
    goto LABEL_72;
  }
  __int16 v8 = v7;
  *((void *)v6 + 1) = v7;
  BOOL v9 = strcasestr(a1, "hammerfest") == 0;
  v8[96] = v9;
  unsigned int v10 = (os_unfair_lock_s *)NFHardwareSerialDebugger(v9);
  *((void *)v8 + 11) = v10;
  BOOL v11 = 1;
  NFHardwareSerialDebugLog(v10, 1, 0, 0);
  v8[97] = a3;
  if (strlen(a1) >= 5) {
    BOOL v11 = strncmp(a1, "/dev/", 5uLL) != 0;
  }
  v8[1] = v11;
  BOOL *v8 = strcasestr(a1, "spmi") != 0;
  if (v8[1])
  {
    sockaddr v158 = (sockaddr)0;
    long long v159 = 0u;
    int v174 = 0;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v171 = 0u;
    memset(handler, 0, sizeof(handler));
    uint64_t v12 = *((void *)v6 + 1);
    socklen_t v157 = 72;
    int v13 = socket(32, 1, 2);
    *int v6 = v13;
    uint64_t v14 = (const void **)MEMORY[0x263F8C6C0];
    if (v13 < 0)
    {
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        uint64_t v32 = (void (*)(uint64_t, const char *, ...))v31;
        int v33 = __error();
        uint64_t v34 = strerror(*v33);
        int v35 = __error();
        v32(3, "%s:%i \"%s\" errno=%d socket", "_NFHardwareSerialOpenSocket", 995, v34, *v35);
      }
      dispatch_get_specific(*v14);
      uint64_t v36 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        __int16 v37 = __error();
        int v38 = strerror(*v37);
        int v39 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 995;
        __int16 v164 = 2080;
        v165 = v38;
        __int16 v166 = 1024;
        int v167 = v39;
        _os_log_impl(&dword_2269FD000, v36, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d socket", buf, 0x22u);
      }
      *int v6 = 0;
      goto LABEL_29;
    }
    int v174 = 0;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v171 = 0u;
    memset(handler, 0, sizeof(handler));
    __strlcpy_chk();
    if (ioctl(*v6, 0xC0644E03uLL, handler))
    {
      dispatch_get_specific(*v14);
      uint64_t v15 = NFLogGetLogger();
      if (v15)
      {
        uint64_t v16 = (void (*)(uint64_t, const char *, ...))v15;
        io_service_t v17 = __error();
        __int16 v18 = strerror(*v17);
        int v19 = __error();
        v16(3, "%s:%i \"%s\" errno=%d ioctl: CTLIOCGINFO", "_NFHardwareSerialOpenSocket", 1004, v18, *v19);
      }
      dispatch_get_specific(*v14);
      uint64_t v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      int v21 = __error();
      __int16 v22 = strerror(*v21);
      int v23 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136446978;
      v161 = "_NFHardwareSerialOpenSocket";
      __int16 v162 = 1024;
      int v163 = 1004;
      __int16 v164 = 2080;
      v165 = v22;
      __int16 v166 = 1024;
      int v167 = v23;
      int v24 = "%{public}s:%i \"%s\" errno=%d ioctl: CTLIOCGINFO";
      goto LABEL_27;
    }
    *(_DWORD *)&v158.sa_len = 139296;
    *(_DWORD *)&v158.sa_data[2] = handler[0];
    *(_DWORD *)&v158.sa_data[6] = 0;
    if (connect(*v6, &v158, 0x20u))
    {
      dispatch_get_specific(*v14);
      uint64_t v40 = NFLogGetLogger();
      if (v40)
      {
        __int16 v41 = (void (*)(uint64_t, const char *, ...))v40;
        int v42 = __error();
        uint64_t v43 = strerror(*v42);
        BOOL v44 = __error();
        v41(3, "%s:%i \"%s\" errno=%d connect", "_NFHardwareSerialOpenSocket", 1015, v43, *v44);
      }
      dispatch_get_specific(*v14);
      uint64_t v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      uint64_t v45 = __error();
      __int16 v46 = strerror(*v45);
      int v47 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136446978;
      v161 = "_NFHardwareSerialOpenSocket";
      __int16 v162 = 1024;
      int v163 = 1015;
      __int16 v164 = 2080;
      v165 = v46;
      __int16 v166 = 1024;
      int v167 = v47;
      int v24 = "%{public}s:%i \"%s\" errno=%d connect";
      goto LABEL_27;
    }
    if (*(unsigned char *)(*((void *)v6 + 1) + 97))
    {
      dispatch_get_specific(*v14);
      v74 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v74) {
        v74(6, "%s:%i Using blocking socket for relay", "_NFHardwareSerialOpenSocket", 1020);
      }
      dispatch_get_specific(*v14);
      v75 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 1020;
        _os_log_impl(&dword_2269FD000, v75, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using blocking socket for relay", buf, 0x12u);
      }
    }
    else if (!sub_226A0EDA8(v6, 1))
    {
      dispatch_get_specific(*v14);
      uint64_t v107 = NFLogGetLogger();
      if (v107)
      {
        v108 = (void (*)(uint64_t, const char *, ...))v107;
        v109 = __error();
        v110 = strerror(*v109);
        v111 = __error();
        v108(3, "%s:%i \"%s\" errno=%d Failed to set non-blocking.", "_NFHardwareSerialOpenSocket", 1023, v110, *v111);
      }
      dispatch_get_specific(*v14);
      uint64_t v20 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v112 = __error();
      v113 = strerror(*v112);
      int v114 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136446978;
      v161 = "_NFHardwareSerialOpenSocket";
      __int16 v162 = 1024;
      int v163 = 1023;
      __int16 v164 = 2080;
      v165 = v113;
      __int16 v166 = 1024;
      int v167 = v114;
      int v24 = "%{public}s:%i \"%s\" errno=%d Failed to set non-blocking.";
LABEL_27:
      __int16 v48 = v20;
      uint32_t v49 = 34;
LABEL_28:
      _os_log_impl(&dword_2269FD000, v48, OS_LOG_TYPE_ERROR, v24, buf, v49);
LABEL_29:
      dispatch_get_specific(*v14);
      int v50 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v50) {
        v50(3, "%s:%i failed to open socket %s", "NFHardwareSerialOpen", 1151, a1);
      }
      dispatch_get_specific(*v14);
      socklen_t v51 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        goto LABEL_72;
      }
      LODWORD(handler[0]) = 136446722;
      *(void *)((char *)handler + 4) = "NFHardwareSerialOpen";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 1151;
      WORD1(handler[1]) = 2080;
      *(void *)((char *)&handler[1] + 4) = a1;
      speed_t v52 = "%{public}s:%i failed to open socket %s";
LABEL_71:
      _os_log_impl(&dword_2269FD000, v51, OS_LOG_TYPE_ERROR, v52, (uint8_t *)handler, 0x1Cu);
LABEL_72:
      NFHardwareSerialClose((uint64_t)v6);
      return 0;
    }
    if (!**((unsigned char **)v6 + 1))
    {
      if (getsockopt(*v6, 2, 1078490131, (void *)(v12 + 8), &v157))
      {
        dispatch_get_specific(*v14);
        uint64_t v85 = NFLogGetLogger();
        if (v85)
        {
          v86 = (void (*)(uint64_t, const char *, ...))v85;
          v87 = __error();
          __int16 v88 = strerror(*v87);
          int v89 = __error();
          v86(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "_NFHardwareSerialOpenSocket", 1036, v88, *v89);
        }
        dispatch_get_specific(*v14);
        uint64_t v20 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        __int16 v90 = __error();
        v91 = strerror(*v90);
        int v92 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 1036;
        __int16 v164 = 2080;
        v165 = v91;
        __int16 v166 = 1024;
        int v167 = v92;
        int v24 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
        goto LABEL_27;
      }
      *(void *)(v12 + 24) = 232192;
      *(void *)(v12 + 8) |= 4uLL;
      cfmakeraw((termios *)(v12 + 8));
      if (cfsetspeed((termios *)(*((void *)v6 + 1) + 8), 0x1C200uLL))
      {
        dispatch_get_specific(*v14);
        uint64_t v115 = NFLogGetLogger();
        if (v115)
        {
          v116 = (void (*)(uint64_t, const char *, ...))v115;
          v117 = __error();
          v118 = strerror(*v117);
          v119 = __error();
          v116(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenSocket", 1050, v118, *v119, 115200);
        }
        dispatch_get_specific(*v14);
        v120 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        v121 = __error();
        v122 = strerror(*v121);
        int v123 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136447234;
        v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 1050;
        __int16 v164 = 2080;
        v165 = v122;
        __int16 v166 = 1024;
        int v167 = v123;
        __int16 v168 = 1024;
        int v169 = 115200;
        int v24 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
        __int16 v48 = v120;
        uint32_t v49 = 40;
        goto LABEL_28;
      }
      if (setsockopt(*v6, 2, -2142735340, (const void *)(v12 + 8), 0x48u))
      {
        dispatch_get_specific(*v14);
        uint64_t v134 = NFLogGetLogger();
        if (v134)
        {
          v135 = (void (*)(uint64_t, const char *, ...))v134;
          v136 = __error();
          v137 = strerror(*v136);
          v138 = __error();
          v135(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "_NFHardwareSerialOpenSocket", 1055, v137, *v138);
        }
        dispatch_get_specific(*v14);
        uint64_t v20 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        v139 = __error();
        v140 = strerror(*v139);
        int v141 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        v161 = "_NFHardwareSerialOpenSocket";
        __int16 v162 = 1024;
        int v163 = 1055;
        __int16 v164 = 2080;
        v165 = v140;
        __int16 v166 = 1024;
        int v167 = v141;
        int v24 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL";
        goto LABEL_27;
      }
    }
    goto LABEL_15;
  }
  uint64_t v25 = *((void *)v6 + 1);
  int v26 = open(a1, 131078);
  *int v6 = v26;
  if (v26 < 0)
  {
    CFTypeID v53 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v54 = NFLogGetLogger();
    if (v54)
    {
      __int16 v55 = (void (*)(uint64_t, const char *, ...))v54;
      int v56 = __error();
      __int16 v57 = strerror(*v56);
      speed_t v58 = __error();
      v55(3, "%s:%i \"%s\" errno=%d open", "_NFHardwareSerialOpenDeviceNode", 929, v57, *v58);
    }
    dispatch_get_specific(*v53);
    __int16 v59 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      int v60 = __error();
      __int16 v61 = strerror(*v60);
      int v62 = *__error();
      LODWORD(handler[0]) = 136446978;
      *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 929;
      WORD1(handler[1]) = 2080;
      *(void *)((char *)&handler[1] + 4) = v61;
      WORD6(handler[1]) = 1024;
      *(_DWORD *)((char *)&handler[1] + 14) = v62;
      _os_log_impl(&dword_2269FD000, v59, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d open", (uint8_t *)handler, 0x22u);
    }
    *int v6 = 0;
    goto LABEL_67;
  }
  if (**((unsigned char **)v6 + 1)) {
    goto LABEL_15;
  }
  if (ioctl(v26, 0x2000740DuLL))
  {
    uint64_t v63 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v64 = NFLogGetLogger();
    if (v64)
    {
      v65 = (void (*)(uint64_t, const char *, ...))v64;
      v66 = __error();
      v67 = strerror(*v66);
      v68 = __error();
      v65(3, "%s:%i \"%s\" errno=%d ioctl: TIOCEXCL", "_NFHardwareSerialOpenDeviceNode", 942, v67, *v68);
    }
    dispatch_get_specific(*v63);
    uint64_t v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    v70 = __error();
    v71 = strerror(*v70);
    int v72 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 942;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v71;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v72;
    v73 = "%{public}s:%i \"%s\" errno=%d ioctl: TIOCEXCL";
    goto LABEL_65;
  }
  if (tcgetattr(*v6, (termios *)(v25 + 8)))
  {
    v76 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v77 = NFLogGetLogger();
    if (v77)
    {
      v78 = (void (*)(uint64_t, const char *, ...))v77;
      v79 = __error();
      v80 = strerror(*v79);
      v81 = __error();
      v78(3, "%s:%i \"%s\" errno=%d tcgetattr", "_NFHardwareSerialOpenDeviceNode", 948, v80, *v81);
    }
    dispatch_get_specific(*v76);
    uint64_t v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    v82 = __error();
    v83 = strerror(*v82);
    int v84 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 948;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v83;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v84;
    v73 = "%{public}s:%i \"%s\" errno=%d tcgetattr";
    goto LABEL_65;
  }
  if (fcntl(*v6, 4, 0))
  {
    v93 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v94 = NFLogGetLogger();
    if (v94)
    {
      long long v95 = (void (*)(uint64_t, const char *, ...))v94;
      uint64_t v96 = __error();
      v97 = strerror(*v96);
      v98 = __error();
      v95(3, "%s:%i \"%s\" errno=%d fcntl: F_SETFL", "_NFHardwareSerialOpenDeviceNode", 954, v97, *v98);
    }
    dispatch_get_specific(*v93);
    uint64_t v69 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    v99 = __error();
    v100 = strerror(*v99);
    int v101 = *__error();
    LODWORD(handler[0]) = 136446978;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 954;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v100;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v101;
    v73 = "%{public}s:%i \"%s\" errno=%d fcntl: F_SETFL";
LABEL_65:
    v102 = v69;
    uint32_t v103 = 34;
LABEL_66:
    _os_log_impl(&dword_2269FD000, v102, OS_LOG_TYPE_ERROR, v73, (uint8_t *)handler, v103);
    goto LABEL_67;
  }
  *(void *)(v25 + 8) |= 4uLL;
  *(_OWORD *)(v25 + 16) = xmmword_226A16040;
  *(void *)(v25 + 32) = 0;
  *(_WORD *)(v25 + 56) = 1;
  if (cfsetispeed((termios *)(*((void *)v6 + 1) + 8), 0x1C200uLL)
    || cfsetospeed((termios *)(*((void *)v6 + 1) + 8), 0x1C200uLL))
  {
    v124 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v125 = NFLogGetLogger();
    if (v125)
    {
      v126 = (void (*)(uint64_t, const char *, ...))v125;
      v127 = __error();
      v128 = strerror(*v127);
      v129 = __error();
      v126(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenDeviceNode", 967, v128, *v129, 115200);
    }
    dispatch_get_specific(*v124);
    v130 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    v131 = __error();
    v132 = strerror(*v131);
    int v133 = *__error();
    LODWORD(handler[0]) = 136447234;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 967;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v132;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v133;
    WORD1(handler[2]) = 1024;
    DWORD1(handler[2]) = 115200;
    v73 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
    goto LABEL_89;
  }
  if (tcsetattr(*v6, 0, (const termios *)(*((void *)v6 + 1) + 8)))
  {
    v142 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t v143 = NFLogGetLogger();
    if (v143)
    {
      v144 = (void (*)(uint64_t, const char *, ...))v143;
      v145 = __error();
      v146 = strerror(*v145);
      v147 = __error();
      v144(3, "%s:%i \"%s\" errno=%d baudRate=%d", "_NFHardwareSerialOpenDeviceNode", 972, v146, *v147, 115200);
    }
    dispatch_get_specific(*v142);
    v130 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    v148 = __error();
    v149 = strerror(*v148);
    int v150 = *__error();
    LODWORD(handler[0]) = 136447234;
    *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 972;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = v149;
    WORD6(handler[1]) = 1024;
    *(_DWORD *)((char *)&handler[1] + 14) = v150;
    WORD1(handler[2]) = 1024;
    DWORD1(handler[2]) = 115200;
    v73 = "%{public}s:%i \"%s\" errno=%d baudRate=%d";
LABEL_89:
    v102 = v130;
    uint32_t v103 = 40;
    goto LABEL_66;
  }
  if (*(unsigned char *)(*((void *)v6 + 1) + 97))
  {
    v151 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v152 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v152) {
      v152(6, "%s:%i Using blocking socket for relay", "_NFHardwareSerialOpenDeviceNode", 977);
    }
    dispatch_get_specific(*v151);
    v153 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(handler[0]) = 136446466;
      *(void *)((char *)handler + 4) = "_NFHardwareSerialOpenDeviceNode";
      WORD6(handler[0]) = 1024;
      *(_DWORD *)((char *)handler + 14) = 977;
      _os_log_impl(&dword_2269FD000, v153, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Using blocking socket for relay", (uint8_t *)handler, 0x12u);
    }
    goto LABEL_15;
  }
  if (!sub_226A0EDA8(v6, 1))
  {
LABEL_67:
    v104 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    v105 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v105) {
      v105(3, "%s:%i failed to open device %s", "NFHardwareSerialOpen", 1157, a1);
    }
    dispatch_get_specific(*v104);
    socklen_t v51 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    LODWORD(handler[0]) = 136446722;
    *(void *)((char *)handler + 4) = "NFHardwareSerialOpen";
    WORD6(handler[0]) = 1024;
    *(_DWORD *)((char *)handler + 14) = 1157;
    WORD1(handler[1]) = 2080;
    *(void *)((char *)&handler[1] + 4) = a1;
    speed_t v52 = "%{public}s:%i failed to open device %s";
    goto LABEL_71;
  }
LABEL_15:
  *((void *)v8 + 13) = a2;
  dispatch_retain(a2);
  uint64_t v27 = *((void *)v6 + 1);
  if (!*(unsigned char *)(v27 + 97))
  {
    uintptr_t v28 = *v6;
    *(void *)(v27 + 112) = dispatch_source_create(MEMORY[0x263EF83E8], v28, 0, *(dispatch_queue_t *)(v27 + 104));
    dispatch_set_qos_class_fallback();
    dispatch_source_set_event_handler(*(dispatch_source_t *)(v27 + 112), &unk_26DA89C08);
    dispatch_source_set_cancel_handler(*(dispatch_source_t *)(v27 + 112), &unk_26DA89C28);
    dispatch_activate(*(dispatch_object_t *)(v27 + 112));
    dispatch_suspend(*(dispatch_object_t *)(v27 + 112));
    *(_DWORD *)(v27 + 120) = 1;
    *(void *)(*((void *)v6 + 1) + 128) = 0;
    *(void *)(v27 + 152) = 0;
    *(void *)(v27 + 160) = 0;
    int v29 = dispatch_source_create(MEMORY[0x263EF8418], v28, 0, *(dispatch_queue_t *)(v27 + 104));
    *(void *)(v27 + 136) = v29;
    dispatch_source_set_event_handler(v29, &unk_26DA89C48);
    __int16 v30 = *(NSObject **)(v27 + 136);
    *(void *)&handler[0] = MEMORY[0x263EF8330];
    *((void *)&handler[0] + 1) = 0x40000000;
    *(void *)&handler[1] = sub_226A12E80;
    *((void *)&handler[1] + 1) = &unk_2647C1D78;
    LODWORD(handler[2]) = v28;
    dispatch_source_set_cancel_handler(v30, handler);
    dispatch_activate(*(dispatch_object_t *)(v27 + 136));
    dispatch_suspend(*(dispatch_object_t *)(v27 + 136));
    *(_DWORD *)(v27 + 144) = 1;
  }
  return v6;
}

void NFHardwareSerialClose(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareSerialClose", 1175);
  }
  dispatch_get_specific(*v2);
  int v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    unsigned int v10 = "NFHardwareSerialClose";
    __int16 v11 = 1024;
    int v12 = 1175;
    _os_log_impl(&dword_2269FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    if (v5)
    {
      NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v5 + 88), 2, 0, 0);
      uint64_t v6 = *(void *)(a1 + 8);
      if (!*(void *)(v6 + 136) && (*(_DWORD *)a1 & 0x80000000) == 0)
      {
        close(*(_DWORD *)a1);
        *(_DWORD *)a1 = -1;
        uint64_t v6 = *(void *)(a1 + 8);
      }
      if (!*(unsigned char *)(v6 + 97))
      {
        if (*(void *)(v6 + 112))
        {
          dispatch_source_set_event_handler(*(dispatch_source_t *)(v6 + 112), &unk_26DA89C68);
          uint64_t v7 = *(void *)(a1 + 8);
          if (*(_DWORD *)(v7 + 120))
          {
            dispatch_resume(*(dispatch_object_t *)(v7 + 112));
            uint64_t v7 = *(void *)(a1 + 8);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(v7 + 112));
          dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 8) + 112));
          uint64_t v6 = *(void *)(a1 + 8);
          *(void *)(v6 + 112) = 0;
        }
        if (*(void *)(v6 + 136))
        {
          dispatch_source_set_event_handler(*(dispatch_source_t *)(v6 + 136), &unk_26DA89C88);
          uint64_t v8 = *(void *)(a1 + 8);
          if (*(_DWORD *)(v8 + 144))
          {
            dispatch_resume(*(dispatch_object_t *)(v8 + 136));
            uint64_t v8 = *(void *)(a1 + 8);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(v8 + 136));
          dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 8) + 136));
          uint64_t v6 = *(void *)(a1 + 8);
          *(void *)(v6 + 136) = 0;
        }
      }
      if (*(void *)(v6 + 104))
      {
        dispatch_release(*(dispatch_object_t *)(v6 + 104));
        uint64_t v6 = *(void *)(a1 + 8);
        *(void *)(v6 + 104) = 0;
      }
      free((void *)v6);
    }
    free((void *)a1);
  }
}

uint64_t NFHardwareSerialPower()
{
  return 1;
}

BOOL NFHardwareSerialHasCTS(BOOL result)
{
  if (result)
  {
    CFDictionaryRef v1 = *(unsigned __int8 **)(result + 8);
    return v1 && *v1 == 0;
  }
  return result;
}

uint64_t NFHardwareSerialGetCTS(uint64_t result)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  CFDictionaryRef v1 = *(unsigned char **)(result + 8);
  if (!v1) {
    return 0;
  }
  if (!*v1)
  {
    unsigned int v38 = 0;
    if (v1[1])
    {
      socklen_t v37 = 4;
      int v6 = getsockopt(*(_DWORD *)result, 2, 1074033770, &v38, &v37);
      uint64_t v7 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      BOOL v9 = Logger;
      if (v6)
      {
        if (Logger)
        {
          unsigned int v10 = __error();
          __int16 v11 = strerror(*v10);
          int v12 = __error();
          v9(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL", "NFHardwareSerialGetCTS", 1243, v11, *v12);
        }
        dispatch_get_specific(*v7);
        uint64_t v13 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v14 = __error();
        uint64_t v15 = strerror(*v14);
        int v16 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        uint64_t v40 = "NFHardwareSerialGetCTS";
        __int16 v41 = 1024;
        int v42 = 1243;
        __int16 v43 = 2080;
        BOOL v44 = v15;
        __int16 v45 = 1024;
        int v46 = v16;
        io_service_t v17 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL";
LABEL_20:
        _os_log_impl(&dword_2269FD000, v13, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
        return 0xFFFFFFFFLL;
      }
      if (Logger)
      {
        if ((v38 & 0x20) != 0) {
          uintptr_t v28 = "HIGH";
        }
        else {
          uintptr_t v28 = "LOW";
        }
        Logger(6, "%s:%i Flow is %s (line=%x)", "NFHardwareSerialGetCTS", 1247, v28, v38);
      }
      dispatch_get_specific(*v7);
      int v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if ((v38 & 0x20) != 0) {
          __int16 v30 = "HIGH";
        }
        else {
          __int16 v30 = "LOW";
        }
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        uint64_t v40 = "NFHardwareSerialGetCTS";
        __int16 v41 = 1024;
        int v42 = 1247;
        __int16 v43 = 2080;
        BOOL v44 = (void *)v30;
        __int16 v45 = 1024;
        int v46 = v38;
        uint64_t v31 = "%{public}s:%i Flow is %s (line=%x)";
        uint64_t v32 = v29;
        uint32_t v33 = 34;
LABEL_41:
        _os_log_impl(&dword_2269FD000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
    }
    else
    {
      int v18 = ioctl(*(_DWORD *)result, 0x4004746AuLL, &v38);
      int v19 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      int v21 = v20;
      if (v18)
      {
        if (v20)
        {
          __int16 v22 = __error();
          int v23 = strerror(*v22);
          int v24 = __error();
          v21(3, "%s:%i \"%s\" errno=%d TIOCMSET", "NFHardwareSerialGetCTS", 1251, v23, *v24);
        }
        dispatch_get_specific(*v19);
        uint64_t v13 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v25 = __error();
        int v26 = strerror(*v25);
        int v27 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        uint64_t v40 = "NFHardwareSerialGetCTS";
        __int16 v41 = 1024;
        int v42 = 1251;
        __int16 v43 = 2080;
        BOOL v44 = v26;
        __int16 v45 = 1024;
        int v46 = v27;
        io_service_t v17 = "%{public}s:%i \"%s\" errno=%d TIOCMSET";
        goto LABEL_20;
      }
      if (v20)
      {
        if ((v38 & 0x20) != 0) {
          uint64_t v34 = "HIGH";
        }
        else {
          uint64_t v34 = "LOW";
        }
        v20(6, "%s:%i Flow is %s", "NFHardwareSerialGetCTS", 1254, v34);
      }
      dispatch_get_specific(*v19);
      int v35 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = "HIGH";
        uint64_t v40 = "NFHardwareSerialGetCTS";
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        if ((v38 & 0x20) == 0) {
          uint64_t v36 = "LOW";
        }
        __int16 v41 = 1024;
        int v42 = 1254;
        __int16 v43 = 2080;
        BOOL v44 = (void *)v36;
        uint64_t v31 = "%{public}s:%i Flow is %s";
        uint64_t v32 = v35;
        uint32_t v33 = 28;
        goto LABEL_41;
      }
    }
    return (v38 >> 5) & 1;
  }
  BOOL v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  ssize_t v3 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v3) {
    v3(6, "%s:%i Ignoring for SPMI", "NFHardwareSerialGetCTS", 1233);
  }
  dispatch_get_specific(*v2);
  int v4 = NFSharedLogGetLogger();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v5)
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    uint64_t v40 = "NFHardwareSerialGetCTS";
    __int16 v41 = 1024;
    int v42 = 1233;
    _os_log_impl(&dword_2269FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Ignoring for SPMI", buf, 0x12u);
    return 0;
  }
  return result;
}

BOOL NFHardwareSerialSetCRCEnabled(uint64_t a1, int a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v2 = *(unsigned char **)(a1 + 8);
  if (!*v2) {
    return 1;
  }
  int v25 = a2;
  int v3 = *(_DWORD *)a1;
  if (!v2[1])
  {
    if (ioctl(v3, 0x80047301uLL, &v25))
    {
      uint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        io_service_t v17 = (void (*)(uint64_t, const char *, ...))Logger;
        int v18 = __error();
        int v19 = strerror(*v18);
        uint64_t v20 = __error();
        v17(3, "%s:%i \"%s\" errno=%d IO_STOCKHOLM_CRC", "NFHardwareSerialSetCRCEnabled", 1277, v19, *v20);
      }
      dispatch_get_specific(*v15);
      int v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = __error();
        int v23 = strerror(*v22);
        int v24 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v27 = "NFHardwareSerialSetCRCEnabled";
        __int16 v28 = 1024;
        int v29 = 1277;
        __int16 v30 = 2080;
        uint64_t v31 = v23;
        __int16 v32 = 1024;
        int v33 = v24;
        _os_log_impl(&dword_2269FD000, v21, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d IO_STOCKHOLM_CRC", buf, 0x22u);
      }
    }
    return 1;
  }
  if (!setsockopt(v3, 2, -2147192063, &v25, 4u)) {
    return 1;
  }
  int v4 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v5 = NFLogGetLogger();
  if (v5)
  {
    int v6 = (void (*)(uint64_t, const char *, ...))v5;
    uint64_t v7 = __error();
    uint64_t v8 = strerror(*v7);
    BOOL v9 = __error();
    v6(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", "NFHardwareSerialSetCRCEnabled", 1271, v8, *v9);
  }
  dispatch_get_specific(*v4);
  unsigned int v10 = NFSharedLogGetLogger();
  BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v12 = __error();
    uint64_t v13 = strerror(*v12);
    int v14 = *__error();
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    int v27 = "NFHardwareSerialSetCRCEnabled";
    __int16 v28 = 1024;
    int v29 = 1271;
    __int16 v30 = 2080;
    uint64_t v31 = v13;
    __int16 v32 = 1024;
    int v33 = v14;
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL", buf, 0x22u);
    return 0;
  }
  return result;
}

BOOL NFHardwareSerialSetOnDemandClientMode(uint64_t a1, int a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v2 = *(unsigned char **)(a1 + 8);
  if (!*v2) {
    return 1;
  }
  int v25 = a2;
  int v3 = *(_DWORD *)a1;
  if (v2[1])
  {
    if (setsockopt(v3, 2, -2147192062, &v25, 4u))
    {
      int v4 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v6 = (void (*)(uint64_t, const char *, ...))Logger;
        uint64_t v7 = __error();
        uint64_t v8 = strerror(*v7);
        BOOL v9 = __error();
        v6(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_ON_DEMAND_CLIENT", "NFHardwareSerialSetOnDemandClientMode", 1297, v8, *v9);
      }
      dispatch_get_specific(*v4);
      unsigned int v10 = NFSharedLogGetLogger();
      BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (result)
      {
        int v12 = __error();
        uint64_t v13 = strerror(*v12);
        int v14 = *__error();
        *(_DWORD *)pthread_mutex_t buf = 136446978;
        int v27 = "NFHardwareSerialSetOnDemandClientMode";
        __int16 v28 = 1024;
        int v29 = 1297;
        __int16 v30 = 2080;
        uint64_t v31 = v13;
        __int16 v32 = 1024;
        int v33 = v14;
        uint64_t v15 = "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_ON_DEMAND_CLIENT";
LABEL_13:
        _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0x22u);
        return 0;
      }
      return result;
    }
    return 1;
  }
  if (!ioctl(v3, 0x80047302uLL, &v25)) {
    return 1;
  }
  int v16 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t v17 = NFLogGetLogger();
  if (v17)
  {
    int v18 = (void (*)(uint64_t, const char *, ...))v17;
    int v19 = __error();
    uint64_t v20 = strerror(*v19);
    int v21 = __error();
    v18(3, "%s:%i \"%s\" errno=%d IO_STOCKHOLM_ON_DEMAND_CLIENT", "NFHardwareSerialSetOnDemandClientMode", 1303, v20, *v21);
  }
  dispatch_get_specific(*v16);
  unsigned int v10 = NFSharedLogGetLogger();
  BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (result)
  {
    __int16 v22 = __error();
    int v23 = strerror(*v22);
    int v24 = *__error();
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    int v27 = "NFHardwareSerialSetOnDemandClientMode";
    __int16 v28 = 1024;
    int v29 = 1303;
    __int16 v30 = 2080;
    uint64_t v31 = v23;
    __int16 v32 = 1024;
    int v33 = v24;
    uint64_t v15 = "%{public}s:%i \"%s\" errno=%d IO_STOCKHOLM_ON_DEMAND_CLIENT";
    goto LABEL_13;
  }
  return result;
}

uint64_t NFHardwareSerialQuerySPMIError(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  socklen_t v40 = 0;
  uint64_t v8 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareSerialQuerySPMIError", 1316);
  }
  dispatch_get_specific(*v8);
  unsigned int v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    int v42 = "NFHardwareSerialQuerySPMIError";
    __int16 v43 = 1024;
    int v44 = 1316;
    _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  if (!a2 || !a3)
  {
    dispatch_get_specific(*v8);
    int v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v24) {
      v24(3, "%s:%i Invalid parameter", "NFHardwareSerialQuerySPMIError", 1319);
    }
    dispatch_get_specific(*v8);
    int v25 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    int v42 = "NFHardwareSerialQuerySPMIError";
    __int16 v43 = 1024;
    int v44 = 1319;
    int v21 = "%{public}s:%i Invalid parameter";
LABEL_18:
    __int16 v22 = v25;
    uint32_t v23 = 18;
    goto LABEL_19;
  }
  __int16 v11 = *(unsigned char **)(a1 + 8);
  if (!*v11)
  {
    *a3 = 0;
    return 1;
  }
  if (!v11[1])
  {
    dispatch_get_specific(*v8);
    __int16 v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v28) {
      v28(3, "%s:%i Not implemented.", "NFHardwareSerialQuerySPMIError", 1344);
    }
    dispatch_get_specific(*v8);
    int v25 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    int v42 = "NFHardwareSerialQuerySPMIError";
    __int16 v43 = 1024;
    int v44 = 1344;
    int v21 = "%{public}s:%i Not implemented.";
    goto LABEL_18;
  }
  socklen_t v40 = *a3;
  if (getsockopt(*(_DWORD *)a1, 2, -1069518077, a2, &v40))
  {
    dispatch_get_specific(*v8);
    uint64_t v12 = NFLogGetLogger();
    if (v12)
    {
      uint64_t v13 = (void (*)(uint64_t, const char *, ...))v12;
      int v14 = __error();
      uint64_t v15 = strerror(*v14);
      int v16 = __error();
      v13(3, "%s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", "NFHardwareSerialQuerySPMIError", 1332, v15, *v16);
    }
    dispatch_get_specific(*v8);
    uint64_t v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    int v18 = __error();
    int v19 = strerror(*v18);
    int v20 = *__error();
    *(_DWORD *)pthread_mutex_t buf = 136446978;
    int v42 = "NFHardwareSerialQuerySPMIError";
    __int16 v43 = 1024;
    int v44 = 1332;
    __int16 v45 = 2080;
    int v46 = v19;
    __int16 v47 = 1024;
    int v48 = v20;
    int v21 = "%{public}s:%i \"%s\" errno=%d getsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS";
    __int16 v22 = v17;
    uint32_t v23 = 34;
LABEL_19:
    _os_log_impl(&dword_2269FD000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    return 0;
  }
  *a3 = v40;
  int v39 = a4;
  int v29 = setsockopt(*(_DWORD *)a1, 2, -1069518077, &v39, 4u);
  BOOL v26 = v29 == 0;
  if (v29)
  {
    dispatch_get_specific(*v8);
    uint64_t v30 = NFLogGetLogger();
    if (v30)
    {
      uint64_t v31 = (void (*)(uint64_t, const char *, ...))v30;
      __int16 v32 = __error();
      int v33 = strerror(*v32);
      uint64_t v34 = __error();
      v31(3, "%s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", "NFHardwareSerialQuerySPMIError", 1339, v33, *v34);
    }
    dispatch_get_specific(*v8);
    int v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = __error();
      socklen_t v37 = strerror(*v36);
      int v38 = *__error();
      *(_DWORD *)pthread_mutex_t buf = 136446978;
      int v42 = "NFHardwareSerialQuerySPMIError";
      __int16 v43 = 1024;
      int v44 = 1339;
      __int16 v45 = 2080;
      int v46 = v37;
      __int16 v47 = 1024;
      int v48 = v38;
      _os_log_impl(&dword_2269FD000, v35, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d setsockopt: SYSPROTO_CONTROL:IO_STOCKHOLM_SPMIERRORS", buf, 0x22u);
    }
  }
  return v26;
}

void sub_226A11F44(const char *a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  uint64_t v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (MatchingService)
  {
    if (Logger) {
      Logger(6, "%s:%i %s found", "_NFHardwarePrintNode", 143, a1);
    }
    dispatch_get_specific(*v5);
    uint64_t v7 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 143;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = a1;
      _os_log_impl(&dword_2269FD000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s found", buf, 0x1Cu);
    }
    io_registry_entry_t child = 0;
    if (IORegistryEntryGetChildEntry(MatchingService, "IOService", &child))
    {
      dispatch_get_specific(*v5);
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v8) {
        v8(6, "%s:%i %s has no child", "_NFHardwarePrintNode", 156, a1);
      }
      dispatch_get_specific(*v5);
      BOOL v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 156;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        _os_log_impl(&dword_2269FD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has no child", buf, 0x1Cu);
      }
    }
    else if (child)
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v53 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      memset(buf, 0, sizeof(buf));
      if (!MEMORY[0x22A65E6E0]())
      {
        dispatch_get_specific(*v5);
        __int16 v11 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v11) {
          v11(6, "%s:%i %s has child %s", "_NFHardwarePrintNode", 151, a1, (const char *)buf);
        }
        dispatch_get_specific(*v5);
        uint64_t v12 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v42 = 136446978;
          __int16 v43 = "_NFHardwarePrintNode";
          __int16 v44 = 1024;
          int v45 = 151;
          __int16 v46 = 2080;
          __int16 v47 = a1;
          __int16 v48 = 2080;
          uint64_t v49 = buf;
          _os_log_impl(&dword_2269FD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has child %s", v42, 0x26u);
        }
      }
      IOObjectRelease(child);
    }
    CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"IONameMatch", 0, 0);
    if (CFProperty)
    {
      CFStringRef v14 = CFProperty;
      uint64_t v15 = sub_226A126E8(CFProperty);
      dispatch_get_specific(*v5);
      int v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v16)
      {
        if (v15) {
          uint64_t v17 = v15;
        }
        else {
          uint64_t v17 = "??";
        }
        v16(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 162, a1, "IONameMatch", v17);
      }
      dispatch_get_specific(*v5);
      int v18 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (v15) {
          int v19 = v15;
        }
        else {
          int v19 = "??";
        }
        *(_DWORD *)pthread_mutex_t buf = 136447234;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 162;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "IONameMatch";
        *(_WORD *)&buf[38] = 2080;
        *(void *)&buf[40] = v19;
        _os_log_impl(&dword_2269FD000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v15) {
        free(v15);
      }
      CFRelease(v14);
    }
    CFStringRef v20 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"IONameMatched", 0, 0);
    if (v20)
    {
      CFStringRef v21 = v20;
      __int16 v22 = sub_226A126E8(v20);
      dispatch_get_specific(*v5);
      uint32_t v23 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v23)
      {
        if (v22) {
          int v24 = v22;
        }
        else {
          int v24 = "??";
        }
        v23(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 170, a1, "IONameMatched", v24);
      }
      dispatch_get_specific(*v5);
      int v25 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v22) {
          BOOL v26 = v22;
        }
        else {
          BOOL v26 = "??";
        }
        *(_DWORD *)pthread_mutex_t buf = 136447234;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 170;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "IONameMatched";
        *(_WORD *)&buf[38] = 2080;
        *(void *)&buf[40] = v26;
        _os_log_impl(&dword_2269FD000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v22) {
        free(v22);
      }
      CFRelease(v21);
    }
    CFStringRef v27 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"IOMatchCategory", 0, 0);
    if (v27)
    {
      CFStringRef v28 = v27;
      int v29 = sub_226A126E8(v27);
      dispatch_get_specific(*v5);
      uint64_t v30 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v30)
      {
        if (v29) {
          uint64_t v31 = v29;
        }
        else {
          uint64_t v31 = "??";
        }
        v30(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 178, a1, "IOMatchCategory", v31);
      }
      dispatch_get_specific(*v5);
      __int16 v32 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (v29) {
          int v33 = v29;
        }
        else {
          int v33 = "??";
        }
        *(_DWORD *)pthread_mutex_t buf = 136447234;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 178;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "IOMatchCategory";
        *(_WORD *)&buf[38] = 2080;
        *(void *)&buf[40] = v33;
        _os_log_impl(&dword_2269FD000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v29) {
        free(v29);
      }
      CFRelease(v28);
    }
    CFStringRef v34 = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, @"IOUserClientClass", 0, 0);
    if (v34)
    {
      CFStringRef v35 = v34;
      uint64_t v36 = sub_226A126E8(v34);
      dispatch_get_specific(*v5);
      socklen_t v37 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v37)
      {
        if (v36) {
          int v38 = v36;
        }
        else {
          int v38 = "??";
        }
        v37(6, "%s:%i %s has property %s : %s", "_NFHardwarePrintNode", 186, a1, "IOUserClientClass", v38);
      }
      dispatch_get_specific(*v5);
      int v39 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        if (v36) {
          socklen_t v40 = v36;
        }
        else {
          socklen_t v40 = "??";
        }
        *(_DWORD *)pthread_mutex_t buf = 136447234;
        *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 186;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = a1;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = "IOUserClientClass";
        *(_WORD *)&buf[38] = 2080;
        *(void *)&buf[40] = v40;
        _os_log_impl(&dword_2269FD000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has property %s : %s", buf, 0x30u);
      }
      if (v36) {
        free(v36);
      }
      CFRelease(v35);
    }
    IOObjectRelease(MatchingService);
  }
  else
  {
    if (Logger) {
      Logger(6, "%s:%i %s NOT found", "_NFHardwarePrintNode", 193, a1);
    }
    dispatch_get_specific(*v5);
    unsigned int v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      *(void *)&uint8_t buf[4] = "_NFHardwarePrintNode";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 193;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = a1;
      _os_log_impl(&dword_2269FD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s NOT found", buf, 0x1Cu);
    }
  }
}

char *sub_226A126E8(const __CFString *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFStringGetTypeID())
  {
    CFDictionaryRef v3 = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
    if (v3) {
      CFStringGetCString(a1, v3, 256, 0x8000100u);
    }
    return v3;
  }
  else
  {
    return strdup((const char *)&unk_226A18243);
  }
}

uint64_t sub_226A12780(io_iterator_t a1, const char *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unsigned int v28 = 0;
  if (a1 && IOIteratorIsValid(a1))
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    while (1)
    {
      uint64_t v5 = IOIteratorNext(a1);
      if (!v5) {
        return 0;
      }
      uint64_t v6 = v5;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v30 = 0u;
      memset(__s1, 0, sizeof(__s1));
      uint64_t v7 = MEMORY[0x22A65E6E0](v5, __s1) ? 0 : strdup(__s1);
      CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, @"IONameMatch", 0, 0);
      if (CFProperty)
      {
        CFStringRef v9 = CFProperty;
        unsigned int v10 = sub_226A126E8(CFProperty);
        if (!v10) {
          goto LABEL_12;
        }
        __int16 v11 = v10;
        if (strcmp(v10, a2)) {
          goto LABEL_11;
        }
        dispatch_get_specific(*v4);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger) {
          Logger(6, "%s:%i Found property %s : %s", "_NFHardwareIsEntryMatching", 208, "IONameMatch", v11);
        }
        dispatch_get_specific(*v4);
        uint64_t v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__s1 = 136446978;
          *(void *)&__s1[4] = "_NFHardwareIsEntryMatching";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 208;
          *(_WORD *)&__s1[18] = 2080;
          *(void *)&__s1[20] = "IONameMatch";
          *(_WORD *)&__s1[28] = 2080;
          *(void *)&__s1[30] = v11;
          _os_log_impl(&dword_2269FD000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found property %s : %s", (uint8_t *)__s1, 0x26u);
        }
        free(v11);
        CFRelease(v9);
        CFStringRef v16 = (const __CFString *)IORegistryEntryCreateCFProperty(v6, @"IOClass", 0, 0);
        if (v16) {
          break;
        }
      }
LABEL_13:
      if (MEMORY[0x22A65E6D0](v6, "IOService", &v28))
      {
        uint64_t v12 = 0;
        BOOL v13 = 0;
      }
      else
      {
        IOObjectRelease(v6);
        uint64_t v12 = sub_226A12780(v28, a2);
        BOOL v13 = v12 != 0;
        LODWORD(v6) = v28;
      }
      IOObjectRelease(v6);
      if (v7) {
        free(v7);
      }
      if (v13) {
        return v12;
      }
      if (!IOIteratorIsValid(a1)) {
        goto LABEL_46;
      }
    }
    CFStringRef v9 = v16;
    uint64_t v17 = sub_226A126E8(v16);
    if (v17)
    {
      __int16 v11 = v17;
      if (!strcmp(v17, "AppleStockholmControl"))
      {
        dispatch_get_specific(*v4);
        int v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v18) {
          v18(6, "%s:%i Found property %s : %s", "_NFHardwareIsEntryMatching", 220, "IOPropertyMatch", v11);
        }
        dispatch_get_specific(*v4);
        int v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__s1 = 136446978;
          *(void *)&__s1[4] = "_NFHardwareIsEntryMatching";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 220;
          *(_WORD *)&__s1[18] = 2080;
          *(void *)&__s1[20] = "IOPropertyMatch";
          *(_WORD *)&__s1[28] = 2080;
          *(void *)&__s1[30] = v11;
          _os_log_impl(&dword_2269FD000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Found property %s : %s", (uint8_t *)__s1, 0x26u);
        }
        free(v11);
        CFRelease(v9);
        dispatch_get_specific(*v4);
        CFStringRef v20 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v20)
        {
          if (v7) {
            CFStringRef v21 = v7;
          }
          else {
            CFStringRef v21 = "??";
          }
          v20(6, "%s:%i %s has matching {%s / %s}", "_NFHardwareWalkTree", 268, v21, "AppleStockholmControl", a2);
        }
        dispatch_get_specific(*v4);
        __int16 v22 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          if (v7) {
            uint32_t v23 = v7;
          }
          else {
            uint32_t v23 = "??";
          }
          *(_DWORD *)__s1 = 136447234;
          *(void *)&__s1[4] = "_NFHardwareWalkTree";
          *(_WORD *)&__s1[12] = 1024;
          *(_DWORD *)&__s1[14] = 268;
          *(_WORD *)&__s1[18] = 2080;
          *(void *)&__s1[20] = v23;
          *(_WORD *)&__s1[28] = 2080;
          *(void *)&__s1[30] = "AppleStockholmControl";
          *(_WORD *)&__s1[38] = 2080;
          *(void *)&__s1[40] = a2;
          _os_log_impl(&dword_2269FD000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s:%i %s has matching {%s / %s}", (uint8_t *)__s1, 0x30u);
        }
        if (v7) {
          free(v7);
        }
        return v6;
      }
LABEL_11:
      free(v11);
    }
LABEL_12:
    CFRelease(v9);
    goto LABEL_13;
  }
  uint64_t v12 = 0;
LABEL_46:
  int v24 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  int v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v25) {
    v25(3, "%s:%i Invalid iterator", "_NFHardwareWalkTree", 257);
  }
  dispatch_get_specific(*v24);
  BOOL v26 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__s1 = 136446466;
    *(void *)&__s1[4] = "_NFHardwareWalkTree";
    *(_WORD *)&__s1[12] = 1024;
    *(_DWORD *)&__s1[14] = 257;
    _os_log_impl(&dword_2269FD000, v26, OS_LOG_TYPE_ERROR, "%{public}s:%i Invalid iterator", (uint8_t *)__s1, 0x12u);
  }
  return v12;
}

void sub_226A12CA4()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  io_object_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "_NFHardwareSerialCreateSources_block_invoke", 1071);
  }
  dispatch_get_specific(*v0);
  CFTypeID v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    int v4 = "_NFHardwareSerialCreateSources_block_invoke";
    __int16 v5 = 1024;
    int v6 = 1071;
    _os_log_impl(&dword_2269FD000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
}

void sub_226A12D94()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  io_object_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Error ! Unexpected invocation of write handler", "_NFHardwareSerialCreateSources_block_invoke_2", 1081);
  }
  dispatch_get_specific(*v0);
  CFTypeID v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    int v4 = "_NFHardwareSerialCreateSources_block_invoke_2";
    __int16 v5 = 1024;
    int v6 = 1081;
    _os_log_impl(&dword_2269FD000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of write handler", buf, 0x12u);
  }
}

uint64_t sub_226A12E80(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_226A12E88()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  io_object_t v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "_NFHardwareSerialDeleteSources_block_invoke", 1094);
  }
  dispatch_get_specific(*v0);
  CFTypeID v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    int v4 = "_NFHardwareSerialDeleteSources_block_invoke";
    __int16 v5 = 1024;
    int v6 = 1094;
    _os_log_impl(&dword_2269FD000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
}

int *NFHardwareSerialDebugger(int a1)
{
  if ((!a1 || (CFTypeID v2 = (int *)qword_26ABD86A0) == 0) && ((a1 & 1) != 0 || (CFTypeID v2 = (int *)qword_26ABD86A8) == 0))
  {
    CFTypeID v2 = (int *)malloc_type_calloc(1uLL, 0x58uLL, 0x10300409288EE5CuLL);
    if (v2)
    {
      if (qword_26ABD8698 != -1) {
        dispatch_once(&qword_26ABD8698, &unk_26DA89CA8);
      }
      BOOL v3 = byte_26ABD86B8 == 0;
      if (byte_26ABD86B8) {
        int v4 = 4142;
      }
      else {
        int v4 = 1024;
      }
      if (byte_26ABD86B8) {
        int v5 = 4096;
      }
      else {
        int v5 = 128;
      }
      *CFTypeID v2 = v4;
      v2[1] = v5;
      v2[2] = v5;
      int v6 = v4 + 37;
      if (v3) {
        char v7 = 7;
      }
      else {
        char v7 = 12;
      }
      size_t v8 = (v6 << v7);
      v2[6] = v8;
      *((void *)v2 + 2) = malloc_type_calloc(1uLL, v8, 0x100004077774924uLL);
      CFStringRef v9 = malloc_type_calloc(1uLL, *v2, 0x100004077774924uLL);
      uint64_t v10 = *((void *)v2 + 2);
      *((void *)v2 + 4) = v10;
      *((void *)v2 + 5) = v10;
      *((void *)v2 + 6) = 0;
      *((void *)v2 + 7) = v9;
      v2[16] = 0;
      *((unsigned char *)v2 + 68) = a1;
      *((void *)v2 + 9) = 0;
      __int16 v11 = &qword_26ABD86A8;
      v2[20] = 0;
      if (a1) {
        __int16 v11 = &qword_26ABD86A0;
      }
      *__int16 v11 = (uint64_t)v2;
    }
  }
  return v2;
}

uint64_t NFHardwareSerialDebugLastMessage(int a1)
{
  CFDictionaryRef v1 = &qword_26ABD86A8;
  if (!a1) {
    CFDictionaryRef v1 = &qword_26ABD86A0;
  }
  uint64_t v2 = *v1;
  if (*v1)
  {
    BOOL v3 = (os_unfair_lock_s *)(v2 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 80));
    uint64_t v2 = *(void *)(v2 + 72);
    os_unfair_lock_unlock(v3);
  }
  return v2;
}

void NFHardwareSerialDebugDump_wCB(int *a1, void (*a2)(void, CFDataRef))
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  int v4 = (os_unfair_lock_s *)(a1 + 20);
  os_unfair_lock_lock((os_unfair_lock_t)a1 + 20);
  int v5 = (const void **)MEMORY[0x263F8C6C0];
  if (*((void *)a1 + 2) && *((void *)a1 + 7))
  {
    lock = v4;
    int v6 = (void *)*((void *)a1 + 9);
    if (v6)
    {
      free(v6);
      *((void *)a1 + 9) = 0;
    }
    char v7 = (uint64_t *)*((void *)a1 + 6);
    if (!v7) {
      char v7 = (uint64_t *)*((void *)a1 + 4);
    }
    size_t v8 = (char *)malloc_type_calloc(1uLL, 0x100uLL, 0x100004077774924uLL);
    *((void *)a1 + 9) = v8;
    if (v8)
    {
      if (v7 != **((uint64_t ***)a1 + 5))
      {
        CFStringRef v9 = v8;
        int v10 = 255;
        while (1)
        {
          uint64_t v11 = *((unsigned int *)v7 + 6);
          if ((v11 - 11) < 0xFFFFFFF6) {
            goto LABEL_43;
          }
          int v12 = snprintf(v9, v10, "%s", *((const char **)&unk_2647C1DD8 + v11));
          BOOL v13 = __OFSUB__(v10, v12);
          v10 -= v12;
          if ((v10 < 0) ^ v13 | (v10 == 0)) {
            goto LABEL_43;
          }
          v9 += v12;
          unint64_t v14 = *(uint64_t *)((char *)v7 + 28);
          if (v14 >= *a1) {
            unint64_t v15 = *a1;
          }
          else {
            unint64_t v15 = *(uint64_t *)((char *)v7 + 28);
          }
          CFStringRef v16 = (unsigned __int8 *)v7 + 36;
          unint64_t v17 = *((void *)a1 + 2) + a1[6];
          if ((unint64_t)v7 + v14 + 36 > v17)
          {
            unint64_t v18 = (int)v17 - (int)v16;
            if (v18 >= v15) {
              unint64_t v19 = v15;
            }
            else {
              unint64_t v19 = v18;
            }
            if (v19)
            {
              unint64_t v20 = v19;
              do
              {
                int v21 = *v16++;
                int v22 = snprintf(v9, v10, "%02x", v21);
                BOOL v13 = __OFSUB__(v10, v22);
                v10 -= v22;
                if ((v10 < 0) ^ v13 | (v10 == 0)) {
                  goto LABEL_43;
                }
                v9 += v22;
                --v20;
              }
              while (v20);
              CFStringRef v16 = (unsigned __int8 *)*((void *)a1 + 2);
            }
            else
            {
              CFStringRef v16 = (unsigned __int8 *)*((void *)a1 + 2);
            }
            v15 -= v19;
          }
          if (v15) {
            break;
          }
LABEL_29:
          char v7 = (uint64_t *)*v7;
          if (v7 == **((uint64_t ***)a1 + 5) || v10 <= 0) {
            goto LABEL_43;
          }
        }
        while (1)
        {
          int v23 = *v16++;
          int v24 = snprintf(v9, v10, "%02x", v23);
          BOOL v13 = __OFSUB__(v10, v24);
          v10 -= v24;
          if ((v10 < 0) ^ v13 | (v10 == 0)) {
            break;
          }
          v9 += v24;
          if (!--v15) {
            goto LABEL_29;
          }
        }
      }
    }
    else
    {
      dispatch_get_specific(*v5);
      uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (Logger) {
        Logger(3, "%s:%i failed to allocate last msg buffer", "_NFHardwareSerialDebugSaveLastMessage", 177);
      }
      dispatch_get_specific(*v5);
      int v29 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446466;
        uint64_t v64 = "_NFHardwareSerialDebugSaveLastMessage";
        __int16 v65 = 1024;
        int v66 = 177;
        _os_log_impl(&dword_2269FD000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to allocate last msg buffer", buf, 0x12u);
      }
    }
LABEL_43:
    unint64_t v30 = a1[2];
    if (qword_26ABD8698 != -1) {
      dispatch_once(&qword_26ABD8698, &unk_26DA89CA8);
    }
    long long v31 = (const void **)MEMORY[0x263F8C6C0];
    if (!byte_26ABD86B8)
    {
      buf[0] = 0;
      CFStringRef v32 = *((unsigned char *)a1 + 68) ? @"com.apple.stockholm" : (const __CFString *)*MEMORY[0x263EFFE60];
      CFPreferencesAppSynchronize(v32);
      CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"UARTDumpMaxEntries", v32, buf);
      if (buf[0]) {
        unint64_t v30 = AppIntegerValue;
      }
    }
    dispatch_get_specific(*v31);
    long long v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v34) {
      v34(6, "%s:%i Printing last %ld messages", "NFHardwareSerialDebugDump_wCB", 360, v30);
    }
    dispatch_get_specific(*v31);
    uint64_t v35 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v64 = "NFHardwareSerialDebugDump_wCB";
      __int16 v65 = 1024;
      int v66 = 360;
      __int16 v67 = 2048;
      unint64_t v68 = v30;
      _os_log_impl(&dword_2269FD000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Printing last %ld messages", buf, 0x1Cu);
    }
    CFAllocatorRef v36 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    socklen_t v37 = (uint64_t *)*((void *)a1 + 4);
    while (1)
    {
      uint64_t v38 = *((unsigned int *)v37 + 6);
      if (v38)
      {
        if (v38 < 0xB)
        {
          unint64_t v39 = a1[16];
          if (v30 > v39)
          {
            socklen_t v40 = (const char *)*((void *)&unk_2647C1DD8 + v38);
            __int16 v41 = (const char *)&unk_226A18243;
            if (*(uint64_t *)((char *)v37 + 28) > (unint64_t)*a1) {
              __int16 v41 = "TRUNCATED";
            }
            snprintf((char *)buf, 0x80uLL, "%ld.%.6d %s %s", v37[1], *((_DWORD *)v37 + 4), v40, v41);
            uint64_t v42 = *((void *)a1 + 4);
            unint64_t v43 = *(void *)(v42 + 28);
            if (v43 >= *a1) {
              LODWORD(v44) = *a1;
            }
            else {
              uint64_t v44 = *(void *)(v42 + 28);
            }
            int v45 = (const void *)(v42 + 36);
            unint64_t v46 = v42 + 36 + v43;
            unint64_t v47 = *((void *)a1 + 2) + a1[6];
            if (v46 > v47)
            {
              uint64_t v48 = *((void *)a1 + 7);
              int v49 = v47 - v45;
              if (v49 >= (int)v44) {
                int v50 = v44;
              }
              else {
                int v50 = v49;
              }
              memcpy(*((void **)a1 + 7), v45, v50);
              int v51 = v44 - v50;
              long long v52 = (void *)(v48 + v50);
              long long v31 = (const void **)MEMORY[0x263F8C6C0];
              memcpy(v52, *((const void **)a1 + 2), v51);
              int v45 = (const void *)*((void *)a1 + 7);
            }
            if (a2)
            {
              CFDataRef v53 = CFDataCreate(v36, (const UInt8 *)v45, (int)v44);
              if (v53)
              {
                CFDataRef v54 = v53;
                a2(*(unsigned int *)(*((void *)a1 + 4) + 24), v53);
                CFRelease(v54);
              }
              else
              {
                dispatch_get_specific(*v31);
                long long v55 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                if (v55) {
                  v55(3, "%s:%i failed to msg", "NFHardwareSerialDebugDump_wCB", 409);
                }
                dispatch_get_specific(*v31);
                uint64_t v56 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)__int16 v59 = 136446466;
                  int v60 = "NFHardwareSerialDebugDump_wCB";
                  __int16 v61 = 1024;
                  int v62 = 409;
                  _os_log_impl(&dword_2269FD000, v56, OS_LOG_TYPE_ERROR, "%{public}s:%i failed to msg", v59, 0x12u);
                }
              }
            }
            NFSharedDumpTransport();
            socklen_t v37 = (uint64_t *)*((void *)a1 + 4);
            LODWORD(v39) = a1[16];
          }
          *((_DWORD *)v37 + 6) = 0;
          socklen_t v37 = (uint64_t *)*v37;
          *((void *)a1 + 4) = v37;
          goto LABEL_80;
        }
        *((_DWORD *)v37 + 6) = 0;
      }
      socklen_t v37 = (uint64_t *)*v37;
      *((void *)a1 + 4) = v37;
      LODWORD(v39) = a1[16];
LABEL_80:
      a1[16] = v39 - 1;
      if (v37 == **((uint64_t ***)a1 + 5))
      {
        __int16 v57 = (void *)*((void *)a1 + 2);
        *((void *)a1 + 4) = v57;
        *((void *)a1 + 5) = v57;
        *__int16 v57 = v57;
        NFSharedDumpTransport();
        os_unfair_lock_unlock(lock);
        return;
      }
    }
  }
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  BOOL v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v26) {
    v26(3, "%s:%i Buffers not allocated", "NFHardwareSerialDebugDump_wCB", 338);
  }
  dispatch_get_specific(*v5);
  CFStringRef v27 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    uint64_t v64 = "NFHardwareSerialDebugDump_wCB";
    __int16 v65 = 1024;
    int v66 = 338;
    _os_log_impl(&dword_2269FD000, v27, OS_LOG_TYPE_ERROR, "%{public}s:%i Buffers not allocated", buf, 0x12u);
  }
}

void NFHardwareSerialDebugDump()
{
  if (qword_26ABD86A0) {
    NFHardwareSerialDebugDump_wCB((int *)qword_26ABD86A0, 0);
  }
  io_object_t v0 = (int *)qword_26ABD86A8;
  if (qword_26ABD86A8)
  {
    NFHardwareSerialDebugDump_wCB(v0, 0);
  }
}

uint64_t NFHardwareSerialDebugMaxEntriesPrinted(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void sub_226A13834()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    CFBooleanRef v1 = v0;
    byte_26ABD86B8 = CFBooleanGetValue(v0) != 0;
    CFRelease(v1);
  }
}

void *NFHardwareInterfaceOpen(const char *a1, NSObject *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  int v4 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  if (!v4)
  {
    int v12 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Failed to allocate interface %s", "NFHardwareInterfaceOpen", 59, a1);
    }
    dispatch_get_specific(*v12);
    unint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v35 = "NFHardwareInterfaceOpen";
      __int16 v36 = 1024;
      int v37 = 59;
      __int16 v38 = 2080;
      unint64_t v39 = a1;
      _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate interface %s", buf, 0x1Cu);
    }
    return 0;
  }
  int v5 = v4;
  int v6 = malloc_type_calloc(1uLL, 0xF8uLL, 0x9004090A32887uLL);
  if (!v6)
  {
    unint64_t v15 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    CFStringRef v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16) {
      v16(3, "%s:%i Failed to allocate interface %s", "NFHardwareInterfaceOpen", 65, a1);
    }
    dispatch_get_specific(*v15);
    unint64_t v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      uint64_t v35 = "NFHardwareInterfaceOpen";
      __int16 v36 = 1024;
      int v37 = 65;
      __int16 v38 = 2080;
      unint64_t v39 = a1;
      _os_log_impl(&dword_2269FD000, v17, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to allocate interface %s", buf, 0x1Cu);
    }
    goto LABEL_48;
  }
  char v7 = v6;
  *int v5 = v6;
  if (!a1) {
    a1 = "com.apple.stockholm";
  }
  size_t v8 = strdup(a1);
  *(void *)char v7 = v8;
  if (!strncmp("com.apple.", v8, 0xAuLL))
  {
    unint64_t v18 = NFHardwareSerialOpen(v8, a2, 0);
    *((void *)v7 + 17) = v18;
    *((void *)v7 + 1) = NFHardwareSerialSetBaudRate;
    *((void *)v7 + 2) = 0;
    *((void *)v7 + 3) = NFHardwareSerialReadBlock;
    *((void *)v7 + 4) = 0;
    *((void *)v7 + 5) = NFHardwareSerialWriteBlock;
    *((void *)v7 + 6) = 0;
    *((void *)v7 + 7) = NFHardwareSerialReadBlockAbort;
    *((void *)v7 + 8) = NFHardwareSerialWriteBlockAbort;
    *((void *)v7 + 9) = NFHardwareSerialFlush;
    *((void *)v7 + 10) = NFHardwareSerialReset;
    *((void *)v7 + 11) = NFHardwareSerialSetLogFunction;
    if (!v18 || (unint64_t v19 = (unsigned char *)*((void *)v18 + 1)) == 0 || (v20 = NFHardwareSerialGetCTS, *v19)) {
      unint64_t v20 = 0;
    }
    *((void *)v7 + 12) = v20;
    *((void *)v7 + 13) = NFHardwareSerialSetCRCEnabled;
    *((void *)v7 + 14) = NFHardwareSerialSetOnDemandClientMode;
    *((void *)v7 + 15) = NFHardwareSerialQuerySPMIError;
    *((void *)v7 + 16) = NFHardwareSerialClose;
    if (strcasestr(*(const char **)v7, "hammerfest")) {
      int v21 = 2;
    }
    else {
      int v21 = 1;
    }
    int v22 = NFHardwareGPIOOpen(v21);
    *((void *)v7 + 18) = NFHardwareGPIOSetDeviceWake;
    *((void *)v7 + 19) = NFHardwareGPIOSetPower;
    *((void *)v7 + 20) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((void *)v7 + 21) = NFHardwareGPIOSetVBAT;
    *((void *)v7 + 22) = NFHardwareGPIOSetDownloadRequest;
    *((void *)v7 + 23) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((void *)v7 + 24) = NFHardwareGPIOIsHostWakeCapable;
    *((void *)v7 + 27) = NFHardwareGPIOWasItSPMINack;
    *((void *)v7 + 28) = NFHardwareGPIOSPMIFollowerReset;
    *((void *)v7 + 29) = NFHardwareGPIOClose;
    *((void *)v7 + 30) = v22;
    *((void *)v7 + 25) = NFHardwareGPIOValidateSPMIConfig;
    *((void *)v7 + 26) = NFHardwareGPIOConfigureHammerfestSPMI;
    if (!v22) {
      goto LABEL_37;
    }
  }
  else
  {
    if (strncmp("/dev/", v8, 5uLL))
    {
      CFStringRef v9 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v10) {
        v10(3, "%s:%i Unknown interface %s", "NFHardwareInterfaceOpen", 226, a1);
      }
      dispatch_get_specific(*v9);
      uint64_t v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        uint64_t v35 = "NFHardwareInterfaceOpen";
        __int16 v36 = 1024;
        int v37 = 226;
        __int16 v38 = 2080;
        unint64_t v39 = a1;
        _os_log_impl(&dword_2269FD000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i Unknown interface %s", buf, 0x1Cu);
      }
LABEL_47:
      free(*(void **)v7);
      free(v7);
LABEL_48:
      free(v5);
      return 0;
    }
    int v23 = NFHardwareSerialOpen(v8, a2, 0);
    *((void *)v7 + 17) = v23;
    *((void *)v7 + 1) = NFHardwareSerialSetBaudRate;
    *((void *)v7 + 2) = 0;
    *((void *)v7 + 3) = NFHardwareSerialReadBlock;
    *((void *)v7 + 4) = 0;
    *((void *)v7 + 5) = NFHardwareSerialWriteBlock;
    *((void *)v7 + 6) = 0;
    *((void *)v7 + 7) = NFHardwareSerialReadBlockAbort;
    *((void *)v7 + 8) = NFHardwareSerialWriteBlockAbort;
    *((void *)v7 + 9) = NFHardwareSerialFlush;
    *((void *)v7 + 10) = NFHardwareSerialReset;
    *((void *)v7 + 11) = NFHardwareSerialSetLogFunction;
    if (!v23 || (int v24 = (unsigned char *)*((void *)v23 + 1)) == 0 || (v25 = NFHardwareSerialGetCTS, *v24)) {
      int v25 = 0;
    }
    *((void *)v7 + 12) = v25;
    *((void *)v7 + 13) = NFHardwareSerialSetCRCEnabled;
    *((void *)v7 + 14) = NFHardwareSerialSetOnDemandClientMode;
    *((void *)v7 + 16) = NFHardwareSerialClose;
    if (strcasestr(*(const char **)v7, "hammerfest")) {
      int v26 = 1;
    }
    else {
      int v26 = 2;
    }
    CFStringRef v27 = NFHardwareGPIOOpen(v26);
    *((void *)v7 + 18) = NFHardwareGPIOSetDeviceWake;
    *((void *)v7 + 19) = NFHardwareGPIOSetPower;
    *((void *)v7 + 20) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((void *)v7 + 21) = NFHardwareGPIOSetVBAT;
    *((void *)v7 + 22) = NFHardwareGPIOSetDownloadRequest;
    *((void *)v7 + 23) = NFHardwareGPIOSetPMUStandbyPowerEnabled;
    *((void *)v7 + 24) = NFHardwareGPIOIsHostWakeCapable;
    *((void *)v7 + 27) = NFHardwareGPIOWasItSPMINack;
    *((void *)v7 + 28) = 0;
    *((void *)v7 + 15) = 0;
    *((void *)v7 + 29) = NFHardwareGPIOClose;
    *((void *)v7 + 30) = v27;
    if (!v27)
    {
LABEL_37:
      unsigned int v28 = (const void **)MEMORY[0x263F8C6C0];
      dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
      int v29 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v29) {
        v29(3, "%s:%i Failed to create context for interface %s", "NFHardwareInterfaceOpen", 234, a1);
      }
      dispatch_get_specific(*v28);
      unint64_t v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        uint64_t v35 = "NFHardwareInterfaceOpen";
        __int16 v36 = 1024;
        int v37 = 234;
        __int16 v38 = 2080;
        unint64_t v39 = a1;
        _os_log_impl(&dword_2269FD000, v30, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to create context for interface %s", buf, 0x1Cu);
      }
      if (*((void *)v7 + 17))
      {
        long long v31 = (void (*)(void))*((void *)v7 + 16);
        if (v31) {
          v31();
        }
      }
      if (*((void *)v7 + 30))
      {
        CFStringRef v32 = (void (*)(void))*((void *)v7 + 29);
        if (v32) {
          v32();
        }
      }
      goto LABEL_47;
    }
  }
  if (!*((void *)v7 + 17)) {
    goto LABEL_37;
  }
  return v5;
}

void NFHardwareInterfaceClose(void **a1)
{
  uint64_t v2 = (void **)*a1;
  BOOL v3 = (void (*)(void *))*((void *)*a1 + 16);
  if (v3) {
    v3(v2[17]);
  }
  int v4 = (void (*)(void *))v2[29];
  if (v4) {
    v4(v2[30]);
  }
  free(*v2);
  *uint64_t v2 = 0;
  free(*a1);

  free(a1);
}

uint64_t NFHardwareInterfaceResetSerial(uint64_t *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i ", "NFHardwareInterfaceResetSerial", 269);
  }
  dispatch_get_specific(*v2);
  int v4 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    size_t v8 = "NFHardwareInterfaceResetSerial";
    __int16 v9 = 1024;
    int v10 = 269;
    _os_log_impl(&dword_2269FD000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i ", buf, 0x12u);
  }
  int v5 = *(uint64_t (**)(void))(v1 + 80);
  if (v5) {
    return v5(*(void *)(v1 + 136));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceSetPower(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 152);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetPMUStandbyEnabled(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 160);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetVBAT(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 168);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetDownloadRequest(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 176);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetPMUStandbyPowerEnabled(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 184);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetDeviceWake(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 144);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetLogFunction(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 88);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetBaudRate(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 8);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceRead(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 16);
  if (v1)
  {
    uint64_t v2 = *(void *)(*(void *)a1 + 136);
    return v1(v2);
  }
  else
  {
    int v4 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i No interface defined for reading", "NFHardwareInterfaceRead", 346);
    }
    dispatch_get_specific(*v4);
    int v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      size_t v8 = "NFHardwareInterfaceRead";
      __int16 v9 = 1024;
      int v10 = 346;
      _os_log_impl(&dword_2269FD000, v6, OS_LOG_TYPE_ERROR, "%{public}s:%i No interface defined for reading", buf, 0x12u);
    }
    return 0;
  }
}

uint64_t NFHardwareInterfaceWrite(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 32);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceReadAbort(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 48);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceReadBlockAbort(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 56);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceWriteBlockAbort(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 64);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceFlush(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 72);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceGetFlowControl(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 96);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetCRCEnabled(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 104);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetOnDemandClientMode(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 112);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 136));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceIsHostWakeCapable(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 192);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceFollowerReset(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 224);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 0;
  }
}

BOOL NFHardwareInterfaceQuerySPMIError(uint64_t a1)
{
  uint64_t v1 = *(unsigned int (**)(void))(*(void *)a1 + 120);
  return v1 && v1(*(void *)(*(void *)a1 + 136)) != 0;
}

BOOL NFHardwareDebug(void **a1)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    int v4 = (void **)NFHardwareInterfaceOpen("/dev/tty.stockholm", global_queue);
    if (v4)
    {
      uint64_t v2 = v4;
      if (*((void *)*v4 + 12)) {
        goto LABEL_6;
      }
      NFHardwareInterfaceClose(v4);
    }
    return 1;
  }
  uint64_t v2 = a1;
  if (!*((void *)*a1 + 12)) {
    return 1;
  }
LABEL_6:
  int v5 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(6, "%s:%i HW Debugging - current FLOW CHECK", "NFHardwareDebug", 485);
  }
  dispatch_get_specific(*v5);
  char v7 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 485;
    _os_log_impl(&dword_2269FD000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - current FLOW CHECK", buf, 0x12u);
  }
  size_t v8 = (uint64_t (*)(void))*((void *)*v2 + 12);
  if (v8) {
    int v9 = v8(*((void *)*v2 + 17));
  }
  else {
    int v9 = 1;
  }
  usleep(0xF4240u);
  dispatch_get_specific(*v5);
  int v10 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v10) {
    v10(6, "%s:%i HW Debugging starting - OFF", "NFHardwareDebug", 491);
  }
  dispatch_get_specific(*v5);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 491;
    _os_log_impl(&dword_2269FD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging starting - OFF", buf, 0x12u);
  }
  int v12 = (uint64_t (*)(void, void))*((void *)*v2 + 19);
  if (v12 && (v12(*((void *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    BOOL v13 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v13) {
      v13(3, "%s:%i Error", "NFHardwareDebug", 494);
    }
    dispatch_get_specific(*v5);
    unint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 494;
      _os_log_impl(&dword_2269FD000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  unint64_t v15 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v15) {
    v15(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", "NFHardwareDebug", 502);
  }
  dispatch_get_specific(*v5);
  CFStringRef v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 502;
    _os_log_impl(&dword_2269FD000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", buf, 0x12u);
  }
  unint64_t v17 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v17) {
    int v18 = 2 * (v17(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v18 = 2;
  }
  BOOL v85 = v9 != 0;
  dispatch_get_specific(*v5);
  unint64_t v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v19) {
    v19(6, "%s:%i HW Debugging - ON", "NFHardwareDebug", 506);
  }
  dispatch_get_specific(*v5);
  unint64_t v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 506;
    _os_log_impl(&dword_2269FD000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - ON", buf, 0x12u);
  }
  int v21 = (uint64_t (*)(void, uint64_t))*((void *)*v2 + 19);
  if (v21 && (v21(*((void *)*v2 + 30), 1) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    int v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22) {
      v22(3, "%s:%i Error", "NFHardwareDebug", 515);
    }
    dispatch_get_specific(*v5);
    int v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 515;
      _os_log_impl(&dword_2269FD000, v23, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  int v24 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v24) {
    v24(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED ON", "NFHardwareDebug", 519);
  }
  dispatch_get_specific(*v5);
  int v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 519;
    _os_log_impl(&dword_2269FD000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED ON", buf, 0x12u);
  }
  int v26 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v26) {
    int v27 = 4 * (v26(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v27 = 4;
  }
  int v84 = v27;
  dispatch_get_specific(*v5);
  unsigned int v28 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v28) {
    v28(6, "%s:%i HW Debugging - SLEEP + wait 1.5s", "NFHardwareDebug", 524);
  }
  dispatch_get_specific(*v5);
  int v29 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 524;
    _os_log_impl(&dword_2269FD000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - SLEEP + wait 1.5s", buf, 0x12u);
  }
  unint64_t v30 = (uint64_t (*)(void, void))*((void *)*v2 + 18);
  if (v30 && (v30(*((void *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    long long v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31) {
      v31(3, "%s:%i Error", "NFHardwareDebug", 527);
    }
    dispatch_get_specific(*v5);
    CFStringRef v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 527;
      _os_log_impl(&dword_2269FD000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x30D40u);
  long long v33 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v33) {
    int v34 = 8 * (v33(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v34 = 8;
  }
  usleep(0x30D40u);
  uint64_t v35 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v35) {
    int v36 = 16 * (v35(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v36 = 16;
  }
  int v80 = v36;
  usleep(0x30D40u);
  int v37 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v37) {
    int v38 = 32 * (v37(*((void *)*v2 + 17)) != 0);
  }
  else {
    int v38 = 32;
  }
  int v83 = v38;
  usleep(0x30D40u);
  unint64_t v39 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v39) {
    int v40 = (v39(*((void *)*v2 + 17)) != 0) << 6;
  }
  else {
    int v40 = 64;
  }
  int v82 = v40;
  usleep(0x30D40u);
  __int16 v41 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v41) {
    int v42 = (v41(*((void *)*v2 + 17)) != 0) << 7;
  }
  else {
    int v42 = 128;
  }
  int v81 = v42;
  usleep(0x30D40u);
  unint64_t v43 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v43) {
    int v44 = (v43(*((void *)*v2 + 17)) != 0) << 8;
  }
  else {
    int v44 = 256;
  }
  int v79 = v44;
  usleep(0x30D40u);
  int v45 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v45) {
    int v46 = (v45(*((void *)*v2 + 17)) != 0) << 9;
  }
  else {
    int v46 = 512;
  }
  usleep(0x30D40u);
  dispatch_get_specific(*v5);
  unint64_t v47 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v47) {
    v47(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", "NFHardwareDebug", 560);
  }
  dispatch_get_specific(*v5);
  uint64_t v48 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 560;
    _os_log_impl(&dword_2269FD000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED OFF", buf, 0x12u);
  }
  int v49 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v49) {
    int v50 = (v49(*((void *)*v2 + 17)) != 0) << 10;
  }
  else {
    int v50 = 1024;
  }
  dispatch_get_specific(*v5);
  int v51 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v51) {
    v51(6, "%s:%i HW Debugging - WAKE", "NFHardwareDebug", 564);
  }
  dispatch_get_specific(*v5);
  long long v52 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 564;
    _os_log_impl(&dword_2269FD000, v52, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - WAKE", buf, 0x12u);
  }
  CFDataRef v53 = (uint64_t (*)(void, uint64_t))*((void *)*v2 + 18);
  if (v53 && (v53(*((void *)*v2 + 30), 1) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    CFDataRef v54 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v54) {
      v54(3, "%s:%i Error", "NFHardwareDebug", 567);
    }
    dispatch_get_specific(*v5);
    long long v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 567;
      _os_log_impl(&dword_2269FD000, v55, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  usleep(0x4E20u);
  dispatch_get_specific(*v5);
  uint64_t v56 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v56) {
    v56(6, "%s:%i HW Debugging - FLOW CHECK - EXPECTED ON", "NFHardwareDebug", 571);
  }
  dispatch_get_specific(*v5);
  __int16 v57 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 571;
    _os_log_impl(&dword_2269FD000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - FLOW CHECK - EXPECTED ON", buf, 0x12u);
  }
  speed_t v58 = (unsigned int (*)(void))*((void *)*v2 + 12);
  if (v58) {
    int v59 = (v58(*((void *)*v2 + 17)) != 0) << 11;
  }
  else {
    int v59 = 2048;
  }
  dispatch_get_specific(*v5);
  int v60 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (v60) {
    v60(6, "%s:%i HW Debugging - POWERING OFF", "NFHardwareDebug", 575);
  }
  int v61 = v18 | v85 | v84;
  dispatch_get_specific(*v5);
  int v62 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)pthread_mutex_t buf = 136446466;
    v87 = "NFHardwareDebug";
    __int16 v88 = 1024;
    int v89 = 575;
    _os_log_impl(&dword_2269FD000, v62, OS_LOG_TYPE_DEFAULT, "%{public}s:%i HW Debugging - POWERING OFF", buf, 0x12u);
  }
  int v63 = v61 | v34;
  uint64_t v64 = (uint64_t (*)(void, void))*((void *)*v2 + 18);
  if (v64 && (v64(*((void *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    __int16 v65 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v65) {
      v65(3, "%s:%i Error", "NFHardwareDebug", 577);
    }
    dispatch_get_specific(*v5);
    int v66 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 577;
      _os_log_impl(&dword_2269FD000, v66, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  int v67 = v63 | v80;
  unint64_t v68 = (uint64_t (*)(void, void))*((void *)*v2 + 19);
  if (v68 && (v68(*((void *)*v2 + 30), 0) & 1) == 0)
  {
    dispatch_get_specific(*v5);
    uint64_t v69 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v69) {
      v69(3, "%s:%i Error", "NFHardwareDebug", 579);
    }
    dispatch_get_specific(*v5);
    v70 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 579;
      _os_log_impl(&dword_2269FD000, v70, OS_LOG_TYPE_ERROR, "%{public}s:%i Error", buf, 0x12u);
    }
  }
  if (!a1) {
    NFHardwareInterfaceClose(v2);
  }
  int v71 = v67 | v83 | v82 | v81 | v79 | v46 | v50 | v59;
  if (v71 == 4095)
  {
    dispatch_get_specific(*v5);
    v76 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v76) {
      v76(3, "%s:%i HW error : unit is not powering cycling.", "NFHardwareDebug", 595);
    }
    dispatch_get_specific(*v5);
    v73 = NFSharedLogGetLogger();
    BOOL result = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 595;
      v75 = "%{public}s:%i HW error : unit is not powering cycling.";
      goto LABEL_130;
    }
  }
  else
  {
    if (v71)
    {
      dispatch_get_specific(*v5);
      uint64_t v77 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v77) {
        v77(3, "%s:%i HW debugging result : 0x%04X", "NFHardwareDebug", 598, v71);
      }
      dispatch_get_specific(*v5);
      v78 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pthread_mutex_t buf = 136446722;
        v87 = "NFHardwareDebug";
        __int16 v88 = 1024;
        int v89 = 598;
        __int16 v90 = 1024;
        int v91 = v67 | v83 | v82 | v81 | v79 | v46 | v50 | v59;
        _os_log_impl(&dword_2269FD000, v78, OS_LOG_TYPE_ERROR, "%{public}s:%i HW debugging result : 0x%04X", buf, 0x18u);
      }
      return 1;
    }
    dispatch_get_specific(*v5);
    int v72 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v72) {
      v72(3, "%s:%i HW error : unit is not powering on.", "NFHardwareDebug", 592);
    }
    dispatch_get_specific(*v5);
    v73 = NFSharedLogGetLogger();
    BOOL result = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      v87 = "NFHardwareDebug";
      __int16 v88 = 1024;
      int v89 = 592;
      v75 = "%{public}s:%i HW error : unit is not powering on.";
LABEL_130:
      _os_log_impl(&dword_2269FD000, v73, OS_LOG_TYPE_ERROR, v75, buf, 0x12u);
      return 0;
    }
  }
  return result;
}

uint64_t NFHardwareInterfaceValidateSPMIConfig(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 200);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceSetSPMIConfig(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 208);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 1;
  }
}

uint64_t NFHardwareInterfaceWasItNACK(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)a1 + 216);
  if (v1) {
    return v1(*(void *)(*(void *)a1 + 240));
  }
  else {
    return 0;
  }
}

uint64_t NFHardwareInterfaceIsSupported(char *__s2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!__s2 || !strncmp("com.apple.", __s2, 0xAuLL) || !strncmp("/dev/", __s2, 5uLL))
  {
    return NFHardwareSerialIsSupported(__s2);
  }
  else
  {
    uint64_t v2 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Unmatched interface %s", "NFHardwareInterfaceIsSupported", 648, __s2);
    }
    dispatch_get_specific(*v2);
    int v4 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446722;
      char v7 = "NFHardwareInterfaceIsSupported";
      __int16 v8 = 1024;
      int v9 = 648;
      __int16 v10 = 2080;
      uint64_t v11 = __s2;
      _os_log_impl(&dword_2269FD000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%i Unmatched interface %s", buf, 0x1Cu);
    }
    return 0;
  }
}

uint64_t NFHardwareInterfaceHasExternalSPMIIRQ(UInt8 *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching("stockholm-spmi");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService) {
    return 0;
  }
  IOObjectRelease(MatchingService);
  CFDictionaryRef v5 = IOServiceNameMatching("stockholm");
  io_service_t v6 = IOServiceGetMatchingService(v2, v5);
  if (v6)
  {
    io_object_t v7 = v6;
    CFDataRef v8 = (const __CFData *)IORegistryEntrySearchCFProperty(v6, "IOService", @"se-spmi-irq", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (v8)
    {
      CFDataRef v9 = v8;
      CFTypeID TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v9))
      {
        BytePtr = CFDataGetBytePtr(v9);
        if (BytePtr)
        {
          uint64_t v12 = BytePtr;
          if (CFDataGetLength(v9)) {
            *a1 = *v12;
          }
        }
        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v13 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      uint64_t v13 = 0;
    }
    IOObjectRelease(v7);
  }
  else
  {
    unint64_t v14 = (const void **)MEMORY[0x263F8C6C0];
    dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger) {
      Logger(3, "%s:%i Unexpected state.", "NFHardwareInterfaceHasExternalSPMIIRQ", 681);
    }
    dispatch_get_specific(*v14);
    CFStringRef v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pthread_mutex_t buf = 136446466;
      unint64_t v19 = "NFHardwareInterfaceHasExternalSPMIIRQ";
      __int16 v20 = 1024;
      int v21 = 681;
      _os_log_impl(&dword_2269FD000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i Unexpected state.", buf, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  return v13;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50A8](alloc, data, *(void *)&encoding);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t GetElapsedTimeInMillisecondsFromMachTime()
{
  return MEMORY[0x270F9A258]();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return MEMORY[0x270EF3F60](*(void *)&connect);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x270EF4788](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49E0](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x270EF49F0](*(void *)&entry, plane, child);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return MEMORY[0x270EF4A68](*(void *)&mainPort);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t NFIsInternalBuild()
{
  return MEMORY[0x270F9A2B0]();
}

uint64_t NFIsRestoreOS()
{
  return MEMORY[0x270F9A2B8]();
}

uint64_t NFLogGetLogger()
{
  return MEMORY[0x270F9A2C0]();
}

uint64_t NFProductIsDevBoard()
{
  return MEMORY[0x270F9A2F0]();
}

uint64_t NFSharedDumpTransport()
{
  return MEMORY[0x270F9A320]();
}

uint64_t NFSharedLogGetLogger()
{
  return MEMORY[0x270F9A328]();
}

uint64_t NFSharedMiddlewareSignpostLog()
{
  return MEMORY[0x270F9A338]();
}

uint64_t NFSharedSignpostLog()
{
  return MEMORY[0x270F9A340]();
}

uint64_t NFSimulateCrash()
{
  return MEMORY[0x270F9A348]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void cfmakeraw(termios *a1)
{
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8E98](a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8EA0](a1, a2);
}

int cfsetspeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8EA8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x270ED94F0]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
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

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x270ED9D90](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x270EDA340]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t postAnalyticsMiddlewareExceptionEvent()
{
  return MEMORY[0x270F9A388]();
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x270EDB598](__big, __little);
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

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x270EDB8C8](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x270EDB8D0](*(void *)&a1, *(void *)&a2, a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}