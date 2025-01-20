uint64_t sub_1000037AC(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  unint64_t v13;
  uint64_t v14;
  char v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t result;

  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      v10 = v5++ >= 9;
      if (v10)
      {
        v6 = 0;
        v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      *(unsigned char *)(a1 + 20) |= 2u;
      while (1)
      {
        v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        v19 = v18 + 1;
        if (v18 == -1 || v19 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19;
        v17 |= (unint64_t)(v20 & 0x7F) << v15;
        if ((v20 & 0x80) == 0) {
          goto LABEL_32;
        }
        v15 += 7;
        v10 = v16++ >= 9;
        if (v10)
        {
          LODWORD(v17) = 0;
          goto LABEL_34;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v17) = 0;
      }
LABEL_34:
      *(_DWORD *)(a1 + 16) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      *(unsigned char *)(a1 + 20) |= 1u;
      v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v13 <= 0xFFFFFFFFFFFFFFF7 && v13 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 8;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        v14 = 0;
      }
      *(void *)(a1 + 8) = v14;
    }
    else
    {
      result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_100003F6C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadString();
        v13 = *(_NMRContentItemMetadata **)(a1 + 8);
        *(void *)(a1 + 8) = v12;
LABEL_23:

        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    v13 = objc_alloc_init(_NMRContentItemMetadata);
    objc_storeStrong((id *)(a1 + 16), v13);
    if (!PBReaderPlaceMark() || (sub_10000AEE0((uint64_t)v13, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_23;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100005690(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (1)
        {
          uint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v17 = v16 + 1;
          if (v16 == -1 || v17 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17;
          v15 |= (unint64_t)(v18 & 0x7F) << v13;
          if ((v18 & 0x80) == 0) {
            goto LABEL_42;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            LODWORD(v15) = 0;
            goto LABEL_44;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_42:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v15) = 0;
        }
LABEL_44:
        uint64_t v30 = 24;
        goto LABEL_49;
      case 2u:
        v20 = objc_alloc_init(_NMRCommandOptionsProtobuf);
        objc_storeStrong((id *)(a1 + 32), v20);
        if PBReaderPlaceMark() && (sub_100028FAC((uint64_t)v20, a2))
        {
          PBReaderRecallMark();

LABEL_52:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        *(unsigned char *)(a1 + 44) |= 1u;
        unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v22 = 0;
        }
        *(void *)(a1 + 8) = v22;
        goto LABEL_52;
      case 4u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 44) |= 4u;
        while (2)
        {
          uint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26;
            v15 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v10 = v24++ >= 9;
              if (v10)
              {
                LODWORD(v15) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v15) = 0;
        }
LABEL_48:
        uint64_t v30 = 40;
LABEL_49:
        *(_DWORD *)(a1 + v30) = v15;
        goto LABEL_52;
      case 5u:
        uint64_t v28 = PBReaderReadString();
        v29 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v28;

        goto LABEL_52;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_52;
    }
  }
}

uint64_t sub_1000069D8(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 72) |= 4u;
        while (1)
        {
          uint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v17 = v16 + 1;
          if (v16 == -1 || v17 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17;
          v15 |= (unint64_t)(v18 & 0x7F) << v13;
          if ((v18 & 0x80) == 0) {
            goto LABEL_44;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            LODWORD(v15) = 0;
            goto LABEL_46;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v15) = 0;
        }
LABEL_46:
        uint64_t v30 = 56;
        goto LABEL_51;
      case 2u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 24;
        goto LABEL_35;
      case 3u:
        *(unsigned char *)(a1 + 72) |= 1u;
        unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v23 = 0;
        }
        *(void *)(a1 + 8) = v23;
        continue;
      case 4u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 32;
        goto LABEL_35;
      case 5u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 16;
        goto LABEL_35;
      case 6u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 64;
        goto LABEL_35;
      case 7u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 48;
LABEL_35:
        unsigned int v24 = *(void **)(a1 + v21);
        *(void *)(a1 + v21) = v20;

        continue;
      case 8u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 72) |= 2u;
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
      uint64_t v27 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v28 = v27 + 1;
      if (v27 == -1 || v28 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v27);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v28;
      v15 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0) {
        goto LABEL_48;
      }
      v25 += 7;
      BOOL v10 = v26++ >= 9;
      if (v10)
      {
        LODWORD(v15) = 0;
        goto LABEL_50;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_48:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v15) = 0;
    }
LABEL_50:
    uint64_t v30 = 40;
LABEL_51:
    *(_DWORD *)(a1 + v30) = v15;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100007760(int a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 2;
      break;
    case 2:
      uint64_t result = 3;
      break;
    case 3:
      uint64_t result = 4;
      break;
    case 4:
      uint64_t result = 5;
      break;
    case 5:
      uint64_t result = 6;
      break;
    case 6:
      uint64_t result = 7;
      break;
    case 7:
      uint64_t result = 8;
      break;
    case 8:
      uint64_t result = 9;
      break;
    case 9:
      uint64_t result = 10;
      break;
    case 10:
      uint64_t result = 11;
      break;
    case 11:
      uint64_t result = 12;
      break;
    case 12:
      uint64_t result = 13;
      break;
    case 13:
      uint64_t result = 14;
      break;
    case 14:
      uint64_t result = 15;
      break;
    case 15:
      uint64_t result = 16;
      break;
    case 16:
LABEL_39:
      uint64_t result = 0;
      break;
    case 17:
      uint64_t result = 18;
      break;
    case 18:
      uint64_t result = 19;
      break;
    case 19:
      uint64_t result = 20;
      break;
    case 20:
      uint64_t result = 21;
      break;
    case 21:
      uint64_t result = 22;
      break;
    case 22:
      uint64_t result = 23;
      break;
    case 23:
      uint64_t result = 24;
      break;
    case 24:
      uint64_t result = 45;
      break;
    case 25:
      uint64_t result = 46;
      break;
    case 26:
      uint64_t result = 47;
      break;
    default:
      switch(a1)
      {
        case 100:
          uint64_t result = 25;
          break;
        case 101:
          uint64_t result = 26;
          break;
        case 102:
          uint64_t result = 27;
          break;
        case 103:
          uint64_t result = 28;
          break;
        case 104:
          uint64_t result = 29;
          break;
        case 105:
          uint64_t result = 30;
          break;
        case 106:
          uint64_t result = 31;
          break;
        case 107:
          uint64_t result = 32;
          break;
        case 108:
          uint64_t result = 33;
          break;
        case 109:
          uint64_t result = 34;
          break;
        case 110:
          uint64_t result = 35;
          break;
        case 116:
          uint64_t result = 41;
          break;
        case 121:
          uint64_t result = 50;
          break;
        case 122:
          uint64_t result = 48;
          break;
        case 125:
          uint64_t result = 52;
          break;
        case 127:
          uint64_t result = 49;
          break;
        case 128:
          uint64_t result = 51;
          break;
        case 131:
          uint64_t result = 53;
          break;
        case 135:
          uint64_t result = 135;
          break;
        default:
          goto LABEL_39;
      }
      break;
  }
  return result;
}

uint64_t sub_100007A24(int a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 0:
      uint64_t result = 0xFFFFFFFFLL;
      break;
    case 1:
    case 17:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 42:
    case 43:
    case 44:
      return result;
    case 2:
      uint64_t result = 1;
      break;
    case 3:
      uint64_t result = 2;
      break;
    case 4:
      uint64_t result = 3;
      break;
    case 5:
      uint64_t result = 4;
      break;
    case 6:
      uint64_t result = 5;
      break;
    case 7:
      uint64_t result = 6;
      break;
    case 8:
      uint64_t result = 7;
      break;
    case 9:
      uint64_t result = 8;
      break;
    case 10:
      uint64_t result = 9;
      break;
    case 11:
      uint64_t result = 10;
      break;
    case 12:
      uint64_t result = 11;
      break;
    case 13:
      uint64_t result = 12;
      break;
    case 14:
      uint64_t result = 13;
      break;
    case 15:
      uint64_t result = 14;
      break;
    case 16:
      uint64_t result = 15;
      break;
    case 18:
      uint64_t result = 17;
      break;
    case 19:
      uint64_t result = 18;
      break;
    case 20:
      uint64_t result = 19;
      break;
    case 21:
      uint64_t result = 20;
      break;
    case 22:
      uint64_t result = 21;
      break;
    case 23:
      uint64_t result = 22;
      break;
    case 24:
      uint64_t result = 23;
      break;
    case 25:
      uint64_t result = 100;
      break;
    case 26:
      uint64_t result = 101;
      break;
    case 27:
      uint64_t result = 102;
      break;
    case 28:
      uint64_t result = 103;
      break;
    case 29:
      uint64_t result = 104;
      break;
    case 30:
      uint64_t result = 105;
      break;
    case 31:
      uint64_t result = 106;
      break;
    case 32:
      uint64_t result = 107;
      break;
    case 33:
      uint64_t result = 108;
      break;
    case 34:
      uint64_t result = 109;
      break;
    case 35:
      uint64_t result = 110;
      break;
    case 41:
      uint64_t result = 116;
      break;
    case 45:
      uint64_t result = 24;
      break;
    case 46:
      uint64_t result = 25;
      break;
    case 47:
      uint64_t result = 26;
      break;
    case 48:
      uint64_t result = 122;
      break;
    case 49:
      uint64_t result = 127;
      break;
    case 50:
      uint64_t result = 121;
      break;
    case 51:
      uint64_t result = 128;
      break;
    case 52:
      uint64_t result = 125;
      break;
    case 53:
      uint64_t result = 131;
      break;
    default:
      if (a1 == 135) {
        uint64_t result = 135;
      }
      else {
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

id sub_100007CA0(void *a1)
{
  id v1 = a1;
  v2 = sub_100007D04();
  v3 = [v2 protobufFromDictionary:v1];

  return v3;
}

id sub_100007D04()
{
  if (qword_100050608 != -1) {
    dispatch_once(&qword_100050608, &stru_100044C10);
  }
  v0 = (void *)qword_100050600;

  return v0;
}

id sub_100007D58(void *a1)
{
  id v1 = a1;
  v2 = sub_100007D04();
  v3 = [v2 dictionaryFromProtobuf:v1];

  return v3;
}

uint64_t sub_100007DBC(uint64_t result)
{
  if ((result - 1) >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t sub_100007DCC(int a1)
{
  if ((a1 - 1) >= 4) {
    return 2;
  }
  else {
    return (a1 - 1);
  }
}

void sub_100007DE0(id a1)
{
  uint64_t v1 = objc_opt_new();
  v2 = (void *)qword_100050600;
  qword_100050600 = v1;

  uint64_t v21 = (void *)qword_100050600;
  v29[0] = kMRMediaRemoteOptionIsExternalPlayerCommand;
  unint64_t v28 = NSStringFromSelector("externalPlayerCommand");
  v30[0] = v28;
  v29[1] = kMRMediaRemoteOptionIsNegative;
  uint64_t v27 = NSStringFromSelector("negative");
  v30[1] = v27;
  v29[2] = kMRMediaRemoteOptionMediaType;
  unsigned int v26 = NSStringFromSelector("mediaType");
  v30[2] = v26;
  v29[3] = kMRMediaRemoteOptionPlaybackPosition;
  char v25 = NSStringFromSelector("playbackPosition");
  v30[3] = v25;
  v29[4] = kMRMediaRemoteOptionPlaybackRate;
  unsigned int v24 = NSStringFromSelector("playbackRate");
  v30[4] = v24;
  v29[5] = kMRMediaRemoteOptionRepeatMode;
  uint64_t v23 = NSStringFromSelector("repeatMode");
  v30[5] = v23;
  v29[6] = kMRMediaRemoteOptionShuffleMode;
  unint64_t v22 = NSStringFromSelector("shuffleMode");
  v30[6] = v22;
  v29[7] = kMRMediaRemoteOptionQueueEndAction;
  uint64_t v20 = NSStringFromSelector("queueEndAction");
  v30[7] = v20;
  v29[8] = kMRMediaRemoteOptionSkipInterval;
  v19 = NSStringFromSelector("skipInterval");
  v30[8] = v19;
  v29[9] = kMRMediaRemoteOptionSourceID;
  char v18 = NSStringFromSelector("sourceID");
  v30[9] = v18;
  v29[10] = kMRMediaRemoteOptionStationHash;
  unint64_t v17 = NSStringFromSelector("radioStationHash");
  v30[10] = v17;
  v29[11] = kMRMediaRemoteOptionStationID;
  uint64_t v16 = NSStringFromSelector("radioStationID");
  v30[11] = v16;
  v29[12] = kMRMediaRemoteOptionSystemAppPlaybackQueueData;
  uint64_t v15 = NSStringFromSelector("systemAppPlaybackQueueData");
  v30[12] = v15;
  v29[13] = kMRSystemAppPlaybackQueueShouldOverrideManuallyCuratedQueueKey;
  unsigned int v14 = NSStringFromSelector("shouldOverrideManuallyCuratedQueue");
  v30[13] = v14;
  v29[14] = kMRMediaRemoteOptionTrackID;
  char v13 = NSStringFromSelector("trackID");
  v30[14] = v13;
  v29[15] = kMRMediaRemoteOptionContentItemID;
  v3 = NSStringFromSelector("contentItemID");
  v30[15] = v3;
  v29[16] = kMRMediaRemoteOptionDestinationAppDisplayID;
  char v4 = NSStringFromSelector("destinationAppDisplayID");
  v30[16] = v4;
  v29[17] = kMRMediaRemoteOptionSendOptionsNumber;
  unsigned int v5 = NSStringFromSelector("sendOptions");
  v30[17] = v5;
  v29[18] = kMRMediaRemoteOptionRequestDefermentToPlaybackQueuePosition;
  unint64_t v6 = NSStringFromSelector("requestDefermentToPlaybackQueuePosition");
  v30[18] = v6;
  v29[19] = kMRMediaRemoteOptionRating;
  uint64_t v7 = NSStringFromSelector("rating");
  v30[19] = v7;
  v29[20] = kMRMediaRemoteOptionContextID;
  unint64_t v8 = NSStringFromSelector("contextID");
  v30[20] = v8;
  v29[21] = kMRMediaRemoteOptionStationURL;
  char v9 = NSStringFromSelector("stationURL");
  v30[21] = v9;
  v29[22] = kMRMediaRemoteOptionShouldBeginRadioPlayback;
  BOOL v10 = NSStringFromSelector("shouldBeginRadioPlayback");
  v30[22] = v10;
  v29[23] = kMRMediaRemoteOptionPlaybackQueueInsertionPosition;
  int v11 = NSStringFromSelector("playbackQueueInsertionPosition");
  v30[23] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:24];
  [v21 setDictionaryKeyToProtobufKeyMapping:v12];

  [(id)qword_100050600 setProtobufClass:objc_opt_class()];
  [(id)qword_100050600 setDictionaryValueToProtobufValueTransformer:&stru_100044C50];
  [(id)qword_100050600 setProtobufValueToDictionaryValueTransformer:&stru_100044C90];
}

id sub_100008340(id a1, NSDictionary *a2, NSString *a3, id a4)
{
  unsigned int v5 = a3;
  id v6 = a4;
  if ([(NSString *)v5 isEqualToString:kMRMediaRemoteOptionRepeatMode]
    || [(NSString *)v5 isEqualToString:kMRMediaRemoteOptionShuffleMode])
  {
    unsigned int v7 = [v6 unsignedIntValue];
    BOOL v8 = v7 - 1 < 3;
LABEL_4:
    if (v8) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = +[NSNumber numberWithInt:v9];

    id v6 = (id)v10;
    goto LABEL_8;
  }
  if ([(NSString *)v5 isEqualToString:kMRMediaRemoteOptionQueueEndAction])
  {
    unsigned int v12 = [v6 unsignedIntValue];
    BOOL v8 = v12 < 4;
    unsigned int v7 = v12 + 1;
    goto LABEL_4;
  }
LABEL_8:

  return v6;
}

id sub_10000842C(id a1, PBCodable *a2, NSString *a3, id a4)
{
  unsigned int v5 = a3;
  id v6 = a4;
  unsigned int v7 = NSStringFromSelector("repeatMode");
  unsigned int v8 = [(NSString *)v5 isEqualToString:v7];

  if (v8
    || (NSStringFromSelector("shuffleMode"),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [(NSString *)v5 isEqualToString:v9],
        v9,
        v10))
  {
    unsigned int v11 = [v6 unsignedIntValue];
    if (v11 - 1 >= 3) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v11;
    }
LABEL_6:
    uint64_t v13 = +[NSNumber numberWithInt:v12];

    id v6 = (id)v13;
    goto LABEL_7;
  }
  uint64_t v15 = NSStringFromSelector("queueEndAction");
  unsigned int v16 = [(NSString *)v5 isEqualToString:v15];

  if (v16)
  {
    unsigned int v17 = [v6 unsignedIntValue];
    if (v17 - 1 >= 4) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v17 - 1;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

uint64_t sub_10000886C(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 8;
        goto LABEL_31;
      case 2u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 24;
        goto LABEL_31;
      case 3u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (2)
        {
          unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v18 == -1 || v18 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v19 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
            v17 |= (unint64_t)(v19 & 0x7F) << v15;
            if (v19 < 0)
            {
              v15 += 7;
              BOOL v9 = v16++ >= 9;
              if (v9)
              {
                LODWORD(v17) = 0;
                goto LABEL_42;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_42:
        uint64_t v25 = 32;
        goto LABEL_47;
      case 4u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 40;
        goto LABEL_31;
      case 5u:
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
LABEL_31:
        uint64_t v20 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        continue;
      case 6u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 48) |= 2u;
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
      unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
      v17 |= (unint64_t)(v24 & 0x7F) << v21;
      if ((v24 & 0x80) == 0) {
        goto LABEL_44;
      }
      v21 += 7;
      BOOL v9 = v22++ >= 9;
      if (v9)
      {
        LODWORD(v17) = 0;
        goto LABEL_46;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v17) = 0;
    }
LABEL_46:
    uint64_t v25 = 36;
LABEL_47:
    *(_DWORD *)(a1 + v25) = v17;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100009D38(void *a1)
{
  id v1 = a1;
  v46 = objc_opt_new();
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v1;
  v48 = (char *)[obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v69;
    uint64_t v44 = kMRMediaRemoteCommandInfoLocalizedShortTitleKey;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(void *)v69 != v47) {
          objc_enumerationMutation(obj);
        }
        v3 = objc_opt_new();
        int Command = MRMediaRemoteCommandInfoGetCommand();
        uint64_t v5 = sub_100007760(Command);
        if (v5)
        {
          [v3 setCommand:v5];
          [v3 setEnabled:MRMediaRemoteCommandInfoGetEnabled() != 0];
          unint64_t v6 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v7 = v6;
          id v8 = [v7 countByEnumeratingWithState:&v64 objects:v74 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v65;
            do
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v65 != v10) {
                  objc_enumerationMutation(v7);
                }
                [*(id *)(*((void *)&v64 + 1) + 8 * (void)j) doubleValue:v44];
                [v3 addPreferredInterval:];
              }
              id v9 = [v7 countByEnumeratingWithState:&v64 objects:v74 count:16];
            }
            while (v9);
          }

          uint64_t v12 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          uint64_t v13 = v12;
          if (v12) {
            [v3 setActive:[v12 BOOLValue]];
          }
          unsigned int v14 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          if ([v14 length])
          {
            [v3 setLocalizedTitle:v14];
          }
          else
          {
            char v15 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
            if ([v15 length]) {
              [v3 setLocalizedShortTitle:v15];
            }
          }
          unsigned int v16 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          uint64_t v17 = v16;
          if (v16)
          {
            [v16 floatValue];
            [v3 setMinimumRating:];
          }
          v53 = v17;
          v54 = v14;
          v55 = v13;
          unint64_t v18 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          char v19 = v18;
          if (v18)
          {
            [v18 floatValue];
            [v3 setMaximumRating:];
          }
          v52 = v19;
          uint64_t v20 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v21 = v20;
          id v22 = [v21 countByEnumeratingWithState:&v60 objects:v73 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v61;
            do
            {
              for (k = 0; k != v23; k = (char *)k + 1)
              {
                if (*(void *)v61 != v24) {
                  objc_enumerationMutation(v21);
                }
                [*(id *)(*((void *)&v60 + 1) + 8 * (void)k) floatValue:v44];
                [v3 addSupportedPlaybackRate:];
              }
              id v23 = [v21 countByEnumeratingWithState:&v60 objects:v73 count:16];
            }
            while (v23);
          }

          unsigned int v26 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          uint64_t v27 = v26;
          if (v26)
          {
            [v26 floatValue];
            [v3 setPreferredPlaybackRate:];
          }
          unint64_t v28 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          char v29 = v28;
          if (v28) {
            [v3 setShuffleMode:[v28 unsignedIntegerValue]];
          }
          v50 = v29;
          uint64_t v30 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          v31 = v30;
          if (v30) {
            [v3 setRepeatMode:[v30 unsignedIntegerValue]];
          }
          v49 = v31;
          v51 = v27;
          v32 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          v33 = v32;
          if (v32) {
            [v3 setCurrentQueueEndAction:[v32 unsignedIntegerValue]];
          }
          v34 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v35 = v34;
          id v36 = [v35 countByEnumeratingWithState:&v56 objects:v72 count:16];
          if (v36)
          {
            id v37 = v36;
            uint64_t v38 = *(void *)v57;
            do
            {
              for (m = 0; m != v37; m = (char *)m + 1)
              {
                if (*(void *)v57 != v38) {
                  objc_enumerationMutation(v35);
                }
                [v3 addSupportedQueueEndAction:[v56 intValue]];
              }
              id v37 = [v35 countByEnumeratingWithState:&v56 objects:v72 count:16];
            }
            while (v37);
          }

          v40 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
          v41 = v40;
          if (v40) {
            [v3 setPresentationStyle:[v40 intValue]];
          }
          [v46 addSupportedCommand:v3, v44];
        }
      }
      v48 = (char *)[obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v48);
  }

  v42 = [v46 data];

  return v42;
}

id sub_10000A734(void *a1)
{
  id v1 = a1;
  id v2 = [v1 bytes];
  CC_LONG v3 = [v1 length];

  CC_SHA1(v2, v3, md);
  char v4 = +[NSData dataWithBytes:md length:20];

  return v4;
}

uint64_t sub_10000A7EC(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  else {
    return (uint64_t)[a1 isEqualToData:a2];
  }
}

id sub_10000AA6C(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(_NMRProxiedOriginsProtobuf);
  CC_LONG v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v1 count]);
  [(_NMRProxiedOriginsProtobuf *)v2 setOrigins:v3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v1;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(_NMRProxiedOriginsProtobuf *)v2 origins];
        unsigned int v11 = [v9 protobuf];
        [v10 addObject:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [(_NMRProxiedOriginsProtobuf *)v2 data];

  return v12;
}

uint64_t sub_10000AEE0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 32;
        goto LABEL_23;
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 24;
        goto LABEL_23;
      case 3u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 16;
LABEL_23:
        long long v16 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      case 4u:
        *(unsigned char *)(a1 + 44) |= 1u;
        unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v17 <= 0xFFFFFFFFFFFFFFF7 && v17 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v18 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v18 = 0;
        }
        *(void *)(a1 + 8) = v18;
        continue;
      case 5u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
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
      uint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v23 = v22 + 1;
      if (v22 == -1 || v23 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23;
      v21 |= (unint64_t)(v24 & 0x7F) << v19;
      if ((v24 & 0x80) == 0) {
        goto LABEL_35;
      }
      v19 += 7;
      BOOL v10 = v20++ >= 9;
      if (v10)
      {
        uint64_t v21 = 0;
        goto LABEL_37;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_35:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v21 = 0;
    }
LABEL_37:
    *(unsigned char *)(a1 + 40) = v21 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10000BBC4(void *a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = objc_alloc_init(_NMROriginProtobuf);
      [a1 addOrigins:v12];
      if (!PBReaderPlaceMark() || (sub_100013DD0((uint64_t)v12, a2) & 1) == 0)
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
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10000C664(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 80) |= 4u;
        while (1)
        {
          uint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v17 = v16 + 1;
          if (v16 == -1 || v17 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17;
          v15 |= (unint64_t)(v18 & 0x7F) << v13;
          if ((v18 & 0x80) == 0) {
            goto LABEL_45;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            LODWORD(v15) = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v15) = 0;
        }
LABEL_47:
        uint64_t v30 = 64;
        goto LABEL_52;
      case 2u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 48;
        goto LABEL_36;
      case 3u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 24;
        goto LABEL_36;
      case 4u:
        *(unsigned char *)(a1 + 80) |= 1u;
        unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v23 = 0;
        }
        *(void *)(a1 + 8) = v23;
        continue;
      case 5u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 32;
        goto LABEL_36;
      case 6u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 16;
        goto LABEL_36;
      case 7u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 72;
        goto LABEL_36;
      case 8u:
        uint64_t v20 = PBReaderReadData();
        uint64_t v21 = 56;
LABEL_36:
        char v24 = *(void **)(a1 + v21);
        *(void *)(a1 + v21) = v20;

        continue;
      case 9u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)(a1 + 80) |= 2u;
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
      uint64_t v27 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v28 = v27 + 1;
      if (v27 == -1 || v28 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v27);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v28;
      v15 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0) {
        goto LABEL_49;
      }
      v25 += 7;
      BOOL v10 = v26++ >= 9;
      if (v10)
      {
        LODWORD(v15) = 0;
        goto LABEL_51;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_49:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v15) = 0;
    }
LABEL_51:
    uint64_t v30 = 40;
LABEL_52:
    *(_DWORD *)(a1 + v30) = v15;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10000D894(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 44) |= 2u;
        unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v13 <= 0xFFFFFFFFFFFFFFF7 && v13 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v26 = 16;
        goto LABEL_47;
      case 2u:
        *(unsigned char *)(a1 + 44) |= 4u;
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v26 = 24;
        goto LABEL_47;
      case 3u:
        *(unsigned char *)(a1 + 44) |= 1u;
        unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v17 <= 0xFFFFFFFFFFFFFFF7 && v17 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v14 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v14 = 0;
        }
        uint64_t v26 = 8;
LABEL_47:
        *(void *)(a1 + v26) = v14;
        continue;
      case 4u:
        uint64_t v18 = PBReaderReadString();
        char v19 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v18;

        continue;
      case 5u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 44) |= 8u;
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
      uint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v24 = v23 + 1;
      if (v23 == -1 || v24 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24;
      v22 |= (unint64_t)(v25 & 0x7F) << v20;
      if ((v25 & 0x80) == 0) {
        goto LABEL_38;
      }
      v20 += 7;
      BOOL v10 = v21++ >= 9;
      if (v10)
      {
        LODWORD(v22) = 0;
        goto LABEL_40;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_38:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v22) = 0;
    }
LABEL_40:
    *(_DWORD *)(a1 + 40) = v22;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10000E690(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 24;
        goto LABEL_26;
      case 2u:
        *(unsigned char *)(a1 + 48) |= 1u;
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        *(void *)(a1 + 8) = v17;
        continue;
      case 3u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 40;
        goto LABEL_26;
      case 4u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 16;
LABEL_26:
        uint64_t v18 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      case 5u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 48) |= 2u;
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
      uint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v23 = v22 + 1;
      if (v22 == -1 || v23 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23;
      v21 |= (unint64_t)(v24 & 0x7F) << v19;
      if ((v24 & 0x80) == 0) {
        goto LABEL_35;
      }
      v19 += 7;
      BOOL v10 = v20++ >= 9;
      if (v10)
      {
        LODWORD(v21) = 0;
        goto LABEL_37;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_35:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v21) = 0;
    }
LABEL_37:
    *(_DWORD *)(a1 + 32) = v21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000F194(uint64_t a1)
{
  id v2 = sub_10002C428(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100030E18();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  CC_LONG v3 = (id *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 8);
  unint64_t v6 = sub_10002C428(2);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      sub_100030DAC();
    }

    *((void *)*v3 + 1) = 2;
  }
  else
  {
    if (v7) {
      sub_100030D40();
    }

    *((void *)*v3 + 1) = 1;
    unint64_t v8 = sub_10002C428(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100030CD4();
    }

    objc_initWeak(&location, *v3);
    uint64_t v9 = *((void *)*v3 + 2);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000F344;
    v10[3] = &unk_100044CE0;
    objc_copyWeak(&v11, &location);
    v10[4] = *v3;
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void sub_10000F328(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000F344(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  CC_LONG v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[3];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000F3D8;
    v5[3] = &unk_100044CB8;
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
}

void sub_10000F3D8(uint64_t a1)
{
  uint64_t v2 = sub_10002C428(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100030F50();
  }

  if (*(void *)(*(void *)(a1 + 40) + 8) == 2)
  {
    CC_LONG v3 = sub_10002C428(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100030EE8();
    }

    [*(id *)(a1 + 40) executeUpdateBlock];
  }
  uint64_t v4 = sub_10002C428(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100030E80();
  }

  *(void *)(*(void *)(a1 + 40) + 8) = 0;
}

void sub_10000F4EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000F514(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_10000FF40(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = sub_10000FFB0();
    CC_LONG v3 = [v2 protobufDataFromDictionary:v1];
  }
  else
  {
    CC_LONG v3 = 0;
  }

  return v3;
}

id sub_10000FFB0()
{
  if (qword_100050628 != -1) {
    dispatch_once(&qword_100050628, &stru_100044D48);
  }
  v0 = (void *)qword_100050620;

  return v0;
}

id sub_100010004()
{
  if (qword_100050618 != -1) {
    dispatch_once(&qword_100050618, &stru_100044D28);
  }
  v0 = (void *)qword_100050610;

  return v0;
}

void sub_100010058(id a1)
{
  v28[0] = kMRMediaRemoteNowPlayingInfoAlbum;
  uint64_t v27 = NSStringFromSelector("album");
  v29[0] = v27;
  v28[1] = kMRMediaRemoteNowPlayingInfoArtist;
  uint64_t v26 = NSStringFromSelector("artist");
  v29[1] = v26;
  v28[2] = kMRMediaRemoteNowPlayingInfoDuration;
  char v25 = NSStringFromSelector("duration");
  v29[2] = v25;
  v28[3] = kMRMediaRemoteNowPlayingInfoElapsedTime;
  char v24 = NSStringFromSelector("elapsedTime");
  v29[3] = v24;
  v28[4] = kMRMediaRemoteNowPlayingInfoIsExplicitTrack;
  unint64_t v23 = NSStringFromSelector("isExplicitTrack");
  v29[4] = v23;
  v28[5] = kMRMediaRemoteNowPlayingInfoPlaybackRate;
  uint64_t v22 = NSStringFromSelector("playbackRate");
  v29[5] = v22;
  v28[6] = kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate;
  uint64_t v21 = NSStringFromSelector("preferredPlaybackRate");
  v29[6] = v21;
  v28[7] = kMRMediaRemoteNowPlayingInfoRepeatMode;
  unsigned int v20 = NSStringFromSelector("repeatMode");
  v29[7] = v20;
  v28[8] = kMRMediaRemoteNowPlayingInfoShuffleMode;
  char v19 = NSStringFromSelector("shuffleMode");
  v29[8] = v19;
  v28[9] = kMRMediaRemoteNowPlayingInfoTimestamp;
  uint64_t v18 = NSStringFromSelector("timestamp");
  v29[9] = v18;
  v28[10] = kMRMediaRemoteNowPlayingInfoTitle;
  uint64_t v17 = NSStringFromSelector("title");
  v29[10] = v17;
  v28[11] = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
  unint64_t v16 = NSStringFromSelector("uniqueIdentifier");
  v29[11] = v16;
  v28[12] = kMRMediaRemoteNowPlayingInfoMediaType;
  uint64_t v15 = NSStringFromSelector("mediaType");
  v29[12] = v15;
  v28[13] = kMRMediaRemoteNowPlayingInfoCollectionInfo;
  uint64_t v14 = NSStringFromSelector("collectionInfoData");
  v29[13] = v14;
  v28[14] = kMRMediaRemoteNowPlayingInfoUserInfo;
  uint64_t v13 = NSStringFromSelector("userInfoData");
  v29[14] = v13;
  v28[15] = kMRMediaRemoteNowPlayingInfoArtworkURL;
  id v1 = NSStringFromSelector("artworkURL");
  v29[15] = v1;
  v28[16] = kMRMediaRemoteNowPlayingInfoIsMusicApp;
  uint64_t v2 = NSStringFromSelector("isMusicApp");
  v29[16] = v2;
  v28[17] = kMRMediaRemoteNowPlayingInfoIsAlwaysLive;
  CC_LONG v3 = NSStringFromSelector("isAlwaysLive");
  v29[17] = v3;
  v28[18] = kMRMediaRemoteNowPlayingInfoRadioStationName;
  uint64_t v4 = NSStringFromSelector("radioStationName");
  v29[18] = v4;
  v28[19] = kMRMediaRemoteNowPlayingInfoRadioStationHash;
  uint64_t v5 = NSStringFromSelector("radioStationHash");
  v29[19] = v5;
  v28[20] = kMRMediaRemoteNowPlayingInfoRadioStationIdentifier;
  unint64_t v6 = NSStringFromSelector("radioStationIdentifier");
  v29[20] = v6;
  v28[21] = kMRMediaRemoteNowPlayingInfoIsAdvertisement;
  BOOL v7 = NSStringFromSelector("isAdvertisement");
  v29[21] = v7;
  v28[22] = kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier;
  unint64_t v8 = NSStringFromSelector("storeSubscriptionAdamID");
  v29[22] = v8;
  v28[23] = kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier;
  uint64_t v9 = NSStringFromSelector("storeAdamID");
  v29[23] = v9;
  v28[24] = @"NMRAugmentedNowPlayingInfoArtworkDataDigest";
  BOOL v10 = NSStringFromSelector("artworkDataDigest");
  void v29[24] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:25];
  uint64_t v12 = (void *)qword_100050610;
  qword_100050610 = v11;
}

void sub_10001057C(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_100050620;
  qword_100050620 = v1;

  CC_LONG v3 = (void *)qword_100050620;
  uint64_t v4 = sub_100010004();
  [v3 setDictionaryKeyToProtobufKeyMapping:v4];

  [(id)qword_100050620 setProtobufClass:objc_opt_class()];
  [(id)qword_100050620 setDictionaryValueToProtobufValueTransformer:&stru_100044D68];
  uint64_t v5 = (void *)qword_100050620;

  [v5 setProtobufValueToDictionaryValueTransformer:&stru_100044DB0];
}

id sub_100010624(id a1, NSDictionary *a2, NSString *a3, id a4)
{
  uint64_t v5 = a3;
  id v6 = a4;
  if ([(NSString *)v5 isEqualToString:kMRMediaRemoteNowPlayingInfoStartTime]
    || [(NSString *)v5 isEqualToString:kMRMediaRemoteNowPlayingInfoTimestamp])
  {
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
LABEL_7:
    unint64_t v8 = (void *)v7;

    goto LABEL_8;
  }
  if ([(NSString *)v5 isEqualToString:kMRMediaRemoteNowPlayingInfoRepeatMode]
    || [(NSString *)v5 isEqualToString:kMRMediaRemoteNowPlayingInfoShuffleMode])
  {
    uint64_t v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", sub_100007DBC((uint64_t)[v6 unsignedIntValue]));
    goto LABEL_7;
  }
  if (![(NSString *)v5 isEqualToString:kMRMediaRemoteNowPlayingInfoCollectionInfo])
  {
    unsigned int v12 = [(NSString *)v5 isEqualToString:kMRMediaRemoteNowPlayingInfoUserInfo];
    if (!v6 || !v12)
    {
      unint64_t v8 = v6;
      goto LABEL_8;
    }
    uint64_t v13 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v14 = [v13 getActivePairedDevice];
    id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C2765ACC-C8FA-4C7A-9B11-B6B9DBE0CBBB"];
    unsigned int v16 = [v14 supportsCapability:v15];

    if (v16)
    {
      char v24 = 0;
      unint64_t v8 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:&v24];
      uint64_t v17 = v24;
    }
    else
    {
      if (!+[NSJSONSerialization isValidJSONObject:v6])
      {
        uint64_t v18 = sub_10002C428(2);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100031088();
        }

        +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v6 count]);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000109CC;
        v22[3] = &unk_100044D90;
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = v23;
        [v6 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = [v19 copy];

        id v6 = v20;
      }
      uint64_t v21 = 0;
      unint64_t v8 = +[NSJSONSerialization dataWithJSONObject:v6 options:2 error:&v21];
      uint64_t v17 = v21;
    }
    id v10 = v17;

    if (!v10) {
      goto LABEL_31;
    }
    uint64_t v11 = sub_10002C428(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100031020();
    }
    goto LABEL_30;
  }
  if (!v6)
  {
    unint64_t v8 = 0;
    goto LABEL_8;
  }
  id v25 = 0;
  unint64_t v8 = +[NSJSONSerialization dataWithJSONObject:v6 options:2 error:&v25];
  id v10 = v25;

  if (v10)
  {
    uint64_t v11 = sub_10002C428(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100030FB8();
    }
LABEL_30:
  }
LABEL_31:

LABEL_8:

  return v8;
}

void sub_1000109CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (+[NSJSONSerialization isValidJSONObject:v6])
  {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }
  else
  {
    uint64_t v7 = sub_10002C428(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1000310F0();
    }
  }
}

id sub_100010A6C(id a1, PBCodable *a2, NSString *a3, id a4)
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = NSStringFromSelector("timestamp");
  unsigned int v8 = [(NSString *)v5 isEqualToString:v7];

  if (v8)
  {
    [v6 doubleValue];
    uint64_t v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
LABEL_9:
    uint64_t v17 = v9;

LABEL_10:
    id v6 = (id)v17;
    goto LABEL_11;
  }
  id v10 = NSStringFromSelector("repeatMode");
  unsigned int v11 = [(NSString *)v5 isEqualToString:v10];

  if (v11
    || (NSStringFromSelector("shuffleMode"),
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [(NSString *)v5 isEqualToString:v13],
        v13,
        v14))
  {
    uint64_t v12 = sub_100007DBC((uint64_t)[v6 unsignedIntValue]);
LABEL_8:
    uint64_t v9 = +[NSNumber numberWithInt:v12];
    goto LABEL_9;
  }
  id v15 = NSStringFromSelector("queueEndAction");
  unsigned int v16 = [(NSString *)v5 isEqualToString:v15];

  if (v16)
  {
    uint64_t v12 = sub_100007DCC((int)[v6 unsignedIntValue]);
    goto LABEL_8;
  }
  id v19 = NSStringFromSelector("collectionInfoData");
  unsigned int v20 = [(NSString *)v5 isEqualToString:v19];

  if (v20)
  {
    if (v6)
    {
      id v26 = 0;
      uint64_t v17 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v26];
      id v21 = v26;

      if (v21)
      {
        uint64_t v22 = sub_10002C428(2);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100031174();
        }
LABEL_24:

        goto LABEL_25;
      }
      goto LABEL_25;
    }
  }
  else
  {
    id v23 = NSStringFromSelector("userInfoData");
    unsigned int v24 = [(NSString *)v5 isEqualToString:v23];

    if (v6 && v24)
    {
      id v25 = 0;
      uint64_t v17 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v25];
      id v21 = v25;

      if (v21)
      {
        uint64_t v22 = sub_10002C428(2);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1000311DC();
        }
        goto LABEL_24;
      }
LABEL_25:

      goto LABEL_10;
    }
  }
LABEL_11:

  return v6;
}

void sub_100010D54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100010ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010EF4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _refreshCurrentPlaybackQueueFromMediaRemoteWithCompletion:v5];
  }
}

void sub_1000110A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a2;
  id v7 = a5;
  [v7 objectForKeyedSubscript:kMRMediaRemoteOriginUserInfoKey];

  unsigned int v8 = [v6 origin];
  [v8 mediaRemoteOrigin];
  int v9 = MROriginEqualToOrigin();

  if (v9)
  {
    id v10 = [v7 objectForKeyedSubscript:kMRMediaRemoteUpdatedContentItemsUserInfoKey];
    unsigned int v11 = sub_10002C428(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v6 origin];
      uint64_t v13 = [v12 displayName];
      int v14 = 138412290;
      id v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_PlaybackQueueContentItemsDidChange for origin %@", (uint8_t *)&v14, 0xCu);
    }
    [v6 _updateMetadataWithMediaRemoteItems:v10];
  }
}

void sub_100011210(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a2;
  [a5 objectForKeyedSubscript:kMRMediaRemoteOriginUserInfoKey];

  id v7 = [v6 origin];
  [v7 mediaRemoteOrigin];
  LODWORD(a5) = MROriginEqualToOrigin();

  if (a5)
  {
    unsigned int v8 = sub_10002C428(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [v6 origin];
      id v10 = [v9 displayName];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_PlaybackQueueDidChangeNotification for origin %@", (uint8_t *)&v11, 0xCu);
    }
    [v6[4] executeUpdateBlock];
  }
}

uint64_t sub_100011434(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011444(uint64_t a1)
{
}

uint64_t sub_10001144C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) data];

  return _objc_release_x1();
}

id sub_100011548(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _mediaRemotePlaybackQueueWithRange:0 includeMetadata:*(char *)(*(id *)(*(void *)(a1 + 32) + 8) + 8) + 1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_100011648(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _mediaRemotePlaybackQueueWithRange:*(void *)(a1 + 48) includeMetadata:*(void *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100011808(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && [v2 length])
  {
    CC_LONG v3 = [[_NMRPlaybackQueue alloc] initWithData:*(void *)(a1 + 32)];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 8) contentItems];
    id v5 = [(_NMRPlaybackQueue *)v3 contentItems];
    id v6 = objc_opt_new();
    *(void *)buf = 0;
    v33 = buf;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    unsigned int v7 = [(_NMRPlaybackQueue *)v3 location];
    if (v7 == [*(id *)(*(void *)(a1 + 40) + 8) location])
    {
      id v8 = [v5 count];
      if (v8 == [v4 count])
      {
LABEL_14:
        unsigned int v24 = _NSConcreteStackBlock;
        uint64_t v25 = 3221225472;
        id v26 = sub_100011C24;
        uint64_t v27 = &unk_100044E78;
        id v14 = v5;
        id v28 = v14;
        v31 = buf;
        id v29 = *(id *)(a1 + 48);
        id v15 = v6;
        id v30 = v15;
        [v4 enumerateObjectsUsingBlock:&v24];
        if (v33[24])
        {
          unsigned int v16 = objc_opt_new();
          [v16 setLocation:[*(id *)(*(void *)(a1 + 40) + 8) location:v24, v25, v26, v27, v28, v29]];
          [v16 setContentItems:v15];
          uint64_t v17 = sub_10002C428(2);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            uint64_t v18 = sub_100011FF0(v16);
            *(_DWORD *)id v36 = 138412290;
            id v37 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Built delta queue: %@", v36, 0xCu);
          }
          uint64_t v19 = [v16 data];
          uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
          id v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;
        }
        else
        {
          uint64_t v22 = sub_10002C428(2);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v36 = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Nothing changed, delta queue is empty", v36, 2u);
          }

          uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
          unsigned int v16 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = 0;
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_22;
      }
      int v9 = sub_10002C428(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v36 = 0;
        id v10 = "Count different, include new items in delta";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v10, v36, 2u);
      }
    }
    else
    {
      int v9 = sub_10002C428(2);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v36 = 0;
        id v10 = "Location different, include new items in delta";
        goto LABEL_12;
      }
    }

    v33[24] = 1;
    goto LABEL_14;
  }
  int v11 = sub_10002C428(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Previous data empty, serialize the full queue with all metadata", buf, 2u);
  }

  uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 8) data];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  CC_LONG v3 = *(_NMRPlaybackQueue **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
LABEL_22:
}

void sub_100011BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011C24(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  }
  unsigned int v7 = objc_opt_new();
  id v8 = [v5 identifier];
  int v9 = [v6 identifier];
  [v7 setIdentifier:v8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && ([v8 isEqualToString:v9] & 1) == 0)
  {
    id v10 = sub_10002C428(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v15 = 134217984;
      *(void *)&v15[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found an item that didn't match up (index %lu), include new items in delta", v15, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  int v11 = sub_100011EA4(v8, *(void **)(a1 + 32));
  if (([v11 hasMetadata] & 1) == 0)
  {
    uint64_t v12 = sub_10002C428(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v15 = 134217984;
      *(void *)&v15[4] = a3;
      uint64_t v13 = "Found an item missing metadata (index %lu)";
      goto LABEL_15;
    }
LABEL_16:

    id v14 = [v5 metadata];
    [v7 setMetadata:v14];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 40) containsObject:v8])
  {
    uint64_t v12 = sub_10002C428(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v15 = 134217984;
      *(void *)&v15[4] = a3;
      uint64_t v13 = "Found an item with invalidated metadata (index %lu)";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v13, v15, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:
  [*(id *)(a1 + 48) addObject:v7, *(_OWORD *)v15];
}

id sub_100011EA4(void *a1, void *a2)
{
  id v3 = a1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        int v9 = [v8 identifier];
        if ([v3 isEqualToString:v9])
        {
          id v5 = v8;

          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

id sub_100011FF0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 contentItems];
  uint64_t v17 = v1;
  uint64_t v3 = +[NSString stringWithFormat:@"Playback queue with range %d -> %lu", [v1 location], [v2 count]];
  id v4 = objc_opt_new();
  unsigned int v16 = (void *)v3;
  [v4 appendString:v3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v2;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 identifier];
        unsigned int v11 = [v9 hasMetadata];
        long long v12 = [v9 metadata];
        long long v13 = [v12 title];
        long long v14 = +[NSString stringWithFormat:@"\n  ContentItem identifier=%@, hasMetadata=%d, title=%@", v10, v11, v13];

        [v4 appendString:v14];
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v4;
}

void sub_100012298(uint64_t a1)
{
  uint64_t v2 = [[_NMRPlaybackQueue alloc] initWithData:*(void *)(a1 + 32)];
  uint64_t v3 = objc_opt_new();
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  unsigned int v4 = [*(id *)(*(void *)(a1 + 40) + 8) location];
  if (v4 != [(_NMRPlaybackQueue *)v2 location]) {
    *((unsigned char *)v23 + 24) = 1;
  }
  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) contentItems];
  id v6 = [(_NMRPlaybackQueue *)v2 contentItems];
  id v7 = [v5 count];
  if (v7 != [v6 count]) {
    *((unsigned char *)v23 + 24) = 1;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001257C;
  v17[3] = &unk_100044E78;
  id v8 = v5;
  long long v21 = &v22;
  uint64_t v9 = *(void *)(a1 + 40);
  id v18 = v8;
  uint64_t v19 = v9;
  id v10 = v3;
  id v20 = v10;
  [v6 enumerateObjectsUsingBlock:v17];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), v2);
  unsigned int v11 = sub_10002C428(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    long long v12 = sub_100011FF0(*(void **)(*(void *)(a1 + 40) + 8));
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updated with new data, queue is now: %@", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000128BC;
  block[3] = &unk_100044EC8;
  id v15 = v10;
  unsigned int v16 = &v22;
  block[4] = *(void *)(a1 + 40);
  id v13 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v22, 8);
}

void sub_10001254C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001257C(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  }
  id v7 = [v5 identifier];
  id v8 = [v6 identifier];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && ([v7 isEqualToString:v8] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t v9 = [*(id *)(a1 + 40) _metadataForItemWithIdentifier:v7];
  if ([v5 hasMetadata])
  {
    if (v9)
    {
      uint64_t v10 = sub_100012758(v5, 1);
      if (v10)
      {
        unsigned int v11 = (void *)v10;
        if (!a3 && *(void *)(*(void *)(a1 + 40) + 40)) {
          MRContentItemSetNowPlayingInfo();
        }
        [*(id *)(a1 + 48) addObject:v11];
      }
    }
  }
  else if (v9)
  {
    [v5 setMetadata:v9];
  }
  else
  {
    long long v12 = sub_10002C428(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      long long v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got a new queue item that didn't include metadata, and we don't have any cached metadata for this item, identifier: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

uint64_t sub_100012758(void *a1, int a2)
{
  id v3 = a1;
  [v3 identifier];
  uint64_t v4 = MRContentItemCreate();
  if (a2)
  {
    id v5 = [v3 metadata];
    [v5 title];
    MRContentItemSetTitle();
    [v5 artist];
    MRContentItemSetTrackArtistName();
    [v5 album];
    MRContentItemSetAlbumName();
    if ([v5 hasDuration])
    {
      [v5 duration];
      MRContentItemSetDuration();
    }
    if ([v5 hasIsAutoPlayItem])
    {
      uint64_t v8 = MPNowPlayingContentItemUserInfoKeyIsAutoPlayItem;
      id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isAutoPlayItem]);
      uint64_t v9 = v6;
      +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      MRContentItemSetUserInfo();
    }
  }

  return v4;
}

void sub_1000128BC(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [WeakRetained playbackQueueDidChange:*(void *)(a1 + 32)];
  }
  if ([*(id *)(a1 + 40) count])
  {
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    [v3 playbackQueue:*(void *)(a1 + 32) contentItemsDidChange:*(void *)(a1 + 40)];
  }
}

uint64_t sub_100012B58(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _updateWithMediaRemoteQueue:a2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012BFC;
  block[3] = &unk_100044D08;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100012BFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained playbackQueueDidChange:*(void *)(a1 + 32)];
}

void sub_1000131A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_100013288();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MRContentItemGetIdentifier();

  id v5 = [*(id *)(a1 + 32) _metadataForItemWithIdentifier:v4];
  id v6 = v5;
  id v7 = v10;
  if (v5)
  {
    [v5 mergeFrom:v10];
    id v7 = v6;
  }
  id v8 = v7;
  uint64_t v9 = objc_opt_new();
  [v9 setIdentifier:v4];
  [v9 setMetadata:v8];
  [*(id *)(a1 + 40) addObject:v9];
}

id sub_100013288()
{
  v0 = objc_opt_new();
  [v0 setTitle:MRContentItemGetTitle()];
  uint64_t TrackArtistName = MRContentItemGetTrackArtistName();
  if (!TrackArtistName) {
    uint64_t TrackArtistName = MRContentItemGetAlbumArtistName();
  }
  [v0 setArtist:TrackArtistName];
  [v0 setAlbum:MRContentItemGetAlbumName()];
  if (MRContentItemGetHasDuration())
  {
    MRContentItemGetDuration();
    [v0 setDuration:];
  }
  uint64_t v2 = (void *)MRContentItemCopyUserInfo();
  id v3 = [v2 objectForKey:MPNowPlayingContentItemUserInfoKeyIsAutoPlayItem];
  uint64_t v4 = v3;
  if (v3) {
    [v0 setIsAutoPlayItem:[v3 BOOLValue]];
  }

  return v0;
}

void sub_100013418(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013530;
  v10[3] = &unk_100044F18;
  id v3 = *(void **)(a1 + 32);
  v10[4] = *(void *)(a1 + 40);
  id v4 = v2;
  id v11 = v4;
  [v3 enumerateObjectsUsingBlock:v10];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001365C;
  v7[3] = &unk_100044CB8;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_100013530(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MRContentItemGetIdentifier();
  uint64_t v5 = [*(id *)(a1 + 32) _itemWithIdentifier:v4];
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v3];
    id v6 = sub_100013288();
    id v7 = [v5 metadata];
    [v7 mergeFrom:v6];
  }
  else
  {
    id v6 = sub_10002C428(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No need to update content item (identifier: %@), not currently in queue", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_10001365C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
    [WeakRetained playbackQueue:*(void *)(a1 + 40) contentItemsDidChange:*(void *)(a1 + 32)];
  }
}

void sub_1000137F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_100013814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result = [*(id *)(a1 + 32) _needsMetadataForMediaRemoteItem:a2];
  if (result)
  {
    uint64_t v6 = *(void *)(a1 + 56) + a3;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void *)(v7 + 24);
    if (v8 >= v6) {
      uint64_t v8 = *(void *)(a1 + 56) + a3;
    }
    *(void *)(v7 + 24) = v8;
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(void *)(v9 + 24) > v6) {
      uint64_t v6 = *(void *)(v9 + 24);
    }
    *(void *)(v9 + 24) = v6;
  }
  return result;
}

uint64_t sub_100013DD0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    unint64_t v12 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      uint64_t v18 = PBReaderReadData();
      uint64_t v19 = 8;
    }
    else
    {
      if (v12 != 2)
      {
        if (v12 == 1)
        {
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          while (1)
          {
            unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if ((v17 & 0x80) == 0) {
              goto LABEL_33;
            }
            v13 += 7;
            BOOL v9 = v14++ >= 9;
            if (v9)
            {
              LODWORD(v15) = 0;
              goto LABEL_35;
            }
          }
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_33:
          if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v15) = 0;
          }
LABEL_35:
          *(_DWORD *)(a1 + 24) = v15;
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
      uint64_t v18 = PBReaderReadString();
      uint64_t v19 = 16;
    }
    id v20 = *(void **)(a1 + v19);
    *(void *)(a1 + v19) = v18;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10001493C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (2)
    {
      if (!*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
      {
        char v4 = 0;
        unsigned int v5 = 0;
        unint64_t v6 = 0;
        while (1)
        {
          uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v8 = v7 + 1;
          if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
          v6 |= (unint64_t)(v9 & 0x7F) << v4;
          if ((v9 & 0x80) == 0) {
            goto LABEL_11;
          }
          v4 += 7;
          BOOL v10 = v5++ >= 9;
          if (v10)
          {
            unint64_t v6 = 0;
            int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
            goto LABEL_13;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          unint64_t v6 = 0;
        }
LABEL_13:
        int v12 = v6 & 7;
        if (!v11 && v12 != 4)
        {
          switch((v6 >> 3))
          {
            case 1u:
              char v14 = 0;
              unsigned int v15 = 0;
              uint64_t v16 = 0;
              *(unsigned char *)(a1 + 48) |= 2u;
              while (1)
              {
                uint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v18 = v17 + 1;
                if (v17 == -1 || v18 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                  break;
                }
                char v19 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18;
                v16 |= (unint64_t)(v19 & 0x7F) << v14;
                if ((v19 & 0x80) == 0) {
                  goto LABEL_51;
                }
                v14 += 7;
                BOOL v10 = v15++ >= 9;
                if (v10)
                {
                  LODWORD(v16) = 0;
                  goto LABEL_53;
                }
              }
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_51:
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v16) = 0;
              }
LABEL_53:
              uint64_t v33 = 40;
              goto LABEL_58;
            case 2u:
              if (v12 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2
                                                                                    + OBJC_IVAR___PBDataReader__length)
                     && !*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
                {
                  char v20 = 0;
                  unsigned int v21 = 0;
                  uint64_t v22 = 0;
                  while (1)
                  {
                    uint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                    unint64_t v24 = v23 + 1;
                    if (v23 == -1 || v24 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                      break;
                    }
                    char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
                    *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24;
                    v22 |= (unint64_t)(v25 & 0x7F) << v20;
                    if (v25 < 0)
                    {
                      v20 += 7;
                      BOOL v10 = v21++ >= 9;
                      if (!v10) {
                        continue;
                      }
                    }
                    goto LABEL_39;
                  }
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_39:
                  PBRepeatedUInt32Add();
                }
                PBReaderRecallMark();
              }
              else
              {
                char v34 = 0;
                unsigned int v35 = 0;
                uint64_t v36 = 0;
                while (1)
                {
                  uint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v38 = v37 + 1;
                  if (v37 == -1 || v38 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                    break;
                  }
                  char v39 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v38;
                  v36 |= (unint64_t)(v39 & 0x7F) << v34;
                  if (v39 < 0)
                  {
                    v34 += 7;
                    BOOL v10 = v35++ >= 9;
                    if (!v10) {
                      continue;
                    }
                  }
                  goto LABEL_68;
                }
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_68:
                PBRepeatedUInt32Add();
              }
LABEL_71:
              if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
              }
              continue;
            case 3u:
              *(unsigned char *)(a1 + 48) |= 1u;
              unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                uint64_t v27 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                uint64_t v27 = 0;
              }
              *(void *)(a1 + 32) = v27;
              goto LABEL_71;
            case 4u:
              char v28 = 0;
              unsigned int v29 = 0;
              uint64_t v16 = 0;
              *(unsigned char *)(a1 + 48) |= 4u;
              while (2)
              {
                uint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v31 = v30 + 1;
                if (v30 == -1 || v31 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v32 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v31;
                  v16 |= (unint64_t)(v32 & 0x7F) << v28;
                  if (v32 < 0)
                  {
                    v28 += 7;
                    BOOL v10 = v29++ >= 9;
                    if (v10)
                    {
                      LODWORD(v16) = 0;
                      goto LABEL_57;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v16) = 0;
              }
LABEL_57:
              uint64_t v33 = 44;
LABEL_58:
              *(_DWORD *)(a1 + v33) = v16;
              goto LABEL_71;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_71;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10001597C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 160));
  _Unwind_Resume(a1);
}

void sub_100015A00(uint64_t a1)
{
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained eagerUpdateTimerFired];
    id WeakRetained = v3;
  }
}

void sub_100015A64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unsigned int v5 = sub_10002C428(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
      uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
      *(_DWORD *)buf = 138412546;
      unint64_t v18 = v6;
      __int16 v19 = 2112;
      char v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) _refreshCurrentNowPlayingInfoWithCompletion - os_transaction_create", buf, 0x16u);
    }
    unint64_t v8 = (void *)os_transaction_create();
    id v9 = WeakRetained[2];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100015C34;
    v12[3] = &unk_100044F90;
    id v16 = v3;
    id v13 = v9;
    id v14 = *(id *)(a1 + 32);
    id v15 = v8;
    id v10 = v8;
    id v11 = v9;
    [WeakRetained _refreshCurrentNowPlayingInfoWithCompletion:v12];
  }
}

void sub_100015C34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015CE8;
  v4[3] = &unk_100044CB8;
  id v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);
}

void sub_100015CE8(uint64_t a1)
{
  uint64_t v2 = sub_10002C428(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
    char v4 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    unint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) _refreshCurrentNowPlayingInfoWithCompletion - os_release", (uint8_t *)&v5, 0x16u);
  }
}

void sub_100015DD4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _refreshCurrentNowPlayingApplicationInfoWithCompletion:v5];
  }
}

void sub_100015E38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = sub_10002C428(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
      __int16 v7 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
      *(_DWORD *)buf = 138412546;
      unint64_t v18 = v6;
      __int16 v19 = 2112;
      char v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) _refreshArtworkWithCompletion - os_transaction_create", buf, 0x16u);
    }
    unint64_t v8 = (void *)os_transaction_create();
    id v9 = WeakRetained[2];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100016008;
    v12[3] = &unk_100044F90;
    id v16 = v3;
    id v13 = v9;
    id v14 = *(id *)(a1 + 32);
    id v15 = v8;
    id v10 = v8;
    id v11 = v9;
    [WeakRetained _refreshArtworkWithCompletion:v12];
  }
}

void sub_100016008(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000160BC;
  v4[3] = &unk_100044CB8;
  id v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);
}

void sub_1000160BC(uint64_t a1)
{
  uint64_t v2 = sub_10002C428(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
    char v4 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    unint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) _refreshArtworkWithCompletion - os_release", (uint8_t *)&v5, 0x16u);
  }
}

void sub_10001678C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = objc_opt_new();
    [v2 setQueueData:*(void *)(a1 + 32)];
    id v3 = [WeakRetained[18] copy];
    [v2 setInvalidatedMetadataIdentifiers:v3];

    [WeakRetained[17] setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void sub_1000168F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nowPlayingInfoDigest];
  id v3 = [*(id *)(a1 + 32) applicationInfoDigest];
  char v4 = [*(id *)(a1 + 32) supportedCommandsDigest];
  int v5 = [*(id *)(a1 + 32) playbackQueueDigest];
  __int16 v13 = 0;
  __int16 v12 = 0;
  id v6 = [*(id *)(a1 + 40) _currentNowPlayingIgnoringDigestMatches:1 digest:v2 digestMatched:(char *)&v13 + 1];
  __int16 v7 = [*(id *)(a1 + 40) _currentNowPlayingApplicationInfoIgnoringDigestMatches:1 digest:v3 digestMatched:&v13];
  unint64_t v8 = [*(id *)(a1 + 40) _currentSupportedCommandsIgnoringDigestMatches:1 digest:v4 digestMatches:(char *)&v12 + 1];
  id v9 = [*(id *)(a1 + 40) _currentFullPlaybackQueueIgnoringDigestMatches:1 digest:v5 digestMatched:&v12];
  if (HIBYTE(v13) && (_BYTE)v13 && HIBYTE(v12) && (_BYTE)v12)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = +[NMRMediaRemoteSetStateMessage messageWithNowPlayingInfo:v6 applicationInfo:v7 supportedCommands:v8 playbackQueue:v9 originIdentifier:*(void *)(*(void *)(a1 + 40) + 168)];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v10);
  }
}

void sub_100016B1C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:kMRMediaRemoteNowPlayingInfoArtworkData];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:@"NMRAugmentedNowPlayingInfoArtworkDataDigest"];
  if ([v2 length])
  {
    CFDataRef v4 = v2;
    uint64_t v2 = +[NSMutableData data];
    v21[0] = kCGImageDestinationImageMaxPixelSize;
    LODWORD(v5) = 1134297088;
    id v6 = +[NSNumber numberWithFloat:v5];
    v22[0] = v6;
    v21[1] = kCGImageDestinationLossyCompressionQuality;
    LODWORD(v7) = 0.75;
    unint64_t v8 = +[NSNumber numberWithFloat:v7];
    v22[1] = v8;
    CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

    CGImageDestinationRef v10 = CGImageDestinationCreateWithData((CFMutableDataRef)v2, @"public.jpeg", 1uLL, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      __int16 v12 = CGImageSourceCreateWithData(v4, 0);
      if (v12)
      {
        __int16 v13 = v12;
        CGImageDestinationAddImageFromSource(v11, v12, 0, v9);
        CGImageDestinationFinalize(v11);
        CFRelease(v13);
      }
      CFRelease(v11);
    }
    id v14 = sub_10002C428(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      id v18 = [(__CFData *)v4 length];
      __int16 v19 = 2048;
      id v20 = [v2 length];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Resized JPEG from %zd bytes to %zd bytes.", (uint8_t *)&v17, 0x16u);
    }
  }
  id v15 = +[NMRMediaRemoteSetArtworkMessage messageWithJPEGArtwork:v2 originalDigest:v3 originIdentifier:*(void *)(*(void *)(a1 + 32) + 168)];
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v15);
  }
}

id sub_100016E5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWithQueue:*(void *)(*(void *)(a1 + 40) + 8) completion:*(void *)(a1 + 48)];
}

void sub_100016F34(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) command];
  id v3 = [*(id *)(a1 + 32) bundleID];
  CFDataRef v4 = [*(id *)(a1 + 32) options];
  double v5 = v4;
  BOOL v6 = !v2 || v2 == 122 || v2 == 2;
  double v7 = [v4 objectForKeyedSubscript:kMRMediaRemoteOptionSendOptionsNumber];
  unsigned __int8 v8 = [v7 unsignedIntValue];

  char v9 = v8 | v6;
  if (!v3)
  {
    id v3 = [v5 objectForKeyedSubscript:kMRMediaRemoteOptionDestinationAppDisplayID];
  }
  CGImageDestinationRef v10 = sub_10002C428(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 160) displayName];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 160) uniqueIdentifier];
    __int16 v13 = (void *)v12;
    CFStringRef v14 = @"YES";
    *(_DWORD *)buf = 138413570;
    int v17 = v11;
    __int16 v18 = 2112;
    if ((v9 & 1) == 0) {
      CFStringRef v14 = @"NO";
    }
    uint64_t v19 = v12;
    __int16 v20 = 1024;
    unsigned int v21 = v2;
    __int16 v22 = 2112;
    uint64_t v23 = v3;
    __int16 v24 = 2112;
    CFStringRef v25 = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Sending media remote command %d to bundleID %@, launching: %@, options: %@", buf, 0x3Au);
  }
  [*(id *)(*(void *)(a1 + 40) + 160) mediaRemoteOrigin];
  id v15 = *(id *)(a1 + 48);
  MRMediaRemoteSendCommandToApp();
}

void sub_1000171A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  BOOL v6 = sub_10002C428(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
    unsigned __int8 v8 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
    int v9 = *(_DWORD *)(a1 + 48);
    CGImageDestinationRef v10 = [v5 componentsJoinedByString:@","];
    int v13 = 138413314;
    CFStringRef v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 1024;
    int v18 = v9;
    __int16 v19 = 1024;
    int v20 = a2;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Replying to media remote command %d with error code %d, handlerReturnStatuses: [%@].", (uint8_t *)&v13, 0x2Cu);
  }
  uint64_t v11 = +[NMRSendCommandResultMessage messageWithErrorCode:a2 handlerReturnStatuses:v5 originIdentifier:*(void *)(*(void *)(a1 + 32) + 168)];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);
  }
}

void sub_1000173D4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 136) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v3 = sub_10002C428(2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        CFDataRef v4 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
        id v5 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
        *(_DWORD *)buf = 138412546;
        int v20 = v4;
        __int16 v21 = 2112;
        __int16 v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Successfully delivered playback queue state", buf, 0x16u);
      }
      uint64_t v6 = [v2 queueData];
      uint64_t v7 = *(void *)(a1 + 32);
      unsigned __int8 v8 = *(void **)(v7 + 152);
      *(void *)(v7 + 152) = v6;

      int v9 = [v2 invalidatedMetadataIdentifiers];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v15;
        do
        {
          int v13 = 0;
          do
          {
            if (*(void *)v15 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(*(void *)(a1 + 32) + 144) removeObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13)];
            int v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v11);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 136) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

void sub_100017658(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] == (id)1
    && ([*(id *)(a1 + 32) firstObject],
        unsigned int v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        sub_1000177EC(*(void *)(*(void *)(a1 + 40) + 40), (uint64_t)v2)))
  {
    id v3 = sub_10002C428(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      CFDataRef v4 = [*(id *)(*(void *)(a1 + 40) + 160) displayName];
      id v5 = [*(id *)(*(void *)(a1 + 40) + 160) uniqueIdentifier];
      *(_DWORD *)buf = 138412546;
      int v13 = v4;
      __int16 v14 = 2112;
      long long v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[LinkAgent] (%@-%@) Suppressing playbackQueue's contentItem update because it is the nowPlayingContentItem.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 40) + 128);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100017848;
    v9[3] = &unk_100044CB8;
    uint64_t v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v11 = v8;
    dispatch_async(v6, v9);
    id v3 = v10;
  }
}

BOOL sub_1000177EC(uint64_t a1, uint64_t a2)
{
  if (!a1 || !a2) {
    return (a1 | a2) == 0;
  }
  Identifier = (const void *)MRContentItemGetIdentifier();
  id v3 = (const void *)MRContentItemGetIdentifier();
  return CFEqual(Identifier, v3) != 0;
}

id sub_100017848(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = (char *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    CFDataRef v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = MRContentItemGetIdentifier();
        [*(id *)(*(void *)(a1 + 40) + 144) addObject:v7, v9];

        ++v6;
      }
      while (v4 != v6);
      CFDataRef v4 = (char *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _scheduleEagerUpdate:3];
}

void sub_100017FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018298(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000182A8(uint64_t a1)
{
}

void sub_1000182B0(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t Identifier = MRContentItemGetIdentifier();
    uint64_t v2 = +[NSArray arrayWithObjects:&Identifier count:1];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    CFDataRef v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

void sub_100018344(uint64_t a1, int a2, CFErrorRef err)
{
  if (!err
    || [(__CFString *)(id)CFErrorGetDomain(err) isEqualToString:kMRMediaRemoteFrameworkErrorDomain]&& CFErrorGetCode(err) == 35)
  {
    uint64_t ContentItemAtOffset = MRPlaybackQueueGetContentItemAtOffset();
    MRPlaybackQueueGetResolvedPlayerPath();
    if (MRNowPlayingPlayerPathGetClient())
    {
      Bundleuint64_t Identifier = (const __CFString *)MRNowPlayingClientGetBundleIdentifier();
      CFStringRef v7 = (const __CFString *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
      if (BundleIdentifier && CFEqual(BundleIdentifier, v7))
      {
        uint64_t v17 = kMRMediaRemoteNowPlayingInfoIsMusicApp;
        int v18 = &__kCFBooleanTrue;
        +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        MRContentItemSetNowPlayingInfo();
      }
    }
    else
    {
      CFStringRef v7 = (const __CFString *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    }
    CFRelease(v7);
    [*(id *)(a1 + 32) _updateNowPlayingInfoWithContentItem:ContentItemAtOffset];
  }
  else
  {
    uint64_t v8 = sub_10002C428(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000312BC();
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
  long long v10 = sub_10002C428(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
    long long v12 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
    int v13 = 138412546;
    __int16 v14 = v11;
    __int16 v15 = 2112;
    long long v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Finished fetching now playing info.", (uint8_t *)&v13, 0x16u);
  }
}

void sub_1000188B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000188E8(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MRContentItemGetIdentifier();
    return _objc_release_x1();
  }
  return result;
}

void sub_100018948(uint64_t a1, int a2, CFErrorRef err)
{
  if (!err
    || [(__CFString *)(id)CFErrorGetDomain(err) isEqualToString:kMRMediaRemoteFrameworkErrorDomain]&& CFErrorGetCode(err) == 35)
  {
    ContentItemForuint64_t Identifier = MRPlaybackQueueGetContentItemForIdentifier();
    if (sub_1000177EC(*(void *)(*(void *)(a1 + 32) + 40), ContentItemForIdentifier))
    {
      [*(id *)(a1 + 32) _updateNowPlayingInfoWithContentItem:ContentItemForIdentifier];
    }
    else
    {
      CFStringRef v7 = sub_10002C428(2);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
        uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
        int v14 = 138412546;
        __int16 v15 = v8;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Skipped updating artwork because item has changed.", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v6 = sub_10002C428(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000312BC();
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
  long long v11 = sub_10002C428(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
    int v13 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
    int v14 = 138412546;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Finished fetching artwork.", (uint8_t *)&v14, 0x16u);
  }
}

id sub_100018C08(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _scheduleEagerUpdate:2];
}

void sub_100018EC0(uint64_t a1, int a2)
{
  CFDataRef v4 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
  uint64_t v5 = sub_10002C428(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
    CFStringRef v7 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    long long v11 = v7;
    __int16 v12 = 2112;
    int v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Got new now playing state %@", (uint8_t *)&v8, 0x20u);
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 88) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100018FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    CFDataRef v4 = sub_10002C428(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100031358();
    }
  }
  else
  {
    CFDataRef v4 = *(id *)(*(void *)(a1 + 32) + 80);
    uint64_t v5 = MRNowPlayingClientGetBundleIdentifier();
    uint64_t v6 = *(void *)(a1 + 32);
    CFStringRef v7 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = v5;

    if (v4 != *(NSObject **)(*(void *)(a1 + 32) + 80)
      && (-[NSObject isEqual:](v4, "isEqual:") & 1) == 0)
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 92) = MRNowPlayingClientGetProcessIdentifier();
      uint64_t v8 = MRNowPlayingClientGetDisplayName();
      uint64_t v9 = *(void *)(a1 + 32);
      __int16 v10 = *(void **)(v9 + 72);
      *(void *)(v9 + 72) = v8;

      long long v11 = sub_10002C428(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
        int v13 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 72);
        uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 80);
        int v16 = 138413058;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        __int16 v19 = v13;
        __int16 v20 = 2112;
        uint64_t v21 = v15;
        __int16 v22 = 2112;
        uint64_t v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Got new now playing application %@-%@", (uint8_t *)&v16, 0x2Au);
      }
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_1000191AC(uint64_t a1)
{
  [*(id *)(a1 + 32) _scheduleEagerUpdate:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id sub_10001986C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateNowPlayingInfoWithContentItem:a2];
}

id sub_100019878(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) executeUpdateBlock];
}

void sub_100019974(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 40) objectForKey:kMRMediaRemoteUpdatedContentItemsUserInfoKey];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = [v2 countByEnumeratingWithState:&v10 objects:v20 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          if (sub_1000177EC(*(void *)(*(void *)(a1 + 32) + 40), *(void *)(*((void *)&v10 + 1) + 8 * i)))
          {
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v10 objects:v20 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v2 = sub_10002C428(2);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = [*(id *)(*(void *)(a1 + 32) + 160) displayName];
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 160) uniqueIdentifier];
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Received %@ without current nowPlayingItem", buf, 0x20u);
    }
  }
}

void sub_100019C9C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  if (([v10 isEqualToString:kMRMediaRemoteNowPlayingInfoDuration] & 1) == 0
    && ([v10 isEqualToString:kMRMediaRemoteNowPlayingInfoElapsedTime] & 1) == 0
    && ([v10 isEqualToString:kMRMediaRemoteNowPlayingInfoTimestamp] & 1) == 0
    && ([v10 isEqualToString:kMRMediaRemoteNowPlayingInfoArtworkData] & 1) == 0)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
    uint64_t v9 = v8;
    if (!v8 || ([v8 isEqual:v7] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

void sub_100019DBC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_100019DDC()
{
  return *(void *)(*(void *)(v0 + 32) + 160);
}

uint64_t sub_100019DFC(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 160);
}

BOOL sub_100019F68(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
LABEL_21:
        uint64_t v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = PBReaderReadData();
    uint64_t v13 = 8;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t start()
{
  signal(15, (void (__cdecl *)(int))1);
  uint64_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v0, &stru_1000451E0);
  id v2 = +[NMRLinkAgentServer server];
  id v3 = +[NACDaemonServer companionServer];
  id v4 = +[NACXPCServer server];
  CFRunLoopRun();

  return 1;
}

void sub_10001A540(id a1)
{
  id v1 = sub_10002C428(2);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received SIGTERM; exiting.", v2, 2u);
  }

  exit(0);
}

uint64_t sub_10001A900(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A910(uint64_t a1)
{
}

void sub_10001A918(uint64_t a1)
{
}

CFTypeRef sub_10001A9D8(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    id v3 = (const void *)MROriginCopy();
    CFTypeRef result = CFAutorelease(v3);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

void sub_10001AAC4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  if (v3)
  {
    if ([v3 isDeviceRoute])
    {
LABEL_3:
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v5 = 1;
LABEL_9:
      *(void *)(v4 + 24) = v5;
      return;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 16) isAppleTVRoute])
    {
LABEL_8:
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v5 = 3;
      goto LABEL_9;
    }
    unsigned int v6 = [*(id *)(*(void *)(a1 + 32) + 16) isB520Route];
    unint64_t v7 = *(void **)(*(void *)(a1 + 32) + 16);
    if (v6)
    {
      unsigned int v8 = [v7 isStereoPair];
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v8) {
        uint64_t v5 = 5;
      }
      else {
        uint64_t v5 = 4;
      }
      goto LABEL_9;
    }
    if ([v7 isHomePodRoute])
    {
      unsigned int v9 = [*(id *)(*(void *)(a1 + 32) + 16) isStereoPair];
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v9) {
        uint64_t v5 = 7;
      }
      else {
        uint64_t v5 = 6;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)(v2 + 40))
  {
    switch(MRPairedDeviceGetDeviceClass())
    {
      case 1:
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v5 = 2;
        goto LABEL_9;
      case 4:
        goto LABEL_8;
      case 6:
        goto LABEL_3;
      case 7:
        id v15 = *(id *)(*(void *)(a1 + 32) + 40);
        int v10 = [v15 modelID];
        unsigned int v11 = [v10 hasPrefix:@"AudioAccessory5,"];
        int IsTightlySyncedGroup = MRPairedDeviceIsTightlySyncedGroup();
        uint64_t v13 = 4;
        if (IsTightlySyncedGroup) {
          uint64_t v13 = 5;
        }
        uint64_t v14 = 6;
        if (IsTightlySyncedGroup) {
          uint64_t v14 = 7;
        }
        if (!v11) {
          uint64_t v13 = v14;
        }
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;

        break;
      default:
        return;
    }
  }
}

uint64_t sub_10001AD44(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

uint64_t sub_10001AE48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = [v3 routeUID];
    uint64_t v5 = [v4 lastPathComponent];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v5;
  }
  else
  {
    uint64_t result = *(void *)(v2 + 40);
    if (!result) {
      return result;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = sub_10001AEEC();
  }

  return _objc_release_x1();
}

__CFString *sub_10001AEEC()
{
  uint64_t v0 = (__CFString *)MRPairedDeviceCopyDeviceUID();
  id v1 = v0;
  if (!v0)
  {
    if (MRPairedDeviceGetDeviceClass() == 1) {
      uint64_t v0 = @"CMPN";
    }
    else {
      uint64_t v0 = @"LOCAL";
    }
  }
  uint64_t v2 = v0;

  return v2;
}

uint64_t sub_10001B038(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 48))
  {
    id v3 = *(void **)(v2 + 16);
    if (v3)
    {
      uint64_t v4 = [v3 designatedGroupLeaderName];
      id v5 = [v4 length];
      unsigned int v6 = *(void **)(*(void *)(a1 + 32) + 16);
      if (v5) {
        [v6 designatedGroupLeaderName];
      }
      else {
      unsigned int v9 = [v6 routeName];
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v9);
    }
    else
    {
      uint64_t v7 = MRPairedDeviceCopyGroupName();
      if (!v7)
      {
        uint64_t v7 = MRPairedDeviceCopyName();
        if (!v7)
        {
          uint64_t v7 = MROriginGetDisplayName();
        }
      }
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v4 = *(void **)(v8 + 48);
      *(void *)(v8 + 48) = v7;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return _objc_release_x1();
}

uint64_t sub_10001B21C(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSNumber numberWithInt:MROriginGetUniqueIdentifier()];
    return _objc_release_x1();
  }
  return result;
}

unint64_t sub_10001B33C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  if (v3)
  {
    unint64_t result = (unint64_t)[v3 isDeviceRoute];
  }
  else
  {
    unint64_t result = *(void *)(v2 + 24);
    if (!result) {
      return result;
    }
    unint64_t result = MROriginIsLocalOrigin() != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_10001B43C(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    uint64_t result = MROriginGetUniqueIdentifier();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 1129140302;
  }
  return result;
}

void sub_10001B538(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  if (v3)
  {
    id v4 = [v3 routeNames];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 count];
  }
  else if (*(void *)(v2 + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MRPairedDeviceGetGroupLogicalDeviceCount();
  }
}

id *sub_10001B660(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = *(void **)(v2 + 16);
  uint64_t result = (id *)(v2 + 16);
  if (v3 != v5)
  {
    objc_storeStrong(result, v3);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = 0;

    uint64_t v8 = *(void **)(a1 + 40);
    return (id *)[v8 _updateConnectionState];
  }
  return result;
}

void sub_10001B73C(uint64_t a1)
{
  int v2 = MROriginEqualToOrigin();
  if (!v2)
  {
    id v3 = *(const void **)(*(void *)(a1 + 32) + 24);
    if (v3) {
      CFRelease(v3);
    }
    *(void *)(*(void *)(a1 + 32) + 24) = CFRetain(*(CFTypeRef *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    [*(id *)(a1 + 32) _updateConnectionState];
  }
  int v6 = MRPairedDeviceEqualToPairedDevice();
  if (v6)
  {
    if (v2) {
      return;
    }
  }
  else
  {
    uint64_t v7 = *(const void **)(*(void *)(a1 + 32) + 40);
    if (v7) {
      CFRelease(v7);
    }
    *(void *)(*(void *)(a1 + 32) + 40) = MRPairedDeviceCreateCopy();
    uint64_t v8 = *(void *)(a1 + 32);
    unsigned int v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = 0;
  }
  int v10 = sub_10002C428(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218496;
    uint64_t v14 = v11;
    __int16 v15 = 1024;
    BOOL v16 = v2 == 0;
    __int16 v17 = 1024;
    BOOL v18 = v6 == 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Origin] Updated origin: %p, originChanged:%d, deviceInfoChanged:%d", buf, 0x18u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B910;
  block[3] = &unk_100044D08;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10001B910(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"NMROriginDeviceInfoDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void sub_10001BB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001BB90(uint64_t a1)
{
}

void sub_10001BC3C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) connection];

  if (v2 == v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 _updateConnectionState];
  }
}

void sub_10001BD54(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) connection];

  if (v2 == v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 _updateConnectionState];
  }
}

void sub_10001BE6C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) connection];
  id v4 = [v3 externalDevice];

  if (v2 == v4)
  {
    id v5 = *(void **)(a1 + 40);
    [v5 _updateConnectionState];
  }
}

void sub_10001C198(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"NMROriginConnectionStateDidChangeNotification" object:*(void *)(a1 + 32)];
}

uint64_t sub_10001C2F0(uint64_t a1)
{
  qword_100050630 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_10001C68C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) array];

  return _objc_release_x1();
}

uint64_t sub_10001C7CC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 40)];

  return _objc_release_x1();
}

uint64_t sub_10001C90C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 48)];

  return _objc_release_x1();
}

void sub_10001CA50(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = +[NSNumber numberWithInt:1129140302];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t sub_10001CBFC(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];

  return _objc_release_x1();
}

uint64_t sub_10001CD74(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  return _objc_release_x1();
}

int64_t sub_10001D3A0(id a1, NMROrigin *a2, NMROrigin *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  if ((id)[(NMROrigin *)v4 type] == (id)1)
  {
    unint64_t v6 = 1;
  }
  else if ((id)[(NMROrigin *)v4 type] == (id)2)
  {
    unint64_t v6 = 2;
  }
  else
  {
    unint64_t v6 = 3;
  }
  if ((id)[(NMROrigin *)v5 type] == (id)1)
  {
    unint64_t v7 = 1;
  }
  else
  {
    id v8 = [(NMROrigin *)v5 type];
    unint64_t v7 = 2;
    if (v8 != (id)2) {
      unint64_t v7 = 3;
    }
  }
  if (v6 >= v7)
  {
    if (v6 > v7)
    {
      int64_t v9 = 1;
    }
    else
    {
      int v10 = [(NMROrigin *)v4 displayName];
      uint64_t v11 = [(NMROrigin *)v5 displayName];
      int64_t v9 = (int64_t)[v10 compare:v11];
    }
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

void sub_10001D498(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"NMROriginManagerAvailableOriginsDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_10001D6B0(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"NMROriginManagerActiveOriginDidChangeNotification" object:*(void *)(a1 + 32)];
}

id sub_10001D784(uint64_t a1)
{
  id result = (id)MRMediaRemoteGetLocalOrigin();
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 56))
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, v3);
    *(void *)(*(void *)(a1 + 32) + 56) = Mutable;
    id result = [*(id *)(a1 + 32) _onQueue_updateAvailableOrigins];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v4 + 48))
  {
    *(void *)(*(void *)(a1 + 32) + 48) = +[NSNumber numberWithInt:MROriginGetUniqueIdentifier()];
    return (id)_objc_release_x1();
  }
  return result;
}

void sub_10001DA90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10001DAB4(uint64_t a1, CFTypeRef cf)
{
  if (cf)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CFRetain(cf);
  }
  else
  {
    uint64_t v3 = sub_10002C428(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100031470(v3);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001DB24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = +[NSNumber numberWithInt:MROriginGetUniqueIdentifier()];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    unint64_t v7 = sub_10002C428(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000314B4(v7);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_10001DBB4(uint64_t a1)
{
  id v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    if (!*(void *)(*(void *)(a1 + 32) + 56)
      || (CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 56)),
          *(void *)(*(void *)(a1 + 32) + 56) = 0,
          (id v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) != 0))
    {
      *(void *)(*(void *)(a1 + 32) + 56) = CFRetain(v2);
      CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    }
    [*(id *)(a1 + 32) _onQueue_updateAvailableOrigins];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v3 _onQueue_updateActiveOriginIdentifier:v4];
}

void sub_10001DCF4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteOriginUserInfoKey];

  id v7 = +[NSNumber numberWithInt:MROriginGetUniqueIdentifier()];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v7];
  uint64_t v5 = [*(id *)(a1 + 32) userInfo];
  unint64_t v6 = [v5 objectForKeyedSubscript:kMRPairedDeviceUserInfoKey];

  [v4 updateOrigin:v3 deviceInfo:v6];
  [*(id *)(a1 + 40) _onQueue_updateAvailableOrigins];
}

void sub_10001DE90(uint64_t a1)
{
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 64))
  {
    id v2 = sub_10002C428(2);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 32) name];
      uint64_t v4 = [*(id *)(a1 + 32) availableRoutes];
      *(_DWORD *)buf = 138412546;
      __int16 v26 = v3;
      __int16 v27 = 2112;
      char v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[%@] Available routes did change: %@", buf, 0x16u);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = [*(id *)(a1 + 32) availableRoutes];
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v21;
      *(void *)&long long v7 = 138412546;
      long long v16 = v7;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [v11 connection:v16];
          uint64_t v13 = v12;
          if (v12
            && ([v12 isConnected] & 1) == 0
            && ([v13 isConnecting] & 1) == 0
            && ([v13 isInvalidated] & 1) == 0)
          {
            uint64_t v14 = sub_10002C428(2);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v15 = [*(id *)(a1 + 32) name];
              *(_DWORD *)buf = v16;
              __int16 v26 = v15;
              __int16 v27 = 2112;
              char v28 = v11;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Will connect to route %@...", buf, 0x16u);
            }
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_10001E154;
            v17[3] = &unk_100045320;
            id v18 = *(id *)(a1 + 32);
            uint64_t v19 = v11;
            [v13 connectWithCompletion:v17];
          }
        }
        id v8 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
  }
}

void sub_10001E154(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10002C428(2);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000314F8(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) name];
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Connected to route %@ successfully!", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t sub_10001E594(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 16;
        goto LABEL_25;
      case 2u:
        *(unsigned char *)(a1 + 40) |= 1u;
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        *(void *)(a1 + 8) = v17;
        continue;
      case 3u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 32;
LABEL_25:
        id v18 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      case 4u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
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
      uint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v23 = v22 + 1;
      if (v22 == -1 || v23 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23;
      v21 |= (unint64_t)(v24 & 0x7F) << v19;
      if ((v24 & 0x80) == 0) {
        goto LABEL_34;
      }
      v19 += 7;
      BOOL v10 = v20++ >= 9;
      if (v10)
      {
        LODWORD(v21) = 0;
        goto LABEL_36;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v21) = 0;
    }
LABEL_36:
    *(_DWORD *)(a1 + 24) = v21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10001FDB8(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 64;
        goto LABEL_115;
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 72;
        goto LABEL_115;
      case 3u:
        *(_WORD *)(a1 + 164) |= 1u;
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 <= 0xFFFFFFFFFFFFFFF7 && v16 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        uint64_t v84 = 8;
        goto LABEL_167;
      case 4u:
        *(_WORD *)(a1 + 164) |= 2u;
        unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v18 <= 0xFFFFFFFFFFFFFFF7 && v18 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        uint64_t v84 = 16;
        goto LABEL_167;
      case 5u:
        *(_WORD *)(a1 + 164) |= 0x80u;
        unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          int v20 = 0;
        }
        uint64_t v85 = 112;
        goto LABEL_170;
      case 6u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 164) |= 0x200u;
        while (2)
        {
          uint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v10 = v22++ >= 9;
              if (v10)
              {
                LODWORD(v23) = 0;
                goto LABEL_119;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_119:
        uint64_t v80 = 136;
        goto LABEL_124;
      case 7u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0;
        *(_WORD *)(a1 + 164) |= 0x400u;
        while (2)
        {
          uint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v10 = v28++ >= 9;
              if (v10)
              {
                LODWORD(v23) = 0;
                goto LABEL_123;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_123:
        uint64_t v80 = 140;
LABEL_124:
        *(_DWORD *)(a1 + v80) = v23;
        continue;
      case 8u:
        *(_WORD *)(a1 + 164) |= 0x20u;
        unint64_t v32 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v17 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v32);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v17 = 0;
        }
        uint64_t v84 = 48;
LABEL_167:
        *(void *)(a1 + v84) = v17;
        continue;
      case 9u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 144;
        goto LABEL_115;
      case 0xAu:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v35 = 0;
        *(_WORD *)(a1 + 164) |= 0x40u;
        while (2)
        {
          uint64_t v36 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v37 = v36 + 1;
          if (v36 == -1 || v37 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v36);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v37;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v10 = v34++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_128;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_128:
        uint64_t v81 = 56;
        goto LABEL_158;
      case 0xBu:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v41 = 0;
        *(_WORD *)(a1 + 164) |= 0x2000u;
        while (2)
        {
          uint64_t v42 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v42);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v43;
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v10 = v40++ >= 9;
              if (v10)
              {
                uint64_t v41 = 0;
                goto LABEL_132;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v41 = 0;
        }
LABEL_132:
        BOOL v82 = v41 != 0;
        uint64_t v83 = 162;
        goto LABEL_149;
      case 0xCu:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0;
        *(_WORD *)(a1 + 164) |= 0x4000u;
        while (2)
        {
          uint64_t v48 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v49 = v48 + 1;
          if (v48 == -1 || v49 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v48);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v49;
            v47 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              BOOL v10 = v46++ >= 9;
              if (v10)
              {
                uint64_t v47 = 0;
                goto LABEL_136;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v47 = 0;
        }
LABEL_136:
        BOOL v82 = v47 != 0;
        uint64_t v83 = 163;
        goto LABEL_149;
      case 0xDu:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v35 = 0;
        *(_WORD *)(a1 + 164) |= 4u;
        while (2)
        {
          uint64_t v53 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v54 = v53 + 1;
          if (v53 == -1 || v54 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v53);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v54;
            v35 |= (unint64_t)(v55 & 0x7F) << v51;
            if (v55 < 0)
            {
              v51 += 7;
              BOOL v10 = v52++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_140;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_140:
        uint64_t v81 = 24;
        goto LABEL_158;
      case 0xEu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 120;
        goto LABEL_115;
      case 0xFu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 128;
        goto LABEL_115;
      case 0x10u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 80;
        goto LABEL_115;
      case 0x11u:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v58 = 0;
        *(_WORD *)(a1 + 164) |= 0x1000u;
        while (2)
        {
          uint64_t v59 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v60 = v59 + 1;
          if (v59 == -1 || v60 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v61 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v59);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v60;
            v58 |= (unint64_t)(v61 & 0x7F) << v56;
            if (v61 < 0)
            {
              v56 += 7;
              BOOL v10 = v57++ >= 9;
              if (v10)
              {
                uint64_t v58 = 0;
                goto LABEL_144;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v58 = 0;
        }
LABEL_144:
        BOOL v82 = v58 != 0;
        uint64_t v83 = 161;
        goto LABEL_149;
      case 0x12u:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v64 = 0;
        *(_WORD *)(a1 + 164) |= 0x800u;
        while (2)
        {
          uint64_t v65 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v66 = v65 + 1;
          if (v65 == -1 || v66 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v65);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v66;
            v64 |= (unint64_t)(v67 & 0x7F) << v62;
            if (v67 < 0)
            {
              v62 += 7;
              BOOL v10 = v63++ >= 9;
              if (v10)
              {
                uint64_t v64 = 0;
                goto LABEL_148;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v64 = 0;
        }
LABEL_148:
        BOOL v82 = v64 != 0;
        uint64_t v83 = 160;
LABEL_149:
        *(unsigned char *)(a1 + v83) = v82;
        continue;
      case 0x13u:
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v35 = 0;
        *(_WORD *)(a1 + 164) |= 0x10u;
        while (2)
        {
          uint64_t v70 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v71 = v70 + 1;
          if (v70 == -1 || v71 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v72 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v70);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v71;
            v35 |= (unint64_t)(v72 & 0x7F) << v68;
            if (v72 < 0)
            {
              v68 += 7;
              BOOL v10 = v69++ >= 9;
              if (v10)
              {
                uint64_t v35 = 0;
                goto LABEL_153;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v35 = 0;
        }
LABEL_153:
        uint64_t v81 = 40;
        goto LABEL_158;
      case 0x14u:
        *(_WORD *)(a1 + 164) |= 0x100u;
        unint64_t v73 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v73 <= 0xFFFFFFFFFFFFFFFBLL && v73 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v73);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v73 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          int v20 = 0;
        }
        uint64_t v85 = 116;
LABEL_170:
        *(_DWORD *)(a1 + v85) = v20;
        continue;
      case 0x15u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 104;
        goto LABEL_115;
      case 0x16u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 96;
        goto LABEL_115;
      case 0x17u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 88;
        goto LABEL_115;
      case 0x18u:
        char v74 = 0;
        unsigned int v75 = 0;
        uint64_t v35 = 0;
        *(_WORD *)(a1 + 164) |= 8u;
        break;
      case 0x19u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 152;
LABEL_115:
        v79 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

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
      uint64_t v76 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v77 = v76 + 1;
      if (v76 == -1 || v77 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v78 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v76);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v77;
      v35 |= (unint64_t)(v78 & 0x7F) << v74;
      if ((v78 & 0x80) == 0) {
        goto LABEL_155;
      }
      v74 += 7;
      BOOL v10 = v75++ >= 9;
      if (v10)
      {
        uint64_t v35 = 0;
        goto LABEL_157;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_155:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v35 = 0;
    }
LABEL_157:
    uint64_t v81 = 32;
LABEL_158:
    *(void *)(a1 + v81) = v35;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_1000228B0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t v17 = objc_alloc_init(_NMRContentItem);
      [(id)a1 addContentItem:v17];
      if (!PBReaderPlaceMark() || !sub_100003F6C((uint64_t)v17, a2))
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_32;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_34;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_34:
      *(_DWORD *)(a1 + 16) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1000235FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 32))
  {
    char v4 = [[NMRPlaybackQueueResponse alloc] initWithPlaybackQueue:a2 error:a3];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100025A64(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (2)
    {
      if (!*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
      {
        char v4 = 0;
        unsigned int v5 = 0;
        unint64_t v6 = 0;
        while (1)
        {
          uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v8 = v7 + 1;
          if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
          v6 |= (unint64_t)(v9 & 0x7F) << v4;
          if ((v9 & 0x80) == 0) {
            goto LABEL_11;
          }
          v4 += 7;
          BOOL v10 = v5++ >= 9;
          if (v10)
          {
            unint64_t v6 = 0;
            uint64_t v11 = OBJC_IVAR___PBDataReader__error;
            int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
            goto LABEL_13;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
        uint64_t v11 = OBJC_IVAR___PBDataReader__error;
        int v12 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          unint64_t v6 = 0;
        }
LABEL_13:
        int v13 = v6 & 7;
        if (!v12 && v13 != 4)
        {
          switch((v6 >> 3))
          {
            case 1u:
              char v15 = 0;
              unsigned int v16 = 0;
              uint64_t v17 = 0;
              *(_WORD *)(a1 + 132) |= 1u;
              while (1)
              {
                uint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v19 = v18 + 1;
                if (v18 == -1 || v19 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                  break;
                }
                char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19;
                v17 |= (unint64_t)(v20 & 0x7F) << v15;
                if ((v20 & 0x80) == 0) {
                  goto LABEL_114;
                }
                v15 += 7;
                BOOL v10 = v16++ >= 9;
                if (v10)
                {
                  LODWORD(v17) = 0;
                  goto LABEL_116;
                }
              }
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_114:
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_116:
              uint64_t v73 = 80;
              goto LABEL_142;
            case 2u:
              char v28 = 0;
              unsigned int v29 = 0;
              uint64_t v30 = 0;
              *(_WORD *)(a1 + 132) |= 0x200u;
              while (2)
              {
                uint64_t v31 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v32 = v31 + 1;
                if (v31 == -1 || v32 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v33 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v31);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32;
                  v30 |= (unint64_t)(v33 & 0x7F) << v28;
                  if (v33 < 0)
                  {
                    v28 += 7;
                    BOOL v10 = v29++ >= 9;
                    if (v10)
                    {
                      uint64_t v30 = 0;
                      goto LABEL_120;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v30 = 0;
              }
LABEL_120:
              BOOL v74 = v30 != 0;
              uint64_t v75 = 129;
              goto LABEL_125;
            case 3u:
              char v34 = 0;
              unsigned int v35 = 0;
              uint64_t v36 = 0;
              *(_WORD *)(a1 + 132) |= 0x100u;
              while (2)
              {
                uint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v38 = v37 + 1;
                if (v37 == -1 || v38 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v39 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v38;
                  v36 |= (unint64_t)(v39 & 0x7F) << v34;
                  if (v39 < 0)
                  {
                    v34 += 7;
                    BOOL v10 = v35++ >= 9;
                    if (v10)
                    {
                      uint64_t v36 = 0;
                      goto LABEL_124;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                uint64_t v36 = 0;
              }
LABEL_124:
              BOOL v74 = v36 != 0;
              uint64_t v75 = 128;
LABEL_125:
              *(unsigned char *)(a1 + v75) = v74;
              goto LABEL_165;
            case 4u:
              if (v13 != 2)
              {
                unint64_t v82 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                if (v82 <= 0xFFFFFFFFFFFFFFF7 && v82 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v82 + 8;
                }
                else {
                  *(unsigned char *)(a2 + v11) = 1;
                }
                PBRepeatedDoubleAdd();
                goto LABEL_165;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                unsigned int v40 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v41 = *v40;
                unint64_t v42 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
                if (*v40 >= v42 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                  break;
                }
                if (v41 > 0xFFFFFFFFFFFFFFF7 || v41 + 8 > v42) {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else {
                  unint64_t *v40 = v41 + 8;
                }
                PBRepeatedDoubleAdd();
              }
              goto LABEL_79;
            case 5u:
              uint64_t v43 = PBReaderReadString();
              uint64_t v44 = 96;
              goto LABEL_81;
            case 6u:
              *(_WORD *)(a1 + 132) |= 8u;
              unint64_t v45 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v45 <= 0xFFFFFFFFFFFFFFFBLL && v45 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                int v46 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v45);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v45 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                int v46 = 0;
              }
              uint64_t v84 = 108;
              goto LABEL_164;
            case 7u:
              *(_WORD *)(a1 + 132) |= 4u;
              unint64_t v47 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v47 <= 0xFFFFFFFFFFFFFFFBLL && v47 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                int v46 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v47);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v47 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                int v46 = 0;
              }
              uint64_t v84 = 104;
              goto LABEL_164;
            case 8u:
              if (v13 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (1)
                {
                  uint64_t v48 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v49 = *v48;
                  unint64_t v50 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
                  if (*v48 >= v50 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                    break;
                  }
                  if (v49 > 0xFFFFFFFFFFFFFFFBLL || v49 + 4 > v50) {
                    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                  }
                  else {
                    unint64_t *v48 = v49 + 4;
                  }
                  PBRepeatedFloatAdd();
                }
LABEL_79:
                PBReaderRecallMark();
              }
              else
              {
                unint64_t v83 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                if (v83 <= 0xFFFFFFFFFFFFFFFBLL && v83 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v83 + 4;
                }
                else {
                  *(unsigned char *)(a2 + v11) = 1;
                }
                PBRepeatedFloatAdd();
              }
LABEL_165:
              if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
              }
              continue;
            case 9u:
              uint64_t v43 = PBReaderReadString();
              uint64_t v44 = 88;
LABEL_81:
              char v51 = *(void **)(a1 + v44);
              *(void *)(a1 + v44) = v43;

              goto LABEL_165;
            case 0xAu:
              char v52 = 0;
              unsigned int v53 = 0;
              uint64_t v17 = 0;
              *(_WORD *)(a1 + 132) |= 0x40u;
              while (2)
              {
                uint64_t v54 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v55 = v54 + 1;
                if (v54 == -1 || v55 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v56 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v54);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v55;
                  v17 |= (unint64_t)(v56 & 0x7F) << v52;
                  if (v56 < 0)
                  {
                    v52 += 7;
                    BOOL v10 = v53++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_129;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_129:
              uint64_t v73 = 120;
              goto LABEL_142;
            case 0xBu:
              char v57 = 0;
              unsigned int v58 = 0;
              uint64_t v17 = 0;
              *(_WORD *)(a1 + 132) |= 0x80u;
              while (2)
              {
                uint64_t v59 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v60 = v59 + 1;
                if (v59 == -1 || v60 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v61 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v59);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v60;
                  v17 |= (unint64_t)(v61 & 0x7F) << v57;
                  if (v61 < 0)
                  {
                    v57 += 7;
                    BOOL v10 = v58++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_133;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_133:
              uint64_t v73 = 124;
              goto LABEL_142;
            case 0xCu:
              char v62 = 0;
              unsigned int v63 = 0;
              uint64_t v17 = 0;
              *(_WORD *)(a1 + 132) |= 0x20u;
              while (2)
              {
                uint64_t v64 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v65 = v64 + 1;
                if (v64 == -1 || v65 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v66 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v64);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v65;
                  v17 |= (unint64_t)(v66 & 0x7F) << v62;
                  if (v66 < 0)
                  {
                    v62 += 7;
                    BOOL v10 = v63++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_137;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_137:
              uint64_t v73 = 116;
              goto LABEL_142;
            case 0xDu:
              *(_WORD *)(a1 + 132) |= 0x10u;
              unint64_t v67 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
              if (v67 <= 0xFFFFFFFFFFFFFFFBLL && v67 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
              {
                int v46 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v67);
                *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v67 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                int v46 = 0;
              }
              uint64_t v84 = 112;
LABEL_164:
              *(_DWORD *)(a1 + v84) = v46;
              goto LABEL_165;
            case 0xEu:
              char v68 = 0;
              unsigned int v69 = 0;
              uint64_t v17 = 0;
              *(_WORD *)(a1 + 132) |= 2u;
              while (2)
              {
                uint64_t v70 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                unint64_t v71 = v70 + 1;
                if (v70 == -1 || v71 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
                {
                  *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
                }
                else
                {
                  char v72 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v70);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v71;
                  v17 |= (unint64_t)(v72 & 0x7F) << v68;
                  if (v72 < 0)
                  {
                    v68 += 7;
                    BOOL v10 = v69++ >= 9;
                    if (v10)
                    {
                      LODWORD(v17) = 0;
                      goto LABEL_141;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                LODWORD(v17) = 0;
              }
LABEL_141:
              uint64_t v73 = 84;
LABEL_142:
              *(_DWORD *)(a1 + v73) = v17;
              goto LABEL_165;
            case 0xFu:
              if (v13 != 2)
              {
                char v76 = 0;
                unsigned int v77 = 0;
                uint64_t v78 = 0;
                while (1)
                {
                  uint64_t v79 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v80 = v79 + 1;
                  if (v79 == -1 || v80 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                    break;
                  }
                  char v81 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v79);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v80;
                  v78 |= (unint64_t)(v81 & 0x7F) << v76;
                  if (v81 < 0)
                  {
                    v76 += 7;
                    BOOL v10 = v77++ >= 9;
                    if (!v10) {
                      continue;
                    }
                  }
                  goto LABEL_157;
                }
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_157:
                PBRepeatedInt32Add();
                goto LABEL_165;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length)
                   && !*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
              {
                char v22 = 0;
                unsigned int v23 = 0;
                uint64_t v24 = 0;
                while (1)
                {
                  uint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
                  unint64_t v26 = v25 + 1;
                  if (v25 == -1 || v26 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
                    break;
                  }
                  char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
                  *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26;
                  v24 |= (unint64_t)(v27 & 0x7F) << v22;
                  if (v27 < 0)
                  {
                    v22 += 7;
                    BOOL v10 = v23++ >= 9;
                    if (!v10) {
                      continue;
                    }
                  }
                  goto LABEL_37;
                }
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_37:
                PBRepeatedInt32Add();
              }
              goto LABEL_79;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_165;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100027868(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  NSSelectorFromString(*(NSString **)(a1 + 40));
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) valueForKey:*(void *)(a1 + 40)];
  }
  else
  {
    char v4 = sub_10002C428(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000316AC(v2, v4);
    }

    id v3 = 0;
  }

  return v3;
}

id sub_100027A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

void sub_100027B00(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [[*(id *)(a1 + 32) nmr_valueForPotentiallyUndefinedKey:v10];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40);
    if (!v8
      || ((*(void (**)(uint64_t, void, id, void *))(v8 + 16))(v8, *(void *)(a1 + 32), v10, v7),
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v7,
          (uint64_t v7 = (void *)v9) != 0))
    {
      [*(id *)(a1 + 48) setObject:v7 forKey:v5];
    }
  }
}

void sub_100027D04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v5];
  id v8 = v6;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 32);
    uint64_t v11 = v8;
    if (v10)
    {
      uint64_t v11 = (*(void (**)(uint64_t, void, id, id))(v10 + 16))(v10, *(void *)(a1 + 40), v5, v8);
    }
    int v12 = *(void **)(a1 + 48);
    id v14 = v11;
    unsigned int v13 = [v12 validateValue:&v14 forKey:v7 error:0];
    id v9 = v14;

    if (v13) {
      [*(id *)(a1 + 48) setValue:v9 forKey:v7];
    }
  }
}

uint64_t sub_100028FAC(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 112;
        goto LABEL_117;
      case 3u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 56;
        goto LABEL_117;
      case 4u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 144) |= 0x800u;
        while (2)
        {
          uint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v20 = v19 + 1;
          if (v19 == -1 || v20 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20;
            v18 |= (unint64_t)(v21 & 0x7F) << v16;
            if (v21 < 0)
            {
              v16 += 7;
              BOOL v10 = v17++ >= 9;
              if (v10)
              {
                uint64_t v18 = 0;
                goto LABEL_128;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v18 = 0;
        }
LABEL_128:
        BOOL v90 = v18 != 0;
        uint64_t v91 = 136;
        goto LABEL_166;
      case 5u:
        *(_WORD *)(a1 + 144) |= 0x400u;
        unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v23 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          int v23 = 0;
        }
        uint64_t v94 = 104;
        goto LABEL_182;
      case 6u:
        *(_WORD *)(a1 + 144) |= 0x10u;
        unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v23 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          int v23 = 0;
        }
        uint64_t v94 = 68;
        goto LABEL_182;
      case 7u:
        *(_WORD *)(a1 + 144) |= 0x40u;
        unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          int v23 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          int v23 = 0;
        }
        uint64_t v94 = 88;
LABEL_182:
        *(_DWORD *)(a1 + v94) = v23;
        continue;
      case 8u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(_WORD *)(a1 + 144) |= 0x1000u;
        while (2)
        {
          uint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30;
            v28 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              BOOL v10 = v27++ >= 9;
              if (v10)
              {
                uint64_t v28 = 0;
                goto LABEL_132;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v28 = 0;
        }
LABEL_132:
        BOOL v90 = v28 != 0;
        uint64_t v91 = 137;
        goto LABEL_166;
      case 9u:
        *(_WORD *)(a1 + 144) |= 1u;
        unint64_t v32 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v33 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v32);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v33 = 0;
        }
        *(void *)(a1 + 8) = v33;
        continue;
      case 0xAu:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v36 = 0;
        *(_WORD *)(a1 + 144) |= 0x80u;
        while (2)
        {
          uint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v38 = v37 + 1;
          if (v37 == -1 || v38 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v39 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v37);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v38;
            v36 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              BOOL v10 = v35++ >= 9;
              if (v10)
              {
                LODWORD(v36) = 0;
                goto LABEL_136;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v36) = 0;
        }
LABEL_136:
        uint64_t v92 = 92;
        goto LABEL_175;
      case 0xBu:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v36 = 0;
        *(_WORD *)(a1 + 144) |= 0x200u;
        while (2)
        {
          uint64_t v42 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v42);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v43;
            v36 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              BOOL v10 = v41++ >= 9;
              if (v10)
              {
                LODWORD(v36) = 0;
                goto LABEL_140;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v36) = 0;
        }
LABEL_140:
        uint64_t v92 = 100;
        goto LABEL_175;
      case 0xCu:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v47 = 0;
        *(_WORD *)(a1 + 144) |= 4u;
        while (2)
        {
          uint64_t v48 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v49 = v48 + 1;
          if (v48 == -1 || v49 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v48);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v49;
            v47 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              BOOL v10 = v46++ >= 9;
              if (v10)
              {
                uint64_t v47 = 0;
                goto LABEL_144;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v47 = 0;
        }
LABEL_144:
        uint64_t v93 = 24;
        goto LABEL_149;
      case 0xDu:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v47 = 0;
        *(_WORD *)(a1 + 144) |= 2u;
        while (2)
        {
          uint64_t v53 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v54 = v53 + 1;
          if (v53 == -1 || v54 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v53);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v54;
            v47 |= (unint64_t)(v55 & 0x7F) << v51;
            if (v55 < 0)
            {
              v51 += 7;
              BOOL v10 = v52++ >= 9;
              if (v10)
              {
                uint64_t v47 = 0;
                goto LABEL_148;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v47 = 0;
        }
LABEL_148:
        uint64_t v93 = 16;
LABEL_149:
        *(void *)(a1 + v93) = v47;
        continue;
      case 0xEu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 80;
        goto LABEL_117;
      case 0xFu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 128;
        goto LABEL_117;
      case 0x10u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 48;
        goto LABEL_117;
      case 0x11u:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v36 = 0;
        *(_WORD *)(a1 + 144) |= 0x100u;
        while (2)
        {
          uint64_t v58 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v58);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v59;
            v36 |= (unint64_t)(v60 & 0x7F) << v56;
            if (v60 < 0)
            {
              v56 += 7;
              BOOL v10 = v57++ >= 9;
              if (v10)
              {
                LODWORD(v36) = 0;
                goto LABEL_153;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v36) = 0;
        }
LABEL_153:
        uint64_t v92 = 96;
        goto LABEL_175;
      case 0x12u:
        char v61 = 0;
        unsigned int v62 = 0;
        uint64_t v63 = 0;
        *(_WORD *)(a1 + 144) |= 0x2000u;
        while (2)
        {
          uint64_t v64 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v65 = v64 + 1;
          if (v64 == -1 || v65 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v66 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v64);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v65;
            v63 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              v61 += 7;
              BOOL v10 = v62++ >= 9;
              if (v10)
              {
                uint64_t v63 = 0;
                goto LABEL_157;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v63 = 0;
        }
LABEL_157:
        BOOL v90 = v63 != 0;
        uint64_t v91 = 138;
        goto LABEL_166;
      case 0x13u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 40;
        goto LABEL_117;
      case 0x14u:
        char v67 = 0;
        unsigned int v68 = 0;
        uint64_t v69 = 0;
        *(_WORD *)(a1 + 144) |= 0x8000u;
        while (2)
        {
          uint64_t v70 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v71 = v70 + 1;
          if (v70 == -1 || v71 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v72 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v70);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v71;
            v69 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              v67 += 7;
              BOOL v10 = v68++ >= 9;
              if (v10)
              {
                uint64_t v69 = 0;
                goto LABEL_161;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v69 = 0;
        }
LABEL_161:
        BOOL v90 = v69 != 0;
        uint64_t v91 = 140;
        goto LABEL_166;
      case 0x15u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 120;
        goto LABEL_117;
      case 0x16u:
        char v73 = 0;
        unsigned int v74 = 0;
        uint64_t v75 = 0;
        *(_WORD *)(a1 + 144) |= 0x4000u;
        while (2)
        {
          uint64_t v76 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v77 = v76 + 1;
          if (v76 == -1 || v77 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v78 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v76);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v77;
            v75 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              v73 += 7;
              BOOL v10 = v74++ >= 9;
              if (v10)
              {
                uint64_t v75 = 0;
                goto LABEL_165;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v75 = 0;
        }
LABEL_165:
        BOOL v90 = v75 != 0;
        uint64_t v91 = 139;
LABEL_166:
        *(unsigned char *)(a1 + v91) = v90;
        continue;
      case 0x17u:
        char v79 = 0;
        unsigned int v80 = 0;
        uint64_t v36 = 0;
        *(_WORD *)(a1 + 144) |= 8u;
        while (2)
        {
          uint64_t v81 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v82 = v81 + 1;
          if (v81 == -1 || v82 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v83 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v81);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v82;
            v36 |= (unint64_t)(v83 & 0x7F) << v79;
            if (v83 < 0)
            {
              v79 += 7;
              BOOL v10 = v80++ >= 9;
              if (v10)
              {
                LODWORD(v36) = 0;
                goto LABEL_170;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v36) = 0;
        }
LABEL_170:
        uint64_t v92 = 64;
        goto LABEL_175;
      case 0x18u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 32;
LABEL_117:
        uint64_t v84 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      case 0x19u:
        char v85 = 0;
        unsigned int v86 = 0;
        uint64_t v36 = 0;
        *(_WORD *)(a1 + 144) |= 0x20u;
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
      uint64_t v87 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v88 = v87 + 1;
      if (v87 == -1 || v88 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v89 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v87);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v88;
      v36 |= (unint64_t)(v89 & 0x7F) << v85;
      if ((v89 & 0x80) == 0) {
        goto LABEL_172;
      }
      v85 += 7;
      BOOL v10 = v86++ >= 9;
      if (v10)
      {
        LODWORD(v36) = 0;
        goto LABEL_174;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_172:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v36) = 0;
    }
LABEL_174:
    uint64_t v92 = 72;
LABEL_175:
    *(_DWORD *)(a1 + v92) = v36;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_10002BF10(unsigned int a1)
{
  if (a1 < 0x12 && ((0x3C07Fu >> a1) & 1) != 0)
  {
    uint64_t v1 = *(&off_100045518 + (__int16)a1);
  }
  else
  {
    uint64_t v1 = +[NSString stringWithFormat:@"NMRIDSMessageType(%hu)", a1];
  }

  return v1;
}

id sub_10002C428(uint64_t a1)
{
  if (qword_1000506C0 != -1) {
    dispatch_once(&qword_1000506C0, &stru_1000455A8);
  }
  id v2 = (void *)qword_100050648[a1];

  return v2;
}

void sub_10002C48C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.nanomusic", "NanoMusicCore");
  id v2 = (void *)qword_100050648[0];
  qword_100050648[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.nanomusic", "NanoMusicCore-Oversize");
  char v4 = (void *)qword_100050650;
  qword_100050650 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.nanomusic", "NanoMediaRemote");
  unint64_t v6 = (void *)qword_100050658;
  qword_100050658 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.nanomusic", "NanoMediaRemote-Oversize");
  unint64_t v8 = (void *)qword_100050660;
  qword_100050660 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.nanomusic", "NanoAudioControl");
  BOOL v10 = (void *)qword_100050668;
  qword_100050668 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.nanomusic", "NanoMusicSync");
  int v12 = (void *)qword_100050670;
  qword_100050670 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.nanomusic", "NanoMusicSync-Oversize");
  uint64_t v14 = (void *)qword_100050678;
  qword_100050678 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.nanomusic", "NanoMediaUI");
  char v16 = (void *)qword_100050680;
  qword_100050680 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.nanomusic", "NanoMediaUI-Oversize");
  uint64_t v18 = (void *)qword_100050688;
  qword_100050688 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.nanomusic", "NanoMediaAPI");
  unint64_t v20 = (void *)qword_100050690;
  qword_100050690 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.nanomusic", "NanoMediaAPI-Oversize");
  unint64_t v22 = (void *)qword_100050698;
  qword_100050698 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.nanomusic", "NanoMediaTool");
  unint64_t v24 = (void *)qword_1000506A0;
  qword_1000506A0 = (uint64_t)v23;

  os_log_t v25 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI");
  char v26 = (void *)qword_1000506B0;
  qword_1000506B0 = (uint64_t)v25;

  os_log_t v27 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI-Oversize");
  uint64_t v28 = (void *)qword_1000506B8;
  qword_1000506B8 = (uint64_t)v27;

  qword_1000506A8 = (uint64_t)os_log_create("com.apple.nanomusic", "NanoMediaAppActivity");

  _objc_release_x1();
}

uint64_t sub_10002C954(void *a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      int v12 = objc_alloc_init(_NMRCommandInfoProtobuf);
      [a1 addSupportedCommand:v12];
      if (!PBReaderPlaceMark() || (sub_100025A64((uint64_t)v12, a2) & 1) == 0)
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
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10002D028(id a1)
{
  qword_1000506C8 = objc_opt_new();

  _objc_release_x1();
}

void sub_10002D374(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);

  unsigned int v5 = sub_10002C428(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    xpc_type_t v7 = type;
    __int16 v8 = 2080;
    os_log_t v9 = string;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LinkAgent] Received notifyd event type: %@, name: %s.", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10002D6C0(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2 == *(void **)(a1[5] + 56) && [v2 discoveryMode])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    os_log_t v3 = [*(id *)(a1[5] + 56) availableRoutes];
    id v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v21;
      do
      {
        xpc_type_t v7 = 0;
        do
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v3);
          }
          __int16 v8 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v7);
          os_log_t v9 = [v8 connection];
          if (v9)
          {
            int v10 = *(void **)(a1[5] + 64);
            os_log_t v11 = [v8 routeUID];
            if (([v10 containsObject:v11] & 1) != 0
              || [v9 isConnected])
            {
            }
            else
            {
              unsigned __int8 v12 = [v9 isInvalidated];

              if ((v12 & 1) == 0)
              {
                os_log_t v13 = *(void **)(a1[5] + 64);
                uint64_t v14 = [v8 routeUID];
                [v13 addObject:v14];

                v17[0] = _NSConcreteStackBlock;
                v17[1] = 3221225472;
                v17[2] = sub_10002D8E8;
                v17[3] = &unk_100045658;
                os_log_t v15 = (void *)a1[6];
                void v17[4] = a1[5];
                id v18 = v15;
                os_log_t v19 = v8;
                [v9 connectWithCompletion:v17];
              }
            }
          }

          xpc_type_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v16 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
        id v5 = v16;
      }
      while (v16);
    }
  }
}

void sub_10002D8E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002D9AC;
  v8[3] = &unk_100045630;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = v3;
  id v7 = v3;
  dispatch_async(v4, v8);
}

void sub_10002D9AC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 64);
  id v4 = (uint64_t *)(a1 + 48);
  id v5 = [*(id *)(a1 + 48) routeUID];
  [v3 removeObject:v5];

  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v6 = (uint64_t *)(a1 + 56);
  __int16 v8 = sub_10002C428(2);
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000317B0(v4, v6, v9);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *v4;
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[LinkAgent] Connected to endpoint %@ successfully!", (uint8_t *)&v11, 0xCu);
  }
}

void sub_10002DC4C(uint64_t a1)
{
  id v2 = [NMRMediaRemoteGetStateMessage alloc];
  id v3 = [*(id *)(a1 + 32) data];
  id v4 = [(NMRMediaRemoteGetStateMessage *)v2 initWithProtobufData:v3];

  uint64_t v5 = [(NMRMediaRemoteGetStateMessage *)v4 originIdentifier];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = &off_1000473A8;
  if (v5) {
    uint64_t v7 = (_UNKNOWN **)v5;
  }
  __int16 v8 = v7;

  id v9 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002DD6C;
  v12[3] = &unk_1000456A8;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v13 = v10;
  uint64_t v14 = v11;
  [v9 handleMediaRemoteGetStateRequest:v4 completion:v12];
}

void sub_10002DD6C(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  if (a2)
  {
    id v10 = v4;
    id v5 = a2;
    uint64_t v6 = [v5 originIdentifier];
    uint64_t v7 = +[NSString stringWithFormat:@"%@-%@", @"MediaRemoteSetState", v6];

    __int16 v8 = *(void **)(*(void *)(a1 + 40) + 16);
    id v9 = [v5 protobufData];

    [v8 sendMessageWithProtobufData:v9 messageType:4 priority:1 timeout:0 bypassDuet:0 skipStorage:0 expectReply:IDSMaxMessageTimeout queueOneIdentifier:v7 resultingMessageIdentifier:0 error:0];
    kdebug_trace();
    kdebug_trace();
    kdebug_trace();

    id v4 = v10;
  }
}

void sub_10002E004(uint64_t a1)
{
  id v2 = [NMRMediaRemoteGetArtworkMessage alloc];
  id v3 = [*(id *)(a1 + 32) data];
  id v4 = [(NMRMediaRemoteGetArtworkMessage *)v2 initWithProtobufData:v3];

  uint64_t v5 = [(NMRMediaRemoteGetArtworkMessage *)v4 originIdentifier];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = &off_1000473A8;
  if (v5) {
    uint64_t v7 = (_UNKNOWN **)v5;
  }
  __int16 v8 = v7;

  id v9 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E124;
  v12[3] = &unk_1000456D0;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v13 = v10;
  uint64_t v14 = v11;
  [v9 handleMediaRemoteGetArtworkRequest:v4 completion:v12];
}

void sub_10002E124(uint64_t a1, void *a2)
{
  id v9 = *(id *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 originIdentifier];
  uint64_t v6 = +[NSString stringWithFormat:@"%@-%@", @"MediaRemoteSetArtwork", v5];

  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 16);
  __int16 v8 = [v4 protobufData];

  [v7 sendMessageWithProtobufData:v8 messageType:6 priority:2 timeout:0 bypassDuet:0 skipStorage:0 expectReply:IDSMaxMessageTimeout queueOneIdentifier:v6 resultingMessageIdentifier:0 error:0];
  kdebug_trace();
}

void sub_10002E380(uint64_t a1)
{
  id v2 = [NMRSendCommandMessage alloc];
  id v3 = [*(id *)(a1 + 32) data];
  id v4 = [(NMRSendCommandMessage *)v2 initWithProtobufData:v3];

  uint64_t v5 = [(NMRSendCommandMessage *)v4 originIdentifier];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = &off_1000473A8;
  if (v5) {
    uint64_t v7 = (_UNKNOWN **)v5;
  }
  __int16 v8 = v7;

  id v9 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E4C0;
  v12[3] = &unk_1000456F8;
  id v13 = *(id *)(a1 + 48);
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v11.i64[0];
  int8x16_t v14 = vextq_s8(v11, v11, 8uLL);
  [v9 handleMediaRemoteSendCommandRequest:v4 completion:v12];
}

void sub_10002E4C0(uint64_t a1, void *a2)
{
  id v4 = *(void **)(*(void *)(a1 + 40) + 16);
  id v6 = *(id *)(a1 + 32);
  uint64_t v5 = [a2 protobufData];
  [v4 sendMessageWithProtobufData:v5 messageType:3 priority:1 timeout:1 bypassDuet:1 skipStorage:*(void *)(a1 + 48) inReplyTo:6.5 resultingMessageIdentifier:0 error:0];

  kdebug_trace();
}

void sub_10002E680(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  [v1 _prewarmSystemMusicApp];
}

void sub_10002E7D4(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  [v1 _sendProxiedOriginsToClient];
}

void sub_10002E928(uint64_t a1)
{
  id v2 = sub_10002C428(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[LinkAgent] Begin endpoint discovery! Endpoints will be connected automatically.", buf, 2u);
  }

  ++*(void *)(*(void *)(a1 + 32) + 72);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 72) == 1) {
    [*(id *)(v3 + 56) setDiscoveryMode:3];
  }
  dispatch_time_t v4 = dispatch_time(0, 8000000000);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002EA58;
  v8[3] = &unk_100044CB8;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  dispatch_after(v4, v5, v8);
}

void sub_10002EA58(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = sub_10002C428(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[LinkAgent] End endpoint discovery! Stop auto connecting to endpoints.", v5, 2u);
  }

  --*(void *)(*(void *)(a1 + 40) + 72);
  uint64_t v4 = *(void *)(a1 + 40);
  if (!*(void *)(v4 + 72)) {
    [*(id *)(v4 + 56) setDiscoveryMode:0];
  }
}

void sub_10002EC50(uint64_t a1)
{
  id v2 = [NMRPlaybackQueueRequest alloc];
  uint64_t v3 = [*(id *)(a1 + 32) data];
  uint64_t v4 = [(NMRPlaybackQueueRequest *)v2 initWithProtobufData:v3];

  uint64_t v5 = sub_10002C428(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LinkAgent] Received playback queue request: %@", buf, 0xCu);
  }

  [(NMRPlaybackQueueRequest *)v4 playerPath];
  MRNowPlayingPlayerPathGetOrigin();
  id v6 = +[NSNumber numberWithInt:MROriginGetUniqueIdentifier()];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v6];
  __int16 v8 = [v7 origin];
  id v9 = [v8 uniqueIdentifier];
  unsigned __int8 v10 = [v6 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v12 = [(NMRPlaybackQueueRequest *)v4 playerPath];
    MRNowPlayingPlayerPathGetOrigin();
    uint64_t v11 = MROriginCopy();
    id v13 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v6];
    int8x16_t v14 = [v13 origin];
    [v14 mediaRemoteOrigin];
    MRNowPlayingPlayerPathSetOrigin();

    os_log_t v15 = [[NMRPlaybackQueueRequest alloc] initWithRequest:[(NMRPlaybackQueueRequest *)v4 request] playerPath:v12];
    uint64_t v4 = v15;
  }
  id v16 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v6];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002EF14;
  v20[3] = &unk_100045720;
  id v21 = *(id *)(a1 + 48);
  uint64_t v24 = v11;
  int8x16_t v19 = *(int8x16_t *)(a1 + 32);
  id v17 = (id)v19.i64[0];
  int8x16_t v22 = vextq_s8(v19, v19, 8uLL);
  long long v23 = v4;
  id v18 = v4;
  [v16 handlePlaybackQueueRequest:v18 completion:v20];
}

void sub_10002EF14(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if (*(void *)(a1 + 64))
  {
    id v5 = [(NMRPlaybackQueueResponse *)v3 playbackQueue];
    MRPlaybackQueueGetResolvedPlayerPath();
    MRNowPlayingPlayerPathSetOrigin();
    id v6 = [[NMRPlaybackQueueResponse alloc] initWithPlaybackQueue:v5 error:[(NMRPlaybackQueueResponse *)v3 error]];

    CFRelease(*(CFTypeRef *)(a1 + 64));
    uint64_t v3 = v6;
  }
  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 16);
  __int16 v8 = [(NMRPlaybackQueueResponse *)v3 protobufData];
  [v7 sendMessageWithProtobufData:v8 messageType:19 priority:2 timeout:0 bypassDuet:0 skipStorage:*(void *)(a1 + 48) inReplyTo:60.0 resultingMessageIdentifier:0 error:0];

  kdebug_trace();
  id v9 = sub_10002C428(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[LinkAgent] Sent playback queue response: %@ for request: %@", buf, 0x16u);
  }
}

id sub_10002F640(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void sub_10002F9EC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if ([*(id *)(a1 + 40) code] == (id)23)
  {
    unsigned int v3 = [*(id *)(a1 + 48) isEqualToString:*(void *)(*(void *)(a1 + 56) + 32)];
    id v4 = *(id **)(a1 + 56);
    if (v3)
    {
      [v4 _sendProxiedOriginsToClient];
    }
    else
    {
      id v5 = [v4[5] allValues];
      unsigned int v6 = [v5 containsObject:*(void *)(a1 + 48)];

      if (v6)
      {
        uint64_t v7 = [*(id *)(*(void *)(a1 + 56) + 40) allKeysForObject:*(void *)(a1 + 48)];
        __int16 v8 = +[NSSet setWithArray:v7];

        id v9 = +[NMROriginManager sharedManager];
        uint64_t v10 = [v9 availableOrigins];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10002FC54;
        v23[3] = &unk_100045748;
        id v24 = v8;
        id v11 = v8;
        id v12 = +[NSPredicate predicateWithBlock:v23];
        __int16 v13 = [v10 filteredArrayUsingPredicate:v12];

        [*(id *)(a1 + 56) _sendOriginUpdatesToClient:v13];
      }
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v14 = [*(id *)(*(void *)(a1 + 56) + 48) allValues];
  id v15 = [v14 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) updatePlaybackQueuePendingRecordsWithIdentifier:*(void *)(a1 + 48) success:*(unsigned __int8 *)(a1 + 64)];
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v16);
  }
}

id sub_10002FC54(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  unsigned int v3 = [a2 uniqueIdentifier];
  id v4 = [v2 containsObject:v3];

  return v4;
}

void sub_100030234(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  id v4 = [v2 object];
  id v5 = *(void **)(a1 + 48);
  uint64_t v7 = v4;
  unsigned int v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v5 _sendOriginUpdatesToClient:v6];
}

void sub_100030404(uint64_t a1)
{
  id v2 = (const void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  uint64_t v8 = FBSOpenApplicationOptionKeyActivateSuspended;
  id v9 = &__kCFBooleanTrue;
  id v3 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v4 = +[FBSOpenApplicationOptions optionsWithDictionary:v3];

  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100030548;
  v6[3] = &unk_100045798;
  id v7 = *(id *)(a1 + 40);
  [v5 openApplication:v2 withOptions:v4 completion:v6];
  if (v2) {
    CFRelease(v2);
  }
}

void sub_100030548(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(id *)(a1 + 32);
  if (v4)
  {
    unsigned int v6 = sub_10002C428(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000318B8((uint64_t)v4, v6);
    }
  }
}

BOOL sub_1000307A8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
LABEL_21:
        uint64_t v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = PBReaderReadData();
    uint64_t v13 = 8;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100030CD4()
{
  sub_10000F508();
  sub_10000F4EC((void *)&_mh_execute_header, v0, v1, "[%@] calling block", v2, v3, v4, v5, v6);
}

void sub_100030D40()
{
  sub_10000F508();
  sub_10000F4EC((void *)&_mh_execute_header, v0, v1, "[%@] setting state to updating", v2, v3, v4, v5, v6);
}

void sub_100030DAC()
{
  sub_10000F508();
  sub_10000F4EC((void *)&_mh_execute_header, v0, v1, "[%@] setting state to pending and bailing", v2, v3, v4, v5, v6);
}

void sub_100030E18()
{
  sub_10000F514(__stack_chk_guard);
  sub_10000F508();
  sub_10000F4EC((void *)&_mh_execute_header, v0, v1, "[%@] executeUpdateBlock", v2, v3, v4, v5, v6);
}

void sub_100030E80()
{
  sub_10000F514(__stack_chk_guard);
  sub_10000F508();
  sub_10000F4EC((void *)&_mh_execute_header, v0, v1, "[%@] setting state to idle, ", v2, v3, v4, v5, v6);
}

void sub_100030EE8()
{
  sub_10000F514(__stack_chk_guard);
  sub_10000F508();
  sub_10000F4EC((void *)&_mh_execute_header, v0, v1, "[%@] state is pending, will retry", v2, v3, v4, v5, v6);
}

void sub_100030F50()
{
  sub_10000F514(__stack_chk_guard);
  sub_10000F508();
  sub_10000F4EC((void *)&_mh_execute_header, v0, v1, "[%@] finished block", v2, v3, v4, v5, v6);
}

void sub_100030FB8()
{
  sub_100010D70();
  sub_100010D54((void *)&_mh_execute_header, v0, v1, "Failed to serialize collection info with error: %@", v2, v3, v4, v5, v6);
}

void sub_100031020()
{
  sub_100010D70();
  sub_100010D54((void *)&_mh_execute_header, v0, v1, "Failed to serialize user info with error: %@", v2, v3, v4, v5, v6);
}

void sub_100031088()
{
  sub_100010D70();
  sub_100010D54((void *)&_mh_execute_header, v0, v1, "User info dict is not a valid JSON object %@", v2, v3, v4, v5, v6);
}

void sub_1000310F0()
{
  sub_100010D70();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "Skipping invalid JSON object for key: %@ (%@)", v2, 0x16u);
}

void sub_100031174()
{
  sub_100010D70();
  sub_100010D54((void *)&_mh_execute_header, v0, v1, "Failed to parse collection info with error: %@", v2, v3, v4, v5, v6);
}

void sub_1000311DC()
{
  sub_100010D70();
  sub_100010D54((void *)&_mh_execute_header, v0, v1, "Failed to parse user info with error: %@", v2, v3, v4, v5, v6);
}

void sub_100031244(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Created queue: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000312BC()
{
  sub_100019DEC();
  [(id)sub_100019DFC(v1) displayName];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_100019DDC() uniqueIdentifier];
  sub_100019D9C();
  sub_100019DBC((void *)&_mh_execute_header, v3, v4, "[LinkAgent] (%@-%@) Failed to fetch now playing playback queue with error: %@", v5, v6, v7, v8, v9);
}

void sub_100031358()
{
  sub_100019DEC();
  [(id)sub_100019DFC(v1) displayName];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_100019DDC() uniqueIdentifier];
  sub_100019D9C();
  sub_100019DBC((void *)&_mh_execute_header, v3, v4, "[LinkAgent] (%@-%@) Failed to fetch now playing client with error: %@", v5, v6, v7, v8, v9);
}

void sub_1000313F4()
{
  sub_10001E2D8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[Origin] Trying to set invalid activeOrigin identifier: %@, falling back to: %@", v1, 0x16u);
}

void sub_100031470(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[Origin] Failed to fetch any available origins", v1, 2u);
}

void sub_1000314B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[Origin] Failed to get active origin from MR.", v1, 2u);
}

void sub_1000314F8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) name];
  sub_10001E2D8();
  __int16 v8 = v6;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "[%@] Failed to connect to route %@ with error: %@", v7, 0x20u);
}

void sub_1000315AC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to archive error: %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100031634(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive error with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000316AC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Encountered unknown protobuf key (%@) while converting to a dictionary; skipping.",
    (uint8_t *)&v3,
    0xCu);
}

void sub_100031728(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to send message (ID: %@) with error \"%@\".", (uint8_t *)&v3, 0x16u);
}

void sub_1000317B0(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[LinkAgent] Failed to connect to endpoint %@ with error: %@", (uint8_t *)&v5, 0x16u);
}

void sub_100031840(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[LinkAgent] Ignoring origin info due to missing device info for origin: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000318B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[LinkAgent] Error prewarming system music app: %@", (uint8_t *)&v2, 0xCu);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopRun(void)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

uint64_t MRContentItemCopyMinimalReadableDescription()
{
  return _MRContentItemCopyMinimalReadableDescription();
}

uint64_t MRContentItemCopyNowPlayingInfo()
{
  return _MRContentItemCopyNowPlayingInfo();
}

uint64_t MRContentItemCopyUserInfo()
{
  return _MRContentItemCopyUserInfo();
}

uint64_t MRContentItemCreate()
{
  return _MRContentItemCreate();
}

uint64_t MRContentItemGetAlbumArtistName()
{
  return _MRContentItemGetAlbumArtistName();
}

uint64_t MRContentItemGetAlbumName()
{
  return _MRContentItemGetAlbumName();
}

uint64_t MRContentItemGetArtworkData()
{
  return _MRContentItemGetArtworkData();
}

uint64_t MRContentItemGetDuration()
{
  return _MRContentItemGetDuration();
}

uint64_t MRContentItemGetHasDuration()
{
  return _MRContentItemGetHasDuration();
}

uint64_t MRContentItemGetIdentifier()
{
  return _MRContentItemGetIdentifier();
}

uint64_t MRContentItemGetTitle()
{
  return _MRContentItemGetTitle();
}

uint64_t MRContentItemGetTrackArtistName()
{
  return _MRContentItemGetTrackArtistName();
}

uint64_t MRContentItemMerge()
{
  return _MRContentItemMerge();
}

uint64_t MRContentItemSetAlbumName()
{
  return _MRContentItemSetAlbumName();
}

uint64_t MRContentItemSetDuration()
{
  return _MRContentItemSetDuration();
}

uint64_t MRContentItemSetNowPlayingInfo()
{
  return _MRContentItemSetNowPlayingInfo();
}

uint64_t MRContentItemSetTitle()
{
  return _MRContentItemSetTitle();
}

uint64_t MRContentItemSetTrackArtistName()
{
  return _MRContentItemSetTrackArtistName();
}

uint64_t MRContentItemSetUserInfo()
{
  return _MRContentItemSetUserInfo();
}

uint64_t MRExternalDeviceGetConnectionState()
{
  return _MRExternalDeviceGetConnectionState();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return _MRMediaRemoteCommandInfoCopyValueForKey();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return _MRMediaRemoteCommandInfoGetCommand();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return _MRMediaRemoteCommandInfoGetEnabled();
}

uint64_t MRMediaRemoteCopyDeviceInfo()
{
  return _MRMediaRemoteCopyDeviceInfo();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return _MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
}

uint64_t MRMediaRemoteCopyPlaybackStateDescription()
{
  return _MRMediaRemoteCopyPlaybackStateDescription();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return _MRMediaRemoteGetActiveOrigin();
}

uint64_t MRMediaRemoteGetAvailableOrigins()
{
  return _MRMediaRemoteGetAvailableOrigins();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return _MRMediaRemoteGetLocalOrigin();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin()
{
  return _MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();
}

uint64_t MRMediaRemoteGetNowPlayingClientForOrigin()
{
  return _MRMediaRemoteGetNowPlayingClientForOrigin();
}

uint64_t MRMediaRemoteGetSupportedCommandsForOrigin()
{
  return _MRMediaRemoteGetSupportedCommandsForOrigin();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return _MRMediaRemoteRegisterForNowPlayingNotifications();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync()
{
  return _MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return _MRMediaRemoteSendCommandToApp();
}

uint64_t MRMediaRemoteSetWantsOriginChangeNotifications()
{
  return _MRMediaRemoteSetWantsOriginChangeNotifications();
}

uint64_t MRMediaRemoteSetWantsSupportedCommandsChangedNotifications()
{
  return _MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return _MRNowPlayingClientGetBundleIdentifier();
}

uint64_t MRNowPlayingClientGetDisplayName()
{
  return _MRNowPlayingClientGetDisplayName();
}

uint64_t MRNowPlayingClientGetProcessIdentifier()
{
  return _MRNowPlayingClientGetProcessIdentifier();
}

uint64_t MRNowPlayingPlayerPathCreate()
{
  return _MRNowPlayingPlayerPathCreate();
}

uint64_t MRNowPlayingPlayerPathCreateExternalRepresentation()
{
  return _MRNowPlayingPlayerPathCreateExternalRepresentation();
}

uint64_t MRNowPlayingPlayerPathCreateFromExternalRepresentation()
{
  return _MRNowPlayingPlayerPathCreateFromExternalRepresentation();
}

uint64_t MRNowPlayingPlayerPathGetClient()
{
  return _MRNowPlayingPlayerPathGetClient();
}

uint64_t MRNowPlayingPlayerPathGetOrigin()
{
  return _MRNowPlayingPlayerPathGetOrigin();
}

uint64_t MRNowPlayingPlayerPathSetOrigin()
{
  return _MRNowPlayingPlayerPathSetOrigin();
}

uint64_t MROriginCopy()
{
  return _MROriginCopy();
}

uint64_t MROriginEqualToOrigin()
{
  return _MROriginEqualToOrigin();
}

uint64_t MROriginGetDisplayName()
{
  return _MROriginGetDisplayName();
}

uint64_t MROriginGetUniqueIdentifier()
{
  return _MROriginGetUniqueIdentifier();
}

uint64_t MROriginIsLocalOrigin()
{
  return _MROriginIsLocalOrigin();
}

uint64_t MRPairedDeviceCopyDeviceUID()
{
  return _MRPairedDeviceCopyDeviceUID();
}

uint64_t MRPairedDeviceCopyGroupName()
{
  return _MRPairedDeviceCopyGroupName();
}

uint64_t MRPairedDeviceCopyLinkAgent()
{
  return _MRPairedDeviceCopyLinkAgent();
}

uint64_t MRPairedDeviceCopyName()
{
  return _MRPairedDeviceCopyName();
}

uint64_t MRPairedDeviceCreateCopy()
{
  return _MRPairedDeviceCreateCopy();
}

uint64_t MRPairedDeviceCreateExternalRepresentation()
{
  return _MRPairedDeviceCreateExternalRepresentation();
}

uint64_t MRPairedDeviceEqualToPairedDevice()
{
  return _MRPairedDeviceEqualToPairedDevice();
}

uint64_t MRPairedDeviceGetDeviceClass()
{
  return _MRPairedDeviceGetDeviceClass();
}

uint64_t MRPairedDeviceGetGroupLogicalDeviceCount()
{
  return _MRPairedDeviceGetGroupLogicalDeviceCount();
}

uint64_t MRPairedDeviceGetIsAirPlayActive()
{
  return _MRPairedDeviceGetIsAirPlayActive();
}

uint64_t MRPairedDeviceIsTightlySyncedGroup()
{
  return _MRPairedDeviceIsTightlySyncedGroup();
}

uint64_t MRPlaybackQueueCopyContentItems()
{
  return _MRPlaybackQueueCopyContentItems();
}

uint64_t MRPlaybackQueueCreate()
{
  return _MRPlaybackQueueCreate();
}

uint64_t MRPlaybackQueueCreateExternalRepresentation()
{
  return _MRPlaybackQueueCreateExternalRepresentation();
}

uint64_t MRPlaybackQueueCreateFromExternalRepresentation()
{
  return _MRPlaybackQueueCreateFromExternalRepresentation();
}

uint64_t MRPlaybackQueueGetContentItemAtOffset()
{
  return _MRPlaybackQueueGetContentItemAtOffset();
}

uint64_t MRPlaybackQueueGetContentItemForIdentifier()
{
  return _MRPlaybackQueueGetContentItemForIdentifier();
}

uint64_t MRPlaybackQueueGetRange()
{
  return _MRPlaybackQueueGetRange();
}

uint64_t MRPlaybackQueueGetResolvedPlayerPath()
{
  return _MRPlaybackQueueGetResolvedPlayerPath();
}

uint64_t MRPlaybackQueueRequestCreate()
{
  return _MRPlaybackQueueRequestCreate();
}

uint64_t MRPlaybackQueueRequestCreateExternalRepresentation()
{
  return _MRPlaybackQueueRequestCreateExternalRepresentation();
}

uint64_t MRPlaybackQueueRequestCreateFromExternalRepresentation()
{
  return _MRPlaybackQueueRequestCreateFromExternalRepresentation();
}

uint64_t MRPlaybackQueueRequestCreateWithCurrentState()
{
  return _MRPlaybackQueueRequestCreateWithCurrentState();
}

uint64_t MRPlaybackQueueRequestCreateWithIdentifiers()
{
  return _MRPlaybackQueueRequestCreateWithIdentifiers();
}

uint64_t MRPlaybackQueueRequestSetIncludeArtwork()
{
  return _MRPlaybackQueueRequestSetIncludeArtwork();
}

uint64_t MRPlaybackQueueRequestSetIncludeMetadata()
{
  return _MRPlaybackQueueRequestSetIncludeMetadata();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return _NRVersionIsGreaterThanOrEqual();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteFloatField()
{
  return _PBDataWriterWriteFloatField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return _PBDataWriterWriteInt64Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t PBRepeatedDoubleAdd()
{
  return _PBRepeatedDoubleAdd();
}

uint64_t PBRepeatedDoubleClear()
{
  return _PBRepeatedDoubleClear();
}

uint64_t PBRepeatedDoubleCopy()
{
  return _PBRepeatedDoubleCopy();
}

uint64_t PBRepeatedDoubleHash()
{
  return _PBRepeatedDoubleHash();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return _PBRepeatedDoubleIsEqual();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return _PBRepeatedDoubleNSArray();
}

uint64_t PBRepeatedFloatAdd()
{
  return _PBRepeatedFloatAdd();
}

uint64_t PBRepeatedFloatClear()
{
  return _PBRepeatedFloatClear();
}

uint64_t PBRepeatedFloatCopy()
{
  return _PBRepeatedFloatCopy();
}

uint64_t PBRepeatedFloatHash()
{
  return _PBRepeatedFloatHash();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return _PBRepeatedFloatIsEqual();
}

uint64_t PBRepeatedFloatNSArray()
{
  return _PBRepeatedFloatNSArray();
}

uint64_t PBRepeatedInt32Add()
{
  return _PBRepeatedInt32Add();
}

uint64_t PBRepeatedInt32Clear()
{
  return _PBRepeatedInt32Clear();
}

uint64_t PBRepeatedInt32Copy()
{
  return _PBRepeatedInt32Copy();
}

uint64_t PBRepeatedInt32Hash()
{
  return _PBRepeatedInt32Hash();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return _PBRepeatedInt32IsEqual();
}

uint64_t PBRepeatedUInt32Add()
{
  return _PBRepeatedUInt32Add();
}

uint64_t PBRepeatedUInt32Clear()
{
  return _PBRepeatedUInt32Clear();
}

uint64_t PBRepeatedUInt32Copy()
{
  return _PBRepeatedUInt32Copy();
}

uint64_t PBRepeatedUInt32Hash()
{
  return _PBRepeatedUInt32Hash();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return _PBRepeatedUInt32IsEqual();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return _PBRepeatedUInt32NSArray();
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__contentItemIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _contentItemIdentifiers];
}

id objc_msgSend__getNextPlaceholderProcessID(void *a1, const char *a2, ...)
{
  return [a1 _getNextPlaceholderProcessID];
}

id objc_msgSend__prewarmSystemMusicApp(void *a1, const char *a2, ...)
{
  return [a1 _prewarmSystemMusicApp];
}

id objc_msgSend__proxiedOrigins(void *a1, const char *a2, ...)
{
  return [a1 _proxiedOrigins];
}

id objc_msgSend__refreshCurrentSupportedCommands(void *a1, const char *a2, ...)
{
  return [a1 _refreshCurrentSupportedCommands];
}

id objc_msgSend__registerForMediaRemoteNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForMediaRemoteNotifications];
}

id objc_msgSend__registerForOriginNotification(void *a1, const char *a2, ...)
{
  return [a1 _registerForOriginNotification];
}

id objc_msgSend__sendProxiedOriginsToClient(void *a1, const char *a2, ...)
{
  return [a1 _sendProxiedOriginsToClient];
}

id objc_msgSend__updateConnectionState(void *a1, const char *a2, ...)
{
  return [a1 _updateConnectionState];
}

id objc_msgSend__updateMediaRemoteAvailableAndActiveOrigins(void *a1, const char *a2, ...)
{
  return [a1 _updateMediaRemoteAvailableAndActiveOrigins];
}

id objc_msgSend__updateMediaRemoteLocalOrigin(void *a1, const char *a2, ...)
{
  return [a1 _updateMediaRemoteLocalOrigin];
}

id objc_msgSend__updateOriginsControllers(void *a1, const char *a2, ...)
{
  return [a1 _updateOriginsControllers];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_activeOrigin(void *a1, const char *a2, ...)
{
  return [a1 activeOrigin];
}

id objc_msgSend_album(void *a1, const char *a2, ...)
{
  return [a1 album];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_applicationInfoDigest(void *a1, const char *a2, ...)
{
  return [a1 applicationInfoDigest];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return [a1 artist];
}

id objc_msgSend_availableOrigins(void *a1, const char *a2, ...)
{
  return [a1 availableOrigins];
}

id objc_msgSend_availableRoutes(void *a1, const char *a2, ...)
{
  return [a1 availableRoutes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_classForKeyedUnarchiver(void *a1, const char *a2, ...)
{
  return [a1 classForKeyedUnarchiver];
}

id objc_msgSend_clearContentItems(void *a1, const char *a2, ...)
{
  return [a1 clearContentItems];
}

id objc_msgSend_clearHandlerReturnStatus(void *a1, const char *a2, ...)
{
  return [a1 clearHandlerReturnStatus];
}

id objc_msgSend_clearOrigins(void *a1, const char *a2, ...)
{
  return [a1 clearOrigins];
}

id objc_msgSend_clearPreferredIntervals(void *a1, const char *a2, ...)
{
  return [a1 clearPreferredIntervals];
}

id objc_msgSend_clearSupportedCommands(void *a1, const char *a2, ...)
{
  return [a1 clearSupportedCommands];
}

id objc_msgSend_clearSupportedPlaybackRates(void *a1, const char *a2, ...)
{
  return [a1 clearSupportedPlaybackRates];
}

id objc_msgSend_clearSupportedQueueEndActions(void *a1, const char *a2, ...)
{
  return [a1 clearSupportedQueueEndActions];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_companionOrigin(void *a1, const char *a2, ...)
{
  return [a1 companionOrigin];
}

id objc_msgSend_companionServer(void *a1, const char *a2, ...)
{
  return [a1 companionServer];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_contentItems(void *a1, const char *a2, ...)
{
  return [a1 contentItems];
}

id objc_msgSend_contentItemsCount(void *a1, const char *a2, ...)
{
  return [a1 contentItemsCount];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_designatedGroupLeaderName(void *a1, const char *a2, ...)
{
  return [a1 designatedGroupLeaderName];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_discoveryMode(void *a1, const char *a2, ...)
{
  return [a1 discoveryMode];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_eagerUpdateTimerFired(void *a1, const char *a2, ...)
{
  return [a1 eagerUpdateTimerFired];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_executeUpdateBlock(void *a1, const char *a2, ...)
{
  return [a1 executeUpdateBlock];
}

id objc_msgSend_externalDevice(void *a1, const char *a2, ...)
{
  return [a1 externalDevice];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fullPlaybackQueueData(void *a1, const char *a2, ...)
{
  return [a1 fullPlaybackQueueData];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_handlerReturnStatusCount(void *a1, const char *a2, ...)
{
  return [a1 handlerReturnStatusCount];
}

id objc_msgSend_hasDuration(void *a1, const char *a2, ...)
{
  return [a1 hasDuration];
}

id objc_msgSend_hasError(void *a1, const char *a2, ...)
{
  return [a1 hasError];
}

id objc_msgSend_hasIsAutoPlayItem(void *a1, const char *a2, ...)
{
  return [a1 hasIsAutoPlayItem];
}

id objc_msgSend_hasMetadata(void *a1, const char *a2, ...)
{
  return [a1 hasMetadata];
}

id objc_msgSend_hasOriginIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasOriginIdentifier];
}

id objc_msgSend_hasPlaybackQueue(void *a1, const char *a2, ...)
{
  return [a1 hasPlaybackQueue];
}

id objc_msgSend_hasProcessID(void *a1, const char *a2, ...)
{
  return [a1 hasProcessID];
}

id objc_msgSend_hasTimestamp(void *a1, const char *a2, ...)
{
  return [a1 hasTimestamp];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidatedMetadataIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 invalidatedMetadataIdentifiers];
}

id objc_msgSend_isAppleTVRoute(void *a1, const char *a2, ...)
{
  return [a1 isAppleTVRoute];
}

id objc_msgSend_isAutoPlayItem(void *a1, const char *a2, ...)
{
  return [a1 isAutoPlayItem];
}

id objc_msgSend_isB520Route(void *a1, const char *a2, ...)
{
  return [a1 isB520Route];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return [a1 isConnecting];
}

id objc_msgSend_isDeviceRoute(void *a1, const char *a2, ...)
{
  return [a1 isDeviceRoute];
}

id objc_msgSend_isHomePodRoute(void *a1, const char *a2, ...)
{
  return [a1 isHomePodRoute];
}

id objc_msgSend_isInvalidated(void *a1, const char *a2, ...)
{
  return [a1 isInvalidated];
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return [a1 isLocal];
}

id objc_msgSend_isPhoneRoute(void *a1, const char *a2, ...)
{
  return [a1 isPhoneRoute];
}

id objc_msgSend_isStereoPair(void *a1, const char *a2, ...)
{
  return [a1 isStereoPair];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localOrigin(void *a1, const char *a2, ...)
{
  return [a1 localOrigin];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mediaRemoteOrigin(void *a1, const char *a2, ...)
{
  return [a1 mediaRemoteOrigin];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_modelID(void *a1, const char *a2, ...)
{
  return [a1 modelID];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nowPlayingInfoDigest(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingInfoDigest];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_observedRange(void *a1, const char *a2, ...)
{
  return [a1 observedRange];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_origin(void *a1, const char *a2, ...)
{
  return [a1 origin];
}

id objc_msgSend_originIdentifier(void *a1, const char *a2, ...)
{
  return [a1 originIdentifier];
}

id objc_msgSend_origins(void *a1, const char *a2, ...)
{
  return [a1 origins];
}

id objc_msgSend_originsCount(void *a1, const char *a2, ...)
{
  return [a1 originsCount];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_playbackQueue(void *a1, const char *a2, ...)
{
  return [a1 playbackQueue];
}

id objc_msgSend_playbackQueueDigest(void *a1, const char *a2, ...)
{
  return [a1 playbackQueueDigest];
}

id objc_msgSend_playerPath(void *a1, const char *a2, ...)
{
  return [a1 playerPath];
}

id objc_msgSend_preferredIntervalsCount(void *a1, const char *a2, ...)
{
  return [a1 preferredIntervalsCount];
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return [a1 processID];
}

id objc_msgSend_protobuf(void *a1, const char *a2, ...)
{
  return [a1 protobuf];
}

id objc_msgSend_protobufData(void *a1, const char *a2, ...)
{
  return [a1 protobufData];
}

id objc_msgSend_queueData(void *a1, const char *a2, ...)
{
  return [a1 queueData];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_route(void *a1, const char *a2, ...)
{
  return [a1 route];
}

id objc_msgSend_routeName(void *a1, const char *a2, ...)
{
  return [a1 routeName];
}

id objc_msgSend_routeNames(void *a1, const char *a2, ...)
{
  return [a1 routeNames];
}

id objc_msgSend_routeUID(void *a1, const char *a2, ...)
{
  return [a1 routeUID];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_startHandlingMessages(void *a1, const char *a2, ...)
{
  return [a1 startHandlingMessages];
}

id objc_msgSend_supportedCommandsCount(void *a1, const char *a2, ...)
{
  return [a1 supportedCommandsCount];
}

id objc_msgSend_supportedCommandsDigest(void *a1, const char *a2, ...)
{
  return [a1 supportedCommandsDigest];
}

id objc_msgSend_supportedPlaybackRatesCount(void *a1, const char *a2, ...)
{
  return [a1 supportedPlaybackRatesCount];
}

id objc_msgSend_supportedQueueEndActionsCount(void *a1, const char *a2, ...)
{
  return [a1 supportedQueueEndActionsCount];
}

id objc_msgSend_systemRoute(void *a1, const char *a2, ...)
{
  return [a1 systemRoute];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}