void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t ATXHeroEntriesPbReadFrom(char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    unint64_t v8 = 0x267F03000uLL;
    unint64_t v9 = 0x267F03000uLL;
    unint64_t v10 = 0x267F03000uLL;
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v11 = 0;
        unsigned int v12 = 0;
        unint64_t v13 = 0;
        while (1)
        {
          uint64_t v14 = *v3;
          uint64_t v15 = *(void *)(a2 + v14);
          unint64_t v16 = v15 + 1;
          if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
            break;
          }
          char v17 = *(unsigned char *)(*(void *)(a2 + *v7) + v15);
          *(void *)(a2 + v14) = v16;
          v13 |= (unint64_t)(v17 & 0x7F) << v11;
          if ((v17 & 0x80) == 0) {
            goto LABEL_12;
          }
          v11 += 7;
          BOOL v18 = v12++ >= 9;
          if (v18)
          {
            unint64_t v13 = 0;
            uint64_t v19 = *v5;
            int v20 = *(unsigned __int8 *)(a2 + v19);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        uint64_t v19 = *v5;
        int v20 = *(unsigned __int8 *)(a2 + v19);
        if (*(unsigned char *)(a2 + v19)) {
          unint64_t v13 = 0;
        }
LABEL_14:
        int v21 = v13 & 7;
        if (!v20 && v21 != 4)
        {
          switch((v13 >> 3))
          {
            case 1u:
              uint64_t v23 = *v3;
              unint64_t v24 = *(void *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v25 = v24 + 4, v24 + 4 <= *(void *)(a2 + *v4)))
              {
                int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v24);
                *(void *)(a2 + v23) = v25;
              }
              else
              {
                int v26 = 0;
                *(unsigned char *)(a2 + v19) = 1;
              }
              uint64_t v133 = 184;
              goto LABEL_185;
            case 2u:
              uint64_t v27 = *v3;
              unint64_t v28 = *(void *)(a2 + v27);
              if (v28 <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v29 = v28 + 4, v28 + 4 <= *(void *)(a2 + *v4)))
              {
                int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v28);
                *(void *)(a2 + v27) = v29;
              }
              else
              {
                int v26 = 0;
                *(unsigned char *)(a2 + v19) = 1;
              }
              uint64_t v133 = 188;
LABEL_185:
              *(_DWORD *)&a1[v133] = v26;
              goto LABEL_186;
            case 3u:
              if (v21 != 2)
              {
                char v84 = 0;
                unsigned int v85 = 0;
                uint64_t v86 = 0;
                while (1)
                {
                  uint64_t v87 = *v3;
                  uint64_t v88 = *(void *)(a2 + v87);
                  unint64_t v89 = v88 + 1;
                  if (v88 == -1 || v89 > *(void *)(a2 + *v4)) {
                    goto LABEL_138;
                  }
                  char v90 = *(unsigned char *)(*(void *)(a2 + *v7) + v88);
                  *(void *)(a2 + v87) = v89;
                  v86 |= (unint64_t)(v90 & 0x7F) << v84;
                  if (v90 < 0)
                  {
                    v84 += 7;
                    BOOL v18 = v85++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_139;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v31 = 0;
                unsigned int v32 = 0;
                uint64_t v33 = 0;
                while (1)
                {
                  uint64_t v34 = *v3;
                  uint64_t v35 = *(void *)(a2 + v34);
                  unint64_t v36 = v35 + 1;
                  if (v35 == -1 || v36 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
                  *(void *)(a2 + v34) = v36;
                  v33 |= (unint64_t)(v37 & 0x7F) << v31;
                  if (v37 < 0)
                  {
                    v31 += 7;
                    BOOL v18 = v32++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_37;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
                PBRepeatedInt32Add();
              }
              goto LABEL_123;
            case 4u:
              if (v21 != 2)
              {
                char v91 = 0;
                unsigned int v92 = 0;
                uint64_t v93 = 0;
                while (1)
                {
                  uint64_t v94 = *v3;
                  uint64_t v95 = *(void *)(a2 + v94);
                  unint64_t v96 = v95 + 1;
                  if (v95 == -1 || v96 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v97 = *(unsigned char *)(*(void *)(a2 + *v7) + v95);
                  *(void *)(a2 + v94) = v96;
                  v93 |= (unint64_t)(v97 & 0x7F) << v91;
                  if (v97 < 0)
                  {
                    v91 += 7;
                    BOOL v18 = v92++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_139;
                }
LABEL_138:
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_139:
                PBRepeatedInt32Add();
                goto LABEL_186;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v38 = 0;
                unsigned int v39 = 0;
                uint64_t v40 = 0;
                while (1)
                {
                  uint64_t v41 = *v3;
                  uint64_t v42 = *(void *)(a2 + v41);
                  unint64_t v43 = v42 + 1;
                  if (v42 == -1 || v43 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
                  *(void *)(a2 + v41) = v43;
                  v40 |= (unint64_t)(v44 & 0x7F) << v38;
                  if (v44 < 0)
                  {
                    v38 += 7;
                    BOOL v18 = v39++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_50;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
                PBRepeatedInt32Add();
              }
              goto LABEL_123;
            case 5u:
              if (v21 != 2)
              {
                char v98 = 0;
                unsigned int v99 = 0;
                uint64_t v100 = 0;
                while (1)
                {
                  uint64_t v101 = *v3;
                  uint64_t v102 = *(void *)(a2 + v101);
                  unint64_t v103 = v102 + 1;
                  if (v102 == -1 || v103 > *(void *)(a2 + *v4)) {
                    goto LABEL_168;
                  }
                  char v104 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
                  *(void *)(a2 + v101) = v103;
                  v100 |= (unint64_t)(v104 & 0x7F) << v98;
                  if (v104 < 0)
                  {
                    v98 += 7;
                    BOOL v18 = v99++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_169;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v45 = 0;
                unsigned int v46 = 0;
                uint64_t v47 = 0;
                while (1)
                {
                  uint64_t v48 = *v3;
                  uint64_t v49 = *(void *)(a2 + v48);
                  unint64_t v50 = v49 + 1;
                  if (v49 == -1 || v50 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
                  *(void *)(a2 + v48) = v50;
                  v47 |= (unint64_t)(v51 & 0x7F) << v45;
                  if (v51 < 0)
                  {
                    v45 += 7;
                    BOOL v18 = v46++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_63;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_63:
                PBRepeatedUInt32Add();
              }
              goto LABEL_123;
            case 6u:
              if (v21 != 2)
              {
                char v105 = 0;
                unsigned int v106 = 0;
                uint64_t v107 = 0;
                while (1)
                {
                  uint64_t v108 = *v3;
                  uint64_t v109 = *(void *)(a2 + v108);
                  unint64_t v110 = v109 + 1;
                  if (v109 == -1 || v110 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v111 = *(unsigned char *)(*(void *)(a2 + *v7) + v109);
                  *(void *)(a2 + v108) = v110;
                  v107 |= (unint64_t)(v111 & 0x7F) << v105;
                  if (v111 < 0)
                  {
                    v105 += 7;
                    BOOL v18 = v106++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_178;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_178:
                PBRepeatedBOOLAdd();
                goto LABEL_186;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v52 = 0;
                unsigned int v53 = 0;
                uint64_t v54 = 0;
                while (1)
                {
                  uint64_t v55 = *v3;
                  uint64_t v56 = *(void *)(a2 + v55);
                  unint64_t v57 = v56 + 1;
                  if (v56 == -1 || v57 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
                  *(void *)(a2 + v55) = v57;
                  v54 |= (unint64_t)(v58 & 0x7F) << v52;
                  if (v58 < 0)
                  {
                    v52 += 7;
                    BOOL v18 = v53++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_76;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_76:
                PBRepeatedBOOLAdd();
              }
              goto LABEL_123;
            case 8u:
              if (v21 != 2)
              {
                char v112 = 0;
                unsigned int v113 = 0;
                uint64_t v114 = 0;
                while (1)
                {
                  uint64_t v115 = *v3;
                  uint64_t v116 = *(void *)(a2 + v115);
                  unint64_t v117 = v116 + 1;
                  if (v116 == -1 || v117 > *(void *)(a2 + *v4)) {
                    goto LABEL_168;
                  }
                  char v118 = *(unsigned char *)(*(void *)(a2 + *v7) + v116);
                  *(void *)(a2 + v115) = v117;
                  v114 |= (unint64_t)(v118 & 0x7F) << v112;
                  if (v118 < 0)
                  {
                    v112 += 7;
                    BOOL v18 = v113++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_169;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v59 = 0;
                unsigned int v60 = 0;
                uint64_t v61 = 0;
                while (1)
                {
                  uint64_t v62 = *v3;
                  uint64_t v63 = *(void *)(a2 + v62);
                  unint64_t v64 = v63 + 1;
                  if (v63 == -1 || v64 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v65 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
                  *(void *)(a2 + v62) = v64;
                  v61 |= (unint64_t)(v65 & 0x7F) << v59;
                  if (v65 < 0)
                  {
                    v59 += 7;
                    BOOL v18 = v60++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_91;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_91:
                PBRepeatedUInt32Add();
              }
              goto LABEL_123;
            case 9u:
              if (v21 != 2)
              {
                char v119 = 0;
                unsigned int v120 = 0;
                uint64_t v121 = 0;
                while (1)
                {
                  uint64_t v122 = *v3;
                  uint64_t v123 = *(void *)(a2 + v122);
                  unint64_t v124 = v123 + 1;
                  if (v123 == -1 || v124 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v125 = *(unsigned char *)(*(void *)(a2 + *v7) + v123);
                  *(void *)(a2 + v122) = v124;
                  v121 |= (unint64_t)(v125 & 0x7F) << v119;
                  if (v125 < 0)
                  {
                    v119 += 7;
                    BOOL v18 = v120++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_169;
                }
LABEL_168:
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_169:
                PBRepeatedUInt32Add();
                goto LABEL_186;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v66 = 0;
                unsigned int v67 = 0;
                uint64_t v68 = 0;
                while (1)
                {
                  uint64_t v69 = *v3;
                  uint64_t v70 = *(void *)(a2 + v69);
                  unint64_t v71 = v70 + 1;
                  if (v70 == -1 || v71 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v72 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
                  *(void *)(a2 + v69) = v71;
                  v68 |= (unint64_t)(v72 & 0x7F) << v66;
                  if (v72 < 0)
                  {
                    v66 += 7;
                    BOOL v18 = v67++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_104;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_104:
                PBRepeatedUInt32Add();
              }
              goto LABEL_123;
            case 0xAu:
              unint64_t v73 = v10;
              unint64_t v74 = v9;
              unint64_t v75 = v8;
              v76 = PBReaderReadData();
              if (v76) {
                [a1 addUrlHash:v76];
              }
              goto LABEL_109;
            case 0xBu:
              unint64_t v73 = v10;
              unint64_t v74 = v9;
              unint64_t v75 = v8;
              v76 = PBReaderReadString();
              if (v76) {
                [a1 addPoiCategory:v76];
              }
LABEL_109:

              unint64_t v8 = v75;
              unint64_t v9 = v74;
              unint64_t v10 = v73;
              goto LABEL_186;
            case 0xCu:
              if (v21 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                {
                  char v77 = 0;
                  unsigned int v78 = 0;
                  uint64_t v79 = 0;
                  while (1)
                  {
                    uint64_t v80 = *v3;
                    uint64_t v81 = *(void *)(a2 + v80);
                    unint64_t v82 = v81 + 1;
                    if (v81 == -1 || v82 > *(void *)(a2 + *v4)) {
                      break;
                    }
                    char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
                    *(void *)(a2 + v80) = v82;
                    v79 |= (unint64_t)(v83 & 0x7F) << v77;
                    if (v83 < 0)
                    {
                      v77 += 7;
                      BOOL v18 = v78++ >= 9;
                      if (!v18) {
                        continue;
                      }
                    }
                    goto LABEL_122;
                  }
                  *(unsigned char *)(a2 + *v5) = 1;
LABEL_122:
                  PBRepeatedUInt64Add();
                }
LABEL_123:
                PBReaderRecallMark();
              }
              else
              {
                char v126 = 0;
                unsigned int v127 = 0;
                uint64_t v128 = 0;
                while (1)
                {
                  uint64_t v129 = *v3;
                  uint64_t v130 = *(void *)(a2 + v129);
                  unint64_t v131 = v130 + 1;
                  if (v130 == -1 || v131 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v132 = *(unsigned char *)(*(void *)(a2 + *v7) + v130);
                  *(void *)(a2 + v129) = v131;
                  v128 |= (unint64_t)(v132 & 0x7F) << v126;
                  if (v132 < 0)
                  {
                    v126 += 7;
                    BOOL v18 = v127++ >= 9;
                    if (!v18) {
                      continue;
                    }
                  }
                  goto LABEL_180;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_180:
                PBRepeatedUInt64Add();
              }
LABEL_186:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_186;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_21FF598C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1) {
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)__atxlog_handle_default_log;

  return v0;
}

uint64_t ____atxlog_handle_default_block_invoke()
{
  __atxlog_handle_default_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "general");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1) {
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)__atxlog_handle_xpc_log;

  return v0;
}

uint64_t ____atxlog_handle_xpc_block_invoke()
{
  __atxlog_handle_xpc_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "xpc");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)__atxlog_handle_heuristic_log;

  return v0;
}

uint64_t ____atxlog_handle_heuristic_block_invoke()
{
  __atxlog_handle_heuristic_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "heuristic");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)__atxlog_handle_notifications_log;

  return v0;
}

uint64_t ____atxlog_handle_notifications_block_invoke()
{
  __atxlog_handle_notifications_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notifications");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1) {
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)__atxlog_handle_pmm_log;

  return v0;
}

uint64_t ____atxlog_handle_pmm_block_invoke()
{
  __atxlog_handle_pmm_log = (uint64_t)os_log_create("com.apple.duetexpertd.mm", "GENERAL");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1) {
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)__atxlog_handle_dailyroutines_log;

  return v0;
}

uint64_t ____atxlog_handle_dailyroutines_block_invoke()
{
  __atxlog_handle_dailyroutines_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "dailyroutines");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1) {
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_20);
  }
  v0 = (void *)__atxlog_handle_feedback_log;

  return v0;
}

uint64_t ____atxlog_handle_feedback_block_invoke()
{
  __atxlog_handle_feedback_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "feedback");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1) {
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)__atxlog_handle_modes_log;

  return v0;
}

uint64_t ____atxlog_handle_modes_block_invoke()
{
  __atxlog_handle_modes_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "modes");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1) {
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_26);
  }
  v0 = (void *)__atxlog_handle_hero_log;

  return v0;
}

uint64_t ____atxlog_handle_hero_block_invoke()
{
  __atxlog_handle_hero_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "hero");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_29);
  }
  v0 = (void *)__atxlog_handle_deletions_log;

  return v0;
}

uint64_t ____atxlog_handle_deletions_block_invoke()
{
  __atxlog_handle_deletions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "deletions");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1) {
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_32);
  }
  v0 = (void *)__atxlog_handle_gi_log;

  return v0;
}

uint64_t ____atxlog_handle_gi_block_invoke()
{
  __atxlog_handle_gi_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "information");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1) {
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_35);
  }
  v0 = (void *)__atxlog_handle_timeline_log;

  return v0;
}

uint64_t ____atxlog_handle_timeline_block_invoke()
{
  __atxlog_handle_timeline_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "timeline");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_38);
  }
  v0 = (void *)__atxlog_handle_relevant_shortcut_log;

  return v0;
}

uint64_t ____atxlog_handle_relevant_shortcut_block_invoke()
{
  __atxlog_handle_relevant_shortcut_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_41);
  }
  v0 = (void *)__atxlog_handle_relevance_model_log;

  return v0;
}

uint64_t ____atxlog_handle_relevance_model_block_invoke()
{
  __atxlog_handle_relevance_model_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevance_model");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1) {
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_44);
  }
  v0 = (void *)__atxlog_handle_watch_log;

  return v0;
}

uint64_t ____atxlog_handle_watch_block_invoke()
{
  __atxlog_handle_watch_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "watch");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1) {
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_47);
  }
  v0 = (void *)__atxlog_handle_ui_log;

  return v0;
}

uint64_t ____atxlog_handle_ui_block_invoke()
{
  __atxlog_handle_ui_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "UI");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)__atxlog_handle_blending_log;

  return v0;
}

uint64_t ____atxlog_handle_blending_block_invoke()
{
  __atxlog_handle_blending_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_53);
  }
  v0 = (void *)__atxlog_handle_blending_internal_cache_log;

  return v0;
}

uint64_t ____atxlog_handle_blending_internal_cache_block_invoke()
{
  __atxlog_handle_blending_internal_cache_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_56);
  }
  v0 = (void *)__atxlog_handle_blending_ecosystem_log;

  return v0;
}

uint64_t ____atxlog_handle_blending_ecosystem_block_invoke()
{
  __atxlog_handle_blending_ecosystem_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_59);
  }
  v0 = (void *)__atxlog_handle_home_screen_log;

  return v0;
}

uint64_t ____atxlog_handle_home_screen_block_invoke()
{
  __atxlog_handle_home_screen_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "homescreen");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1) {
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_62);
  }
  v0 = (void *)__atxlog_handle_sleep_schedule_log;

  return v0;
}

uint64_t ____atxlog_handle_sleep_schedule_block_invoke()
{
  __atxlog_handle_sleep_schedule_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "sleepschedule");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_65);
  }
  v0 = (void *)__atxlog_handle_lock_screen_log;

  return v0;
}

uint64_t ____atxlog_handle_lock_screen_block_invoke()
{
  __atxlog_handle_lock_screen_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "lockscreen");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1) {
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_68);
  }
  v0 = (void *)__atxlog_handle_anchor_log;

  return v0;
}

uint64_t ____atxlog_handle_anchor_block_invoke()
{
  __atxlog_handle_anchor_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "anchor");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_71);
  }
  v0 = (void *)__atxlog_handle_app_prediction_log;

  return v0;
}

uint64_t ____atxlog_handle_app_prediction_block_invoke()
{
  __atxlog_handle_app_prediction_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_prediction");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_74);
  }
  v0 = (void *)__atxlog_handle_action_prediction_log;

  return v0;
}

uint64_t ____atxlog_handle_action_prediction_block_invoke()
{
  __atxlog_handle_action_prediction_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "action_prediction");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_77);
  }
  v0 = (void *)__atxlog_handle_app_library_log;

  return v0;
}

uint64_t ____atxlog_handle_app_library_block_invoke()
{
  __atxlog_handle_app_library_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_library");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_80);
  }
  v0 = (void *)__atxlog_handle_app_install_log;

  return v0;
}

uint64_t ____atxlog_handle_app_install_block_invoke()
{
  __atxlog_handle_app_install_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_install");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1) {
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_83);
  }
  v0 = (void *)__atxlog_handle_backup_log;

  return v0;
}

uint64_t ____atxlog_handle_backup_block_invoke()
{
  __atxlog_handle_backup_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "backup");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1) {
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_86);
  }
  v0 = (void *)__atxlog_handle_metrics_log;

  return v0;
}

uint64_t ____atxlog_handle_metrics_block_invoke()
{
  __atxlog_handle_metrics_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "metrics");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1) {
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_89);
  }
  v0 = (void *)__atxlog_handle_trial_assets_log;

  return v0;
}

uint64_t ____atxlog_handle_trial_assets_block_invoke()
{
  __atxlog_handle_trial_assets_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "trial_assets");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_92);
  }
  v0 = (void *)__atxlog_handle_notification_management_log;

  return v0;
}

uint64_t ____atxlog_handle_notification_management_block_invoke()
{
  __atxlog_handle_notification_management_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_management");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_95);
  }
  v0 = (void *)__atxlog_handle_contextual_actions_log;

  return v0;
}

uint64_t ____atxlog_handle_contextual_actions_block_invoke()
{
  __atxlog_handle_contextual_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextual_actions");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1) {
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_98);
  }
  v0 = (void *)__atxlog_handle_intents_helper_log;

  return v0;
}

uint64_t ____atxlog_handle_intents_helper_block_invoke()
{
  __atxlog_handle_intents_helper_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "intents_helper");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_101);
  }
  v0 = (void *)__atxlog_handle_context_heuristic_log;

  return v0;
}

uint64_t ____atxlog_handle_context_heuristic_block_invoke()
{
  __atxlog_handle_context_heuristic_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "context_heuristic");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1) {
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_104);
  }
  v0 = (void *)__atxlog_handle_zkw_hide_log;

  return v0;
}

uint64_t ____atxlog_handle_zkw_hide_block_invoke()
{
  __atxlog_handle_zkw_hide_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "zkw_hide");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_107);
  }
  v0 = (void *)__atxlog_handle_context_user_education_suggestions_log;

  return v0;
}

uint64_t ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1) {
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_110);
  }
  v0 = (void *)__atxlog_handle_time_intelligence_log;

  return v0;
}

uint64_t ____atxlog_handle_time_intelligence_block_invoke()
{
  __atxlog_handle_time_intelligence_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "time");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_113);
  }
  v0 = (void *)__atxlog_handle_contextual_engine_log;

  return v0;
}

uint64_t ____atxlog_handle_contextual_engine_block_invoke()
{
  __atxlog_handle_contextual_engine_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextualengine");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1) {
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_116);
  }
  v0 = (void *)__atxlog_handle_usage_insights_log;

  return v0;
}

uint64_t ____atxlog_handle_usage_insights_block_invoke()
{
  __atxlog_handle_usage_insights_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "usage_insights");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_119);
  }
  v0 = (void *)__atxlog_handle_notification_categorization_log;

  return v0;
}

uint64_t ____atxlog_handle_notification_categorization_block_invoke()
{
  __atxlog_handle_notification_categorization_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_categorization");

  return MEMORY[0x270F9A758]();
}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_122);
  }
  v0 = (void *)__atxlog_handle_settings_actions_log;

  return v0;
}

uint64_t ____atxlog_handle_settings_actions_block_invoke()
{
  __atxlog_handle_settings_actions_log = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");

  return MEMORY[0x270F9A758]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

uint64_t GEOTileLoaderClientIdentifier()
{
  return MEMORY[0x270F301E0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x270F58528]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x270F58530]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteSfixed32Field()
{
  return MEMORY[0x270F58570]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PBRepeatedBOOLAdd()
{
  return MEMORY[0x270F58610]();
}

uint64_t PBRepeatedBOOLClear()
{
  return MEMORY[0x270F58618]();
}

uint64_t PBRepeatedBOOLCopy()
{
  return MEMORY[0x270F58620]();
}

uint64_t PBRepeatedBOOLHash()
{
  return MEMORY[0x270F58628]();
}

uint64_t PBRepeatedBOOLIsEqual()
{
  return MEMORY[0x270F58630]();
}

uint64_t PBRepeatedBOOLNSArray()
{
  return MEMORY[0x270F58638]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x270F58680]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x270F58688]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x270F58690]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x270F58698]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x270F586A0]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x270F586A8]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x270F586F8]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x270F58708]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x270F58710]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x270F58720]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x270F58730]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x270F58740]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x270F58760]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x270F58768]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x270F58770]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x270F58778]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x270F58780]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x270F58788]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}