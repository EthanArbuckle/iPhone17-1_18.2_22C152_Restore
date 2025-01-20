uint64_t PeoplePredictionDataFeatureReadFrom(uint64_t a1, uint64_t a2)
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
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  PeoplePredictionDataFeatureValue *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;

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
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(unsigned char *)(a1 + 36) |= 8u;
        while (1)
        {
          v20 = *v3;
          v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_60;
          }
          v17 += 7;
          v14 = v18++ >= 9;
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
        v45 = 20;
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
        v25 = 0;
        v26 = 0;
        v19 = 0;
        *(unsigned char *)(a1 + 36) |= 4u;
        while (2)
        {
          v27 = *v3;
          v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 1;
            v19 |= (unint64_t)(v29 & 0x7F) << v25;
            if (v29 < 0)
            {
              v25 += 7;
              v14 = v26++ >= 9;
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
        v45 = 16;
        goto LABEL_79;
      case 4u:
        v30 = 0;
        v31 = 0;
        v19 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        while (2)
        {
          v32 = *v3;
          v33 = *(void *)(a2 + v32);
          if (v33 == -1 || v33 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v19 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v14 = v31++ >= 9;
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
        v45 = 12;
        goto LABEL_79;
      case 5u:
        v35 = 0;
        v36 = 0;
        v19 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (2)
        {
          v37 = *v3;
          v38 = *(void *)(a2 + v37);
          if (v38 == -1 || v38 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 1;
            v19 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              v14 = v36++ >= 9;
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
        v45 = 8;
        goto LABEL_79;
      case 6u:
        v40 = 0;
        v41 = 0;
        v19 = 0;
        *(unsigned char *)(a1 + 36) |= 0x10u;
        while (2)
        {
          v42 = *v3;
          v43 = *(void *)(a2 + v42);
          if (v43 == -1 || v43 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v43 + 1;
            v19 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              v14 = v41++ >= 9;
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
        v45 = 32;
LABEL_79:
        *(_DWORD *)(a1 + v45) = v19;
        goto LABEL_80;
      default:
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_80;
    }
  }
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
        v18 = *(void **)(a1 + 8);
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

BOOL PeoplePredictionDataTrialIdentifierReadFrom(uint64_t a1, uint64_t a2)
{
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
        uint64_t v19 = 24;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
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
    uint64_t v18 = PBReaderReadString();
    uint64_t v19 = 8;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
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
          v30 = *(void **)(a1 + 24);
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
        char v18 = *(void **)(a1 + 32);
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
        char v26 = objc_alloc_init(PeoplePredictionDataFeature);
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

void type metadata accessor for BMMLSEDurableFeatureStorefeatureName(uint64_t a1)
{
}

id sub_25A8695B8(uint64_t a1, unint64_t a2)
{
  v17[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_25A8A8790();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  v6 = (void *)v5;
  v17[0] = 0;
  id v7 = objc_msgSend(v2, sel_lh_queryInteractionsUsingPredicate_sortDescriptors_limit_error_, a1, v5, a2, v17);

  id v8 = v17[0];
  if (!v7)
  {
    id v14 = v17[0];
    sub_25A8A83D0();

    goto LABEL_11;
  }
  a1 = sub_25A8A87A0();
  id v9 = v8;

  if (*(void *)(a1 + 16) == a2)
  {
    if (qword_26A469F78 == -1)
    {
LABEL_5:
      uint64_t v10 = sub_25A8A8630();
      __swift_project_value_buffer(v10, (uint64_t)qword_26A46AF08);
      uint64_t v11 = sub_25A8A8610();
      os_log_type_t v12 = sub_25A8A88E0();
      if (os_log_type_enabled(v11, v12))
      {
        char v13 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)char v13 = 134217984;
        v17[0] = (id)a2;
        sub_25A8A89A0();
        _os_log_impl(&dword_25A85D000, v11, v12, "interactionsFetchLimit=%lu reached while loading interactions from the store", v13, 0xCu);
        MEMORY[0x261148660](v13, -1, -1);
      }

      goto LABEL_8;
    }
LABEL_14:
    swift_once();
    goto LABEL_5;
  }
LABEL_8:
  id v14 = (id)sub_25A869814(a1);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    sub_25A869ECC();
    swift_allocError();
    *(void *)uint64_t v15 = 0xD00000000000002ALL;
    *(void *)(v15 + 8) = 0x800000025A8B2540;
    *(unsigned char *)(v15 + 16) = 1;
LABEL_11:
    swift_willThrow();
  }
  return v14;
}

uint64_t sub_25A869814(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25A8A8B10();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_25A869F58(i, (uint64_t)v5);
    sub_25A86AE00(0, &qword_26A469FA0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_25A8A8AF0();
    sub_25A8A8B20();
    sub_25A8A8B30();
    sub_25A8A8B00();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_25A869930()
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
  uint64_t v5 = sub_25A8A86B0();

  return v5;
}

uint64_t sub_25A8699EC()
{
  id v1 = objc_msgSend(v0, sel_sender);

  id v2 = objc_msgSend(v0, sel_recipients);
  id v3 = v2;
  if (v1)
  {
    if (v2)
    {
      sub_25A86AE00(0, &qword_26A469FC8);
      unint64_t v4 = sub_25A8A87A0();
    }
    else
    {
      unint64_t v4 = MEMORY[0x263F8EE78];
    }
    uint64_t v5 = sub_25A881ECC(v4);
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v0, sel_sender);
    swift_bridgeObjectRetain();
    id v7 = v6;
    MEMORY[0x261147A90]();
    if (*(void *)(v5 + 16) >= *(void *)(v5 + 24) >> 1) {
      sub_25A8A87D0();
    }
    sub_25A8A87F0();
    sub_25A8A87C0();
    swift_bridgeObjectRelease();

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A469FD0);
    sub_25A86A0A8(&qword_26A469FD8, &qword_26A469FD0);
    sub_25A8A8800();
  }
  else
  {
    if (v2)
    {
      sub_25A86AE00(0, &qword_26A469FC8);
      sub_25A8A87A0();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A469FA8);
    sub_25A86A0A8((unint64_t *)&qword_26A469FB0, &qword_26A469FB8);
    sub_25A8A8990();
  }
  swift_bridgeObjectRelease();
  return sub_25A8A8BF0();
}

id sub_25A869C30()
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
    sub_25A86AE00(0, (unint64_t *)&qword_26A469FE0);
    unint64_t v3 = sub_25A8A87A0();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_25A8A8B70();
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
              id v7 = (id)MEMORY[0x261147DD0](v5, v3);
            }
            else {
              id v7 = *(id *)(v3 + 8 * v5 + 32);
            }
            id v8 = v7;
            id v9 = objc_msgSend(v7, sel_photoSceneDescriptor);
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = sub_25A8A86B0();
              uint64_t v13 = v12;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                id v6 = sub_25A89C718(0, v6[2] + 1, 1, v6);
              }
              unint64_t v15 = v6[2];
              unint64_t v14 = v6[3];
              if (v15 >= v14 >> 1) {
                id v6 = sub_25A89C718((void *)(v14 > 1), v15 + 1, 1, v6);
              }
              v6[2] = v15 + 1;
              int v16 = &v6[2 * v15];
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
    sub_25A8A5780((uint64_t)v6);
    swift_bridgeObjectRelease();
    sub_25A8A88A0();
    swift_bridgeObjectRelease();
    return (id)sub_25A8A8BF0();
  }
  return result;
}

void *sub_25A869E80@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_25A869E90(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_25A869EA4(void *a1@<X8>)
{
  *a1 = *v1;
}

_DWORD *sub_25A869EB0@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_25A869EC0(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_25A869ECC()
{
  unint64_t result = qword_26A469F98;
  if (!qword_26A469F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A469F98);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25A869F58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

unint64_t sub_25A86A040()
{
  unint64_t result = qword_26A469FC0;
  if (!qword_26A469FC0)
  {
    sub_25A86AE00(255, &qword_26A469FC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A469FC0);
  }
  return result;
}

uint64_t sub_25A86A0A8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_25A86A040();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_25A86A10C(void *a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(unsigned __int8 *)(a2 + 58);
  id result = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeatureValue), sel_init);
  if (result)
  {
    id v7 = result;
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
      objc_msgSend(v7, sel_setIntValue_, sub_25A8A6BAC((uint64_t)objc_msgSend(a1, sel_intValue), v5));
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
      sub_25A89CD70(0, 18, 0);
      unint64_t v18 = *(void *)(v24 + 16);
      uint64_t v19 = 0x20u;
      do
      {
        int v20 = *(_DWORD *)((char *)&unk_270862018 + v19);
        unint64_t v21 = *(void *)(v24 + 24);
        if (v18 >= v21 >> 1) {
          sub_25A89CD70(v21 > 1, v18 + 1, 1);
        }
        *(void *)(v24 + 16) = v18 + 1;
        *(_DWORD *)(v24 + 4 * v18 + 32) = v20;
        v19 += 4;
        ++v18;
      }
      while (v19 != 104);
      char v22 = sub_25A892EAC(a3, v24);
      swift_release();
      if (v22) {
        return v7;
      }
      if (qword_26A469F78 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_25A8A8630();
      __swift_project_value_buffer(v23, (uint64_t)qword_26A46AF08);
      unint64_t v14 = sub_25A8A8610();
      os_log_type_t v15 = sub_25A8A8900();
      if (!os_log_type_enabled(v14, v15)) {
        goto LABEL_22;
      }
      int v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)int v16 = 67109120;
      sub_25A8A89A0();
      unint64_t v17 = "All nil values found for feature %d";
      goto LABEL_21;
    }
    if (v8 < 2) {
      return v7;
    }
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25A8A8630();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A46AF08);
    unint64_t v14 = sub_25A8A8610();
    os_log_type_t v15 = sub_25A8A8900();
    if (!os_log_type_enabled(v14, v15))
    {
LABEL_22:

      return v7;
    }
    int v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v16 = 67109120;
    sub_25A8A89A0();
    unint64_t v17 = "Duplicate values found for feature %d";
LABEL_21:
    _os_log_impl(&dword_25A85D000, v14, v15, v17, v16, 8u);
    MEMORY[0x261148660](v16, -1, -1);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_25A86A570()
{
  return 0;
}

void sub_25A86A648(void **a1, const void *a2, void *a3)
{
  id v6 = *a1;
  id v7 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeature), sel_init);
  if (!v7)
  {
    sub_25A869ECC();
    swift_allocError();
    *(void *)uint64_t v16 = 0xD00000000000002ALL;
    *(void *)(v16 + 8) = 0x800000025A8B25B0;
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
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25A8A8630();
    __swift_project_value_buffer(v17, (uint64_t)qword_26A46AF08);
    id v11 = v6;
    unint64_t v18 = sub_25A8A8610();
    os_log_type_t v19 = sub_25A8A88F0();
    if (os_log_type_enabled(v18, v19))
    {
      int v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)int v20 = 136315138;
      __dst[0] = v21;
      objc_msgSend(v11, sel_featureName);
      uint64_t v22 = sub_25A86A570();
      uint64_t v33 = sub_25A86BEDC(v22, v23, __dst);
      sub_25A8A89A0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v18, v19, "Missing feature value in biome event for %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261148660](v21, -1, -1);
      MEMORY[0x261148660](v20, -1, -1);

      return;
    }

    goto LABEL_13;
  }
  id v11 = v10;
  memcpy(__dst, a2, 0x158uLL);
  id v12 = sub_25A86A10C(v11, (uint64_t)__dst, (uint64_t)v9);
  if (v3)
  {
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v13 = v12;
  if (!v12)
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25A8A8630();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A46AF08);
    id v25 = v6;
    char v26 = sub_25A8A8610();
    os_log_type_t v27 = sub_25A8A88F0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      __dst[0] = v31;
      *(_DWORD *)uint64_t v28 = 136315138;
      objc_msgSend(v25, sel_featureName);
      uint64_t v29 = sub_25A86A570();
      uint64_t v33 = sub_25A86BEDC(v29, v30, __dst);
      sub_25A8A89A0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v26, v27, "Missing feature value for %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261148660](v31, -1, -1);
      MEMORY[0x261148660](v28, -1, -1);

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

id sub_25A86AB78(void *a1, const void *a2)
{
  memcpy(__dst, a2, sizeof(__dst));
  id v4 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataMLSEVirtualFeatureStore), sel_init);
  if (v4)
  {
    objc_msgSend(v4, sel_setFeatureVersion_, objc_msgSend(a1, sel_featureVersion));
    id v5 = objc_msgSend(a1, sel_deviceIdentifier);
    if (v5)
    {
      id v6 = v5;
      objc_msgSend(v4, sel_setDeviceIdentifier_, v5);
    }
    sub_25A86AE00(0, &qword_26A46A1E0);
    id v7 = (void *)MEMORY[0x261147C60](MEMORY[0x263F8EE78]);
    objc_msgSend(v4, sel_setFeatureVectors_, v7);

    id v8 = objc_msgSend(a1, sel_featureVector);
    sub_25A86AE00(0, &qword_26A46A1D0);
    unint64_t v9 = sub_25A8A87A0();

    if (v9 >> 62) {
      goto LABEL_18;
    }
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v10; uint64_t v10 = sub_25A8A8B70())
    {
      uint64_t v11 = 4;
      while (1)
      {
        id v12 = (v9 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x261147DD0](v11 - 4, v9)
            : *(id *)(v9 + 8 * v11);
        uint64_t v13 = v12;
        uint64_t v14 = v11 - 3;
        if (__OFADD__(v11 - 4, 1)) {
          break;
        }
        unint64_t v18 = v12;
        sub_25A86A648(&v18, __dst, v4);
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
    sub_25A869ECC();
    swift_allocError();
    *(void *)uint64_t v15 = 0xD000000000000031;
    *(void *)(v15 + 8) = 0x800000025A8B2570;
    *(unsigned char *)(v15 + 16) = 1;
    swift_willThrow();
  }
  return v4;
}

uint64_t sub_25A86AE00(uint64_t a1, unint64_t *a2)
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

void sub_25A86AE78(uint64_t a1, unint64_t *a2)
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
  sub_25A86AFB8(a2, (uint64_t)(a4 + 43));
  if (v8)
  {
    id v9 = objc_allocWithZone((Class)sub_25A8A8600());
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25A8A85F0();
    sub_25A86B01C(v7, v8);
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

uint64_t sub_25A86AFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25A86B01C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::tuple_model_MLModel_experimentId_String_optional_optional __swiftcall ShadowEvaluationManager.loadShadowEvalMLModel()()
{
  uint64_t v0 = sub_25A8A8440();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  v89 = (char *)v86 - v6;
  MEMORY[0x270FA5388](v5);
  v93 = (char *)v86 - v7;
  uint64_t v8 = sub_25A8A8630();
  uint64_t v97 = *(void *)(v8 - 8);
  v98 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v8;
  MEMORY[0x270FA5388](v8);
  v96 = (char *)v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A000);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v91 = (uint64_t)v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v86 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)v86 - v17;
  MEMORY[0x270FA5388](v16);
  int v20 = (char *)v86 - v19;
  uint64_t v94 = v0;
  uint64_t v95 = v1;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
  v21((char *)v86 - v19, 1, 1, v0);
  uint64_t v22 = objc_msgSend(self, sel_clientWithIdentifier_, 210);
  unint64_t v23 = (void *)sub_25A8A86A0();
  v88 = "alShareSheetModel";
  uint64_t v24 = (void *)sub_25A8A86A0();
  id v25 = [v22 levelForFactor:v23 withNamespaceName:v24];

  if (!v25) {
    goto LABEL_12;
  }
  v86[0] = v4;
  v90 = v22;
  v92 = v20;
  char v26 = v25;
  id v27 = [v26 directoryValue];
  if (!v27)
  {
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v28 = v27;
  id v29 = objc_msgSend(v27, sel_path);

  if (!v29)
  {

    int v20 = v92;
    uint64_t v22 = v90;
LABEL_12:
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v98, (uint64_t)qword_26A46AF08);
    v51 = sub_25A8A8610();
    os_log_type_t v52 = sub_25A8A88F0();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_25A85D000, v51, v52, "URL is missing while retrieving model", v53, 2u);
      MEMORY[0x261148660](v53, -1, -1);
      v54 = v25;
    }
    else
    {
      v54 = v51;
      v51 = v22;
      uint64_t v22 = v25;
    }

    uint64_t v55 = (uint64_t)v20;
    goto LABEL_30;
  }

  id v30 = [v26 directoryValue];
  if (!v30)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v31 = v30;
  id v32 = objc_msgSend(v30, sel_path);

  if (!v32)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  sub_25A8A86B0();

  sub_25A8A83F0();
  swift_bridgeObjectRelease();
  uint64_t v33 = v94;
  v21(v18, 0, 1, v94);
  uint64_t v34 = (uint64_t)v92;
  sub_25A86BE0C((uint64_t)v18, (uint64_t)v92);
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v35 = (uint64_t)v98;
  uint64_t v36 = __swift_project_value_buffer((uint64_t)v98, (uint64_t)qword_26A46AF08);
  char v37 = v96;
  uint64_t v38 = v97;
  unsigned int v39 = *(void (**)(char *))(v97 + 16);
  v86[1] = v36;
  v39(v96);
  uint64_t v40 = sub_25A8A8610();
  os_log_type_t v41 = sub_25A8A88D0();
  BOOL v42 = os_log_type_enabled(v40, v41);
  v87 = v26;
  if (v42)
  {
    char v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = v34;
    uint64_t v45 = v33;
    uint64_t v46 = swift_slowAlloc();
    v101[0] = v46;
    *(_DWORD *)char v43 = 136315138;
    swift_beginAccess();
    sub_25A86BE74(v44, (uint64_t)v15);
    uint64_t v47 = v95;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v95 + 48))(v15, 1, v45) != 1)
    {
      uint64_t v48 = sub_25A8A83E0();
      unint64_t v50 = v49;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v15, v45);
      uint64_t v100 = sub_25A86BEDC(v48, v50, v101);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v40, v41, "Retrieve model at URL: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261148660](v46, -1, -1);
      MEMORY[0x261148660](v43, -1, -1);

      (*(void (**)(char *, uint64_t (*)(uint64_t, uint64_t, uint64_t)))(v97 + 8))(v96, v98);
      uint64_t v33 = v45;
      uint64_t v34 = (uint64_t)v92;
      goto LABEL_19;
    }
LABEL_37:
    v83 = (objc_class *)sub_25A86BDAC((uint64_t)v92);
    __break(1u);
    goto LABEL_38;
  }

  (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v35);
  uint64_t v47 = v95;
LABEL_19:
  swift_beginAccess();
  uint64_t v56 = v91;
  sub_25A86BE74(v34, v91);
  v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 48);
  int v58 = v57(v56, 1, v33);
  v59 = v93;
  if (v58 == 1)
  {
    sub_25A86BDAC(v56);
    v60 = v87;
    goto LABEL_24;
  }
  v98 = v57;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v93, v56, v33);
  sub_25A86BFB0();
  uint64_t v61 = (uint64_t)v89;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v89, v59, v33);
  uint64_t v62 = v33;
  id v63 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_initWithComputeUnits_, 0);
  id v64 = sub_25A86C50C(v61, (uint64_t)v63);

  (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v62);
  uint64_t v33 = v62;
  v60 = v87;
  v57 = v98;
  if (!v64)
  {
LABEL_24:
    v72 = sub_25A8A8610();
    os_log_type_t v73 = sub_25A8A88F0();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      uint64_t v75 = v34;
      uint64_t v76 = swift_slowAlloc();
      uint64_t v100 = v76;
      *(_DWORD *)v74 = 136315138;
      if (v57(v75, 1, v33))
      {
        uint64_t v77 = 0;
        unint64_t v78 = 0xE000000000000000;
      }
      else
      {
        uint64_t v79 = v95;
        uint64_t v80 = v86[0];
        (*(void (**)(void, uint64_t, uint64_t))(v95 + 16))(v86[0], v75, v33);
        uint64_t v77 = sub_25A8A83E0();
        uint64_t v81 = v33;
        unint64_t v78 = v82;
        (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v80, v81);
      }
      uint64_t v99 = sub_25A86BEDC(v77, v78, &v100);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v72, v73, "No model found at URL: %s", v74, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261148660](v76, -1, -1);
      MEMORY[0x261148660](v74, -1, -1);

      uint64_t v55 = v75;
    }
    else
    {

      uint64_t v55 = v34;
    }
LABEL_30:
    sub_25A86BDAC(v55);
    id v64 = 0;
    id v68 = 0;
LABEL_31:
    v71 = 0;
    goto LABEL_32;
  }
  id v65 = v64;
  v66 = (void *)sub_25A8A86A0();
  v67 = v90;
  id v68 = [v90 experimentIdentifiersWithNamespaceName:v66];

  if (!v68)
  {

    sub_25A86BDAC(v34);
    goto LABEL_31;
  }
  id v69 = objc_msgSend(v68, sel_experimentId);

  id v68 = (id)sub_25A8A86B0();
  v71 = v70;

  sub_25A86BDAC(v34);
LABEL_32:
  v83 = (objc_class *)v64;
  uint64_t v84 = (uint64_t)v68;
  v85 = v71;
LABEL_38:
  result.value.experimentId.value._object = v85;
  result.value.experimentId.value._countAndFlagsBits = v84;
  result.value.model.super.isa = v83;
  return result;
}

Swift::OpaquePointer_optional __swiftcall ShadowEvaluationManager.attemptShadowEvaluation()()
{
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25A8A8630();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A46AF08);
  uint64_t v1 = sub_25A8A8610();
  os_log_type_t v2 = sub_25A8A88D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25A85D000, v1, v2, "ProactiveShareSheetHarvestingLighthouse: Not implemented", v3, 2u);
    MEMORY[0x261148660](v3, -1, -1);
  }

  uint64_t v5 = 0;
  result.value._rawValue = v5;
  result.is_nil = v4;
  return result;
}

uint64_t sub_25A86BDAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A000);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A86BE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A86BE74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A86BEDC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25A86BFF0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25A869F58((uint64_t)v12, *a3);
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
      sub_25A869F58((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

unint64_t sub_25A86BFB0()
{
  unint64_t result = qword_26A46A008;
  if (!qword_26A46A008)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A46A008);
  }
  return result;
}

uint64_t sub_25A86BFF0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25A8A89B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25A86C1AC(a5, a6);
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
  uint64_t v8 = sub_25A8A8AE0();
  if (!v8)
  {
    sub_25A8A8B50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25A8A8BC0();
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

uint64_t sub_25A86C1AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25A86C244(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25A86C3BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25A86C3BC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25A86C244(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25A88B5F4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25A8A8AA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25A8A8B50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25A8A8700();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25A8A8BC0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25A8A8B50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25A86C3BC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A010);
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

id sub_25A86C50C(uint64_t a1, uint64_t a2)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v4 = (void *)sub_25A8A8400();
  v13[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_25A8A8440();
    int64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_25A8A83D0();

    swift_willThrow();
    uint64_t v11 = sub_25A8A8440();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
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
  unint64_t v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v31 = v4;
  id v32 = *(void **)(a2 + 32);
  uint64_t v33 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v32;
  *(void *)(a1 + 40) = v33;
  uint64_t v34 = *(void **)(a2 + 48);
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
  uint64_t v28 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
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
  id v25 = *(void **)(a2 + 384);
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
  unint64_t v4 = *(void **)(a2 + 24);
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

#error "25A86D238: too big function (funcsize=0)"

uint64_t sub_25A87ED2C()
{
  return 1;
}

uint64_t sub_25A87ED38(void *a1)
{
  id v1 = objc_msgSend(a1, sel_recipients);
  if (v1)
  {
    unint64_t v2 = v1;
    sub_25A86AE00(0, &qword_26A469FC8);
    sub_25A8A87A0();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A469FA8);
  sub_25A87F0F4();
  sub_25A8A8990();
  swift_bridgeObjectRelease();
  return sub_25A8A8BF0();
}

uint64_t sub_25A87EE04()
{
  return sub_25A869930();
}

BOOL sub_25A87EE28(void *a1)
{
  return objc_msgSend(a1, sel_mechanism) == (id)2
      || objc_msgSend(a1, sel_mechanism) == (id)3
      || objc_msgSend(a1, sel_mechanism) == (id)4;
}

BOOL sub_25A87EE8C(void *a1)
{
  return objc_msgSend(a1, sel_mechanism) == (id)13;
}

uint64_t sub_25A87EEB4(void *a1)
{
  id v1 = objc_msgSend(a1, sel_targetBundleId);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_25A8A86B0();

  return v3;
}

void sub_25A87EF18()
{
  qword_26A46AF00 = (uint64_t)&unk_2708620C8;
}

uint64_t sub_25A87EF2C()
{
  sub_25A87EF80(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80));

  return MEMORY[0x270FA0238](v0, 96, 7);
}

void sub_25A87EF80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  switch(a9 >> 61)
  {
    case 0uLL:
      sub_25A87F0A0(a3);

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
      sub_25A87F0A0(a3);
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_25A87F0A0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25A87F0B0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25A86AE00(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25A87F0F4()
{
  unint64_t result = qword_26A469FB0;
  if (!qword_26A469FB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A469FB8);
    sub_25A87F0B0((unint64_t *)&qword_26A469FC0, &qword_26A469FC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A469FB0);
  }
  return result;
}

unint64_t sub_25A87F198(char a1)
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
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_lh_defaultDatabaseDirectory);
  if (!v5)
  {
    sub_25A8A86B0();
    id v5 = (id)sub_25A8A86A0();
    swift_bridgeObjectRelease();
  }
  id v6 = objc_msgSend(v4, sel_lh_storeWithDirectory_readOnly_, v5, 1);

  sub_25A87F5E0(a1, v6, (uint64_t)__src);
  return memcpy(a2, __src, 0x158uLL);
}

uint64_t sub_25A87F5E0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = qword_26A469F70;
  id v145 = a2;
  if (v4 != -1) {
    goto LABEL_65;
  }
  while (1)
  {
    uint64_t v5 = qword_26A46AF00;
    int64_t v6 = *(void *)(qword_26A46AF00 + 16);
    uint64_t v7 = MEMORY[0x263F8EE78];
    if (v6)
    {
      uint64_t v147 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25A89CD70(0, v6, 0);
      uint64_t v8 = 0;
      uint64_t v7 = v147;
      unint64_t v9 = *(void *)(v147 + 16);
      do
      {
        int v10 = *(_DWORD *)(v5 + 4 * v8 + 32);
        unint64_t v11 = *(void *)(v147 + 24);
        if (v9 >= v11 >> 1) {
          sub_25A89CD70(v11 > 1, v9 + 1, 1);
        }
        ++v8;
        *(void *)(v147 + 16) = v9 + 1;
        *(_DWORD *)(v147 + 4 * v9++ + 32) = v10;
      }
      while (v6 != v8);
      swift_bridgeObjectRelease();
    }
    uint64_t v12 = sub_25A880AAC(a1, 0, v7);
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
          uint64_t v15 = sub_25A89C828(0, *((void *)v15 + 2) + 1, 1, v15);
        }
        unint64_t v18 = *((void *)v15 + 2);
        unint64_t v17 = *((void *)v15 + 3);
        if (v18 >= v17 >> 1) {
          uint64_t v15 = sub_25A89C828((char *)(v17 > 1), v18 + 1, 1, v15);
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
    uint64_t v21 = qword_26A46AF00;
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
              sub_25A89CD90(0, *(void *)(v22 + 16) + 1, 1);
            }
            unint64_t v24 = *(void *)(v22 + 16);
            unint64_t v23 = *(void *)(v22 + 24);
            if (v24 >= v23 >> 1) {
              sub_25A89CD90(v23 > 1, v24 + 1, 1);
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
  char v141 = sub_25A880F48(a1, 1, 1);
  char v140 = sub_25A880F48(a1, 2, 1);
  char v139 = sub_25A880F48(a1, 3, 1);
  uint64_t v138 = sub_25A881324(a1, 4, 10000);
  uint64_t v137 = sub_25A881324(a1, 5, 200);
  char v136 = sub_25A880F48(a1, 6, 0);
  char v135 = sub_25A880F48(a1, 7, 0);
  char v134 = sub_25A880F48(a1, 8, 0);
  uint64_t v35 = sub_25A8816E4(a1, 9, 0xD000000000000024, 0x800000025A8B2BB0);
  uint64_t v132 = v36;
  uint64_t v133 = v35;
  uint64_t v37 = sub_25A8816E4(a1, 10, 0xD00000000000005DLL, 0x800000025A8B2BE0);
  uint64_t v130 = v38;
  uint64_t v131 = v37;
  uint64_t v129 = sub_25A8816E4(a1, 11, 825241136, 0xE400000000000000);
  uint64_t v126 = v39;
  uint64_t v40 = sub_25A8816E4(a1, 12, 49, 0xE100000000000000);
  uint64_t v122 = v41;
  uint64_t v123 = v40;
  uint64_t v42 = sub_25A8816E4(a1, 13, 12341, 0xE200000000000000);
  uint64_t v127 = v43;
  uint64_t v128 = v42;
  uint64_t v44 = sub_25A8816E4(a1, 14, 55, 0xE100000000000000);
  uint64_t v124 = v45;
  uint64_t v125 = v44;
  uint64_t v46 = sub_25A8816E4(a1, 15, 49, 0xE100000000000000);
  uint64_t v120 = v47;
  uint64_t v121 = v46;
  uint64_t v48 = sub_25A8816E4(a1, 16, 0x6C3A7972616E6962, 0xEF6369747369676FLL);
  uint64_t v118 = v49;
  uint64_t v119 = v48;
  uint64_t v50 = sub_25A8816E4(a1, 18, 0x726F74636576, 0xE600000000000000);
  uint64_t v116 = v51;
  uint64_t v117 = v50;
  uint64_t v52 = sub_25A8816E4(a1, 19, 0xD000000000000012, 0x800000025A8B2C40);
  uint64_t v114 = v53;
  uint64_t v115 = v52;
  uint64_t v54 = sub_25A8816E4(a1, 20, 0xD000000000000011, 0x800000025A8B2C60);
  uint64_t v112 = v55;
  uint64_t v113 = v54;
  uint64_t v56 = sub_25A89C718(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v58 = v56[2];
  unint64_t v57 = v56[3];
  int64_t v59 = v57 >> 1;
  unint64_t v60 = v58 + 1;
  if (v57 >> 1 <= v58)
  {
    uint64_t v56 = sub_25A89C718((void *)(v57 > 1), v58 + 1, 1, v56);
    unint64_t v57 = v56[3];
    int64_t v59 = v57 >> 1;
  }
  v56[2] = v60;
  uint64_t v61 = &v56[2 * v58];
  v61[4] = 0xD00000000000003DLL;
  v61[5] = 0x800000025A8B2C80;
  int64_t v62 = v58 + 2;
  if (v59 < v62) {
    uint64_t v56 = sub_25A89C718((void *)(v57 > 1), v62, 1, v56);
  }
  v56[2] = v62;
  id v63 = &v56[2 * v60];
  v63[4] = 0xD000000000000040;
  v63[5] = 0x800000025A8B2CC0;
  unint64_t v65 = v56[2];
  unint64_t v64 = v56[3];
  int64_t v66 = v64 >> 1;
  unint64_t v67 = v65 + 1;
  if (v64 >> 1 <= v65)
  {
    uint64_t v56 = sub_25A89C718((void *)(v64 > 1), v65 + 1, 1, v56);
    unint64_t v64 = v56[3];
    int64_t v66 = v64 >> 1;
  }
  v56[2] = v67;
  id v68 = &v56[2 * v65];
  v68[4] = 0xD00000000000003FLL;
  v68[5] = 0x800000025A8B2D10;
  int64_t v69 = v65 + 2;
  if (v66 < v69) {
    uint64_t v56 = sub_25A89C718((void *)(v64 > 1), v69, 1, v56);
  }
  v56[2] = v69;
  v70 = &v56[2 * v67];
  v70[4] = 0xD000000000000042;
  v70[5] = 0x800000025A8B2D50;
  unint64_t v72 = v56[2];
  unint64_t v71 = v56[3];
  int64_t v73 = v71 >> 1;
  unint64_t v74 = v72 + 1;
  if (v71 >> 1 <= v72)
  {
    uint64_t v56 = sub_25A89C718((void *)(v71 > 1), v72 + 1, 1, v56);
    unint64_t v71 = v56[3];
    int64_t v73 = v71 >> 1;
  }
  v56[2] = v74;
  uint64_t v75 = &v56[2 * v72];
  v75[4] = 0xD000000000000041;
  v75[5] = 0x800000025A8B2DA0;
  int64_t v76 = v72 + 2;
  if (v73 < v76) {
    uint64_t v56 = sub_25A89C718((void *)(v71 > 1), v76, 1, v56);
  }
  v56[2] = v76;
  uint64_t v77 = &v56[2 * v74];
  v77[4] = 0xD000000000000044;
  v77[5] = 0x800000025A8B2DF0;
  unint64_t v79 = v56[2];
  unint64_t v78 = v56[3];
  int64_t v80 = v78 >> 1;
  unint64_t v81 = v79 + 1;
  if (v78 >> 1 <= v79)
  {
    uint64_t v56 = sub_25A89C718((void *)(v78 > 1), v79 + 1, 1, v56);
    unint64_t v78 = v56[3];
    int64_t v80 = v78 >> 1;
  }
  v56[2] = v81;
  unint64_t v82 = &v56[2 * v79];
  v82[4] = 0xD000000000000043;
  v82[5] = 0x800000025A8B2E40;
  int64_t v83 = v79 + 2;
  if (v80 < v83) {
    uint64_t v56 = sub_25A89C718((void *)(v78 > 1), v83, 1, v56);
  }
  v56[2] = v83;
  uint64_t v84 = &v56[2 * v81];
  v84[4] = 0xD000000000000046;
  v84[5] = 0x800000025A8B2E90;
  unint64_t v86 = v56[2];
  unint64_t v85 = v56[3];
  int64_t v87 = v85 >> 1;
  unint64_t v88 = v86 + 1;
  if (v85 >> 1 <= v86)
  {
    uint64_t v56 = sub_25A89C718((void *)(v85 > 1), v86 + 1, 1, v56);
    unint64_t v85 = v56[3];
    int64_t v87 = v85 >> 1;
  }
  v56[2] = v88;
  v89 = &v56[2 * v86];
  v89[4] = 0xD00000000000003DLL;
  v89[5] = 0x800000025A8B2EE0;
  int64_t v90 = v86 + 2;
  if (v87 < v90) {
    uint64_t v56 = sub_25A89C718((void *)(v85 > 1), v90, 1, v56);
  }
  v56[2] = v90;
  uint64_t v91 = &v56[2 * v88];
  v91[4] = 0xD000000000000040;
  v91[5] = 0x800000025A8B2F20;
  unint64_t v93 = v56[2];
  unint64_t v92 = v56[3];
  int64_t v94 = v92 >> 1;
  unint64_t v95 = v93 + 1;
  if (v92 >> 1 <= v93)
  {
    uint64_t v56 = sub_25A89C718((void *)(v92 > 1), v93 + 1, 1, v56);
    unint64_t v92 = v56[3];
    int64_t v94 = v92 >> 1;
  }
  v56[2] = v95;
  v96 = &v56[2 * v93];
  v96[4] = 0xD00000000000003FLL;
  v96[5] = 0x800000025A8B2F70;
  int64_t v97 = v93 + 2;
  if (v94 < v97) {
    uint64_t v56 = sub_25A89C718((void *)(v92 > 1), v97, 1, v56);
  }
  v56[2] = v97;
  v98 = &v56[2 * v95];
  v98[4] = 0xD000000000000042;
  v98[5] = 0x800000025A8B2FB0;
  uint64_t v111 = sub_25A881324(a1, 21, 1);
  double v99 = sub_25A881B34(a1, 22, 0.7);
  uint64_t v110 = sub_25A881324(a1, 23, 10);
  uint64_t v109 = sub_25A8816E4(a1, 24, 7500397, 0xE300000000000000);
  uint64_t v101 = v100;
  uint64_t v102 = sub_25A881324(a1, 25, 1);
  uint64_t v103 = sub_25A8816E4(a1, 26, 0x7247737961776C61, 0xEE00657461756461);
  uint64_t v105 = v104;
  double v106 = sub_25A881B34(a1, 27, 0.05);
  uint64_t v107 = sub_25A881324(a1, 28, 5);

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

uint64_t sub_25A880AAC(uint64_t a1, char a2, uint64_t a3)
{
  if (a1)
  {
    unint64_t v6 = sub_25A87F198(a2);
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_25A88B6D8(v6, v7), (v9 & 1) != 0))
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A030);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A038);
  if (swift_dynamicCast())
  {
    a3 = v34;
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25A8A8630();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A46AF08);
    swift_bridgeObjectRetain_n();
    uint64_t v12 = sub_25A8A8610();
    os_log_type_t v13 = sub_25A8A88D0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v35 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v16 = sub_25A87F198(a2);
      sub_25A86BEDC(v16, v17, &v35);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v18 = swift_bridgeObjectRetain();
      uint64_t v19 = MEMORY[0x261147AC0](v18, MEMORY[0x263F8E548]);
      unint64_t v21 = v20;
      swift_bridgeObjectRelease();
      sub_25A86BEDC(v19, v21, &v35);
      sub_25A8A89A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v12, v13, "MLSE Recipe: Loaded from Trial configuration %s = %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261148660](v15, -1, -1);
      MEMORY[0x261148660](v14, -1, -1);
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
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_25A8A8630();
    __swift_project_value_buffer(v22, (uint64_t)qword_26A46AF08);
    swift_bridgeObjectRetain_n();
    unint64_t v23 = sub_25A8A8610();
    os_log_type_t v24 = sub_25A8A88D0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v35 = v26;
      *(_DWORD *)uint64_t v25 = 136315394;
      unint64_t v27 = sub_25A87F198(a2);
      sub_25A86BEDC(v27, v28, &v35);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v29 = swift_bridgeObjectRetain();
      uint64_t v30 = MEMORY[0x261147AC0](v29, MEMORY[0x263F8E548]);
      unint64_t v32 = v31;
      swift_bridgeObjectRelease();
      sub_25A86BEDC(v30, v32, &v35);
      sub_25A8A89A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v23, v24, "MLSE Recipe: No parameter provided. Default to %s = %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261148660](v26, -1, -1);
      MEMORY[0x261148660](v25, -1, -1);
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

uint64_t sub_25A880F48(uint64_t a1, char a2, char a3)
{
  if (a1)
  {
    unint64_t v6 = sub_25A87F198(a2);
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_25A88B6D8(v6, v7), (v9 & 1) != 0))
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A030);
  if (!swift_dynamicCast())
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25A8A8630();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A46AF08);
    uint64_t v12 = sub_25A8A8610();
    os_log_type_t v13 = sub_25A8A88D0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v22 = sub_25A87F198(a2);
      sub_25A86BEDC(v22, v23, &v28);
      sub_25A8A89A0();
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
      sub_25A86BEDC(v24, v25, &v28);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      unint64_t v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_29;
    }
LABEL_30:

    swift_unknownObjectRelease();
    return a3 & 1;
  }
  a3 = v27 & 1;
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25A8A8630();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A46AF08);
  uint64_t v12 = sub_25A8A8610();
  os_log_type_t v13 = sub_25A8A88D0();
  if (!os_log_type_enabled(v12, v13)) {
    goto LABEL_30;
  }
  uint64_t v14 = swift_slowAlloc();
  uint64_t v15 = swift_slowAlloc();
  uint64_t v28 = v15;
  *(_DWORD *)uint64_t v14 = 136315394;
  unint64_t v16 = sub_25A87F198(a2);
  sub_25A86BEDC(v16, v17, &v28);
  sub_25A8A89A0();
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
  sub_25A86BEDC(v18, v19, &v28);
  sub_25A8A89A0();
  swift_bridgeObjectRelease();
  unint64_t v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_29:
  _os_log_impl(&dword_25A85D000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x261148660](v15, -1, -1);
  MEMORY[0x261148660](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3 & 1;
}

uint64_t sub_25A881324(uint64_t a1, char a2, uint64_t a3)
{
  if (a1)
  {
    unint64_t v6 = sub_25A87F198(a2);
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_25A88B6D8(v6, v7), (v9 & 1) != 0))
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A030);
  if (!swift_dynamicCast())
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25A8A8630();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A46AF08);
    uint64_t v12 = sub_25A8A8610();
    os_log_type_t v13 = sub_25A8A88D0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v27[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v22 = sub_25A87F198(a2);
      uint64_t v28 = sub_25A86BEDC(v22, v23, v27);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v28 = a3;
      uint64_t v24 = sub_25A8A8BF0();
      uint64_t v28 = sub_25A86BEDC(v24, v25, v27);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      unint64_t v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_unknownObjectRelease();
    return a3;
  }
  a3 = v27[0];
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25A8A8630();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A46AF08);
  uint64_t v12 = sub_25A8A8610();
  os_log_type_t v13 = sub_25A8A88D0();
  if (!os_log_type_enabled(v12, v13)) {
    goto LABEL_18;
  }
  uint64_t v14 = swift_slowAlloc();
  uint64_t v15 = swift_slowAlloc();
  v27[0] = v15;
  *(_DWORD *)uint64_t v14 = 136315394;
  unint64_t v16 = sub_25A87F198(a2);
  uint64_t v28 = sub_25A86BEDC(v16, v17, v27);
  sub_25A8A89A0();
  swift_bridgeObjectRelease();
  *(_WORD *)(v14 + 12) = 2080;
  uint64_t v28 = a3;
  uint64_t v18 = sub_25A8A8BF0();
  uint64_t v28 = sub_25A86BEDC(v18, v19, v27);
  sub_25A8A89A0();
  swift_bridgeObjectRelease();
  unint64_t v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_17:
  _os_log_impl(&dword_25A85D000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x261148660](v15, -1, -1);
  MEMORY[0x261148660](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3;
}

uint64_t sub_25A8816E4(uint64_t a1, char a2, uint64_t a3, unint64_t a4)
{
  if (a1)
  {
    unint64_t v8 = sub_25A87F198(a2);
    if (*(void *)(a1 + 16) && (unint64_t v10 = sub_25A88B6D8(v8, v9), (v11 & 1) != 0))
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A030);
  if (swift_dynamicCast())
  {
    a3 = v29[0];
    unint64_t v13 = v29[1];
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_25A8A8630();
    __swift_project_value_buffer(v14, (uint64_t)qword_26A46AF08);
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_25A8A8610();
    os_log_type_t v16 = sub_25A8A88D0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v29[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315394;
      unint64_t v19 = sub_25A87F198(a2);
      uint64_t v30 = sub_25A86BEDC(v19, v20, v29);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_25A86BEDC(a3, v13, v29);
      sub_25A8A89A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A85D000, v15, v16, "MLSE Recipe: Loaded from Trial configuration %s = %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261148660](v18, -1, -1);
      MEMORY[0x261148660](v17, -1, -1);
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
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25A8A8630();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A46AF08);
    swift_bridgeObjectRetain_n();
    unint64_t v22 = sub_25A8A8610();
    os_log_type_t v23 = sub_25A8A88D0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v29[0] = v25;
      *(_DWORD *)uint64_t v24 = 136315394;
      unint64_t v26 = sub_25A87F198(a2);
      uint64_t v30 = sub_25A86BEDC(v26, v27, v29);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_25A86BEDC(a3, a4, v29);
      sub_25A8A89A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A85D000, v22, v23, "MLSE Recipe: No parameter provided. Default to %s = %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x261148660](v25, -1, -1);
      MEMORY[0x261148660](v24, -1, -1);
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

double sub_25A881B34(uint64_t a1, char a2, double a3)
{
  if (a1)
  {
    unint64_t v6 = sub_25A87F198(a2);
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_25A88B6D8(v6, v7), (v9 & 1) != 0))
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A030);
  if (!swift_dynamicCast())
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25A8A8630();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A46AF08);
    uint64_t v12 = sub_25A8A8610();
    os_log_type_t v13 = sub_25A8A88D0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v27[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      unint64_t v22 = sub_25A87F198(a2);
      uint64_t v28 = sub_25A86BEDC(v22, v23, v27);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v24 = sub_25A8A8860();
      uint64_t v28 = sub_25A86BEDC(v24, v25, v27);
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      unint64_t v20 = "MLSE Recipe: No parameter provided. Default to %s = %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_unknownObjectRelease();
    return a3;
  }
  a3 = *(double *)v27;
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25A8A8630();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A46AF08);
  uint64_t v12 = sub_25A8A8610();
  os_log_type_t v13 = sub_25A8A88D0();
  if (!os_log_type_enabled(v12, v13)) {
    goto LABEL_18;
  }
  uint64_t v14 = swift_slowAlloc();
  uint64_t v15 = swift_slowAlloc();
  v27[0] = v15;
  *(_DWORD *)uint64_t v14 = 136315394;
  unint64_t v16 = sub_25A87F198(a2);
  uint64_t v28 = sub_25A86BEDC(v16, v17, v27);
  sub_25A8A89A0();
  swift_bridgeObjectRelease();
  *(_WORD *)(v14 + 12) = 2080;
  uint64_t v18 = sub_25A8A8860();
  uint64_t v28 = sub_25A86BEDC(v18, v19, v27);
  sub_25A8A89A0();
  swift_bridgeObjectRelease();
  unint64_t v20 = "MLSE Recipe: Loaded from Trial configuration %s = %s";
LABEL_17:
  _os_log_impl(&dword_25A85D000, v12, v13, v20, (uint8_t *)v14, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x261148660](v15, -1, -1);
  MEMORY[0x261148660](v14, -1, -1);
  swift_unknownObjectRelease();

  return a3;
}

uint64_t sub_25A881ECC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25A8A8B70();
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
    uint64_t result = sub_25A8A8B10();
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
          uint64_t v10 = (void *)MEMORY[0x261147DD0]();
          sub_25A86AE00(0, &qword_26A469FC8);
          id v6 = v10;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A469FD0);
          swift_dynamicCast();
          swift_unknownObjectRelease();
          sub_25A8A8AF0();
          sub_25A8A8B20();
          sub_25A8A8B30();
          sub_25A8A8B00();
          uint64_t v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        uint64_t v7 = (void **)(a1 + 32);
        sub_25A86AE00(0, &qword_26A469FC8);
        do
        {
          unint64_t v8 = *v7++;
          id v9 = v8;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A469FD0);
          swift_dynamicCast();

          sub_25A8A8AF0();
          sub_25A8A8B20();
          sub_25A8A8B30();
          sub_25A8A8B00();
          --v2;
        }
        while (v2);
      }
      return v11;
    }
  }
  return result;
}

uint64_t sub_25A8820DC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_25A89CDB0(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_25A89CDB0(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_25A89CDB0(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      *(void *)(v2 + 16) = v6 + 1;
      sub_25A885CFC(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_25A882204(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_25A8A8B70();
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
  uint64_t result = sub_25A89CDB0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x261147DD0](i, a1);
        sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25A89CDB0(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_25A89CDB0(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_25A885CFC(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      long long v8 = (id *)(a1 + 32);
      sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_25A89CDB0(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_25A89CDB0(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_25A885CFC(v12, (_OWORD *)(v3 + 32 * v11 + 32));
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

uint64_t sub_25A882468(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25A8A8570();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v32 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  unint64_t v17 = (char *)&v32 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v32 - v18;
  id v20 = *a1;
  id v21 = objc_msgSend(*a1, sel_domainIdentifier);
  if (!v21)
  {
    char v29 = 0;
    return v29 & 1;
  }
  unint64_t v22 = v21;
  uint64_t v32 = sub_25A8A86B0();
  uint64_t v35 = v23;

  id v24 = objc_msgSend(v20, sel_startDate);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_8;
  }
  unint64_t v25 = v24;
  sub_25A8A8530();

  unint64_t v26 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v26(v6, v17, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    sub_25A88593C((uint64_t)v6, &qword_26A46A040);
    char v29 = 0;
    return v29 & 1;
  }
  v26(v19, v6, v7);
  char v27 = sub_25A8930BC(v32, v35, v33);
  swift_bridgeObjectRelease();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v28(v14, v34, v7);
  v28(v11, (uint64_t)v19, v7);
  if (v27)
  {
    sub_25A8827C8();
    char v29 = sub_25A8A8690() ^ 1;
  }
  else
  {
    char v29 = 0;
  }
  uint64_t v30 = *(void (**)(char *, uint64_t))(v8 + 8);
  v30(v11, v7);
  v30(v14, v7);
  v30(v19, v7);
  return v29 & 1;
}

unint64_t sub_25A8827C8()
{
  unint64_t result = qword_26A46A048;
  if (!qword_26A46A048)
  {
    sub_25A8A8570();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A048);
  }
  return result;
}

void sub_25A882824(void *a1@<X8>)
{
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25A8A8B70()) {
    sub_25A885998(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v2 = MEMORY[0x263F8EE88];
  }
  *a1 = v2;
}

uint64_t sub_25A882880(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A058);
  uint64_t result = sub_25A8A8B90();
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
    unint64_t v17 = (uint64_t *)(*(void *)(v33 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = *(void *)(*(void *)(v33 + 56) + 8 * i);
    if ((v20 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_25A8A8A20();
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
        unint64_t v22 = (void *)MEMORY[0x263F8EE78];
        goto LABEL_30;
      }
    }
    if (v21 <= 0)
    {
      unint64_t v22 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
      unint64_t v22 = (void *)swift_allocObject();
      int64_t v23 = _swift_stdlib_malloc_size(v22);
      uint64_t v24 = v23 - 32;
      if (v23 < 32) {
        uint64_t v24 = v23 - 25;
      }
      v22[2] = v21;
      v22[3] = (2 * (v24 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    unint64_t v25 = sub_25A882B74(&v34, v22 + 4, v21, v20);
    uint64_t result = sub_25A885CF4();
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

void *sub_25A882B74(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v24 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_25A8A8A10();
    sub_25A86AE00(0, &qword_26A469FA0);
    sub_25A87F0B0(&qword_26A46A060, &qword_26A469FA0);
    uint64_t result = (void *)sub_25A8A8890();
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
    unint64_t v22 = v24;
LABEL_41:
    *unint64_t v22 = v4;
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
      if (!sub_25A8A8A40()) {
        goto LABEL_40;
      }
      sub_25A86AE00(0, &qword_26A469FA0);
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
      unint64_t v22 = v24;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_25A882E94(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, id a9)
{
  unint64_t v56 = MEMORY[0x263F8EE78];
  if (a1 && *(void *)(a1 + 16))
  {
    sub_25A86AE00(0, &qword_26A46A018);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46A170);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_25A8A9F70;
    sub_25A8820DC(a1);
    id v14 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    int64_t v15 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v16 = objc_msgSend(v14, sel_initWithArray_, v15);

    *(void *)(v13 + 56) = sub_25A86AE00(0, &qword_26A46A078);
    *(void *)(v13 + 64) = sub_25A87F0B0(&qword_26A46A080, &qword_26A46A078);
    *(void *)(v13 + 32) = v16;
    sub_25A8A88C0();
    MEMORY[0x261147A90]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25A8A87D0();
    }
    sub_25A8A87F0();
    sub_25A8A87C0();
  }
  if (a2)
  {
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_25A8A8B70();
      swift_bridgeObjectRelease();
      if (!v50) {
        goto LABEL_12;
      }
    }
    else if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_12;
    }
    sub_25A86AE00(0, &qword_26A46A018);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46A170);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_25A8A9F70;
    sub_25A882204(a2);
    id v18 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    uint64_t v19 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v18, sel_initWithArray_, v19);

    *(void *)(v17 + 56) = sub_25A86AE00(0, &qword_26A46A078);
    *(void *)(v17 + 64) = sub_25A87F0B0(&qword_26A46A080, &qword_26A46A078);
    *(void *)(v17 + 32) = v20;
    sub_25A8A88C0();
    MEMORY[0x261147A90]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25A8A87D0();
    }
    sub_25A8A87F0();
    sub_25A8A87C0();
  }
LABEL_12:
  if (a3)
  {
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_25A8A8B70();
      swift_bridgeObjectRelease();
      if (v51) {
        goto LABEL_15;
      }
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_15:
      sub_25A86AE00(0, &qword_26A46A018);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46A170);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_25A8A9F70;
      sub_25A882204(a3);
      id v22 = objc_allocWithZone(MEMORY[0x263EFFA08]);
      uint64_t v23 = (void *)sub_25A8A8790();
      swift_bridgeObjectRelease();
      id v24 = objc_msgSend(v22, sel_initWithArray_, v23);

      *(void *)(v21 + 56) = sub_25A86AE00(0, &qword_26A46A078);
      *(void *)(v21 + 64) = sub_25A87F0B0(&qword_26A46A080, &qword_26A46A078);
      *(void *)(v21 + 32) = v24;
      sub_25A8A88C0();
      MEMORY[0x261147A90]();
      if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25A8A87D0();
      }
      sub_25A8A87F0();
      sub_25A8A87C0();
    }
  }
  if (a4 && *(void *)(a4 + 16))
  {
    sub_25A86AE00(0, &qword_26A46A018);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46A170);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_25A8A9F70;
    sub_25A8820DC(a4);
    id v26 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    uint64_t v27 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(v26, sel_initWithArray_, v27);

    *(void *)(v25 + 56) = sub_25A86AE00(0, &qword_26A46A078);
    *(void *)(v25 + 64) = sub_25A87F0B0(&qword_26A46A080, &qword_26A46A078);
    *(void *)(v25 + 32) = v28;
    sub_25A8A88C0();
    MEMORY[0x261147A90]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25A8A87D0();
    }
    sub_25A8A87F0();
    sub_25A8A87C0();
  }
  if (a5 && *(void *)(a5 + 16))
  {
    sub_25A86AE00(0, &qword_26A46A018);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46A170);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_25A8A9F70;
    sub_25A8820DC(a5);
    id v30 = objc_allocWithZone(MEMORY[0x263EFFA08]);
    unint64_t v31 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v30, sel_initWithArray_, v31);

    *(void *)(v29 + 56) = sub_25A86AE00(0, &qword_26A46A078);
    *(void *)(v29 + 64) = sub_25A87F0B0(&qword_26A46A080, &qword_26A46A078);
    *(void *)(v29 + 32) = v32;
    sub_25A8A88C0();
    MEMORY[0x261147A90]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_25A8A87D0();
    }
    sub_25A8A87F0();
    sub_25A8A87C0();
  }
  if (a7) {
    goto LABEL_31;
  }
  sub_25A86AE00(0, &qword_26A46A018);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46A170);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_25A8A9F70;
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_initWithTimeIntervalSinceNow_, COERCE_DOUBLE(a6 ^ 0x8000000000000000));
  *(void *)(v33 + 56) = sub_25A86AE00(0, &qword_26A46A028);
  *(void *)(v33 + 64) = sub_25A87F0B0((unint64_t *)&unk_26A46A180, &qword_26A46A028);
  *(void *)(v33 + 32) = v34;
  sub_25A8A88C0();
  MEMORY[0x261147A90]();
  if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_48;
  }
  while (1)
  {
    sub_25A8A87F0();
    sub_25A8A87C0();
LABEL_31:
    if (v56 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_25A8A8B70();
      swift_bridgeObjectRelease();
      if (!v35)
      {
LABEL_41:
        swift_bridgeObjectRelease();
        sub_25A869ECC();
        swift_allocError();
        *(void *)uint64_t v48 = 0xD00000000000001CLL;
        *(void *)(v48 + 8) = 0x800000025A8B32A0;
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
    sub_25A86AE00(0, &qword_26A46A018);
    uint64_t v36 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v37 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v36);

    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A068);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_25A8A9F70;
    id v39 = objc_allocWithZone(MEMORY[0x263F08B30]);
    uint64_t v40 = (void *)sub_25A8A86A0();
    id v41 = objc_msgSend(v39, sel_initWithKey_ascending_, v40, 0);

    *(void *)(v38 + 56) = sub_25A86AE00(0, &qword_26A46A070);
    *(void *)(v38 + 32) = v41;
    uint64_t v42 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    if ((a8 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_48:
    sub_25A8A87D0();
  }
  id v43 = objc_msgSend(a9, sel_lh_queryInteractionsUsingPredicate_sortDescriptors_limit_error_, v37, v42);

  uint64_t v35 = 0;
  if (v43)
  {
    uint64_t v44 = sub_25A8A87A0();
    id v45 = 0;

    uint64_t v35 = sub_25A869814(v44);
    swift_bridgeObjectRelease();
    if (v35)
    {

      return v35;
    }
    sub_25A869ECC();
    swift_allocError();
    *(void *)uint64_t v47 = 0xD00000000000002ALL;
    *(void *)(v47 + 8) = 0x800000025A8B2540;
    *(unsigned char *)(v47 + 16) = 1;
  }
  else
  {
    id v46 = 0;
    sub_25A8A83D0();
  }
  swift_willThrow();

  return v35;
}

uint64_t sub_25A883AA4(unint64_t a1, char a2)
{
  LOBYTE(v2) = a2;
  uint64_t v257 = sub_25A8A85C0();
  unint64_t v4 = *(void *)(v257 - 8);
  MEMORY[0x270FA5388](v257);
  v256 = (char *)&v248 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v264 = sub_25A8A85E0();
  uint64_t v6 = *(void *)(v264 - 8);
  MEMORY[0x270FA5388](v264);
  v263 = (char *)&v248 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v267 = (char *)&v248 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v266 = (char *)&v248 - v12;
  MEMORY[0x270FA5388](v11);
  v265 = (char *)&v248 - v13;
  uint64_t v277 = sub_25A8A8570();
  uint64_t isUniquelyReferenced_nonNull_native = *(void *)(v277 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v277);
  v255 = (char *)&v248 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v254 = (char *)&v248 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v271 = (char *)&v248 - v20;
  MEMORY[0x270FA5388](v19);
  v253 = (char *)&v248 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A000);
  MEMORY[0x270FA5388](v22 - 8);
  v290 = (char *)&v248 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v292 = sub_25A8A8440();
  unint64_t v24 = *(void *)(v292 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v292);
  v284 = (char *)&v248 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  unint64_t v279 = a1;
  v280 = (char *)&v248 - v27;
  if (a1 >> 62) {
    goto LABEL_209;
  }
  uint64_t v28 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v278 = v28;
  if (!v28)
  {
LABEL_210:
    swift_bridgeObjectRelease();
    uint64_t v244 = 0;
    uint64_t v243 = 0;
    uint64_t v242 = 0;
    uint64_t v241 = 0;
    goto LABEL_211;
  }
LABEL_3:
  uint64_t v268 = 0;
  uint64_t v269 = 0;
  uint64_t v258 = 0;
  uint64_t v259 = 0;
  uint64_t v260 = 0;
  unint64_t v29 = v279;
  unint64_t v286 = v279 & 0xC000000000000001;
  uint64_t v275 = v279 & 0xFFFFFFFFFFFFFF8;
  unint64_t v274 = v279 + 32;
  v272 = (void (**)(char *, char *, uint64_t))(isUniquelyReferenced_nonNull_native + 32);
  v273 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(isUniquelyReferenced_nonNull_native + 56);
  v270 = (unsigned int (**)(char *, uint64_t, unint64_t))(isUniquelyReferenced_nonNull_native + 48);
  unsigned int v250 = *MEMORY[0x263F078E8];
  v252 = (void (**)(char *, void, uint64_t))(v4 + 104);
  v251 = (void (**)(char *, uint64_t))(v4 + 8);
  v262 = (void (**)(char *, uint64_t))(v6 + 8);
  v261 = (void (**)(char *, uint64_t))(isUniquelyReferenced_nonNull_native + 8);
  unsigned int v249 = *MEMORY[0x263F07890];
  v287 = (unint64_t *)(v24 + 32);
  v288 = (void (**)(char *, uint64_t, uint64_t, unint64_t))(v24 + 56);
  v283 = (unsigned int (**)(char *, uint64_t, unint64_t))(v24 + 48);
  v276 = (void (**)(char *, uint64_t))(v24 + 8);
  id v30 = (char *)MEMORY[0x263F8EE80];
  uint64_t v285 = v2;
  unint64_t v4 = 0;
  uint64_t v6 = v278;
  while (2)
  {
    if (v286)
    {
      id v31 = (id)MEMORY[0x261147DD0](v4, v29);
    }
    else
    {
      if (v4 >= *(void *)(v275 + 16)) {
        goto LABEL_204;
      }
      id v31 = *(id *)(v274 + 8 * v4);
    }
    id v32 = v31;
    BOOL v33 = __OFADD__(v4++, 1);
    if (v33) {
      goto LABEL_197;
    }
    unint64_t v291 = v4;
    id v293 = v31;
    switch(v285)
    {
      case 1:
        uint64_t v125 = (char *)objc_msgSend(v31, sel_attachments);
        if (!v125) {
          goto LABEL_4;
        }
        uint64_t v2 = v125;
        sub_25A86AE00(0, (unint64_t *)&qword_26A469FE0);
        unint64_t v24 = sub_25A8A87A0();

        if (v24 >> 62)
        {
          if ((v24 & 0x8000000000000000) != 0) {
            LOBYTE(v2) = v24;
          }
          else {
            LOBYTE(v2) = v24 & 0xF8;
          }
          swift_bridgeObjectRetain_n();
          uint64_t v126 = sub_25A8A8B70();
          swift_bridgeObjectRelease();
          if (v126)
          {
LABEL_93:
            unint64_t v289 = v24 & 0xC000000000000001;
            uint64_t v6 = 4;
            uint64_t v281 = v126;
            id v282 = (id)v24;
            while (1)
            {
              uint64_t v2 = (char *)(v6 - 4);
              id v127 = v289 ? (id)MEMORY[0x261147DD0](v6 - 4, v24) : *(id *)(v24 + 8 * v6);
              uint64_t v128 = v127;
              unint64_t v4 = v6 - 3;
              if (__OFADD__(v2, 1)) {
                goto LABEL_195;
              }
              id v129 = objc_msgSend(v127, sel_photoSceneDescriptor);
              if (v129)
              {
                uint64_t v130 = v129;
                unint64_t v24 = sub_25A8A86B0();
                uint64_t v132 = v131;

                id v133 = v32;
                uint64_t v2 = v30;
                uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                v294 = v30;
                unint64_t v135 = sub_25A88B6D8(v24, v132);
                uint64_t v136 = *((void *)v30 + 2);
                BOOL v137 = (v134 & 1) == 0;
                uint64_t v138 = v136 + v137;
                if (__OFADD__(v136, v137)) {
                  goto LABEL_200;
                }
                char v139 = v134;
                if (*((void *)v2 + 3) >= v138)
                {
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                    sub_25A8A082C();
                  }
                }
                else
                {
                  sub_25A89F1FC(v138, isUniquelyReferenced_nonNull_native);
                  unint64_t v140 = sub_25A88B6D8(v24, v132);
                  if ((v139 & 1) != (v141 & 1)) {
                    goto LABEL_220;
                  }
                  unint64_t v135 = v140;
                }
                uint64_t v2 = v294;
                swift_bridgeObjectRelease();
                if ((v139 & 1) == 0)
                {
                  swift_bridgeObjectRetain();
                  sub_25A882824(&v294);
                  id v142 = v294;
                  *(void *)&v2[8 * (v135 >> 6) + 64] |= 1 << v135;
                  id v143 = (unint64_t *)(*((void *)v2 + 6) + 16 * v135);
                  *id v143 = v24;
                  v143[1] = v132;
                  *(void *)(*((void *)v2 + 7) + 8 * v135) = v142;
                  uint64_t v144 = *((void *)v2 + 2);
                  BOOL v33 = __OFADD__(v144, 1);
                  uint64_t v145 = v144 + 1;
                  if (v33) {
                    goto LABEL_203;
                  }
                  *((void *)v2 + 2) = v145;
                }
                swift_bridgeObjectRetain();
                id v30 = v2;
                swift_bridgeObjectRelease();
                sub_25A89DBB0(&v294, v133);
                swift_bridgeObjectRelease();
                uint64_t v2 = v294;

                id v32 = v293;
                uint64_t v126 = v281;
                unint64_t v24 = (unint64_t)v282;
              }
              else
              {
              }
              ++v6;
              if (v4 == v126) {
                goto LABEL_190;
              }
            }
          }
        }
        else
        {
          uint64_t v126 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v126) {
            goto LABEL_93;
          }
        }
        goto LABEL_190;
      case 2:
        int64_t v66 = (char *)objc_msgSend(v31, sel_attachments);
        if (!v66) {
          goto LABEL_4;
        }
        uint64_t v2 = v66;
        sub_25A86AE00(0, (unint64_t *)&qword_26A469FE0);
        unint64_t v24 = sub_25A8A87A0();

        if (v24 >> 62)
        {
          if ((v24 & 0x8000000000000000) != 0) {
            LOBYTE(v2) = v24;
          }
          else {
            LOBYTE(v2) = v24 & 0xF8;
          }
          swift_bridgeObjectRetain_n();
          uint64_t v67 = sub_25A8A8B70();
          swift_bridgeObjectRelease();
          if (v67)
          {
LABEL_41:
            unint64_t v289 = v24 & 0xC000000000000001;
            uint64_t v6 = 4;
            uint64_t v281 = v67;
            id v282 = (id)v24;
            while (1)
            {
              uint64_t v2 = (char *)(v6 - 4);
              id v68 = v289 ? (id)MEMORY[0x261147DD0](v6 - 4, v24) : *(id *)(v24 + 8 * v6);
              int64_t v69 = v68;
              unint64_t v4 = v6 - 3;
              if (__OFADD__(v2, 1)) {
                goto LABEL_196;
              }
              id v70 = objc_msgSend(v68, sel_uti);
              if (v70)
              {
                unint64_t v71 = v70;
                unint64_t v24 = sub_25A8A86B0();
                uint64_t v73 = v72;

                id v74 = v32;
                uint64_t v2 = v30;
                uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                v294 = v30;
                unint64_t v76 = sub_25A88B6D8(v24, v73);
                uint64_t v77 = *((void *)v30 + 2);
                BOOL v78 = (v75 & 1) == 0;
                uint64_t v79 = v77 + v78;
                if (__OFADD__(v77, v78)) {
                  goto LABEL_199;
                }
                char v80 = v75;
                if (*((void *)v2 + 3) >= v79)
                {
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                    sub_25A8A082C();
                  }
                }
                else
                {
                  sub_25A89F1FC(v79, isUniquelyReferenced_nonNull_native);
                  unint64_t v81 = sub_25A88B6D8(v24, v73);
                  if ((v80 & 1) != (v82 & 1)) {
                    goto LABEL_220;
                  }
                  unint64_t v76 = v81;
                }
                uint64_t v2 = v294;
                swift_bridgeObjectRelease();
                if ((v80 & 1) == 0)
                {
                  swift_bridgeObjectRetain();
                  sub_25A882824(&v294);
                  int64_t v83 = v294;
                  *(void *)&v2[8 * (v76 >> 6) + 64] |= 1 << v76;
                  uint64_t v84 = (unint64_t *)(*((void *)v2 + 6) + 16 * v76);
                  *uint64_t v84 = v24;
                  v84[1] = v73;
                  *(void *)(*((void *)v2 + 7) + 8 * v76) = v83;
                  uint64_t v85 = *((void *)v2 + 2);
                  BOOL v33 = __OFADD__(v85, 1);
                  uint64_t v86 = v85 + 1;
                  if (v33) {
                    goto LABEL_202;
                  }
                  *((void *)v2 + 2) = v86;
                }
                swift_bridgeObjectRetain();
                id v30 = v2;
                swift_bridgeObjectRelease();
                sub_25A89DBB0(&v294, v74);
                swift_bridgeObjectRelease();
                uint64_t v2 = v294;

                id v32 = v293;
                uint64_t v67 = v281;
                unint64_t v24 = (unint64_t)v282;
              }
              else
              {
              }
              ++v6;
              if (v4 == v67) {
                goto LABEL_190;
              }
            }
          }
        }
        else
        {
          uint64_t v67 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v67) {
            goto LABEL_41;
          }
        }
        goto LABEL_190;
      case 3:
        int64_t v87 = (char *)objc_msgSend(v31, sel_attachments);
        if (!v87) {
          goto LABEL_4;
        }
        uint64_t v2 = v87;
        sub_25A86AE00(0, (unint64_t *)&qword_26A469FE0);
        uint64_t v88 = sub_25A8A87A0();

        if ((unint64_t)v88 >> 62)
        {
          if (v88 < 0) {
            LOBYTE(v2) = v88;
          }
          else {
            LOBYTE(v2) = v88 & 0xF8;
          }
          swift_bridgeObjectRetain_n();
          uint64_t v89 = sub_25A8A8B70();
          swift_bridgeObjectRelease();
          if (!v89) {
            goto LABEL_190;
          }
LABEL_62:
          unint64_t v289 = v88 & 0xC000000000000001;
          uint64_t v6 = 4;
          uint64_t v281 = v89;
          while (1)
          {
            uint64_t v2 = (char *)(v6 - 4);
            if (v289) {
              id v90 = (id)MEMORY[0x261147DD0](v6 - 4, v88);
            }
            else {
              id v90 = *(id *)(v88 + 8 * v6);
            }
            uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v90;
            uint64_t v91 = v6 - 3;
            if (__OFADD__(v2, 1))
            {
              __break(1u);
              goto LABEL_194;
            }
            id v92 = objc_msgSend(v90, sel_contentURL);
            if (!v92) {
              break;
            }
            unint64_t v93 = v92;
            int64_t v94 = v284;
            sub_25A8A8410();

            unint64_t v4 = *v287;
            uint64_t v2 = v290;
            unint64_t v95 = v94;
            unint64_t v24 = v292;
            ((void (*)(char *, char *, uint64_t))*v287)(v290, v95, v292);
            (*v288)(v2, 0, 1, v24);
            if ((*v283)(v2, 1, v24) == 1) {
              goto LABEL_64;
            }
            v96 = v280;
            unint64_t v24 = v292;
            ((void (*)(char *, char *, uint64_t))v4)(v280, v2, v292);
            sub_25A8A8420();
            uint64_t v2 = v97;
            swift_bridgeObjectRelease();
            if (v2)
            {
              unint64_t v4 = v88;
              unint64_t v24 = sub_25A8A83E0();
              uint64_t v99 = v98;
              id v282 = v32;
              uint64_t v2 = v30;
              char v100 = swift_isUniquelyReferenced_nonNull_native();
              v294 = v30;
              unint64_t v102 = sub_25A88B6D8(v24, v99);
              uint64_t v103 = *((void *)v30 + 2);
              BOOL v104 = (v101 & 1) == 0;
              uint64_t v105 = v103 + v104;
              if (__OFADD__(v103, v104)) {
                goto LABEL_205;
              }
              char v106 = v101;
              if (*((void *)v2 + 3) >= v105)
              {
                if ((v100 & 1) == 0) {
                  sub_25A8A082C();
                }
              }
              else
              {
                sub_25A89F1FC(v105, v100);
                unint64_t v107 = sub_25A88B6D8(v24, v99);
                if ((v106 & 1) != (v108 & 1)) {
                  goto LABEL_220;
                }
                unint64_t v102 = v107;
              }
              uint64_t v88 = v4;
              uint64_t v2 = v294;
              swift_bridgeObjectRelease();
              if ((v106 & 1) == 0)
              {
                swift_bridgeObjectRetain();
                sub_25A882824(&v294);
                uint64_t v109 = v294;
                *(void *)&v2[8 * (v102 >> 6) + 64] |= 1 << v102;
                uint64_t v110 = (unint64_t *)(*((void *)v2 + 6) + 16 * v102);
                *uint64_t v110 = v24;
                v110[1] = v99;
                *(void *)(*((void *)v2 + 7) + 8 * v102) = v109;
                uint64_t v111 = *((void *)v2 + 2);
                BOOL v33 = __OFADD__(v111, 1);
                uint64_t v112 = v111 + 1;
                if (v33) {
                  goto LABEL_206;
                }
                *((void *)v2 + 2) = v112;
              }
              swift_bridgeObjectRetain();
              uint64_t v113 = *((void *)v2 + 7);
              id v30 = v2;
              swift_bridgeObjectRelease();
              LOBYTE(v2) = v113 + 8 * v102;
              sub_25A89DBB0(&v294, v282);
              swift_bridgeObjectRelease();
              (*v276)(v280, v292);
              unint64_t v4 = (unint64_t)v294;

              id v32 = v293;
            }
            else
            {
              (*v276)(v96, v24);
            }
            uint64_t v89 = v281;
LABEL_65:
            ++v6;
            if (v91 == v89) {
              goto LABEL_190;
            }
          }
          uint64_t v2 = v290;
          (*v288)(v290, 1, 1, v292);
LABEL_64:
          sub_25A88593C((uint64_t)v2, &qword_26A46A000);

          goto LABEL_65;
        }
        uint64_t v89 = *(void *)((v88 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v89) {
          goto LABEL_62;
        }
LABEL_190:

        swift_bridgeObjectRelease_n();
LABEL_191:
        uint64_t v6 = v278;
        unint64_t v29 = v279;
LABEL_5:
        unint64_t v4 = v291;
        if (v291 != v6) {
          continue;
        }
        swift_bridgeObjectRelease();
        uint64_t v241 = v260;
        uint64_t v28 = v269;
        uint64_t v242 = v259;
        uint64_t v243 = v258;
        uint64_t v244 = v268;
LABEL_211:
        uint64_t v245 = swift_bridgeObjectRetain();
        uint64_t v246 = sub_25A882880(v245);
        swift_bridgeObjectRelease_n();
        sub_25A87F0A0(v244);
        sub_25A87F0A0(v28);
        sub_25A87F0A0(v243);
        sub_25A87F0A0(v242);
        sub_25A87F0A0(v241);
        return v246;
      case 4:
        uint64_t v55 = (char *)objc_msgSend(v31, sel_bundleId);
        if (!v55) {
          goto LABEL_4;
        }
        uint64_t v2 = v55;
        uint64_t v56 = sub_25A8A86B0();
        uint64_t v6 = v57;

        uint64_t isUniquelyReferenced_nonNull_native = v32;
        sub_25A87F0A0(v269);
        LOBYTE(v2) = (_BYTE)v30;
        char v58 = swift_isUniquelyReferenced_nonNull_native();
        v294 = v30;
        unint64_t v24 = sub_25A88B6D8(v56, v6);
        uint64_t v60 = *((void *)v30 + 2);
        BOOL v61 = (v59 & 1) == 0;
        uint64_t v62 = v60 + v61;
        if (__OFADD__(v60, v61)) {
          goto LABEL_207;
        }
        char v63 = v59;
        if (*((void *)v30 + 3) >= v62)
        {
          if ((v58 & 1) == 0) {
            sub_25A8A082C();
          }
        }
        else
        {
          sub_25A89F1FC(v62, v58);
          unint64_t v64 = sub_25A88B6D8(v56, v6);
          if ((v63 & 1) != (v65 & 1)) {
            goto LABEL_220;
          }
          unint64_t v24 = v64;
        }
        uint64_t v2 = v294;
        swift_bridgeObjectRelease();
        if (v63) {
          goto LABEL_145;
        }
        uint64_t v205 = swift_bridgeObjectRetain();
        sub_25A882820(&v294, v205);
        v206 = v294;
        *(void *)&v2[8 * (v24 >> 6) + 64] |= 1 << v24;
        v207 = (uint64_t *)(*((void *)v2 + 6) + 16 * v24);
        uint64_t *v207 = v56;
        v207[1] = v6;
        *(void *)(*((void *)v2 + 7) + 8 * v24) = v206;
        uint64_t v208 = *((void *)v2 + 2);
        BOOL v33 = __OFADD__(v208, 1);
        uint64_t v209 = v208 + 1;
        if (v33) {
          goto LABEL_215;
        }
        *((void *)v2 + 2) = v209;
LABEL_145:
        swift_bridgeObjectRetain();
        uint64_t v210 = *((void *)v2 + 7);
        id v30 = v2;
        swift_bridgeObjectRelease();
        LOBYTE(v2) = v210 + 8 * v24;
        sub_25A89DBB0(&v294, (void *)isUniquelyReferenced_nonNull_native);
        v211 = v294;
        swift_bridgeObjectRelease();

        v212 = &v299;
        goto LABEL_170;
      case 5:
        id v146 = objc_msgSend(v31, sel_startDate);
        if (!v146)
        {
          v203 = *v273;
          v204 = &v295;
          goto LABEL_138;
        }
        uint64_t v147 = v146;
        v148 = v271;
        sub_25A8A8530();

        v149 = *v272;
        uint64_t v2 = v265;
        v150 = v148;
        unint64_t v24 = v277;
        (*v272)(v265, v150, v277);
        (*v273)(v2, 0, 1, v24);
        if ((*v270)(v2, 1, v24) == 1) {
          goto LABEL_139;
        }
        v149(v253, v2, v277);
        v151 = v263;
        sub_25A8A85B0();
        v152 = v256;
        uint64_t v153 = v257;
        (*v252)(v256, v249, v257);
        uint64_t v154 = sub_25A8A85D0();
        (*v251)(v152, v153);
        (*v262)(v151, v264);
        v294 = (char *)v154;
        uint64_t v155 = sub_25A8A8BF0();
        uint64_t v157 = v156;
        uint64_t isUniquelyReferenced_nonNull_native = v32;
        sub_25A87F0A0(v258);
        char v158 = swift_isUniquelyReferenced_nonNull_native();
        v294 = v30;
        unint64_t v24 = sub_25A88B6D8(v155, v157);
        uint64_t v160 = *((void *)v30 + 2);
        BOOL v161 = (v159 & 1) == 0;
        uint64_t v162 = v160 + v161;
        if (__OFADD__(v160, v161)) {
          goto LABEL_213;
        }
        char v163 = v159;
        if (*((void *)v30 + 3) >= v162)
        {
          if ((v158 & 1) == 0) {
            sub_25A8A082C();
          }
        }
        else
        {
          sub_25A89F1FC(v162, v158);
          unint64_t v164 = sub_25A88B6D8(v155, v157);
          if ((v163 & 1) != (v165 & 1)) {
            goto LABEL_220;
          }
          unint64_t v24 = v164;
        }
        uint64_t v2 = v294;
        swift_bridgeObjectRelease();
        if ((v163 & 1) == 0)
        {
          uint64_t v220 = swift_bridgeObjectRetain();
          sub_25A882820(&v294, v220);
          v221 = v294;
          *(void *)&v2[8 * (v24 >> 6) + 64] |= 1 << v24;
          v222 = (uint64_t *)(*((void *)v2 + 6) + 16 * v24);
          uint64_t *v222 = v155;
          v222[1] = v157;
          *(void *)(*((void *)v2 + 7) + 8 * v24) = v221;
          uint64_t v223 = *((void *)v2 + 2);
          BOOL v33 = __OFADD__(v223, 1);
          uint64_t v224 = v223 + 1;
          if (v33) {
            goto LABEL_217;
          }
          *((void *)v2 + 2) = v224;
        }
        swift_bridgeObjectRetain();
        uint64_t v225 = *((void *)v2 + 7);
        id v30 = v2;
        swift_bridgeObjectRelease();
        LOBYTE(v2) = v225 + 8 * v24;
        sub_25A89DBB0(&v294, (void *)isUniquelyReferenced_nonNull_native);
        v226 = v294;
        swift_bridgeObjectRelease();

        (*v261)(v253, v277);
        v212 = (uint64_t *)&v290;
        goto LABEL_170;
      case 6:
        id v166 = objc_msgSend(v31, sel_startDate);
        if (!v166)
        {
          v203 = *v273;
          v204 = &v296;
          goto LABEL_138;
        }
        v167 = v166;
        v168 = v271;
        sub_25A8A8530();

        v169 = *v272;
        uint64_t v2 = v266;
        v170 = v168;
        unint64_t v24 = v277;
        (*v272)(v266, v170, v277);
        (*v273)(v2, 0, 1, v24);
        if ((*v270)(v2, 1, v24) == 1) {
          goto LABEL_139;
        }
        v169(v254, v2, v277);
        v171 = v263;
        sub_25A8A85B0();
        char v172 = sub_25A8A8590();
        (*v262)(v171, v264);
        if (v172) {
          uint64_t v173 = 1702195828;
        }
        else {
          uint64_t v173 = 0x65736C6166;
        }
        if (v172) {
          uint64_t v174 = 0xE400000000000000;
        }
        else {
          uint64_t v174 = 0xE500000000000000;
        }
        uint64_t isUniquelyReferenced_nonNull_native = v32;
        sub_25A87F0A0(v259);
        char v175 = swift_isUniquelyReferenced_nonNull_native();
        v294 = v30;
        unint64_t v24 = sub_25A88B6D8(v173, v174);
        uint64_t v177 = *((void *)v30 + 2);
        BOOL v178 = (v176 & 1) == 0;
        uint64_t v179 = v177 + v178;
        if (__OFADD__(v177, v178))
        {
          __break(1u);
LABEL_213:
          __break(1u);
LABEL_214:
          __break(1u);
LABEL_215:
          __break(1u);
LABEL_216:
          __break(1u);
LABEL_217:
          __break(1u);
LABEL_218:
          __break(1u);
LABEL_219:
          __break(1u);
LABEL_220:
          sub_25A8A8C40();
          __break(1u);
          JUMPOUT(0x25A885918);
        }
        char v180 = v176;
        if (*((void *)v30 + 3) >= v179)
        {
          if ((v175 & 1) == 0) {
            sub_25A8A082C();
          }
        }
        else
        {
          sub_25A89F1FC(v179, v175);
          unint64_t v181 = sub_25A88B6D8(v173, v174);
          if ((v180 & 1) != (v182 & 1)) {
            goto LABEL_220;
          }
          unint64_t v24 = v181;
        }
        uint64_t v2 = v294;
        swift_bridgeObjectRelease();
        if ((v180 & 1) == 0)
        {
          uint64_t v227 = swift_bridgeObjectRetain();
          sub_25A882820(&v294, v227);
          v228 = v294;
          *(void *)&v2[8 * (v24 >> 6) + 64] |= 1 << v24;
          v229 = (uint64_t *)(*((void *)v2 + 6) + 16 * v24);
          uint64_t *v229 = v173;
          v229[1] = v174;
          *(void *)(*((void *)v2 + 7) + 8 * v24) = v228;
          uint64_t v230 = *((void *)v2 + 2);
          BOOL v33 = __OFADD__(v230, 1);
          uint64_t v231 = v230 + 1;
          if (v33) {
            goto LABEL_218;
          }
          *((void *)v2 + 2) = v231;
        }
        swift_bridgeObjectRetain();
        uint64_t v232 = *((void *)v2 + 7);
        id v30 = v2;
        swift_bridgeObjectRelease();
        LOBYTE(v2) = v232 + 8 * v24;
        sub_25A89DBB0(&v294, (void *)isUniquelyReferenced_nonNull_native);
        v233 = v294;
        swift_bridgeObjectRelease();

        (*v261)(v254, v277);
        v212 = (uint64_t *)&v291;
        goto LABEL_170;
      case 7:
        uint64_t v114 = (char *)objc_msgSend(v31, sel_locationUUID);
        if (!v114) {
          goto LABEL_4;
        }
        uint64_t v2 = v114;
        uint64_t v115 = sub_25A8A86B0();
        uint64_t v6 = v116;

        uint64_t isUniquelyReferenced_nonNull_native = v32;
        sub_25A87F0A0(v268);
        LOBYTE(v2) = (_BYTE)v30;
        char v117 = swift_isUniquelyReferenced_nonNull_native();
        v294 = v30;
        unint64_t v24 = sub_25A88B6D8(v115, v6);
        uint64_t v119 = *((void *)v30 + 2);
        BOOL v120 = (v118 & 1) == 0;
        uint64_t v121 = v119 + v120;
        if (__OFADD__(v119, v120)) {
          goto LABEL_208;
        }
        char v122 = v118;
        if (*((void *)v30 + 3) >= v121)
        {
          if ((v117 & 1) == 0) {
            sub_25A8A082C();
          }
        }
        else
        {
          sub_25A89F1FC(v121, v117);
          unint64_t v123 = sub_25A88B6D8(v115, v6);
          if ((v122 & 1) != (v124 & 1)) {
            goto LABEL_220;
          }
          unint64_t v24 = v123;
        }
        uint64_t v2 = v294;
        swift_bridgeObjectRelease();
        if (v122) {
          goto LABEL_151;
        }
        uint64_t v213 = swift_bridgeObjectRetain();
        sub_25A882820(&v294, v213);
        v214 = v294;
        *(void *)&v2[8 * (v24 >> 6) + 64] |= 1 << v24;
        v215 = (uint64_t *)(*((void *)v2 + 6) + 16 * v24);
        uint64_t *v215 = v115;
        v215[1] = v6;
        *(void *)(*((void *)v2 + 7) + 8 * v24) = v214;
        uint64_t v216 = *((void *)v2 + 2);
        BOOL v33 = __OFADD__(v216, 1);
        uint64_t v217 = v216 + 1;
        if (v33) {
          goto LABEL_216;
        }
        *((void *)v2 + 2) = v217;
LABEL_151:
        swift_bridgeObjectRetain();
        uint64_t v218 = *((void *)v2 + 7);
        id v30 = v2;
        swift_bridgeObjectRelease();
        LOBYTE(v2) = v218 + 8 * v24;
        sub_25A89DBB0(&v294, (void *)isUniquelyReferenced_nonNull_native);
        v219 = v294;
        swift_bridgeObjectRelease();

        v212 = &v298;
        goto LABEL_170;
      case 8:
        id v183 = objc_msgSend(v31, sel_startDate);
        if (!v183)
        {
          v203 = *v273;
          v204 = &v297;
LABEL_138:
          uint64_t v2 = (char *)*(v204 - 32);
          v203(v2, 1, 1, v277);
LABEL_139:

          sub_25A88593C((uint64_t)v2, &qword_26A46A040);
          goto LABEL_5;
        }
        v184 = v183;
        v185 = v271;
        sub_25A8A8530();

        v186 = *v272;
        uint64_t v2 = v267;
        v187 = v185;
        unint64_t v24 = v277;
        (*v272)(v267, v187, v277);
        (*v273)(v2, 0, 1, v24);
        if ((*v270)(v2, 1, v24) == 1) {
          goto LABEL_139;
        }
        v186(v255, v2, v277);
        v188 = v263;
        sub_25A8A85B0();
        v189 = v256;
        uint64_t v190 = v257;
        (*v252)(v256, v250, v257);
        uint64_t v191 = sub_25A8A85D0();
        (*v251)(v189, v190);
        (*v262)(v188, v264);
        v294 = (char *)v191;
        uint64_t v192 = sub_25A8A8BF0();
        uint64_t v194 = v193;
        uint64_t isUniquelyReferenced_nonNull_native = v32;
        sub_25A87F0A0(v260);
        char v195 = swift_isUniquelyReferenced_nonNull_native();
        v294 = v30;
        unint64_t v24 = sub_25A88B6D8(v192, v194);
        uint64_t v197 = *((void *)v30 + 2);
        BOOL v198 = (v196 & 1) == 0;
        uint64_t v199 = v197 + v198;
        if (__OFADD__(v197, v198)) {
          goto LABEL_214;
        }
        char v200 = v196;
        if (*((void *)v30 + 3) >= v199)
        {
          if ((v195 & 1) == 0) {
            sub_25A8A082C();
          }
        }
        else
        {
          sub_25A89F1FC(v199, v195);
          unint64_t v201 = sub_25A88B6D8(v192, v194);
          if ((v200 & 1) != (v202 & 1)) {
            goto LABEL_220;
          }
          unint64_t v24 = v201;
        }
        uint64_t v2 = v294;
        swift_bridgeObjectRelease();
        if ((v200 & 1) == 0)
        {
          uint64_t v234 = swift_bridgeObjectRetain();
          sub_25A882820(&v294, v234);
          v235 = v294;
          *(void *)&v2[8 * (v24 >> 6) + 64] |= 1 << v24;
          v236 = (uint64_t *)(*((void *)v2 + 6) + 16 * v24);
          uint64_t *v236 = v192;
          v236[1] = v194;
          *(void *)(*((void *)v2 + 7) + 8 * v24) = v235;
          uint64_t v237 = *((void *)v2 + 2);
          BOOL v33 = __OFADD__(v237, 1);
          uint64_t v238 = v237 + 1;
          if (v33) {
            goto LABEL_219;
          }
          *((void *)v2 + 2) = v238;
        }
        swift_bridgeObjectRetain();
        uint64_t v239 = *((void *)v2 + 7);
        id v30 = v2;
        swift_bridgeObjectRelease();
        LOBYTE(v2) = v239 + 8 * v24;
        sub_25A89DBB0(&v294, (void *)isUniquelyReferenced_nonNull_native);
        v240 = v294;
        swift_bridgeObjectRelease();

        (*v261)(v255, v277);
        v212 = &v292;
LABEL_170:
        *(v212 - 32) = (uint64_t)sub_25A882820;
        goto LABEL_191;
      default:
        id v34 = (char *)objc_msgSend(v31, sel_attachments);
        if (!v34)
        {
LABEL_4:

          goto LABEL_5;
        }
        uint64_t v2 = v34;
        sub_25A86AE00(0, (unint64_t *)&qword_26A469FE0);
        unint64_t v24 = sub_25A8A87A0();

        if (v24 >> 62)
        {
          if ((v24 & 0x8000000000000000) != 0) {
            LOBYTE(v2) = v24;
          }
          else {
            LOBYTE(v2) = v24 & 0xF8;
          }
          swift_bridgeObjectRetain_n();
          uint64_t v35 = sub_25A8A8B70();
          swift_bridgeObjectRelease();
          if (v35)
          {
LABEL_15:
            unint64_t v289 = v24 & 0xC000000000000001;
            uint64_t v6 = 4;
            uint64_t v281 = v35;
            id v282 = (id)v24;
            while (1)
            {
              uint64_t v2 = (char *)(v6 - 4);
              id v36 = v289 ? (id)MEMORY[0x261147DD0](v6 - 4, v24) : *(id *)(v24 + 8 * v6);
              id v37 = v36;
              unint64_t v4 = v6 - 3;
              if (__OFADD__(v2, 1)) {
                break;
              }
              id v38 = objc_msgSend(v36, sel_personInPhoto);
              if (v38)
              {
                id v39 = v38;
                unint64_t v24 = sub_25A8A86B0();
                uint64_t v41 = v40;

                id v42 = v32;
                uint64_t v2 = v30;
                uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                v294 = v30;
                unint64_t v44 = sub_25A88B6D8(v24, v41);
                uint64_t v45 = *((void *)v30 + 2);
                BOOL v46 = (v43 & 1) == 0;
                uint64_t v47 = v45 + v46;
                if (__OFADD__(v45, v46)) {
                  goto LABEL_198;
                }
                char v48 = v43;
                if (*((void *)v2 + 3) >= v47)
                {
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                    sub_25A8A082C();
                  }
                }
                else
                {
                  sub_25A89F1FC(v47, isUniquelyReferenced_nonNull_native);
                  unint64_t v49 = sub_25A88B6D8(v24, v41);
                  if ((v48 & 1) != (v50 & 1)) {
                    goto LABEL_220;
                  }
                  unint64_t v44 = v49;
                }
                uint64_t v2 = v294;
                swift_bridgeObjectRelease();
                if ((v48 & 1) == 0)
                {
                  swift_bridgeObjectRetain();
                  sub_25A882824(&v294);
                  uint64_t v51 = v294;
                  *(void *)&v2[8 * (v44 >> 6) + 64] |= 1 << v44;
                  uint64_t v52 = (unint64_t *)(*((void *)v2 + 6) + 16 * v44);
                  *uint64_t v52 = v24;
                  v52[1] = v41;
                  *(void *)(*((void *)v2 + 7) + 8 * v44) = v51;
                  uint64_t v53 = *((void *)v2 + 2);
                  BOOL v33 = __OFADD__(v53, 1);
                  uint64_t v54 = v53 + 1;
                  if (v33) {
                    goto LABEL_201;
                  }
                  *((void *)v2 + 2) = v54;
                }
                swift_bridgeObjectRetain();
                id v30 = v2;
                swift_bridgeObjectRelease();
                sub_25A89DBB0(&v294, v42);
                swift_bridgeObjectRelease();
                uint64_t v2 = v294;

                id v32 = v293;
                uint64_t v35 = v281;
                unint64_t v24 = (unint64_t)v282;
              }
              else
              {
              }
              ++v6;
              if (v4 == v35) {
                goto LABEL_190;
              }
            }
LABEL_194:
            __break(1u);
LABEL_195:
            __break(1u);
LABEL_196:
            __break(1u);
LABEL_197:
            __break(1u);
LABEL_198:
            __break(1u);
LABEL_199:
            __break(1u);
LABEL_200:
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
            __break(1u);
LABEL_209:
            swift_bridgeObjectRetain();
            uint64_t v28 = sub_25A8A8B70();
            uint64_t v278 = v28;
            if (!v28) {
              goto LABEL_210;
            }
            goto LABEL_3;
          }
        }
        else
        {
          uint64_t v35 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v35) {
            goto LABEL_15;
          }
        }
        goto LABEL_190;
    }
  }
}

uint64_t sub_25A88593C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_25A885998(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25A8A8B70();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A050);
      uint64_t v3 = sub_25A8A8A80();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25A8A8B70();
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
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x261147DD0](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_25A8A8970();
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
          return;
        }
      }
      sub_25A86AE00(0, &qword_26A469FA0);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_25A8A8980();

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
          char v22 = sub_25A8A8980();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_25A8A8970();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_25A86AE00(0, &qword_26A469FA0);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_25A8A8980();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_25A8A8980();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_25A885CF4()
{
  return swift_release();
}

_OWORD *sub_25A885CFC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25A885D0C()
{
  uint64_t v0 = sub_25A8A8630();
  __swift_allocate_value_buffer(v0, qword_26A46AF08);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A46AF08);
  return sub_25A8A8620();
}

BOOL sub_25A885D80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25A885D94()
{
  return sub_25A8A8CB0();
}

uint64_t sub_25A885DDC()
{
  return sub_25A8A8CA0();
}

uint64_t sub_25A885E0C()
{
  return sub_25A8A8CB0();
}

uint64_t sub_25A885E50@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_25A888420(*a1);
  *a2 = result;
  return result;
}

void sub_25A885E7C(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t sub_25A885E90()
{
  return sub_25A8A8CA0();
}

uint64_t sub_25A885EC0()
{
  return sub_25A8A8CB0();
}

uint64_t sub_25A885F08()
{
  return sub_25A8A8CB0();
}

uint64_t sub_25A885F4C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    uint64_t v3 = 0x72456D6F74737563;
  }
  else
  {
    sub_25A8A8A90();
    swift_bridgeObjectRelease();
    uint64_t v3 = 0x4664696C61766E69;
  }
  uint64_t v5 = v3;
  sub_25A8A86F0();
  sub_25A8A86F0();
  return v5;
}

uint64_t sub_25A886018()
{
  return sub_25A885F4C(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

void sub_25A886024()
{
  qword_26A46AF20 = (uint64_t)&unk_270862080;
}

void *sub_25A886038()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A088);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25A8A9F70;
  uint64_t v1 = sub_25A869930();
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v2;
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v2;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25A89C718(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v7 = v5[2];
    unint64_t v6 = v5[3];
    if (v7 >= v6 >> 1) {
      uint64_t v5 = sub_25A89C718((void *)(v6 > 1), v7 + 1, 1, v5);
    }
    v5[2] = v7 + 1;
    uint64_t v8 = &v5[2 * v7];
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

uint64_t sub_25A886120(void *a1)
{
  id v1 = objc_msgSend(a1, sel_attachments);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = v1;
  sub_25A88783C();
  unint64_t v3 = sub_25A8A87A0();

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
  uint64_t result = sub_25A8A8B70();
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
        id v8 = (id)MEMORY[0x261147DD0](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_uti);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_25A8A86B0();
        uint64_t v14 = v13;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v7 = sub_25A89C718(0, v7[2] + 1, 1, v7);
        }
        unint64_t v16 = v7[2];
        unint64_t v15 = v7[3];
        if (v16 >= v15 >> 1) {
          unint64_t v7 = sub_25A89C718((void *)(v15 > 1), v16 + 1, 1, v7);
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

void *sub_25A8862E8(void *a1)
{
  return sub_25A8869C0(a1, (SEL *)&selRef_targetBundleId);
}

uint64_t sub_25A8862F4(void *a1)
{
  uint64_t v2 = sub_25A8A8570();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25A8A85E0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A090);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_25A8A9F70;
  id v14 = objc_msgSend(self, sel_currentCalendar);
  sub_25A8A85A0();

  id v15 = objc_msgSend(a1, sel_startDate);
  if (!v15)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
    goto LABEL_7;
  }
  unint64_t v16 = v15;
  sub_25A8A8530();

  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
  if (result == 1)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  char v18 = sub_25A8A8590();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  uint64_t v19 = 0x7961646B656577;
  if (v18) {
    uint64_t v19 = 0x646E656B656577;
  }
  *(void *)(v13 + 32) = v19;
  *(void *)(v13 + 40) = 0xE700000000000000;
  return v13;
}

uint64_t sub_25A8865F8(uint64_t a1)
{
  return sub_25A886AE8(a1, sub_25A8699EC);
}

void *sub_25A886610(void *a1)
{
  return sub_25A8869C0(a1, (SEL *)&selRef_locationUUID);
}

uint64_t sub_25A88661C(void *a1)
{
  uint64_t v2 = sub_25A8A84A0();
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_25A8A84C0();
  uint64_t v5 = *(void *)(v27 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v27);
  id v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_25A8A8570();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A090);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_25A8A9F70;
  id v19 = objc_msgSend(a1, sel_startDate);
  if (v19)
  {
    uint64_t v20 = v19;
    sub_25A8A8530();

    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v14, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11);
    if (result != 1)
    {
      MEMORY[0x2611476D0]();
      sub_25A8A8490();
      sub_25A8A84B0();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v26);
      char v22 = *(void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v23 = v27;
      v22(v8, v27);
      sub_25A88787C();
      sub_25A8A8550();
      v22(v10, v23);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
      return v18;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v17, 1, 1, v11);
  }
  __break(1u);
  return result;
}

void *sub_25A8869B4(void *a1)
{
  return sub_25A8869C0(a1, (SEL *)&selRef_bundleId);
}

void *sub_25A8869C0(void *a1, SEL *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A088);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25A8A9F70;
  id v5 = [a1 *a2];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_25A8A86B0();
    uint64_t v9 = v8;

    *(void *)(inited + 32) = v7;
    *(void *)(inited + 40) = v9;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25A89C718(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v12 = v10[2];
    unint64_t v11 = v10[3];
    if (v12 >= v11 >> 1) {
      uint64_t v10 = sub_25A89C718((void *)(v11 > 1), v12 + 1, 1, v10);
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

uint64_t sub_25A886AD0(uint64_t a1)
{
  return sub_25A886AE8(a1, (uint64_t (*)(void))sub_25A869C30);
}

uint64_t sub_25A886AE8(uint64_t a1, uint64_t (*a2)(void))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A090);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25A8A9F70;
  *(void *)(v3 + 32) = a2();
  *(void *)(v3 + 40) = v4;
  return v3;
}

void *sub_25A886B4C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_keywords);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_25A8A87A0();
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A0A0);
  sub_25A8878D4();
  sub_25A8A8990();
  uint64_t v3 = sub_25A8A8BF0();
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_25A89C718(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v8 = v6[2];
  unint64_t v7 = v6[3];
  if (v8 >= v7 >> 1) {
    uint64_t v6 = sub_25A89C718((void *)(v7 > 1), v8 + 1, 1, v6);
  }
  v6[2] = v8 + 1;
  uint64_t v9 = &v6[2 * v8];
  v9[4] = v3;
  v9[5] = v5;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_25A886C78(void *a1)
{
  uint64_t v2 = sub_25A8A8570();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25A8A85C0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_25A8A85E0();
  uint64_t v13 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A8A85B0();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F07890], v9);
  id v16 = objc_msgSend(a1, sel_startDate);
  if (!v16)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
    goto LABEL_7;
  }
  uint64_t v17 = v16;
  sub_25A8A8530();

  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
  if (result == 1)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v19 = sub_25A8A85D0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v28);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  uint64_t v30 = MEMORY[0x263F8EE78];
  sub_25A89CDD0(0, 1, 0);
  uint64_t v20 = v30;
  uint64_t v29 = v19;
  uint64_t v21 = sub_25A8A8BF0();
  uint64_t v23 = v22;
  unint64_t v25 = *(void *)(v20 + 16);
  unint64_t v24 = *(void *)(v20 + 24);
  if (v25 >= v24 >> 1)
  {
    sub_25A89CDD0(v24 > 1, v25 + 1, 1);
    uint64_t v20 = v30;
  }
  *(void *)(v20 + 16) = v25 + 1;
  uint64_t v26 = v20 + 16 * v25;
  *(void *)(v26 + 32) = v21;
  *(void *)(v26 + 40) = v23;
  return v20;
}

id sub_25A887040(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A0B8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(a1, sel_attachments);
  if (v5)
  {
    uint64_t v6 = v5;
    sub_25A88783C();
    unint64_t v7 = sub_25A8A87A0();

    if (!(v7 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v7 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62))
    {
LABEL_3:
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25A8A8B70();
  if (v8)
  {
LABEL_4:
    unint64_t v23 = v7 & 0xC000000000000001;
    uint64_t v9 = 4;
    while (1)
    {
      id result = v23 ? (id)MEMORY[0x261147DD0](v9 - 4, v7) : *(id *)(v7 + 8 * v9);
      uint64_t v11 = result;
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1)) {
        break;
      }
      id v13 = objc_msgSend(result, sel_uti);
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = sub_25A8A86B0();
        unint64_t v17 = v16;
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v17 = 0xE000000000000000;
      }
      uint64_t v26 = v15;
      unint64_t v27 = v17;
      unint64_t v24 = 0xD000000000000038;
      unint64_t v25 = 0x800000025A8B3380;
      uint64_t v18 = sub_25A8A8580();
      uint64_t v19 = 1;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 1, 1, v18);
      sub_25A887940();
      sub_25A8A89C0();
      char v21 = v20;
      sub_25A88593C((uint64_t)v4, &qword_26A46A0B8);

      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0) {
        goto LABEL_15;
      }
      ++v9;
      if (v12 == v8) {
        goto LABEL_14;
      }
    }
    __break(1u);
    return result;
  }
LABEL_14:
  uint64_t v19 = 0;
LABEL_15:
  swift_bridgeObjectRelease_n();
  return (id)v19;
}

id sub_25A8872BC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A0B8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(a1, sel_attachments);
  if (v5)
  {
    uint64_t v6 = v5;
    sub_25A88783C();
    unint64_t v7 = sub_25A8A87A0();

    if (!(v7 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v7 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62))
    {
LABEL_3:
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_25A8A8B70();
  if (v8)
  {
LABEL_4:
    unint64_t v23 = v7 & 0xC000000000000001;
    uint64_t v9 = 4;
    while (1)
    {
      id result = v23 ? (id)MEMORY[0x261147DD0](v9 - 4, v7) : *(id *)(v7 + 8 * v9);
      uint64_t v11 = result;
      uint64_t v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1)) {
        break;
      }
      id v13 = objc_msgSend(result, sel_uti);
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = sub_25A8A86B0();
        unint64_t v17 = v16;
      }
      else
      {
        uint64_t v15 = 0;
        unint64_t v17 = 0xE000000000000000;
      }
      uint64_t v26 = v15;
      unint64_t v27 = v17;
      unint64_t v24 = 0xD00000000000002ALL;
      unint64_t v25 = 0x800000025A8B33C0;
      uint64_t v18 = sub_25A8A8580();
      uint64_t v19 = 1;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 1, 1, v18);
      sub_25A887940();
      sub_25A8A89C0();
      char v21 = v20;
      sub_25A88593C((uint64_t)v4, &qword_26A46A0B8);

      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0) {
        goto LABEL_15;
      }
      ++v9;
      if (v12 == v8) {
        goto LABEL_14;
      }
    }
    __break(1u);
    return result;
  }
LABEL_14:
  uint64_t v19 = 0;
LABEL_15:
  swift_bridgeObjectRelease_n();
  return (id)v19;
}

uint64_t sub_25A887538(void *a1)
{
  uint64_t v2 = sub_25A8A8440();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v24 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A000);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_attachments);
  if (v8)
  {
    uint64_t v9 = v8;
    sub_25A88783C();
    unint64_t v10 = sub_25A8A87A0();

    if (!(v10 >> 62)) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v10 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62))
    {
LABEL_3:
      uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v11) {
        goto LABEL_4;
      }
LABEL_16:
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_25A8A8B70();
  if (!v11) {
    goto LABEL_16;
  }
LABEL_4:
  unint64_t v25 = v10 & 0xC000000000000001;
  uint64_t v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  uint64_t v22 = (unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  unint64_t v23 = (void (**)(char *, char *, uint64_t))(v3 + 32);
  uint64_t v13 = 4;
  while (1)
  {
    uint64_t result = v25 ? MEMORY[0x261147DD0](v13 - 4, v10) : (uint64_t)*(id *)(v10 + 8 * v13);
    uint64_t v15 = (void *)result;
    uint64_t v16 = v13 - 3;
    if (__OFADD__(v13 - 4, 1)) {
      break;
    }
    id v17 = objc_msgSend((id)result, sel_contentURL);
    if (v17)
    {
      uint64_t v18 = v17;
      unint64_t v19 = v10;
      char v20 = v24;
      sub_25A8A8410();

      char v21 = v20;
      unint64_t v10 = v19;
      (*v23)(v7, v21, v2);
      (*v12)(v7, 0, 1, v2);
      if ((*v22)(v7, 1, v2) != 1)
      {
        sub_25A88593C((uint64_t)v7, &qword_26A46A000);
        swift_bridgeObjectRelease_n();

        return 1;
      }
    }
    else
    {
      (*v12)(v7, 1, 1, v2);
    }
    sub_25A88593C((uint64_t)v7, &qword_26A46A000);

    ++v13;
    if (v16 == v11) {
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_25A88783C()
{
  unint64_t result = qword_26A469FE0;
  if (!qword_26A469FE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A469FE0);
  }
  return result;
}

unint64_t sub_25A88787C()
{
  unint64_t result = qword_26A46A098;
  if (!qword_26A46A098)
  {
    sub_25A8A84C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A098);
  }
  return result;
}

unint64_t sub_25A8878D4()
{
  unint64_t result = qword_26A46A0A8;
  if (!qword_26A46A0A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A46A0B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A0A8);
  }
  return result;
}

unint64_t sub_25A887940()
{
  unint64_t result = qword_26A46A0C0;
  if (!qword_26A46A0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A0C0);
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
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
        JUMPOUT(0x25A887B64);
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

uint64_t sub_25A887B8C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25A887B98(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeedbackType()
{
  return &type metadata for FeedbackType;
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
        JUMPOUT(0x25A887D0CLL);
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

void sub_25A887D44(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  switch(a9 >> 61)
  {
    case 0uLL:
      sub_25A887E64((uint64_t)a3);
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
      sub_25A887E64((uint64_t)a3);
      swift_bridgeObjectRetain();
      break;
    default:
      return;
  }
}

uint64_t sub_25A887E64(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
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
  sub_25A887D44(*a2, v4, v5, v6, v7, v8, v9, v10, v11);
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
  sub_25A887D44(*a2, v4, v5, v6, v7, v8, v9, v10, v11);
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
  sub_25A87EF80(v12, v13, v14, v15, v16, v17, v18, v19, v20);
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
  sub_25A87EF80(v3, v5, v4, v6, v7, v8, v9, v10, v11);
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

uint64_t sub_25A888150(uint64_t a1)
{
  return *(void *)(a1 + 64) >> 61;
}

uint64_t sub_25A88815C(uint64_t result)
{
  *(void *)(result + 64) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_25A88816C(uint64_t result, uint64_t a2)
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

uint64_t sub_25A8881A0()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ShareSheetLighthousePluginError()
{
  return sub_25A8881B8();
}

uint64_t sub_25A8881B8()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s43ProactiveShareSheetDataHarvestingLighthouse31ShareSheetLighthousePluginErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_25A8881A0();
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
  sub_25A8881A0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_25A8881B8();
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
  sub_25A8881B8();
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

uint64_t sub_25A88834C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25A888354(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShareSheetLighthousePluginError()
{
  return &type metadata for ShareSheetLighthousePluginError;
}

unint64_t sub_25A888374()
{
  unint64_t result = qword_26A46A0C8;
  if (!qword_26A46A0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A0C8);
  }
  return result;
}

unint64_t sub_25A8883CC()
{
  unint64_t result = qword_26A46A0D0;
  if (!qword_26A46A0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A0D0);
  }
  return result;
}

uint64_t sub_25A888420(unint64_t a1)
{
  if (a1 >= 5) {
    return 4;
  }
  else {
    return (0x302010004uLL >> (8 * a1));
  }
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
        JUMPOUT(0x25A8885A0);
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

uint64_t _s43ProactiveShareSheetDataHarvestingLighthouse14CountingMethodOwCP_0(uint64_t a1, uint64_t a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
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
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

uint64_t sub_25A8887F0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25A888808(void *result, int a2)
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
  *__n128 result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CountingMethod()
{
  return &type metadata for CountingMethod;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
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
    *(void *)__n128 result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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

uint64_t sub_25A88889C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25A8888B8(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
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

unint64_t sub_25A8888EC()
{
  unint64_t result = qword_26A46A0D8;
  if (!qword_26A46A0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A0D8);
  }
  return result;
}

id sub_25A888950()
{
  id result = sub_25A888970();
  qword_26A46A0E0 = (uint64_t)result;
  return result;
}

id sub_25A888970()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_25A8A86A0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25A8A8630();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A46AF08);
    uint64_t v4 = sub_25A8A8610();
    os_log_type_t v5 = sub_25A8A88E0();
    if (os_log_type_enabled(v4, v5))
    {
      unint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v6 = 0;
      _os_log_impl(&dword_25A85D000, v4, v5, "Using custom user defaults suite", v6, 2u);
      MEMORY[0x261148660](v6, -1, -1);
    }

    return v2;
  }
  else
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25A8A8630();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A46AF08);
    uint64_t v9 = sub_25A8A8610();
    os_log_type_t v10 = sub_25A8A88F0();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl(&dword_25A85D000, v9, v10, "Unable to use custom user defaults suite", v11, 2u);
      MEMORY[0x261148660](v11, -1, -1);
    }

    id v12 = objc_msgSend(self, sel_standardUserDefaults);
    return v12;
  }
}

id userDefaults.getter()
{
  if (qword_26A469F88 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26A46A0E0;

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
    sub_25A8A8A90();
    swift_bridgeObjectRelease();
    sub_25A8A8BF0();
    sub_25A8A86F0();
    swift_bridgeObjectRelease();
    sub_25A8A86F0();
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
      sub_25A8A86F0();
      uint64_t result = 0x6F7272456B736174;
      break;
  }
  return result;
}

uint64_t NSUserDefaults.shouldCompute(_:)(int *a1)
{
  id v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = &v47[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_25A8A8570();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = &v47[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  long long v13 = &v47[-v12];
  int v14 = *a1;
  char v15 = *((unsigned char *)a1 + 4);
  int v54 = *a1;
  char v55 = v15;
  SubtaskName.description.getter();
  uint64_t v16 = (void *)sub_25A8A86A0();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v2, sel_objectForKey_, v16);

  if (v17)
  {
    sub_25A8A89D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v53, 0, sizeof(v53));
  }
  sub_25A88C2D0((uint64_t)v53, (uint64_t)&v54);
  sub_25A88C930((uint64_t)&v54, (uint64_t)&v51, &qword_26A46A0E8);
  if (!v52)
  {
    sub_25A88593C((uint64_t)&v51, &qword_26A46A0E8);
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25A8A8630();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A46AF08);
    uint64_t v22 = sub_25A8A8610();
    os_log_type_t v23 = sub_25A8A88E0();
    if (!os_log_type_enabled(v22, v23))
    {

      goto LABEL_21;
    }
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(void *)&v53[0] = v25;
    *(_DWORD *)unint64_t v24 = 136315138;
    LODWORD(v51) = v14;
    BYTE4(v51) = v15;
    uint64_t v26 = SubtaskName.description.getter();
    *(void *)&long long v51 = sub_25A86BEDC(v26, v27, (uint64_t *)v53);
    sub_25A8A89A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A85D000, v22, v23, "No Last Computation date for task %s. The task needs to be run.", v24, 0xCu);
    uint64_t v28 = 1;
    swift_arrayDestroy();
    MEMORY[0x261148660](v25, -1, -1);
    MEMORY[0x261148660](v24, -1, -1);

    sub_25A88593C((uint64_t)&v54, &qword_26A46A0E8);
    return v28;
  }
  sub_25A885CFC(&v51, v53);
  sub_25A869F58((uint64_t)v53, (uint64_t)&v51);
  int v18 = swift_dynamicCast();
  uint64_t v19 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (!v18)
  {
    v19(v6, 1, 1, v7);
    goto LABEL_14;
  }
  v19(v6, 0, 1, v7);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_14:
    sub_25A88593C((uint64_t)v6, &qword_26A46A040);
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_25A8A8630();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A46AF08);
    uint64_t v30 = sub_25A8A8610();
    os_log_type_t v31 = sub_25A8A88E0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(void *)&long long v51 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      LODWORD(v50) = v14;
      BYTE4(v50) = v15;
      uint64_t v34 = SubtaskName.description.getter();
      double v50 = COERCE_DOUBLE(sub_25A86BEDC(v34, v35, (uint64_t *)&v51));
      sub_25A8A89A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v30, v31, "No Last Computation date for task %s. The task needs to be run.", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261148660](v33, -1, -1);
      MEMORY[0x261148660](v32, -1, -1);
    }

    goto LABEL_19;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v13, v6, v7);
  sub_25A8A8520();
  if (v20 < -43200.0)
  {
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
LABEL_19:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
LABEL_21:
    sub_25A88593C((uint64_t)&v54, &qword_26A46A0E8);
    return 1;
  }
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_25A8A8630();
  __swift_project_value_buffer(v37, (uint64_t)qword_26A46AF08);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v38 = sub_25A8A8610();
  os_log_type_t v39 = sub_25A8A88E0();
  int v40 = v39;
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v41 = swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    *(void *)&long long v51 = v49;
    *(_DWORD *)uint64_t v41 = 136315650;
    LODWORD(v50) = v14;
    BYTE4(v50) = v15;
    int v48 = v40;
    uint64_t v42 = SubtaskName.description.getter();
    double v50 = COERCE_DOUBLE(sub_25A86BEDC(v42, v43, (uint64_t *)&v51));
    sub_25A8A89A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2048;
    sub_25A8A8520();
    double v50 = -v44;
    sub_25A8A89A0();
    uint64_t v45 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v45(v11, v7);
    *(_WORD *)(v41 + 22) = 2048;
    double v50 = 43200.0;
    sub_25A8A89A0();
    _os_log_impl(&dword_25A85D000, v38, (os_log_type_t)v48, "Task %s was run %f seconds ago, which is less than %f seconds ago. The task will not be run again this time.", (uint8_t *)v41, 0x20u);
    uint64_t v46 = v49;
    swift_arrayDestroy();
    MEMORY[0x261148660](v46, -1, -1);
    MEMORY[0x261148660](v41, -1, -1);
  }
  else
  {

    uint64_t v45 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
    v45(v11, v7);
  }
  v45(v13, v7);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
  sub_25A88593C((uint64_t)&v54, &qword_26A46A0E8);
  return 0;
}

uint64_t NSUserDefaults.saveComputationDate(_:)(int *a1)
{
  uint64_t v2 = sub_25A8A8570();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v28 - v7;
  int v9 = *a1;
  char v10 = *((unsigned char *)a1 + 4);
  sub_25A8A8540();
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25A8A8630();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A46AF08);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  uint64_t v12 = sub_25A8A8610();
  os_log_type_t v13 = sub_25A8A88E0();
  int v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v32 = v2;
    uint64_t v16 = v15;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v34 = v30;
    *(_DWORD *)uint64_t v16 = 136315394;
    LODWORD(v33) = v9;
    BYTE4(v33) = v10;
    int v28 = v9;
    int v29 = v14;
    uint64_t v17 = SubtaskName.description.getter();
    uint64_t v33 = sub_25A86BEDC(v17, v18, &v34);
    sub_25A8A89A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_25A88C338();
    uint64_t v19 = sub_25A8A8BF0();
    uint64_t v33 = sub_25A86BEDC(v19, v20, &v34);
    sub_25A8A89A0();
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v6, v32);
    int v22 = v28;
    _os_log_impl(&dword_25A85D000, v12, (os_log_type_t)v29, "Task %s: Saving Last Computation date %s", (uint8_t *)v16, 0x16u);
    uint64_t v23 = v30;
    swift_arrayDestroy();
    MEMORY[0x261148660](v23, -1, -1);
    uint64_t v24 = v16;
    uint64_t v2 = v32;
    MEMORY[0x261148660](v24, -1, -1);
  }
  else
  {
    uint64_t v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v6, v2);

    int v22 = v9;
  }
  uint64_t v25 = (void *)sub_25A8A84F0();
  LODWORD(v34) = v22;
  BYTE4(v34) = v10;
  SubtaskName.description.getter();
  uint64_t v26 = (void *)sub_25A8A86A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v31, sel_setObject_forKey_, v25, v26);

  return ((uint64_t (*)(char *, uint64_t))v21)(v8, v2);
}

void NSUserDefaults.removeDate(forParameter:)()
{
  SubtaskName.description.getter();
  id v1 = (id)sub_25A8A86A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_removeObjectForKey_, v1);
}

uint64_t sub_25A889A90@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v9 = *a1;
  char v10 = *((unsigned char *)a1 + 4);
  LODWORD(v26[0]) = *a1;
  BYTE4(v26[0]) = v10;
  SubtaskName.description.getter();
  uint64_t v11 = (void *)sub_25A8A86A0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v3, sel_objectForKey_, v11);

  if (v12)
  {
    sub_25A8A89D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v26, 0, sizeof(v26));
  }
  sub_25A88C2D0((uint64_t)v26, (uint64_t)v27);
  sub_25A88C930((uint64_t)v27, (uint64_t)&v24, &qword_26A46A0E8);
  if (v25)
  {
    sub_25A885CFC(&v24, v26);
    sub_25A869F58((uint64_t)v26, (uint64_t)&v24);
    uint64_t v13 = sub_25A8A8570();
    int v14 = swift_dynamicCast();
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    if (v14)
    {
      uint64_t v16 = *(void *)(v13 - 8);
      v15(v8, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v8, 1, v13) != 1)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
        sub_25A88593C((uint64_t)v27, &qword_26A46A0E8);
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(a2, v8, v13);
      }
    }
    else
    {
      v15(v8, 1, 1, v13);
    }
    sub_25A88593C((uint64_t)v8, &qword_26A46A040);
    *(void *)&long long v24 = 0;
    *((void *)&v24 + 1) = 0xE000000000000000;
    sub_25A8A8A90();
    swift_bridgeObjectRelease();
    *(void *)&long long v24 = 0xD00000000000001CLL;
    *((void *)&v24 + 1) = 0x800000025A8B3560;
    v22[2] = v9;
    char v23 = v10;
    SubtaskName.description.getter();
    sub_25A8A86F0();
    swift_bridgeObjectRelease();
    sub_25A8A86F0();
    long long v20 = v24;
    sub_25A869ECC();
    swift_allocError();
    *(_OWORD *)uint64_t v21 = v20;
    *(unsigned char *)(v21 + 16) = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  }
  else
  {
    sub_25A88593C((uint64_t)&v24, &qword_26A46A0E8);
    *(void *)&v26[0] = 0;
    *((void *)&v26[0] + 1) = 0xE000000000000000;
    sub_25A8A8A90();
    swift_bridgeObjectRelease();
    *(void *)&v26[0] = 0xD00000000000001ELL;
    *((void *)&v26[0] + 1) = 0x800000025A8B3540;
    LODWORD(v24) = v9;
    BYTE4(v24) = v10;
    SubtaskName.description.getter();
    sub_25A8A86F0();
    swift_bridgeObjectRelease();
    sub_25A8A86F0();
    long long v18 = v26[0];
    sub_25A869ECC();
    swift_allocError();
    *(_OWORD *)uint64_t v19 = v18;
    *(unsigned char *)(v19 + 16) = 1;
    swift_willThrow();
  }
  return sub_25A88593C((uint64_t)v27, &qword_26A46A0E8);
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

void __swiftcall TrialIdentifier.init(task:treatment:deployment:)(ProactiveShareSheetDataHarvestingLighthouse::TrialIdentifier *__return_ptr retstr, Swift::String task, Swift::String treatment, Swift::String deployment)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A0F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25A8A9F00;
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
  *(void *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A100);
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
        id v12 = (unsigned __int8 *)((v5 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        id v12 = (unsigned __int8 *)sub_25A8A8AE0();
      }
      uint64_t v13 = sub_25A88B91C(v12, v10, 10);
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
                BOOL v61 = (unsigned __int8 *)v69 + 2;
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
                char v65 = (unsigned __int8 *)v69 + 3;
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
  unint64_t v68 = sub_25A88B834(v6, v5, 10);
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
  sub_25A88A854(inited);
  int v22 = self;
  char v23 = (void *)sub_25A8A8660();
  swift_bridgeObjectRelease();
  v69[0] = 0;
  id v24 = objc_msgSend(v22, sel_dataWithJSONObject_options_error_, v23, 1, v69);

  id v25 = v69[0];
  if (v24)
  {
    uint64_t v26 = sub_25A8A8450();
    unint64_t v28 = v27;

    id v29 = objc_msgSend(self, sel_defaultManager);
    sub_25A8A8430();
    uint64_t v30 = (void *)sub_25A8A86A0();
    swift_bridgeObjectRelease();
    unsigned __int8 v31 = objc_msgSend(v29, sel_fileExistsAtPath_, v30);

    if ((v31 & 1) == 0)
    {
LABEL_42:
      sub_25A8A8460();
      if (qword_26A469F78 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_25A8A8630();
      __swift_project_value_buffer(v35, (uint64_t)qword_26A46AF08);
      id v36 = sub_25A8A8610();
      os_log_type_t v37 = sub_25A8A88D0();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_25A85D000, v36, v37, "Saved Trial information successfully", v38, 2u);
        MEMORY[0x261148660](v38, -1, -1);
      }

      sub_25A88C390(v26, v28);
      goto LABEL_58;
    }
    uint64_t v32 = (void *)sub_25A8A8400();
    v69[0] = 0;
    unsigned int v33 = objc_msgSend(v29, sel_removeItemAtURL_error_, v32, v69);

    if (v33)
    {
      id v34 = v69[0];
      goto LABEL_42;
    }
    id v50 = v69[0];
    long long v51 = (void *)sub_25A8A83D0();

    swift_willThrow();
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_25A8A8630();
    __swift_project_value_buffer(v52, (uint64_t)qword_26A46AF08);
    id v53 = v51;
    id v54 = v51;
    id v36 = sub_25A8A8610();
    os_log_type_t v55 = sub_25A8A88F0();
    if (os_log_type_enabled(v36, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 138412290;
      id v58 = v51;
      char v59 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v69[0] = v59;
      sub_25A8A89A0();
      *uint64_t v57 = v59;

      _os_log_impl(&dword_25A85D000, v36, v55, "Error writing JSON data to file: %@", v56, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A108);
      swift_arrayDestroy();
      MEMORY[0x261148660](v57, -1, -1);
      MEMORY[0x261148660](v56, -1, -1);
      sub_25A88C390(v26, v28);

      return;
    }
    sub_25A88C390(v26, v28);

    uint64_t v49 = v51;
  }
  else
  {
    os_log_type_t v39 = v25;
    int v40 = (void *)sub_25A8A83D0();

    swift_willThrow();
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_25A8A8630();
    __swift_project_value_buffer(v41, (uint64_t)qword_26A46AF08);
    id v42 = v40;
    id v43 = v40;
    id v36 = sub_25A8A8610();
    os_log_type_t v44 = sub_25A8A88F0();
    if (os_log_type_enabled(v36, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 138412290;
      id v47 = v40;
      int v48 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v69[0] = v48;
      sub_25A8A89A0();
      *uint64_t v46 = v48;

      _os_log_impl(&dword_25A85D000, v36, v44, "Error converting dictionary to JSON data: %@", v45, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A108);
      swift_arrayDestroy();
      MEMORY[0x261148660](v46, -1, -1);
      MEMORY[0x261148660](v45, -1, -1);

      return;
    }

    uint64_t v49 = v40;
  }

LABEL_58:
}

unint64_t sub_25A88A854(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A148);
  uint64_t v2 = sub_25A8A8BB0();
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
    sub_25A88C930(v6, (uint64_t)&v15, (uint64_t *)&unk_26A46A150);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25A88B6D8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25A885CFC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_25A88A98C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A140);
  uint64_t v2 = (void *)sub_25A8A8BB0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25A88B6D8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
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

unint64_t sub_25A88AAB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A138);
  uint64_t v2 = (void *)sub_25A8A8BB0();
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
    unint64_t result = sub_25A88B6D8(v5, v6);
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

unint64_t sub_25A88ABCC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A130);
  uint64_t v2 = (void *)sub_25A8A8BB0();
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
    unint64_t result = sub_25A88B6D8(v5, v6);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v13 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v13 = v5;
    v13[1] = v6;
    uint64_t v14 = (uint64_t *)(v2[7] + 32 * result);
    *uint64_t v14 = v7;
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

unint64_t sub_25A88AD0C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A128);
  uint64_t v2 = (void *)sub_25A8A8BB0();
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
    unint64_t result = sub_25A88B6D8(v5, v6);
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

unint64_t sub_25A88AE28(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A120);
  uint64_t v2 = (void *)sub_25A8A8BB0();
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
    unint64_t result = sub_25A88B6D8(v5, v6);
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

Swift::Void __swiftcall TrialIdentifier.saveToUserDefaults()()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A110);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25A8A9F00;
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
  sub_25A88A98C(inited);
  if (qword_26A469F88 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)qword_26A46A0E0;
  char v9 = (void *)sub_25A8A8660();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_25A8A86A0();
  objc_msgSend(v8, sel_setObject_forKey_, v9, v10);
}

double static TrialIdentifier.loadFromUserDefaults()@<D0>(void *a1@<X8>)
{
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25A8A8630();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A46AF08);
  uint64_t v3 = sub_25A8A8610();
  os_log_type_t v4 = sub_25A8A88E0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25A85D000, v3, v4, "Loading Trial identifier from user defaults", v5, 2u);
    MEMORY[0x261148660](v5, -1, -1);
  }

  if (qword_26A469F88 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_26A46A0E0;
  uint64_t v7 = (void *)sub_25A8A86A0();
  id v8 = objc_msgSend(v6, sel_objectForKey_, v7);

  if (v8)
  {
    sub_25A8A89D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v36, 0, sizeof(v36));
  }
  sub_25A88C2D0((uint64_t)v36, (uint64_t)v37);
  if (v37[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A118);
    if (swift_dynamicCast())
    {
      if (*(void *)(v35 + 16))
      {
        unint64_t v9 = sub_25A88B6D8(1802723700, 0xE400000000000000);
        if (v10)
        {
          if (*(void *)(v35 + 16))
          {
            uint64_t v11 = (uint64_t *)(*(void *)(v35 + 56) + 16 * v9);
            uint64_t v13 = *v11;
            uint64_t v12 = v11[1];
            swift_bridgeObjectRetain();
            unint64_t v14 = sub_25A88B6D8(0x6E656D7461657274, 0xE900000000000074);
            if ((v15 & 1) != 0 && *(void *)(v35 + 16))
            {
              BOOL v16 = (uint64_t *)(*(void *)(v35 + 56) + 16 * v14);
              uint64_t v18 = *v16;
              uint64_t v17 = v16[1];
              swift_bridgeObjectRetain();
              unint64_t v19 = sub_25A88B6D8(0x656D796F6C706564, 0xEA0000000000746ELL);
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
      id v25 = sub_25A8A8610();
      os_log_type_t v30 = sub_25A8A88F0();
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
      uint64_t v32 = sub_25A8A8680();
      unint64_t v34 = v33;
      swift_bridgeObjectRelease();
      *(void *)&v36[0] = sub_25A86BEDC(v32, v34, v37);
      sub_25A8A89A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v25, v30, "Missing fields in stored dictionary %s", v27, 0xCu);
      swift_arrayDestroy();
      uint64_t v29 = v31;
      goto LABEL_25;
    }
  }
  else
  {
    sub_25A88593C((uint64_t)v37, &qword_26A46A0E8);
  }
  id v25 = sub_25A8A8610();
  os_log_type_t v26 = sub_25A8A88F0();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v37[0] = v28;
    *(_DWORD *)unint64_t v27 = 136315138;
    *(void *)&v36[0] = sub_25A86BEDC(0x6564496C61697274, 0xEF7265696669746ELL, v37);
    sub_25A8A89A0();
    _os_log_impl(&dword_25A85D000, v25, v26, "No object for key %s in user defaults", v27, 0xCu);
    swift_arrayDestroy();
    uint64_t v29 = v28;
LABEL_25:
    MEMORY[0x261148660](v29, -1, -1);
    MEMORY[0x261148660](v27, -1, -1);
  }

LABEL_27:
  double result = 0.0;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

void *sub_25A88B5F4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A010);
  os_log_type_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25A88B65C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25A8A8750();
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
    uint64_t v5 = MEMORY[0x261147A30](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_25A88B6D8(uint64_t a1, uint64_t a2)
{
  sub_25A8A8C90();
  sub_25A8A86E0();
  uint64_t v4 = sub_25A8A8CB0();

  return sub_25A88B750(a1, a2, v4);
}

unint64_t sub_25A88B750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25A8A8C00() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25A8A8C00() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25A88B834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25A8A8760();
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
  uint64_t v5 = sub_25A88BB9C();
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
    unint64_t v7 = (unsigned __int8 *)sub_25A8A8AE0();
  }
LABEL_7:
  BOOL v11 = sub_25A88B91C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_25A88B91C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_25A88BB9C()
{
  unint64_t v0 = sub_25A8A8770();
  uint64_t v4 = sub_25A88BC1C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25A88BC1C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_25A88BD74(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_25A88B5F4(v9, 0);
      unint64_t v12 = sub_25A88BE74((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25A8A8AE0();
LABEL_4:
        JUMPOUT(0x2611479E0);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2611479E0](v11 + 4, v11[2]);
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
    return MEMORY[0x2611479E0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_25A88BD74(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_25A88B65C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25A88B65C(v6, v5, v4);
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

unint64_t sub_25A88BE74(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      double result = sub_25A88B65C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      double result = sub_25A8A8740();
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
          double result = sub_25A8A8AE0();
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
    double result = sub_25A88B65C(v12, a6, a7);
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
    unint64_t v12 = sub_25A8A8710();
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

uint64_t _s43ProactiveShareSheetDataHarvestingLighthouse15TrialIdentifierV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  if (*a1 == *a2 && a1[1] == a2[1] || (char v10 = sub_25A8A8C00(), result = 0, (v10 & 1) != 0))
  {
    if (v2 == v6 && v4 == v7 || (char v12 = sub_25A8A8C00(), result = 0, (v12 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
      {
        return 1;
      }
      else
      {
        return sub_25A8A8C00();
      }
    }
  }
  return result;
}

uint64_t _s43ProactiveShareSheetDataHarvestingLighthouse16ComputationStateO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
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
          char v6 = sub_25A8A8C00();
        }
      }
      else
      {
LABEL_13:
        char v6 = 0;
      }
      sub_25A88C994(v4, v5);
      sub_25A88C994(v2, v3);
      break;
  }
  sub_25A88C9A8(v2, v3);
  sub_25A88C9A8(v4, v5);
  return v6 & 1;
}

uint64_t sub_25A88C2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25A88C338()
{
  unint64_t result = qword_26A46A0F0;
  if (!qword_26A46A0F0)
  {
    sub_25A8A8570();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A0F0);
  }
  return result;
}

uint64_t sub_25A88C390(uint64_t a1, unint64_t a2)
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

uint64_t sub_25A88C448(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25A88C464(uint64_t result, int a2)
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

uint64_t _s43ProactiveShareSheetDataHarvestingLighthouse16ComputationStateOwCP_0(uint64_t a1, uint64_t a2)
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
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483643;
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

uint64_t sub_25A88C6AC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25A88C6C4(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
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

uint64_t sub_25A88C930(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A88C994(uint64_t a1, unint64_t a2)
{
  if (a2 >= 5) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25A88C9A8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 5) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25A88C9BC(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_25A89CDF0(0, v2, 0);
    uint64_t result = v9;
    uint64_t v4 = (char *)(a1 + 32);
    do
    {
      char v6 = *v4;
      v4 += 16;
      char v5 = v6;
      uint64_t v10 = result;
      unint64_t v8 = *(void *)(result + 16);
      unint64_t v7 = *(void *)(result + 24);
      if (v8 >= v7 >> 1)
      {
        sub_25A89CDF0(v7 > 1, v8 + 1, 1);
        uint64_t result = v10;
      }
      *(void *)(result + 16) = v8 + 1;
      *(unsigned char *)(result + v8 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

ProactiveShareSheetDataHarvestingLighthouse::FeaturizationConfig __swiftcall FeaturizationConfig.init(identifier:)(ProactiveShareSheetDataHarvestingLighthouse::FeaturizationConfig identifier)
{
  *unint64_t v1 = identifier;
  return identifier;
}

uint64_t sub_25A88CA84()
{
  return sub_25A8A8CB0();
}

uint64_t sub_25A88CAC8()
{
  return sub_25A8A8CA0();
}

uint64_t sub_25A88CAF0()
{
  return sub_25A8A8CB0();
}

uint64_t DataHarvestingManager.init(config:executionManager:readerName:)@<X0>(void *__src@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  memcpy(a5, __src, 0x158uLL);
  uint64_t result = sub_25A88CB84(a2, (uint64_t)(a5 + 43));
  a5[48] = a3;
  a5[49] = a4;
  return result;
}

uint64_t sub_25A88CB84(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_25A88CB9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(void *)(a3 + 16) = a2;
  swift_unknownObjectRelease();
  uint64_t v5 = qword_26A469F78;
  swift_unknownObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25A8A8630();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A46AF08);
  unint64_t v7 = sub_25A8A8610();
  os_log_type_t v8 = sub_25A8A88E0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_25A85D000, v7, v8, "Finished reading feedback stream", v9, 2u);
    MEMORY[0x261148660](v9, -1, -1);
  }
}

void sub_25A88CCAC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  v5(v6, a3);
  swift_release();
  swift_unknownObjectRelease();
}

void sub_25A88CD34(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(a1, sel_eventBody);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_identifier);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = sub_25A8A86B0();
      uint64_t v9 = v8;

      swift_beginAccess();
      id v10 = v4;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v16 = *(void *)(a2 + 16);
      *(void *)(a2 + 16) = 0x8000000000000000;
      sub_25A8A1774((uint64_t)v10, v7, v9, isUniquelyReferenced_nonNull_native);
      *(void *)(a2 + 16) = v16;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();

      return;
    }
  }
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25A8A8630();
  __swift_project_value_buffer(v12, (uint64_t)qword_26A46AF08);
  oslog = sub_25A8A8610();
  os_log_type_t v13 = sub_25A8A88F0();
  if (os_log_type_enabled(oslog, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_25A85D000, oslog, v13, "Invalid event in feedback stream", v14, 2u);
    MEMORY[0x261148660](v14, -1, -1);
  }
}

Swift::tuple_OpaquePointer_Double_optional __swiftcall DataHarvestingManager.harvest(appendingTrialIdentifier:appendingFeaturizationConfig:inTests:)(ProactiveShareSheetDataHarvestingLighthouse::TrialIdentifier_optional *appendingTrialIdentifier, ProactiveShareSheetDataHarvestingLighthouse::FeaturizationConfig_optional appendingFeaturizationConfig, Swift::Bool inTests)
{
  uint64_t v4 = v3;
  char object = (char)appendingFeaturizationConfig.value.identifier._object;
  countAndFlagsBits = (uint64_t *)appendingFeaturizationConfig.value.identifier._countAndFlagsBits;
  sub_25A891F78((uint64_t)appendingTrialIdentifier, (uint64_t)v41, (uint64_t *)&unk_26A46A160);
  uint64_t v6 = countAndFlagsBits[1];
  uint64_t v33 = *countAndFlagsBits;
  id v7 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v8 = objc_msgSend(v7, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v36 = objc_msgSend(v8, sel_Feedback);
  swift_unknownObjectRelease();
  uint64_t v40 = 0;
  uint64_t v35 = sub_25A890E14(v36, &v40);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = MEMORY[0x263F8EE78];
  os_log_type_t v37 = (void **)(v9 + 16);
  id v10 = objc_msgSend((id)BiomeLibrary(), (SEL)&selRef_sessionId);
  swift_unknownObjectRelease();
  id v11 = [v10 (SEL)0x26547EAE4];
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v11, sel_LabeledDataStore);
  swift_unknownObjectRelease();
  id v13 = objc_msgSend(v12, sel_source);

  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0;
  *(unsigned char *)(v14 + 24) = 1;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = MEMORY[0x263F8EE88];
  uint64_t v16 = v4;
  sub_25A8910A4(v4, (uint64_t)__src);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  *(unsigned char *)(v17 + 24) = object;
  *(void *)(v17 + 32) = v9;
  memcpy((void *)(v17 + 40), __src, 0x190uLL);
  sub_25A891F78((uint64_t)v41, v17 + 440, (uint64_t *)&unk_26A46A160);
  *(void *)(v17 + 488) = v33;
  *(void *)(v17 + 496) = v6;
  *(void *)(v17 + 504) = v13;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = MEMORY[0x263F8EE78];
  swift_retain();
  swift_retain();
  sub_25A891230(v41);
  swift_bridgeObjectRetain();
  id v34 = v13;
  id v19 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  id v20 = objc_msgSend(v19, sel_ShareSheet);
  swift_unknownObjectRelease();
  id v21 = objc_msgSend(v20, sel_VirtualFeatureStore);
  swift_unknownObjectRelease();
  id v22 = objc_msgSend(v21, sel_publisher);
  __src[4] = sub_25A88E4A4;
  __src[5] = 0;
  __src[0] = MEMORY[0x263EF8330];
  __src[1] = 1107296256;
  void __src[2] = sub_25A88CF0C;
  __src[3] = &block_descriptor;
  unint64_t v23 = _Block_copy(__src);
  sub_25A8910A4(v16, (uint64_t)__src);
  unsigned __int8 v24 = (void *)swift_allocObject();
  memcpy(v24 + 2, __src, 0x190uLL);
  v24[52] = v18;
  v24[53] = v35;
  v24[54] = sub_25A8911F0;
  v24[55] = v17;
  v24[56] = v14;
  aBlock[4] = sub_25A8913C8;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25A88FA38;
  aBlock[3] = &block_descriptor_18;
  unsigned __int8 v25 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  id v26 = objc_msgSend(v22, sel_sinkWithCompletion_shouldContinue_, v23, v25);

  _Block_release(v25);
  _Block_release(v23);

  swift_release();
  swift_unknownObjectRelease();
  swift_beginAccess();
  unint64_t v27 = *v37;
  swift_beginAccess();
  uint64_t v28 = *(void *)(v14 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  char v30 = v27;
  Swift::Bool v31 = v28;
  result._1.value = v29;
  result._0._rawValue = v30;
  result._1.is_nil = v31;
  return result;
}

void sub_25A88D474(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  sub_25A891F78(a1, (uint64_t)v81, &qword_26A46A1C0);
  if (v84)
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25A8A8630();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A46AF08);
    uint64_t v16 = sub_25A8A8610();
    os_log_type_t v17 = sub_25A8A88F0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      id v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412290;
      sub_25A891FDC();
      swift_allocError();
      v79[0] = _swift_stdlib_bridgeErrorToNSError();
      sub_25A8A89A0();
      *id v19 = v79[0];
      _os_log_impl(&dword_25A85D000, v16, v17, "Finalizing batch failed %@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A108);
      swift_arrayDestroy();
      MEMORY[0x261148660](v19, -1, -1);
      MEMORY[0x261148660](v18, -1, -1);
    }

    return;
  }
  uint64_t v75 = a6;
  uint64_t v76 = a7;
  uint64_t v77 = a8;
  id v20 = (uint64_t *)(a2 + 16);
  uint64_t v22 = v81[0];
  unint64_t v21 = v81[1];
  char v74 = v82;
  uint64_t v23 = v83;
  swift_beginAccess();
  uint64_t v24 = *v20;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v25 = sub_25A8930BC(v22, v21, v24);
  swift_bridgeObjectRelease();
  if (v25)
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_25A8A8630();
    __swift_project_value_buffer(v26, (uint64_t)qword_26A46AF08);
    swift_bridgeObjectRetain_n();
    unint64_t v27 = sub_25A8A8610();
    os_log_type_t v28 = sub_25A8A8900();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v72 = v22;
      double v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v79[0] = v30;
      *(_DWORD *)double v29 = 136315138;
      swift_bridgeObjectRetain();
      v80[0] = sub_25A86BEDC(v72, v21, v79);
      sub_25A8A89A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A85D000, v27, v28, "VFS stream contains events with overlapping session ID %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261148660](v30, -1, -1);
      Swift::Bool v31 = v29;
      uint64_t v22 = v72;
      MEMORY[0x261148660](v31, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  swift_beginAccess();
  sub_25A89DA00(v80, v22, v21);
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (a3)
  {
    uint64_t v32 = *(void *)(v23 + 16);
    if (v32)
    {
      uint64_t v73 = v22;
      uint64_t v33 = (uint64_t **)(a4 + 16);
      swift_bridgeObjectRetain();
      id v34 = (void **)(v23 + 40);
      do
      {
        uint64_t v35 = *((unsigned __int8 *)v34 - 8);
        id v36 = *v34;
        swift_beginAccess();
        id v20 = *v33;
        id v37 = v36;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v33 = v20;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          id v20 = sub_25A89C938(0, v20[2] + 1, 1, v20);
          *uint64_t v33 = v20;
        }
        unint64_t v40 = v20[2];
        unint64_t v39 = v20[3];
        if (v40 >= v39 >> 1)
        {
          id v20 = sub_25A89C938((void *)(v39 > 1), v40 + 1, 1, v20);
          *uint64_t v33 = v20;
        }
        v20[2] = v40 + 1;
        v20[v40 + 4] = v35 + 1;
        swift_endAccess();

        v34 += 2;
        --v32;
      }
      while (v32);
      swift_bridgeObjectRelease();
      uint64_t v22 = v73;
    }
  }
  sub_25A891F78(v75, (uint64_t)v79, (uint64_t *)&unk_26A46A160);
  v80[0] = v76;
  v80[1] = v77;
  id v41 = sub_25A88DE24(v22, v21, v74, v23, v79, (uint64_t)v80);
  sub_25A88E070((uint64_t)v41);
  unint64_t v42 = *(void *)(v23 + 16);
  if (v42)
  {
    unint64_t v43 = 0;
    uint64_t v44 = 32;
    while (*(unsigned __int8 *)(v23 + v44) >= 3u)
    {
      ++v43;
      v44 += 16;
      if (v42 == v43) {
        goto LABEL_29;
      }
    }
    if (v42 == v43)
    {
LABEL_29:
      id v78 = v41;
      uint64_t v46 = v22;
      swift_bridgeObjectRetain();
      id v47 = (id *)(v23 + 40);
      uint64_t v45 = MEMORY[0x263F8EE78];
      do
      {
        int v51 = *((unsigned __int8 *)v47 - 8);
        if (v51 != 3)
        {
          id v52 = *v47;
          char v53 = swift_isUniquelyReferenced_nonNull_native();
          v79[0] = v45;
          if ((v53 & 1) == 0)
          {
            sub_25A89CE10(0, *(void *)(v45 + 16) + 1, 1);
            uint64_t v45 = v79[0];
          }
          unint64_t v49 = *(void *)(v45 + 16);
          unint64_t v48 = *(void *)(v45 + 24);
          if (v49 >= v48 >> 1)
          {
            sub_25A89CE10(v48 > 1, v49 + 1, 1);
            uint64_t v45 = v79[0];
          }
          *(void *)(v45 + 16) = v49 + 1;
          uint64_t v50 = v45 + 16 * v49;
          *(unsigned char *)(v50 + 32) = v51;
          *(void *)(v50 + 40) = v52;
        }
        v47 += 2;
        --v42;
      }
      while (v42);
      swift_bridgeObjectRelease();
      uint64_t v22 = v46;
      id v41 = v78;
      goto LABEL_38;
    }
    if (v43 >= v42)
    {
      __break(1u);
    }
    else
    {
      LODWORD(v20) = 1;
      switch(*(unsigned char *)(v23 + v44))
      {
        case 1:
          LODWORD(v20) = 2;
          break;
        case 2:
          LODWORD(v20) = 3;
          break;
        case 3:
          __break(1u);
          JUMPOUT(0x25A88DE14);
        default:
          break;
      }
      if (qword_26A469F78 == -1) {
        goto LABEL_49;
      }
    }
    swift_once();
LABEL_49:
    uint64_t v64 = sub_25A8A8630();
    __swift_project_value_buffer(v64, (uint64_t)qword_26A46AF08);
    char v65 = sub_25A8A8610();
    os_log_type_t v66 = sub_25A8A88D0();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v67 = 0;
      _os_log_impl(&dword_25A85D000, v65, v66, "Logging directly to labeled data", v67, 2u);
      MEMORY[0x261148660](v67, -1, -1);
    }
    swift_bridgeObjectRelease();

    unint64_t v68 = (id *)(v23 + 40);
    do
    {
      unsigned __int8 v69 = *((unsigned char *)v68 - 8);
      id v70 = *v68;
      id v71 = sub_25A88E198((int)v20, v69, v70);
      objc_msgSend(a9, sel_sendEvent_, v71);

      v68 += 2;
      --v42;
    }
    while (v42);

    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v45 = MEMORY[0x263F8EE78];
LABEL_38:
  sub_25A88C9BC(v45);
  swift_release();
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v54 = sub_25A8A8630();
  __swift_project_value_buffer(v54, (uint64_t)qword_26A46AF08);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_log_type_t v55 = sub_25A8A8610();
  os_log_type_t v56 = sub_25A8A88F0();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = swift_slowAlloc();
    uint64_t v58 = v22;
    uint64_t v59 = swift_slowAlloc();
    v79[0] = v59;
    *(_DWORD *)uint64_t v57 = 136315394;
    swift_bridgeObjectRetain();
    v80[0] = sub_25A86BEDC(v58, v21, v79);
    sub_25A8A89A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v57 + 12) = 2080;
    uint64_t v60 = swift_bridgeObjectRetain();
    uint64_t v61 = MEMORY[0x261147AC0](v60, &type metadata for FeedbackType);
    unint64_t v63 = v62;
    swift_bridgeObjectRelease();
    v80[0] = sub_25A86BEDC(v61, v63, v79);
    sub_25A8A89A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A85D000, v55, v56, "Couldn't find labeling evidence on positive feedback for session %s\n%s", (uint8_t *)v57, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261148660](v59, -1, -1);
    MEMORY[0x261148660](v57, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

id sub_25A88DE24(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  id v7 = v6;
  uint64_t v9 = *a5;
  id v8 = (void *)a5[1];
  uint64_t v11 = a5[2];
  uint64_t v10 = a5[3];
  uint64_t v12 = a5[4];
  uint64_t v13 = *(void *)(a6 + 8);
  uint64_t v29 = a5[5];
  id result = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataMLSEShareEvent), sel_init);
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v16 = (void *)sub_25A8A86A0();
    objc_msgSend(v15, sel_setSessionId_, v16);

    sub_25A86AE00(0, &qword_26A46A1E0);
    os_log_type_t v17 = (void *)MEMORY[0x261147C60](MEMORY[0x263F8EE78]);
    objc_msgSend(v15, sel_setFeaturizedCandidates_, v17);

    if (v8)
    {
      uint64_t v32 = v9;
      uint64_t v33 = v8;
      uint64_t v34 = v11;
      uint64_t v35 = v10;
      uint64_t v36 = v12;
      uint64_t v37 = v29;
      id v18 = sub_25A890630();
      if (v18)
      {
        id v19 = v18;
        objc_msgSend(v15, sel_setTrialIdentifier_, v18);
      }
    }
    objc_msgSend(v15, sel_setEngagementType_, dword_25A8AA5DC[a3]);
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
          char v25 = (void **)(a4 + 40);
          do
          {
            char v26 = *((unsigned char *)v25 - 8);
            unint64_t v27 = *v25;
            v25 += 2;
            LOBYTE(v32) = v26;
            uint64_t v33 = v27;
            id v28 = v27;
            sub_25A890768((unsigned __int8 *)&v32, v7, v15);

            --v24;
          }
          while (v24);
          swift_bridgeObjectRelease();
        }
        return v15;
      }
      id v22 = v21;
      uint64_t v23 = (void *)sub_25A8A86A0();
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

void sub_25A88E070(uint64_t a1)
{
  long long v2 = objc_msgSend(self, sel_sharedInstance);
  if (v2)
  {
    oslog = v2;
    [v2 logMessage:a1];
  }
  else
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25A8A8630();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A46AF08);
    oslog = sub_25A8A8610();
    os_log_type_t v4 = sub_25A8A8900();
    if (os_log_type_enabled(oslog, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_25A85D000, oslog, v4, "Unable to get PETEventTracker2", v5, 2u);
      MEMORY[0x261148660](v5, -1, -1);
    }
  }
}

id sub_25A88E198(int a1, unsigned __int8 a2, id a3)
{
  id v6 = objc_msgSend(a3, sel_itemIdentifier);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_25A8A86B0();
    uint64_t v34 = v9;
    uint64_t v35 = v8;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
  }
  id v10 = objc_msgSend(a3, sel_featureVersion);
  unint64_t v11 = 0x263F08000uLL;
  id v33 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v10);
  id v12 = objc_msgSend(a3, sel_featureVector);
  sub_25A86AE00(0, &qword_26A46A1D0);
  unint64_t v13 = sub_25A8A87A0();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25A8A8B70();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_6;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
    goto LABEL_15;
  }
  uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v14) {
    goto LABEL_14;
  }
LABEL_6:
  uint64_t v36 = MEMORY[0x263F8EE78];
  id result = (id)sub_25A8A8B10();
  if (v14 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v16 = 0;
  do
  {
    if ((v13 & 0xC000000000000001) != 0) {
      id v17 = (id)MEMORY[0x261147DD0](v16, v13);
    }
    else {
      id v17 = *(id *)(v13 + 8 * v16 + 32);
    }
    id v18 = v17;
    ++v16;
    sub_25A892210(v17);

    sub_25A8A8AF0();
    sub_25A8A8B20();
    sub_25A8A8B30();
    sub_25A8A8B00();
  }
  while (v14 != v16);
  uint64_t v19 = v36;
  swift_bridgeObjectRelease();
  unint64_t v11 = 0x263F08000;
LABEL_15:
  id v20 = objc_msgSend(a3, sel_deviceIdentifier);
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = sub_25A8A86B0();
    uint64_t v24 = v23;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v24 = 0;
  }
  id v25 = objc_msgSend(objc_allocWithZone(*(Class *)(v11 + 2584)), sel_initWithBool_, a2 < 3u);
  id v26 = objc_msgSend(objc_allocWithZone(*(Class *)(v11 + 2584)), sel_initWithInteger_, 2);
  id v27 = objc_msgSend(a3, sel_shareSessionIdentifier);
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = sub_25A8A86B0();
    uint64_t v31 = v30;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v31 = 0;
  }
  id v32 = objc_allocWithZone(MEMORY[0x263F2A228]);
  return sub_25A890C8C(v35, v34, v33, v19, v22, v24, v25, v26, a1, v29, v31, 0, 0);
}

void sub_25A88E4A4(void *a1)
{
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    id v2 = objc_msgSend(a1, sel_error);
    if (v2)
    {
      uint64_t v3 = v2;
      if (qword_26A469F78 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_25A8A8630();
      __swift_project_value_buffer(v4, (uint64_t)qword_26A46AF08);
      unint64_t v13 = v3;
      id v5 = sub_25A8A8610();
      os_log_type_t v6 = sub_25A8A8900();
      if (os_log_type_enabled(v5, v6))
      {
        id v7 = (uint8_t *)swift_slowAlloc();
        uint64_t v8 = (void *)swift_slowAlloc();
        *(_DWORD *)id v7 = 138412290;
        uint64_t v9 = v13;
        uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
        sub_25A8A89A0();
        *uint64_t v8 = v14;

        _os_log_impl(&dword_25A85D000, v5, v6, "%@", v7, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A108);
        swift_arrayDestroy();
        MEMORY[0x261148660](v8, -1, -1);
        MEMORY[0x261148660](v7, -1, -1);

        return;
      }
    }
    else
    {
      if (qword_26A469F78 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_25A8A8630();
      __swift_project_value_buffer(v10, (uint64_t)qword_26A46AF08);
      unint64_t v13 = sub_25A8A8610();
      os_log_type_t v11 = sub_25A8A8900();
      if (os_log_type_enabled(v13, v11))
      {
        id v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_25A85D000, v13, v11, "virtual feature stream reading error", v12, 2u);
        MEMORY[0x261148660](v12, -1, -1);
      }
    }
  }
}

void sub_25A88E758(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

BOOL sub_25A88E7C0(void *a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *), uint64_t a6, uint64_t a7)
{
  unint64_t v13 = &selRef_setHasFeatureName_;
  id v14 = objc_msgSend(a1, sel_eventBody);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v61 = a5;
    uint64_t v16 = &selRef_setHasFeatureName_;
    id v17 = objc_msgSend(v14, sel_shareSessionIdentifier);
    if (v17)
    {
      id v18 = v17;
      uint64_t v59 = a7;
      uint64_t v19 = (uint64_t *)(a3 + 16);
      uint64_t v60 = sub_25A8A86B0();
      id v21 = v20;

      swift_beginAccess();
      uint64_t v22 = *v19;
      if ((unint64_t)*v19 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_25A8A8B70();
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
          id v25 = (id)MEMORY[0x261147DD0](v24, v22);
LABEL_10:
          id v26 = v25;
          swift_bridgeObjectRelease();
          id v27 = objc_msgSend(v26, sel_eventBody);
          if (!v27)
          {
            swift_bridgeObjectRelease();

            goto LABEL_40;
          }
          id v28 = v27;
          unint64_t v13 = (char **)v26;
          id v29 = objc_msgSend(v27, sel_shareSessionIdentifier);

          if (!v29)
          {
            swift_bridgeObjectRelease();

            goto LABEL_40;
          }
          uint64_t v30 = sub_25A8A86B0();
          uint64_t v16 = v31;

          if (v60 == v30 && v21 == v16)
          {

            swift_bridgeObjectRelease_n();
LABEL_40:
            swift_beginAccess();
            id v53 = a1;
            MEMORY[0x261147A90]();
            if (*(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_25A8A87D0();
            }
            sub_25A8A87F0();
            sub_25A8A87C0();
            swift_endAccess();
            uint64_t v54 = a2 + 43;
            uint64_t v56 = a2[46];
            uint64_t v55 = a2[47];
            __swift_project_boxed_opaque_existential_1(v54, v56);
            char v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v56, v55);

            return (v39 & 1) == 0;
          }
          uint64_t v23 = v30;
          char v40 = sub_25A8A8C00();
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
            unint64_t v41 = sub_25A88B6D8(v23, (uint64_t)v16);
            if (v42)
            {
              id v43 = *(id *)(*(void *)(a4 + 56) + 8 * v41);
              swift_bridgeObjectRelease_n();
              swift_beginAccess();
              unint64_t v44 = swift_bridgeObjectRetain();
              sub_25A88EED4(v44, v43, v61);

              swift_bridgeObjectRelease();
              goto LABEL_35;
            }
            swift_bridgeObjectRelease();
          }
          if (qword_26A469F78 == -1)
          {
LABEL_30:
            uint64_t v45 = sub_25A8A8630();
            __swift_project_value_buffer(v45, (uint64_t)qword_26A46AF08);
            swift_retain_n();
            unint64_t v46 = (unint64_t)v16;
            swift_bridgeObjectRetain();
            id v47 = sub_25A8A8610();
            os_log_type_t v48 = sub_25A8A8900();
            if (os_log_type_enabled(v47, v48))
            {
              uint64_t v49 = swift_slowAlloc();
              uint64_t v58 = swift_slowAlloc();
              v62[0] = v58;
              *(_DWORD *)uint64_t v49 = 136315394;
              swift_bridgeObjectRetain();
              sub_25A86BEDC(v23, v46, v62);
              sub_25A8A89A0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v49 + 12) = 2048;
              swift_beginAccess();
              if ((unint64_t)*v19 >> 62)
              {
                swift_bridgeObjectRetain();
                sub_25A8A8B70();
                swift_release();
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_release();
              }
              uint64_t v50 = v59;
              sub_25A8A89A0();
              swift_release();
              _os_log_impl(&dword_25A85D000, v47, v48, "Missing feedback: %s, batch size %ld", (uint8_t *)v49, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x261148660](v58, -1, -1);
              MEMORY[0x261148660](v49, -1, -1);

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
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_25A8A8630();
  __swift_project_value_buffer(v32, (uint64_t)qword_26A46AF08);
  id v33 = sub_25A8A8610();
  os_log_type_t v34 = sub_25A8A88F0();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_25A85D000, v33, v34, "Skipping invalid virtual feature store event", v35, 2u);
    MEMORY[0x261148660](v35, -1, -1);
  }

  uint64_t v36 = a2 + 43;
  uint64_t v38 = a2[46];
  uint64_t v37 = a2[47];
  __swift_project_boxed_opaque_existential_1(v36, v38);
  char v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v38, v37);
  return (v39 & 1) == 0;
}

void sub_25A88EED4(unint64_t a1, void *a2, void (*a3)(uint64_t *))
{
  id v5 = v3;
  uint64_t v7 = (uint64_t)a2;
  if (sub_25A88FA90())
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25A8A8630();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A46AF08);
    id v101 = a2;
    uint64_t v9 = sub_25A8A8610();
    os_log_type_t v10 = sub_25A8A88E0();
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
        uint64_t v15 = sub_25A8A86B0();
        uint64_t v17 = v16;
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v17 = 0;
      }
      uint64_t v103 = v15;
      uint64_t v104 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A8);
      uint64_t v45 = sub_25A8A86C0();
      uint64_t v103 = sub_25A86BEDC(v45, v46, &v102);
      sub_25A8A89A0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25A85D000, v9, v10, "skipping due to timeout on %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261148660](v12, -1, -1);
      MEMORY[0x261148660](v11, -1, -1);
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
    uint64_t v18 = sub_25A8A8B70();
    if (v18) {
      goto LABEL_9;
    }
LABEL_50:
    swift_bridgeObjectRelease();
    unsigned int v48 = objc_msgSend(a2, sel_engagementType);
    unint64_t v4 = MEMORY[0x263F8EE78];
    id v47 = (void *)MEMORY[0x263F8EE78];
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
    uint64_t v7 = sub_25A8A8B70();
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
      id v21 = (id)MEMORY[0x261147DD0](v19, a1);
    }
    else {
      id v21 = *(id *)(a1 + 8 * v19 + 32);
    }
    uint64_t v22 = v21;
    id v23 = objc_msgSend(v21, sel_eventBody);

    if (v23)
    {
      MEMORY[0x261147A90]();
      if (*(void *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_25A8A87D0();
      }
      sub_25A8A87F0();
      uint64_t v7 = (uint64_t)&v103;
      sub_25A8A87C0();
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
      id v24 = (id)MEMORY[0x261147DD0](0, a1);
      swift_bridgeObjectRelease();
LABEL_23:
      objc_msgSend(v24, sel_timestamp);
      double v26 = v25;

      unint64_t v27 = (unint64_t)sub_25A88FBC8(a2, v26, *v5);
      if (!v27)
      {
        id v47 = (void *)MEMORY[0x263F8EE78];
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
        uint64_t v70 = sub_25A8A5780((uint64_t)v30);
        swift_bridgeObjectRelease();
        if (v98 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v71 = sub_25A8A8B70();
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
            id v47 = (void *)MEMORY[0x263F8EE78];
            while (1)
            {
              if ((v98 & 0xC000000000000001) != 0) {
                id v73 = (id)MEMORY[0x261147DD0](v72, v98);
              }
              else {
                id v73 = *(id *)(v98 + 8 * v72 + 32);
              }
              char v74 = v73;
              id v75 = a2;
              id v76 = v74;
              swift_bridgeObjectRetain();
              id v77 = objc_msgSend(v76, sel_itemIdentifier);
              if (v77)
              {
                id v78 = v77;
                uint64_t v79 = sub_25A8A86B0();
                uint64_t v81 = v80;

                LOBYTE(v78) = sub_25A8930BC(v79, v81, v70);
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
                id v47 = sub_25A89CA48(0, v47[2] + 1, 1, v47);
              }
              unint64_t v86 = v47[2];
              unint64_t v85 = v47[3];
              if (v86 >= v85 >> 1) {
                id v47 = sub_25A89CA48((void *)(v85 > 1), v86 + 1, 1, v47);
              }
              ++v72;
              v47[2] = v86 + 1;
              int64_t v87 = &v47[2 * v86];
              *((unsigned char *)v87 + 32) = v83;
              v87[5] = v84;

              if (v71 == v72) {
                goto LABEL_111;
              }
            }
          }
        }
        id v47 = (void *)MEMORY[0x263F8EE78];
LABEL_111:
        swift_bridgeObjectRelease();
        unint64_t v4 = v98;
        goto LABEL_112;
      }
LABEL_87:
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_25A8A8B70();
      if (v28)
      {
LABEL_26:
        if (v28 >= 1)
        {
          uint64_t v29 = 0;
          uint64_t v30 = (void *)MEMORY[0x263F8EE78];
          uint64_t v31 = &selRef_setHasFeatureName_;
          while (1)
          {
            if ((v7 & 0xC000000000000001) != 0) {
              id v32 = (id)MEMORY[0x261147DD0](v29, v7);
            }
            else {
              id v32 = *(id *)(v7 + 8 * v29 + 32);
            }
            id v33 = v32;
            id v34 = objc_msgSend(v32, sel_domainIdentifier);
            if (v34)
            {

              id v35 = objc_msgSend(v33, sel_domainIdentifier);
            }
            else
            {
              id v36 = [v33 v31[51]];
              if (!v36) {
                goto LABEL_28;
              }

              id v35 = [v33 v31[51]];
            }
            id v37 = v35;
            if (v37)
            {
              uint64_t v38 = v31;
              uint64_t v39 = sub_25A8A86B0();
              uint64_t v41 = v40;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v30 = sub_25A89C718(0, v30[2] + 1, 1, v30);
              }
              unint64_t v43 = v30[2];
              unint64_t v42 = v30[3];
              if (v43 >= v42 >> 1) {
                uint64_t v30 = sub_25A89C718((void *)(v42 > 1), v43 + 1, 1, v30);
              }
              v30[2] = v43 + 1;
              unint64_t v44 = &v30[2 * v43];
              v44[4] = v39;
              v44[5] = v41;
              uint64_t v31 = v38;
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
    id v47 = (void *)MEMORY[0x263F8EE78];
    unint64_t v99 = v4;
    while (1)
    {
      id v50 = v97 ? (id)MEMORY[0x261147DD0](v49, v4) : *(id *)(v4 + 8 * v49 + 32);
      uint64_t v51 = v50;
      id v52 = a2;
      id v53 = v51;
      id v54 = objc_msgSend(v53, sel_itemIdentifier);
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = sub_25A8A86B0();
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
      uint64_t v61 = sub_25A8A86B0();
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
            char v65 = sub_25A8A8C00();
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
        id v47 = sub_25A89CA48(0, v47[2] + 1, 1, v47);
      }
      unint64_t v68 = v47[2];
      unint64_t v67 = v47[3];
      if (v68 >= v67 >> 1) {
        id v47 = sub_25A89CA48((void *)(v67 > 1), v68 + 1, 1, v47);
      }
      ++v49;
      v47[2] = v68 + 1;
      unsigned __int8 v69 = &v47[2 * v68];
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
  id v47 = (void *)MEMORY[0x263F8EE78];
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
  uint64_t v95 = sub_25A8A8B70();
  swift_bridgeObjectRelease();
  if (!v95) {
    goto LABEL_124;
  }
LABEL_115:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v88 = (id)MEMORY[0x261147DD0](0, v4);
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
    uint64_t v91 = sub_25A8A86B0();
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
      char v106 = v47;
      char v107 = 0;
      a3(&v103);
    }
    goto LABEL_124;
  }
LABEL_125:

  swift_bridgeObjectRelease();
}

uint64_t sub_25A88FA38(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

BOOL sub_25A88FA90()
{
  id v1 = objc_msgSend(v0, sel_timeouts);
  sub_25A86AE00(0, (unint64_t *)&unk_26A46A1B0);
  unint64_t v2 = sub_25A8A87A0();

  if (v2 >> 62) {
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_25A8A8B70())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261147DD0](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
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

id sub_25A88FBC8(void *a1, double a2, double a3)
{
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25A8A8630();
  __swift_project_value_buffer(v7, (uint64_t)qword_26A46AF08);
  uint64_t v43 = v3;
  sub_25A8910A4(v3, (uint64_t)v44);
  unsigned int v8 = sub_25A8A8610();
  os_log_type_t v9 = sub_25A8A88E0();
  if (os_log_type_enabled(v8, v9))
  {
    BOOL v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)BOOL v10 = 134217984;
    sub_25A8A89A0();
    sub_25A891E60(v44);
    _os_log_impl(&dword_25A85D000, v8, v9, "Loading all interactions from inference to inference + %f s", v10, 0xCu);
    MEMORY[0x261148660](v10, -1, -1);
  }
  else
  {
    sub_25A891E60(v44);
  }

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_initWithTimeIntervalSinceReferenceDate_, a2);
  id v12 = objc_msgSend(v11, sel_dateByAddingTimeInterval_, a3);
  sub_25A86AE00(0, &qword_26A46A018);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46A170);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_25A8A9F00;
  uint64_t v14 = sub_25A86AE00(0, &qword_26A46A028);
  *(void *)(v13 + 56) = v14;
  uint64_t v15 = sub_25A891E90((unint64_t *)&unk_26A46A180, &qword_26A46A028);
  *(void *)(v13 + 32) = v11;
  *(void *)(v13 + 96) = v14;
  *(void *)(v13 + 104) = v15;
  *(void *)(v13 + 64) = v15;
  *(void *)(v13 + 72) = v12;
  id v16 = objc_allocWithZone(NSNumber);
  id v17 = v11;
  id v18 = v12;
  id v19 = objc_msgSend(v16, sel_initWithInteger_, 1);
  *(void *)(v13 + 136) = sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
  *(void *)(v13 + 144) = sub_25A891E90(&qword_26A46A190, (unint64_t *)&qword_26A46A020);
  *(void *)(v13 + 112) = v19;
  id v20 = (id)sub_25A8A88C0();
  if (objc_msgSend(a1, sel_engagementType) == 6
    && (id v21 = objc_msgSend(a1, sel_engagementIdentifier)) != 0)
  {
    uint64_t v22 = v21;
    uint64_t v23 = sub_25A8A86B0();
    unint64_t v25 = v24;

    swift_bridgeObjectRetain_n();
    double v26 = sub_25A8A8610();
    os_log_type_t v27 = sub_25A8A88E0();
    if (os_log_type_enabled(v26, v27))
    {
      id v42 = v17;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = (void *)swift_slowAlloc();
      v44[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      sub_25A86BEDC(v23, v25, (uint64_t *)v44);
      sub_25A8A89A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25A85D000, v26, v27, "Selecting interactions associated with %s in the Sharesheet", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261148660](v29, -1, -1);
      uint64_t v30 = v28;
      id v17 = v42;
      MEMORY[0x261148660](v30, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v32 = v18;
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_25A8A9F80;
    uint64_t v34 = MEMORY[0x263F8D310];
    *(void *)(v33 + 56) = MEMORY[0x263F8D310];
    unint64_t v35 = sub_25A891EE0();
    *(void *)(v33 + 32) = v23;
    *(void *)(v33 + 40) = v25;
    *(void *)(v33 + 96) = v34;
    *(void *)(v33 + 104) = v35;
    *(void *)(v33 + 64) = v35;
    *(void *)(v33 + 72) = v23;
    *(void *)(v33 + 80) = v25;
    swift_bridgeObjectRetain();
    id v36 = (void *)sub_25A8A88C0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_25A8AA400;
    *(void *)(v37 + 32) = v20;
    *(void *)(v37 + 40) = v36;
    v44[0] = (id)v37;
    sub_25A8A87C0();
    id v38 = v36;
    uint64_t v39 = sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v31 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v39);

    id v20 = (id)v39;
  }
  else
  {
    id v31 = v20;
    id v32 = v18;
  }

  id v40 = sub_25A8695B8((uint64_t)v31, *(void *)(v43 + 8));
  return v40;
}

uint64_t DataHarvestingManager.fetchInteractionsForTests(from:timeWindow:feedback:)(void *a1, double a2, double a3)
{
  unint64_t v3 = (unint64_t)sub_25A88FBC8(a1, a2, a3);
  unint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
    if (v3 >> 62)
    {
      uint64_t v9 = sub_25A8A8B60();
      swift_bridgeObjectRelease();
      return v9;
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_25A8A8C10();
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

Swift::Void __swiftcall DataHarvestingManager.pruneVirtualFeatureStore(from:)(Swift::Double_optional from)
{
  if ((v1 & 1) == 0)
  {
    uint64_t v3 = *(void *)&from.is_nil;
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25A8A8630();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A46AF08);
    uint64_t v5 = sub_25A8A8610();
    os_log_type_t v6 = sub_25A8A88D0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_25A85D000, v5, v6, "Pruning events from Virtual Feature Store", v7, 2u);
      MEMORY[0x261148660](v7, -1, -1);
    }

    id v8 = objc_msgSend(*(id *)(v2 + 40), sel_pruner);
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v3;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_25A8913EC;
    *(void *)(v10 + 24) = v9;
    aBlock[4] = sub_25A891440;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25A8905D4;
    aBlock[3] = &block_descriptor_27;
    id v11 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_deleteEventsPassingTest_, v11);

    _Block_release(v11);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v8 & 1) == 0)
    {
      id v12 = sub_25A8A8610();
      os_log_type_t v13 = sub_25A8A88D0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 134217984;
        aBlock[0] = v3;
        sub_25A8A89A0();
        _os_log_impl(&dword_25A85D000, v12, v13, "Pruned all events older than %f from Virtual Feature Store", v14, 0xCu);
        MEMORY[0x261148660](v14, -1, -1);
      }
      swift_release();

      return;
    }
    __break(1u);
    goto LABEL_17;
  }
  if (qword_26A469F78 != -1) {
LABEL_17:
  }
    swift_once();
  uint64_t v15 = sub_25A8A8630();
  __swift_project_value_buffer(v15, (uint64_t)qword_26A46AF08);
  oslog = sub_25A8A8610();
  os_log_type_t v16 = sub_25A8A88D0();
  if (os_log_type_enabled(oslog, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_25A85D000, oslog, v16, "No events from the Virtual Feature Store because no pruning timestamp was saved", v17, 2u);
    MEMORY[0x261148660](v17, -1, -1);
  }
}

uint64_t sub_25A8905D4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  id v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

id sub_25A890630()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  id v3 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataTrialIdentifier), sel_init);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v6 = (void *)sub_25A8A86A0();
    objc_msgSend(v5, sel_setTask_, v6);

    id v7 = v5;
    id v8 = (void *)sub_25A8A86A0();
    objc_msgSend(v7, sel_setTreatment_, v8);

    id v9 = v7;
    swift_bridgeObjectRetain();
    sub_25A8A8760();
    uint64_t v10 = (void *)sub_25A8A86A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setDeployment_, v10, v2, v1);
  }
  return v4;
}

void sub_25A890768(unsigned __int8 *a1, const void *a2, void *a3)
{
  int v6 = *a1;
  id v7 = (void *)*((void *)a1 + 1);
  id v8 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeatureValue), sel_init);
  if (!v8)
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_25A8A8630();
    __swift_project_value_buffer(v26, (uint64_t)qword_26A46AF08);
    id v9 = sub_25A8A8610();
    os_log_type_t v27 = sub_25A8A8900();
    if (os_log_type_enabled(v9, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      MEMORY[0x261148660](v28, -1, -1);
    }
    goto LABEL_21;
  }
  id v9 = v8;
  id v10 = objc_msgSend(objc_allocWithZone((Class)PeoplePredictionDataFeature), sel_init);
  if (!v10)
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_25A8A8630();
    __swift_project_value_buffer(v29, (uint64_t)qword_26A46AF08);
    uint64_t v30 = sub_25A8A8610();
    os_log_type_t v31 = sub_25A8A8900();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v32 = 0;
      MEMORY[0x261148660](v32, -1, -1);

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
  sub_25A892400(__dst);
  id v12 = sub_25A86AB78(v7, v40);
  if (!v3)
  {
    uint64_t v33 = v12;
    sub_25A892528(__dst);
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
  sub_25A892528(__dst);
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25A8A8630();
  __swift_project_value_buffer(v13, (uint64_t)qword_26A46AF08);
  id v14 = v7;
  id v15 = v3;
  id v16 = v14;
  id v17 = v3;
  id v18 = sub_25A8A8610();
  os_log_type_t v19 = sub_25A8A8900();
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
    sub_25A8A89A0();
    *uint64_t v39 = v16;

    *(_WORD *)(v22 + 12) = 2112;
    id v24 = v3;
    uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
    v40[0] = v25;
    sub_25A8A89A0();
    v39[1] = v25;

    _os_log_impl(&dword_25A85D000, v18, (os_log_type_t)v42, "Error while translating biomeFormat to petFormat %{private}@. Error %@", (uint8_t *)v22, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A108);
    swift_arrayDestroy();
    MEMORY[0x261148660](v39, -1, -1);
    MEMORY[0x261148660](v22, -1, -1);
  }
  else
  {
  }
}

id sub_25A890C8C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a2)
  {
    id v17 = (void *)sub_25A8A86A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v17 = 0;
  }
  sub_25A86AE00(0, &qword_26A46A1D8);
  id v18 = (void *)sub_25A8A8790();
  swift_bridgeObjectRelease();
  if (a6)
  {
    os_log_type_t v19 = (void *)sub_25A8A86A0();
    swift_bridgeObjectRelease();
    uint64_t v20 = a13;
    if (a11) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v21 = 0;
    int v22 = a9;
    if (v20) {
      goto LABEL_7;
    }
LABEL_10:
    id v23 = 0;
    goto LABEL_11;
  }
  os_log_type_t v19 = 0;
  uint64_t v20 = a13;
  if (!a11) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v21 = (void *)sub_25A8A86A0();
  swift_bridgeObjectRelease();
  int v22 = a9;
  if (!v20) {
    goto LABEL_10;
  }
LABEL_7:
  id v23 = (void *)sub_25A8A86A0();
  swift_bridgeObjectRelease();
LABEL_11:
  LODWORD(v26) = v22;
  id v24 = objc_msgSend(v27, sel_initWithItemIdentifier_featureVersion_featureVector_deviceIdentifier_isPositiveLabeled_labelingPolicyVersion_labelingEvidence_sharingEventUID_configurationInfo_, v17, a3, v18, v19, a7, a8, v26, v21, v23);

  return v24;
}

uint64_t sub_25A890E14(void *a1, uint64_t *a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_25A88AAB0(MEMORY[0x263F8EE78]);
  id v6 = objc_msgSend(a1, sel_publisher);
  uint64_t v7 = *a2;
  id v18 = sub_25A89269C;
  uint64_t v19 = v4;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  id v16 = sub_25A88CCAC;
  id v17 = &block_descriptor_36;
  id v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v18 = sub_25A8926A4;
  uint64_t v19 = v5;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v15 = 1107296256;
  id v16 = (void (*)(uint64_t, void *, uint64_t))sub_25A88CF0C;
  id v17 = &block_descriptor_39;
  id v9 = _Block_copy(&aBlock);
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

uint64_t sub_25A89105C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A891094()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A8910A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25A8910DC()
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

  return MEMORY[0x270FA0238](v0, 512, 7);
}

void sub_25A8911F0(uint64_t a1)
{
  sub_25A88D474(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32), v1 + 40, v1 + 440, *(void *)(v1 + 488), *(void *)(v1 + 496), *(void **)(v1 + 504));
}

uint64_t *sub_25A891230(uint64_t *a1)
{
  return a1;
}

uint64_t sub_25A891268(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
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

uint64_t sub_25A8912D0()
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

BOOL sub_25A8913C8(void *a1)
{
  return sub_25A88E7C0(a1, (void *)(v1 + 16), *(void *)(v1 + 416), *(void *)(v1 + 424), *(void (**)(uint64_t *))(v1 + 432), *(void *)(v1 + 440), *(void *)(v1 + 448));
}

uint64_t sub_25A8913DC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

BOOL sub_25A8913EC(void *a1)
{
  if (!a1) {
    return 1;
  }
  double v2 = *(double *)(v1 + 16);
  objc_msgSend(a1, sel_timestamp);
  return v3 <= v2;
}

uint64_t sub_25A891430()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A891440()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
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
  os_log_type_t v31 = *(void **)(a2 + 32);
  id v32 = *(void **)(a2 + 40);
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
  id v27 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
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

void *__swift_memcpy400_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x190uLL);
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

uint64_t getEnumTagSinglePayload for DataHarvestingManager(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DataHarvestingManager(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DataHarvestingManager()
{
  return &type metadata for DataHarvestingManager;
}

id *sub_25A891E60(id *a1)
{
  return a1;
}

uint64_t sub_25A891E90(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25A86AE00(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25A891EE0()
{
  unint64_t result = qword_26A46A198;
  if (!qword_26A46A198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A198);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25A891F78(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_25A891FDC()
{
  unint64_t result = qword_26A46A1C8;
  if (!qword_26A46A1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A1C8);
  }
  return result;
}

id sub_25A892030(void *a1)
{
  if (objc_msgSend(a1, sel_hasIntValue))
  {
    id v2 = objc_msgSend(a1, sel_intValue);
    id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v2);
  }
  else
  {
    id v3 = 0;
  }
  if (objc_msgSend(a1, sel_hasDoubleValue))
  {
    objc_msgSend(a1, sel_doubleValue);
    id v5 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v4);
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend(a1, sel_stringValue);
  if (v6)
  {
    uint64_t v7 = v6;
    sub_25A8A86B0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (objc_msgSend(a1, sel_hasBoolValue))
  {
    id v10 = objc_msgSend(a1, sel_BOOLValue);
    id v11 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v10);
  }
  else
  {
    id v11 = 0;
  }
  id v12 = objc_msgSend(a1, sel_timeBucketValue);
  if (v9)
  {
    uint64_t v13 = (void *)sub_25A8A86A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A240]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_timeBucketValue_doubleValuedVectorValue_, v3, v5, v13, v11, v12, 0);

  return v14;
}

id sub_25A892210(void *a1)
{
  id v2 = objc_msgSend(a1, sel_featureName);
  id v3 = objc_msgSend(a1, sel_featureValue);
  if (v3)
  {
    double v4 = v3;
    id v5 = sub_25A892030(v3);
  }
  else
  {
    id v5 = 0;
  }
  if (objc_msgSend(a1, sel_hasFeatureItselfVersion))
  {
    id v6 = objc_msgSend(a1, sel_featureItselfVersion);
    id v7 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v6);
  }
  else
  {
    id v7 = 0;
  }
  if (objc_msgSend(a1, sel_hasFeatureFreshnessInHours))
  {
    id v8 = objc_msgSend(a1, sel_featureFreshnessInHours);
    id v9 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v8);
  }
  else
  {
    id v9 = 0;
  }
  if (objc_msgSend(a1, sel_hasEventVolumeToComputeFeature))
  {
    id v10 = objc_msgSend(a1, sel_eventVolumeToComputeFeature);
    id v11 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v10);
  }
  else
  {
    id v11 = 0;
  }
  if (objc_msgSend(a1, sel_hasTimeSpentToComputeFeature))
  {
    id v12 = objc_msgSend(a1, sel_timeSpentToComputeFeature);
    id v13 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInt_, v12);
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A230]), sel_initWithFeatureName_featureValue_featureItselfVersion_featureFreshnessInHours_eventVolumeToComputeFeature_timeSpentToComputeFeature_, v2, v5, v7, v9, v11, v13);

  return v14;
}

void *sub_25A892400(void *a1)
{
  id v3 = (void *)a1[3];
  id v2 = (void *)a1[4];
  id v5 = (void *)a1[5];
  double v4 = (void *)a1[6];
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

void *sub_25A892528(void *a1)
{
  id v6 = (void *)a1[3];
  double v4 = (void *)a1[5];
  id v5 = (void *)a1[4];
  id v3 = (void *)a1[6];
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

uint64_t sub_25A892664()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25A89269C(uint64_t a1, uint64_t a2)
{
  sub_25A88CB9C(a1, a2, v2);
}

void sub_25A8926A4(void *a1)
{
  sub_25A88CD34(a1, v1);
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
      JUMPOUT(0x25A89279CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25A8927C4()
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

uint64_t _s43ProactiveShareSheetDataHarvestingLighthouse19FeaturizationConfigVwet_0(uint64_t a1, int a2)
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

uint64_t sub_25A892AC8(uint64_t result, int a2, int a3)
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
        JUMPOUT(0x25A892C70);
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

ValueMetadata *type metadata accessor for EngagementType()
{
  return &type metadata for EngagementType;
}

unint64_t sub_25A892CAC()
{
  unint64_t result = qword_26A46A248;
  if (!qword_26A46A248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A248);
  }
  return result;
}

unint64_t sub_25A892D04()
{
  unint64_t result = qword_26A46A250;
  if (!qword_26A46A250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A250);
  }
  return result;
}

uint64_t sub_25A892D90(uint64_t a1)
{
  uint64_t result = sub_25A8A8880();
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
        unsigned int v6 = (uint64_t *)(v10 + 40);
        while (v5 < v4)
        {
          ++v5;
          uint64_t v8 = *(v6 - 1);
          uint64_t v7 = *v6;
          swift_bridgeObjectRetain();
          sub_25A89DA00(&v11, v8, v7);
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

uint64_t sub_25A892EAC(uint64_t result, uint64_t a2)
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

uint64_t sub_25A892F10(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
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
        id v9 = (id)MEMORY[0x261147DD0](v8, v4);
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
          sub_25A8A8AF0();
          sub_25A8A8B20();
          unint64_t v4 = v15;
          sub_25A8A8B30();
          sub_25A8A8B00();
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
      uint64_t v7 = sub_25A8A8B70();
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

uint64_t sub_25A8930BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_25A8A8C90();
    sub_25A8A86E0();
    uint64_t v6 = sub_25A8A8CB0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_25A8A8C00() & 1) != 0) {
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
          if (v17 || (sub_25A8A8C00() & 1) != 0) {
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

uint64_t sub_25A8931F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_25A88CB84((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_25A8A1A98(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_25A88593C(a1, &qword_26A46A428);
    sub_25A8A147C(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_25A88593C((uint64_t)v9, &qword_26A46A428);
  }
}

uint64_t DurableFeatureManager.init(config:executionManager:conversationSelection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  long long v7 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v7;
  uint64_t v8 = *(void **)(a1 + 32);
  memcpy((void *)(a4 + 40), (const void *)(a1 + 40), 0x130uLL);
  *(void *)(a4 + 32) = v8;
  sub_25A86AFB8(a2, a4 + 344);
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
  uint64_t v58 = (void *)*((void *)a1 + 4);
  long long v68 = *(long long *)((char *)a1 + 40);
  memcpy(__dst, (char *)a1 + 72, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25A8AA600;
  uint64_t v5 = sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
  *(void *)(v4 + 32) = sub_25A8A8960();
  *(void *)(v4 + 40) = sub_25A8A8960();
  *(void *)(v4 + 48) = sub_25A8A8960();
  sub_25A8A87C0();
  uint64_t v6 = v4;
  uint64_t v61 = (void *)sub_25A8A8960();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25A8AA400;
  *(void *)(v7 + 32) = sub_25A8A8960();
  *(void *)(v7 + 40) = sub_25A8A8960();
  sub_25A8A87C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A068);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25A8A9F70;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A0B0);
  *(void *)(v8 + 56) = v54;
  *(void *)(v8 + 32) = &unk_2708626B0;
  id v9 = (void *)sub_25A8A86A0();
  uint64_t v10 = (void *)sub_25A8A8790();
  swift_bridgeObjectRelease();
  unint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v9, v10);

  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_25A8A9F70;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A380);
  uint64_t v57 = v6;
  *(void *)(v13 + 56) = v56;
  *(void *)(v13 + 32) = v6;
  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)sub_25A8A86A0();
  unint64_t v15 = (void *)sub_25A8A8790();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v14, v15);

  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_25A8A9F70;
  *(void *)(v17 + 56) = v5;
  *(void *)(v17 + 32) = v61;
  id v62 = v61;
  id v18 = (void *)sub_25A8A86A0();
  uint64_t v19 = (void *)sub_25A8A8790();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v18, v19);

  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_25A8AA600;
  *(void *)(v21 + 32) = v12;
  *(void *)(v21 + 40) = v16;
  *(void *)(v21 + 48) = v20;
  *(void *)&__src[0] = v21;
  sub_25A8A87C0();
  sub_25A86AE00(0, &qword_26A46A018);
  id v22 = v12;
  id v23 = v16;
  id v24 = v20;
  uint64_t v25 = (void *)sub_25A8A8790();
  swift_bridgeObjectRelease();
  uint64_t v26 = self;
  id v27 = objc_msgSend(v26, sel_andPredicateWithSubpredicates_, v25);

  if (v64 < 0)
  {
    __break(1u);
  }
  else
  {
    id v52 = v27;
    id v28 = objc_msgSend(v63, sel_lh_kMostRecentConversationsWithLimit_predicate_, v64, v27);
    uint64_t v51 = sub_25A8A8870();

    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_25A8A9F70;
    *(void *)(v29 + 56) = v54;
    *(void *)(v29 + 32) = &unk_2708626B0;
    uint64_t v55 = v22;
    uint64_t v30 = (void *)sub_25A8A86A0();
    id v53 = v24;
    os_log_type_t v31 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v30, v31);

    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_25A8A9F70;
    *(void *)(v33 + 56) = v56;
    *(void *)(v33 + 32) = v57;
    id v34 = (void *)sub_25A8A86A0();
    unint64_t v35 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v36 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v34, v35);

    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_25A8A9F70;
    *(void *)(v37 + 56) = v56;
    *(void *)(v37 + 32) = v7;
    id v38 = (void *)sub_25A8A86A0();
    uint64_t v39 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v11, sel_predicateWithFormat_argumentArray_, v38, v39);

    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_25A8AA600;
    *(void *)(v41 + 32) = v32;
    *(void *)(v41 + 40) = v36;
    *(void *)(v41 + 48) = v40;
    sub_25A8A87C0();
    id v42 = v32;
    id v43 = v36;
    id v44 = v40;
    uint64_t v45 = (void *)sub_25A8A8790();
    swift_bridgeObjectRelease();
    id v46 = objc_msgSend(v26, sel_andPredicateWithSubpredicates_, v45);

    id v47 = objc_msgSend(v63, sel_lh_kMostRecentConversationsWithLimit_predicate_, v64, v46);
    uint64_t v48 = sub_25A8A8870();

    uint64_t v49 = sub_25A893B10(v48, v51);
    sub_25A86AFB8(a2, (uint64_t)v66);
    __src[0] = v70;
    *(void *)&__src[1] = v71;
    *((void *)&__src[1] + 1) = v63;
    *(void *)&void __src[2] = v58;
    *(_OWORD *)((char *)&__src[2] + 8) = v68;
    *((void *)&__src[3] + 1) = v69;
    *(void *)&__src[4] = v64;
    memcpy((char *)&__src[4] + 8, __dst, 0x110uLL);
    sub_25A86AFB8((uint64_t)v66, (uint64_t)&__src[21] + 8);
    *(void *)&__src[24] = v49;
    id v50 = objc_msgSend(v58, sel_source);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v66);
    *((void *)&__src[24] + 1) = v50;
    memcpy(a3, __src, 0x190uLL);

    __swift_destroy_boxed_opaque_existential_1Tm(a2);
  }
}

uint64_t sub_25A893B10(uint64_t result, uint64_t a2)
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
    sub_25A89DA00(&v17, v12, v13);
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

id sub_25A893C90(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (!a4)
  {
    unint64_t v10 = sub_25A895034;
    uint64_t v9 = 0;
    if ((a3 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    sub_25A887E64(a4);
    v10(a1);
    unint64_t v11 = (void *)sub_25A8A88B0();
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v11, 0, 0, 0, 0);
    goto LABEL_6;
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a4;
  *(void *)(v9 + 24) = a5;
  unint64_t v10 = sub_25A8A5FAC;
  if (a3) {
    goto LABEL_5;
  }
LABEL_3:
  sub_25A887E64(a4);
  sub_25A894738(a1, (uint64_t (*)(void *))v10, v9);
  unint64_t v11 = (void *)sub_25A8A8850();
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v11, 0, 0, 0);
LABEL_6:
  id v13 = v12;
  swift_release();

  return v13;
}

uint64_t sub_25A893DE8(unint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = sub_25A8A5A9C(a1, a2);
  uint64_t v3 = *(void *)(sub_25A892D90(v2) + 16);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_25A893E30(uint64_t a1)
{
  uint64_t v2 = sub_25A8A8570();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v57 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v63 = (char *)&v51 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  unint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v51 - v11;
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v50 = swift_bridgeObjectRetain();
    unint64_t v13 = (unint64_t)sub_25A89CC68(v50, (void (*)(void *, uint64_t, unint64_t))sub_25A8A4C44);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  unint64_t v65 = v13;
  sub_25A8A1BF0((uint64_t *)&v65);
  uint64_t v14 = v65;
  unint64_t v15 = (v65 >> 62) & 1;
  if ((v65 & 0x8000000000000000) != 0) {
    LODWORD(v15) = 1;
  }
  int v52 = v15;
  if (v15)
  {
LABEL_84:
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25A8A8B70();
    swift_release();
  }
  else
  {
    uint64_t v16 = *(void *)(v65 + 16);
  }
  uint64_t v58 = v16 - 1;
  if (v16 <= 1) {
    return swift_release();
  }
  uint64_t v18 = 0;
  unint64_t v64 = v14 & 0xC000000000000001;
  uint64_t v61 = (void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  id v62 = (char **)(v3 + 56);
  uint64_t v60 = (uint64_t *)(v3 + 48);
  uint64_t v54 = (char *)(v14 + 32);
  uint64_t v55 = (char *)(v3 + 8);
  uint64_t v3 = 0;
  double v19 = 0.0;
  uint64_t v56 = v10;
  uint64_t v51 = v16;
  while (1)
  {
    unint64_t v59 = v3;
    if (v18 < v58) {
      break;
    }
LABEL_28:
    if (v18 < (uint64_t)v59)
    {
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
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    uint64_t v33 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      goto LABEL_77;
    }
    if (v52)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_25A8A8B70();
      swift_release();
      if (v3 < (uint64_t)v59) {
        goto LABEL_78;
      }
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_25A8A8B70();
      swift_release();
    }
    else
    {
      uint64_t v3 = *(void *)(v14 + 16);
      swift_retain();
      if (v3 < v59) {
        goto LABEL_78;
      }
      uint64_t v3 = *(void *)(v14 + 16);
    }
    if (v3 < v33) {
      goto LABEL_79;
    }
    if (v33 < 0) {
      goto LABEL_80;
    }
    if (v64)
    {
      if (v33 < v59) {
        goto LABEL_81;
      }
      if (v59 != v33)
      {
        sub_25A86AE00(0, &qword_26A469FA0);
        unint64_t v34 = v59;
        do
        {
          unint64_t v35 = v34 + 1;
          sub_25A8A8AB0();
          unint64_t v34 = v35;
        }
        while (v33 != v35);
      }
    }
    if (v52)
    {
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_25A8A8B80();
      unint64_t v10 = v36;
      unint64_t v38 = v37;
      unint64_t v40 = v39;
      swift_release_n();
      uint64_t v3 = v40 >> 1;
      if ((v40 & 1) == 0) {
        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v53 = v14;
      unint64_t v10 = v54;
      unint64_t v38 = v59;
      unint64_t v45 = (2 * v33) | 1;
      uint64_t v3 = v45 >> 1;
      if ((v45 & 1) == 0)
      {
LABEL_51:
        uint64_t v43 = v3 - v38;
        if (__OFSUB__(v3, v38)) {
          goto LABEL_82;
        }
        if (!v43) {
          goto LABEL_64;
        }
        goto LABEL_53;
      }
    }
    sub_25A8A8C20();
    swift_unknownObjectRetain_n();
    uint64_t v41 = swift_dynamicCastClass();
    if (!v41)
    {
      swift_unknownObjectRelease();
      uint64_t v41 = MEMORY[0x263F8EE78];
    }
    uint64_t v42 = *(void *)(v41 + 16);
    swift_release();
    uint64_t v43 = v3 - v38;
    if (__OFSUB__(v3, v38)) {
      goto LABEL_83;
    }
    if (v42 == v43)
    {
      uint64_t v44 = swift_dynamicCastClass();
      if (v44) {
        goto LABEL_65;
      }
      swift_unknownObjectRelease();
LABEL_64:
      uint64_t v44 = MEMORY[0x263F8EE78];
      goto LABEL_65;
    }
    swift_unknownObjectRelease();
    if (!v43) {
      goto LABEL_64;
    }
LABEL_53:
    uint64_t v46 = 8 * v43;
    if (v43 < 1)
    {
      uint64_t v44 = MEMORY[0x263F8EE78];
      if (v38 == v3) {
        goto LABEL_90;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
      uint64_t v44 = swift_allocObject();
      int64_t v47 = _swift_stdlib_malloc_size((const void *)v44);
      uint64_t v48 = v47 - 32;
      if (v47 < 32) {
        uint64_t v48 = v47 - 25;
      }
      *(void *)(v44 + 16) = v43;
      *(void *)(v44 + 24) = (2 * (v48 >> 3)) | 1;
      if (v38 == v3) {
        goto LABEL_90;
      }
    }
    if (v43 < 0) {
      goto LABEL_91;
    }
    v10 += 8 * v38;
    if ((unint64_t)v10 < v44 + 32 + v46 && v44 + 32 < (unint64_t)&v10[v46]) {
      goto LABEL_91;
    }
    sub_25A86AE00(0, &qword_26A469FA0);
    swift_arrayInitWithCopy();
LABEL_65:
    swift_unknownObjectRelease();
    if (v44 < 0 || (v44 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_25A8A8B70();
      swift_release();
    }
    else
    {
      uint64_t v49 = *(void *)(v44 + 16);
    }
    swift_release();
    double v19 = v19 + (double)v49;
    uint64_t v3 = v59 + 1;
    if (v18 >= v51 || v3 == v51) {
      return swift_release();
    }
  }
  while (1)
  {
    unint64_t v20 = v18 + 1;
    if (v64)
    {
      id v21 = (id)MEMORY[0x261147DD0](v18 + 1, v14);
    }
    else
    {
      if (v18 < -1)
      {
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
        goto LABEL_76;
      }
      if (v20 >= *(void *)(v14 + 16)) {
        goto LABEL_75;
      }
      id v21 = *(id *)(v14 + 8 * v18 + 40);
    }
    id v22 = v21;
    uint64_t v23 = v14;
    id v24 = objc_msgSend(v21, sel_startDate, v51);

    if (!v24) {
      break;
    }
    uint64_t v3 = (uint64_t)v63;
    sub_25A8A8530();

    uint64_t v25 = *v61;
    (*v61)(v12, v3, v2);
    unint64_t v10 = *v62;
    ((void (*)(char *, void, uint64_t, uint64_t))*v62)(v12, 0, 1, v2);
    uint64_t v14 = *v60;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))*v60)(v12, 1, v2) == 1) {
      goto LABEL_87;
    }
    if (v64)
    {
      id v26 = (id)MEMORY[0x261147DD0](v59, v23);
    }
    else
    {
      if (v59 >= *(void *)(v23 + 16)) {
        goto LABEL_74;
      }
      id v26 = *(id *)&v54[8 * v59];
    }
    id v27 = v26;
    id v28 = objc_msgSend(v26, sel_startDate);

    if (!v28) {
      goto LABEL_88;
    }
    uint64_t v29 = v63;
    sub_25A8A8530();

    uint64_t v30 = v56;
    v25(v56, (uint64_t)v29, v2);
    ((void (*)(char *, void, uint64_t, uint64_t))v10)(v30, 0, 1, v2);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v14)(v30, 1, v2) == 1) {
      goto LABEL_89;
    }
    os_log_type_t v31 = v57;
    sub_25A8A84E0();
    unint64_t v10 = v55;
    id v32 = *(void (**)(char *, uint64_t))v55;
    (*(void (**)(char *, uint64_t))v55)(v30, v2);
    sub_25A8A6B44((unint64_t *)&qword_26A46A048);
    uint64_t v3 = sub_25A8A8690();
    v32(v31, v2);
    v32(v12, v2);
    uint64_t v14 = v23;
    if (v3) {
      goto LABEL_28;
    }
    ++v18;
    if (v58 == v20)
    {
      uint64_t v18 = v58;
      goto LABEL_28;
    }
  }
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v62)(v12, 1, 1, v2);
LABEL_87:
  __break(1u);
LABEL_88:
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v10)(v56, 1, 1, v2);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
  swift_release();
  __break(1u);
LABEL_91:
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A894738(uint64_t a1, uint64_t (*a2)(void *), uint64_t a3)
{
  uint64_t v58 = a2;
  uint64_t v59 = a3;
  uint64_t v4 = sub_25A8A8570();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v64 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v71 = (char *)&v56 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  id v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  long long v70 = (char *)&v56 - v13;
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v55 = swift_bridgeObjectRetain();
    unint64_t v14 = (unint64_t)sub_25A89CC68(v55, (void (*)(void *, uint64_t, unint64_t))sub_25A8A4C44);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v14 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  unint64_t v73 = v14;
  sub_25A8A1BF0((uint64_t *)&v73);
  uint64_t v15 = v73;
  unint64_t v16 = (v73 >> 62) & 1;
  if ((v73 & 0x8000000000000000) != 0) {
    LODWORD(v16) = 1;
  }
  int v60 = v16;
  if (v16 == 1)
  {
LABEL_79:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_25A8A8B70();
    swift_release();
    if (!v17) {
      return swift_release();
    }
  }
  else
  {
    uint64_t v17 = *(void *)(v73 + 16);
    if (!v17) {
      return swift_release();
    }
  }
  uint64_t v65 = v17 - 1;
  if (v17 <= 1) {
    return swift_release();
  }
  uint64_t v18 = 0;
  unint64_t v72 = v15 & 0xC000000000000001;
  long long v68 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v69 = (char **)(v5 + 56);
  unint64_t v67 = (uint64_t *)(v5 + 48);
  uint64_t v62 = v15 + 32;
  id v63 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v5 = 0;
  double v19 = 0.0;
  uint64_t v57 = v17;
  while (1)
  {
    unint64_t v66 = v5;
    if (v18 < v65) {
      break;
    }
LABEL_27:
    if (v18 < (uint64_t)v66)
    {
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
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
      goto LABEL_79;
    }
    uint64_t v35 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      goto LABEL_72;
    }
    if (v60)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25A8A8B70();
      swift_release();
      if (v5 < (uint64_t)v66) {
        goto LABEL_73;
      }
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_25A8A8B70();
      swift_release();
    }
    else
    {
      uint64_t v5 = *(void *)(v15 + 16);
      swift_retain();
      if (v5 < v66) {
        goto LABEL_73;
      }
      uint64_t v5 = *(void *)(v15 + 16);
    }
    if (v5 < v35) {
      goto LABEL_74;
    }
    if (v35 < 0) {
      goto LABEL_75;
    }
    if (v72)
    {
      if (v35 < v66) {
        goto LABEL_76;
      }
      if (v66 != v35)
      {
        sub_25A86AE00(0, &qword_26A469FA0);
        unint64_t v36 = v66;
        do
        {
          unint64_t v37 = v36 + 1;
          sub_25A8A8AB0();
          unint64_t v36 = v37;
        }
        while (v35 != v37);
      }
    }
    if (v60)
    {
      swift_bridgeObjectRetain();
      uint64_t v61 = sub_25A8A8B80();
      uint64_t v39 = v38;
      unint64_t v41 = v40;
      unint64_t v43 = v42;
      swift_release_n();
      uint64_t v5 = v43 >> 1;
      if ((v43 & 1) == 0) {
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v61 = v15;
      uint64_t v39 = v62;
      unint64_t v41 = v66;
      unint64_t v48 = (2 * v35) | 1;
      uint64_t v5 = v48 >> 1;
      if ((v48 & 1) == 0)
      {
LABEL_50:
        uint64_t v46 = v5 - v41;
        if (__OFSUB__(v5, v41)) {
          goto LABEL_77;
        }
        if (!v46) {
          goto LABEL_63;
        }
        goto LABEL_52;
      }
    }
    sub_25A8A8C20();
    swift_unknownObjectRetain_n();
    uint64_t v44 = swift_dynamicCastClass();
    if (!v44)
    {
      swift_unknownObjectRelease();
      uint64_t v44 = MEMORY[0x263F8EE78];
    }
    uint64_t v45 = *(void *)(v44 + 16);
    swift_release();
    uint64_t v46 = v5 - v41;
    if (__OFSUB__(v5, v41)) {
      goto LABEL_78;
    }
    if (v45 == v46)
    {
      int64_t v47 = (void *)swift_dynamicCastClass();
      if (v47) {
        goto LABEL_64;
      }
      swift_unknownObjectRelease();
LABEL_63:
      int64_t v47 = (void *)MEMORY[0x263F8EE78];
      goto LABEL_64;
    }
    swift_unknownObjectRelease();
    if (!v46) {
      goto LABEL_63;
    }
LABEL_52:
    uint64_t v49 = v46;
    if (v46 < 1)
    {
      int64_t v47 = (void *)MEMORY[0x263F8EE78];
      if (v41 == v5) {
        goto LABEL_86;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
      int64_t v47 = (void *)swift_allocObject();
      int64_t v50 = _swift_stdlib_malloc_size(v47);
      uint64_t v51 = v50 - 32;
      if (v50 < 32) {
        uint64_t v51 = v50 - 25;
      }
      v47[2] = v46;
      v47[3] = (2 * (v51 >> 3)) | 1;
      if (v41 == v5) {
        goto LABEL_86;
      }
    }
    if (v46 < 0) {
      goto LABEL_87;
    }
    unint64_t v52 = v39 + 8 * v41;
    if (v52 < (unint64_t)&v47[v49 + 4] && (unint64_t)(v47 + 4) < v52 + v49 * 8) {
      goto LABEL_87;
    }
    sub_25A86AE00(0, &qword_26A469FA0);
    swift_arrayInitWithCopy();
LABEL_64:
    swift_unknownObjectRelease();
    uint64_t v53 = v58(v47);
    swift_release();
    double v19 = v19 + (double)v53;
    uint64_t v5 = v66 + 1;
    if (v18 >= v57 || v5 == v57) {
      return swift_release();
    }
  }
  while (1)
  {
    unint64_t v20 = v18 + 1;
    if (v72)
    {
      id v21 = (id)MEMORY[0x261147DD0](v18 + 1, v15);
    }
    else
    {
      if (v18 < -1)
      {
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
        goto LABEL_71;
      }
      if (v20 >= *(void *)(v15 + 16)) {
        goto LABEL_70;
      }
      id v21 = *(id *)(v15 + 8 * v18 + 40);
    }
    id v22 = v21;
    uint64_t v23 = v12;
    uint64_t v24 = v15;
    id v25 = objc_msgSend(v21, sel_startDate);

    if (!v25) {
      break;
    }
    uint64_t v5 = (uint64_t)v71;
    sub_25A8A8530();

    id v26 = *v68;
    id v27 = v70;
    (*v68)(v70, v5, v4);
    id v12 = *v69;
    ((void (*)(char *, void, uint64_t, uint64_t))*v69)(v27, 0, 1, v4);
    uint64_t v15 = *v67;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))*v67)(v27, 1, v4) == 1) {
      goto LABEL_83;
    }
    if (v72)
    {
      id v28 = (id)MEMORY[0x261147DD0](v66, v24);
    }
    else
    {
      if (v66 >= *(void *)(v24 + 16)) {
        goto LABEL_69;
      }
      id v28 = *(id *)(v62 + 8 * v66);
    }
    uint64_t v29 = v28;
    id v30 = objc_msgSend(v28, sel_startDate);

    if (!v30) {
      goto LABEL_84;
    }
    os_log_type_t v31 = v71;
    sub_25A8A8530();

    v26(v23, (uint64_t)v31, v4);
    ((void (*)(char *, void, uint64_t, uint64_t))v12)(v23, 0, 1, v4);
    id v12 = v23;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v15)(v23, 1, v4) == 1) {
      goto LABEL_85;
    }
    id v32 = v64;
    sub_25A8A84E0();
    uint64_t v33 = *v63;
    (*v63)(v23, v4);
    sub_25A8A6B44((unint64_t *)&qword_26A46A048);
    unint64_t v34 = v70;
    uint64_t v5 = sub_25A8A8690();
    v33(v32, v4);
    v33(v34, v4);
    uint64_t v15 = v24;
    if (v5) {
      goto LABEL_27;
    }
    ++v18;
    if (v65 == v20)
    {
      uint64_t v18 = v65;
      goto LABEL_27;
    }
  }
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v69)(v70, 1, 1, v4);
LABEL_83:
  __break(1u);
LABEL_84:
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v12)(v23, 1, 1, v4);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
  swift_release();
  __break(1u);
LABEL_87:
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A895034(unint64_t a1)
{
  if (!(a1 >> 62)) {
    return *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_25A8A8B70();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25A895094(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v32 = MEMORY[0x263F8EE78];
  if (qword_26A469F70 != -1) {
    swift_once();
  }
  if ((sub_25A892EAC(a1, qword_26A46AF00) & 1) == 0)
  {
    id v6 = (id)BMMLSEDurableFeatureStorefeatureNameAsString();
    uint64_t v7 = sub_25A8A86B0();
    uint64_t v9 = v8;

    sub_25A869ECC();
    swift_allocError();
    *(void *)uint64_t v10 = v7;
    *(void *)(v10 + 8) = v9;
    *(unsigned char *)(v10 + 16) = 0;
    return swift_willThrow();
  }
  sub_25A8A5F0C(v3, (uint64_t)v31);
  sub_25A8A5F0C(v3, (uint64_t)v30);
  sub_25A8A5F0C(v3, (uint64_t)v29);
  sub_25A8A5F0C(v3, (uint64_t)v28);
  sub_25A8A5F0C(v3, (uint64_t)v27);
  sub_25A8A5F0C(v3, (uint64_t)v26);
  sub_25A8A5F0C(v3, (uint64_t)v25);
  sub_25A86D238(v24, a1);
  if (v2)
  {
    sub_25A8A5F44((uint64_t)v25);
    sub_25A8A5F44((uint64_t)v26);
    sub_25A8A5F44((uint64_t)v27);
    sub_25A8A5F44((uint64_t)v28);
    sub_25A8A5F44((uint64_t)v29);
    sub_25A8A5F44((uint64_t)v30);
    sub_25A8A5F44((uint64_t)v31);
    return swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A390);
  if (swift_dynamicCast())
  {
    sub_25A8A5F44((uint64_t)v25);
    sub_25A8A5F44((uint64_t)v27);
    swift_bridgeObjectRelease();
    switch(v23 >> 61)
    {
      case 1uLL:
        sub_25A87EF80(v16[5], v16[6], v17, v18, v19, v20, v21, v22, v23);
        sub_25A8A5F44((uint64_t)v28);
        sub_25A8A5F44((uint64_t)v29);
        sub_25A8A5F44((uint64_t)v30);
        sub_25A8A5F44((uint64_t)v31);
        sub_25A86D238(v16, a1);
        uint64_t v14 = sub_25A898EC4((uint64_t)v16, (uint64_t)v26, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        uint64_t v15 = v26;
        goto LABEL_22;
      case 2uLL:
        swift_release();
        swift_release();
        sub_25A8A5F44((uint64_t)v26);
        sub_25A8A5F44((uint64_t)v28);
        sub_25A8A5F44((uint64_t)v30);
        sub_25A8A5F44((uint64_t)v31);
        sub_25A86D238(v16, a1);
        uint64_t v14 = sub_25A897044((uint64_t)v16, (uint64_t)v29, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        uint64_t v15 = v29;
        goto LABEL_22;
      case 3uLL:
        sub_25A87F0A0(v17);
        swift_bridgeObjectRelease();
        sub_25A8A5F44((uint64_t)v26);
        sub_25A8A5F44((uint64_t)v28);
        sub_25A8A5F44((uint64_t)v29);
        sub_25A8A5F44((uint64_t)v31);
        sub_25A86D238(v16, a1);
        uint64_t v14 = sub_25A8959B0((uint64_t)v16, v30, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        uint64_t v15 = v30;
        goto LABEL_22;
      case 4uLL:
        swift_release();
        swift_release();
        sub_25A8A5F44((uint64_t)v26);
        sub_25A8A5F44((uint64_t)v29);
        sub_25A8A5F44((uint64_t)v30);
        sub_25A8A5F44((uint64_t)v31);
        sub_25A86D238(v16, a1);
        uint64_t v14 = sub_25A8979DC((uint64_t)v16, (uint64_t)v28, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        uint64_t v15 = v28;
LABEL_22:
        sub_25A8A5F44((uint64_t)v15);
        break;
      default:
        sub_25A87F0A0(v17);

        sub_25A8A5F44((uint64_t)v26);
        sub_25A8A5F44((uint64_t)v28);
        sub_25A8A5F44((uint64_t)v29);
        sub_25A8A5F44((uint64_t)v30);
        sub_25A86D238(v16, a1);
        uint64_t v14 = sub_25A895738((uint64_t)v16, (uint64_t)v31, a1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
        sub_25A8A5F44((uint64_t)v31);
        break;
    }
    goto LABEL_23;
  }
  sub_25A8A5F44((uint64_t)v26);
  sub_25A8A5F44((uint64_t)v28);
  sub_25A8A5F44((uint64_t)v29);
  sub_25A8A5F44((uint64_t)v30);
  sub_25A8A5F44((uint64_t)v31);
  if (!swift_dynamicCast())
  {
    sub_25A8A5F44((uint64_t)v25);
    sub_25A8A5F44((uint64_t)v27);
    swift_bridgeObjectRelease();
    sub_25A869ECC();
    swift_allocError();
    *(void *)uint64_t v12 = 0xD000000000000013;
    *(void *)(v12 + 8) = 0x800000025A8B3720;
    *(unsigned char *)(v12 + 16) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
  if (LOBYTE(v16[0]))
  {
    if (LOBYTE(v16[0]) != 1)
    {
      sub_25A8A5F44((uint64_t)v27);
      swift_bridgeObjectRelease();
      uint64_t v14 = sub_25A89A318((uint64_t)v25);
      sub_25A8A5F44((uint64_t)v25);
      goto LABEL_23;
    }
    sub_25A8A5F44((uint64_t)v25);
    uint64_t v11 = 0;
  }
  else
  {
    sub_25A8A5F44((uint64_t)v25);
    uint64_t v11 = 1;
  }
  sub_25A898A2C(v11, (uint64_t)v27, &v32, a1);
  uint64_t v14 = v13;
  sub_25A8A5F44((uint64_t)v27);
  swift_bridgeObjectRelease();
LABEL_23:
  swift_beginAccess();
  uint64_t v32 = v14;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  swift_beginAccess();
  return v32;
}

uint64_t sub_25A895738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25A86AFB8(a1, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A390);
  if (!swift_dynamicCast()) {
    goto LABEL_7;
  }
  if (v27 >> 61)
  {
    sub_25A87EF80(v18, v20, v21, v22, v23, v24, v25, v26, v27);
LABEL_7:
    sub_25A869ECC();
    swift_allocError();
    *(_OWORD *)uint64_t v8 = xmmword_25A8AA610;
    *(unsigned char *)(v8 + 16) = 1;
    swift_willThrow();
    return v3;
  }
  uint64_t v3 = *(void *)(a2 + 24);
  id v7 = sub_25A8695B8((uint64_t)v23, *(void *)(a2 + 8));
  if (v4)
  {
  }
  else
  {
    uint64_t v10 = (uint64_t)v7;
    sub_25A8A8830();
    id v11 = sub_25A893C90(v10, v18, v20 & 1, v21, v22);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_25A8AA620;
    sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
    id v12 = v11;
    uint64_t v13 = (void *)sub_25A8A8960();
    id v14 = objc_allocWithZone(MEMORY[0x263F2A1D8]);
    uint64_t v15 = (void *)sub_25A8A86A0();
    id v16 = objc_msgSend(v14, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v15, a3, v12, v13);

    uint64_t v17 = v29;
    *(void *)(v29 + 32) = v16;
    uint64_t v19 = v17;
    sub_25A8A87C0();
    uint64_t v3 = v19;
  }
  sub_25A87F0A0(v21);
  return v3;
}

uint64_t sub_25A8959B0(uint64_t a1, void *a2, unsigned int a3)
{
  char v124 = a2;
  uint64_t v139 = sub_25A8A8570();
  uint64_t v5 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  uint64_t v138 = &v118[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25A86AFB8(a1, (uint64_t)&v155);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A390);
  if (swift_dynamicCast())
  {
    uint64_t v7 = v150;
    char v8 = v151;
    a1 = v152;
    uint64_t v9 = v154;
    if (v153 >> 61 == 3)
    {
      uint64_t v134 = v148;
      uint64_t v135 = v147;
      unsigned int v119 = a3;
      uint64_t v133 = v146;
      uint64_t v127 = v5;
      int64_t v126 = v145;
      uint64_t v129 = (uint64_t)v149;
      if (v153)
      {
        unint64_t v11 = MEMORY[0x263F8EE78];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
        uint64_t v10 = swift_allocObject();
        *(_OWORD *)(v10 + 16) = xmmword_25A8AA620;
        *(void *)(v10 + 32) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a1);
        unint64_t v145 = v10;
        a1 = (uint64_t)&v145;
        sub_25A8A87C0();
        unint64_t v11 = v145;
      }
      unint64_t v136 = v11;
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      unint64_t v14 = MEMORY[0x263F8EE78];
      if ((v8 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
        uint64_t v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_25A8AA620;
        *(void *)(v15 + 32) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v7);
        unint64_t v145 = v15;
        a1 = (uint64_t)&v145;
        sub_25A8A87C0();
        unint64_t v14 = v145;
      }
      uint64_t v155 = (uint64_t)v13;
      unint64_t v16 = v124[48];
      uint64_t v156 = MEMORY[0x263F8EE88];
      uint64_t v17 = *(void *)(v16 + 56);
      unint64_t v130 = v16 + 56;
      uint64_t v18 = 1 << *(unsigned char *)(v16 + 32);
      uint64_t v19 = -1;
      if (v18 < 64) {
        uint64_t v19 = ~(-1 << v18);
      }
      unint64_t v20 = v19 & v17;
      int64_t v131 = (unint64_t)(v18 + 63) >> 6;
      unint64_t v137 = v16;
      swift_bridgeObjectRetain();
      int64_t v21 = 0;
      unint64_t v128 = MEMORY[0x263F8EE80];
      long long v140 = xmmword_25A8A9F70;
      unint64_t v123 = v13;
      char v141 = v9;
      uint64_t v132 = (void (**)(void, void))v14;
      uint64_t v22 = v136;
      if (!v20) {
        goto LABEL_14;
      }
LABEL_13:
      uint64_t v142 = (v20 - 1) & v20;
      for (unint64_t i = __clz(__rbit64(v20)) | (v21 << 6); ; unint64_t i = __clz(__rbit64(v25)) + (v21 << 6))
      {
        unint64_t v27 = (uint64_t *)(*(void *)(v137 + 48) + 16 * i);
        uint64_t v29 = *v27;
        uint64_t v28 = v27[1];
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A090);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v140;
        *(void *)(inited + 32) = v29;
        a1 = inited + 32;
        *(void *)(inited + 40) = v28;
        uint64_t v31 = v124[1];
        uint64_t v32 = (void *)v124[3];
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        unint64_t v33 = (unint64_t)v132;
        swift_bridgeObjectRetain();
        uint64_t v34 = v143;
        uint64_t v35 = sub_25A882E94(inited, v22, v33, 0, 0, 0, 1, v31, v32);
        if (v34)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_setDeallocating();
          swift_arrayDestroy();
          sub_25A87F0A0(v135);
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_46;
        }
        unint64_t v36 = v35;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_setDeallocating();
        swift_arrayDestroy();
        sub_25A8A8830();
        uint64_t v143 = 0;
        if (v36 >> 62)
        {
          swift_bridgeObjectRetain();
          a1 = sub_25A8A8B70();
          swift_bridgeObjectRelease();
          if (!a1)
          {
LABEL_28:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v9 = v141;
            goto LABEL_29;
          }
        }
        else
        {
          a1 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!a1) {
            goto LABEL_28;
          }
        }
        uint64_t v37 = v156;
        swift_bridgeObjectRetain();
        char v38 = sub_25A8930BC(v29, v28, v37);
        swift_bridgeObjectRelease();
        if (v38)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRetain();
          sub_25A89DA00((uint64_t *)&v145, v29, v28);
          swift_bridgeObjectRelease();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v123 = sub_25A89C718(0, v123[2] + 1, 1, v123);
          }
          unint64_t v40 = v123[2];
          unint64_t v39 = v123[3];
          if (v40 >= v39 >> 1) {
            unint64_t v123 = sub_25A89C718((void *)(v39 > 1), v40 + 1, 1, v123);
          }
          unint64_t v41 = v123;
          v123[2] = v40 + 1;
          unint64_t v42 = &v41[2 * v40];
          v42[4] = v29;
          v42[5] = v28;
        }
        a1 = sub_25A883AA4(v36, v129);
        swift_bridgeObjectRelease();
        uint64_t v43 = v143;
        sub_25A8A8830();
        if (v43)
        {
          sub_25A87F0A0(v135);
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_46:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return a1;
        }
        unint64_t v44 = v128;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v145 = v44;
        sub_25A8A4900(a1, (uint64_t)sub_25A8A5518, 0, isUniquelyReferenced_nonNull_native, &v145);
        uint64_t v143 = 0;
        uint64_t v9 = v141;
        unint64_t v128 = v145;
        swift_bridgeObjectRelease();
LABEL_29:
        unint64_t v20 = v142;
        if (v142) {
          goto LABEL_13;
        }
LABEL_14:
        BOOL v24 = __OFADD__(v21++, 1);
        if (v24)
        {
LABEL_156:
          __break(1u);
          goto LABEL_157;
        }
        if (v21 >= v131) {
          goto LABEL_48;
        }
        unint64_t v25 = *(void *)(v130 + 8 * v21);
        if (!v25)
        {
          int64_t v26 = v21 + 1;
          if (v21 + 1 >= v131) {
            goto LABEL_48;
          }
          unint64_t v25 = *(void *)(v130 + 8 * v26);
          if (v25) {
            goto LABEL_23;
          }
          int64_t v26 = v21 + 2;
          if (v21 + 2 >= v131) {
            goto LABEL_48;
          }
          unint64_t v25 = *(void *)(v130 + 8 * v26);
          if (v25) {
            goto LABEL_23;
          }
          int64_t v26 = v21 + 3;
          if (v21 + 3 >= v131) {
            goto LABEL_48;
          }
          unint64_t v25 = *(void *)(v130 + 8 * v26);
          if (v25)
          {
LABEL_23:
            int64_t v21 = v26;
            goto LABEL_24;
          }
          while (1)
          {
            int64_t v21 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_159;
            }
            if (v21 >= v131) {
              break;
            }
            unint64_t v25 = *(void *)(v130 + 8 * v21);
            ++v26;
            if (v25) {
              goto LABEL_24;
            }
          }
LABEL_48:
          unint64_t v47 = MEMORY[0x263F8EE78];
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v121 = v123[2];
          if (v121)
          {
            BOOL v120 = v123 + 4;
            unint64_t v125 = v128 + 64;
            uint64_t v132 = (void (**)(void, void))(v127 + 8);
            swift_bridgeObjectRetain();
            unint64_t v48 = 0;
            uint64_t v22 = v135;
            while (1)
            {
              if (v48 >= v123[2]) {
                goto LABEL_158;
              }
              uint64_t v49 = &v120[2 * v48];
              unint64_t v50 = *v49;
              unint64_t v51 = v49[1];
              swift_bridgeObjectRetain();
              uint64_t v52 = v143;
              sub_25A8A8830();
              if (v52)
              {
                sub_25A87F0A0(v22);
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_46;
              }
              uint64_t v143 = 0;
              uint64_t v53 = v124[48];
              if (!*(void *)(v53 + 16))
              {
                swift_bridgeObjectRelease();
                goto LABEL_51;
              }
              unint64_t v122 = v48;
              sub_25A8A8C90();
              sub_25A8A86E0();
              a1 = (uint64_t)&v145;
              uint64_t v54 = sub_25A8A8CB0();
              unint64_t v55 = v50;
              uint64_t v56 = -1 << *(unsigned char *)(v53 + 32);
              unint64_t v57 = v54 & ~v56;
              if (((*(void *)(v53 + 56 + ((v57 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v57) & 1) == 0) {
                goto LABEL_144;
              }
              a1 = *(void *)(v53 + 48);
              uint64_t v58 = (void *)(a1 + 16 * v57);
              BOOL v59 = *v58 == v55 && v58[1] == v51;
              unint64_t v137 = v51;
              unint64_t v136 = v55;
              if (!v59 && (sub_25A8A8C00() & 1) == 0)
              {
                do
                {
                  unint64_t v57 = (v57 + 1) & ~v56;
                  if (((*(void *)(v53 + 56 + ((v57 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v57) & 1) == 0) {
                    goto LABEL_144;
                  }
                  uint64_t v111 = (void *)(a1 + 16 * v57);
                  BOOL v112 = *v111 == v136 && v111[1] == v137;
                }
                while (!v112 && (sub_25A8A8C00() & 1) == 0);
              }
              unint64_t v145 = v47;
              uint64_t v60 = 1 << *(unsigned char *)(v128 + 32);
              if (v60 < 64) {
                uint64_t v61 = ~(-1 << v60);
              }
              else {
                uint64_t v61 = -1;
              }
              unint64_t v62 = v61 & *(void *)(v128 + 64);
              int64_t v126 = (unint64_t)(v60 + 63) >> 6;
              swift_bridgeObjectRetain();
              int64_t v63 = 0;
              if (!v62) {
                goto LABEL_66;
              }
              do
              {
                while (1)
                {
                  unint64_t v64 = __clz(__rbit64(v62));
                  v62 &= v62 - 1;
                  unint64_t v65 = v64 | (v63 << 6);
LABEL_77:
                  uint64_t v68 = *(void *)(*(void *)(v128 + 48) + 16 * v65);
                  unint64_t v69 = *(void *)(*(void *)(v128 + 56) + 8 * v65);
                  unint64_t v144 = v47;
                  uint64_t v70 = v9[2];
                  uint64_t v71 = swift_bridgeObjectRetain();
                  uint64_t v142 = v70;
                  if (v70) {
                    break;
                  }
                  a1 = v47;
LABEL_118:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (!v62) {
                    goto LABEL_66;
                  }
                }
                uint64_t v127 = v68;
                uint64_t v129 = v71;
                unint64_t v130 = v62;
                int64_t v131 = v63;
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                BOOL v72 = 0;
                uint64_t v73 = 0;
                do
                {
                  double v78 = *(double *)&v9[v73 + 4];
                  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A090);
                  uint64_t v79 = swift_initStackObject();
                  *(_OWORD *)(v79 + 16) = v140;
                  *(void *)(v79 + 32) = v136;
                  *(void *)(v79 + 40) = v137;
                  swift_bridgeObjectRetain();
                  uint64_t v80 = sub_25A8A5780(v79);
                  uint64_t v81 = v138;
                  uint64_t v82 = sub_25A8A8510();
                  MEMORY[0x270FA5388](v82);
                  uint64_t v116 = v80;
                  char v117 = v81;
                  swift_bridgeObjectRetain();
                  uint64_t v83 = v143;
                  uint64_t v84 = sub_25A892F10(sub_25A8A636C, (uint64_t)&v118[-32], v69);
                  uint64_t v143 = v83;
                  uint64_t v22 = v135;
                  (*v132)(v81, v139);
                  swift_bridgeObjectRelease();
                  swift_setDeallocating();
                  swift_arrayDestroy();
                  if (v22)
                  {
                    uint64_t v85 = swift_allocObject();
                    uint64_t v86 = v134;
                    *(void *)(v85 + 16) = v22;
                    *(void *)(v85 + 24) = v86;
                    int64_t v87 = sub_25A8A6BA8;
                  }
                  else
                  {
                    int64_t v87 = sub_25A895034;
                    uint64_t v85 = 0;
                  }
                  sub_25A887E64(v22);
                  if (v133)
                  {
                    v87(v84);
                    id v88 = (void *)sub_25A8A88B0();
                    id v89 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v88, 0, 0, 0, 0);
                  }
                  else
                  {
                    sub_25A894738(v84, (uint64_t (*)(void *))v87, v85);
                    id v88 = (void *)sub_25A8A8850();
                    id v89 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v88, 0, 0, 0);
                  }
                  id v90 = v89;
                  swift_bridgeObjectRelease();
                  swift_release();

                  if ((objc_msgSend(v90, sel_hasIntValue) & 1) == 0) {
                    goto LABEL_84;
                  }
                  objc_msgSend(v90, sel_intValue);
                  if (v72
                    || objc_msgSend(v90, sel_intValue)
                    || objc_msgSend(v90, sel_BOOLValue))
                  {
                    sub_25A86AE00(0, &qword_26A46A3C0);
                    if (v78 == 86400.0)
                    {
                      uint64_t v74 = 1;
                      BOOL v72 = 1;
                    }
                    else
                    {
                      if (v78 == 604800.0)
                      {
                        BOOL v72 = 1;
LABEL_99:
                        uint64_t v74 = 2;
                        goto LABEL_81;
                      }
                      if (v78 != 2592000.0)
                      {
                        BOOL v72 = 1;
                        if (v78 != 7776000.0) {
                          goto LABEL_108;
                        }
LABEL_103:
                        uint64_t v74 = 4;
                        goto LABEL_81;
                      }
                      BOOL v72 = 1;
                      uint64_t v74 = 3;
                    }
                  }
                  else
                  {
                    objc_msgSend(v90, sel_doubleValue);
                    BOOL v72 = v91 > 0.0;
                    sub_25A86AE00(0, &qword_26A46A3C0);
                    if (v78 != 86400.0)
                    {
                      if (v78 != 604800.0)
                      {
                        if (v78 == 2592000.0)
                        {
                          uint64_t v74 = 3;
                          goto LABEL_81;
                        }
                        if (v78 != 7776000.0)
                        {
LABEL_108:
                          if (v78 == 15552000.0) {
                            uint64_t v74 = 5;
                          }
                          else {
                            uint64_t v74 = 0;
                          }
                          goto LABEL_81;
                        }
                        goto LABEL_103;
                      }
                      goto LABEL_99;
                    }
                    uint64_t v74 = 1;
                  }
LABEL_81:
                  id v75 = (void *)sub_25A8A8CC0();
                  id v76 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInterval_value_, v74, v75);

                  id v77 = v76;
                  MEMORY[0x261147A90]();
                  if (*(void *)((v144 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v144 & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
                    sub_25A8A87D0();
                  sub_25A8A87F0();
                  sub_25A8A87C0();

LABEL_84:
                  uint64_t v9 = v141;
                  ++v73;
                }
                while (v142 != v73);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (!v72)
                {
                  a1 = v144;
                  unint64_t v47 = MEMORY[0x263F8EE78];
                  int64_t v63 = v131;
                  unint64_t v62 = v130;
                  goto LABEL_118;
                }
                uint64_t v92 = (void *)sub_25A8A8810();
                id v93 = objc_allocWithZone(MEMORY[0x263F2A210]);
                uint64_t v94 = (void *)sub_25A8A86A0();
                swift_bridgeObjectRelease();
                sub_25A86AE00(0, &qword_26A46A3C0);
                uint64_t v95 = (void *)sub_25A8A8790();
                swift_bridgeObjectRelease();
                id v96 = objc_msgSend(v93, sel_initWithBucketName_hasEver_counts_, v94, v92, v95);

                id v97 = v96;
                a1 = (uint64_t)&v145;
                MEMORY[0x261147A90]();
                int64_t v63 = v131;
                if (*(void *)((v145 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v145 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_25A8A87D0();
                }
                sub_25A8A87F0();
                sub_25A8A87C0();

                uint64_t v9 = v141;
                unint64_t v47 = MEMORY[0x263F8EE78];
                unint64_t v62 = v130;
              }
              while (v130);
LABEL_66:
              BOOL v24 = __OFADD__(v63++, 1);
              if (v24)
              {
                __break(1u);
                goto LABEL_156;
              }
              if (v63 < v126)
              {
                unint64_t v66 = *(void *)(v125 + 8 * v63);
                if (v66) {
                  goto LABEL_76;
                }
                int64_t v67 = v63 + 1;
                if (v63 + 1 < v126)
                {
                  unint64_t v66 = *(void *)(v125 + 8 * v67);
                  if (v66)
                  {
LABEL_75:
                    int64_t v63 = v67;
LABEL_76:
                    unint64_t v62 = (v66 - 1) & v66;
                    unint64_t v65 = __clz(__rbit64(v66)) + (v63 << 6);
                    goto LABEL_77;
                  }
                  int64_t v67 = v63 + 2;
                  if (v63 + 2 < v126)
                  {
                    unint64_t v66 = *(void *)(v125 + 8 * v67);
                    if (v66) {
                      goto LABEL_75;
                    }
                    int64_t v67 = v63 + 3;
                    if (v63 + 3 < v126)
                    {
                      unint64_t v66 = *(void *)(v125 + 8 * v67);
                      if (v66) {
                        goto LABEL_75;
                      }
                      while (1)
                      {
                        int64_t v63 = v67 + 1;
                        if (__OFADD__(v67, 1)) {
                          break;
                        }
                        if (v63 >= v126) {
                          goto LABEL_124;
                        }
                        unint64_t v66 = *(void *)(v125 + 8 * v63);
                        ++v67;
                        if (v66) {
                          goto LABEL_76;
                        }
                      }
LABEL_157:
                      __break(1u);
LABEL_158:
                      __break(1u);
LABEL_159:
                      __break(1u);
LABEL_160:
                      swift_bridgeObjectRetain_n();
                      unint64_t v114 = (unint64_t)sub_25A89CC68(a1, (void (*)(void *, uint64_t, unint64_t))sub_25A8A4E78);
                      swift_bridgeObjectRelease();
                      goto LABEL_151;
                    }
                  }
                }
              }
LABEL_124:
              swift_release();
              a1 = v145;
              if (v145 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v113 = sub_25A8A8B70();
                swift_bridgeObjectRelease();
                if (v113 > 0) {
                  goto LABEL_126;
                }
LABEL_143:
                swift_bridgeObjectRelease();
LABEL_144:
                swift_bridgeObjectRelease();
                goto LABEL_145;
              }
              if (*(uint64_t *)((v145 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0) {
                goto LABEL_143;
              }
LABEL_126:
              if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
              {
                swift_bridgeObjectRetain_n();
                uint64_t v98 = (uint64_t)sub_25A89CC68(a1, (void (*)(void *, uint64_t, unint64_t))sub_25A8A50AC);
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v98 = a1 & 0xFFFFFFFFFFFFFF8;
                swift_bridgeObjectRetain_n();
              }
              unint64_t v144 = v98;
              uint64_t v99 = v143;
              sub_25A8A1C6C((uint64_t *)&v144, (uint64_t (*)(uint64_t))sub_25A8A5504, &qword_26A46A3C8, 0x263F2A210, (SEL *)&selRef_bucketName);
              uint64_t v143 = v99;
              if (v99)
              {
                swift_release();
                __break(1u);
                goto LABEL_162;
              }
              swift_bridgeObjectRelease();
              unint64_t v100 = v144;
              swift_bridgeObjectRelease();
              unint64_t v145 = v100;
              id v101 = objc_allocWithZone(MEMORY[0x263F2A200]);
              sub_25A86AE00(0, &qword_26A46A3C8);
              uint64_t v102 = (void *)sub_25A8A8790();
              swift_release();
              id v103 = objc_msgSend(v101, sel_initWithBucketList_, v102);

              id v104 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, 0, v103);
              sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
              id v105 = v104;
              char v106 = (void *)sub_25A8A8960();
              id v107 = objc_allocWithZone(MEMORY[0x263F2A1D8]);
              char v108 = (void *)sub_25A8A86A0();
              swift_bridgeObjectRelease();
              id v109 = objc_msgSend(v107, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v108, v119, v105, v106);

              id v110 = v109;
              a1 = (uint64_t)&v155;
              MEMORY[0x261147A90]();
              if (*(void *)((v155 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v155 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_25A8A87D0();
              }
              sub_25A8A87F0();
              sub_25A8A87C0();

              uint64_t v22 = v135;
              uint64_t v9 = v141;
LABEL_145:
              unint64_t v48 = v122;
LABEL_51:
              if (++v48 == v121) {
                goto LABEL_148;
              }
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v22 = v135;
LABEL_148:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a1 = v155;
          if (v155 < 0 || (v155 & 0x4000000000000000) != 0) {
            goto LABEL_160;
          }
          unint64_t v114 = v155 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n();
LABEL_151:
          unint64_t v145 = v114;
          uint64_t v115 = v143;
          sub_25A8A1C6C((uint64_t *)&v145, (uint64_t (*)(uint64_t))sub_25A8A6B98, &qword_26A46A3E0, 0x263F2A1D8, (SEL *)&selRef_itemIdentifier);
          if (!v115)
          {
            sub_25A87F0A0(v22);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            a1 = v145;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return a1;
          }
LABEL_162:
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
LABEL_24:
        uint64_t v142 = (v25 - 1) & v25;
      }
    }
    char v117 = v154;
    sub_25A87EF80(v145, v146, v147, v148, v149, v150, v151, v152, v153);
  }
  sub_25A869ECC();
  swift_allocError();
  *(_OWORD *)uint64_t v12 = xmmword_25A8AA610;
  *(unsigned char *)(v12 + 16) = 1;
  swift_willThrow();
  return a1;
}

uint64_t sub_25A897044(uint64_t a1, uint64_t a2, int a3)
{
  LODWORD(v4) = a3;
  sub_25A86AFB8(a1, (uint64_t)v95);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A390);
  if (!swift_dynamicCast()) {
    goto LABEL_6;
  }
  unint64_t v7 = (unint64_t)v86;
  uint64_t v6 = v87;
  uint64_t isUniquelyReferenced_nonNull_native = v89;
  if (v94 >> 61 != 2)
  {
    sub_25A87EF80((uint64_t)v86, v87, (uint64_t)v88, v89, v90, v91, v92, v93, v94);
LABEL_6:
    sub_25A869ECC();
    swift_allocError();
    *(_OWORD *)uint64_t v11 = xmmword_25A8AA610;
    *(unsigned char *)(v11 + 16) = 1;
    return swift_willThrow();
  }
  uint64_t v81 = v88;
  v95[0] = MEMORY[0x263F8EE78];
  id v9 = objc_msgSend(self, sel_predicateWithValue_, 1);
  id v10 = sub_25A8695B8((uint64_t)v9, *(void *)(a2 + 8));
  if (v3)
  {

    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  unint64_t v13 = (unint64_t)v10;
  sub_25A8A8830();
  unint64_t v14 = 0;
  unint64_t v96 = sub_25A88A98C(MEMORY[0x263F8EE78]);
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
    id v76 = (void *)isUniquelyReferenced_nonNull_native;
    id v77 = v14;
    if (!v15)
    {
      uint64_t isUniquelyReferenced_nonNull_native = v96;
      unint64_t v16 = v82;
LABEL_44:
      swift_bridgeObjectRelease();
      sub_25A8A8830();
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
      unint64_t v44 = sub_25A8A5FB4(v16, v81);
      swift_bridgeObjectRelease();
      swift_release();
      swift_retain();
      uint64_t v45 = sub_25A8A590C(v44, (uint64_t (*)(id))v7);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v4 = sub_25A8A5780((uint64_t)v45);
      swift_bridgeObjectRelease();
      sub_25A8A8830();
      unint64_t v14 = 0;
      uint64_t v46 = v75;
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
        uint64_t v60 = (uint64_t *)(*(void *)(v96 + 56) + v57);
        unint64_t v7 = v60[1];
        uint64_t v85 = *v60;
        sub_25A8A8C90();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_25A8A86E0();
        uint64_t v61 = sub_25A8A8CB0();
        uint64_t v4 = -1 << *(unsigned char *)(v56 + 32);
        unint64_t v62 = v61 & ~v4;
        uint64_t v63 = v56 + 56;
        if (((*(void *)(v56 + 56 + ((v62 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v62) & 1) == 0) {
          goto LABEL_50;
        }
        uint64_t v64 = *(void *)(v56 + 48);
        unint64_t v65 = (void *)(v64 + 16 * v62);
        BOOL v66 = *v65 == v59 && v65[1] == a2;
        if (!v66 && (sub_25A8A8C00() & 1) == 0) {
          break;
        }
LABEL_75:
        sub_25A8930BC(v85, v7, v84);
        swift_bridgeObjectRelease();
        int64_t v67 = (void *)sub_25A8A8810();
        id v68 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v67, 0);

        sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
        unint64_t v69 = (void *)sub_25A8A8960();
        id v70 = objc_allocWithZone(MEMORY[0x263F2A1D8]);
        uint64_t v4 = sub_25A8A86A0();
        swift_bridgeObjectRelease();
        objc_msgSend(v70, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v4, v73, v68, v69);

        MEMORY[0x261147A90]();
        if (*(void *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v95[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25A8A87D0();
        }
        sub_25A8A87F0();
        sub_25A8A87C0();
LABEL_51:
        id v9 = v76;
        unint64_t v14 = 0;
        uint64_t v50 = v74;
        uint64_t v46 = v75;
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
        if (v72 || (sub_25A8A8C00() & 1) != 0) {
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
    id v18 = (v82 & 0xC000000000000001) != 0 ? (id)MEMORY[0x261147DD0](a2 - 4, v16) : *(id *)(v16 + 8 * a2);
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
    uint64_t v15 = sub_25A8A8B70();
    swift_bridgeObjectRelease();
  }
  unint64_t v96 = a2 - 3;
  unint64_t v14 = (uint64_t *)v6;
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
  unint64_t v14 = (uint64_t *)&selRef_setHasFeatureName_;
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
    uint64_t v28 = sub_25A8A86B0();
    uint64_t v30 = v29;

    uint64_t v83 = ((uint64_t (*)(uint64_t))v7)(v4);
    if (!v31) {
      goto LABEL_94;
    }
    id v9 = v31;
    unint64_t v14 = (uint64_t *)isUniquelyReferenced_nonNull_native;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v86 = v14;
    unint64_t v7 = sub_25A88B6D8(v28, v30);
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
        unint64_t v14 = (uint64_t *)&v86;
        sub_25A8A09EC();
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v86;
        if ((v6 & 1) == 0) {
          goto LABEL_35;
        }
      }
    }
    else
    {
      sub_25A89F518(v35, isUniquelyReferenced_nonNull_native);
      unint64_t v14 = v86;
      unint64_t v36 = sub_25A88B6D8(v28, v30);
      if ((v6 & 1) != (v37 & 1)) {
        goto LABEL_95;
      }
      unint64_t v7 = v36;
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v86;
      if ((v6 & 1) == 0)
      {
LABEL_35:
        *(void *)(isUniquelyReferenced_nonNull_native + 8 * (v7 >> 6) + 64) |= 1 << v7;
        char v38 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v7);
        *char v38 = v28;
        v38[1] = v30;
        unint64_t v39 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 16 * v7);
        *unint64_t v39 = v83;
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
  uint64_t result = sub_25A8A8C40();
  __break(1u);
  return result;
}

uint64_t sub_25A8979DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25A86AFB8(a1, (uint64_t)v139);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A390);
  if (!swift_dynamicCast()) {
    goto LABEL_6;
  }
  unint64_t v6 = v131;
  unint64_t v8 = v132;
  unint64_t v7 = v133;
  if (v138 >> 61 != 4)
  {
    sub_25A87EF80(v129, v131, v132, v133, v134, v135, v136, v137, v138);
LABEL_6:
    sub_25A869ECC();
    swift_allocError();
    *(_OWORD *)uint64_t v11 = xmmword_25A8AA610;
    *(unsigned char *)(v11 + 16) = 1;
    swift_willThrow();
    return a3;
  }
  uint64_t v116 = (uint64_t (*)(void *))v129;
  unsigned int v113 = a3;
  v139[0] = MEMORY[0x263F8EE78];
  uint64_t v9 = (uint64_t)objc_msgSend(self, sel_predicateWithValue_, 1);
  a3 = *(void *)(a2 + 24);
  id v10 = sub_25A8695B8(v9, *(void *)(a2 + 8));
  if (v3)
  {

    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return a3;
  }
  unint64_t v12 = (unint64_t)v10;
  uint64_t v112 = a2;
  sub_25A8A8830();
  unint64_t v125 = sub_25A88ABCC(MEMORY[0x263F8EE78]);
  uint64_t v119 = 0;
  if (v12 >> 62) {
    goto LABEL_132;
  }
  uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_11:
  unint64_t v117 = v6;
  unint64_t v118 = v7;
  uint64_t v111 = (void *)v9;
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
        id v16 = (id)MEMORY[0x261147DD0](v15, v12);
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
        uint64_t v26 = sub_25A8A86B0();
        uint64_t v28 = v27;

        uint64_t v29 = sub_25A8699EC();
        uint64_t v31 = v30;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v33 = v31;
        unint64_t v12 = v120;
        uint64_t v34 = v26;
        unint64_t v7 = v118;
        sub_25A8A18E4(v122, v21, v29, v33, v34, v28, isUniquelyReferenced_nonNull_native);

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
  sub_25A8A8830();
  uint64_t v35 = v119;
  id v109 = (uint64_t (*)(id))v8;
  unint64_t v8 = sub_25A88AD0C(MEMORY[0x263F8EE78]);
  if (v14)
  {
    char v106 = 0;
    id v107 = 0;
    unint64_t v108 = v12 & 0xC000000000000001;
    uint64_t v9 = 4;
    uint64_t v119 = 0;
    while (1)
    {
      if (v108) {
        id v36 = (id)MEMORY[0x261147DD0](v9 - 4, v12);
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
        uint64_t v14 = sub_25A8A8B70();
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
      uint64_t v39 = sub_25A8699EC();
      uint64_t v41 = v40;
      sub_25A87F0A0((uint64_t)v107);
      unint64_t v7 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v6 = sub_25A88B6D8(v39, v41);
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
          sub_25A8A0D58(&qword_26A46A128);
        }
      }
      else
      {
        sub_25A89FB4C(v45, v7, &qword_26A46A128);
        unint64_t v47 = sub_25A88B6D8(v39, v41);
        if ((v46 & 1) != (v48 & 1)) {
          goto LABEL_135;
        }
        unint64_t v6 = v47;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if ((v46 & 1) == 0)
      {
        unint64_t v49 = sub_25A88AE28(MEMORY[0x263F8EE78]);
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
      sub_25A87F0A0((uint64_t)v106);
      char v54 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v130 = *(void *)(v7 + 8 * v6);
      uint64_t v55 = v130;
      *(void *)(v7 + 8 * v6) = 0x8000000000000000;
      unint64_t v57 = sub_25A88B6D8(v123, v127);
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
          sub_25A8A0BA8();
          uint64_t v55 = v130;
        }
      }
      else
      {
        sub_25A89F840(v60, v54);
        uint64_t v55 = v130;
        unint64_t v62 = sub_25A88B6D8(v123, v127);
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
      char v106 = sub_25A898784;
      id v107 = sub_25A898754;
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
  char v106 = 0;
  id v107 = 0;
LABEL_63:
  swift_bridgeObjectRelease();
  sub_25A8A8830();
  uint64_t v116 = (uint64_t (*)(void *))(v125 + 64);
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
      id v77 = (uint64_t *)(*(void *)(v125 + 48) + 16 * v74);
      uint64_t v79 = *v77;
      uint64_t v78 = v77[1];
      uint64_t v80 = (uint64_t *)(*(void *)(v125 + 56) + 32 * v74);
      uint64_t v81 = v80[1];
      uint64_t v110 = *v80;
      uint64_t v82 = v80[3];
      uint64_t v124 = v80[2];
      sub_25A8A8C90();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_25A8A86E0();
      uint64_t v83 = sub_25A8A8CB0();
      uint64_t v84 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v85 = v83 & ~v84;
      unint64_t v12 = v7 + 56;
      if (((*(void *)(v7 + 56 + ((v85 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v85) & 1) == 0) {
        goto LABEL_67;
      }
      uint64_t v86 = *(void *)(v7 + 48);
      uint64_t v87 = (void *)(v86 + 16 * v85);
      BOOL v88 = *v87 == v79 && v87[1] == v78;
      if (v88 || (sub_25A8A8C00() & 1) != 0)
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
        id v97 = (void *)(v86 + 16 * v7);
        BOOL v98 = *v97 == v79 && v97[1] == v78;
        uint64_t v89 = v81;
        if (v98)
        {
          unint64_t v6 = v140;
          goto LABEL_89;
        }
        uint64_t v99 = v96;
        uint64_t v9 = v128;
        if (sub_25A8A8C00())
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
            unint64_t v100 = (void *)(v86 + 16 * v7);
            if (*v100 == v79 && v100[1] == v78) {
              break;
            }
            if (sub_25A8A8C00()) {
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
        unint64_t v90 = sub_25A88B6D8(v124, v82);
        if (v91)
        {
          uint64_t v92 = *(void *)(*(void *)(v115 + 56) + 8 * v90);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v93 = sub_25A89878C(v92);
          uint64_t v95 = v94;
          swift_bridgeObjectRelease();
          if (!v95 || (swift_bridgeObjectRelease(), v110 == v93) && v95 == v89)
          {
LABEL_95:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_118;
          }
          sub_25A8A8C00();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
LABEL_118:
        uint64_t v102 = (void *)sub_25A8A8810();
        id v103 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v102, 0);

        sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
        unint64_t v12 = sub_25A8A8960();
        id v104 = objc_allocWithZone(MEMORY[0x263F2A1D8]);
        id v105 = (void *)sub_25A8A86A0();
        swift_bridgeObjectRelease();
        unint64_t v7 = (unint64_t)objc_msgSend(v104, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 1, v105, v113, v103, v12);

        MEMORY[0x261147A90]();
        if (*(void *)((v139[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v139[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25A8A87D0();
        }
        sub_25A8A87F0();
        sub_25A8A87C0();
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
    sub_25A87F0A0((uint64_t)v107);
    sub_25A87F0A0((uint64_t)v106);
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
  uint64_t result = sub_25A8A8C40();
  __break(1u);
  return result;
}

unint64_t sub_25A898754@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25A88AE28(MEMORY[0x263F8EE78]);
  *a1 = result;
  return result;
}

void sub_25A898784(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_25A89878C(uint64_t a1)
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

void sub_25A898A2C(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
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
        sub_25A8A8830();
        if (v5)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A090);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25A8A9F70;
        *(void *)(inited + 32) = v20;
        *(void *)(inited + 40) = v21;
        uint64_t v23 = *(void **)(a2 + 24);
        swift_bridgeObjectRetain();
        unint64_t v24 = sub_25A882E94(inited, 0, 0, 0, 0, 0, 1, 1, v23);
        swift_setDeallocating();
        swift_arrayDestroy();
        if (v24 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v15 = sub_25A8A8B70();
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
          id v25 = (id)MEMORY[0x261147DD0](0, v24);
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
        uint64_t v27 = (void *)sub_25A8A8810();
        id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, 0, 0, v27, 0);

        sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
        id v29 = v28;
        uint64_t v30 = (void *)sub_25A8A8960();
        id v31 = objc_allocWithZone(MEMORY[0x263F2A1D8]);
        uint64_t v32 = (void *)sub_25A8A86A0();
        swift_bridgeObjectRelease();
        objc_msgSend(v31, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v32, a4, v29, v30);

        uint64_t v33 = swift_beginAccess();
        MEMORY[0x261147A90](v33);
        if (*(void *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25A8A87D0();
        }
        sub_25A8A87F0();
        sub_25A8A87C0();
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

uint64_t sub_25A898EC4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  sub_25A86AFB8(a1, (uint64_t)&v120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A390);
  if (!swift_dynamicCast()) {
    goto LABEL_6;
  }
  uint64_t v7 = v124;
  uint64_t v8 = (void *)v125;
  if (v129 >> 61 != 1)
  {
    sub_25A87EF80(v124, *((uint64_t *)&v124 + 1), v125, *((uint64_t *)&v125 + 1), (void *)v126, *((uint64_t *)&v126 + 1), v127, v128, v129);
LABEL_6:
    sub_25A869ECC();
    swift_allocError();
    *(_OWORD *)uint64_t v24 = xmmword_25A8AA610;
    *(unsigned char *)(v24 + 16) = 1;
    swift_willThrow();
    return v4;
  }
  int v102 = a3;
  uint64_t v130 = v3;
  uint64_t v9 = *(void *)(a2 + 384);
  uint64_t v110 = v127;
  uint64_t v111 = *((void *)&v124 + 1);
  uint64_t v10 = v128;
  long long v109 = v126;
  unint64_t v107 = v129;
  uint64_t v108 = *((void *)&v125 + 1);
  uint64_t v112 = sub_25A86AE00(0, &qword_26A46A018);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A46A170);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_25A8A9F80;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A400);
  *(void *)(v11 + 56) = v12;
  uint64_t v13 = sub_25A8A638C(&qword_26A46A408, &qword_26A46A400);
  *(void *)(v11 + 32) = v9;
  *(void *)(v11 + 96) = v12;
  *(void *)(v11 + 104) = v13;
  uint64_t v14 = v7;
  uint64_t v15 = v10;
  *(void *)(v11 + 64) = v13;
  *(void *)(v11 + 72) = v9;
  swift_bridgeObjectRetain_n();
  uint64_t v4 = v112;
  uint64_t v16 = (void *)sub_25A8A88C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_25A8AA400;
  *(void *)(v17 + 32) = v8;
  *(void *)(v17 + 40) = v16;
  *(void *)&long long v124 = v17;
  sub_25A8A87C0();
  uint64_t v104 = v15;
  sub_25A887D44(v14, v111, v8, v108, (void *)v109, *((uint64_t *)&v109 + 1), v110, v15, v107);
  id v18 = v16;
  int64_t v19 = (void *)sub_25A8A8790();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v19);

  uint64_t v21 = v20;
  uint64_t v22 = v130;
  id v23 = sub_25A8695B8((uint64_t)v20, *(void *)(a2 + 8));
  if (v22)
  {

    sub_25A87EF80(v14, v111, (uint64_t)v8, v108, (void *)v109, *((uint64_t *)&v109 + 1), v110, v104, v107);
    return v4;
  }
  uint64_t v25 = (uint64_t)v23;
  uint64_t v100 = (uint64_t)v8;
  uint64_t v101 = v14;
  sub_25A8A8830();
  char v106 = v21;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_25A8A66A8(MEMORY[0x263F8EE80], v9, v25, v14, v111 & 1, v102);
  int64_t v28 = 0;
  swift_bridgeObjectRelease();
  id v105 = v18;
  swift_bridgeObjectRelease();
  uint64_t v113 = v27 + 64;
  uint64_t v29 = 1 << *(unsigned char *)(v27 + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v31 = v30 & *(void *)(v27 + 64);
  int64_t v32 = (unint64_t)(v29 + 63) >> 6;
  uint64_t v130 = v27;
  swift_bridgeObjectRetain();
  double v33 = 0.0;
  while (1)
  {
    if (v31)
    {
      unint64_t v34 = __clz(__rbit64(v31));
      v31 &= v31 - 1;
      unint64_t v35 = v34 | (v28 << 6);
      uint64_t v36 = v130;
      goto LABEL_13;
    }
    int64_t v44 = v28 + 1;
    uint64_t v36 = v130;
    if (__OFADD__(v28, 1))
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
    if (v44 >= v32) {
      goto LABEL_33;
    }
    unint64_t v45 = *(void *)(v113 + 8 * v44);
    ++v28;
    if (!v45)
    {
      int64_t v28 = v44 + 1;
      if (v44 + 1 >= v32) {
        goto LABEL_33;
      }
      unint64_t v45 = *(void *)(v113 + 8 * v28);
      if (!v45)
      {
        int64_t v28 = v44 + 2;
        if (v44 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v45 = *(void *)(v113 + 8 * v28);
        if (!v45)
        {
          int64_t v28 = v44 + 3;
          if (v44 + 3 >= v32) {
            goto LABEL_33;
          }
          unint64_t v45 = *(void *)(v113 + 8 * v28);
          if (!v45)
          {
            int64_t v28 = v44 + 4;
            if (v44 + 4 >= v32) {
              goto LABEL_33;
            }
            unint64_t v45 = *(void *)(v113 + 8 * v28);
            if (!v45) {
              break;
            }
          }
        }
      }
    }
LABEL_32:
    unint64_t v31 = (v45 - 1) & v45;
    unint64_t v35 = __clz(__rbit64(v45)) + (v28 << 6);
LABEL_13:
    uint64_t v37 = *(void *)(v36 + 56);
    uint64_t v38 = (uint64_t *)(*(void *)(v36 + 48) + 16 * v35);
    uint64_t v40 = *v38;
    uint64_t v39 = v38[1];
    sub_25A86AFB8(v37 + 40 * v35, (uint64_t)&v125);
    *(void *)&long long v124 = v40;
    *((void *)&v124 + 1) = v39;
    long long v120 = v124;
    long long v121 = v125;
    long long v122 = v126;
    uint64_t v123 = v127;
    long long v118 = v124;
    sub_25A86AFB8((uint64_t)&v121, (uint64_t)v119);
    sub_25A88CB84(v119, (uint64_t)&v115);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A410);
    sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
    swift_dynamicCast();
    uint64_t v41 = v117;
    sub_25A8A8840();
    double v43 = v42;

    double v33 = v33 + v43;
    sub_25A88593C((uint64_t)&v120, &qword_26A46A418);
  }
  int64_t v46 = v44 + 5;
  if (v46 >= v32) {
    goto LABEL_33;
  }
  unint64_t v45 = *(void *)(v113 + 8 * v46);
  if (v45)
  {
    int64_t v28 = v46;
    goto LABEL_32;
  }
  while (1)
  {
    int64_t v28 = v46 + 1;
    if (__OFADD__(v46, 1)) {
      goto LABEL_105;
    }
    if (v28 >= v32) {
      break;
    }
    unint64_t v45 = *(void *)(v113 + 8 * v28);
    ++v46;
    if (v45) {
      goto LABEL_32;
    }
  }
LABEL_33:
  swift_release();
  uint64_t v47 = 1 << *(unsigned char *)(v36 + 32);
  uint64_t v48 = -1;
  if (v47 < 64) {
    uint64_t v48 = ~(-1 << v47);
  }
  unint64_t v49 = v48 & *(void *)(v36 + 64);
  int64_t v103 = (unint64_t)(v47 + 63) >> 6;
  if (v33 != 0.0)
  {
    swift_bridgeObjectRetain();
    int64_t v73 = 0;
    uint64_t v51 = (void *)MEMORY[0x263F8EE80];
    while (1)
    {
      if (v49)
      {
        unint64_t v74 = __clz(__rbit64(v49));
        v49 &= v49 - 1;
        int64_t v75 = v73;
        unint64_t v76 = v74 | (v73 << 6);
      }
      else
      {
        int64_t v77 = v73 + 1;
        if (__OFADD__(v73, 1)) {
          goto LABEL_103;
        }
        if (v77 >= v103) {
          goto LABEL_96;
        }
        unint64_t v78 = *(void *)(v113 + 8 * v77);
        int64_t v79 = v73 + 1;
        if (!v78)
        {
          int64_t v79 = v73 + 2;
          if (v73 + 2 >= v103) {
            goto LABEL_96;
          }
          unint64_t v78 = *(void *)(v113 + 8 * v79);
          if (!v78)
          {
            int64_t v79 = v73 + 3;
            if (v73 + 3 >= v103) {
              goto LABEL_96;
            }
            unint64_t v78 = *(void *)(v113 + 8 * v79);
            if (!v78)
            {
              int64_t v79 = v73 + 4;
              if (v73 + 4 >= v103) {
                goto LABEL_96;
              }
              unint64_t v78 = *(void *)(v113 + 8 * v79);
              if (!v78)
              {
                uint64_t v80 = v73 + 5;
                if (v73 + 5 >= v103) {
                  goto LABEL_96;
                }
                unint64_t v78 = *(void *)(v113 + 8 * v80);
                if (!v78)
                {
                  while (1)
                  {
                    int64_t v79 = v80 + 1;
                    if (__OFADD__(v80, 1)) {
                      goto LABEL_106;
                    }
                    if (v79 >= v103) {
                      break;
                    }
                    unint64_t v78 = *(void *)(v113 + 8 * v79);
                    ++v80;
                    if (v78) {
                      goto LABEL_86;
                    }
                  }
LABEL_96:
                  swift_release();
                  swift_bridgeObjectRelease();
                  uint64_t v99 = sub_25A8A8830();
                  MEMORY[0x270FA5388](v99);
                  uint64_t v4 = sub_25A8A5C04((uint64_t)v51, (void (*)(uint64_t, uint64_t, double))sub_25A8A68BC);

                  sub_25A87EF80(v101, v111, v100, v108, (void *)v109, *((uint64_t *)&v109 + 1), v110, v104, v107);
                  swift_bridgeObjectRelease();
                  return v4;
                }
                int64_t v79 = v73 + 5;
              }
            }
          }
        }
LABEL_86:
        unint64_t v49 = (v78 - 1) & v78;
        int64_t v75 = v79;
        unint64_t v76 = __clz(__rbit64(v78)) + (v79 << 6);
      }
      uint64_t v81 = (uint64_t *)(*(void *)(v36 + 48) + 16 * v76);
      uint64_t v82 = *v81;
      uint64_t v83 = v81[1];
      sub_25A86AFB8(*(void *)(v36 + 56) + 40 * v76, (uint64_t)&v125);
      *(void *)&long long v124 = v82;
      *((void *)&v124 + 1) = v83;
      long long v120 = v124;
      long long v121 = v125;
      long long v122 = v126;
      uint64_t v123 = v127;
      long long v84 = v124;
      long long v118 = v124;
      sub_25A86AFB8((uint64_t)&v121, (uint64_t)v119);
      long long v115 = v84;
      sub_25A86AFB8((uint64_t)&v121, (uint64_t)v116);
      sub_25A88CB84(v116, (uint64_t)&v117);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A410);
      sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
      swift_dynamicCast();
      sub_25A8A8840();
      double v86 = v85;

      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v115 = v51;
      unint64_t v89 = sub_25A88B6D8(v84, *((uint64_t *)&v84 + 1));
      uint64_t v90 = v51[2];
      BOOL v91 = (v88 & 1) == 0;
      uint64_t v92 = v90 + v91;
      if (__OFADD__(v90, v91)) {
        goto LABEL_99;
      }
      char v93 = v88;
      if (v51[3] >= v92)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_25A8A12CC();
        }
      }
      else
      {
        sub_25A8A04B4(v92, isUniquelyReferenced_nonNull_native);
        unint64_t v94 = sub_25A88B6D8(v84, *((uint64_t *)&v84 + 1));
        if ((v93 & 1) != (v95 & 1)) {
          goto LABEL_107;
        }
        unint64_t v89 = v94;
      }
      uint64_t v36 = v130;
      uint64_t v51 = (void *)v115;
      double v96 = v86 / v33;
      if (v93)
      {
        *(double *)(*(void *)(v115 + 56) + 8 * v89) = v96;
      }
      else
      {
        *(void *)(v115 + 8 * (v89 >> 6) + 64) |= 1 << v89;
        *(_OWORD *)(v51[6] + 16 * v89) = v84;
        *(double *)(v51[7] + 8 * v89) = v96;
        uint64_t v97 = v51[2];
        BOOL v71 = __OFADD__(v97, 1);
        uint64_t v98 = v97 + 1;
        if (v71) {
          goto LABEL_102;
        }
        v51[2] = v98;
        swift_bridgeObjectRetain();
      }
      id v18 = v105;
      uint64_t v21 = v106;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v119);
      sub_25A88593C((uint64_t)&v120, &qword_26A46A418);
      int64_t v73 = v75;
    }
  }
  swift_bridgeObjectRetain();
  int64_t v50 = 0;
  uint64_t v51 = (void *)MEMORY[0x263F8EE80];
  while (2)
  {
    if (v49)
    {
      unint64_t v52 = __clz(__rbit64(v49));
      v49 &= v49 - 1;
      unint64_t v53 = v52 | (v50 << 6);
LABEL_57:
      unint64_t v57 = (uint64_t *)(*(void *)(v36 + 48) + 16 * v53);
      uint64_t v58 = *v57;
      uint64_t v59 = v57[1];
      sub_25A86AFB8(*(void *)(v36 + 56) + 40 * v53, (uint64_t)&v125);
      *(void *)&long long v124 = v58;
      *((void *)&v124 + 1) = v59;
      long long v120 = v124;
      long long v121 = v125;
      long long v122 = v126;
      uint64_t v123 = v127;
      long long v60 = v124;
      long long v118 = v124;
      sub_25A86AFB8((uint64_t)&v121, (uint64_t)v119);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v61 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v115 = v51;
      unint64_t v63 = sub_25A88B6D8(v60, *((uint64_t *)&v60 + 1));
      uint64_t v64 = v51[2];
      BOOL v65 = (v62 & 1) == 0;
      uint64_t v66 = v64 + v65;
      if (__OFADD__(v64, v65))
      {
        __break(1u);
        goto LABEL_98;
      }
      char v67 = v62;
      if (v51[3] >= v66)
      {
        if ((v61 & 1) == 0) {
          sub_25A8A12CC();
        }
      }
      else
      {
        sub_25A8A04B4(v66, v61);
        unint64_t v68 = sub_25A88B6D8(v60, *((uint64_t *)&v60 + 1));
        if ((v67 & 1) != (v69 & 1)) {
          goto LABEL_107;
        }
        unint64_t v63 = v68;
      }
      id v18 = v105;
      uint64_t v51 = (void *)v115;
      if (v67)
      {
        *(void *)(*(void *)(v115 + 56) + 8 * v63) = 0;
      }
      else
      {
        *(void *)(v115 + 8 * (v63 >> 6) + 64) |= 1 << v63;
        *(_OWORD *)(v51[6] + 16 * v63) = v60;
        *(void *)(v51[7] + 8 * v63) = 0;
        uint64_t v70 = v51[2];
        BOOL v71 = __OFADD__(v70, 1);
        uint64_t v72 = v70 + 1;
        if (v71) {
          goto LABEL_100;
        }
        v51[2] = v72;
        swift_bridgeObjectRetain();
      }
      uint64_t v21 = v106;
      uint64_t v36 = v130;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v119);
      sub_25A88593C((uint64_t)&v120, &qword_26A46A418);
      continue;
    }
    break;
  }
  int64_t v54 = v50 + 1;
  if (__OFADD__(v50, 1)) {
    goto LABEL_101;
  }
  if (v54 >= v103) {
    goto LABEL_96;
  }
  unint64_t v55 = *(void *)(v113 + 8 * v54);
  ++v50;
  if (v55) {
    goto LABEL_56;
  }
  int64_t v50 = v54 + 1;
  if (v54 + 1 >= v103) {
    goto LABEL_96;
  }
  unint64_t v55 = *(void *)(v113 + 8 * v50);
  if (v55) {
    goto LABEL_56;
  }
  int64_t v50 = v54 + 2;
  if (v54 + 2 >= v103) {
    goto LABEL_96;
  }
  unint64_t v55 = *(void *)(v113 + 8 * v50);
  if (v55) {
    goto LABEL_56;
  }
  int64_t v50 = v54 + 3;
  if (v54 + 3 >= v103) {
    goto LABEL_96;
  }
  unint64_t v55 = *(void *)(v113 + 8 * v50);
  if (v55)
  {
LABEL_56:
    unint64_t v49 = (v55 - 1) & v55;
    unint64_t v53 = __clz(__rbit64(v55)) + (v50 << 6);
    goto LABEL_57;
  }
  int64_t v56 = v54 + 4;
  if (v56 >= v103) {
    goto LABEL_96;
  }
  unint64_t v55 = *(void *)(v113 + 8 * v56);
  if (v55)
  {
    int64_t v50 = v56;
    goto LABEL_56;
  }
  while (1)
  {
    int64_t v50 = v56 + 1;
    if (__OFADD__(v56, 1)) {
      break;
    }
    if (v50 >= v103) {
      goto LABEL_96;
    }
    unint64_t v55 = *(void *)(v113 + 8 * v50);
    ++v56;
    if (v55) {
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
  uint64_t result = sub_25A8A8C40();
  __break(1u);
  return result;
}

void sub_25A899C60(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  sub_25A8A8830();
  if (!v6)
  {
    int v46 = a6;
    swift_bridgeObjectRetain();
    unint64_t v11 = swift_bridgeObjectRetain();
    unint64_t v12 = sub_25A8A6140(v11, v9, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a5)
    {
      if (v12 >> 62) {
        sub_25A8A8B70();
      }
      uint64_t v13 = (void *)sub_25A8A88B0();
      id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, v13, 0, 0, 0, 0);
    }
    else
    {
      sub_25A893E30(v12);
      uint64_t v13 = (void *)sub_25A8A8850();
      id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v13, 0, 0, 0);
    }
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();

    long long v35 = xmmword_25A8A9F80;
    unsigned int v16 = objc_msgSend(v15, sel_intValue);
    uint64_t v37 = MEMORY[0x263F8E8F8];
    v36[0] = v16;
    objc_msgSend(v15, sel_doubleValue);
    v38[3] = MEMORY[0x263F8D538];
    v38[0] = v17;
    sub_25A869F58((uint64_t)v36, (uint64_t)v34);
    sub_25A869F58((uint64_t)v34, (uint64_t)&v31);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    if (v32)
    {
      sub_25A885CFC(&v31, v33);
      sub_25A885CFC(v33, &v31);
      id v18 = (void *)MEMORY[0x263F8EE78];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v18 = sub_25A89CB58(0, v18[2] + 1, 1, v18);
      }
      unint64_t v20 = v18[2];
      unint64_t v19 = v18[3];
      if (v20 >= v19 >> 1) {
        id v18 = sub_25A89CB58((void *)(v19 > 1), v20 + 1, 1, v18);
      }
      v18[2] = v20 + 1;
      sub_25A885CFC(&v31, &v18[4 * v20 + 4]);
    }
    else
    {
      sub_25A88593C((uint64_t)&v31, &qword_26A46A0E8);
      id v18 = (void *)MEMORY[0x263F8EE78];
    }
    sub_25A869F58((uint64_t)v38, (uint64_t)v34);
    sub_25A869F58((uint64_t)v34, (uint64_t)&v31);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    if (v32)
    {
      sub_25A885CFC(&v31, v33);
      sub_25A885CFC(v33, &v31);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v18 = sub_25A89CB58(0, v18[2] + 1, 1, v18);
      }
      unint64_t v22 = v18[2];
      unint64_t v21 = v18[3];
      if (v22 >= v21 >> 1) {
        id v18 = sub_25A89CB58((void *)(v21 > 1), v22 + 1, 1, v18);
      }
      v18[2] = v22 + 1;
      sub_25A885CFC(&v31, &v18[4 * v22 + 4]);
    }
    else
    {
      sub_25A88593C((uint64_t)&v31, &qword_26A46A0E8);
    }
    swift_arrayDestroy();
    if (v18[2])
    {
      sub_25A869F58((uint64_t)(v18 + 4), (uint64_t)&v39);
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A410);
      if (swift_dynamicCast())
      {
        if (*((void *)&v42 + 1))
        {
          sub_25A88CB84(&v41, (uint64_t)&v44);
          sub_25A86AFB8((uint64_t)&v44, (uint64_t)&v41);
          swift_bridgeObjectRetain();
          sub_25A8931F4((uint64_t)&v41, v9, v10);

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
      sub_25A88593C((uint64_t)&v39, &qword_26A46A0E8);
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v43 = 0;
    }
    sub_25A88593C((uint64_t)&v41, &qword_26A46A428);
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25A8A8630();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A46AF08);
    uint64_t v25 = sub_25A8A8610();
    os_log_type_t v26 = sub_25A8A88F0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 67109120;
      LODWORD(v44) = v23;
      sub_25A8A89A0();
      _os_log_impl(&dword_25A85D000, v25, v26, "Both double and int values are null in computation of %d", v27, 8u);
      MEMORY[0x261148660](v27, -1, -1);
    }

    uint64_t v44 = 0;
    unint64_t v45 = 0xE000000000000000;
    sub_25A8A8A90();
    sub_25A8A86F0();
    LODWORD(v41) = v23;
    type metadata accessor for BMMLSEDurableFeatureStorefeatureName(0);
    sub_25A8A8B40();
    uint64_t v28 = v44;
    unint64_t v29 = v45;
    sub_25A869ECC();
    swift_allocError();
    *(void *)uint64_t v30 = v28;
    *(void *)(v30 + 8) = v29;
    *(unsigned char *)(v30 + 16) = 1;
    swift_willThrow();
  }
}

id sub_25A89A214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)sub_25A8A8850();
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v4, 0, 0, 0);

  sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
  uint64_t v6 = (void *)sub_25A8A8960();
  id v7 = objc_allocWithZone(MEMORY[0x263F2A1D8]);
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)sub_25A8A86A0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v8, a3, v5, v6);

  return v9;
}

uint64_t sub_25A89A318(uint64_t a1)
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
  aBlock[2] = sub_25A88CF0C;
  aBlock[3] = &block_descriptor_0;
  id v7 = _Block_copy(aBlock);
  sub_25A8A5F0C(a1, (uint64_t)aBlock);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v3;
  memcpy(v8 + 3, aBlock, 0x190uLL);
  v8[53] = v2;
  v13[4] = sub_25A8A6A04;
  v13[5] = v8;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  id v13[2] = sub_25A88E758;
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

void sub_25A89A5B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
      uint64_t v10 = sub_25A8A86B0();
      uint64_t v12 = v11;

      swift_beginAccess();
      uint64_t v13 = *v9;
      swift_bridgeObjectRetain();
      char v14 = sub_25A8930BC(v10, v12, v13);
      swift_bridgeObjectRelease();
      sub_25A8A5F0C(a3, (uint64_t)v33);
      if (v14)
      {
        sub_25A8A5F44((uint64_t)v33);
      }
      else
      {
        char v18 = sub_25A8930BC(v10, v12, v34);
        sub_25A8A5F44((uint64_t)v33);
        if (v18)
        {
          unint64_t v19 = (void *)(a4 + 16);
          swift_bridgeObjectRetain();
          unint64_t v20 = (void *)sub_25A8A8850();
          id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A1E8]), sel_initWithIntValue_doubleValue_stringValue_BOOLValue_histogramValue_, 0, v20, 0, 0, 0);

          sub_25A86AE00(0, (unint64_t *)&qword_26A46A020);
          unint64_t v22 = (void *)sub_25A8A8960();
          id v23 = objc_allocWithZone(MEMORY[0x263F2A1D8]);
          uint64_t v24 = (void *)sub_25A8A86A0();
          swift_bridgeObjectRelease();
          id v25 = objc_msgSend(v23, sel_initWithFeatureEntryType_itemIdentifier_featureName_featureValue_featureVersion_, 2, v24, 480, v21, v22);

          swift_beginAccess();
          sub_25A89DA00(&v32, v10, v12);
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          id v26 = v25;
          MEMORY[0x261147A90]();
          if (*(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_25A8A87D0();
          }
          sub_25A8A87F0();
          sub_25A8A87C0();
          swift_endAccess();

          goto LABEL_15;
        }
      }
      swift_bridgeObjectRelease();
LABEL_15:

      return;
    }
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25A8A8630();
    __swift_project_value_buffer(v27, (uint64_t)qword_26A46AF08);
    uint64_t v28 = sub_25A8A8610();
    os_log_type_t v29 = sub_25A8A88F0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_25A85D000, v28, v29, "Suggest less computation: could not find valid candidate identifier", v30, 2u);
      MEMORY[0x261148660](v30, -1, -1);
    }
  }
  else
  {
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_25A8A8630();
    __swift_project_value_buffer(v15, (uint64_t)qword_26A46AF08);
    long long v31 = sub_25A8A8610();
    os_log_type_t v16 = sub_25A8A88F0();
    if (os_log_type_enabled(v31, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_25A85D000, v31, v16, "Suggest less computation: incorrect feedback in stream", v17, 2u);
      MEMORY[0x261148660](v17, -1, -1);
    }
  }
}

void sub_25A89AA1C(uint64_t a1)
{
  uint64_t v3 = sub_25A8A8570();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  id v26 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)v25 - v7;
  id v9 = objc_msgSend(*(id *)(v1 + 32), sel_pruner);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10(v8, a1, v3);
  unint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v12 + v11, v8, v3);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_25A8A6AA4;
  *(void *)(v13 + 24) = v12;
  aBlock[4] = (uint64_t)sub_25A891440;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_25A8905D4;
  aBlock[3] = (uint64_t)&block_descriptor_25;
  char v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_deleteEventsPassingTest_, v14);

  _Block_release(v14);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v14)
  {
    __break(1u);
  }
  else if (qword_26A469F78 == -1)
  {
    goto LABEL_3;
  }
  swift_once();
LABEL_3:
  uint64_t v15 = sub_25A8A8630();
  __swift_project_value_buffer(v15, (uint64_t)qword_26A46AF08);
  os_log_type_t v16 = v26;
  v10(v26, a1, v3);
  uint64_t v17 = sub_25A8A8610();
  os_log_type_t v18 = sub_25A8A88E0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    v25[1] = v12;
    unint64_t v20 = v16;
    id v21 = (uint8_t *)v19;
    uint64_t v22 = swift_slowAlloc();
    aBlock[0] = v22;
    *(_DWORD *)id v21 = 136315138;
    sub_25A8A6B44((unint64_t *)&qword_26A46A0F0);
    uint64_t v23 = sub_25A8A8BF0();
    uint64_t v27 = sub_25A86BEDC(v23, v24, aBlock);
    sub_25A8A89A0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v20, v3);
    _os_log_impl(&dword_25A85D000, v17, v18, "Successfully deleted features older than %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261148660](v22, -1, -1);
    MEMORY[0x261148660](v21, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v16, v3);
  }
  swift_release();
}

Swift::Void __swiftcall DurableFeatureManager.computeFeaturesAndSendToBiome()()
{
  sub_25A89AE48(*(void *)(v0 + 16));
}

uint64_t sub_25A89AE48(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  MEMORY[0x270FA5388](v4 - 8);
  char v67 = &v62[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_25A8A8570();
  uint64_t v69 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v8 = &v62[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26A469F88 != -1) {
    swift_once();
  }
  id v9 = (void *)qword_26A46A0E0;
  uint64_t v66 = "beginDurableFeatureComputation";
  uint64_t v10 = (void *)sub_25A8A86A0();
  id v11 = objc_msgSend(v9, sel_objectForKey_, v10);

  if (v11)
  {
    sub_25A8A89D0();
    swift_unknownObjectRelease();
    sub_25A88593C((uint64_t)v75, &qword_26A46A0E8);
  }
  else
  {
    memset(v75, 0, sizeof(v75));
    sub_25A88593C((uint64_t)v75, &qword_26A46A0E8);
    LODWORD(v75[0]) = 4;
    BYTE4(v75[0]) = 1;
    NSUserDefaults.saveComputationDate(_:)((int *)v75);
    LODWORD(v75[0]) = 5;
    BYTE4(v75[0]) = 1;
    NSUserDefaults.saveComputationDate(_:)((int *)v75);
  }
  uint64_t v68 = v6;
  unint64_t v74 = (char *)MEMORY[0x263F8EE78];
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    uint64_t v70 = v8;
    BOOL v71 = v2 + 43;
    swift_bridgeObjectRetain();
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *(unsigned int *)(a1 + 4 * v13 + 32);
      LODWORD(v75[0]) = *(_DWORD *)(a1 + 4 * v13 + 32);
      BYTE4(v75[0]) = 0;
      if (NSUserDefaults.shouldCompute(_:)((int *)v75))
      {
        uint64_t v15 = v2[46];
        uint64_t v16 = v2[47];
        __swift_project_boxed_opaque_existential_1(v71, v15);
        if ((*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16))
        {
          swift_bridgeObjectRelease();
          if (qword_26A469F78 != -1) {
            swift_once();
          }
          uint64_t v39 = sub_25A8A8630();
          __swift_project_value_buffer(v39, (uint64_t)qword_26A46AF08);
          uint64_t v36 = sub_25A8A8610();
          os_log_type_t v40 = sub_25A8A88D0();
          if (os_log_type_enabled(v36, v40))
          {
            uint64_t v38 = (uint8_t *)swift_slowAlloc();
            long long v41 = (void *)swift_slowAlloc();
            v73[0] = (uint64_t)v41;
            *(_DWORD *)uint64_t v38 = 136315138;
            swift_beginAccess();
            long long v42 = v74;
            int64_t v43 = *((void *)v74 + 2);
            uint64_t v44 = MEMORY[0x263F8EE78];
            if (v43)
            {
              BOOL v71 = v41;
              uint64_t v72 = MEMORY[0x263F8EE78];
              swift_bridgeObjectRetain();
              sub_25A89CD70(0, v43, 0);
              uint64_t v45 = 0;
              uint64_t v44 = v72;
              unint64_t v46 = *(void *)(v72 + 16);
              do
              {
                int v47 = *(_DWORD *)&v42[4 * v45 + 32];
                uint64_t v72 = v44;
                unint64_t v48 = *(void *)(v44 + 24);
                if (v46 >= v48 >> 1)
                {
                  sub_25A89CD70(v48 > 1, v46 + 1, 1);
                  uint64_t v44 = v72;
                }
                ++v45;
                *(void *)(v44 + 16) = v46 + 1;
                *(_DWORD *)(v44 + 4 * v46++ + 32) = v47;
              }
              while (v43 != v45);
              swift_bridgeObjectRelease();
              long long v41 = v71;
            }
            uint64_t v58 = MEMORY[0x261147AC0](v44, MEMORY[0x263F8E548]);
            unint64_t v60 = v59;
            swift_bridgeObjectRelease();
            uint64_t v72 = sub_25A86BEDC(v58, v60, v73);
            sub_25A8A89A0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25A85D000, v36, v40, "Plugin halted while computing durable features. Completed features: %s", v38, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x261148660](v41, -1, -1);
LABEL_43:
            MEMORY[0x261148660](v38, -1, -1);
          }
          goto LABEL_44;
        }
        uint64_t v17 = (void *)MEMORY[0x2611480E0]();
        sub_25A89C058((uint64_t)v2, v14, &v74);
      }
      if (v12 == ++v13)
      {
        swift_bridgeObjectRelease();
        id v8 = v70;
        break;
      }
    }
  }
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_25A8A8630();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_26A46AF08);
  unint64_t v20 = sub_25A8A8610();
  int v21 = sub_25A8A88D0();
  if (os_log_type_enabled(v20, (os_log_type_t)v21))
  {
    BOOL v71 = v2;
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    v73[0] = v65;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_beginAccess();
    uint64_t v23 = v74;
    int64_t v24 = *((void *)v74 + 2);
    uint64_t v25 = MEMORY[0x263F8EE78];
    if (v24)
    {
      int v63 = v21;
      uint64_t v64 = v19;
      uint64_t v70 = v8;
      uint64_t v72 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_25A89CD70(0, v24, 0);
      uint64_t v26 = 0;
      uint64_t v25 = v72;
      unint64_t v27 = *(void *)(v72 + 16);
      do
      {
        int v28 = *(_DWORD *)&v23[4 * v26 + 32];
        uint64_t v72 = v25;
        unint64_t v29 = *(void *)(v25 + 24);
        if (v27 >= v29 >> 1)
        {
          sub_25A89CD70(v29 > 1, v27 + 1, 1);
          uint64_t v25 = v72;
        }
        ++v26;
        *(void *)(v25 + 16) = v27 + 1;
        *(_DWORD *)(v25 + 4 * v27++ + 32) = v28;
      }
      while (v24 != v26);
      swift_bridgeObjectRelease();
      id v8 = v70;
      LOBYTE(v21) = v63;
    }
    uint64_t v30 = MEMORY[0x261147AC0](v25, MEMORY[0x263F8E548]);
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    uint64_t v72 = sub_25A86BEDC(v30, v32, v73);
    sub_25A8A89A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25A85D000, v20, (os_log_type_t)v21, "Plugin finished sending durable features to Biome. Stored features: %s", v22, 0xCu);
    uint64_t v33 = v65;
    swift_arrayDestroy();
    MEMORY[0x261148660](v33, -1, -1);
    MEMORY[0x261148660](v22, -1, -1);

    uint64_t v2 = v71;
  }
  else
  {
  }
  LODWORD(v73[0]) = 3;
  BYTE4(v73[0]) = 1;
  if (NSUserDefaults.shouldCompute(_:)((int *)v73))
  {
    uint64_t v34 = v2[46];
    uint64_t v35 = v2[47];
    __swift_project_boxed_opaque_existential_1(v2 + 43, v34);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(v34, v35))
    {
      uint64_t v36 = sub_25A8A8610();
      os_log_type_t v37 = sub_25A8A88D0();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v38 = 0;
        _os_log_impl(&dword_25A85D000, v36, v37, "Subtask cancelled before pruning the Durable Feature Store.", v38, 2u);
        goto LABEL_43;
      }
LABEL_44:
    }
    else
    {
      LODWORD(v73[0]) = 4;
      BYTE4(v73[0]) = 1;
      unint64_t v49 = v67;
      sub_25A889A90((int *)v73, (uint64_t)v67);
      uint64_t v51 = v68;
      uint64_t v50 = v69;
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v69 + 56))(v49, 0, 1, v68);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v50 + 48))(v49, 1, v51) == 1)
      {
        sub_25A88593C((uint64_t)v49, &qword_26A46A040);
        sub_25A8A8470();
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v69 + 32))(v8, v49, v51);
      }
      sub_25A89AA1C((uint64_t)v8);
      unint64_t v52 = (void *)qword_26A46A0E0;
      unint64_t v53 = (void *)sub_25A8A86A0();
      objc_msgSend(v52, sel_removeObjectForKey_, v53);

      LODWORD(v73[0]) = 3;
      BYTE4(v73[0]) = 1;
      NSUserDefaults.saveComputationDate(_:)((int *)v73);
      int64_t v54 = sub_25A8A8610();
      os_log_type_t v55 = sub_25A8A88D0();
      if (os_log_type_enabled(v54, v55))
      {
        int64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int64_t v56 = 0;
        _os_log_impl(&dword_25A85D000, v54, v55, "Successfully deleted old durable features", v56, 2u);
        unint64_t v57 = v56;
        uint64_t v51 = v68;
        MEMORY[0x261148660](v57, -1, -1);
      }

      (*(void (**)(unsigned char *, uint64_t))(v69 + 8))(v8, v51);
    }
  }
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
  unint64_t v32 = v4;
  uint64_t v33 = *(void **)(a2 + 32);
  uint64_t v34 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v33;
  *(void *)(a1 + 40) = v34;
  uint64_t v35 = *(void **)(a2 + 48);
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
  unint64_t v29 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
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

ValueMetadata *type metadata accessor for DurableFeatureManager()
{
  return &type metadata for DurableFeatureManager;
}

void sub_25A89C058(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v8 = sub_25A8A8570();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (uint64_t *)((char *)&v49 - v13);
  sub_25A8A8560();
  unint64_t v15 = sub_25A895094(a2);
  if (v3)
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v14, v8);
    if (qword_26A469F78 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_25A8A8630();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A46AF08);
    id v17 = v3;
    id v18 = v3;
    uint64_t v19 = sub_25A8A8610();
    os_log_type_t v20 = sub_25A8A88F0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      id v22 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 67109378;
      LODWORD(v57) = a2;
      sub_25A8A89A0();
      *(_WORD *)(v21 + 8) = 2112;
      id v23 = v3;
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      unint64_t v57 = v24;
      sub_25A8A89A0();
      *id v22 = v24;

      _os_log_impl(&dword_25A85D000, v19, v20, "Failed to compute and send to Biome feature %d. Error: %@", (uint8_t *)v21, 0x12u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A108);
      swift_arrayDestroy();
      MEMORY[0x261148660](v22, -1, -1);
      MEMORY[0x261148660](v21, -1, -1);
    }
    else
    {
    }
    return;
  }
  unint64_t v25 = v15;
  int64_t v54 = v12;
  os_log_type_t v55 = v14;
  int v53 = a2;
  uint64_t v51 = v9;
  uint64_t v52 = v8;
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_25A8A8B70();
    if (!v26) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v26 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v26) {
      goto LABEL_16;
    }
  }
  if (v26 < 1)
  {
    __break(1u);
LABEL_31:
    double v50 = v27;
    swift_once();
    double v27 = v50;
    goto LABEL_22;
  }
  uint64_t v28 = 0;
  unint64_t v29 = *(void **)(a1 + 392);
  do
  {
    if ((v25 & 0xC000000000000001) != 0) {
      id v30 = (id)MEMORY[0x261147DD0](v28, v25);
    }
    else {
      id v30 = *(id *)(v25 + 8 * v28 + 32);
    }
    uint64_t v31 = v30;
    ++v28;
    objc_msgSend(v29, sel_sendEvent_, v30);
  }
  while (v26 != v28);
LABEL_16:
  swift_bridgeObjectRelease_n();
  unint64_t v32 = *a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v32;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v32 = sub_25A89C828(0, *((void *)v32 + 2) + 1, 1, v32);
    *a3 = v32;
  }
  unint64_t v35 = *((void *)v32 + 2);
  unint64_t v34 = *((void *)v32 + 3);
  uint64_t v9 = v51;
  if (v35 >= v34 >> 1) {
    unint64_t v32 = sub_25A89C828((char *)(v34 > 1), v35 + 1, 1, v32);
  }
  *((void *)v32 + 2) = v35 + 1;
  uint64_t v36 = &v32[4 * v35];
  int v37 = v53;
  *((_DWORD *)v36 + 8) = v53;
  *a3 = v32;
  sub_25A8A8560();
  sub_25A8A84D0();
  double v4 = v38;
  uint64_t v26 = 0x26A469000uLL;
  uint64_t v14 = &qword_26A46A000;
  if ((objc_msgSend(self, sel_isInternalDevice) & 1) == 0) {
    goto LABEL_27;
  }
  double v27 = 1000.0;
  if (qword_26A469F78 != -1) {
    goto LABEL_31;
  }
LABEL_22:
  double v39 = v4 * v27;
  uint64_t v40 = sub_25A8A8630();
  __swift_project_value_buffer(v40, (uint64_t)qword_26A46AF08);
  long long v41 = sub_25A8A8610();
  os_log_type_t v42 = sub_25A8A88E0();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 134218240;
    unint64_t v57 = *(void *)&v39;
    sub_25A8A89A0();
    *(_WORD *)(v43 + 12) = 1024;
    LODWORD(v57) = v53;
    sub_25A8A89A0();
    _os_log_impl(&dword_25A85D000, v41, v42, "Computation Time: %f ms for feature %d", (uint8_t *)v43, 0x12u);
    MEMORY[0x261148660](v43, -1, -1);
  }

  if (*(void *)(v26 + 3976) != -1) {
    swift_once();
  }
  uint64_t v44 = (void *)v14[28];
  uint64_t v45 = (void *)sub_25A8A8850();
  unint64_t v57 = 0;
  unint64_t v58 = 0xE000000000000000;
  sub_25A8A8A90();
  swift_bridgeObjectRelease();
  unint64_t v57 = 0xD000000000000010;
  unint64_t v58 = 0x800000025A8B36C0;
  int v37 = v53;
  int v56 = v53;
  sub_25A8A8BF0();
  sub_25A8A86F0();
  swift_bridgeObjectRelease();
  sub_25A8A86F0();
  unint64_t v46 = (void *)sub_25A8A86A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v44, sel_setValue_forKey_, v45, v46);

LABEL_27:
  if (*(void *)(v26 + 3976) != -1) {
    swift_once();
  }
  LODWORD(v57) = v37;
  BYTE4(v57) = 0;
  NSUserDefaults.saveComputationDate(_:)((int *)&v57);
  int v47 = *(void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v48 = v52;
  v47(v54, v52);
  v47((char *)v55, v48);
}

void *sub_25A89C718(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A090);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_25A8A5818(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25A89C828(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A388);
      uint64_t v10 = (char *)swift_allocObject();
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
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
    sub_25A8A5E20(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25A89C938(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A448);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_25A8A63D0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25A89CA48(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A440);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_25A8A64BC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25A89CB58(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A068);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_25A8A65B0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25A89CC68(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
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
      char v5 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A1A0);
      char v5 = (void *)swift_allocObject();
      int64_t v6 = _swift_stdlib_malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      v5[2] = v4;
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
    uint64_t v4 = sub_25A8A8B70();
    swift_bridgeObjectRelease();
    if (!v4) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v5;
}

uint64_t sub_25A89CD70(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A89CE50(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_25A89CD90(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A89CFB0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_25A89CDB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A89D110(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_25A89CDD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A89D280(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_25A89CDF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A89D3EC(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_25A89CE10(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A89D53C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_25A89CE30(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A89D6A8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_25A89CE50(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A438);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A89CFB0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A388);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A89D110(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A068);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A89D280(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A090);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A89D3EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A450);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A89D53C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A440);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A89D6A8(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A3B8);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A0B0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A89D834(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_25A8A8B70();
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
    uint64_t v5 = sub_25A8A8B70();
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
    unint64_t v4 = MEMORY[0x261147DE0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_25A8A4C44(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25A8A8B70();
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

  return sub_25A8A87C0();
}

uint64_t sub_25A89DA00(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25A8A8C90();
  swift_bridgeObjectRetain();
  sub_25A8A86E0();
  uint64_t v8 = sub_25A8A8CB0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25A8A8C00() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_25A8A8C00() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25A89E64C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25A89DBB0(void *a1, void *a2)
{
  uint64_t v3 = v2;
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
    uint64_t v9 = sub_25A8A8A30();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_25A86AE00(0, &qword_26A469FA0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_25A8A8A20();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_25A89DE50(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_25A89E328();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_25A89E5C8((uint64_t)v8, v22);
    uint64_t *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25A8A8970();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_25A86AE00(0, &qword_26A469FA0);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_25A8A8980();

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
        char v18 = sub_25A8A8980();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_25A89E7E8((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_25A89DE50(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A050);
    uint64_t v2 = sub_25A8A8A70();
    uint64_t v14 = v2;
    sub_25A8A8A10();
    if (sub_25A8A8A40())
    {
      sub_25A86AE00(0, &qword_26A469FA0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_25A89E328();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_25A8A8970();
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
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_25A8A8A40());
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

uint64_t sub_25A89E048()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A3B0);
  uint64_t v3 = sub_25A8A8A60();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                  void *v30 = -1 << v29;
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
      sub_25A8A8C90();
      sub_25A8A86E0();
      uint64_t result = sub_25A8A8CB0();
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

uint64_t sub_25A89E328()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A050);
  uint64_t v3 = sub_25A8A8A60();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_25A8A8970();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_25A89E5C8(uint64_t a1, uint64_t a2)
{
  sub_25A8A8970();
  unint64_t result = sub_25A8A8A00();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_25A89E64C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25A89E048();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_25A89E970();
      goto LABEL_22;
    }
    sub_25A89ECD0();
  }
  uint64_t v11 = *v4;
  sub_25A8A8C90();
  sub_25A8A86E0();
  unint64_t result = sub_25A8A8CB0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_25A8A8C00(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_25A8A8C30();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_25A8A8C00();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

void sub_25A89E7E8(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_25A89E328();
  }
  else
  {
    if (v7 > v6)
    {
      sub_25A89EB24();
      goto LABEL_14;
    }
    sub_25A89EF80();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_25A8A8970();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_25A86AE00(0, &qword_26A469FA0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_25A8A8980();

    if (v12)
    {
LABEL_13:
      sub_25A8A8C30();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_25A8A8980();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_25A89E970()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A3B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A8A8A50();
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

id sub_25A89EB24()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A050);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A8A8A50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25A89ECD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A3B0);
  uint64_t v3 = sub_25A8A8A60();
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_25A8A8C90();
    swift_bridgeObjectRetain();
    sub_25A8A86E0();
    uint64_t result = sub_25A8A8CB0();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
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

uint64_t sub_25A89EF80()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A050);
  uint64_t v3 = sub_25A8A8A60();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_25A8A8970();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25A89F1FC(uint64_t a1, char a2)
{
  return sub_25A89FB4C(a1, a2, &qword_26A46A3F8);
}

uint64_t sub_25A89F208(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A138);
  char v38 = a2;
  uint64_t v6 = sub_25A8A8BA0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    int64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_25A8A8C90();
    sub_25A8A86E0();
    uint64_t result = sub_25A8A8CB0();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25A89F518(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A140);
  char v42 = a2;
  uint64_t v6 = sub_25A8A8BA0();
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
  double v39 = v2;
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
    int64_t v24 = (void *)(v5 + 64);
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
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
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
    sub_25A8A8C90();
    sub_25A8A86E0();
    uint64_t result = sub_25A8A8CB0();
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
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25A89F840(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A120);
  char v37 = a2;
  uint64_t v6 = sub_25A8A8BA0();
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
    unint64_t v22 = (void *)(v5 + 64);
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
    BOOL v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_25A8A8C90();
    sub_25A8A86E0();
    uint64_t result = sub_25A8A8CB0();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25A89FB4C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_25A8A8BA0();
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
    sub_25A8A8C90();
    sub_25A8A86E0();
    uint64_t result = sub_25A8A8CB0();
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

uint64_t sub_25A89FE60(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A130);
  char v40 = a2;
  uint64_t v6 = sub_25A8A8BA0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
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
                  *uint64_t v38 = -1 << v36;
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
      sub_25A8A8C90();
      sub_25A8A86E0();
      uint64_t result = sub_25A8A8CB0();
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
      void *v18 = v31;
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

uint64_t sub_25A8A018C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A430);
  char v37 = a2;
  uint64_t v6 = sub_25A8A8BA0();
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
      sub_25A88CB84(v25, (uint64_t)v38);
    }
    else
    {
      sub_25A86AFB8((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_25A8A8C90();
    sub_25A8A86E0();
    uint64_t result = sub_25A8A8CB0();
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
    uint64_t result = sub_25A88CB84(v38, *(void *)(v7 + 56) + 40 * v14);
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

uint64_t sub_25A8A04B4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A420);
  char v37 = a2;
  uint64_t v6 = sub_25A8A8BA0();
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
    sub_25A8A8C90();
    sub_25A8A86E0();
    uint64_t result = sub_25A8A8CB0();
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

uint64_t sub_25A8A07BC(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_25A88CB84(a4, a5[7] + 40 * a1);
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

void *sub_25A8A082C()
{
  return sub_25A8A0D58(&qword_26A46A3F8);
}

id sub_25A8A0838()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A138);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A8A8B90();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void *sub_25A8A09EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A140);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A8A8B90();
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
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    int64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *int64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
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

void *sub_25A8A0BA8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A120);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A8A8B90();
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v22 = v19;
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

void *sub_25A8A0D58(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_25A8A8B90();
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
    uint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *uint64_t v22 = *v18;
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

void *sub_25A8A0F08()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A130);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A8A8B90();
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
    unint64_t v26 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v26 = v19;
    v26[1] = v18;
    int64_t v27 = (void *)(*(void *)(v4 + 56) + v20);
    *int64_t v27 = v22;
    v27[1] = v23;
    uint64_t v27[2] = v24;
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

void *sub_25A8A10E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A430);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A8A8B90();
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
    sub_25A86AFB8(*(void *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_25A88CB84(v26, *(void *)(v4 + 56) + v20);
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

void *sub_25A8A12CC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A420);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A8A8B90();
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

double sub_25A8A147C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_25A88B6D8(a1, a2);
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
      sub_25A8A10E0();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_25A88CB84((long long *)(*(void *)(v11 + 56) + 40 * v8), a3);
    sub_25A8A1588(v8, v11);
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

unint64_t sub_25A8A1588(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_25A8A89F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25A8A8C90();
        swift_bridgeObjectRetain();
        sub_25A8A86E0();
        uint64_t v11 = sub_25A8A8CB0();
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
          unint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          unint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *unint64_t v14 = *v15;
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

void sub_25A8A1774(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25A88B6D8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_25A8A0838();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_25A89F208(v15, a4 & 1);
  unint64_t v20 = sub_25A88B6D8(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_25A8A8C40();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_25A8A18E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  unint64_t v8 = v7;
  uint64_t v15 = *v7;
  unint64_t v17 = sub_25A88B6D8(a5, a6);
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
    sub_25A8A0F08();
LABEL_7:
    uint64_t v23 = (void *)*v8;
    if (v21)
    {
LABEL_8:
      BOOL v24 = (void *)(v23[7] + 32 * v17);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v24 = a1;
      v24[1] = a2;
      v24[2] = a3;
      v24[3] = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_25A89FE60(v20, a7 & 1);
  unint64_t v26 = sub_25A88B6D8(a5, a6);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_17:
    uint64_t result = sub_25A8A8C40();
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
  int64_t v28 = (uint64_t *)(v23[6] + 16 * v17);
  *int64_t v28 = a5;
  v28[1] = a6;
  unint64_t v29 = (void *)(v23[7] + 32 * v17);
  *unint64_t v29 = a1;
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

uint64_t sub_25A8A1A98(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_25A88B6D8(a2, a3);
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
      sub_25A8A10E0();
      goto LABEL_7;
    }
    sub_25A8A018C(v15, a4 & 1);
    unint64_t v21 = sub_25A88B6D8(a2, a3);
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
    uint64_t result = sub_25A8A8C40();
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
    return sub_25A88CB84(a1, v19);
  }
LABEL_13:
  sub_25A8A07BC(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_25A8A1BF0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_25A8A5504();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_25A8A1D18(v6);
  return sub_25A8A8B00();
}

uint64_t sub_25A8A1C6C(uint64_t *a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4, SEL *a5)
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
  sub_25A8A2BB4(v14, a3, a4, a5);
  return sub_25A8A8B00();
}

void sub_25A8A1D18(uint64_t *a1)
{
  unint64_t v5 = sub_25A8A8570();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v176 = (char *)&v150 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v168 = (char *)&v150 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  char v172 = (char *)&v150 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  char v158 = (char *)&v150 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  char v163 = (char *)&v150 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v154 = (char *)&v150 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v156 = (char *)&v150 - v19;
  uint64_t v155 = a1;
  uint64_t v20 = a1[1];
  uint64_t v21 = sub_25A8A8BE0();
  if (v21 >= v20)
  {
    if (v20 < 0) {
      goto LABEL_144;
    }
    if (v20) {
      sub_25A8A354C(0, (char *)v20, (char *)1, v155);
    }
    return;
  }
  if (v20 >= 0) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = v20 + 1;
  }
  if (v20 < -1) {
    goto LABEL_164;
  }
  uint64_t v152 = v21;
  BOOL v161 = (char *)v20;
  uint64_t v166 = v1;
  if (v20 < 2)
  {
    uint64_t v25 = (char *)MEMORY[0x263F8EE78];
    uint64_t v177 = MEMORY[0x263F8EE78];
    unint64_t v164 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v20 != 1)
    {
      unint64_t v29 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_110:
      if (v29 >= 2)
      {
        uint64_t v146 = *v155;
        do
        {
          unint64_t v5 = v29 - 2;
          if (v29 < 2) {
            goto LABEL_139;
          }
          if (!v146) {
            goto LABEL_159;
          }
          int64_t v3 = v25;
          uint64_t v147 = *(void *)&v25[16 * v5 + 32];
          uint64_t v2 = *(char **)&v25[16 * v29 + 24];
          uint64_t v148 = v166;
          sub_25A8A3ABC((char *)(v146 + 8 * v147), (void **)(v146 + 8 * *(void *)&v25[16 * v29 + 16]), (void **)(v146 + 8 * (void)v2), v164);
          uint64_t v166 = v148;
          if (v148) {
            break;
          }
          if ((uint64_t)v2 < v147) {
            goto LABEL_140;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v3 = sub_25A8A48EC((uint64_t)v3);
          }
          if (v5 >= *((void *)v3 + 2)) {
            goto LABEL_141;
          }
          v149 = &v3[16 * v5 + 32];
          *(void *)v149 = v147;
          *((void *)v149 + 1) = v2;
          unint64_t v5 = *((void *)v3 + 2);
          if (v29 > v5) {
            goto LABEL_142;
          }
          memmove(&v3[16 * v29 + 16], &v3[16 * v29 + 32], 16 * (v5 - v29));
          uint64_t v25 = v3;
          *((void *)v3 + 2) = v5 - 1;
          unint64_t v29 = v5 - 1;
        }
        while (v5 > 2);
      }
LABEL_121:
      swift_bridgeObjectRelease();
      *(void *)((v177 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_25A8A87C0();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v23 = v22 >> 1;
    sub_25A86AE00(0, &qword_26A469FA0);
    uint64_t v24 = sub_25A8A87E0();
    *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) = v23;
    unint64_t v164 = (void **)((v24 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v177 = v24;
  }
  unint64_t v26 = 0;
  uint64_t v27 = *v155;
  uint64_t v174 = (char **)(v6 + 32);
  char v175 = (char **)(v6 + 56);
  uint64_t v173 = (unsigned int (**)(char *, uint64_t, unint64_t))(v6 + 48);
  v169 = (char *)(v6 + 8);
  uint64_t v151 = v27 + 16;
  uint64_t v150 = v27 - 8;
  uint64_t v25 = (char *)MEMORY[0x263F8EE78];
  int64_t v28 = v161;
  while (1)
  {
    uint64_t v30 = v26;
    BOOL v31 = (id *)(v26 + 1);
    uint64_t v160 = v26;
    if ((uint64_t)(v26 + 1) < (uint64_t)v28)
    {
      unint64_t v153 = v25;
      uint64_t v32 = *(void **)(v27 + 8 * (void)v26);
      id v33 = *(id *)(v27 + 8 * (void)v31);
      uint64_t v34 = v32;
      id v35 = objc_msgSend(v34, sel_startDate);
      if (!v35) {
        goto LABEL_160;
      }
      uint64_t v36 = v35;
      char v37 = v176;
      sub_25A8A8530();

      uint64_t v38 = v156;
      v171 = *v174;
      ((void (*)(char *, char *, unint64_t))v171)(v156, v37, v5);
      int64_t v3 = *v175;
      ((void (*)(char *, void, uint64_t, unint64_t))*v175)(v38, 0, 1, v5);
      char v165 = *v173;
      if (v165(v38, 1, v5) == 1) {
        goto LABEL_161;
      }
      id v39 = objc_msgSend(v33, sel_startDate);
      if (!v39) {
        goto LABEL_162;
      }
      char v40 = v39;
      v170 = v34;
      uint64_t v41 = v176;
      sub_25A8A8530();

      char v42 = v154;
      ((void (*)(char *, char *, unint64_t))v171)(v154, v41, v5);
      ((void (*)(char *, void, uint64_t, unint64_t))v3)(v42, 0, 1, v5);
      if (v165(v42, 1, v5) == 1) {
        goto LABEL_163;
      }
      uint64_t v43 = v156;
      int v159 = sub_25A8A8500();
      uint64_t v2 = *(char **)v169;
      (*(void (**)(char *, unint64_t))v169)(v42, v5);
      uint64_t v157 = (void (*)(char *, unint64_t))v2;
      ((void (*)(char *, unint64_t))v2)(v43, v5);

      BOOL v31 = (id *)(v30 + 2);
      if ((uint64_t)(v30 + 2) < (uint64_t)v161)
      {
        uint64_t v44 = (id *)(v151 + 8 * (void)v30);
        while (1)
        {
          v170 = (char *)v31;
          uint64_t v45 = *(v44 - 1);
          id v46 = *v44;
          id v47 = v45;
          id v48 = objc_msgSend(v47, sel_startDate);
          if (!v48) {
            goto LABEL_154;
          }
          uint64_t v49 = v48;
          double v50 = v176;
          sub_25A8A8530();

          uint64_t v51 = v163;
          ((void (*)(char *, char *, unint64_t))v171)(v163, v50, v5);
          ((void (*)(char *, void, uint64_t, unint64_t))v3)(v51, 0, 1, v5);
          if (v165(v51, 1, v5) == 1) {
            goto LABEL_155;
          }
          id v52 = objc_msgSend(v46, sel_startDate);
          if (!v52) {
            goto LABEL_156;
          }
          int v53 = v52;
          uint64_t v162 = v44;
          int64_t v54 = v47;
          os_log_type_t v55 = v46;
          int v56 = v176;
          sub_25A8A8530();

          unint64_t v57 = v158;
          ((void (*)(char *, char *, unint64_t))v171)(v158, v56, v5);
          unint64_t v58 = v3;
          ((void (*)(char *, void, uint64_t, unint64_t))v3)(v57, 0, 1, v5);
          if (v165(v57, 1, v5) == 1) {
            goto LABEL_157;
          }
          uint64_t v2 = v163;
          int v59 = sub_25A8A8500();
          unint64_t v60 = v57;
          int v61 = v59;
          int64_t v3 = v169;
          char v62 = v157;
          v157(v60, v5);
          v62(v2, v5);

          if ((v159 ^ v61)) {
            break;
          }
          BOOL v31 = (id *)(v170 + 1);
          uint64_t v44 = v162 + 1;
          int64_t v3 = v58;
          if (v161 == v170 + 1)
          {
            BOOL v31 = (id *)v161;
            goto LABEL_30;
          }
        }
        BOOL v31 = (id *)v170;
LABEL_30:
        uint64_t v30 = v160;
      }
      uint64_t v25 = v153;
      if (v159)
      {
        if ((uint64_t)v31 < (uint64_t)v30) {
          goto LABEL_145;
        }
        if ((uint64_t)v30 < (uint64_t)v31)
        {
          int v63 = (uint64_t *)(v150 + 8 * (void)v31);
          uint64_t v64 = v31;
          uint64_t v65 = v30;
          uint64_t v66 = (uint64_t *)(v27 + 8 * (void)v30);
          do
          {
            uint64_t v64 = (id *)((char *)v64 - 1);
            if (v65 != (char *)v64)
            {
              if (!v27) {
                goto LABEL_158;
              }
              uint64_t v67 = *v66;
              uint64_t *v66 = *v63;
              *int v63 = v67;
            }
            ++v65;
            --v63;
            ++v66;
          }
          while ((uint64_t)v65 < (uint64_t)v64);
        }
      }
    }
    if ((uint64_t)v31 < (uint64_t)v161)
    {
      if (__OFSUB__(v31, v30)) {
        goto LABEL_143;
      }
      if ((char *)v31 - v30 < v152) {
        break;
      }
    }
LABEL_60:
    if ((uint64_t)v31 < (uint64_t)v30) {
      goto LABEL_138;
    }
    char v95 = v25;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t v25 = v95;
    }
    else {
      uint64_t v25 = sub_25A8A4734(0, *((void *)v95 + 2) + 1, 1, v95);
    }
    unint64_t v97 = *((void *)v25 + 2);
    unint64_t v96 = *((void *)v25 + 3);
    unint64_t v29 = v97 + 1;
    if (v97 >= v96 >> 1) {
      uint64_t v25 = sub_25A8A4734((char *)(v96 > 1), v97 + 1, 1, v25);
    }
    *((void *)v25 + 2) = v29;
    v170 = (char *)v31;
    v171 = v25 + 32;
    uint64_t v98 = &v25[16 * v97 + 32];
    *(void *)uint64_t v98 = v30;
    *((void *)v98 + 1) = v31;
    if (v97)
    {
      uint64_t v99 = v171;
      while (1)
      {
        unint64_t v100 = v29 - 1;
        if (v29 >= 4)
        {
          id v105 = &v99[16 * v29];
          uint64_t v106 = *((void *)v105 - 8);
          uint64_t v107 = *((void *)v105 - 7);
          BOOL v111 = __OFSUB__(v107, v106);
          uint64_t v108 = v107 - v106;
          if (v111) {
            goto LABEL_127;
          }
          uint64_t v110 = *((void *)v105 - 6);
          uint64_t v109 = *((void *)v105 - 5);
          BOOL v111 = __OFSUB__(v109, v110);
          uint64_t v103 = v109 - v110;
          char v104 = v111;
          if (v111) {
            goto LABEL_128;
          }
          unint64_t v112 = v29 - 2;
          uint64_t v113 = &v99[16 * v29 - 32];
          uint64_t v115 = *(void *)v113;
          uint64_t v114 = *((void *)v113 + 1);
          BOOL v111 = __OFSUB__(v114, v115);
          uint64_t v116 = v114 - v115;
          if (v111) {
            goto LABEL_130;
          }
          BOOL v111 = __OFADD__(v103, v116);
          uint64_t v117 = v103 + v116;
          if (v111) {
            goto LABEL_133;
          }
          if (v117 >= v108)
          {
            uint64_t v135 = &v99[16 * v100];
            uint64_t v137 = *(void *)v135;
            uint64_t v136 = *((void *)v135 + 1);
            BOOL v111 = __OFSUB__(v136, v137);
            uint64_t v138 = v136 - v137;
            if (v111) {
              goto LABEL_137;
            }
            BOOL v128 = v103 < v138;
            goto LABEL_98;
          }
        }
        else
        {
          if (v29 != 3)
          {
            uint64_t v129 = *((void *)v25 + 4);
            uint64_t v130 = *((void *)v25 + 5);
            BOOL v111 = __OFSUB__(v130, v129);
            uint64_t v122 = v130 - v129;
            char v123 = v111;
            goto LABEL_92;
          }
          uint64_t v102 = *((void *)v25 + 4);
          uint64_t v101 = *((void *)v25 + 5);
          BOOL v111 = __OFSUB__(v101, v102);
          uint64_t v103 = v101 - v102;
          char v104 = v111;
        }
        if (v104) {
          goto LABEL_129;
        }
        unint64_t v112 = v29 - 2;
        long long v118 = &v99[16 * v29 - 32];
        uint64_t v120 = *(void *)v118;
        uint64_t v119 = *((void *)v118 + 1);
        BOOL v121 = __OFSUB__(v119, v120);
        uint64_t v122 = v119 - v120;
        char v123 = v121;
        if (v121) {
          goto LABEL_132;
        }
        long long v124 = &v99[16 * v100];
        uint64_t v126 = *(void *)v124;
        uint64_t v125 = *((void *)v124 + 1);
        BOOL v111 = __OFSUB__(v125, v126);
        uint64_t v127 = v125 - v126;
        if (v111) {
          goto LABEL_135;
        }
        if (__OFADD__(v122, v127)) {
          goto LABEL_136;
        }
        if (v122 + v127 >= v103)
        {
          BOOL v128 = v103 < v127;
LABEL_98:
          if (v128) {
            unint64_t v100 = v112;
          }
          goto LABEL_100;
        }
LABEL_92:
        if (v123) {
          goto LABEL_131;
        }
        uint64_t v131 = &v99[16 * v100];
        uint64_t v133 = *(void *)v131;
        uint64_t v132 = *((void *)v131 + 1);
        BOOL v111 = __OFSUB__(v132, v133);
        uint64_t v134 = v132 - v133;
        if (v111) {
          goto LABEL_134;
        }
        if (v134 < v122) {
          goto LABEL_14;
        }
LABEL_100:
        unint64_t v139 = v100 - 1;
        if (v100 - 1 >= v29)
        {
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
          goto LABEL_147;
        }
        if (!v27) {
          goto LABEL_153;
        }
        int64_t v3 = v25;
        unint64_t v140 = (uint64_t *)&v99[16 * v139];
        char v141 = v99;
        uint64_t v142 = *v140;
        uint64_t v143 = &v141[16 * v100];
        uint64_t v2 = (char *)*((void *)v143 + 1);
        uint64_t v144 = v166;
        sub_25A8A3ABC((char *)(v27 + 8 * *v140), (void **)(v27 + 8 * *(void *)v143), (void **)(v27 + 8 * (void)v2), v164);
        uint64_t v166 = v144;
        if (v144) {
          goto LABEL_121;
        }
        if ((uint64_t)v2 < v142) {
          goto LABEL_124;
        }
        if (v100 > *((void *)v3 + 2)) {
          goto LABEL_125;
        }
        *unint64_t v140 = v142;
        uint64_t v99 = v171;
        *(void *)&v171[16 * v139 + 8] = v2;
        unint64_t v145 = *((void *)v3 + 2);
        if (v100 >= v145) {
          goto LABEL_126;
        }
        unint64_t v29 = v145 - 1;
        memmove(v143, v143 + 16, 16 * (v145 - 1 - v100));
        uint64_t v25 = v3;
        *((void *)v3 + 2) = v145 - 1;
        if (v145 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v29 = 1;
LABEL_14:
    int64_t v28 = v161;
    unint64_t v26 = v170;
    if ((uint64_t)v170 >= (uint64_t)v161) {
      goto LABEL_110;
    }
  }
  if (__OFADD__(v30, v152)) {
    goto LABEL_146;
  }
  uint64_t v68 = v161;
  if ((uint64_t)&v30[v152] < (uint64_t)v161) {
    uint64_t v68 = &v30[v152];
  }
  if ((uint64_t)v68 >= (uint64_t)v30)
  {
    if (v31 != (id *)v68)
    {
      unint64_t v153 = v25;
      uint64_t v69 = (char *)(v150 + 8 * (void)v31);
      uint64_t v167 = v27;
      uint64_t v162 = (id *)v68;
      do
      {
        BOOL v71 = v69;
        uint64_t v72 = *(void **)(v27 + 8 * (void)v31);
        int64_t v73 = v30;
        char v165 = (unsigned int (*)(char *, uint64_t, unint64_t))v71;
        unint64_t v74 = v71;
        v170 = (char *)v31;
        while (1)
        {
          int64_t v75 = *(void **)v74;
          id v76 = v72;
          id v77 = v75;
          id v78 = objc_msgSend(v77, sel_startDate);
          if (!v78) {
            goto LABEL_150;
          }
          int64_t v79 = v78;
          v171 = (char *)v77;
          uint64_t v80 = v176;
          sub_25A8A8530();

          int64_t v3 = *v174;
          uint64_t v81 = v172;
          ((void (*)(char *, char *, unint64_t))*v174)(v172, v80, v5);
          uint64_t v2 = *v175;
          ((void (*)(char *, void, uint64_t, unint64_t))*v175)(v81, 0, 1, v5);
          uint64_t v82 = *v173;
          if ((*v173)(v81, 1, v5) == 1) {
            goto LABEL_151;
          }
          uint64_t v83 = v76;
          id v84 = objc_msgSend(v76, sel_startDate);
          if (!v84) {
            goto LABEL_148;
          }
          double v85 = v84;
          unint64_t v86 = v5;
          uint64_t v87 = v176;
          sub_25A8A8530();

          char v88 = v168;
          unint64_t v89 = v87;
          unint64_t v5 = v86;
          ((void (*)(char *, char *, unint64_t))v3)(v168, v89, v86);
          ((void (*)(char *, void, uint64_t, unint64_t))v2)(v88, 0, 1, v86);
          if (v82(v88, 1, v86) == 1) {
            goto LABEL_149;
          }
          uint64_t v90 = v172;
          char v91 = sub_25A8A8500();
          uint64_t v92 = v88;
          char v93 = v91;
          int64_t v3 = v169;
          uint64_t v2 = *(char **)v169;
          (*(void (**)(char *, unint64_t))v169)(v92, v5);
          ((void (*)(char *, unint64_t))v2)(v90, v5);

          uint64_t v27 = v167;
          if ((v93 & 1) == 0) {
            break;
          }
          uint64_t v70 = v170;
          if (!v167) {
            goto LABEL_152;
          }
          unint64_t v94 = *(void **)v74;
          uint64_t v72 = (void *)*((void *)v74 + 1);
          *(void *)unint64_t v74 = v72;
          *((void *)v74 + 1) = v94;
          v74 -= 8;
          if (v70 == ++v73) {
            goto LABEL_49;
          }
        }
        uint64_t v70 = v170;
LABEL_49:
        BOOL v31 = (id *)(v70 + 1);
        uint64_t v69 = (char *)v165 + 8;
        uint64_t v30 = v160;
      }
      while (v31 != v162);
      BOOL v31 = v162;
      uint64_t v25 = v153;
    }
    goto LABEL_60;
  }
LABEL_147:
  __break(1u);
LABEL_148:
  ((void (*)(char *, uint64_t, uint64_t, unint64_t))v2)(v168, 1, 1, v5);
LABEL_149:
  __break(1u);
LABEL_150:
  ((void (*)(char *, uint64_t, uint64_t, unint64_t))*v175)(v172, 1, 1, v5);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  ((void (*)(char *, uint64_t, uint64_t, unint64_t))v3)(v163, 1, 1, v5);
LABEL_155:
  __break(1u);
LABEL_156:
  ((void (*)(char *, uint64_t, uint64_t, unint64_t))v3)(v158, 1, 1, v5);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  ((void (*)(char *, uint64_t, uint64_t, unint64_t))*v175)(v156, 1, 1, v5);
LABEL_161:
  __break(1u);
LABEL_162:
  ((void (*)(char *, uint64_t, uint64_t, unint64_t))v3)(v154, 1, 1, v5);
LABEL_163:
  __break(1u);
LABEL_164:
  sub_25A8A8B50();
  __break(1u);
}

char *sub_25A8A2BB4(uint64_t *a1, unint64_t *a2, uint64_t a3, SEL *a4)
{
  uint64_t v7 = a1[1];
  uint64_t result = (char *)sub_25A8A8BE0();
  if ((uint64_t)result >= v7)
  {
    if (v7 < 0) {
      goto LABEL_158;
    }
    if (v7) {
      return sub_25A8A390C(0, (char *)v7, (char *)1, a1, a4);
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
      uint64_t result = (char *)sub_25A8A8B50();
      __break(1u);
    }
    else
    {
      unint64_t v139 = result;
      uint64_t v145 = v7;
      uint64_t v149 = v4;
      if (v7 >= 2)
      {
        uint64_t v10 = v9 >> 1;
        sub_25A86AE00(0, a2);
        uint64_t v11 = sub_25A8A87E0();
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
          uint64_t v23 = v22;
          uint64_t v24 = sub_25A8A86B0();
          uint64_t v26 = v25;

          id v27 = [v21 *v19];
          if (!v27)
          {
LABEL_171:
            __break(1u);
            goto LABEL_172;
          }
          int64_t v28 = v27;
          uint64_t v29 = sub_25A8A86B0();
          uint64_t v31 = v30;

          BOOL v32 = v24 == v29 && v26 == v31;
          uint64_t v13 = v144;
          if (v32) {
            int v146 = 0;
          }
          else {
            int v146 = sub_25A8A8C00();
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
            id v35 = *(v33 - 1);
            id v36 = *v33;
            id v37 = v35;
            id v38 = [v36 *v150];
            if (!v38) {
              goto LABEL_166;
            }
            id v39 = v38;
            uint64_t v40 = sub_25A8A86B0();
            uint64_t v42 = v41;

            id v43 = [v37 *v150];
            if (!v43) {
              goto LABEL_167;
            }
            uint64_t v44 = v43;
            uint64_t v45 = sub_25A8A86B0();
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
            int v34 = sub_25A8A8C00();

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
              uint64_t v49 = (uint64_t *)(v138 + 8 * v17);
              uint64_t v50 = v17;
              uint64_t v51 = v13;
              id v52 = (uint64_t *)(v14 + 8 * v13);
              do
              {
                if (v51 != --v50)
                {
                  if (!v14) {
                    goto LABEL_168;
                  }
                  uint64_t v53 = *v52;
                  *id v52 = *v49;
                  *uint64_t v49 = v53;
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
              int64_t v54 = (char *)v145;
              if ((uint64_t)&v139[v13] < v145) {
                int64_t v54 = &v139[v13];
              }
              if ((uint64_t)v54 >= v13)
              {
                if ((char *)v17 != v54)
                {
                  char v141 = v12;
                  uint64_t v55 = v138 + 8 * v17;
                  uint64_t v143 = v54;
                  do
                  {
                    unint64_t v57 = *(void **)(v14 + 8 * v17);
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
                      char v62 = v61;
                      uint64_t v63 = sub_25A8A86B0();
                      uint64_t v65 = v64;

                      id v66 = [v60 *a4];
                      if (!v66) {
                        goto LABEL_162;
                      }
                      uint64_t v67 = v66;
                      uint64_t v68 = sub_25A8A86B0();
                      uint64_t v70 = v69;

                      if (v63 == v68 && v65 == v70) {
                        break;
                      }
                      char v72 = sub_25A8A8C00();

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
                      unint64_t v57 = *(void **)(v55 + 8);
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
            uint64_t v12 = sub_25A8A4734(0, *((void *)v74 + 2) + 1, 1, v74);
          }
          unint64_t v76 = *((void *)v12 + 2);
          unint64_t v75 = *((void *)v12 + 3);
          unint64_t v16 = v76 + 1;
          uint64_t v14 = v151;
          if (v76 >= v75 >> 1)
          {
            uint64_t v129 = sub_25A8A4734((char *)(v75 > 1), v76 + 1, 1, v12);
            uint64_t v14 = v151;
            uint64_t v12 = v129;
          }
          *((void *)v12 + 2) = v16;
          id v77 = v12 + 32;
          id v78 = &v12[16 * v76 + 32];
          *(void *)id v78 = v144;
          *((void *)v78 + 1) = v17;
          uint64_t v154 = v17;
          if (v76)
          {
            while (2)
            {
              unint64_t v79 = v16 - 1;
              if (v16 >= 4)
              {
                id v84 = &v77[16 * v16];
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
                uint64_t v92 = &v77[16 * v16 - 32];
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
                  unint64_t v97 = &v77[16 * v16 - 32];
                  uint64_t v99 = *(void *)v97;
                  uint64_t v98 = *((void *)v97 + 1);
                  BOOL v100 = __OFSUB__(v98, v99);
                  uint64_t v101 = v98 - v99;
                  char v102 = v100;
                  if (v100) {
                    goto LABEL_146;
                  }
                  uint64_t v103 = &v77[16 * v79];
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
              uint64_t v119 = a4;
              uint64_t v120 = v12;
              BOOL v121 = v77;
              uint64_t v122 = &v77[16 * v118];
              uint64_t v123 = *(void *)v122;
              long long v124 = v121;
              unint64_t v125 = v79;
              uint64_t v126 = &v121[16 * v79];
              uint64_t v127 = *((void *)v126 + 1);
              sub_25A8A42F0((id *)(v14 + 8 * *(void *)v122), (id *)(v14 + 8 * *(void *)v126), (id *)(v14 + 8 * v127), v148, v119);
              if (v149) {
                goto LABEL_135;
              }
              if (v127 < v123) {
                goto LABEL_138;
              }
              if (v125 > *((void *)v120 + 2)) {
                goto LABEL_139;
              }
              *(void *)uint64_t v122 = v123;
              *(void *)&v124[16 * v118 + 8] = v127;
              unint64_t v128 = *((void *)v120 + 2);
              if (v125 >= v128) {
                goto LABEL_140;
              }
              id v77 = v124;
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
          sub_25A8A42F0((id *)(v130 + 8 * v133), (id *)(v130 + 8 * *(void *)&v12[16 * v16 + 16]), (id *)(v130 + 8 * v134), v148, a4);
          if (v149) {
            break;
          }
          if (v134 < v133) {
            goto LABEL_154;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v132 = sub_25A8A48EC((uint64_t)v132);
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
      sub_25A8A87C0();
      return (char *)swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_25A8A354C(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  uint64_t v37 = a1;
  uint64_t v7 = sub_25A8A8570();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v48 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v47 = (char *)&v35 - v14;
  id v36 = a2;
  if (a3 != a2)
  {
    uint64_t v15 = *a4;
    uint64_t v45 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v46 = (char **)(v8 + 56);
    uint64_t v44 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    id v39 = (void (**)(void *, uint64_t))(v8 + 8);
    uint64_t v40 = v15;
    uint64_t v16 = v15 + 8 * (void)a3 - 8;
    uint64_t v17 = off_26547D000;
LABEL_5:
    uint64_t v18 = *(void **)(v40 + 8 * (void)a3);
    uint64_t v41 = a3;
    uint64_t v42 = v37;
    uint64_t v38 = v16;
    while (1)
    {
      uint64_t v19 = *(char **)v16;
      id v20 = v18;
      id v21 = v19;
      id v22 = [v21 (SEL)v17[509]];
      if (!v22) {
        break;
      }
      uint64_t v23 = v22;
      id v43 = v21;
      uint64_t v19 = v13;
      uint64_t v24 = v48;
      sub_25A8A8530();

      uint64_t v25 = *v45;
      uint64_t v26 = v47;
      (*v45)(v47, v24, v7);
      a3 = *v46;
      ((void (*)(char *, void, uint64_t, uint64_t))*v46)(v26, 0, 1, v7);
      id v27 = *v44;
      if ((*v44)(v26, 1, v7) == 1) {
        goto LABEL_15;
      }
      id v28 = [v20 (SEL)v17[509]];
      if (!v28) {
        goto LABEL_16;
      }
      uint64_t v29 = v28;
      uint64_t v30 = v48;
      sub_25A8A8530();

      v25(v19, v30, v7);
      uint64_t v13 = v19;
      ((void (*)(char *, void, uint64_t, uint64_t))a3)(v19, 0, 1, v7);
      if (v27(v19, 1, v7) == 1) {
        goto LABEL_17;
      }
      uint64_t v31 = v47;
      char v32 = sub_25A8A8500();
      id v33 = *v39;
      (*v39)(v19, v7);
      v33(v31, v7);

      a3 = v41;
      uint64_t v17 = off_26547D000;
      if (v32)
      {
        if (!v40) {
          goto LABEL_18;
        }
        int v34 = *(char **)v16;
        uint64_t v18 = *(void **)(v16 + 8);
        *(void *)uint64_t v16 = v18;
        *(void *)(v16 + 8) = v34;
        v16 -= 8;
        if (a3 != (char *)++v42) {
          continue;
        }
      }
      ++a3;
      uint64_t v16 = v38 + 8;
      if (a3 == v36) {
        return;
      }
      goto LABEL_5;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v46)(v47, 1, 1, v7);
LABEL_15:
    __break(1u);
LABEL_16:
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))a3)(v19, 1, 1, v7);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
}

char *sub_25A8A390C(char *result, char *a2, char *a3, uint64_t *a4, SEL *a5)
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
      uint64_t v10 = *(void **)v7;
      id v11 = v9;
      id v12 = v10;
      uint64_t result = (char *)[v11 *a5];
      if (!result) {
        break;
      }
      uint64_t v13 = result;
      uint64_t v14 = sub_25A8A86B0();
      uint64_t v16 = v15;

      uint64_t result = (char *)[v12 *a5];
      if (!result) {
        goto LABEL_18;
      }
      uint64_t v17 = result;
      uint64_t v18 = a5;
      uint64_t v19 = sub_25A8A86B0();
      uint64_t v21 = v20;

      if (v14 == v19 && v16 == v21)
      {

        uint64_t result = (char *)swift_bridgeObjectRelease_n();
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
      char v23 = sub_25A8A8C00();

      swift_bridgeObjectRelease();
      uint64_t result = (char *)swift_bridgeObjectRelease();
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

uint64_t sub_25A8A3ABC(char *a1, void **a2, void **a3, void **a4)
{
  unint64_t v5 = v4;
  uint64_t v10 = (void *)sub_25A8A8570();
  uint64_t v81 = (void (**)(char *, void *))*(v10 - 1);
  MEMORY[0x270FA5388](v10);
  uint64_t v94 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A040);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  id v84 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v89 = (char *)&v79 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v86 = (char *)&v79 - v18;
  MEMORY[0x270FA5388](v17);
  unint64_t v91 = (char *)&v79 - v19;
  uint64_t v92 = v10;
  uint64_t v20 = (char *)a2 - a1;
  uint64_t v21 = (char *)a2 - a1 + 7;
  if ((char *)a2 - a1 >= 0) {
    uint64_t v21 = (char *)a2 - a1;
  }
  uint64_t v22 = v21 >> 3;
  char v23 = a2;
  uint64_t v87 = a3;
  uint64_t v24 = (char *)a3 - (char *)a2;
  uint64_t v25 = v24 / 8;
  uint64_t v93 = (void **)a1;
  unint64_t v97 = (void **)a1;
  uint64_t v96 = a4;
  unint64_t v79 = (void (*)(char *, uint64_t, uint64_t, void))v4;
  if (v21 >> 3 >= v24 / 8)
  {
    if (v24 < -7) {
      goto LABEL_60;
    }
    id v52 = v23;
    if (a4 != v23 || &v23[v25] <= a4) {
      memmove(a4, v23, 8 * v25);
    }
    uint64_t v53 = &a4[v25];
    uint64_t v95 = v53;
    unint64_t v97 = v23;
    if (v24 < 8 || v93 >= v23) {
      goto LABEL_51;
    }
    int64_t v54 = v81;
    uint64_t v55 = (void (**)(void))(v81 + 4);
    uint64_t v28 = (id *)(v81 + 7);
    uint64_t v88 = (unsigned int (**)(char *, uint64_t, void *))(v81 + 6);
    ++v81;
    uint64_t v82 = (void (**)(void))(v54 + 4);
    uint64_t v56 = (char *)(v87 - 1);
    unint64_t v57 = v52;
    char v83 = a4;
    uint64_t v80 = (id *)(v54 + 7);
    while (1)
    {
      BOOL v90 = v56;
      uint64_t v86 = (char *)v53;
      uint64_t v87 = v52;
      unint64_t v58 = v53 - 1;
      id v59 = *--v57;
      unint64_t v91 = *(v53 - 1);
      uint64_t v85 = v59;
      id v60 = objc_msgSend(v85, sel_startDate);
      if (!v60) {
        goto LABEL_56;
      }
      id v61 = v60;
      char v62 = v94;
      sub_25A8A8530();

      uint64_t v63 = *v55;
      uint64_t v64 = v89;
      ((void (*)(char *, char *, void *))*v55)(v89, v62, v10);
      uint64_t v65 = v10;
      uint64_t v10 = *v28;
      ((void (*)(char *, void, uint64_t, void *))*v28)(v64, 0, 1, v65);
      id v66 = *v88;
      if ((*v88)(v64, 1, v65) == 1) {
        goto LABEL_57;
      }
      id v67 = objc_msgSend(v91, sel_startDate);
      if (!v67) {
        goto LABEL_58;
      }
      uint64_t v68 = v67;
      sub_25A8A8530();

      uint64_t v69 = v84;
      uint64_t v70 = v92;
      v63();
      ((void (*)(char *, void, uint64_t, void *))v10)(v69, 0, 1, v70);
      if (v66(v69, 1, v70) == 1) {
        goto LABEL_59;
      }
      BOOL v71 = v89;
      char v72 = v90 + 8;
      char v73 = sub_25A8A8500();
      unint64_t v74 = *v81;
      (*v81)(v69, v70);
      v74(v71, v70);

      uint64_t v10 = v70;
      if (v73)
      {
        uint64_t v53 = (void **)v86;
        unint64_t v75 = v90;
        if (v72 != (char *)v87 || v90 >= (char *)v87) {
          *(void *)BOOL v90 = *v57;
        }
        unint64_t v97 = v57;
      }
      else
      {
        uint64_t v95 = v58;
        unint64_t v75 = v90;
        if (v72 >= v86 && v90 < v86)
        {
          unint64_t v76 = v93;
          uint64_t v28 = v80;
          if (v72 != v86) {
            *(void *)BOOL v90 = *v58;
          }
          unint64_t v57 = v87;
          uint64_t v53 = v58;
          id v77 = v83;
          goto LABEL_49;
        }
        *(void *)BOOL v90 = *v58;
        unint64_t v57 = v87;
        uint64_t v53 = v58;
      }
      id v77 = v83;
      unint64_t v76 = v93;
      uint64_t v28 = v80;
LABEL_49:
      uint64_t v55 = v82;
      if (v53 > v77)
      {
        uint64_t v56 = v75 - 8;
        id v52 = v57;
        if (v57 > v76) {
          continue;
        }
      }
      goto LABEL_51;
    }
  }
  if (v20 >= -7)
  {
    uint64_t v26 = v93;
    if (a4 != v93 || &v93[v22] <= a4) {
      memmove(a4, v93, 8 * v22);
    }
    uint64_t v85 = &a4[v22];
    uint64_t v95 = v85;
    if (v20 >= 8)
    {
      uint64_t v27 = v23;
      if (v23 < v87)
      {
        uint64_t v89 = (char *)(v81 + 4);
        BOOL v90 = (char *)(v81 + 7);
        uint64_t v88 = (unsigned int (**)(char *, uint64_t, void *))(v81 + 6);
        id v84 = (char *)(v81 + 1);
        while (1)
        {
          uint64_t v93 = v26;
          uint64_t v28 = v27;
          uint64_t v29 = a4;
          uint64_t v30 = *a4;
          id v31 = *v27;
          uint64_t v10 = v30;
          id v32 = objc_msgSend(v10, sel_startDate);
          if (!v32) {
            break;
          }
          id v33 = v32;
          int v34 = v94;
          sub_25A8A8530();

          uint64_t v35 = *(void (**)(char *, char *, void *))v89;
          uint64_t v37 = v91;
          id v36 = v92;
          (*(void (**)(char *, char *, void *))v89)(v91, v34, v92);
          unint64_t v5 = *(void (**)(char *, uint64_t, uint64_t, void *))v90;
          (*(void (**)(char *, void, uint64_t, void *))v90)(v37, 0, 1, v36);
          uint64_t v38 = *v88;
          if ((*v88)(v37, 1, v36) == 1) {
            goto LABEL_53;
          }
          id v39 = objc_msgSend(v31, sel_startDate);
          if (!v39) {
            goto LABEL_54;
          }
          uint64_t v40 = v39;
          uint64_t v41 = v94;
          sub_25A8A8530();

          uint64_t v42 = v86;
          id v43 = v41;
          uint64_t v44 = v92;
          v35(v86, v43, v92);
          v5(v42, 0, 1, v44);
          if (v38(v42, 1, v44) == 1) {
            goto LABEL_55;
          }
          uint64_t v45 = v91;
          char v46 = sub_25A8A8500();
          uint64_t v47 = v42;
          char v48 = v46;
          unint64_t v5 = (void (*)(char *, uint64_t, uint64_t, void *))v84;
          uint64_t v49 = *(void (**)(char *, void *))v84;
          (*(void (**)(char *, void *))v84)(v47, v44);
          v49(v45, v44);

          if (v48)
          {
            unint64_t v50 = (unint64_t)(v28 + 1);
            uint64_t v51 = v93;
            a4 = v29;
            if (v93 < v28 || (unint64_t)v93 >= v50 || v93 != v28) {
              void *v93 = *v28;
            }
          }
          else
          {
            uint64_t v51 = v93;
            if (v93 != v29) {
              void *v93 = *v29;
            }
            a4 = v29 + 1;
            uint64_t v96 = v29 + 1;
            unint64_t v50 = (unint64_t)v28;
          }
          uint64_t v26 = v51 + 1;
          unint64_t v97 = v26;
          if (a4 < v85)
          {
            uint64_t v27 = (id *)v50;
            if (v50 < (unint64_t)v87) {
              continue;
            }
          }
          goto LABEL_51;
        }
        (*(void (**)(char *, uint64_t, uint64_t, void *))v90)(v91, 1, 1, v92);
LABEL_53:
        __break(1u);
LABEL_54:
        v5(v86, 1, 1, v92);
LABEL_55:
        __break(1u);
LABEL_56:
        ((void (*)(char *, uint64_t, uint64_t, id))*v28)(v89, 1, 1, v10);
LABEL_57:
        __break(1u);
LABEL_58:
        ((void (*)(char *, uint64_t, uint64_t, void *))v10)(v84, 1, 1, v92);
LABEL_59:
        __break(1u);
        goto LABEL_60;
      }
    }
LABEL_51:
    sub_25A8A4830((void **)&v97, (const void **)&v96, &v95);
    return 1;
  }
LABEL_60:
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A8A42F0(id *__src, id *a2, id *a3, void **__dst, SEL *a5)
{
  uint64_t v6 = a3;
  uint64_t v7 = a2;
  uint64_t v8 = __src;
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
  uint64_t v69 = __dst;
  if (v11 < v13 >> 3)
  {
    if (v9 < -7) {
      goto LABEL_61;
    }
    if (__dst != __src || &__src[v11] <= __dst) {
      memmove(__dst, __src, 8 * v11);
    }
    char v62 = &__dst[v11];
    uint64_t v68 = (char *)v62;
    uint64_t v15 = a5;
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
        uint64_t v22 = v21;
        uint64_t v23 = sub_25A8A86B0();
        uint64_t v25 = v24;

        id v26 = [v20 *v15];
        if (!v26) {
          goto LABEL_60;
        }
        uint64_t v27 = v26;
        uint64_t v28 = sub_25A8A86B0();
        uint64_t v30 = v29;

        if (v23 == v28 && v25 == v30) {
          break;
        }
        char v32 = sub_25A8A8C00();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v32 & 1) == 0) {
          goto LABEL_25;
        }
        id v33 = v17 + 1;
        int v34 = v64;
        uint64_t v35 = v66;
        uint64_t v15 = a5;
        if (v64 < v17 || v64 >= v33 || v64 != v17) {
          *uint64_t v64 = *v17;
        }
LABEL_28:
        uint64_t v8 = v34 + 1;
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
      int v34 = v64;
      uint64_t v35 = v66;
      uint64_t v15 = a5;
      if (v64 != v16) {
        *uint64_t v64 = *v16;
      }
      uint64_t v69 = ++v16;
      id v33 = v17;
      goto LABEL_28;
    }
LABEL_56:
    sub_25A8A4830((void **)&v70, (const void **)&v69, &v68);
    return 1;
  }
  if (v12 < -7) {
    goto LABEL_61;
  }
  id v36 = a5;
  if (__dst != a2 || &a2[v14] <= __dst) {
    memmove(__dst, a2, 8 * v14);
  }
  id v59 = (char *)__dst;
  uint64_t v37 = (char *)&__dst[v14];
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
    id v67 = v6;
    uint64_t v40 = (void *)*((void *)v37 - 1);
    v37 -= 8;
    id v39 = v40;
    uint64_t v41 = *--v38;
    id v42 = v39;
    id v43 = v41;
    id v44 = [v42 *v36];
    if (!v44) {
      break;
    }
    uint64_t v45 = v44;
    uint64_t v46 = sub_25A8A86B0();
    uint64_t v48 = v47;

    id v49 = [v43 *v36];
    if (!v49) {
      goto LABEL_58;
    }
    unint64_t v50 = v49;
    uint64_t v51 = sub_25A8A86B0();
    uint64_t v53 = v52;

    if (v46 == v51 && v48 == v53)
    {

      swift_bridgeObjectRelease_n();
      uint64_t v56 = v67;
      uint64_t v6 = v67 - 1;
LABEL_50:
      id v36 = a5;
      uint64_t v38 = v63;
      unint64_t v57 = (unint64_t)v65;
      uint64_t v68 = v37;
      if (v56 < (id *)v61 || v6 >= (id *)v61 || v56 != (id *)v61) {
        id *v6 = *(id *)v37;
      }
      goto LABEL_54;
    }
    char v55 = sub_25A8A8C00();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v56 = v67;
    uint64_t v6 = v67 - 1;
    if ((v55 & 1) == 0) {
      goto LABEL_50;
    }
    unint64_t v57 = (unint64_t)v65;
    id v36 = a5;
    uint64_t v37 = v61;
    if (v67 != v63 || v6 >= v63) {
      id *v6 = *v38;
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

char *sub_25A8A4734(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A3A8);
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

char *sub_25A8A4830(void **a1, const void **a2, void *a3)
{
  int64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_25A8A8BC0();
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

char *sub_25A8A48EC(uint64_t a1)
{
  return sub_25A8A4734(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25A8A4900(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_25A8A5560();
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  unint64_t v12 = v9;
  uint64_t v13 = (void *)*a5;
  unint64_t v15 = sub_25A88B6D8(v7, v8);
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
      uint64_t v22 = (void *)*a5;
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25A8A0D58(&qword_26A46A058);
      uint64_t v22 = (void *)*a5;
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
    uint64_t v29 = sub_25A8A5560();
    if (v30)
    {
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      unint64_t v34 = v31;
      do
      {
        id v39 = (void *)*a5;
        unint64_t v40 = sub_25A88B6D8(v32, v33);
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
          sub_25A89FB4C(v44, 1, &qword_26A46A058);
          unint64_t v40 = sub_25A88B6D8(v32, v33);
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
          sub_25A89D834(v34);
          swift_bridgeObjectRelease();
          uint64_t v36 = v47[7];
          swift_bridgeObjectRelease();
          *(void *)(v36 + v35) = v53;
        }
        else
        {
          v47[(v40 >> 6) + 8] |= 1 << v40;
          uint64_t v48 = (uint64_t *)(v47[6] + 16 * v40);
          *uint64_t v48 = v32;
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
        uint64_t v32 = sub_25A8A5560();
        uint64_t v33 = v37;
        unint64_t v34 = v38;
      }
      while (v37);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25A885CF4();
    return swift_release();
  }
  sub_25A89FB4C(v18, a4 & 1, &qword_26A46A058);
  unint64_t v20 = sub_25A88B6D8(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    unint64_t v15 = v20;
    uint64_t v22 = (void *)*a5;
    if ((v19 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v23 = 8 * v15;
    uint64_t v52 = *(void *)(v22[7] + v23);
    swift_bridgeObjectRetain();
    sub_25A89D834(v12);
    swift_bridgeObjectRelease();
    uint64_t v24 = v22[7];
    swift_bridgeObjectRelease();
    *(void *)(v24 + v23) = v52;
    goto LABEL_13;
  }
LABEL_26:
  uint64_t result = sub_25A8A8C40();
  __break(1u);
  return result;
}

uint64_t sub_25A8A4C44(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25A8A8B70();
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
    uint64_t v10 = sub_25A8A8B70();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25A8A638C(&qword_26A46A3A0, &qword_26A46A398);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A398);
          unint64_t v12 = sub_25A8A52E0(v16, i, a3);
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
    sub_25A86AE00(0, &qword_26A469FA0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A8A4E78(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25A8A8B70();
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
    uint64_t v10 = sub_25A8A8B70();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25A8A638C(&qword_26A46A3F0, &qword_26A46A3E8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A3E8);
          unint64_t v12 = sub_25A8A52E0(v16, i, a3);
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
    sub_25A86AE00(0, &qword_26A46A3E0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A8A50AC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25A8A8B70();
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
    uint64_t v10 = sub_25A8A8B70();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_25A8A638C(&qword_26A46A3D8, &qword_26A46A3D0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A3D0);
          unint64_t v12 = sub_25A8A534C(v16, i, a3);
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
    sub_25A86AE00(0, &qword_26A46A3C8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t (*sub_25A8A52E0(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25A8A53FC(v6, a2, a3);
  return sub_25A8A5348;
}

uint64_t (*sub_25A8A534C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25A8A547C(v6, a2, a3);
  return sub_25A8A5348;
}

void sub_25A8A53B4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_25A8A53FC(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  int64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x261147DD0](a2, a3);
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
    *(void *)int64_t v3 = v4;
    return j__s43ProactiveShareSheetDataHarvestingLighthouse28SynchronizedExecutionManagerVwxx;
  }
  __break(1u);
  return result;
}

void (*sub_25A8A547C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  int64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x261147DD0](a2, a3);
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
    *(void *)int64_t v3 = v4;
    return destroy for SynchronizedExecutionManager;
  }
  __break(1u);
  return result;
}

void destroy for SynchronizedExecutionManager(id *a1)
{
}

void sub_25A8A5504()
{
}

uint64_t sub_25A8A5518@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_25A8A5560()
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
  uint64_t v13 = v3 + 1;
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
          uint64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            uint64_t v13 = v3 + 3;
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
            uint64_t v13 = v3 + 5;
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
                  uint64_t v13 = v18 - 1;
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

uint64_t sub_25A8A56F8(uint64_t a1)
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
  uint64_t v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_25A8A5780(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_25A8A8880();
  uint64_t v8 = result;
  if (v2)
  {
    int64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25A89DA00(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_25A8A5818(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

void *sub_25A8A590C(unint64_t a1, uint64_t (*a2)(id))
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_25A8A8B70())
  {
    unint64_t v17 = v2 & 0xC000000000000001;
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
    uint64_t v5 = 4;
    unint64_t v16 = v2;
    while (1)
    {
      id v7 = v17 ? (id)MEMORY[0x261147DD0](v5 - 4, v2) : *(id *)(v2 + 8 * v5);
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
          uint64_t v4 = sub_25A89C718(0, v4[2] + 1, 1, v4);
        }
        unint64_t v14 = v4[2];
        unint64_t v13 = v4[3];
        if (v14 >= v13 >> 1) {
          uint64_t v4 = sub_25A89C718((void *)(v13 > 1), v14 + 1, 1, v4);
        }
        v4[2] = v14 + 1;
        unint64_t v6 = &v4[2 * v14];
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

uint64_t sub_25A8A5A9C(unint64_t a1, uint64_t (*a2)(void))
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
    uint64_t result = sub_25A89CE30(0, v3 & ~(v3 >> 63), 0);
    if (v3 < 0) {
      break;
    }
    uint64_t v6 = 0;
    uint64_t v4 = v13;
    while (v3 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x261147DD0](v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      uint64_t v9 = a2();

      unint64_t v11 = *(void *)(v13 + 16);
      unint64_t v10 = *(void *)(v13 + 24);
      if (v11 >= v10 >> 1) {
        sub_25A89CE30(v10 > 1, v11 + 1, 1);
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
    uint64_t v3 = sub_25A8A8B70();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_25A8A5C04(uint64_t a1, void (*a2)(uint64_t, uint64_t, double))
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_25A8A8B10();
    uint64_t result = sub_25A8A56F8(a1);
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
      uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v5);
      uint64_t v13 = *v12;
      uint64_t v14 = v12[1];
      double v15 = *(double *)(*(void *)(a1 + 56) + 8 * v5);
      swift_bridgeObjectRetain();
      a2(v13, v14, v15);
      swift_bridgeObjectRelease();
      sub_25A8A8AF0();
      sub_25A8A8B20();
      sub_25A8A8B30();
      uint64_t result = sub_25A8A8B00();
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

char *sub_25A8A5E20(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    int v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A8A5F0C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25A8A5F44(uint64_t a1)
{
  return a1;
}

uint64_t sub_25A8A5F74()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A8A5FAC(unint64_t a1)
{
  return sub_25A893DE8(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_25A8A5FB4(unint64_t a1, uint64_t (*a2)(void *))
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
        id v7 = (id)MEMORY[0x261147DD0](v3, v2);
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_17;
        }
        if (objc_msgSend(v7, sel_mechanism) == (id)13 && (a2(v8) & 1) != 0)
        {
          sub_25A8A8AF0();
          sub_25A8A8B20();
          unint64_t v2 = v11;
          uint64_t v6 = v12;
          sub_25A8A8B30();
          sub_25A8A8B00();
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
      uint64_t v12 = sub_25A8A8B70();
      if (!v12) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v2 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25A8A6140(unint64_t a1, uint64_t a2, uint64_t a3)
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
      uint64_t v6 = &selRef_setHasFeatureName_;
      while (v25)
      {
        id v7 = (id)MEMORY[0x261147DD0](v5, v3);
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_25;
        }
        id v10 = [v7 v6[50]];
        if (v10)
        {

          id v11 = [v8 v6[50]];
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
          uint64_t v16 = sub_25A8A86B0();
          uint64_t v18 = v17;

          if (v16 == a2 && v18 == a3)
          {
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
          char v19 = sub_25A8A8C00();
          swift_bridgeObjectRelease();
          if (v19)
          {
LABEL_19:
            sub_25A8A8AF0();
            sub_25A8A8B20();
            sub_25A8A8B30();
            sub_25A8A8B00();
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
      uint64_t v4 = sub_25A8A8B70();
      if (!v4) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v3 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25A8A636C(id *a1)
{
  return sub_25A882468(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_25A8A638C(unint64_t *a1, uint64_t *a2)
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

char *sub_25A8A63D0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    id v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A8A64BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A8A65B0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_25A8A8BC0();
  __break(1u);
  return result;
}

uint64_t sub_25A8A66A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6)
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
    sub_25A899C60((uint64_t)&v27, v26, a3, a4, v11, a6);
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

id sub_25A8A68BC(uint64_t a1, uint64_t a2)
{
  return sub_25A89A214(a1, a2, *(unsigned int *)(v2 + 16));
}

uint64_t sub_25A8A68C4()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_25A8A6914()
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

void sub_25A8A6A04(void *a1)
{
  sub_25A89A5B8(a1, *(void *)(v1 + 16), v1 + 24, *(void *)(v1 + 424));
}

uint64_t sub_25A8A6A14()
{
  uint64_t v1 = sub_25A8A8570();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

BOOL sub_25A8A6AA4(void *a1)
{
  sub_25A8A8570();
  if (!a1) {
    return 0;
  }
  objc_msgSend(a1, sel_timestamp);
  double v3 = v2;
  sub_25A8A8480();
  return v3 < v4;
}

uint64_t sub_25A8A6B34()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A8A6B44(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25A8A8570();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25A8A6BAC(uint64_t a1, char a2)
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

uint64_t SynchronizedExecutionManager.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25A8A8920();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  __int16 v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25A8A8910();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_25A8A8650();
  MEMORY[0x270FA5388](v7 - 8);
  sub_25A8A6E80();
  sub_25A8A8640();
  v9[1] = MEMORY[0x263F8EE78];
  sub_25A8A6EC0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A468);
  sub_25A8A6F18();
  sub_25A8A89E0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F130], v2);
  uint64_t result = sub_25A8A8940();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = 0;
  return result;
}

unint64_t sub_25A8A6E80()
{
  unint64_t result = qword_26A46A458;
  if (!qword_26A46A458)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A46A458);
  }
  return result;
}

unint64_t sub_25A8A6EC0()
{
  unint64_t result = qword_26A46A460;
  if (!qword_26A46A460)
  {
    sub_25A8A8910();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A460);
  }
  return result;
}

unint64_t sub_25A8A6F18()
{
  unint64_t result = qword_26A46A470;
  if (!qword_26A46A470)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A46A468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A46A470);
  }
  return result;
}

Swift::Void __swiftcall SynchronizedExecutionManager.stop()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_25A8A71BC;
  *(void *)(v3 + 24) = v2;
  v6[4] = sub_25A8A71D4;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  uint64_t v6[2] = sub_25A8A71FC;
  v6[3] = &block_descriptor_1;
  uint64_t v4 = _Block_copy(v6);
  __int16 v5 = v1;
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

void sub_25A8A70C8(uint64_t a1)
{
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25A8A8630();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A46AF08);
  uint64_t v3 = sub_25A8A8610();
  os_log_type_t v4 = sub_25A8A88D0();
  if (os_log_type_enabled(v3, v4))
  {
    __int16 v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)__int16 v5 = 0;
    _os_log_impl(&dword_25A85D000, v3, v4, "Plugin received stop signal", v5, 2u);
    MEMORY[0x261148660](v5, -1, -1);
  }

  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_25A8A71AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25A8A71BC()
{
  sub_25A8A70C8(*(void *)(v0 + 16));
}

uint64_t sub_25A8A71C4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A8A71D4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25A8A71FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
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

uint64_t SynchronizedExecutionManager.shouldStop.getter()
{
  sub_25A8A8930();
  return v1;
}

void sub_25A8A72AC(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

uint64_t sub_25A8A72B8()
{
  sub_25A8A8930();
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

uint64_t assignWithCopy for SynchronizedExecutionManager(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  __int16 v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
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

void sub_25A8A74A8(unsigned char *a1@<X8>)
{
}

uint64_t ModelMonitoringManager.init(config:executionManager:)@<X0>(void *__src@<X0>, long long *a2@<X1>, void *a3@<X8>)
{
  memcpy(a3, __src, 0x158uLL);

  return sub_25A88CB84(a2, (uint64_t)a3 + 344);
}

Swift::OpaquePointer_optional __swiftcall ModelMonitoringManager.attemptModelMonitoring()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A000);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A469F78 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25A8A8630();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A46AF08);
  id v4 = sub_25A8A8610();
  os_log_type_t v5 = sub_25A8A88E0();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25A85D000, v4, v5, "Starting model monitoring - feature-label correlation", v6, 2u);
    MEMORY[0x261148660](v6, -1, -1);
  }

  uint64_t v7 = sub_25A8A8440();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v2, 1, 1, v7);
  unint64_t v9 = (void *)sub_25A8A86A0();
  id v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v2, 1, v7) != 1)
  {
    id v10 = (void *)sub_25A8A8400();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v2, v7);
  }
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F51618]), sel_init_url_useSqlite_, v9, v10, 0);

  uint64_t v12 = self;
  uint64_t v13 = (void *)sub_25A8A8790();
  unint64_t v14 = (void *)sub_25A8A86A0();
  id v15 = objc_msgSend(v12, sel_analyzeFeatureImportanceWithFeatureStore_featureNames_labelName_, v11, v13, v14);

  if (v15)
  {
    sub_25A8A780C();
    uint64_t v16 = sub_25A8A8670();

    id v15 = (id)sub_25A8A784C(v16);
    swift_bridgeObjectRelease();
  }

  uint64_t v18 = v15;
  result.value._rawValue = v18;
  result.is_nil = v17;
  return result;
}

unint64_t sub_25A8A780C()
{
  unint64_t result = qword_26A46A020;
  if (!qword_26A46A020)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A46A020);
  }
  return result;
}

uint64_t sub_25A8A784C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A46A140);
  uint64_t result = sub_25A8A8B90();
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
    uint64_t v22 = sub_25A8A86B0();
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

uint64_t destroy for ModelMonitoringManager(id *a1)
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

uint64_t initializeWithCopy for ModelMonitoringManager(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  int64_t v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  BOOL v28 = v3;
  uint64_t v29 = *(void **)(a2 + 32);
  uint64_t v30 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v29;
  *(void *)(a1 + 40) = v30;
  int64_t v31 = *(void **)(a2 + 48);
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
  int64_t v25 = **(void (***)(uint64_t, uint64_t, uint64_t))(v18 - 8);
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

uint64_t assignWithCopy for ModelMonitoringManager(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ModelMonitoringManager(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for ModelMonitoringManager(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ModelMonitoringManager(uint64_t result, int a2, int a3)
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
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ModelMonitoringManager()
{
  return &type metadata for ModelMonitoringManager;
}

uint64_t LocalTrainingManager.init(config:executionManager:)@<X0>(void *__src@<X0>, long long *a2@<X1>, void *a3@<X8>)
{
  memcpy(a3, __src, 0x158uLL);

  return sub_25A88CB84(a2, (uint64_t)a3 + 344);
}

ValueMetadata *type metadata accessor for LocalTrainingManager()
{
  return &type metadata for LocalTrainingManager;
}

uint64_t sub_25A8A83D0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25A8A83E0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25A8A83F0()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_25A8A8400()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25A8A8410()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25A8A8420()
{
  return MEMORY[0x270EEFE60]();
}

uint64_t sub_25A8A8430()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25A8A8440()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25A8A8450()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25A8A8460()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25A8A8470()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25A8A8480()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25A8A8490()
{
  return MEMORY[0x270EF0600]();
}

uint64_t sub_25A8A84A0()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_25A8A84B0()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_25A8A84C0()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_25A8A84D0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25A8A84E0()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_25A8A84F0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25A8A8500()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_25A8A8510()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_25A8A8520()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25A8A8530()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_25A8A8540()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25A8A8550()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_25A8A8560()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25A8A8570()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25A8A8580()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25A8A8590()
{
  return MEMORY[0x270EF1290]();
}

uint64_t sub_25A8A85A0()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_25A8A85B0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25A8A85C0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25A8A85D0()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_25A8A85E0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25A8A85F0()
{
  return MEMORY[0x270F5BCE8]();
}

uint64_t sub_25A8A8600()
{
  return MEMORY[0x270F5BCF0]();
}

uint64_t sub_25A8A8610()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A8A8620()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25A8A8630()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A8A8640()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25A8A8650()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25A8A8660()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25A8A8670()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25A8A8680()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25A8A8690()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25A8A86A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25A8A86B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25A8A86C0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25A8A86D0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25A8A86E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A8A86F0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A8A8700()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A8A8710()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25A8A8720()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25A8A8740()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25A8A8750()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25A8A8760()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25A8A8770()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25A8A8780()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25A8A8790()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25A8A87A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25A8A87B0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25A8A87C0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25A8A87D0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25A8A87E0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25A8A87F0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25A8A8800()
{
  return MEMORY[0x270F9DCF0]();
}

uint64_t sub_25A8A8810()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t _s43ProactiveShareSheetDataHarvestingLighthouse31IsTaskCancelledExecutionManagerV10shouldStopSbvg_0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_25A8A8830()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_25A8A8840()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_25A8A8850()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_25A8A8860()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_25A8A8870()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_25A8A8880()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25A8A8890()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_25A8A88A0()
{
  return MEMORY[0x270F9DFC0]();
}

uint64_t sub_25A8A88B0()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_25A8A88C0()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_25A8A88D0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25A8A88E0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25A8A88F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A8A8900()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25A8A8910()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25A8A8920()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25A8A8930()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_25A8A8940()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25A8A8950()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t sub_25A8A8960()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_25A8A8970()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_25A8A8980()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25A8A8990()
{
  return MEMORY[0x270F9E3D8]();
}

uint64_t sub_25A8A89A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A8A89B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A8A89C0()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_25A8A89D0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25A8A89E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25A8A89F0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25A8A8A00()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25A8A8A10()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_25A8A8A20()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_25A8A8A30()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_25A8A8A40()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_25A8A8A50()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25A8A8A60()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25A8A8A70()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_25A8A8A80()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25A8A8A90()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A8A8AA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A8A8AB0()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_25A8A8AC0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25A8A8AD0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25A8A8AE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A8A8AF0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25A8A8B00()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25A8A8B10()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25A8A8B20()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25A8A8B30()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25A8A8B40()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A8A8B50()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A8A8B60()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_25A8A8B70()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25A8A8B80()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_25A8A8B90()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25A8A8BA0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A8A8BB0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A8A8BC0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A8A8BD0()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_25A8A8BE0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25A8A8BF0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25A8A8C00()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A8A8C10()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_25A8A8C20()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25A8A8C30()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25A8A8C40()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A8A8C50()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A8A8C60()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A8A8C70()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A8A8C80()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A8A8C90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A8A8CA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A8A8CB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25A8A8CC0()
{
  return MEMORY[0x270EF2760]();
}

uint64_t BMMLSEDurableFeatureStorefeatureNameAsString()
{
  return MEMORY[0x270F10A90]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
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
  return MEMORY[0x270EDA9D0](oslog, type);
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