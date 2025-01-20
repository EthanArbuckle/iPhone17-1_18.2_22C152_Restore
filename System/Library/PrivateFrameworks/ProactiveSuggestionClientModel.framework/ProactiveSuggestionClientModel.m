void sub_1AE680DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE680E5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ATXPBSuggestionLayoutReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 116) |= 4u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_81;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_83;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_81:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_83:
        *(_DWORD *)(a1 + 40) = v20;
        goto LABEL_107;
      case 2u:
        *(unsigned char *)(a1 + 116) |= 1u;
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v28 = *(void *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v28 = 0;
        }
        *(void *)(a1 + 8) = v28;
        goto LABEL_107;
      case 3u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 96;
        goto LABEL_67;
      case 4u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addOneByOneSuggestions:](a1, v31);
        goto LABEL_77;
      case 5u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addOneByTwoSuggestions:](a1, v31);
        goto LABEL_77;
      case 6u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addTwoByTwoSuggestions:](a1, v31);
        goto LABEL_77;
      case 7u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addOneByFourSuggestions:](a1, v31);
        goto LABEL_77;
      case 8u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addTwoByFourSuggestions:](a1, v31);
        goto LABEL_77;
      case 9u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0;
        *(unsigned char *)(a1 + 116) |= 0x40u;
        while (2)
        {
          uint64_t v35 = *v3;
          uint64_t v36 = *(void *)(a2 + v35);
          unint64_t v37 = v36 + 1;
          if (v36 == -1 || v37 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if (v38 < 0)
            {
              v32 += 7;
              BOOL v15 = v33++ >= 9;
              if (v15)
              {
                uint64_t v34 = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v34 = 0;
        }
LABEL_87:
        BOOL v68 = v34 != 0;
        uint64_t v69 = 115;
        goto LABEL_100;
      case 0xAu:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 116) |= 8u;
        while (2)
        {
          uint64_t v42 = *v3;
          uint64_t v43 = *(void *)(a2 + v42);
          unint64_t v44 = v43 + 1;
          if (v43 == -1 || v44 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v44;
            v41 |= (unint64_t)(v45 & 0x7F) << v39;
            if (v45 < 0)
            {
              v39 += 7;
              BOOL v15 = v40++ >= 9;
              if (v15)
              {
                uint64_t v41 = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v41 = 0;
        }
LABEL_91:
        BOOL v68 = v41 != 0;
        uint64_t v69 = 112;
        goto LABEL_100;
      case 0xBu:
        char v46 = 0;
        unsigned int v47 = 0;
        uint64_t v48 = 0;
        *(unsigned char *)(a1 + 116) |= 0x20u;
        while (2)
        {
          uint64_t v49 = *v3;
          uint64_t v50 = *(void *)(a2 + v49);
          unint64_t v51 = v50 + 1;
          if (v50 == -1 || v51 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
            *(void *)(a2 + v49) = v51;
            v48 |= (unint64_t)(v52 & 0x7F) << v46;
            if (v52 < 0)
            {
              v46 += 7;
              BOOL v15 = v47++ >= 9;
              if (v15)
              {
                uint64_t v48 = 0;
                goto LABEL_95;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v48 = 0;
        }
LABEL_95:
        BOOL v68 = v48 != 0;
        uint64_t v69 = 114;
        goto LABEL_100;
      case 0xCu:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 104;
        goto LABEL_67;
      case 0xDu:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v55 = 0;
        *(unsigned char *)(a1 + 116) |= 0x10u;
        while (2)
        {
          uint64_t v56 = *v3;
          uint64_t v57 = *(void *)(a2 + v56);
          unint64_t v58 = v57 + 1;
          if (v57 == -1 || v58 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v58;
            v55 |= (unint64_t)(v59 & 0x7F) << v53;
            if (v59 < 0)
            {
              v53 += 7;
              BOOL v15 = v54++ >= 9;
              if (v15)
              {
                uint64_t v55 = 0;
                goto LABEL_99;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v55 = 0;
        }
LABEL_99:
        BOOL v68 = v55 != 0;
        uint64_t v69 = 113;
LABEL_100:
        *(unsigned char *)(a1 + v69) = v68;
        goto LABEL_107;
      case 0xEu:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 88;
LABEL_67:
        v60 = *(void **)(a1 + v30);
        *(void *)(a1 + v30) = v29;

        goto LABEL_107;
      case 0xFu:
        char v61 = 0;
        unsigned int v62 = 0;
        uint64_t v63 = 0;
        *(unsigned char *)(a1 + 116) |= 2u;
        while (2)
        {
          uint64_t v64 = *v3;
          uint64_t v65 = *(void *)(a2 + v64);
          unint64_t v66 = v65 + 1;
          if (v65 == -1 || v66 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
            *(void *)(a2 + v64) = v66;
            v63 |= (unint64_t)(v67 & 0x7F) << v61;
            if (v67 < 0)
            {
              v61 += 7;
              BOOL v15 = v62++ >= 9;
              if (v15)
              {
                uint64_t v63 = 0;
                goto LABEL_104;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v63 = 0;
        }
LABEL_104:
        *(void *)(a1 + 16) = v63;
        goto LABEL_107;
      case 0x10u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addFourByFourSuggestions:](a1, v31);
        goto LABEL_77;
      case 0x11u:
        v31 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBSuggestionLayout addFourByEightSuggestions:](a1, v31);
LABEL_77:
        if (PBReaderPlaceMark() && ATXPBProactiveSuggestionReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

LABEL_107:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_107;
    }
  }
}

BOOL ATXPBProactiveSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        char v18 = *(ATXPBProactiveSuggestionClientModelSpecification **)(a1 + 40);
        *(void *)(a1 + 40) = v17;
        goto LABEL_34;
      case 2u:
        char v18 = objc_alloc_init(ATXPBProactiveSuggestionClientModelSpecification);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark()
          || (ATXPBProactiveSuggestionClientModelSpecificationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_38;
        }
        goto LABEL_33;
      case 3u:
        char v18 = objc_alloc_init(ATXPBProactiveSuggestionExecutableSpecification);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark()
          || (ATXPBProactiveSuggestionExecutableSpecificationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_38;
        }
        goto LABEL_33;
      case 4u:
        char v18 = objc_alloc_init(ATXPBProactiveSuggestionUISpecification);
        objc_storeStrong((id *)(a1 + 32), v18);
        if (!PBReaderPlaceMark()
          || (ATXPBProactiveSuggestionUISpecificationReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_38;
        }
        goto LABEL_33;
      case 5u:
        char v18 = objc_alloc_init(ATXPBProactiveSuggestionScoreSpecification);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (PBReaderPlaceMark()
          && (ATXPBProactiveSuggestionScoreSpecificationReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_33:
          PBReaderRecallMark();
LABEL_34:

LABEL_35:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_38:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_35;
    }
  }
}

uint64_t ATXPBProactiveSuggestionUISpecificationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x1E9A81000uLL;
  unint64_t v8 = 0x1E9A81000uLL;
  unint64_t v9 = 0x1E9A81000uLL;
  unint64_t v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
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
      char v17 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
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
        int v19 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v19 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v19 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = *(int *)(v7 + 1312);
        goto LABEL_24;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = *(int *)(v8 + 1316);
        goto LABEL_24;
      case 3u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = *(int *)(v9 + 1320);
LABEL_24:
        char v24 = *(void **)(a1 + v22);
        *(void *)(a1 + v22) = v21;

        goto LABEL_95;
      case 4u:
        unint64_t v25 = v9;
        unint64_t v26 = v8;
        unint64_t v27 = v7;
        uint64_t v28 = objc_alloc_init(ATXPBProactiveSuggestionLayoutConfig);
        -[ATXPBProactiveSuggestionUISpecification addPreferredLayoutConfigs:](a1, v28);
        if (PBReaderPlaceMark()
          && (ATXPBProactiveSuggestionLayoutConfigReadFrom((uint64_t)v28, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          unint64_t v7 = v27;
          unint64_t v8 = v26;
          unint64_t v9 = v25;
LABEL_95:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 5u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 68) |= 0x10u;
        while (2)
        {
          uint64_t v32 = *v3;
          uint64_t v33 = *(void *)(a2 + v32);
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v10) + v33);
            *(void *)(a2 + v32) = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if (v35 < 0)
            {
              v29 += 7;
              BOOL v18 = v30++ >= 9;
              if (v18)
              {
                uint64_t v31 = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_72:
        BOOL v69 = v31 != 0;
        uint64_t v70 = 65;
        goto LABEL_85;
      case 6u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v38 = 0;
        *(unsigned char *)(a1 + 68) |= 8u;
        while (2)
        {
          uint64_t v39 = *v3;
          uint64_t v40 = *(void *)(a2 + v39);
          unint64_t v41 = v40 + 1;
          if (v40 == -1 || v41 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v10) + v40);
            *(void *)(a2 + v39) = v41;
            v38 |= (unint64_t)(v42 & 0x7F) << v36;
            if (v42 < 0)
            {
              v36 += 7;
              BOOL v18 = v37++ >= 9;
              if (v18)
              {
                uint64_t v38 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v38 = 0;
        }
LABEL_76:
        BOOL v69 = v38 != 0;
        uint64_t v70 = 64;
        goto LABEL_85;
      case 7u:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v45 = 0;
        *(unsigned char *)(a1 + 68) |= 0x20u;
        while (2)
        {
          uint64_t v46 = *v3;
          uint64_t v47 = *(void *)(a2 + v46);
          unint64_t v48 = v47 + 1;
          if (v47 == -1 || v48 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v10) + v47);
            *(void *)(a2 + v46) = v48;
            v45 |= (unint64_t)(v49 & 0x7F) << v43;
            if (v49 < 0)
            {
              v43 += 7;
              BOOL v18 = v44++ >= 9;
              if (v18)
              {
                uint64_t v45 = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v45 = 0;
        }
LABEL_80:
        BOOL v69 = v45 != 0;
        uint64_t v70 = 66;
        goto LABEL_85;
      case 8u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v52 = 0;
        *(unsigned char *)(a1 + 68) |= 0x40u;
        while (2)
        {
          uint64_t v53 = *v3;
          uint64_t v54 = *(void *)(a2 + v53);
          unint64_t v55 = v54 + 1;
          if (v54 == -1 || v55 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v56 = *(unsigned char *)(*(void *)(a2 + *v10) + v54);
            *(void *)(a2 + v53) = v55;
            v52 |= (unint64_t)(v56 & 0x7F) << v50;
            if (v56 < 0)
            {
              v50 += 7;
              BOOL v18 = v51++ >= 9;
              if (v18)
              {
                uint64_t v52 = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v52 = 0;
        }
LABEL_84:
        BOOL v69 = v52 != 0;
        uint64_t v70 = 67;
LABEL_85:
        *(unsigned char *)(a1 + v70) = v69;
        goto LABEL_95;
      case 9u:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v59 = 0;
        *(unsigned char *)(a1 + 68) |= 4u;
        while (2)
        {
          uint64_t v60 = *v3;
          uint64_t v61 = *(void *)(a2 + v60);
          unint64_t v62 = v61 + 1;
          if (v61 == -1 || v62 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v63 = *(unsigned char *)(*(void *)(a2 + *v10) + v61);
            *(void *)(a2 + v60) = v62;
            v59 |= (unint64_t)(v63 & 0x7F) << v57;
            if (v63 < 0)
            {
              v57 += 7;
              BOOL v18 = v58++ >= 9;
              if (v18)
              {
                uint64_t v59 = 0;
                goto LABEL_89;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v59 = 0;
        }
LABEL_89:
        *(void *)(a1 + 24) = v59;
        goto LABEL_95;
      case 0xAu:
        *(unsigned char *)(a1 + 68) |= 2u;
        uint64_t v64 = *v3;
        unint64_t v65 = *(void *)(a2 + v64);
        if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v66 = *(void *)(*(void *)(a2 + *v10) + v65);
          *(void *)(a2 + v64) = v65 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v66 = 0;
        }
        uint64_t v71 = 16;
        goto LABEL_94;
      case 0xBu:
        *(unsigned char *)(a1 + 68) |= 1u;
        uint64_t v67 = *v3;
        unint64_t v68 = *(void *)(a2 + v67);
        if (v68 <= 0xFFFFFFFFFFFFFFF7 && v68 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v66 = *(void *)(*(void *)(a2 + *v10) + v68);
          *(void *)(a2 + v67) = v68 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v66 = 0;
        }
        uint64_t v71 = 8;
LABEL_94:
        *(void *)(a1 + v71) = v66;
        goto LABEL_95;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_95;
    }
  }
}

uint64_t ATXPBProactiveSuggestionScoreSpecificationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_33;
          }
          v21 += 7;
          BOOL v15 = v22++ >= 9;
          if (v15)
          {
            LODWORD(v23) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 20) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBProactiveSuggestionLayoutConfigReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBProactiveSuggestionExecutableSpecificationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16;
          goto LABEL_32;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 52) |= 1u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  uint64_t v22 = 0;
                  goto LABEL_43;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_43:
          *(void *)(a1 + 8) = v22;
          continue;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_32;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_32;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
LABEL_32:
          unint64_t v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 6u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 52) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 == -1 || v31 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0) {
          goto LABEL_45;
        }
        v27 += 7;
        BOOL v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v29) = 0;
          goto LABEL_47;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v29) = 0;
      }
LABEL_47:
      *(_DWORD *)(a1 + 48) = v29;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBProactiveSuggestionClientModelSpecificationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_36:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else
      {
        if (v17 == 2)
        {
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 16;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 8;
        }
        unint64_t v26 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)__atxlog_handle_blending_log;
  return v0;
}

uint64_t ATXPBShortcutsEditorEventReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 48) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
        goto LABEL_44;
      case 2u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 48) |= 2u;
        while (2)
        {
          uint64_t v25 = *v3;
          uint64_t v26 = *(void *)(a2 + v25);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              BOOL v15 = v23++ >= 9;
              if (v15)
              {
                uint64_t v24 = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v24 = 0;
        }
LABEL_41:
        *(void *)(a1 + 16) = v24;
        goto LABEL_44;
      case 3u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v29;

        goto LABEL_44;
      case 4u:
        PBReaderReadString();
        unint64_t v31 = (ATXPBShortcutsEditorEventMetadata *)objc_claimAutoreleasedReturnValue();
        if (v31) {
          [(id)a1 addSuggestionUUIDs:v31];
        }
        goto LABEL_37;
      case 5u:
        unint64_t v31 = objc_alloc_init(ATXPBShortcutsEditorEventMetadata);
        objc_storeStrong((id *)(a1 + 32), v31);
        if PBReaderPlaceMark() && (ATXPBShortcutsEditorEventMetadataReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();
LABEL_37:

LABEL_44:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_44;
    }
  }
}

uint64_t ATXPBRequestForContextualActionSuggestionsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
          goto LABEL_25;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 40;
          goto LABEL_25;
        case 3u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 24;
          goto LABEL_25;
        case 4u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 16;
LABEL_25:
          unsigned int v21 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 5u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 56) |= 2u;
          break;
        case 6u:
          *(unsigned char *)(a1 + 56) |= 1u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v31 = 0;
          }
          *(void *)(a1 + 8) = v31;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v3;
        uint64_t v26 = *(void *)(a2 + v25);
        unint64_t v27 = v26 + 1;
        if (v26 == -1 || v27 > *(void *)(a2 + *v4)) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
        *(void *)(a2 + v25) = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0) {
          goto LABEL_37;
        }
        v22 += 7;
        BOOL v15 = v23++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_39;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v24) = 0;
      }
LABEL_39:
      *(_DWORD *)(a1 + 32) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t ATXPBLightweightProactiveSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_23;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
LABEL_23:
        uint64_t v20 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_38;
      case 3u:
        unsigned int v21 = objc_alloc_init(ATXPBProactiveSuggestionScoreSpecification);
        objc_storeStrong((id *)(a1 + 32), v21);
        if (PBReaderPlaceMark()
          && (ATXPBProactiveSuggestionScoreSpecificationReadFrom((uint64_t)v21, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_38:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (2)
        {
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 == -1 || v26 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              BOOL v14 = v23++ >= 9;
              if (v14)
              {
                uint64_t v24 = 0;
                goto LABEL_37;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v24 = 0;
        }
LABEL_37:
        *(void *)(a1 + 8) = v24;
        goto LABEL_38;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_38;
    }
  }
}

void sub_1AE68A9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AE690DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1AE691068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE691228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE692144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1AE695C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AE695E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AE696A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1AE697528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AE6976B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AE6982F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1AE69846C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ATXPBSuggestionCollectionReadFrom(char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v20 = objc_alloc_init(ATXPBProactiveSuggestion);
        [a1 addSuggestions:v20];
        if (!PBReaderPlaceMark() || !ATXPBProactiveSuggestionReadFrom((uint64_t)v20, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 16;
LABEL_23:
    uint64_t v20 = *(ATXPBProactiveSuggestion **)&a1[v19];
    *(void *)&a1[v19] = v18;
LABEL_27:

    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1AE69B628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1AE69B9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AE69BEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t ATXPBContextualActionsGroupedUIFeedbackResultReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          unint64_t v17 = objc_alloc_init(ATXPBProactiveSuggestionGroupedUIFeedbackResult);
          objc_storeStrong((id *)(a1 + 32), v17);
          if (PBReaderPlaceMark()
            && (ATXPBProactiveSuggestionGroupedUIFeedbackResultReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          while (1)
          {
            uint64_t v21 = *v3;
            unint64_t v22 = *(void *)(a2 + v21);
            if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_46;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              uint64_t v20 = 0;
              goto LABEL_48;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_48:
          uint64_t v35 = 24;
          goto LABEL_57;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v20 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v20 = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_52:
          uint64_t v35 = 16;
          goto LABEL_57;
        case 6u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v32 = *v3;
        unint64_t v33 = *(void *)(a2 + v32);
        if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
        *(void *)(a2 + v32) = v33 + 1;
        v20 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0) {
          goto LABEL_54;
        }
        v30 += 7;
        BOOL v14 = v31++ >= 9;
        if (v14)
        {
          uint64_t v20 = 0;
          goto LABEL_56;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v20 = 0;
      }
LABEL_56:
      uint64_t v35 = 8;
LABEL_57:
      *(void *)(a1 + v35) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1AE69F4D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE69FC70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE69FF9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1) {
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)__atxlog_handle_default_log;
  return v0;
}

uint64_t ____atxlog_handle_default_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "general");
  uint64_t v1 = __atxlog_handle_default_log;
  __atxlog_handle_default_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1) {
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)__atxlog_handle_xpc_log;
  return v0;
}

uint64_t ____atxlog_handle_xpc_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "xpc");
  uint64_t v1 = __atxlog_handle_xpc_log;
  __atxlog_handle_xpc_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_7);
  }
  os_log_t v0 = (void *)__atxlog_handle_heuristic_log;
  return v0;
}

uint64_t ____atxlog_handle_heuristic_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "heuristic");
  uint64_t v1 = __atxlog_handle_heuristic_log;
  __atxlog_handle_heuristic_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_10);
  }
  os_log_t v0 = (void *)__atxlog_handle_notifications_log;
  return v0;
}

uint64_t ____atxlog_handle_notifications_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "notifications");
  uint64_t v1 = __atxlog_handle_notifications_log;
  __atxlog_handle_notifications_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1) {
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_13_0);
  }
  os_log_t v0 = (void *)__atxlog_handle_pmm_log;
  return v0;
}

uint64_t ____atxlog_handle_pmm_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  uint64_t v1 = __atxlog_handle_pmm_log;
  __atxlog_handle_pmm_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1) {
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_17);
  }
  os_log_t v0 = (void *)__atxlog_handle_dailyroutines_log;
  return v0;
}

uint64_t ____atxlog_handle_dailyroutines_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  uint64_t v1 = __atxlog_handle_dailyroutines_log;
  __atxlog_handle_dailyroutines_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1) {
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_20);
  }
  os_log_t v0 = (void *)__atxlog_handle_feedback_log;
  return v0;
}

uint64_t ____atxlog_handle_feedback_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "feedback");
  uint64_t v1 = __atxlog_handle_feedback_log;
  __atxlog_handle_feedback_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1) {
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_23_0);
  }
  os_log_t v0 = (void *)__atxlog_handle_modes_log;
  return v0;
}

uint64_t ____atxlog_handle_modes_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "modes");
  uint64_t v1 = __atxlog_handle_modes_log;
  __atxlog_handle_modes_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1) {
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_26);
  }
  os_log_t v0 = (void *)__atxlog_handle_hero_log;
  return v0;
}

uint64_t ____atxlog_handle_hero_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "hero");
  uint64_t v1 = __atxlog_handle_hero_log;
  __atxlog_handle_hero_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_29);
  }
  os_log_t v0 = (void *)__atxlog_handle_deletions_log;
  return v0;
}

uint64_t ____atxlog_handle_deletions_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "deletions");
  uint64_t v1 = __atxlog_handle_deletions_log;
  __atxlog_handle_deletions_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1) {
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_32);
  }
  os_log_t v0 = (void *)__atxlog_handle_gi_log;
  return v0;
}

uint64_t ____atxlog_handle_gi_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "information");
  uint64_t v1 = __atxlog_handle_gi_log;
  __atxlog_handle_gi_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1) {
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_35);
  }
  os_log_t v0 = (void *)__atxlog_handle_timeline_log;
  return v0;
}

uint64_t ____atxlog_handle_timeline_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "timeline");
  uint64_t v1 = __atxlog_handle_timeline_log;
  __atxlog_handle_timeline_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_38);
  }
  os_log_t v0 = (void *)__atxlog_handle_relevant_shortcut_log;
  return v0;
}

uint64_t ____atxlog_handle_relevant_shortcut_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  uint64_t v1 = __atxlog_handle_relevant_shortcut_log;
  __atxlog_handle_relevant_shortcut_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1) {
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_41);
  }
  os_log_t v0 = (void *)__atxlog_handle_relevance_model_log;
  return v0;
}

uint64_t ____atxlog_handle_relevance_model_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  uint64_t v1 = __atxlog_handle_relevance_model_log;
  __atxlog_handle_relevance_model_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1) {
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_44);
  }
  os_log_t v0 = (void *)__atxlog_handle_watch_log;
  return v0;
}

uint64_t ____atxlog_handle_watch_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "watch");
  uint64_t v1 = __atxlog_handle_watch_log;
  __atxlog_handle_watch_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1) {
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_47);
  }
  os_log_t v0 = (void *)__atxlog_handle_ui_log;
  return v0;
}

uint64_t ____atxlog_handle_ui_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "UI");
  uint64_t v1 = __atxlog_handle_ui_log;
  __atxlog_handle_ui_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ____atxlog_handle_blending_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "blending");
  uint64_t v1 = __atxlog_handle_blending_log;
  __atxlog_handle_blending_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_53);
  }
  os_log_t v0 = (void *)__atxlog_handle_blending_internal_cache_log;
  return v0;
}

uint64_t ____atxlog_handle_blending_internal_cache_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  uint64_t v1 = __atxlog_handle_blending_internal_cache_log;
  __atxlog_handle_blending_internal_cache_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1) {
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_56);
  }
  os_log_t v0 = (void *)__atxlog_handle_blending_ecosystem_log;
  return v0;
}

uint64_t ____atxlog_handle_blending_ecosystem_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  uint64_t v1 = __atxlog_handle_blending_ecosystem_log;
  __atxlog_handle_blending_ecosystem_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_59);
  }
  os_log_t v0 = (void *)__atxlog_handle_home_screen_log;
  return v0;
}

uint64_t ____atxlog_handle_home_screen_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "homescreen");
  uint64_t v1 = __atxlog_handle_home_screen_log;
  __atxlog_handle_home_screen_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1) {
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_62);
  }
  os_log_t v0 = (void *)__atxlog_handle_sleep_schedule_log;
  return v0;
}

uint64_t ____atxlog_handle_sleep_schedule_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  uint64_t v1 = __atxlog_handle_sleep_schedule_log;
  __atxlog_handle_sleep_schedule_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1) {
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_65);
  }
  os_log_t v0 = (void *)__atxlog_handle_lock_screen_log;
  return v0;
}

uint64_t ____atxlog_handle_lock_screen_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  uint64_t v1 = __atxlog_handle_lock_screen_log;
  __atxlog_handle_lock_screen_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1) {
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_68);
  }
  os_log_t v0 = (void *)__atxlog_handle_anchor_log;
  return v0;
}

uint64_t ____atxlog_handle_anchor_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "anchor");
  uint64_t v1 = __atxlog_handle_anchor_log;
  __atxlog_handle_anchor_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_71);
  }
  os_log_t v0 = (void *)__atxlog_handle_app_prediction_log;
  return v0;
}

uint64_t ____atxlog_handle_app_prediction_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  uint64_t v1 = __atxlog_handle_app_prediction_log;
  __atxlog_handle_app_prediction_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1) {
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_74);
  }
  os_log_t v0 = (void *)__atxlog_handle_action_prediction_log;
  return v0;
}

uint64_t ____atxlog_handle_action_prediction_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  uint64_t v1 = __atxlog_handle_action_prediction_log;
  __atxlog_handle_action_prediction_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_77);
  }
  os_log_t v0 = (void *)__atxlog_handle_app_library_log;
  return v0;
}

uint64_t ____atxlog_handle_app_library_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "app_library");
  uint64_t v1 = __atxlog_handle_app_library_log;
  __atxlog_handle_app_library_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1) {
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_80);
  }
  os_log_t v0 = (void *)__atxlog_handle_app_install_log;
  return v0;
}

uint64_t ____atxlog_handle_app_install_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "app_install");
  uint64_t v1 = __atxlog_handle_app_install_log;
  __atxlog_handle_app_install_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1) {
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_83);
  }
  os_log_t v0 = (void *)__atxlog_handle_backup_log;
  return v0;
}

uint64_t ____atxlog_handle_backup_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "backup");
  uint64_t v1 = __atxlog_handle_backup_log;
  __atxlog_handle_backup_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1) {
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_86);
  }
  os_log_t v0 = (void *)__atxlog_handle_metrics_log;
  return v0;
}

uint64_t ____atxlog_handle_metrics_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "metrics");
  uint64_t v1 = __atxlog_handle_metrics_log;
  __atxlog_handle_metrics_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1) {
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_89);
  }
  os_log_t v0 = (void *)__atxlog_handle_trial_assets_log;
  return v0;
}

uint64_t ____atxlog_handle_trial_assets_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  uint64_t v1 = __atxlog_handle_trial_assets_log;
  __atxlog_handle_trial_assets_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_92);
  }
  os_log_t v0 = (void *)__atxlog_handle_notification_management_log;
  return v0;
}

uint64_t ____atxlog_handle_notification_management_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "notification_management");
  uint64_t v1 = __atxlog_handle_notification_management_log;
  __atxlog_handle_notification_management_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_95);
  }
  os_log_t v0 = (void *)__atxlog_handle_contextual_actions_log;
  return v0;
}

uint64_t ____atxlog_handle_contextual_actions_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  uint64_t v1 = __atxlog_handle_contextual_actions_log;
  __atxlog_handle_contextual_actions_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1) {
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_98);
  }
  os_log_t v0 = (void *)__atxlog_handle_intents_helper_log;
  return v0;
}

uint64_t ____atxlog_handle_intents_helper_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  uint64_t v1 = __atxlog_handle_intents_helper_log;
  __atxlog_handle_intents_helper_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_101);
  }
  os_log_t v0 = (void *)__atxlog_handle_context_heuristic_log;
  return v0;
}

uint64_t ____atxlog_handle_context_heuristic_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  uint64_t v1 = __atxlog_handle_context_heuristic_log;
  __atxlog_handle_context_heuristic_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1) {
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_104);
  }
  os_log_t v0 = (void *)__atxlog_handle_zkw_hide_log;
  return v0;
}

uint64_t ____atxlog_handle_zkw_hide_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  uint64_t v1 = __atxlog_handle_zkw_hide_log;
  __atxlog_handle_zkw_hide_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_107);
  }
  os_log_t v0 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  return v0;
}

uint64_t ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  uint64_t v1 = __atxlog_handle_context_user_education_suggestions_log;
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1) {
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_110);
  }
  os_log_t v0 = (void *)__atxlog_handle_time_intelligence_log;
  return v0;
}

uint64_t ____atxlog_handle_time_intelligence_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "time");
  uint64_t v1 = __atxlog_handle_time_intelligence_log;
  __atxlog_handle_time_intelligence_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1) {
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_113);
  }
  os_log_t v0 = (void *)__atxlog_handle_contextual_engine_log;
  return v0;
}

uint64_t ____atxlog_handle_contextual_engine_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  uint64_t v1 = __atxlog_handle_contextual_engine_log;
  __atxlog_handle_contextual_engine_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1) {
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_116);
  }
  os_log_t v0 = (void *)__atxlog_handle_usage_insights_log;
  return v0;
}

uint64_t ____atxlog_handle_usage_insights_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  uint64_t v1 = __atxlog_handle_usage_insights_log;
  __atxlog_handle_usage_insights_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1) {
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_119);
  }
  os_log_t v0 = (void *)__atxlog_handle_notification_categorization_log;
  return v0;
}

uint64_t ____atxlog_handle_notification_categorization_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  uint64_t v1 = __atxlog_handle_notification_categorization_log;
  __atxlog_handle_notification_categorization_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1) {
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_122);
  }
  os_log_t v0 = (void *)__atxlog_handle_settings_actions_log;
  return v0;
}

uint64_t ____atxlog_handle_settings_actions_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  uint64_t v1 = __atxlog_handle_settings_actions_log;
  __atxlog_handle_settings_actions_log = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t ATXPBProactiveSuggestionGroupedUIFeedbackResultReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(_WORD *)(a1 + 76) |= 0x20u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_77;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_79;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_77:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_79:
          uint64_t v68 = 48;
          goto LABEL_100;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v20 = 0;
          *(_WORD *)(a1 + 76) |= 0x40u;
          while (2)
          {
            uint64_t v28 = *v3;
            uint64_t v29 = *(void *)(a2 + v28);
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v30;
              v20 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (v15)
                {
                  uint64_t v20 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_83:
          uint64_t v68 = 56;
          goto LABEL_100;
        case 3u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v20 = 0;
          *(_WORD *)(a1 + 76) |= 0x10u;
          while (2)
          {
            uint64_t v34 = *v3;
            uint64_t v35 = *(void *)(a2 + v34);
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v36;
              v20 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v15 = v33++ >= 9;
                if (v15)
                {
                  uint64_t v20 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_87:
          uint64_t v68 = 40;
          goto LABEL_100;
        case 4u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v20 = 0;
          *(_WORD *)(a1 + 76) |= 4u;
          while (2)
          {
            uint64_t v40 = *v3;
            uint64_t v41 = *(void *)(a2 + v40);
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
              *(void *)(a2 + v40) = v42;
              v20 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v15 = v39++ >= 9;
                if (v15)
                {
                  uint64_t v20 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_91:
          uint64_t v68 = 24;
          goto LABEL_100;
        case 5u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v20 = 0;
          *(_WORD *)(a1 + 76) |= 8u;
          while (2)
          {
            uint64_t v46 = *v3;
            uint64_t v47 = *(void *)(a2 + v46);
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v48;
              v20 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v15 = v45++ >= 9;
                if (v15)
                {
                  uint64_t v20 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_95:
          uint64_t v68 = 32;
          goto LABEL_100;
        case 6u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v20 = 0;
          *(_WORD *)(a1 + 76) |= 2u;
          while (2)
          {
            uint64_t v52 = *v3;
            uint64_t v53 = *(void *)(a2 + v52);
            unint64_t v54 = v53 + 1;
            if (v53 == -1 || v54 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
              *(void *)(a2 + v52) = v54;
              v20 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                BOOL v15 = v51++ >= 9;
                if (v15)
                {
                  uint64_t v20 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_99:
          uint64_t v68 = 16;
LABEL_100:
          *(void *)(a1 + v68) = v20;
          continue;
        case 7u:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + 76) |= 0x100u;
          break;
        case 8u:
          *(_WORD *)(a1 + 76) |= 0x80u;
          uint64_t v63 = *v3;
          unint64_t v64 = *(void *)(a2 + v63);
          if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v65 = *(void *)(*(void *)(a2 + *v7) + v64);
            *(void *)(a2 + v63) = v64 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v65 = 0;
          }
          uint64_t v69 = 64;
          goto LABEL_109;
        case 9u:
          *(_WORD *)(a1 + 76) |= 1u;
          uint64_t v66 = *v3;
          unint64_t v67 = *(void *)(a2 + v66);
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v65 = *(void *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v67 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v65 = 0;
          }
          uint64_t v69 = 8;
LABEL_109:
          *(void *)(a1 + v69) = v65;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v59 = *v3;
        uint64_t v60 = *(void *)(a2 + v59);
        unint64_t v61 = v60 + 1;
        if (v60 == -1 || v61 > *(void *)(a2 + *v4)) {
          break;
        }
        char v62 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
        *(void *)(a2 + v59) = v61;
        v58 |= (unint64_t)(v62 & 0x7F) << v56;
        if ((v62 & 0x80) == 0) {
          goto LABEL_102;
        }
        v56 += 7;
        BOOL v15 = v57++ >= 9;
        if (v15)
        {
          uint64_t v58 = 0;
          goto LABEL_104;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_102:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v58 = 0;
      }
LABEL_104:
      *(unsigned char *)(a1 + 72) = v58 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL ATXPBUIFeedbackPriorContextReadFrom(char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        unint64_t v17 = (ATXPBBlendingModelUICacheUpdate *)objc_claimAutoreleasedReturnValue();
        if (v17) {
          [a1 addCacheUpdateOrdering:v17];
        }
        goto LABEL_33;
      case 2u:
        unint64_t v17 = objc_alloc_init(ATXPBBlendingModelUICacheUpdate);
        [a1 addBlendingModelCacheUpdates:v17];
        if (!PBReaderPlaceMark() || (ATXPBBlendingModelUICacheUpdateReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_37;
        }
        goto LABEL_28;
      case 3u:
        unint64_t v17 = objc_alloc_init(ATXPBClientModelCacheUpdate);
        [a1 addClientModelCacheUpdates:v17];
        if PBReaderPlaceMark() && (ATXPBClientModelCacheUpdateReadFrom((uint64_t)v17, a2))
        {
LABEL_28:
          PBReaderRecallMark();
LABEL_33:

LABEL_34:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_37:

        return 0;
      case 4u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 32;
        goto LABEL_32;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
        goto LABEL_32;
      case 6u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 48;
LABEL_32:
        unint64_t v17 = *(ATXPBBlendingModelUICacheUpdate **)&a1[v19];
        *(void *)&a1[v19] = v18;
        goto LABEL_33;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_34;
    }
  }
}

BOOL ATXPBHomeScreenCachedSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(ATXPBSuggestionLayout **)(a1 + 80);
        *(void *)(a1 + 80) = v17;
        goto LABEL_42;
      case 2u:
        PBReaderReadString();
        uint64_t v18 = (ATXPBSuggestionLayout *)objc_claimAutoreleasedReturnValue();
        if (v18) {
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetIds:](a1, v18);
        }
        goto LABEL_42;
      case 3u:
        uint64_t v18 = objc_alloc_init(ATXPBSuggestionLayout);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestionWidgetLayouts:](a1, v18);
        goto LABEL_34;
      case 4u:
        PBReaderReadString();
        uint64_t v18 = (ATXPBSuggestionLayout *)objc_claimAutoreleasedReturnValue();
        if (v18) {
          -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayoutKeys:](a1, v18);
        }
        goto LABEL_42;
      case 5u:
        uint64_t v18 = objc_alloc_init(ATXPBSuggestionLayout);
        -[ATXPBHomeScreenCachedSuggestion addCachedTopOfStackLayouts:](a1, v18);
        goto LABEL_34;
      case 6u:
        uint64_t v18 = objc_alloc_init(ATXPBProactiveSuggestion);
        -[ATXPBHomeScreenCachedSuggestion addFallbackSuggestions:](a1, v18);
        if (!PBReaderPlaceMark() || !ATXPBProactiveSuggestionReadFrom((uint64_t)v18, a2)) {
          goto LABEL_46;
        }
        goto LABEL_41;
      case 7u:
        PBReaderReadString();
        uint64_t v18 = (ATXPBSuggestionLayout *)objc_claimAutoreleasedReturnValue();
        if (v18) {
          -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelIds:](a1, v18);
        }
        goto LABEL_42;
      case 8u:
        uint64_t v18 = objc_alloc_init(ATXPBSuggestionLayout);
        -[ATXPBHomeScreenCachedSuggestion addCachedAppPredictionPanelLayouts:](a1, v18);
LABEL_34:
        if (!PBReaderPlaceMark() || (ATXPBSuggestionLayoutReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_41;
      case 9u:
        PBReaderReadString();
        uint64_t v18 = (ATXPBSuggestionLayout *)objc_claimAutoreleasedReturnValue();
        if (v18) {
          -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutListKeys:](a1, v18);
        }
        goto LABEL_42;
      case 0xAu:
        uint64_t v18 = objc_alloc_init(ATXPBSuggestionLayoutList);
        -[ATXPBHomeScreenCachedSuggestion addCachedSuggestedWidgetLayoutLists:](a1, v18);
        if PBReaderPlaceMark() && (ATXPBSuggestionLayoutListReadFrom((uint64_t)v18, a2))
        {
LABEL_41:
          PBReaderRecallMark();
LABEL_42:

LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_46:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_43;
    }
  }
}

void sub_1AE6AE840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

uint64_t ATXPBSpotlightUIEventReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_25;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_25;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_25;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_25:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 5u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
        *(void *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_34;
        }
        v21 += 7;
        BOOL v14 = v22++ >= 9;
        if (v14)
        {
          uint64_t v23 = 0;
          goto LABEL_36;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_36:
      *(void *)(a1 + 8) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

void sub_1AE6BB344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *stringForATXSuggestionPredictionReasonCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x2A) {
    return @"Generic";
  }
  else {
    return off_1E5F01470[a1 - 1];
  }
}

void ATXSuggestionPredictionReasonEnumerateReasonCodes(unint64_t a1, void *a2)
{
  uint64_t v4 = a2;
  if (a1)
  {
    for (uint64_t i = 0; i != 43; ++i)
    {
      if ((a1 >> i)) {
        v4[2](v4, i);
      }
    }
  }
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

unsigned char *OUTLINED_FUNCTION_8(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void sub_1AE6C0D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1AE6C1F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE6C233C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t ATXPBRequestForIntentSuggestionsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = objc_alloc_init(ATXPBRequestForSuggestions);
          objc_storeStrong((id *)(a1 + 8), v17);
          if PBReaderPlaceMark() && (ATXPBRequestForSuggestionsReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_28;
          }

          return 0;
        case 2u:
          PBReaderReadString();
          uint64_t v17 = (ATXPBRequestForSuggestions *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [(id)a1 addBundleIds:v17];
          }
          goto LABEL_28;
        case 3u:
          PBReaderReadString();
          uint64_t v17 = (ATXPBRequestForSuggestions *)objc_claimAutoreleasedReturnValue();
          if (v17) {
            [(id)a1 addIntentClassNames:v17];
          }
LABEL_28:

          continue;
        case 4u:
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v22 = *v3;
        unint64_t v23 = *(void *)(a2 + v22);
        if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
        *(void *)(a2 + v22) = v23 + 1;
        v21 |= (unint64_t)(v24 & 0x7F) << v19;
        if ((v24 & 0x80) == 0) {
          goto LABEL_37;
        }
        v19 += 7;
        BOOL v14 = v20++ >= 9;
        if (v14)
        {
          LODWORD(v21) = 0;
          goto LABEL_39;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v21) = 0;
      }
LABEL_39:
      *(_DWORD *)(a1 + 32) = v21;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1AE6C4B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t ATXMPBBlendingClientModelEngagementClientCacheAgeTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          unint64_t v12 = *(void *)(a2 + v11);
          if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v14 = v9++ >= 9;
          if (v14)
          {
            unint64_t v10 = 0;
            int v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = (v10 & 7) == 4;
        }
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v17 = 0;
              unsigned int v18 = 0;
              uint64_t v19 = 0;
              *(unsigned char *)(a1 + 36) |= 1u;
              break;
            case 2u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 16;
              goto LABEL_31;
            case 3u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 24;
              goto LABEL_31;
            case 4u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 8;
LABEL_31:
              char v26 = *(void **)(a1 + v25);
              *(void *)(a1 + v25) = v24;

              goto LABEL_36;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_36:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_33;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_35;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_35:
          *(_DWORD *)(a1 + 32) = v19;
          goto LABEL_36;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1AE6C859C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t ATXPBRequestForInteractionSuggestionsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 40;
              goto LABEL_25;
            case 2u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 24;
              goto LABEL_25;
            case 3u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 16;
              goto LABEL_25;
            case 4u:
              uint64_t v18 = PBReaderReadData();
              uint64_t v19 = 32;
LABEL_25:
              unint64_t v21 = *(void **)(a1 + v19);
              *(void *)(a1 + v19) = v18;

              goto LABEL_26;
            case 5u:
              *(unsigned char *)(a1 + 48) |= 1u;
              uint64_t v22 = *v3;
              unint64_t v23 = *(void *)(a2 + v22);
              if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v24 = *(void *)(*(void *)(a2 + *v7) + v23);
                *(void *)(a2 + v22) = v23 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v24 = 0;
              }
              *(void *)(a1 + 8) = v24;
              goto LABEL_26;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_26:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBInfoSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
          goto LABEL_54;
        case 2u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 112;
          goto LABEL_54;
        case 3u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 120;
          goto LABEL_54;
        case 4u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 128) |= 4u;
          while (2)
          {
            uint64_t v24 = *v3;
            uint64_t v25 = *(void *)(a2 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (v15)
                {
                  uint64_t v23 = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v23 = 0;
          }
LABEL_58:
          uint64_t v42 = 24;
          goto LABEL_63;
        case 5u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 104;
          goto LABEL_54;
        case 6u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 80;
          goto LABEL_54;
        case 7u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 56;
          goto LABEL_54;
        case 8u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 72;
          goto LABEL_54;
        case 9u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 96;
          goto LABEL_54;
        case 0xAu:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 128) |= 1u;
          break;
        case 0xBu:
          *(unsigned char *)(a1 + 128) |= 8u;
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v43 = 32;
          goto LABEL_70;
        case 0xCu:
          *(unsigned char *)(a1 + 128) |= 0x10u;
          uint64_t v37 = *v3;
          unint64_t v38 = *(void *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v43 = 40;
          goto LABEL_70;
        case 0xDu:
          *(unsigned char *)(a1 + 128) |= 2u;
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v43 = 16;
LABEL_70:
          *(void *)(a1 + v43) = v36;
          continue;
        case 0xEu:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 88;
          goto LABEL_54;
        case 0xFu:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 64;
LABEL_54:
          uint64_t v41 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v3;
        uint64_t v31 = *(void *)(a2 + v30);
        unint64_t v32 = v31 + 1;
        if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v32;
        v23 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0) {
          goto LABEL_60;
        }
        v28 += 7;
        BOOL v15 = v29++ >= 9;
        if (v15)
        {
          uint64_t v23 = 0;
          goto LABEL_62;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v23 = 0;
      }
LABEL_62:
      uint64_t v42 = 8;
LABEL_63:
      *(void *)(a1 + v42) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBSpotlightSuggestionLayoutReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v5;
          int v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v16 = *v5;
      int v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v18 = v10 & 7;
      if (v17 || v18 == 4) {
        break;
      }
      unint64_t v20 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        if (v18 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            uint64_t v24 = (unint64_t *)(a2 + *v3);
            unint64_t v25 = *v24;
            unint64_t v26 = *(void *)(a2 + *v4);
            if (*v24 >= v26) {
              break;
            }
            uint64_t v27 = *v5;
            if (*(unsigned char *)(a2 + v27)) {
              break;
            }
            if (v25 > 0xFFFFFFFFFFFFFFF7 || v25 + 8 > v26) {
              *(unsigned char *)(a2 + v27) = 1;
            }
            else {
              *uint64_t v24 = v25 + 8;
            }
            PBRepeatedDoubleAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v29) = v30 + 8;
          }
          else {
            *(unsigned char *)(a2 + v16) = 1;
          }
          PBRepeatedDoubleAdd();
        }
      }
      else if (v20 == 2)
      {
        char v28 = objc_alloc_init(ATXPBSuggestionCollection);
        [a1 addCollections:v28];
        if (!PBReaderPlaceMark() || !ATXPBSuggestionCollectionReadFrom((char *)v28, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v20 == 1)
      {
        uint64_t v21 = PBReaderReadString();
        unsigned int v22 = (void *)a1[5];
        a1[5] = v21;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1AE6D5E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

id ATXProactiveSuggestionRealTimeProviderXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0638E38];
  uint64_t v1 = (void *)MEMORY[0x1B3E6F520]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v2 forSelector:sel_suggestionsForInteractionSuggestionRequest_clientModelId_reply_ argumentIndex:0 ofReply:0];

  v3 = (void *)MEMORY[0x1B3E6F520]();
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v4 forSelector:sel_suggestionsForInteractionSuggestionRequest_clientModelId_reply_ argumentIndex:0 ofReply:1];

  uint64_t v5 = (void *)MEMORY[0x1B3E6F520]();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v6 forSelector:sel_suggestionsForContextualActionSuggestionRequest_clientModelId_reply_ argumentIndex:0 ofReply:0];

  uint64_t v7 = (void *)MEMORY[0x1B3E6F520]();
  char v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v8 forSelector:sel_suggestionsForContextualActionSuggestionRequest_clientModelId_reply_ argumentIndex:0 ofReply:1];

  unsigned int v9 = (void *)MEMORY[0x1B3E6F520]();
  unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v10 forSelector:sel_suggestionsForIntentSuggestionRequest_clientModelId_reply_ argumentIndex:0 ofReply:0];

  uint64_t v11 = (void *)MEMORY[0x1B3E6F520]();
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v12 forSelector:sel_suggestionsForIntentSuggestionRequest_clientModelId_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t ATXPBSuggestionLayoutListReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        int v17 = objc_alloc_init(ATXPBSuggestionLayout);
        -[ATXPBSuggestionLayoutList addLayout:](a1, v17);
        if (!PBReaderPlaceMark() || (ATXPBSuggestionLayoutReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXMPBBlendingClientModelEngagementTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_61;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_61;
        case 3u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 8u;
          while (2)
          {
            uint64_t v23 = *v3;
            unint64_t v24 = *(void *)(a2 + v23);
            if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
              *(void *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                BOOL v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_65:
          uint64_t v47 = 64;
          goto LABEL_82;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 0x10u;
          while (2)
          {
            uint64_t v28 = *v3;
            unint64_t v29 = *(void *)(a2 + v28);
            if (v29 == -1 || v29 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v29 + 1;
              v22 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_69:
          uint64_t v47 = 68;
          goto LABEL_82;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_61;
        case 6u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 4u;
          while (2)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v34 + 1;
              v22 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_73:
          uint64_t v47 = 52;
          goto LABEL_82;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 2u;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v39 + 1;
              v22 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_77:
          uint64_t v47 = 48;
          goto LABEL_82;
        case 8u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 72) |= 1u;
          break;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_61;
        case 0xAu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_61:
          uint64_t v46 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v43 = *v3;
        unint64_t v44 = *(void *)(a2 + v43);
        if (v44 == -1 || v44 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
        *(void *)(a2 + v43) = v44 + 1;
        v22 |= (unint64_t)(v45 & 0x7F) << v41;
        if ((v45 & 0x80) == 0) {
          goto LABEL_79;
        }
        v41 += 7;
        BOOL v14 = v42++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_81;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_79:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_81:
      uint64_t v47 = 24;
LABEL_82:
      *(_DWORD *)(a1 + v47) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBLightweightClientModelCacheUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 32;
        goto LABEL_26;
      case 2u:
        unsigned int v21 = objc_alloc_init(ATXPBLightweightProactiveSuggestion);
        [(id)a1 addSuggestions:v21];
        if (PBReaderPlaceMark()
          && (ATXPBLightweightProactiveSuggestionReadFrom((uint64_t)v21, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_32:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
LABEL_26:
        uint64_t v22 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_32;
      case 4u:
        *(unsigned char *)(a1 + 40) |= 1u;
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v25 = *(void *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v25 = 0;
        }
        *(void *)(a1 + 8) = v25;
        goto LABEL_32;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_32;
    }
  }
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t ATXPBShortcutsEditorEventMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXMPBBlendingSessionEngagementTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
      }
      else
      {
        if (v17 == 2)
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          while (1)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0) {
              goto LABEL_34;
            }
            v21 += 7;
            BOOL v14 = v22++ >= 9;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_36;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_36:
          *(_DWORD *)(a1 + 24) = v23;
          continue;
        }
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
      }
      uint64_t v20 = *(void **)(a1 + v19);
      *(void *)(a1 + v19) = v18;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBResponseForRequestForSuggestionsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 64;
        goto LABEL_32;
      case 2u:
        uint64_t v19 = objc_alloc_init(ATXPBProactiveSuggestion);
        [(id)a1 addSuggestions:v19];
        if (!PBReaderPlaceMark() || !ATXPBProactiveSuggestionReadFrom((uint64_t)v19, a2)) {
          goto LABEL_50;
        }
        goto LABEL_43;
      case 3u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 24;
        goto LABEL_32;
      case 4u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 72) |= 1u;
        while (2)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              BOOL v14 = v21++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_47;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_47:
        *(_DWORD *)(a1 + 48) = v22;
        goto LABEL_48;
      case 5u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 16;
LABEL_32:
        char v26 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_48;
      case 0xAu:
        uint64_t v19 = objc_alloc_init(ATXPBRequestForInteractionSuggestions);
        objc_storeStrong((id *)(a1 + 40), v19);
        if (!PBReaderPlaceMark()
          || (ATXPBRequestForInteractionSuggestionsReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
          goto LABEL_50;
        }
        goto LABEL_43;
      case 0xBu:
        uint64_t v19 = objc_alloc_init(ATXPBRequestForContextualActionSuggestions);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark()
          || (ATXPBRequestForContextualActionSuggestionsReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
          goto LABEL_50;
        }
        goto LABEL_43;
      case 0xCu:
        uint64_t v19 = objc_alloc_init(ATXPBRequestForIntentSuggestions);
        objc_storeStrong((id *)(a1 + 32), v19);
        if PBReaderPlaceMark() && (ATXPBRequestForIntentSuggestionsReadFrom((uint64_t)v19, a2))
        {
LABEL_43:
          PBReaderRecallMark();

LABEL_48:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_50:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_48;
    }
  }
}

__CFString *stringForATXTrendPlotGranularity(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"None";
  }
  else {
    return off_1E5F01B88[a1 - 1];
  }
}

void sub_1AE6DF190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXMPBBlendingClientModelEngagementUICacheAgeTrackerReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 28) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 16;
      }
      char v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ATXPBBlendingModelUICacheUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 64;
        goto LABEL_23;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 32;
LABEL_23:
        uint64_t v21 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_41;
      case 3u:
        PBReaderReadString();
        unint64_t v22 = (ATXPBHomeScreenCachedSuggestion *)objc_claimAutoreleasedReturnValue();
        if (v22) {
          -[ATXPBBlendingModelUICacheUpdate addClientModelIds:](a1, v22);
        }
        goto LABEL_40;
      case 4u:
        PBReaderReadString();
        unint64_t v22 = (ATXPBHomeScreenCachedSuggestion *)objc_claimAutoreleasedReturnValue();
        if (v22) {
          -[ATXPBBlendingModelUICacheUpdate addClientModelCacheUpdateUUIDStrings:](a1, v22);
        }
        goto LABEL_40;
      case 5u:
        unint64_t v22 = objc_alloc_init(ATXPBHomeScreenCachedSuggestion);
        objc_storeStrong((id *)(a1 + 40), v22);
        if (!PBReaderPlaceMark() || !ATXPBHomeScreenCachedSuggestionReadFrom((uint64_t)v22, a2)) {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 6u:
        unint64_t v22 = objc_alloc_init(ATXPBSuggestionLayout);
        objc_storeStrong((id *)(a1 + 56), v22);
        if (!PBReaderPlaceMark() || (ATXPBSuggestionLayoutReadFrom((uint64_t)v22, a2) & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 7u:
        *(unsigned char *)(a1 + 72) |= 1u;
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v25 = *(void *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v25 = 0;
        }
        *(void *)(a1 + 8) = v25;
        goto LABEL_41;
      case 8u:
        unint64_t v22 = objc_alloc_init(ATXPBSpotlightSuggestionLayout);
        objc_storeStrong((id *)(a1 + 48), v22);
        if PBReaderPlaceMark() && (ATXPBSpotlightSuggestionLayoutReadFrom(v22, a2))
        {
LABEL_39:
          PBReaderRecallMark();
LABEL_40:

LABEL_41:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_46:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_41;
    }
  }
}

uint64_t ATXPBRequestForSuggestionsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 32;
              goto LABEL_27;
            case 2u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 24;
              goto LABEL_27;
            case 3u:
              uint64_t v18 = PBReaderReadString();
              uint64_t v19 = 16;
LABEL_27:
              unint64_t v24 = *(void **)(a1 + v19);
              *(void *)(a1 + v19) = v18;

              goto LABEL_30;
            case 4u:
              *(unsigned char *)(a1 + 40) |= 1u;
              uint64_t v20 = *v3;
              unint64_t v21 = *(void *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
                *(void *)(a2 + v20) = v21 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v22 = 0;
              }
              *(void *)(a1 + 8) = v22;
              goto LABEL_30;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_30:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id ATXInfoSuggestionXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0638EF8];
  uint64_t v1 = (void *)MEMORY[0x1B3E6F520]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_timelineDidReloadForWidget_parentApp_withEntries_completion_ argumentIndex:0 ofReply:0];

  v3 = (void *)MEMORY[0x1B3E6F520]();
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_timelineDidReloadForWidget_parentApp_withEntries_completion_ argumentIndex:2 ofReply:0];

  uint64_t v7 = (void *)MEMORY[0x1B3E6F520]();
  char v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_userDidDismissSuggestion_isDismissalLongTerm_completion_ argumentIndex:0 ofReply:0];

  unsigned int v9 = (void *)MEMORY[0x1B3E6F520]();
  unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v10 forSelector:sel_stackDidRotateProactivelyForInfoSuggestion_isStalenessRotation_ argumentIndex:0 ofReply:0];

  return v0;
}

id ATXCreateProactiveSuggestionClientModelXPCInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F062CE48];
  uint64_t v1 = (void *)MEMORY[0x1B3E6F520]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_opt_class();
  id v4 = objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_clientModelUpdatedSuggestions_feedbackMetadata_clientModelId_completion_ argumentIndex:0 ofReply:0];

  uint64_t v5 = (void *)MEMORY[0x1B3E6F520]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  char v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  [v0 setClasses:v8 forSelector:sel_retrieveSuggestionsForClientModelId_reply_ argumentIndex:0 ofReply:1];

  unsigned int v9 = (void *)MEMORY[0x1B3E6F520]();
  unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v10 forSelector:sel_generateLayoutForRequest_reply_ argumentIndex:0 ofReply:0];

  uint64_t v11 = (void *)MEMORY[0x1B3E6F520]();
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v12 forSelector:sel_generateLayoutForRequest_reply_ argumentIndex:0 ofReply:1];

  unint64_t v13 = (void *)MEMORY[0x1B3E6F520]();
  char v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0, 0);
  [v0 setClasses:v14 forSelector:sel_generateRankedSuggestionsForRequest_limit_reply_ argumentIndex:0 ofReply:0];

  int v15 = (void *)MEMORY[0x1B3E6F520]();
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
  [v0 setClasses:v18 forSelector:sel_generateRankedSuggestionsForRequest_limit_reply_ argumentIndex:0 ofReply:1];

  return v0;
}

uint64_t ATXPBBiomeProactiveSuggestionUIFeedbackResultReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 72;
        goto LABEL_28;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 32;
        goto LABEL_28;
      case 3u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
        goto LABEL_28;
      case 4u:
        a1[88] |= 1u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v30 = 8;
        goto LABEL_47;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 48;
LABEL_28:
        unint64_t v24 = *(void **)&a1[v19];
        *(void *)&a1[v19] = v18;

        goto LABEL_48;
      case 6u:
        a1[88] |= 4u;
        uint64_t v25 = *v3;
        unint64_t v26 = *(void *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v26);
          *(void *)(a2 + v25) = v26 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v30 = 24;
        goto LABEL_47;
      case 7u:
        a1[88] |= 2u;
        uint64_t v27 = *v3;
        unint64_t v28 = *(void *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        uint64_t v30 = 16;
LABEL_47:
        *(void *)&a1[v30] = v23;
        goto LABEL_48;
      case 8u:
        unint64_t v29 = objc_alloc_init(ATXPBLightweightProactiveSuggestion);
        [a1 addShownSuggestions:v29];
        goto LABEL_38;
      case 9u:
        unint64_t v29 = objc_alloc_init(ATXPBLightweightProactiveSuggestion);
        [a1 addEngagedSuggestions:v29];
        goto LABEL_38;
      case 0xAu:
        unint64_t v29 = objc_alloc_init(ATXPBLightweightProactiveSuggestion);
        [a1 addRejectedSuggestions:v29];
LABEL_38:
        if (PBReaderPlaceMark()
          && (ATXPBLightweightProactiveSuggestionReadFrom((uint64_t)v29, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_48:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_48;
    }
  }
}

uint64_t ATXPBClientModelCacheUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 48;
        goto LABEL_27;
      case 2u:
        uint64_t v21 = objc_alloc_init(ATXPBProactiveSuggestion);
        [(id)a1 addSuggestions:v21];
        if (!PBReaderPlaceMark() || !ATXPBProactiveSuggestionReadFrom((uint64_t)v21, a2)) {
          goto LABEL_38;
        }
        goto LABEL_33;
      case 3u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 24;
        goto LABEL_27;
      case 4u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
LABEL_27:
        unint64_t v22 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_36;
      case 5u:
        *(unsigned char *)(a1 + 56) |= 1u;
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v25 = *(void *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v25 = 0;
        }
        *(void *)(a1 + 8) = v25;
        goto LABEL_36;
      case 6u:
        uint64_t v21 = objc_alloc_init(ATXPBResponseForRequestForSuggestions);
        objc_storeStrong((id *)(a1 + 32), v21);
        if (PBReaderPlaceMark()
          && (ATXPBResponseForRequestForSuggestionsReadFrom((uint64_t)v21, a2) & 1) != 0)
        {
LABEL_33:
          PBReaderRecallMark();

LABEL_36:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_38:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_36;
    }
  }
}

uint64_t ATXBucketUInt32BetweenValuesWithRounding()
{
  return MEMORY[0x1F4108F58]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x1F40E9B10]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1F41472F0]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1F41472F8]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1F4147300]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1F4147308]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1F4147310]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1F4147318]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PASIsInternalDevice()
{
  return MEMORY[0x1F4146280]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}