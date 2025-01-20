uint64_t NTPBRecommendationBrickExposureReadFrom(uint64_t a1, uint64_t a2)
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
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

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
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
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
              goto LABEL_47;
            }
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_49;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_49:
          v38 = 16;
          goto LABEL_54;
        case 2u:
          v24 = PBReaderReadString();
          v25 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = v24;

          continue;
        case 3u:
          v26 = PBReaderReadString();
          if (v26) {
            [(id)a1 addRecommendedFeedIds:v26];
          }

          continue;
        case 4u:
          v27 = 0;
          v28 = 0;
          v19 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            v29 = *v3;
            v30 = *(void *)(a2 + v29);
            if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v30 + 1;
              v19 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                v14 = v28++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_53:
          v38 = 20;
LABEL_54:
          *(_DWORD *)(a1 + v38) = v19;
          continue;
        case 5u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        v35 = *v3;
        v36 = *(void *)(a2 + v35);
        if (v36 == -1 || v36 >= *(void *)(a2 + *v4)) {
          break;
        }
        v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_56;
        }
        v32 += 7;
        v14 = v33++ >= 9;
        if (v14)
        {
          v34 = 0;
          goto LABEL_58;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_56:
      if (*(unsigned char *)(a2 + *v5)) {
        v34 = 0;
      }
LABEL_58:
      *(unsigned char *)(a1 + 32) = v34 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL NTPBArticleInfoReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadString();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBErrorReadFrom(uint64_t a1, uint64_t a2)
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
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        v24 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
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
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
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

uint64_t NTPBForYouTodaySectionSpecificConfigReadFrom(uint64_t a1, uint64_t a2)
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
      switch((v10 >> 3))
      {
        case 0u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 1u;
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
              goto LABEL_71;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_73;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_71:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_73:
          uint64_t v55 = 8;
          goto LABEL_98;
        case 1u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 0x20u;
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
                  uint64_t v19 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_77:
          uint64_t v55 = 48;
          goto LABEL_98;
        case 2u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 4u;
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
                  uint64_t v19 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_81:
          uint64_t v55 = 24;
          goto LABEL_98;
        case 3u:
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          *(unsigned char *)(a1 + 60) |= 0x40u;
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
                  LODWORD(v36) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v36) = 0;
          }
LABEL_85:
          *(_DWORD *)(a1 + 56) = v36;
          continue;
        case 4u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 0x10u;
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
                  uint64_t v19 = 0;
                  goto LABEL_89;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_89:
          uint64_t v55 = 40;
          goto LABEL_98;
        case 5u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 8u;
          while (2)
          {
            uint64_t v47 = *v3;
            unint64_t v48 = *(void *)(a2 + v47);
            if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
              *(void *)(a2 + v47) = v48 + 1;
              v19 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                BOOL v14 = v46++ >= 9;
                if (v14)
                {
                  uint64_t v19 = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_93:
          uint64_t v55 = 32;
          goto LABEL_98;
        case 6u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 60) |= 2u;
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
        uint64_t v52 = *v3;
        unint64_t v53 = *(void *)(a2 + v52);
        if (v53 == -1 || v53 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
        *(void *)(a2 + v52) = v53 + 1;
        v19 |= (unint64_t)(v54 & 0x7F) << v50;
        if ((v54 & 0x80) == 0) {
          goto LABEL_95;
        }
        v50 += 7;
        BOOL v14 = v51++ >= 9;
        if (v14)
        {
          uint64_t v19 = 0;
          goto LABEL_97;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_95:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v19 = 0;
      }
LABEL_97:
      uint64_t v55 = 16;
LABEL_98:
      *(void *)(a1 + v55) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL NTPBUserOnboardingBeginReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  v6 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureDataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = PBReaderReadData();
        unsigned int v18 = *(void **)(a1 + 8);
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

uint64_t NTPBPrivateDataControllerSyncStateReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
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
            uint64_t v21 = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_39:
        *(void *)(a1 + 8) = v21;
      }
      else
      {
        if (v17 == 2)
        {
          unsigned int v25 = objc_alloc_init(NTPBPrivateRecordSyncState);
          [(id)a1 addRecordStates:v25];

          if (!PBReaderPlaceMark()
            || (NTPBPrivateRecordSyncStateReadFrom((id *)&v25->super.super.isa, a2) & 1) == 0)
          {
            return 0;
          }
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
          unsigned int v18 = objc_alloc_init(NTPBPrivateZoneSyncState);
          [(id)a1 addZoneStates:v18];

          if (!PBReaderPlaceMark()
            || (NTPBPrivateZoneSyncStateReadFrom((id *)&v18->super.super.isa, a2) & 1) == 0)
          {
            return 0;
          }
        }
        PBReaderRecallMark();
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBEventReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        unint64_t v17 = objc_alloc_init(NTPBEventObject);
        objc_storeStrong((id *)(a1 + 96), v17);
        if (PBReaderPlaceMark() && NTPBEventObjectReadFrom((id *)&v17->super.super.isa, a2)) {
          goto LABEL_133;
        }
        goto LABEL_235;
      case 2u:
        uint64_t v19 = PBReaderReadData();
        uint64_t v20 = 152;
        goto LABEL_161;
      case 3u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 168;
        goto LABEL_161;
      case 4u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 184;
        goto LABEL_161;
      case 5u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 224) |= 0x10u;
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
                uint64_t v23 = 0;
                goto LABEL_165;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_165:
        uint64_t v115 = 40;
        goto LABEL_218;
      case 6u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 224) |= 2u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_169;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_169:
        uint64_t v115 = 16;
        goto LABEL_218;
      case 7u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0;
        *(_DWORD *)(a1 + 224) |= 0x80u;
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
            v34 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                LODWORD(v34) = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v34) = 0;
        }
LABEL_173:
        uint64_t v116 = 88;
        goto LABEL_223;
      case 8u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 136;
        goto LABEL_161;
      case 9u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 128;
        goto LABEL_161;
      case 0xAu:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 208;
        goto LABEL_161;
      case 0xBu:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v34 = 0;
        *(_DWORD *)(a1 + 224) |= 0x100u;
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
            v34 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              v38 += 7;
              BOOL v14 = v39++ >= 9;
              if (v14)
              {
                LODWORD(v34) = 0;
                goto LABEL_177;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v34) = 0;
        }
LABEL_177:
        uint64_t v116 = 104;
        goto LABEL_223;
      case 0xCu:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v34 = 0;
        *(_DWORD *)(a1 + 224) |= 0x200u;
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
            v34 |= (unint64_t)(v47 & 0x7F) << v43;
            if (v47 < 0)
            {
              v43 += 7;
              BOOL v14 = v44++ >= 9;
              if (v14)
              {
                LODWORD(v34) = 0;
                goto LABEL_181;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v34) = 0;
        }
LABEL_181:
        uint64_t v116 = 108;
        goto LABEL_223;
      case 0xDu:
        char v48 = 0;
        unsigned int v49 = 0;
        uint64_t v34 = 0;
        *(_DWORD *)(a1 + 224) |= 0x400u;
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
            v34 |= (unint64_t)(v52 & 0x7F) << v48;
            if (v52 < 0)
            {
              v48 += 7;
              BOOL v14 = v49++ >= 9;
              if (v14)
              {
                LODWORD(v34) = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v34) = 0;
        }
LABEL_185:
        uint64_t v116 = 120;
        goto LABEL_223;
      case 0xEu:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v34 = 0;
        *(_DWORD *)(a1 + 224) |= 0x40u;
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
            v34 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              v53 += 7;
              BOOL v14 = v54++ >= 9;
              if (v14)
              {
                LODWORD(v34) = 0;
                goto LABEL_189;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v34) = 0;
        }
LABEL_189:
        uint64_t v116 = 84;
        goto LABEL_223;
      case 0xFu:
        char v58 = 0;
        unsigned int v59 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 224) |= 4u;
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
            v23 |= (unint64_t)(v62 & 0x7F) << v58;
            if (v62 < 0)
            {
              v58 += 7;
              BOOL v14 = v59++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_193;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_193:
        uint64_t v115 = 24;
        goto LABEL_218;
      case 0x10u:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 224) |= 8u;
        while (2)
        {
          uint64_t v65 = *v3;
          unint64_t v66 = *(void *)(a2 + v65);
          if (v66 == -1 || v66 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
            *(void *)(a2 + v65) = v66 + 1;
            v23 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              v63 += 7;
              BOOL v14 = v64++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_197;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_197:
        uint64_t v115 = 32;
        goto LABEL_218;
      case 0x11u:
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v70 = 0;
        *(_DWORD *)(a1 + 224) |= 0x2000u;
        while (2)
        {
          uint64_t v71 = *v3;
          unint64_t v72 = *(void *)(a2 + v71);
          if (v72 == -1 || v72 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v73 = *(unsigned char *)(*(void *)(a2 + *v7) + v72);
            *(void *)(a2 + v71) = v72 + 1;
            v70 |= (unint64_t)(v73 & 0x7F) << v68;
            if (v73 < 0)
            {
              v68 += 7;
              BOOL v14 = v69++ >= 9;
              if (v14)
              {
                uint64_t v70 = 0;
                goto LABEL_201;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v70 = 0;
        }
LABEL_201:
        BOOL v117 = v70 != 0;
        uint64_t v118 = 218;
        goto LABEL_232;
      case 0x12u:
        char v74 = 0;
        unsigned int v75 = 0;
        uint64_t v76 = 0;
        *(_DWORD *)(a1 + 224) |= 0x8000u;
        while (2)
        {
          uint64_t v77 = *v3;
          unint64_t v78 = *(void *)(a2 + v77);
          if (v78 == -1 || v78 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v79 = *(unsigned char *)(*(void *)(a2 + *v7) + v78);
            *(void *)(a2 + v77) = v78 + 1;
            v76 |= (unint64_t)(v79 & 0x7F) << v74;
            if (v79 < 0)
            {
              v74 += 7;
              BOOL v14 = v75++ >= 9;
              if (v14)
              {
                uint64_t v76 = 0;
                goto LABEL_205;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v76 = 0;
        }
LABEL_205:
        BOOL v117 = v76 != 0;
        uint64_t v118 = 220;
        goto LABEL_232;
      case 0x13u:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v82 = 0;
        *(_DWORD *)(a1 + 224) |= 0x4000u;
        while (2)
        {
          uint64_t v83 = *v3;
          unint64_t v84 = *(void *)(a2 + v83);
          if (v84 == -1 || v84 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v85 = *(unsigned char *)(*(void *)(a2 + *v7) + v84);
            *(void *)(a2 + v83) = v84 + 1;
            v82 |= (unint64_t)(v85 & 0x7F) << v80;
            if (v85 < 0)
            {
              v80 += 7;
              BOOL v14 = v81++ >= 9;
              if (v14)
              {
                uint64_t v82 = 0;
                goto LABEL_209;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v82 = 0;
        }
LABEL_209:
        BOOL v117 = v82 != 0;
        uint64_t v118 = 219;
        goto LABEL_232;
      case 0x14u:
        char v86 = 0;
        unsigned int v87 = 0;
        uint64_t v88 = 0;
        *(_DWORD *)(a1 + 224) |= 0x10000u;
        while (2)
        {
          uint64_t v89 = *v3;
          unint64_t v90 = *(void *)(a2 + v89);
          if (v90 == -1 || v90 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v91 = *(unsigned char *)(*(void *)(a2 + *v7) + v90);
            *(void *)(a2 + v89) = v90 + 1;
            v88 |= (unint64_t)(v91 & 0x7F) << v86;
            if (v91 < 0)
            {
              v86 += 7;
              BOOL v14 = v87++ >= 9;
              if (v14)
              {
                uint64_t v88 = 0;
                goto LABEL_213;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v88 = 0;
        }
LABEL_213:
        BOOL v117 = v88 != 0;
        uint64_t v118 = 221;
        goto LABEL_232;
      case 0x15u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 112;
        goto LABEL_161;
      case 0x16u:
        uint64_t v19 = PBReaderReadData();
        uint64_t v20 = 160;
        goto LABEL_161;
      case 0x17u:
        char v92 = 0;
        unsigned int v93 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 224) |= 1u;
        while (2)
        {
          uint64_t v94 = *v3;
          unint64_t v95 = *(void *)(a2 + v94);
          if (v95 == -1 || v95 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v95);
            *(void *)(a2 + v94) = v95 + 1;
            v23 |= (unint64_t)(v96 & 0x7F) << v92;
            if (v96 < 0)
            {
              v92 += 7;
              BOOL v14 = v93++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_217;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_217:
        uint64_t v115 = 8;
LABEL_218:
        *(void *)(a1 + v115) = v23;
        goto LABEL_233;
      case 0x18u:
        uint64_t v19 = PBReaderReadData();
        uint64_t v20 = 192;
        goto LABEL_161;
      case 0x19u:
        unint64_t v17 = objc_alloc_init(NTPBUserPaidSubscriptionStatus);
        [(id)a1 addUserPaidSubscriptionStatus:v17];
        if PBReaderPlaceMark() && (NTPBUserPaidSubscriptionStatusReadFrom((uint64_t)v17, a2))
        {
LABEL_133:
          PBReaderRecallMark();

LABEL_233:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_235:

        return 0;
      case 0x1Au:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 200;
        goto LABEL_161;
      case 0x1Bu:
        char v97 = 0;
        unsigned int v98 = 0;
        uint64_t v34 = 0;
        *(_DWORD *)(a1 + 224) |= 0x20u;
        while (2)
        {
          uint64_t v99 = *v3;
          unint64_t v100 = *(void *)(a2 + v99);
          if (v100 == -1 || v100 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v101 = *(unsigned char *)(*(void *)(a2 + *v7) + v100);
            *(void *)(a2 + v99) = v100 + 1;
            v34 |= (unint64_t)(v101 & 0x7F) << v97;
            if (v101 < 0)
            {
              v97 += 7;
              BOOL v14 = v98++ >= 9;
              if (v14)
              {
                LODWORD(v34) = 0;
                goto LABEL_222;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v34) = 0;
        }
LABEL_222:
        uint64_t v116 = 80;
LABEL_223:
        *(_DWORD *)(a1 + v116) = v34;
        goto LABEL_233;
      case 0x1Cu:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 72;
        goto LABEL_161;
      case 0x1Du:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 64;
        goto LABEL_161;
      case 0x1Eu:
        char v102 = 0;
        unsigned int v103 = 0;
        uint64_t v104 = 0;
        *(_DWORD *)(a1 + 224) |= 0x1000u;
        while (2)
        {
          uint64_t v105 = *v3;
          unint64_t v106 = *(void *)(a2 + v105);
          if (v106 == -1 || v106 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v107 = *(unsigned char *)(*(void *)(a2 + *v7) + v106);
            *(void *)(a2 + v105) = v106 + 1;
            v104 |= (unint64_t)(v107 & 0x7F) << v102;
            if (v107 < 0)
            {
              v102 += 7;
              BOOL v14 = v103++ >= 9;
              if (v14)
              {
                uint64_t v104 = 0;
                goto LABEL_227;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v104 = 0;
        }
LABEL_227:
        BOOL v117 = v104 != 0;
        uint64_t v118 = 217;
        goto LABEL_232;
      case 0x1Fu:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 48;
        goto LABEL_161;
      case 0x20u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 56;
        goto LABEL_161;
      case 0x21u:
        char v108 = 0;
        unsigned int v109 = 0;
        uint64_t v110 = 0;
        *(_DWORD *)(a1 + 224) |= 0x800u;
        while (2)
        {
          uint64_t v111 = *v3;
          unint64_t v112 = *(void *)(a2 + v111);
          if (v112 == -1 || v112 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v113 = *(unsigned char *)(*(void *)(a2 + *v7) + v112);
            *(void *)(a2 + v111) = v112 + 1;
            v110 |= (unint64_t)(v113 & 0x7F) << v108;
            if (v113 < 0)
            {
              v108 += 7;
              BOOL v14 = v109++ >= 9;
              if (v14)
              {
                uint64_t v110 = 0;
                goto LABEL_231;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v110 = 0;
        }
LABEL_231:
        BOOL v117 = v110 != 0;
        uint64_t v118 = 216;
LABEL_232:
        *(unsigned char *)(a1 + v118) = v117;
        goto LABEL_233;
      case 0x22u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 144;
LABEL_161:
        v114 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        goto LABEL_233;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_233;
    }
  }
}

uint64_t NTPBIssueExposureDataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v17 = PBReaderReadData();
        unsigned int v18 = *(void **)(a1 + 8);
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

uint64_t NTPBAppConfigurationResourceReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
      case 0u:
        Data = (void *)PBReaderReadData();

        id v18 = Data;
        uint64_t v19 = 24;
        goto LABEL_38;
      case 1u:
        String = (void *)PBReaderReadString();

        id v18 = String;
        uint64_t v19 = 64;
        goto LABEL_38;
      case 2u:
        unsigned int v22 = (void *)PBReaderReadString();

        id v18 = v22;
        uint64_t v19 = 16;
        goto LABEL_38;
      case 3u:
        uint64_t v23 = objc_alloc_init(NTPBDate);

        uint64_t v24 = 32;
        goto LABEL_26;
      case 4u:
        uint64_t v23 = objc_alloc_init(NTPBDate);

        uint64_t v24 = 40;
LABEL_26:
        *(void *)(a1 + v24) = v23;
        if PBReaderPlaceMark() && (NTPBDateReadFrom((uint64_t)v23, a2))
        {
          PBReaderRecallMark();
LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
        return 0;
      case 5u:
        unint64_t v25 = (void *)PBReaderReadString();

        id v18 = v25;
        uint64_t v19 = 48;
        goto LABEL_38;
      case 6u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 72) |= 1u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                uint64_t v28 = 0;
                goto LABEL_44;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_44:
        *(void *)(a1 + 8) = v28;
        goto LABEL_39;
      case 7u:
        char v32 = (void *)PBReaderReadString();

        id v18 = v32;
        uint64_t v19 = 56;
LABEL_38:
        *(void *)(a1 + v19) = v18;
        goto LABEL_39;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t NTPBPersonalizationInstanceHistoryReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
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
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(void *)(a1 + 8) = v20;
      }
      else if ((v10 >> 3))
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
      else
      {
        String = (void *)PBReaderReadString();

        *(void *)(a1 + 16) = String;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBNotificationEntityReadFrom(unsigned char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          a1[32] |= 1u;
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
              goto LABEL_46;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_48;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_48:
          uint64_t v35 = 8;
          goto LABEL_57;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          if (v24) {
            [a1 addTagId:v24];
          }

          continue;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v19 = 0;
          a1[32] |= 4u;
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
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_52:
          uint64_t v35 = 16;
          goto LABEL_57;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v19 = 0;
          a1[32] |= 2u;
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
        v19 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0) {
          goto LABEL_54;
        }
        v30 += 7;
        BOOL v14 = v31++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_56;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_56:
      uint64_t v35 = 12;
LABEL_57:
      *(_DWORD *)&a1[v35] = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBTodayResultOperationFetchInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = &OBJC_IVAR___NTPBNotificationSubscribeUnsubscribe__creativeId;
  char v8 = &OBJC_IVAR___NTPBNotificationSubscribeUnsubscribe__creativeId;
  unsigned int v9 = &OBJC_IVAR___NTPBNotificationSubscribeUnsubscribe__creativeId;
  unint64_t v10 = (int *)MEMORY[0x263F62268];
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
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    int v19 = v13 & 7;
    if (v18 || v19 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = v7[969];
        goto LABEL_99;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + v8[970]) |= 1u;
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
            char v28 = *(unsigned char *)(*(void *)(a2 + *v10) + v27);
            *(void *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              BOOL v17 = v24++ >= 9;
              if (v17)
              {
                uint64_t v25 = 0;
                goto LABEL_104;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_104:
        uint64_t v74 = v9[971];
        goto LABEL_121;
      case 3u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 136;
        goto LABEL_99;
      case 4u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 112;
        goto LABEL_99;
      case 5u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + v8[970]) |= 0x20u;
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
            char v34 = *(unsigned char *)(*(void *)(a2 + *v10) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v17 = v30++ >= 9;
              if (v17)
              {
                uint64_t v31 = 0;
                goto LABEL_108;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_108:
        BOOL v75 = v31 != 0;
        uint64_t v76 = 153;
        goto LABEL_126;
      case 6u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + v8[970]) |= 2u;
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
            char v39 = *(unsigned char *)(*(void *)(a2 + *v10) + v38);
            *(void *)(a2 + v37) = v38 + 1;
            v25 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              BOOL v17 = v36++ >= 9;
              if (v17)
              {
                uint64_t v25 = 0;
                goto LABEL_112;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_112:
        uint64_t v74 = 64;
        goto LABEL_121;
      case 7u:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + v8[970]) |= 8u;
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
            char v44 = *(unsigned char *)(*(void *)(a2 + *v10) + v43);
            *(void *)(a2 + v42) = v43 + 1;
            v25 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              BOOL v17 = v41++ >= 9;
              if (v17)
              {
                uint64_t v25 = 0;
                goto LABEL_116;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_116:
        uint64_t v74 = 80;
        goto LABEL_121;
      case 8u:
        uint64_t v45 = v8;
        unint64_t v46 = v9;
        char v47 = v7;
        char v48 = objc_alloc_init(NTPBTodayWidgetConfig);
        objc_storeStrong((id *)(a1 + 144), v48);
        if PBReaderPlaceMark() && (NTPBTodayWidgetConfigReadFrom((uint64_t)v48, a2))
        {
          PBReaderRecallMark();

          int v7 = v47;
          unsigned int v9 = v46;
          char v8 = v45;
LABEL_127:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 9u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + v8[970]) |= 4u;
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
            char v53 = *(unsigned char *)(*(void *)(a2 + *v10) + v52);
            *(void *)(a2 + v51) = v52 + 1;
            v25 |= (unint64_t)(v53 & 0x7F) << v49;
            if (v53 < 0)
            {
              v49 += 7;
              BOOL v17 = v50++ >= 9;
              if (v17)
              {
                uint64_t v25 = 0;
                goto LABEL_120;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_120:
        uint64_t v74 = 72;
LABEL_121:
        *(void *)(a1 + v74) = v25;
        goto LABEL_127;
      case 0xAu:
        uint64_t v21 = PBReaderReadData();
        uint64_t v22 = 96;
        goto LABEL_99;
      case 0xBu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 120;
        goto LABEL_99;
      case 0xCu:
        if (v19 != 2)
        {
          char v77 = 0;
          unsigned int v78 = 0;
          uint64_t v79 = 0;
          while (1)
          {
            uint64_t v80 = *v3;
            unint64_t v81 = *(void *)(a2 + v80);
            if (v81 == -1 || v81 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v82 = *(unsigned char *)(*(void *)(a2 + *v10) + v81);
            *(void *)(a2 + v80) = v81 + 1;
            v79 |= (unint64_t)(v82 & 0x7F) << v77;
            if (v82 < 0)
            {
              v77 += 7;
              BOOL v17 = v78++ >= 9;
              if (!v17) {
                continue;
              }
            }
            goto LABEL_144;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_144:
          PBRepeatedInt32Add();
          goto LABEL_127;
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          while (1)
          {
            uint64_t v58 = *v3;
            unint64_t v59 = *(void *)(a2 + v58);
            if (v59 == -1 || v59 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v60 = *(unsigned char *)(*(void *)(a2 + *v10) + v59);
            *(void *)(a2 + v58) = v59 + 1;
            v57 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v17 = v56++ >= 9;
              if (!v17) {
                continue;
              }
            }
            goto LABEL_76;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_76:
          PBRepeatedInt32Add();
        }
        goto LABEL_100;
      case 0xDu:
        if (v19 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v61 = 0;
            unsigned int v62 = 0;
            uint64_t v63 = 0;
            while (1)
            {
              uint64_t v64 = *v3;
              unint64_t v65 = *(void *)(a2 + v64);
              if (v65 == -1 || v65 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v66 = *(unsigned char *)(*(void *)(a2 + *v10) + v65);
              *(void *)(a2 + v64) = v65 + 1;
              v63 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                BOOL v17 = v62++ >= 9;
                if (!v17) {
                  continue;
                }
              }
              goto LABEL_89;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_89:
            PBRepeatedInt64Add();
          }
LABEL_100:
          PBReaderRecallMark();
        }
        else
        {
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v85 = 0;
          while (1)
          {
            uint64_t v86 = *v3;
            unint64_t v87 = *(void *)(a2 + v86);
            if (v87 == -1 || v87 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v88 = *(unsigned char *)(*(void *)(a2 + *v10) + v87);
            *(void *)(a2 + v86) = v87 + 1;
            v85 |= (unint64_t)(v88 & 0x7F) << v83;
            if (v88 < 0)
            {
              v83 += 7;
              BOOL v17 = v84++ >= 9;
              if (!v17) {
                continue;
              }
            }
            goto LABEL_146;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_146:
          PBRepeatedInt64Add();
        }
        goto LABEL_127;
      case 0xEu:
        char v67 = 0;
        unsigned int v68 = 0;
        uint64_t v69 = 0;
        *(unsigned char *)(a1 + v8[970]) |= 0x10u;
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
            char v72 = *(unsigned char *)(*(void *)(a2 + *v10) + v71);
            *(void *)(a2 + v70) = v71 + 1;
            v69 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              v67 += 7;
              BOOL v17 = v68++ >= 9;
              if (v17)
              {
                uint64_t v69 = 0;
                goto LABEL_125;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v69 = 0;
        }
LABEL_125:
        BOOL v75 = v69 != 0;
        uint64_t v76 = 152;
LABEL_126:
        *(unsigned char *)(a1 + v76) = v75;
        goto LABEL_127;
      case 0xFu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 88;
        goto LABEL_99;
      case 0x10u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 104;
LABEL_99:
        char v73 = *(void **)(a1 + v22);
        *(void *)(a1 + v22) = v21;

        goto LABEL_127;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_127;
    }
  }
}

BOOL NTPBVersionedPersonalizationVectorReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
          goto LABEL_27;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_27;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 8;
          goto LABEL_27;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_27;
        case 5u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 40;
          goto LABEL_27;
        case 6u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 32;
LABEL_27:
          int v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_28;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_28:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL NTPBVideoPlayerConfigReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v19 = 8;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
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

uint64_t NTPBTodayBannerConfigReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        String = (void *)PBReaderReadString();

        id v18 = String;
        uint64_t v19 = 72;
        goto LABEL_34;
      case 2u:
        uint64_t v21 = (void *)PBReaderReadString();

        id v18 = v21;
        uint64_t v19 = 104;
        goto LABEL_34;
      case 3u:
        uint64_t v22 = (void *)PBReaderReadString();

        id v18 = v22;
        uint64_t v19 = 56;
        goto LABEL_34;
      case 4u:
        char v23 = (void *)PBReaderReadString();

        id v18 = v23;
        uint64_t v19 = 40;
        goto LABEL_34;
      case 5u:
        unsigned int v24 = (void *)PBReaderReadString();

        id v18 = v24;
        uint64_t v19 = 32;
        goto LABEL_34;
      case 6u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 116) |= 0x10u;
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
                LODWORD(v27) = 0;
                goto LABEL_79;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v27) = 0;
        }
LABEL_79:
        uint64_t v61 = 80;
        goto LABEL_84;
      case 7u:
        uint64_t v31 = (void *)PBReaderReadString();

        id v18 = v31;
        uint64_t v19 = 88;
LABEL_34:
        *(void *)(a1 + v19) = v18;
        goto LABEL_102;
      case 8u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 116) |= 8u;
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
            v27 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                LODWORD(v27) = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v27) = 0;
        }
LABEL_83:
        uint64_t v61 = 48;
LABEL_84:
        *(_DWORD *)(a1 + v61) = v27;
        goto LABEL_102;
      case 9u:
        uint64_t v37 = objc_alloc_init(NTPBColorPair);

        *(void *)(a1 + 96) = v37;
        if (!PBReaderPlaceMark() || !NTPBColorPairReadFrom((uint64_t)v37, a2)) {
          return 0;
        }
        goto LABEL_47;
      case 0xAu:
        unint64_t v38 = objc_alloc_init(NTPBColorGradientPair);

        *(void *)(a1 + 64) = v38;
        if PBReaderPlaceMark() && (NTPBColorGradientPairReadFrom((uint64_t)v38, a2))
        {
LABEL_47:
          PBReaderRecallMark();
LABEL_102:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
        return 0;
      case 0xBu:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 116) |= 2u;
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
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v14 = v40++ >= 9;
              if (v14)
              {
                uint64_t v41 = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v41 = 0;
        }
LABEL_88:
        uint64_t v62 = 16;
        goto LABEL_97;
      case 0xCu:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 116) |= 4u;
        while (2)
        {
          uint64_t v47 = *v3;
          unint64_t v48 = *(void *)(a2 + v47);
          if (v48 == -1 || v48 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
            *(void *)(a2 + v47) = v48 + 1;
            v41 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              BOOL v14 = v46++ >= 9;
              if (v14)
              {
                uint64_t v41 = 0;
                goto LABEL_92;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v41 = 0;
        }
LABEL_92:
        uint64_t v62 = 24;
        goto LABEL_97;
      case 0xDu:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 116) |= 1u;
        while (2)
        {
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v53 + 1;
            v41 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              BOOL v14 = v51++ >= 9;
              if (v14)
              {
                uint64_t v41 = 0;
                goto LABEL_96;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v41 = 0;
        }
LABEL_96:
        uint64_t v62 = 8;
LABEL_97:
        *(void *)(a1 + v62) = v41;
        goto LABEL_102;
      case 0xEu:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v57 = 0;
        *(unsigned char *)(a1 + 116) |= 0x20u;
        while (2)
        {
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 == -1 || v59 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
            *(void *)(a2 + v58) = v59 + 1;
            v57 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v14 = v56++ >= 9;
              if (v14)
              {
                uint64_t v57 = 0;
                goto LABEL_101;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v57 = 0;
        }
LABEL_101:
        *(unsigned char *)(a1 + 112) = v57 != 0;
        goto LABEL_102;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_102;
    }
  }
}

uint64_t COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        id v18 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData);
        objc_storeStrong((id *)(a1 + 128), v18);
        if (PBReaderPlaceMark()
          && (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueDataReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
          goto LABEL_69;
        }
        goto LABEL_153;
      case 2u:
        id v18 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData);
        objc_storeStrong((id *)(a1 + 136), v18);
        if (!PBReaderPlaceMark()
          || (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureDataReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_153;
        }
        goto LABEL_69;
      case 3u:
        id v18 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData);
        objc_storeStrong((id *)(a1 + 96), v18);
        if (!PBReaderPlaceMark()
          || (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelDataReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
          goto LABEL_153;
        }
        goto LABEL_69;
      case 4u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 168;
        goto LABEL_105;
      case 5u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 188) |= 0x2000u;
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
                LODWORD(v24) = 0;
                goto LABEL_109;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_109:
        uint64_t v79 = 160;
        goto LABEL_118;
      case 6u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 188) |= 0x1000u;
        while (2)
        {
          uint64_t v31 = *v3;
          uint64_t v32 = *(void *)(a2 + v31);
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v33;
            v24 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v15 = v30++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_113;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_113:
        uint64_t v79 = 120;
        goto LABEL_118;
      case 7u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 152;
        goto LABEL_105;
      case 8u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v24 = 0;
        *(_WORD *)(a1 + 188) |= 0x800u;
        while (2)
        {
          uint64_t v37 = *v3;
          uint64_t v38 = *(void *)(a2 + v37);
          unint64_t v39 = v38 + 1;
          if (v38 == -1 || v39 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v39;
            v24 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              BOOL v15 = v36++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_117;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_117:
        uint64_t v79 = 104;
LABEL_118:
        *(_DWORD *)(a1 + v79) = v24;
        goto LABEL_151;
      case 9u:
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v43 = 0;
        *(_WORD *)(a1 + 188) |= 0x4000u;
        while (2)
        {
          uint64_t v44 = *v3;
          uint64_t v45 = *(void *)(a2 + v44);
          unint64_t v46 = v45 + 1;
          if (v45 == -1 || v46 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v46;
            v43 |= (unint64_t)(v47 & 0x7F) << v41;
            if (v47 < 0)
            {
              v41 += 7;
              BOOL v15 = v42++ >= 9;
              if (v15)
              {
                uint64_t v43 = 0;
                goto LABEL_122;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v43 = 0;
        }
LABEL_122:
        BOOL v80 = v43 != 0;
        uint64_t v81 = 184;
        goto LABEL_127;
      case 0xAu:
        char v48 = 0;
        unsigned int v49 = 0;
        uint64_t v50 = 0;
        *(_WORD *)(a1 + 188) |= 0x8000u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v53;
            v50 |= (unint64_t)(v54 & 0x7F) << v48;
            if (v54 < 0)
            {
              v48 += 7;
              BOOL v15 = v49++ >= 9;
              if (v15)
              {
                uint64_t v50 = 0;
                goto LABEL_126;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v50 = 0;
        }
LABEL_126:
        BOOL v80 = v50 != 0;
        uint64_t v81 = 185;
LABEL_127:
        *(unsigned char *)(a1 + v81) = v80;
        goto LABEL_151;
      case 0xBu:
        id v18 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLScoredTagID);
        [(id)a1 addFractionalCohortMembership:v18];
        if (PBReaderPlaceMark()
          && (COMAPPLEFELDSPARPROTOCOLScoredTagIDReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_69:
          PBReaderRecallMark();

LABEL_151:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_153:

        return 0;
      case 0xCu:
        *(_WORD *)(a1 + 188) |= 0x100u;
        uint64_t v55 = *v3;
        unint64_t v56 = *(void *)(a2 + v55);
        if (v56 <= 0xFFFFFFFFFFFFFFF7 && v56 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v56);
          *(void *)(a2 + v55) = v56 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 72;
        goto LABEL_150;
      case 0xDu:
        *(_WORD *)(a1 + 188) |= 0x20u;
        uint64_t v58 = *v3;
        unint64_t v59 = *(void *)(a2 + v58);
        if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v59);
          *(void *)(a2 + v58) = v59 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 48;
        goto LABEL_150;
      case 0xEu:
        *(_WORD *)(a1 + 188) |= 0x80u;
        uint64_t v60 = *v3;
        unint64_t v61 = *(void *)(a2 + v60);
        if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v61);
          *(void *)(a2 + v60) = v61 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 64;
        goto LABEL_150;
      case 0xFu:
        *(_WORD *)(a1 + 188) |= 4u;
        uint64_t v62 = *v3;
        unint64_t v63 = *(void *)(a2 + v62);
        if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v63);
          *(void *)(a2 + v62) = v63 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 24;
        goto LABEL_150;
      case 0x10u:
        *(_WORD *)(a1 + 188) |= 8u;
        uint64_t v64 = *v3;
        unint64_t v65 = *(void *)(a2 + v64);
        if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v65);
          *(void *)(a2 + v64) = v65 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 32;
        goto LABEL_150;
      case 0x11u:
        *(_WORD *)(a1 + 188) |= 0x40u;
        uint64_t v66 = *v3;
        unint64_t v67 = *(void *)(a2 + v66);
        if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v67);
          *(void *)(a2 + v66) = v67 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 56;
        goto LABEL_150;
      case 0x12u:
        *(_WORD *)(a1 + 188) |= 0x400u;
        uint64_t v68 = *v3;
        unint64_t v69 = *(void *)(a2 + v68);
        if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v69);
          *(void *)(a2 + v68) = v69 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 88;
        goto LABEL_150;
      case 0x13u:
        *(_WORD *)(a1 + 188) |= 2u;
        uint64_t v70 = *v3;
        unint64_t v71 = *(void *)(a2 + v70);
        if (v71 <= 0xFFFFFFFFFFFFFFF7 && v71 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v71);
          *(void *)(a2 + v70) = v71 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 16;
        goto LABEL_150;
      case 0x14u:
        *(_WORD *)(a1 + 188) |= 1u;
        uint64_t v72 = *v3;
        unint64_t v73 = *(void *)(a2 + v72);
        if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v73);
          *(void *)(a2 + v72) = v73 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 8;
        goto LABEL_150;
      case 0x15u:
        *(_WORD *)(a1 + 188) |= 0x10u;
        uint64_t v74 = *v3;
        unint64_t v75 = *(void *)(a2 + v74);
        if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v75);
          *(void *)(a2 + v74) = v75 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 40;
        goto LABEL_150;
      case 0x16u:
        *(_WORD *)(a1 + 188) |= 0x200u;
        uint64_t v76 = *v3;
        unint64_t v77 = *(void *)(a2 + v76);
        if (v77 <= 0xFFFFFFFFFFFFFFF7 && v77 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v57 = *(void *)(*(void *)(a2 + *v7) + v77);
          *(void *)(a2 + v76) = v77 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v57 = 0;
        }
        uint64_t v82 = 80;
LABEL_150:
        *(void *)(a1 + v82) = v57;
        goto LABEL_151;
      case 0x17u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 144;
        goto LABEL_105;
      case 0x18u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 176;
LABEL_105:
        unsigned int v78 = *(void **)(a1 + v21);
        *(void *)(a1 + v21) = v20;

        goto LABEL_151;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_151;
    }
  }
}

uint64_t NTPBPersonalizedSectionPresenceConfigReadFrom(uint64_t a1, unsigned char *a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)&a2[*MEMORY[0x263F62298]] < *(void *)&a2[*MEMORY[0x263F62288]])
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (a2[*v5]) {
        return a2[*v5] == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)&a2[v11];
        if (v12 == -1 || v12 >= *(void *)&a2[*v4]) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)&a2[*v7] + v12);
        *(void *)&a2[v11] = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = a2[*v5];
          goto LABEL_14;
        }
      }
      a2[*v5] = 1;
LABEL_12:
      int v15 = a2[*v5];
      if (a2[*v5]) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return a2[*v5] == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = objc_alloc_init(NTPBAbsolutePersonalizedSectionPresenceConfig);

        *(void *)(a1 + 8) = v24;
        if (!PBReaderPlaceMark() || !NTPBAbsolutePersonalizedSectionPresenceConfigReadFrom(v24, a2)) {
          return 0;
        }
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
            *(unsigned char *)(a1 + 32) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)&a2[v21];
              if (v22 == -1 || v22 >= *(void *)&a2[*v4]) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)&a2[*v7] + v22);
              *(void *)&a2[v21] = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_37;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_39;
              }
            }
            a2[*v5] = 1;
LABEL_37:
            if (a2[*v5]) {
              LODWORD(v20) = 0;
            }
LABEL_39:
            *(_DWORD *)(a1 + 16) = v20;
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
        uint64_t v25 = objc_alloc_init(NTPBRelativePersonalizedSectionPresenceConfig);

        *(void *)(a1 + 24) = v25;
        if (!PBReaderPlaceMark() || !NTPBRelativePersonalizedSectionPresenceConfigReadFrom(v25, a2)) {
          return 0;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)&a2[*v3] < *(void *)&a2[*v4]);
  }
  return a2[*v5] == 0;
}

BOOL NTPBCoefficientsReadFrom(void *a1, void *a2)
{
  v3 = a1;
  v4 = a2;
  v5 = (int *)MEMORY[0x263F62298];
  v6 = (int *)MEMORY[0x263F62288];
  int v7 = (int *)MEMORY[0x263F62270];
  if (*(void *)&v4[*MEMORY[0x263F62298]] >= *(void *)&v4[*MEMORY[0x263F62288]])
  {
LABEL_68:
    BOOL v40 = v4[*v7] == 0;
    goto LABEL_69;
  }
  char v8 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (v4[*v7]) {
      goto LABEL_68;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v5;
      uint64_t v13 = *(void *)&v4[v12];
      unint64_t v14 = v13 + 1;
      if (v13 == -1 || v14 > *(void *)&v4[*v6]) {
        break;
      }
      char v15 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
      *(void *)&v4[v12] = v14;
      v11 |= (unint64_t)(v15 & 0x7F) << v9;
      if ((v15 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      if (v10++ >= 9)
      {
        unint64_t v11 = 0;
        int v17 = v4[*v7];
        goto LABEL_14;
      }
    }
    v4[*v7] = 1;
LABEL_12:
    int v17 = v4[*v7];
    if (v4[*v7]) {
      unint64_t v11 = 0;
    }
LABEL_14:
    if (v17 || (v11 & 7) == 4) {
      goto LABEL_68;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v3[40] |= 0x20u;
        uint64_t v19 = *v5;
        unint64_t v20 = *(void *)&v4[v19];
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v20);
          *(void *)&v4[v19] = v20 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__serverScoreCoefficient;
        goto LABEL_66;
      case 2u:
        v3[40] |= 4u;
        uint64_t v22 = *v5;
        unint64_t v23 = *(void *)&v4[v22];
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v23);
          *(void *)&v4[v22] = v23 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__clientScoreCoefficient;
        goto LABEL_66;
      case 3u:
        v3[40] |= 0x80u;
        uint64_t v24 = *v5;
        unint64_t v25 = *(void *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v25);
          *(void *)&v4[v24] = v25 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__subscribedTopicScoreCoefficient;
        goto LABEL_66;
      case 4u:
        v3[40] |= 0x40u;
        uint64_t v26 = *v5;
        unint64_t v27 = *(void *)&v4[v26];
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v27);
          *(void *)&v4[v26] = v27 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__subscribedChannelScoreCoefficent;
        goto LABEL_66;
      case 5u:
        v3[40] |= 2u;
        uint64_t v28 = *v5;
        unint64_t v29 = *(void *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v29);
          *(void *)&v4[v28] = v29 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__autofavoritedScoreCoefficient;
        goto LABEL_66;
      case 6u:
        v3[40] |= 1u;
        uint64_t v30 = *v5;
        unint64_t v31 = *(void *)&v4[v30];
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v31);
          *(void *)&v4[v30] = v31 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__articleEmbeddingScoreCoefficient;
        goto LABEL_66;
      case 7u:
        v3[40] |= 0x100u;
        uint64_t v32 = *v5;
        unint64_t v33 = *(void *)&v4[v32];
        if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v33);
          *(void *)&v4[v32] = v33 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__tabiScoreCoefficient;
        goto LABEL_66;
      case 8u:
        v3[40] |= 8u;
        uint64_t v34 = *v5;
        unint64_t v35 = *(void *)&v4[v34];
        if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v35);
          *(void *)&v4[v34] = v35 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__conversionCoefficient;
        goto LABEL_66;
      case 9u:
        v3[40] |= 0x10u;
        uint64_t v36 = *v5;
        unint64_t v37 = *(void *)&v4[v36];
        if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v6])
        {
          uint64_t v21 = *(void *)(*(void *)&v4[*v8] + v37);
          *(void *)&v4[v36] = v37 + 8;
        }
        else
        {
          v4[*v7] = 1;
          uint64_t v21 = 0;
        }
        uint64_t v38 = &OBJC_IVAR___NTPBCoefficients__halfLifeCoefficient;
LABEL_66:
        *(void *)((char *)v3 + *v38) = v21;
        goto LABEL_67;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_67:
          if (*(void *)&v4[*v5] >= *(void *)&v4[*v6]) {
            goto LABEL_68;
          }
          continue;
        }
        BOOL v40 = 0;
LABEL_69:

        return v40;
    }
  }
}

BOOL NTPBReportConcernSubmissionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 3)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v20 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
          {
            unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__cancelLocation;
            goto LABEL_48;
          }
          v26 += 7;
          BOOL v24 = v27++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__cancelLocation;
            goto LABEL_50;
          }
        }
        unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__cancelLocation;
LABEL_47:
        *(unsigned char *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 4u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4))
          {
            unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__resultType;
            goto LABEL_47;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            break;
          }
          v18 += 7;
          BOOL v24 = v19++ > 8;
          if (v24)
          {
            LODWORD(v20) = 0;
            unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__resultType;
            goto LABEL_50;
          }
        }
        unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__resultType;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_51:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v31 = 0;
    unsigned int v32 = 0;
    uint64_t v20 = 0;
    *(unsigned char *)(a1 + 20) |= 2u;
    while (1)
    {
      uint64_t v33 = *v3;
      unint64_t v34 = *(void *)(a2 + v33);
      if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
      {
        unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__reportConcernLocation;
        goto LABEL_47;
      }
      char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
      *(void *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0) {
        break;
      }
      v31 += 7;
      BOOL v24 = v32++ > 8;
      if (v24)
      {
        LODWORD(v20) = 0;
        unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__reportConcernLocation;
        goto LABEL_50;
      }
    }
    unint64_t v25 = &OBJC_IVAR___NTPBReportConcernSubmission__reportConcernLocation;
LABEL_48:
    if (*(unsigned char *)(a2 + *v5)) {
      LODWORD(v20) = 0;
    }
LABEL_50:
    *(_DWORD *)(a1 + *v25) = v20;
    goto LABEL_51;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBPaidSubscriptionSheetViewReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          *(unsigned char *)(a1 + 112) |= 0x20u;
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
              goto LABEL_88;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_90;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_88:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_90:
          uint64_t v64 = 104;
          goto LABEL_120;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 112) |= 8u;
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
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_94:
          uint64_t v64 = 72;
          goto LABEL_120;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 112) |= 2u;
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
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_98:
          uint64_t v64 = 64;
          goto LABEL_120;
        case 4u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 88;
          goto LABEL_79;
        case 5u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 80;
          goto LABEL_79;
        case 6u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 8;
          goto LABEL_79;
        case 7u:
          uint64_t v34 = PBReaderReadData();
          uint64_t v35 = 16;
          goto LABEL_79;
        case 8u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 112) |= 0x10u;
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
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_102:
          uint64_t v64 = 76;
          goto LABEL_120;
        case 9u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v43 = 0;
          *(unsigned char *)(a1 + 112) |= 0x80u;
          while (2)
          {
            uint64_t v44 = *v3;
            unint64_t v45 = *(void *)(a2 + v44);
            if (v45 == -1 || v45 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
              *(void *)(a2 + v44) = v45 + 1;
              v43 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  uint64_t v43 = 0;
                  goto LABEL_106;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v43 = 0;
          }
LABEL_106:
          BOOL v65 = v43 != 0;
          uint64_t v66 = 109;
          goto LABEL_111;
        case 0xAu:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          *(unsigned char *)(a1 + 112) |= 0x40u;
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
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                BOOL v14 = v48++ >= 9;
                if (v14)
                {
                  uint64_t v49 = 0;
                  goto LABEL_110;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v49 = 0;
          }
LABEL_110:
          BOOL v65 = v49 != 0;
          uint64_t v66 = 108;
LABEL_111:
          *(unsigned char *)(a1 + v66) = v65;
          continue;
        case 0xBu:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 56;
          goto LABEL_79;
        case 0xCu:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 112) |= 4u;
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
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_115:
          uint64_t v64 = 68;
          goto LABEL_120;
        case 0xDu:
          uint64_t v34 = PBReaderReadData();
          uint64_t v35 = 96;
          goto LABEL_79;
        case 0xEu:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 24;
          goto LABEL_79;
        case 0xFu:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 32;
          goto LABEL_79;
        case 0x10u:
          uint64_t v34 = PBReaderReadString();
          uint64_t v35 = 40;
LABEL_79:
          uint64_t v58 = *(void **)(a1 + v35);
          *(void *)(a1 + v35) = v34;

          continue;
        case 0x11u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 112) |= 1u;
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
        uint64_t v61 = *v3;
        unint64_t v62 = *(void *)(a2 + v61);
        if (v62 == -1 || v62 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v63 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
        *(void *)(a2 + v61) = v62 + 1;
        v19 |= (unint64_t)(v63 & 0x7F) << v59;
        if ((v63 & 0x80) == 0) {
          goto LABEL_117;
        }
        v59 += 7;
        BOOL v14 = v60++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_119;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_117:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_119:
      uint64_t v64 = 48;
LABEL_120:
      *(_DWORD *)(a1 + v64) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBReadingListAddRemoveReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v18 = 48;
        goto LABEL_230;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 264;
        goto LABEL_230;
      case 3u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x10u;
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
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_253:
        uint64_t v171 = 40;
        goto LABEL_360;
      case 4u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(_DWORD *)(a1 + 344) |= 0x4000000u;
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
                goto LABEL_257;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v27 = 0;
        }
LABEL_257:
        BOOL v172 = v27 != 0;
        uint64_t v173 = 343;
        goto LABEL_342;
      case 7u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x20u;
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
            v21 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_261;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_261:
        uint64_t v171 = 56;
        goto LABEL_360;
      case 8u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x80u;
        while (2)
        {
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 1;
            v21 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              BOOL v14 = v38++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_265;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_265:
        uint64_t v171 = 88;
        goto LABEL_360;
      case 9u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 192;
        goto LABEL_230;
      case 0xAu:
        PBReaderReadString();
        unsigned int v42 = (COMAPPLEFELDSPARPROTOCOLScoredTagID *)objc_claimAutoreleasedReturnValue();
        if (v42) {
          [(id)a1 addNamedEntities:v42];
        }
        goto LABEL_247;
      case 0xBu:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x1000u;
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
            v21 |= (unint64_t)(v47 & 0x7F) << v43;
            if (v47 < 0)
            {
              v43 += 7;
              BOOL v14 = v44++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_269;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_269:
        uint64_t v171 = 256;
        goto LABEL_360;
      case 0xCu:
        char v48 = 0;
        unsigned int v49 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x40u;
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
            v21 |= (unint64_t)(v52 & 0x7F) << v48;
            if (v52 < 0)
            {
              v48 += 7;
              BOOL v14 = v49++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_273;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_273:
        uint64_t v171 = 60;
        goto LABEL_360;
      case 0xEu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 272;
        goto LABEL_230;
      case 0xFu:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x4000u;
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
            v21 |= (unint64_t)(v57 & 0x7F) << v53;
            if (v57 < 0)
            {
              v53 += 7;
              BOOL v14 = v54++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_277;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_277:
        uint64_t v171 = 328;
        goto LABEL_360;
      case 0x10u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 288;
        goto LABEL_230;
      case 0x11u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 296;
        goto LABEL_230;
      case 0x12u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 304;
        goto LABEL_230;
      case 0x13u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 280;
        goto LABEL_230;
      case 0x14u:
        char v58 = 0;
        unsigned int v59 = 0;
        uint64_t v60 = 0;
        *(_DWORD *)(a1 + 344) |= 0x40000u;
        while (2)
        {
          uint64_t v61 = *v3;
          unint64_t v62 = *(void *)(a2 + v61);
          if (v62 == -1 || v62 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v63 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
            *(void *)(a2 + v61) = v62 + 1;
            v60 |= (unint64_t)(v63 & 0x7F) << v58;
            if (v63 < 0)
            {
              v58 += 7;
              BOOL v14 = v59++ >= 9;
              if (v14)
              {
                uint64_t v60 = 0;
                goto LABEL_281;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v60 = 0;
        }
LABEL_281:
        BOOL v172 = v60 != 0;
        uint64_t v173 = 335;
        goto LABEL_342;
      case 0x15u:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x200u;
        while (2)
        {
          uint64_t v66 = *v3;
          unint64_t v67 = *(void *)(a2 + v66);
          if (v67 == -1 || v67 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v67 + 1;
            v21 |= (unint64_t)(v68 & 0x7F) << v64;
            if (v68 < 0)
            {
              v64 += 7;
              BOOL v14 = v65++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_285;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_285:
        uint64_t v171 = 104;
        goto LABEL_360;
      case 0x16u:
        char v69 = 0;
        unsigned int v70 = 0;
        uint64_t v71 = 0;
        *(_DWORD *)(a1 + 344) |= 2u;
        while (2)
        {
          uint64_t v72 = *v3;
          unint64_t v73 = *(void *)(a2 + v72);
          if (v73 == -1 || v73 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v74 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v73 + 1;
            v71 |= (unint64_t)(v74 & 0x7F) << v69;
            if (v74 < 0)
            {
              v69 += 7;
              BOOL v14 = v70++ >= 9;
              if (v14)
              {
                uint64_t v71 = 0;
                goto LABEL_289;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v71 = 0;
        }
LABEL_289:
        uint64_t v174 = 16;
        goto LABEL_355;
      case 0x17u:
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v77 = 0;
        *(_DWORD *)(a1 + 344) |= 0x80000u;
        while (2)
        {
          uint64_t v78 = *v3;
          unint64_t v79 = *(void *)(a2 + v78);
          if (v79 == -1 || v79 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v80 = *(unsigned char *)(*(void *)(a2 + *v7) + v79);
            *(void *)(a2 + v78) = v79 + 1;
            v77 |= (unint64_t)(v80 & 0x7F) << v75;
            if (v80 < 0)
            {
              v75 += 7;
              BOOL v14 = v76++ >= 9;
              if (v14)
              {
                uint64_t v77 = 0;
                goto LABEL_293;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v77 = 0;
        }
LABEL_293:
        BOOL v172 = v77 != 0;
        uint64_t v173 = 336;
        goto LABEL_342;
      case 0x18u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 64;
        goto LABEL_230;
      case 0x19u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 72;
        goto LABEL_230;
      case 0x1Au:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 96;
        goto LABEL_230;
      case 0x1Bu:
        char v81 = 0;
        unsigned int v82 = 0;
        uint64_t v83 = 0;
        *(_DWORD *)(a1 + 344) |= 0x400000u;
        while (2)
        {
          uint64_t v84 = *v3;
          unint64_t v85 = *(void *)(a2 + v84);
          if (v85 == -1 || v85 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v86 = *(unsigned char *)(*(void *)(a2 + *v7) + v85);
            *(void *)(a2 + v84) = v85 + 1;
            v83 |= (unint64_t)(v86 & 0x7F) << v81;
            if (v86 < 0)
            {
              v81 += 7;
              BOOL v14 = v82++ >= 9;
              if (v14)
              {
                uint64_t v83 = 0;
                goto LABEL_297;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v83 = 0;
        }
LABEL_297:
        BOOL v172 = v83 != 0;
        uint64_t v173 = 339;
        goto LABEL_342;
      case 0x1Cu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 232;
        goto LABEL_230;
      case 0x1Du:
        char v87 = 0;
        unsigned int v88 = 0;
        uint64_t v89 = 0;
        *(_DWORD *)(a1 + 344) |= 0x800000u;
        while (2)
        {
          uint64_t v90 = *v3;
          unint64_t v91 = *(void *)(a2 + v90);
          if (v91 == -1 || v91 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v92 = *(unsigned char *)(*(void *)(a2 + *v7) + v91);
            *(void *)(a2 + v90) = v91 + 1;
            v89 |= (unint64_t)(v92 & 0x7F) << v87;
            if (v92 < 0)
            {
              v87 += 7;
              BOOL v14 = v88++ >= 9;
              if (v14)
              {
                uint64_t v89 = 0;
                goto LABEL_301;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v89 = 0;
        }
LABEL_301:
        BOOL v172 = v89 != 0;
        uint64_t v173 = 340;
        goto LABEL_342;
      case 0x1Eu:
        char v93 = 0;
        unsigned int v94 = 0;
        uint64_t v95 = 0;
        *(_DWORD *)(a1 + 344) |= 0x20000u;
        while (2)
        {
          uint64_t v96 = *v3;
          unint64_t v97 = *(void *)(a2 + v96);
          if (v97 == -1 || v97 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v98 = *(unsigned char *)(*(void *)(a2 + *v7) + v97);
            *(void *)(a2 + v96) = v97 + 1;
            v95 |= (unint64_t)(v98 & 0x7F) << v93;
            if (v98 < 0)
            {
              v93 += 7;
              BOOL v14 = v94++ >= 9;
              if (v14)
              {
                uint64_t v95 = 0;
                goto LABEL_305;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v95 = 0;
        }
LABEL_305:
        BOOL v172 = v95 != 0;
        uint64_t v173 = 334;
        goto LABEL_342;
      case 0x1Fu:
        char v99 = 0;
        unsigned int v100 = 0;
        uint64_t v101 = 0;
        *(_DWORD *)(a1 + 344) |= 0x8000u;
        while (2)
        {
          uint64_t v102 = *v3;
          unint64_t v103 = *(void *)(a2 + v102);
          if (v103 == -1 || v103 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v104 = *(unsigned char *)(*(void *)(a2 + *v7) + v103);
            *(void *)(a2 + v102) = v103 + 1;
            v101 |= (unint64_t)(v104 & 0x7F) << v99;
            if (v104 < 0)
            {
              v99 += 7;
              BOOL v14 = v100++ >= 9;
              if (v14)
              {
                uint64_t v101 = 0;
                goto LABEL_309;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v101 = 0;
        }
LABEL_309:
        BOOL v172 = v101 != 0;
        uint64_t v173 = 332;
        goto LABEL_342;
      case 0x20u:
        char v105 = 0;
        unsigned int v106 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x800u;
        while (2)
        {
          uint64_t v107 = *v3;
          unint64_t v108 = *(void *)(a2 + v107);
          if (v108 == -1 || v108 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v109 = *(unsigned char *)(*(void *)(a2 + *v7) + v108);
            *(void *)(a2 + v107) = v108 + 1;
            v21 |= (unint64_t)(v109 & 0x7F) << v105;
            if (v109 < 0)
            {
              v105 += 7;
              BOOL v14 = v106++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_313;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_313:
        uint64_t v171 = 216;
        goto LABEL_360;
      case 0x21u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 224;
        goto LABEL_230;
      case 0x22u:
        char v110 = 0;
        unsigned int v111 = 0;
        uint64_t v112 = 0;
        *(_DWORD *)(a1 + 344) |= 0x100000u;
        while (2)
        {
          uint64_t v113 = *v3;
          unint64_t v114 = *(void *)(a2 + v113);
          if (v114 == -1 || v114 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v115 = *(unsigned char *)(*(void *)(a2 + *v7) + v114);
            *(void *)(a2 + v113) = v114 + 1;
            v112 |= (unint64_t)(v115 & 0x7F) << v110;
            if (v115 < 0)
            {
              v110 += 7;
              BOOL v14 = v111++ >= 9;
              if (v14)
              {
                uint64_t v112 = 0;
                goto LABEL_317;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v112 = 0;
        }
LABEL_317:
        BOOL v172 = v112 != 0;
        uint64_t v173 = 337;
        goto LABEL_342;
      case 0x23u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 120;
        goto LABEL_230;
      case 0x24u:
        char v116 = 0;
        unsigned int v117 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x400u;
        while (2)
        {
          uint64_t v118 = *v3;
          unint64_t v119 = *(void *)(a2 + v118);
          if (v119 == -1 || v119 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v120 = *(unsigned char *)(*(void *)(a2 + *v7) + v119);
            *(void *)(a2 + v118) = v119 + 1;
            v21 |= (unint64_t)(v120 & 0x7F) << v116;
            if (v120 < 0)
            {
              v116 += 7;
              BOOL v14 = v117++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_321;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_321:
        uint64_t v171 = 128;
        goto LABEL_360;
      case 0x25u:
        char v121 = 0;
        unsigned int v122 = 0;
        uint64_t v123 = 0;
        *(_DWORD *)(a1 + 344) |= 0x10000u;
        while (2)
        {
          uint64_t v124 = *v3;
          unint64_t v125 = *(void *)(a2 + v124);
          if (v125 == -1 || v125 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v126 = *(unsigned char *)(*(void *)(a2 + *v7) + v125);
            *(void *)(a2 + v124) = v125 + 1;
            v123 |= (unint64_t)(v126 & 0x7F) << v121;
            if (v126 < 0)
            {
              v121 += 7;
              BOOL v14 = v122++ >= 9;
              if (v14)
              {
                uint64_t v123 = 0;
                goto LABEL_325;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v123 = 0;
        }
LABEL_325:
        BOOL v172 = v123 != 0;
        uint64_t v173 = 333;
        goto LABEL_342;
      case 0x26u:
        char v127 = 0;
        unsigned int v128 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x2000u;
        while (2)
        {
          uint64_t v129 = *v3;
          unint64_t v130 = *(void *)(a2 + v129);
          if (v130 == -1 || v130 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v131 = *(unsigned char *)(*(void *)(a2 + *v7) + v130);
            *(void *)(a2 + v129) = v130 + 1;
            v21 |= (unint64_t)(v131 & 0x7F) << v127;
            if (v131 < 0)
            {
              v127 += 7;
              BOOL v14 = v128++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_329;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_329:
        uint64_t v171 = 312;
        goto LABEL_360;
      case 0x27u:
        char v132 = 0;
        unsigned int v133 = 0;
        uint64_t v134 = 0;
        *(_DWORD *)(a1 + 344) |= 0x2000000u;
        while (2)
        {
          uint64_t v135 = *v3;
          unint64_t v136 = *(void *)(a2 + v135);
          if (v136 == -1 || v136 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v137 = *(unsigned char *)(*(void *)(a2 + *v7) + v136);
            *(void *)(a2 + v135) = v136 + 1;
            v134 |= (unint64_t)(v137 & 0x7F) << v132;
            if (v137 < 0)
            {
              v132 += 7;
              BOOL v14 = v133++ >= 9;
              if (v14)
              {
                uint64_t v134 = 0;
                goto LABEL_333;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v134 = 0;
        }
LABEL_333:
        BOOL v172 = v134 != 0;
        uint64_t v173 = 342;
        goto LABEL_342;
      case 0x28u:
        char v138 = 0;
        unsigned int v139 = 0;
        uint64_t v140 = 0;
        *(_DWORD *)(a1 + 344) |= 0x1000000u;
        while (2)
        {
          uint64_t v141 = *v3;
          unint64_t v142 = *(void *)(a2 + v141);
          if (v142 == -1 || v142 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v143 = *(unsigned char *)(*(void *)(a2 + *v7) + v142);
            *(void *)(a2 + v141) = v142 + 1;
            v140 |= (unint64_t)(v143 & 0x7F) << v138;
            if (v143 < 0)
            {
              v138 += 7;
              BOOL v14 = v139++ >= 9;
              if (v14)
              {
                uint64_t v140 = 0;
                goto LABEL_337;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v140 = 0;
        }
LABEL_337:
        BOOL v172 = v140 != 0;
        uint64_t v173 = 341;
        goto LABEL_342;
      case 0x29u:
        char v144 = 0;
        unsigned int v145 = 0;
        uint64_t v146 = 0;
        *(_DWORD *)(a1 + 344) |= 0x200000u;
        while (2)
        {
          uint64_t v147 = *v3;
          unint64_t v148 = *(void *)(a2 + v147);
          if (v148 == -1 || v148 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v149 = *(unsigned char *)(*(void *)(a2 + *v7) + v148);
            *(void *)(a2 + v147) = v148 + 1;
            v146 |= (unint64_t)(v149 & 0x7F) << v144;
            if (v149 < 0)
            {
              v144 += 7;
              BOOL v14 = v145++ >= 9;
              if (v14)
              {
                uint64_t v146 = 0;
                goto LABEL_341;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v146 = 0;
        }
LABEL_341:
        BOOL v172 = v146 != 0;
        uint64_t v173 = 338;
LABEL_342:
        *(unsigned char *)(a1 + v173) = v172;
        goto LABEL_361;
      case 0x2Au:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 208;
        goto LABEL_230;
      case 0x2Bu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 240;
        goto LABEL_230;
      case 0x2Cu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 248;
        goto LABEL_230;
      case 0x2Du:
        unsigned int v42 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLScoredTagID);
        [(id)a1 addFractionalCohortMembership:v42];
        if (!PBReaderPlaceMark()
          || (COMAPPLEFELDSPARPROTOCOLScoredTagIDReadFrom((uint64_t)v42, a2) & 1) == 0)
        {
          goto LABEL_363;
        }
        goto LABEL_246;
      case 0x2Eu:
        char v150 = 0;
        unsigned int v151 = 0;
        uint64_t v71 = 0;
        *(_DWORD *)(a1 + 344) |= 8u;
        while (2)
        {
          uint64_t v152 = *v3;
          unint64_t v153 = *(void *)(a2 + v152);
          if (v153 == -1 || v153 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v154 = *(unsigned char *)(*(void *)(a2 + *v7) + v153);
            *(void *)(a2 + v152) = v153 + 1;
            v71 |= (unint64_t)(v154 & 0x7F) << v150;
            if (v154 < 0)
            {
              v150 += 7;
              BOOL v14 = v151++ >= 9;
              if (v14)
              {
                uint64_t v71 = 0;
                goto LABEL_346;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v71 = 0;
        }
LABEL_346:
        uint64_t v174 = 32;
        goto LABEL_355;
      case 0x2Fu:
        char v155 = 0;
        unsigned int v156 = 0;
        uint64_t v71 = 0;
        *(_DWORD *)(a1 + 344) |= 1u;
        while (2)
        {
          uint64_t v157 = *v3;
          unint64_t v158 = *(void *)(a2 + v157);
          if (v158 == -1 || v158 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v159 = *(unsigned char *)(*(void *)(a2 + *v7) + v158);
            *(void *)(a2 + v157) = v158 + 1;
            v71 |= (unint64_t)(v159 & 0x7F) << v155;
            if (v159 < 0)
            {
              v155 += 7;
              BOOL v14 = v156++ >= 9;
              if (v14)
              {
                uint64_t v71 = 0;
                goto LABEL_350;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v71 = 0;
        }
LABEL_350:
        uint64_t v174 = 8;
        goto LABEL_355;
      case 0x30u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 152;
        goto LABEL_230;
      case 0x31u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 168;
        goto LABEL_230;
      case 0x32u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 144;
        goto LABEL_230;
      case 0x33u:
        char v160 = 0;
        unsigned int v161 = 0;
        uint64_t v71 = 0;
        *(_DWORD *)(a1 + 344) |= 4u;
        while (2)
        {
          uint64_t v162 = *v3;
          unint64_t v163 = *(void *)(a2 + v162);
          if (v163 == -1 || v163 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v164 = *(unsigned char *)(*(void *)(a2 + *v7) + v163);
            *(void *)(a2 + v162) = v163 + 1;
            v71 |= (unint64_t)(v164 & 0x7F) << v160;
            if (v164 < 0)
            {
              v160 += 7;
              BOOL v14 = v161++ >= 9;
              if (v14)
              {
                uint64_t v71 = 0;
                goto LABEL_354;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v71 = 0;
        }
LABEL_354:
        uint64_t v174 = 24;
LABEL_355:
        *(void *)(a1 + v174) = v71;
        goto LABEL_361;
      case 0x34u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 160;
        goto LABEL_230;
      case 0x35u:
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 136;
LABEL_230:
        v165 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_361;
      case 0x3Fu:
        unsigned int v42 = objc_alloc_init(NTPBIssueData);
        objc_storeStrong((id *)(a1 + 176), v42);
        if (!PBReaderPlaceMark() || (NTPBIssueDataReadFrom((uint64_t)v42, a2) & 1) == 0) {
          goto LABEL_363;
        }
        goto LABEL_246;
      case 0x40u:
        unsigned int v42 = objc_alloc_init(NTPBIssueExposureData);
        objc_storeStrong((id *)(a1 + 184), v42);
        if (!PBReaderPlaceMark() || (NTPBIssueExposureDataReadFrom((uint64_t)v42, a2) & 1) == 0) {
          goto LABEL_363;
        }
        goto LABEL_246;
      case 0x41u:
        char v166 = 0;
        unsigned int v167 = 0;
        uint64_t v21 = 0;
        *(_DWORD *)(a1 + 344) |= 0x100u;
        while (2)
        {
          uint64_t v168 = *v3;
          unint64_t v169 = *(void *)(a2 + v168);
          if (v169 == -1 || v169 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v170 = *(unsigned char *)(*(void *)(a2 + *v7) + v169);
            *(void *)(a2 + v168) = v169 + 1;
            v21 |= (unint64_t)(v170 & 0x7F) << v166;
            if (v170 < 0)
            {
              v166 += 7;
              BOOL v14 = v167++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_359;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_359:
        uint64_t v171 = 92;
LABEL_360:
        *(_DWORD *)(a1 + v171) = v21;
        goto LABEL_361;
      case 0x42u:
        unsigned int v42 = objc_alloc_init(NTPBChannelData);
        objc_storeStrong((id *)(a1 + 80), v42);
        if PBReaderPlaceMark() && (NTPBChannelDataReadFrom((uint64_t)v42, a2))
        {
LABEL_246:
          PBReaderRecallMark();
LABEL_247:

LABEL_361:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_363:

        return 0;
      case 0x43u:
        PBReaderReadString();
        unsigned int v42 = (COMAPPLEFELDSPARPROTOCOLScoredTagID *)objc_claimAutoreleasedReturnValue();
        if (v42) {
          [(id)a1 addTopicIds:v42];
        }
        goto LABEL_247;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_361;
    }
  }
}

uint64_t NTPBPrivateZoneSyncStateReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        String = (void *)PBReaderReadString();

        id v18 = String;
        uint64_t v19 = 4;
        goto LABEL_23;
      case 2u:
        Data = (void *)PBReaderReadData();

        id v18 = Data;
        uint64_t v19 = 1;
LABEL_23:
        a1[v19] = v18;
        goto LABEL_29;
      case 3u:
        uint64_t v22 = objc_alloc_init(NTPBDate);

        uint64_t v23 = 2;
        goto LABEL_26;
      case 4u:
        uint64_t v22 = objc_alloc_init(NTPBDate);

        uint64_t v23 = 3;
LABEL_26:
        a1[v23] = v22;
        if PBReaderPlaceMark() && (NTPBDateReadFrom((uint64_t)v22, a2))
        {
          PBReaderRecallMark();
LABEL_29:
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
        goto LABEL_29;
    }
  }
}

uint64_t NTPBArticleViewNotwReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              *(unsigned char *)(a1 + 56) |= 1u;
              break;
            case 2u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 8;
              goto LABEL_36;
            case 3u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 40;
              goto LABEL_36;
            case 4u:
              *(unsigned char *)(a1 + 56) |= 2u;
              uint64_t v28 = *v3;
              unint64_t v29 = *(void *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)(a2 + *v4))
              {
                int v30 = *(_DWORD *)(*(void *)(a2 + *v7) + v29);
                *(void *)(a2 + v28) = v29 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v30 = 0;
              }
              *(_DWORD *)(a1 + 20) = v30;
              goto LABEL_37;
            case 5u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 32;
              goto LABEL_36;
            case 6u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 24;
              goto LABEL_36;
            case 7u:
              uint64_t v26 = PBReaderReadString();
              uint64_t v27 = 48;
LABEL_36:
              uint64_t v31 = *(void **)(a1 + v27);
              *(void *)(a1 + v27) = v26;

              goto LABEL_37;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_37:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
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
              goto LABEL_40;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_42;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_42:
          *(_DWORD *)(a1 + 16) = v20;
          goto LABEL_37;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBArticleScrollReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
        goto LABEL_45;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 80;
        goto LABEL_45;
      case 3u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 24;
        goto LABEL_45;
      case 4u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 32;
        goto LABEL_45;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 120;
        goto LABEL_45;
      case 6u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 160) |= 1u;
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
                LODWORD(v23) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_73:
        *(_DWORD *)(a1 + 88) = v23;
        goto LABEL_85;
      case 7u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 144;
        goto LABEL_45;
      case 8u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 128;
        goto LABEL_45;
      case 9u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 96;
        goto LABEL_45;
      case 0xAu:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 40;
        goto LABEL_45;
      case 0xBu:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(unsigned char *)(a1 + 160) |= 0x10u;
        while (2)
        {
          uint64_t v31 = *v3;
          uint64_t v32 = *(void *)(a2 + v31);
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              BOOL v15 = v29++ >= 9;
              if (v15)
              {
                uint64_t v30 = 0;
                goto LABEL_77;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_77:
        *(unsigned char *)(a1 + 156) = v30 != 0;
        goto LABEL_85;
      case 0xCu:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 112;
LABEL_45:
        unint64_t v35 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_85;
      case 0xDu:
        *(unsigned char *)(a1 + 160) |= 8u;
        uint64_t v36 = *v3;
        unint64_t v37 = *(void *)(a2 + v36);
        if (v37 <= 0xFFFFFFFFFFFFFFFBLL && v37 + 4 <= *(void *)(a2 + *v4))
        {
          int v38 = *(_DWORD *)(*(void *)(a2 + *v7) + v37);
          *(void *)(a2 + v36) = v37 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v38 = 0;
        }
        uint64_t v44 = 152;
        goto LABEL_84;
      case 0xEu:
        *(unsigned char *)(a1 + 160) |= 4u;
        uint64_t v39 = *v3;
        unint64_t v40 = *(void *)(a2 + v39);
        if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(void *)(a2 + *v4))
        {
          int v38 = *(_DWORD *)(*(void *)(a2 + *v7) + v40);
          *(void *)(a2 + v39) = v40 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v38 = 0;
        }
        uint64_t v44 = 136;
        goto LABEL_84;
      case 0xFu:
        *(unsigned char *)(a1 + 160) |= 2u;
        uint64_t v41 = *v3;
        unint64_t v42 = *(void *)(a2 + v41);
        if (v42 <= 0xFFFFFFFFFFFFFFFBLL && v42 + 4 <= *(void *)(a2 + *v4))
        {
          int v38 = *(_DWORD *)(*(void *)(a2 + *v7) + v42);
          *(void *)(a2 + v41) = v42 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v38 = 0;
        }
        uint64_t v44 = 104;
LABEL_84:
        *(_DWORD *)(a1 + v44) = v38;
        goto LABEL_85;
      case 0x10u:
        char v43 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLScoredTagID);
        [(id)a1 addFractionalCohortMembership:v43];
        if (!PBReaderPlaceMark()
          || (COMAPPLEFELDSPARPROTOCOLScoredTagIDReadFrom((uint64_t)v43, a2) & 1) == 0)
        {
          goto LABEL_87;
        }
        goto LABEL_69;
      case 0x11u:
        char v43 = objc_alloc_init(NTPBAlternateHeadline);
        objc_storeStrong((id *)(a1 + 8), v43);
        if (!PBReaderPlaceMark() || !NTPBAlternateHeadlineReadFrom((uint64_t)v43, a2)) {
          goto LABEL_87;
        }
        goto LABEL_69;
      case 0x12u:
        char v43 = objc_alloc_init(NTPBIssueData);
        objc_storeStrong((id *)(a1 + 56), v43);
        if (!PBReaderPlaceMark() || (NTPBIssueDataReadFrom((uint64_t)v43, a2) & 1) == 0) {
          goto LABEL_87;
        }
        goto LABEL_69;
      case 0x13u:
        char v43 = objc_alloc_init(NTPBIssueViewData);
        objc_storeStrong((id *)(a1 + 72), v43);
        if (!PBReaderPlaceMark() || (NTPBIssueViewDataReadFrom((uint64_t)v43, a2) & 1) == 0) {
          goto LABEL_87;
        }
        goto LABEL_69;
      case 0x14u:
        char v43 = objc_alloc_init(NTPBIssueExposureData);
        objc_storeStrong((id *)(a1 + 64), v43);
        if PBReaderPlaceMark() && (NTPBIssueExposureDataReadFrom((uint64_t)v43, a2))
        {
LABEL_69:
          PBReaderRecallMark();

LABEL_85:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_87:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_85;
    }
  }
}

uint64_t NTPBBundleIdMappingMissReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v18 = *(void **)(a1 + 8);
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

uint64_t NTPBTodayResultOperationInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        *(_DWORD *)(a1 + 140) |= 0x80u;
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
        uint64_t v137 = 64;
        goto LABEL_223;
      case 2u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(_DWORD *)(a1 + 140) |= 0x40000u;
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
                goto LABEL_153;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_153:
        BOOL v133 = v23 != 0;
        uint64_t v134 = 137;
        goto LABEL_202;
      case 3u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(_DWORD *)(a1 + 140) |= 0x10000u;
        while (2)
        {
          uint64_t v31 = *v3;
          uint64_t v32 = *(void *)(a2 + v31);
          unint64_t v33 = v32 + 1;
          if (v32 == -1 || v33 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              BOOL v15 = v29++ >= 9;
              if (v15)
              {
                uint64_t v30 = 0;
                goto LABEL_157;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_157:
        BOOL v133 = v30 != 0;
        uint64_t v134 = 135;
        goto LABEL_202;
      case 4u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v37 = 0;
        *(_DWORD *)(a1 + 140) |= 0x20000u;
        while (2)
        {
          uint64_t v38 = *v3;
          uint64_t v39 = *(void *)(a2 + v38);
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v40;
            v37 |= (unint64_t)(v41 & 0x7F) << v35;
            if (v41 < 0)
            {
              v35 += 7;
              BOOL v15 = v36++ >= 9;
              if (v15)
              {
                uint64_t v37 = 0;
                goto LABEL_161;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v37 = 0;
        }
LABEL_161:
        BOOL v133 = v37 != 0;
        uint64_t v134 = 136;
        goto LABEL_202;
      case 5u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v44 = 0;
        *(_DWORD *)(a1 + 140) |= 0x200u;
        while (2)
        {
          uint64_t v45 = *v3;
          uint64_t v46 = *(void *)(a2 + v45);
          unint64_t v47 = v46 + 1;
          if (v46 == -1 || v47 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v47;
            v44 |= (unint64_t)(v48 & 0x7F) << v42;
            if (v48 < 0)
            {
              v42 += 7;
              BOOL v15 = v43++ >= 9;
              if (v15)
              {
                uint64_t v44 = 0;
                goto LABEL_165;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v44 = 0;
        }
LABEL_165:
        uint64_t v135 = 80;
        goto LABEL_207;
      case 6u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v44 = 0;
        *(_DWORD *)(a1 + 140) |= 0x100u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v53;
            v44 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (v15)
              {
                uint64_t v44 = 0;
                goto LABEL_169;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v44 = 0;
        }
LABEL_169:
        uint64_t v135 = 72;
        goto LABEL_207;
      case 7u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v44 = 0;
        *(_DWORD *)(a1 + 140) |= 0x20u;
        while (2)
        {
          uint64_t v57 = *v3;
          uint64_t v58 = *(void *)(a2 + v57);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
            *(void *)(a2 + v57) = v59;
            v44 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                uint64_t v44 = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v44 = 0;
        }
LABEL_173:
        uint64_t v135 = 48;
        goto LABEL_207;
      case 9u:
        unint64_t v62 = objc_alloc_init(NTPBSectionSlotCostInfo);
        objc_storeStrong((id *)(a1 + 120), v62);
        if (!PBReaderPlaceMark() || !NTPBSectionSlotCostInfoReadFrom((uint64_t)v62, a2)) {
          goto LABEL_226;
        }
        goto LABEL_133;
      case 0xAu:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v65 = 0;
        *(_DWORD *)(a1 + 140) |= 0x8000u;
        while (2)
        {
          uint64_t v66 = *v3;
          uint64_t v67 = *(void *)(a2 + v66);
          unint64_t v68 = v67 + 1;
          if (v67 == -1 || v68 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v68;
            v65 |= (unint64_t)(v69 & 0x7F) << v63;
            if (v69 < 0)
            {
              v63 += 7;
              BOOL v15 = v64++ >= 9;
              if (v15)
              {
                uint64_t v65 = 0;
                goto LABEL_177;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v65 = 0;
        }
LABEL_177:
        BOOL v133 = v65 != 0;
        uint64_t v134 = 134;
        goto LABEL_202;
      case 0xBu:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v72 = 0;
        *(_DWORD *)(a1 + 140) |= 0x2000u;
        while (2)
        {
          uint64_t v73 = *v3;
          uint64_t v74 = *(void *)(a2 + v73);
          unint64_t v75 = v74 + 1;
          if (v74 == -1 || v75 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v76 = *(unsigned char *)(*(void *)(a2 + *v7) + v74);
            *(void *)(a2 + v73) = v75;
            v72 |= (unint64_t)(v76 & 0x7F) << v70;
            if (v76 < 0)
            {
              v70 += 7;
              BOOL v15 = v71++ >= 9;
              if (v15)
              {
                uint64_t v72 = 0;
                goto LABEL_181;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v72 = 0;
        }
LABEL_181:
        BOOL v133 = v72 != 0;
        uint64_t v134 = 132;
        goto LABEL_202;
      case 0xCu:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v79 = 0;
        *(_DWORD *)(a1 + 140) |= 0x80000u;
        while (2)
        {
          uint64_t v80 = *v3;
          uint64_t v81 = *(void *)(a2 + v80);
          unint64_t v82 = v81 + 1;
          if (v81 == -1 || v82 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
            *(void *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              BOOL v15 = v78++ >= 9;
              if (v15)
              {
                uint64_t v79 = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v79 = 0;
        }
LABEL_185:
        BOOL v133 = v79 != 0;
        uint64_t v134 = 138;
        goto LABEL_202;
      case 0xDu:
        uint64_t v84 = PBReaderReadString();
        uint64_t v85 = 88;
        goto LABEL_130;
      case 0xFu:
        char v86 = 0;
        unsigned int v87 = 0;
        uint64_t v44 = 0;
        *(_DWORD *)(a1 + 140) |= 4u;
        while (2)
        {
          uint64_t v88 = *v3;
          uint64_t v89 = *(void *)(a2 + v88);
          unint64_t v90 = v89 + 1;
          if (v89 == -1 || v90 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v91 = *(unsigned char *)(*(void *)(a2 + *v7) + v89);
            *(void *)(a2 + v88) = v90;
            v44 |= (unint64_t)(v91 & 0x7F) << v86;
            if (v91 < 0)
            {
              v86 += 7;
              BOOL v15 = v87++ >= 9;
              if (v15)
              {
                uint64_t v44 = 0;
                goto LABEL_189;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v44 = 0;
        }
LABEL_189:
        uint64_t v135 = 24;
        goto LABEL_207;
      case 0x10u:
        char v92 = 0;
        unsigned int v93 = 0;
        uint64_t v94 = 0;
        *(_DWORD *)(a1 + 140) |= 0x800u;
        while (2)
        {
          uint64_t v95 = *v3;
          uint64_t v96 = *(void *)(a2 + v95);
          unint64_t v97 = v96 + 1;
          if (v96 == -1 || v97 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v98 = *(unsigned char *)(*(void *)(a2 + *v7) + v96);
            *(void *)(a2 + v95) = v97;
            v94 |= (unint64_t)(v98 & 0x7F) << v92;
            if (v98 < 0)
            {
              v92 += 7;
              BOOL v15 = v93++ >= 9;
              if (v15)
              {
                LODWORD(v94) = 0;
                goto LABEL_193;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v94) = 0;
        }
LABEL_193:
        uint64_t v136 = 100;
        goto LABEL_212;
      case 0x11u:
        char v99 = 0;
        unsigned int v100 = 0;
        uint64_t v94 = 0;
        *(_DWORD *)(a1 + 140) |= 0x400u;
        while (2)
        {
          uint64_t v101 = *v3;
          uint64_t v102 = *(void *)(a2 + v101);
          unint64_t v103 = v102 + 1;
          if (v102 == -1 || v103 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v104 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
            *(void *)(a2 + v101) = v103;
            v94 |= (unint64_t)(v104 & 0x7F) << v99;
            if (v104 < 0)
            {
              v99 += 7;
              BOOL v15 = v100++ >= 9;
              if (v15)
              {
                LODWORD(v94) = 0;
                goto LABEL_197;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v94) = 0;
        }
LABEL_197:
        uint64_t v136 = 96;
        goto LABEL_212;
      case 0x12u:
        char v105 = 0;
        unsigned int v106 = 0;
        uint64_t v107 = 0;
        *(_DWORD *)(a1 + 140) |= 0x4000u;
        while (2)
        {
          uint64_t v108 = *v3;
          uint64_t v109 = *(void *)(a2 + v108);
          unint64_t v110 = v109 + 1;
          if (v109 == -1 || v110 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v111 = *(unsigned char *)(*(void *)(a2 + *v7) + v109);
            *(void *)(a2 + v108) = v110;
            v107 |= (unint64_t)(v111 & 0x7F) << v105;
            if (v111 < 0)
            {
              v105 += 7;
              BOOL v15 = v106++ >= 9;
              if (v15)
              {
                uint64_t v107 = 0;
                goto LABEL_201;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v107 = 0;
        }
LABEL_201:
        BOOL v133 = v107 != 0;
        uint64_t v134 = 133;
LABEL_202:
        *(unsigned char *)(a1 + v134) = v133;
        goto LABEL_224;
      case 0x13u:
        char v112 = 0;
        unsigned int v113 = 0;
        uint64_t v44 = 0;
        *(_DWORD *)(a1 + 140) |= 2u;
        while (2)
        {
          uint64_t v114 = *v3;
          uint64_t v115 = *(void *)(a2 + v114);
          unint64_t v116 = v115 + 1;
          if (v115 == -1 || v116 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v117 = *(unsigned char *)(*(void *)(a2 + *v7) + v115);
            *(void *)(a2 + v114) = v116;
            v44 |= (unint64_t)(v117 & 0x7F) << v112;
            if (v117 < 0)
            {
              v112 += 7;
              BOOL v15 = v113++ >= 9;
              if (v15)
              {
                uint64_t v44 = 0;
                goto LABEL_206;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v44 = 0;
        }
LABEL_206:
        uint64_t v135 = 16;
LABEL_207:
        *(void *)(a1 + v135) = v44;
        goto LABEL_224;
      case 0x14u:
        *(_DWORD *)(a1 + 140) |= 0x40u;
        uint64_t v118 = *v3;
        unint64_t v119 = *(void *)(a2 + v118);
        if (v119 <= 0xFFFFFFFFFFFFFFF7 && v119 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v119);
          *(void *)(a2 + v118) = v119 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v137 = 56;
        goto LABEL_223;
      case 0x15u:
        uint64_t v84 = PBReaderReadString();
        uint64_t v85 = 104;
LABEL_130:
        char v120 = *(void **)(a1 + v85);
        *(void *)(a1 + v85) = v84;

        goto LABEL_224;
      case 0x16u:
        unint64_t v62 = objc_alloc_init(NTPBTodayModuleContentRequest);
        objc_storeStrong((id *)(a1 + 112), v62);
        if PBReaderPlaceMark() && (NTPBTodayModuleContentRequestReadFrom((uint64_t)v62, a2))
        {
LABEL_133:
          PBReaderRecallMark();

LABEL_224:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_226:

        return 0;
      case 0x17u:
        *(_DWORD *)(a1 + 140) |= 0x10u;
        uint64_t v121 = *v3;
        unint64_t v122 = *(void *)(a2 + v121);
        if (v122 <= 0xFFFFFFFFFFFFFFF7 && v122 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v122);
          *(void *)(a2 + v121) = v122 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v137 = 40;
        goto LABEL_223;
      case 0x18u:
        *(_DWORD *)(a1 + 140) |= 8u;
        uint64_t v123 = *v3;
        unint64_t v124 = *(void *)(a2 + v123);
        if (v124 <= 0xFFFFFFFFFFFFFFF7 && v124 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v124);
          *(void *)(a2 + v123) = v124 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v137 = 32;
        goto LABEL_223;
      case 0x19u:
        char v125 = 0;
        unsigned int v126 = 0;
        uint64_t v94 = 0;
        *(_DWORD *)(a1 + 140) |= 0x1000u;
        while (2)
        {
          uint64_t v127 = *v3;
          uint64_t v128 = *(void *)(a2 + v127);
          unint64_t v129 = v128 + 1;
          if (v128 == -1 || v129 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v130 = *(unsigned char *)(*(void *)(a2 + *v7) + v128);
            *(void *)(a2 + v127) = v129;
            v94 |= (unint64_t)(v130 & 0x7F) << v125;
            if (v130 < 0)
            {
              v125 += 7;
              BOOL v15 = v126++ >= 9;
              if (v15)
              {
                LODWORD(v94) = 0;
                goto LABEL_211;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v94) = 0;
        }
LABEL_211:
        uint64_t v136 = 128;
LABEL_212:
        *(_DWORD *)(a1 + v136) = v94;
        goto LABEL_224;
      case 0x1Au:
        *(_DWORD *)(a1 + 140) |= 1u;
        uint64_t v131 = *v3;
        unint64_t v132 = *(void *)(a2 + v131);
        if (v132 <= 0xFFFFFFFFFFFFFFF7 && v132 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v132);
          *(void *)(a2 + v131) = v132 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v137 = 8;
LABEL_223:
        *(void *)(a1 + v137) = v20;
        goto LABEL_224;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_224;
    }
  }
}

BOOL NTPBDiscoverMoreVideosInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) >= 3)
      {
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
      }
      else
      {
        uint64_t v17 = off_26444ED68[(int)(v10 >> 3)];
        String = (void *)PBReaderReadString();

        *(void *)(a1 + *v17) = String;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL COMAPPLEFELDSPARPROTOCOLLIVERPOOLTopicCohortScoreReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = *(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
LABEL_24:

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
    uint64_t v18 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortListReadFrom(v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBTelemetryReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
  char v8 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
  unsigned int v9 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
  unint64_t v10 = (int *)MEMORY[0x263F62268];
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
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = v7[211];
        goto LABEL_58;
      case 2u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = v8[212];
        goto LABEL_58;
      case 3u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = v9[213];
        goto LABEL_58;
      case 4u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 24;
        goto LABEL_58;
      case 5u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 144) |= 1u;
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
            char v27 = *(unsigned char *)(*(void *)(a2 + *v10) + v26);
            *(void *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              BOOL v17 = v23++ >= 9;
              if (v17)
              {
                uint64_t v24 = 0;
                goto LABEL_64;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v24 = 0;
        }
LABEL_64:
        *(void *)(a1 + 8) = v24;
        goto LABEL_59;
      case 7u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 48;
        goto LABEL_58;
      case 8u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 72;
        goto LABEL_58;
      case 9u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 32;
        goto LABEL_58;
      case 0xAu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 80;
        goto LABEL_58;
      case 0xBu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 88;
        goto LABEL_58;
      case 0xCu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 104;
        goto LABEL_58;
      case 0xDu:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 144) |= 4u;
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
            char v34 = *(unsigned char *)(*(void *)(a2 + *v10) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v17 = v30++ >= 9;
              if (v17)
              {
                LODWORD(v31) = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v31) = 0;
        }
LABEL_68:
        uint64_t v45 = 112;
        goto LABEL_73;
      case 0xEu:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 144) |= 2u;
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
            char v39 = *(unsigned char *)(*(void *)(a2 + *v10) + v38);
            *(void *)(a2 + v37) = v38 + 1;
            v31 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              BOOL v17 = v36++ >= 9;
              if (v17)
              {
                LODWORD(v31) = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v31) = 0;
        }
LABEL_72:
        uint64_t v45 = 40;
LABEL_73:
        *(_DWORD *)(a1 + v45) = v31;
        goto LABEL_59;
      case 0xFu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 128;
        goto LABEL_58;
      case 0x10u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 136;
        goto LABEL_58;
      case 0x11u:
        unint64_t v40 = v9;
        char v41 = v8;
        char v42 = v7;
        unsigned int v43 = objc_alloc_init(NTPBTelemetryNetworkEventGroup);
        [(id)a1 addNetworkEventGroups:v43];
        if PBReaderPlaceMark() && (NTPBTelemetryNetworkEventGroupReadFrom((uint64_t)v43, a2))
        {
          PBReaderRecallMark();

          int v7 = v42;
          char v8 = v41;
          unsigned int v9 = v40;
LABEL_59:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0x12u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 16;
LABEL_58:
        uint64_t v44 = *(void **)(a1 + v21);
        *(void *)(a1 + v21) = v20;

        goto LABEL_59;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_59;
    }
  }
}

BOOL NTPBPublisherWebAccessOptInRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_27;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_27;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_27;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_27;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_27;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_27:
          unint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_28;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_28:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextDataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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

uint64_t NTPBPrefetchConfigReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          *(unsigned char *)(a1 + 36) |= 8u;
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
              goto LABEL_60;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_62;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_62:
          BOOL v56 = v20 != 0;
          uint64_t v57 = 32;
          goto LABEL_75;
        case 2u:
          *(unsigned char *)(a1 + 36) |= 1u;
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
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(unsigned char *)(a1 + 36) |= 0x20u;
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
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
              *(void *)(a2 + v32) = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v15 = v30++ >= 9;
                if (v15)
                {
                  uint64_t v31 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v31 = 0;
          }
LABEL_66:
          BOOL v56 = v31 != 0;
          uint64_t v57 = 34;
          goto LABEL_75;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
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
              char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
              *(void *)(a2 + v39) = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v15 = v37++ >= 9;
                if (v15)
                {
                  uint64_t v38 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v38 = 0;
          }
LABEL_70:
          uint64_t v58 = 16;
          goto LABEL_80;
        case 5u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          *(unsigned char *)(a1 + 36) |= 0x10u;
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
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                BOOL v15 = v44++ >= 9;
                if (v15)
                {
                  uint64_t v45 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v45 = 0;
          }
LABEL_74:
          BOOL v56 = v45 != 0;
          uint64_t v57 = 33;
LABEL_75:
          *(unsigned char *)(a1 + v57) = v56;
          continue;
        case 6u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v38 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
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
        uint64_t v52 = *v3;
        uint64_t v53 = *(void *)(a2 + v52);
        unint64_t v54 = v53 + 1;
        if (v53 == -1 || v54 > *(void *)(a2 + *v4)) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
        *(void *)(a2 + v52) = v54;
        v38 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0) {
          goto LABEL_77;
        }
        v50 += 7;
        BOOL v15 = v51++ >= 9;
        if (v15)
        {
          uint64_t v38 = 0;
          goto LABEL_79;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_77:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v38 = 0;
      }
LABEL_79:
      uint64_t v58 = 24;
LABEL_80:
      *(void *)(a1 + v58) = v38;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBScoreProfilesReadFrom(uint64_t a1, unsigned char *a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)&a2[*MEMORY[0x263F62298]] < *(void *)&a2[*MEMORY[0x263F62288]])
  {
    int v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (a2[*v5]) {
        return a2[*v5] == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)&a2[v11];
        if (v12 == -1 || v12 >= *(void *)&a2[*v4]) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)&a2[*v7] + v12);
        *(void *)&a2[v11] = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = a2[*v5];
          goto LABEL_14;
        }
      }
      a2[*v5] = 1;
LABEL_12:
      int v15 = a2[*v5];
      if (a2[*v5]) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return a2[*v5] == 0;
      }
      if ((v10 >> 3) == 2)
      {
        char v17 = objc_alloc_init(NTPBScoreProfile);

        uint64_t v18 = 16;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        char v17 = objc_alloc_init(NTPBScoreProfile);

        uint64_t v18 = 8;
      }
      *(void *)(a1 + v18) = v17;
      if (!PBReaderPlaceMark() || (NTPBScoreProfileReadFrom((uint64_t)v17, a2) & 1) == 0) {
        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)&a2[*v3] < *(void *)&a2[*v4]);
  }
  return a2[*v5] == 0;
}

BOOL NTPBLanguageConfigReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v18 = 10;
        goto LABEL_56;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 9;
        goto LABEL_56;
      case 3u:
        unsigned int v19 = objc_alloc_init(NTPBCategory);
        objc_storeStrong(a1 + 17, v19);
        if (!PBReaderPlaceMark() || !NTPBCategoryReadFrom((char *)v19, a2)) {
          goto LABEL_64;
        }
        goto LABEL_59;
      case 4u:
        PBReaderReadString();
        unsigned int v19 = (NTPBCategory *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [a1 addPreSubscribedFeedIds:v19];
        }
        goto LABEL_60;
      case 5u:
        PBReaderReadString();
        unsigned int v19 = (NTPBCategory *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [a1 addOnboardingTagIds:v19];
        }
        goto LABEL_60;
      case 6u:
        unsigned int v19 = objc_alloc_init(NTPBTopStoriesConfig);
        objc_storeStrong(a1 + 21, v19);
        if (!PBReaderPlaceMark() || (NTPBTopStoriesConfigReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_64;
        }
        goto LABEL_59;
      case 7u:
        PBReaderReadString();
        unsigned int v19 = (NTPBCategory *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [a1 addPreSubscribedNotificationsChannelIds:v19];
        }
        goto LABEL_60;
      case 8u:
        unsigned int v19 = objc_alloc_init(NTPBNotificationChannel);
        [a1 addRecommendedNotificationChannels:v19];
        if (!PBReaderPlaceMark() || (NTPBNotificationChannelReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_64;
        }
        goto LABEL_59;
      case 9u:
        unsigned int v19 = objc_alloc_init(NTPBCoverArticlesConfig);
        objc_storeStrong(a1 + 4, v19);
        if (!PBReaderPlaceMark() || (NTPBCoverArticlesConfigReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_64;
        }
        goto LABEL_59;
      case 0xAu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 1;
        goto LABEL_56;
      case 0xBu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_56;
      case 0xCu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 3;
        goto LABEL_56;
      case 0xDu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 23;
        goto LABEL_56;
      case 0xEu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 7;
        goto LABEL_56;
      case 0xFu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 18;
        goto LABEL_56;
      case 0x10u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
        goto LABEL_56;
      case 0x11u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 5;
        goto LABEL_56;
      case 0x12u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 6;
        goto LABEL_56;
      case 0x13u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 2;
        goto LABEL_56;
      case 0x14u:
        PBReaderReadString();
        unsigned int v19 = (NTPBCategory *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          [a1 addMediaSharingBlacklistedChannelIds:v19];
        }
        goto LABEL_60;
      case 0x15u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 20;
        goto LABEL_56;
      case 0x16u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 22;
        goto LABEL_56;
      case 0x17u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 12;
LABEL_56:
        unsigned int v19 = (NTPBCategory *)a1[v18];
        a1[v18] = (id)v17;
        goto LABEL_60;
      case 0x18u:
        unsigned int v19 = objc_alloc_init(NTPBVideoPlayerConfig);
        objc_storeStrong(a1 + 19, v19);
        if (PBReaderPlaceMark() && NTPBVideoPlayerConfigReadFrom((uint64_t)v19, a2))
        {
LABEL_59:
          PBReaderRecallMark();
LABEL_60:

LABEL_61:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_64:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_61;
    }
  }
}

uint64_t NTPBPullToRefreshReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        char v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
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

BOOL NTPBSessionBatchReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        unsigned int v18 = objc_alloc_init(NTPBEvent);
        [(id)a1 addEvents:v18];
        if (!PBReaderPlaceMark() || (NTPBEventReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_33:

          return 0;
        }
LABEL_27:
        PBReaderRecallMark();
LABEL_28:

        goto LABEL_30;
      }
      if (v17 == 1)
      {
        unsigned int v18 = objc_alloc_init(NTPBSession);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (NTPBSessionReadFrom(v18, a2) & 1) == 0) {
          goto LABEL_33;
        }
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = PBReaderReadData();
    unsigned int v18 = *(NTPBEvent **)(a1 + 16);
    *(void *)(a1 + 16) = v19;
    goto LABEL_28;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBTodayWidgetSessionReadFrom(unsigned char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        int v16 = v10 & 7;
        if (!v15 && v16 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              a1[60] |= 1u;
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
                  goto LABEL_54;
                }
                v18 += 7;
                BOOL v14 = v19++ >= 9;
                if (v14)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_56;
                }
              }
              *(unsigned char *)(a2 + *v5) = 1;
LABEL_54:
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v20) = 0;
              }
LABEL_56:
              uint64_t v36 = 40;
              goto LABEL_61;
            case 2u:
              char v24 = 0;
              unsigned int v25 = 0;
              uint64_t v20 = 0;
              a1[60] |= 2u;
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
                      LODWORD(v20) = 0;
                      goto LABEL_60;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v20) = 0;
              }
LABEL_60:
              uint64_t v36 = 56;
LABEL_61:
              *(_DWORD *)&a1[v36] = v20;
              goto LABEL_72;
            case 3u:
              if (v16 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
                {
                  char v29 = 0;
                  unsigned int v30 = 0;
                  uint64_t v31 = 0;
                  while (1)
                  {
                    uint64_t v32 = *v3;
                    unint64_t v33 = *(void *)(a2 + v32);
                    if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
                      break;
                    }
                    char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
                    *(void *)(a2 + v32) = v33 + 1;
                    v31 |= (unint64_t)(v34 & 0x7F) << v29;
                    if (v34 < 0)
                    {
                      v29 += 7;
                      BOOL v14 = v30++ >= 9;
                      if (!v14) {
                        continue;
                      }
                    }
                    goto LABEL_47;
                  }
                  *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
                  PBRepeatedInt32Add();
                }
                PBReaderRecallMark();
              }
              else
              {
                char v37 = 0;
                unsigned int v38 = 0;
                uint64_t v39 = 0;
                while (1)
                {
                  uint64_t v40 = *v3;
                  unint64_t v41 = *(void *)(a2 + v40);
                  if (v41 == -1 || v41 >= *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
                  *(void *)(a2 + v40) = v41 + 1;
                  v39 |= (unint64_t)(v42 & 0x7F) << v37;
                  if (v42 < 0)
                  {
                    v37 += 7;
                    BOOL v14 = v38++ >= 9;
                    if (!v14) {
                      continue;
                    }
                  }
                  goto LABEL_71;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_71:
                PBRepeatedInt32Add();
              }
LABEL_72:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            case 4u:
              char v35 = PBReaderReadString();
              if (v35) {
                [a1 addWidgetSectionIdsExposed:v35];
              }
              goto LABEL_52;
            case 5u:
              char v35 = PBReaderReadString();
              if (v35) {
                [a1 addCountOfArticlesExposedEachSection:v35];
              }
LABEL_52:

              goto LABEL_72;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_72;
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

uint64_t NTPBExternalAnalyticsConfigReadFrom(unsigned char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v18 = 8;
        goto LABEL_24;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_24;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
LABEL_24:
        uint64_t v20 = *(void **)&a1[v18];
        *(void *)&a1[v18] = v17;

        goto LABEL_44;
      case 4u:
        uint64_t v21 = objc_alloc_init(NTPBExternalAnalyticsQueryParameterConfig);
        [a1 addQueryParameterConfig:v21];
        if (PBReaderPlaceMark() && NTPBExternalAnalyticsQueryParameterConfigReadFrom((uint64_t)v21, a2))
        {
          PBReaderRecallMark();
LABEL_39:

LABEL_44:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 5u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        a1[60] |= 1u;
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
                goto LABEL_43;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v24 = 0;
        }
LABEL_43:
        a1[56] = v24 != 0;
        goto LABEL_44;
      case 6u:
        PBReaderReadString();
        uint64_t v21 = (NTPBExternalAnalyticsQueryParameterConfig *)objc_claimAutoreleasedReturnValue();
        if (v21) {
          [a1 addProxyHostNames:v21];
        }
        goto LABEL_39;
      case 7u:
        PBReaderReadString();
        uint64_t v21 = (NTPBExternalAnalyticsQueryParameterConfig *)objc_claimAutoreleasedReturnValue();
        if (v21) {
          [a1 addVpnProfileNames:v21];
        }
        goto LABEL_39;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_44;
    }
  }
}

uint64_t COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelDataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + 8) = v19 != 0;
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

uint64_t NTPBArticleContentExpirationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 3)
      {
        unsigned int v23 = objc_alloc_init(NTPBTagExpiration);
        [(id)a1 addTagsExpirationList:v23];
        if (!PBReaderPlaceMark() || (NTPBTagExpirationReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 2)
      {
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
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_35:
        *(void *)(a1 + 8) = v19;
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

uint64_t NTPBTodayPersonalizationEventReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
  char v8 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
  unsigned int v9 = (int *)MEMORY[0x263F62268];
  unint64_t v10 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
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
      char v17 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
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
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *((unsigned char *)a1 + v7[325]) |= 0x20u;
        while (1)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4)) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)(a2 + *v9) + v25);
          *(void *)(a2 + v24) = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_67;
          }
          v21 += 7;
          BOOL v18 = v22++ >= 9;
          if (v18)
          {
            LODWORD(v23) = 0;
            goto LABEL_69;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_67:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_69:
        *(_DWORD *)((char *)a1 + v8[326]) = v23;
        goto LABEL_87;
      case 2u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = v10[327];
        goto LABEL_58;
      case 3u:
        uint64_t v31 = v7;
        uint64_t v32 = v10;
        unint64_t v33 = v8;
        char v34 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLScoredTagID);
        [a1 addHeadlineTopics:v34];
        if (PBReaderPlaceMark()
          && (COMAPPLEFELDSPARPROTOCOLScoredTagIDReadFrom((uint64_t)v34, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          char v8 = v33;
          unint64_t v10 = v32;
          int v7 = v31;
LABEL_87:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 4u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 64;
        goto LABEL_58;
      case 5u:
        *((unsigned char *)a1 + v7[325]) |= 1u;
        uint64_t v35 = *v3;
        unint64_t v36 = *(void *)(a2 + v35);
        if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v37 = *(void *)(*(void *)(a2 + *v9) + v36);
          *(void *)(a2 + v35) = v36 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v37 = 0;
        }
        a1[1] = v37;
        goto LABEL_87;
      case 6u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *((unsigned char *)a1 + v7[325]) |= 4u;
        while (2)
        {
          uint64_t v41 = *v3;
          uint64_t v42 = *(void *)(a2 + v41);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + *v9) + v42);
            *(void *)(a2 + v41) = v43;
            v40 |= (unint64_t)(v44 & 0x7F) << v38;
            if (v44 < 0)
            {
              v38 += 7;
              BOOL v18 = v39++ >= 9;
              if (v18)
              {
                uint64_t v40 = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v40 = 0;
        }
LABEL_73:
        uint64_t v64 = 3;
        goto LABEL_86;
      case 7u:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v40 = 0;
        *((unsigned char *)a1 + v7[325]) |= 8u;
        while (2)
        {
          uint64_t v47 = *v3;
          uint64_t v48 = *(void *)(a2 + v47);
          unint64_t v49 = v48 + 1;
          if (v48 == -1 || v49 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + *v9) + v48);
            *(void *)(a2 + v47) = v49;
            v40 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              BOOL v18 = v46++ >= 9;
              if (v18)
              {
                uint64_t v40 = 0;
                goto LABEL_77;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v40 = 0;
        }
LABEL_77:
        uint64_t v64 = 4;
        goto LABEL_86;
      case 8u:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v40 = 0;
        *((unsigned char *)a1 + v7[325]) |= 0x10u;
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
            char v56 = *(unsigned char *)(*(void *)(a2 + *v9) + v54);
            *(void *)(a2 + v53) = v55;
            v40 |= (unint64_t)(v56 & 0x7F) << v51;
            if (v56 < 0)
            {
              v51 += 7;
              BOOL v18 = v52++ >= 9;
              if (v18)
              {
                uint64_t v40 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v40 = 0;
        }
LABEL_81:
        uint64_t v64 = 5;
        goto LABEL_86;
      case 9u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = 80;
LABEL_58:
        uint64_t v57 = *(void **)((char *)a1 + v30);
        *(void *)((char *)a1 + v30) = v29;

        goto LABEL_87;
      case 0xAu:
        char v58 = 0;
        unsigned int v59 = 0;
        uint64_t v40 = 0;
        *((unsigned char *)a1 + v7[325]) |= 2u;
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
            char v63 = *(unsigned char *)(*(void *)(a2 + *v9) + v61);
            *(void *)(a2 + v60) = v62;
            v40 |= (unint64_t)(v63 & 0x7F) << v58;
            if (v63 < 0)
            {
              v58 += 7;
              BOOL v18 = v59++ >= 9;
              if (v18)
              {
                uint64_t v40 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v40 = 0;
        }
LABEL_85:
        uint64_t v64 = 2;
LABEL_86:
        a1[v64] = v40;
        goto LABEL_87;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_87;
    }
  }
}

uint64_t NTPBTodayPersonalizationUpdateReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        char v17 = objc_alloc_init(NTPBTodayPersonalizationEvent);
        [a1 addEvents:v17];
        if (!PBReaderPlaceMark() || (NTPBTodayPersonalizationEventReadFrom(v17, a2) & 1) == 0)
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

uint64_t NTPBRestorePaidSubscriptionItemReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            uint64_t v21 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v21 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadString();
        BOOL v18 = *(void **)(a1 + 8);
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

uint64_t COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueDataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          BOOL v18 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = v17;

          continue;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
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
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_42:
          *(unsigned char *)(a1 + 32) = v22 != 0;
          continue;
        case 3u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        case 4u:
          uint64_t v32 = PBReaderReadString();
          if (v32) {
            [(id)a1 addTopicIds:v32];
          }

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
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 == -1 || v30 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0) {
          goto LABEL_44;
        }
        v26 += 7;
        BOOL v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v28) = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v28) = 0;
      }
LABEL_46:
      *(_DWORD *)(a1 + 16) = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBIssueViewContextDataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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

uint64_t NTPBTodaySectionIdentifierToGroupTypesReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        if (v16 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v21 = 0;
            unsigned int v22 = 0;
            uint64_t v23 = 0;
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
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v14 = v22++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_33;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
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
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_45;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
          PBRepeatedInt32Add();
        }
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v18;
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

uint64_t NTPBExternalAnalyticsEventSendReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          *(unsigned char *)(a1 + 64) |= 1u;
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
              goto LABEL_42;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_44;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_42:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_44:
          uint64_t v32 = 24;
          goto LABEL_49;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 2u;
          break;
        case 3u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 16;
          goto LABEL_40;
        case 4u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 40;
          goto LABEL_40;
        case 5u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 8;
          goto LABEL_40;
        case 6u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 56;
          goto LABEL_40;
        case 7u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 32;
LABEL_40:
          unint64_t v31 = *(void **)(a1 + v30);
          *(void *)(a1 + v30) = v29;

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
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
        *(void *)(a2 + v26) = v27 + 1;
        v19 |= (unint64_t)(v28 & 0x7F) << v24;
        if ((v28 & 0x80) == 0) {
          goto LABEL_46;
        }
        v24 += 7;
        BOOL v14 = v25++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_48;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_46:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_48:
      uint64_t v32 = 48;
LABEL_49:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBTodaySectionsMappingReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        char v17 = objc_alloc_init(NTPBTodaySectionIdentifierToGroupTypes);
        [a1 addIdentifiers:v17];
        if (!PBReaderPlaceMark()
          || (NTPBTodaySectionIdentifierToGroupTypesReadFrom((uint64_t)v17, a2) & 1) == 0)
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

uint64_t NTPBTodayWidgetHeadlineExposureReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
  char v8 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
  unsigned int v9 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure__computedGlobalScoreCoefficient;
  unint64_t v10 = (int *)MEMORY[0x263F62268];
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
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = v7[361];
        goto LABEL_86;
      case 2u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = v8[362];
        goto LABEL_86;
      case 3u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = v9[363];
        goto LABEL_86;
      case 4u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 100) |= 0x40u;
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
            char v28 = *(unsigned char *)(*(void *)(a2 + *v10) + v27);
            *(void *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              BOOL v17 = v24++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_90:
        uint64_t v69 = 72;
        goto LABEL_119;
      case 5u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 100) |= 8u;
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
            char v33 = *(unsigned char *)(*(void *)(a2 + *v10) + v32);
            *(void *)(a2 + v31) = v32 + 1;
            v25 |= (unint64_t)(v33 & 0x7F) << v29;
            if (v33 < 0)
            {
              v29 += 7;
              BOOL v17 = v30++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_94:
        uint64_t v69 = 60;
        goto LABEL_119;
      case 6u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 100) |= 4u;
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
            char v38 = *(unsigned char *)(*(void *)(a2 + *v10) + v37);
            *(void *)(a2 + v36) = v37 + 1;
            v25 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              BOOL v17 = v35++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_98:
        uint64_t v69 = 56;
        goto LABEL_119;
      case 7u:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 100) |= 1u;
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
            char v43 = *(unsigned char *)(*(void *)(a2 + *v10) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v25 |= (unint64_t)(v43 & 0x7F) << v39;
            if (v43 < 0)
            {
              v39 += 7;
              BOOL v17 = v40++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_102:
        uint64_t v69 = 48;
        goto LABEL_119;
      case 8u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 100) |= 2u;
        while (2)
        {
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 == -1 || v47 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v10) + v47);
            *(void *)(a2 + v46) = v47 + 1;
            v25 |= (unint64_t)(v48 & 0x7F) << v44;
            if (v48 < 0)
            {
              v44 += 7;
              BOOL v17 = v45++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_106;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_106:
        uint64_t v69 = 52;
        goto LABEL_119;
      case 9u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 100) |= 0x10u;
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
            char v53 = *(unsigned char *)(*(void *)(a2 + *v10) + v52);
            *(void *)(a2 + v51) = v52 + 1;
            v25 |= (unint64_t)(v53 & 0x7F) << v49;
            if (v53 < 0)
            {
              v49 += 7;
              BOOL v17 = v50++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_110;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_110:
        uint64_t v69 = 64;
        goto LABEL_119;
      case 0xAu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 40;
        goto LABEL_86;
      case 0xBu:
        uint64_t v54 = v9;
        unint64_t v55 = v8;
        char v56 = v7;
        uint64_t v57 = objc_alloc_init(NTPBAlternateHeadline);
        objc_storeStrong((id *)(a1 + 8), v57);
        if (PBReaderPlaceMark() && NTPBAlternateHeadlineReadFrom((uint64_t)v57, a2))
        {
          PBReaderRecallMark();

          int v7 = v56;
          char v8 = v55;
          unsigned int v9 = v54;
LABEL_120:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 0xCu:
        char v58 = 0;
        unsigned int v59 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 100) |= 0x20u;
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
            char v62 = *(unsigned char *)(*(void *)(a2 + *v10) + v61);
            *(void *)(a2 + v60) = v61 + 1;
            v25 |= (unint64_t)(v62 & 0x7F) << v58;
            if (v62 < 0)
            {
              v58 += 7;
              BOOL v17 = v59++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_114:
        uint64_t v69 = 68;
        goto LABEL_119;
      case 0xDu:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 100) |= 0x80u;
        while (2)
        {
          uint64_t v65 = *v3;
          unint64_t v66 = *(void *)(a2 + v65);
          if (v66 == -1 || v66 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)(a2 + *v10) + v66);
            *(void *)(a2 + v65) = v66 + 1;
            v25 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              v63 += 7;
              BOOL v17 = v64++ >= 9;
              if (v17)
              {
                LODWORD(v25) = 0;
                goto LABEL_118;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_118:
        uint64_t v69 = 96;
LABEL_119:
        *(_DWORD *)(a1 + v69) = v25;
        goto LABEL_120;
      case 0xEu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 88;
        goto LABEL_86;
      case 0xFu:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 32;
LABEL_86:
        unint64_t v68 = *(void **)(a1 + v21);
        *(void *)(a1 + v21) = v20;

        goto LABEL_120;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_120;
    }
  }
}

BOOL NTPBSuggestionsFeedbackReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        BOOL v17 = objc_alloc_init(NTPBGradedTagID);
        [a1 addGrades:v17];
        if (!PBReaderPlaceMark() || (NTPBGradedTagIDReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
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
    BOOL v17 = (NTPBGradedTagID *)a1[1];
    a1[1] = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBGradedTagIDReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        *(unsigned char *)(a1 + 24) |= 2u;
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
            goto LABEL_39;
          }
          v20 += 7;
          BOOL v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_41:
        uint64_t v32 = 12;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            uint64_t v18 = PBReaderReadString();
            uint64_t v19 = *(void **)(a1 + 16);
            *(void *)(a1 + 16) = v18;
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
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0) {
            goto LABEL_43;
          }
          v26 += 7;
          BOOL v14 = v27++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_45:
        uint64_t v32 = 8;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBUserPaidSubscriptionStatusReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        unint64_t v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
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
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
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

uint64_t NTPBWidgetPersonalizationFeatureCTRPairReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + *v4))
        {
          int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v22 = 0;
        }
        *(_DWORD *)(a1 + 8) = v22;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
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

uint64_t NTPBOptInButtonExposureReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          *(unsigned char *)(a1 + 36) |= 2u;
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
              goto LABEL_39;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_41:
          uint64_t v32 = 32;
          goto LABEL_46;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 36) |= 1u;
          break;
        case 3u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = 24;
          goto LABEL_37;
        case 4u:
          uint64_t v29 = PBReaderReadData();
          uint64_t v30 = 8;
LABEL_37:
          uint64_t v31 = *(void **)(a1 + v30);
          *(void *)(a1 + v30) = v29;

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
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 == -1 || v27 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
        *(void *)(a2 + v26) = v27 + 1;
        v19 |= (unint64_t)(v28 & 0x7F) << v24;
        if ((v28 & 0x80) == 0) {
          goto LABEL_43;
        }
        v24 += 7;
        BOOL v14 = v25++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_45;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_45:
      uint64_t v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBMarketingSubscriptionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        *(unsigned char *)(a1 + 32) |= 2u;
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
            goto LABEL_40;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_42;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_42:
        uint64_t v32 = 28;
        goto LABEL_47;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
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
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_46:
        uint64_t v32 = 24;
LABEL_47:
        *(_DWORD *)(a1 + v32) = v19;
        goto LABEL_48;
      case 3u:
        uint64_t v29 = PBReaderReadString();
        uint64_t v30 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v29;

        goto LABEL_48;
      case 4u:
        uint64_t v31 = objc_alloc_init(NTPBDeviceInfo);
        objc_storeStrong((id *)(a1 + 8), v31);
        if PBReaderPlaceMark() && (NTPBDeviceInfoReadFrom(v31, a2))
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

uint64_t NTPBWrappingKeyResponseReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        char v17 = objc_alloc_init(NTPBWrappingKeyMapEntry);
        [a1 addWrappingKeyMapEntries:v17];
        if (!PBReaderPlaceMark() || !NTPBWrappingKeyMapEntryReadFrom((uint64_t)v17, a2))
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

uint64_t NTPBUserIgnoreFavoritesSuggestionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          *(unsigned char *)(a1 + 32) |= 2u;
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
              goto LABEL_44;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_46;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_46:
          uint64_t v36 = 24;
          goto LABEL_55;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
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
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_50:
          uint64_t v36 = 8;
          goto LABEL_55;
        case 3u:
          uint64_t v29 = PBReaderReadString();
          uint64_t v30 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v29;

          continue;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
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
        uint64_t v33 = *v3;
        unint64_t v34 = *(void *)(a2 + v33);
        if (v34 == -1 || v34 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
        *(void *)(a2 + v33) = v34 + 1;
        v19 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0) {
          goto LABEL_52;
        }
        v31 += 7;
        BOOL v14 = v32++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_54;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_54:
      uint64_t v36 = 28;
LABEL_55:
      *(_DWORD *)(a1 + v36) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBAdCtaEngagementReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          *(_WORD *)(a1 + 148) |= 8u;
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
              goto LABEL_116;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_118;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_116:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_118:
          uint64_t v84 = 28;
          goto LABEL_160;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 104;
          goto LABEL_114;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 112;
          goto LABEL_114;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 96;
          goto LABEL_114;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x10u;
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
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_122:
          uint64_t v84 = 32;
          goto LABEL_160;
        case 6u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x40u;
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
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_126:
          uint64_t v84 = 52;
          goto LABEL_160;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 4u;
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
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_130:
          uint64_t v84 = 24;
          goto LABEL_160;
        case 8u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x20u;
          while (2)
          {
            uint64_t v43 = *v3;
            unint64_t v44 = *(void *)(a2 + v43);
            if (v44 == -1 || v44 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v44 + 1;
              v19 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_134:
          uint64_t v84 = 48;
          goto LABEL_160;
        case 9u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x100u;
          while (2)
          {
            uint64_t v48 = *v3;
            unint64_t v49 = *(void *)(a2 + v48);
            if (v49 == -1 || v49 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
              *(void *)(a2 + v48) = v49 + 1;
              v19 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                BOOL v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_138:
          uint64_t v84 = 120;
          goto LABEL_160;
        case 0xAu:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x400u;
          while (2)
          {
            uint64_t v53 = *v3;
            unint64_t v54 = *(void *)(a2 + v53);
            if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
              *(void *)(a2 + v53) = v54 + 1;
              v19 |= (unint64_t)(v55 & 0x7F) << v51;
              if (v55 < 0)
              {
                v51 += 7;
                BOOL v14 = v52++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_142;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_142:
          uint64_t v84 = 140;
          goto LABEL_160;
        case 0xBu:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x80u;
          while (2)
          {
            uint64_t v58 = *v3;
            unint64_t v59 = *(void *)(a2 + v58);
            if (v59 == -1 || v59 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
              *(void *)(a2 + v58) = v59 + 1;
              v19 |= (unint64_t)(v60 & 0x7F) << v56;
              if (v60 < 0)
              {
                v56 += 7;
                BOOL v14 = v57++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_146;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_146:
          uint64_t v84 = 80;
          goto LABEL_160;
        case 0xCu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_114;
        case 0xDu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_114;
        case 0xEu:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          *(_WORD *)(a1 + 148) |= 1u;
          while (2)
          {
            uint64_t v64 = *v3;
            unint64_t v65 = *(void *)(a2 + v64);
            if (v65 == -1 || v65 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
              *(void *)(a2 + v64) = v65 + 1;
              v63 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                BOOL v14 = v62++ >= 9;
                if (v14)
                {
                  uint64_t v63 = 0;
                  goto LABEL_150;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v63 = 0;
          }
LABEL_150:
          uint64_t v85 = 8;
          goto LABEL_155;
        case 0xFu:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v63 = 0;
          *(_WORD *)(a1 + 148) |= 2u;
          while (2)
          {
            uint64_t v69 = *v3;
            unint64_t v70 = *(void *)(a2 + v69);
            if (v70 == -1 || v70 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
              *(void *)(a2 + v69) = v70 + 1;
              v63 |= (unint64_t)(v71 & 0x7F) << v67;
              if (v71 < 0)
              {
                v67 += 7;
                BOOL v14 = v68++ >= 9;
                if (v14)
                {
                  uint64_t v63 = 0;
                  goto LABEL_154;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v63 = 0;
          }
LABEL_154:
          uint64_t v85 = 16;
LABEL_155:
          *(void *)(a1 + v85) = v63;
          continue;
        case 0x10u:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x200u;
          while (2)
          {
            uint64_t v74 = *v3;
            unint64_t v75 = *(void *)(a2 + v74);
            if (v75 == -1 || v75 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v76 = *(unsigned char *)(*(void *)(a2 + *v7) + v75);
              *(void *)(a2 + v74) = v75 + 1;
              v19 |= (unint64_t)(v76 & 0x7F) << v72;
              if (v76 < 0)
              {
                v72 += 7;
                BOOL v14 = v73++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_159;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_159:
          uint64_t v84 = 136;
LABEL_160:
          *(_DWORD *)(a1 + v84) = v19;
          continue;
        case 0x11u:
          char v77 = 0;
          unsigned int v78 = 0;
          uint64_t v79 = 0;
          *(_WORD *)(a1 + 148) |= 0x800u;
          break;
        case 0x12u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 40;
          goto LABEL_114;
        case 0x13u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 64;
          goto LABEL_114;
        case 0x14u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 128;
          goto LABEL_114;
        case 0x15u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 88;
LABEL_114:
          char v83 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

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
        uint64_t v80 = *v3;
        unint64_t v81 = *(void *)(a2 + v80);
        if (v81 == -1 || v81 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v82 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
        *(void *)(a2 + v80) = v81 + 1;
        v79 |= (unint64_t)(v82 & 0x7F) << v77;
        if ((v82 & 0x80) == 0) {
          goto LABEL_164;
        }
        v77 += 7;
        BOOL v14 = v78++ >= 9;
        if (v14)
        {
          uint64_t v79 = 0;
          goto LABEL_166;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_164:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v79 = 0;
      }
LABEL_166:
      *(unsigned char *)(a1 + 144) = v79 != 0;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBAdEngagementReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          uint64_t v18 = 120;
          goto LABEL_122;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 128;
          goto LABEL_122;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 112;
          goto LABEL_122;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 8u;
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
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_126:
          uint64_t v89 = 28;
          goto LABEL_176;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x40u;
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
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_130:
          uint64_t v89 = 48;
          goto LABEL_176;
        case 6u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 4u;
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
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_134:
          uint64_t v89 = 24;
          goto LABEL_176;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x20u;
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
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_138:
          uint64_t v89 = 44;
          goto LABEL_176;
        case 8u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x200u;
          while (2)
          {
            uint64_t v43 = *v3;
            unint64_t v44 = *(void *)(a2 + v43);
            if (v44 == -1 || v44 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v44 + 1;
              v22 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_142;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_142:
          uint64_t v89 = 136;
          goto LABEL_176;
        case 9u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x800u;
          while (2)
          {
            uint64_t v48 = *v3;
            unint64_t v49 = *(void *)(a2 + v48);
            if (v49 == -1 || v49 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
              *(void *)(a2 + v48) = v49 + 1;
              v22 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                BOOL v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_146;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_146:
          uint64_t v89 = 156;
          goto LABEL_176;
        case 0xAu:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x80u;
          while (2)
          {
            uint64_t v53 = *v3;
            unint64_t v54 = *(void *)(a2 + v53);
            if (v54 == -1 || v54 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
              *(void *)(a2 + v53) = v54 + 1;
              v22 |= (unint64_t)(v55 & 0x7F) << v51;
              if (v55 < 0)
              {
                v51 += 7;
                BOOL v14 = v52++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_150;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_150:
          uint64_t v89 = 80;
          goto LABEL_176;
        case 0xBu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 72;
          goto LABEL_122;
        case 0xCu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_122;
        case 0xDu:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + 164) |= 1u;
          while (2)
          {
            uint64_t v59 = *v3;
            unint64_t v60 = *(void *)(a2 + v59);
            if (v60 == -1 || v60 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
              *(void *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                BOOL v14 = v57++ >= 9;
                if (v14)
                {
                  uint64_t v58 = 0;
                  goto LABEL_154;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v58 = 0;
          }
LABEL_154:
          uint64_t v90 = 8;
          goto LABEL_159;
        case 0xEu:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v58 = 0;
          *(_WORD *)(a1 + 164) |= 2u;
          while (2)
          {
            uint64_t v64 = *v3;
            unint64_t v65 = *(void *)(a2 + v64);
            if (v65 == -1 || v65 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
              *(void *)(a2 + v64) = v65 + 1;
              v58 |= (unint64_t)(v66 & 0x7F) << v62;
              if (v66 < 0)
              {
                v62 += 7;
                BOOL v14 = v63++ >= 9;
                if (v14)
                {
                  uint64_t v58 = 0;
                  goto LABEL_158;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v58 = 0;
          }
LABEL_158:
          uint64_t v90 = 16;
LABEL_159:
          *(void *)(a1 + v90) = v58;
          continue;
        case 0xFu:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x400u;
          while (2)
          {
            uint64_t v69 = *v3;
            unint64_t v70 = *(void *)(a2 + v69);
            if (v70 == -1 || v70 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
              *(void *)(a2 + v69) = v70 + 1;
              v22 |= (unint64_t)(v71 & 0x7F) << v67;
              if (v71 < 0)
              {
                v67 += 7;
                BOOL v14 = v68++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_163;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_163:
          uint64_t v89 = 152;
          goto LABEL_176;
        case 0x10u:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v74 = 0;
          *(_WORD *)(a1 + 164) |= 0x1000u;
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
              v74 |= (unint64_t)(v77 & 0x7F) << v72;
              if (v77 < 0)
              {
                v72 += 7;
                BOOL v14 = v73++ >= 9;
                if (v14)
                {
                  uint64_t v74 = 0;
                  goto LABEL_167;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v74 = 0;
          }
LABEL_167:
          *(unsigned char *)(a1 + 160) = v74 != 0;
          continue;
        case 0x11u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_122;
        case 0x12u:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x10u;
          while (2)
          {
            uint64_t v80 = *v3;
            unint64_t v81 = *(void *)(a2 + v80);
            if (v81 == -1 || v81 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v82 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
              *(void *)(a2 + v80) = v81 + 1;
              v22 |= (unint64_t)(v82 & 0x7F) << v78;
              if (v82 < 0)
              {
                v78 += 7;
                BOOL v14 = v79++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_171;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_171:
          uint64_t v89 = 40;
          goto LABEL_176;
        case 0x13u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 64;
          goto LABEL_122;
        case 0x14u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 144;
          goto LABEL_122;
        case 0x15u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 88;
          goto LABEL_122;
        case 0x16u:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 164) |= 0x100u;
          break;
        case 0x17u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 104;
LABEL_122:
          uint64_t v88 = *(void **)(a1 + v18);
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
        uint64_t v85 = *v3;
        unint64_t v86 = *(void *)(a2 + v85);
        if (v86 == -1 || v86 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v87 = *(unsigned char *)(*(void *)(a2 + *v7) + v86);
        *(void *)(a2 + v85) = v86 + 1;
        v22 |= (unint64_t)(v87 & 0x7F) << v83;
        if ((v87 & 0x80) == 0) {
          goto LABEL_173;
        }
        v83 += 7;
        BOOL v14 = v84++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_175;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_173:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_175:
      uint64_t v89 = 96;
LABEL_176:
      *(_DWORD *)(a1 + v89) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBChannelDataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
            uint64_t v19 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + 8) = v19 != 0;
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

BOOL COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadlineReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 16) |= 2u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            unint64_t v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentState;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            unint64_t v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentState;
            goto LABEL_41;
          }
        }
        unint64_t v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentState;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 16) |= 1u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        unint64_t v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentId;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        unint64_t v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentId;
        goto LABEL_41;
      }
    }
    unint64_t v24 = &OBJC_IVAR___COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline__articleHeadlineTreatmentId;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBAdImpressionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          uint64_t v18 = 112;
          goto LABEL_102;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 120;
          goto LABEL_102;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 104;
          goto LABEL_102;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x10u;
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
                  goto LABEL_106;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_106:
          uint64_t v73 = 40;
          goto LABEL_143;
        case 5u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 2u;
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
                  goto LABEL_110;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_110:
          uint64_t v73 = 16;
          goto LABEL_143;
        case 6u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 8u;
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
                  goto LABEL_114;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_114:
          uint64_t v73 = 36;
          goto LABEL_143;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x80u;
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
                  goto LABEL_118;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_118:
          uint64_t v73 = 128;
          goto LABEL_143;
        case 8u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x200u;
          while (2)
          {
            uint64_t v43 = *v3;
            unint64_t v44 = *(void *)(a2 + v43);
            if (v44 == -1 || v44 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
              *(void *)(a2 + v43) = v44 + 1;
              v22 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                BOOL v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_122:
          uint64_t v73 = 156;
          goto LABEL_143;
        case 9u:
          char v46 = 0;
          unsigned int v47 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x20u;
          while (2)
          {
            uint64_t v48 = *v3;
            unint64_t v49 = *(void *)(a2 + v48);
            if (v49 == -1 || v49 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
              *(void *)(a2 + v48) = v49 + 1;
              v22 |= (unint64_t)(v50 & 0x7F) << v46;
              if (v50 < 0)
              {
                v46 += 7;
                BOOL v14 = v47++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_126:
          uint64_t v73 = 72;
          goto LABEL_143;
        case 0xAu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 64;
          goto LABEL_102;
        case 0xBu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_102;
        case 0xCu:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          *(_WORD *)(a1 + 160) |= 1u;
          while (2)
          {
            uint64_t v54 = *v3;
            unint64_t v55 = *(void *)(a2 + v54);
            if (v55 == -1 || v55 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v56 = *(unsigned char *)(*(void *)(a2 + *v7) + v55);
              *(void *)(a2 + v54) = v55 + 1;
              v53 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                BOOL v14 = v52++ >= 9;
                if (v14)
                {
                  uint64_t v53 = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v53 = 0;
          }
LABEL_130:
          *(void *)(a1 + 8) = v53;
          continue;
        case 0xDu:
          char v57 = 0;
          unsigned int v58 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x100u;
          while (2)
          {
            uint64_t v59 = *v3;
            unint64_t v60 = *(void *)(a2 + v59);
            if (v60 == -1 || v60 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
              *(void *)(a2 + v59) = v60 + 1;
              v22 |= (unint64_t)(v61 & 0x7F) << v57;
              if (v61 < 0)
              {
                v57 += 7;
                BOOL v14 = v58++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_134:
          uint64_t v73 = 152;
          goto LABEL_143;
        case 0xEu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_102;
        case 0xFu:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 4u;
          while (2)
          {
            uint64_t v64 = *v3;
            unint64_t v65 = *(void *)(a2 + v64);
            if (v65 == -1 || v65 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
              *(void *)(a2 + v64) = v65 + 1;
              v22 |= (unint64_t)(v66 & 0x7F) << v62;
              if (v66 < 0)
              {
                v62 += 7;
                BOOL v14 = v63++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v22) = 0;
          }
LABEL_138:
          uint64_t v73 = 32;
          goto LABEL_143;
        case 0x10u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 56;
          goto LABEL_102;
        case 0x11u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 144;
          goto LABEL_102;
        case 0x12u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 80;
          goto LABEL_102;
        case 0x13u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 160) |= 0x40u;
          break;
        case 0x14u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 96;
          goto LABEL_102;
        case 0x15u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 136;
LABEL_102:
          char v72 = *(void **)(a1 + v18);
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
        uint64_t v69 = *v3;
        unint64_t v70 = *(void *)(a2 + v69);
        if (v70 == -1 || v70 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
        *(void *)(a2 + v69) = v70 + 1;
        v22 |= (unint64_t)(v71 & 0x7F) << v67;
        if ((v71 & 0x80) == 0) {
          goto LABEL_140;
        }
        v67 += 7;
        BOOL v14 = v68++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_142;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_140:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v22) = 0;
      }
LABEL_142:
      uint64_t v73 = 88;
LABEL_143:
      *(_DWORD *)(a1 + v73) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBArticleEngagementReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        *(unsigned char *)(a1 + 104) |= 4u;
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
            goto LABEL_70;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_72;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_70:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_72:
        uint64_t v50 = 24;
        goto LABEL_81;
      case 2u:
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 80;
        goto LABEL_68;
      case 3u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 88;
        goto LABEL_68;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 104) |= 2u;
        while (2)
        {
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 == -1 || v30 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 1;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (v14)
              {
                uint64_t v28 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_76:
        uint64_t v51 = 16;
        goto LABEL_86;
      case 5u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 32;
        goto LABEL_68;
      case 6u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 40;
        goto LABEL_68;
      case 7u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 104) |= 8u;
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
            v19 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v14 = v33++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_80:
        uint64_t v50 = 96;
LABEL_81:
        *(_DWORD *)(a1 + v50) = v19;
        goto LABEL_91;
      case 8u:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 48;
        goto LABEL_68;
      case 9u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 104) |= 1u;
        while (2)
        {
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 == -1 || v40 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 1;
            v28 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              BOOL v14 = v38++ >= 9;
              if (v14)
              {
                uint64_t v28 = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v28 = 0;
        }
LABEL_85:
        uint64_t v51 = 8;
LABEL_86:
        *(void *)(a1 + v51) = v28;
        goto LABEL_91;
      case 0xAu:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v44 = 0;
        *(unsigned char *)(a1 + 104) |= 0x10u;
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
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v44 = 0;
        }
LABEL_90:
        *(unsigned char *)(a1 + 100) = v44 != 0;
        goto LABEL_91;
      case 0xBu:
        uint64_t v48 = objc_alloc_init(NTPBIssueData);
        objc_storeStrong((id *)(a1 + 64), v48);
        if (!PBReaderPlaceMark() || (NTPBIssueDataReadFrom((uint64_t)v48, a2) & 1) == 0) {
          goto LABEL_93;
        }
        goto LABEL_66;
      case 0xCu:
        uint64_t v48 = objc_alloc_init(NTPBIssueViewData);
        objc_storeStrong((id *)(a1 + 72), v48);
        if PBReaderPlaceMark() && (NTPBIssueViewDataReadFrom((uint64_t)v48, a2))
        {
LABEL_66:
          PBReaderRecallMark();

LABEL_91:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_93:

        return 0;
      case 0xDu:
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 56;
LABEL_68:
        unint64_t v49 = *(void **)(a1 + v25);
        *(void *)(a1 + v25) = v24;

        goto LABEL_91;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_91;
    }
  }
}

uint64_t NTPBTodayModuleContentRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
              *(unsigned char *)(a1 + 48) |= 1u;
              break;
            case 2u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 40;
              goto LABEL_32;
            case 3u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 16;
              goto LABEL_32;
            case 4u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 32;
              goto LABEL_32;
            case 5u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 24;
LABEL_32:
              char v26 = *(void **)(a1 + v25);
              *(void *)(a1 + v25) = v24;

              goto LABEL_37;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_37:
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
              goto LABEL_34;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_36;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_36:
          *(_DWORD *)(a1 + 8) = v19;
          goto LABEL_37;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBFeedPersonalizingItemReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
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
        String = (void *)PBReaderReadString();

        id v18 = String;
        uint64_t v19 = 56;
        goto LABEL_106;
      case 2u:
        uint64_t v21 = PBReaderReadString();
        if (v21) {
          [(id)a1 addTopicIDs:v21];
        }
        goto LABEL_145;
      case 3u:
        char v22 = (void *)PBReaderReadString();

        id v18 = v22;
        uint64_t v19 = 80;
        goto LABEL_106;
      case 4u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(_WORD *)(a1 + 120) |= 1u;
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
                uint64_t v25 = 0;
                goto LABEL_110;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_110:
        uint64_t v84 = 8;
        goto LABEL_144;
      case 5u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(_WORD *)(a1 + 120) |= 4u;
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
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v14 = v30++ >= 9;
              if (v14)
              {
                uint64_t v31 = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_114:
        BOOL v85 = v31 != 0;
        uint64_t v86 = 112;
        goto LABEL_139;
      case 6u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v37 = 0;
        *(_WORD *)(a1 + 120) |= 0x80u;
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
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              BOOL v14 = v36++ >= 9;
              if (v14)
              {
                uint64_t v37 = 0;
                goto LABEL_118;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v37 = 0;
        }
LABEL_118:
        BOOL v85 = v37 != 0;
        uint64_t v86 = 117;
        goto LABEL_139;
      case 7u:
        char v41 = 0;
        unsigned int v42 = 0;
        uint64_t v43 = 0;
        *(_WORD *)(a1 + 120) |= 0x20u;
        while (2)
        {
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 == -1 || v45 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v46 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v45 + 1;
            v43 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              BOOL v14 = v42++ >= 9;
              if (v14)
              {
                uint64_t v43 = 0;
                goto LABEL_122;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v43 = 0;
        }
LABEL_122:
        BOOL v85 = v43 != 0;
        uint64_t v86 = 115;
        goto LABEL_139;
      case 8u:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v49 = 0;
        *(_WORD *)(a1 + 120) |= 0x100u;
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
            v49 |= (unint64_t)(v52 & 0x7F) << v47;
            if (v52 < 0)
            {
              v47 += 7;
              BOOL v14 = v48++ >= 9;
              if (v14)
              {
                uint64_t v49 = 0;
                goto LABEL_126;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v49 = 0;
        }
LABEL_126:
        BOOL v85 = v49 != 0;
        uint64_t v86 = 118;
        goto LABEL_139;
      case 9u:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v55 = 0;
        *(_WORD *)(a1 + 120) |= 0x40u;
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
                goto LABEL_130;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v55 = 0;
        }
LABEL_130:
        BOOL v85 = v55 != 0;
        uint64_t v86 = 116;
        goto LABEL_139;
      case 0xAu:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v61 = 0;
        *(_WORD *)(a1 + 120) |= 8u;
        while (2)
        {
          uint64_t v62 = *v3;
          unint64_t v63 = *(void *)(a2 + v62);
          if (v63 == -1 || v63 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
            *(void *)(a2 + v62) = v63 + 1;
            v61 |= (unint64_t)(v64 & 0x7F) << v59;
            if (v64 < 0)
            {
              v59 += 7;
              BOOL v14 = v60++ >= 9;
              if (v14)
              {
                uint64_t v61 = 0;
                goto LABEL_134;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v61 = 0;
        }
LABEL_134:
        BOOL v85 = v61 != 0;
        uint64_t v86 = 113;
        goto LABEL_139;
      case 0xBu:
        char v65 = 0;
        unsigned int v66 = 0;
        uint64_t v67 = 0;
        *(_WORD *)(a1 + 120) |= 0x10u;
        while (2)
        {
          uint64_t v68 = *v3;
          unint64_t v69 = *(void *)(a2 + v68);
          if (v69 == -1 || v69 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v70 = *(unsigned char *)(*(void *)(a2 + *v7) + v69);
            *(void *)(a2 + v68) = v69 + 1;
            v67 |= (unint64_t)(v70 & 0x7F) << v65;
            if (v70 < 0)
            {
              v65 += 7;
              BOOL v14 = v66++ >= 9;
              if (v14)
              {
                uint64_t v67 = 0;
                goto LABEL_138;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v67 = 0;
        }
LABEL_138:
        BOOL v85 = v67 != 0;
        uint64_t v86 = 114;
LABEL_139:
        *(unsigned char *)(a1 + v86) = v85;
        goto LABEL_145;
      case 0xCu:
        char v71 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList);

        uint64_t v72 = 40;
        goto LABEL_83;
      case 0xDu:
        char v71 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList);

        uint64_t v72 = 64;
LABEL_83:
        *(void *)(a1 + v72) = v71;
        if (!PBReaderPlaceMark()
          || (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortListReadFrom(v71, a2) & 1) == 0)
        {
          return 0;
        }
        goto LABEL_103;
      case 0xEu:
        uint64_t v73 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats);

        uint64_t v74 = 48;
        goto LABEL_88;
      case 0xFu:
        uint64_t v73 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats);

        uint64_t v74 = 72;
LABEL_88:
        *(void *)(a1 + v74) = v73;
        if (!PBReaderPlaceMark()
          || !COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStatsReadFrom((uint64_t)v73, a2))
        {
          return 0;
        }
        goto LABEL_103;
      case 0x10u:
        uint64_t v75 = objc_alloc_init(NTPBArticleTopic);
        [(id)a1 addTopics:v75];

        if (!PBReaderPlaceMark() || (NTPBArticleTopicReadFrom((uint64_t)v75, a2) & 1) == 0) {
          return 0;
        }
        goto LABEL_103;
      case 0x11u:
        char v76 = 0;
        unsigned int v77 = 0;
        uint64_t v25 = 0;
        *(_WORD *)(a1 + 120) |= 2u;
        while (2)
        {
          uint64_t v78 = *v3;
          unint64_t v79 = *(void *)(a2 + v78);
          if (v79 == -1 || v79 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v80 = *(unsigned char *)(*(void *)(a2 + *v7) + v79);
            *(void *)(a2 + v78) = v79 + 1;
            v25 |= (unint64_t)(v80 & 0x7F) << v76;
            if (v80 < 0)
            {
              v76 += 7;
              BOOL v14 = v77++ >= 9;
              if (v14)
              {
                uint64_t v25 = 0;
                goto LABEL_143;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v25 = 0;
        }
LABEL_143:
        uint64_t v84 = 16;
LABEL_144:
        *(void *)(a1 + v84) = v25;
        goto LABEL_145;
      case 0x12u:
        unint64_t v81 = objc_alloc_init(COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadata);

        *(void *)(a1 + 88) = v81;
        if (PBReaderPlaceMark()
          && (COMAPPLEFELDSPARPROTOCOLLIVERPOOLTagMetadataReadFrom((uint64_t)v81, a2) & 1) != 0)
        {
LABEL_103:
          PBReaderRecallMark();
LABEL_145:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
        return 0;
      case 0x13u:
        Data = (void *)PBReaderReadData();

        id v18 = Data;
        uint64_t v19 = 32;
        goto LABEL_106;
      case 0x14u:
        char v83 = (void *)PBReaderReadData();

        id v18 = v83;
        uint64_t v19 = 24;
LABEL_106:
        *(void *)(a1 + v19) = v18;
        goto LABEL_145;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_145;
    }
  }
}

uint64_t NTPBBucketGroupConfigReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
              goto LABEL_50;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_52;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_50:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_52:
          *(_DWORD *)(a1 + 32) = v19;
          continue;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
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
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  uint64_t v26 = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_56:
          uint64_t v40 = 16;
          goto LABEL_65;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v26 = 0;
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
              v26 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v14 = v31++ >= 9;
                if (v14)
                {
                  uint64_t v26 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_60:
          uint64_t v40 = 8;
          goto LABEL_65;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v26 = 0;
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
        uint64_t v37 = *v3;
        unint64_t v38 = *(void *)(a2 + v37);
        if (v38 == -1 || v38 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v38);
        *(void *)(a2 + v37) = v38 + 1;
        v26 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0) {
          goto LABEL_62;
        }
        v35 += 7;
        BOOL v14 = v36++ >= 9;
        if (v14)
        {
          uint64_t v26 = 0;
          goto LABEL_64;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_62:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v26 = 0;
      }
LABEL_64:
      uint64_t v40 = 24;
LABEL_65:
      *(void *)(a1 + v40) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t NTPBLinkTapReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
          *(unsigned char *)(a1 + 68) |= 4u;
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
              goto LABEL_56;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_58;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_56:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_58:
          uint64_t v42 = 40;
          goto LABEL_71;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 8;
          goto LABEL_54;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32;
          goto LABEL_54;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 48;
          goto LABEL_54;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_54;
        case 6u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 68) |= 8u;
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
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                BOOL v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_62:
          uint64_t v42 = 64;
          goto LABEL_71;
        case 7u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 68) |= 2u;
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
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                BOOL v14 = v32++ >= 9;
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
          uint64_t v42 = 28;
          goto LABEL_71;
        case 8u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 68) |= 1u;
          break;
        case 9u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 16;
LABEL_54:
          char v41 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

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
        uint64_t v38 = *v3;
        unint64_t v39 = *(void *)(a2 + v38);
        if (v39 == -1 || v39 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
        *(void *)(a2 + v38) = v39 + 1;
        v19 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0) {
          goto LABEL_68;
        }
        v36 += 7;
        BOOL v14 = v37++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_70;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_68:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_70:
      uint64_t v42 = 24;
LABEL_71:
      *(_DWORD *)(a1 + v42) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL NTPBUserSegmentationApiConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
        uint64_t v19 = 8;
        goto LABEL_24;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
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

BOOL NTPBTranslationMapReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 2)
      {
        unint64_t v17 = objc_alloc_init(NTPBLanguageBucket);
        [a1 addFavoritesLanguageBuckets:v17];
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          continue;
        }
        unint64_t v17 = objc_alloc_init(NTPBLanguageBucket);
        [a1 addTopicLanguageBuckets:v17];
      }
      if (!PBReaderPlaceMark() || !NTPBLanguageBucketReadFrom((uint64_t)v17, a2))
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL NTPBGroupingFlagsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 3)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 12) |= 2u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v20 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
          {
            uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGroupingIfFavorited;
            goto LABEL_48;
          }
          v26 += 7;
          BOOL v24 = v27++ > 8;
          if (v24)
          {
            uint64_t v20 = 0;
            uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGroupingIfFavorited;
            goto LABEL_50;
          }
        }
        uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGroupingIfFavorited;
LABEL_47:
        *(unsigned char *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 12) |= 4u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4))
          {
            uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isHidden;
            goto LABEL_47;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            break;
          }
          v18 += 7;
          BOOL v24 = v19++ > 8;
          if (v24)
          {
            uint64_t v20 = 0;
            uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isHidden;
            goto LABEL_50;
          }
        }
        uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isHidden;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_51:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v31 = 0;
    unsigned int v32 = 0;
    uint64_t v20 = 0;
    *(unsigned char *)(a1 + 12) |= 1u;
    while (1)
    {
      uint64_t v33 = *v3;
      unint64_t v34 = *(void *)(a2 + v33);
      if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
      {
        uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGrouping;
        goto LABEL_47;
      }
      char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
      *(void *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0) {
        break;
      }
      v31 += 7;
      BOOL v24 = v32++ > 8;
      if (v24)
      {
        uint64_t v20 = 0;
        uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGrouping;
        goto LABEL_50;
      }
    }
    uint64_t v25 = &OBJC_IVAR___NTPBGroupingFlags__isEligibleForGrouping;
LABEL_48:
    if (*(unsigned char *)(a2 + *v5)) {
      uint64_t v20 = 0;
    }
LABEL_50:
    *(unsigned char *)(a1 + *v25) = v20 != 0;
    goto LABEL_51;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL NTPBLanguageBucketReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 3)
      {
        unsigned int v19 = objc_alloc_init(NTPBGroupingFlags);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark() || !NTPBGroupingFlagsReadFrom((uint64_t)v19, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        uint64_t v18 = PBReaderReadString();
        unsigned int v19 = *(NTPBGroupingFlags **)(a1 + 16);
        *(void *)(a1 + 16) = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    PBReaderReadString();
    unsigned int v19 = (NTPBGroupingFlags *)objc_claimAutoreleasedReturnValue();
    if (v19) {
      [(id)a1 addValues:v19];
    }
    goto LABEL_27;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL NTPBArticleTagMetadataReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
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
      if ((v10 >> 3) == 2)
      {
        unint64_t v17 = objc_alloc_init(NTPBTagMetadata);
        [a1 addTopicTagMetadata:v17];
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          continue;
        }
        unint64_t v17 = objc_alloc_init(NTPBTagMetadata);
        objc_storeStrong(a1 + 1, v17);
      }
      if (!PBReaderPlaceMark() || (NTPBTagMetadataReadFrom((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteFixed32Field()
{
  return MEMORY[0x270F58550]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x270F58558]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
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

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x270F586B8]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x270F586C0]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x270F586C8]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x270F586D0]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x270F586D8]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x270F586E0]();
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

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}