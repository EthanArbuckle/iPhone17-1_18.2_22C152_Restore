BOOL PeoplePredictionDataTrialIdentifierReadFrom(uint64_t a1, uint64_t a2)
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
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
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
        if (v9++ >= 9)
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
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        v18 = PBReaderReadString();
        v19 = 24;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        v18 = PBReaderReadString();
        v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
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
    v18 = PBReaderReadString();
    v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PeoplePredictionDataFeatureReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
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
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 8u;
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
            goto LABEL_60;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_62;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_62:
        uint64_t v45 = 20;
        goto LABEL_79;
      case 2u:
        v24 = objc_alloc_init(PeoplePredictionDataFeatureValue);
        objc_storeStrong((id *)(a1 + 24), v24);
        if PBReaderPlaceMark() && (PeoplePredictionDataFeatureValueReadFrom((uint64_t)v24, a2))
        {
          PBReaderRecallMark();

LABEL_80:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 4u;
        while (2)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              BOOL v14 = v26++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_66;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_66:
        uint64_t v45 = 16;
        goto LABEL_79;
      case 4u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        while (2)
        {
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v14 = v31++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_70:
        uint64_t v45 = 12;
        goto LABEL_79;
      case 5u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
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
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              BOOL v14 = v36++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_74:
        uint64_t v45 = 8;
        goto LABEL_79;
      case 6u:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 36) |= 0x10u;
        while (2)
        {
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 1;
            v19 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              BOOL v14 = v41++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_78:
        uint64_t v45 = 32;
LABEL_79:
        *(_DWORD *)(a1 + v45) = v19;
        goto LABEL_80;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_80;
    }
  }
}

uint64_t PeoplePredictionDataMLSEShareEventReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x263F62268];
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
        unsigned int v18 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v17;

        goto LABEL_42;
      case 2u:
        uint64_t v20 = objc_alloc_init(PeoplePredictionDataMLSEVirtualFeatureStore);
        [(id)a1 addFeaturizedCandidate:v20];
        if (!PBReaderPlaceMark()
          || (PeoplePredictionDataMLSEVirtualFeatureStoreReadFrom((uint64_t)v20, a2) & 1) == 0)
        {
          goto LABEL_44;
        }
        goto LABEL_37;
      case 3u:
        uint64_t v20 = objc_alloc_init(PeoplePredictionDataTrialIdentifier);
        objc_storeStrong((id *)(a1 + 40), v20);
        if (!PBReaderPlaceMark() || !PeoplePredictionDataTrialIdentifierReadFrom((uint64_t)v20, a2)) {
          goto LABEL_44;
        }
        goto LABEL_37;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                LODWORD(v23) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 8) = v23;
        goto LABEL_42;
      case 5u:
        uint64_t v20 = objc_alloc_init(PeoplePredictionDataFeaturizationConfig);
        objc_storeStrong((id *)(a1 + 16), v20);
        if (PBReaderPlaceMark()
          && (PeoplePredictionDataFeaturizationConfigReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_44:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_42;
    }
  }
}

uint64_t PeoplePredictionDataFeatureValueReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
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
          *(unsigned char *)(a1 + 40) |= 2u;
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
              goto LABEL_47;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_49;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_49:
          uint64_t v44 = 16;
          goto LABEL_58;
        case 2u:
          *(unsigned char *)(a1 + 40) |= 1u;
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
          continue;
        case 3u:
          uint64_t v29 = PBReaderReadString();
          char v30 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v29;

          continue;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          *(unsigned char *)(a1 + 40) |= 8u;
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
              v33 |= (unint64_t)(v37 & 0x7F) << v31;
              if (v37 < 0)
              {
                v31 += 7;
                BOOL v15 = v32++ >= 9;
                if (v15)
                {
                  uint64_t v33 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v33 = 0;
          }
LABEL_53:
          *(unsigned char *)(a1 + 36) = v33 != 0;
          continue;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
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
        uint64_t v40 = *v3;
        uint64_t v41 = *(void *)(a2 + v40);
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v42;
        v20 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_55;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_57;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_55:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v20) = 0;
      }
LABEL_57:
      uint64_t v44 = 32;
LABEL_58:
      *(_DWORD *)(a1 + v44) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PeoplePredictionDataMLSEVirtualFeatureStoreReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        uint64_t v24 = PBReaderReadString();
        unint64_t v25 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v24;
      }
      else if (v17 == 3)
      {
        uint64_t v26 = objc_alloc_init(PeoplePredictionDataFeature);
        [(id)a1 addFeatureVector:v26];
        if (!PBReaderPlaceMark() || (PeoplePredictionDataFeatureReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if (v17 == 2)
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
            goto LABEL_35;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_37:
        *(_DWORD *)(a1 + 24) = v20;
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

uint64_t PeoplePredictionDataFeaturizationConfigReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = PBReaderReadString();
        char v18 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v17;
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

void type metadata accessor for BMMLSEDurableFeatureStorefeatureName(uint64_t a1)
{
}

#error "258E62F68: too big function (funcsize=0)"

uint64_t sub_258E73F94()
{
  return 1;
}

uint64_t sub_258E73FA0(void *a1)
{
  id v1 = objc_msgSend(a1, sel_recipients);
  if (v1)
  {
    v2 = v1;
    sub_258E7451C(0, &qword_26A0D0248);
    sub_258EA8D40();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0228);
  sub_258E74440();
  sub_258EA8F30();
  swift_bridgeObjectRelease();
  return sub_258EA91D0();
}

uint64_t sub_258E7406C()
{
  return sub_258E821D4();
}

BOOL sub_258E74090(void *a1)
{
  return objc_msgSend(a1, sel_mechanism) == (id)2
      || objc_msgSend(a1, sel_mechanism) == (id)3
      || objc_msgSend(a1, sel_mechanism) == (id)4;
}

BOOL sub_258E740F4(void *a1)
{
  return objc_msgSend(a1, sel_mechanism) == (id)13;
}

uint64_t sub_258E7411C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_targetBundleId);
  if (!v1) {
    return 0;
  }
  v2 = v1;
  uint64_t v3 = sub_258EA8C50();

  return v3;
}

void sub_258E74180()
{
  qword_26A0D0788 = (uint64_t)&unk_2706EC660;
}

void *sub_258E74194@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_258E741A4(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_258E741B8(void *a1@<X8>)
{
  *a1 = *v1;
}

_DWORD *sub_258E741C4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_258E741D4(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_258E741E0()
{
  unint64_t result = qword_26A0D0208;
  if (!qword_26A0D0208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0208);
  }
  return result;
}

uint64_t sub_258E74234()
{
  sub_258E74288(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80));
  return MEMORY[0x270FA0238](v0, 96, 7);
}

void sub_258E74288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  switch(a9 >> 61)
  {
    case 0uLL:
      sub_258E743A8(a3);

      break;
    case 1uLL:
      MEMORY[0x270F9A790]();
      break;
    case 2uLL:
    case 4uLL:
      swift_release();
      swift_release();
      break;
    case 3uLL:
      sub_258E743A8(a3);
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_258E743A8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_258E743FC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_258E7451C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_258E74440()
{
  unint64_t result = qword_26A0D0230;
  if (!qword_26A0D0230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A0D0238);
    sub_258E743FC((unint64_t *)&qword_26A0D0240, &qword_26A0D0248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0230);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_258E7451C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for BMMLSEVirtualFeatureStoreFeaturefeatureName(uint64_t a1)
{
}

void type metadata accessor for _CDInteractionDirection(uint64_t a1)
{
}

void type metadata accessor for _CDInteractionMechanism(uint64_t a1)
{
}

void type metadata accessor for BMMLSELabeledDataStoreLabelingEvidenceType(uint64_t a1)
{
}

void sub_258E745A8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t ShadowEvaluationManager.init(config:executionManager:trialIdentifier:)@<X0>(void *__src@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  memcpy(a4, __src, 0x158uLL);
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  sub_258E7D330(a2, (uint64_t)(a4 + 43));
  if (v8)
  {
    id v9 = objc_allocWithZone((Class)sub_258EA8B10());
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_258EA8B00();
    sub_258E746EC(v7, v8);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm(a2);
  }
  else
  {
    uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm(a2);
    uint64_t v10 = 0;
  }
  a4[48] = v10;
  return result;
}

uint64_t sub_258E746EC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::OpaquePointer_optional __swiftcall ShadowEvaluationManager.attemptShadowEvaluation()()
{
  uint64_t v1 = v0;
  if (qword_26A0D01F0 != -1) {
LABEL_55:
  }
    swift_once();
  uint64_t v2 = sub_258EA8BB0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A0D0790);
  uint64_t v3 = sub_258EA8B90();
  os_log_type_t v4 = sub_258EA8E80();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_258E57000, v3, v4, "Starting shadowEvaluation", v5, 2u);
    MEMORY[0x25A2D36B0](v5, -1, -1);
  }

  if (!MEMORY[0x263F5D370])
  {
    uint64_t v26 = sub_258EA8B90();
    os_log_type_t v27 = sub_258EA8E90();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_258E57000, v26, v27, "Scoring model class not available, shadow evaluation won't run", v28, 2u);
      MEMORY[0x25A2D36B0](v28, -1, -1);
    }

    char v30 = (void *)sub_258E75390(MEMORY[0x263F8EE78]);
    goto LABEL_52;
  }
  uint64_t v6 = sub_258EA8950();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258EA8900();
  id v10 = objc_allocWithZone(MEMORY[0x263F51628]);
  uint64_t v11 = (void *)sub_258EA8C30();
  unint64_t v12 = (void *)sub_258EA8910();
  id v13 = objc_msgSend(v10, sel_init_modelStoreRootURL_, v11, v12);

  id v14 = objc_msgSend(v13, sel_listModelNames);
  if (!v14)
  {
    char v31 = sub_258EA8B90();
    os_log_type_t v32 = sub_258EA8E90();
    if (os_log_type_enabled(v31, v32))
    {
      id v33 = v13;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_258E57000, v31, v32, "Failed to get model name list from LCFModelStore", v34, 2u);
      uint64_t v35 = v34;
      id v13 = v33;
      MEMORY[0x25A2D36B0](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    char v30 = 0;
LABEL_52:
    v90 = v30;
    goto LABEL_59;
  }
  int v15 = v14;
  id v103 = v13;
  v98 = v9;
  uint64_t v99 = v7;
  uint64_t v16 = sub_258EA8D40();

  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_258EA8B90();
  os_log_type_t v18 = sub_258EA8E80();
  BOOL v19 = os_log_type_enabled(v17, v18);
  v100 = &v91;
  uint64_t v101 = v6;
  if (v19)
  {
    unint64_t v102 = v1;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    v106[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    v97 = v20 + 4;
    uint64_t v22 = swift_bridgeObjectRetain();
    uint64_t v23 = MEMORY[0x25A2D2A80](v22, MEMORY[0x263F8D310]);
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v104 = sub_258E787E0(v23, v25, v106);
    sub_258EA8F40();
    swift_bridgeObjectRelease_n();
    uint64_t v1 = v102;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_258E57000, v17, v18, "modelNames for shadow evaluation: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2D36B0](v21, -1, -1);
    MEMORY[0x25A2D36B0](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v36 = swift_allocObject();
  *(void *)(v36 + 16) = MEMORY[0x263F8EE80];
  sub_258E786A8(v1, (uint64_t)v106);
  char v37 = (void *)swift_allocObject();
  memcpy(v37 + 2, v106, 0x188uLL);
  char v38 = v103;
  v37[51] = v103;
  v37[52] = v16;
  v37[53] = v36;
  id v39 = v38;
  swift_retain();
  sub_258E771B8(1, (uint64_t)sub_258E787D0, (uint64_t)v37);
  swift_release();
  swift_beginAccess();
  uint64_t v40 = swift_bridgeObjectRetain();
  sub_258E7747C(v40);
  swift_bridgeObjectRelease();
  uint64_t v41 = sub_258EA8B80();
  id v96 = v39;
  v97 = (uint8_t *)v36;
  swift_bridgeObjectRelease();
  uint64_t v42 = *(void *)(v41 + 16);
  uint64_t v95 = v41;
  if (!v42)
  {
    char v30 = (void *)MEMORY[0x263F8EE80];
    uint64_t v43 = v101;
LABEL_51:
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v99 + 8))(v98, v43);
    swift_release();
    goto LABEL_52;
  }
  uint64_t v1 = v41 + 32;
  char v30 = (void *)MEMORY[0x263F8EE80];
  unint64_t v102 = (unint64_t)"oplesuggester.shadowEvaluation";
  id v103 = (id)0x8000000258EB2EE0;
  uint64_t v43 = v101;
  while (1)
  {
    uint64_t v45 = *(void *)v1;
    if (!*(void *)(*(void *)v1 + 16)) {
      goto LABEL_32;
    }
    swift_bridgeObjectRetain();
    unint64_t v46 = sub_258E78DD0(0x6974736567677573, 0xEF6C65646F4D6E6FLL);
    if (v47)
    {
      v48 = *(void **)(*(void *)(v45 + 56) + 8 * v46);
      self;
      if (swift_dynamicCastObjCClass())
      {
        uint64_t v104 = 0;
        uint64_t v105 = 0;
        id v49 = v48;
        sub_258EA8C40();

        uint64_t v50 = v105;
        if (v105) {
          break;
        }
      }
    }
LABEL_31:
    swift_bridgeObjectRelease();
LABEL_32:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v104 = (uint64_t)v30;
    unint64_t v70 = sub_258E78DD0(0xD000000000000010, (uint64_t)v103);
    uint64_t v71 = v30[2];
    BOOL v72 = (v69 & 1) == 0;
    uint64_t v73 = v71 + v72;
    if (__OFADD__(v71, v72))
    {
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    char v74 = v69;
    if (v30[3] >= v73)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        char v30 = (void *)v104;
        if (v69) {
          goto LABEL_17;
        }
      }
      else
      {
        sub_258E7B42C();
        char v30 = (void *)v104;
        if (v74) {
          goto LABEL_17;
        }
      }
    }
    else
    {
      sub_258E79230(v73, isUniquelyReferenced_nonNull_native);
      unint64_t v75 = sub_258E78DD0(0xD000000000000010, v102 | 0x8000000000000000);
      if ((v74 & 1) != (v76 & 1)) {
        goto LABEL_58;
      }
      unint64_t v70 = v75;
      char v30 = (void *)v104;
      if (v74)
      {
LABEL_17:
        uint64_t v44 = (void *)(v30[7] + 16 * v70);
        swift_bridgeObjectRelease();
        *uint64_t v44 = 0x676E6968746F4ELL;
        v44[1] = 0xE700000000000000;
        goto LABEL_18;
      }
    }
    v30[(v70 >> 6) + 8] |= 1 << v70;
    v77 = (void *)(v30[6] + 16 * v70);
    unint64_t v78 = v102 | 0x8000000000000000;
    void *v77 = 0xD000000000000010;
    v77[1] = v78;
    v79 = (void *)(v30[7] + 16 * v70);
    void *v79 = 0x676E6968746F4ELL;
    v79[1] = 0xE700000000000000;
    uint64_t v80 = v30[2];
    BOOL v81 = __OFADD__(v80, 1);
    uint64_t v82 = v80 + 1;
    if (v81) {
      goto LABEL_54;
    }
    v30[2] = v82;
LABEL_18:
    swift_bridgeObjectRelease();
    v1 += 8;
    if (!--v42) {
      goto LABEL_51;
    }
  }
  if (!*(void *)(v45 + 16)
    || (uint64_t v51 = v104, v52 = sub_258E78DD0(0x61746F745F72726DLL, 0xE90000000000006CLL), (v53 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  id v54 = *(id *)(*(void *)(v45 + 56) + 8 * v52);
  swift_bridgeObjectRelease();
  uint64_t v104 = v51;
  uint64_t v105 = v50;
  sub_258EA8C90();
  uint64_t v55 = v104;
  uint64_t v56 = v105;
  id v92 = v54;
  id v57 = objc_msgSend(v54, sel_description);
  uint64_t v93 = sub_258EA8C50();
  uint64_t v94 = v58;

  char v59 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v104 = (uint64_t)v30;
  unint64_t v61 = sub_258E78DD0(v55, v56);
  uint64_t v62 = v30[2];
  BOOL v63 = (v60 & 1) == 0;
  uint64_t v64 = v62 + v63;
  if (!__OFADD__(v62, v63))
  {
    char v65 = v60;
    if (v30[3] >= v64)
    {
      if (v59)
      {
        char v30 = (void *)v104;
        if ((v60 & 1) == 0) {
          goto LABEL_47;
        }
      }
      else
      {
        sub_258E7B42C();
        char v30 = (void *)v104;
        if ((v65 & 1) == 0) {
          goto LABEL_47;
        }
      }
    }
    else
    {
      sub_258E79230(v64, v59);
      unint64_t v66 = sub_258E78DD0(v55, v56);
      if ((v65 & 1) != (v67 & 1)) {
        goto LABEL_58;
      }
      unint64_t v61 = v66;
      char v30 = (void *)v104;
      if ((v65 & 1) == 0)
      {
LABEL_47:
        v30[(v61 >> 6) + 8] |= 1 << v61;
        v85 = (uint64_t *)(v30[6] + 16 * v61);
        uint64_t *v85 = v55;
        v85[1] = v56;
        v86 = (uint64_t *)(v30[7] + 16 * v61);
        uint64_t v87 = v94;
        uint64_t *v86 = v93;
        v86[1] = v87;
        uint64_t v88 = v30[2];
        BOOL v81 = __OFADD__(v88, 1);
        uint64_t v89 = v88 + 1;
        if (v81) {
          goto LABEL_57;
        }
        v30[2] = v89;
        swift_bridgeObjectRetain();
        goto LABEL_49;
      }
    }
    v83 = (uint64_t *)(v30[7] + 16 * v61);
    swift_bridgeObjectRelease();
    uint64_t v84 = v94;
    uint64_t *v83 = v93;
    v83[1] = v84;
LABEL_49:
    uint64_t v43 = v101;

    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  v90 = (void *)sub_258EA9220();
  __break(1u);
LABEL_59:
  result.value._rawValue = v90;
  result.is_nil = v29;
  return result;
}

unint64_t sub_258E75390(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02D8);
  uint64_t v2 = (void *)sub_258EA9190();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  os_log_type_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_258E78DD0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    unint64_t v12 = (void *)(v2[7] + 16 * result);
    *unint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_258E754B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0338);
  uint64_t v2 = (void *)sub_258EA9190();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  os_log_type_t v4 = (id *)(a1 + 40);
  while (1)
  {
    char v5 = *(unsigned char *)v4;
    id v6 = *(v4 - 1);
    unint64_t result = sub_258E78E48((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v6;
    *(unsigned char *)(v2[7] + result) = v5;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_258E755B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0310);
  uint64_t v2 = (void *)sub_258EA9190();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  os_log_type_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_258E78E8C((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_258E756C0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02C8);
  uint64_t v2 = sub_258EA9190();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_258E7D3BC(v6, (uint64_t)&v15, &qword_26A0D02D0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_258E78DD0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_258E7D3AC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_258E757F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02B0);
  uint64_t v2 = sub_258EA9190();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_258E7D3BC(v6, (uint64_t)&v13, &qword_26A0D02B8);
    uint64_t v7 = v13;
    unint64_t result = sub_258E78EDC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_258E7D3AC(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_258E75928(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0288);
  uint64_t v2 = (void *)sub_258EA9190();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    uint64_t v7 = v4[1];
    uint64_t v8 = v4[2];
    uint64_t v10 = v4[3];
    uint64_t v9 = v4[4];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_258E78DD0(v5, v6);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v13 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v13 = v5;
    v13[1] = v6;
    long long v14 = (uint64_t *)(v2[7] + 32 * result);
    *long long v14 = v7;
    v14[1] = v8;
    v14[2] = v10;
    v14[3] = v9;
    uint64_t v15 = v2[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v2[2] = v17;
    v4 += 6;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_258E75A68(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0290);
  uint64_t v2 = (void *)sub_258EA9190();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_258E78DD0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_258E75B84(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0298);
  uint64_t v2 = (void *)sub_258EA9190();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_258E78DD0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_258E75C98(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0270);
  uint64_t v2 = (void *)sub_258EA9190();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_258E78DD0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_258E75DB4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_258EA8BB0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A0D0790);
  swift_bridgeObjectRetain();
  char v10 = sub_258EA8B90();
  os_log_type_t v11 = sub_258EA8E80();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    sub_258EA8F40();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_258E57000, v10, v11, "Processing batch with %ld events", v12, 0xCu);
    MEMORY[0x25A2D36B0](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_258E75F44(a1, a3, a4, (id *)(a5 + 16));
  return swift_endAccess();
}

uint64_t sub_258E75F44(uint64_t result, void *a2, uint64_t a3, id *a4)
{
  v130 = a4;
  v157[4] = *MEMORY[0x263EF8340];
  uint64_t v145 = *(void *)(a3 + 16);
  if (v145)
  {
    uint64_t v5 = result;
    uint64_t v144 = a3 + 32;
    uint64_t v148 = sub_258EA8950();
    uint64_t v7 = *(void *)(v148 - 8);
    uint64_t v8 = *(void *)(v7 + 64);
    v141 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    v143 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v138 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    uint64_t v152 = v5 + 64;
    v126 = v157;
    v127 = (uint64_t (**)(char *, uint64_t))(v7 + 8);
    v124[1] = a3;
    uint64_t v9 = swift_bridgeObjectRetain();
    v137 = 0;
    id v132 = 0;
    uint64_t v10 = 0;
    uint64_t v133 = 0;
    *(void *)&long long v11 = 136315138;
    long long v151 = v11;
    uint64_t v129 = MEMORY[0x263F8EE58] + 8;
    uint64_t v150 = v5;
    uint64_t v142 = v8;
    v125 = a2;
    while (1)
    {
      uint64_t v149 = v10;
      uint64_t v12 = (uint64_t *)(v144 + 16 * v10);
      uint64_t v14 = *v12;
      unint64_t v13 = v12[1];
      MEMORY[0x270FA5388](v9);
      unint64_t v15 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
      v146 = (char *)v124 - v15;
      swift_bridgeObjectRetain();
      BOOL v16 = (void *)sub_258EA8C30();
      id v17 = objc_msgSend(a2, sel_getModelURL_, v16);

      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0320);
      uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
      uint64_t v21 = (char *)v124 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v17)
      {
        v147 = v124;
        MEMORY[0x270FA5388](v19);
        sub_258EA8920();

        uint64_t v22 = *v141;
        uint64_t v23 = (char *)v124 - v15;
        uint64_t v24 = v148;
        (*v141)(v21, v23, v148);
        (*v143)(v21, 0, 1, v24);
        if ((*v138)(v21, 1, v24) != 1)
        {
          unint64_t v25 = v146;
          v22(v146, v21, v148);
          uint64_t v26 = (void *)sub_258EA8C30();
          id v27 = objc_msgSend(a2, sel_getModelConfig_, v26);

          id v136 = v27;
          if (v27)
          {
            id v28 = v27;
            Swift::Bool v29 = (void *)sub_258EA8910();
            char v30 = self;
            aBlock[0] = 0;
            id v31 = objc_msgSend(v30, sel_modelWithContentsOfURL_configuration_error_, v29, v28, aBlock);

            id v139 = v31;
            if (v31)
            {
              os_log_type_t v32 = aBlock[0];

              goto LABEL_17;
            }
            v115 = aBlock[0];
            v116 = (void *)sub_258EA88E0();

            swift_willThrow();
            uint64_t v133 = 0;
          }
          else
          {
            char v38 = (void *)sub_258EA8910();
            id v39 = self;
            aBlock[0] = 0;
            id v40 = objc_msgSend(v39, sel_modelWithContentsOfURL_error_, v38, aBlock);

            id v139 = v40;
            if (v40)
            {
              uint64_t v41 = aBlock[0];
LABEL_17:
              sub_258EA8B30();
              id v134 = (id)sub_258EA8B20();
              id v42 = objc_allocWithZone(MEMORY[0x263F5D370]);
              id v135 = objc_msgSend(v42, sel_initWithCoreMLModel_, v139);
              uint64_t v43 = 1 << *(unsigned char *)(v5 + 32);
              if (v43 < 64) {
                uint64_t v44 = ~(-1 << v43);
              }
              else {
                uint64_t v44 = -1;
              }
              unint64_t v45 = v44 & *(void *)(v5 + 64);
              int64_t v153 = (unint64_t)(v43 + 63) >> 6;
              swift_bridgeObjectRetain();
              int64_t v46 = 0;
              while (1)
              {
                while (1)
                {
LABEL_23:
                  if (v45)
                  {
                    unint64_t v47 = __clz(__rbit64(v45));
                    v45 &= v45 - 1;
                    unint64_t v48 = v47 | (v46 << 6);
                  }
                  else
                  {
                    if (__OFADD__(v46++, 1))
                    {
                      __break(1u);
                      goto LABEL_91;
                    }
                    if (v46 >= v153) {
                      goto LABEL_79;
                    }
                    unint64_t v50 = *(void *)(v152 + 8 * v46);
                    if (!v50)
                    {
                      int64_t v51 = v46 + 1;
                      if (v46 + 1 >= v153) {
                        goto LABEL_79;
                      }
                      unint64_t v50 = *(void *)(v152 + 8 * v51);
                      if (!v50)
                      {
                        int64_t v51 = v46 + 2;
                        if (v46 + 2 >= v153) {
                          goto LABEL_79;
                        }
                        unint64_t v50 = *(void *)(v152 + 8 * v51);
                        if (!v50)
                        {
                          int64_t v51 = v46 + 3;
                          if (v46 + 3 >= v153)
                          {
LABEL_79:
                            v113 = v146;
                            id v114 = v136;

                            swift_release();
                            uint64_t v9 = (*v127)(v113, v148);
                            goto LABEL_4;
                          }
                          unint64_t v50 = *(void *)(v152 + 8 * v51);
                          if (!v50)
                          {
                            while (1)
                            {
                              int64_t v46 = v51 + 1;
                              if (__OFADD__(v51, 1)) {
                                break;
                              }
                              if (v46 >= v153) {
                                goto LABEL_79;
                              }
                              unint64_t v50 = *(void *)(v152 + 8 * v46);
                              ++v51;
                              if (v50) {
                                goto LABEL_35;
                              }
                            }
LABEL_91:
                            __break(1u);
LABEL_92:
                            __break(1u);
LABEL_93:
                            __break(1u);
LABEL_94:
                            __break(1u);
                          }
                        }
                      }
                      int64_t v46 = v51;
                    }
LABEL_35:
                    unint64_t v45 = (v50 - 1) & v50;
                    unint64_t v48 = __clz(__rbit64(v50)) + (v46 << 6);
                  }
                  uint64_t v52 = *(void *)(v5 + 56);
                  char v53 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v48);
                  unint64_t v54 = v53[1];
                  uint64_t v154 = *v53;
                  uint64_t v55 = v52 + 24 * v48;
                  uint64_t v56 = *(void **)(v55 + 8);
                  uint64_t v57 = *(void *)(v55 + 16);
                  if (v56) {
                    break;
                  }
                  uint64_t v67 = qword_26A0D01F0;
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  if (v67 != -1) {
                    swift_once();
                  }
                  uint64_t v68 = sub_258EA8BB0();
                  __swift_project_value_buffer(v68, (uint64_t)qword_26A0D0790);
                  swift_bridgeObjectRetain();
                  char v69 = sub_258EA8B90();
                  os_log_type_t v70 = sub_258EA8E80();
                  if (os_log_type_enabled(v69, v70))
                  {
                    uint64_t v71 = swift_slowAlloc();
                    BOOL v72 = (void *)swift_slowAlloc();
                    aBlock[0] = v72;
                    *(_DWORD *)uint64_t v71 = v151;
                    swift_bridgeObjectRetain();
                    *(void *)(v71 + 4) = sub_258E787E0(v154, v54, (uint64_t *)aBlock);
                    swift_bridgeObjectRelease_n();
                    _os_log_impl(&dword_258E57000, v69, v70, "Share event %s missing positive label, skipping", (uint8_t *)v71, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x25A2D36B0](v72, -1, -1);
                    MEMORY[0x25A2D36B0](v71, -1, -1);
                    swift_bridgeObjectRelease();
                  }
                  else
                  {

                    swift_bridgeObjectRelease_n();
                    swift_bridgeObjectRelease();
                  }
                }
                int v58 = *(_DWORD *)(v52 + 24 * v48);
                if ((v58 - 1) <= 2) {
                  break;
                }
                uint64_t v59 = qword_26A0D01F0;
                id v60 = v56;
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                if (v59 != -1) {
                  swift_once();
                }
                uint64_t v61 = sub_258EA8BB0();
                __swift_project_value_buffer(v61, (uint64_t)qword_26A0D0790);
                swift_bridgeObjectRetain();
                uint64_t v62 = sub_258EA8B90();
                os_log_type_t v63 = sub_258EA8E80();
                if (os_log_type_enabled(v62, v63))
                {
                  uint64_t v64 = swift_slowAlloc();
                  char v65 = (void *)swift_slowAlloc();
                  aBlock[0] = v65;
                  *(_DWORD *)uint64_t v64 = v151;
                  swift_bridgeObjectRetain();
                  *(void *)(v64 + 4) = sub_258E787E0(v154, v54, (uint64_t *)aBlock);
                  swift_bridgeObjectRelease_n();
                  _os_log_impl(&dword_258E57000, v62, v63, "Share event %s missing labeling evidence to engagement conversion", (uint8_t *)v64, 0xCu);
                  swift_arrayDestroy();
                  unint64_t v66 = v65;
                  uint64_t v5 = v150;
                  MEMORY[0x25A2D36B0](v66, -1, -1);
                  MEMORY[0x25A2D36B0](v64, -1, -1);
                  swift_bridgeObjectRelease();
                }
                else
                {

                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease();
                }
              }
              uint64_t v131 = qword_258EAA610[v58 - 1];
              id v73 = objc_allocWithZone(MEMORY[0x263F5D390]);
              id v74 = v56;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              id v75 = objc_msgSend(v73, sel_init);
              char v76 = (void *)sub_258EA8C30();
              objc_msgSend(v75, sel_setSessionID_, v76);

              uint64_t v77 = swift_allocObject();
              *(_DWORD *)(v77 + 16) = v58;
              *(void *)(v77 + 24) = v56;
              *(void *)(v77 + 32) = v57;
              id v140 = v74;
              swift_bridgeObjectRetain();
              sub_258E743A8((uint64_t)v137);
              uint64_t v78 = swift_allocObject();
              *(void *)(v78 + 16) = sub_258E7E130;
              *(void *)(v78 + 24) = v77;
              v128 = (void *)v77;
              v157[2] = sub_258E7E148;
              v157[3] = v78;
              aBlock[0] = (void *)MEMORY[0x263EF8330];
              aBlock[1] = (void *)1107296256;
              v157[0] = sub_258E776F0;
              v157[1] = &block_descriptor_24;
              v79 = _Block_copy(aBlock);
              swift_retain();
              swift_release();
              id v132 = v75;
              id v80 = objc_msgSend(v135, sel_scoreCandidates_predictionContext_, v79, v75);
              _Block_release(v79);
              LOBYTE(v79) = swift_isEscapingClosureAtFileLocation();
              swift_release();
              if (v79) {
                goto LABEL_93;
              }
              sub_258E7451C(0, &qword_26A0D0318);
              sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
              sub_258E7E170();
              sub_258EA8BF0();

              unint64_t v81 = swift_bridgeObjectRetain();
              sub_258E7E264(v81, (unint64_t)sub_258E77788, 0);
              v83 = v82;
              swift_bridgeObjectRelease();
              aBlock[0] = v83;
              uint64_t v84 = v133;
              sub_258E7D4D0(aBlock);
              uint64_t v133 = v84;
              if (v84)
              {
                unint64_t result = swift_release();
                __break(1u);
                return result;
              }
              swift_bridgeObjectRelease();
              v85 = aBlock[0];
              v137 = (uint64_t (*)())aBlock[0][2];
              if (v137)
              {
                sub_258E7451C(0, &qword_26A0D0330);
                id v86 = (id)v85[4];
                char v87 = sub_258EA8F20();

                uint64_t v88 = 0;
                if ((v87 & 1) == 0)
                {
                  if (v137 == (uint64_t (*)())1) {
                    goto LABEL_61;
                  }
                  uint64_t v89 = 6;
                  uint64_t v88 = 1;
                  while (1)
                  {
                    id v90 = (id)v85[v89];
                    char v91 = sub_258EA8F20();

                    if (v91) {
                      break;
                    }
                    id v92 = (uint64_t (*)())(v88 + 1);
                    if (__OFADD__(v88, 1)) {
                      goto LABEL_92;
                    }
                    ++v88;
                    v89 += 2;
                    if (v92 == v137) {
                      goto LABEL_61;
                    }
                  }
                }
                swift_release();
                uint64_t v95 = v88 + 1;
                if (__OFADD__(v88, 1)) {
                  goto LABEL_94;
                }
                if (v95 < 0)
                {
                  char v93 = 0;
                  char v94 = 0;
                }
                else
                {
                  char v94 = 0;
                  if (v95 >= 255) {
                    char v93 = -1;
                  }
                  else {
                    char v93 = v88 + 1;
                  }
                }
              }
              else
              {
LABEL_61:
                swift_release();
                char v93 = 0;
                char v94 = 1;
              }
              id v96 = *v130;
              uint64_t v97 = *((void *)*v130 + 2);
              swift_bridgeObjectRetain();
              if (v97 && (unint64_t v98 = sub_258E78DD0(v154, v54), (v99 & 1) != 0))
              {
                v100 = (uint64_t *)(v96[7] + 24 * v98);
                uint64_t v101 = (void *)v100[1];
                uint64_t v131 = *v100;
                id v102 = (id)v100[2];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
              }
              else
              {
                uint64_t v101 = (void *)MEMORY[0x263F8EE88];
                uint64_t v103 = MEMORY[0x263F8EE78];
                if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0)
                {
                  unint64_t v111 = MEMORY[0x263F8EE78];
                  if (sub_258EA9150())
                  {
                    sub_258EA5620(v111);
                    uint64_t v101 = v112;
                  }
                  uint64_t v103 = v111;
                }
                id v102 = (id)sub_258E754B4(v103);
              }
              aBlock[0] = v101;
              swift_bridgeObjectRelease();
              id v104 = v134;
              sub_258E9DAA0(&v155, v104);

              if ((v94 & 1) == 0)
              {
                id v105 = v104;
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                id v155 = v102;
                sub_258E9D094(v93, v105, isUniquelyReferenced_nonNull_native);
                id v102 = v155;

                swift_bridgeObjectRelease();
              }
              v107 = aBlock[0];
              v108 = v130;
              char v109 = swift_isUniquelyReferenced_nonNull_native();
              id v155 = *v108;
              id *v108 = (id)0x8000000000000000;
              sub_258E9CF28(v131, (uint64_t)v107, (uint64_t)v102, v154, v54, v109);
              id *v108 = v155;
              swift_bridgeObjectRelease();

              id v110 = v140;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v137 = sub_258E7E130;
              id v132 = v128;
              a2 = v125;
              uint64_t v5 = v150;
              goto LABEL_23;
            }
            v117 = aBlock[0];
            v116 = (void *)sub_258EA88E0();

            swift_willThrow();
            uint64_t v133 = 0;
          }
          if (qword_26A0D01F0 != -1) {
            swift_once();
          }
          uint64_t v118 = sub_258EA8BB0();
          __swift_project_value_buffer(v118, (uint64_t)qword_26A0D0790);
          swift_bridgeObjectRetain();
          v119 = sub_258EA8B90();
          os_log_type_t v120 = sub_258EA8E90();
          if (os_log_type_enabled(v119, v120))
          {
            uint64_t v121 = swift_slowAlloc();
            v122 = (void *)swift_slowAlloc();
            aBlock[0] = v122;
            *(_DWORD *)uint64_t v121 = v151;
            swift_bridgeObjectRetain();
            *(void *)(v121 + 4) = sub_258E787E0(v14, v13, (uint64_t *)aBlock);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_258E57000, v119, v120, "Error loading model %s", (uint8_t *)v121, 0xCu);
            swift_arrayDestroy();
            v123 = v122;
            uint64_t v5 = v150;
            MEMORY[0x25A2D36B0](v123, -1, -1);
            MEMORY[0x25A2D36B0](v121, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }

          uint64_t v9 = (*v127)(v25, v148);
          goto LABEL_4;
        }
      }
      else
      {
        (*v143)(v21, 1, 1, v148);
      }
      sub_258E7E090((uint64_t)v21);
      if (qword_26A0D01F0 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_258EA8BB0();
      __swift_project_value_buffer(v33, (uint64_t)qword_26A0D0790);
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_258EA8B90();
      os_log_type_t v35 = sub_258EA8E90();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc();
        char v37 = (void *)swift_slowAlloc();
        aBlock[0] = v37;
        *(_DWORD *)uint64_t v36 = v151;
        swift_bridgeObjectRetain();
        *(void *)(v36 + 4) = sub_258E787E0(v14, v13, (uint64_t *)aBlock);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_258E57000, v34, v35, "URL missing for model %s", (uint8_t *)v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2D36B0](v37, -1, -1);
        MEMORY[0x25A2D36B0](v36, -1, -1);
      }
      else
      {

        uint64_t v9 = swift_bridgeObjectRelease_n();
      }
LABEL_4:
      uint64_t v10 = v149 + 1;
      uint64_t v8 = v142;
      if (v149 + 1 == v145)
      {
        swift_bridgeObjectRelease();
        return sub_258E743A8((uint64_t)v137);
      }
    }
  }
  return result;
}

void sub_258E771B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_258EA8C10();
  id v9 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v10 = objc_msgSend(v9, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v11 = objc_msgSend(v10, sel_LabeledDataStore);
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v11, sel_publisher);
  unint64_t v13 = (void *)swift_allocObject();
  v13[2] = v8;
  v13[3] = a2;
  v13[4] = a3;
  aBlock[4] = sub_258E7DF74;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_258E98CC0;
  aBlock[3] = &block_descriptor;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  sub_258E786A8(v4, (uint64_t)aBlock);
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = v8;
  v15[3] = a1;
  v15[4] = a2;
  v15[5] = a3;
  memcpy(v15 + 6, aBlock, 0x188uLL);
  v18[4] = sub_258E7E080;
  v18[5] = v15;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_258E785D0;
  v18[3] = &block_descriptor_15;
  BOOL v16 = _Block_copy(v18);
  swift_retain();
  swift_retain();
  swift_release();
  id v17 = objc_msgSend(v12, sel_sinkWithCompletion_receiveInput_, v14, v16);
  _Block_release(v16);
  _Block_release(v14);
  swift_release();
}

uint64_t sub_258E7747C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_258EA90B0();
    uint64_t result = sub_258E7DEAC(v1);
    uint64_t v5 = result;
    uint64_t v6 = 0;
    uint64_t v7 = v1 + 64;
    uint64_t v16 = v1 + 80;
    int v17 = v4;
    uint64_t v18 = v1;
    while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(v1 + 32))
    {
      unint64_t v9 = (unint64_t)v5 >> 6;
      if ((*(void *)(v7 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(v1 + 36) != v4) {
        goto LABEL_23;
      }
      uint64_t v19 = v6;
      sub_258EA8A80();
      MEMORY[0x270FA5388]();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_258EA8A50();
      id v10 = objc_allocWithZone((Class)sub_258EA8B70());
      sub_258EA8B60();
      uint64_t v1 = v18;
      sub_258EA9090();
      sub_258EA90C0();
      sub_258EA90D0();
      uint64_t result = sub_258EA90A0();
      int64_t v8 = 1 << *(unsigned char *)(v18 + 32);
      if (v5 >= v8) {
        goto LABEL_24;
      }
      uint64_t v11 = *(void *)(v7 + 8 * v9);
      if ((v11 & (1 << v5)) == 0) {
        goto LABEL_25;
      }
      int v4 = v17;
      if (*(_DWORD *)(v18 + 36) != v17) {
        goto LABEL_26;
      }
      unint64_t v12 = v11 & (-2 << (v5 & 0x3F));
      if (v12)
      {
        int64_t v8 = __clz(__rbit64(v12)) | v5 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v13 = v9 + 1;
        unint64_t v14 = (unint64_t)(v8 + 63) >> 6;
        if (v9 + 1 < v14)
        {
          unint64_t v15 = *(void *)(v7 + 8 * v13);
          if (v15)
          {
LABEL_18:
            int64_t v8 = __clz(__rbit64(v15)) + (v13 << 6);
          }
          else
          {
            while (v14 - 2 != v9)
            {
              unint64_t v15 = *(void *)(v16 + 8 * v9++);
              if (v15)
              {
                unint64_t v13 = v9 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v6 = v19 + 1;
      uint64_t v5 = v8;
      if (v19 + 1 == v2) {
        return v20;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

id sub_258E776F0(uint64_t a1)
{
  (*(void (**)(void))(a1 + 32))();
  sub_258E7451C(0, &qword_26A0D0318);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0358);
  sub_258E7E170();
  uint64_t v1 = (void *)sub_258EA8BE0();
  swift_bridgeObjectRelease();
  return v1;
}

id sub_258E77788@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)a1;
  int v4 = *(void **)(a1 + 8);
  *a2 = *(void *)a1;
  id v5 = v3;
  id result = objc_msgSend(v4, sel_doubleValue);
  a2[1] = v7;
  return result;
}

void sub_258E777C8(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  id v5 = objc_msgSend(a1, sel_error);
  if (v5)
  {
    uint64_t v6 = v5;
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_258EA8BB0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A0D0790);
    id v14 = v6;
    int64_t v8 = sub_258EA8B90();
    os_log_type_t v9 = sub_258EA8E90();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      *(_DWORD *)id v10 = 138412290;
      id v12 = v14;
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_258EA8F40();
      *uint64_t v11 = v15;

      _os_log_impl(&dword_258E57000, v8, v9, "Error reading labelled data stream: %@", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0530);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v11, -1, -1);
      MEMORY[0x25A2D36B0](v10, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    swift_beginAccess();
    if (*(void *)(*(void *)(a2 + 16) + 16))
    {
      uint64_t v13 = swift_bridgeObjectRetain();
      a3(v13);
      swift_bridgeObjectRelease();
    }
  }
}

void sub_258E779FC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7 = (uint64_t *)(a2 + 16);
  int64_t v8 = (void *)MEMORY[0x25A2D30F0]();
  sub_258E77A80(a1, v7, a3, a4);
}

void sub_258E77A80(void *a1, uint64_t *a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v8 = objc_msgSend(a1, sel_eventBody);
  if (!v8) {
    goto LABEL_10;
  }
  os_log_type_t v9 = v8;
  id v10 = objc_msgSend(v8, sel_itemIdentifier);
  if (!v10)
  {

LABEL_10:
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_258EA8BB0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26A0D0790);
    id v18 = a1;
    uint64_t v19 = sub_258EA8B90();
    os_log_type_t v20 = sub_258EA8E80();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      id v73 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 138412290;
      v74[3] = (uint64_t)v18;
      id v22 = v18;
      sub_258EA8F40();
      *id v73 = v18;

      _os_log_impl(&dword_258E57000, v19, v20, "Event missing info %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0530);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v73, -1, -1);
      MEMORY[0x25A2D36B0](v21, -1, -1);
    }
    else
    {
    }
    return;
  }
  uint64_t v11 = v10;
  sub_258EA8C50();

  id v12 = objc_msgSend(v9, sel_sharingEventUID);
  if (!v12)
  {

    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  uint64_t v67 = sub_258EA8C50();
  uint64_t v15 = v14;

  if ((objc_msgSend(v9, sel_hasIsPositiveLabeled) & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v68 = v15;
  swift_beginAccess();
  if (*(void *)(*a2 + 16))
  {
    swift_bridgeObjectRetain();
    sub_258E78DD0(v67, v15);
    if (v16)
    {
      swift_endAccess();
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  swift_beginAccess();
  if (*(void *)(*a2 + 16) == a3)
  {
    uint64_t v23 = swift_bridgeObjectRetain();
    a4(v23);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (*(void *)(*a2 + 16))
    {
      swift_isUniquelyReferenced_nonNull_native();
      uint64_t v75 = *a2;
      *a2 = 0x8000000000000000;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02F8);
      sub_258EA90F0();
      *a2 = v75;
      swift_bridgeObjectRelease();
    }
    swift_endAccess();
  }
LABEL_21:
  id v24 = objc_msgSend(v9, sel_featureVector);
  sub_258E7451C(0, &qword_26A0D02E8);
  unint64_t v25 = sub_258EA8D40();

  uint64_t v66 = v4;
  if (v25 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_258EA9150();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_258E7451C(0, &qword_26A0D02F0);
  uint64_t v72 = sub_258EA8C10();
  id v26 = objc_msgSend(v9, sel_featureVector);
  unint64_t v27 = sub_258EA8D40();

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_258EA9150();
    swift_bridgeObjectRelease();
    char v69 = v9;
    if (v28) {
      goto LABEL_25;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v48 = *a2;
    uint64_t v49 = *(void *)(*a2 + 16);
    swift_bridgeObjectRetain();
    if (v49 && (unint64_t v50 = sub_258E78DD0(v67, v68), (v51 & 1) != 0))
    {
      uint64_t v52 = *(void *)(v48 + 56) + 24 * v50;
      int v53 = *(_DWORD *)v52;
      uint64_t v55 = *(void **)(v52 + 8);
      unint64_t v54 = *(void *)(v52 + 16);
      id v56 = v55;
      swift_bridgeObjectRetain();
    }
    else
    {
      int v53 = objc_msgSend(v9, sel_labelingEvidence, v66);
      unint64_t v54 = sub_258E755B4(MEMORY[0x263F8EE78]);
      uint64_t v55 = 0;
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
    id v57 = objc_allocWithZone(MEMORY[0x263F5D368]);
    int v58 = (void *)sub_258EA8C30();
    swift_bridgeObjectRelease();
    id v59 = objc_msgSend(v57, sel_initWithDomainId_derivedIntentId_bundleId_recipientsId_, v58, 0, 0, 0);

    id v60 = v59;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v74[0] = v54;
    sub_258E9D37C(v72, v60, isUniquelyReferenced_nonNull_native);
    uint64_t v62 = v74[0];

    swift_bridgeObjectRelease();
    if (objc_msgSend(v9, sel_isPositiveLabeled))
    {
      id v63 = v60;

      uint64_t v55 = v63;
    }
    swift_beginAccess();
    id v64 = v55;
    swift_bridgeObjectRetain();
    char v65 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v75 = *a2;
    *a2 = 0x8000000000000000;
    sub_258E9D1E8(v53, (uint64_t)v55, v62, v67, v68, v65);
    *a2 = v75;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();

    return;
  }
  uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  char v69 = v9;
  if (!v28) {
    goto LABEL_42;
  }
LABEL_25:
  if (v28 >= 1)
  {
    uint64_t v29 = 0;
    uint64_t v71 = v28;
    while (1)
    {
      if ((v27 & 0xC000000000000001) != 0) {
        id v30 = (id)MEMORY[0x25A2D2D90](v29, v27);
      }
      else {
        id v30 = *(id *)(v27 + 8 * v29 + 32);
      }
      id v31 = v30;
      objc_msgSend(v30, sel_featureName, v66);
      id v32 = (id)BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString();
      uint64_t v33 = sub_258EA8C50();
      unint64_t v35 = v34;

      id v36 = objc_msgSend(v31, sel_featureValue);
      if (!v36) {
        goto LABEL_37;
      }
      char v37 = v36;
      id v38 = sub_258E783C0(v36);
      if (!v38) {
        break;
      }
      id v39 = v38;
      char v40 = swift_isUniquelyReferenced_nonNull_native();
      v74[0] = v72;
      sub_258E9D350((uint64_t)v39, v33, v35, v40);
      uint64_t v72 = v74[0];

      uint64_t v28 = v71;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_29:
      if (v28 == ++v29) {
        goto LABEL_42;
      }
    }

LABEL_37:
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_258EA8BB0();
    __swift_project_value_buffer(v41, (uint64_t)qword_26A0D0790);
    swift_bridgeObjectRetain();
    id v42 = sub_258EA8B90();
    os_log_type_t v43 = sub_258EA8E80();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      v74[0] = v45;
      *(_DWORD *)uint64_t v44 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v44 + 4) = sub_258E787E0(v33, v35, v74);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_258E57000, v42, v43, "Feature %s is missing a value", (uint8_t *)v44, 0xCu);
      swift_arrayDestroy();
      uint64_t v46 = v45;
      os_log_type_t v9 = v69;
      MEMORY[0x25A2D36B0](v46, -1, -1);
      uint64_t v47 = v44;
      uint64_t v28 = v71;
      MEMORY[0x25A2D36B0](v47, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    goto LABEL_29;
  }
  __break(1u);
}

id sub_258E783C0(void *a1)
{
  if (objc_msgSend(a1, sel_hasIntValue))
  {
    objc_msgSend(a1, sel_intValue);
    uint64_t v2 = (void *)sub_258EA92A0();
    id v3 = objc_msgSend(a1, sel_timeBucketValue);
    id v4 = objc_allocWithZone(MEMORY[0x263F2A2A8]);
    id v5 = v2;
    uint64_t v6 = 0;
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(a1, sel_hasDoubleValue) || objc_msgSend(a1, sel_hasDoubleValue))
  {
    objc_msgSend(a1, sel_doubleValue);
    uint64_t v2 = (void *)sub_258EA8DF0();
    id v3 = objc_msgSend(a1, sel_timeBucketValue);
    id v4 = objc_allocWithZone(MEMORY[0x263F2A2A8]);
    id v5 = 0;
    uint64_t v6 = v2;
    goto LABEL_6;
  }
  if (objc_msgSend(a1, sel_hasBoolValue))
  {
    objc_msgSend(a1, sel_BOOLValue);
    uint64_t v2 = (void *)sub_258EA8DB0();
    id v11 = objc_msgSend(a1, sel_timeBucketValue);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A2A8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_timeBucketValue_missingReason_, 0, 0, 0, v2, v11, 1);
    goto LABEL_8;
  }
  id v12 = objc_msgSend(a1, sel_stringValue);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  sub_258EA8C50();

  id v3 = objc_msgSend(a1, sel_timeBucketValue);
  id v14 = objc_allocWithZone(MEMORY[0x263F2A2A8]);
  uint64_t v2 = (void *)sub_258EA8C30();
  swift_bridgeObjectRelease();
  id v4 = v14;
  id v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = v2;
LABEL_7:
  id v8 = objc_msgSend(v4, sel_initWithIntValue_doubleValue_stringValue_BOOLValue_timeBucketValue_missingReason_, v5, v6, v7, 0, v3, 1);
LABEL_8:
  id v9 = v8;

  return v9;
}

void sub_258E785D0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_258E78670()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_258E786A8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_258E786E0()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 45));

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 432, 7);
}

uint64_t sub_258E787D0(uint64_t a1)
{
  return sub_258E75DB4(a1, v1 + 16, *(void **)(v1 + 408), *(void *)(v1 + 416), *(void *)(v1 + 424));
}

uint64_t sub_258E787E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_258E788B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_258E7D470((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_258E7D470((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_258E788B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_258EA8F50();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_258E78A70(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_258EA9080();
  if (!v8)
  {
    sub_258EA9130();
    __break(1u);
LABEL_17:
    uint64_t result = sub_258EA91A0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_258E78A70(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_258E78B08(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_258E78C80(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_258E78C80(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_258E78B08(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_258E80F00(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_258EA9040();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_258EA9130();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_258EA8CA0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_258EA91A0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_258EA9130();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_258E78C80(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02E0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

unint64_t sub_258E78DD0(uint64_t a1, uint64_t a2)
{
  sub_258EA9270();
  sub_258EA8C80();
  uint64_t v4 = sub_258EA9290();
  return sub_258E78F2C(a1, a2, v4);
}

unint64_t sub_258E78E48(uint64_t a1)
{
  uint64_t v2 = sub_258EA8F10();
  return sub_258E79010(a1, v2);
}

unint64_t sub_258E78E8C(uint64_t a1)
{
  uint64_t v2 = sub_258EA8F10();
  return sub_258E7911C(a1, v2, &qword_26A0D0318);
}

unint64_t sub_258E78EDC(uint64_t a1)
{
  uint64_t v2 = sub_258EA8F10();
  return sub_258E7911C(a1, v2, (unint64_t *)&qword_26A0D02C0);
}

unint64_t sub_258E78F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_258EA91E0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_258EA91E0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_258E79010(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_258EA8B30();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_258EA8F20();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_258EA8F20();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_258E7911C(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_258E7451C(0, a3);
    id v7 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    char v8 = sub_258EA8F20();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v5;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * i);
        char v11 = sub_258EA8F20();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_258E79230(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02D8);
  char v42 = a2;
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    id v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    id v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    unint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_258EA9270();
    sub_258EA8C80();
    uint64_t result = sub_258EA9290();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    os_log_type_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *os_log_type_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  id v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E79558(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0340);
  char v39 = a2;
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 24 * v21;
    uint64_t v34 = *(void *)v33;
    long long v40 = *(_OWORD *)(v33 + 8);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_258EA9270();
    sub_258EA8C80();
    uint64_t result = sub_258EA9290();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
    *(void *)uint64_t v19 = v34;
    *(_OWORD *)(v19 + 8) = v40;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  int64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E7989C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0338);
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v33 = v2;
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v33;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v34 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    uint64_t v29 = *(void **)(*(void *)(v5 + 48) + 8 * v20);
    char v30 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((a2 & 1) == 0) {
      id v31 = v29;
    }
    uint64_t result = sub_258EA8F10();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v29;
    *(unsigned char *)(*(void *)(v7 + 56) + v18) = v30;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v33;
  int64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E79B64(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0308);
  char v41 = a2;
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    char v39 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v38 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_33;
        }
        unint64_t v23 = v39[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_33;
          }
          unint64_t v23 = v39[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v41)
              {
                uint64_t v37 = 1 << *(unsigned char *)(v5 + 32);
                if (v37 >= 64) {
                  bzero(v39, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v39 = -1 << v37;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v38) {
                  goto LABEL_33;
                }
                unint64_t v23 = v39[v13];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v24;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 24 * v21;
      int v33 = *(_DWORD *)v32;
      uint64_t v35 = *(void **)(v32 + 8);
      uint64_t v34 = *(void *)(v32 + 16);
      if ((v41 & 1) == 0)
      {
        id v36 = v35;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_258EA9270();
      sub_258EA8C80();
      uint64_t result = sub_258EA9290();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v16 == v26;
          if (v16 == v26) {
            unint64_t v16 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      *unint64_t v18 = v31;
      v18[1] = v30;
      uint64_t v19 = *(void *)(v7 + 56) + 24 * v17;
      *(_DWORD *)uint64_t v19 = v33;
      *(void *)(v19 + 8) = v35;
      *(void *)(v19 + 16) = v34;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E79E90(uint64_t a1, char a2)
{
  return sub_258E7B120(a1, a2, &qword_26A0D0300);
}

uint64_t sub_258E79E9C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0310);
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_258EA8F10();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E7A174(uint64_t a1, char a2)
{
  return sub_258E7A4A4(a1, a2, &qword_26A0D0280);
}

uint64_t sub_258E7A180(uint64_t a1, char a2)
{
  return sub_258E7A4A4(a1, a2, &qword_26A0D0278);
}

uint64_t sub_258E7A18C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0298);
  char v37 = a2;
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_258EA9270();
    sub_258EA8C80();
    uint64_t result = sub_258EA9290();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E7A498(uint64_t a1, char a2)
{
  return sub_258E7A4A4(a1, a2, &qword_26A0D0290);
}

uint64_t sub_258E7A4A4(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_258EA9180();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_258EA9270();
    sub_258EA8C80();
    uint64_t result = sub_258EA9290();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_258E7A7B8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0288);
  char v40 = a2;
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v38 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v40)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v13];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v24;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = (uint64_t *)(*(void *)(v5 + 56) + 32 * v21);
      uint64_t v33 = *v32;
      uint64_t v34 = v32[1];
      uint64_t v35 = v32[3];
      uint64_t v41 = v32[2];
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_258EA9270();
      sub_258EA8C80();
      uint64_t result = sub_258EA9290();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v16 == v26;
          if (v16 == v26) {
            unint64_t v16 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      *unint64_t v18 = v31;
      v18[1] = v30;
      unint64_t v19 = (void *)(*(void *)(v7 + 56) + 32 * v17);
      *unint64_t v19 = v33;
      v19[1] = v34;
      v19[2] = v41;
      v19[3] = v35;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E7AAE4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02A8);
  char v37 = a2;
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    int64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    char v25 = (long long *)(*(void *)(v5 + 56) + 40 * v17);
    if (v37)
    {
      sub_258E7D394(v25, (uint64_t)v38);
    }
    else
    {
      sub_258E7D330((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_258EA9270();
    sub_258EA8C80();
    uint64_t result = sub_258EA9290();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *unint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = sub_258E7D394(v38, *(void *)(v7 + 56) + 40 * v14);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E7AE0C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02A0);
  char v37 = a2;
  uint64_t v6 = sub_258EA9180();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    unint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_258EA9270();
    sub_258EA8C80();
    uint64_t result = sub_258EA9290();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_258E7B114(uint64_t a1, char a2)
{
  return sub_258E7B120(a1, a2, &qword_26A0D0270);
}

uint64_t sub_258E7B120(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_258EA9180();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    unint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_258EA9270();
    sub_258EA8C80();
    uint64_t result = sub_258EA9290();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  uint64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

void *sub_258E7B42C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = v19;
    v23[1] = v18;
    unint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ConfigManager(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ShadowEvaluationManager(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  uint64_t v2 = *(void **)(a1 + 384);
}

uint64_t initializeWithCopy for ShadowEvaluationManager(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v31 = v4;
  uint64_t v32 = *(void **)(a2 + 32);
  uint64_t v33 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v32;
  *(void *)(a1 + 40) = v33;
  id v34 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v34;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  uint64_t v8 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v8;
  uint64_t v9 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v9;
  uint64_t v10 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v10;
  uint64_t v11 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v11;
  uint64_t v12 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v12;
  uint64_t v13 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v13;
  uint64_t v14 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v14;
  uint64_t v15 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v15;
  uint64_t v16 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v16;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  uint64_t v17 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v17;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  uint64_t v18 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v18;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  uint64_t v29 = a2 + 344;
  uint64_t v30 = a1 + 344;
  long long v19 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v19;
  uint64_t v20 = v19;
  BOOL v28 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
  swift_bridgeObjectRetain();
  id v21 = v31;
  id v22 = v32;
  id v23 = v33;
  id v24 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v30, v29, v20);
  int64_t v25 = *(void **)(a2 + 384);
  *(void *)(a1 + 384) = v25;
  id v26 = v25;
  return a1;
}

uint64_t assignWithCopy for ShadowEvaluationManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 40);
  uint64_t v11 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a2 + 48);
  uint64_t v14 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v13;
  id v15 = v13;

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  uint64_t v16 = *(void **)(a1 + 384);
  uint64_t v17 = *(void **)(a2 + 384);
  *(void *)(a1 + 384) = v17;
  id v18 = v17;

  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

void *__swift_memcpy392_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x188uLL);
}

uint64_t assignWithTake for ShadowEvaluationManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  uint64_t v7 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  uint64_t v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  long long v20 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v20;
  id v21 = *(void **)(a1 + 384);
  uint64_t v22 = *(void *)(a2 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v22;

  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowEvaluationManager(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 392)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShadowEvaluationManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 392) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 392) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShadowEvaluationManager()
{
  return &type metadata for ShadowEvaluationManager;
}

void *sub_258E7C160()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0340);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 24 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    id v23 = (void *)(*(void *)(v4 + 48) + v16);
    long long v24 = *(_OWORD *)(v21 + 8);
    *id v23 = v19;
    v23[1] = v18;
    uint64_t v25 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v25 = v22;
    *(_OWORD *)(v25 + 8) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_258E7C348()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0338);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    char v17 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = v16;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v17;
    id result = v16;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_258E7C4EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0308);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      int64_t v9 = v28 + 1;
      if (v28 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v6 + 8 * v9);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v29 - 1) & v29;
    unint64_t v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = 24 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    int v22 = *(_DWORD *)v21;
    id v23 = *(void **)(v21 + 8);
    uint64_t v24 = *(void *)(v21 + 16);
    uint64_t v25 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v25 = v18;
    v25[1] = v19;
    uint64_t v26 = *(void *)(v4 + 56) + v20;
    *(_DWORD *)uint64_t v26 = v22;
    *(void *)(v26 + 8) = v23;
    *(void *)(v26 + 16) = v24;
    id v27 = v23;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v13) {
    goto LABEL_26;
  }
  unint64_t v29 = *(void *)(v6 + 8 * v30);
  if (v29)
  {
    int64_t v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_258E7C6C8()
{
  return sub_258E7D184(&qword_26A0D0300);
}

void *sub_258E7C6D4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0310);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    char v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_258E7C880()
{
  return sub_258E7CA54(&qword_26A0D0280);
}

void *sub_258E7C88C()
{
  return sub_258E7CA54(&qword_26A0D0278);
}

void *sub_258E7C898()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0298);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_258E7CA48()
{
  return sub_258E7CA54(&qword_26A0D0290);
}

void *sub_258E7CA54(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_258EA9170();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_258E7CC04()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0288);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      int64_t v9 = v28 + 1;
      if (v28 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v6 + 8 * v9);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v29 - 1) & v29;
    unint64_t v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = (uint64_t *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = v21[2];
    uint64_t v25 = v21[3];
    uint64_t v26 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v26 = v19;
    v26[1] = v18;
    id v27 = (void *)(*(void *)(v4 + 56) + v20);
    *id v27 = v22;
    v27[1] = v23;
    v27[2] = v24;
    v27[3] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v13) {
    goto LABEL_26;
  }
  unint64_t v29 = *(void *)(v6 + 8 * v30);
  if (v29)
  {
    int64_t v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v6 + 8 * v9);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_258E7CDDC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 40 * v15;
    sub_258E7D330(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_258E7D394(v26, *(void *)(v4 + 56) + v20);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_258E7CFC8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02A0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA9170();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_258E7D178()
{
  return sub_258E7D184(&qword_26A0D0270);
}

id sub_258E7D184(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_258EA9170();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void **)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_258E7D330(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_258E7D394(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_OWORD *sub_258E7D3AC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_258E7D3BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_258E7D470(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_258E7D4D0(void **a1)
{
  long long v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    long long v2 = (void *)sub_258E972A0(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_258E7D53C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_258E7D53C(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_258EA91C0();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v84 = *a1;
      uint64_t v85 = *a1 + 8;
      uint64_t v86 = -1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v88 = *(double *)(v84 + 16 * i + 8);
        uint64_t v89 = v86;
        uint64_t v90 = v85;
        do
        {
          if (*(double *)v90 >= v88) {
            break;
          }
          if (!v84) {
            goto LABEL_141;
          }
          uint64_t v91 = *(void *)(v90 + 8);
          *(_OWORD *)(v90 + 8) = *(_OWORD *)(v90 - 8);
          *(void *)(v90 - 8) = v91;
          *(double *)uint64_t v90 = v88;
          v90 -= 16;
        }
        while (!__CFADD__(v89++, 1));
        v85 += 16;
        --v86;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  uint64_t v6 = result;
  uint64_t v101 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (double *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_103:
      char v93 = v12;
      uint64_t v103 = v9;
      if (v13 >= 2)
      {
        uint64_t v94 = *v101;
        do
        {
          unint64_t v95 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_132;
          }
          if (!v94) {
            goto LABEL_145;
          }
          id v96 = v93;
          uint64_t v97 = *(void *)&v93[16 * v95 + 32];
          uint64_t v98 = *(void *)&v93[16 * v13 + 24];
          sub_258E7DC20((double *)(v94 + 16 * v97), (double *)(v94 + 16 * *(void *)&v93[16 * v13 + 16]), v94 + 16 * v98, __dst);
          if (v1) {
            break;
          }
          if (v98 < v97) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v96 = sub_258E96680((uint64_t)v96);
          }
          if (v95 >= *((void *)v96 + 2)) {
            goto LABEL_134;
          }
          char v99 = &v96[16 * v95 + 32];
          *(void *)char v99 = v97;
          *((void *)v99 + 1) = v98;
          unint64_t v100 = *((void *)v96 + 2);
          if (v13 > v100) {
            goto LABEL_135;
          }
          memmove(&v96[16 * v13 + 16], &v96[16 * v13 + 32], 16 * (v100 - v13));
          char v93 = v96;
          *((void *)v96 + 2) = v100 - 1;
          unint64_t v13 = v100 - 1;
        }
        while (v100 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v103 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0350);
    uint64_t v8 = sub_258EA8D80();
    *(void *)(v8 + 16) = v7;
    uint64_t v103 = v8;
    __dst = (double *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v102 = *a1 + 40;
  uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v104 = v6;
  uint64_t v105 = v3;
  uint64_t v106 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      double v15 = *(double *)(v11 + 16 * v10 + 8);
      double v16 = *(double *)(v11 + 16 * v14 + 8);
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v17 = (double *)(v102 + 16 * v14);
        double v18 = v15;
        while (1)
        {
          double v19 = v18;
          double v18 = *v17;
          if (v16 < v15 == v19 >= *v17) {
            break;
          }
          ++v10;
          v17 += 2;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14) {
          goto LABEL_138;
        }
        if (v14 < v10)
        {
          uint64_t v20 = 16 * v10;
          uint64_t v21 = 16 * v14;
          uint64_t v22 = v10;
          uint64_t v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_144;
              }
              uint64_t v24 = v11 + v20;
              uint64_t v25 = *(void *)(v11 + v21);
              uint64_t v26 = *(void *)(v11 + v21 + 8);
              *(_OWORD *)(v11 + v21) = *(_OWORD *)(v11 + v20 - 16);
              *(void *)(v24 - 16) = v25;
              *(void *)(v24 - 8) = v26;
            }
            ++v23;
            v20 -= 16;
            v21 += 16;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_136;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v27 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_139;
    }
    if (v27 >= v3) {
      uint64_t v27 = v3;
    }
    if (v27 < v14) {
      break;
    }
    if (v10 != v27)
    {
      int64_t v28 = (double *)(v11 + 16 * v10);
      do
      {
        double v29 = *(double *)(v11 + 16 * v10 + 8);
        uint64_t v30 = v14;
        uint64_t v31 = v28;
        do
        {
          if (*(v31 - 1) >= v29) {
            break;
          }
          if (!v11) {
            goto LABEL_142;
          }
          double v32 = *v31;
          *(_OWORD *)uint64_t v31 = *((_OWORD *)v31 - 1);
          *(v31 - 1) = v29;
          *(v31 - 2) = v32;
          v31 -= 2;
          ++v30;
        }
        while (v10 != v30);
        ++v10;
        v28 += 2;
      }
      while (v10 != v27);
      uint64_t v10 = v27;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_258E9640C(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v34 = *((void *)v12 + 2);
    unint64_t v33 = *((void *)v12 + 3);
    unint64_t v13 = v34 + 1;
    uint64_t v11 = v106;
    if (v34 >= v33 >> 1)
    {
      v83 = sub_258E9640C((char *)(v33 > 1), v34 + 1, 1, v12);
      uint64_t v11 = v106;
      uint64_t v12 = v83;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v35 = v12 + 32;
    uint64_t v36 = &v12[16 * v34 + 32];
    *(void *)uint64_t v36 = v14;
    *((void *)v36 + 1) = v10;
    if (v34)
    {
      while (1)
      {
        unint64_t v37 = v13 - 1;
        if (v13 >= 4)
        {
          char v42 = &v35[16 * v13];
          uint64_t v43 = *((void *)v42 - 8);
          uint64_t v44 = *((void *)v42 - 7);
          BOOL v48 = __OFSUB__(v44, v43);
          uint64_t v45 = v44 - v43;
          if (v48) {
            goto LABEL_120;
          }
          uint64_t v47 = *((void *)v42 - 6);
          uint64_t v46 = *((void *)v42 - 5);
          BOOL v48 = __OFSUB__(v46, v47);
          uint64_t v40 = v46 - v47;
          char v41 = v48;
          if (v48) {
            goto LABEL_121;
          }
          unint64_t v49 = v13 - 2;
          unint64_t v50 = &v35[16 * v13 - 32];
          uint64_t v52 = *(void *)v50;
          uint64_t v51 = *((void *)v50 + 1);
          BOOL v48 = __OFSUB__(v51, v52);
          uint64_t v53 = v51 - v52;
          if (v48) {
            goto LABEL_123;
          }
          BOOL v48 = __OFADD__(v40, v53);
          uint64_t v54 = v40 + v53;
          if (v48) {
            goto LABEL_126;
          }
          if (v54 >= v45)
          {
            uint64_t v72 = &v35[16 * v37];
            uint64_t v74 = *(void *)v72;
            uint64_t v73 = *((void *)v72 + 1);
            BOOL v48 = __OFSUB__(v73, v74);
            uint64_t v75 = v73 - v74;
            if (v48) {
              goto LABEL_130;
            }
            BOOL v65 = v40 < v75;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v66 = *((void *)v12 + 4);
            uint64_t v67 = *((void *)v12 + 5);
            BOOL v48 = __OFSUB__(v67, v66);
            uint64_t v59 = v67 - v66;
            char v60 = v48;
            goto LABEL_77;
          }
          uint64_t v39 = *((void *)v12 + 4);
          uint64_t v38 = *((void *)v12 + 5);
          BOOL v48 = __OFSUB__(v38, v39);
          uint64_t v40 = v38 - v39;
          char v41 = v48;
        }
        if (v41) {
          goto LABEL_122;
        }
        unint64_t v49 = v13 - 2;
        uint64_t v55 = &v35[16 * v13 - 32];
        uint64_t v57 = *(void *)v55;
        uint64_t v56 = *((void *)v55 + 1);
        BOOL v58 = __OFSUB__(v56, v57);
        uint64_t v59 = v56 - v57;
        char v60 = v58;
        if (v58) {
          goto LABEL_125;
        }
        uint64_t v61 = &v35[16 * v37];
        uint64_t v63 = *(void *)v61;
        uint64_t v62 = *((void *)v61 + 1);
        BOOL v48 = __OFSUB__(v62, v63);
        uint64_t v64 = v62 - v63;
        if (v48) {
          goto LABEL_128;
        }
        if (__OFADD__(v59, v64)) {
          goto LABEL_129;
        }
        if (v59 + v64 >= v40)
        {
          BOOL v65 = v40 < v64;
LABEL_83:
          if (v65) {
            unint64_t v37 = v49;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v60) {
          goto LABEL_124;
        }
        uint64_t v68 = &v35[16 * v37];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v48 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v48) {
          goto LABEL_127;
        }
        if (v71 < v59) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v76 = v37 - 1;
        if (v37 - 1 >= v13)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v11) {
          goto LABEL_143;
        }
        uint64_t v77 = v12;
        uint64_t v78 = &v35[16 * v76];
        uint64_t v79 = *(void *)v78;
        id v80 = &v35[16 * v37];
        uint64_t v81 = *((void *)v80 + 1);
        sub_258E7DC20((double *)(v11 + 16 * *(void *)v78), (double *)(v11 + 16 * *(void *)v80), v11 + 16 * v81, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v81 < v79) {
          goto LABEL_117;
        }
        if (v37 > *((void *)v77 + 2)) {
          goto LABEL_118;
        }
        *(void *)uint64_t v78 = v79;
        *(void *)&v35[16 * v76 + 8] = v81;
        unint64_t v82 = *((void *)v77 + 2);
        if (v37 >= v82) {
          goto LABEL_119;
        }
        uint64_t v12 = v77;
        unint64_t v13 = v82 - 1;
        memmove(&v35[16 * v37], v80 + 16, 16 * (v82 - 1 - v37));
        *((void *)v77 + 2) = v82 - 1;
        uint64_t v11 = v106;
        if (v82 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v104;
    uint64_t v3 = v105;
    if (v10 >= v105)
    {
      uint64_t v9 = v103;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  uint64_t result = sub_258EA9130();
  __break(1u);
  return result;
}

uint64_t sub_258E7DC20(double *__src, double *a2, unint64_t a3, double *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v25 = __src;
  uint64_t v24 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[2 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      double v18 = &v4[2 * v13];
      uint64_t v23 = (char *)v18;
      uint64_t v25 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        double v19 = (double *)(a3 - 16);
        do
        {
          uint64_t v20 = v19 + 2;
          if (*(v6 - 1) >= *(v18 - 1))
          {
            uint64_t v23 = (char *)(v18 - 2);
            if (v20 < v18 || v19 >= v18 || v20 != v18) {
              *(_OWORD *)double v19 = *((_OWORD *)v18 - 1);
            }
            uint64_t v21 = v6;
            v18 -= 2;
            if (v6 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v21 = v6 - 2;
            if (v20 != v6 || v19 >= v6) {
              *(_OWORD *)double v19 = *(_OWORD *)v21;
            }
            uint64_t v25 = v6 - 2;
            if (v21 <= v7) {
              break;
            }
          }
          v19 -= 2;
          uint64_t v6 = v21;
        }
        while (v18 > v4);
      }
LABEL_44:
      sub_258E96508((void **)&v25, (const void **)&v24, &v23);
      return 1;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[2 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[2 * v10];
    uint64_t v23 = (char *)v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      double v15 = v4;
      while (1)
      {
        if (v15[1] >= v6[1])
        {
          uint64_t v4 = v15 + 2;
          uint64_t v17 = v15;
          double v16 = v6;
          if (v7 == v15)
          {
            v15 += 2;
            if (v7 < v4) {
              goto LABEL_22;
            }
          }
          else
          {
            v15 += 2;
          }
        }
        else
        {
          double v16 = v6 + 2;
          uint64_t v17 = v6;
          if (v7 == v6 && v7 < v16) {
            goto LABEL_22;
          }
        }
        *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
LABEL_22:
        v7 += 2;
        if (v15 < v14)
        {
          uint64_t v6 = v16;
          if ((unint64_t)v16 < a3) {
            continue;
          }
        }
        uint64_t v24 = v4;
        uint64_t v25 = v7;
        goto LABEL_44;
      }
    }
    goto LABEL_44;
  }
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E7DEAC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  int64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_258E7DF34()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_258E7DF74(void *a1)
{
  sub_258E777C8(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_258E7DF98()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 49));

  return MEMORY[0x270FA0238](v0, 440, 7);
}

void sub_258E7E080(void *a1)
{
  sub_258E779FC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

uint64_t sub_258E7E090(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0320);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_258E7E0F0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_258E7E130()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_258E7E138()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_258E7E148()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_258E7E170()
{
  unint64_t result = qword_26A0D0328;
  if (!qword_26A0D0328)
  {
    sub_258E7451C(255, &qword_26A0D0318);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0328);
  }
  return result;
}

unint64_t sub_258E7E1CC@<X0>(unint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  if ((result & 0xC000000000000001) != 0)
  {
    uint64_t v7 = sub_258EA9100();
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    unint64_t result = v7 | 0x8000000000000000;
  }
  else
  {
    uint64_t v11 = -1;
    uint64_t v12 = -1 << *(unsigned char *)(result + 32);
    unint64_t v8 = result + 64;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v11 = ~(-1 << v13);
    }
    uint64_t v10 = v11 & *(void *)(result + 64);
  }
  *a4 = result;
  a4[1] = v8;
  a4[2] = v9;
  a4[3] = 0;
  a4[4] = v10;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

void sub_258E7E264(unint64_t a1, unint64_t a2, unint64_t a3)
{
  if ((a1 & 0xC000000000000001) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    if (v6 > 0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    unint64_t v10 = *(void *)(MEMORY[0x263F8EE78] + 24);
    goto LABEL_8;
  }
  uint64_t v6 = sub_258EA8FC0();
  if (v6 <= 0) {
    goto LABEL_7;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0348);
  uint64_t v7 = (void *)swift_allocObject();
  int64_t v8 = _swift_stdlib_malloc_size(v7);
  uint64_t v9 = v8 - 32;
  if (v8 < 32) {
    uint64_t v9 = v8 - 17;
  }
  unint64_t v10 = 2 * (v9 >> 4);
  v7[2] = v6;
  v7[3] = v10;
LABEL_8:
  sub_258E7E1CC(a1, a2, a3, (unint64_t *)&v35);
  if (v6 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v11 = v7 + 4;
  unint64_t v12 = v10 >> 1;
  if (v6)
  {
    v12 -= v6;
    swift_bridgeObjectRetain();
    swift_retain();
    while (1)
    {
      sub_258E972C8();
      if (!v13) {
        goto LABEL_43;
      }
      *uint64_t v11 = v13;
      v11[1] = v14;
      v11 += 2;
      if (!--v6) {
        goto LABEL_15;
      }
    }
  }
  swift_bridgeObjectRetain();
  swift_retain();
LABEL_15:
  sub_258E972C8();
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = v16;
    while (1)
    {
      if (!v12)
      {
        unint64_t v19 = v7[3];
        if ((uint64_t)((v19 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_40;
        }
        int64_t v20 = v19 & 0xFFFFFFFFFFFFFFFELL;
        if (v20 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v20;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0348);
        uint64_t v22 = (void *)swift_allocObject();
        int64_t v23 = _swift_stdlib_malloc_size(v22);
        uint64_t v24 = v23 - 32;
        if (v23 < 32) {
          uint64_t v24 = v23 - 17;
        }
        uint64_t v25 = v24 >> 4;
        v22[2] = v21;
        v22[3] = 2 * (v24 >> 4);
        unint64_t v26 = (unint64_t)(v22 + 4);
        uint64_t v27 = v7[3] >> 1;
        if (v7[2])
        {
          if (v22 != v7 || v26 >= (unint64_t)&v7[2 * v27 + 4]) {
            memmove(v22 + 4, v7 + 4, 16 * v27);
          }
          v7[2] = 0;
        }
        uint64_t v11 = (void *)(v26 + 16 * v27);
        unint64_t v12 = (v25 & 0x7FFFFFFFFFFFFFFFLL) - v27;
        swift_release();
        uint64_t v7 = v22;
      }
      BOOL v29 = __OFSUB__(v12--, 1);
      if (v29) {
        break;
      }
      *uint64_t v11 = v17;
      v11[1] = v18;
      v11 += 2;
      sub_258E972C8();
      uint64_t v17 = v30;
      uint64_t v18 = v31;
      if (!v30) {
        goto LABEL_35;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_35:
  sub_258E7E4E8();
  swift_release();
  unint64_t v32 = v7[3];
  if (v32 >= 2)
  {
    unint64_t v33 = v32 >> 1;
    BOOL v29 = __OFSUB__(v33, v12);
    unint64_t v34 = v33 - v12;
    if (v29)
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return;
    }
    v7[2] = v34;
  }
}

uint64_t sub_258E7E4E8()
{
  return swift_release();
}

uint64_t destroy for ShadowEvaluationManager.EvaluationEvent()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s25PeopleSuggesterLighthouse23ShadowEvaluationManagerV15EvaluationEventVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ShadowEvaluationManager.EvaluationEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ShadowEvaluationManager.EvaluationEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowEvaluationManager.EvaluationEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShadowEvaluationManager.EvaluationEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShadowEvaluationManager.EvaluationEvent()
{
  return &type metadata for ShadowEvaluationManager.EvaluationEvent;
}

uint64_t destroy for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t _s25PeopleSuggesterLighthouse23ShadowEvaluationManagerV22LabeledEvaluationEventVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void **)(a1 + 8);
  id v5 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v5;
  id v6 = v5;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShadowEvaluationManager.LabeledEvaluationEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShadowEvaluationManager.LabeledEvaluationEvent()
{
  return &type metadata for ShadowEvaluationManager.LabeledEvaluationEvent;
}

id sub_258E7E8A4()
{
  id result = sub_258E7E8C4();
  qword_26A0D0360 = (uint64_t)result;
  return result;
}

id sub_258E7E8C4()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA48]);
  uint64_t v1 = (void *)sub_258EA8C30();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_258EA8BB0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A0D0790);
    uint64_t v4 = sub_258EA8B90();
    os_log_type_t v5 = sub_258EA8E80();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_258E57000, v4, v5, "Using custom user defaults suite", v6, 2u);
      MEMORY[0x25A2D36B0](v6, -1, -1);
    }

    return v2;
  }
  else
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_258EA8BB0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A0D0790);
    uint64_t v9 = sub_258EA8B90();
    os_log_type_t v10 = sub_258EA8E90();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_258E57000, v9, v10, "Unable to use custom user defaults suite", v11, 2u);
      MEMORY[0x25A2D36B0](v11, -1, -1);
    }

    id v12 = objc_msgSend(self, sel_standardUserDefaults);
    return v12;
  }
}

id userDefaults.getter()
{
  if (qword_26A0D01E8 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26A0D0360;
  return v0;
}

uint64_t SubtaskName.description.getter()
{
  if (*(unsigned char *)(v0 + 4) == 1)
  {
    uint64_t result = 0xD000000000000016;
    switch(*(_DWORD *)v0)
    {
      case 1:
        uint64_t result = 0x4474736576726168;
        break;
      case 2:
        uint64_t result = 0x7274654D646E6573;
        break;
      case 3:
        uint64_t result = 0xD000000000000018;
        break;
      case 4:
        uint64_t result = 0xD000000000000022;
        break;
      case 5:
        uint64_t result = 0xD00000000000001ELL;
        break;
      case 6:
        uint64_t result = 0xD000000000000014;
        break;
      case 8:
        uint64_t result = 0xD000000000000017;
        break;
      case 9:
        uint64_t result = 0xD000000000000018;
        break;
      default:
        return result;
    }
  }
  else
  {
    sub_258EA9030();
    swift_bridgeObjectRelease();
    sub_258EA91D0();
    sub_258EA8C90();
    swift_bridgeObjectRelease();
    sub_258EA8C90();
    return 0x46657475706D6F63;
  }
  return result;
}

uint64_t ComputationState.description.getter()
{
  uint64_t result = 0x45746F4E6B736174;
  switch(*(void *)(v0 + 8))
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x726174536B736174;
      break;
    case 2:
      uint64_t result = 0x706F74536B736174;
      break;
    case 3:
      uint64_t result = 0x70696B536B736174;
      break;
    case 4:
      uint64_t result = 0x706D6F436B736174;
      break;
    default:
      sub_258EA8C90();
      uint64_t result = 0x6F7272456B736174;
      break;
  }
  return result;
}

uint64_t NSUserDefaults.shouldCompute(_:)(int *a1)
{
  int v2 = *a1;
  char v3 = *((unsigned char *)a1 + 4);
  int v53 = *a1;
  char v54 = v3;
  SubtaskName.description.getter();
  uint64_t v4 = (void *)sub_258EA8C30();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v1, sel_objectForKey_, v4);

  if (v5)
  {
    sub_258EA8F70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v52, 0, sizeof(v52));
  }
  sub_258E81A80((uint64_t)v52, (uint64_t)&v53);
  sub_258E81AE8((uint64_t)&v53, (uint64_t)&v50);
  if (!v51)
  {
    sub_258E81B50((uint64_t)&v50, &qword_26A0D0368);
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_258EA8BB0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A0D0790);
    uint64_t v17 = sub_258EA8B90();
    os_log_type_t v18 = sub_258EA8E80();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(void *)&v52[0] = v20;
      *(_DWORD *)unint64_t v19 = 136315138;
      LODWORD(v50) = v2;
      BYTE4(v50) = v3;
      uint64_t v21 = SubtaskName.description.getter();
      *(void *)&long long v50 = sub_258E787E0(v21, v22, (uint64_t *)v52);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_258E57000, v17, v18, "No Last Computation date for task %s. The task needs to be run.", v19, 0xCu);
      uint64_t v23 = 1;
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v20, -1, -1);
      MEMORY[0x25A2D36B0](v19, -1, -1);

      sub_258E81B50((uint64_t)&v53, &qword_26A0D0368);
      return v23;
    }

LABEL_20:
    sub_258E81B50((uint64_t)&v53, &qword_26A0D0368);
    return 1;
  }
  sub_258E7D3AC(&v50, v52);
  uint64_t v6 = sub_258EA8A80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258E7D470((uint64_t)v52, (uint64_t)&v50);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v13 = swift_dynamicCast();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  if (!v13)
  {
    v14(v12, 1, 1, v6);
    goto LABEL_14;
  }
  v14(v12, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
  {
LABEL_14:
    sub_258E81B50((uint64_t)v12, &qword_26A0D0370);
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_258EA8BB0();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A0D0790);
    uint64_t v25 = sub_258EA8B90();
    os_log_type_t v26 = sub_258EA8E80();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(void *)&long long v50 = v28;
      *(_DWORD *)uint64_t v27 = 136315138;
      LODWORD(v49) = v2;
      BYTE4(v49) = v3;
      uint64_t v29 = SubtaskName.description.getter();
      double v49 = COERCE_DOUBLE(sub_258E787E0(v29, v30, (uint64_t *)&v50));
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_258E57000, v25, v26, "No Last Computation date for task %s. The task needs to be run.", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v28, -1, -1);
      MEMORY[0x25A2D36B0](v27, -1, -1);
    }

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))((char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v6);
  sub_258EA8A30();
  if (v15 < -43200.0)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))((char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
    sub_258E81B50((uint64_t)&v53, &qword_26A0D0368);
    return 1;
  }
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_258EA8BB0();
  uint64_t v33 = __swift_project_value_buffer(v32, (uint64_t)qword_26A0D0790);
  BOOL v48 = v45;
  MEMORY[0x270FA5388](v33);
  unint64_t v34 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v34, v34, v6);
  long long v35 = sub_258EA8B90();
  os_log_type_t v36 = sub_258EA8E80();
  int v37 = v36;
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v38 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(void *)&long long v50 = v47;
    *(_DWORD *)uint64_t v38 = 136315650;
    v45[1] = v38 + 4;
    LODWORD(v49) = v2;
    BYTE4(v49) = v3;
    int v46 = v37;
    uint64_t v39 = SubtaskName.description.getter();
    double v49 = COERCE_DOUBLE(sub_258E787E0(v39, v40, (uint64_t *)&v50));
    sub_258EA8F40();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2048;
    sub_258EA8A30();
    double v49 = -v41;
    sub_258EA8F40();
    char v42 = *(void (**)(char *, uint64_t))(v7 + 8);
    v42(v34, v6);
    *(_WORD *)(v38 + 22) = 2048;
    double v49 = 43200.0;
    sub_258EA8F40();
    _os_log_impl(&dword_258E57000, v35, (os_log_type_t)v46, "Task %s was run %f seconds ago, which is less than %f seconds ago. The task will not be run again this time.", (uint8_t *)v38, 0x20u);
    uint64_t v43 = v47;
    swift_arrayDestroy();
    MEMORY[0x25A2D36B0](v43, -1, -1);
    MEMORY[0x25A2D36B0](v38, -1, -1);

    v42(v9, v6);
  }
  else
  {

    uint64_t v44 = *(void (**)(char *, uint64_t))(v7 + 8);
    v44(v34, v6);
    v44(v9, v6);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  sub_258E81B50((uint64_t)&v53, &qword_26A0D0368);
  return 0;
}

uint64_t NSUserDefaults.saveComputationDate(_:)(int *a1)
{
  int v1 = *a1;
  char v2 = *((unsigned char *)a1 + 4);
  uint64_t v3 = sub_258EA8A80();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (char *)&v29 - v6;
  sub_258EA8A50();
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_258EA8BB0();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26A0D0790);
  uint64_t v32 = &v29;
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = (char *)&v29 - v6;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)&v29 - v6, (char *)&v29 - v6, v3);
  uint64_t v11 = sub_258EA8B90();
  os_log_type_t v12 = sub_258EA8E80();
  int v13 = v12;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v34 = v3;
    uint64_t v15 = v14;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v36 = v31;
    *(_DWORD *)uint64_t v15 = 136315394;
    LODWORD(v35) = v1;
    BYTE4(v35) = v2;
    int v30 = v13;
    os_log_t v29 = v11;
    uint64_t v16 = SubtaskName.description.getter();
    uint64_t v35 = sub_258E787E0(v16, v17, &v36);
    sub_258EA8F40();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    sub_258E81BAC();
    uint64_t v18 = sub_258EA91D0();
    uint64_t v35 = sub_258E787E0(v18, v19, &v36);
    sub_258EA8F40();
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
    char v21 = v2;
    int v22 = v1;
    v20(v10, v34);
    os_log_t v23 = v29;
    _os_log_impl(&dword_258E57000, v29, (os_log_type_t)v30, "Task %s: Saving Last Computation date %s", (uint8_t *)v15, 0x16u);
    uint64_t v24 = v31;
    swift_arrayDestroy();
    MEMORY[0x25A2D36B0](v24, -1, -1);
    uint64_t v25 = v15;
    uint64_t v3 = v34;
    MEMORY[0x25A2D36B0](v25, -1, -1);
  }
  else
  {
    uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
    char v21 = v2;
    int v22 = v1;
    v20(v10, v3);
  }
  os_log_type_t v26 = (void *)sub_258EA8A00();
  LODWORD(v36) = v22;
  BYTE4(v36) = v21;
  SubtaskName.description.getter();
  uint64_t v27 = (void *)sub_258EA8C30();
  swift_bridgeObjectRelease();
  objc_msgSend(v33, sel_setObject_forKey_, v26, v27);

  return ((uint64_t (*)(char *, uint64_t))v20)(v7, v3);
}

void NSUserDefaults.removeDate(forParameter:)()
{
  SubtaskName.description.getter();
  id v1 = (id)sub_258EA8C30();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_removeObjectForKey_, v1);
}

uint64_t sub_258E7FA84@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v4 = *a1;
  char v5 = *((unsigned char *)a1 + 4);
  LODWORD(v24[0]) = *a1;
  BYTE4(v24[0]) = v5;
  SubtaskName.description.getter();
  unint64_t v6 = (void *)sub_258EA8C30();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v2, sel_objectForKey_, v6);

  if (v7)
  {
    sub_258EA8F70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v24, 0, sizeof(v24));
  }
  sub_258E81A80((uint64_t)v24, (uint64_t)v25);
  sub_258E81AE8((uint64_t)v25, (uint64_t)&v22);
  if (v23)
  {
    sub_258E7D3AC(&v22, v24);
    sub_258E7D470((uint64_t)v24, (uint64_t)&v22);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
    MEMORY[0x270FA5388](v8 - 8);
    uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = sub_258EA8A80();
    int v12 = swift_dynamicCast();
    int v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    if (v12)
    {
      uint64_t v14 = *(void *)(v11 - 8);
      v13(v10, 0, 1, v11);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v11) != 1)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
        sub_258E81B50((uint64_t)v25, &qword_26A0D0368);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v10, v11);
      }
    }
    else
    {
      v13(v10, 1, 1, v11);
    }
    sub_258E81B50((uint64_t)v10, &qword_26A0D0370);
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    sub_258EA9030();
    swift_bridgeObjectRelease();
    *(void *)&long long v22 = 0xD00000000000001CLL;
    *((void *)&v22 + 1) = 0x8000000258EB3360;
    v20[2] = v4;
    char v21 = v5;
    SubtaskName.description.getter();
    sub_258EA8C90();
    swift_bridgeObjectRelease();
    sub_258EA8C90();
    long long v18 = v22;
    sub_258E741E0();
    swift_allocError();
    *(_OWORD *)uint64_t v19 = v18;
    *(unsigned char *)(v19 + 16) = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
  else
  {
    sub_258E81B50((uint64_t)&v22, &qword_26A0D0368);
    *(void *)&v24[0] = 0;
    *((void *)&v24[0] + 1) = 0xE000000000000000;
    sub_258EA9030();
    swift_bridgeObjectRelease();
    *(void *)&v24[0] = 0xD00000000000001ELL;
    *((void *)&v24[0] + 1) = 0x8000000258EB3340;
    LODWORD(v22) = v4;
    BYTE4(v22) = v5;
    SubtaskName.description.getter();
    sub_258EA8C90();
    swift_bridgeObjectRelease();
    sub_258EA8C90();
    long long v16 = v24[0];
    sub_258E741E0();
    swift_allocError();
    *(_OWORD *)uint64_t v17 = v16;
    *(unsigned char *)(v17 + 16) = 1;
    swift_willThrow();
  }
  return sub_258E81B50((uint64_t)v25, &qword_26A0D0368);
}

uint64_t TrialIdentifier.task.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrialIdentifier.treatment.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrialIdentifier.deployment.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall TrialIdentifier.init(task:treatment:deployment:)(PeopleSuggesterLighthouse::TrialIdentifier *__return_ptr retstr, Swift::String task, Swift::String treatment, Swift::String deployment)
{
  retstr->task = task;
  retstr->treatment = treatment;
  retstr->deployment = deployment;
}

void TrialIdentifier.saveAsJSON(at:)()
{
  v69[25] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v6 = v0[4];
  unint64_t v5 = v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0380);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_258EAA340;
  strcpy((char *)(inited + 32), "experimentId");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  uint64_t v8 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 56) = v1;
  *(void *)(inited + 72) = v8;
  *(void *)(inited + 80) = 0x6E656D7461657274;
  *(void *)(inited + 88) = 0xEB00000000644974;
  *(void *)(inited + 96) = v4;
  *(void *)(inited + 104) = v3;
  *(void *)(inited + 120) = v8;
  strcpy((char *)(inited + 128), "deploymentId");
  *(unsigned char *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(void *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0388);
  uint64_t v9 = HIBYTE(v5) & 0xF;
  uint64_t v10 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v5 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v5) & 0xF;
  }
  else {
    uint64_t v11 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (!v11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int v21 = 0;
    LOBYTE(v20) = 1;
    goto LABEL_38;
  }
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
    {
      if ((v6 & 0x1000000000000000) != 0) {
        int v12 = (unsigned __int8 *)((v5 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        int v12 = (unsigned __int8 *)sub_258EA9080();
      }
      int v13 = sub_258E810CC(v12, v10, 10);
      int v14 = (int)v13;
      LOBYTE(v9) = BYTE4(v13) & 1;
      goto LABEL_34;
    }
    v69[0] = (id)v6;
    v69[1] = (id)(v5 & 0xFFFFFFFFFFFFFFLL);
    if (v6 == 43)
    {
      if (v9)
      {
        if (v9 != 1)
        {
          int v14 = (BYTE1(v6) - 48);
          if (v14 <= 9)
          {
            if (v9 == 2) {
              goto LABEL_33;
            }
            if ((BYTE2(v6) - 48) <= 9u)
            {
              int v14 = 10 * v14 + (BYTE2(v6) - 48);
              uint64_t v16 = v9 - 3;
              if (v9 != 3)
              {
                uint64_t v17 = (unsigned __int8 *)v69 + 3;
                while (1)
                {
                  unsigned int v18 = *v17 - 48;
                  if (v18 > 9) {
                    goto LABEL_31;
                  }
                  uint64_t v19 = 10 * v14;
                  if (v19 != (int)v19) {
                    goto LABEL_31;
                  }
                  int v14 = v19 + v18;
                  if (__OFADD__(v19, v18)) {
                    goto LABEL_31;
                  }
                  LOBYTE(v9) = 0;
                  ++v17;
                  if (!--v16) {
                    goto LABEL_34;
                  }
                }
              }
              goto LABEL_33;
            }
          }
          goto LABEL_31;
        }
        goto LABEL_78;
      }
    }
    else
    {
      if (v6 != 45)
      {
        if (v9)
        {
          int v14 = (v6 - 48);
          if (v14 <= 9)
          {
            if (v9 == 1) {
              goto LABEL_33;
            }
            if ((BYTE1(v6) - 48) <= 9u)
            {
              int v14 = 10 * v14 + (BYTE1(v6) - 48);
              uint64_t v60 = v9 - 2;
              if (v9 != 2)
              {
                uint64_t v61 = (unsigned __int8 *)v69 + 2;
                while (1)
                {
                  unsigned int v62 = *v61 - 48;
                  if (v62 > 9) {
                    goto LABEL_31;
                  }
                  uint64_t v63 = 10 * v14;
                  if (v63 != (int)v63) {
                    goto LABEL_31;
                  }
                  int v14 = v63 + v62;
                  if (__OFADD__(v63, v62)) {
                    goto LABEL_31;
                  }
                  LOBYTE(v9) = 0;
                  ++v61;
                  if (!--v60) {
                    goto LABEL_34;
                  }
                }
              }
              goto LABEL_33;
            }
          }
        }
LABEL_31:
        int v14 = 0;
        LOBYTE(v9) = 1;
        goto LABEL_34;
      }
      if (v9)
      {
        if (v9 != 1)
        {
          unsigned int v15 = (BYTE1(v6) - 48);
          if (v15 <= 9)
          {
            if (v9 == 2)
            {
              LOBYTE(v9) = 0;
              int v14 = -v15;
LABEL_34:
              LODWORD(v20) = v9 & 1;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              goto LABEL_35;
            }
            if ((BYTE2(v6) - 48) <= 9u)
            {
              int v14 = -10 * v15 - (BYTE2(v6) - 48);
              uint64_t v64 = v9 - 3;
              if (v9 != 3)
              {
                BOOL v65 = (unsigned __int8 *)v69 + 3;
                while (1)
                {
                  unsigned int v66 = *v65 - 48;
                  if (v66 > 9) {
                    goto LABEL_31;
                  }
                  uint64_t v67 = 10 * v14;
                  if (v67 != (int)v67) {
                    goto LABEL_31;
                  }
                  int v14 = v67 - v66;
                  if (__OFSUB__(v67, v66)) {
                    goto LABEL_31;
                  }
                  LOBYTE(v9) = 0;
                  ++v65;
                  if (!--v64) {
                    goto LABEL_34;
                  }
                }
              }
LABEL_33:
              LOBYTE(v9) = 0;
              goto LABEL_34;
            }
          }
          goto LABEL_31;
        }
LABEL_78:
        int v14 = 0;
        goto LABEL_34;
      }
      __break(1u);
    }
    __break(1u);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v68 = sub_258E80FE4(v6, v5, 10);
  swift_bridgeObjectRelease();
  uint64_t v20 = HIDWORD(v68) & 1;
  int v14 = v68;
LABEL_35:
  if (v20) {
    int v21 = 0;
  }
  else {
    int v21 = v14;
  }
LABEL_38:
  *(_DWORD *)(inited + 144) = v21;
  *(unsigned char *)(inited + 148) = v20;
  sub_258E756C0(inited);
  long long v22 = self;
  uint64_t v23 = (void *)sub_258EA8BE0();
  swift_bridgeObjectRelease();
  v69[0] = 0;
  id v24 = objc_msgSend(v22, sel_dataWithJSONObject_options_error_, v23, 1, v69);

  id v25 = v69[0];
  if (v24)
  {
    uint64_t v26 = sub_258EA8960();
    unint64_t v28 = v27;

    id v29 = objc_msgSend(self, sel_defaultManager);
    sub_258EA8940();
    int v30 = (void *)sub_258EA8C30();
    swift_bridgeObjectRelease();
    unsigned __int8 v31 = objc_msgSend(v29, sel_fileExistsAtPath_, v30);

    if ((v31 & 1) == 0)
    {
LABEL_42:
      sub_258EA8970();
      if (qword_26A0D01F0 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_258EA8BB0();
      __swift_project_value_buffer(v35, (uint64_t)qword_26A0D0790);
      uint64_t v36 = sub_258EA8B90();
      os_log_type_t v37 = sub_258EA8E70();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_258E57000, v36, v37, "Saved Trial information successfully", v38, 2u);
        MEMORY[0x25A2D36B0](v38, -1, -1);
      }

      sub_258E81BF8(v26, v28);
      goto LABEL_58;
    }
    uint64_t v32 = (void *)sub_258EA8910();
    v69[0] = 0;
    unsigned int v33 = objc_msgSend(v29, sel_removeItemAtURL_error_, v32, v69);

    if (v33)
    {
      id v34 = v69[0];
      goto LABEL_42;
    }
    id v50 = v69[0];
    uint64_t v51 = (void *)sub_258EA88E0();

    swift_willThrow();
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_258EA8BB0();
    __swift_project_value_buffer(v52, (uint64_t)qword_26A0D0790);
    id v53 = v51;
    id v54 = v51;
    uint64_t v36 = sub_258EA8B90();
    os_log_type_t v55 = sub_258EA8E90();
    if (os_log_type_enabled(v36, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 138412290;
      id v58 = v51;
      uint64_t v59 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v69[0] = v59;
      sub_258EA8F40();
      *uint64_t v57 = v59;

      _os_log_impl(&dword_258E57000, v36, v55, "Error writing JSON data to file: %@", v56, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0530);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v57, -1, -1);
      MEMORY[0x25A2D36B0](v56, -1, -1);
      sub_258E81BF8(v26, v28);

      return;
    }
    sub_258E81BF8(v26, v28);

    double v49 = v51;
  }
  else
  {
    uint64_t v39 = v25;
    unint64_t v40 = (void *)sub_258EA88E0();

    swift_willThrow();
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_258EA8BB0();
    __swift_project_value_buffer(v41, (uint64_t)qword_26A0D0790);
    id v42 = v40;
    id v43 = v40;
    uint64_t v36 = sub_258EA8B90();
    os_log_type_t v44 = sub_258EA8E90();
    if (os_log_type_enabled(v36, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      int v46 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 138412290;
      id v47 = v40;
      BOOL v48 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v69[0] = v48;
      sub_258EA8F40();
      *int v46 = v48;

      _os_log_impl(&dword_258E57000, v36, v44, "Error converting dictionary to JSON data: %@", v45, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0530);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v46, -1, -1);
      MEMORY[0x25A2D36B0](v45, -1, -1);

      return;
    }

    double v49 = v40;
  }

LABEL_58:
}

Swift::Void __swiftcall TrialIdentifier.saveToUserDefaults()()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0390);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_258EAA340;
  *(void *)(inited + 32) = 1802723700;
  *(void *)(inited + 40) = 0xE400000000000000;
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 56) = v1;
  *(void *)(inited + 64) = 0x6E656D7461657274;
  *(void *)(inited + 72) = 0xE900000000000074;
  *(void *)(inited + 80) = v4;
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 96) = 0x656D796F6C706564;
  *(void *)(inited + 104) = 0xEA0000000000746ELL;
  *(void *)(inited + 112) = v6;
  *(void *)(inited + 120) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_258E75390(inited);
  if (qword_26A0D01E8 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)qword_26A0D0360;
  uint64_t v9 = (void *)sub_258EA8BE0();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_258EA8C30();
  objc_msgSend(v8, sel_setObject_forKey_, v9, v10);
}

double static TrialIdentifier.loadFromUserDefaults()@<D0>(void *a1@<X8>)
{
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_258EA8BB0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A0D0790);
  uint64_t v3 = sub_258EA8B90();
  os_log_type_t v4 = sub_258EA8E80();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_258E57000, v3, v4, "Loading Trial identifier from user defaults", v5, 2u);
    MEMORY[0x25A2D36B0](v5, -1, -1);
  }

  if (qword_26A0D01E8 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_26A0D0360;
  id v7 = (void *)sub_258EA8C30();
  id v8 = objc_msgSend(v6, sel_objectForKey_, v7);

  if (v8)
  {
    sub_258EA8F70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v36, 0, sizeof(v36));
  }
  sub_258E81A80((uint64_t)v36, (uint64_t)v37);
  if (v37[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0398);
    if (swift_dynamicCast())
    {
      if (*(void *)(v35 + 16))
      {
        unint64_t v9 = sub_258E78DD0(1802723700, 0xE400000000000000);
        if (v10)
        {
          if (*(void *)(v35 + 16))
          {
            uint64_t v11 = (uint64_t *)(*(void *)(v35 + 56) + 16 * v9);
            uint64_t v13 = *v11;
            uint64_t v12 = v11[1];
            swift_bridgeObjectRetain();
            unint64_t v14 = sub_258E78DD0(0x6E656D7461657274, 0xE900000000000074);
            if ((v15 & 1) != 0 && *(void *)(v35 + 16))
            {
              uint64_t v16 = (uint64_t *)(*(void *)(v35 + 56) + 16 * v14);
              uint64_t v18 = *v16;
              uint64_t v17 = v16[1];
              swift_bridgeObjectRetain();
              unint64_t v19 = sub_258E78DD0(0x656D796F6C706564, 0xEA0000000000746ELL);
              if (v20)
              {
                int v21 = (uint64_t *)(*(void *)(v35 + 56) + 16 * v19);
                uint64_t v23 = *v21;
                uint64_t v22 = v21[1];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                *a1 = v13;
                a1[1] = v12;
                a1[2] = v18;
                a1[3] = v17;
                a1[4] = v23;
                a1[5] = v22;
                return result;
              }
              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      swift_bridgeObjectRetain();
      id v25 = sub_258EA8B90();
      os_log_type_t v30 = sub_258EA8E90();
      if (!os_log_type_enabled(v25, v30))
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_27;
      }
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      v37[0] = v31;
      *(_DWORD *)unint64_t v27 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_258EA8C00();
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      *(void *)&v36[0] = sub_258E787E0(v32, v34, v37);
      sub_258EA8F40();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_258E57000, v25, v30, "Missing fields in stored dictionary %s", v27, 0xCu);
      swift_arrayDestroy();
      uint64_t v29 = v31;
      goto LABEL_25;
    }
  }
  else
  {
    sub_258E81B50((uint64_t)v37, &qword_26A0D0368);
  }
  id v25 = sub_258EA8B90();
  os_log_type_t v26 = sub_258EA8E90();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v37[0] = v28;
    *(_DWORD *)unint64_t v27 = 136315138;
    *(void *)&v36[0] = sub_258E787E0(0x6564496C61697274, 0xEF7265696669746ELL, v37);
    sub_258EA8F40();
    _os_log_impl(&dword_258E57000, v25, v26, "No object for key %s in user defaults", v27, 0xCu);
    swift_arrayDestroy();
    uint64_t v29 = v28;
LABEL_25:
    MEMORY[0x25A2D36B0](v29, -1, -1);
    MEMORY[0x25A2D36B0](v27, -1, -1);
  }

LABEL_27:
  double result = 0.0;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

void *sub_258E80F00(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02E0);
  os_log_type_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_258E80F68(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_258EA8CF0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x25A2D29F0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_258E80FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_258EA8D00();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_258E8134C();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_258EA9080();
  }
LABEL_7:
  uint64_t v11 = sub_258E810CC(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_258E810CC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          char v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            uint64_t v23 = (int)v8 * (uint64_t)(int)a3;
            if (v23 != (int)v23) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__OFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            uint64_t v31 = (int)v28 * (uint64_t)(int)a3;
            if (v31 != (int)v31) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__OFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            uint64_t v14 = (int)v8 * (uint64_t)(int)a3;
            if (v14 != (int)v14) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (__OFSUB__(v14, v15)) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_258E8134C()
{
  unint64_t v0 = sub_258EA8D10();
  uint64_t v4 = sub_258E813CC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_258E813CC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_258E81524(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_258E80F00(v9, 0);
      unint64_t v12 = sub_258E81624((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_258EA9080();
LABEL_4:
        JUMPOUT(0x25A2D29A0);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x25A2D29A0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x25A2D29A0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_258E81524(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_258E80F68(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_258E80F68(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_258E81624(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    double result = v12;
    if (v17 == v15) {
      double result = sub_258E80F68(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      double result = sub_258EA8CE0();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        double result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          double result = sub_258EA9080();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    double result = sub_258E80F68(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_258EA8CB0();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _s25PeopleSuggesterLighthouse15TrialIdentifierV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  if (*a1 == *a2 && a1[1] == a2[1] || (char v10 = sub_258EA91E0(), result = 0, (v10 & 1) != 0))
  {
    if (v2 == v6 && v4 == v7 || (char v12 = sub_258EA91E0(), result = 0, (v12 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
      {
        return 1;
      }
      else
      {
        return sub_258EA91E0();
      }
    }
  }
  return result;
}

uint64_t _s25PeopleSuggesterLighthouse16ComputationStateO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5) {
        goto LABEL_13;
      }
      unint64_t v3 = 0;
      char v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1) {
        goto LABEL_13;
      }
      unint64_t v3 = 1;
      char v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2) {
        goto LABEL_13;
      }
      char v6 = 1;
      unint64_t v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3) {
        goto LABEL_13;
      }
      char v6 = 1;
      unint64_t v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4) {
        goto LABEL_13;
      }
      char v6 = 1;
      unint64_t v3 = 4;
      break;
    default:
      if (v5 >= 5)
      {
        if (v2 == v4 && v3 == v5) {
          char v6 = 1;
        }
        else {
          char v6 = sub_258EA91E0();
        }
      }
      else
      {
LABEL_13:
        char v6 = 0;
      }
      sub_258E821AC(v4, v5);
      sub_258E821AC(v2, v3);
      break;
  }
  sub_258E821C0(v2, v3);
  sub_258E821C0(v4, v5);
  return v6 & 1;
}

uint64_t sub_258E81A80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_258E81AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_258E81B50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_258E81BAC()
{
  unint64_t result = qword_26A0D0378;
  if (!qword_26A0D0378)
  {
    sub_258EA8A80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0378);
  }
  return result;
}

uint64_t sub_258E81BF8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SubtaskName(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SubtaskName(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_258E81CB4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_258E81CD4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SubtaskName()
{
  return &type metadata for SubtaskName;
}

unint64_t destroy for ComputationState(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s25PeopleSuggesterLighthouse16ComputationStateOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for ComputationState(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ComputationState(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComputationState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFFA && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483643);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 4;
  if (v4 >= 6) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ComputationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFB) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 4;
    }
  }
  return result;
}

uint64_t sub_258E81F28(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_258E81F40(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ComputationState()
{
  return &type metadata for ComputationState;
}

uint64_t destroy for TrialIdentifier()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TrialIdentifier(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TrialIdentifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for TrialIdentifier(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialIdentifier()
{
  return &type metadata for TrialIdentifier;
}

uint64_t sub_258E821AC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 5) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_258E821C0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 5) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_258E821D4()
{
  id v1 = objc_msgSend(v0, sel_domainIdentifier);
  if (v1)
  {

    id v2 = objc_msgSend(v0, sel_domainIdentifier);
  }
  else
  {
    id v3 = objc_msgSend(v0, sel_derivedIntentIdentifier);
    if (!v3) {
      return 0;
    }

    id v2 = objc_msgSend(v0, sel_derivedIntentIdentifier);
  }
  id v4 = v2;
  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_258EA8C50();

  return v5;
}

id sub_258E82290(uint64_t a1, unint64_t a2)
{
  v17[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_258EA8D30();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = (void *)v5;
  v17[0] = 0;
  id v7 = objc_msgSend(v2, sel_lh_queryInteractionsUsingPredicate_sortDescriptors_limit_error_, a1, v5, a2, v17);

  id v8 = v17[0];
  if (!v7)
  {
    id v14 = v17[0];
    sub_258EA88E0();

    goto LABEL_11;
  }
  a1 = sub_258EA8D40();
  id v9 = v8;

  if (*(void *)(a1 + 16) == a2)
  {
    if (qword_26A0D01F0 == -1)
    {
LABEL_5:
      uint64_t v10 = sub_258EA8BB0();
      __swift_project_value_buffer(v10, (uint64_t)qword_26A0D0790);
      uint64_t v11 = sub_258EA8B90();
      os_log_type_t v12 = sub_258EA8E80();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 134217984;
        v17[0] = (id)a2;
        sub_258EA8F40();
        _os_log_impl(&dword_258E57000, v11, v12, "interactionsFetchLimit=%lu reached while loading interactions from the store", v13, 0xCu);
        MEMORY[0x25A2D36B0](v13, -1, -1);
      }

      goto LABEL_8;
    }
LABEL_14:
    swift_once();
    goto LABEL_5;
  }
LABEL_8:
  id v14 = (id)sub_258E824EC(a1);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    sub_258E741E0();
    swift_allocError();
    *(void *)uint64_t v15 = 0xD00000000000002ALL;
    *(void *)(v15 + 8) = 0x8000000258EB33A0;
    *(unsigned char *)(v15 + 16) = 1;
LABEL_11:
    swift_willThrow();
  }
  return v14;
}

uint64_t sub_258E824EC(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_258EA90B0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_258E7D470(i, (uint64_t)v5);
    sub_258E7451C(0, &qword_26A0D05C0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_258EA9090();
    sub_258EA90C0();
    sub_258EA90D0();
    sub_258EA90A0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_258E82608()
{
  id v1 = objc_msgSend(v0, sel_sender);

  id v2 = objc_msgSend(v0, sel_recipients);
  id v3 = v2;
  if (v1)
  {
    if (v2)
    {
      sub_258E7451C(0, &qword_26A0D0248);
      unint64_t v4 = sub_258EA8D40();
    }
    else
    {
      unint64_t v4 = MEMORY[0x263F8EE78];
    }
    uint64_t v5 = sub_258EA4610(v4);
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v0, sel_sender);
    swift_bridgeObjectRetain();
    id v7 = v6;
    MEMORY[0x25A2D2A50]();
    if (*(void *)(v5 + 16) >= *(void *)(v5 + 24) >> 1) {
      sub_258EA8D70();
    }
    sub_258EA8D90();
    sub_258EA8D60();
    swift_bridgeObjectRelease();

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03C0);
    sub_258E841A4(&qword_26A0D03C8, &qword_26A0D03C0);
    sub_258EA8DA0();
  }
  else
  {
    if (v2)
    {
      sub_258E7451C(0, &qword_26A0D0248);
      sub_258EA8D40();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0228);
    sub_258E841A4((unint64_t *)&qword_26A0D0230, &qword_26A0D0238);
    sub_258EA8F30();
  }
  swift_bridgeObjectRelease();
  return sub_258EA91D0();
}

id sub_258E8284C()
{
  id result = objc_msgSend(v0, sel_attachments);
  if (result)
  {

    id result = objc_msgSend(v0, sel_attachments);
    if (!result)
    {
LABEL_23:
      __break(1u);
      return result;
    }
    id v2 = result;
    sub_258E7451C(0, (unint64_t *)&qword_26A0D03D0);
    unint64_t v3 = sub_258EA8D40();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_258EA9150();
      uint64_t v4 = (uint64_t)result;
      if (result) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (v4)
      {
LABEL_5:
        if (v4 >= 1)
        {
          uint64_t v5 = 0;
          id v6 = (void *)MEMORY[0x263F8EE78];
          do
          {
            if ((v3 & 0xC000000000000001) != 0) {
              id v7 = (id)MEMORY[0x25A2D2D90](v5, v3);
            }
            else {
              id v7 = *(id *)(v3 + 8 * v5 + 32);
            }
            id v8 = v7;
            id v9 = objc_msgSend(v7, sel_photoSceneDescriptor);
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = sub_258EA8C50();
              uint64_t v13 = v12;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                id v6 = sub_258E9C9D8(0, v6[2] + 1, 1, v6);
              }
              unint64_t v15 = v6[2];
              unint64_t v14 = v6[3];
              if (v15 >= v14 >> 1) {
                id v6 = sub_258E9C9D8((void *)(v14 > 1), v15 + 1, 1, v6);
              }
              v6[2] = v15 + 1;
              uint64_t v16 = &v6[2 * v15];
              v16[4] = v11;
              v16[5] = v13;
            }
            else
            {
            }
            ++v5;
          }
          while (v4 != v5);
          goto LABEL_21;
        }
        __break(1u);
        goto LABEL_23;
      }
    }
    id v6 = (void *)MEMORY[0x263F8EE78];
LABEL_21:
    swift_bridgeObjectRelease_n();
    sub_258E9FB00((uint64_t)v6);
    swift_bridgeObjectRelease();
    sub_258EA8E40();
    swift_bridgeObjectRelease();
    return (id)sub_258EA91D0();
  }
  return result;
}

uint64_t sub_258E82A9C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 9; ; ++i)
  {
    uint64_t v4 = i - 7;
    if (__OFADD__(i - 8, 1)) {
      break;
    }
    BOOL v6 = *(_DWORD *)(a2 + 4 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_258E82B00(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_258E82D2C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_258E82B20(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_258E82E8C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_258E82B40(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_258E82FEC(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_258E82B60(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_258E83178(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_258E82B80(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_258E832E8(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_258E82BA0(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0348);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0350);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E82D2C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03A8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E82E8C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03D8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E82FEC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03B0);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03B8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E83178(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D05D0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E832E8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0510);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

id sub_258E83454(void *a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(unsigned __int8 *)(a2 + 58);
  id result = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeatureValue), sel_init);
  if (result)
  {
    int64_t v7 = result;
    if (objc_msgSend(a1, sel_hasBoolValue))
    {
      objc_msgSend(v7, sel_setBoolValue_, objc_msgSend(a1, sel_BOOLValue));
      unint64_t v8 = 1;
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (objc_msgSend(a1, sel_hasIntValue))
    {
      objc_msgSend(v7, sel_setIntValue_, sub_258EA1A78((uint64_t)objc_msgSend(a1, sel_intValue), v5));
      ++v8;
    }
    if (objc_msgSend(a1, sel_hasDoubleValue))
    {
      objc_msgSend(a1, sel_doubleValue);
      double v10 = v9;
      if ((objc_msgSend(self, sel_isInternalDevice) & v5) == 1) {
        double v10 = round(v10 * 1000.0) / 1000.0;
      }
      objc_msgSend(v7, sel_setDoubleValue_, v10);
      ++v8;
    }
    id v11 = objc_msgSend(a1, sel_stringValue);
    if (v11)
    {

      id v12 = objc_msgSend(a1, sel_stringValue);
      objc_msgSend(v7, sel_setStringValue_, v12);

      ++v8;
    }
    if (objc_msgSend(a1, sel_timeBucketValue))
    {
      objc_msgSend(v7, sel_setTimeBucketValue_, objc_msgSend(a1, sel_timeBucketValue));
      ++v8;
    }
    else if (!v8)
    {
      uint64_t v24 = MEMORY[0x263F8EE78];
      sub_258E82B00(0, 18, 0);
      unint64_t v18 = *(void *)(v24 + 16);
      uint64_t v19 = 0x20u;
      do
      {
        int v20 = *(_DWORD *)((char *)&unk_2706ECC48 + v19);
        unint64_t v21 = *(void *)(v24 + 24);
        if (v18 >= v21 >> 1) {
          sub_258E82B00(v21 > 1, v18 + 1, 1);
        }
        *(void *)(v24 + 16) = v18 + 1;
        *(_DWORD *)(v24 + 4 * v18 + 32) = v20;
        v19 += 4;
        ++v18;
      }
      while (v19 != 104);
      char v22 = sub_258E82A9C(a3, v24);
      swift_release();
      if (v22) {
        return v7;
      }
      if (qword_26A0D01F0 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_258EA8BB0();
      __swift_project_value_buffer(v23, (uint64_t)qword_26A0D0790);
      unint64_t v14 = sub_258EA8B90();
      os_log_type_t v15 = sub_258EA8EA0();
      if (!os_log_type_enabled(v14, v15)) {
        goto LABEL_22;
      }
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 67109120;
      sub_258EA8F40();
      unint64_t v17 = "All nil values found for feature %d";
      goto LABEL_21;
    }
    if (v8 < 2) {
      return v7;
    }
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_258EA8BB0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A0D0790);
    unint64_t v14 = sub_258EA8B90();
    os_log_type_t v15 = sub_258EA8EA0();
    if (!os_log_type_enabled(v14, v15))
    {
LABEL_22:

      return v7;
    }
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 67109120;
    sub_258EA8F40();
    unint64_t v17 = "Duplicate values found for feature %d";
LABEL_21:
    _os_log_impl(&dword_258E57000, v14, v15, v17, v16, 8u);
    MEMORY[0x25A2D36B0](v16, -1, -1);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_258E838B8()
{
  return 0;
}

void sub_258E83990(void **a1, const void *a2, void *a3)
{
  unint64_t v6 = *a1;
  id v7 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeature), sel_init);
  if (!v7)
  {
    sub_258E741E0();
    swift_allocError();
    *(void *)uint64_t v16 = 0xD00000000000002ALL;
    *(void *)(v16 + 8) = 0x8000000258EB3410;
    *(unsigned char *)(v16 + 16) = 1;
    swift_willThrow();
    return;
  }
  unint64_t v8 = v7;
  id v9 = objc_msgSend(v6, sel_featureName);
  objc_msgSend(v8, sel_setFeatureName_, v9);
  objc_msgSend(v8, sel_setFeatureItselfVersion_, objc_msgSend(v6, sel_featureItselfVersion));
  objc_msgSend(v8, sel_setFeatureFreshnessInHours_, objc_msgSend(v6, sel_featureFreshnessInHours));
  objc_msgSend(v8, sel_setEventVolumeToComputeFeature_, objc_msgSend(v6, sel_eventVolumeToComputeFeature));
  objc_msgSend(v8, sel_setTimeSpentToComputeFeature_, objc_msgSend(v6, sel_timeSpentToComputeFeature));
  id v10 = objc_msgSend(v6, sel_featureValue);
  if (!v10)
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_258EA8BB0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26A0D0790);
    id v11 = v6;
    unint64_t v18 = sub_258EA8B90();
    os_log_type_t v19 = sub_258EA8E90();
    if (os_log_type_enabled(v18, v19))
    {
      int v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)int v20 = 136315138;
      __dst[0] = v21;
      objc_msgSend(v11, sel_featureName);
      uint64_t v22 = sub_258E838B8();
      uint64_t v33 = sub_258E787E0(v22, v23, __dst);
      sub_258EA8F40();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_258E57000, v18, v19, "Missing feature value in biome event for %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v21, -1, -1);
      MEMORY[0x25A2D36B0](v20, -1, -1);

      return;
    }

    goto LABEL_13;
  }
  id v11 = v10;
  memcpy(__dst, a2, 0x158uLL);
  id v12 = sub_258E83454(v11, (uint64_t)__dst, (uint64_t)v9);
  if (v3)
  {
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v13 = v12;
  if (!v12)
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_258EA8BB0();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A0D0790);
    id v25 = v6;
    uint64_t v26 = sub_258EA8B90();
    os_log_type_t v27 = sub_258EA8E90();
    if (os_log_type_enabled(v26, v27))
    {
      unsigned int v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      __dst[0] = v31;
      *(_DWORD *)unsigned int v28 = 136315138;
      objc_msgSend(v25, sel_featureName);
      uint64_t v29 = sub_258E838B8();
      uint64_t v33 = sub_258E787E0(v29, v30, __dst);
      sub_258EA8F40();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_258E57000, v26, v27, "Missing feature value for %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v31, -1, -1);
      MEMORY[0x25A2D36B0](v28, -1, -1);

      return;
    }

LABEL_14:
    return;
  }
  objc_msgSend(v8, sel_setFeatureValue_, v12);
  id v14 = objc_msgSend(a3, sel_featureVectors);
  if (v14)
  {
    os_log_type_t v15 = v14;
    objc_msgSend(v14, sel_addObject_, v8);
  }
  else
  {
    __break(1u);
  }
}

id sub_258E83EC0(void *a1, const void *a2)
{
  memcpy(__dst, a2, sizeof(__dst));
  id v4 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataMLSEVirtualFeatureStore), sel_init);
  if (v4)
  {
    objc_msgSend(v4, sel_setFeatureVersion_, objc_msgSend(a1, sel_featureVersion));
    id v5 = objc_msgSend(a1, sel_deviceIdentifier);
    if (v5)
    {
      unint64_t v6 = v5;
      objc_msgSend(v4, sel_setDeviceIdentifier_, v5);
    }
    sub_258E7451C(0, &qword_26A0D0550);
    id v7 = (void *)MEMORY[0x25A2D2C20](MEMORY[0x263F8EE78]);
    objc_msgSend(v4, sel_setFeatureVectors_, v7);

    id v8 = objc_msgSend(a1, sel_featureVector);
    sub_258E7451C(0, &qword_26A0D03A0);
    unint64_t v9 = sub_258EA8D40();

    if (v9 >> 62) {
      goto LABEL_18;
    }
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v10; uint64_t v10 = sub_258EA9150())
    {
      uint64_t v11 = 4;
      while (1)
      {
        id v12 = (v9 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x25A2D2D90](v11 - 4, v9)
            : *(id *)(v9 + 8 * v11);
        uint64_t v13 = v12;
        uint64_t v14 = v11 - 3;
        if (__OFADD__(v11 - 4, 1)) {
          break;
        }
        unint64_t v18 = v12;
        sub_258E83990(&v18, __dst, v4);
        if (v2)
        {

          swift_bridgeObjectRelease_n();
          return v4;
        }

        ++v11;
        if (v14 == v10) {
          goto LABEL_13;
        }
      }
      __break(1u);
LABEL_18:
      swift_bridgeObjectRetain();
    }
LABEL_13:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_258E741E0();
    swift_allocError();
    *(void *)uint64_t v15 = 0xD000000000000031;
    *(void *)(v15 + 8) = 0x8000000258EB33D0;
    *(unsigned char *)(v15 + 16) = 1;
    swift_willThrow();
  }
  return v4;
}

unint64_t sub_258E84148()
{
  unint64_t result = qword_26A0D0240;
  if (!qword_26A0D0240)
  {
    sub_258E7451C(255, &qword_26A0D0248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0240);
  }
  return result;
}

uint64_t sub_258E841A4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_258E84148();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_258E84208(char a1)
{
  unint64_t result = 0xD000000000000021;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0xD000000000000030;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0xD000000000000029;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 7:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0x65646F4D65736162;
      break;
    case 11:
      unint64_t result = 0x676E696E7261656CLL;
      break;
    case 12:
      unint64_t result = 0x7373616C436D756ELL;
      break;
    case 13:
      unint64_t result = 0x73656572546D756ELL;
      break;
    case 14:
      unint64_t result = 0x687470654478616DLL;
      break;
    case 15:
      unint64_t result = 0x646C6968436E696DLL;
      break;
    case 16:
      unint64_t result = 0x76697463656A626FLL;
      break;
    case 17:
      unint64_t result = 0x4E65727574616566;
      break;
    case 18:
      unint64_t result = 0x6365567475706E69;
      break;
    case 19:
      unint64_t result = 0x6C6562614C637273;
      break;
    case 20:
      unint64_t result = 0x6562614C74736564;
      break;
    case 21:
      unint64_t result = 0xD000000000000022;
      break;
    case 22:
      unint64_t result = 0x7265506E69617274;
      break;
    case 23:
      unint64_t result = 0x7A69536863746162;
      break;
    case 24:
      unint64_t result = 0xD000000000000010;
      break;
    case 25:
      unint64_t result = 0xD000000000000027;
      break;
    case 26:
      unint64_t result = 0xD000000000000026;
      break;
    case 27:
      unint64_t result = 0xD000000000000026;
      break;
    case 28:
      unint64_t result = 0xD00000000000003DLL;
      break;
    default:
      return result;
  }
  return result;
}

id ConfigManager.streamDurableFeatureStore.getter()
{
  return *(id *)(v0 + 32);
}

id ConfigManager.streamVirtualFeatureStore.getter()
{
  return *(id *)(v0 + 40);
}

uint64_t ConfigManager.shouldHarvestData.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t ConfigManager.shouldSendMetrics.getter()
{
  return *(unsigned __int8 *)(v0 + 57);
}

uint64_t ConfigManager.shouldAttemptLocalTraining.getter()
{
  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t ConfigManager.shouldAttemptModelMonitoring.getter()
{
  return *(unsigned __int8 *)(v0 + 73);
}

uint64_t ConfigManager.shouldAttemptShadowEvaluation.getter()
{
  return *(unsigned __int8 *)(v0 + 74);
}

void *ConfigManager.init(recipe:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id v4 = self;
  id v5 = objc_msgSend(v4, sel_lh_defaultDatabaseDirectory);
  if (!v5)
  {
    sub_258EA8C50();
    id v5 = (id)sub_258EA8C30();
    swift_bridgeObjectRelease();
  }
  id v6 = objc_msgSend(v4, sel_lh_storeWithDirectory_readOnly_, v5, 1);

  sub_258E84650(a1, v6, (uint64_t)__src);
  return memcpy(a2, __src, 0x158uLL);
}

uint64_t sub_258E84650@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = qword_26A0D01E0;
  id v145 = a2;
  if (v4 != -1) {
    goto LABEL_65;
  }
  while (1)
  {
    uint64_t v5 = qword_26A0D0788;
    int64_t v6 = *(void *)(qword_26A0D0788 + 16);
    uint64_t v7 = MEMORY[0x263F8EE78];
    if (v6)
    {
      uint64_t v147 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_258E82B00(0, v6, 0);
      uint64_t v8 = 0;
      uint64_t v7 = v147;
      unint64_t v9 = *(void *)(v147 + 16);
      do
      {
        int v10 = *(_DWORD *)(v5 + 4 * v8 + 32);
        unint64_t v11 = *(void *)(v147 + 24);
        if (v9 >= v11 >> 1) {
          sub_258E82B00(v11 > 1, v9 + 1, 1);
        }
        ++v8;
        *(void *)(v147 + 16) = v9 + 1;
        *(_DWORD *)(v147 + 4 * v9++ + 32) = v10;
      }
      while (v6 != v8);
      swift_bridgeObjectRelease();
    }
    uint64_t v12 = sub_258E85B1C(a1, 0, v7);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v12 + 16);
    if (v13)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = 0;
      uint64_t v15 = (char *)MEMORY[0x263F8EE78];
      do
      {
        int v16 = *(_DWORD *)(v12 + 4 * v14 + 32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v15 = sub_258E9CAE8(0, *((void *)v15 + 2) + 1, 1, v15);
        }
        unint64_t v18 = *((void *)v15 + 2);
        unint64_t v17 = *((void *)v15 + 3);
        if (v18 >= v17 >> 1) {
          uint64_t v15 = sub_258E9CAE8((char *)(v17 > 1), v18 + 1, 1, v15);
        }
        ++v14;
        *((void *)v15 + 2) = v18 + 1;
        *(_DWORD *)&v15[4 * v18 + 32] = v16;
      }
      while (v13 != v14);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = (char *)MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    uint64_t v19 = *((void *)v15 + 2);
    if (!v19) {
      break;
    }
    unint64_t v20 = 0;
    uint64_t v21 = qword_26A0D0788;
    uint64_t v22 = MEMORY[0x263F8EE78];
    while (1)
    {
      if (v20 >= *((void *)v15 + 2))
      {
        __break(1u);
        goto LABEL_64;
      }
      uint64_t v25 = *(void *)(v21 + 16);
      if (v25)
      {
        int v26 = *(_DWORD *)&v15[4 * v20 + 32];
        if (*(_DWORD *)(v21 + 32) == v26) {
          goto LABEL_28;
        }
        if (v25 != 1)
        {
          if (*(_DWORD *)(v21 + 36) == v26)
          {
LABEL_28:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              sub_258E82B20(0, *(void *)(v22 + 16) + 1, 1);
            }
            unint64_t v24 = *(void *)(v22 + 16);
            unint64_t v23 = *(void *)(v22 + 24);
            if (v24 >= v23 >> 1) {
              sub_258E82B20(v23 > 1, v24 + 1, 1);
            }
            *(void *)(v22 + 16) = v24 + 1;
            *(_DWORD *)(v22 + 4 * v24 + 32) = v26;
            goto LABEL_22;
          }
          if (v25 != 2) {
            break;
          }
        }
      }
LABEL_22:
      if (++v20 == v19)
      {
        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
    }
    uint64_t v27 = 10;
    while (1)
    {
      uint64_t v28 = v27 - 7;
      if (__OFADD__(v27 - 8, 1)) {
        break;
      }
      if (*(_DWORD *)(v21 + 4 * v27) == v26) {
        goto LABEL_28;
      }
      ++v27;
      if (v28 == v25) {
        goto LABEL_22;
      }
    }
LABEL_64:
    __break(1u);
LABEL_65:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v22 = MEMORY[0x263F8EE78];
LABEL_38:
  id v29 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v30 = objc_msgSend(v29, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v144 = objc_msgSend(v30, sel_DurableFeatureStore);
  swift_unknownObjectRelease();
  id v31 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v32 = objc_msgSend(v31, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v143 = objc_msgSend(v32, sel_VirtualFeatureStore);
  swift_unknownObjectRelease();
  id v33 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v34 = objc_msgSend(v33, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v142 = objc_msgSend(v34, sel_Feedback);
  swift_unknownObjectRelease();
  char v141 = sub_258E85FB8(a1, 1, 1);
  char v140 = sub_258E85FB8(a1, 2, 1);
  char v139 = sub_258E85FB8(a1, 3, 1);
  uint64_t v138 = sub_258E86394(a1, 4, 10000);
  uint64_t v137 = sub_258E86394(a1, 5, 200);
  char v136 = sub_258E85FB8(a1, 6, 0);
  char v135 = sub_258E85FB8(a1, 7, 0);
  char v134 = sub_258E85FB8(a1, 8, 0);
  uint64_t v35 = sub_258E86754(a1, 9, 0xD000000000000024, 0x8000000258EB3440);
  uint64_t v132 = v36;
  uint64_t v133 = v35;
  uint64_t v37 = sub_258E86754(a1, 10, 0xD00000000000005DLL, 0x8000000258EB3470);
  uint64_t v130 = v38;
  uint64_t v131 = v37;
  uint64_t v129 = sub_258E86754(a1, 11, 825241136, 0xE400000000000000);
  uint64_t v126 = v39;
  uint64_t v40 = sub_258E86754(a1, 12, 49, 0xE100000000000000);
  uint64_t v122 = v41;
  uint64_t v123 = v40;
  uint64_t v42 = sub_258E86754(a1, 13, 12341, 0xE200000000000000);
  uint64_t v127 = v43;
  uint64_t v128 = v42;
  uint64_t v44 = sub_258E86754(a1, 14, 55, 0xE100000000000000);
  uint64_t v124 = v45;
  uint64_t v125 = v44;
  uint64_t v46 = sub_258E86754(a1, 15, 49, 0xE100000000000000);
  uint64_t v120 = v47;
  uint64_t v121 = v46;
  uint64_t v48 = sub_258E86754(a1, 16, 0x6C3A7972616E6962, 0xEF6369747369676FLL);
  uint64_t v118 = v49;
  uint64_t v119 = v48;
  uint64_t v50 = sub_258E86754(a1, 18, 0x726F74636576, 0xE600000000000000);
  uint64_t v116 = v51;
  uint64_t v117 = v50;
  uint64_t v52 = sub_258E86754(a1, 19, 0xD000000000000012, 0x8000000258EB34D0);
  uint64_t v114 = v53;
  uint64_t v115 = v52;
  uint64_t v54 = sub_258E86754(a1, 20, 0xD000000000000011, 0x8000000258EB34F0);
  uint64_t v112 = v55;
  uint64_t v113 = v54;
  uint64_t v56 = sub_258E9C9D8(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v58 = v56[2];
  unint64_t v57 = v56[3];
  int64_t v59 = v57 >> 1;
  unint64_t v60 = v58 + 1;
  if (v57 >> 1 <= v58)
  {
    uint64_t v56 = sub_258E9C9D8((void *)(v57 > 1), v58 + 1, 1, v56);
    unint64_t v57 = v56[3];
    int64_t v59 = v57 >> 1;
  }
  v56[2] = v60;
  uint64_t v61 = &v56[2 * v58];
  v61[4] = 0xD00000000000003DLL;
  v61[5] = 0x8000000258EB3510;
  int64_t v62 = v58 + 2;
  if (v59 < v62) {
    uint64_t v56 = sub_258E9C9D8((void *)(v57 > 1), v62, 1, v56);
  }
  v56[2] = v62;
  uint64_t v63 = &v56[2 * v60];
  v63[4] = 0xD000000000000040;
  v63[5] = 0x8000000258EB3550;
  unint64_t v65 = v56[2];
  unint64_t v64 = v56[3];
  int64_t v66 = v64 >> 1;
  unint64_t v67 = v65 + 1;
  if (v64 >> 1 <= v65)
  {
    uint64_t v56 = sub_258E9C9D8((void *)(v64 > 1), v65 + 1, 1, v56);
    unint64_t v64 = v56[3];
    int64_t v66 = v64 >> 1;
  }
  v56[2] = v67;
  unint64_t v68 = &v56[2 * v65];
  v68[4] = 0xD00000000000003FLL;
  v68[5] = 0x8000000258EB35A0;
  int64_t v69 = v65 + 2;
  if (v66 < v69) {
    uint64_t v56 = sub_258E9C9D8((void *)(v64 > 1), v69, 1, v56);
  }
  v56[2] = v69;
  uint64_t v70 = &v56[2 * v67];
  v70[4] = 0xD000000000000042;
  v70[5] = 0x8000000258EB35E0;
  unint64_t v72 = v56[2];
  unint64_t v71 = v56[3];
  int64_t v73 = v71 >> 1;
  unint64_t v74 = v72 + 1;
  if (v71 >> 1 <= v72)
  {
    uint64_t v56 = sub_258E9C9D8((void *)(v71 > 1), v72 + 1, 1, v56);
    unint64_t v71 = v56[3];
    int64_t v73 = v71 >> 1;
  }
  v56[2] = v74;
  uint64_t v75 = &v56[2 * v72];
  v75[4] = 0xD000000000000041;
  v75[5] = 0x8000000258EB3630;
  int64_t v76 = v72 + 2;
  if (v73 < v76) {
    uint64_t v56 = sub_258E9C9D8((void *)(v71 > 1), v76, 1, v56);
  }
  v56[2] = v76;
  uint64_t v77 = &v56[2 * v74];
  v77[4] = 0xD000000000000044;
  v77[5] = 0x8000000258EB3680;
  unint64_t v79 = v56[2];
  unint64_t v78 = v56[3];
  int64_t v80 = v78 >> 1;
  unint64_t v81 = v79 + 1;
  if (v78 >> 1 <= v79)
  {
    uint64_t v56 = sub_258E9C9D8((void *)(v78 > 1), v79 + 1, 1, v56);
    unint64_t v78 = v56[3];
    int64_t v80 = v78 >> 1;
  }
  v56[2] = v81;
  unint64_t v82 = &v56[2 * v79];
  v82[4] = 0xD000000000000043;
  v82[5] = 0x8000000258EB36D0;
  int64_t v83 = v79 + 2;
  if (v80 < v83) {
    uint64_t v56 = sub_258E9C9D8((void *)(v78 > 1), v83, 1, v56);
  }
  v56[2] = v83;
  uint64_t v84 = &v56[2 * v81];
  v84[4] = 0xD000000000000046;
  v84[5] = 0x8000000258EB3720;
  unint64_t v86 = v56[2];
  unint64_t v85 = v56[3];
  int64_t v87 = v85 >> 1;
  unint64_t v88 = v86 + 1;
  if (v85 >> 1 <= v86)
  {
    uint64_t v56 = sub_258E9C9D8((void *)(v85 > 1), v86 + 1, 1, v56);
    unint64_t v85 = v56[3];
    int64_t v87 = v85 >> 1;
  }
  v56[2] = v88;
  uint64_t v89 = &v56[2 * v86];
  v89[4] = 0xD00000000000003DLL;
  v89[5] = 0x8000000258EB3770;
  int64_t v90 = v86 + 2;
  if (v87 < v90) {
    uint64_t v56 = sub_258E9C9D8((void *)(v85 > 1), v90, 1, v56);
  }
  v56[2] = v90;
  uint64_t v91 = &v56[2 * v88];
  v91[4] = 0xD000000000000040;
  v91[5] = 0x8000000258EB37B0;
  unint64_t v93 = v56[2];
  unint64_t v92 = v56[3];
  int64_t v94 = v92 >> 1;
  unint64_t v95 = v93 + 1;
  if (v92 >> 1 <= v93)
  {
    uint64_t v56 = sub_258E9C9D8((void *)(v92 > 1), v93 + 1, 1, v56);
    unint64_t v92 = v56[3];
    int64_t v94 = v92 >> 1;
  }
  v56[2] = v95;
  id v96 = &v56[2 * v93];
  v96[4] = 0xD00000000000003FLL;
  v96[5] = 0x8000000258EB3800;
  int64_t v97 = v93 + 2;
  if (v94 < v97) {
    uint64_t v56 = sub_258E9C9D8((void *)(v92 > 1), v97, 1, v56);
  }
  v56[2] = v97;
  uint64_t v98 = &v56[2 * v95];
  v98[4] = 0xD000000000000042;
  v98[5] = 0x8000000258EB3840;
  uint64_t v111 = sub_258E86394(a1, 21, 1);
  double v99 = sub_258E86BA4(a1, 22, 0.7);
  uint64_t v110 = sub_258E86394(a1, 23, 10);
  uint64_t v109 = sub_258E86754(a1, 24, 7500397, 0xE300000000000000);
  uint64_t v101 = v100;
  uint64_t v102 = sub_258E86394(a1, 25, 1);
  uint64_t v103 = sub_258E86754(a1, 26, 0x7247737961776C61, 0xEE00657461756461);
  uint64_t v105 = v104;
  double v106 = sub_258E86BA4(a1, 27, 0.05);
  uint64_t v107 = sub_258E86394(a1, 28, 5);

  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a3 + 16) = v22;
  *(void *)(a3 + 24) = v145;
  *(void *)(a3 + 32) = v144;
  *(void *)(a3 + 40) = v143;
  *(void *)(a3 + 48) = v142;
  *(void *)(a3 + 64) = v137;
  *(void *)(a3 + 80) = v133;
  *(void *)(a3 + 88) = v132;
  *(void *)(a3 + 96) = v131;
  *(void *)(a3 + 104) = v130;
  *(void *)(a3 + 112) = v129;
  *(void *)(a3 + 120) = v126;
  *(void *)(a3 + 128) = v123;
  *(void *)(a3 + 136) = v122;
  *(void *)a3 = 0x4072C00000000000;
  *(void *)(a3 + 8) = v138;
  *(unsigned char *)(a3 + 56) = v141 & 1;
  *(unsigned char *)(a3 + 57) = v140 & 1;
  *(unsigned char *)(a3 + 58) = v139 & 1;
  *(unsigned char *)(a3 + 72) = v136 & 1;
  *(unsigned char *)(a3 + 73) = v135 & 1;
  *(unsigned char *)(a3 + 74) = v134 & 1;
  *(void *)(a3 + 144) = v128;
  *(void *)(a3 + 152) = v127;
  *(void *)(a3 + 160) = v125;
  *(void *)(a3 + 168) = v124;
  *(void *)(a3 + 176) = v121;
  *(void *)(a3 + 184) = v120;
  *(void *)(a3 + 192) = v119;
  *(void *)(a3 + 200) = v118;
  *(void *)(a3 + 208) = v56;
  *(void *)(a3 + 216) = v117;
  *(void *)(a3 + 224) = v116;
  *(void *)(a3 + 232) = v115;
  *(void *)(a3 + 240) = v114;
  *(void *)(a3 + 248) = v113;
  *(void *)(a3 + 256) = v112;
  *(void *)(a3 + 264) = v111;
  *(double *)(a3 + 272) = v99;
  *(void *)(a3 + 280) = v110;
  *(void *)(a3 + 288) = v109;
  *(void *)(a3 + 296) = v101;
  *(void *)(a3 + 304) = v102;
  *(void *)(a3 + 312) = v103;
  *(void *)(a3 + 320) = v105;
  *(double *)(a3 + 328) = v106;
  *(void *)(a3 + 336) = v107;
  return result;
}

uint64_t destroy for ConfigManager(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ConfigManager(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  unint64_t v23 = v3;
  unint64_t v24 = *(void **)(a2 + 32);
  uint64_t v25 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v24;
  *(void *)(a1 + 40) = v25;
  int v26 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v26;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  uint64_t v4 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v4;
  uint64_t v5 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v5;
  uint64_t v6 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v6;
  uint64_t v7 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  uint64_t v8 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v8;
  uint64_t v9 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v9;
  uint64_t v10 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v10;
  uint64_t v11 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v11;
  uint64_t v12 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v12;
  uint64_t v13 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v13;
  uint64_t v14 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v14;
  uint64_t v15 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v15;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  uint64_t v16 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v16;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  uint64_t v17 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v17;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRetain();
  id v18 = v23;
  id v19 = v24;
  id v20 = v25;
  id v21 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ConfigManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 40);
  uint64_t v11 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a2 + 48);
  uint64_t v14 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v13;
  id v15 = v13;

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  return a1;
}

void *__swift_memcpy344_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x158uLL);
}

uint64_t assignWithTake for ConfigManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  uint64_t v7 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  uint64_t v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfigManager(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 344)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfigManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 344) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 344) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfigManager()
{
  return &type metadata for ConfigManager;
}

uint64_t sub_258E85B1C(uint64_t a1, char a2, uint64_t a3)
{
  if (a1)
  {
    unint64_t v6 = sub_258E84208(a2);
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_258E78DD0(v6, v7), (v9 & 1) != 0))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8 * v8);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v35 = v10;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03E8);
  if (swift_dynamicCast())
  {
    a3 = v34;
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_258EA8BB0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A0D0790);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = sub_258EA8B90();
    os_log_type_t v13 = sub_258EA8E70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v35 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v16 = sub_258E84208(a2);
      sub_258E787E0(v16, v17, &v35);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v18 = swift_bridgeObjectRetain();
      uint64_t v19 = MEMORY[0x25A2D2A80](v18, MEMORY[0x263F8E548]);
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      sub_258E787E0(v19, v21, &v35);
      sub_258EA8F40();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_258E57000, v12, v13, "MLSE Recipe: Loaded from Trial configuration %s = %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v15, -1, -1);
      MEMORY[0x25A2D36B0](v14, -1, -1);
      swift_unknownObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_258EA8BB0();
    __swift_project_value_buffer(v22, (uint64_t)qword_26A0D0790);
    swift_bridgeObjectRetain_n();
    unint64_t v23 = sub_258EA8B90();
    os_log_type_t v24 = sub_258EA8E70();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v35 = v26;
      *(_DWORD *)uint64_t v25 = 136315394;
      unint64_t v27 = sub_258E84208(a2);
      sub_258E787E0(v27, v28, &v35);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v29 = swift_bridgeObjectRetain();
      uint64_t v30 = MEMORY[0x25A2D2A80](v29, MEMORY[0x263F8E548]);
      unint64_t v32 = v31;
      swift_bridgeObjectRelease();
      sub_258E787E0(v30, v32, &v35);
      sub_258EA8F40();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_258E57000, v23, v24, "MLSE Recipe: No parameter provided. Default to %s = %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v26, -1, -1);
      MEMORY[0x25A2D36B0](v25, -1, -1);
      swift_unknownObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
    swift_bridgeObjectRetain();
  }
  return a3;
}

uint64_t sub_258E85FB8(uint64_t a1, char a2, char a3)
{
  if (a1)
  {
    unint64_t v6 = sub_258E84208(a2);
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_258E78DD0(v6, v7), (v9 & 1) != 0))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8 * v8);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v28 = v10;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03E0);
  if (!swift_dynamicCast())
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_258EA8BB0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A0D0790);
    uint64_t v12 = sub_258EA8B90();
    os_log_type_t v13 = sub_258EA8E70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v22 = sub_258E84208(a2);
      sub_258E787E0(v22, v23, &v28);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      if (a3) {
        uint64_t v24 = 1702195828;
      }
      else {
        uint64_t v24 = 0x65736C6166;
      }
      if (a3) {
        unint64_t v25 = 0xE400000000000000;
      }
      else {
        unint64_t v25 = 0xE500000000000000;
      }
      sub_258E787E0(v24, v25, &v28);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      unint64_t v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_29;
    }
LABEL_30:

    swift_unknownObjectRelease();
    return a3 & 1;
  }
  a3 = v27 & 1;
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_258EA8BB0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A0D0790);
  uint64_t v12 = sub_258EA8B90();
  os_log_type_t v13 = sub_258EA8E70();
  if (!os_log_type_enabled(v12, v13)) {
    goto LABEL_30;
  }
  uint64_t v14 = swift_slowAlloc();
  uint64_t v15 = swift_slowAlloc();
  uint64_t v28 = v15;
  *(_DWORD *)uint64_t v14 = 136315394;
  unint64_t v16 = sub_258E84208(a2);
  sub_258E787E0(v16, v17, &v28);
  sub_258EA8F40();
  swift_bridgeObjectRelease();
  *(_WORD *)(v14 + 12) = 2080;
  if (v27) {
    uint64_t v18 = 1702195828;
  }
  else {
    uint64_t v18 = 0x65736C6166;
  }
  if (v27) {
    unint64_t v19 = 0xE400000000000000;
  }
  else {
    unint64_t v19 = 0xE500000000000000;
  }
  sub_258E787E0(v18, v19, &v28);
  sub_258EA8F40();
  swift_bridgeObjectRelease();
  unint64_t v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_29:
  _os_log_impl(&dword_258E57000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x25A2D36B0](v15, -1, -1);
  MEMORY[0x25A2D36B0](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3 & 1;
}

uint64_t sub_258E86394(uint64_t a1, char a2, uint64_t a3)
{
  if (a1)
  {
    unint64_t v6 = sub_258E84208(a2);
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_258E78DD0(v6, v7), (v9 & 1) != 0))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8 * v8);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v28 = v10;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03E0);
  if (!swift_dynamicCast())
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_258EA8BB0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A0D0790);
    uint64_t v12 = sub_258EA8B90();
    os_log_type_t v13 = sub_258EA8E70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v27[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v22 = sub_258E84208(a2);
      uint64_t v28 = sub_258E787E0(v22, v23, v27);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v28 = a3;
      uint64_t v24 = sub_258EA91D0();
      uint64_t v28 = sub_258E787E0(v24, v25, v27);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      unint64_t v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_unknownObjectRelease();
    return a3;
  }
  a3 = v27[0];
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_258EA8BB0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A0D0790);
  uint64_t v12 = sub_258EA8B90();
  os_log_type_t v13 = sub_258EA8E70();
  if (!os_log_type_enabled(v12, v13)) {
    goto LABEL_18;
  }
  uint64_t v14 = swift_slowAlloc();
  uint64_t v15 = swift_slowAlloc();
  v27[0] = v15;
  *(_DWORD *)uint64_t v14 = 136315394;
  unint64_t v16 = sub_258E84208(a2);
  uint64_t v28 = sub_258E787E0(v16, v17, v27);
  sub_258EA8F40();
  swift_bridgeObjectRelease();
  *(_WORD *)(v14 + 12) = 2080;
  uint64_t v28 = a3;
  uint64_t v18 = sub_258EA91D0();
  uint64_t v28 = sub_258E787E0(v18, v19, v27);
  sub_258EA8F40();
  swift_bridgeObjectRelease();
  unint64_t v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_17:
  _os_log_impl(&dword_258E57000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x25A2D36B0](v15, -1, -1);
  MEMORY[0x25A2D36B0](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3;
}

uint64_t sub_258E86754(uint64_t a1, char a2, uint64_t a3, unint64_t a4)
{
  if (a1)
  {
    unint64_t v8 = sub_258E84208(a2);
    if (*(void *)(a1 + 16) && (unint64_t v10 = sub_258E78DD0(v8, v9), (v11 & 1) != 0))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v12 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v30 = v12;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03E0);
  if (swift_dynamicCast())
  {
    a3 = v29[0];
    unint64_t v13 = v29[1];
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_258EA8BB0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A0D0790);
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_258EA8B90();
    os_log_type_t v16 = sub_258EA8E70();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v29[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315394;
      unint64_t v19 = sub_258E84208(a2);
      uint64_t v30 = sub_258E787E0(v19, v20, v29);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_258E787E0(a3, v13, v29);
      sub_258EA8F40();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_258E57000, v15, v16, "MLSE Recipe: Loaded from Trial configuration %s = %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v18, -1, -1);
      MEMORY[0x25A2D36B0](v17, -1, -1);
      swift_unknownObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_258EA8BB0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A0D0790);
    swift_bridgeObjectRetain_n();
    unint64_t v22 = sub_258EA8B90();
    os_log_type_t v23 = sub_258EA8E70();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v29[0] = v25;
      *(_DWORD *)uint64_t v24 = 136315394;
      unint64_t v26 = sub_258E84208(a2);
      uint64_t v30 = sub_258E787E0(v26, v27, v29);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_258E787E0(a3, a4, v29);
      sub_258EA8F40();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_258E57000, v22, v23, "MLSE Recipe: No parameter provided. Default to %s = %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v25, -1, -1);
      MEMORY[0x25A2D36B0](v24, -1, -1);
      swift_unknownObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
    }
    swift_bridgeObjectRetain();
  }
  return a3;
}

double sub_258E86BA4(uint64_t a1, char a2, double a3)
{
  if (a1)
  {
    unint64_t v6 = sub_258E84208(a2);
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_258E78DD0(v6, v7), (v9 & 1) != 0))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8 * v8);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v28 = v10;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03E0);
  if (!swift_dynamicCast())
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_258EA8BB0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A0D0790);
    uint64_t v12 = sub_258EA8B90();
    os_log_type_t v13 = sub_258EA8E70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v27[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v22 = sub_258E84208(a2);
      uint64_t v28 = sub_258E787E0(v22, v23, v27);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v24 = sub_258EA8E00();
      uint64_t v28 = sub_258E787E0(v24, v25, v27);
      sub_258EA8F40();
      swift_bridgeObjectRelease();
      unint64_t v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_unknownObjectRelease();
    return a3;
  }
  a3 = *(double *)v27;
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_258EA8BB0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A0D0790);
  uint64_t v12 = sub_258EA8B90();
  os_log_type_t v13 = sub_258EA8E70();
  if (!os_log_type_enabled(v12, v13)) {
    goto LABEL_18;
  }
  uint64_t v14 = swift_slowAlloc();
  uint64_t v15 = swift_slowAlloc();
  v27[0] = v15;
  *(_DWORD *)uint64_t v14 = 136315394;
  unint64_t v16 = sub_258E84208(a2);
  uint64_t v28 = sub_258E787E0(v16, v17, v27);
  sub_258EA8F40();
  swift_bridgeObjectRelease();
  *(_WORD *)(v14 + 12) = 2080;
  uint64_t v18 = sub_258EA8E00();
  uint64_t v28 = sub_258E787E0(v18, v19, v27);
  sub_258EA8F40();
  swift_bridgeObjectRelease();
  unint64_t v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_17:
  _os_log_impl(&dword_258E57000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x25A2D36B0](v15, -1, -1);
  MEMORY[0x25A2D36B0](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3;
}

uint64_t LocalTrainingManager.init(config:executionManager:)@<X0>(void *__src@<X0>, long long *a2@<X1>, void *a3@<X8>)
{
  memcpy(a3, __src, 0x158uLL);
  return sub_258E7D394(a2, (uint64_t)a3 + 344);
}

Swift::Void __swiftcall LocalTrainingManager.attemptLocalTrain()()
{
  id v1 = v0;
  uint64_t v2 = sub_258EA8950();
  uint64_t v3 = *(void **)(v2 - 8);
  uint64_t v4 = v3[8];
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = sub_258EA8900();
  uint64_t v133 = v4;
  MEMORY[0x270FA5388](v5);
  unint64_t v6 = (char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258EA8900();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0320);
  MEMORY[0x270FA5388](v7 - 8);
  id v139 = v8;
  unint64_t v9 = ((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (void (*)(char *, char *, uint64_t))v3[2];
  uint64_t v130 = v6;
  v10((char *)&v128 - v9, v6, v2);
  char v140 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v3[7];
  char v141 = v3 + 7;
  v140((char *)&v128 - v9, 0, 1, v2);
  uint64_t v11 = (void *)sub_258EA8C30();
  uint64_t v131 = v6;
  uint64_t v12 = (void *)sub_258EA8910();
  id v142 = v3;
  os_log_type_t v13 = v3;
  uint64_t v14 = v2;
  uint64_t v137 = (unsigned int (*)(char *, uint64_t, uint64_t))v13[6];
  uint64_t v138 = v13 + 6;
  uint64_t v15 = 0;
  if (v137((char *)&v128 - v9, 1, v2) != 1)
  {
    uint64_t v15 = (void *)sub_258EA8910();
    ((void (*)(char *, uint64_t))v142[1])((char *)&v128 - v9, v2);
  }
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F51628]), sel_init_modelStoreRootURL_originalEmptyModelURL_, v11, v12, v15);

  MEMORY[0x270FA5388](v17);
  v140((char *)&v128 - v9, 1, 1, v14);
  uint64_t v18 = (void *)sub_258EA8C30();
  if (v137((char *)&v128 - v9, 1, v14) == 1)
  {
    unint64_t v19 = 0;
  }
  else
  {
    unint64_t v19 = (void *)sub_258EA8910();
    ((void (*)(char *, uint64_t))v142[1])((char *)&v128 - v9, v14);
  }
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F51618]), sel_init_url_useSqlite_, v18, v19, 0);

  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v136 = v14;
  uint64_t v21 = sub_258EA8BB0();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_26A0D0790);
  unint64_t v23 = sub_258EA8B90();
  os_log_type_t v24 = sub_258EA8E80();
  if (os_log_type_enabled(v23, v24))
  {
    unint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v25 = 0;
    _os_log_impl(&dword_258E57000, v23, v24, "Starting local training", v25, 2u);
    MEMORY[0x25A2D36B0](v25, -1, -1);
  }

  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_258EAA7D0;
  uint64_t v28 = self;
  id v29 = objc_msgSend(v28, sel_learningRate);
  uint64_t v31 = v1[14];
  uint64_t v30 = v1[15];
  uint64_t v32 = MEMORY[0x263F8D310];
  *(void *)(inited + 64) = MEMORY[0x263F8D310];
  *(void *)(inited + 32) = v29;
  *(void *)(inited + 40) = v31;
  *(void *)(inited + 48) = v30;
  swift_bridgeObjectRetain();
  id v33 = objc_msgSend(v28, sel_numClasses);
  uint64_t v35 = v1[16];
  uint64_t v34 = v1[17];
  *(void *)(inited + 104) = v32;
  *(void *)(inited + 72) = v33;
  *(void *)(inited + 80) = v35;
  *(void *)(inited + 88) = v34;
  swift_bridgeObjectRetain();
  id v36 = objc_msgSend(v28, sel_numTrees);
  uint64_t v38 = v1[18];
  uint64_t v37 = v1[19];
  *(void *)(inited + 144) = v32;
  *(void *)(inited + 112) = v36;
  *(void *)(inited + 120) = v38;
  *(void *)(inited + 128) = v37;
  swift_bridgeObjectRetain();
  id v39 = objc_msgSend(v28, sel_maxDepth);
  uint64_t v41 = v1[20];
  uint64_t v40 = v1[21];
  *(void *)(inited + 184) = v32;
  *(void *)(inited + 152) = v39;
  *(void *)(inited + 160) = v41;
  *(void *)(inited + 168) = v40;
  swift_bridgeObjectRetain();
  id v42 = objc_msgSend(v28, sel_minChildWeight);
  uint64_t v44 = v1[22];
  uint64_t v43 = v1[23];
  *(void *)(inited + 224) = v32;
  *(void *)(inited + 192) = v42;
  *(void *)(inited + 200) = v44;
  *(void *)(inited + 208) = v43;
  swift_bridgeObjectRetain();
  id v45 = objc_msgSend(v28, sel_objective);
  uint64_t v47 = v1[24];
  uint64_t v46 = v1[25];
  *(void *)(inited + 264) = v32;
  *(void *)(inited + 232) = v45;
  *(void *)(inited + 240) = v47;
  *(void *)(inited + 248) = v46;
  swift_bridgeObjectRetain();
  sub_258E757F8(inited);
  objc_msgSend(v26, sel_setComputeUnits_, 0);
  sub_258E886A0();
  sub_258E886E0();
  uint64_t v48 = (void *)sub_258EA8BE0();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_setParameters_, v48);

  uint64_t v49 = (void *)sub_258EA8C30();
  objc_msgSend(v16, sel_deleteModel_, v49);

  uint64_t v132 = &v128;
  uint64_t v50 = v133;
  MEMORY[0x270FA5388](v51);
  unint64_t v52 = (v50 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v129 = (char *)&v128 - v52;
  uint64_t v53 = (void *)sub_258EA8C30();
  id v134 = v16;
  id v135 = v26;
  id v54 = objc_msgSend(v16, sel_getBaseModelURL_modelConfig_, v53, v26);

  uint64_t v56 = MEMORY[0x270FA5388](v55);
  unint64_t v58 = (char *)&v128 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v54)
  {
    id v139 = v20;
    MEMORY[0x270FA5388](v56);
    int64_t v59 = (char *)&v128 - v52;
    sub_258EA8920();

    unint64_t v60 = (void (*)(char *, char *, uint64_t))v142[4];
    uint64_t v61 = v59;
    uint64_t v62 = v136;
    v60(v58, v61, v136);
    v140(v58, 0, 1, v62);
    id v20 = v139;
    if (v137(v58, 1, v62) != 1)
    {
      uint64_t v128 = v22;
      uint64_t v63 = v129;
      v60(v129, v58, v62);
      unint64_t v64 = (void *)sub_258EA8D30();
      unint64_t v65 = (void *)sub_258EA8C30();
      int64_t v66 = (void *)sub_258EA8C30();
      unint64_t v67 = (void *)sub_258EA8C30();
      unint64_t v68 = objc_msgSend(v20, sel_getMultiArrayFeatureVectors_vectorName_srcLabelName_destLabelName_option_, v64, v65, v66, v67, 4);

      if (!v68)
      {
        unint64_t v93 = sub_258EA8B90();
        os_log_type_t v94 = sub_258EA8E90();
        BOOL v95 = os_log_type_enabled(v93, v94);
        id v96 = v134;
        if (v95)
        {
          int64_t v97 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)int64_t v97 = 0;
          _os_log_impl(&dword_258E57000, v93, v94, "Failed to fetch feature vectors from LCFFeatureStore", v97, 2u);
          MEMORY[0x25A2D36B0](v97, -1, -1);
        }

        uint64_t v98 = (void (*)(char *, uint64_t))v142[1];
        double v99 = v129;
        goto LABEL_54;
      }
      uint64_t v69 = self;
      uint64_t v70 = (void *)sub_258EA8910();
      LOBYTE(v69) = objc_msgSend((id)v69, sel_trainModel_destModelUrl_modelConfiguration_dataBatch_, v70, 0, v135, v68);

      unint64_t v71 = sub_258EA8B90();
      unint64_t v72 = v63;
      id v73 = v134;
      if (v69)
      {
        char v141 = v68;
        os_log_type_t v74 = sub_258EA8E70();
        if (os_log_type_enabled(v71, v74))
        {
          uint64_t v75 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v75 = 0;
          _os_log_impl(&dword_258E57000, v71, v74, "Successfully trained a local model", v75, 2u);
          MEMORY[0x25A2D36B0](v75, -1, -1);
        }

        int64_t v76 = (void *)sub_258EA8910();
        id v77 = objc_msgSend(v73, sel_storeModel_modelConfig_, v76, v135);

        if (!v77)
        {
          uint64_t v102 = sub_258EA8B90();
          os_log_type_t v103 = sub_258EA8E90();
          if (os_log_type_enabled(v102, v103))
          {
            uint64_t v104 = (uint8_t *)swift_slowAlloc();
            uint64_t v105 = swift_slowAlloc();
            v144[0] = v105;
            *(_DWORD *)uint64_t v104 = 136315138;
            uint64_t v143 = sub_258E787E0(0x6F6D6C6D2E4D544CLL, 0xEC000000636C6564, v144);
            sub_258EA8F40();
            _os_log_impl(&dword_258E57000, v102, v103, "Failed to retain the local model with name %s", v104, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25A2D36B0](v105, -1, -1);
            MEMORY[0x25A2D36B0](v104, -1, -1);

LABEL_43:
            swift_unknownObjectRelease();
            uint64_t v98 = (void (*)(char *, uint64_t))v142[1];
            double v99 = v63;
LABEL_54:
            uint64_t v127 = v136;
            v98(v99, v136);
            v98(v130, v127);
            v98(v131, v127);
            return;
          }

          goto LABEL_52;
        }
        uint64_t v78 = sub_258EA8C50();
        unint64_t v80 = v79;

        swift_bridgeObjectRetain();
        unint64_t v81 = sub_258EA8B90();
        os_log_type_t v82 = sub_258EA8E70();
        if (os_log_type_enabled(v81, v82))
        {
          int64_t v83 = (uint8_t *)swift_slowAlloc();
          uint64_t v84 = swift_slowAlloc();
          v144[0] = v84;
          *(_DWORD *)int64_t v83 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v143 = sub_258E787E0(v78, v80, v144);
          unint64_t v72 = v129;
          sub_258EA8F40();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_258E57000, v81, v82, "Successfully trained a local model with name %s", v83, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25A2D36B0](v84, -1, -1);
          MEMORY[0x25A2D36B0](v83, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        double v106 = (void *)sub_258EA8C30();
        id v107 = v134;
        unsigned __int8 v108 = objc_msgSend(v134, sel_markModelTrained_, v106);

        if (v108)
        {
          if (v1[39] == 0x7247737961776C61 && v1[40] == 0xEE00657461756461 || (sub_258EA91E0() & 1) != 0)
          {
            sub_258E882D4(v107, 0x69746375646F7270, 0xEF6C65646F4D6E6FLL);
            if (v109)
            {
              uint64_t v110 = (void *)sub_258EA8C30();
              swift_bridgeObjectRelease();
              uint64_t v111 = (void *)sub_258EA8C30();
              uint64_t v112 = (void *)sub_258EA8DB0();
              objc_msgSend(v107, sel_setModelMetadata_key_value_, v110, v111, v112);

              uint64_t v113 = sub_258EA8B90();
              os_log_type_t v114 = sub_258EA8E70();
              if (os_log_type_enabled(v113, v114))
              {
                uint64_t v115 = (uint8_t *)swift_slowAlloc();
                uint64_t v116 = swift_slowAlloc();
                v144[0] = v116;
                *(_DWORD *)uint64_t v115 = 136315138;
                uint64_t v143 = sub_258E787E0(0x6F6D6C6D2E4D544CLL, 0xEC000000636C6564, v144);
                id v107 = v134;
                sub_258EA8F40();
                _os_log_impl(&dword_258E57000, v113, v114, "Successfully stripped previous production model with name %s from its production model status", v115, 0xCu);
                swift_arrayDestroy();
                uint64_t v117 = v116;
                unint64_t v72 = v129;
                MEMORY[0x25A2D36B0](v117, -1, -1);
                MEMORY[0x25A2D36B0](v115, -1, -1);
              }
            }
            uint64_t v118 = (void *)sub_258EA8C30();
            uint64_t v119 = (void *)sub_258EA8C30();
            uint64_t v120 = (void *)sub_258EA8DB0();
            objc_msgSend(v107, sel_setModelMetadata_key_value_, v118, v119, v120);

            uint64_t v121 = sub_258EA8B90();
            os_log_type_t v122 = sub_258EA8E70();
            if (os_log_type_enabled(v121, v122))
            {
              uint64_t v123 = (uint8_t *)swift_slowAlloc();
              uint64_t v63 = v72;
              uint64_t v124 = swift_slowAlloc();
              v144[0] = v124;
              *(_DWORD *)uint64_t v123 = 136315138;
              uint64_t v143 = sub_258E787E0(0x6F6D6C6D2E4D544CLL, 0xEC000000636C6564, v144);
              sub_258EA8F40();
              _os_log_impl(&dword_258E57000, v121, v122, "Successfully set local model with name %s as the production model", v123, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x25A2D36B0](v124, -1, -1);
              MEMORY[0x25A2D36B0](v123, -1, -1);

              goto LABEL_43;
            }
          }
          else
          {
          }
LABEL_52:
          swift_unknownObjectRelease();
          goto LABEL_53;
        }
        unint64_t v71 = sub_258EA8B90();
        os_log_type_t v125 = sub_258EA8E90();
        if (os_log_type_enabled(v71, v125))
        {
          uint64_t v126 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v126 = 0;
          _os_log_impl(&dword_258E57000, v71, v125, "Failed to mark the LTM as trained", v126, 2u);
          MEMORY[0x25A2D36B0](v126, -1, -1);
        }
      }
      else
      {
        os_log_type_t v100 = sub_258EA8E90();
        if (os_log_type_enabled(v71, v100))
        {
          uint64_t v101 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v101 = 0;
          _os_log_impl(&dword_258E57000, v71, v100, "Failed to train a local model", v101, 2u);
          MEMORY[0x25A2D36B0](v101, -1, -1);
        }
      }
      swift_unknownObjectRelease();

LABEL_53:
      uint64_t v98 = (void (*)(char *, uint64_t))v142[1];
      double v99 = v72;
      goto LABEL_54;
    }
  }
  else
  {
    uint64_t v62 = v136;
    v140((char *)&v128 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v136);
  }
  sub_258E7E090((uint64_t)v58);
  unint64_t v85 = sub_258EA8B90();
  os_log_type_t v86 = sub_258EA8E90();
  if (os_log_type_enabled(v85, v86))
  {
    uint64_t v87 = v62;
    unint64_t v88 = (uint8_t *)swift_slowAlloc();
    uint64_t v89 = swift_slowAlloc();
    v144[0] = v89;
    *(_DWORD *)unint64_t v88 = 136315138;
    uint64_t v143 = sub_258E787E0(0x6F6D6C6D2E4D544CLL, 0xEC000000636C6564, v144);
    sub_258EA8F40();
    _os_log_impl(&dword_258E57000, v85, v86, "Failed to fetch the base model %s", v88, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2D36B0](v89, -1, -1);
    MEMORY[0x25A2D36B0](v88, -1, -1);

    int64_t v90 = (void (*)(char *, uint64_t))v142[1];
    v90(v130, v87);
    uint64_t v91 = v131;
    uint64_t v92 = v87;
  }
  else
  {

    int64_t v90 = (void (*)(char *, uint64_t))v142[1];
    v90(v130, v62);
    uint64_t v91 = v131;
    uint64_t v92 = v62;
  }
  v90(v91, v92);
}

void sub_258E882D4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  id v5 = objc_msgSend(a1, sel_listModelNames);
  if (v5)
  {
    uint64_t v6 = sub_258EA8D40();

    uint64_t v28 = *(void *)(v6 + 16);
    if (!v28)
    {
LABEL_41:
      swift_bridgeObjectRelease();
      return;
    }
    unint64_t v7 = 0;
    uint64_t v29 = v6;
    unint64_t v27 = v4;
LABEL_5:
    if (v7 < *(void *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v8 = (void *)sub_258EA8C30();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(v4, sel_getModelMetadata_, v8);

      if (!v9) {
        goto LABEL_41;
      }
      id v10 = objc_msgSend(v9, sel_custom);
      if (!v10)
      {
        swift_bridgeObjectRelease();

        return;
      }
      unint64_t v30 = v7 + 1;
      uint64_t v31 = v9;
      uint64_t v11 = sub_258EA8BF0();

      int64_t v12 = 0;
      uint64_t v32 = v11 + 64;
      uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
      if (v13 < 64) {
        uint64_t v14 = ~(-1 << v13);
      }
      else {
        uint64_t v14 = -1;
      }
      unint64_t v15 = v14 & *(void *)(v11 + 64);
      int64_t v16 = (unint64_t)(v13 + 63) >> 6;
      while (!v15)
      {
        int64_t v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
          __break(1u);
          goto LABEL_46;
        }
        if (v22 < v16)
        {
          unint64_t v23 = *(void *)(v32 + 8 * v22);
          if (v23) {
            goto LABEL_20;
          }
          int64_t v24 = v12 + 2;
          ++v12;
          if (v22 + 1 < v16)
          {
            unint64_t v23 = *(void *)(v32 + 8 * v24);
            if (v23) {
              goto LABEL_23;
            }
            int64_t v12 = v22 + 1;
            if (v22 + 2 < v16)
            {
              unint64_t v23 = *(void *)(v32 + 8 * (v22 + 2));
              if (v23)
              {
                v22 += 2;
                goto LABEL_20;
              }
              int64_t v24 = v22 + 3;
              int64_t v12 = v22 + 2;
              if (v22 + 3 < v16)
              {
                unint64_t v23 = *(void *)(v32 + 8 * v24);
                if (!v23)
                {
                  while (1)
                  {
                    int64_t v22 = v24 + 1;
                    if (__OFADD__(v24, 1)) {
                      goto LABEL_47;
                    }
                    if (v22 >= v16)
                    {
                      int64_t v12 = v16 - 1;
                      goto LABEL_34;
                    }
                    unint64_t v23 = *(void *)(v32 + 8 * v22);
                    ++v24;
                    if (v23) {
                      goto LABEL_20;
                    }
                  }
                }
LABEL_23:
                int64_t v22 = v24;
LABEL_20:
                unint64_t v15 = (v23 - 1) & v23;
                unint64_t v18 = __clz(__rbit64(v23)) + (v22 << 6);
                int64_t v12 = v22;
LABEL_16:
                uint64_t v19 = *(void *)(v11 + 56);
                id v20 = (void *)(*(void *)(v11 + 48) + 16 * v18);
                uint64_t v21 = v20[1];
                *(void *)&long long v35 = *v20;
                *((void *)&v35 + 1) = v21;
                sub_258E7D470(v19 + 32 * v18, (uint64_t)v36);
                swift_bridgeObjectRetain();
                goto LABEL_35;
              }
            }
          }
        }
LABEL_34:
        unint64_t v15 = 0;
        memset(v36, 0, sizeof(v36));
        long long v35 = 0u;
LABEL_35:
        sub_258E89008((uint64_t)&v35, (uint64_t)&v37);
        uint64_t v25 = v38;
        if (!v38)
        {

          swift_release();
          uint64_t v4 = v27;
          unint64_t v7 = v30;
          uint64_t v6 = v29;
          if (v30 == v28) {
            goto LABEL_41;
          }
          goto LABEL_5;
        }
        uint64_t v26 = v37;
        sub_258E7D3AC(&v39, &v35);
        if (swift_dynamicCast()
          && (v26 == a2 && v25 == a3 || (sub_258EA91E0() & 1) != 0)
          && (v34 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          swift_release();

          return;
        }
        swift_bridgeObjectRelease();
      }
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_16;
    }
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
  }
}

unint64_t sub_258E886A0()
{
  unint64_t result = qword_26A0D02C0;
  if (!qword_26A0D02C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A0D02C0);
  }
  return result;
}

unint64_t sub_258E886E0()
{
  unint64_t result = qword_26A0D03F8;
  if (!qword_26A0D03F8)
  {
    sub_258E886A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D03F8);
  }
  return result;
}

uint64_t destroy for LocalTrainingManager(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(a1 + 43));
}

uint64_t initializeWithCopy for LocalTrainingManager(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v28 = v3;
  uint64_t v29 = *(void **)(a2 + 32);
  unint64_t v30 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v29;
  *(void *)(a1 + 40) = v30;
  uint64_t v31 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v31;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  uint64_t v4 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v4;
  uint64_t v5 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v5;
  uint64_t v6 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v6;
  uint64_t v7 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  uint64_t v8 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v8;
  uint64_t v9 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v9;
  uint64_t v10 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v10;
  uint64_t v11 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v11;
  uint64_t v12 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v12;
  uint64_t v13 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v13;
  uint64_t v14 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v14;
  uint64_t v15 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v15;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  uint64_t v16 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v16;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  uint64_t v17 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v17;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  uint64_t v26 = a2 + 344;
  uint64_t v27 = a1 + 344;
  long long v18 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v18;
  uint64_t v19 = v18;
  uint64_t v25 = **(void (***)(uint64_t, uint64_t, uint64_t))(v18 - 8);
  swift_bridgeObjectRetain();
  id v20 = v28;
  id v21 = v29;
  id v22 = v30;
  id v23 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v25(v27, v26, v19);
  return a1;
}

uint64_t assignWithCopy for LocalTrainingManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 40);
  uint64_t v11 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a2 + 48);
  uint64_t v14 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v13;
  id v15 = v13;

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  return a1;
}

void *__swift_memcpy384_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x180uLL);
}

uint64_t assignWithTake for LocalTrainingManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  uint64_t v7 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  uint64_t v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  long long v20 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v20;
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalTrainingManager(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 384)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalTrainingManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 376) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 384) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 384) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalTrainingManager()
{
  return &type metadata for LocalTrainingManager;
}

uint64_t sub_258E89008(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SynchronizedExecutionManager.init()@<X0>(uint64_t a1@<X8>)
{
  sub_258E89274();
  uint64_t v2 = sub_258EA8BD0();
  MEMORY[0x270FA5388](v2 - 8);
  sub_258EA8BC0();
  uint64_t v3 = sub_258EA8EB0();
  MEMORY[0x270FA5388](v3);
  v8[1] = MEMORY[0x263F8EE78];
  sub_258E892B4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0418);
  sub_258E89300();
  sub_258EA8F80();
  uint64_t v4 = sub_258EA8EC0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, void))(v6 + 104))((char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F8F128]);
  uint64_t result = sub_258EA8EE0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = 0;
  return result;
}

unint64_t sub_258E89274()
{
  unint64_t result = qword_26A0D0408;
  if (!qword_26A0D0408)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A0D0408);
  }
  return result;
}

unint64_t sub_258E892B4()
{
  unint64_t result = qword_26A0D0410;
  if (!qword_26A0D0410)
  {
    sub_258EA8EB0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0410);
  }
  return result;
}

unint64_t sub_258E89300()
{
  unint64_t result = qword_26A0D0420;
  if (!qword_26A0D0420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A0D0418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0420);
  }
  return result;
}

Swift::Void __swiftcall SynchronizedExecutionManager.stop()()
{
  id v1 = *v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_258E895A4;
  *(void *)(v3 + 24) = v2;
  v6[4] = sub_258E895BC;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_258E895E4;
  v6[3] = &block_descriptor_0;
  uint64_t v4 = _Block_copy(v6);
  uint64_t v5 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v4);

  _Block_release(v4);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v4) {
    __break(1u);
  }
}

void sub_258E894B0(uint64_t a1)
{
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_258EA8BB0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A0D0790);
  uint64_t v3 = sub_258EA8B90();
  os_log_type_t v4 = sub_258EA8E70();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_258E57000, v3, v4, "Plugin received stop signal", v5, 2u);
    MEMORY[0x25A2D36B0](v5, -1, -1);
  }

  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_258E89594()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_258E895A4()
{
  sub_258E894B0(*(void *)(v0 + 16));
}

uint64_t sub_258E895AC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_258E895BC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_258E895E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t SynchronizedExecutionManager.shouldStop.getter()
{
  sub_258EA8ED0();
  return v1;
}

void sub_258E89694(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

uint64_t sub_258E896A0()
{
  sub_258EA8ED0();
  return v1;
}

uint64_t dispatch thunk of ExecutionManager.shouldStop.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for IsTaskCancelledExecutionManager()
{
  return &type metadata for IsTaskCancelledExecutionManager;
}

uint64_t initializeBufferWithCopyOfBuffer for SynchronizedExecutionManager(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void destroy for SynchronizedExecutionManager(id *a1)
{
}

uint64_t assignWithCopy for SynchronizedExecutionManager(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for SynchronizedExecutionManager(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SynchronizedExecutionManager(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SynchronizedExecutionManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SynchronizedExecutionManager()
{
  return &type metadata for SynchronizedExecutionManager;
}

void sub_258E898AC(unsigned char *a1@<X8>)
{
}

uint64_t sub_258E898C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_258E7D394((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_258E9D6A4(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_258E81B50(a1, (uint64_t *)&unk_26A0D04B0);
    sub_258E93194(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_258E81B50((uint64_t)v9, (uint64_t *)&unk_26A0D04B0);
  }
}

uint64_t sub_258E899A0(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)MEMORY[0x25A2D2D90](v8, v4);
LABEL_9:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          sub_258EA9090();
          sub_258EA90C0();
          unint64_t v4 = v15;
          sub_258EA90D0();
          sub_258EA90A0();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_258EA9150();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t DurableFeatureManager.init(config:executionManager:conversationSelection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  long long v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v7;
  unint64_t v8 = *(void **)(a1 + 32);
  memcpy((void *)(a4 + 40), (const void *)(a1 + 40), 0x130uLL);
  *(void *)(a4 + 32) = v8;
  sub_258E7D330(a2, a4 + 344);
  *(void *)(a4 + 384) = a3;
  id v9 = objc_msgSend(v8, sel_source);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm(a2);
  *(void *)(a4 + 392) = v9;
  return result;
}

void DurableFeatureManager.init(config:executionManager:)(long long *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  long long v70 = *a1;
  uint64_t v3 = (void *)*((void *)a1 + 3);
  uint64_t v71 = *((void *)a1 + 2);
  id v63 = v3;
  uint64_t v64 = *((void *)a1 + 8);
  uint64_t v69 = *((void *)a1 + 7);
  unint64_t v58 = (void *)*((void *)a1 + 4);
  long long v68 = *(long long *)((char *)a1 + 40);
  memcpy(__dst, (char *)a1 + 72, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_258EAA890;
  uint64_t v5 = sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
  *(void *)(v4 + 32) = sub_258EA8F00();
  *(void *)(v4 + 40) = sub_258EA8F00();
  *(void *)(v4 + 48) = sub_258EA8F00();
  sub_258EA8D60();
  uint64_t v6 = v4;
  uint64_t v61 = (void *)sub_258EA8F00();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_258EAA8A0;
  *(void *)(v7 + 32) = sub_258EA8F00();
  *(void *)(v7 + 40) = sub_258EA8F00();
  sub_258EA8D60();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D05D0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_258EAA3B0;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03B8);
  *(void *)(v8 + 56) = v54;
  *(void *)(v8 + 32) = &unk_2706ECCB0;
  id v9 = (void *)sub_258EA8C30();
  uint64_t v10 = (void *)sub_258EA8D30();
  swift_bridgeObjectRelease();
  unint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v9, v10);

  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_258EAA3B0;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0428);
  uint64_t v57 = v6;
  *(void *)(v13 + 56) = v56;
  *(void *)(v13 + 32) = v6;
  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)sub_258EA8C30();
  unint64_t v15 = (void *)sub_258EA8D30();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v14, v15);

  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_258EAA3B0;
  *(void *)(v17 + 56) = v5;
  *(void *)(v17 + 32) = v61;
  id v62 = v61;
  id v18 = (void *)sub_258EA8C30();
  uint64_t v19 = (void *)sub_258EA8D30();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v18, v19);

  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_258EAA890;
  *(void *)(v21 + 32) = v12;
  *(void *)(v21 + 40) = v16;
  *(void *)(v21 + 48) = v20;
  *(void *)&__src[0] = v21;
  sub_258EA8D60();
  sub_258E7451C(0, &qword_26A0D0210);
  id v22 = v12;
  id v23 = v16;
  id v24 = v20;
  uint64_t v25 = (void *)sub_258EA8D30();
  swift_bridgeObjectRelease();
  uint64_t v26 = self;
  id v27 = objc_msgSend(v26, sel_andPredicateWithSubpredicates_, v25);

  if (v64 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v52 = v27;
    id v28 = objc_msgSend(v63, sel_lh_kMostRecentConversationsWithLimit_predicate_, v64, v27);
    uint64_t v51 = sub_258EA8E10();

    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_258EAA3B0;
    *(void *)(v29 + 56) = v54;
    *(void *)(v29 + 32) = &unk_2706ECCB0;
    uint64_t v55 = v22;
    unint64_t v30 = (void *)sub_258EA8C30();
    uint64_t v53 = v24;
    uint64_t v31 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v30, v31);

    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_258EAA3B0;
    *(void *)(v33 + 56) = v56;
    *(void *)(v33 + 32) = v57;
    char v34 = (void *)sub_258EA8C30();
    long long v35 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v36 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v34, v35);

    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_258EAA3B0;
    *(void *)(v37 + 56) = v56;
    *(void *)(v37 + 32) = v7;
    uint64_t v38 = (void *)sub_258EA8C30();
    long long v39 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v38, v39);

    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_258EAA890;
    *(void *)(v41 + 32) = v32;
    *(void *)(v41 + 40) = v36;
    *(void *)(v41 + 48) = v40;
    sub_258EA8D60();
    id v42 = v32;
    id v43 = v36;
    id v44 = v40;
    id v45 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v46 = objc_msgSend(v26, sel_andPredicateWithSubpredicates_, v45);

    id v47 = objc_msgSend(v63, sel_lh_kMostRecentConversationsWithLimit_predicate_, v64, v46);
    uint64_t v48 = sub_258EA8E10();

    uint64_t v49 = sub_258E8A390(v48, v51);
    sub_258E7D330(a2, (uint64_t)v66);
    __src[0] = v70;
    *(void *)&__src[1] = v71;
    *((void *)&__src[1] + 1) = v63;
    *(void *)&void __src[2] = v58;
    *(_OWORD *)((char *)&__src[2] + 8) = v68;
    *((void *)&__src[3] + 1) = v69;
    *(void *)&__src[4] = v64;
    memcpy((char *)&__src[4] + 8, __dst, 0x110uLL);
    sub_258E7D330((uint64_t)v66, (uint64_t)&__src[21] + 8);
    *(void *)&__src[24] = v49;
    id v50 = objc_msgSend(v58, sel_source);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v66);
    *((void *)&__src[24] + 1) = v50;
    memcpy(a3, __src, 0x190uLL);

    __swift_destroy_boxed_opaque_existential_1Tm(a2);
  }
}

uint64_t sub_258E8A390(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    unint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_258E9DD28(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_258E8A510(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (!a4)
  {
    unint64_t v10 = sub_258E8B978;
    uint64_t v9 = 0;
    if ((a3 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    sub_258E96C30(a4);
    v10(a1);
    unint64_t v11 = (void *)sub_258EA8E50();
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v11, 0, 0, 0, 0);
    goto LABEL_6;
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a4;
  *(void *)(v9 + 24) = a5;
  unint64_t v10 = sub_258E96C28;
  if (a3) {
    goto LABEL_5;
  }
LABEL_3:
  sub_258E96C30(a4);
  sub_258E8B00C(a1, (uint64_t (*)(void *))v10, v9);
  unint64_t v11 = (void *)sub_258EA8DF0();
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v11, 0, 0, 0);
LABEL_6:
  id v13 = v12;
  swift_release();

  return v13;
}

uint64_t sub_258E8A668(unint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = sub_258E97728(a1, a2);
  uint64_t v3 = *(void *)(sub_258E98CC4(v2) + 16);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_258E8A6B0(uint64_t a1)
{
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v52 = swift_bridgeObjectRetain();
    unint64_t v2 = (unint64_t)sub_258E935B4(v52, (void (*)(void *, uint64_t, unint64_t))sub_258E96C40);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  unint64_t v71 = v2;
  sub_258E9348C((uint64_t *)&v71);
  unint64_t v3 = v71;
  unint64_t v4 = (v71 >> 62) & 1;
  if ((v71 & 0x8000000000000000) != 0) {
    LODWORD(v4) = 1;
  }
  int v55 = v4;
  if (v4)
  {
LABEL_85:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_258EA9150();
    swift_release();
  }
  else
  {
    uint64_t v5 = *(void *)(v71 + 16);
  }
  uint64_t v58 = v5 - 1;
  if (v5 <= 1) {
    return swift_release();
  }
  unint64_t v60 = 0;
  uint64_t v7 = 0;
  unint64_t v69 = v3;
  unint64_t v70 = v3 & 0xC000000000000001;
  unint64_t v56 = v3 + 32;
  uint64_t v57 = v5;
  double v8 = 0.0;
  while (v7 >= v58)
  {
    uint64_t v59 = v7;
LABEL_29:
    uint64_t v7 = v59;
    if (v59 < (uint64_t)v60)
    {
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
LABEL_84:
      __break(1u);
      goto LABEL_85;
    }
    uint64_t v29 = v59 + 1;
    if (__OFADD__(v59, 1)) {
      goto LABEL_78;
    }
    if (v55)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_258EA9150();
      swift_release();
      if (v30 < (uint64_t)v60) {
        goto LABEL_79;
      }
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_258EA9150();
      swift_release();
    }
    else
    {
      unint64_t v32 = *(void *)(v3 + 16);
      swift_retain();
      if (v32 < v60) {
        goto LABEL_79;
      }
      uint64_t v31 = *(void *)(v3 + 16);
    }
    if (v31 < v29) {
      goto LABEL_80;
    }
    if (v29 < 0) {
      goto LABEL_81;
    }
    if (v70)
    {
      if (v29 < v60) {
        goto LABEL_82;
      }
      if (v60 != v29)
      {
        sub_258E7451C(0, &qword_26A0D05C0);
        unint64_t v33 = v60;
        do
        {
          unint64_t v34 = v33 + 1;
          sub_258EA9050();
          unint64_t v33 = v34;
        }
        while (v29 != v34);
      }
    }
    if (v55)
    {
      swift_bridgeObjectRetain();
      sub_258EA9160();
      unint64_t v36 = v35;
      uint64_t v1 = v37;
      unint64_t v39 = v38;
      swift_release_n();
      unint64_t v40 = v39 >> 1;
      if ((v39 & 1) == 0) {
        goto LABEL_52;
      }
    }
    else
    {
      unint64_t v36 = v56;
      uint64_t v1 = v60;
      unint64_t v45 = (2 * v29) | 1;
      unint64_t v40 = v45 >> 1;
      if ((v45 & 1) == 0)
      {
LABEL_52:
        uint64_t v43 = v40 - v1;
        if (__OFSUB__(v40, v1)) {
          goto LABEL_83;
        }
        if (!v43) {
          goto LABEL_65;
        }
        goto LABEL_54;
      }
    }
    sub_258EA9200();
    swift_unknownObjectRetain_n();
    uint64_t v41 = swift_dynamicCastClass();
    if (!v41)
    {
      swift_unknownObjectRelease();
      uint64_t v41 = MEMORY[0x263F8EE78];
    }
    uint64_t v42 = *(void *)(v41 + 16);
    swift_release();
    uint64_t v43 = v40 - v1;
    if (__OFSUB__(v40, v1)) {
      goto LABEL_84;
    }
    if (v42 == v43)
    {
      uint64_t v44 = swift_dynamicCastClass();
      if (v44) {
        goto LABEL_66;
      }
      swift_unknownObjectRelease();
LABEL_65:
      uint64_t v44 = MEMORY[0x263F8EE78];
      goto LABEL_66;
    }
    swift_unknownObjectRelease();
    if (!v43) {
      goto LABEL_65;
    }
LABEL_54:
    uint64_t v46 = 8 * v43;
    if (v43 < 1)
    {
      uint64_t v44 = MEMORY[0x263F8EE78];
      if (v1 == v40) {
        goto LABEL_91;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
      uint64_t v44 = swift_allocObject();
      int64_t v47 = _swift_stdlib_malloc_size((const void *)v44);
      uint64_t v48 = v47 - 32;
      if (v47 < 32) {
        uint64_t v48 = v47 - 25;
      }
      *(void *)(v44 + 16) = v43;
      *(void *)(v44 + 24) = (2 * (v48 >> 3)) | 1;
      if (v1 == v40) {
        goto LABEL_91;
      }
    }
    if (v43 < 0) {
      goto LABEL_92;
    }
    unint64_t v49 = v36 + 8 * v1;
    if (v49 < v44 + 32 + v46 && v44 + 32 < v49 + v46) {
      goto LABEL_92;
    }
    sub_258E7451C(0, &qword_26A0D05C0);
    swift_arrayInitWithCopy();
    uint64_t v5 = v57;
    uint64_t v7 = v59;
LABEL_66:
    swift_unknownObjectRelease();
    if (v44 < 0 || (v44 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_258EA9150();
      swift_release();
    }
    else
    {
      uint64_t v50 = *(void *)(v44 + 16);
    }
    swift_release();
    double v8 = v8 + (double)v50;
    unint64_t v51 = v60 + 1;
    if (v7 < v5)
    {
      ++v60;
      if (v51 != v5) {
        continue;
      }
    }
    return swift_release();
  }
  while (1)
  {
    uint64_t v61 = v7 + 1;
    if (v70)
    {
      id v9 = (id)MEMORY[0x25A2D2D90]();
    }
    else
    {
      if (v7 < -1)
      {
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }
      if ((unint64_t)(v7 + 1) >= *(void *)(v3 + 16)) {
        goto LABEL_76;
      }
      id v9 = *(id *)(v3 + 8 * v7 + 40);
    }
    unint64_t v10 = v9;
    uint64_t v59 = v7;
    id v11 = objc_msgSend(v9, sel_startDate);

    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
    long long v68 = v54;
    id v13 = *(unsigned char **)(*(void *)(v12 - 8) + 64);
    MEMORY[0x270FA5388](v12 - 8);
    if (!v11) {
      break;
    }
    uint64_t v1 = sub_258EA8A80();
    int64_t v14 = *(void **)(v1 - 8);
    uint64_t v15 = v14[8];
    MEMORY[0x270FA5388](v1);
    unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_258EA8A40();

    unint64_t v3 = (unint64_t)(v14 + 4);
    unint64_t v67 = (void (*)(unsigned char *, unsigned char *, uint64_t))v14[4];
    v67(&v54[-((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0)], &v54[-v16], v1);
    id v11 = (id)v14[7];
    ((void (*)(unsigned char *, void, uint64_t, uint64_t))v11)(&v54[-((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0)], 0, 1, v1);
    uint64_t v17 = (unsigned int (*)(unsigned char *, uint64_t, uint64_t))v14[6];
    unint64_t v65 = &v54[-((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
    int64_t v66 = v17;
    uint64_t v18 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v17)(v65, 1, v1);
    if (v18 == 1) {
      goto LABEL_88;
    }
    MEMORY[0x270FA5388](v18);
    id v63 = &v54[-v16];
    uint64_t v64 = v19;
    if (v70)
    {
      id v20 = (id)MEMORY[0x25A2D2D90](v60, v69);
    }
    else
    {
      if (v60 >= *(void *)(v69 + 16)) {
        goto LABEL_75;
      }
      id v20 = *(id *)(v56 + 8 * v60);
    }
    uint64_t v21 = v20;
    id v22 = objc_msgSend(v20, sel_startDate);

    uint64_t v24 = MEMORY[0x270FA5388](v23);
    id v13 = &v54[-((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
    if (!v22) {
      goto LABEL_89;
    }
    id v62 = v54;
    MEMORY[0x270FA5388](v24);
    sub_258EA8A40();

    v67(v13, &v54[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)], v1);
    ((void (*)(unsigned char *, void, uint64_t, uint64_t))v11)(v13, 0, 1, v1);
    if (v66(v13, 1, v1) == 1) {
      goto LABEL_90;
    }
    uint64_t v25 = v63;
    sub_258EA89F0();
    uint64_t v26 = (void (*)(unsigned char *, uint64_t))v14[1];
    v26(v13, v1);
    sub_258E9869C((unint64_t *)&qword_26A0D0438);
    id v27 = v65;
    char v28 = sub_258EA8C20();
    v26(v25, v1);
    v26(v27, v1);
    unint64_t v3 = v69;
    uint64_t v5 = v57;
    if (v28) {
      goto LABEL_29;
    }
    uint64_t v7 = v61;
    if (v58 == v61)
    {
      uint64_t v59 = v58;
      goto LABEL_29;
    }
  }
  uint64_t v53 = sub_258EA8A80();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(&v54[-((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0)], 1, 1, v53);
LABEL_88:
  __break(1u);
LABEL_89:
  ((void (*)(unsigned char *, uint64_t, uint64_t, uint64_t))v11)(v13, 1, 1, v1);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
  swift_release();
  __break(1u);
LABEL_92:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E8B00C(uint64_t a1, uint64_t (*a2)(void *), uint64_t a3)
{
  uint64_t v58 = a2;
  uint64_t v59 = a3;
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v54 = swift_bridgeObjectRetain();
    unint64_t v3 = (unint64_t)sub_258E935B4(v54, (void (*)(void *, uint64_t, unint64_t))sub_258E96C40);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v3 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  unint64_t v75 = v3;
  sub_258E9348C((uint64_t *)&v75);
  unint64_t v4 = v75;
  unint64_t v5 = (v75 >> 62) & 1;
  if ((v75 & 0x8000000000000000) != 0) {
    LODWORD(v5) = 1;
  }
  int v60 = v5;
  if (v5 == 1)
  {
LABEL_82:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_258EA9150();
    swift_release();
    if (v6) {
      goto LABEL_8;
    }
    return swift_release();
  }
  uint64_t v6 = *(void *)(v75 + 16);
  if (!v6) {
    return swift_release();
  }
LABEL_8:
  uint64_t v62 = v6 - 1;
  if (v6 == 1) {
    return swift_release();
  }
  uint64_t v57 = v6;
  if (v6 <= 0) {
    return swift_release();
  }
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v73 = v4;
  unint64_t v74 = v4 & 0xC000000000000001;
  unint64_t v61 = v4 + 32;
  double v9 = 0.0;
  while (1)
  {
    unint64_t v64 = v7;
    if (v8 < v62) {
      break;
    }
    uint64_t v63 = v8;
LABEL_29:
    if (v63 < (uint64_t)v64)
    {
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
      goto LABEL_82;
    }
    uint64_t v30 = v63 + 1;
    if (__OFADD__(v63, 1)) {
      goto LABEL_75;
    }
    if (v60)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_258EA9150();
      swift_release();
      if (v31 < (uint64_t)v64) {
        goto LABEL_76;
      }
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_258EA9150();
      swift_release();
    }
    else
    {
      unint64_t v33 = *(void *)(v4 + 16);
      swift_retain();
      if (v33 < v64) {
        goto LABEL_76;
      }
      uint64_t v32 = *(void *)(v4 + 16);
    }
    if (v32 < v30) {
      goto LABEL_77;
    }
    if (v30 < 0) {
      goto LABEL_78;
    }
    if (v74)
    {
      if (v30 < v64) {
        goto LABEL_79;
      }
      if (v64 != v30)
      {
        sub_258E7451C(0, &qword_26A0D05C0);
        unint64_t v34 = v64;
        do
        {
          unint64_t v35 = v34 + 1;
          sub_258EA9050();
          unint64_t v34 = v35;
        }
        while (v30 != v35);
      }
    }
    if (v60)
    {
      swift_bridgeObjectRetain();
      sub_258EA9160();
      unint64_t v37 = v36;
      unint64_t v39 = v38;
      unint64_t v41 = v40;
      swift_release_n();
      unint64_t v42 = v41 >> 1;
      if ((v41 & 1) == 0) {
        goto LABEL_52;
      }
    }
    else
    {
      unint64_t v37 = v61;
      unint64_t v39 = v64;
      unint64_t v47 = (2 * v30) | 1;
      unint64_t v42 = v47 >> 1;
      if ((v47 & 1) == 0)
      {
LABEL_52:
        uint64_t v45 = v42 - v39;
        if (__OFSUB__(v42, v39)) {
          goto LABEL_80;
        }
        if (!v45) {
          goto LABEL_65;
        }
        goto LABEL_54;
      }
    }
    sub_258EA9200();
    swift_unknownObjectRetain_n();
    uint64_t v43 = swift_dynamicCastClass();
    if (!v43)
    {
      swift_unknownObjectRelease();
      uint64_t v43 = MEMORY[0x263F8EE78];
    }
    uint64_t v44 = *(void *)(v43 + 16);
    swift_release();
    uint64_t v45 = v42 - v39;
    if (__OFSUB__(v42, v39)) {
      goto LABEL_81;
    }
    if (v44 == v45)
    {
      uint64_t v46 = (void *)swift_dynamicCastClass();
      if (v46) {
        goto LABEL_66;
      }
      swift_unknownObjectRelease();
LABEL_65:
      uint64_t v46 = (void *)MEMORY[0x263F8EE78];
      goto LABEL_66;
    }
    swift_unknownObjectRelease();
    if (!v45) {
      goto LABEL_65;
    }
LABEL_54:
    uint64_t v48 = v45;
    if (v45 < 1)
    {
      uint64_t v46 = (void *)MEMORY[0x263F8EE78];
      if (v39 == v42) {
        goto LABEL_89;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
      uint64_t v46 = (void *)swift_allocObject();
      int64_t v49 = _swift_stdlib_malloc_size(v46);
      uint64_t v50 = v49 - 32;
      if (v49 < 32) {
        uint64_t v50 = v49 - 25;
      }
      v46[2] = v45;
      v46[3] = (2 * (v50 >> 3)) | 1;
      if (v39 == v42) {
        goto LABEL_89;
      }
    }
    if (v45 < 0) {
      goto LABEL_90;
    }
    unint64_t v51 = v37 + 8 * v39;
    if (v51 < (unint64_t)&v46[v48 + 4] && (unint64_t)(v46 + 4) < v51 + v48 * 8) {
      goto LABEL_90;
    }
    sub_258E7451C(0, &qword_26A0D05C0);
    swift_arrayInitWithCopy();
LABEL_66:
    swift_unknownObjectRelease();
    uint64_t v52 = v58(v46);
    swift_release();
    double v9 = v9 + (double)v52;
    uint64_t v8 = v63;
    if (v63 < v57)
    {
      unint64_t v7 = v64 + 1;
      if (v64 + 1 != v57) {
        continue;
      }
    }
    return swift_release();
  }
  while (1)
  {
    uint64_t v65 = v8 + 1;
    if (v74)
    {
      id v10 = (id)MEMORY[0x25A2D2D90]();
    }
    else
    {
      if (v8 < -1)
      {
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
        goto LABEL_74;
      }
      if ((unint64_t)(v8 + 1) >= *(void *)(v4 + 16)) {
        goto LABEL_73;
      }
      id v10 = *(id *)(v4 + 8 * v8 + 40);
    }
    id v11 = v10;
    uint64_t v63 = v8;
    id v12 = objc_msgSend(v10, sel_startDate);

    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
    unint64_t v72 = &v56;
    int64_t v14 = *(char **)(*(void *)(v13 - 8) + 64);
    MEMORY[0x270FA5388](v13 - 8);
    if (!v12) {
      break;
    }
    id v11 = (void *)sub_258EA8A80();
    uint64_t v15 = (void *)*((void *)v11 - 1);
    uint64_t v16 = v15[8];
    MEMORY[0x270FA5388](v11);
    unint64_t v4 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_258EA8A40();

    unint64_t v70 = (void (*)(char *, char *, void *))v15[4];
    v70((char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v56 - v4, v11);
    uint64_t v17 = (void (*)(char *, uint64_t, uint64_t, void *))v15[7];
    v17((char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v11);
    uint64_t v18 = (unsigned int (*)(char *, uint64_t, void *))v15[6];
    long long v68 = (char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v69 = v18;
    uint64_t v19 = ((uint64_t (*)(char *, uint64_t, void *))v18)(v68, 1, v11);
    if (v19 == 1) {
      goto LABEL_86;
    }
    MEMORY[0x270FA5388](v19);
    int64_t v66 = (char *)&v56 - v4;
    uint64_t v67 = v20;
    unint64_t v71 = v17;
    if (v74)
    {
      id v21 = (id)MEMORY[0x25A2D2D90](v64, v73);
    }
    else
    {
      if (v64 >= *(void *)(v73 + 16)) {
        goto LABEL_72;
      }
      id v21 = *(id *)(v61 + 8 * v64);
    }
    id v22 = v21;
    id v23 = objc_msgSend(v21, sel_startDate);

    uint64_t v25 = MEMORY[0x270FA5388](v24);
    int64_t v14 = (char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (!v23) {
      goto LABEL_87;
    }
    MEMORY[0x270FA5388](v25);
    sub_258EA8A40();

    v70(v14, (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    v71(v14, 0, 1, v11);
    if (v69(v14, 1, v11) == 1) {
      goto LABEL_88;
    }
    uint64_t v26 = v66;
    sub_258EA89F0();
    id v27 = (void (*)(char *, void *))v15[1];
    v27(v14, v11);
    sub_258E9869C((unint64_t *)&qword_26A0D0438);
    char v28 = v68;
    char v29 = sub_258EA8C20();
    v27(v26, v11);
    v27(v28, v11);
    unint64_t v4 = v73;
    if (v29) {
      goto LABEL_29;
    }
    uint64_t v8 = v65;
    if (v62 == v65)
    {
      uint64_t v63 = v62;
      goto LABEL_29;
    }
  }
  uint64_t v55 = sub_258EA8A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))((char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v55);
LABEL_86:
  __break(1u);
LABEL_87:
  v71(v14, 1, 1, v11);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
  swift_release();
  __break(1u);
LABEL_90:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E8B978(unint64_t a1)
{
  if (!(a1 >> 62)) {
    return *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_258EA9150();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_258E8B9D8(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v32 = MEMORY[0x263F8EE78];
  if (qword_26A0D01E0 != -1) {
    swift_once();
  }
  if ((sub_258E82A9C(a1, qword_26A0D0788) & 1) == 0)
  {
    id v6 = (id)BMMLSEDurableFeatureStorefeatureNameAsString();
    uint64_t v7 = sub_258EA8C50();
    uint64_t v9 = v8;

    sub_258E741E0();
    swift_allocError();
    *(void *)uint64_t v10 = v7;
    *(void *)(v10 + 8) = v9;
    *(unsigned char *)(v10 + 16) = 0;
    return swift_willThrow();
  }
  sub_258E96B88(v3, (uint64_t)v31);
  sub_258E96B88(v3, (uint64_t)v30);
  sub_258E96B88(v3, (uint64_t)v29);
  sub_258E96B88(v3, (uint64_t)v28);
  sub_258E96B88(v3, (uint64_t)v27);
  sub_258E96B88(v3, (uint64_t)v26);
  sub_258E96B88(v3, (uint64_t)v25);
  sub_258E62F68(v24, a1);
  if (v2)
  {
    sub_258E96BC0((uint64_t)v25);
    sub_258E96BC0((uint64_t)v26);
    sub_258E96BC0((uint64_t)v27);
    sub_258E96BC0((uint64_t)v28);
    sub_258E96BC0((uint64_t)v29);
    sub_258E96BC0((uint64_t)v30);
    sub_258E96BC0((uint64_t)v31);
    return swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0430);
  if (swift_dynamicCast())
  {
    sub_258E96BC0((uint64_t)v25);
    sub_258E96BC0((uint64_t)v27);
    swift_bridgeObjectRelease();
    switch(v23 >> 61)
    {
      case 1uLL:
        sub_258E74288(v16[5], v16[6], v17, v18, v19, v20, v21, v22, v23);
        sub_258E96BC0((uint64_t)v28);
        sub_258E96BC0((uint64_t)v29);
        sub_258E96BC0((uint64_t)v30);
        sub_258E96BC0((uint64_t)v31);
        sub_258E62F68(v16, a1);
        uint64_t v14 = sub_258E8F7B8((uint64_t)v16, (uint64_t)v26, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        uint64_t v15 = v26;
        goto LABEL_22;
      case 2uLL:
        swift_release();
        swift_release();
        sub_258E96BC0((uint64_t)v26);
        sub_258E96BC0((uint64_t)v28);
        sub_258E96BC0((uint64_t)v30);
        sub_258E96BC0((uint64_t)v31);
        sub_258E62F68(v16, a1);
        uint64_t v14 = sub_258E8D948((uint64_t)v16, (uint64_t)v29, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        uint64_t v15 = v29;
        goto LABEL_22;
      case 3uLL:
        sub_258E743A8(v17);
        swift_bridgeObjectRelease();
        sub_258E96BC0((uint64_t)v26);
        sub_258E96BC0((uint64_t)v28);
        sub_258E96BC0((uint64_t)v29);
        sub_258E96BC0((uint64_t)v31);
        sub_258E62F68(v16, a1);
        uint64_t v14 = sub_258E8C2F4((uint64_t)v16, v30, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        uint64_t v15 = v30;
        goto LABEL_22;
      case 4uLL:
        swift_release();
        swift_release();
        sub_258E96BC0((uint64_t)v26);
        sub_258E96BC0((uint64_t)v29);
        sub_258E96BC0((uint64_t)v30);
        sub_258E96BC0((uint64_t)v31);
        sub_258E62F68(v16, a1);
        uint64_t v14 = sub_258E8E2E0((uint64_t)v16, (uint64_t)v28, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        uint64_t v15 = v28;
LABEL_22:
        sub_258E96BC0((uint64_t)v15);
        break;
      default:
        sub_258E743A8(v17);

        sub_258E96BC0((uint64_t)v26);
        sub_258E96BC0((uint64_t)v28);
        sub_258E96BC0((uint64_t)v29);
        sub_258E96BC0((uint64_t)v30);
        sub_258E62F68(v16, a1);
        uint64_t v14 = sub_258E8C07C((uint64_t)v16, (uint64_t)v31, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        sub_258E96BC0((uint64_t)v31);
        break;
    }
    goto LABEL_23;
  }
  sub_258E96BC0((uint64_t)v26);
  sub_258E96BC0((uint64_t)v28);
  sub_258E96BC0((uint64_t)v29);
  sub_258E96BC0((uint64_t)v30);
  sub_258E96BC0((uint64_t)v31);
  if (!swift_dynamicCast())
  {
    sub_258E96BC0((uint64_t)v25);
    sub_258E96BC0((uint64_t)v27);
    swift_bridgeObjectRelease();
    sub_258E741E0();
    swift_allocError();
    *(void *)uint64_t v12 = 0xD000000000000013;
    *(void *)(v12 + 8) = 0x8000000258EB3BF0;
    *(unsigned char *)(v12 + 16) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
  if (LOBYTE(v16[0]))
  {
    if (LOBYTE(v16[0]) != 1)
    {
      sub_258E96BC0((uint64_t)v27);
      swift_bridgeObjectRelease();
      uint64_t v14 = sub_258E90BDC((uint64_t)v25);
      sub_258E96BC0((uint64_t)v25);
      goto LABEL_23;
    }
    sub_258E96BC0((uint64_t)v25);
    uint64_t v11 = 0;
  }
  else
  {
    sub_258E96BC0((uint64_t)v25);
    uint64_t v11 = 1;
  }
  sub_258E8F320(v11, (uint64_t)v27, &v32, a1);
  uint64_t v14 = v13;
  sub_258E96BC0((uint64_t)v27);
  swift_bridgeObjectRelease();
LABEL_23:
  swift_beginAccess();
  uint64_t v32 = v14;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  swift_beginAccess();
  return v32;
}

uint64_t sub_258E8C07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_258E7D330(a1, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0430);
  if (!swift_dynamicCast()) {
    goto LABEL_7;
  }
  if (v27 >> 61)
  {
    sub_258E74288(v18, v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_7:
    sub_258E741E0();
    swift_allocError();
    *(_OWORD *)uint64_t v8 = xmmword_258EAA8B0;
    *(unsigned char *)(v8 + 16) = 1;
    swift_willThrow();
    return v3;
  }
  uint64_t v3 = *(void *)(a2 + 24);
  id v7 = sub_258E82290((uint64_t)v23, *(void *)(a2 + 8));
  if (v4)
  {
  }
  else
  {
    uint64_t v10 = (uint64_t)v7;
    sub_258EA8DD0();
    id v11 = sub_258E8A510(v10, v18, v20 & 1, v21, v22);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_258EAA8C0;
    sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
    id v12 = v11;
    uint64_t v13 = (void *)sub_258EA8F00();
    id v14 = objc_allocWithZone(MEMORY[0x263F2A1E0]);
    uint64_t v15 = (void *)sub_258EA8C30();
    id v16 = objc_msgSend(v14, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v15, a3, v12, v13);

    uint64_t v17 = v29;
    *(void *)(v29 + 32) = v16;
    uint64_t v19 = v17;
    sub_258EA8D60();
    uint64_t v3 = v19;
  }
  sub_258E743A8(v21);
  return v3;
}

uint64_t sub_258E8C2F4(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v126 = a2;
  sub_258E7D330(a1, (uint64_t)v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0430);
  if (!swift_dynamicCast()) {
    goto LABEL_6;
  }
  uint64_t v6 = v4;
  uint64_t v7 = v149;
  uint64_t v8 = v152;
  char v9 = v153;
  unint64_t v3 = v154;
  uint64_t v10 = v156;
  if (v155 >> 61 != 3)
  {
    uint64_t v119 = v156;
    sub_258E74288(v147, v148, v149, v150, v151, v152, v153, v154, v155);
LABEL_6:
    sub_258E741E0();
    swift_allocError();
    *(_OWORD *)uint64_t v13 = xmmword_258EAA8B0;
    *(unsigned char *)(v13 + 16) = 1;
    swift_willThrow();
    return v3;
  }
  uint64_t v136 = v150;
  uint64_t v135 = v148;
  unint64_t v132 = v147;
  uint64_t v133 = v151;
  if (v155)
  {
    unint64_t v12 = MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_258EAA8C0;
    *(void *)(v11 + 32) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v3);
    unint64_t v147 = v11;
    sub_258EA8D60();
    unint64_t v12 = v11;
  }
  unsigned int v121 = a3;
  uint64_t v138 = v7;
  uint64_t v15 = (void *)MEMORY[0x263F8EE78];
  unint64_t v16 = MEMORY[0x263F8EE78];
  if ((v9 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_258EAA8C0;
    *(void *)(v17 + 32) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v8);
    unint64_t v147 = v17;
    sub_258EA8D60();
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
    unint64_t v16 = v17;
  }
  v157[0] = v15;
  unint64_t v18 = v126[48];
  uint64_t v158 = MEMORY[0x263F8EE88];
  uint64_t v19 = *(void *)(v18 + 56);
  unint64_t v134 = v18 + 56;
  uint64_t v20 = 1 << *(unsigned char *)(v18 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v3 = v21 & v19;
  int64_t v137 = (unint64_t)(v20 + 63) >> 6;
  unint64_t v143 = v18;
  swift_bridgeObjectRetain();
  uint64_t v22 = 0;
  unint64_t v130 = MEMORY[0x263F8EE80];
  long long v139 = xmmword_258EAA3B0;
  os_log_type_t v125 = v15;
  uint64_t v23 = v6;
  char v140 = v10;
  unint64_t v142 = v12;
  unint64_t v141 = v16;
  if (!v3) {
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v144 = (v3 - 1) & v3;
  uint64_t v145 = v22;
  for (unint64_t i = __clz(__rbit64(v3)) | (v22 << 6); ; unint64_t i = __clz(__rbit64(v27)) + (v26 << 6))
  {
    uint64_t v29 = (uint64_t *)(*(void *)(v143 + 48) + 16 * i);
    uint64_t v30 = *v29;
    uint64_t v31 = v29[1];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0510);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v139;
    *(void *)(inited + 32) = v30;
    unint64_t v3 = inited + 32;
    *(void *)(inited + 40) = v31;
    uint64_t v33 = v126[1];
    unint64_t v34 = (void *)v126[3];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_258EA5978(inited, v142, v141, 0, 0, 0, 1, v33, v34);
    if (v23)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_arrayDestroy();
      sub_258E743A8(v138);
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v3;
    }
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_258EA8DD0();
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_258EA9150();
      swift_bridgeObjectRelease();
      if (!v37)
      {
LABEL_29:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v10 = v140;
        goto LABEL_30;
      }
    }
    else if (!*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_29;
    }
    uint64_t v38 = v158;
    swift_bridgeObjectRetain();
    char v39 = sub_258E98DE0(v30, v31, v38);
    swift_bridgeObjectRelease();
    if (v39)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_258E9DD28((uint64_t *)&v147, v30, v31);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        os_log_type_t v125 = sub_258E9C9D8(0, v125[2] + 1, 1, v125);
      }
      unint64_t v41 = v125[2];
      unint64_t v40 = v125[3];
      if (v41 >= v40 >> 1) {
        os_log_type_t v125 = sub_258E9C9D8((void *)(v40 > 1), v41 + 1, 1, v125);
      }
      unint64_t v42 = v125;
      v125[2] = v41 + 1;
      uint64_t v43 = &v42[2 * v41];
      v43[4] = v30;
      v43[5] = v31;
    }
    uint64_t v44 = sub_258EA6540(v36, (char)v133);
    swift_bridgeObjectRelease();
    sub_258EA8DD0();
    uint64_t v10 = v140;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v147 = v130;
    sub_258E96860(v44, (uint64_t)sub_258E976E0, 0, isUniquelyReferenced_nonNull_native, &v147);
    uint64_t v23 = 0;
    unint64_t v130 = v147;
    swift_bridgeObjectRelease();
LABEL_30:
    uint64_t v22 = v145;
    unint64_t v3 = v144;
    if (v144) {
      goto LABEL_14;
    }
LABEL_15:
    BOOL v25 = __OFADD__(v22, 1);
    int64_t v26 = v22 + 1;
    if (v25) {
      goto LABEL_152;
    }
    if (v26 >= v137) {
      goto LABEL_46;
    }
    unint64_t v27 = *(void *)(v134 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_25:
    uint64_t v144 = (v27 - 1) & v27;
    uint64_t v145 = v26;
  }
  int64_t v28 = v26 + 1;
  if (v26 + 1 >= v137) {
    goto LABEL_46;
  }
  unint64_t v27 = *(void *)(v134 + 8 * v28);
  if (v27) {
    goto LABEL_24;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v137) {
    goto LABEL_46;
  }
  unint64_t v27 = *(void *)(v134 + 8 * v28);
  if (v27) {
    goto LABEL_24;
  }
  int64_t v28 = v26 + 3;
  if (v26 + 3 >= v137) {
    goto LABEL_46;
  }
  unint64_t v27 = *(void *)(v134 + 8 * v28);
  if (v27)
  {
LABEL_24:
    int64_t v26 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      goto LABEL_155;
    }
    if (v26 >= v137) {
      break;
    }
    unint64_t v27 = *(void *)(v134 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_46:
  uint64_t v145 = v23;
  uint64_t v23 = v138;
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v123 = v125[2];
  if (!v123)
  {
    swift_bridgeObjectRetain();
LABEL_145:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v3 = v157[0];
    if ((v157[0] & 0x8000000000000000) != 0 || (v157[0] & 0x4000000000000000) != 0) {
      goto LABEL_156;
    }
    unint64_t v116 = v157[0] & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
LABEL_148:
    unint64_t v147 = v116;
    uint64_t v117 = v145;
    sub_258E93508((uint64_t *)&v147, (uint64_t (*)(uint64_t))sub_258E986F0, &qword_26A0D0478, 0x263F2A1E0, (SEL *)&selRef_itemIdentifier);
    if (v117) {
      goto LABEL_158;
    }
    sub_258E743A8(v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v3 = v147;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v3;
  }
  os_log_type_t v122 = v125 + 4;
  unint64_t v127 = v130 + 64;
  swift_bridgeObjectRetain();
  unint64_t v46 = 0;
  while (1)
  {
    if (v46 >= v125[2]) {
      goto LABEL_154;
    }
    unint64_t v47 = &v122[2 * v46];
    int64_t v48 = *v47;
    int64_t v49 = v47[1];
    swift_bridgeObjectRetain();
    uint64_t v50 = v145;
    sub_258EA8DD0();
    uint64_t v145 = v50;
    if (v50)
    {
      sub_258E743A8(v23);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v3;
    }
    uint64_t v51 = v126[48];
    if (*(void *)(v51 + 16)) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_49:
    if (++v46 == v123) {
      goto LABEL_145;
    }
  }
  unint64_t v124 = v46;
  sub_258EA9270();
  sub_258EA8C80();
  unint64_t v3 = (unint64_t)&v147;
  uint64_t v52 = sub_258EA9290();
  uint64_t v53 = -1 << *(unsigned char *)(v51 + 32);
  unint64_t v54 = v52 & ~v53;
  if (((*(void *)(v51 + 56 + ((v54 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v54) & 1) == 0)
  {
LABEL_138:
    swift_bridgeObjectRelease();
LABEL_139:
    uint64_t v23 = v138;
LABEL_140:
    unint64_t v46 = v124;
    goto LABEL_49;
  }
  unint64_t v3 = *(void *)(v51 + 48);
  uint64_t v55 = (void *)(v3 + 16 * v54);
  BOOL v56 = *v55 == v48 && v55[1] == v49;
  int64_t v137 = v48;
  if (!v56 && (sub_258EA91E0() & 1) == 0)
  {
    do
    {
      unint64_t v54 = (v54 + 1) & ~v53;
      if (((*(void *)(v51 + 56 + ((v54 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v54) & 1) == 0) {
        goto LABEL_138;
      }
      uint64_t v113 = (void *)(v3 + 16 * v54);
      BOOL v114 = *v113 == v137 && v113[1] == v49;
    }
    while (!v114 && (sub_258EA91E0() & 1) == 0);
  }
  unint64_t v3 = MEMORY[0x263F8EE78];
  unint64_t v147 = MEMORY[0x263F8EE78];
  uint64_t v57 = 1 << *(unsigned char *)(v130 + 32);
  if (v57 < 64) {
    uint64_t v58 = ~(-1 << v57);
  }
  else {
    uint64_t v58 = -1;
  }
  unint64_t v59 = v58 & *(void *)(v130 + 64);
  int64_t v128 = (unint64_t)(v57 + 63) >> 6;
  swift_bridgeObjectRetain();
  int v60 = 0;
  uint64_t v23 = v138;
  unint64_t v134 = v49;
  while (v59)
  {
    unint64_t v61 = __clz(__rbit64(v59));
    uint64_t v62 = (v59 - 1) & v59;
    uint64_t v133 = v60;
    unint64_t v63 = v61 | ((void)v60 << 6);
LABEL_78:
    unint64_t v132 = v62;
    uint64_t v67 = *(void *)(*(void *)(v130 + 48) + 16 * v63);
    unint64_t v68 = *(void *)(*(void *)(v130 + 56) + 8 * v63);
    unint64_t v146 = v3;
    unint64_t v69 = *((void *)v10 + 2);
    uint64_t v70 = swift_bridgeObjectRetain();
    unint64_t v141 = v69;
    if (!v69) {
      goto LABEL_63;
    }
    uint64_t v129 = v67;
    uint64_t v131 = v70;
    unint64_t v143 = v68;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    LODWORD(v142) = 0;
    uint64_t v71 = 0;
    do
    {
      uint64_t v144 = v71;
      double v76 = *(double *)&v10[8 * v71 + 32];
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0510);
      uint64_t v77 = swift_initStackObject();
      *(_OWORD *)(v77 + 16) = v139;
      *(void *)(v77 + 32) = v137;
      *(void *)(v77 + 40) = v49;
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_258E9FB00(v77);
      uint64_t v79 = sub_258EA8A80();
      uint64_t v80 = *(void *)(v79 - 8);
      MEMORY[0x270FA5388](v79);
      os_log_type_t v82 = &v120[-((v81 + 15) & 0xFFFFFFFFFFFFFFF0)];
      uint64_t v83 = sub_258EA8A20();
      MEMORY[0x270FA5388](v83);
      uint64_t v118 = v78;
      uint64_t v119 = v82;
      unint64_t v84 = v143;
      swift_bridgeObjectRetain();
      uint64_t v85 = v145;
      uint64_t v86 = sub_258E899A0(sub_258E97FF4, (uint64_t)&v120[-32], v84);
      uint64_t v145 = v85;
      (*(void (**)(unsigned char *, uint64_t))(v80 + 8))(v82, v79);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_arrayDestroy();
      uint64_t v23 = v138;
      if (v138)
      {
        uint64_t v87 = swift_allocObject();
        uint64_t v88 = v136;
        *(void *)(v87 + 16) = v23;
        *(void *)(v87 + 24) = v88;
        uint64_t v89 = sub_258E986FC;
      }
      else
      {
        uint64_t v89 = sub_258E8B978;
        uint64_t v87 = 0;
      }
      sub_258E96C30(v23);
      int64_t v49 = v134;
      if (v135)
      {
        v89(v86);
        int64_t v90 = (void *)sub_258EA8E50();
        id v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v90, 0, 0, 0, 0);
      }
      else
      {
        sub_258E8B00C(v86, (uint64_t (*)(void *))v89, v87);
        int64_t v90 = (void *)sub_258EA8DF0();
        id v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v90, 0, 0, 0);
      }
      uint64_t v92 = v91;
      swift_bridgeObjectRelease();
      swift_release();

      if ((objc_msgSend(v92, sel_hasIntValue) & 1) == 0) {
        goto LABEL_85;
      }
      objc_msgSend(v92, sel_intValue);
      if ((v142 & 1) != 0
        || objc_msgSend(v92, sel_intValue)
        || objc_msgSend(v92, sel_BOOLValue))
      {
        sub_258E7451C(0, &qword_26A0D0458);
        if (v76 == 86400.0)
        {
          uint64_t v72 = 1;
          LODWORD(v142) = 1;
        }
        else
        {
          if (v76 == 604800.0)
          {
            LODWORD(v142) = 1;
LABEL_100:
            uint64_t v72 = 2;
            goto LABEL_82;
          }
          if (v76 == 2592000.0)
          {
            LODWORD(v142) = 1;
            uint64_t v72 = 3;
          }
          else
          {
            if (v76 != 7776000.0)
            {
              LODWORD(v142) = 1;
LABEL_109:
              if (v76 == 15552000.0) {
                uint64_t v72 = 5;
              }
              else {
                uint64_t v72 = 0;
              }
              goto LABEL_82;
            }
            LODWORD(v142) = 1;
            uint64_t v72 = 4;
          }
        }
      }
      else
      {
        objc_msgSend(v92, sel_doubleValue);
        LODWORD(v142) = v93 > 0.0;
        sub_258E7451C(0, &qword_26A0D0458);
        if (v76 == 86400.0)
        {
          uint64_t v72 = 1;
        }
        else
        {
          if (v76 == 604800.0) {
            goto LABEL_100;
          }
          if (v76 == 2592000.0)
          {
            uint64_t v72 = 3;
          }
          else
          {
            if (v76 != 7776000.0) {
              goto LABEL_109;
            }
            uint64_t v72 = 4;
          }
        }
      }
LABEL_82:
      unint64_t v73 = (void *)sub_258EA92A0();
      id v74 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInterval_value_, v72, v73);

      id v75 = v74;
      MEMORY[0x25A2D2A50]();
      if (*(void *)((v146 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v146 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_258EA8D70();
      }
      sub_258EA8D90();
      sub_258EA8D60();

LABEL_85:
      uint64_t v71 = v144 + 1;

      uint64_t v10 = v140;
    }
    while (v141 != v71);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v142 & 1) == 0)
    {
LABEL_63:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_64;
    }
    os_log_type_t v94 = (void *)sub_258EA8DB0();
    id v95 = objc_allocWithZone(MEMORY[0x263F2A208]);
    id v96 = (void *)sub_258EA8C30();
    swift_bridgeObjectRelease();
    sub_258E7451C(0, &qword_26A0D0458);
    int64_t v97 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v98 = objc_msgSend(v95, sel_initWithBucketName_hasEver_counts_, v96, v94, v97);

    id v99 = v98;
    MEMORY[0x25A2D2A50]();
    if (*(void *)((v147 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v147 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_258EA8D70();
    }
    sub_258EA8D90();
    sub_258EA8D60();

LABEL_64:
    unint64_t v3 = MEMORY[0x263F8EE78];
    int v60 = v133;
    unint64_t v59 = v132;
  }
  BOOL v25 = __OFADD__(v60, 1);
  int64_t v64 = (int64_t)v60 + 1;
  if (v25)
  {
    __break(1u);
LABEL_152:
    __break(1u);
    goto LABEL_153;
  }
  if (v64 >= v128) {
    goto LABEL_122;
  }
  unint64_t v65 = *(void *)(v127 + 8 * v64);
  if (v65) {
    goto LABEL_77;
  }
  int64_t v66 = v64 + 1;
  if (v64 + 1 >= v128) {
    goto LABEL_122;
  }
  unint64_t v65 = *(void *)(v127 + 8 * v66);
  if (v65) {
    goto LABEL_76;
  }
  int64_t v66 = v64 + 2;
  if (v64 + 2 >= v128) {
    goto LABEL_122;
  }
  unint64_t v65 = *(void *)(v127 + 8 * v66);
  if (v65) {
    goto LABEL_76;
  }
  int64_t v66 = v64 + 3;
  if (v64 + 3 < v128)
  {
    unint64_t v65 = *(void *)(v127 + 8 * v66);
    if (!v65)
    {
      while (1)
      {
        int64_t v64 = v66 + 1;
        if (__OFADD__(v66, 1)) {
          break;
        }
        if (v64 >= v128) {
          goto LABEL_122;
        }
        unint64_t v65 = *(void *)(v127 + 8 * v64);
        ++v66;
        if (v65) {
          goto LABEL_77;
        }
      }
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      swift_bridgeObjectRetain_n();
      unint64_t v116 = (unint64_t)sub_258E935B4(v3, (void (*)(void *, uint64_t, unint64_t))sub_258E96E60);
      swift_bridgeObjectRelease();
      goto LABEL_148;
    }
LABEL_76:
    int64_t v64 = v66;
LABEL_77:
    uint64_t v62 = (v65 - 1) & v65;
    uint64_t v133 = (void *)v64;
    unint64_t v63 = __clz(__rbit64(v65)) + (v64 << 6);
    goto LABEL_78;
  }
LABEL_122:
  swift_release();
  unint64_t v3 = v147;
  if (v147 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v115 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (v115 > 0) {
      goto LABEL_124;
    }
LABEL_142:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_140;
  }
  if (*(uint64_t *)((v147 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0) {
    goto LABEL_142;
  }
LABEL_124:
  if ((v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v100 = (uint64_t)sub_258E935B4(v3, (void (*)(void *, uint64_t, unint64_t))sub_258E97080);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v100 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  uint64_t v101 = v145;
  unint64_t v146 = v100;
  sub_258E93508((uint64_t *)&v146, (uint64_t (*)(uint64_t))sub_258E972B4, &qword_26A0D0460, 0x263F2A208, (SEL *)&selRef_bucketName);
  if (!v101)
  {
    swift_bridgeObjectRelease();
    unint64_t v102 = v146;
    swift_bridgeObjectRelease();
    unint64_t v147 = v102;
    id v103 = objc_allocWithZone(MEMORY[0x263F2A1F8]);
    sub_258E7451C(0, &qword_26A0D0460);
    uint64_t v104 = (void *)sub_258EA8D30();
    swift_release();
    id v105 = objc_msgSend(v103, sel_initWithBucketList_, v104);

    id v106 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, 0, v105);
    sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
    id v107 = v106;
    unsigned __int8 v108 = (void *)sub_258EA8F00();
    id v109 = objc_allocWithZone(MEMORY[0x263F2A1E0]);
    uint64_t v110 = (void *)sub_258EA8C30();
    swift_bridgeObjectRelease();
    id v111 = objc_msgSend(v109, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v110, v121, v107, v108);

    id v112 = v111;
    unint64_t v3 = (unint64_t)v157;
    MEMORY[0x25A2D2A50]();
    if (*(void *)((v157[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v157[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_258EA8D70();
    }
    sub_258EA8D90();
    sub_258EA8D60();

    uint64_t v145 = 0;
    goto LABEL_139;
  }
  swift_release();
  __break(1u);
LABEL_158:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_258E8D948(uint64_t a1, uint64_t a2, int a3)
{
  LODWORD(v4) = a3;
  sub_258E7D330(a1, (uint64_t)v95);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0430);
  if (!swift_dynamicCast()) {
    goto LABEL_6;
  }
  unint64_t v7 = (unint64_t)v86;
  uint64_t v6 = v87;
  uint64_t isUniquelyReferenced_nonNull_native = v89;
  if (v94 >> 61 != 2)
  {
    sub_258E74288((uint64_t)v86, v87, (uint64_t)v88, v89, v90, v91, v92, v93, v94);
LABEL_6:
    sub_258E741E0();
    swift_allocError();
    *(_OWORD *)uint64_t v11 = xmmword_258EAA8B0;
    *(unsigned char *)(v11 + 16) = 1;
    return swift_willThrow();
  }
  uint64_t v81 = v88;
  v95[0] = MEMORY[0x263F8EE78];
  id v9 = objc_msgSend(self, sel_predicateWithValue_, 1);
  id v10 = sub_258E82290((uint64_t)v9, *(void *)(a2 + 8));
  if (v3)
  {

    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  unint64_t v13 = (unint64_t)v10;
  sub_258EA8DD0();
  id v14 = 0;
  unint64_t v96 = sub_258E75390(MEMORY[0x263F8EE78]);
  int64_t v82 = v13;
  if (v13 >> 62) {
    goto LABEL_91;
  }
  uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v74 = a2;
    id v75 = v9;
    unsigned int v73 = v4;
    double v76 = (void *)isUniquelyReferenced_nonNull_native;
    uint64_t v77 = v14;
    if (!v15)
    {
      uint64_t isUniquelyReferenced_nonNull_native = v96;
      unint64_t v16 = v82;
LABEL_44:
      swift_bridgeObjectRelease();
      sub_258EA8DD0();
      if (v77)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
        swift_release();
        return swift_bridgeObjectRelease();
      }
      unint64_t v96 = isUniquelyReferenced_nonNull_native;
      id v9 = v76;
      swift_retain();
      unint64_t v44 = sub_258E97C3C(v16, v81);
      swift_bridgeObjectRelease();
      swift_release();
      swift_retain();
      uint64_t v45 = sub_258E97AAC(v44, (uint64_t (*)(id))v7);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v4 = sub_258E9FB00((uint64_t)v45);
      swift_bridgeObjectRelease();
      sub_258EA8DD0();
      id v14 = 0;
      unint64_t v46 = v75;
      uint64_t v84 = v4;
      uint64_t v6 = 0;
      uint64_t v81 = (uint64_t (*)(void *))(v96 + 64);
      uint64_t v47 = 1 << *(unsigned char *)(v96 + 32);
      if (v47 < 64) {
        uint64_t v48 = ~(-1 << v47);
      }
      else {
        uint64_t v48 = -1;
      }
      unint64_t v49 = v48 & *(void *)(v96 + 64);
      int64_t v82 = (unint64_t)(v47 + 63) >> 6;
      uint64_t v50 = v74;
      while (1)
      {
        do
        {
          if (v49)
          {
            unint64_t v51 = __clz(__rbit64(v49));
            v49 &= v49 - 1;
            unint64_t v52 = v51 | (v6 << 6);
          }
          else
          {
            int64_t v53 = v6 + 1;
            uint64_t isUniquelyReferenced_nonNull_native = v96;
            if (__OFADD__(v6, 1)) {
              goto LABEL_90;
            }
            LODWORD(v4) = v84;
            if (v53 >= v82)
            {
LABEL_86:
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();

              swift_release();
              return v95[0];
            }
            unint64_t v54 = *((void *)v81 + v53);
            ++v6;
            if (!v54)
            {
              uint64_t v6 = v53 + 1;
              if (v53 + 1 >= v82) {
                goto LABEL_86;
              }
              unint64_t v54 = *((void *)v81 + v6);
              if (!v54)
              {
                uint64_t v6 = v53 + 2;
                if (v53 + 2 >= v82) {
                  goto LABEL_86;
                }
                unint64_t v54 = *((void *)v81 + v6);
                if (!v54)
                {
                  int64_t v55 = v53 + 3;
                  if (v55 >= v82) {
                    goto LABEL_86;
                  }
                  unint64_t v54 = *((void *)v81 + v55);
                  if (!v54)
                  {
                    while (1)
                    {
                      uint64_t v6 = v55 + 1;
                      if (__OFADD__(v55, 1)) {
                        break;
                      }
                      if (v6 >= v82) {
                        goto LABEL_86;
                      }
                      unint64_t v54 = *((void *)v81 + v6);
                      ++v55;
                      if (v54) {
                        goto LABEL_67;
                      }
                    }
                    __break(1u);
                    goto LABEL_93;
                  }
                  uint64_t v6 = v55;
                }
              }
            }
LABEL_67:
            unint64_t v49 = (v54 - 1) & v54;
            unint64_t v52 = __clz(__rbit64(v54)) + (v6 << 6);
          }
          uint64_t v56 = *(void *)(v50 + 384);
        }
        while (!*(void *)(v56 + 16));
        uint64_t v57 = 16 * v52;
        uint64_t v58 = (uint64_t *)(*(void *)(v96 + 48) + v57);
        uint64_t v59 = *v58;
        a2 = v58[1];
        int v60 = (uint64_t *)(*(void *)(v96 + 56) + v57);
        unint64_t v7 = v60[1];
        uint64_t v85 = *v60;
        sub_258EA9270();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_258EA8C80();
        uint64_t v61 = sub_258EA9290();
        uint64_t v4 = -1 << *(unsigned char *)(v56 + 32);
        unint64_t v62 = v61 & ~v4;
        uint64_t v63 = v56 + 56;
        if (((*(void *)(v56 + 56 + ((v62 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v62) & 1) == 0) {
          goto LABEL_50;
        }
        uint64_t v64 = *(void *)(v56 + 48);
        unint64_t v65 = (void *)(v64 + 16 * v62);
        BOOL v66 = *v65 == v59 && v65[1] == a2;
        if (!v66 && (sub_258EA91E0() & 1) == 0) {
          break;
        }
LABEL_75:
        sub_258E98DE0(v85, v7, v84);
        swift_bridgeObjectRelease();
        uint64_t v67 = (void *)sub_258EA8DB0();
        id v68 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v67, 0);

        sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
        unint64_t v69 = (void *)sub_258EA8F00();
        id v70 = objc_allocWithZone(MEMORY[0x263F2A1E0]);
        uint64_t v4 = sub_258EA8C30();
        swift_bridgeObjectRelease();
        objc_msgSend(v70, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v4, v73, v68, v69);

        MEMORY[0x25A2D2A50]();
        if (*(void *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_258EA8D70();
        }
        sub_258EA8D90();
        sub_258EA8D60();
LABEL_51:
        id v9 = v76;
        id v14 = 0;
        uint64_t v50 = v74;
        unint64_t v46 = v75;
      }
      uint64_t v4 = ~v4;
      while (1)
      {
        unint64_t v62 = (v62 + 1) & v4;
        if (((*(void *)(v63 + ((v62 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v62) & 1) == 0) {
          break;
        }
        uint64_t v71 = (void *)(v64 + 16 * v62);
        BOOL v72 = *v71 == v59 && v71[1] == a2;
        if (v72 || (sub_258EA91E0() & 1) != 0) {
          goto LABEL_75;
        }
      }
LABEL_50:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_51;
    }
    id v9 = (id)v15;
    unint64_t v16 = v82;
    a2 = 4;
    uint64_t isUniquelyReferenced_nonNull_native = v96;
    id v78 = v9;
    unint64_t v79 = v7;
    uint64_t v80 = v6;
LABEL_15:
    id v18 = (v82 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2D2D90](a2 - 4, v16) : *(id *)(v16 + 8 * a2);
    uint64_t v4 = (uint64_t)v18;
    if (!__OFADD__(a2 - 4, 1)) {
      break;
    }
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_258EA9150();
    swift_bridgeObjectRelease();
  }
  unint64_t v96 = a2 - 3;
  id v14 = (uint64_t *)v6;
  ((void (*)(id))v7)(v18);
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_13;
  }
  id v21 = objc_msgSend((id)v4, sel_domainIdentifier);
  if (v21)
  {

    id v22 = objc_msgSend((id)v4, sel_domainIdentifier);
    if (v22) {
      goto LABEL_25;
    }
LABEL_13:

    id v17 = (id)v96;
LABEL_14:
    ++a2;
    if (v17 == v9) {
      goto LABEL_44;
    }
    goto LABEL_15;
  }
  id v14 = (uint64_t *)off_26543F000;
  id v23 = objc_msgSend((id)v4, sel_derivedIntentIdentifier);
  if (!v23) {
    goto LABEL_13;
  }

  id v22 = objc_msgSend((id)v4, sel_derivedIntentIdentifier);
  if (!v22) {
    goto LABEL_13;
  }
LABEL_25:

  id v24 = objc_msgSend((id)v4, sel_domainIdentifier);
  if (v24)
  {

    id v25 = objc_msgSend((id)v4, sel_domainIdentifier);
  }
  else
  {
    id v26 = objc_msgSend((id)v4, sel_derivedIntentIdentifier);
    if (!v26) {
      goto LABEL_93;
    }

    id v25 = objc_msgSend((id)v4, sel_derivedIntentIdentifier);
  }
  id v27 = v25;
  if (v27)
  {
    uint64_t v28 = sub_258EA8C50();
    uint64_t v30 = v29;

    uint64_t v83 = ((uint64_t (*)(uint64_t))v7)(v4);
    if (!v31) {
      goto LABEL_94;
    }
    id v9 = v31;
    id v14 = (uint64_t *)isUniquelyReferenced_nonNull_native;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v86 = v14;
    unint64_t v7 = sub_258E78DD0(v28, v30);
    uint64_t v33 = v14[2];
    BOOL v34 = (v32 & 1) == 0;
    uint64_t v35 = v33 + v34;
    if (__OFADD__(v33, v34)) {
      goto LABEL_88;
    }
    uint64_t v6 = v32;
    if (v14[3] >= v35)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v86;
        if ((v32 & 1) == 0) {
          goto LABEL_35;
        }
      }
      else
      {
        id v14 = (uint64_t *)&v86;
        sub_258E7B42C();
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v86;
        if ((v6 & 1) == 0) {
          goto LABEL_35;
        }
      }
    }
    else
    {
      sub_258E79230(v35, isUniquelyReferenced_nonNull_native);
      id v14 = v86;
      unint64_t v36 = sub_258E78DD0(v28, v30);
      if ((v6 & 1) != (v37 & 1)) {
        goto LABEL_95;
      }
      unint64_t v7 = v36;
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v86;
      if ((v6 & 1) == 0)
      {
LABEL_35:
        *(void *)(isUniquelyReferenced_nonNull_native + 8 * (v7 >> 6) + 64) |= 1 << v7;
        uint64_t v38 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v7);
        *uint64_t v38 = v28;
        v38[1] = v30;
        char v39 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 16 * v7);
        *char v39 = v83;
        v39[1] = (uint64_t)v9;
        uint64_t v40 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
        BOOL v41 = __OFADD__(v40, 1);
        uint64_t v42 = v40 + 1;
        if (v41) {
          goto LABEL_89;
        }
        *(void *)(isUniquelyReferenced_nonNull_native + 16) = v42;
        swift_bridgeObjectRetain();
        goto LABEL_40;
      }
    }
    uint64_t v43 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 16 * v7);
    swift_bridgeObjectRelease();
    *uint64_t v43 = v83;
    v43[1] = (uint64_t)v9;
LABEL_40:
    unint64_t v7 = v79;
    uint64_t v6 = v80;
    id v9 = v78;
    id v17 = (id)v96;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v16 = v82;
    goto LABEL_14;
  }
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  uint64_t result = sub_258EA9220();
  __break(1u);
  return result;
}

uint64_t sub_258E8E2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_258E7D330(a1, (uint64_t)v139);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0430);
  if (!swift_dynamicCast()) {
    goto LABEL_6;
  }
  unint64_t v6 = v131;
  unint64_t v8 = v132;
  unint64_t v7 = v133;
  if (v138 >> 61 != 4)
  {
    sub_258E74288(v129, v131, v132, v133, v134, v135, v136, v137, v138);
LABEL_6:
    sub_258E741E0();
    swift_allocError();
    *(_OWORD *)uint64_t v11 = xmmword_258EAA8B0;
    *(unsigned char *)(v11 + 16) = 1;
    swift_willThrow();
    return a3;
  }
  unint64_t v116 = (uint64_t (*)(void *))v129;
  unsigned int v113 = a3;
  v139[0] = MEMORY[0x263F8EE78];
  uint64_t v9 = (uint64_t)objc_msgSend(self, sel_predicateWithValue_, 1);
  a3 = *(void *)(a2 + 24);
  id v10 = sub_258E82290(v9, *(void *)(a2 + 8));
  if (v3)
  {

    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return a3;
  }
  unint64_t v12 = (unint64_t)v10;
  uint64_t v112 = a2;
  sub_258EA8DD0();
  unint64_t v125 = sub_258E75928(MEMORY[0x263F8EE78]);
  uint64_t v119 = 0;
  if (v12 >> 62) {
    goto LABEL_132;
  }
  uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_11:
  unint64_t v117 = v6;
  unint64_t v118 = v7;
  id v111 = (void *)v9;
  unint64_t v120 = v12;
  unint64_t v140 = v14;
  if (v14)
  {
    if (v14 < 1) {
      goto LABEL_134;
    }
    uint64_t v15 = 0;
    unint64_t v126 = v12 & 0xC000000000000001;
    do
    {
      if (v126) {
        id v16 = (id)MEMORY[0x25A2D2D90](v15, v12);
      }
      else {
        id v16 = *(id *)(v12 + 8 * v15 + 32);
      }
      id v17 = v16;
      unint64_t v18 = v8;
      uint64_t v19 = ((uint64_t (*)(void))v8)();
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v122 = v19;
        id v22 = objc_msgSend(v17, sel_domainIdentifier);
        if (v22)
        {

          id v23 = objc_msgSend(v17, sel_domainIdentifier);
        }
        else
        {
          id v24 = objc_msgSend(v17, sel_derivedIntentIdentifier);
          if (!v24) {
            goto LABEL_26;
          }

          id v23 = objc_msgSend(v17, sel_derivedIntentIdentifier);
        }
        id v25 = v23;
        if (!v25)
        {
LABEL_26:

          swift_bridgeObjectRelease();
          goto LABEL_15;
        }
        uint64_t v26 = sub_258EA8C50();
        uint64_t v28 = v27;

        uint64_t v29 = sub_258E82608();
        uint64_t v31 = v30;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v33 = v31;
        unint64_t v12 = v120;
        uint64_t v34 = v26;
        unint64_t v7 = v118;
        sub_258E9D4F0(v122, v21, v29, v33, v34, v28, isUniquelyReferenced_nonNull_native);

        unint64_t v6 = v117;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
      }
LABEL_15:
      ++v15;
      uint64_t v14 = v140;
      unint64_t v8 = v18;
    }
    while (v140 != v15);
  }
  swift_bridgeObjectRelease();
  sub_258EA8DD0();
  uint64_t v35 = v119;
  id v109 = (uint64_t (*)(id))v8;
  unint64_t v8 = sub_258E75A68(MEMORY[0x263F8EE78]);
  if (v14)
  {
    id v106 = 0;
    id v107 = 0;
    unint64_t v108 = v12 & 0xC000000000000001;
    uint64_t v9 = 4;
    uint64_t v119 = 0;
    while (1)
    {
      if (v108) {
        id v36 = (id)MEMORY[0x25A2D2D90](v9 - 4, v12);
      }
      else {
        id v36 = *(id *)(v12 + 8 * v9);
      }
      char v37 = v36;
      unint64_t v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
      {
        __break(1u);
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
LABEL_129:
        __break(1u);
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        swift_bridgeObjectRetain();
        uint64_t v14 = sub_258EA9150();
        goto LABEL_11;
      }
      uint64_t v123 = v109(v36);
      if (!v38) {
        goto LABEL_30;
      }
      uint64_t v127 = v38;
      if ((v116(v37) & 1) == 0) {
        break;
      }
      uint64_t v39 = sub_258E82608();
      uint64_t v41 = v40;
      sub_258E743A8((uint64_t)v107);
      unint64_t v7 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v6 = sub_258E78DD0(v39, v41);
      uint64_t v43 = *(void *)(v8 + 16);
      BOOL v44 = (v42 & 1) == 0;
      uint64_t v45 = v43 + v44;
      if (__OFADD__(v43, v44)) {
        goto LABEL_127;
      }
      char v46 = v42;
      if (*(void *)(v8 + 24) >= v45)
      {
        if ((v7 & 1) == 0) {
          sub_258E7CA48();
        }
      }
      else
      {
        sub_258E7A498(v45, v7);
        unint64_t v47 = sub_258E78DD0(v39, v41);
        if ((v46 & 1) != (v48 & 1)) {
          goto LABEL_135;
        }
        unint64_t v6 = v47;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if ((v46 & 1) == 0)
      {
        unint64_t v49 = sub_258E75B84(MEMORY[0x263F8EE78]);
        *(void *)(v8 + 8 * (v6 >> 6) + 64) |= 1 << v6;
        uint64_t v50 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v6);
        *uint64_t v50 = v39;
        v50[1] = v41;
        *(void *)(*(void *)(v8 + 56) + 8 * v6) = v49;
        uint64_t v51 = *(void *)(v8 + 16);
        BOOL v52 = __OFADD__(v51, 1);
        uint64_t v53 = v51 + 1;
        if (v52) {
          goto LABEL_130;
        }
        *(void *)(v8 + 16) = v53;
        swift_bridgeObjectRetain();
      }
      unint64_t v7 = *(void *)(v8 + 56);
      unint64_t v114 = v8;
      swift_bridgeObjectRelease();
      unint64_t v8 = 8 * v6;
      sub_258E743A8((uint64_t)v106);
      char v54 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v130 = *(void *)(v7 + 8 * v6);
      uint64_t v55 = v130;
      *(void *)(v7 + 8 * v6) = 0x8000000000000000;
      unint64_t v57 = sub_258E78DD0(v123, v127);
      uint64_t v58 = *(void *)(v130 + 16);
      BOOL v59 = (v56 & 1) == 0;
      uint64_t v60 = v58 + v59;
      if (__OFADD__(v58, v59)) {
        goto LABEL_128;
      }
      char v61 = v56;
      if (*(void *)(v130 + 24) >= v60)
      {
        if ((v54 & 1) == 0)
        {
          sub_258E7C898();
          uint64_t v55 = v130;
        }
      }
      else
      {
        sub_258E7A18C(v60, v54);
        uint64_t v55 = v130;
        unint64_t v62 = sub_258E78DD0(v123, v127);
        if ((v61 & 1) != (v63 & 1)) {
          goto LABEL_135;
        }
        unint64_t v57 = v62;
      }
      uint64_t v14 = v140;
      *(void *)(v7 + v8) = v55;
      swift_bridgeObjectRelease();
      uint64_t v64 = *(void **)(v7 + v8);
      if (v61)
      {
        swift_bridgeObjectRetain();
        unint64_t v6 = v117;
        unint64_t v8 = v114;
      }
      else
      {
        v64[(v57 >> 6) + 8] |= 1 << v57;
        unint64_t v65 = (uint64_t *)(v64[6] + 16 * v57);
        unint64_t v6 = v127;
        *unint64_t v65 = v123;
        v65[1] = v127;
        *(void *)(v64[7] + 8 * v57) = 0;
        uint64_t v66 = v64[2];
        uint64_t v67 = v66 + 1;
        unint64_t v7 = __OFADD__(v66, 1);
        swift_bridgeObjectRetain();
        unint64_t v8 = v114;
        if (v7) {
          goto LABEL_131;
        }
        v64[2] = v67;
        swift_bridgeObjectRetain();
        unint64_t v6 = v117;
      }
      uint64_t v68 = v64[7];
      swift_bridgeObjectRelease();
      uint64_t v69 = *(void *)(v68 + 8 * v57);
      BOOL v52 = __OFADD__(v69, 1);
      uint64_t v70 = v69 + 1;
      unint64_t v7 = v118;
      if (v52) {
        goto LABEL_129;
      }
      *(void *)(v68 + 8 * v57) = v70;
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      id v106 = sub_258E8F078;
      id v107 = sub_258E8F048;
      uint64_t v35 = 0;
LABEL_31:
      ++v9;
      BOOL v88 = v12 == v14;
      unint64_t v12 = v120;
      if (v88) {
        goto LABEL_63;
      }
    }
    swift_bridgeObjectRelease();
LABEL_30:

    goto LABEL_31;
  }
  id v106 = 0;
  id v107 = 0;
LABEL_63:
  swift_bridgeObjectRelease();
  sub_258EA8DD0();
  unint64_t v116 = (uint64_t (*)(void *))(v125 + 64);
  uint64_t v71 = 1 << *(unsigned char *)(v125 + 32);
  if (v71 < 64) {
    uint64_t v72 = ~(-1 << v71);
  }
  else {
    uint64_t v72 = -1;
  }
  unint64_t v6 = v72 & *(void *)(v125 + 64);
  int64_t v121 = (unint64_t)(v71 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  unint64_t v115 = v8;
LABEL_68:
  while (v6)
  {
    unint64_t v73 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v74 = v73 | (v9 << 6);
LABEL_81:
    unint64_t v7 = *(void *)(v112 + 384);
    if (*(void *)(v7 + 16))
    {
      uint64_t v128 = v9;
      unint64_t v140 = v6;
      uint64_t v119 = v35;
      uint64_t v77 = (uint64_t *)(*(void *)(v125 + 48) + 16 * v74);
      uint64_t v79 = *v77;
      uint64_t v78 = v77[1];
      uint64_t v80 = (uint64_t *)(*(void *)(v125 + 56) + 32 * v74);
      uint64_t v81 = v80[1];
      uint64_t v110 = *v80;
      uint64_t v82 = v80[3];
      uint64_t v124 = v80[2];
      sub_258EA9270();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_258EA8C80();
      uint64_t v83 = sub_258EA9290();
      uint64_t v84 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v85 = v83 & ~v84;
      unint64_t v12 = v7 + 56;
      if (((*(void *)(v7 + 56 + ((v85 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v85) & 1) == 0) {
        goto LABEL_67;
      }
      uint64_t v86 = *(void *)(v7 + 48);
      uint64_t v87 = (void *)(v86 + 16 * v85);
      BOOL v88 = *v87 == v79 && v87[1] == v78;
      if (v88 || (sub_258EA91E0() & 1) != 0)
      {
        unint64_t v6 = v140;
        uint64_t v89 = v81;
LABEL_89:
        uint64_t v9 = v128;
        goto LABEL_90;
      }
      uint64_t v96 = ~v84;
      unint64_t v7 = (v85 + 1) & ~v84;
      if ((*(void *)(v12 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
      {
        int64_t v97 = (void *)(v86 + 16 * v7);
        BOOL v98 = *v97 == v79 && v97[1] == v78;
        uint64_t v89 = v81;
        if (v98)
        {
          unint64_t v6 = v140;
          goto LABEL_89;
        }
        uint64_t v99 = v96;
        uint64_t v9 = v128;
        if (sub_258EA91E0())
        {
LABEL_108:
          unint64_t v6 = v140;
        }
        else
        {
          while (1)
          {
            unint64_t v7 = (v7 + 1) & v99;
            if (((*(void *)(v12 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v35 = v119;
              unint64_t v8 = v115;
              unint64_t v6 = v140;
              goto LABEL_68;
            }
            uint64_t v100 = (void *)(v86 + 16 * v7);
            if (*v100 == v79 && v100[1] == v78) {
              break;
            }
            if (sub_258EA91E0()) {
              goto LABEL_108;
            }
          }
          unint64_t v6 = v140;
        }
LABEL_90:
        if (!*(void *)(v115 + 16)) {
          goto LABEL_95;
        }
        swift_bridgeObjectRetain();
        unint64_t v90 = sub_258E78DD0(v124, v82);
        if (v91)
        {
          uint64_t v92 = *(void *)(*(void *)(v115 + 56) + 8 * v90);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v93 = sub_258E8F080(v92);
          uint64_t v95 = v94;
          swift_bridgeObjectRelease();
          if (!v95 || (swift_bridgeObjectRelease(), v110 == v93) && v95 == v89)
          {
LABEL_95:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_118;
          }
          sub_258EA91E0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
LABEL_118:
        unint64_t v102 = (void *)sub_258EA8DB0();
        id v103 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v102, 0);

        sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
        unint64_t v12 = sub_258EA8F00();
        id v104 = objc_allocWithZone(MEMORY[0x263F2A1E0]);
        id v105 = (void *)sub_258EA8C30();
        swift_bridgeObjectRelease();
        unint64_t v7 = (unint64_t)objc_msgSend(v104, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v105, v113, v103, v12);

        MEMORY[0x25A2D2A50]();
        if (*(void *)((v139[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v139[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_258EA8D70();
        }
        sub_258EA8D90();
        sub_258EA8D60();
        uint64_t v35 = v119;
        unint64_t v8 = v115;
      }
      else
      {
LABEL_67:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v35 = v119;
        unint64_t v8 = v115;
        unint64_t v6 = v140;
        uint64_t v9 = v128;
      }
    }
  }
  BOOL v52 = __OFADD__(v9++, 1);
  if (v52) {
    goto LABEL_126;
  }
  unint64_t v12 = v118;
  if (v9 >= v121)
  {
LABEL_124:
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();

    a3 = v139[0];
    swift_bridgeObjectRelease();
    sub_258E743A8((uint64_t)v107);
    sub_258E743A8((uint64_t)v106);
    return a3;
  }
  unint64_t v75 = *((void *)v116 + v9);
  if (v75)
  {
LABEL_80:
    unint64_t v6 = (v75 - 1) & v75;
    unint64_t v74 = __clz(__rbit64(v75)) + (v9 << 6);
    goto LABEL_81;
  }
  uint64_t v76 = v9 + 1;
  if (v9 + 1 >= v121) {
    goto LABEL_124;
  }
  unint64_t v75 = *((void *)v116 + v76);
  if (v75) {
    goto LABEL_79;
  }
  uint64_t v76 = v9 + 2;
  if (v9 + 2 >= v121) {
    goto LABEL_124;
  }
  unint64_t v75 = *((void *)v116 + v76);
  if (v75) {
    goto LABEL_79;
  }
  uint64_t v76 = v9 + 3;
  if (v9 + 3 >= v121) {
    goto LABEL_124;
  }
  unint64_t v75 = *((void *)v116 + v76);
  if (v75)
  {
LABEL_79:
    uint64_t v9 = v76;
    goto LABEL_80;
  }
  while (1)
  {
    uint64_t v9 = v76 + 1;
    if (__OFADD__(v76, 1)) {
      break;
    }
    if (v9 >= v121) {
      goto LABEL_124;
    }
    unint64_t v75 = *((void *)v116 + v9);
    ++v76;
    if (v75) {
      goto LABEL_80;
    }
  }
  __break(1u);
LABEL_134:
  __break(1u);
LABEL_135:
  uint64_t result = sub_258EA9220();
  __break(1u);
  return result;
}

unint64_t sub_258E8F048@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_258E75B84(MEMORY[0x263F8EE78]);
  *a1 = result;
  return result;
}

void sub_258E8F078(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_258E8F080(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  char v3 = *(unsigned char *)(a1 + 32);
  uint64_t v4 = 1 << v3;
  uint64_t v5 = -1;
  if (1 << v3 < 64) {
    uint64_t v5 = ~(-1 << (1 << v3));
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  if (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = __clz(__rbit64(v6));
    unint64_t v9 = (v6 - 1) & v6;
    int64_t v10 = (unint64_t)(v4 + 63) >> 6;
    while (2)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 16 * v8);
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v9)
      {
LABEL_6:
        unint64_t v14 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v15 = v14 | (v7 << 6);
        goto LABEL_7;
      }
      while (1)
      {
        int64_t v17 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          break;
        }
        if (v17 >= v10) {
          goto LABEL_27;
        }
        unint64_t v18 = *(void *)(v2 + 8 * v17);
        ++v7;
        if (!v18)
        {
          uint64_t v7 = v17 + 1;
          if (v17 + 1 >= v10) {
            goto LABEL_27;
          }
          unint64_t v18 = *(void *)(v2 + 8 * v7);
          if (!v18)
          {
            uint64_t v7 = v17 + 2;
            if (v17 + 2 >= v10) {
              goto LABEL_27;
            }
            unint64_t v18 = *(void *)(v2 + 8 * v7);
            if (!v18)
            {
              uint64_t v7 = v17 + 3;
              if (v17 + 3 >= v10) {
                goto LABEL_27;
              }
              unint64_t v18 = *(void *)(v2 + 8 * v7);
              if (!v18)
              {
                int64_t v19 = v17 + 4;
                if (v19 >= v10)
                {
LABEL_27:
                  swift_release();
                  return v11;
                }
                unint64_t v18 = *(void *)(v2 + 8 * v19);
                if (!v18)
                {
                  while (1)
                  {
                    uint64_t v7 = v19 + 1;
                    if (__OFADD__(v19, 1)) {
                      break;
                    }
                    if (v7 >= v10) {
                      goto LABEL_27;
                    }
                    unint64_t v18 = *(void *)(v2 + 8 * v7);
                    ++v19;
                    if (v18) {
                      goto LABEL_24;
                    }
                  }
                  __break(1u);
LABEL_44:
                  uint64_t v21 = 0;
                  uint64_t v22 = 6;
                  if (v10 > 6) {
                    uint64_t v22 = v10;
                  }
                  uint64_t v23 = v22 - 6;
                  while (v23 != v21)
                  {
                    unint64_t v20 = *(void *)(a1 + 112 + 8 * v21++);
                    if (v20)
                    {
                      uint64_t v7 = v21 + 5;
                      goto LABEL_31;
                    }
                  }
                  return 0;
                }
                uint64_t v7 = v19;
              }
            }
          }
        }
LABEL_24:
        unsigned int v13 = v18 - 1;
        unint64_t v9 = (v18 - 1) & v18;
        unint64_t v15 = __clz(__rbit64(v18)) + (v7 << 6);
LABEL_7:
        uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v15);
        if (v12 < v16)
        {
          uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 16 * v15);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v12 = v16;
          if (v9) {
            goto LABEL_6;
          }
        }
        else if (v9)
        {
          goto LABEL_6;
        }
      }
      __break(1u);
LABEL_38:
      if (v13 >= 9)
      {
        unint64_t v20 = *(void *)(a1 + 96);
        if (v20)
        {
          uint64_t v7 = 4;
        }
        else
        {
          unint64_t v20 = *(void *)(a1 + 104);
          if (!v20) {
            goto LABEL_44;
          }
          uint64_t v7 = 5;
        }
LABEL_31:
        unint64_t v9 = (v20 - 1) & v20;
        unint64_t v8 = __clz(__rbit64(v20)) + (v7 << 6);
        continue;
      }
      break;
    }
  }
  else
  {
    unsigned int v13 = v3 & 0x3F;
    if (v13 > 6)
    {
      int64_t v10 = (unint64_t)(v4 + 63) >> 6;
      unint64_t v20 = *(void *)(a1 + 72);
      if (v20)
      {
        uint64_t v7 = 1;
        goto LABEL_31;
      }
      if (v13 >= 8)
      {
        unint64_t v20 = *(void *)(a1 + 80);
        if (v20)
        {
          uint64_t v7 = 2;
        }
        else
        {
          unint64_t v20 = *(void *)(a1 + 88);
          if (!v20) {
            goto LABEL_38;
          }
          uint64_t v7 = 3;
        }
        goto LABEL_31;
      }
    }
  }
  return 0;
}

void sub_258E8F320(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(a2 + 384);
  uint64_t v8 = *(void *)(v7 + 56);
  uint64_t v36 = v7 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v8;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v39 = *(void *)(a2 + 384);
  swift_bridgeObjectRetain();
  int64_t v12 = 0;
  uint64_t v35 = a3;
  if (v11) {
    goto LABEL_6;
  }
LABEL_9:
  if (!__OFADD__(v12++, 1))
  {
    if (v12 >= v37) {
      goto LABEL_36;
    }
    unint64_t v17 = *(void *)(v36 + 8 * v12);
    if (v17)
    {
LABEL_19:
      unint64_t v11 = (v17 - 1) & v17;
      for (unint64_t i = __clz(__rbit64(v17)) + (v12 << 6); ; unint64_t i = v13 | (v12 << 6))
      {
        int64_t v19 = (uint64_t *)(*(void *)(v39 + 48) + 16 * i);
        uint64_t v20 = *v19;
        uint64_t v21 = v19[1];
        swift_bridgeObjectRetain();
        sub_258EA8DD0();
        if (v5)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0510);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_258EAA3B0;
        *(void *)(inited + 32) = v20;
        *(void *)(inited + 40) = v21;
        uint64_t v23 = *(void **)(a2 + 24);
        swift_bridgeObjectRetain();
        unint64_t v24 = sub_258EA5978(inited, 0, 0, 0, 0, 0, 1, 1, v23);
        swift_setDeallocating();
        swift_arrayDestroy();
        if (v24 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v15 = sub_258EA9150();
          swift_bridgeObjectRelease();
          if (!v15) {
            goto LABEL_5;
          }
        }
        else if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_5:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v11) {
            goto LABEL_9;
          }
          goto LABEL_6;
        }
        unint64_t v40 = v11;
        if ((v24 & 0xC000000000000001) != 0)
        {
          id v25 = (id)MEMORY[0x25A2D2D90](0, v24);
        }
        else
        {
          if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_38;
          }
          id v25 = *(id *)(v24 + 32);
        }
        uint64_t v26 = v25;
        swift_bridgeObjectRelease();
        objc_msgSend(v26, sel_lh_isGroupChat);
        uint64_t v27 = (void *)sub_258EA8DB0();
        id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v27, 0);

        sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
        id v29 = v28;
        uint64_t v30 = (void *)sub_258EA8F00();
        id v31 = objc_allocWithZone(MEMORY[0x263F2A1E0]);
        uint64_t v32 = (void *)sub_258EA8C30();
        swift_bridgeObjectRelease();
        objc_msgSend(v31, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v32, a4, v29, v30);

        uint64_t v33 = swift_beginAccess();
        MEMORY[0x25A2D2A50](v33);
        if (*(void *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_258EA8D70();
        }
        sub_258EA8D90();
        sub_258EA8D60();
        swift_endAccess();

        unint64_t v11 = v40;
        if (!v40) {
          goto LABEL_9;
        }
LABEL_6:
        unint64_t v13 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
      }
    }
    int64_t v18 = v12 + 1;
    if (v12 + 1 >= v37) {
      goto LABEL_36;
    }
    unint64_t v17 = *(void *)(v36 + 8 * v18);
    if (!v17)
    {
      int64_t v18 = v12 + 2;
      if (v12 + 2 >= v37) {
        goto LABEL_36;
      }
      unint64_t v17 = *(void *)(v36 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v12 + 3;
        if (v12 + 3 < v37)
        {
          unint64_t v17 = *(void *)(v36 + 8 * v18);
          if (v17) {
            goto LABEL_18;
          }
          while (1)
          {
            int64_t v12 = v18 + 1;
            if (__OFADD__(v18, 1)) {
              goto LABEL_39;
            }
            if (v12 >= v37) {
              break;
            }
            unint64_t v17 = *(void *)(v36 + 8 * v12);
            ++v18;
            if (v17) {
              goto LABEL_19;
            }
          }
        }
LABEL_36:
        swift_release();
        swift_beginAccess();
        swift_bridgeObjectRetain();
        return;
      }
    }
LABEL_18:
    int64_t v12 = v18;
    goto LABEL_19;
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_258E8F7B8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  sub_258E7D330(a1, (uint64_t)&v118);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0430);
  if (!swift_dynamicCast()) {
    goto LABEL_6;
  }
  unint64_t v7 = v127;
  if (v127 >> 61 != 1)
  {
    sub_258E74288(v122, *((uint64_t *)&v122 + 1), v123, *((uint64_t *)&v123 + 1), (void *)v124, *((uint64_t *)&v124 + 1), v125, v126, v127);
LABEL_6:
    sub_258E741E0();
    swift_allocError();
    *(_OWORD *)uint64_t v22 = xmmword_258EAA8B0;
    *(unsigned char *)(v22 + 16) = 1;
    swift_willThrow();
    return v4;
  }
  int v98 = a3;
  long long v109 = v122;
  uint64_t v8 = *(void *)(a2 + 384);
  uint64_t v128 = v3;
  uint64_t v9 = (void *)v123;
  id v103 = (void *)v124;
  uint64_t v104 = v126;
  uint64_t v107 = *((void *)&v124 + 1);
  uint64_t v108 = v125;
  uint64_t v102 = *((void *)&v123 + 1);
  sub_258E7451C(0, &qword_26A0D0210);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D04D0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_258EAA3C0;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0490);
  *(void *)(v10 + 56) = v11;
  unint64_t v12 = sub_258E98064();
  *(void *)(v10 + 32) = v8;
  *(void *)(v10 + 96) = v11;
  *(void *)(v10 + 104) = v12;
  *(void *)(v10 + 64) = v12;
  *(void *)(v10 + 72) = v8;
  uint64_t v110 = v8;
  swift_bridgeObjectRetain_n();
  unint64_t v13 = (void *)sub_258EA8E60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_258EAA8A0;
  *(void *)(v14 + 32) = v9;
  *(void *)(v14 + 40) = v13;
  *(void *)&long long v122 = v14;
  sub_258EA8D60();
  unint64_t v100 = v7;
  uint64_t v101 = (uint64_t)v9;
  uint64_t v15 = v9;
  uint64_t v4 = v102;
  sub_258E980B4(v109, *((uint64_t *)&v109 + 1), v15, v102, v103, v107, v108, v104, v7);
  id v16 = v13;
  unint64_t v17 = (void *)sub_258EA8D30();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v17);

  int64_t v19 = v18;
  uint64_t v20 = v128;
  id v21 = sub_258E82290((uint64_t)v18, *(void *)(a2 + 8));
  if (v20)
  {

    sub_258E74288(v109, *((uint64_t *)&v109 + 1), v101, v102, v103, v107, v108, v104, v7);
    return v4;
  }
  uint64_t v23 = (uint64_t)v21;
  sub_258EA8DD0();
  id v106 = v19;
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_258E981D4(MEMORY[0x263F8EE80], v110, v23, v109, BYTE8(v109) & 1, v98);
  int64_t v26 = 0;
  swift_bridgeObjectRelease();
  id v105 = v16;
  swift_bridgeObjectRelease();
  uint64_t v111 = v25 + 64;
  uint64_t v27 = 1 << *(unsigned char *)(v25 + 32);
  uint64_t v28 = -1;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  unint64_t v29 = v28 & *(void *)(v25 + 64);
  int64_t v30 = (unint64_t)(v27 + 63) >> 6;
  uint64_t v128 = v25;
  swift_bridgeObjectRetain();
  double v31 = 0.0;
  while (1)
  {
    if (v29)
    {
      unint64_t v32 = __clz(__rbit64(v29));
      v29 &= v29 - 1;
      unint64_t v33 = v32 | (v26 << 6);
      uint64_t v34 = v128;
      goto LABEL_13;
    }
    int64_t v42 = v26 + 1;
    uint64_t v34 = v128;
    if (__OFADD__(v26, 1))
    {
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
LABEL_102:
      __break(1u);
LABEL_103:
      __break(1u);
      goto LABEL_104;
    }
    if (v42 >= v30) {
      goto LABEL_33;
    }
    unint64_t v43 = *(void *)(v111 + 8 * v42);
    ++v26;
    if (!v43)
    {
      int64_t v26 = v42 + 1;
      if (v42 + 1 >= v30) {
        goto LABEL_33;
      }
      unint64_t v43 = *(void *)(v111 + 8 * v26);
      if (!v43)
      {
        int64_t v26 = v42 + 2;
        if (v42 + 2 >= v30) {
          goto LABEL_33;
        }
        unint64_t v43 = *(void *)(v111 + 8 * v26);
        if (!v43)
        {
          int64_t v26 = v42 + 3;
          if (v42 + 3 >= v30) {
            goto LABEL_33;
          }
          unint64_t v43 = *(void *)(v111 + 8 * v26);
          if (!v43)
          {
            int64_t v26 = v42 + 4;
            if (v42 + 4 >= v30) {
              goto LABEL_33;
            }
            unint64_t v43 = *(void *)(v111 + 8 * v26);
            if (!v43) {
              break;
            }
          }
        }
      }
    }
LABEL_32:
    unint64_t v29 = (v43 - 1) & v43;
    unint64_t v33 = __clz(__rbit64(v43)) + (v26 << 6);
LABEL_13:
    uint64_t v35 = *(void *)(v34 + 56);
    uint64_t v36 = (uint64_t *)(*(void *)(v34 + 48) + 16 * v33);
    uint64_t v38 = *v36;
    uint64_t v37 = v36[1];
    sub_258E7D330(v35 + 40 * v33, (uint64_t)&v123);
    *(void *)&long long v122 = v38;
    *((void *)&v122 + 1) = v37;
    long long v118 = v122;
    long long v119 = v123;
    long long v120 = v124;
    uint64_t v121 = v125;
    long long v116 = v122;
    sub_258E7D330((uint64_t)&v119, (uint64_t)v117);
    sub_258E7D394(v117, (uint64_t)&v113);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D04A0);
    sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
    swift_dynamicCast();
    uint64_t v39 = v115;
    sub_258EA8DE0();
    double v41 = v40;

    double v31 = v31 + v41;
    sub_258E81B50((uint64_t)&v118, &qword_26A0D04A8);
  }
  int64_t v44 = v42 + 5;
  if (v44 >= v30) {
    goto LABEL_33;
  }
  unint64_t v43 = *(void *)(v111 + 8 * v44);
  if (v43)
  {
    int64_t v26 = v44;
    goto LABEL_32;
  }
  while (1)
  {
    int64_t v26 = v44 + 1;
    if (__OFADD__(v44, 1)) {
      goto LABEL_105;
    }
    if (v26 >= v30) {
      break;
    }
    unint64_t v43 = *(void *)(v111 + 8 * v26);
    ++v44;
    if (v43) {
      goto LABEL_32;
    }
  }
LABEL_33:
  swift_release();
  uint64_t v45 = 1 << *(unsigned char *)(v34 + 32);
  uint64_t v46 = -1;
  if (v45 < 64) {
    uint64_t v46 = ~(-1 << v45);
  }
  unint64_t v47 = v46 & *(void *)(v34 + 64);
  int64_t v99 = (unint64_t)(v45 + 63) >> 6;
  if (v31 != 0.0)
  {
    swift_bridgeObjectRetain();
    int64_t v71 = 0;
    unint64_t v49 = (void *)MEMORY[0x263F8EE80];
    while (1)
    {
      if (v47)
      {
        unint64_t v72 = __clz(__rbit64(v47));
        v47 &= v47 - 1;
        int64_t v73 = v71;
        unint64_t v74 = v72 | (v71 << 6);
      }
      else
      {
        int64_t v75 = v71 + 1;
        if (__OFADD__(v71, 1)) {
          goto LABEL_103;
        }
        if (v75 >= v99) {
          goto LABEL_96;
        }
        unint64_t v76 = *(void *)(v111 + 8 * v75);
        int64_t v77 = v71 + 1;
        if (!v76)
        {
          int64_t v77 = v71 + 2;
          if (v71 + 2 >= v99) {
            goto LABEL_96;
          }
          unint64_t v76 = *(void *)(v111 + 8 * v77);
          if (!v76)
          {
            int64_t v77 = v71 + 3;
            if (v71 + 3 >= v99) {
              goto LABEL_96;
            }
            unint64_t v76 = *(void *)(v111 + 8 * v77);
            if (!v76)
            {
              int64_t v77 = v71 + 4;
              if (v71 + 4 >= v99) {
                goto LABEL_96;
              }
              unint64_t v76 = *(void *)(v111 + 8 * v77);
              if (!v76)
              {
                uint64_t v78 = v71 + 5;
                if (v71 + 5 >= v99) {
                  goto LABEL_96;
                }
                unint64_t v76 = *(void *)(v111 + 8 * v78);
                if (!v76)
                {
                  while (1)
                  {
                    int64_t v77 = v78 + 1;
                    if (__OFADD__(v78, 1)) {
                      goto LABEL_106;
                    }
                    if (v77 >= v99) {
                      break;
                    }
                    unint64_t v76 = *(void *)(v111 + 8 * v77);
                    ++v78;
                    if (v76) {
                      goto LABEL_86;
                    }
                  }
LABEL_96:
                  swift_release();
                  swift_bridgeObjectRelease();
                  uint64_t v97 = sub_258EA8DD0();
                  MEMORY[0x270FA5388](v97);
                  uint64_t v4 = sub_258E97890((uint64_t)v49, (void (*)(uint64_t, uint64_t, double))sub_258E983E8);

                  sub_258E74288(v109, *((uint64_t *)&v109 + 1), v101, v102, v103, v107, v108, v104, v100);
                  swift_bridgeObjectRelease();
                  return v4;
                }
                int64_t v77 = v71 + 5;
              }
            }
          }
        }
LABEL_86:
        unint64_t v47 = (v76 - 1) & v76;
        int64_t v73 = v77;
        unint64_t v74 = __clz(__rbit64(v76)) + (v77 << 6);
      }
      uint64_t v79 = (uint64_t *)(*(void *)(v34 + 48) + 16 * v74);
      uint64_t v80 = *v79;
      uint64_t v81 = v79[1];
      sub_258E7D330(*(void *)(v34 + 56) + 40 * v74, (uint64_t)&v123);
      *(void *)&long long v122 = v80;
      *((void *)&v122 + 1) = v81;
      long long v118 = v122;
      long long v119 = v123;
      long long v120 = v124;
      uint64_t v121 = v125;
      long long v82 = v122;
      long long v116 = v122;
      sub_258E7D330((uint64_t)&v119, (uint64_t)v117);
      long long v113 = v82;
      sub_258E7D330((uint64_t)&v119, (uint64_t)v114);
      sub_258E7D394(v114, (uint64_t)&v115);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D04A0);
      sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
      swift_dynamicCast();
      sub_258EA8DE0();
      double v84 = v83;

      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v113 = v49;
      unint64_t v87 = sub_258E78DD0(v82, *((uint64_t *)&v82 + 1));
      uint64_t v88 = v49[2];
      BOOL v89 = (v86 & 1) == 0;
      uint64_t v90 = v88 + v89;
      if (__OFADD__(v88, v89)) {
        goto LABEL_99;
      }
      char v91 = v86;
      if (v49[3] >= v90)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_258E7CFC8();
        }
      }
      else
      {
        sub_258E7AE0C(v90, isUniquelyReferenced_nonNull_native);
        unint64_t v92 = sub_258E78DD0(v82, *((uint64_t *)&v82 + 1));
        if ((v91 & 1) != (v93 & 1)) {
          goto LABEL_107;
        }
        unint64_t v87 = v92;
      }
      uint64_t v34 = v128;
      unint64_t v49 = (void *)v113;
      double v94 = v84 / v31;
      if (v91)
      {
        *(double *)(*(void *)(v113 + 56) + 8 * v87) = v94;
      }
      else
      {
        *(void *)(v113 + 8 * (v87 >> 6) + 64) |= 1 << v87;
        *(_OWORD *)(v49[6] + 16 * v87) = v82;
        *(double *)(v49[7] + 8 * v87) = v94;
        uint64_t v95 = v49[2];
        BOOL v69 = __OFADD__(v95, 1);
        uint64_t v96 = v95 + 1;
        if (v69) {
          goto LABEL_102;
        }
        v49[2] = v96;
        swift_bridgeObjectRetain();
      }
      id v16 = v105;
      int64_t v19 = v106;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v117);
      sub_258E81B50((uint64_t)&v118, &qword_26A0D04A8);
      int64_t v71 = v73;
    }
  }
  swift_bridgeObjectRetain();
  int64_t v48 = 0;
  unint64_t v49 = (void *)MEMORY[0x263F8EE80];
  while (2)
  {
    if (v47)
    {
      unint64_t v50 = __clz(__rbit64(v47));
      v47 &= v47 - 1;
      unint64_t v51 = v50 | (v48 << 6);
LABEL_57:
      uint64_t v55 = (uint64_t *)(*(void *)(v34 + 48) + 16 * v51);
      uint64_t v56 = *v55;
      uint64_t v57 = v55[1];
      sub_258E7D330(*(void *)(v34 + 56) + 40 * v51, (uint64_t)&v123);
      *(void *)&long long v122 = v56;
      *((void *)&v122 + 1) = v57;
      long long v118 = v122;
      long long v119 = v123;
      long long v120 = v124;
      uint64_t v121 = v125;
      long long v58 = v122;
      long long v116 = v122;
      sub_258E7D330((uint64_t)&v119, (uint64_t)v117);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v59 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v113 = v49;
      unint64_t v61 = sub_258E78DD0(v58, *((uint64_t *)&v58 + 1));
      uint64_t v62 = v49[2];
      BOOL v63 = (v60 & 1) == 0;
      uint64_t v64 = v62 + v63;
      if (__OFADD__(v62, v63))
      {
        __break(1u);
        goto LABEL_98;
      }
      char v65 = v60;
      if (v49[3] >= v64)
      {
        if ((v59 & 1) == 0) {
          sub_258E7CFC8();
        }
      }
      else
      {
        sub_258E7AE0C(v64, v59);
        unint64_t v66 = sub_258E78DD0(v58, *((uint64_t *)&v58 + 1));
        if ((v65 & 1) != (v67 & 1)) {
          goto LABEL_107;
        }
        unint64_t v61 = v66;
      }
      id v16 = v105;
      unint64_t v49 = (void *)v113;
      if (v65)
      {
        *(void *)(*(void *)(v113 + 56) + 8 * v61) = 0;
      }
      else
      {
        *(void *)(v113 + 8 * (v61 >> 6) + 64) |= 1 << v61;
        *(_OWORD *)(v49[6] + 16 * v61) = v58;
        *(void *)(v49[7] + 8 * v61) = 0;
        uint64_t v68 = v49[2];
        BOOL v69 = __OFADD__(v68, 1);
        uint64_t v70 = v68 + 1;
        if (v69) {
          goto LABEL_100;
        }
        v49[2] = v70;
        swift_bridgeObjectRetain();
      }
      int64_t v19 = v106;
      uint64_t v34 = v128;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v117);
      sub_258E81B50((uint64_t)&v118, &qword_26A0D04A8);
      continue;
    }
    break;
  }
  int64_t v52 = v48 + 1;
  if (__OFADD__(v48, 1)) {
    goto LABEL_101;
  }
  if (v52 >= v99) {
    goto LABEL_96;
  }
  unint64_t v53 = *(void *)(v111 + 8 * v52);
  ++v48;
  if (v53) {
    goto LABEL_56;
  }
  int64_t v48 = v52 + 1;
  if (v52 + 1 >= v99) {
    goto LABEL_96;
  }
  unint64_t v53 = *(void *)(v111 + 8 * v48);
  if (v53) {
    goto LABEL_56;
  }
  int64_t v48 = v52 + 2;
  if (v52 + 2 >= v99) {
    goto LABEL_96;
  }
  unint64_t v53 = *(void *)(v111 + 8 * v48);
  if (v53) {
    goto LABEL_56;
  }
  int64_t v48 = v52 + 3;
  if (v52 + 3 >= v99) {
    goto LABEL_96;
  }
  unint64_t v53 = *(void *)(v111 + 8 * v48);
  if (v53)
  {
LABEL_56:
    unint64_t v47 = (v53 - 1) & v53;
    unint64_t v51 = __clz(__rbit64(v53)) + (v48 << 6);
    goto LABEL_57;
  }
  int64_t v54 = v52 + 4;
  if (v54 >= v99) {
    goto LABEL_96;
  }
  unint64_t v53 = *(void *)(v111 + 8 * v54);
  if (v53)
  {
    int64_t v48 = v54;
    goto LABEL_56;
  }
  while (1)
  {
    int64_t v48 = v54 + 1;
    if (__OFADD__(v54, 1)) {
      break;
    }
    if (v48 >= v99) {
      goto LABEL_96;
    }
    unint64_t v53 = *(void *)(v111 + 8 * v48);
    ++v54;
    if (v53) {
      goto LABEL_56;
    }
  }
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
LABEL_106:
  __break(1u);
LABEL_107:
  uint64_t result = sub_258EA9220();
  __break(1u);
  return result;
}

void sub_258E90524(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  sub_258EA8DD0();
  if (!v6)
  {
    int v46 = a6;
    swift_bridgeObjectRetain();
    unint64_t v11 = swift_bridgeObjectRetain();
    unint64_t v12 = sub_258E97DC8(v11, v9, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a5)
    {
      if (v12 >> 62) {
        sub_258EA9150();
      }
      unint64_t v13 = (void *)sub_258EA8E50();
      id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v13, 0, 0, 0, 0);
    }
    else
    {
      sub_258E8A6B0(v12);
      unint64_t v13 = (void *)sub_258EA8DF0();
      id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v13, 0, 0, 0);
    }
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();

    long long v35 = xmmword_258EAA3C0;
    unsigned int v16 = objc_msgSend(v15, sel_intValue);
    uint64_t v37 = MEMORY[0x263F8E8F8];
    v36[0] = v16;
    objc_msgSend(v15, sel_doubleValue);
    v38[3] = MEMORY[0x263F8D538];
    v38[0] = v17;
    sub_258E7D470((uint64_t)v36, (uint64_t)v34);
    sub_258E7D470((uint64_t)v34, (uint64_t)&v31);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    if (v32)
    {
      sub_258E7D3AC(&v31, v33);
      sub_258E7D3AC(v33, &v31);
      id v18 = (void *)MEMORY[0x263F8EE78];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v18 = sub_258E9CBF8(0, v18[2] + 1, 1, v18);
      }
      unint64_t v20 = v18[2];
      unint64_t v19 = v18[3];
      if (v20 >= v19 >> 1) {
        id v18 = sub_258E9CBF8((void *)(v19 > 1), v20 + 1, 1, v18);
      }
      v18[2] = v20 + 1;
      sub_258E7D3AC(&v31, &v18[4 * v20 + 4]);
    }
    else
    {
      sub_258E81B50((uint64_t)&v31, &qword_26A0D0368);
      id v18 = (void *)MEMORY[0x263F8EE78];
    }
    sub_258E7D470((uint64_t)v38, (uint64_t)v34);
    sub_258E7D470((uint64_t)v34, (uint64_t)&v31);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    if (v32)
    {
      sub_258E7D3AC(&v31, v33);
      sub_258E7D3AC(v33, &v31);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v18 = sub_258E9CBF8(0, v18[2] + 1, 1, v18);
      }
      unint64_t v22 = v18[2];
      unint64_t v21 = v18[3];
      if (v22 >= v21 >> 1) {
        id v18 = sub_258E9CBF8((void *)(v21 > 1), v22 + 1, 1, v18);
      }
      v18[2] = v22 + 1;
      sub_258E7D3AC(&v31, &v18[4 * v22 + 4]);
    }
    else
    {
      sub_258E81B50((uint64_t)&v31, &qword_26A0D0368);
    }
    swift_arrayDestroy();
    if (v18[2])
    {
      sub_258E7D470((uint64_t)(v18 + 4), (uint64_t)&v39);
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
    }
    int v23 = v46;
    swift_bridgeObjectRelease();
    if (*((void *)&v40 + 1))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D04A0);
      if (swift_dynamicCast())
      {
        if (*((void *)&v42 + 1))
        {
          sub_258E7D394(&v41, (uint64_t)&v44);
          sub_258E7D330((uint64_t)&v44, (uint64_t)&v41);
          swift_bridgeObjectRetain();
          sub_258E898C8((uint64_t)&v41, v9, v10);

          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v44);
          return;
        }
      }
      else
      {
        uint64_t v43 = 0;
        long long v41 = 0u;
        long long v42 = 0u;
      }
    }
    else
    {
      sub_258E81B50((uint64_t)&v39, &qword_26A0D0368);
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v43 = 0;
    }
    sub_258E81B50((uint64_t)&v41, (uint64_t *)&unk_26A0D04B0);
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_258EA8BB0();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A0D0790);
    uint64_t v25 = sub_258EA8B90();
    os_log_type_t v26 = sub_258EA8E90();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 67109120;
      LODWORD(v44) = v23;
      sub_258EA8F40();
      _os_log_impl(&dword_258E57000, v25, v26, "Both double and int values are null in computation of %d", v27, 8u);
      MEMORY[0x25A2D36B0](v27, -1, -1);
    }

    uint64_t v44 = 0;
    unint64_t v45 = 0xE000000000000000;
    sub_258EA9030();
    sub_258EA8C90();
    LODWORD(v41) = v23;
    type metadata accessor for BMMLSEDurableFeatureStorefeatureName(0);
    sub_258EA90E0();
    uint64_t v28 = v44;
    unint64_t v29 = v45;
    sub_258E741E0();
    swift_allocError();
    *(void *)uint64_t v30 = v28;
    *(void *)(v30 + 8) = v29;
    *(unsigned char *)(v30 + 16) = 1;
    swift_willThrow();
  }
}

id sub_258E90AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)sub_258EA8DF0();
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v4, 0, 0, 0);

  sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
  uint64_t v6 = (void *)sub_258EA8F00();
  id v7 = objc_allocWithZone(MEMORY[0x263F2A1E0]);
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_258EA8C30();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v8, a3, v5, v6);

  return v9;
}

uint64_t sub_258E90BDC(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = MEMORY[0x263F8EE78];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = MEMORY[0x263F8EE88];
  id v4 = objc_msgSend((id)BiomeLibrary(), sel_ShareSheet);
  swift_unknownObjectRelease();
  id v5 = objc_msgSend(v4, sel_SuggestLessFeedback);
  swift_unknownObjectRelease();
  id v6 = objc_msgSend(v5, sel_publisher);

  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_258E98CC0;
  aBlock[3] = &block_descriptor_1;
  id v7 = _Block_copy(aBlock);
  sub_258E96B88(a1, (uint64_t)aBlock);
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = v3;
  memcpy(v8 + 3, aBlock, 0x190uLL);
  v8[53] = v2;
  v13[4] = sub_258E98530;
  v13[5] = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_258E785D0;
  v13[3] = &block_descriptor_16;
  id v9 = _Block_copy(v13);
  swift_retain();
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v6, sel_sinkWithCompletion_receiveInput_, v7, v9);
  _Block_release(v9);
  _Block_release(v7);

  swift_beginAccess();
  uint64_t v11 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  return v11;
}

void sub_258E90E7C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_msgSend(a1, sel_eventBody);
  if (v7)
  {
    long long v31 = v7;
    id v8 = [v7 conversationIdentifier];
    if (v8
      || (id v8 = [v31 derivedIntentIdentifier]) != 0)
    {
      id v9 = (uint64_t *)(a2 + 16);
      uint64_t v10 = sub_258EA8C50();
      uint64_t v12 = v11;

      swift_beginAccess();
      uint64_t v13 = *v9;
      swift_bridgeObjectRetain();
      char v14 = sub_258E98DE0(v10, v12, v13);
      swift_bridgeObjectRelease();
      sub_258E96B88(a3, (uint64_t)v33);
      if (v14)
      {
        sub_258E96BC0((uint64_t)v33);
      }
      else
      {
        char v18 = sub_258E98DE0(v10, v12, v34);
        sub_258E96BC0((uint64_t)v33);
        if (v18)
        {
          unint64_t v19 = (void *)(a4 + 16);
          swift_bridgeObjectRetain();
          unint64_t v20 = (void *)sub_258EA8DF0();
          id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1F0]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v20, 0, 0, 0);

          sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
          unint64_t v22 = (void *)sub_258EA8F00();
          id v23 = objc_allocWithZone(MEMORY[0x263F2A1E0]);
          uint64_t v24 = (void *)sub_258EA8C30();
          swift_bridgeObjectRelease();
          id v25 = objc_msgSend(v23, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v24, 480, v21, v22);

          swift_beginAccess();
          sub_258E9DD28(&v32, v10, v12);
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          id v26 = v25;
          MEMORY[0x25A2D2A50]();
          if (*(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_258EA8D70();
          }
          sub_258EA8D90();
          sub_258EA8D60();
          swift_endAccess();

          goto LABEL_15;
        }
      }
      swift_bridgeObjectRelease();
LABEL_15:

      return;
    }
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_258EA8BB0();
    __swift_project_value_buffer(v27, (uint64_t)qword_26A0D0790);
    uint64_t v28 = sub_258EA8B90();
    os_log_type_t v29 = sub_258EA8E90();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_258E57000, v28, v29, "Suggest less computation: could not find valid candidate identifier", v30, 2u);
      MEMORY[0x25A2D36B0](v30, -1, -1);
    }
  }
  else
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_258EA8BB0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A0D0790);
    long long v31 = sub_258EA8B90();
    os_log_type_t v16 = sub_258EA8E90();
    if (os_log_type_enabled(v31, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_258E57000, v31, v16, "Suggest less computation: incorrect feedback in stream", v17, 2u);
      MEMORY[0x25A2D36B0](v17, -1, -1);
    }
  }
}

void sub_258E912E0(uint64_t a1)
{
  id v3 = objc_msgSend(*(id *)(v1 + 32), sel_pruner);
  uint64_t v4 = sub_258EA8A80();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  id v7 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v7((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_258E985D0;
  *(void *)(v10 + 24) = v9;
  v21[0] = v9;
  aBlock[4] = (uint64_t)sub_258E98670;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_258E916F0;
  aBlock[3] = (uint64_t)&block_descriptor_25;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_deleteEventsPassingTest_, v11);

  _Block_release(v11);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v11)
  {
    __break(1u);
  }
  else if (qword_26A0D01F0 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  uint64_t v12 = sub_258EA8BB0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_26A0D0790);
  MEMORY[0x270FA5388](v13);
  char v14 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7(v14, a1, v4);
  uint64_t v15 = sub_258EA8B90();
  os_log_type_t v16 = sub_258EA8E80();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    sub_258E9869C((unint64_t *)&qword_26A0D0378);
    uint64_t v19 = sub_258EA91D0();
    v21[1] = sub_258E787E0(v19, v20, aBlock);
    sub_258EA8F40();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
    _os_log_impl(&dword_258E57000, v15, v16, "Successfully deleted features older than %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2D36B0](v18, -1, -1);
    MEMORY[0x25A2D36B0](v17, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
  }
  swift_release();
}

uint64_t sub_258E916F0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  id v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

Swift::Void __swiftcall DurableFeatureManager.computeFeaturesAndSendToBiome()()
{
  sub_258E91754(*(void *)(v0 + 16));
}

uint64_t sub_258E91754(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_26A0D01E8 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_26A0D0360;
  uint64_t v5 = (void *)sub_258EA8C30();
  id v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  uint64_t v64 = "beginDurableFeatureComputation";
  if (v6)
  {
    sub_258EA8F70();
    swift_unknownObjectRelease();
    sub_258E81B50((uint64_t)v69, &qword_26A0D0368);
  }
  else
  {
    memset(v69, 0, sizeof(v69));
    sub_258E81B50((uint64_t)v69, &qword_26A0D0368);
    LODWORD(v69[0]) = 4;
    BYTE4(v69[0]) = 1;
    NSUserDefaults.saveComputationDate(_:)((int *)v69);
    LODWORD(v69[0]) = 5;
    BYTE4(v69[0]) = 1;
    NSUserDefaults.saveComputationDate(_:)((int *)v69);
  }
  uint64_t v68 = MEMORY[0x263F8EE78];
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    char v65 = v2 + 43;
    swift_bridgeObjectRetain();
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = *(unsigned int *)(a1 + 4 * v8 + 32);
      LODWORD(v69[0]) = *(_DWORD *)(a1 + 4 * v8 + 32);
      BYTE4(v69[0]) = 0;
      if (NSUserDefaults.shouldCompute(_:)((int *)v69))
      {
        uint64_t v11 = v2[46];
        uint64_t v10 = v2[47];
        __swift_project_boxed_opaque_existential_1(v65, v11);
        if ((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v11, v10))
        {
          swift_bridgeObjectRelease();
          if (qword_26A0D01F0 != -1) {
            swift_once();
          }
          uint64_t v34 = sub_258EA8BB0();
          __swift_project_value_buffer(v34, (uint64_t)qword_26A0D0790);
          long long v31 = sub_258EA8B90();
          os_log_type_t v35 = sub_258EA8E70();
          if (os_log_type_enabled(v31, v35))
          {
            unint64_t v33 = (uint8_t *)swift_slowAlloc();
            uint64_t v36 = (void *)swift_slowAlloc();
            v67[0] = (uint64_t)v36;
            *(_DWORD *)unint64_t v33 = 136315138;
            swift_beginAccess();
            uint64_t v37 = v68;
            int64_t v38 = *(void *)(v68 + 16);
            uint64_t v39 = MEMORY[0x263F8EE78];
            if (v38)
            {
              char v65 = v36;
              uint64_t v66 = MEMORY[0x263F8EE78];
              swift_bridgeObjectRetain();
              sub_258E82B00(0, v38, 0);
              uint64_t v40 = 0;
              uint64_t v39 = v66;
              unint64_t v41 = *(void *)(v66 + 16);
              do
              {
                int v42 = *(_DWORD *)(v37 + 4 * v40 + 32);
                uint64_t v66 = v39;
                unint64_t v43 = *(void *)(v39 + 24);
                if (v41 >= v43 >> 1)
                {
                  sub_258E82B00(v43 > 1, v41 + 1, 1);
                  uint64_t v39 = v66;
                }
                ++v40;
                *(void *)(v39 + 16) = v41 + 1;
                *(_DWORD *)(v39 + 4 * v41++ + 32) = v42;
              }
              while (v38 != v40);
              swift_bridgeObjectRelease();
              uint64_t v36 = v65;
            }
            uint64_t v57 = MEMORY[0x25A2D2A80](v39, MEMORY[0x263F8E548]);
            unint64_t v59 = v58;
            swift_bridgeObjectRelease();
            uint64_t v66 = sub_258E787E0(v57, v59, v67);
            sub_258EA8F40();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_258E57000, v31, v35, "Plugin halted while computing durable features. Completed features: %s", v33, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25A2D36B0](v36, -1, -1);
LABEL_43:
            MEMORY[0x25A2D36B0](v33, -1, -1);
          }
          goto LABEL_44;
        }
        uint64_t v12 = (void *)MEMORY[0x25A2D30F0]();
        sub_258E92A68((unint64_t)v2, v9, &v68);
      }
      if (v7 == ++v8)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_258EA8BB0();
  char v14 = (void *)__swift_project_value_buffer(v13, (uint64_t)qword_26A0D0790);
  uint64_t v15 = sub_258EA8B90();
  int v16 = sub_258EA8E70();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    BOOL v63 = v2;
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v67[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_beginAccess();
    uint64_t v19 = v68;
    int64_t v20 = *(void *)(v68 + 16);
    uint64_t v21 = MEMORY[0x263F8EE78];
    if (v20)
    {
      uint64_t v61 = v18;
      int v62 = v16;
      char v65 = v14;
      uint64_t v66 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_258E82B00(0, v20, 0);
      uint64_t v22 = 0;
      uint64_t v21 = v66;
      unint64_t v23 = *(void *)(v66 + 16);
      do
      {
        int v24 = *(_DWORD *)(v19 + 4 * v22 + 32);
        uint64_t v66 = v21;
        unint64_t v25 = *(void *)(v21 + 24);
        if (v23 >= v25 >> 1)
        {
          sub_258E82B00(v25 > 1, v23 + 1, 1);
          uint64_t v21 = v66;
        }
        ++v22;
        *(void *)(v21 + 16) = v23 + 1;
        *(_DWORD *)(v21 + 4 * v23++ + 32) = v24;
      }
      while (v20 != v22);
      swift_bridgeObjectRelease();
      char v14 = v65;
      LOBYTE(v16) = v62;
      uint64_t v18 = v61;
    }
    uint64_t v26 = MEMORY[0x25A2D2A80](v21, MEMORY[0x263F8E548]);
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    uint64_t v66 = sub_258E787E0(v26, v28, v67);
    sub_258EA8F40();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_258E57000, v15, (os_log_type_t)v16, "Plugin finished sending durable features to Biome. Stored features: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2D36B0](v18, -1, -1);
    MEMORY[0x25A2D36B0](v17, -1, -1);

    uint64_t v2 = v63;
  }
  else
  {
  }
  LODWORD(v67[0]) = 3;
  BYTE4(v67[0]) = 1;
  if ((NSUserDefaults.shouldCompute(_:)((int *)v67) & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v29 = v2[46];
  uint64_t v30 = v2[47];
  __swift_project_boxed_opaque_existential_1(v2 + 43, v29);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30))
  {
    long long v31 = sub_258EA8B90();
    os_log_type_t v32 = sub_258EA8E70();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v33 = 0;
      _os_log_impl(&dword_258E57000, v31, v32, "Subtask cancelled before pruning the Durable Feature Store.", v33, 2u);
      goto LABEL_43;
    }
LABEL_44:

    return swift_bridgeObjectRelease();
  }
  char v65 = v14;
  uint64_t v44 = sub_258EA8A80();
  uint64_t v45 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  unint64_t v47 = (char *)&v60 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
  MEMORY[0x270FA5388](v48 - 8);
  unint64_t v50 = (char *)&v60 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v67[0]) = 4;
  BYTE4(v67[0]) = 1;
  sub_258E7FA84((int *)v67, (uint64_t)v50);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v50, 0, 1, v44);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v50, 1, v44) == 1)
  {
    sub_258E81B50((uint64_t)v50, &qword_26A0D0370);
    sub_258EA8980();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v47, v50, v44);
  }
  sub_258E912E0((uint64_t)v47);
  unint64_t v51 = (void *)qword_26A0D0360;
  int64_t v52 = (void *)sub_258EA8C30();
  objc_msgSend(v51, sel_removeObjectForKey_, v52);

  LODWORD(v67[0]) = 3;
  BYTE4(v67[0]) = 1;
  NSUserDefaults.saveComputationDate(_:)((int *)v67);
  unint64_t v53 = sub_258EA8B90();
  os_log_type_t v54 = sub_258EA8E70();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v55 = 0;
    _os_log_impl(&dword_258E57000, v53, v54, "Successfully deleted old durable features", v55, 2u);
    MEMORY[0x25A2D36B0](v55, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v44);
  return swift_bridgeObjectRelease();
}

void destroy for DurableFeatureManager(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 392);
}

uint64_t initializeWithCopy for DurableFeatureManager(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  os_log_type_t v32 = v4;
  unint64_t v33 = *(void **)(a2 + 32);
  uint64_t v34 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v33;
  *(void *)(a1 + 40) = v34;
  os_log_type_t v35 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v35;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  uint64_t v8 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v8;
  uint64_t v9 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v9;
  uint64_t v10 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v10;
  uint64_t v11 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v11;
  uint64_t v12 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v12;
  uint64_t v13 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v13;
  uint64_t v14 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v14;
  uint64_t v15 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v15;
  uint64_t v16 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v16;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  uint64_t v17 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v17;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  uint64_t v18 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v18;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  uint64_t v30 = a2 + 344;
  uint64_t v31 = a1 + 344;
  long long v19 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v19;
  uint64_t v20 = v19;
  uint64_t v29 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
  swift_bridgeObjectRetain();
  id v21 = v32;
  id v22 = v33;
  id v23 = v34;
  id v24 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29(v31, v30, v20);
  uint64_t v25 = *(void *)(a2 + 384);
  uint64_t v26 = *(void **)(a2 + 392);
  *(void *)(a1 + 384) = v25;
  *(void *)(a1 + 392) = v26;
  swift_bridgeObjectRetain();
  id v27 = v26;
  return a1;
}

uint64_t assignWithCopy for DurableFeatureManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 40);
  uint64_t v11 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a2 + 48);
  uint64_t v14 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v13;
  id v15 = v13;

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void **)(a2 + 392);
  uint64_t v17 = *(void **)(a1 + 392);
  *(void *)(a1 + 392) = v16;
  id v18 = v16;

  return a1;
}

void *__swift_memcpy400_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x190uLL);
}

uint64_t assignWithTake for DurableFeatureManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  uint64_t v7 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  uint64_t v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  long long v20 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v20;
  uint64_t v21 = *(void *)(a2 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v21;
  swift_bridgeObjectRelease();
  id v22 = *(void **)(a1 + 392);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);

  return a1;
}

uint64_t getEnumTagSinglePayload for DurableFeatureManager(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 400)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DurableFeatureManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 392) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 400) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 400) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DurableFeatureManager()
{
  return &type metadata for DurableFeatureManager;
}

void sub_258E92A68(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = sub_258EA8A80();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258EA8A70();
  unint64_t v12 = sub_258E8B9D8(a2);
  if (v3)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))((char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_258EA8BB0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A0D0790);
    id v14 = v3;
    id v15 = v3;
    uint64_t v16 = sub_258EA8B90();
    os_log_type_t v17 = sub_258EA8E90();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 67109378;
      LODWORD(v54) = a2;
      sub_258EA8F40();
      *(_WORD *)(v18 + 8) = 2112;
      id v20 = v3;
      uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
      unint64_t v54 = v21;
      sub_258EA8F40();
      *uint64_t v19 = v21;

      _os_log_impl(&dword_258E57000, v16, v17, "Failed to compute and send to Biome feature %d. Error: %@", (uint8_t *)v18, 0x12u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0530);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v19, -1, -1);
      MEMORY[0x25A2D36B0](v18, -1, -1);
    }
    else
    {
    }
    return;
  }
  unint64_t v22 = v12;
  double v48 = *(double *)&a3;
  uint64_t v49 = v9;
  int64_t v52 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v51 = a2;
  uint64_t v50 = v8;
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_258EA9150();
    if (!v23) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v23 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v23) {
      goto LABEL_16;
    }
  }
  if (v23 < 1)
  {
    __break(1u);
LABEL_31:
    double v48 = v24;
    swift_once();
    double v24 = v48;
    goto LABEL_22;
  }
  uint64_t v25 = 0;
  uint64_t v26 = *(void **)(a1 + 392);
  do
  {
    if ((v22 & 0xC000000000000001) != 0) {
      id v27 = (id)MEMORY[0x25A2D2D90](v25, v22);
    }
    else {
      id v27 = *(id *)(v22 + 8 * v25 + 32);
    }
    unint64_t v28 = v27;
    ++v25;
    objc_msgSend(v26, sel_sendEvent_, v27, *(void *)&v48);
  }
  while (v23 != v25);
LABEL_16:
  swift_bridgeObjectRelease_n();
  uint64_t v29 = *(uint64_t **)&v48;
  uint64_t v30 = **(void **)&v48;
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v29 = v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_258E9CAE8(0, *(void *)(v30 + 16) + 1, 1, (char *)v30);
    uint64_t v30 = isUniquelyReferenced_nonNull_native;
    *uint64_t v29 = isUniquelyReferenced_nonNull_native;
  }
  unint64_t v33 = *(void *)(v30 + 16);
  unint64_t v32 = *(void *)(v30 + 24);
  if (v33 >= v32 >> 1)
  {
    uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_258E9CAE8((char *)(v32 > 1), v33 + 1, 1, (char *)v30);
    uint64_t v30 = isUniquelyReferenced_nonNull_native;
  }
  *(void *)(v30 + 16) = v33 + 1;
  int v34 = v51;
  *(_DWORD *)(v30 + 4 * v33 + 32) = v51;
  *uint64_t v29 = v30;
  MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258EA8A70();
  sub_258EA89E0();
  double v4 = v35;
  uint64_t v23 = 0x26A0D0000uLL;
  a1 = 0x26A0D0000uLL;
  if ((objc_msgSend(self, sel_isInternalDevice) & 1) == 0) {
    goto LABEL_27;
  }
  double v24 = 1000.0;
  if (qword_26A0D01F0 != -1) {
    goto LABEL_31;
  }
LABEL_22:
  double v36 = v4 * v24;
  uint64_t v37 = sub_258EA8BB0();
  __swift_project_value_buffer(v37, (uint64_t)qword_26A0D0790);
  int64_t v38 = sub_258EA8B90();
  os_log_type_t v39 = sub_258EA8E80();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 134218240;
    unint64_t v54 = *(void *)&v36;
    sub_258EA8F40();
    *(_WORD *)(v40 + 12) = 1024;
    LODWORD(v54) = v51;
    sub_258EA8F40();
    _os_log_impl(&dword_258E57000, v38, v39, "Computation Time: %f ms for feature %d", (uint8_t *)v40, 0x12u);
    MEMORY[0x25A2D36B0](v40, -1, -1);
  }

  if (*(void *)(v23 + 488) != -1) {
    swift_once();
  }
  unint64_t v41 = *(void **)(a1 + 864);
  int v42 = (void *)sub_258EA8DF0();
  unint64_t v54 = 0;
  unint64_t v55 = 0xE000000000000000;
  sub_258EA9030();
  swift_bridgeObjectRelease();
  unint64_t v54 = 0xD000000000000010;
  unint64_t v55 = 0x8000000258EB3BD0;
  int v43 = v51;
  int v53 = v51;
  sub_258EA91D0();
  sub_258EA8C90();
  swift_bridgeObjectRelease();
  sub_258EA8C90();
  uint64_t v44 = (void *)sub_258EA8C30();
  swift_bridgeObjectRelease();
  objc_msgSend(v41, sel_setValue_forKey_, v42, v44);

  int v34 = v43;
LABEL_27:
  uint64_t v45 = v49;
  if (qword_26A0D01E8 != -1) {
    swift_once();
  }
  LODWORD(v54) = v34;
  BYTE4(v54) = 0;
  NSUserDefaults.saveComputationDate(_:)((int *)&v54);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v45 + 8);
  uint64_t v47 = v50;
  v46(v11, v50);
  v46(v52, v47);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

double sub_258E93194@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_258E78DD0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_258E7CDDC();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_258E7D394((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_258E932A0(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a3 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

unint64_t sub_258E932A0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_258EA8F90();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_258EA9270();
        swift_bridgeObjectRetain();
        sub_258EA8C80();
        uint64_t v11 = sub_258EA9290();
        double result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          id v14 = (_OWORD *)(v13 + 16 * v3);
          id v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *id v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_258E9348C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_258E972B4();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_258E936BC(v6);
  return sub_258EA90A0();
}

uint64_t sub_258E93508(uint64_t *a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4, SEL *a5)
{
  uint64_t v10 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v10 = a2(v10);
    *a1 = v10;
  }
  uint64_t v12 = *(void *)(v10 + 16);
  v14[0] = v10 + 32;
  v14[1] = v12;
  sub_258E946F8(v14, a3, a4, a5);
  return sub_258EA90A0();
}

void *sub_258E935B4(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
{
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v4 <= 0)
    {
      uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
      uint64_t v5 = (void *)swift_allocObject();
      int64_t v6 = _swift_stdlib_malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      uint64_t v5[2] = v4;
      v5[3] = (2 * (v7 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    a2(v5 + 4, v4, a1);
    a2 = v8;
    swift_bridgeObjectRelease();
    if (a2 == (void (*)(void *, uint64_t, unint64_t))v4) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (!v4) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v5;
}

void sub_258E936BC(uint64_t *a1)
{
  uint64_t v7 = a1[1];
  uint64_t v8 = sub_258EA91C0();
  if (v8 >= v7)
  {
    if (v7 < 0) {
      goto LABEL_146;
    }
    if (v7) {
      sub_258E95090(0, v7, 1, a1);
    }
    return;
  }
  if (v7 >= 0) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v7 + 1;
  }
  if (v7 < -1) {
    goto LABEL_166;
  }
  uint64_t v132 = v8;
  uint64_t v139 = v1;
  uint64_t v129 = a1;
  if (v7 < 2)
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    uint64_t v154 = MEMORY[0x263F8EE78];
    unint64_t v138 = (char **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v7 != 1)
    {
      unint64_t v2 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_112:
      if (v2 >= 2)
      {
        uint64_t v123 = *v129;
        do
        {
          uint64_t v7 = v2 - 2;
          if (v2 < 2) {
            goto LABEL_141;
          }
          if (!v123) {
            goto LABEL_161;
          }
          uint64_t v124 = *(void *)&v5[16 * v7 + 32];
          uint64_t v3 = *(void *)&v5[16 * v2 + 24];
          uint64_t v125 = v139;
          sub_258E9565C((id *)(v123 + 8 * v124), (id *)(v123 + 8 * *(void *)&v5[16 * v2 + 16]), (id *)(v123 + 8 * v3), v138);
          uint64_t v139 = v125;
          if (v125) {
            break;
          }
          if (v3 < v124) {
            goto LABEL_142;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v5 = sub_258E96680((uint64_t)v5);
          }
          if ((unint64_t)v7 >= *((void *)v5 + 2)) {
            goto LABEL_143;
          }
          uint64_t v126 = &v5[16 * v7 + 32];
          *(void *)uint64_t v126 = v124;
          *((void *)v126 + 1) = v3;
          uint64_t v7 = *((void *)v5 + 2);
          if (v2 > v7) {
            goto LABEL_144;
          }
          memmove(&v5[16 * v2 + 16], &v5[16 * v2 + 32], 16 * (v7 - v2));
          *((void *)v5 + 2) = v7 - 1;
          unint64_t v2 = v7 - 1;
        }
        while ((unint64_t)v7 > 2);
      }
LABEL_123:
      swift_bridgeObjectRelease();
      *(void *)((v154 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_258EA8D60();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v10 = v9 >> 1;
    sub_258E7451C(0, &qword_26A0D05C0);
    uint64_t v11 = sub_258EA8D80();
    *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) = v10;
    unint64_t v138 = (char **)((v11 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v154 = v11;
  }
  uint64_t v12 = 0;
  uint64_t v13 = *a1;
  uint64_t v131 = *a1 + 16;
  uint64_t v130 = v13 - 8;
  uint64_t v5 = (char *)MEMORY[0x263F8EE78];
  uint64_t v136 = (char *)v7;
  uint64_t v141 = v13;
  while (1)
  {
    uint64_t v14 = v12 + 1;
    uint64_t v137 = v12;
    if (v12 + 1 >= v7) {
      goto LABEL_41;
    }
    id v15 = *(void **)(v13 + 8 * v14);
    uint64_t v16 = *(void **)(v13 + 8 * v12);
    uint64_t v144 = v15;
    unint64_t v142 = v16;
    uint64_t v3 = (uint64_t)objc_msgSend(v142, sel_startDate);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
    uint64_t v133 = &v129;
    MEMORY[0x270FA5388](v17 - 8);
    id v153 = v18;
    uint64_t v7 = (uint64_t)&v129 - (((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (!v3) {
      goto LABEL_162;
    }
    uint64_t v19 = sub_258EA8A80();
    uint64_t v20 = *(void **)(v19 - 8);
    MEMORY[0x270FA5388](v19);
    uint64_t v149 = v21;
    uint64_t v22 = (char *)&v129 - (((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_258EA8A40();

    unint64_t v147 = (void (*)(uint64_t, char *, uint64_t))v20[4];
    uint64_t v148 = (unsigned int (*)(char *, uint64_t, uint64_t))(v20 + 4);
    v147(v7, v22, v19);
    uint64_t v150 = (uint64_t **)v20[7];
    id v151 = v20 + 7;
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v150)(v7, 0, 1, v19);
    BOOL v23 = (uint64_t **)v20[6];
    uint64_t v152 = (void (*)(void, void, void, void))v19;
    uint64_t v145 = v23;
    unint64_t v146 = (uint64_t **)(v20 + 6);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v23)(v7, 1, v19) == 1) {
      goto LABEL_163;
    }
    unint64_t v134 = v5;
    uint64_t v4 = (uint64_t)objc_msgSend(v144, sel_startDate);
    unint64_t v2 = (unint64_t)&v129;
    uint64_t v24 = MEMORY[0x270FA5388](v4);
    uint64_t v3 = (uint64_t)&v129 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (!v24) {
      goto LABEL_164;
    }
    MEMORY[0x270FA5388](v24);
    id v27 = (char *)&v129 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_258EA8A40();

    unint64_t v28 = v27;
    uint64_t v29 = v152;
    v147(v3, v28, (uint64_t)v152);
    ((void (*)(uint64_t, void, uint64_t, void))v150)(v3, 0, 1, v29);
    if (((unsigned int (*)(uint64_t, uint64_t, void (*)(void, void, void, void)))v145)(v3, 1, v29) == 1)goto LABEL_165; {
    LODWORD(v143) = sub_258EA8A10();
    }
    uint64_t v30 = (void (*)(void, void))v20[1];
    v30(v3, v29);
    unint64_t v140 = (void **)(v20 + 1);
    uint64_t v135 = v30;
    v30(v7, v29);

    uint64_t v7 = (uint64_t)v136;
    uint64_t v12 = v137;
    uint64_t v14 = v137 + 2;
    if (v137 + 2 >= (uint64_t)v136)
    {
      uint64_t v5 = v134;
      if ((v143 & 1) == 0) {
        goto LABEL_41;
      }
LABEL_33:
      if (v14 < v12) {
        goto LABEL_147;
      }
      if (v12 < v14)
      {
        int64_t v52 = (uint64_t *)(v130 + 8 * v14);
        uint64_t v53 = v12;
        uint64_t v54 = v14;
        uint64_t v55 = v53;
        uint64_t v56 = (uint64_t *)(v13 + 8 * v53);
        do
        {
          if (v55 != --v54)
          {
            if (!v13) {
              goto LABEL_160;
            }
            uint64_t v57 = *v56;
            *uint64_t v56 = *v52;
            *int64_t v52 = v57;
          }
          ++v55;
          --v52;
          ++v56;
        }
        while (v55 < v54);
        uint64_t v12 = v137;
      }
      goto LABEL_41;
    }
    uint64_t v31 = (id *)(v131 + 8 * v137);
    while (1)
    {
      unint64_t v142 = (char *)v14;
      unint64_t v32 = *(v31 - 1);
      id v33 = *v31;
      int v34 = v32;
      uint64_t v4 = (uint64_t)objc_msgSend(v34, sel_startDate);
      uint64_t v7 = (uint64_t)&v129;
      uint64_t v35 = MEMORY[0x270FA5388](v4);
      uint64_t v3 = (uint64_t)&v129 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (!v35) {
        goto LABEL_156;
      }
      MEMORY[0x270FA5388](v35);
      int64_t v38 = (char *)&v129 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_258EA8A40();

      os_log_type_t v39 = v38;
      uint64_t v40 = v152;
      v147(v3, v39, (uint64_t)v152);
      ((void (*)(uint64_t, void, uint64_t, void))v150)(v3, 0, 1, v40);
      if (((unsigned int (*)(uint64_t, uint64_t, void (*)(void, void, void, void)))v145)(v3, 1, v40) == 1)goto LABEL_157; {
      uint64_t v144 = v34;
      }
      unint64_t v41 = v33;
      id v42 = objc_msgSend(v33, sel_startDate);
      unint64_t v2 = (unint64_t)&v129;
      uint64_t v43 = MEMORY[0x270FA5388](v42);
      uint64_t v4 = (uint64_t)&v129 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (!v43) {
        goto LABEL_158;
      }
      MEMORY[0x270FA5388](v43);
      uint64_t v46 = (char *)&v129 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_258EA8A40();

      uint64_t v47 = v46;
      double v48 = v152;
      v147(v4, v47, (uint64_t)v152);
      ((void (*)(uint64_t, void, uint64_t, void))v150)(v4, 0, 1, v48);
      if (((unsigned int (*)(uint64_t, uint64_t, void (*)(void, void, void, void)))v145)(v4, 1, v48) == 1)goto LABEL_159; {
      int v49 = sub_258EA8A10();
      }
      uint64_t v50 = v4;
      uint64_t v4 = (uint64_t)v140;
      int v51 = v135;
      v135(v50, v48);
      v51(v3, v48);

      uint64_t v13 = v141;
      if ((v143 ^ v49)) {
        break;
      }
      uint64_t v14 = (uint64_t)(v142 + 1);
      ++v31;
      uint64_t v7 = (uint64_t)v136;
      if (v136 == v142 + 1)
      {
        uint64_t v14 = (uint64_t)v136;
        uint64_t v5 = v134;
        goto LABEL_32;
      }
    }
    uint64_t v5 = v134;
    uint64_t v7 = (uint64_t)v136;
    uint64_t v14 = (uint64_t)v142;
LABEL_32:
    uint64_t v12 = v137;
    if (v143) {
      goto LABEL_33;
    }
LABEL_41:
    if (v14 >= v7) {
      goto LABEL_62;
    }
    if (__OFSUB__(v14, v12)) {
      goto LABEL_145;
    }
    if (v14 - v12 >= v132)
    {
      uint64_t v12 = v137;
      goto LABEL_62;
    }
    unint64_t v58 = (void (*)(void, void))(v137 + v132);
    if (__OFADD__(v137, v132)) {
      goto LABEL_148;
    }
    uint64_t v12 = v137;
    if ((uint64_t)v58 >= v7) {
      unint64_t v58 = (void (*)(void, void))v7;
    }
    if ((uint64_t)v58 < v137) {
      break;
    }
    if ((void (*)(void, void))v14 != v58)
    {
      unint64_t v134 = v5;
      uint64_t v135 = v58;
      unint64_t v59 = (void **)(v130 + 8 * v14);
      do
      {
        int v62 = *(void **)(v13 + 8 * v14);
        BOOL v63 = v59;
        unint64_t v142 = (char *)v14;
        unint64_t v140 = v59;
        while (1)
        {
          unint64_t v143 = v63;
          uint64_t v144 = (char *)v12;
          uint64_t v64 = *v63;
          id v153 = v62;
          id v151 = v64;
          uint64_t v4 = (uint64_t)objc_msgSend(v151, sel_startDate);
          uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
          uint64_t v150 = &v129;
          uint64_t v66 = *(void *)(*(void *)(v65 - 8) + 64);
          MEMORY[0x270FA5388](v65 - 8);
          unint64_t v2 = (unint64_t)&v129 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v4) {
            goto LABEL_152;
          }
          uint64_t v3 = sub_258EA8A80();
          char v67 = *(void **)(v3 - 8);
          uint64_t v68 = v67[8];
          MEMORY[0x270FA5388](v3);
          sub_258EA8A40();

          uint64_t v149 = (void (*)(char *, char *, uint64_t))v67[4];
          v149((char *)&v129 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v129 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
          unint64_t v2 = (unint64_t)(v67 + 7);
          uint64_t v152 = (void (*)(void, void, void, void))v67[7];
          v152((char *)&v129 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v3);
          uint64_t v7 = (uint64_t)(v67 + 6);
          BOOL v69 = (unsigned int (*)(char *, uint64_t, uint64_t))v67[6];
          unint64_t v147 = (void (*)(uint64_t, char *, uint64_t))((char *)&v129 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0));
          uint64_t v148 = v69;
          if (v69((char *)v147, 1, v3) == 1) {
            goto LABEL_153;
          }
          uint64_t v4 = (uint64_t)objc_msgSend(v153, sel_startDate);
          unint64_t v146 = &v129;
          uint64_t v70 = MEMORY[0x270FA5388](v4);
          uint64_t v5 = (char *)&v129 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v70) {
            goto LABEL_150;
          }
          uint64_t v145 = &v129;
          MEMORY[0x270FA5388](v70);
          sub_258EA8A40();

          v149(v5, (char *)&v129 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
          v152(v5, 0, 1, v3);
          if (v148(v5, 1, v3) == 1) {
            goto LABEL_151;
          }
          uint64_t v7 = (uint64_t)v147;
          char v71 = sub_258EA8A10();
          unint64_t v72 = (void (*)(char *, uint64_t))v67[1];
          v72(v5, v3);
          v72((char *)v7, v3);

          uint64_t v13 = v141;
          if ((v71 & 1) == 0) {
            break;
          }
          uint64_t v61 = v140;
          if (!v141) {
            goto LABEL_154;
          }
          uint64_t v60 = v142;
          int64_t v73 = v143;
          unint64_t v74 = *v143;
          int v62 = v143[1];
          *unint64_t v143 = v62;
          v73[1] = v74;
          BOOL v63 = v73 - 1;
          uint64_t v12 = (uint64_t)(v144 + 1);
          if (v60 == v144 + 1) {
            goto LABEL_51;
          }
        }
        uint64_t v60 = v142;
        uint64_t v61 = v140;
LABEL_51:
        uint64_t v14 = (uint64_t)(v60 + 1);
        unint64_t v59 = v61 + 1;
        uint64_t v12 = v137;
      }
      while ((void (*)(void, void))v14 != v135);
      uint64_t v5 = v134;
      uint64_t v14 = (uint64_t)v135;
      if ((uint64_t)v135 < v137) {
        goto LABEL_140;
      }
      goto LABEL_63;
    }
LABEL_62:
    if (v14 < v12) {
      goto LABEL_140;
    }
LABEL_63:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v5 = sub_258E9640C(0, *((void *)v5 + 2) + 1, 1, v5);
    }
    unint64_t v76 = *((void *)v5 + 2);
    unint64_t v75 = *((void *)v5 + 3);
    unint64_t v2 = v76 + 1;
    uint64_t v77 = v137;
    unint64_t v142 = (char *)v14;
    if (v76 >= v75 >> 1)
    {
      long long v122 = sub_258E9640C((char *)(v75 > 1), v76 + 1, 1, v5);
      uint64_t v77 = v137;
      uint64_t v5 = v122;
    }
    *((void *)v5 + 2) = v2;
    uint64_t v78 = v5 + 32;
    uint64_t v79 = &v5[16 * v76 + 32];
    *(void *)uint64_t v79 = v77;
    *((void *)v79 + 1) = v142;
    if (v76)
    {
      while (1)
      {
        unint64_t v80 = v2 - 1;
        if (v2 >= 4)
        {
          unint64_t v85 = &v78[16 * v2];
          uint64_t v86 = *((void *)v85 - 8);
          uint64_t v87 = *((void *)v85 - 7);
          BOOL v91 = __OFSUB__(v87, v86);
          uint64_t v88 = v87 - v86;
          if (v91) {
            goto LABEL_129;
          }
          uint64_t v90 = *((void *)v85 - 6);
          uint64_t v89 = *((void *)v85 - 5);
          BOOL v91 = __OFSUB__(v89, v90);
          uint64_t v83 = v89 - v90;
          char v84 = v91;
          if (v91) {
            goto LABEL_130;
          }
          unint64_t v92 = v2 - 2;
          char v93 = &v78[16 * v2 - 32];
          uint64_t v95 = *(void *)v93;
          uint64_t v94 = *((void *)v93 + 1);
          BOOL v91 = __OFSUB__(v94, v95);
          uint64_t v96 = v94 - v95;
          if (v91) {
            goto LABEL_132;
          }
          BOOL v91 = __OFADD__(v83, v96);
          uint64_t v97 = v83 + v96;
          if (v91) {
            goto LABEL_135;
          }
          if (v97 >= v88)
          {
            unint64_t v115 = &v78[16 * v80];
            uint64_t v117 = *(void *)v115;
            uint64_t v116 = *((void *)v115 + 1);
            BOOL v91 = __OFSUB__(v116, v117);
            uint64_t v118 = v116 - v117;
            if (v91) {
              goto LABEL_139;
            }
            BOOL v108 = v83 < v118;
            goto LABEL_99;
          }
        }
        else
        {
          if (v2 != 3)
          {
            uint64_t v109 = *((void *)v5 + 4);
            uint64_t v110 = *((void *)v5 + 5);
            BOOL v91 = __OFSUB__(v110, v109);
            uint64_t v102 = v110 - v109;
            char v103 = v91;
            goto LABEL_93;
          }
          uint64_t v82 = *((void *)v5 + 4);
          uint64_t v81 = *((void *)v5 + 5);
          BOOL v91 = __OFSUB__(v81, v82);
          uint64_t v83 = v81 - v82;
          char v84 = v91;
        }
        if (v84) {
          goto LABEL_131;
        }
        unint64_t v92 = v2 - 2;
        int v98 = &v78[16 * v2 - 32];
        uint64_t v100 = *(void *)v98;
        uint64_t v99 = *((void *)v98 + 1);
        BOOL v101 = __OFSUB__(v99, v100);
        uint64_t v102 = v99 - v100;
        char v103 = v101;
        if (v101) {
          goto LABEL_134;
        }
        uint64_t v104 = &v78[16 * v80];
        uint64_t v106 = *(void *)v104;
        uint64_t v105 = *((void *)v104 + 1);
        BOOL v91 = __OFSUB__(v105, v106);
        uint64_t v107 = v105 - v106;
        if (v91) {
          goto LABEL_137;
        }
        if (__OFADD__(v102, v107)) {
          goto LABEL_138;
        }
        if (v102 + v107 >= v83)
        {
          BOOL v108 = v83 < v107;
LABEL_99:
          if (v108) {
            unint64_t v80 = v92;
          }
          goto LABEL_101;
        }
LABEL_93:
        if (v103) {
          goto LABEL_133;
        }
        uint64_t v111 = &v78[16 * v80];
        uint64_t v113 = *(void *)v111;
        uint64_t v112 = *((void *)v111 + 1);
        BOOL v91 = __OFSUB__(v112, v113);
        uint64_t v114 = v112 - v113;
        if (v91) {
          goto LABEL_136;
        }
        if (v114 < v102) {
          goto LABEL_14;
        }
LABEL_101:
        unint64_t v119 = v80 - 1;
        if (v80 - 1 >= v2)
        {
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
          goto LABEL_149;
        }
        if (!v13) {
          goto LABEL_155;
        }
        unint64_t v2 = (unint64_t)&v78[16 * v119];
        uint64_t v3 = *(void *)v2;
        uint64_t v7 = (uint64_t)&v78[16 * v80];
        uint64_t v4 = *(void *)(v7 + 8);
        uint64_t v120 = v139;
        sub_258E9565C((id *)(v13 + 8 * *(void *)v2), (id *)(v13 + 8 * *(void *)v7), (id *)(v13 + 8 * v4), v138);
        uint64_t v139 = v120;
        if (v120) {
          goto LABEL_123;
        }
        if (v4 < v3) {
          goto LABEL_126;
        }
        if (v80 > *((void *)v5 + 2)) {
          goto LABEL_127;
        }
        *(void *)unint64_t v2 = v3;
        *(void *)&v78[16 * v119 + 8] = v4;
        unint64_t v121 = *((void *)v5 + 2);
        if (v80 >= v121) {
          goto LABEL_128;
        }
        unint64_t v2 = v121 - 1;
        memmove(&v78[16 * v80], (const void *)(v7 + 16), 16 * (v121 - 1 - v80));
        *((void *)v5 + 2) = v121 - 1;
        if (v121 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v2 = 1;
LABEL_14:
    uint64_t v7 = (uint64_t)v136;
    uint64_t v12 = (uint64_t)v142;
    if ((uint64_t)v142 >= (uint64_t)v136) {
      goto LABEL_112;
    }
  }
LABEL_149:
  __break(1u);
LABEL_150:
  v152(v5, 1, 1, v3);
LABEL_151:
  __break(1u);
LABEL_152:
  uint64_t v127 = sub_258EA8A80();
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v127 - 8) + 56))(v2, 1, 1, v127);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  ((void (*)(uint64_t, uint64_t, uint64_t, void))v150)(v3, 1, 1, v152);
LABEL_157:
  __break(1u);
LABEL_158:
  ((void (*)(uint64_t, uint64_t, uint64_t, void))v150)(v4, 1, 1, v152);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  uint64_t v128 = sub_258EA8A80();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v128 - 8) + 56))(v7, 1, 1, v128);
LABEL_163:
  __break(1u);
LABEL_164:
  ((void (*)(uint64_t, uint64_t, uint64_t, void))v150)(v3, 1, 1, v152);
LABEL_165:
  __break(1u);
LABEL_166:
  sub_258EA9130();
  __break(1u);
}

char *sub_258E946F8(uint64_t *a1, unint64_t *a2, uint64_t a3, SEL *a4)
{
  uint64_t v7 = a1[1];
  double result = (char *)sub_258EA91C0();
  if ((uint64_t)result >= v7)
  {
    if (v7 < 0) {
      goto LABEL_158;
    }
    if (v7) {
      return sub_258E954AC(0, (char *)v7, (char *)1, a1, a4);
    }
  }
  else
  {
    if (v7 >= 0) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v7 + 1;
    }
    if (v7 < -1)
    {
LABEL_172:
      double result = (char *)sub_258EA9130();
      __break(1u);
    }
    else
    {
      uint64_t v139 = result;
      uint64_t v145 = v7;
      uint64_t v149 = v4;
      if (v7 >= 2)
      {
        uint64_t v10 = v9 >> 1;
        sub_258E7451C(0, a2);
        uint64_t v11 = sub_258EA8D80();
        *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) = v10;
        uint64_t v148 = (void **)((v11 & 0xFFFFFFFFFFFFFF8) + 32);
        uint64_t v155 = v11;
LABEL_12:
        uint64_t v13 = 0;
        uint64_t v14 = *a1;
        uint64_t v137 = *a1 + 16;
        uint64_t v138 = *a1 - 8;
        uint64_t v12 = (char *)MEMORY[0x263F8EE78];
        uint64_t v150 = a4;
        uint64_t v15 = v145;
        uint64_t v151 = *a1;
        while (1)
        {
          uint64_t v17 = v13 + 1;
          uint64_t v144 = v13;
          if (v13 + 1 >= v15) {
            goto LABEL_49;
          }
          unint64_t v140 = v12;
          uint64_t v18 = *(void **)(v14 + 8 * v13);
          uint64_t v19 = a4;
          id v20 = *(id *)(v14 + 8 * v17);
          id v21 = v18;
          id v22 = [v20 *v19];
          if (!v22) {
            goto LABEL_170;
          }
          BOOL v23 = v22;
          uint64_t v24 = sub_258EA8C50();
          uint64_t v26 = v25;

          id v27 = [v21 *v19];
          if (!v27)
          {
LABEL_171:
            __break(1u);
            goto LABEL_172;
          }
          unint64_t v28 = v27;
          uint64_t v29 = sub_258EA8C50();
          uint64_t v31 = v30;

          BOOL v32 = v24 == v29 && v26 == v31;
          uint64_t v13 = v144;
          if (v32) {
            int v146 = 0;
          }
          else {
            int v146 = sub_258EA91E0();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          uint64_t v17 = v144 + 2;
          if (v144 + 2 >= v145) {
            goto LABEL_40;
          }
          id v33 = (id *)(v137 + 8 * v144);
          while (1)
          {
            uint64_t v152 = v17;
            uint64_t v35 = *(v33 - 1);
            id v36 = *v33;
            id v37 = v35;
            id v38 = [v36 *v150];
            if (!v38) {
              goto LABEL_166;
            }
            os_log_type_t v39 = v38;
            uint64_t v40 = sub_258EA8C50();
            uint64_t v42 = v41;

            id v43 = [v37 *v150];
            if (!v43) {
              goto LABEL_167;
            }
            uint64_t v44 = v43;
            uint64_t v45 = sub_258EA8C50();
            uint64_t v47 = v46;

            if (v40 == v45 && v42 == v47)
            {

              swift_bridgeObjectRelease_n();
              if (v146)
              {
                a4 = v150;
                uint64_t v14 = v151;
                uint64_t v12 = v140;
                uint64_t v17 = v152;
                uint64_t v13 = v144;
                goto LABEL_41;
              }
              goto LABEL_27;
            }
            int v34 = sub_258EA91E0();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v146 ^ v34)) {
              break;
            }
LABEL_27:
            uint64_t v17 = v152 + 1;
            ++v33;
            if (v145 == v152 + 1)
            {
              uint64_t v17 = v145;
              goto LABEL_39;
            }
          }
          uint64_t v17 = v152;
LABEL_39:
          uint64_t v13 = v144;
LABEL_40:
          a4 = v150;
          uint64_t v14 = v151;
          uint64_t v12 = v140;
          if (v146)
          {
LABEL_41:
            if (v17 < v13) {
              goto LABEL_159;
            }
            if (v13 < v17)
            {
              int v49 = (uint64_t *)(v138 + 8 * v17);
              uint64_t v50 = v17;
              uint64_t v51 = v13;
              int64_t v52 = (uint64_t *)(v14 + 8 * v13);
              do
              {
                if (v51 != --v50)
                {
                  if (!v14) {
                    goto LABEL_168;
                  }
                  uint64_t v53 = *v52;
                  *int64_t v52 = *v49;
                  *int v49 = v53;
                }
                ++v51;
                --v49;
                ++v52;
              }
              while (v51 < v50);
            }
          }
LABEL_49:
          if (v17 < v145)
          {
            if (__OFSUB__(v17, v13)) {
              goto LABEL_157;
            }
            if (v17 - v13 < (uint64_t)v139)
            {
              if (__OFADD__(v13, v139)) {
                goto LABEL_160;
              }
              uint64_t v54 = (char *)v145;
              if ((uint64_t)&v139[v13] < v145) {
                uint64_t v54 = &v139[v13];
              }
              if ((uint64_t)v54 >= v13)
              {
                if ((char *)v17 != v54)
                {
                  uint64_t v141 = v12;
                  uint64_t v55 = v138 + 8 * v17;
                  unint64_t v143 = v54;
                  do
                  {
                    uint64_t v57 = *(void **)(v14 + 8 * v17);
                    uint64_t v147 = v55;
                    uint64_t v153 = v17;
                    while (1)
                    {
                      unint64_t v58 = *(void **)v55;
                      id v59 = v57;
                      id v60 = v58;
                      id v61 = [v59 *a4];
                      if (!v61) {
                        goto LABEL_163;
                      }
                      int v62 = v61;
                      uint64_t v63 = sub_258EA8C50();
                      uint64_t v65 = v64;

                      id v66 = [v60 *a4];
                      if (!v66) {
                        goto LABEL_162;
                      }
                      char v67 = v66;
                      uint64_t v68 = sub_258EA8C50();
                      uint64_t v70 = v69;

                      if (v63 == v68 && v65 == v70) {
                        break;
                      }
                      char v72 = sub_258EA91E0();

                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      if ((v72 & 1) == 0) {
                        goto LABEL_59;
                      }
                      a4 = v150;
                      uint64_t v14 = v151;
                      uint64_t v56 = v153;
                      if (!v151) {
                        goto LABEL_164;
                      }
                      int64_t v73 = *(void **)v55;
                      uint64_t v57 = *(void **)(v55 + 8);
                      *(void *)uint64_t v55 = v57;
                      *(void *)(v55 + 8) = v73;
                      v55 -= 8;
                      if (v153 == ++v13) {
                        goto LABEL_60;
                      }
                    }

                    swift_bridgeObjectRelease_n();
LABEL_59:
                    a4 = v150;
                    uint64_t v14 = v151;
                    uint64_t v56 = v153;
LABEL_60:
                    uint64_t v17 = v56 + 1;
                    uint64_t v55 = v147 + 8;
                    uint64_t v13 = v144;
                  }
                  while ((char *)v17 != v143);
                  uint64_t v17 = (uint64_t)v143;
                  uint64_t v12 = v141;
                }
                goto LABEL_73;
              }
LABEL_161:
              __break(1u);
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
LABEL_170:
              __break(1u);
              goto LABEL_171;
            }
          }
LABEL_73:
          if (v17 < v13) {
            goto LABEL_152;
          }
          unint64_t v74 = v12;
          if (swift_isUniquelyReferenced_nonNull_native()) {
            uint64_t v12 = v74;
          }
          else {
            uint64_t v12 = sub_258E9640C(0, *((void *)v74 + 2) + 1, 1, v74);
          }
          unint64_t v76 = *((void *)v12 + 2);
          unint64_t v75 = *((void *)v12 + 3);
          unint64_t v16 = v76 + 1;
          uint64_t v14 = v151;
          if (v76 >= v75 >> 1)
          {
            uint64_t v129 = sub_258E9640C((char *)(v75 > 1), v76 + 1, 1, v12);
            uint64_t v14 = v151;
            uint64_t v12 = v129;
          }
          *((void *)v12 + 2) = v16;
          uint64_t v77 = v12 + 32;
          uint64_t v78 = &v12[16 * v76 + 32];
          *(void *)uint64_t v78 = v144;
          *((void *)v78 + 1) = v17;
          uint64_t v154 = v17;
          if (v76)
          {
            while (2)
            {
              unint64_t v79 = v16 - 1;
              if (v16 >= 4)
              {
                char v84 = &v77[16 * v16];
                uint64_t v85 = *((void *)v84 - 8);
                uint64_t v86 = *((void *)v84 - 7);
                BOOL v90 = __OFSUB__(v86, v85);
                uint64_t v87 = v86 - v85;
                if (v90) {
                  goto LABEL_141;
                }
                uint64_t v89 = *((void *)v84 - 6);
                uint64_t v88 = *((void *)v84 - 5);
                BOOL v90 = __OFSUB__(v88, v89);
                uint64_t v82 = v88 - v89;
                char v83 = v90;
                if (v90) {
                  goto LABEL_142;
                }
                unint64_t v91 = v16 - 2;
                unint64_t v92 = &v77[16 * v16 - 32];
                uint64_t v94 = *(void *)v92;
                uint64_t v93 = *((void *)v92 + 1);
                BOOL v90 = __OFSUB__(v93, v94);
                uint64_t v95 = v93 - v94;
                if (v90) {
                  goto LABEL_144;
                }
                BOOL v90 = __OFADD__(v82, v95);
                uint64_t v96 = v82 + v95;
                if (v90) {
                  goto LABEL_147;
                }
                if (v96 >= v87)
                {
                  uint64_t v114 = &v77[16 * v79];
                  uint64_t v116 = *(void *)v114;
                  uint64_t v115 = *((void *)v114 + 1);
                  BOOL v90 = __OFSUB__(v115, v116);
                  uint64_t v117 = v115 - v116;
                  if (v90) {
                    goto LABEL_151;
                  }
                  BOOL v107 = v82 < v117;
                }
                else
                {
LABEL_92:
                  if (v83) {
                    goto LABEL_143;
                  }
                  unint64_t v91 = v16 - 2;
                  uint64_t v97 = &v77[16 * v16 - 32];
                  uint64_t v99 = *(void *)v97;
                  uint64_t v98 = *((void *)v97 + 1);
                  BOOL v100 = __OFSUB__(v98, v99);
                  uint64_t v101 = v98 - v99;
                  char v102 = v100;
                  if (v100) {
                    goto LABEL_146;
                  }
                  char v103 = &v77[16 * v79];
                  uint64_t v105 = *(void *)v103;
                  uint64_t v104 = *((void *)v103 + 1);
                  BOOL v90 = __OFSUB__(v104, v105);
                  uint64_t v106 = v104 - v105;
                  if (v90) {
                    goto LABEL_149;
                  }
                  if (__OFADD__(v101, v106)) {
                    goto LABEL_150;
                  }
                  if (v101 + v106 < v82) {
                    goto LABEL_104;
                  }
                  BOOL v107 = v82 < v106;
                }
                if (v107) {
                  unint64_t v79 = v91;
                }
              }
              else
              {
                if (v16 == 3)
                {
                  uint64_t v81 = *((void *)v12 + 4);
                  uint64_t v80 = *((void *)v12 + 5);
                  BOOL v90 = __OFSUB__(v80, v81);
                  uint64_t v82 = v80 - v81;
                  char v83 = v90;
                  goto LABEL_92;
                }
                uint64_t v108 = *((void *)v12 + 4);
                uint64_t v109 = *((void *)v12 + 5);
                BOOL v90 = __OFSUB__(v109, v108);
                uint64_t v101 = v109 - v108;
                char v102 = v90;
LABEL_104:
                if (v102) {
                  goto LABEL_145;
                }
                uint64_t v110 = &v77[16 * v79];
                uint64_t v112 = *(void *)v110;
                uint64_t v111 = *((void *)v110 + 1);
                BOOL v90 = __OFSUB__(v111, v112);
                uint64_t v113 = v111 - v112;
                if (v90) {
                  goto LABEL_148;
                }
                if (v113 < v101) {
                  goto LABEL_14;
                }
              }
              unint64_t v118 = v79 - 1;
              if (v79 - 1 >= v16)
              {
                __break(1u);
LABEL_138:
                __break(1u);
LABEL_139:
                __break(1u);
LABEL_140:
                __break(1u);
LABEL_141:
                __break(1u);
LABEL_142:
                __break(1u);
LABEL_143:
                __break(1u);
LABEL_144:
                __break(1u);
LABEL_145:
                __break(1u);
LABEL_146:
                __break(1u);
LABEL_147:
                __break(1u);
LABEL_148:
                __break(1u);
LABEL_149:
                __break(1u);
LABEL_150:
                __break(1u);
LABEL_151:
                __break(1u);
LABEL_152:
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
LABEL_157:
                __break(1u);
LABEL_158:
                __break(1u);
LABEL_159:
                __break(1u);
LABEL_160:
                __break(1u);
                goto LABEL_161;
              }
              if (!v14) {
                goto LABEL_165;
              }
              unint64_t v119 = a4;
              uint64_t v120 = v12;
              unint64_t v121 = v77;
              long long v122 = &v77[16 * v118];
              uint64_t v123 = *(void *)v122;
              uint64_t v124 = v121;
              unint64_t v125 = v79;
              uint64_t v126 = &v121[16 * v79];
              uint64_t v127 = *((void *)v126 + 1);
              sub_258E95FC8((id *)(v14 + 8 * *(void *)v122), (id *)(v14 + 8 * *(void *)v126), (id *)(v14 + 8 * v127), v148, v119);
              if (v149) {
                goto LABEL_135;
              }
              if (v127 < v123) {
                goto LABEL_138;
              }
              if (v125 > *((void *)v120 + 2)) {
                goto LABEL_139;
              }
              *(void *)long long v122 = v123;
              *(void *)&v124[16 * v118 + 8] = v127;
              unint64_t v128 = *((void *)v120 + 2);
              if (v125 >= v128) {
                goto LABEL_140;
              }
              uint64_t v77 = v124;
              uint64_t v149 = 0;
              unint64_t v16 = v128 - 1;
              memmove(v126, v126 + 16, 16 * (v128 - 1 - v125));
              uint64_t v12 = v120;
              *((void *)v120 + 2) = v128 - 1;
              uint64_t v14 = v151;
              a4 = v119;
              if (v128 <= 2) {
                goto LABEL_14;
              }
              continue;
            }
          }
          unint64_t v16 = 1;
LABEL_14:
          uint64_t v15 = v145;
          uint64_t v13 = v154;
          if (v154 >= v145) {
            goto LABEL_124;
          }
        }
      }
      uint64_t v12 = (char *)MEMORY[0x263F8EE78];
      uint64_t v155 = MEMORY[0x263F8EE78];
      uint64_t v148 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
      if (v7 == 1) {
        goto LABEL_12;
      }
      unint64_t v16 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_124:
      if (v16 >= 2)
      {
        uint64_t v130 = *a1;
        do
        {
          unint64_t v131 = v16 - 2;
          if (v16 < 2) {
            goto LABEL_153;
          }
          if (!v130) {
            goto LABEL_169;
          }
          uint64_t v132 = v12;
          uint64_t v133 = *(void *)&v12[16 * v131 + 32];
          uint64_t v134 = *(void *)&v12[16 * v16 + 24];
          sub_258E95FC8((id *)(v130 + 8 * v133), (id *)(v130 + 8 * *(void *)&v12[16 * v16 + 16]), (id *)(v130 + 8 * v134), v148, a4);
          if (v149) {
            break;
          }
          if (v134 < v133) {
            goto LABEL_154;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v132 = sub_258E96680((uint64_t)v132);
          }
          if (v131 >= *((void *)v132 + 2)) {
            goto LABEL_155;
          }
          uint64_t v135 = &v132[16 * v131 + 32];
          *(void *)uint64_t v135 = v133;
          *((void *)v135 + 1) = v134;
          unint64_t v136 = *((void *)v132 + 2);
          if (v16 > v136) {
            goto LABEL_156;
          }
          memmove(&v132[16 * v16 + 16], &v132[16 * v16 + 32], 16 * (v136 - v16));
          uint64_t v12 = v132;
          *((void *)v132 + 2) = v136 - 1;
          unint64_t v16 = v136 - 1;
        }
        while (v136 > 2);
      }
LABEL_135:
      swift_bridgeObjectRelease();
      *(void *)((v155 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_258EA8D60();
      return (char *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_258E95090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v30 = a2;
  uint64_t v31 = a1;
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v33 = *a4;
    uint64_t v6 = v33 + 8 * a3 - 8;
LABEL_5:
    uint64_t v7 = *(void **)(v33 + 8 * v5);
    uint64_t v34 = v5;
    uint64_t v35 = v31;
    uint64_t v32 = v6;
    uint64_t v8 = (void **)v6;
    while (1)
    {
      uint64_t v9 = *v8;
      id v44 = v7;
      id v10 = v9;
      id v11 = objc_msgSend(v10, sel_startDate);
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
      uint64_t v13 = *(char **)(*(void *)(v12 - 8) + 64);
      MEMORY[0x270FA5388](v12 - 8);
      if (!v11) {
        break;
      }
      uint64_t v39 = v14;
      id v40 = v10;
      uint64_t v41 = v8;
      uint64_t v4 = sub_258EA8A80();
      uint64_t v15 = *(void **)(v4 - 8);
      uint64_t v16 = v15[8];
      MEMORY[0x270FA5388](v4);
      sub_258EA8A40();

      id v43 = (void (*)(char *, char *, uint64_t))v15[4];
      v43((char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
      uint64_t v17 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v15[7];
      v17((char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v4);
      uint64_t v18 = (unsigned int (*)(void))v15[6];
      id v38 = (char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v18() == 1) {
        goto LABEL_15;
      }
      uint64_t v42 = v17;
      id v19 = objc_msgSend(v44, sel_startDate);
      uint64_t v20 = MEMORY[0x270FA5388](v19);
      uint64_t v13 = (char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (!v20) {
        goto LABEL_16;
      }
      uint64_t v36 = v21;
      id v37 = &v29;
      MEMORY[0x270FA5388](v20);
      sub_258EA8A40();

      v43(v13, (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
      v42(v13, 0, 1, v4);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v18)(v13, 1, v4) == 1) {
        goto LABEL_17;
      }
      id v22 = v38;
      char v23 = sub_258EA8A10();
      uint64_t v24 = (void (*)(char *, uint64_t))v15[1];
      v24(v13, v4);
      v24(v22, v4);

      uint64_t v25 = v34;
      uint64_t v26 = v41;
      if (v23)
      {
        if (!v33) {
          goto LABEL_18;
        }
        id v27 = *v41;
        uint64_t v7 = v41[1];
        *uint64_t v41 = v7;
        v26[1] = v27;
        uint64_t v8 = v26 - 1;
        if (v25 != ++v35) {
          continue;
        }
      }
      uint64_t v5 = v25 + 1;
      uint64_t v6 = v32 + 8;
      if (v5 == v30) {
        return;
      }
      goto LABEL_5;
    }
    uint64_t v28 = sub_258EA8A80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))((char *)&v29 - ((unint64_t)(v13 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v28);
LABEL_15:
    __break(1u);
LABEL_16:
    v42(v13, 1, 1, v4);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
}

char *sub_258E954AC(char *result, char *a2, char *a3, uint64_t *a4, SEL *a5)
{
  uint64_t v26 = result;
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    uint64_t v28 = *a4;
    uint64_t v7 = *a4 + 8 * (void)a3 - 8;
LABEL_6:
    uint64_t v9 = *(void **)(v28 + 8 * (void)v6);
    uint64_t v30 = v26;
    uint64_t v27 = v7;
    uint64_t v29 = v6;
    while (1)
    {
      id v10 = *(void **)v7;
      id v11 = v9;
      id v12 = v10;
      double result = (char *)[v11 *a5];
      if (!result) {
        break;
      }
      uint64_t v13 = result;
      uint64_t v14 = sub_258EA8C50();
      uint64_t v16 = v15;

      double result = (char *)[v12 *a5];
      if (!result) {
        goto LABEL_18;
      }
      uint64_t v17 = result;
      uint64_t v18 = a5;
      uint64_t v19 = sub_258EA8C50();
      uint64_t v21 = v20;

      if (v14 == v19 && v16 == v21)
      {

        double result = (char *)swift_bridgeObjectRelease_n();
        a5 = v18;
        uint64_t v8 = v29;
LABEL_5:
        uint64_t v6 = v8 + 1;
        uint64_t v7 = v27 + 8;
        if (v6 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      char v23 = sub_258EA91E0();

      swift_bridgeObjectRelease();
      double result = (char *)swift_bridgeObjectRelease();
      a5 = v18;
      uint64_t v8 = v29;
      if (v23)
      {
        if (!v28) {
          goto LABEL_19;
        }
        uint64_t v24 = *(void **)v7;
        uint64_t v9 = *(void **)(v7 + 8);
        *(void *)uint64_t v7 = v9;
        *(void *)(v7 + 8) = v24;
        v7 -= 8;
        if (v29 != ++v30) {
          continue;
        }
      }
      goto LABEL_5;
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
  return result;
}

uint64_t sub_258E9565C(id *__src, id *a2, id *a3, char **__dst)
{
  uint64_t v5 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 3;
  id v60 = a3;
  uint64_t v11 = (char *)a3 - (char *)a2;
  uint64_t v12 = (char *)a3 - (char *)a2 + 7;
  if ((char *)a3 - (char *)a2 >= 0) {
    uint64_t v12 = (char *)a3 - (char *)a2;
  }
  uint64_t v13 = v12 >> 3;
  unint64_t v75 = __src;
  unint64_t v74 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != (char **)a2 || &a2[v13] <= (id *)__dst) {
        memmove(__dst, a2, 8 * v13);
      }
      uint64_t v31 = &v5[v13];
      int64_t v73 = v31;
      unint64_t v75 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v68 = (char *)(v60 - 1);
        uint64_t v32 = v6;
        uint64_t v70 = v7;
        char v71 = v5;
        do
        {
          char v72 = v6;
          char v67 = (char *)v31;
          uint64_t v33 = *(v31 - 1);
          uint64_t v34 = *(v32 - 1);
          uint64_t v57 = v31 - 1;
          unint64_t v58 = v32 - 1;
          id v69 = v33;
          id v66 = v34;
          id v35 = objc_msgSend(v66, sel_startDate);
          uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
          uint64_t v65 = &v56;
          uint64_t v14 = *(char **)(*(void *)(v36 - 8) + 64);
          MEMORY[0x270FA5388](v36 - 8);
          uint64_t v18 = (char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v35) {
            goto LABEL_55;
          }
          uint64_t v4 = (void *)sub_258EA8A80();
          id v37 = (void *)*(v4 - 1);
          uint64_t v38 = v37[8];
          MEMORY[0x270FA5388](v4);
          sub_258EA8A40();

          uint64_t v63 = (char *)v37[4];
          ((void (*)(char *, char *, void *))v63)((char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v56 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
          uint64_t v39 = (void (*)(char *, void, uint64_t, void *))v37[7];
          v39((char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v4);
          id v40 = (uint64_t *)v37[6];
          id v61 = (char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0);
          int v62 = v40;
          if (((unsigned int (*)(char *, uint64_t, void *))v40)(v61, 1, v4) == 1) {
            goto LABEL_56;
          }
          uint64_t v64 = (unsigned int (*)(char *, uint64_t, char *))v39;
          id v41 = objc_msgSend(v69, sel_startDate);
          id v60 = (id *)&v56;
          uint64_t v42 = MEMORY[0x270FA5388](v41);
          uint64_t v14 = (char *)&v56 - ((unint64_t)(v14 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v42) {
            goto LABEL_57;
          }
          id v59 = (char **)&v56;
          MEMORY[0x270FA5388](v42);
          sub_258EA8A40();

          ((void (*)(char *, char *, void *))v63)(v14, (char *)&v56 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
          ((void (*)(char *, void, uint64_t, void *))v64)(v14, 0, 1, v4);
          if (((unsigned int (*)(char *, uint64_t, void *))v62)(v14, 1, v4) == 1) {
            goto LABEL_58;
          }
          id v43 = v68;
          id v44 = v68 + 8;
          uint64_t v45 = v61;
          char v46 = sub_258EA8A10();
          uint64_t v47 = (void (*)(char *, void *))v37[1];
          v47(v14, v4);
          v47(v45, v4);

          if (v46)
          {
            double v48 = v71;
            int v49 = v70;
            uint64_t v31 = (char **)v67;
            uint64_t v32 = v58;
            if (v44 != (char *)v72 || v43 >= (char *)v72) {
              *(void *)id v43 = *v58;
            }
            unint64_t v75 = v32;
            if (v32 <= v49) {
              break;
            }
          }
          else
          {
            uint64_t v50 = v57;
            int64_t v73 = v57;
            uint64_t v51 = v70;
            double v48 = v71;
            int64_t v52 = v72;
            if (v44 < v67 || v43 >= v67 || v44 != v67) {
              *(void *)id v43 = *v57;
            }
            uint64_t v32 = v52;
            uint64_t v31 = v50;
            if (v32 <= v51) {
              break;
            }
          }
          v68 -= 8;
          uint64_t v6 = v32;
        }
        while (v31 > v48);
      }
LABEL_50:
      sub_258E965C4((void **)&v75, (const void **)&v74, &v73);
      return 1;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != (char **)__src || &__src[v10] <= (id *)__dst) {
      memmove(__dst, __src, 8 * v10);
    }
    id v59 = &v5[v10];
    int64_t v73 = v59;
    if (v6 < v60 && v8 >= 8)
    {
      while (1)
      {
        uint64_t v70 = v7;
        char v71 = v5;
        char v72 = v6;
        uint64_t v14 = *v5;
        id v69 = *v6;
        uint64_t v68 = v14;
        id v15 = objc_msgSend(v68, sel_startDate);
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
        char v67 = (char *)&v56;
        uint64_t v17 = *(char **)(*(void *)(v16 - 8) + 64);
        MEMORY[0x270FA5388](v16 - 8);
        uint64_t v18 = (char *)&v56 - ((unint64_t)(v17 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (!v15) {
          break;
        }
        uint64_t v14 = (char *)sub_258EA8A80();
        uint64_t v4 = (void *)*((void *)v14 - 1);
        uint64_t v19 = v4[8];
        MEMORY[0x270FA5388](v14);
        sub_258EA8A40();

        uint64_t v65 = (uint64_t *)v4[4];
        ((void (*)(char *, char *, char *))v65)((char *)&v56 - ((unint64_t)(v17 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
        uint64_t v18 = (char *)(v4 + 7);
        uint64_t v20 = (void (*)(char *, void, uint64_t, char *))v4[7];
        v20((char *)&v56 - ((unint64_t)(v17 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v14);
        uint64_t v21 = (void (*)(char *, void, uint64_t, void *))v4[6];
        uint64_t v63 = (char *)&v56 - ((unint64_t)(v17 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v64 = (unsigned int (*)(char *, uint64_t, char *))v21;
        if (((unsigned int (*)(char *, uint64_t, char *))v21)(v63, 1, v14) == 1) {
          goto LABEL_52;
        }
        id v66 = v20;
        id v22 = objc_msgSend(v69, sel_startDate);
        int v62 = &v56;
        uint64_t v23 = MEMORY[0x270FA5388](v22);
        uint64_t v17 = (char *)&v56 - ((unint64_t)(v17 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (!v23) {
          goto LABEL_53;
        }
        id v61 = (char *)&v56;
        MEMORY[0x270FA5388](v23);
        sub_258EA8A40();

        ((void (*)(char *, char *, char *))v65)(v17, (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
        ((void (*)(char *, void, uint64_t, char *))v66)(v17, 0, 1, v14);
        if (v64(v17, 1, v14) == 1) {
          goto LABEL_54;
        }
        uint64_t v24 = v63;
        char v25 = sub_258EA8A10();
        uint64_t v26 = (void (*)(char *, char *))v4[1];
        ++v4;
        v26(v17, v14);
        v26(v24, v14);

        if (v25)
        {
          uint64_t v5 = v71;
          uint64_t v27 = v72 + 1;
          uint64_t v28 = v70;
          if (v70 < v72 || v70 >= v27 || v70 != v72) {
            *uint64_t v70 = *v72;
          }
        }
        else
        {
          uint64_t v28 = v70;
          uint64_t v29 = v71;
          uint64_t v30 = v72;
          if (v70 != (id *)v71) {
            *uint64_t v70 = *v71;
          }
          uint64_t v5 = v29 + 1;
          unint64_t v74 = v5;
          uint64_t v27 = v30;
        }
        uint64_t v7 = v28 + 1;
        unint64_t v75 = v7;
        if (v5 < v59)
        {
          uint64_t v6 = v27;
          if (v27 < v60) {
            continue;
          }
        }
        goto LABEL_50;
      }
      uint64_t v54 = sub_258EA8A80();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))((char *)&v56 - ((unint64_t)(v17 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v54);
LABEL_52:
      __break(1u);
LABEL_53:
      ((void (*)(char *, uint64_t, uint64_t, char *))v66)(v17, 1, 1, v14);
LABEL_54:
      __break(1u);
LABEL_55:
      uint64_t v55 = sub_258EA8A80();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v18, 1, 1, v55);
LABEL_56:
      __break(1u);
LABEL_57:
      ((void (*)(char *, uint64_t, uint64_t, void *))v64)(v14, 1, 1, v4);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    goto LABEL_50;
  }
LABEL_59:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E95FC8(id *__src, id *a2, id *a3, void **__dst, SEL *a5)
{
  uint64_t v6 = a3;
  uint64_t v7 = a2;
  int64_t v8 = __src;
  int64_t v9 = (char *)a2 - (char *)__src;
  int64_t v10 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v10 = (char *)a2 - (char *)__src;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v12 = (char *)a3 - (char *)a2;
  uint64_t v13 = (char *)a3 - (char *)a2 + 7;
  if ((char *)a3 - (char *)a2 >= 0) {
    uint64_t v13 = (char *)a3 - (char *)a2;
  }
  uint64_t v14 = v13 >> 3;
  uint64_t v70 = __src;
  id v69 = __dst;
  if (v11 < v13 >> 3)
  {
    if (v9 < -7) {
      goto LABEL_61;
    }
    if (__dst != __src || &__src[v11] <= __dst) {
      memmove(__dst, __src, 8 * v11);
    }
    int v62 = &__dst[v11];
    uint64_t v68 = (char *)v62;
    id v15 = a5;
    if (v7 < v6 && v9 >= 8)
    {
      uint64_t v16 = __dst;
      id v66 = v6;
      while (1)
      {
        uint64_t v64 = v8;
        uint64_t v17 = v7;
        uint64_t v18 = *v16;
        id v19 = *v7;
        id v20 = v18;
        id v21 = [v19 *v15];
        if (!v21) {
          goto LABEL_59;
        }
        id v22 = v21;
        uint64_t v23 = sub_258EA8C50();
        uint64_t v25 = v24;

        id v26 = [v20 *v15];
        if (!v26) {
          goto LABEL_60;
        }
        uint64_t v27 = v26;
        uint64_t v28 = sub_258EA8C50();
        uint64_t v30 = v29;

        if (v23 == v28 && v25 == v30) {
          break;
        }
        char v32 = sub_258EA91E0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v32 & 1) == 0) {
          goto LABEL_25;
        }
        uint64_t v33 = v17 + 1;
        uint64_t v34 = v64;
        id v35 = v66;
        id v15 = a5;
        if (v64 < v17 || v64 >= v33 || v64 != v17) {
          *uint64_t v64 = *v17;
        }
LABEL_28:
        int64_t v8 = v34 + 1;
        if (v16 < v62)
        {
          uint64_t v7 = v33;
          if (v33 < v35) {
            continue;
          }
        }
        uint64_t v70 = v8;
        goto LABEL_56;
      }

      swift_bridgeObjectRelease_n();
LABEL_25:
      uint64_t v34 = v64;
      id v35 = v66;
      id v15 = a5;
      if (v64 != v16) {
        *uint64_t v64 = *v16;
      }
      id v69 = ++v16;
      uint64_t v33 = v17;
      goto LABEL_28;
    }
LABEL_56:
    sub_258E965C4((void **)&v70, (const void **)&v69, &v68);
    return 1;
  }
  if (v12 < -7) {
    goto LABEL_61;
  }
  uint64_t v36 = a5;
  if (__dst != a2 || &a2[v14] <= __dst) {
    memmove(__dst, a2, 8 * v14);
  }
  id v59 = (char *)__dst;
  id v37 = (char *)&__dst[v14];
  uint64_t v68 = v37;
  uint64_t v70 = v7;
  if (v8 >= v7 || v12 < 8) {
    goto LABEL_56;
  }
  uint64_t v38 = v7;
  uint64_t v65 = v8;
  while (1)
  {
    id v61 = v37;
    uint64_t v63 = v7;
    char v67 = v6;
    id v40 = (void *)*((void *)v37 - 1);
    v37 -= 8;
    uint64_t v39 = v40;
    id v41 = *--v38;
    id v42 = v39;
    id v43 = v41;
    id v44 = [v42 *v36];
    if (!v44) {
      break;
    }
    uint64_t v45 = v44;
    uint64_t v46 = sub_258EA8C50();
    uint64_t v48 = v47;

    id v49 = [v43 *v36];
    if (!v49) {
      goto LABEL_58;
    }
    uint64_t v50 = v49;
    uint64_t v51 = sub_258EA8C50();
    uint64_t v53 = v52;

    if (v46 == v51 && v48 == v53)
    {

      swift_bridgeObjectRelease_n();
      uint64_t v56 = v67;
      uint64_t v6 = v67 - 1;
LABEL_50:
      uint64_t v36 = a5;
      uint64_t v38 = v63;
      unint64_t v57 = (unint64_t)v65;
      uint64_t v68 = v37;
      if (v56 < (id *)v61 || v6 >= (id *)v61 || v56 != (id *)v61) {
        *uint64_t v6 = *(id *)v37;
      }
      goto LABEL_54;
    }
    char v55 = sub_258EA91E0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v56 = v67;
    uint64_t v6 = v67 - 1;
    if ((v55 & 1) == 0) {
      goto LABEL_50;
    }
    unint64_t v57 = (unint64_t)v65;
    uint64_t v36 = a5;
    id v37 = v61;
    if (v67 != v63 || v6 >= v63) {
      *uint64_t v6 = *v38;
    }
    uint64_t v70 = v38;
LABEL_54:
    if ((unint64_t)v38 > v57)
    {
      uint64_t v7 = v38;
      if (v37 > v59) {
        continue;
      }
    }
    goto LABEL_56;
  }
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

char *sub_258E9640C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0450);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_258E96508(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_258EA91A0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_258E965C4(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_258EA91A0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_258E96680(uint64_t a1)
{
  return sub_258E9640C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_258E96694(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_258EA9150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_258EA9150();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x25A2D2DA0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_258E96C40(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_258EA9150();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_258EA8D60();
}

uint64_t sub_258E96860(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_258E97548();
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  unint64_t v12 = v9;
  BOOL v13 = (void *)*a5;
  unint64_t v15 = sub_258E78DD0(v7, v8);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  char v19 = v14;
  if (v13[3] >= v18)
  {
    if (a4)
    {
      id v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_258E7C88C();
      id v22 = (void *)*a5;
      if (v19) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    uint64_t v25 = (uint64_t *)(v22[6] + 16 * v15);
    *uint64_t v25 = v10;
    v25[1] = v11;
    *(void *)(v22[7] + 8 * v15) = v12;
    uint64_t v26 = v22[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v22[2] = v28;
LABEL_13:
    uint64_t v29 = sub_258E97548();
    if (v30)
    {
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      unint64_t v34 = v31;
      do
      {
        uint64_t v39 = (void *)*a5;
        unint64_t v40 = sub_258E78DD0(v32, v33);
        uint64_t v42 = v39[2];
        BOOL v43 = (v41 & 1) == 0;
        BOOL v27 = __OFADD__(v42, v43);
        uint64_t v44 = v42 + v43;
        if (v27) {
          goto LABEL_24;
        }
        char v45 = v41;
        if (v39[3] < v44)
        {
          sub_258E7A180(v44, 1);
          unint64_t v40 = sub_258E78DD0(v32, v33);
          if ((v45 & 1) != (v46 & 1)) {
            goto LABEL_26;
          }
        }
        uint64_t v47 = (void *)*a5;
        if (v45)
        {
          uint64_t v35 = 8 * v40;
          uint64_t v53 = *(void *)(v47[7] + 8 * v40);
          swift_bridgeObjectRetain();
          sub_258E96694(v34);
          swift_bridgeObjectRelease();
          uint64_t v36 = v47[7];
          swift_bridgeObjectRelease();
          *(void *)(v36 + v35) = v53;
        }
        else
        {
          v47[(v40 >> 6) + 8] |= 1 << v40;
          uint64_t v48 = (uint64_t *)(v47[6] + 16 * v40);
          uint64_t *v48 = v32;
          v48[1] = v33;
          *(void *)(v47[7] + 8 * v40) = v34;
          uint64_t v49 = v47[2];
          BOOL v27 = __OFADD__(v49, 1);
          uint64_t v50 = v49 + 1;
          if (v27) {
            goto LABEL_25;
          }
          v47[2] = v50;
        }
        uint64_t v32 = sub_258E97548();
        uint64_t v33 = v37;
        unint64_t v34 = v38;
      }
      while (v37);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_258E7E4E8();
    return swift_release();
  }
  sub_258E7A180(v18, a4 & 1);
  unint64_t v20 = sub_258E78DD0(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    id v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v23 = 8 * v15;
    uint64_t v52 = *(void *)(v22[7] + v23);
    swift_bridgeObjectRetain();
    sub_258E96694(v12);
    swift_bridgeObjectRelease();
    uint64_t v24 = v22[7];
    swift_bridgeObjectRelease();
    *(void *)(v24 + v23) = v52;
    goto LABEL_13;
  }
LABEL_26:
  uint64_t result = sub_258EA9220();
  __break(1u);
  return result;
}

uint64_t sub_258E96B88(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_258E96BC0(uint64_t a1)
{
  return a1;
}

uint64_t sub_258E96BF0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_258E96C28(unint64_t a1)
{
  return sub_258E8A668(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_258E96C30(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_258E96C40(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_258E98014(&qword_26A0D0448, &qword_26A0D0440);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0440);
          unint64_t v12 = sub_258E9F8E4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_258E7451C(0, &qword_26A0D05C0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E96E60(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_258E98014(&qword_26A0D0488, &qword_26A0D0480);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0480);
          unint64_t v12 = sub_258E9F8E4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_258E7451C(0, &qword_26A0D0478);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E97080(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_258E98014(&qword_26A0D0470, &qword_26A0D0468);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0468);
          unint64_t v12 = sub_258E9F950(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_258E7451C(0, &qword_26A0D0460);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E972A0(void *a1)
{
  return sub_258E82BA0(0, a1[2], 0, a1);
}

void sub_258E972B4()
{
}

void sub_258E972C8()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  void v21[2];

  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  if ((*v0 & 0x8000000000000000) != 0)
  {
    if (sub_258EA9120())
    {
      BOOL v13 = v12;
      sub_258E7451C(0, &qword_26A0D0318);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v7 = (void *)v21[0];
      swift_unknownObjectRelease();
      unint64_t v20 = v13;
      sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v8 = (void *)v21[0];
      swift_unknownObjectRelease();
      if (v21[0]) {
        goto LABEL_6;
      }
    }
    return;
  }
  int64_t v4 = v0[3];
  unint64_t v3 = v1[4];
  if (v3)
  {
    uint64_t v5 = (v3 - 1) & v3;
    unint64_t v6 = __clz(__rbit64(v3)) | (v4 << 6);
LABEL_4:
    uint64_t v7 = *(void **)(*(void *)(v2 + 48) + 8 * v6);
    uint64_t v8 = *(void **)(*(void *)(v2 + 56) + 8 * v6);
    id v9 = v7;
    id v10 = v8;
    goto LABEL_5;
  }
  id v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  unint64_t v15 = (unint64_t)(v1[2] + 64) >> 6;
  if (v14 >= v15)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  uint64_t v16 = v1[1];
  BOOL v17 = *(void *)(v16 + 8 * v14);
  if (v17)
  {
LABEL_13:
    uint64_t v5 = (v17 - 1) & v17;
    unint64_t v6 = __clz(__rbit64(v17)) + (v14 << 6);
    int64_t v4 = v14;
    goto LABEL_4;
  }
  uint64_t v18 = v4 + 2;
  if (v4 + 2 >= v15) {
    goto LABEL_29;
  }
  BOOL v17 = *(void *)(v16 + 8 * v18);
  if (v17)
  {
LABEL_17:
    id v14 = v18;
    goto LABEL_13;
  }
  if (v4 + 3 >= v15) {
    goto LABEL_30;
  }
  BOOL v17 = *(void *)(v16 + 8 * (v4 + 3));
  if (v17)
  {
    id v14 = v4 + 3;
    goto LABEL_13;
  }
  uint64_t v18 = v4 + 4;
  if (v4 + 4 < v15)
  {
    BOOL v17 = *(void *)(v16 + 8 * v18);
    if (v17) {
      goto LABEL_17;
    }
    id v14 = v4 + 5;
    if (v4 + 5 < v15)
    {
      BOOL v17 = *(void *)(v16 + 8 * v14);
      if (v17) {
        goto LABEL_13;
      }
      id v14 = v15 - 1;
      char v19 = v4 + 6;
      while (v15 != v19)
      {
        BOOL v17 = *(void *)(v16 + 8 * v19++);
        if (v17)
        {
          id v14 = v19 - 1;
          goto LABEL_13;
        }
      }
LABEL_29:
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v5 = 0;
      int64_t v4 = v14;
      goto LABEL_5;
    }
LABEL_30:
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v5 = 0;
    int64_t v4 = v18;
    goto LABEL_5;
  }
  uint64_t v8 = 0;
  uint64_t v7 = 0;
  uint64_t v5 = 0;
  v4 += 3;
LABEL_5:
  v1[3] = v4;
  v1[4] = v5;
  if (v7)
  {
LABEL_6:
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v1[5];
    v21[0] = v7;
    v21[1] = v8;
    v11(&v20, v21);
  }
}

uint64_t sub_258E97548()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v19;
  }
  BOOL v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    id v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      unint64_t v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      BOOL v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          BOOL v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            BOOL v13 = v3 + 3;
            goto LABEL_7;
          }
          BOOL v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            BOOL v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v14 != v18)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  BOOL v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_258E976E0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_258E97728(unint64_t a1, uint64_t (*a2)(void))
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
    if (!v3) {
      return v4;
    }
    uint64_t v13 = MEMORY[0x263F8EE78];
    uint64_t result = sub_258E82B40(0, v3 & ~(v3 >> 63), 0);
    if (v3 < 0) {
      break;
    }
    uint64_t v6 = 0;
    uint64_t v4 = v13;
    while (v3 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x25A2D2D90](v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      uint64_t v9 = a2();

      unint64_t v11 = *(void *)(v13 + 16);
      unint64_t v10 = *(void *)(v13 + 24);
      if (v11 >= v10 >> 1) {
        sub_258E82B40(v10 > 1, v11 + 1, 1);
      }
      ++v6;
      *(void *)(v13 + 16) = v11 + 1;
      *(void *)(v13 + 8 * v11 + 32) = v9;
      if (v3 == v6) {
        return v4;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_258EA9150();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_258E97890(uint64_t a1, void (*a2)(uint64_t, uint64_t, double))
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_258EA90B0();
    uint64_t result = sub_258E7DEAC(a1);
    uint64_t v5 = result;
    int v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = a1 + 64;
    while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
    {
      unint64_t v11 = (unint64_t)v5 >> 6;
      if ((*(void *)(v9 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v7) {
        goto LABEL_23;
      }
      uint64_t v22 = v8;
      unint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v5);
      uint64_t v13 = *v12;
      uint64_t v14 = v12[1];
      double v15 = *(double *)(*(void *)(a1 + 56) + 8 * v5);
      swift_bridgeObjectRetain();
      a2(v13, v14, v15);
      swift_bridgeObjectRelease();
      sub_258EA9090();
      sub_258EA90C0();
      sub_258EA90D0();
      uint64_t result = sub_258EA90A0();
      int64_t v10 = 1 << *(unsigned char *)(a1 + 32);
      if (v5 >= v10) {
        goto LABEL_24;
      }
      uint64_t v16 = *(void *)(v9 + 8 * v11);
      if ((v16 & (1 << v5)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(a1 + 36) != v7) {
        goto LABEL_26;
      }
      unint64_t v17 = v16 & (-2 << (v5 & 0x3F));
      if (v17)
      {
        int64_t v10 = __clz(__rbit64(v17)) | v5 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v18 = v11 + 1;
        unint64_t v19 = (unint64_t)(v10 + 63) >> 6;
        if (v11 + 1 < v19)
        {
          unint64_t v20 = *(void *)(v9 + 8 * v18);
          if (v20)
          {
LABEL_18:
            int64_t v10 = __clz(__rbit64(v20)) + (v18 << 6);
          }
          else
          {
            while (v19 - 2 != v11)
            {
              unint64_t v20 = *(void *)(a1 + 80 + 8 * v11++);
              if (v20)
              {
                unint64_t v18 = v11 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v8 = v22 + 1;
      uint64_t v5 = v10;
      if (v22 + 1 == v3) {
        return v23;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

void *sub_258E97AAC(unint64_t a1, uint64_t (*a2)(id))
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_258EA9150())
  {
    unint64_t v17 = v2 & 0xC000000000000001;
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
    uint64_t v5 = 4;
    unint64_t v16 = v2;
    while (1)
    {
      id v7 = v17 ? (id)MEMORY[0x25A2D2D90](v5 - 4, v2) : *(id *)(v2 + 8 * v5);
      uint64_t v8 = v7;
      uint64_t v9 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      uint64_t v10 = a2(v7);
      uint64_t v12 = v11;

      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v4 = sub_258E9C9D8(0, v4[2] + 1, 1, v4);
        }
        unint64_t v14 = v4[2];
        unint64_t v13 = v4[3];
        if (v14 >= v13 >> 1) {
          uint64_t v4 = sub_258E9C9D8((void *)(v13 > 1), v14 + 1, 1, v4);
        }
        v4[2] = v14 + 1;
        int v6 = &v4[2 * v14];
        v6[4] = v10;
        v6[5] = v12;
        unint64_t v2 = v16;
      }
      ++v5;
      if (v9 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
  uint64_t v4 = (void *)MEMORY[0x263F8EE78];
LABEL_18:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_258E97C3C(unint64_t a1, uint64_t (*a2)(void *))
{
  unint64_t v2 = a1;
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v12)
  {
    while (1)
    {
      unint64_t v11 = v2;
      unint64_t v3 = 0;
      unint64_t v4 = v2 & 0xC000000000000001;
      uint64_t v5 = v2 & 0xFFFFFFFFFFFFFF8;
      uint64_t v6 = v12;
      while (v4)
      {
        id v7 = (id)MEMORY[0x25A2D2D90](v3, v2);
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_17;
        }
        if (objc_msgSend(v7, sel_mechanism) == (id)13 && (a2(v8) & 1) != 0)
        {
          sub_258EA9090();
          sub_258EA90C0();
          unint64_t v2 = v11;
          uint64_t v6 = v12;
          sub_258EA90D0();
          sub_258EA90A0();
        }
        else
        {
        }
        ++v3;
        if (v9 == v6) {
          return v14;
        }
      }
      if (v3 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v12 = sub_258EA9150();
      if (!v12) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v2 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_258E97DC8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v26 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_26;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      unint64_t v21 = v3;
      unint64_t v5 = 0;
      uint64_t v24 = v3 & 0xFFFFFFFFFFFFFF8;
      unint64_t v25 = v3 & 0xC000000000000001;
      uint64_t v6 = off_26543F000;
      while (v25)
      {
        id v7 = (id)MEMORY[0x25A2D2D90](v5, v3);
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_25;
        }
        id v10 = [v7 (SEL)v6[197]];
        if (v10)
        {

          id v11 = [v8 (SEL)v6[197]];
        }
        else
        {
          id v12 = objc_msgSend(v8, sel_derivedIntentIdentifier);
          if (!v12) {
            goto LABEL_4;
          }

          id v11 = objc_msgSend(v8, sel_derivedIntentIdentifier);
        }
        id v13 = v11;
        if (v13)
        {
          uint64_t v14 = v4;
          double v15 = v6;
          uint64_t v16 = sub_258EA8C50();
          uint64_t v18 = v17;

          if (v16 == a2 && v18 == a3)
          {
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
          char v19 = sub_258EA91E0();
          swift_bridgeObjectRelease();
          if (v19)
          {
LABEL_19:
            sub_258EA9090();
            sub_258EA90C0();
            sub_258EA90D0();
            sub_258EA90A0();
          }
          else
          {
          }
          uint64_t v6 = v15;
          uint64_t v4 = v14;
          unint64_t v3 = v21;
          goto LABEL_5;
        }
LABEL_4:

LABEL_5:
        ++v5;
        if (v9 == v4) {
          return v26;
        }
      }
      if (v5 < *(void *)(v24 + 16)) {
        break;
      }
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      uint64_t v4 = sub_258EA9150();
      if (!v4) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v3 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_258E97FF4(id *a1)
{
  return sub_258EA4BAC(a1, *(void *)(v1 + 16), *(uint64_t **)(v1 + 24)) & 1;
}

uint64_t sub_258E98014(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_258E98064()
{
  unint64_t result = qword_26A0D0498;
  if (!qword_26A0D0498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A0D0490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0498);
  }
  return result;
}

void sub_258E980B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  switch(a9 >> 61)
  {
    case 0uLL:
      sub_258E96C30((uint64_t)a3);
      id v9 = a5;
      break;
    case 1uLL:
      id v10 = a3;
      break;
    case 2uLL:
    case 4uLL:
      swift_retain();
      swift_retain();
      break;
    case 3uLL:
      sub_258E96C30((uint64_t)a3);
      swift_bridgeObjectRetain();
      break;
    default:
      return;
  }
}

uint64_t sub_258E981D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  uint64_t v27 = a1;
  char v11 = a5 & 1;
  uint64_t v24 = a2 + 56;
  uint64_t v12 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(a2 + 56);
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v16 = 0;
  if (!v14) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v17 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v23 = v22[1];
    v26[0] = *v22;
    v26[1] = v23;
    swift_bridgeObjectRetain();
    sub_258E90524((uint64_t)&v27, v26, a3, a4, v11, a6);
    if (v6)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v16++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v16 >= v25) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v16);
    if (!v20) {
      break;
    }
LABEL_17:
    unint64_t v14 = (v20 - 1) & v20;
  }
  int64_t v21 = v16 + 1;
  if (v16 + 1 >= v25) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v21 = v16 + 2;
  if (v16 + 2 >= v25) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v21 = v16 + 3;
  if (v16 + 3 >= v25) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v21 = v16 + 4;
  if (v16 + 4 >= v25)
  {
LABEL_26:
    swift_release();
    return v27;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
LABEL_16:
    int64_t v16 = v21;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v25) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_17;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_258E983E8(uint64_t a1, uint64_t a2)
{
  return sub_258E90AD8(a1, a2, *(unsigned int *)(v2 + 16));
}

uint64_t sub_258E983F0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_258E98440()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 46));
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 432, 7);
}

void sub_258E98530(void *a1)
{
  sub_258E90E7C(a1, *(void *)(v1 + 16), v1 + 24, *(void *)(v1 + 424));
}

uint64_t sub_258E98540()
{
  uint64_t v1 = sub_258EA8A80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

BOOL sub_258E985D0(void *a1)
{
  sub_258EA8A80();
  if (!a1) {
    return 0;
  }
  objc_msgSend(a1, sel_timestamp);
  double v3 = v2;
  sub_258EA8990();
  return v3 < v4;
}

uint64_t sub_258E98660()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_258E98670()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_258E9869C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_258EA8A80();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ModelMonitoringManager.init(config:executionManager:)@<X0>(void *__src@<X0>, long long *a2@<X1>, void *a3@<X8>)
{
  memcpy(a3, __src, 0x158uLL);
  return sub_258E7D394(a2, (uint64_t)a3 + 344);
}

Swift::OpaquePointer_optional __swiftcall ModelMonitoringManager.attemptModelMonitoring()()
{
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_258EA8BB0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A0D0790);
  uint64_t v1 = sub_258EA8B90();
  os_log_type_t v2 = sub_258EA8E80();
  if (os_log_type_enabled(v1, v2))
  {
    double v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v3 = 0;
    _os_log_impl(&dword_258E57000, v1, v2, "Starting model monitoring - feature-label correlation", v3, 2u);
    MEMORY[0x25A2D36B0](v3, -1, -1);
  }

  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0320);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_258EA8950();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  id v9 = (void *)sub_258EA8C30();
  id v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    id v10 = (void *)sub_258EA8910();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F51618]), sel_init_url_useSqlite_, v9, v10, 0);

  uint64_t v12 = self;
  uint64_t v13 = (void *)sub_258EA8D30();
  unint64_t v14 = (void *)sub_258EA8C30();
  id v15 = objc_msgSend(v12, sel_analyzeFeatureImportanceWithFeatureStore_featureNames_labelName_, v11, v13, v14);

  if (v15)
  {
    sub_258E98A38();
    uint64_t v16 = sub_258EA8BF0();

    id v15 = (id)sub_258E98A78(v16);
    swift_bridgeObjectRelease();
  }

  uint64_t v18 = v15;
  result.value._rawValue = v18;
  result.is_nil = v17;
  return result;
}

unint64_t sub_258E98A38()
{
  unint64_t result = qword_26A0D0218;
  if (!qword_26A0D0218)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A0D0218);
  }
  return result;
}

uint64_t sub_258E98A78(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D02D8);
  uint64_t result = sub_258EA9170();
  int64_t v3 = 0;
  uint64_t v33 = (void *)result;
  uint64_t v34 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v5 = a1 + 64;
  uint64_t v4 = v6;
  uint64_t v7 = 1 << *(unsigned char *)(v5 - 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & v4;
  uint64_t v30 = v5;
  int64_t v31 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v32 = result + 64;
  if ((v8 & v4) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  int64_t v35 = v3;
  for (unint64_t i = v10 | (v3 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    uint64_t v16 = (uint64_t *)(*(void *)(v34 + 48) + 16 * i);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v19 = *(void **)(*(void *)(v34 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    id v20 = v19;
    id v21 = objc_msgSend(v20, sel_stringValue);
    uint64_t v22 = sub_258EA8C50();
    uint64_t v24 = v23;

    uint64_t result = (uint64_t)v33;
    *(void *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    int64_t v25 = (void *)(v33[6] + 16 * i);
    *int64_t v25 = v17;
    v25[1] = v18;
    uint64_t v26 = (uint64_t *)(v33[7] + 16 * i);
    *uint64_t v26 = v22;
    v26[1] = v24;
    uint64_t v27 = v33[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    _OWORD v33[2] = v29;
    int64_t v3 = v35;
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v31) {
      return result;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v12);
    int64_t v14 = v3 + 1;
    if (!v13)
    {
      int64_t v14 = v3 + 2;
      if (v3 + 2 >= v31) {
        return result;
      }
      unint64_t v13 = *(void *)(v30 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v3 + 3;
        if (v3 + 3 >= v31) {
          return result;
        }
        unint64_t v13 = *(void *)(v30 + 8 * v14);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v9 = (v13 - 1) & v13;
    int64_t v35 = v14;
  }
  uint64_t v15 = v3 + 4;
  if (v3 + 4 >= v31) {
    return result;
  }
  unint64_t v13 = *(void *)(v30 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v3 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v31) {
      return result;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for ModelMonitoringManager()
{
  return &type metadata for ModelMonitoringManager;
}

uint64_t sub_258E98CC4(uint64_t a1)
{
  uint64_t result = sub_258EA8E20();
  unint64_t v3 = 0;
  uint64_t v12 = result;
  while (1)
  {
LABEL_6:
    unint64_t v9 = *(void *)(a1 + 16);
    if (v3 == v9)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v12;
    }
    if (v3 >= v9) {
      break;
    }
    uint64_t v10 = *(void *)(a1 + 32 + 8 * v3);
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    ++v3;
    if (v10)
    {
      unint64_t v4 = *(void *)(v10 + 16);
      if (v4)
      {
        unint64_t v5 = 0;
        uint64_t v6 = (uint64_t *)(v10 + 40);
        while (v5 < v4)
        {
          ++v5;
          uint64_t v8 = *(v6 - 1);
          uint64_t v7 = *v6;
          swift_bridgeObjectRetain();
          sub_258E9DD28(&v11, v8, v7);
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v4 = *(void *)(v10 + 16);
          v6 += 2;
          if (v5 == v4) {
            goto LABEL_6;
          }
        }
        __break(1u);
        break;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_258E98DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_258EA9270();
    sub_258EA8C80();
    uint64_t v6 = sub_258EA9290();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_258EA91E0() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_258EA91E0() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

BOOL sub_258E98F18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_258E98F2C()
{
  return sub_258EA9290();
}

uint64_t sub_258E98F74()
{
  return sub_258EA9280();
}

uint64_t sub_258E98FA0()
{
  return sub_258EA9290();
}

PeopleSuggesterLighthouse::FeaturizationConfig __swiftcall FeaturizationConfig.init(identifier:)(PeopleSuggesterLighthouse::FeaturizationConfig identifier)
{
  *uint64_t v1 = identifier;
  return identifier;
}

uint64_t sub_258E98FEC()
{
  return sub_258EA9290();
}

uint64_t sub_258E99030()
{
  return sub_258EA9280();
}

uint64_t sub_258E99058()
{
  return sub_258EA9290();
}

uint64_t DataHarvestingManager.init(config:executionManager:readerName:)@<X0>(void *__src@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  memcpy(a5, __src, 0x158uLL);
  uint64_t result = sub_258E7D394(a2, (uint64_t)(a5 + 43));
  a5[48] = a3;
  a5[49] = a4;
  return result;
}

void sub_258E990FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(void *)(a3 + 16) = a2;
  swift_unknownObjectRelease();
  uint64_t v5 = qword_26A0D01F0;
  swift_unknownObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_258EA8BB0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A0D0790);
  uint64_t v7 = sub_258EA8B90();
  os_log_type_t v8 = sub_258EA8E80();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_258E57000, v7, v8, "Finished reading feedback stream", v9, 2u);
    MEMORY[0x25A2D36B0](v9, -1, -1);
  }
}

void sub_258E9920C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  v5(v6, a3);
  swift_release();
  swift_unknownObjectRelease();
}

void sub_258E99294(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(a1, sel_eventBody);
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_identifier);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = sub_258EA8C50();
      uint64_t v9 = v8;

      swift_beginAccess();
      id v10 = v4;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v16 = *(void *)(a2 + 16);
      *(void *)(a2 + 16) = 0x8000000000000000;
      sub_258E9D7FC((uint64_t)v10, v7, v9, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_258E7D178, (void (*)(void))sub_258E7B114);
      *(void *)(a2 + 16) = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();

      return;
    }
  }
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_258EA8BB0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26A0D0790);
  oslog = sub_258EA8B90();
  os_log_type_t v13 = sub_258EA8E90();
  if (os_log_type_enabled(oslog, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_258E57000, oslog, v13, "Invalid event in feedback stream", v14, 2u);
    MEMORY[0x25A2D36B0](v14, -1, -1);
  }
}

uint64_t DataHarvestingManager.harvest(appendingTrialIdentifier:appendingFeaturizationConfig:inTests:)(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v4 = v3;
  sub_258EA1008(a1, (uint64_t)v35, (uint64_t *)&unk_26A0D04C0);
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  sub_258EA8B50();
  swift_allocObject();
  sub_258EA8B40();
  id v9 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v10 = objc_msgSend(v9, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v31 = objc_msgSend(v10, sel_Feedback);
  swift_unknownObjectRelease();
  uint64_t v34 = 0;
  uint64_t v30 = sub_258E9FE70(v31, &v34);
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v13 = v11;
  *(void *)(v11 + 16) = MEMORY[0x263F8EE78];
  uint64_t v14 = (uint64_t *)(v11 + 16);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = 0;
  *(unsigned char *)(v15 + 24) = 1;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = MEMORY[0x263F8EE88];
  uint64_t v29 = v4;
  sub_258EA0100(v4, (uint64_t)__src);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  *(unsigned char *)(v17 + 24) = a3;
  *(void *)(v17 + 32) = v13;
  memcpy((void *)(v17 + 40), __src, 0x190uLL);
  sub_258EA1008((uint64_t)v35, v17 + 440, (uint64_t *)&unk_26A0D04C0);
  *(void *)(v17 + 488) = v8;
  *(void *)(v17 + 496) = v7;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v12;
  swift_retain();
  swift_retain();
  sub_258EA0260(v35);
  swift_bridgeObjectRetain();
  id v19 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v20 = objc_msgSend(v19, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v21 = objc_msgSend(v20, sel_VirtualFeatureStore);
  swift_unknownObjectRelease();
  id v22 = objc_msgSend(v21, sel_publisher);
  __src[4] = sub_258E9A4A4;
  __src[5] = 0;
  __src[0] = MEMORY[0x263EF8330];
  __src[1] = 1107296256;
  void __src[2] = sub_258E98CC0;
  __src[3] = &block_descriptor_2;
  uint64_t v23 = _Block_copy(__src);
  sub_258EA0100(v4, (uint64_t)__src);
  uint64_t v24 = (void *)swift_allocObject();
  memcpy(v24 + 2, __src, 0x190uLL);
  v24[52] = v18;
  v24[53] = v30;
  v24[54] = sub_258EA0244;
  v24[55] = v17;
  v24[56] = v15;
  aBlock[4] = sub_258EA03F8;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_258E9B9D0;
  aBlock[3] = &block_descriptor_18;
  int64_t v25 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  id v26 = objc_msgSend(v22, sel_sinkWithCompletion_shouldContinue_, v23, v25);

  swift_release();
  _Block_release(v25);
  _Block_release(v23);

  swift_beginAccess();
  uint64_t v27 = *v14;
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  sub_258E99944((uint64_t *)(v15 + 16), v29);
  swift_release();

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return v27;
}

void sub_258E99944(uint64_t *a1, uint64_t a2)
{
  swift_beginAccess();
  if ((a1[1] & 1) == 0)
  {
    uint64_t v4 = *a1;
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_258EA8BB0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A0D0790);
    id v6 = sub_258EA8B90();
    os_log_type_t v7 = sub_258EA8E70();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_258E57000, v6, v7, "Pruning events from Virtual Feature Store", v8, 2u);
      MEMORY[0x25A2D36B0](v8, -1, -1);
    }

    id v9 = objc_msgSend(*(id *)(a2 + 40), sel_pruner);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v4;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_258EA0DD4;
    *(void *)(v11 + 24) = v10;
    aBlock[4] = sub_258E98670;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_258E916F0;
    aBlock[3] = &block_descriptor_30;
    uint64_t v12 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_deleteEventsPassingTest_, v12);

    _Block_release(v12);
    LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v9)
    {
      __break(1u);
    }
    else
    {
      uint64_t v13 = sub_258EA8B90();
      os_log_type_t v14 = sub_258EA8E70();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v15 = 134217984;
        aBlock[0] = v4;
        sub_258EA8F40();
        _os_log_impl(&dword_258E57000, v13, v14, "Pruned all events older than %f from Virtual Feature Store", v15, 0xCu);
        MEMORY[0x25A2D36B0](v15, -1, -1);
      }
      swift_release();
    }
  }
}

void sub_258E99C24(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_258EA1008(a1, (uint64_t)v48, &qword_26A0D0538);
  if (v51)
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_258EA8BB0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A0D0790);
    uint64_t v15 = sub_258EA8B90();
    os_log_type_t v16 = sub_258EA8E90();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      sub_258EA106C();
      swift_allocError();
      v46[0] = _swift_stdlib_bridgeErrorToNSError();
      sub_258EA8F40();
      *uint64_t v18 = v46[0];
      _os_log_impl(&dword_258E57000, v15, v16, "Finalizing batch failed %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0530);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v18, -1, -1);
      MEMORY[0x25A2D36B0](v17, -1, -1);
    }
  }
  else
  {
    uint64_t v42 = a6;
    uint64_t v43 = a7;
    uint64_t v19 = v48[0];
    unint64_t v20 = v48[1];
    char v41 = v49;
    uint64_t v44 = a8;
    uint64_t v45 = v50;
    swift_beginAccess();
    uint64_t v21 = *(void *)(a2 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v22 = sub_258E98DE0(v19, v20, v21);
    swift_bridgeObjectRelease();
    if (v22)
    {
      if (qword_26A0D01F0 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_258EA8BB0();
      __swift_project_value_buffer(v23, (uint64_t)qword_26A0D0790);
      swift_bridgeObjectRetain_n();
      uint64_t v24 = sub_258EA8B90();
      os_log_type_t v25 = sub_258EA8EA0();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v40 = a4;
        id v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        v46[0] = v27;
        *(_DWORD *)id v26 = 136315138;
        swift_bridgeObjectRetain();
        v47[0] = sub_258E787E0(v19, v20, v46);
        sub_258EA8F40();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_258E57000, v24, v25, "VFS stream contains events with overlapping session ID %s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2D36B0](v27, -1, -1);
        BOOL v28 = v26;
        a4 = v40;
        MEMORY[0x25A2D36B0](v28, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    swift_beginAccess();
    sub_258E9DD28(v47, v19, v20);
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t v29 = v45;
    if (a3)
    {
      uint64_t v30 = *(void *)(v45 + 16);
      if (v30)
      {
        id v31 = (void **)(a4 + 16);
        swift_bridgeObjectRetain();
        uint64_t v32 = (void **)(v45 + 40);
        do
        {
          uint64_t v33 = *((unsigned __int8 *)v32 - 8);
          uint64_t v34 = *v32;
          swift_beginAccess();
          int64_t v35 = *v31;
          id v36 = v34;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *id v31 = v35;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            int64_t v35 = sub_258E9CD08(0, v35[2] + 1, 1, v35);
            *id v31 = v35;
          }
          unint64_t v39 = v35[2];
          unint64_t v38 = v35[3];
          if (v39 >= v38 >> 1)
          {
            int64_t v35 = sub_258E9CD08((void *)(v38 > 1), v39 + 1, 1, v35);
            *id v31 = v35;
          }
          v35[2] = v39 + 1;
          v35[v39 + 4] = v33 + 1;
          swift_endAccess();

          v32 += 2;
          --v30;
        }
        while (v30);
        uint64_t v29 = v45;
        swift_bridgeObjectRelease();
      }
    }
    sub_258EA1008(v42, (uint64_t)v46, (uint64_t *)&unk_26A0D04C0);
    v47[0] = v43;
    v47[1] = v44;
    uint64_t v15 = sub_258E9A130(v19, v20, v41, v29, v46, (uint64_t)v47);
    sub_258E9A37C((uint64_t)v15);
  }
}

id sub_258E9A130(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  os_log_type_t v7 = v6;
  uint64_t v9 = *a5;
  uint64_t v8 = (void *)a5[1];
  uint64_t v11 = a5[2];
  uint64_t v10 = a5[3];
  uint64_t v12 = a5[4];
  uint64_t v13 = *(void *)(a6 + 8);
  uint64_t v29 = a5[5];
  id result = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataMLSEShareEvent), sel_init);
  if (result)
  {
    uint64_t v15 = result;
    os_log_type_t v16 = (void *)sub_258EA8C30();
    objc_msgSend(v15, sel_setSessionId_, v16);

    sub_258E7451C(0, &qword_26A0D0550);
    uint64_t v17 = (void *)MEMORY[0x25A2D2C20](MEMORY[0x263F8EE78]);
    objc_msgSend(v15, sel_setFeaturizedCandidates_, v17);

    if (v8)
    {
      uint64_t v32 = v9;
      uint64_t v33 = v8;
      uint64_t v34 = v11;
      uint64_t v35 = v10;
      uint64_t v36 = v12;
      uint64_t v37 = v29;
      id v18 = sub_258E9C37C();
      if (v18)
      {
        uint64_t v19 = v18;
        objc_msgSend(v15, sel_setTrialIdentifier_, v18);
      }
    }
    objc_msgSend(v15, sel_setEngagementType_, dword_258EAAAEC[a3]);
    if (v13)
    {
      id v20 = objc_allocWithZone((Class)PeoplePredictionDataFeaturizationConfig);
      swift_bridgeObjectRetain();
      id v21 = objc_msgSend(v20, sel_init);
      if (!v21)
      {
        swift_bridgeObjectRelease();
        uint64_t v24 = *(void *)(a4 + 16);
        if (v24)
        {
LABEL_9:
          swift_bridgeObjectRetain();
          os_log_type_t v25 = (void **)(a4 + 40);
          do
          {
            char v26 = *((unsigned char *)v25 - 8);
            uint64_t v27 = *v25;
            v25 += 2;
            LOBYTE(v32) = v26;
            uint64_t v33 = v27;
            id v28 = v27;
            sub_258E9C4B4((unsigned __int8 *)&v32, v7, v15);

            --v24;
          }
          while (v24);
          swift_bridgeObjectRelease();
        }
        return v15;
      }
      id v22 = v21;
      uint64_t v23 = (void *)sub_258EA8C30();
      objc_msgSend(v22, sel_setIdentifier_, v23);
      swift_bridgeObjectRelease();

      objc_msgSend(v15, sel_setFeaturizationConfig_, v22);
    }
    uint64_t v24 = *(void *)(a4 + 16);
    if (v24) {
      goto LABEL_9;
    }
    return v15;
  }
  __break(1u);
  return result;
}

void sub_258E9A37C(uint64_t a1)
{
  os_log_type_t v2 = objc_msgSend(self, sel_sharedInstance);
  if (v2)
  {
    oslog = v2;
    [v2 logMessage:a1];
  }
  else
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_258EA8BB0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A0D0790);
    oslog = sub_258EA8B90();
    os_log_type_t v4 = sub_258EA8EA0();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_258E57000, oslog, v4, "Unable to get PETEventTracker2", v5, 2u);
      MEMORY[0x25A2D36B0](v5, -1, -1);
    }
  }
}

void sub_258E9A4A4(void *a1)
{
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    id v2 = objc_msgSend(a1, sel_error);
    if (v2)
    {
      uint64_t v3 = v2;
      if (qword_26A0D01F0 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_258EA8BB0();
      __swift_project_value_buffer(v4, (uint64_t)qword_26A0D0790);
      uint64_t v13 = v3;
      uint64_t v5 = sub_258EA8B90();
      os_log_type_t v6 = sub_258EA8EA0();
      if (os_log_type_enabled(v5, v6))
      {
        os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
        uint64_t v8 = (void *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v7 = 138412290;
        uint64_t v9 = v13;
        uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
        sub_258EA8F40();
        *uint64_t v8 = v14;

        _os_log_impl(&dword_258E57000, v5, v6, "%@", v7, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0530);
        swift_arrayDestroy();
        MEMORY[0x25A2D36B0](v8, -1, -1);
        MEMORY[0x25A2D36B0](v7, -1, -1);

        return;
      }
    }
    else
    {
      if (qword_26A0D01F0 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_258EA8BB0();
      __swift_project_value_buffer(v10, (uint64_t)qword_26A0D0790);
      uint64_t v13 = sub_258EA8B90();
      os_log_type_t v11 = sub_258EA8EA0();
      if (os_log_type_enabled(v13, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_258E57000, v13, v11, "virtual feature stream reading error", v12, 2u);
        MEMORY[0x25A2D36B0](v12, -1, -1);
      }
    }
  }
}

BOOL sub_258E9A758(void *a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *), uint64_t a6, uint64_t a7)
{
  uint64_t v13 = off_26543F000;
  id v14 = objc_msgSend(a1, sel_eventBody);
  if (v14)
  {
    uint64_t v15 = v14;
    id v61 = a5;
    os_log_type_t v16 = off_26543F000;
    id v17 = objc_msgSend(v14, sel_shareSessionIdentifier);
    if (v17)
    {
      id v18 = v17;
      uint64_t v59 = a7;
      uint64_t v19 = (uint64_t *)(a3 + 16);
      uint64_t v60 = sub_258EA8C50();
      id v21 = v20;

      swift_beginAccess();
      uint64_t v22 = *v19;
      if ((unint64_t)*v19 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_258EA9150();
        if (v23)
        {
LABEL_5:
          unint64_t v24 = v23 - 1;
          if (__OFSUB__(v23, 1))
          {
            __break(1u);
          }
          else if ((v22 & 0xC000000000000001) == 0)
          {
            if ((v24 & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (v24 < *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              id v25 = *(id *)(v22 + 8 * v24 + 32);
              goto LABEL_10;
            }
            __break(1u);
            goto LABEL_48;
          }
          id v25 = (id)MEMORY[0x25A2D2D90](v24, v22);
LABEL_10:
          char v26 = v25;
          swift_bridgeObjectRelease();
          id v27 = objc_msgSend(v26, sel_eventBody);
          if (!v27)
          {
            swift_bridgeObjectRelease();

            goto LABEL_40;
          }
          id v28 = v27;
          uint64_t v13 = (__CFString **)v26;
          id v29 = objc_msgSend(v27, sel_shareSessionIdentifier);

          if (!v29)
          {
            swift_bridgeObjectRelease();

            goto LABEL_40;
          }
          uint64_t v30 = sub_258EA8C50();
          os_log_type_t v16 = v31;

          if (v60 == v30 && v21 == v16)
          {

            swift_bridgeObjectRelease_n();
LABEL_40:
            swift_beginAccess();
            id v53 = a1;
            MEMORY[0x25A2D2A50]();
            if (*(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_258EA8D70();
            }
            sub_258EA8D90();
            sub_258EA8D60();
            swift_endAccess();
            uint64_t v54 = a2 + 43;
            uint64_t v56 = a2[46];
            uint64_t v55 = a2[47];
            __swift_project_boxed_opaque_existential_1(v54, v56);
            char v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v56, v55);

            return (v39 & 1) == 0;
          }
          uint64_t v23 = v30;
          char v40 = sub_258EA91E0();
          swift_bridgeObjectRelease();
          if (v40)
          {

LABEL_39:
            swift_bridgeObjectRelease();
            goto LABEL_40;
          }
          if (*(void *)(a4 + 16))
          {
            swift_bridgeObjectRetain();
            unint64_t v41 = sub_258E78DD0(v23, (uint64_t)v16);
            if (v42)
            {
              id v43 = *(id *)(*(void *)(a4 + 56) + 8 * v41);
              swift_bridgeObjectRelease_n();
              swift_beginAccess();
              unint64_t v44 = swift_bridgeObjectRetain();
              sub_258E9AE6C(v44, v43, v61);

              swift_bridgeObjectRelease();
              goto LABEL_35;
            }
            swift_bridgeObjectRelease();
          }
          if (qword_26A0D01F0 == -1)
          {
LABEL_30:
            uint64_t v45 = sub_258EA8BB0();
            __swift_project_value_buffer(v45, (uint64_t)qword_26A0D0790);
            swift_retain_n();
            unint64_t v46 = (unint64_t)v16;
            swift_bridgeObjectRetain();
            uint64_t v47 = sub_258EA8B90();
            os_log_type_t v48 = sub_258EA8EA0();
            if (os_log_type_enabled(v47, v48))
            {
              uint64_t v49 = swift_slowAlloc();
              uint64_t v58 = swift_slowAlloc();
              v62[0] = v58;
              *(_DWORD *)uint64_t v49 = 136315394;
              swift_bridgeObjectRetain();
              sub_258E787E0(v23, v46, v62);
              sub_258EA8F40();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v49 + 12) = 2048;
              swift_beginAccess();
              if ((unint64_t)*v19 >> 62)
              {
                swift_bridgeObjectRetain();
                sub_258EA9150();
                swift_release();
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_release();
              }
              uint64_t v50 = v59;
              sub_258EA8F40();
              swift_release();
              _os_log_impl(&dword_258E57000, v47, v48, "Missing feedback: %s, batch size %ld", (uint8_t *)v49, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x25A2D36B0](v58, -1, -1);
              MEMORY[0x25A2D36B0](v49, -1, -1);

              goto LABEL_36;
            }

            swift_bridgeObjectRelease_n();
            swift_release_n();
LABEL_35:
            uint64_t v50 = v59;
LABEL_36:
            swift_beginAccess();
            *uint64_t v19 = MEMORY[0x263F8EE78];
            swift_bridgeObjectRelease();
            objc_msgSend(v13, sel_timestamp);
            uint64_t v52 = v51;

            swift_beginAccess();
            *(void *)(v50 + 16) = v52;
            *(unsigned char *)(v50 + 24) = 0;
            goto LABEL_40;
          }
LABEL_48:
          swift_once();
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v23) {
          goto LABEL_5;
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_39;
    }
  }
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_258EA8BB0();
  __swift_project_value_buffer(v32, (uint64_t)qword_26A0D0790);
  uint64_t v33 = sub_258EA8B90();
  os_log_type_t v34 = sub_258EA8E90();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_258E57000, v33, v34, "Skipping invalid virtual feature store event", v35, 2u);
    MEMORY[0x25A2D36B0](v35, -1, -1);
  }

  uint64_t v36 = a2 + 43;
  uint64_t v38 = a2[46];
  uint64_t v37 = a2[47];
  __swift_project_boxed_opaque_existential_1(v36, v38);
  char v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v38, v37);
  return (v39 & 1) == 0;
}

void sub_258E9AE6C(unint64_t a1, void *a2, void (*a3)(uint64_t *))
{
  uint64_t v5 = v3;
  uint64_t v7 = (uint64_t)a2;
  if (sub_258E9BA28())
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_258EA8BB0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A0D0790);
    id v101 = a2;
    uint64_t v9 = sub_258EA8B90();
    os_log_type_t v10 = sub_258EA8E80();
    if (os_log_type_enabled(v9, v10))
    {
      os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v102 = v12;
      *(_DWORD *)os_log_type_t v11 = 136315138;
      id v13 = objc_msgSend(v101, sel_identifier);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = sub_258EA8C50();
        uint64_t v17 = v16;
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v17 = 0;
      }
      uint64_t v103 = v15;
      uint64_t v104 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0508);
      uint64_t v45 = sub_258EA8C60();
      uint64_t v103 = sub_258E787E0(v45, v46, &v102);
      sub_258EA8F40();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_258E57000, v9, v10, "skipping due to timeout on %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v12, -1, -1);
      MEMORY[0x25A2D36B0](v11, -1, -1);
    }
    else
    {
    }
    return;
  }
  uint64_t v103 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_258EA9150();
    if (v18) {
      goto LABEL_9;
    }
LABEL_50:
    swift_bridgeObjectRelease();
    unsigned int v48 = objc_msgSend(a2, sel_engagementType);
    unint64_t v4 = MEMORY[0x263F8EE78];
    uint64_t v47 = (void *)MEMORY[0x263F8EE78];
    if (v48 != 1) {
      goto LABEL_113;
    }
    goto LABEL_51;
  }
  uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v18) {
    goto LABEL_50;
  }
LABEL_9:
  if (v18 < 1)
  {
    __break(1u);
LABEL_82:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_258EA9150();
    if (v7) {
      goto LABEL_53;
    }
    goto LABEL_83;
  }
  uint64_t v19 = 0;
  unint64_t v20 = a1 & 0xC000000000000001;
  do
  {
    if (v20) {
      id v21 = (id)MEMORY[0x25A2D2D90](v19, a1);
    }
    else {
      id v21 = *(id *)(a1 + 8 * v19 + 32);
    }
    uint64_t v22 = v21;
    id v23 = objc_msgSend(v21, sel_eventBody);

    if (v23)
    {
      MEMORY[0x25A2D2A50]();
      if (*(void *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_258EA8D70();
      }
      sub_258EA8D90();
      uint64_t v7 = (uint64_t)&v103;
      sub_258EA8D60();
    }
    ++v19;
  }
  while (v18 != v19);
  swift_bridgeObjectRelease();
  unint64_t v4 = v103;
  if (objc_msgSend(a2, sel_engagementType) != 1)
  {
    if (v20)
    {
      swift_bridgeObjectRetain();
      id v24 = (id)MEMORY[0x25A2D2D90](0, a1);
      swift_bridgeObjectRelease();
LABEL_23:
      objc_msgSend(v24, sel_timestamp);
      double v26 = v25;

      unint64_t v27 = (unint64_t)sub_258E9BB60(a2, v26, *v5);
      if (!v27)
      {
        uint64_t v47 = (void *)MEMORY[0x263F8EE78];
        goto LABEL_113;
      }
      uint64_t v7 = v27;
      unint64_t v98 = v4;
      if (!(v27 >> 62))
      {
        uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v28) {
          goto LABEL_26;
        }
LABEL_88:
        uint64_t v30 = (void *)MEMORY[0x263F8EE78];
LABEL_89:
        swift_bridgeObjectRelease_n();
        uint64_t v70 = sub_258E9FB00((uint64_t)v30);
        swift_bridgeObjectRelease();
        if (v98 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v71 = sub_258EA9150();
          if (v71) {
            goto LABEL_91;
          }
        }
        else
        {
          uint64_t v71 = *(void *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v71)
          {
LABEL_91:
            if (v71 < 1)
            {
LABEL_133:
              __break(1u);
              return;
            }
            uint64_t v72 = 0;
            uint64_t v47 = (void *)MEMORY[0x263F8EE78];
            while (1)
            {
              if ((v98 & 0xC000000000000001) != 0) {
                id v73 = (id)MEMORY[0x25A2D2D90](v72, v98);
              }
              else {
                id v73 = *(id *)(v98 + 8 * v72 + 32);
              }
              unint64_t v74 = v73;
              id v75 = a2;
              id v76 = v74;
              swift_bridgeObjectRetain();
              id v77 = objc_msgSend(v76, sel_itemIdentifier);
              if (v77)
              {
                uint64_t v78 = v77;
                uint64_t v79 = sub_258EA8C50();
                uint64_t v81 = v80;

                LOBYTE(v78) = sub_258E98DE0(v79, v81, v70);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v78)
                {
                  unsigned int v82 = objc_msgSend(v75, sel_engagementType);

                  if (v82 == 6) {
                    char v83 = 1;
                  }
                  else {
                    char v83 = 2;
                  }
                  goto LABEL_103;
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }

              char v83 = 3;
LABEL_103:
              id v84 = v76;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v47 = sub_258E9CE18(0, v47[2] + 1, 1, v47);
              }
              unint64_t v86 = v47[2];
              unint64_t v85 = v47[3];
              if (v86 >= v85 >> 1) {
                uint64_t v47 = sub_258E9CE18((void *)(v85 > 1), v86 + 1, 1, v47);
              }
              ++v72;
              uint64_t v47[2] = v86 + 1;
              uint64_t v87 = &v47[2 * v86];
              *((unsigned char *)v87 + 32) = v83;
              v87[5] = v84;

              if (v71 == v72) {
                goto LABEL_111;
              }
            }
          }
        }
        uint64_t v47 = (void *)MEMORY[0x263F8EE78];
LABEL_111:
        swift_bridgeObjectRelease();
        unint64_t v4 = v98;
        goto LABEL_112;
      }
LABEL_87:
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_258EA9150();
      if (v28)
      {
LABEL_26:
        if (v28 >= 1)
        {
          uint64_t v29 = 0;
          uint64_t v30 = (void *)MEMORY[0x263F8EE78];
          id v31 = off_26543F000;
          while (1)
          {
            if ((v7 & 0xC000000000000001) != 0) {
              id v32 = (id)MEMORY[0x25A2D2D90](v29, v7);
            }
            else {
              id v32 = *(id *)(v7 + 8 * v29 + 32);
            }
            uint64_t v33 = v32;
            id v34 = objc_msgSend(v32, sel_domainIdentifier);
            if (v34)
            {

              id v35 = objc_msgSend(v33, sel_domainIdentifier);
            }
            else
            {
              id v36 = [v33 (SEL)v31[198]];
              if (!v36) {
                goto LABEL_28;
              }

              id v35 = [v33 (SEL)v31[198]];
            }
            id v37 = v35;
            if (v37)
            {
              uint64_t v38 = v31;
              uint64_t v39 = sub_258EA8C50();
              uint64_t v41 = v40;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v30 = sub_258E9C9D8(0, v30[2] + 1, 1, v30);
              }
              unint64_t v43 = v30[2];
              unint64_t v42 = v30[3];
              if (v43 >= v42 >> 1) {
                uint64_t v30 = sub_258E9C9D8((void *)(v42 > 1), v43 + 1, 1, v30);
              }
              v30[2] = v43 + 1;
              unint64_t v44 = &v30[2 * v43];
              v44[4] = v39;
              v44[5] = v41;
              id v31 = v38;
              goto LABEL_29;
            }
LABEL_28:

LABEL_29:
            if (v28 == ++v29) {
              goto LABEL_89;
            }
          }
        }
        goto LABEL_132;
      }
      goto LABEL_88;
    }
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v24 = *(id *)(a1 + 32);
      goto LABEL_23;
    }
    __break(1u);
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
LABEL_51:
  if (v4 >> 62) {
    goto LABEL_82;
  }
  uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v7)
  {
LABEL_53:
    if (v7 < 1) {
      goto LABEL_86;
    }
    uint64_t v49 = 0;
    unint64_t v97 = v4 & 0xC000000000000001;
    uint64_t v47 = (void *)MEMORY[0x263F8EE78];
    unint64_t v99 = v4;
    while (1)
    {
      id v50 = v97 ? (id)MEMORY[0x25A2D2D90](v49, v4) : *(id *)(v4 + 8 * v49 + 32);
      uint64_t v51 = v50;
      id v52 = a2;
      id v53 = v51;
      id v54 = objc_msgSend(v53, sel_itemIdentifier);
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = sub_258EA8C50();
        uint64_t v58 = v57;
      }
      else
      {
        uint64_t v56 = 0;
        uint64_t v58 = 0;
      }
      id v59 = objc_msgSend(v52, sel_engagementIdentifier);
      if (!v59) {
        break;
      }
      uint64_t v60 = v59;
      uint64_t v61 = sub_258EA8C50();
      uint64_t v63 = v62;

      if (v58)
      {
        if (v63)
        {
          if (v56 == v61 && v58 == v63)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
LABEL_69:
          }
          else
          {
            char v65 = sub_258EA91E0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            if ((v65 & 1) == 0)
            {
              char v64 = 3;
              goto LABEL_74;
            }
          }
LABEL_73:
          char v64 = 0;
          goto LABEL_74;
        }
        goto LABEL_68;
      }

      if (!v63) {
        goto LABEL_73;
      }
      swift_bridgeObjectRelease();
      char v64 = 3;
LABEL_74:
      id v66 = v53;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v47 = sub_258E9CE18(0, v47[2] + 1, 1, v47);
      }
      unint64_t v68 = v47[2];
      unint64_t v67 = v47[3];
      if (v68 >= v67 >> 1) {
        uint64_t v47 = sub_258E9CE18((void *)(v67 > 1), v68 + 1, 1, v47);
      }
      ++v49;
      uint64_t v47[2] = v68 + 1;
      id v69 = &v47[2 * v68];
      *((unsigned char *)v69 + 32) = v64;
      v69[5] = v66;

      unint64_t v4 = v99;
      if (v7 == v49) {
        goto LABEL_112;
      }
    }
    if (!v58) {
      goto LABEL_69;
    }
LABEL_68:
    swift_bridgeObjectRelease();

    char v64 = 3;
    goto LABEL_74;
  }
LABEL_83:
  uint64_t v47 = (void *)MEMORY[0x263F8EE78];
LABEL_112:
  swift_bridgeObjectRelease();
LABEL_113:
  if (!(v4 >> 62))
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_115;
    }
LABEL_124:
    swift_bridgeObjectRelease();
    goto LABEL_125;
  }
  swift_bridgeObjectRetain();
  uint64_t v95 = sub_258EA9150();
  swift_bridgeObjectRelease();
  if (!v95) {
    goto LABEL_124;
  }
LABEL_115:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v88 = (id)MEMORY[0x25A2D2D90](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }
    id v88 = *(id *)(v4 + 32);
  }
  uint64_t v89 = v88;
  swift_bridgeObjectRelease();
  id v90 = objc_msgSend(v89, sel_shareSessionIdentifier);

  if (v90)
  {
    uint64_t v91 = sub_258EA8C50();
    uint64_t v93 = v92;

    if (v47[2])
    {
      LODWORD(v94) = objc_msgSend(a2, sel_engagementType) - 1;
      uint64_t v103 = v91;
      uint64_t v104 = v93;
      if (v94 >= 7) {
        uint64_t v94 = 7;
      }
      else {
        uint64_t v94 = v94;
      }
      uint64_t v105 = v94;
      uint64_t v106 = v47;
      char v107 = 0;
      a3(&v103);
    }
    goto LABEL_124;
  }
LABEL_125:
  swift_bridgeObjectRelease();
}

uint64_t sub_258E9B9D0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

BOOL sub_258E9BA28()
{
  id v1 = objc_msgSend(v0, sel_timeouts);
  sub_258E7451C(0, &qword_26A0D0528);
  unint64_t v2 = sub_258EA8D40();

  if (v2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_258EA9150())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25A2D2D90](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      os_log_type_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      unsigned int v8 = objc_msgSend(v5, sel_occurrence);

      BOOL v10 = v8 == 1;
      BOOL v9 = v8 == 1;
      ++v4;
      BOOL v10 = v10 || v7 == v3;
      if (v10) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  BOOL v9 = 0;
LABEL_17:
  swift_bridgeObjectRelease_n();
  return v9;
}

id sub_258E9BB60(void *a1, double a2, double a3)
{
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_258EA8BB0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26A0D0790);
  uint64_t v43 = v3;
  sub_258EA0100(v3, (uint64_t)v44);
  unsigned int v8 = sub_258EA8B90();
  os_log_type_t v9 = sub_258EA8E80();
  if (os_log_type_enabled(v8, v9))
  {
    BOOL v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)BOOL v10 = 134217984;
    sub_258EA8F40();
    sub_258EA0D08(v44);
    _os_log_impl(&dword_258E57000, v8, v9, "Loading all interactions from inference to inference + %f s", v10, 0xCu);
    MEMORY[0x25A2D36B0](v10, -1, -1);
  }
  else
  {
    sub_258EA0D08(v44);
  }

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF908]), sel_initWithTimeIntervalSinceReferenceDate_, a2);
  id v12 = objc_msgSend(v11, sel_dateByAddingTimeInterval_, a3);
  sub_258E7451C(0, &qword_26A0D0210);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D04D0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_258EAA340;
  uint64_t v14 = sub_258E7451C(0, &qword_26A0D0220);
  *(void *)(v13 + 56) = v14;
  uint64_t v15 = sub_258EA0D38((unint64_t *)&unk_26A0D04E0, &qword_26A0D0220);
  *(void *)(v13 + 32) = v11;
  *(void *)(v13 + 96) = v14;
  *(void *)(v13 + 104) = v15;
  *(void *)(v13 + 64) = v15;
  *(void *)(v13 + 72) = v12;
  id v16 = objc_allocWithZone(NSNumber);
  id v17 = v11;
  id v18 = v12;
  id v19 = objc_msgSend(v16, sel_initWithInteger_, 1);
  *(void *)(v13 + 136) = sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
  *(void *)(v13 + 144) = sub_258EA0D38(&qword_26A0D04F0, (unint64_t *)&qword_26A0D0218);
  *(void *)(v13 + 112) = v19;
  id v20 = (id)sub_258EA8E60();
  if (objc_msgSend(a1, sel_engagementType) == 6
    && (id v21 = objc_msgSend(a1, sel_engagementIdentifier)) != 0)
  {
    uint64_t v22 = v21;
    uint64_t v23 = sub_258EA8C50();
    unint64_t v25 = v24;

    swift_bridgeObjectRetain_n();
    double v26 = sub_258EA8B90();
    os_log_type_t v27 = sub_258EA8E80();
    if (os_log_type_enabled(v26, v27))
    {
      id v42 = v17;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = (void *)swift_slowAlloc();
      v44[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      sub_258E787E0(v23, v25, (uint64_t *)v44);
      sub_258EA8F40();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_258E57000, v26, v27, "Selecting interactions associated with %s in the Sharesheet", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2D36B0](v29, -1, -1);
      uint64_t v30 = v28;
      id v17 = v42;
      MEMORY[0x25A2D36B0](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v32 = v18;
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_258EAA3C0;
    uint64_t v34 = MEMORY[0x263F8D310];
    *(void *)(v33 + 56) = MEMORY[0x263F8D310];
    unint64_t v35 = sub_258EA0D7C();
    *(void *)(v33 + 32) = v23;
    *(void *)(v33 + 40) = v25;
    *(void *)(v33 + 96) = v34;
    *(void *)(v33 + 104) = v35;
    *(void *)(v33 + 64) = v35;
    *(void *)(v33 + 72) = v23;
    *(void *)(v33 + 80) = v25;
    swift_bridgeObjectRetain();
    id v36 = (void *)sub_258EA8E60();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_258EAA8A0;
    *(void *)(v37 + 32) = v20;
    *(void *)(v37 + 40) = v36;
    v44[0] = (id)v37;
    sub_258EA8D60();
    id v38 = v36;
    uint64_t v39 = sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v31 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v39);

    id v20 = (id)v39;
  }
  else
  {
    id v31 = v20;
    id v32 = v18;
  }

  id v40 = sub_258E82290((uint64_t)v31, *(void *)(v43 + 8));
  return v40;
}

uint64_t DataHarvestingManager.fetchInteractionsForTests(from:timeWindow:feedback:)(void *a1, double a2, double a3)
{
  unint64_t v3 = (unint64_t)sub_258E9BB60(a1, a2, a3);
  unint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
    if (v3 >> 62)
    {
      uint64_t v9 = sub_258EA9140();
      swift_bridgeObjectRelease();
      return v9;
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_258EA91F0();
      if (swift_dynamicCastMetatype() || (uint64_t v7 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) == 0)
      {
LABEL_4:
        swift_bridgeObjectRelease();
      }
      else
      {
        unsigned int v8 = (void *)(v5 + 32);
        while (*v8)
        {
          ++v8;
          if (!--v7) {
            goto LABEL_4;
          }
        }
        swift_bridgeObjectRelease();
        return v5 | 1;
      }
    }
  }
  return v4;
}

Swift::Void __swiftcall DataHarvestingManager.pruneVirtualFeatureStore()()
{
  id v1 = objc_msgSend(*(id *)(v0 + 40), sel_pruner);
  v7[4] = sub_258E73F94;
  v7[5] = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_258E916F0;
  v7[3] = &block_descriptor_21;
  unint64_t v2 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v1, sel_deleteEventsPassingTest_, v2);

  _Block_release(v2);
  if (swift_isEscapingClosureAtFileLocation())
  {
    __break(1u);
  }
  else if (qword_26A0D01F0 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  uint64_t v3 = sub_258EA8BB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A0D0790);
  unint64_t v4 = sub_258EA8B90();
  os_log_type_t v5 = sub_258EA8E70();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_258E57000, v4, v5, "Pruned all events from the Virtual Feature Store", v6, 2u);
    MEMORY[0x25A2D36B0](v6, -1, -1);
  }
}

id sub_258E9C37C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  id v3 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataTrialIdentifier), sel_init);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    os_log_type_t v6 = (void *)sub_258EA8C30();
    objc_msgSend(v5, sel_setTask_, v6);

    id v7 = v5;
    unsigned int v8 = (void *)sub_258EA8C30();
    objc_msgSend(v7, sel_setTreatment_, v8);

    id v9 = v7;
    swift_bridgeObjectRetain();
    sub_258EA8D00();
    BOOL v10 = (void *)sub_258EA8C30();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setDeployment_, v10, v2, v1);
  }
  return v4;
}

void sub_258E9C4B4(unsigned __int8 *a1, const void *a2, void *a3)
{
  int v6 = *a1;
  id v7 = (void *)*((void *)a1 + 1);
  unsigned int v8 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeatureValue), sel_init);
  if (!v8)
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_258EA8BB0();
    __swift_project_value_buffer(v26, (uint64_t)qword_26A0D0790);
    id v9 = sub_258EA8B90();
    os_log_type_t v27 = sub_258EA8EA0();
    if (os_log_type_enabled(v9, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      MEMORY[0x25A2D36B0](v28, -1, -1);
    }
    goto LABEL_21;
  }
  id v9 = v8;
  id v10 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeature), sel_init);
  if (!v10)
  {
    if (qword_26A0D01F0 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_258EA8BB0();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A0D0790);
    uint64_t v30 = sub_258EA8B90();
    os_log_type_t v31 = sub_258EA8EA0();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v32 = 0;
      MEMORY[0x25A2D36B0](v32, -1, -1);

      return;
    }

    goto LABEL_21;
  }
  id v11 = v10;
  [v9 setIntValue:(v6 + 1)];
  objc_msgSend(v11, sel_setFeatureValue_, v9);
  objc_msgSend(v11, sel_setFeatureName_, 386);
  memcpy(__dst, a2, 0x158uLL);
  memcpy(v40, a2, sizeof(v40));
  sub_258EA10C0(__dst);
  id v12 = sub_258E83EC0(v7, v40);
  if (!v3)
  {
    uint64_t v33 = v12;
    sub_258EA11E8(__dst);
    id v34 = objc_msgSend(v33, sel_featureVectors);
    if (v34)
    {
      unint64_t v35 = v34;
      objc_msgSend(v34, sel_addObject_, v11);

      id v36 = objc_msgSend(a3, sel_featurizedCandidates);
      if (v36)
      {
        uint64_t v37 = v36;
        id v38 = v33;
        objc_msgSend(v37, sel_addObject_, v38);

LABEL_21:
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  sub_258EA11E8(__dst);
  if (qword_26A0D01F0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_258EA8BB0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26A0D0790);
  id v14 = v7;
  id v15 = v3;
  id v16 = v14;
  id v17 = v3;
  id v18 = sub_258EA8B90();
  os_log_type_t v19 = sub_258EA8EA0();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    int v42 = v20;
    uint64_t v22 = v21;
    uint64_t v39 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 138478083;
    v40[0] = v16;
    id v23 = v16;
    sub_258EA8F40();
    *uint64_t v39 = v16;

    *(_WORD *)(v22 + 12) = 2112;
    id v24 = v3;
    uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
    v40[0] = v25;
    sub_258EA8F40();
    v39[1] = v25;

    _os_log_impl(&dword_258E57000, v18, (os_log_type_t)v42, "Error while translating biomeFormat to petFormat %{private}@. Error %@", (uint8_t *)v22, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0530);
    swift_arrayDestroy();
    MEMORY[0x25A2D36B0](v39, -1, -1);
    MEMORY[0x25A2D36B0](v22, -1, -1);
  }
  else
  {
  }
}

void *sub_258E9C9D8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0510);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_258E9FB98(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_258E9CAE8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03D8);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_258E9FC8C(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_258E9CBF8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D05D0);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_258E9FD78(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_258E9CD08(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0548);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_258EA0E28(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_258E9CE18(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0518);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_258EA0F14(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_258E9CF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = (void **)v6;
  id v14 = (void *)*v6;
  unint64_t v16 = sub_258E78DD0(a4, a5);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 >= v19 && (a6 & 1) != 0)
  {
LABEL_7:
    uint64_t v22 = *v7;
    if (v20)
    {
LABEL_8:
      id v23 = (uint64_t *)(v22[7] + 24 * v16);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      *id v23 = a1;
      v23[1] = a2;
      v23[2] = a3;
      return result;
    }
    goto LABEL_11;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_258E7C160();
    goto LABEL_7;
  }
  sub_258E79558(v19, a6 & 1);
  unint64_t v25 = sub_258E78DD0(a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_15:
    uint64_t result = sub_258EA9220();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  uint64_t v22 = *v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  sub_258E9D988(v16, a4, a5, a1, a2, a3, v22);
  return swift_bridgeObjectRetain();
}

id sub_258E9D094(char a1, void *a2, char a3)
{
  id v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_258E78E48((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  id result = (id)(v10 + v11);
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= (uint64_t)result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= (uint64_t)result && (a3 & 1) == 0)
  {
    id result = sub_258E7C348();
LABEL_7:
    char v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      *(unsigned char *)(v15[7] + v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_258E7989C((uint64_t)result, a3 & 1);
  id result = (id)sub_258E78E48((uint64_t)a2);
  if ((v13 & 1) != (v16 & 1))
  {
LABEL_17:
    sub_258EA8B30();
    id result = (id)sub_258EA9220();
    __break(1u);
    return result;
  }
  unint64_t v9 = (unint64_t)result;
  char v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  *(void *)(v15[6] + 8 * v9) = a2;
  *(unsigned char *)(v15[7] + v9) = a1;
  uint64_t v17 = v15[2];
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v19;
  return a2;
}

void sub_258E9D1E8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = (void **)v6;
  uint64_t v14 = (void *)*v6;
  unint64_t v16 = sub_258E78DD0(a4, a5);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 >= v19 && (a6 & 1) != 0)
  {
LABEL_7:
    uint64_t v22 = *v7;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7] + 24 * v16;
      id v24 = *(void **)(v23 + 8);
      swift_bridgeObjectRelease();

      *(_DWORD *)uint64_t v23 = a1;
      *(void *)(v23 + 8) = a2;
      *(void *)(v23 + 16) = a3;
      return;
    }
    goto LABEL_11;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_258E7C4EC();
    goto LABEL_7;
  }
  sub_258E79B64(v19, a6 & 1);
  unint64_t v25 = sub_258E78DD0(a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_15:
    sub_258EA9220();
    __break(1u);
    return;
  }
  unint64_t v16 = v25;
  uint64_t v22 = *v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  sub_258E9D9DC(v16, a4, a5, a1, a2, a3, v22);
  swift_bridgeObjectRetain();
}

void sub_258E9D350(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
}

id sub_258E9D37C(uint64_t a1, void *a2, char a3)
{
  id v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_258E78E8C((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_258E7C6D4();
LABEL_7:
    char v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_bridgeObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_258E79E9C(v12, a3 & 1);
  unint64_t v18 = sub_258E78E8C((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_258E7451C(0, &qword_26A0D0318);
    id result = (id)sub_258EA9220();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  char v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;
  return a2;
}

uint64_t sub_258E9D4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  char v8 = v7;
  uint64_t v15 = *v7;
  unint64_t v17 = sub_258E78DD0(a5, a6);
  uint64_t v18 = *(void *)(v15 + 16);
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v21 = v16;
  uint64_t v22 = *(void *)(v15 + 24);
  if (v22 >= v20 && (a7 & 1) != 0) {
    goto LABEL_7;
  }
  if (v22 >= v20 && (a7 & 1) == 0)
  {
    sub_258E7CC04();
LABEL_7:
    uint64_t v23 = (void *)*v8;
    if (v21)
    {
LABEL_8:
      id v24 = (void *)(v23[7] + 32 * v17);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      void *v24 = a1;
      v24[1] = a2;
      _OWORD v24[2] = a3;
      v24[3] = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_258E7A7B8(v20, a7 & 1);
  unint64_t v26 = sub_258E78DD0(a5, a6);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_17:
    uint64_t result = sub_258EA9220();
    __break(1u);
    return result;
  }
  unint64_t v17 = v26;
  uint64_t v23 = (void *)*v8;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  v23[(v17 >> 6) + 8] |= 1 << v17;
  uint64_t v28 = (uint64_t *)(v23[6] + 16 * v17);
  *uint64_t v28 = a5;
  v28[1] = a6;
  uint64_t v29 = (void *)(v23[7] + 32 * v17);
  *uint64_t v29 = a1;
  v29[1] = a2;
  uint64_t v29[2] = a3;
  v29[3] = a4;
  uint64_t v30 = v23[2];
  BOOL v31 = __OFADD__(v30, 1);
  uint64_t v32 = v30 + 1;
  if (v31)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v23[2] = v32;
  return swift_bridgeObjectRetain();
}

uint64_t sub_258E9D6A4(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_258E78DD0(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_258E7CDDC();
      goto LABEL_7;
    }
    sub_258E7AAE4(v15, a4 & 1);
    unint64_t v21 = sub_258E78DD0(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_258EA9220();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 40 * v12;
    __swift_destroy_boxed_opaque_existential_1Tm(v19);
    return sub_258E7D394(a1, v19);
  }
LABEL_13:
  sub_258E9DA30(v12, a2, a3, a1, v18);
  return swift_bridgeObjectRetain();
}

void sub_258E9D7FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void))
{
  unint64_t v9 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_258E78DD0(a2, a3);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    char v22 = (void *)*v9;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];

      *(void *)(v23 + 8 * v16) = a1;
      return;
    }
    goto LABEL_11;
  }
  a6();
  unint64_t v24 = sub_258E78DD0(a2, a3);
  if ((v20 & 1) != (v25 & 1))
  {
LABEL_17:
    sub_258EA9220();
    __break(1u);
    return;
  }
  unint64_t v16 = v24;
  char v22 = (void *)*v9;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  unint64_t v26 = (uint64_t *)(v22[6] + 16 * v16);
  *unint64_t v26 = a2;
  v26[1] = a3;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v27 = v22[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v29;
  swift_bridgeObjectRetain();
}

unint64_t sub_258E9D988(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(result >> 6) + 8] |= 1 << result;
  uint64_t v7 = (void *)(a7[6] + 16 * result);
  void *v7 = a2;
  v7[1] = a3;
  char v8 = (void *)(a7[7] + 24 * result);
  *char v8 = a4;
  v8[1] = a5;
  void v8[2] = a6;
  uint64_t v9 = a7[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a7[2] = v11;
  }
  return result;
}

unint64_t sub_258E9D9DC(unint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, void *a7)
{
  a7[(result >> 6) + 8] |= 1 << result;
  uint64_t v7 = (void *)(a7[6] + 16 * result);
  void *v7 = a2;
  v7[1] = a3;
  uint64_t v8 = a7[7] + 24 * result;
  *(_DWORD *)uint64_t v8 = a4;
  *(void *)(v8 + 8) = a5;
  *(void *)(v8 + 16) = a6;
  uint64_t v9 = a7[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a7[2] = v11;
  }
  return result;
}

uint64_t sub_258E9DA30(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_258E7D394(a4, a5[7] + 40 * a1);
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_258E9DAA0(void *a1, void *a2)
{
  id v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_258EA8FD0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_258EA8B30();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_258EA8FC0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_258E9E180(v7, result + 1);
    uint64_t v29 = v21;
    unint64_t v22 = *(void *)(v21 + 16);
    if (*(void *)(v21 + 24) <= v22)
    {
      uint64_t v26 = v22 + 1;
      id v27 = v8;
      sub_258E9E868(v26, &qword_26A0D05E0);
      uint64_t v23 = v29;
    }
    else
    {
      uint64_t v23 = v21;
      id v24 = v8;
    }
    sub_258E9EB04((uint64_t)v8, v23);
    uint64_t *v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_258EA8F10();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_258EA8B30();
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_258EA8F20();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_258EA8F20();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_258E9EB88((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_258E9DD28(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_258EA9270();
  swift_bridgeObjectRetain();
  sub_258EA8C80();
  uint64_t v8 = sub_258EA9290();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_258EA91E0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_258EA91E0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_258E9ED20(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_258E9DED8(void *a1, void *a2)
{
  id v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_258EA8FD0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_258E7451C(0, &qword_26A0D05C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_258EA8FC0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_258E9E37C(v7, result + 1);
    uint64_t v29 = v21;
    unint64_t v22 = *(void *)(v21 + 16);
    if (*(void *)(v21 + 24) <= v22)
    {
      uint64_t v26 = v22 + 1;
      id v27 = v8;
      sub_258E9E868(v26, &qword_26A0D05C8);
      uint64_t v23 = v29;
    }
    else
    {
      uint64_t v23 = v21;
      id v24 = v8;
    }
    sub_258E9EB04((uint64_t)v8, v23);
    uint64_t *v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_258EA8F10();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_258E7451C(0, &qword_26A0D05C0);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_258EA8F20();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_258EA8F20();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_258E9EEBC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_258E9E180(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D05E0);
    uint64_t v2 = sub_258EA9010();
    uint64_t v15 = v2;
    sub_258EA8FB0();
    if (sub_258EA8FE0())
    {
      sub_258EA8B30();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v15;
        unint64_t v9 = *(void *)(v15 + 16);
        if (*(void *)(v15 + 24) <= v9)
        {
          sub_258E9E868(v9 + 1, &qword_26A0D05E0);
          uint64_t v2 = v15;
        }
        uint64_t result = sub_258EA8F10();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v10 = 0;
          unint64_t v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v12 = v7 == v11;
            if (v7 == v11) {
              unint64_t v7 = 0;
            }
            v10 |= v12;
            uint64_t v13 = *(void *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          unint64_t v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v14;
        ++*(void *)(v2 + 16);
      }
      while (sub_258EA8FE0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_258E9E37C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D05C8);
    uint64_t v2 = sub_258EA9010();
    uint64_t v15 = v2;
    sub_258EA8FB0();
    if (sub_258EA8FE0())
    {
      sub_258E7451C(0, &qword_26A0D05C0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v15;
        unint64_t v9 = *(void *)(v15 + 16);
        if (*(void *)(v15 + 24) <= v9)
        {
          sub_258E9E868(v9 + 1, &qword_26A0D05C8);
          uint64_t v2 = v15;
        }
        uint64_t result = sub_258EA8F10();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v10 = 0;
          unint64_t v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v12 = v7 == v11;
            if (v7 == v11) {
              unint64_t v7 = 0;
            }
            v10 |= v12;
            uint64_t v13 = *(void *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          unint64_t v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v14;
        ++*(void *)(v2 + 16);
      }
      while (sub_258EA8FE0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_258E9E588()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0520);
  uint64_t v3 = sub_258EA9000();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_258EA9270();
      sub_258EA8C80();
      uint64_t result = sub_258EA9290();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_258E9E868(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_258EA9000();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    int64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_258EA8F10();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v6;
  return result;
}

unint64_t sub_258E9EB04(uint64_t a1, uint64_t a2)
{
  sub_258EA8F10();
  unint64_t result = sub_258EA8FA0();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_258E9EB88(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if (a3)
  {
    sub_258E9E868(v8, &qword_26A0D05E0);
  }
  else
  {
    if (v7 > v6)
    {
      sub_258E9F218(&qword_26A0D05E0);
      goto LABEL_14;
    }
    sub_258E9F66C(v8, &qword_26A0D05E0);
  }
  uint64_t v9 = *v3;
  uint64_t v10 = sub_258EA8F10();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_258EA8B30();
    id v12 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
    char v13 = sub_258EA8F20();

    if (v13)
    {
LABEL_13:
      sub_258EA9210();
      __break(1u);
    }
    else
    {
      uint64_t v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v15 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
        char v16 = sub_258EA8F20();

        if (v16) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v17 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v17 + 48) + 8 * a2) = a1;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    *(void *)(v17 + 16) = v20;
  }
}

uint64_t sub_258E9ED20(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_258E9E588();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_258E9F064();
      goto LABEL_22;
    }
    sub_258E9F3BC();
  }
  uint64_t v11 = *v4;
  sub_258EA9270();
  sub_258EA8C80();
  unint64_t result = sub_258EA9290();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    id v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_258EA91E0(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_258EA9210();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_258EA91E0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void sub_258E9EEBC(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if (a3)
  {
    sub_258E9E868(v8, &qword_26A0D05C8);
  }
  else
  {
    if (v7 > v6)
    {
      sub_258E9F218(&qword_26A0D05C8);
      goto LABEL_14;
    }
    sub_258E9F66C(v8, &qword_26A0D05C8);
  }
  uint64_t v9 = *v3;
  uint64_t v10 = sub_258EA8F10();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_258E7451C(0, &qword_26A0D05C0);
    id v12 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
    char v13 = sub_258EA8F20();

    if (v13)
    {
LABEL_13:
      sub_258EA9210();
      __break(1u);
    }
    else
    {
      uint64_t v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v15 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
        char v16 = sub_258EA8F20();

        if (v16) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v17 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v17 + 48) + 8 * a2) = a1;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19) {
    __break(1u);
  }
  else {
    *(void *)(v17 + 16) = v20;
  }
}

void *sub_258E9F064()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0520);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_258EA8FF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_258E9F218(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_258EA8FF0();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v20 = *(void *)(v7 + 8 * v10);
      if (!v20)
      {
        int64_t v10 = v19 + 2;
        if (v19 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v20 = *(void *)(v7 + 8 * v10);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 48) + v17) = v18;
    id result = v18;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v14) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v7 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v7 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_258E9F3BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0520);
  uint64_t v3 = sub_258EA9000();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_258EA9270();
    swift_bridgeObjectRetain();
    sub_258EA8C80();
    uint64_t result = sub_258EA9290();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_258E9F66C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_258EA9000();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v3 = v6;
    return result;
  }
  int64_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_258EA8F10();
    uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t (*sub_258E9F8E4(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_258E9FA00(v6, a2, a3);
  return sub_258E9F94C;
}

uint64_t (*sub_258E9F950(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_258E9FA80(v6, a2, a3);
  return sub_258E9F94C;
}

void sub_258E9F9B8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_258E9FA00(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25A2D2D90](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return j__s25PeopleSuggesterLighthouse28SynchronizedExecutionManagerVwxx;
  }
  __break(1u);
  return result;
}

void (*sub_258E9FA80(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25A2D2D90](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return destroy for SynchronizedExecutionManager;
  }
  __break(1u);
  return result;
}

uint64_t sub_258E9FB00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_258EA8E20();
  uint64_t v8 = result;
  if (v2)
  {
    id v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_258E9DD28(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_258E9FB98(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

char *sub_258E9FC8C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E9FD78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258E9FE70(void *a1, uint64_t *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_258E75C98(MEMORY[0x263F8EE78]);
  id v6 = objc_msgSend(a1, sel_publisher);
  uint64_t v7 = *a2;
  int64_t v18 = sub_258EA135C;
  uint64_t v19 = v4;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  unint64_t v16 = sub_258E9920C;
  unint64_t v17 = &block_descriptor_39;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  int64_t v18 = sub_258EA1364;
  uint64_t v19 = v5;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  unint64_t v16 = sub_258E98CC0;
  unint64_t v17 = &block_descriptor_42;
  uint64_t v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v6, sel_sinkWithBookmark_completion_receiveInput_, v7, v8, v9);
  _Block_release(v9);
  _Block_release(v8);

  swift_beginAccess();
  uint64_t v11 = *(void *)(v5 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_beginAccess();
  *a2 = *(void *)(v4 + 16);
  swift_unknownObjectRetain();
  swift_release();
  swift_unknownObjectRelease();
  return v11;
}

uint64_t sub_258EA00B8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_258EA00F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_258EA0100(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_258EA0138()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 384);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 448))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 504, 7);
}

void sub_258EA0244(uint64_t a1)
{
  sub_258E99C24(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32), v1 + 40, v1 + 440, *(void *)(v1 + 488), *(void *)(v1 + 496));
}

uint64_t *sub_258EA0260(uint64_t *a1)
{
  return a1;
}

uint64_t sub_258EA0298(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_258EA0300()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 45));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 456, 7);
}

BOOL sub_258EA03F8(void *a1)
{
  return sub_258E9A758(a1, (void *)(v1 + 16), *(void *)(v1 + 416), *(void *)(v1 + 424), *(void (**)(uint64_t *))(v1 + 432), *(void *)(v1 + 440), *(void *)(v1 + 448));
}

void *initializeBufferWithCopyOfBuffer for FeaturizationConfig(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FeaturizationConfig()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for FeaturizationConfig(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for FeaturizationConfig(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for FeaturizationConfig()
{
  return &type metadata for FeaturizationConfig;
}

uint64_t destroy for DataHarvestingManager(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(a1 + 43));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DataHarvestingManager(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v30 = v4;
  BOOL v31 = *(void **)(a2 + 32);
  uint64_t v32 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v31;
  *(void *)(a1 + 40) = v32;
  uint64_t v33 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v33;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(_WORD *)(a1 + 73) = *(_WORD *)(a2 + 73);
  uint64_t v5 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  uint64_t v8 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v8;
  uint64_t v9 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v9;
  uint64_t v10 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v10;
  uint64_t v11 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v11;
  uint64_t v12 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v12;
  uint64_t v13 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v13;
  uint64_t v14 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v14;
  uint64_t v15 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v15;
  uint64_t v16 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v16;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  uint64_t v17 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v17;
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  uint64_t v18 = *(void *)(a2 + 328);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(void *)(a1 + 328) = v18;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  uint64_t v28 = a2 + 344;
  uint64_t v29 = a1 + 344;
  long long v19 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v19;
  uint64_t v20 = v19;
  BOOL v27 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
  swift_bridgeObjectRetain();
  id v21 = v30;
  id v22 = v31;
  id v23 = v32;
  id v24 = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27(v29, v28, v20);
  uint64_t v25 = *(void *)(a2 + 392);
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  *(void *)(a1 + 392) = v25;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DataHarvestingManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 40);
  uint64_t v11 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  id v12 = v10;

  uint64_t v13 = *(void **)(a2 + 48);
  uint64_t v14 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v13;
  id v15 = v13;

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DataHarvestingManager(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  uint64_t v7 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  uint64_t v8 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(unsigned char *)(a1 + 58) = *(unsigned char *)(a2 + 58);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(unsigned char *)(a1 + 74) = *(unsigned char *)(a2 + 74);
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v19;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 344);
  long long v20 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v20;
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for DataHarvestingManager()
{
  return &type metadata for DataHarvestingManager;
}

id *sub_258EA0D08(id *a1)
{
  return a1;
}

uint64_t sub_258EA0D38(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_258E7451C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_258EA0D7C()
{
  unint64_t result = qword_26A0D04F8;
  if (!qword_26A0D04F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D04F8);
  }
  return result;
}

uint64_t sub_258EA0DC4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

BOOL sub_258EA0DD4(void *a1)
{
  if (!a1) {
    return 1;
  }
  double v2 = *(double *)(v1 + 16);
  objc_msgSend(a1, sel_timestamp);
  return v3 <= v2;
}

uint64_t sub_258EA0E18()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

char *sub_258EA0E28(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258EA0F14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_258EA91A0();
  __break(1u);
  return result;
}

uint64_t sub_258EA1008(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_258EA106C()
{
  unint64_t result = qword_26A0D0540;
  if (!qword_26A0D0540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0540);
  }
  return result;
}

void *sub_258EA10C0(void *a1)
{
  double v3 = (void *)a1[3];
  double v2 = (void *)a1[4];
  uint64_t v5 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  swift_bridgeObjectRetain();
  id v6 = v3;
  id v7 = v2;
  id v8 = v5;
  id v9 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_258EA11E8(void *a1)
{
  id v6 = (void *)a1[3];
  uint64_t v4 = (void *)a1[5];
  uint64_t v5 = (void *)a1[4];
  double v3 = (void *)a1[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_258EA1324()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_258EA135C(uint64_t a1, uint64_t a2)
{
  sub_258E990FC(a1, a2, v2);
}

void sub_258EA1364(void *a1)
{
  sub_258E99294(a1, v1);
}

uint64_t getEnumTagSinglePayload for BatchFinalizationError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for BatchFinalizationError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x258EA145CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_258EA1484()
{
  return 0;
}

ValueMetadata *type metadata accessor for BatchFinalizationError()
{
  return &type metadata for BatchFinalizationError;
}

uint64_t destroy for SessionLabeledFeatureSnapshot()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SessionLabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SessionLabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for SessionLabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionLabeledFeatureSnapshot(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionLabeledFeatureSnapshot(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionLabeledFeatureSnapshot()
{
  return &type metadata for SessionLabeledFeatureSnapshot;
}

uint64_t initializeBufferWithCopyOfBuffer for LabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v3 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  id v4 = v3;
  return a1;
}

void destroy for LabeledFeatureSnapshot(uint64_t a1)
{
}

uint64_t assignWithCopy for LabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v3 = *(void **)(a2 + 8);
  id v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v3;
  id v5 = v3;

  return a1;
}

uint64_t assignWithTake for LabeledFeatureSnapshot(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t _s25PeopleSuggesterLighthouse19FeaturizationConfigVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_258EA1788(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LabeledFeatureSnapshot()
{
  return &type metadata for LabeledFeatureSnapshot;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EngagementType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EngagementType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x258EA193CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_258EA1964(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_258EA196C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EngagementType()
{
  return &type metadata for EngagementType;
}

unint64_t sub_258EA1988()
{
  unint64_t result = qword_26A0D05E8;
  if (!qword_26A0D05E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D05E8);
  }
  return result;
}

unint64_t sub_258EA19E0()
{
  unint64_t result = qword_26A0D05F0;
  if (!qword_26A0D05F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D05F0);
  }
  return result;
}

uint64_t sub_258EA1A78(uint64_t a1, char a2)
{
  if (!objc_msgSend(self, sel_isInternalDevice) || (a2 & 1) == 0 || a1 < 0xB) {
    return a1;
  }
  if (a1 <= 0x64) {
    return a1 - a1 % 0xAu;
  }
  if (a1 <= 0x3E8)
  {
    __int16 v5 = (unsigned __int16)a1 / 0x64u;
    __int16 v6 = 100;
  }
  else
  {
    uint64_t result = 10000;
    if (a1 > 0x2710) {
      return result;
    }
    __int16 v5 = (unsigned __int16)a1 / 0x3E8u;
    __int16 v6 = 1000;
  }
  return a1 - (unsigned __int16)(a1 - v5 * v6);
}

uint64_t sub_258EA1B3C()
{
  uint64_t v0 = sub_258EA8BB0();
  __swift_allocate_value_buffer(v0, qword_26A0D0790);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A0D0790);
  return sub_258EA8BA0();
}

uint64_t sub_258EA1BB0()
{
  return sub_258EA9290();
}

uint64_t sub_258EA1BF8()
{
  return sub_258EA9280();
}

uint64_t sub_258EA1C28()
{
  return sub_258EA9290();
}

uint64_t sub_258EA1C6C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_258EA45DC(*a1);
  *a2 = result;
  return result;
}

void sub_258EA1C98(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t sub_258EA1CB0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    uint64_t v3 = 0x72456D6F74737563;
  }
  else
  {
    sub_258EA9030();
    swift_bridgeObjectRelease();
    uint64_t v3 = 0x4664696C61766E69;
  }
  uint64_t v5 = v3;
  sub_258EA8C90();
  sub_258EA8C90();
  return v5;
}

uint64_t sub_258EA1D6C()
{
  return sub_258EA1CB0(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

void sub_258EA1D78()
{
  qword_26A0D07A8 = (uint64_t)&unk_2706EC618;
}

void *sub_258EA1D8C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0720);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_258EAA3B0;
  uint64_t v1 = sub_258E821D4();
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v2;
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v2;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_258E9C9D8(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v7 = v5[2];
    unint64_t v6 = v5[3];
    if (v7 >= v6 >> 1) {
      uint64_t v5 = sub_258E9C9D8((void *)(v6 > 1), v7 + 1, 1, v5);
    }
    uint64_t v5[2] = v7 + 1;
    int v8 = &v5[2 * v7];
    v8[4] = v3;
    v8[5] = v4;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  }
  swift_release();
  return v5;
}

uint64_t sub_258EA1E74(void *a1)
{
  id v1 = objc_msgSend(a1, sel_attachments);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = v1;
  sub_258EA367C();
  unint64_t v3 = sub_258EA8D40();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_4;
    }
LABEL_19:
    unint64_t v7 = (void *)MEMORY[0x263F8EE78];
LABEL_20:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v7;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_258EA9150();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    unint64_t v7 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x25A2D2D90](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      id v9 = v8;
      id v10 = objc_msgSend(v8, sel_uti);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_258EA8C50();
        uint64_t v14 = v13;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v7 = sub_258E9C9D8(0, v7[2] + 1, 1, v7);
        }
        unint64_t v16 = v7[2];
        unint64_t v15 = v7[3];
        if (v16 >= v15 >> 1) {
          unint64_t v7 = sub_258E9C9D8((void *)(v15 > 1), v16 + 1, 1, v7);
        }
        v7[2] = v16 + 1;
        uint64_t v17 = &v7[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
      }
      else
      {
      }
      ++v6;
    }
    while (v4 != v6);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

void *sub_258EA203C(void *a1)
{
  return sub_258EA279C(a1, (SEL *)&selRef_targetBundleId);
}

uint64_t sub_258EA2048(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0510);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_258EAA3B0;
  id v3 = objc_msgSend(self, sel_currentCalendar);
  uint64_t v4 = sub_258EA8AF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258EA8AB0();

  id v8 = objc_msgSend(a1, sel_startDate);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v8)
  {
    uint64_t v19 = sub_258EA8A80();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v11, 1, 1, v19);
    goto LABEL_7;
  }
  uint64_t v12 = sub_258EA8A80();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258EA8A40();

  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v11, v15, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if (result == 1)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  char v17 = sub_258EA8AA0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
  uint64_t v18 = 0x7961646B656577;
  if (v17) {
    uint64_t v18 = 0x646E656B656577;
  }
  *(void *)(v2 + 32) = v18;
  *(void *)(v2 + 40) = 0xE700000000000000;
  return v2;
}

uint64_t sub_258EA2374(uint64_t a1)
{
  return sub_258EA28C4(a1, sub_258E82608);
}

void *sub_258EA238C(void *a1)
{
  return sub_258EA279C(a1, (SEL *)&selRef_locationUUID);
}

uint64_t sub_258EA2398(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0510);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_258EAA3B0;
  id v3 = objc_msgSend(a1, sel_startDate);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3)
  {
    uint64_t v7 = sub_258EA8A80();
    uint64_t v8 = *(void *)(v7 - 8);
    MEMORY[0x270FA5388](v7);
    uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_258EA8A40();

    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
    if (result != 1)
    {
      uint64_t v29 = v2 + 32;
      uint64_t v12 = sub_258EA89D0();
      uint64_t v30 = v27;
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = MEMORY[0x270FA5388](v12);
      unint64_t v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v27[2] = v27;
      uint64_t v17 = MEMORY[0x270FA5388](v14);
      uint64_t v19 = (char *)v27 - v18;
      MEMORY[0x25A2D2600](v17);
      uint64_t v20 = sub_258EA89B0();
      v27[1] = v27;
      uint64_t v21 = *(void *)(v20 - 8);
      uint64_t v28 = v2;
      uint64_t v22 = v21;
      MEMORY[0x270FA5388](v20);
      id v24 = (char *)v27 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_258EA89A0();
      sub_258EA89C0();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v20);
      uint64_t v25 = *(void (**)(char *, uint64_t))(v13 + 8);
      v25(v19, v12);
      sub_258EA36BC();
      sub_258EA8A60();
      v25(v16, v12);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
      return v28;
    }
  }
  else
  {
    uint64_t v26 = sub_258EA8A80();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v6, 1, 1, v26);
  }
  __break(1u);
  return result;
}

void *sub_258EA2790(void *a1)
{
  return sub_258EA279C(a1, (SEL *)&selRef_bundleId);
}

void *sub_258EA279C(void *a1, SEL *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0720);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_258EAA3B0;
  id v5 = [a1 *a2];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_258EA8C50();
    uint64_t v9 = v8;

    *(void *)(inited + 32) = v7;
    *(void *)(inited + 40) = v9;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_258E9C9D8(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v12 = v10[2];
    unint64_t v11 = v10[3];
    if (v12 >= v11 >> 1) {
      uint64_t v10 = sub_258E9C9D8((void *)(v11 > 1), v12 + 1, 1, v10);
    }
    v10[2] = v12 + 1;
    uint64_t v13 = &v10[2 * v12];
    v13[4] = v7;
    v13[5] = v9;
  }
  else
  {
    *(void *)(inited + 32) = 0;
    *(void *)(inited + 40) = 0;
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  swift_release();
  return v10;
}

uint64_t sub_258EA28AC(uint64_t a1)
{
  return sub_258EA28C4(a1, (uint64_t (*)(void))sub_258E8284C);
}

uint64_t sub_258EA28C4(uint64_t a1, uint64_t (*a2)(void))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0510);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_258EAA3B0;
  *(void *)(v3 + 32) = a2();
  *(void *)(v3 + 40) = v4;
  return v3;
}

void *sub_258EA2928(void *a1)
{
  id v1 = objc_msgSend(a1, sel_keywords);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_258EA8D40();
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0730);
  sub_258EA3708();
  sub_258EA8F30();
  uint64_t v3 = sub_258EA91D0();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_258E9C9D8(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v8 = v6[2];
  unint64_t v7 = v6[3];
  if (v8 >= v7 >> 1) {
    uint64_t v6 = sub_258E9C9D8((void *)(v7 > 1), v8 + 1, 1, v6);
  }
  uint64_t v6[2] = v8 + 1;
  uint64_t v9 = &v6[2 * v8];
  v9[4] = v3;
  v9[5] = v5;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_258EA2A54(void *a1)
{
  uint64_t v2 = sub_258EA8AF0();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258EA8AC0();
  uint64_t v5 = sub_258EA8AD0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F07888], v5);
  id v9 = objc_msgSend(a1, sel_startDate);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v9)
  {
    uint64_t v26 = sub_258EA8A80();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v12, 1, 1, v26);
    goto LABEL_7;
  }
  uint64_t v13 = sub_258EA8A80();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_258EA8A40();

  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v12, v16, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (result == 1)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v18 = sub_258EA8AE0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v28);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_258E82B80(0, 1, 0);
  uint64_t v19 = v30;
  uint64_t v29 = v18;
  uint64_t v20 = sub_258EA91D0();
  uint64_t v22 = v21;
  unint64_t v24 = *(void *)(v19 + 16);
  unint64_t v23 = *(void *)(v19 + 24);
  if (v24 >= v23 >> 1)
  {
    sub_258E82B80(v23 > 1, v24 + 1, 1);
    uint64_t v19 = v30;
  }
  *(void *)(v19 + 16) = v24 + 1;
  uint64_t v25 = v19 + 16 * v24;
  *(void *)(v25 + 32) = v20;
  *(void *)(v25 + 40) = v22;
  return v19;
}

id sub_258EA2E3C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_attachments);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_258EA367C();
    unint64_t v3 = sub_258EA8D40();

    if (!(v3 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62))
    {
LABEL_3:
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_258EA9150();
  if (v4)
  {
LABEL_4:
    uint64_t v5 = 4;
    unint64_t v23 = 0x8000000258EB3E00;
    unint64_t v24 = v3 & 0xC000000000000001;
    uint64_t v22 = v4;
    while (1)
    {
      id result = v24 ? (id)MEMORY[0x25A2D2D90](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      uint64_t v7 = result;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = objc_msgSend(result, sel_uti);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = sub_258EA8C50();
        unint64_t v13 = v12;
      }
      else
      {
        uint64_t v11 = 0;
        unint64_t v13 = 0xE000000000000000;
      }
      uint64_t v27 = v11;
      unint64_t v28 = v13;
      unint64_t v25 = 0xD000000000000038;
      unint64_t v26 = v23;
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0740);
      MEMORY[0x270FA5388](v14 - 8);
      unint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = sub_258EA8A90();
      uint64_t v18 = 1;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
      sub_258EA3774();
      sub_258EA8F60();
      char v20 = v19;
      sub_258E81B50((uint64_t)v16, &qword_26A0D0740);

      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        goto LABEL_15;
      }
      ++v5;
      if (v8 == v22) {
        goto LABEL_14;
      }
    }
    __break(1u);
    return result;
  }
LABEL_14:
  uint64_t v18 = 0;
LABEL_15:
  swift_bridgeObjectRelease_n();
  return (id)v18;
}

id sub_258EA30C8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_attachments);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_258EA367C();
    unint64_t v3 = sub_258EA8D40();

    if (!(v3 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62))
    {
LABEL_3:
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_258EA9150();
  if (v4)
  {
LABEL_4:
    uint64_t v5 = 4;
    unint64_t v23 = 0x8000000258EB3E40;
    unint64_t v24 = v3 & 0xC000000000000001;
    uint64_t v22 = v4;
    while (1)
    {
      id result = v24 ? (id)MEMORY[0x25A2D2D90](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      uint64_t v7 = result;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = objc_msgSend(result, sel_uti);
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = sub_258EA8C50();
        unint64_t v13 = v12;
      }
      else
      {
        uint64_t v11 = 0;
        unint64_t v13 = 0xE000000000000000;
      }
      uint64_t v27 = v11;
      unint64_t v28 = v13;
      unint64_t v25 = 0xD00000000000002ALL;
      unint64_t v26 = v23;
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0740);
      MEMORY[0x270FA5388](v14 - 8);
      unint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v17 = sub_258EA8A90();
      uint64_t v18 = 1;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
      sub_258EA3774();
      sub_258EA8F60();
      char v20 = v19;
      sub_258E81B50((uint64_t)v16, &qword_26A0D0740);

      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0) {
        goto LABEL_15;
      }
      ++v5;
      if (v8 == v22) {
        goto LABEL_14;
      }
    }
    __break(1u);
    return result;
  }
LABEL_14:
  uint64_t v18 = 0;
LABEL_15:
  swift_bridgeObjectRelease_n();
  return (id)v18;
}

id sub_258EA3354(void *a1)
{
  id v1 = objc_msgSend(a1, sel_attachments);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_258EA367C();
    unint64_t v3 = sub_258EA8D40();

    if (!(v3 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62))
    {
LABEL_3:
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v4) {
        goto LABEL_4;
      }
LABEL_15:
      swift_bridgeObjectRelease_n();
      return (id)v4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_258EA9150();
  if (!v4) {
    goto LABEL_15;
  }
LABEL_4:
  uint64_t v19 = v4;
  unint64_t v20 = v3 & 0xC000000000000001;
  uint64_t v5 = 4;
  while (1)
  {
    id result = v20 ? (id)MEMORY[0x25A2D2D90](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
    uint64_t v8 = result;
    uint64_t v9 = v5 - 3;
    if (__OFADD__(v5 - 4, 1)) {
      break;
    }
    id v10 = objc_msgSend(result, sel_contentURL);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0320);
    MEMORY[0x270FA5388](v11 - 8);
    unint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v10)
    {
      uint64_t v14 = sub_258EA8950();
      uint64_t v21 = &v19;
      uint64_t v22 = v8;
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)(v14 - 8);
      MEMORY[0x270FA5388](v14);
      uint64_t v18 = (char *)&v19 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_258EA8920();

      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v18, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      uint64_t v8 = v22;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
      {
        sub_258E81B50((uint64_t)v13, &qword_26A0D0320);

        uint64_t v4 = 1;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v6 = sub_258EA8950();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v13, 1, 1, v6);
    }
    sub_258E81B50((uint64_t)v13, &qword_26A0D0320);

    ++v5;
    if (v9 == v19)
    {
      uint64_t v4 = 0;
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_258EA367C()
{
  unint64_t result = qword_26A0D03D0;
  if (!qword_26A0D03D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A0D03D0);
  }
  return result;
}

unint64_t sub_258EA36BC()
{
  unint64_t result = qword_26A0D0728;
  if (!qword_26A0D0728)
  {
    sub_258EA89D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0728);
  }
  return result;
}

unint64_t sub_258EA3708()
{
  unint64_t result = qword_26A0D0738;
  if (!qword_26A0D0738)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A0D03B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0738);
  }
  return result;
}

unint64_t sub_258EA3774()
{
  unint64_t result = qword_26A0D0748;
  if (!qword_26A0D0748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0748);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t getEnumTagSinglePayload for ItemInformation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ItemInformation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x258EA3988);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ItemInformation()
{
  return &type metadata for ItemInformation;
}

void destroy for CommunicationBehavior(uint64_t a1)
{
}

uint64_t *initializeWithCopy for CommunicationBehavior(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = (void *)a2[2];
  uint64_t v6 = a2[3];
  BOOL v7 = (void *)a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  unint64_t v11 = a2[8];
  uint64_t v13 = a2[9];
  sub_258E980B4(*a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = (uint64_t)v5;
  a1[3] = v6;
  a1[4] = (uint64_t)v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v13;
  return a1;
}

uint64_t *assignWithCopy for CommunicationBehavior(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = (void *)a2[2];
  uint64_t v6 = a2[3];
  BOOL v7 = (void *)a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  unint64_t v11 = a2[8];
  uint64_t v22 = a2[9];
  sub_258E980B4(*a2, v4, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v12 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  uint64_t v15 = a1[3];
  uint64_t v16 = (void *)a1[4];
  uint64_t v17 = a1[5];
  uint64_t v18 = a1[6];
  uint64_t v19 = a1[7];
  unint64_t v20 = a1[8];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = (uint64_t)v5;
  a1[3] = v6;
  a1[4] = (uint64_t)v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  a1[8] = v11;
  a1[9] = v22;
  sub_258E74288(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t *assignWithTake for CommunicationBehavior(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = a1[3];
  BOOL v7 = (void *)a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];
  unint64_t v11 = a1[8];
  long long v12 = a2[1];
  *(_OWORD *)a1 = *a2;
  *((_OWORD *)a1 + 1) = v12;
  long long v13 = a2[3];
  *((_OWORD *)a1 + 2) = a2[2];
  *((_OWORD *)a1 + 3) = v13;
  *((_OWORD *)a1 + 4) = a2[4];
  sub_258E74288(v3, v5, v4, v6, v7, v8, v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for CommunicationBehavior(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 48) >> 1;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for CommunicationBehavior(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 72) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      double result = 0.0;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)a1 = 0u;
      *(void *)(a1 + 48) = 2 * -a2;
      *(void *)(a1 + 56) = 0;
      *(void *)(a1 + 64) = 0;
      *(void *)(a1 + 72) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_258EA3C9C(uint64_t a1)
{
  return *(void *)(a1 + 64) >> 61;
}

uint64_t sub_258EA3CA8(uint64_t result)
{
  *(void *)(result + 64) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_258EA3CB8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 64) & 1 | (a2 << 61);
  *(void *)(result + 48) &= 1uLL;
  *(void *)(result + 64) = v2;
  return result;
}

ValueMetadata *type metadata accessor for CommunicationBehavior()
{
  return &type metadata for CommunicationBehavior;
}

uint64_t sub_258EA3CEC()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ShareSheetLighthousePluginError()
{
  return sub_258EA3D04();
}

uint64_t sub_258EA3D04()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s25PeopleSuggesterLighthouse31ShareSheetLighthousePluginErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_258EA3CEC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ShareSheetLighthousePluginError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_258EA3CEC();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_258EA3D04();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ShareSheetLighthousePluginError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_258EA3D04();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShareSheetLighthousePluginError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ShareSheetLighthousePluginError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_258EA3E98(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_258EA3EA0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShareSheetLighthousePluginError()
{
  return &type metadata for ShareSheetLighthousePluginError;
}

unint64_t sub_258EA3EC0()
{
  unint64_t result = qword_26A0D0750;
  if (!qword_26A0D0750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0750);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContextFactor(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContextFactor(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x258EA4070);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextFactor()
{
  return &type metadata for ContextFactor;
}

void *destroy for CountingMethod(void *result)
{
  if (*result >= 0xFFFFFFFFuLL) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t _s25PeopleSuggesterLighthouse14CountingMethodOwCP_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *assignWithCopy for CountingMethod(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for CountingMethod(void *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CountingMethod(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CountingMethod(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_258EA42B4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_258EA42CC(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CountingMethod()
{
  return &type metadata for CountingMethod;
}

uint64_t getEnumTagSinglePayload for AggregateProperty(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AggregateProperty(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_258EA434C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_258EA4368(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AggregateProperty()
{
  return &type metadata for AggregateProperty;
}

uint64_t getEnumTagSinglePayload for FeedbackType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FeedbackType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x258EA44F4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedbackType()
{
  return &type metadata for FeedbackType;
}

unint64_t sub_258EA4530()
{
  unint64_t result = qword_26A0D0758;
  if (!qword_26A0D0758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0758);
  }
  return result;
}

unint64_t sub_258EA4588()
{
  unint64_t result = qword_26A0D0760;
  if (!qword_26A0D0760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0760);
  }
  return result;
}

uint64_t sub_258EA45DC(unint64_t a1)
{
  if (a1 >= 5) {
    return 4;
  }
  else {
    return (0x302010004uLL >> (8 * a1));
  }
}

uint64_t sub_258EA4610(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_258EA9150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    uint64_t result = sub_258EA90B0();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v4 = 0;
        do
        {
          uint64_t v5 = v4 + 1;
          uint64_t v10 = (void *)MEMORY[0x25A2D2D90]();
          sub_258E7451C(0, &qword_26A0D0248);
          id v6 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03C0);
          swift_dynamicCast();
          swift_unknownObjectRelease();
          sub_258EA9090();
          sub_258EA90C0();
          sub_258EA90D0();
          sub_258EA90A0();
          uint64_t v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        BOOL v7 = (void **)(a1 + 32);
        sub_258E7451C(0, &qword_26A0D0248);
        do
        {
          int v8 = *v7++;
          id v9 = v8;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D03C0);
          swift_dynamicCast();

          sub_258EA9090();
          sub_258EA90C0();
          sub_258EA90D0();
          sub_258EA90A0();
          --v2;
        }
        while (v2);
      }
      return v11;
    }
  }
  return result;
}

uint64_t sub_258EA4820(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_258E82B60(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_258E82B60(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_258E82B60(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      sub_258E7D3AC(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_258EA4948(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_258EA9150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_258E82B60(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x25A2D2D90](i, a1);
        sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_258E82B60(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_258E82B60(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_258E7D3AC(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      long long v8 = (id *)(a1 + 32);
      sub_258E7451C(0, (unint64_t *)&qword_26A0D0218);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_258E82B60(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_258E82B60(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_258E7D3AC(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_258EA4BAC(id *a1, uint64_t a2, uint64_t *a3)
{
  id v6 = *a1;
  id v7 = objc_msgSend(*a1, sel_domainIdentifier);
  if (!v7)
  {
    char v25 = 0;
    return v25 & 1;
  }
  long long v8 = v7;
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v28 = sub_258EA8C50();
  uint64_t v33 = (uint64_t *)v9;

  uint64_t v10 = sub_258EA8A80();
  id v34 = &v28;
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v14 = objc_msgSend(v6, sel_startDate);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v18, 1, 1, v10);
    goto LABEL_8;
  }
  BOOL v31 = (char *)&v28 - v13;
  uint64_t v32 = v3;
  MEMORY[0x270FA5388](v16);
  sub_258EA8A40();

  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v19(v18, (char *)&v28 - v13, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v18, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v18, 1, v10) == 1)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    sub_258E81B50((uint64_t)v18, &qword_26A0D0370);
    char v25 = 0;
    return v25 & 1;
  }
  v19(v31, v18, v10);
  char v20 = sub_258E98DE0(v28, (uint64_t)v33, v29);
  uint64_t v21 = swift_bridgeObjectRelease();
  uint64_t v33 = &v28;
  MEMORY[0x270FA5388](v21);
  uint64_t v22 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v23 = *(uint64_t (**)(char *, uint64_t *, uint64_t))(v11 + 16);
  uint64_t v24 = v23(v22, v30, v10);
  uint64_t v30 = &v28;
  MEMORY[0x270FA5388](v24);
  v23(v22, (uint64_t *)v31, v10);
  if (v20)
  {
    sub_258EA4F6C();
    char v25 = sub_258EA8C20() ^ 1;
  }
  else
  {
    char v25 = 0;
  }
  unint64_t v26 = *(void (**)(char *, uint64_t))(v11 + 8);
  v26(v22, v10);
  v26(v22, v10);
  v26(v31, v10);
  return v25 & 1;
}

unint64_t sub_258EA4F6C()
{
  unint64_t result = qword_26A0D0438;
  if (!qword_26A0D0438)
  {
    sub_258EA8A80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A0D0438);
  }
  return result;
}

uint64_t sub_258EA4FBC@<X0>(uint64_t *a1@<X8>)
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_258EA9150()) {
    uint64_t result = sub_258EA8574(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t result = MEMORY[0x263F8EE88];
  }
  *a1 = result;
  return result;
}

uint64_t sub_258EA5018(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0278);
  uint64_t result = sub_258EA9170();
  uint64_t v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v33 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  uint64_t v5 = v7;
  uint64_t v8 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v5;
  uint64_t v30 = v6;
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v32 = result + 64;
  if ((v9 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  int64_t v35 = v4;
  for (unint64_t i = v11 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v15 << 6))
  {
    uint64_t v17 = (uint64_t *)(*(void *)(v33 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = *(void *)(*(void *)(v33 + 56) + 8 * i);
    if ((v20 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_258EA8FC0();
      if (!v21) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v21 = *(void *)(v20 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v21)
      {
LABEL_26:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v22 = (void *)MEMORY[0x263F8EE78];
        goto LABEL_30;
      }
    }
    if (v21 <= 0)
    {
      uint64_t v22 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0500);
      uint64_t v22 = (void *)swift_allocObject();
      int64_t v23 = _swift_stdlib_malloc_size(v22);
      uint64_t v24 = v23 - 32;
      if (v23 < 32) {
        uint64_t v24 = v23 - 25;
      }
      v22[2] = v21;
      v22[3] = (2 * (v24 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    char v25 = sub_258EA530C(&v34, v22 + 4, v21, v20);
    uint64_t result = sub_258E7E4E8();
    if (v25 != (void *)v21) {
      goto LABEL_35;
    }
    uint64_t result = swift_bridgeObjectRelease();
LABEL_30:
    *(void *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    unint64_t v26 = (void *)(v3[6] + 16 * i);
    *unint64_t v26 = v18;
    v26[1] = v19;
    *(void *)(v3[7] + 8 * i) = v22;
    uint64_t v27 = v3[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28)
    {
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v3[2] = v29;
    int64_t v4 = v35;
    if (v10) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_36;
    }
    if (v13 >= v31) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v30 + 8 * v13);
    int64_t v15 = v4 + 1;
    if (!v14)
    {
      int64_t v15 = v4 + 2;
      if (v4 + 2 >= v31) {
        return (uint64_t)v3;
      }
      unint64_t v14 = *(void *)(v30 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v4 + 3;
        if (v4 + 3 >= v31) {
          return (uint64_t)v3;
        }
        unint64_t v14 = *(void *)(v30 + 8 * v15);
        if (!v14) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v14 - 1) & v14;
    int64_t v35 = v15;
  }
  uint64_t v16 = v4 + 4;
  if (v4 + 4 >= v31) {
    return (uint64_t)v3;
  }
  unint64_t v14 = *(void *)(v30 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v4 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v31) {
      return (uint64_t)v3;
    }
    unint64_t v14 = *(void *)(v30 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_258EA530C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v24 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_258EA8FB0();
    sub_258E7451C(0, &qword_26A0D05C0);
    sub_258E743FC(&qword_26A0D0768, &qword_26A0D05C0);
    uint64_t result = (void *)sub_258EA8E30();
    uint64_t v4 = v27;
    uint64_t v7 = v28;
    uint64_t v8 = v29;
    int64_t v9 = v30;
    unint64_t v10 = v31;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v11 = 0;
    goto LABEL_38;
  }
  int64_t v9 = 0;
  uint64_t v19 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v7 = a4 + 56;
  uint64_t v8 = ~v19;
  uint64_t v20 = -v19;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  else {
    uint64_t v21 = -1;
  }
  unint64_t v10 = v21 & *(void *)(a4 + 56);
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v11 = 0;
LABEL_38:
    uint64_t v22 = v24;
LABEL_41:
    *uint64_t v22 = v4;
    v22[1] = v7;
    v22[2] = v8;
    v22[3] = v9;
    v22[4] = v10;
    return (void *)v11;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v11 = 0;
  int64_t v25 = (unint64_t)(v8 + 64) >> 6;
  uint64_t v23 = v8;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_258EA8FE0()) {
        goto LABEL_40;
      }
      sub_258E7451C(0, &qword_26A0D05C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v14 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_40;
      }
      goto LABEL_8;
    }
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_7;
    }
    int64_t v15 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      break;
    }
    if (v15 >= v25)
    {
      unint64_t v10 = 0;
      goto LABEL_40;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v15);
    if (v16) {
      goto LABEL_23;
    }
    int64_t v17 = v9 + 2;
    if (v9 + 2 >= v25)
    {
      unint64_t v10 = 0;
      ++v9;
      goto LABEL_40;
    }
    unint64_t v16 = *(void *)(v7 + 8 * v17);
    if (!v16)
    {
      if (v9 + 3 >= v25) {
        goto LABEL_44;
      }
      unint64_t v16 = *(void *)(v7 + 8 * (v9 + 3));
      if (v16)
      {
        int64_t v15 = v9 + 3;
        goto LABEL_23;
      }
      int64_t v17 = v9 + 4;
      if (v9 + 4 >= v25)
      {
        unint64_t v10 = 0;
        v9 += 3;
        goto LABEL_40;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v17);
      if (!v16)
      {
        int64_t v15 = v9 + 5;
        if (v9 + 5 >= v25)
        {
LABEL_44:
          unint64_t v10 = 0;
          int64_t v9 = v17;
          goto LABEL_40;
        }
        unint64_t v16 = *(void *)(v7 + 8 * v15);
        if (!v16)
        {
          int64_t v18 = v9 + 6;
          while (v25 != v18)
          {
            unint64_t v16 = *(void *)(v7 + 8 * v18++);
            if (v16)
            {
              int64_t v15 = v18 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v10 = 0;
          int64_t v9 = v25 - 1;
          goto LABEL_40;
        }
        goto LABEL_23;
      }
    }
    int64_t v15 = v17;
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v13 = __clz(__rbit64(v16)) + (v15 << 6);
    int64_t v9 = v15;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v13);
    id v14 = result;
    if (!result) {
      goto LABEL_40;
    }
LABEL_8:
    ++v11;
    *v6++ = v14;
    if (v11 == a3)
    {
      uint64_t v11 = a3;
LABEL_40:
      uint64_t v8 = v23;
      uint64_t v22 = v24;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

void sub_258EA5620(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D05E0);
      uint64_t v3 = sub_258EA9020();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_258EA9150();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v42 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v40 = v1;
    while (1)
    {
      uint64_t v9 = MEMORY[0x25A2D2D90](v8, v1);
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v11 = v9;
      uint64_t v12 = sub_258EA8F10();
      uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_258EA8B30();
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = sub_258EA8F20();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          unint64_t v1 = v40;
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_258EA8F20();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v40;
      }
      *(void *)(v7 + 8 * v15) = v17 | v16;
      *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    id v26 = *(id *)(v1 + 32 + 8 * v25);
    uint64_t v27 = sub_258EA8F10();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_258EA8B30();
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_258EA8F20();

      if (v34) {
        goto LABEL_24;
      }
      uint64_t v35 = ~v28;
      unint64_t v29 = (v29 + 1) & v35;
      unint64_t v30 = v29 >> 6;
      uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
      uint64_t v32 = 1 << v29;
      if ((v31 & (1 << v29)) != 0)
      {
        while (1)
        {
          id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
          char v37 = sub_258EA8F20();

          if (v37) {
            break;
          }
          unint64_t v29 = (v29 + 1) & v35;
          unint64_t v30 = v29 >> 6;
          uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
          uint64_t v32 = 1 << v29;
          if ((v31 & (1 << v29)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v5 = v42;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v5 = v42;
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_39;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_258EA5978(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, id a9)
{
  unint64_t v56 = MEMORY[0x263F8EE78];
  if (a1 && *(void *)(a1 + 16))
  {
    sub_258E7451C(0, &qword_26A0D0210);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D04D0);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_258EAA3B0;
    sub_258EA4820(a1);
    id v14 = objc_allocWithZone(MEMORY[0x263EFFA00]);
    unint64_t v15 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v14, sel_initWithArray_, v15);

    *(void *)(v13 + 56) = sub_258E7451C(0, &qword_26A0D0778);
    *(void *)(v13 + 64) = sub_258E743FC(&qword_26A0D0780, &qword_26A0D0778);
    *(void *)(v13 + 32) = v16;
    sub_258EA8E60();
    MEMORY[0x25A2D2A50]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_258EA8D70();
    }
    sub_258EA8D90();
    sub_258EA8D60();
  }
  if (a2)
  {
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_258EA9150();
      swift_bridgeObjectRelease();
      if (!v50) {
        goto LABEL_12;
      }
    }
    else if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_12;
    }
    sub_258E7451C(0, &qword_26A0D0210);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D04D0);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_258EAA3B0;
    sub_258EA4948(a2);
    id v18 = objc_allocWithZone(MEMORY[0x263EFFA00]);
    char v19 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v18, sel_initWithArray_, v19);

    *(void *)(v17 + 56) = sub_258E7451C(0, &qword_26A0D0778);
    *(void *)(v17 + 64) = sub_258E743FC(&qword_26A0D0780, &qword_26A0D0778);
    *(void *)(v17 + 32) = v20;
    sub_258EA8E60();
    MEMORY[0x25A2D2A50]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_258EA8D70();
    }
    sub_258EA8D90();
    sub_258EA8D60();
  }
LABEL_12:
  if (a3)
  {
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_258EA9150();
      swift_bridgeObjectRelease();
      if (v51) {
        goto LABEL_15;
      }
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_15:
      sub_258E7451C(0, &qword_26A0D0210);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D04D0);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_258EAA3B0;
      sub_258EA4948(a3);
      id v22 = objc_allocWithZone(MEMORY[0x263EFFA00]);
      uint64_t v23 = (void *)sub_258EA8D30();
      swift_bridgeObjectRelease();
      id v24 = objc_msgSend(v22, sel_initWithArray_, v23);

      *(void *)(v21 + 56) = sub_258E7451C(0, &qword_26A0D0778);
      *(void *)(v21 + 64) = sub_258E743FC(&qword_26A0D0780, &qword_26A0D0778);
      *(void *)(v21 + 32) = v24;
      sub_258EA8E60();
      MEMORY[0x25A2D2A50]();
      if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_258EA8D70();
      }
      sub_258EA8D90();
      sub_258EA8D60();
    }
  }
  if (a4 && *(void *)(a4 + 16))
  {
    sub_258E7451C(0, &qword_26A0D0210);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D04D0);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_258EAA3B0;
    sub_258EA4820(a4);
    id v26 = objc_allocWithZone(MEMORY[0x263EFFA00]);
    uint64_t v27 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(v26, sel_initWithArray_, v27);

    *(void *)(v25 + 56) = sub_258E7451C(0, &qword_26A0D0778);
    *(void *)(v25 + 64) = sub_258E743FC(&qword_26A0D0780, &qword_26A0D0778);
    *(void *)(v25 + 32) = v28;
    sub_258EA8E60();
    MEMORY[0x25A2D2A50]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_258EA8D70();
    }
    sub_258EA8D90();
    sub_258EA8D60();
  }
  if (a5 && *(void *)(a5 + 16))
  {
    sub_258E7451C(0, &qword_26A0D0210);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D04D0);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_258EAA3B0;
    sub_258EA4820(a5);
    id v30 = objc_allocWithZone(MEMORY[0x263EFFA00]);
    uint64_t v31 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v30, sel_initWithArray_, v31);

    *(void *)(v29 + 56) = sub_258E7451C(0, &qword_26A0D0778);
    *(void *)(v29 + 64) = sub_258E743FC(&qword_26A0D0780, &qword_26A0D0778);
    *(void *)(v29 + 32) = v32;
    sub_258EA8E60();
    MEMORY[0x25A2D2A50]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_258EA8D70();
    }
    sub_258EA8D90();
    sub_258EA8D60();
  }
  if (a7) {
    goto LABEL_31;
  }
  sub_258E7451C(0, &qword_26A0D0210);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D04D0);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_258EAA3B0;
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF908]), sel_initWithTimeIntervalSinceNow_, COERCE_DOUBLE(a6 ^ 0x8000000000000000));
  *(void *)(v33 + 56) = sub_258E7451C(0, &qword_26A0D0220);
  *(void *)(v33 + 64) = sub_258E743FC((unint64_t *)&unk_26A0D04E0, &qword_26A0D0220);
  *(void *)(v33 + 32) = v34;
  sub_258EA8E60();
  MEMORY[0x25A2D2A50]();
  if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_48;
  }
  while (1)
  {
    sub_258EA8D90();
    sub_258EA8D60();
LABEL_31:
    if (v56 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_258EA9150();
      swift_bridgeObjectRelease();
      if (!v35)
      {
LABEL_41:
        swift_bridgeObjectRelease();
        sub_258E741E0();
        swift_allocError();
        *(void *)uint64_t v48 = 0xD00000000000001CLL;
        *(void *)(v48 + 8) = 0x8000000258EB3EC0;
        *(unsigned char *)(v48 + 16) = 1;
        swift_willThrow();
        return v35;
      }
    }
    else
    {
      uint64_t v35 = *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v35) {
        goto LABEL_41;
      }
    }
    sub_258E7451C(0, &qword_26A0D0210);
    id v36 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    id v37 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v36);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A0D05D0);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_258EAA3B0;
    id v39 = objc_allocWithZone(MEMORY[0x263F08B28]);
    unint64_t v40 = (void *)sub_258EA8C30();
    id v41 = objc_msgSend(v39, sel_initWithKey_ascending_, v40, 0);

    *(void *)(v38 + 56) = sub_258E7451C(0, &qword_26A0D0770);
    *(void *)(v38 + 32) = v41;
    uint64_t v42 = (void *)sub_258EA8D30();
    swift_bridgeObjectRelease();
    if ((a8 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_48:
    sub_258EA8D70();
  }
  id v43 = objc_msgSend(a9, sel_lh_queryInteractionsUsingPredicate_sortDescriptors_limit_error_, v37, v42);

  uint64_t v35 = 0;
  if (v43)
  {
    uint64_t v44 = sub_258EA8D40();
    id v45 = 0;

    uint64_t v35 = sub_258E824EC(v44);
    swift_bridgeObjectRelease();
    if (v35)
    {

      return v35;
    }
    sub_258E741E0();
    swift_allocError();
    *(void *)uint64_t v47 = 0xD00000000000002ALL;
    *(void *)(v47 + 8) = 0x8000000258EB33A0;
    *(unsigned char *)(v47 + 16) = 1;
  }
  else
  {
    id v46 = 0;
    sub_258EA88E0();
  }
  swift_willThrow();

  return v35;
}

uint64_t sub_258EA6540(unint64_t a1, char a2)
{
  void *(*v294)(void *__return_ptr, void);
  void *(*v295)(void *__return_ptr, void);
  void *(*v296)(void *__return_ptr, void);
  void *(*v297)(void *__return_ptr, void);
  void *(*v298)(void *__return_ptr, void);
  uint64_t v299;
  uint64_t v300;
  void *(*v302)(void *__return_ptr, void);
  void *(*v303)(void *__return_ptr, void);
  void *(*v304)(void *__return_ptr, void);
  void *(*v305)(void *__return_ptr, void);
  void *(*v306)(void *__return_ptr, void);
  unint64_t v307;
  uint64_t v308;
  id v309;
  unint64_t v310;
  uint64_t v311;
  uint64_t v312;
  unint64_t v313;
  unint64_t v314;
  char *v315;
  void *(**v316)(void *__return_ptr, void);
  unint64_t v317;
  id v318;
  void *(**v319)(void *__return_ptr, void);
  char *v320;
  id v321;
  void *v322;
  uint64_t v323[3];

  LOBYTE(v2) = a2;
  unint64_t v3 = a1;
  v310 = a1;
  if (a1 >> 62) {
    goto LABEL_197;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v5 = v4;
  if (!v4)
  {
LABEL_198:
    swift_bridgeObjectRelease();
    v295 = 0;
    v296 = 0;
    v298 = 0;
    v297 = 0;
    v294 = 0;
    goto LABEL_199;
  }
LABEL_3:
  v305 = 0;
  v306 = 0;
  v302 = 0;
  v303 = 0;
  v304 = 0;
  unint64_t v6 = 0;
  v313 = v3 & 0xC000000000000001;
  v307 = v3 + 32;
  v308 = v3 & 0xFFFFFFFFFFFFFF8;
  v322 = (void *)MEMORY[0x263F8EE80];
  v311 = v5;
  v312 = v2;
  while (2)
  {
    if (v313)
    {
      id v7 = (id)MEMORY[0x25A2D2D90](v6, v3);
    }
    else
    {
      if (v6 >= *(void *)(v308 + 16)) {
        goto LABEL_192;
      }
      id v7 = *(id *)(v307 + 8 * v6);
    }
    id v8 = v7;
    BOOL v9 = __OFADD__(v6++, 1);
    if (v9) {
      goto LABEL_185;
    }
    v317 = v6;
    v321 = v7;
    switch(v312)
    {
      case 1:
        id v138 = objc_msgSend(v7, sel_attachments);
        if (!v138) {
          goto LABEL_109;
        }
        uint64_t v139 = v138;
        sub_258E7451C(0, (unint64_t *)&qword_26A0D03D0);
        unint64_t v140 = sub_258EA8D40();

        if (v140 >> 62)
        {
          swift_bridgeObjectRetain_n();
          id v141 = (id)sub_258EA9150();
          swift_bridgeObjectRelease();
          if (v141)
          {
LABEL_91:
            v319 = (void *(**)(void *__return_ptr, void))v140;
            v320 = (char *)(v140 & 0xC000000000000001);
            uint64_t v142 = 4;
            v318 = v141;
            while (1)
            {
              id v144 = v320 ? (id)MEMORY[0x25A2D2D90](v142 - 4, v140) : *(id *)(v140 + 8 * v142);
              uint64_t v145 = v144;
              uint64_t v2 = v142 - 3;
              if (__OFADD__(v142 - 4, 1)) {
                goto LABEL_183;
              }
              id v146 = objc_msgSend(v144, sel_photoSceneDescriptor);
              if (v146)
              {
                uint64_t v147 = v146;
                uint64_t v148 = sub_258EA8C50();
                uint64_t v150 = v149;

                id v151 = v8;
                uint64_t v152 = (uint64_t)v322;
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                v323[0] = v152;
                unint64_t v155 = sub_258E78DD0(v148, v150);
                uint64_t v156 = *(void *)(v152 + 16);
                BOOL v157 = (v154 & 1) == 0;
                uint64_t v158 = v156 + v157;
                if (__OFADD__(v156, v157)) {
                  goto LABEL_188;
                }
                char v159 = v154;
                if (*(void *)(v152 + 24) >= v158)
                {
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                    sub_258E7C880();
                  }
                }
                else
                {
                  sub_258E7A174(v158, isUniquelyReferenced_nonNull_native);
                  unint64_t v160 = sub_258E78DD0(v148, v150);
                  if ((v159 & 1) != (v161 & 1)) {
                    goto LABEL_208;
                  }
                  unint64_t v155 = v160;
                }
                v162 = (void *)v323[0];
                swift_bridgeObjectRelease();
                if ((v159 & 1) == 0)
                {
                  swift_bridgeObjectRetain();
                  sub_258EA4FBC(v323);
                  uint64_t v163 = v323[0];
                  v162[(v155 >> 6) + 8] |= 1 << v155;
                  v164 = (uint64_t *)(v162[6] + 16 * v155);
                  uint64_t *v164 = v148;
                  v164[1] = v150;
                  *(void *)(v162[7] + 8 * v155) = v163;
                  uint64_t v165 = v162[2];
                  BOOL v9 = __OFADD__(v165, 1);
                  uint64_t v166 = v165 + 1;
                  if (v9) {
                    goto LABEL_191;
                  }
                  v162[2] = v166;
                }
                swift_bridgeObjectRetain();
                v322 = v162;
                swift_bridgeObjectRelease();
                sub_258E9DED8(v323, v151);
                swift_bridgeObjectRelease();
                unint64_t v143 = (void *)v323[0];

                id v8 = v321;
                id v141 = v318;
                unint64_t v140 = (unint64_t)v319;
              }
              else
              {
              }
              ++v142;
              if ((id)v2 == v141) {
                goto LABEL_4;
              }
            }
          }
        }
        else
        {
          id v141 = *(id *)((v140 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v141) {
            goto LABEL_91;
          }
        }
        goto LABEL_4;
      case 2:
        id v54 = objc_msgSend(v7, sel_attachments);
        if (!v54) {
          goto LABEL_109;
        }
        uint64_t v55 = v54;
        sub_258E7451C(0, (unint64_t *)&qword_26A0D03D0);
        unint64_t v56 = sub_258EA8D40();

        if (!(v56 >> 62))
        {
          id v57 = *(id *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v57) {
            goto LABEL_40;
          }
          goto LABEL_4;
        }
        swift_bridgeObjectRetain_n();
        id v57 = (id)sub_258EA9150();
        swift_bridgeObjectRelease();
        if (!v57) {
          goto LABEL_4;
        }
LABEL_40:
        v319 = (void *(**)(void *__return_ptr, void))v56;
        v320 = (char *)(v56 & 0xC000000000000001);
        uint64_t v58 = 4;
        v318 = v57;
        while (1)
        {
          id v60 = v320 ? (id)MEMORY[0x25A2D2D90](v58 - 4, v56) : *(id *)(v56 + 8 * v58);
          uint64_t v61 = v60;
          uint64_t v2 = v58 - 3;
          if (__OFADD__(v58 - 4, 1)) {
            goto LABEL_184;
          }
          id v62 = objc_msgSend(v60, sel_uti);
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = sub_258EA8C50();
            uint64_t v66 = v65;

            id v67 = v8;
            uint64_t v68 = (uint64_t)v322;
            char v69 = swift_isUniquelyReferenced_nonNull_native();
            v323[0] = v68;
            unint64_t v71 = sub_258E78DD0(v64, v66);
            uint64_t v72 = *(void *)(v68 + 16);
            BOOL v73 = (v70 & 1) == 0;
            uint64_t v74 = v72 + v73;
            if (__OFADD__(v72, v73)) {
              goto LABEL_187;
            }
            char v75 = v70;
            if (*(void *)(v68 + 24) >= v74)
            {
              if ((v69 & 1) == 0) {
                sub_258E7C880();
              }
            }
            else
            {
              sub_258E7A174(v74, v69);
              unint64_t v76 = sub_258E78DD0(v64, v66);
              if ((v75 & 1) != (v77 & 1)) {
                goto LABEL_208;
              }
              unint64_t v71 = v76;
            }
            uint64_t v78 = (void *)v323[0];
            swift_bridgeObjectRelease();
            if ((v75 & 1) == 0)
            {
              swift_bridgeObjectRetain();
              sub_258EA4FBC(v323);
              uint64_t v79 = v323[0];
              v78[(v71 >> 6) + 8] |= 1 << v71;
              uint64_t v80 = (uint64_t *)(v78[6] + 16 * v71);
              *uint64_t v80 = v64;
              v80[1] = v66;
              *(void *)(v78[7] + 8 * v71) = v79;
              uint64_t v81 = v78[2];
              BOOL v9 = __OFADD__(v81, 1);
              uint64_t v82 = v81 + 1;
              if (v9) {
                goto LABEL_190;
              }
              v78[2] = v82;
            }
            swift_bridgeObjectRetain();
            v322 = v78;
            swift_bridgeObjectRelease();
            sub_258E9DED8(v323, v67);
            swift_bridgeObjectRelease();
            id v59 = (void *)v323[0];

            id v8 = v321;
            id v57 = v318;
            unint64_t v56 = (unint64_t)v319;
          }
          else
          {
          }
          ++v58;
          if ((id)v2 == v57) {
            goto LABEL_4;
          }
        }
      case 3:
        id v83 = objc_msgSend(v7, sel_attachments);
        if (!v83)
        {

          goto LABEL_176;
        }
        id v84 = v83;
        sub_258E7451C(0, (unint64_t *)&qword_26A0D03D0);
        unint64_t v85 = sub_258EA8D40();

        uint64_t v2 = v85;
        v314 = v85;
        if (!(v85 >> 62))
        {
          uint64_t v86 = *(void *)((v85 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v86) {
            goto LABEL_61;
          }
          goto LABEL_174;
        }
        swift_bridgeObjectRetain_n();
        uint64_t v2 = v314;
        uint64_t v86 = sub_258EA9150();
        swift_bridgeObjectRelease();
        if (!v86)
        {
LABEL_174:

          swift_bridgeObjectRelease_n();
          goto LABEL_175;
        }
LABEL_61:
        v315 = (char *)v86;
        v316 = (void *(**)(void *__return_ptr, void))(v2 & 0xC000000000000001);
        uint64_t v87 = 4;
        while (1)
        {
          if (v316) {
            id v88 = (id)MEMORY[0x25A2D2D90](v87 - 4, v2);
          }
          else {
            id v88 = *(id *)(v2 + 8 * v87);
          }
          uint64_t v89 = v88;
          if (__OFADD__(v87 - 4, 1))
          {
            __break(1u);
            goto LABEL_182;
          }
          v320 = (char *)(v87 - 3);
          uint64_t v90 = sub_258EA8950();
          v319 = &v302;
          uint64_t v91 = *(void *)(v90 - 8);
          uint64_t v92 = *(void *)(v91 + 64);
          MEMORY[0x270FA5388](v90);
          unint64_t v93 = (v92 + 15) & 0xFFFFFFFFFFFFFFF0;
          uint64_t v94 = (char *)&v302 - v93;
          v318 = v89;
          id v95 = objc_msgSend(v89, sel_contentURL);
          uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0320);
          uint64_t v97 = MEMORY[0x270FA5388](v96 - 8);
          unint64_t v99 = (char *)&v302 - ((v98 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (!v95) {
            break;
          }
          MEMORY[0x270FA5388](v97);
          BOOL v100 = (char *)&v302 - v93;
          sub_258EA8920();

          id v101 = *(void (**)(char *, char *, uint64_t))(v91 + 32);
          v101(v99, v100, v90);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v91 + 56))(v99, 0, 1, v90);
          uint64_t v2 = v314;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v99, 1, v90) == 1) {
            goto LABEL_63;
          }
          v101(v94, v99, v90);
          sub_258EA8930();
          uint64_t v103 = v102;
          swift_bridgeObjectRelease();
          if (v103)
          {
            uint64_t v104 = sub_258EA88F0();
            uint64_t v106 = v105;
            v309 = v321;
            uint64_t v107 = (uint64_t)v322;
            char v108 = swift_isUniquelyReferenced_nonNull_native();
            v323[0] = v107;
            uint64_t v2 = v104;
            unint64_t v110 = sub_258E78DD0(v104, v106);
            uint64_t v111 = *(void *)(v107 + 16);
            BOOL v112 = (v109 & 1) == 0;
            uint64_t v113 = v111 + v112;
            if (__OFADD__(v111, v112)) {
              goto LABEL_193;
            }
            char v114 = v109;
            if (*(void *)(v107 + 24) >= v113)
            {
              if ((v108 & 1) == 0) {
                sub_258E7C880();
              }
            }
            else
            {
              sub_258E7A174(v113, v108);
              unint64_t v115 = sub_258E78DD0(v2, v106);
              if ((v114 & 1) != (v116 & 1)) {
                goto LABEL_208;
              }
              unint64_t v110 = v115;
            }
            uint64_t v117 = (void *)v323[0];
            swift_bridgeObjectRelease();
            if ((v114 & 1) == 0)
            {
              swift_bridgeObjectRetain();
              sub_258EA4FBC(v323);
              uint64_t v118 = v323[0];
              v117[(v110 >> 6) + 8] |= 1 << v110;
              unint64_t v119 = (uint64_t *)(v117[6] + 16 * v110);
              uint64_t *v119 = v2;
              v119[1] = v106;
              *(void *)(v117[7] + 8 * v110) = v118;
              uint64_t v120 = v117[2];
              BOOL v9 = __OFADD__(v120, 1);
              uint64_t v121 = v120 + 1;
              if (v9) {
                goto LABEL_194;
              }
              long long v117[2] = v121;
            }
            swift_bridgeObjectRetain();
            v322 = v117;
            swift_bridgeObjectRelease();
            sub_258E9DED8(v323, v309);
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v91 + 8))(v94, v90);
            long long v122 = (void *)v323[0];

            uint64_t v2 = v314;
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v91 + 8))(v94, v90);
          }
LABEL_64:
          ++v87;
          id v8 = v321;
          unint64_t v6 = v317;
          if (v320 == v315) {
            goto LABEL_174;
          }
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v91 + 56))(v99, 1, 1, v90);
LABEL_63:
        sub_258E81B50((uint64_t)v99, &qword_26A0D0320);

        goto LABEL_64;
      case 4:
        id v39 = objc_msgSend(v7, sel_bundleId);
        if (!v39) {
          goto LABEL_109;
        }
        unint64_t v40 = v39;
        uint64_t v41 = sub_258EA8C50();
        uint64_t v2 = v42;

        id v43 = v8;
        sub_258E743A8((uint64_t)v306);
        uint64_t v44 = (uint64_t)v322;
        char v45 = swift_isUniquelyReferenced_nonNull_native();
        v323[0] = v44;
        unint64_t v47 = sub_258E78DD0(v41, v2);
        uint64_t v48 = *(void *)(v44 + 16);
        BOOL v49 = (v46 & 1) == 0;
        uint64_t v50 = v48 + v49;
        if (__OFADD__(v48, v49)) {
          goto LABEL_195;
        }
        char v51 = v46;
        if (*(void *)(v44 + 24) >= v50)
        {
          if ((v45 & 1) == 0) {
            sub_258E7C880();
          }
        }
        else
        {
          sub_258E7A174(v50, v45);
          unint64_t v52 = sub_258E78DD0(v41, v2);
          if ((v51 & 1) != (v53 & 1)) {
            goto LABEL_208;
          }
          unint64_t v47 = v52;
        }
        v259 = (void *)v323[0];
        swift_bridgeObjectRelease();
        if (v51) {
          goto LABEL_144;
        }
        uint64_t v260 = swift_bridgeObjectRetain();
        sub_258EA4FB8(v323, v260);
        uint64_t v261 = v323[0];
        v259[(v47 >> 6) + 8] |= 1 << v47;
        v262 = (uint64_t *)(v259[6] + 16 * v47);
        uint64_t *v262 = v41;
        v262[1] = v2;
        *(void *)(v259[7] + 8 * v47) = v261;
        uint64_t v263 = v259[2];
        BOOL v9 = __OFADD__(v263, 1);
        uint64_t v264 = v263 + 1;
        if (v9) {
          goto LABEL_203;
        }
        v259[2] = v264;
LABEL_144:
        swift_bridgeObjectRetain();
        v322 = v259;
        swift_bridgeObjectRelease();
        sub_258E9DED8(v323, v43);
        v265 = (void *)v323[0];
        swift_bridgeObjectRelease();

        v306 = sub_258EA4FB8;
        goto LABEL_175;
      case 5:
        uint64_t v167 = sub_258EA8A80();
        uint64_t v168 = *(void *)(v167 - 8);
        uint64_t v169 = *(void *)(v168 + 64);
        MEMORY[0x270FA5388](v167);
        unint64_t v170 = (v169 + 15) & 0xFFFFFFFFFFFFFFF0;
        v320 = (char *)&v302 - v170;
        id v171 = objc_msgSend(v8, sel_startDate);
        uint64_t v172 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
        uint64_t v173 = MEMORY[0x270FA5388](v172 - 8);
        uint64_t v2 = (uint64_t)&v302 - ((v174 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (!v171) {
          goto LABEL_134;
        }
        MEMORY[0x270FA5388](v173);
        v175 = (char *)&v302 - v170;
        sub_258EA8A40();

        v176 = *(void (**)(uint64_t, char *, uint64_t))(v168 + 32);
        v176(v2, v175, v167);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v168 + 56))(v2, 0, 1, v167);
        id v8 = v321;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v168 + 48))(v2, 1, v167) == 1) {
          goto LABEL_135;
        }
        v316 = &v302;
        v176((uint64_t)v320, (char *)v2, v167);
        uint64_t v177 = sub_258EA8AF0();
        v319 = &v302;
        uint64_t v178 = *(void *)(v177 - 8);
        MEMORY[0x270FA5388](v177);
        v180 = (char *)&v302 - ((v179 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_258EA8AC0();
        uint64_t v181 = sub_258EA8AD0();
        v318 = &v302;
        uint64_t v182 = *(void *)(v181 - 8);
        MEMORY[0x270FA5388](v181);
        v184 = (char *)&v302 - ((v183 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, void, uint64_t))(v182 + 104))(v184, *MEMORY[0x263F07888], v181);
        uint64_t v185 = sub_258EA8AE0();
        (*(void (**)(char *, uint64_t))(v182 + 8))(v184, v181);
        (*(void (**)(char *, uint64_t))(v178 + 8))(v180, v177);
        v323[0] = v185;
        uint64_t v186 = sub_258EA91D0();
        uint64_t v2 = v187;
        id v188 = v321;
        sub_258E743A8((uint64_t)v302);
        uint64_t v189 = (uint64_t)v322;
        char v190 = swift_isUniquelyReferenced_nonNull_native();
        v323[0] = v189;
        unint64_t v192 = sub_258E78DD0(v186, v2);
        uint64_t v193 = *(void *)(v189 + 16);
        BOOL v194 = (v191 & 1) == 0;
        uint64_t v195 = v193 + v194;
        if (__OFADD__(v193, v194)) {
          goto LABEL_201;
        }
        char v196 = v191;
        if (*(void *)(v189 + 24) >= v195)
        {
          unint64_t v6 = v317;
          if ((v190 & 1) == 0) {
            sub_258E7C880();
          }
        }
        else
        {
          sub_258E7A174(v195, v190);
          unint64_t v197 = sub_258E78DD0(v186, v2);
          unint64_t v6 = v317;
          if ((v196 & 1) != (v198 & 1)) {
            goto LABEL_208;
          }
          unint64_t v192 = v197;
        }
        v273 = (void *)v323[0];
        swift_bridgeObjectRelease();
        if (v196) {
          goto LABEL_156;
        }
        uint64_t v274 = swift_bridgeObjectRetain();
        sub_258EA4FB8(v323, v274);
        uint64_t v275 = v323[0];
        v273[(v192 >> 6) + 8] |= 1 << v192;
        v276 = (uint64_t *)(v273[6] + 16 * v192);
        uint64_t *v276 = v186;
        v276[1] = v2;
        *(void *)(v273[7] + 8 * v192) = v275;
        uint64_t v277 = v273[2];
        BOOL v9 = __OFADD__(v277, 1);
        uint64_t v278 = v277 + 1;
        if (v9) {
          goto LABEL_205;
        }
        v273[2] = v278;
LABEL_156:
        swift_bridgeObjectRetain();
        v322 = v273;
        swift_bridgeObjectRelease();
        sub_258E9DED8(v323, v188);
        v279 = (void *)v323[0];
        swift_bridgeObjectRelease();

        (*(void (**)(char *, uint64_t))(v168 + 8))(v320, v167);
        v302 = sub_258EA4FB8;
        goto LABEL_175;
      case 6:
        uint64_t v2 = sub_258EA8A80();
        uint64_t v199 = *(void *)(v2 - 8);
        uint64_t v200 = *(void *)(v199 + 64);
        MEMORY[0x270FA5388](v2);
        v201 = v8;
        unint64_t v202 = (v200 + 15) & 0xFFFFFFFFFFFFFFF0;
        id v203 = objc_msgSend(v201, sel_startDate);
        uint64_t v204 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
        uint64_t v205 = MEMORY[0x270FA5388](v204 - 8);
        v207 = (char *)&v302 - ((v206 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (!v203)
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v199 + 56))(v207, 1, 1, v2);
LABEL_138:

          sub_258E81B50((uint64_t)v207, &qword_26A0D0370);
          goto LABEL_175;
        }
        v320 = (char *)&v302 - v202;
        MEMORY[0x270FA5388](v205);
        v208 = (char *)&v302 - v202;
        sub_258EA8A40();

        v209 = *(void (**)(char *, char *, uint64_t))(v199 + 32);
        v209(v207, v208, v2);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v199 + 56))(v207, 0, 1, v2);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v199 + 48))(v207, 1, v2) == 1) {
          goto LABEL_138;
        }
        v319 = &v302;
        v209(v320, v207, v2);
        uint64_t v210 = sub_258EA8AF0();
        uint64_t v211 = *(void *)(v210 - 8);
        MEMORY[0x270FA5388](v210);
        v213 = (char *)&v302 - ((v212 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_258EA8AC0();
        char v214 = sub_258EA8AA0();
        (*(void (**)(char *, uint64_t))(v211 + 8))(v213, v210);
        BOOL v215 = (v214 & 1) == 0;
        if (v214) {
          uint64_t v216 = 1702195828;
        }
        else {
          uint64_t v216 = 0x65736C6166;
        }
        if (v215) {
          uint64_t v217 = 0xE500000000000000;
        }
        else {
          uint64_t v217 = 0xE400000000000000;
        }
        id v218 = v321;
        sub_258E743A8((uint64_t)v303);
        uint64_t v219 = (uint64_t)v322;
        char v220 = swift_isUniquelyReferenced_nonNull_native();
        v323[0] = v219;
        unint64_t v222 = sub_258E78DD0(v216, v217);
        uint64_t v223 = *(void *)(v219 + 16);
        BOOL v224 = (v221 & 1) == 0;
        uint64_t v225 = v223 + v224;
        if (__OFADD__(v223, v224))
        {
          __break(1u);
LABEL_201:
          __break(1u);
LABEL_202:
          __break(1u);
LABEL_203:
          __break(1u);
LABEL_204:
          __break(1u);
LABEL_205:
          __break(1u);
LABEL_206:
          __break(1u);
LABEL_207:
          __break(1u);
LABEL_208:
          sub_258EA9220();
          __break(1u);
          JUMPOUT(0x258EA8550);
        }
        char v226 = v221;
        if (*(void *)(v219 + 24) >= v225)
        {
          if ((v220 & 1) == 0) {
            sub_258E7C880();
          }
        }
        else
        {
          sub_258E7A174(v225, v220);
          unint64_t v227 = sub_258E78DD0(v216, v217);
          if ((v226 & 1) != (v228 & 1)) {
            goto LABEL_208;
          }
          unint64_t v222 = v227;
        }
        v280 = (void *)v323[0];
        swift_bridgeObjectRelease();
        if ((v226 & 1) == 0)
        {
          uint64_t v281 = swift_bridgeObjectRetain();
          sub_258EA4FB8(v323, v281);
          uint64_t v282 = v323[0];
          v280[(v222 >> 6) + 8] |= 1 << v222;
          v283 = (uint64_t *)(v280[6] + 16 * v222);
          uint64_t *v283 = v216;
          v283[1] = v217;
          *(void *)(v280[7] + 8 * v222) = v282;
          uint64_t v284 = v280[2];
          BOOL v9 = __OFADD__(v284, 1);
          uint64_t v285 = v284 + 1;
          if (v9) {
            goto LABEL_206;
          }
          v280[2] = v285;
        }
        swift_bridgeObjectRetain();
        v322 = v280;
        swift_bridgeObjectRelease();
        sub_258E9DED8(v323, v218);
        v286 = (void *)v323[0];
        swift_bridgeObjectRelease();

        (*(void (**)(char *, uint64_t))(v199 + 8))(v320, v2);
        v303 = sub_258EA4FB8;
        goto LABEL_175;
      case 7:
        id v123 = objc_msgSend(v7, sel_locationUUID);
        if (!v123) {
          goto LABEL_109;
        }
        uint64_t v124 = v123;
        uint64_t v125 = sub_258EA8C50();
        uint64_t v2 = v126;

        id v127 = v8;
        sub_258E743A8((uint64_t)v305);
        uint64_t v128 = (uint64_t)v322;
        char v129 = swift_isUniquelyReferenced_nonNull_native();
        v323[0] = v128;
        unint64_t v131 = sub_258E78DD0(v125, v2);
        uint64_t v132 = *(void *)(v128 + 16);
        BOOL v133 = (v130 & 1) == 0;
        uint64_t v134 = v132 + v133;
        if (__OFADD__(v132, v133)) {
          goto LABEL_196;
        }
        char v135 = v130;
        if (*(void *)(v128 + 24) >= v134)
        {
          if ((v129 & 1) == 0) {
            sub_258E7C880();
          }
        }
        else
        {
          sub_258E7A174(v134, v129);
          unint64_t v136 = sub_258E78DD0(v125, v2);
          if ((v135 & 1) != (v137 & 1)) {
            goto LABEL_208;
          }
          unint64_t v131 = v136;
        }
        v266 = (void *)v323[0];
        swift_bridgeObjectRelease();
        if (v135) {
          goto LABEL_150;
        }
        uint64_t v267 = swift_bridgeObjectRetain();
        sub_258EA4FB8(v323, v267);
        uint64_t v268 = v323[0];
        v266[(v131 >> 6) + 8] |= 1 << v131;
        v269 = (uint64_t *)(v266[6] + 16 * v131);
        uint64_t *v269 = v125;
        v269[1] = v2;
        *(void *)(v266[7] + 8 * v131) = v268;
        uint64_t v270 = v266[2];
        BOOL v9 = __OFADD__(v270, 1);
        uint64_t v271 = v270 + 1;
        if (v9) {
          goto LABEL_204;
        }
        v266[2] = v271;
LABEL_150:
        swift_bridgeObjectRetain();
        v322 = v266;
        swift_bridgeObjectRelease();
        sub_258E9DED8(v323, v127);
        v272 = (void *)v323[0];
        swift_bridgeObjectRelease();

        v305 = sub_258EA4FB8;
        goto LABEL_175;
      case 8:
        uint64_t v167 = sub_258EA8A80();
        uint64_t v168 = *(void *)(v167 - 8);
        uint64_t v229 = *(void *)(v168 + 64);
        MEMORY[0x270FA5388](v167);
        unint64_t v230 = (v229 + 15) & 0xFFFFFFFFFFFFFFF0;
        v320 = (char *)&v302 - v230;
        id v231 = objc_msgSend(v8, sel_startDate);
        uint64_t v232 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D0370);
        uint64_t v233 = MEMORY[0x270FA5388](v232 - 8);
        uint64_t v2 = (uint64_t)&v302 - ((v234 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (!v231)
        {
LABEL_134:
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v168 + 56))(v2, 1, 1, v167);
LABEL_135:

          sub_258E81B50(v2, &qword_26A0D0370);
          goto LABEL_175;
        }
        MEMORY[0x270FA5388](v233);
        v235 = (char *)&v302 - v230;
        sub_258EA8A40();

        v236 = *(void (**)(uint64_t, char *, uint64_t))(v168 + 32);
        v236(v2, v235, v167);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v168 + 56))(v2, 0, 1, v167);
        id v8 = v321;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v168 + 48))(v2, 1, v167) == 1) {
          goto LABEL_135;
        }
        v316 = &v302;
        v236((uint64_t)v320, (char *)v2, v167);
        uint64_t v237 = sub_258EA8AF0();
        v319 = &v302;
        uint64_t v238 = *(void *)(v237 - 8);
        MEMORY[0x270FA5388](v237);
        v240 = (char *)&v302 - ((v239 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_258EA8AC0();
        uint64_t v241 = sub_258EA8AD0();
        v318 = &v302;
        uint64_t v242 = *(void *)(v241 - 8);
        MEMORY[0x270FA5388](v241);
        v244 = (char *)&v302 - ((v243 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, void, uint64_t))(v242 + 104))(v244, *MEMORY[0x263F078E0], v241);
        uint64_t v245 = sub_258EA8AE0();
        (*(void (**)(char *, uint64_t))(v242 + 8))(v244, v241);
        (*(void (**)(char *, uint64_t))(v238 + 8))(v240, v237);
        v323[0] = v245;
        uint64_t v246 = sub_258EA91D0();
        uint64_t v2 = v247;
        id v248 = v321;
        sub_258E743A8((uint64_t)v304);
        uint64_t v249 = (uint64_t)v322;
        char v250 = swift_isUniquelyReferenced_nonNull_native();
        v323[0] = v249;
        unint64_t v252 = sub_258E78DD0(v246, v2);
        uint64_t v253 = *(void *)(v249 + 16);
        BOOL v254 = (v251 & 1) == 0;
        uint64_t v255 = v253 + v254;
        if (__OFADD__(v253, v254)) {
          goto LABEL_202;
        }
        char v256 = v251;
        if (*(void *)(v249 + 24) >= v255)
        {
          unint64_t v6 = v317;
          if ((v250 & 1) == 0) {
            sub_258E7C880();
          }
        }
        else
        {
          sub_258E7A174(v255, v250);
          unint64_t v257 = sub_258E78DD0(v246, v2);
          unint64_t v6 = v317;
          if ((v256 & 1) != (v258 & 1)) {
            goto LABEL_208;
          }
          unint64_t v252 = v257;
        }
        v287 = (void *)v323[0];
        swift_bridgeObjectRelease();
        if ((v256 & 1) == 0)
        {
          uint64_t v288 = swift_bridgeObjectRetain();
          sub_258EA4FB8(v323, v288);
          uint64_t v289 = v323[0];
          v287[(v252 >> 6) + 8] |= 1 << v252;
          v290 = (uint64_t *)(v287[6] + 16 * v252);
          uint64_t *v290 = v246;
          v290[1] = v2;
          *(void *)(v287[7] + 8 * v252) = v289;
          uint64_t v291 = v287[2];
          BOOL v9 = __OFADD__(v291, 1);
          uint64_t v292 = v291 + 1;
          if (v9) {
            goto LABEL_207;
          }
          v287[2] = v292;
        }
        swift_bridgeObjectRetain();
        v322 = v287;
        swift_bridgeObjectRelease();
        sub_258E9DED8(v323, v248);
        v293 = (void *)v323[0];
        swift_bridgeObjectRelease();

        (*(void (**)(char *, uint64_t))(v168 + 8))(v320, v167);
        v304 = sub_258EA4FB8;
        goto LABEL_175;
      default:
        id v10 = objc_msgSend(v7, sel_attachments);
        if (v10)
        {
          uint64_t v11 = v10;
          sub_258E7451C(0, (unint64_t *)&qword_26A0D03D0);
          unint64_t v12 = sub_258EA8D40();

          if (!(v12 >> 62))
          {
            id v13 = *(id *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (v13) {
              goto LABEL_14;
            }
LABEL_4:

            swift_bridgeObjectRelease_n();
            unint64_t v3 = v310;
            unint64_t v6 = v317;
            if (v317 == v311) {
              goto LABEL_180;
            }
            continue;
          }
          swift_bridgeObjectRetain_n();
          id v13 = (id)sub_258EA9150();
          swift_bridgeObjectRelease();
          if (!v13) {
            goto LABEL_4;
          }
LABEL_14:
          v319 = (void *(**)(void *__return_ptr, void))v12;
          v320 = (char *)(v12 & 0xC000000000000001);
          uint64_t v14 = 4;
          v318 = v13;
          while (1)
          {
            id v16 = v320 ? (id)MEMORY[0x25A2D2D90](v14 - 4, v12) : *(id *)(v12 + 8 * v14);
            uint64_t v17 = v16;
            uint64_t v2 = v14 - 3;
            if (__OFADD__(v14 - 4, 1)) {
              break;
            }
            id v18 = objc_msgSend(v16, sel_personInPhoto);
            if (v18)
            {
              char v19 = v18;
              uint64_t v20 = sub_258EA8C50();
              uint64_t v22 = v21;

              id v23 = v8;
              uint64_t v24 = (uint64_t)v322;
              char v25 = swift_isUniquelyReferenced_nonNull_native();
              v323[0] = v24;
              unint64_t v27 = sub_258E78DD0(v20, v22);
              uint64_t v28 = *(void *)(v24 + 16);
              BOOL v29 = (v26 & 1) == 0;
              uint64_t v30 = v28 + v29;
              if (__OFADD__(v28, v29)) {
                goto LABEL_186;
              }
              char v31 = v26;
              if (*(void *)(v24 + 24) >= v30)
              {
                if ((v25 & 1) == 0) {
                  sub_258E7C880();
                }
              }
              else
              {
                sub_258E7A174(v30, v25);
                unint64_t v32 = sub_258E78DD0(v20, v22);
                if ((v31 & 1) != (v33 & 1)) {
                  goto LABEL_208;
                }
                unint64_t v27 = v32;
              }
              id v34 = (void *)v323[0];
              swift_bridgeObjectRelease();
              if ((v31 & 1) == 0)
              {
                swift_bridgeObjectRetain();
                sub_258EA4FBC(v323);
                uint64_t v35 = v323[0];
                v34[(v27 >> 6) + 8] |= 1 << v27;
                id v36 = (uint64_t *)(v34[6] + 16 * v27);
                *id v36 = v20;
                v36[1] = v22;
                *(void *)(v34[7] + 8 * v27) = v35;
                uint64_t v37 = v34[2];
                BOOL v9 = __OFADD__(v37, 1);
                uint64_t v38 = v37 + 1;
                if (v9) {
                  goto LABEL_189;
                }
                v34[2] = v38;
              }
              swift_bridgeObjectRetain();
              v322 = v34;
              swift_bridgeObjectRelease();
              sub_258E9DED8(v323, v23);
              swift_bridgeObjectRelease();
              unint64_t v15 = (void *)v323[0];

              id v8 = v321;
              id v13 = v318;
              unint64_t v12 = (unint64_t)v319;
            }
            else
            {
            }
            ++v14;
            if ((id)v2 == v13) {
              goto LABEL_4;
            }
          }
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
LABEL_188:
          __break(1u);
LABEL_189:
          __break(1u);
LABEL_190:
          __break(1u);
LABEL_191:
          __break(1u);
LABEL_192:
          __break(1u);
LABEL_193:
          __break(1u);
LABEL_194:
          __break(1u);
LABEL_195:
          __break(1u);
LABEL_196:
          __break(1u);
LABEL_197:
          swift_bridgeObjectRetain();
          unint64_t v3 = v310;
          uint64_t v5 = sub_258EA9150();
          if (!v5) {
            goto LABEL_198;
          }
          goto LABEL_3;
        }
LABEL_109:

LABEL_175:
        unint64_t v3 = v310;
LABEL_176:
        if (v6 != v311) {
          continue;
        }
LABEL_180:
        swift_bridgeObjectRelease();
        v294 = v304;
        v295 = v305;
        v296 = v306;
        v297 = v303;
        v298 = v302;
LABEL_199:
        v299 = swift_bridgeObjectRetain();
        v300 = sub_258EA5018(v299);
        swift_bridgeObjectRelease_n();
        sub_258E743A8((uint64_t)v295);
        sub_258E743A8((uint64_t)v296);
        sub_258E743A8((uint64_t)v298);
        sub_258E743A8((uint64_t)v297);
        sub_258E743A8((uint64_t)v294);
        return v300;
    }
  }
}

uint64_t sub_258EA8574(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_258EA9150();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A0D05C8);
      uint64_t v3 = sub_258EA9020();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!v2)
  {
LABEL_4:
    uint64_t v5 = *(void *)(v4 + 16);
    if (!v5) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_8:
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_258EA9150();
  swift_bridgeObjectRelease();
  if (v5)
  {
LABEL_9:
    uint64_t v7 = v3 + 56;
    uint64_t v44 = v5;
    if ((v1 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = 0;
      unint64_t v42 = v1;
      while (1)
      {
        while (1)
        {
          uint64_t v9 = MEMORY[0x25A2D2D90](v8, v1);
          BOOL v10 = __OFADD__(v8++, 1);
          if (v10)
          {
            __break(1u);
            goto LABEL_36;
          }
          uint64_t v11 = v9;
          uint64_t v12 = sub_258EA8F10();
          uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
          unint64_t v14 = v12 & ~v13;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if (((1 << v14) & v16) != 0) {
            break;
          }
LABEL_20:
          *(void *)(v7 + 8 * v15) = v17 | v16;
          *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
          uint64_t v23 = *(void *)(v3 + 16);
          BOOL v10 = __OFADD__(v23, 1);
          uint64_t v24 = v23 + 1;
          if (v10) {
            goto LABEL_37;
          }
          *(void *)(v3 + 16) = v24;
          if (v8 == v5) {
            return v3;
          }
        }
        sub_258E7451C(0, &qword_26A0D05C0);
        id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
        char v19 = sub_258EA8F20();

        if ((v19 & 1) == 0)
        {
          uint64_t v20 = ~v13;
          while (1)
          {
            unint64_t v14 = (v14 + 1) & v20;
            unint64_t v15 = v14 >> 6;
            uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
            uint64_t v17 = 1 << v14;
            if ((v16 & (1 << v14)) == 0) {
              break;
            }
            id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
            char v22 = sub_258EA8F20();

            if (v22) {
              goto LABEL_11;
            }
          }
          unint64_t v1 = v42;
          uint64_t v5 = v44;
          goto LABEL_20;
        }
LABEL_11:
        swift_unknownObjectRelease();
        unint64_t v1 = v42;
        uint64_t v5 = v44;
        if (v8 == v44) {
          return v3;
        }
      }
    }
    uint64_t v26 = 0;
    unint64_t v41 = v1 + 32;
    uint64_t v43 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    do
    {
      if (v26 == v43)
      {
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        JUMPOUT(0x258EA88D0);
      }
      id v27 = *(id *)(v41 + 8 * v26);
      uint64_t v28 = sub_258EA8F10();
      uint64_t v29 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v30 = v28 & ~v29;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
      uint64_t v33 = 1 << v30;
      if (((1 << v30) & v32) != 0)
      {
        sub_258E7451C(0, &qword_26A0D05C0);
        id v34 = *(id *)(*(void *)(v3 + 48) + 8 * v30);
        char v35 = sub_258EA8F20();

        if (v35)
        {
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v36 = ~v29;
        while (1)
        {
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)(v7 + 8 * (v30 >> 6));
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            break;
          }
          id v37 = *(id *)(*(void *)(v3 + 48) + 8 * v30);
          char v38 = sub_258EA8F20();

          if (v38) {
            goto LABEL_24;
          }
        }
      }
      *(void *)(v7 + 8 * v31) = v33 | v32;
      *(void *)(*(void *)(v3 + 48) + 8 * v30) = v27;
      uint64_t v39 = *(void *)(v3 + 16);
      BOOL v10 = __OFADD__(v39, 1);
      uint64_t v40 = v39 + 1;
      if (v10) {
        goto LABEL_38;
      }
      *(void *)(v3 + 16) = v40;
LABEL_25:
      ++v26;
    }
    while (v26 != v44);
  }
  return v3;
}

uint64_t sub_258EA88E0()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_258EA88F0()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_258EA8900()
{
  return MEMORY[0x270EEFCA8]();
}

uint64_t sub_258EA8910()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_258EA8920()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_258EA8930()
{
  return MEMORY[0x270EEFE58]();
}

uint64_t sub_258EA8940()
{
  return MEMORY[0x270EEFE78]();
}

uint64_t sub_258EA8950()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_258EA8960()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_258EA8970()
{
  return MEMORY[0x270EF01C8]();
}

uint64_t sub_258EA8980()
{
  return MEMORY[0x270EF02B8]();
}

uint64_t sub_258EA8990()
{
  return MEMORY[0x270EF02C0]();
}

uint64_t sub_258EA89A0()
{
  return MEMORY[0x270EF05F8]();
}

uint64_t sub_258EA89B0()
{
  return MEMORY[0x270EF0620]();
}

uint64_t sub_258EA89C0()
{
  return MEMORY[0x270EF06A0]();
}

uint64_t sub_258EA89D0()
{
  return MEMORY[0x270EF06D8]();
}

uint64_t sub_258EA89E0()
{
  return MEMORY[0x270EF07D8]();
}

uint64_t sub_258EA89F0()
{
  return MEMORY[0x270EF08A0]();
}

uint64_t sub_258EA8A00()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_258EA8A10()
{
  return MEMORY[0x270EF09A0]();
}

uint64_t sub_258EA8A20()
{
  return MEMORY[0x270EF09D0]();
}

uint64_t sub_258EA8A30()
{
  return MEMORY[0x270EF09E8]();
}

uint64_t sub_258EA8A40()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_258EA8A50()
{
  return MEMORY[0x270EF0BC0]();
}

uint64_t sub_258EA8A60()
{
  return MEMORY[0x270EF0C18]();
}

uint64_t sub_258EA8A70()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_258EA8A80()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_258EA8A90()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_258EA8AA0()
{
  return MEMORY[0x270EF1288]();
}

uint64_t sub_258EA8AB0()
{
  return MEMORY[0x270EF1348]();
}

uint64_t sub_258EA8AC0()
{
  return MEMORY[0x270EF13E0]();
}

uint64_t sub_258EA8AD0()
{
  return MEMORY[0x270EF1420]();
}

uint64_t sub_258EA8AE0()
{
  return MEMORY[0x270EF1438]();
}

uint64_t sub_258EA8AF0()
{
  return MEMORY[0x270EF1448]();
}

uint64_t sub_258EA8B00()
{
  return MEMORY[0x270F5BCE8]();
}

uint64_t sub_258EA8B10()
{
  return MEMORY[0x270F5BCF0]();
}

uint64_t sub_258EA8B20()
{
  return MEMORY[0x270F5BCF8]();
}

uint64_t sub_258EA8B30()
{
  return MEMORY[0x270F5BD00]();
}

uint64_t sub_258EA8B40()
{
  return MEMORY[0x270F5BD08]();
}

uint64_t sub_258EA8B50()
{
  return MEMORY[0x270F5BD10]();
}

uint64_t sub_258EA8B60()
{
  return MEMORY[0x270F5BD18]();
}

uint64_t sub_258EA8B70()
{
  return MEMORY[0x270F5BD20]();
}

uint64_t sub_258EA8B80()
{
  return MEMORY[0x270F5BD28]();
}

uint64_t sub_258EA8B90()
{
  return MEMORY[0x270FA2DF8]();
}

uint64_t sub_258EA8BA0()
{
  return MEMORY[0x270FA2E10]();
}

uint64_t sub_258EA8BB0()
{
  return MEMORY[0x270FA2E28]();
}

uint64_t sub_258EA8BC0()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_258EA8BD0()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_258EA8BE0()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_258EA8BF0()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_258EA8C00()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_258EA8C10()
{
  return MEMORY[0x270F9D088]();
}

uint64_t sub_258EA8C20()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_258EA8C30()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_258EA8C40()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_258EA8C50()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_258EA8C60()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_258EA8C70()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_258EA8C80()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_258EA8C90()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_258EA8CA0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_258EA8CB0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_258EA8CC0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_258EA8CE0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_258EA8CF0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_258EA8D00()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_258EA8D10()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_258EA8D20()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_258EA8D30()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_258EA8D40()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_258EA8D50()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_258EA8D60()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_258EA8D70()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_258EA8D80()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_258EA8D90()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_258EA8DA0()
{
  return MEMORY[0x270F9DCF0]();
}

uint64_t sub_258EA8DB0()
{
  return MEMORY[0x270EF1BD0]();
}

uint64_t _s25PeopleSuggesterLighthouse31IsTaskCancelledExecutionManagerV10shouldStopSbvg_0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_258EA8DD0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_258EA8DE0()
{
  return MEMORY[0x270EF1C08]();
}

uint64_t sub_258EA8DF0()
{
  return MEMORY[0x270EF1C10]();
}

uint64_t sub_258EA8E00()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_258EA8E10()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_258EA8E20()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_258EA8E30()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_258EA8E40()
{
  return MEMORY[0x270F9DFC0]();
}

uint64_t sub_258EA8E50()
{
  return MEMORY[0x270EF1CE8]();
}

uint64_t sub_258EA8E60()
{
  return MEMORY[0x270EF1DC0]();
}

uint64_t sub_258EA8E70()
{
  return MEMORY[0x270FA2E48]();
}

uint64_t sub_258EA8E80()
{
  return MEMORY[0x270FA2E50]();
}

uint64_t sub_258EA8E90()
{
  return MEMORY[0x270FA2E68]();
}

uint64_t sub_258EA8EA0()
{
  return MEMORY[0x270FA2E78]();
}

uint64_t sub_258EA8EB0()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_258EA8EC0()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_258EA8ED0()
{
  return MEMORY[0x270FA0D80]();
}

uint64_t sub_258EA8EE0()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_258EA8EF0()
{
  return MEMORY[0x270EF20C8]();
}

uint64_t sub_258EA8F00()
{
  return MEMORY[0x270EF2190]();
}

uint64_t sub_258EA8F10()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_258EA8F20()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_258EA8F30()
{
  return MEMORY[0x270F9E3D8]();
}

uint64_t sub_258EA8F40()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_258EA8F50()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_258EA8F60()
{
  return MEMORY[0x270EF2558]();
}

uint64_t sub_258EA8F70()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_258EA8F80()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_258EA8F90()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_258EA8FA0()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_258EA8FB0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_258EA8FC0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_258EA8FD0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_258EA8FE0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_258EA8FF0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_258EA9000()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_258EA9010()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_258EA9020()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_258EA9030()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_258EA9040()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_258EA9050()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_258EA9060()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_258EA9070()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_258EA9080()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_258EA9090()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_258EA90A0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_258EA90B0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_258EA90C0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_258EA90D0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_258EA90E0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_258EA90F0()
{
  return MEMORY[0x270F9EF38]();
}

uint64_t sub_258EA9100()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_258EA9110()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_258EA9120()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_258EA9130()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_258EA9140()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_258EA9150()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_258EA9160()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_258EA9170()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_258EA9180()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_258EA9190()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_258EA91A0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_258EA91B0()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_258EA91C0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_258EA91D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_258EA91E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_258EA91F0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_258EA9200()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_258EA9210()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_258EA9220()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_258EA9230()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_258EA9240()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_258EA9250()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_258EA9260()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_258EA9270()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_258EA9280()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_258EA9290()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_258EA92A0()
{
  return MEMORY[0x270EF2768]();
}

uint64_t BMMLSEDurableFeatureStorefeatureNameAsString()
{
  return MEMORY[0x270F10A88]();
}

uint64_t BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString()
{
  return MEMORY[0x270F10A98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AE8]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3B8]();
}

{
  return MEMORY[0x270F9A3D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D8](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}