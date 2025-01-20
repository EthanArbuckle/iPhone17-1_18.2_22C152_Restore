uint64_t PREAMResponsesViewedReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(void *)(a2 + v11);
          if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
            break;
          }
          v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          v14 = v9++ >= 9;
          if (v14)
          {
            v10 = 0;
            v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          v10 = 0;
        }
LABEL_14:
        if (!v15 && (v10 & 7) != 4)
        {
          switch((v10 >> 3))
          {
            case 0xBu:
              v17 = PBReaderReadString();
              v18 = 16;
              goto LABEL_33;
            case 0xCu:
              v17 = PBReaderReadString();
              v18 = 40;
              goto LABEL_33;
            case 0xDu:
              v17 = PBReaderReadString();
              v18 = 48;
              goto LABEL_33;
            case 0xEu:
            case 0xFu:
            case 0x10u:
            case 0x11u:
            case 0x12u:
            case 0x13u:
            case 0x14u:
            case 0x16u:
            case 0x17u:
              goto LABEL_28;
            case 0x15u:
              v17 = PBReaderReadString();
              v18 = 24;
LABEL_33:
              v26 = *(void **)(a1 + v18);
              *(void *)(a1 + v18) = v17;

              goto LABEL_61;
            case 0x18u:
              v27 = 0;
              v28 = 0;
              v29 = 0;
              *(unsigned char *)(a1 + 60) |= 4u;
              while (2)
              {
                v30 = *v3;
                v31 = *(void *)(a2 + v30);
                if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
                  *(void *)(a2 + v30) = v31 + 1;
                  v29 |= (unint64_t)(v32 & 0x7F) << v27;
                  if (v32 < 0)
                  {
                    v27 += 7;
                    v14 = v28++ >= 9;
                    if (v14)
                    {
                      v29 = 0;
                      goto LABEL_51;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                v29 = 0;
              }
LABEL_51:
              *(unsigned char *)(a1 + 56) = v29 != 0;
              goto LABEL_61;
            case 0x19u:
              v33 = 0;
              v34 = 0;
              v21 = 0;
              *(unsigned char *)(a1 + 60) |= 1u;
              while (2)
              {
                v35 = *v3;
                v36 = *(void *)(a2 + v35);
                if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
                  *(void *)(a2 + v35) = v36 + 1;
                  v21 |= (unint64_t)(v37 & 0x7F) << v33;
                  if (v37 < 0)
                  {
                    v33 += 7;
                    v14 = v34++ >= 9;
                    if (v14)
                    {
                      LODWORD(v21) = 0;
                      goto LABEL_55;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v21) = 0;
              }
LABEL_55:
              v38 = 8;
              goto LABEL_60;
            default:
              if ((v10 >> 3) == 1)
              {
                v19 = 0;
                v20 = 0;
                v21 = 0;
                *(unsigned char *)(a1 + 60) |= 2u;
                while (1)
                {
                  v22 = *v3;
                  v23 = *(void *)(a2 + v22);
                  if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
                  *(void *)(a2 + v22) = v23 + 1;
                  v21 |= (unint64_t)(v24 & 0x7F) << v19;
                  if ((v24 & 0x80) == 0) {
                    goto LABEL_57;
                  }
                  v19 += 7;
                  v14 = v20++ >= 9;
                  if (v14)
                  {
                    LODWORD(v21) = 0;
                    goto LABEL_59;
                  }
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_57:
                if (*(unsigned char *)(a2 + *v5)) {
                  LODWORD(v21) = 0;
                }
LABEL_59:
                v38 = 32;
LABEL_60:
                *(_DWORD *)(a1 + v38) = v21;
              }
              else
              {
LABEL_28:
                result = PBReaderSkipValueWithTag();
                if (!result) {
                  return result;
                }
              }
LABEL_61:
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

uint64_t PREUMEngagedResponseListReadFrom(uint64_t a1, uint64_t a2)
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
        v17 = objc_alloc_init(PREUMTrialExperiment);
        objc_storeStrong((id *)(a1 + 24), v17);
        if (PBReaderPlaceMark() && PREUMTrialExperimentReadFrom((uint64_t)v17, a2)) {
          goto LABEL_29;
        }
        goto LABEL_77;
      case 2u:
        v17 = objc_alloc_init(PREUMMessageMetadata);
        objc_storeStrong((id *)(a1 + 48), v17);
        if (!PBReaderPlaceMark() || (PREUMMessageMetadataReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_77;
        }
        goto LABEL_29;
      case 3u:
        v17 = objc_alloc_init(PREUMResponseItem);
        [(id)a1 addItems:v17];
        if PBReaderPlaceMark() && (PREUMResponseItemReadFrom((uint64_t)v17, a2))
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_75:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_77:

        return 0;
      case 4u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 56) |= 2u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_61:
        uint64_t v41 = 16;
        goto LABEL_74;
      case 5u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
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
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                uint64_t v27 = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v27 = 0;
        }
LABEL_65:
        *(void *)(a1 + 8) = v27;
        goto LABEL_75;
      case 6u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 56) |= 8u;
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
            v21 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_69:
        uint64_t v41 = 36;
        goto LABEL_74;
      case 7u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 56) |= 4u;
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
            v21 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              BOOL v14 = v37++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_73:
        uint64_t v41 = 32;
LABEL_74:
        *(_DWORD *)(a1 + v41) = v21;
        goto LABEL_75;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_75;
    }
  }
}

uint64_t PREAMEngagedResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 8u;
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
              goto LABEL_127;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_129;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_127:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_129:
          uint64_t v96 = 64;
          goto LABEL_170;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x200u;
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
              v19 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                BOOL v14 = v24++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_133:
          uint64_t v96 = 88;
          goto LABEL_170;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x100u;
          while (2)
          {
            uint64_t v30 = *v3;
            unint64_t v31 = *(void *)(a2 + v30);
            if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
              *(void *)(a2 + v30) = v31 + 1;
              v19 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                BOOL v14 = v29++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_137:
          uint64_t v96 = 84;
          goto LABEL_170;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x80u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v19 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v14 = v34++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_141;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_141:
          uint64_t v96 = 80;
          goto LABEL_170;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 4u;
          while (2)
          {
            uint64_t v40 = *v3;
            unint64_t v41 = *(void *)(a2 + v40);
            if (v41 == -1 || v41 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
              *(void *)(a2 + v40) = v41 + 1;
              v19 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_145;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_145:
          uint64_t v96 = 40;
          goto LABEL_170;
        case 6u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 2u;
          while (2)
          {
            uint64_t v45 = *v3;
            unint64_t v46 = *(void *)(a2 + v45);
            if (v46 == -1 || v46 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
              *(void *)(a2 + v45) = v46 + 1;
              v19 |= (unint64_t)(v47 & 0x7F) << v43;
              if (v47 < 0)
              {
                v43 += 7;
                BOOL v14 = v44++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_149;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_149:
          uint64_t v96 = 24;
          goto LABEL_170;
        case 7u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x20u;
          while (2)
          {
            uint64_t v50 = *v3;
            unint64_t v51 = *(void *)(a2 + v50);
            if (v51 == -1 || v51 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
              *(void *)(a2 + v50) = v51 + 1;
              v19 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                BOOL v14 = v49++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_153;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_153:
          uint64_t v96 = 72;
          goto LABEL_170;
        case 8u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x10u;
          while (2)
          {
            uint64_t v55 = *v3;
            unint64_t v56 = *(void *)(a2 + v55);
            if (v56 == -1 || v56 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
              *(void *)(a2 + v55) = v56 + 1;
              v19 |= (unint64_t)(v57 & 0x7F) << v53;
              if (v57 < 0)
              {
                v53 += 7;
                BOOL v14 = v54++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_157;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_157:
          uint64_t v96 = 68;
          goto LABEL_170;
        case 9u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 0x40u;
          while (2)
          {
            uint64_t v60 = *v3;
            unint64_t v61 = *(void *)(a2 + v60);
            if (v61 == -1 || v61 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v62 = *(unsigned char *)(*(void *)(a2 + *v7) + v61);
              *(void *)(a2 + v60) = v61 + 1;
              v19 |= (unint64_t)(v62 & 0x7F) << v58;
              if (v62 < 0)
              {
                v58 += 7;
                BOOL v14 = v59++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_161:
          uint64_t v96 = 76;
          goto LABEL_170;
        case 0xBu:
          uint64_t v64 = PBReaderReadString();
          uint64_t v65 = 16;
          goto LABEL_90;
        case 0xCu:
          uint64_t v64 = PBReaderReadString();
          uint64_t v65 = 96;
          goto LABEL_90;
        case 0xDu:
          uint64_t v64 = PBReaderReadString();
          uint64_t v65 = 104;
          goto LABEL_90;
        case 0x15u:
          uint64_t v64 = PBReaderReadString();
          uint64_t v65 = 32;
          goto LABEL_90;
        case 0x16u:
          uint64_t v64 = PBReaderReadString();
          uint64_t v65 = 56;
          goto LABEL_90;
        case 0x17u:
          uint64_t v64 = PBReaderReadString();
          uint64_t v65 = 48;
LABEL_90:
          v66 = *(void **)(a1 + v65);
          *(void *)(a1 + v65) = v64;

          continue;
        case 0x18u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v69 = 0;
          *(_WORD *)(a1 + 116) |= 0x800u;
          while (2)
          {
            uint64_t v70 = *v3;
            unint64_t v71 = *(void *)(a2 + v70);
            if (v71 == -1 || v71 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v72 = *(unsigned char *)(*(void *)(a2 + *v7) + v71);
              *(void *)(a2 + v70) = v71 + 1;
              v69 |= (unint64_t)(v72 & 0x7F) << v67;
              if (v72 < 0)
              {
                v67 += 7;
                BOOL v14 = v68++ >= 9;
                if (v14)
                {
                  uint64_t v69 = 0;
                  goto LABEL_165;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v69 = 0;
          }
LABEL_165:
          BOOL v97 = v69 != 0;
          uint64_t v98 = 113;
          goto LABEL_183;
        case 0x19u:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 116) |= 1u;
          while (2)
          {
            uint64_t v75 = *v3;
            unint64_t v76 = *(void *)(a2 + v75);
            if (v76 == -1 || v76 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v77 = *(unsigned char *)(*(void *)(a2 + *v7) + v76);
              *(void *)(a2 + v75) = v76 + 1;
              v19 |= (unint64_t)(v77 & 0x7F) << v73;
              if (v77 < 0)
              {
                v73 += 7;
                BOOL v14 = v74++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_169;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_169:
          uint64_t v96 = 8;
LABEL_170:
          *(_DWORD *)(a1 + v96) = v19;
          continue;
        case 0x1Au:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v80 = 0;
          *(_WORD *)(a1 + 116) |= 0x400u;
          while (2)
          {
            uint64_t v81 = *v3;
            unint64_t v82 = *(void *)(a2 + v81);
            if (v82 == -1 || v82 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v82);
              *(void *)(a2 + v81) = v82 + 1;
              v80 |= (unint64_t)(v83 & 0x7F) << v78;
              if (v83 < 0)
              {
                v78 += 7;
                BOOL v14 = v79++ >= 9;
                if (v14)
                {
                  uint64_t v80 = 0;
                  goto LABEL_174;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v80 = 0;
          }
LABEL_174:
          BOOL v97 = v80 != 0;
          uint64_t v98 = 112;
          goto LABEL_183;
        case 0x1Bu:
          char v84 = 0;
          unsigned int v85 = 0;
          uint64_t v86 = 0;
          *(_WORD *)(a1 + 116) |= 0x1000u;
          while (2)
          {
            uint64_t v87 = *v3;
            unint64_t v88 = *(void *)(a2 + v87);
            if (v88 == -1 || v88 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v89 = *(unsigned char *)(*(void *)(a2 + *v7) + v88);
              *(void *)(a2 + v87) = v88 + 1;
              v86 |= (unint64_t)(v89 & 0x7F) << v84;
              if (v89 < 0)
              {
                v84 += 7;
                BOOL v14 = v85++ >= 9;
                if (v14)
                {
                  uint64_t v86 = 0;
                  goto LABEL_178;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v86 = 0;
          }
LABEL_178:
          BOOL v97 = v86 != 0;
          uint64_t v98 = 114;
          goto LABEL_183;
        case 0x1Cu:
          char v90 = 0;
          unsigned int v91 = 0;
          uint64_t v92 = 0;
          *(_WORD *)(a1 + 116) |= 0x2000u;
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
        uint64_t v93 = *v3;
        unint64_t v94 = *(void *)(a2 + v93);
        if (v94 == -1 || v94 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v95 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
        *(void *)(a2 + v93) = v94 + 1;
        v92 |= (unint64_t)(v95 & 0x7F) << v90;
        if ((v95 & 0x80) == 0) {
          goto LABEL_180;
        }
        v90 += 7;
        BOOL v14 = v91++ >= 9;
        if (v14)
        {
          uint64_t v92 = 0;
          goto LABEL_182;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_180:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v92 = 0;
      }
LABEL_182:
      BOOL v97 = v92 != 0;
      uint64_t v98 = 115;
LABEL_183:
      *(unsigned char *)(a1 + v98) = v97;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id pre_xpc_handle()
{
  if (pre_xpc_handle__pasOnceToken0 != -1) {
    dispatch_once(&pre_xpc_handle__pasOnceToken0, &__block_literal_global_388);
  }
  v0 = (void *)pre_xpc_handle__pasExprOnceResult;

  return v0;
}

void __pre_xpc_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.experiments", "XPCClient");
  v2 = (void *)pre_xpc_handle__pasExprOnceResult;
  pre_xpc_handle__pasExprOnceResult = (uint64_t)v1;
}

id pre_responses_handle()
{
  if (pre_responses_handle__pasOnceToken1 != -1) {
    dispatch_once(&pre_responses_handle__pasOnceToken1, &__block_literal_global_4);
  }
  v0 = (void *)pre_responses_handle__pasExprOnceResult;

  return v0;
}

void __pre_responses_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.experiments", "Responses");
  v2 = (void *)pre_responses_handle__pasExprOnceResult;
  pre_responses_handle__pasExprOnceResult = (uint64_t)v1;
}

id pre_locale_handle()
{
  if (pre_locale_handle__pasOnceToken2 != -1) {
    dispatch_once(&pre_locale_handle__pasOnceToken2, &__block_literal_global_7);
  }
  v0 = (void *)pre_locale_handle__pasExprOnceResult;

  return v0;
}

void __pre_locale_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.experiments", "Locale");
  v2 = (void *)pre_locale_handle__pasExprOnceResult;
  pre_locale_handle__pasExprOnceResult = (uint64_t)v1;
}

id pre_scales_handle()
{
  if (pre_scales_handle__pasOnceToken3 != -1) {
    dispatch_once(&pre_scales_handle__pasOnceToken3, &__block_literal_global_10);
  }
  v0 = (void *)pre_scales_handle__pasExprOnceResult;

  return v0;
}

void __pre_scales_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.experiments", "Scales");
  v2 = (void *)pre_scales_handle__pasExprOnceResult;
  pre_scales_handle__pasExprOnceResult = (uint64_t)v1;
}

id pre_signpost_handle()
{
  if (pre_signpost_handle__pasOnceToken4 != -1) {
    dispatch_once(&pre_signpost_handle__pasOnceToken4, &__block_literal_global_13);
  }
  v0 = (void *)pre_signpost_handle__pasExprOnceResult;

  return v0;
}

void __pre_signpost_handle_block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  os_log_t v1 = os_log_create("com.apple.private.proactive.experiments", "Signposts");
  v2 = (void *)pre_signpost_handle__pasExprOnceResult;
  pre_signpost_handle__pasExprOnceResult = (uint64_t)v1;
}

uint64_t PREUMMessageMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v18 = 16;
          goto LABEL_22;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_22;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
LABEL_22:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 44) |= 8u;
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
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_56:
          BOOL v44 = v22 != 0;
          uint64_t v45 = 41;
          goto LABEL_70;
        case 6u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 44) |= 2u;
          while (2)
          {
            uint64_t v30 = *v3;
            unint64_t v31 = *(void *)(a2 + v30);
            if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
              *(void *)(a2 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v14 = v28++ >= 9;
                if (v14)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v29) = 0;
          }
LABEL_60:
          uint64_t v46 = 12;
          goto LABEL_65;
        case 7u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v29 = 0;
          *(unsigned char *)(a1 + 44) |= 1u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v29 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v14 = v34++ >= 9;
                if (v14)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v29) = 0;
          }
LABEL_64:
          uint64_t v46 = 8;
LABEL_65:
          *(_DWORD *)(a1 + v46) = v29;
          continue;
        case 8u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 44) |= 4u;
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
        uint64_t v41 = *v3;
        unint64_t v42 = *(void *)(a2 + v41);
        if (v42 == -1 || v42 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
        *(void *)(a2 + v41) = v42 + 1;
        v40 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_67;
        }
        v38 += 7;
        BOOL v14 = v39++ >= 9;
        if (v14)
        {
          uint64_t v40 = 0;
          goto LABEL_69;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_67:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v40 = 0;
      }
LABEL_69:
      BOOL v44 = v40 != 0;
      uint64_t v45 = 40;
LABEL_70:
      *(unsigned char *)(a1 + v45) = v44;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CA62D700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKEntityClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __ChatKitLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65B19B0;
    uint64_t v8 = 0;
    ChatKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ChatKitLibraryCore_frameworkLibrary)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *ChatKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PREResponsesExperimentSuggestionsRequest.m", 15, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CKEntity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"Class getCKEntityClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PREResponsesExperimentSuggestionsRequest.m", 16, @"Unable to find class %s", "CKEntity");

LABEL_10:
    __break(1u);
  }
  getCKEntityClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ChatKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t PREUMResponseListReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  long long v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v17 = objc_alloc_init(PREUMTrialExperiment);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (PBReaderPlaceMark() && PREUMTrialExperimentReadFrom((uint64_t)v17, a2)) {
          goto LABEL_29;
        }
        goto LABEL_65;
      case 2u:
        uint64_t v17 = objc_alloc_init(PREUMMessageMetadata);
        objc_storeStrong((id *)(a1 + 40), v17);
        if (!PBReaderPlaceMark() || (PREUMMessageMetadataReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_65;
        }
        goto LABEL_29;
      case 3u:
        uint64_t v17 = objc_alloc_init(PREUMResponseItem);
        [(id)a1 addItems:v17];
        if PBReaderPlaceMark() && (PREUMResponseItemReadFrom((uint64_t)v17, a2))
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_63:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_65:

        return 0;
      case 4u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 52) |= 4u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                uint64_t v21 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_54:
        *(unsigned char *)(a1 + 48) = v21 != 0;
        goto LABEL_63;
      case 5u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
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
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                uint64_t v27 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v27 = 0;
        }
LABEL_58:
        *(void *)(a1 + 8) = v27;
        goto LABEL_63;
      case 6u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        *(unsigned char *)(a1 + 52) |= 2u;
        while (2)
        {
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v14 = v32++ >= 9;
              if (v14)
              {
                LODWORD(v33) = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v33) = 0;
        }
LABEL_62:
        *(_DWORD *)(a1 + 24) = v33;
        goto LABEL_63;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_63;
    }
  }
}

uint64_t PREAMResponseListGeneratedReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
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
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 92) |= 0x40u;
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
              goto LABEL_78;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_80;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_78:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_80:
          BOOL v59 = v19 != 0;
          uint64_t v60 = 89;
          goto LABEL_101;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          *(unsigned char *)(a1 + 92) |= 2u;
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
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                BOOL v14 = v24++ >= 9;
                if (v14)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_84:
          uint64_t v61 = 24;
          goto LABEL_106;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v25 = 0;
          *(unsigned char *)(a1 + 92) |= 8u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v25 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_88:
          uint64_t v61 = 60;
          goto LABEL_106;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v25 = 0;
          *(unsigned char *)(a1 + 92) |= 4u;
          while (2)
          {
            uint64_t v36 = *v3;
            unint64_t v37 = *(void *)(a2 + v36);
            if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v37 + 1;
              v25 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                BOOL v14 = v35++ >= 9;
                if (v14)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_92:
          uint64_t v61 = 56;
          goto LABEL_106;
        case 5u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v25 = 0;
          *(unsigned char *)(a1 + 92) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            unint64_t v42 = *(void *)(a2 + v41);
            if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
              *(void *)(a2 + v41) = v42 + 1;
              v25 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                BOOL v14 = v40++ >= 9;
                if (v14)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_96:
          uint64_t v61 = 64;
          goto LABEL_106;
        case 0xBu:
          uint64_t v45 = PBReaderReadString();
          uint64_t v46 = 16;
          goto LABEL_62;
        case 0xCu:
          uint64_t v45 = PBReaderReadString();
          uint64_t v46 = 72;
          goto LABEL_62;
        case 0xDu:
          uint64_t v45 = PBReaderReadString();
          uint64_t v46 = 80;
          goto LABEL_62;
        case 0x15u:
          uint64_t v45 = PBReaderReadString();
          uint64_t v46 = 32;
          goto LABEL_62;
        case 0x16u:
          uint64_t v45 = PBReaderReadString();
          uint64_t v46 = 48;
          goto LABEL_62;
        case 0x17u:
          uint64_t v45 = PBReaderReadString();
          uint64_t v46 = 40;
LABEL_62:
          char v47 = *(void **)(a1 + v46);
          *(void *)(a1 + v46) = v45;

          continue;
        case 0x18u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          *(unsigned char *)(a1 + 92) |= 0x20u;
          while (2)
          {
            uint64_t v51 = *v3;
            unint64_t v52 = *(void *)(a2 + v51);
            if (v52 == -1 || v52 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
              *(void *)(a2 + v51) = v52 + 1;
              v50 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                BOOL v14 = v49++ >= 9;
                if (v14)
                {
                  uint64_t v50 = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v50 = 0;
          }
LABEL_100:
          BOOL v59 = v50 != 0;
          uint64_t v60 = 88;
LABEL_101:
          *(unsigned char *)(a1 + v60) = v59;
          continue;
        case 0x19u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v25 = 0;
          *(unsigned char *)(a1 + 92) |= 1u;
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
        uint64_t v56 = *v3;
        unint64_t v57 = *(void *)(a2 + v56);
        if (v57 == -1 || v57 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
        *(void *)(a2 + v56) = v57 + 1;
        v25 |= (unint64_t)(v58 & 0x7F) << v54;
        if ((v58 & 0x80) == 0) {
          goto LABEL_103;
        }
        v54 += 7;
        BOOL v14 = v55++ >= 9;
        if (v14)
        {
          LODWORD(v25) = 0;
          goto LABEL_105;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_103:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v25) = 0;
      }
LABEL_105:
      uint64_t v61 = 8;
LABEL_106:
      *(_DWORD *)(a1 + v61) = v25;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL PREUMTrialExperimentReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    long long v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 8;
LABEL_24:
        uint64_t v20 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

unint64_t PREMachTimeToNanoseconds(uint64_t a1)
{
  if (PREMachTimeToNanoseconds_onceToken != -1) {
    dispatch_once(&PREMachTimeToNanoseconds_onceToken, &__block_literal_global_1028);
  }
  return (unint64_t)PREMachTimeToNanoseconds_machTimebaseInfo
       * a1
       / *(unsigned int *)algn_1EC05F1BC;
}

uint64_t __PREMachTimeToNanoseconds_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&PREMachTimeToNanoseconds_machTimebaseInfo);
}

unint64_t PREMachTimeToMilliseconds(uint64_t a1)
{
  if (PREMachTimeToNanoseconds_onceToken != -1) {
    dispatch_once(&PREMachTimeToNanoseconds_onceToken, &__block_literal_global_1028);
  }
  return (unint64_t)PREMachTimeToNanoseconds_machTimebaseInfo
       * a1
       / *(unsigned int *)algn_1EC05F1BC
       / 0xF4240;
}

unint64_t PRERecordMeasurementState(uint64_t *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v1 = a1[2];
  if (!v1)
  {
    uint64_t v3 = mach_absolute_time();
    unint64_t v1 = PREMachTimeToMilliseconds(v3 - a1[1]);
    v4 = pre_scales_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *a1;
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2048;
      unint64_t v10 = v1;
      _os_log_impl(&dword_1CA622000, v4, OS_LOG_TYPE_DEFAULT, "PREScales: %@ took %llu milliseconds", (uint8_t *)&v7, 0x16u);
    }

    a1[2] = v1;
  }
  return v1;
}

void sub_1CA6338A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CA634C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CA635474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 128), 8);
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

void sub_1CA635A4C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1CA635B54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PREAMResponseItemReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 84) |= 2u;
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
              goto LABEL_85;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_87;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_85:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_87:
          uint64_t v65 = 48;
          goto LABEL_108;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 84) |= 0x10u;
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
              v19 |= (unint64_t)(v27 & 0x7F) << v23;
              if (v27 < 0)
              {
                v23 += 7;
                BOOL v14 = v24++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_91:
          uint64_t v65 = 60;
          goto LABEL_108;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 84) |= 8u;
          while (2)
          {
            uint64_t v30 = *v3;
            unint64_t v31 = *(void *)(a2 + v30);
            if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
              *(void *)(a2 + v30) = v31 + 1;
              v19 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                BOOL v14 = v29++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_95:
          uint64_t v65 = 56;
          goto LABEL_108;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 84) |= 4u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v19 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v14 = v34++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_99:
          uint64_t v65 = 52;
          goto LABEL_108;
        case 0xBu:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 16;
          goto LABEL_55;
        case 0xCu:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 64;
          goto LABEL_55;
        case 0xDu:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 72;
          goto LABEL_55;
        case 0x15u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 24;
          goto LABEL_55;
        case 0x16u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 40;
          goto LABEL_55;
        case 0x17u:
          uint64_t v39 = PBReaderReadString();
          uint64_t v40 = 32;
LABEL_55:
          uint64_t v41 = *(void **)(a1 + v40);
          *(void *)(a1 + v40) = v39;

          continue;
        case 0x18u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          *(unsigned char *)(a1 + 84) |= 0x20u;
          while (2)
          {
            uint64_t v45 = *v3;
            unint64_t v46 = *(void *)(a2 + v45);
            if (v46 == -1 || v46 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
              *(void *)(a2 + v45) = v46 + 1;
              v44 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v14 = v43++ >= 9;
                if (v14)
                {
                  uint64_t v44 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v44 = 0;
          }
LABEL_103:
          BOOL v66 = v44 != 0;
          uint64_t v67 = 80;
          goto LABEL_117;
        case 0x19u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 84) |= 1u;
          while (2)
          {
            uint64_t v50 = *v3;
            unint64_t v51 = *(void *)(a2 + v50);
            if (v51 == -1 || v51 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
              *(void *)(a2 + v50) = v51 + 1;
              v19 |= (unint64_t)(v52 & 0x7F) << v48;
              if (v52 < 0)
              {
                v48 += 7;
                BOOL v14 = v49++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_107:
          uint64_t v65 = 8;
LABEL_108:
          *(_DWORD *)(a1 + v65) = v19;
          continue;
        case 0x1Au:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v55 = 0;
          *(unsigned char *)(a1 + 84) |= 0x40u;
          while (2)
          {
            uint64_t v56 = *v3;
            unint64_t v57 = *(void *)(a2 + v56);
            if (v57 == -1 || v57 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
              *(void *)(a2 + v56) = v57 + 1;
              v55 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                BOOL v14 = v54++ >= 9;
                if (v14)
                {
                  uint64_t v55 = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v55 = 0;
          }
LABEL_112:
          BOOL v66 = v55 != 0;
          uint64_t v67 = 81;
          goto LABEL_117;
        case 0x1Bu:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v61 = 0;
          *(unsigned char *)(a1 + 84) |= 0x80u;
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
        uint64_t v62 = *v3;
        unint64_t v63 = *(void *)(a2 + v62);
        if (v63 == -1 || v63 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
        *(void *)(a2 + v62) = v63 + 1;
        v61 |= (unint64_t)(v64 & 0x7F) << v59;
        if ((v64 & 0x80) == 0) {
          goto LABEL_114;
        }
        v59 += 7;
        BOOL v14 = v60++ >= 9;
        if (v14)
        {
          uint64_t v61 = 0;
          goto LABEL_116;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_114:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v61 = 0;
      }
LABEL_116:
      BOOL v66 = v61 != 0;
      uint64_t v67 = 82;
LABEL_117:
      *(unsigned char *)(a1 + v67) = v66;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PREUMResponseItemReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int v7 = (int *)MEMORY[0x1E4F940B8];
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
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 1u;
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
              goto LABEL_57;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_59;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_57:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_59:
          uint64_t v46 = 8;
          goto LABEL_68;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 4u;
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
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_63:
          uint64_t v46 = 16;
          goto LABEL_68;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          while (2)
          {
            uint64_t v31 = *v3;
            unint64_t v32 = *(void *)(a2 + v31);
            if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
              *(void *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                BOOL v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_67:
          uint64_t v46 = 12;
LABEL_68:
          *(_DWORD *)(a1 + v46) = v19;
          continue;
        case 4u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          *(unsigned char *)(a1 + 24) |= 8u;
          while (2)
          {
            uint64_t v37 = *v3;
            unint64_t v38 = *(void *)(a2 + v37);
            if (v38 == -1 || v38 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
              *(void *)(a2 + v37) = v38 + 1;
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v14 = v35++ >= 9;
                if (v14)
                {
                  uint64_t v36 = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v36 = 0;
          }
LABEL_72:
          BOOL v47 = v36 != 0;
          uint64_t v48 = 20;
          goto LABEL_77;
        case 5u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          *(unsigned char *)(a1 + 24) |= 0x10u;
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
        uint64_t v43 = *v3;
        unint64_t v44 = *(void *)(a2 + v43);
        if (v44 == -1 || v44 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
        *(void *)(a2 + v43) = v44 + 1;
        v42 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0) {
          goto LABEL_74;
        }
        v40 += 7;
        BOOL v14 = v41++ >= 9;
        if (v14)
        {
          uint64_t v42 = 0;
          goto LABEL_76;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_74:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v42 = 0;
      }
LABEL_76:
      BOOL v47 = v42 != 0;
      uint64_t v48 = 21;
LABEL_77:
      *(unsigned char *)(a1 + v48) = v47;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1CA639884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCKEntityClass_block_invoke_1903(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!ChatKitLibraryCore_frameworkLibrary_1904)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __ChatKitLibraryCore_block_invoke_1905;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65B1FB8;
    uint64_t v8 = 0;
    ChatKitLibraryCore_frameworkLibrary_1904 = _sl_dlopen();
  }
  if (!ChatKitLibraryCore_frameworkLibrary_1904)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *ChatKitLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PREResponsesExperiment.m", 44, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CKEntity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getCKEntityClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PREResponsesExperiment.m", 45, @"Unable to find class %s", "CKEntity");

LABEL_10:
    __break(1u);
  }
  getCKEntityClass_softClass_1902 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ChatKitLibraryCore_block_invoke_1905()
{
  uint64_t result = _sl_dlopen();
  ChatKitLibraryCore_frameworkLibrary_1904 = result;
  return result;
}

void sub_1CA639CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1910(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1911(uint64_t a1)
{
}

void sub_1CA63A420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CA63AB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v36 - 232), 8);
  _Block_object_dispose((const void *)(v36 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CA63B5C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1CA63BC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1CA63C288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 200), 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CA63CF18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 208));
  _Block_object_dispose((const void *)(v2 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CA63DB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  PRERecordMeasurementState((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1CA63DFCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1CA63F4DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1CA640570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CA64127C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getWRCannedRepliesStoreClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!WatchRepliesLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __WatchRepliesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E65B1FD0;
    uint64_t v8 = 0;
    WatchRepliesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!WatchRepliesLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *WatchRepliesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PREResponsesExperiment.m", 52, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("WRCannedRepliesStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getWRCannedRepliesStoreClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PREResponsesExperiment.m", 53, @"Unable to find class %s", "WRCannedRepliesStore");

LABEL_10:
    __break(1u);
  }
  getWRCannedRepliesStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __WatchRepliesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WatchRepliesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

void objc_terminate(void)
{
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}