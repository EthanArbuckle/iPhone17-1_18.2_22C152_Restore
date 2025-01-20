uint64_t sub_100004350(uint64_t a1, uint64_t a2)
{
  char v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t result;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      v3 = 0;
      v4 = 0;
      v5 = 0;
      while (1)
      {
        v6 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        v7 = v6 + 1;
        if (v6 == -1 || v7 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v6);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7;
        v5 |= (unint64_t)(v8 & 0x7F) << v3;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v3 += 7;
        if (v4++ >= 9)
        {
          v5 = 0;
          v10 = OBJC_IVAR___PBDataReader__error;
          v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      v10 = OBJC_IVAR___PBDataReader__error;
      v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        v5 = 0;
      }
LABEL_13:
      v12 = v5 & 7;
      if (v11 || v12 == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v5 >> 3) == 2) {
        break;
      }
      if ((v5 >> 3) == 1)
      {
        if (v12 != 2) {
          goto LABEL_40;
        }
        result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (1)
        {
          v15 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
          v16 = *v15;
          v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
          if (*v15 >= v17 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            break;
          }
          if (v16 > 0xFFFFFFFFFFFFFFFBLL || v16 + 4 > v17) {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else {
            *v15 = v16 + 4;
          }
          PBRepeatedFloatAdd();
        }
LABEL_39:
        PBReaderRecallMark();
        goto LABEL_45;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_45:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    if (v12 != 2)
    {
LABEL_40:
      v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 4;
      }
      else {
        *(unsigned char *)(a2 + v10) = 1;
      }
      PBRepeatedFloatAdd();
      goto LABEL_45;
    }
    result = PBReaderPlaceMark();
    if (!result) {
      return result;
    }
    while (1)
    {
      v18 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
      v19 = *v18;
      v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
      if (*v18 >= v20 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        break;
      }
      if (v19 > 0xFFFFFFFFFFFFFFFBLL || v19 + 4 > v20) {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
      }
      else {
        *v18 = v19 + 4;
      }
      PBRepeatedFloatAdd();
    }
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100007AA0(uint64_t a1, uint64_t a2)
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
        BOOL v9 = v5++ >= 9;
        if (v9)
        {
          unint64_t v6 = 0;
          uint64_t v10 = OBJC_IVAR___PBDataReader__error;
          int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      uint64_t v10 = OBJC_IVAR___PBDataReader__error;
      int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      int v12 = v6 & 7;
      if (v11 || v12 == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v6 >> 3))
      {
        case 1u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 792;
          goto LABEL_292;
        case 2u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 800;
          goto LABEL_292;
        case 3u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 688;
          goto LABEL_292;
        case 4u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 808;
          goto LABEL_292;
        case 5u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 696;
          goto LABEL_292;
        case 6u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 824;
          goto LABEL_292;
        case 7u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 832;
          goto LABEL_292;
        case 8u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 840;
          goto LABEL_292;
        case 9u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v17 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v18 = *v17;
            unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v17 >= v19 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v18 > 0xFFFFFFFFFFFFFFFBLL || v18 + 4 > v19) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v17 = v18 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0xAu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v20 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v21 = *v20;
            unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v20 >= v22 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v20 = v21 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0xBu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v23 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v24 = *v23;
            unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v23 >= v25 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v24 > 0xFFFFFFFFFFFFFFFBLL || v24 + 4 > v25) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v23 = v24 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0xCu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v26 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v27 = *v26;
            unint64_t v28 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v26 >= v28 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v27 > 0xFFFFFFFFFFFFFFFBLL || v27 + 4 > v28) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v26 = v27 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0xDu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v29 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v30 = *v29;
            unint64_t v31 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v29 >= v31 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v30 > 0xFFFFFFFFFFFFFFFBLL || v30 + 4 > v31) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v29 = v30 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0xEu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v32 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v33 = *v32;
            unint64_t v34 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v32 >= v34 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v33 > 0xFFFFFFFFFFFFFFFBLL || v33 + 4 > v34) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v32 = v33 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0xFu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v35 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v36 = *v35;
            unint64_t v37 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v35 >= v37 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v36 > 0xFFFFFFFFFFFFFFFBLL || v36 + 4 > v37) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v35 = v36 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x10u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 680;
          goto LABEL_292;
        case 0x11u:
          v14 = objc_alloc_init(OTABMUResistance);
          objc_storeStrong((id *)(a1 + 760), v14);
          if (!PBReaderPlaceMark() || !sub_10000D38C((uint64_t)v14, a2)) {
            goto LABEL_354;
          }
          goto LABEL_294;
        case 0x12u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          while (2)
          {
            uint64_t v41 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
            {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v41);
              *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v42;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v9 = v39++ >= 9;
                if (v9)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_329;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v40) = 0;
          }
LABEL_329:
          uint64_t v118 = 768;
          goto LABEL_334;
        case 0x13u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v44 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v45 = *v44;
            unint64_t v46 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v44 >= v46 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v45 > 0xFFFFFFFFFFFFFFFBLL || v45 + 4 > v46) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v44 = v45 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x14u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 704;
          goto LABEL_292;
        case 0x15u:
          *(unsigned char *)(a1 + 868) |= 8u;
          unint64_t v47 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v47 <= 0xFFFFFFFFFFFFFFFBLL && v47 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v48 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v47);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v47 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v48 = 0;
          }
          uint64_t v120 = 780;
          goto LABEL_350;
        case 0x16u:
          *(unsigned char *)(a1 + 868) |= 0x10u;
          unint64_t v49 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v49 <= 0xFFFFFFFFFFFFFFFBLL && v49 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v48 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v49);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v49 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v48 = 0;
          }
          uint64_t v120 = 784;
          goto LABEL_350;
        case 0x17u:
          *(unsigned char *)(a1 + 868) |= 1u;
          unint64_t v50 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v50 <= 0xFFFFFFFFFFFFFFFBLL && v50 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v48 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v50);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v50 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v48 = 0;
          }
          uint64_t v120 = 752;
          goto LABEL_350;
        case 0x18u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v51 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v52 = *v51;
            unint64_t v53 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v51 >= v53 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v52 > 0xFFFFFFFFFFFFFFFBLL || v52 + 4 > v53) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v51 = v52 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x19u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v54 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v55 = *v54;
            unint64_t v56 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v54 >= v56 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v55 > 0xFFFFFFFFFFFFFFFBLL || v55 + 4 > v56) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v54 = v55 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x1Au:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v57 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v58 = *v57;
            unint64_t v59 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v57 >= v59 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v58 > 0xFFFFFFFFFFFFFFFBLL || v58 + 4 > v59) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v57 = v58 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x1Bu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v60 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v61 = *v60;
            unint64_t v62 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v60 >= v62 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v61 > 0xFFFFFFFFFFFFFFFBLL || v61 + 4 > v62) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v60 = v61 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x1Cu:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 816;
          goto LABEL_292;
        case 0x1Du:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 848;
          goto LABEL_292;
        case 0x1Eu:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 712;
          goto LABEL_292;
        case 0x1Fu:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 720;
          goto LABEL_292;
        case 0x20u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 728;
          goto LABEL_292;
        case 0x21u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 736;
          goto LABEL_292;
        case 0x22u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 744;
          goto LABEL_292;
        case 0x23u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v63 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v64 = *v63;
            unint64_t v65 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v63 >= v65 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v64 > 0xFFFFFFFFFFFFFFFBLL || v64 + 4 > v65) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v63 = v64 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x24u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v66 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v67 = *v66;
            unint64_t v68 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v66 >= v68 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v67 > 0xFFFFFFFFFFFFFFFBLL || v67 + 4 > v68) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v66 = v67 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x25u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v69 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v70 = *v69;
            unint64_t v71 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v69 >= v71 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v70 > 0xFFFFFFFFFFFFFFFBLL || v70 + 4 > v71) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v69 = v70 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x26u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v72 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v73 = *v72;
            unint64_t v74 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v72 >= v74 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v73 > 0xFFFFFFFFFFFFFFFBLL || v73 + 4 > v74) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v72 = v73 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x27u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v75 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v76 = *v75;
            unint64_t v77 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v75 >= v77 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v76 > 0xFFFFFFFFFFFFFFFBLL || v76 + 4 > v77) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v75 = v76 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x28u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v78 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v79 = *v78;
            unint64_t v80 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v78 >= v80 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v79 > 0xFFFFFFFFFFFFFFFBLL || v79 + 4 > v80) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v78 = v79 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x29u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v81 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v82 = *v81;
            unint64_t v83 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v81 >= v83 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v82 > 0xFFFFFFFFFFFFFFFBLL || v82 + 4 > v83) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v81 = v82 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x2Au:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v84 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v85 = *v84;
            unint64_t v86 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v84 >= v86 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v85 > 0xFFFFFFFFFFFFFFFBLL || v85 + 4 > v86) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v84 = v85 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x2Bu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v87 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v88 = *v87;
            unint64_t v89 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v87 >= v89 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v88 > 0xFFFFFFFFFFFFFFFBLL || v88 + 4 > v89) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v87 = v88 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x2Cu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v90 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v91 = *v90;
            unint64_t v92 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v90 >= v92 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v91 > 0xFFFFFFFFFFFFFFFBLL || v91 + 4 > v92) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v90 = v91 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x2Du:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 868) |= 2u;
          while (2)
          {
            uint64_t v95 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v96 = v95 + 1;
            if (v95 == -1 || v96 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
            {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v97 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v95);
              *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v96;
              v40 |= (unint64_t)(v97 & 0x7F) << v93;
              if (v97 < 0)
              {
                v93 += 7;
                BOOL v9 = v94++ >= 9;
                if (v9)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_333;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
            LODWORD(v40) = 0;
          }
LABEL_333:
          uint64_t v118 = 772;
LABEL_334:
          *(_DWORD *)(a1 + v118) = v40;
          goto LABEL_351;
        case 0x2Eu:
          *(unsigned char *)(a1 + 868) |= 0x20u;
          unint64_t v98 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v98 <= 0xFFFFFFFFFFFFFFFBLL && v98 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v48 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v98);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v98 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v48 = 0;
          }
          uint64_t v120 = 864;
          goto LABEL_350;
        case 0x2Fu:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v99 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v100 = *v99;
            unint64_t v101 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v99 >= v101 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v100 > 0xFFFFFFFFFFFFFFFBLL || v100 + 4 > v101) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v99 = v100 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x30u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v102 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v103 = *v102;
            unint64_t v104 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v102 >= v104 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v103 > 0xFFFFFFFFFFFFFFFBLL || v103 + 4 > v104) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v102 = v103 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x31u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v105 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v106 = *v105;
            unint64_t v107 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v105 >= v107 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v106 > 0xFFFFFFFFFFFFFFFBLL || v106 + 4 > v107) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v105 = v106 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x32u:
          v14 = objc_alloc_init(OTAResistanceData);
          uint64_t v15 = 856;
LABEL_292:
          objc_storeStrong((id *)(a1 + v15), v14);
          if (!PBReaderPlaceMark() || (sub_100004350((uint64_t)v14, a2) & 1) == 0)
          {
LABEL_354:

            return 0;
          }
LABEL_294:
          PBReaderRecallMark();

LABEL_351:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
        case 0x33u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v108 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v109 = *v108;
            unint64_t v110 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v108 >= v110 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v109 > 0xFFFFFFFFFFFFFFFBLL || v109 + 4 > v110) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v108 = v109 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x34u:
          if (v12 != 2) {
            goto LABEL_335;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v111 = (unint64_t *)(a2 + OBJC_IVAR___PBDataReader__pos);
            unint64_t v112 = *v111;
            unint64_t v113 = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
            if (*v111 >= v113 || *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
              break;
            }
            if (v112 > 0xFFFFFFFFFFFFFFFBLL || v112 + 4 > v113) {
              *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else {
              unint64_t *v111 = v112 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_322;
        case 0x35u:
          if (v12 == 2)
          {
            uint64_t result = PBReaderPlaceMark();
            if (!result) {
              return result;
            }
            int v114 = OBJC_IVAR___PBDataReader__pos;
            unint64_t v115 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            for (unint64_t i = *(void *)(a2 + OBJC_IVAR___PBDataReader__length);
                  v115 < i;
                  unint64_t i = *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
            {
              if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
                break;
              }
              if (v115 <= 0xFFFFFFFFFFFFFFFBLL && v115 + 4 <= i) {
                *(void *)(a2 + v114) = v115 + 4;
              }
              else {
                *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
              }
              PBRepeatedFloatAdd();
              int v114 = OBJC_IVAR___PBDataReader__pos;
              unint64_t v115 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            }
LABEL_322:
            PBReaderRecallMark();
          }
          else
          {
LABEL_335:
            unint64_t v119 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
            if (v119 <= 0xFFFFFFFFFFFFFFFBLL && v119 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
              *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v119 + 4;
            }
            else {
              *(unsigned char *)(a2 + v10) = 1;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_351;
        case 0x36u:
          *(unsigned char *)(a1 + 868) |= 4u;
          unint64_t v117 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v117 <= 0xFFFFFFFFFFFFFFFBLL && v117 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v48 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v117);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v117 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v48 = 0;
          }
          uint64_t v120 = 776;
LABEL_350:
          *(_DWORD *)(a1 + v120) = v48;
          goto LABEL_351;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_351;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_10000D38C(uint64_t a1, uint64_t a2)
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
        if (v5++ >= 9)
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
          *(_WORD *)(a1 + 44) |= 0x80u;
          unint64_t v13 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v13 <= 0xFFFFFFFFFFFFFFFBLL && v13 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v13);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v13 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__traceResistance25C;
          goto LABEL_65;
        case 2u:
          *(_WORD *)(a1 + 44) |= 0x100u;
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 <= 0xFFFFFFFFFFFFFFFBLL && v15 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__traceResistanceTemperatureCoeff;
          goto LABEL_65;
        case 3u:
          *(_WORD *)(a1 + 44) |= 0x40u;
          unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v16 <= 0xFFFFFFFFFFFFFFFBLL && v16 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__systemEquivalentResistance;
          goto LABEL_65;
        case 4u:
          *(_WORD *)(a1 + 44) |= 1u;
          unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v17 <= 0xFFFFFFFFFFFFFFFBLL && v17 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__downstreamCommonResistance;
          goto LABEL_65;
        case 5u:
          *(_WORD *)(a1 + 44) |= 2u;
          unint64_t v18 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v18 <= 0xFFFFFFFFFFFFFFFBLL && v18 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v18);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__downstreamNorthResistance;
          goto LABEL_65;
        case 6u:
          *(_WORD *)(a1 + 44) |= 8u;
          unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__resistanceGGToVcut;
          goto LABEL_65;
        case 7u:
          *(_WORD *)(a1 + 44) |= 0x10u;
          unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 <= 0xFFFFFFFFFFFFFFFBLL && v20 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__resistancePMUToVcut;
          goto LABEL_65;
        case 8u:
          *(_WORD *)(a1 + 44) |= 0x20u;
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__resistanceVcutToPmax;
          goto LABEL_65;
        case 9u:
          *(_WORD *)(a1 + 44) |= 4u;
          unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            int v14 = *(_DWORD *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
            int v14 = 0;
          }
          v23 = &OBJC_IVAR___OTABMUResistance__resistanceCellTabToGG;
LABEL_65:
          *(_DWORD *)(a1 + *v23) = v14;
          goto LABEL_66;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_66:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void start()
{
  v1 = os_log_create("com.apple.peakpowermanagerd", "main");
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = dispatch_queue_create("com.apple.peakpowermanagerd.batterymodelqueue", v2);

  uint64_t v4 = +[BatteryModelDataHandler sharedInstance];
  unsigned int v5 = (void *)qword_10001E1E0;
  qword_10001E1E0 = v4;

  if (!qword_10001E1E0 && os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "peakpowermanagerd failed to start\n", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E784;
  block[3] = &unk_1000182E8;
  unint64_t v8 = v1;
  unint64_t v6 = v1;
  dispatch_async(v3, block);

  dispatch_main();
}

void sub_10000E784(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.peakpowermanagerd"];
  if (v2)
  {
    size_t size = 0;
    if (!sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
    {
      v3 = malloc_type_malloc(size, 0x9FB48210uLL);
      if (v3)
      {
        uint64_t v4 = v3;
        if (sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0))
        {
          unsigned int v5 = 0;
        }
        else
        {
          unsigned int v5 = +[NSString stringWithUTF8String:v4];
        }
        free(v4);
        if (v5)
        {
          unint64_t v6 = [v2 stringForKey:@"savedBootUUID"];
          if ([v6 isEqualToString:v5])
          {
            uint64_t v7 = *(NSObject **)(a1 + 32);
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(size) = 0;
              unint64_t v8 = "Main Unchanged boot UUID. Skipping battery model task\n";
              char v9 = v7;
              uint32_t v10 = 2;
LABEL_25:
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&size, v10);
              goto LABEL_26;
            }
            goto LABEL_26;
          }
          id v27 = [(id)qword_10001E1E0 getBatteryChemID];
          unint64_t v28 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            sub_100010240(v27, v28);
            if (v27)
            {
LABEL_16:
              unsigned int v29 = [(id)qword_10001E1E0 moveBatteryModelDataFromDiskToKext:v27];
              unint64_t v30 = *(NSObject **)(a1 + 32);
              if (v29)
              {
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(size) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Battery data upload succeeded\n", (uint8_t *)&size, 2u);
                }
                [v2 setObject:v5 forKey:@"savedBootUUID"];
              }
              else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                sub_100010208(v30, v31, v32, v33, v34, v35, v36, v37);
              }
              goto LABEL_26;
            }
          }
          else if (v27)
          {
            goto LABEL_16;
          }
          char v38 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            size_t size = 67109120;
            unint64_t v8 = "Chem ID returned 0 (may indicate dev board). Skipping loading battery model %x \n";
            char v9 = v38;
            uint32_t v10 = 8;
            goto LABEL_25;
          }
LABEL_26:

          goto LABEL_27;
        }
      }
    }
    unint64_t v19 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000101D0(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  else
  {
    int v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100010198(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
LABEL_27:
}

void sub_10000EA44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000EB44(id a1)
{
  qword_10001E1E8 = objc_alloc_init(BatteryModelDataHandler);

  _objc_release_x1();
}

void *sub_10000F1BC(_OWORD *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 resistance25Cs];
  *a1 = *v4;
  long long v5 = v4[4];
  long long v7 = v4[1];
  long long v6 = v4[2];
  a1[3] = v4[3];
  a1[4] = v5;
  a1[1] = v7;
  a1[2] = v6;
  long long v8 = v4[8];
  long long v10 = v4[5];
  long long v9 = v4[6];
  a1[7] = v4[7];
  a1[8] = v8;
  a1[5] = v10;
  a1[6] = v9;
  long long v12 = v4[10];
  long long v11 = v4[11];
  long long v13 = v4[9];
  *(_OWORD *)((char *)a1 + 188) = *(_OWORD *)((char *)v4 + 188);
  a1[10] = v12;
  a1[11] = v11;
  a1[9] = v13;
  id v14 = [v3 temperatureCoeffs];

  return memcpy((char *)a1 + 204, v14, 0x330uLL);
}

void sub_10000F260(_DWORD *a1, void *a2)
{
  id v3 = a2;
  [v3 downstreamCommonResistance];
  a1[3] = v4;
  [v3 downstreamNorthResistance];
  a1[4] = v5;
  [v3 systemEquivalentResistance];
  a1[2] = v6;
  [v3 traceResistance25C];
  *a1 = v7;
  [v3 traceResistanceTemperatureCoeff];
  a1[1] = v8;
  [v3 resistanceGGToVcut];
  a1[5] = v9;
  [v3 resistancePMUToVcut];
  a1[6] = v10;
  [v3 resistanceVcutToPmax];
  a1[7] = v11;
  [v3 resistanceCellTabToGG];
  int v13 = v12;

  a1[8] = v13;
}

void sub_100010154(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100010198(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000101D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010208(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010240(unsigned int a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Battery data upload run for chemId 0x%lx\n", (uint8_t *)&v2, 0xCu);
}

void sub_1000102BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010334(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000103AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010424(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001049C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to malloc.", v1, 2u);
}

void sub_1000104E0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Read HW type %s\n", (uint8_t *)&v2, 0xCu);
}

void sub_100010558(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to read value (%d).", (uint8_t *)v2, 8u);
}

void sub_1000105D0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to read size (%d).", (uint8_t *)v2, 8u);
}

void sub_100010648(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000106C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010738()
{
  v1[0] = 136315394;
  sub_100010170();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s <Error> file not present: %@", (uint8_t *)v1, 0x16u);
}

void sub_1000107B8()
{
  v1[0] = 136315394;
  sub_100010170();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s workingDirURL resource: %@ \n", (uint8_t *)v1, 0x16u);
}

void sub_100010838(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000108B0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = [a2 localizedDescription];
  v5[0] = 136315394;
  sub_100010170();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s <Error> readContent error is %@", (uint8_t *)v5, 0x16u);
}

void sub_100010960(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000109D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010A50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010AC8(os_log_t log)
{
  int v1 = 136315394;
  int v2 = "-[BatteryModelDataHandler moveBatteryModelDataFromDiskToKext:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s <Error> file %@ does not exist", (uint8_t *)&v1, 0x16u);
}

void sub_100010B58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010BD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010C48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010CC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010D38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010DB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010E28()
{
  v1[0] = 136315394;
  sub_100010184();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s <Error> IOConnectCallStructMethod fail to call IOUserClient setBatteryParams,  ioReturnResult = %d", (uint8_t *)v1, 0x12u);
}

void sub_100010EA8()
{
  v1[0] = 136315394;
  sub_100010184();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s <Error> IOServiceOpen fail to connect, ioReturnResult = %d", (uint8_t *)v1, 0x12u);
}

void sub_100010F28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010FA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011018(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011090(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *a2;
  int v5 = 136315650;
  int v6 = "-[BatteryModelDataHandler verifyHashData:]";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s <Error> sentHash %x mismatches with returnedHash %x", (uint8_t *)&v5, 0x18u);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
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

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t PBDataWriterWriteFloatField()
{
  return _PBDataWriterWriteFloatField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_agingCoeffForR0TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR0TemperatureCoeffs];
}

id objc_msgSend_agingCoeffForR0TemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR0TemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForR0s(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR0s];
}

id objc_msgSend_agingCoeffForR0sCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR0sCount];
}

id objc_msgSend_agingCoeffForR1TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR1TemperatureCoeffs];
}

id objc_msgSend_agingCoeffForR1TemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR1TemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForR1s(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR1s];
}

id objc_msgSend_agingCoeffForR1sCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR1sCount];
}

id objc_msgSend_agingCoeffForR2TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR2TemperatureCoeffs];
}

id objc_msgSend_agingCoeffForR2TemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR2TemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForR2s(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR2s];
}

id objc_msgSend_agingCoeffForR2sCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR2sCount];
}

id objc_msgSend_agingCoeffForR3TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR3TemperatureCoeffs];
}

id objc_msgSend_agingCoeffForR3TemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR3TemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForR3s(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR3s];
}

id objc_msgSend_agingCoeffForR3sCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForR3sCount];
}

id objc_msgSend_agingCoeffForRCFreq1TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq1TemperatureCoeffs];
}

id objc_msgSend_agingCoeffForRCFreq1TemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq1TemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForRCFreq1s(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq1s];
}

id objc_msgSend_agingCoeffForRCFreq1sCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq1sCount];
}

id objc_msgSend_agingCoeffForRCFreq2TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq2TemperatureCoeffs];
}

id objc_msgSend_agingCoeffForRCFreq2TemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq2TemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForRCFreq2s(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq2s];
}

id objc_msgSend_agingCoeffForRCFreq2sCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq2sCount];
}

id objc_msgSend_agingCoeffForRCFreq3TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq3TemperatureCoeffs];
}

id objc_msgSend_agingCoeffForRCFreq3TemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq3TemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForRCFreq3s(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq3s];
}

id objc_msgSend_agingCoeffForRCFreq3sCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq3sCount];
}

id objc_msgSend_agingCoeffForRCFreq4TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq4TemperatureCoeffs];
}

id objc_msgSend_agingCoeffForRCFreq4TemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq4TemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForRCFreq4s(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq4s];
}

id objc_msgSend_agingCoeffForRCFreq4sCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRCFreq4sCount];
}

id objc_msgSend_agingCoeffForRdcTemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRdcTemperatureCoeffs];
}

id objc_msgSend_agingCoeffForRdcTemperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRdcTemperatureCoeffsCount];
}

id objc_msgSend_agingCoeffForRdcs(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRdcs];
}

id objc_msgSend_agingCoeffForRdcsCount(void *a1, const char *a2, ...)
{
  return [a1 agingCoeffForRdcsCount];
}

id objc_msgSend_baselineR0(void *a1, const char *a2, ...)
{
  return [a1 baselineR0];
}

id objc_msgSend_baselineR1(void *a1, const char *a2, ...)
{
  return [a1 baselineR1];
}

id objc_msgSend_baselineR2(void *a1, const char *a2, ...)
{
  return [a1 baselineR2];
}

id objc_msgSend_baselineR3(void *a1, const char *a2, ...)
{
  return [a1 baselineR3];
}

id objc_msgSend_baselineR4(void *a1, const char *a2, ...)
{
  return [a1 baselineR4];
}

id objc_msgSend_baselineRCFreq1(void *a1, const char *a2, ...)
{
  return [a1 baselineRCFreq1];
}

id objc_msgSend_baselineRCFreq2(void *a1, const char *a2, ...)
{
  return [a1 baselineRCFreq2];
}

id objc_msgSend_baselineRCFreq3(void *a1, const char *a2, ...)
{
  return [a1 baselineRCFreq3];
}

id objc_msgSend_baselineRCFreq4(void *a1, const char *a2, ...)
{
  return [a1 baselineRCFreq4];
}

id objc_msgSend_baselineRdcs(void *a1, const char *a2, ...)
{
  return [a1 baselineRdcs];
}

id objc_msgSend_baselineRdcsCount(void *a1, const char *a2, ...)
{
  return [a1 baselineRdcsCount];
}

id objc_msgSend_baselineWRdc(void *a1, const char *a2, ...)
{
  return [a1 baselineWRdc];
}

id objc_msgSend_bmuResistance(void *a1, const char *a2, ...)
{
  return [a1 bmuResistance];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_chemID(void *a1, const char *a2, ...)
{
  return [a1 chemID];
}

id objc_msgSend_clearAgingCoeffForR0TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForR0TemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForR0s(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForR0s];
}

id objc_msgSend_clearAgingCoeffForR1TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForR1TemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForR1s(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForR1s];
}

id objc_msgSend_clearAgingCoeffForR2TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForR2TemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForR2s(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForR2s];
}

id objc_msgSend_clearAgingCoeffForR3TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForR3TemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForR3s(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForR3s];
}

id objc_msgSend_clearAgingCoeffForRCFreq1TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRCFreq1TemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForRCFreq1s(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRCFreq1s];
}

id objc_msgSend_clearAgingCoeffForRCFreq2TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRCFreq2TemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForRCFreq2s(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRCFreq2s];
}

id objc_msgSend_clearAgingCoeffForRCFreq3TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRCFreq3TemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForRCFreq3s(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRCFreq3s];
}

id objc_msgSend_clearAgingCoeffForRCFreq4TemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRCFreq4TemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForRCFreq4s(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRCFreq4s];
}

id objc_msgSend_clearAgingCoeffForRdcTemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRdcTemperatureCoeffs];
}

id objc_msgSend_clearAgingCoeffForRdcs(void *a1, const char *a2, ...)
{
  return [a1 clearAgingCoeffForRdcs];
}

id objc_msgSend_clearBaselineRdcs(void *a1, const char *a2, ...)
{
  return [a1 clearBaselineRdcs];
}

id objc_msgSend_clearCoeffSOCs(void *a1, const char *a2, ...)
{
  return [a1 clearCoeffSOCs];
}

id objc_msgSend_clearCoeffVs(void *a1, const char *a2, ...)
{
  return [a1 clearCoeffVs];
}

id objc_msgSend_clearGridOCVs(void *a1, const char *a2, ...)
{
  return [a1 clearGridOCVs];
}

id objc_msgSend_clearGridWRdcRatios(void *a1, const char *a2, ...)
{
  return [a1 clearGridWRdcRatios];
}

id objc_msgSend_clearQmaxs(void *a1, const char *a2, ...)
{
  return [a1 clearQmaxs];
}

id objc_msgSend_clearResistance25Cs(void *a1, const char *a2, ...)
{
  return [a1 clearResistance25Cs];
}

id objc_msgSend_clearSlopeForR0Extraps(void *a1, const char *a2, ...)
{
  return [a1 clearSlopeForR0Extraps];
}

id objc_msgSend_clearSlopeForR1Extraps(void *a1, const char *a2, ...)
{
  return [a1 clearSlopeForR1Extraps];
}

id objc_msgSend_clearSlopeForR2Extraps(void *a1, const char *a2, ...)
{
  return [a1 clearSlopeForR2Extraps];
}

id objc_msgSend_clearSlopeForR3Extraps(void *a1, const char *a2, ...)
{
  return [a1 clearSlopeForR3Extraps];
}

id objc_msgSend_clearTemperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 clearTemperatureCoeffs];
}

id objc_msgSend_coeffSOCs(void *a1, const char *a2, ...)
{
  return [a1 coeffSOCs];
}

id objc_msgSend_coeffSOCsCount(void *a1, const char *a2, ...)
{
  return [a1 coeffSOCsCount];
}

id objc_msgSend_coeffVs(void *a1, const char *a2, ...)
{
  return [a1 coeffVs];
}

id objc_msgSend_coeffVsCount(void *a1, const char *a2, ...)
{
  return [a1 coeffVsCount];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_downstreamCommonResistance(void *a1, const char *a2, ...)
{
  return [a1 downstreamCommonResistance];
}

id objc_msgSend_downstreamNorthResistance(void *a1, const char *a2, ...)
{
  return [a1 downstreamNorthResistance];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getBatteryChemID(void *a1, const char *a2, ...)
{
  return [a1 getBatteryChemID];
}

id objc_msgSend_getDeviceType(void *a1, const char *a2, ...)
{
  return [a1 getDeviceType];
}

id objc_msgSend_gridOCVs(void *a1, const char *a2, ...)
{
  return [a1 gridOCVs];
}

id objc_msgSend_gridOCVsCount(void *a1, const char *a2, ...)
{
  return [a1 gridOCVsCount];
}

id objc_msgSend_gridWRdcRatios(void *a1, const char *a2, ...)
{
  return [a1 gridWRdcRatios];
}

id objc_msgSend_gridWRdcRatiosCount(void *a1, const char *a2, ...)
{
  return [a1 gridWRdcRatiosCount];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mLBConfig(void *a1, const char *a2, ...)
{
  return [a1 mLBConfig];
}

id objc_msgSend_maxRdcR25Ratio(void *a1, const char *a2, ...)
{
  return [a1 maxRdcR25Ratio];
}

id objc_msgSend_maxRdcRatio(void *a1, const char *a2, ...)
{
  return [a1 maxRdcRatio];
}

id objc_msgSend_maxRdcRatioR2Extrap(void *a1, const char *a2, ...)
{
  return [a1 maxRdcRatioR2Extrap];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_qmaxs(void *a1, const char *a2, ...)
{
  return [a1 qmaxs];
}

id objc_msgSend_qmaxsCount(void *a1, const char *a2, ...)
{
  return [a1 qmaxsCount];
}

id objc_msgSend_r0(void *a1, const char *a2, ...)
{
  return [a1 r0];
}

id objc_msgSend_r1(void *a1, const char *a2, ...)
{
  return [a1 r1];
}

id objc_msgSend_r2(void *a1, const char *a2, ...)
{
  return [a1 r2];
}

id objc_msgSend_r3(void *a1, const char *a2, ...)
{
  return [a1 r3];
}

id objc_msgSend_rCFreq1(void *a1, const char *a2, ...)
{
  return [a1 rCFreq1];
}

id objc_msgSend_rCFreq2(void *a1, const char *a2, ...)
{
  return [a1 rCFreq2];
}

id objc_msgSend_rCFreq3(void *a1, const char *a2, ...)
{
  return [a1 rCFreq3];
}

id objc_msgSend_rCFreq4(void *a1, const char *a2, ...)
{
  return [a1 rCFreq4];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_rdc(void *a1, const char *a2, ...)
{
  return [a1 rdc];
}

id objc_msgSend_resistance25Cs(void *a1, const char *a2, ...)
{
  return [a1 resistance25Cs];
}

id objc_msgSend_resistance25CsCount(void *a1, const char *a2, ...)
{
  return [a1 resistance25CsCount];
}

id objc_msgSend_resistanceCellTabToGG(void *a1, const char *a2, ...)
{
  return [a1 resistanceCellTabToGG];
}

id objc_msgSend_resistanceGGToVcut(void *a1, const char *a2, ...)
{
  return [a1 resistanceGGToVcut];
}

id objc_msgSend_resistancePMUToVcut(void *a1, const char *a2, ...)
{
  return [a1 resistancePMUToVcut];
}

id objc_msgSend_resistanceVcutToPmax(void *a1, const char *a2, ...)
{
  return [a1 resistanceVcutToPmax];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_slopeForR0Extraps(void *a1, const char *a2, ...)
{
  return [a1 slopeForR0Extraps];
}

id objc_msgSend_slopeForR0ExtrapsCount(void *a1, const char *a2, ...)
{
  return [a1 slopeForR0ExtrapsCount];
}

id objc_msgSend_slopeForR1Extraps(void *a1, const char *a2, ...)
{
  return [a1 slopeForR1Extraps];
}

id objc_msgSend_slopeForR1ExtrapsCount(void *a1, const char *a2, ...)
{
  return [a1 slopeForR1ExtrapsCount];
}

id objc_msgSend_slopeForR2Extraps(void *a1, const char *a2, ...)
{
  return [a1 slopeForR2Extraps];
}

id objc_msgSend_slopeForR2ExtrapsCount(void *a1, const char *a2, ...)
{
  return [a1 slopeForR2ExtrapsCount];
}

id objc_msgSend_slopeForR3Extraps(void *a1, const char *a2, ...)
{
  return [a1 slopeForR3Extraps];
}

id objc_msgSend_slopeForR3ExtrapsCount(void *a1, const char *a2, ...)
{
  return [a1 slopeForR3ExtrapsCount];
}

id objc_msgSend_systemEquivalentResistance(void *a1, const char *a2, ...)
{
  return [a1 systemEquivalentResistance];
}

id objc_msgSend_temperatureCoeffs(void *a1, const char *a2, ...)
{
  return [a1 temperatureCoeffs];
}

id objc_msgSend_temperatureCoeffsCount(void *a1, const char *a2, ...)
{
  return [a1 temperatureCoeffsCount];
}

id objc_msgSend_traceResistance25C(void *a1, const char *a2, ...)
{
  return [a1 traceResistance25C];
}

id objc_msgSend_traceResistanceTemperatureCoeff(void *a1, const char *a2, ...)
{
  return [a1 traceResistanceTemperatureCoeff];
}

id objc_msgSend_wRdcRatioThresh(void *a1, const char *a2, ...)
{
  return [a1 wRdcRatioThresh];
}