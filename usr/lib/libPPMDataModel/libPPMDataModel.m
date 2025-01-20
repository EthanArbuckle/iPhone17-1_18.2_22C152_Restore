uint64_t OTAResistanceDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t result;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v6 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(void *)(a2 + v10);
        v12 = v11 + 1;
        if (v11 == -1 || v12 > *(void *)(a2 + *v4)) {
          break;
        }
        v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        if (v8++ >= 9)
        {
          v9 = 0;
          v15 = *v5;
          v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *v5;
      v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(unsigned char *)(a2 + v15)) {
        v9 = 0;
      }
LABEL_14:
      v17 = v9 & 7;
      if (v16 || v17 == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v9 >> 3) == 2) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v17 != 2) {
          goto LABEL_41;
        }
        result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (1)
        {
          v20 = (unint64_t *)(a2 + *v3);
          v21 = *v20;
          v22 = *(void *)(a2 + *v4);
          if (*v20 >= v22) {
            break;
          }
          v23 = *v5;
          if (*(unsigned char *)(a2 + v23)) {
            break;
          }
          if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22) {
            *(unsigned char *)(a2 + v23) = 1;
          }
          else {
            *v20 = v21 + 4;
          }
          PBRepeatedFloatAdd();
        }
LABEL_40:
        PBReaderRecallMark();
        goto LABEL_46;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_46:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    if (v17 != 2)
    {
LABEL_41:
      v28 = *v3;
      v29 = *(void *)(a2 + v28);
      if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)(a2 + *v4)) {
        *(void *)(a2 + v28) = v29 + 4;
      }
      else {
        *(unsigned char *)(a2 + v15) = 1;
      }
      PBRepeatedFloatAdd();
      goto LABEL_46;
    }
    result = PBReaderPlaceMark();
    if (!result) {
      return result;
    }
    while (1)
    {
      v24 = (unint64_t *)(a2 + *v3);
      v25 = *v24;
      v26 = *(void *)(a2 + *v4);
      if (*v24 >= v26) {
        break;
      }
      v27 = *v5;
      if (*(unsigned char *)(a2 + v27)) {
        break;
      }
      if (v25 > 0xFFFFFFFFFFFFFFFBLL || v25 + 4 > v26) {
        *(unsigned char *)(a2 + v27) = 1;
      }
      else {
        *v24 = v25 + 4;
      }
      PBRepeatedFloatAdd();
    }
    goto LABEL_40;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t OTAParamRCReadFrom(uint64_t a1, uint64_t a2)
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
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          uint64_t v15 = *v5;
          int v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v15 = *v5;
      int v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(unsigned char *)(a2 + v15)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v17 = v10 & 7;
      if (v16 || v17 == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 792;
          goto LABEL_293;
        case 2u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 800;
          goto LABEL_293;
        case 3u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 688;
          goto LABEL_293;
        case 4u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 808;
          goto LABEL_293;
        case 5u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 696;
          goto LABEL_293;
        case 6u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 824;
          goto LABEL_293;
        case 7u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 832;
          goto LABEL_293;
        case 8u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 840;
          goto LABEL_293;
        case 9u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v22 = (unint64_t *)(a2 + *v3);
            unint64_t v23 = *v22;
            unint64_t v24 = *(void *)(a2 + *v4);
            if (*v22 >= v24) {
              break;
            }
            uint64_t v25 = *v5;
            if (*(unsigned char *)(a2 + v25)) {
              break;
            }
            if (v23 > 0xFFFFFFFFFFFFFFFBLL || v23 + 4 > v24) {
              *(unsigned char *)(a2 + v25) = 1;
            }
            else {
              unint64_t *v22 = v23 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xAu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v26 = (unint64_t *)(a2 + *v3);
            unint64_t v27 = *v26;
            unint64_t v28 = *(void *)(a2 + *v4);
            if (*v26 >= v28) {
              break;
            }
            uint64_t v29 = *v5;
            if (*(unsigned char *)(a2 + v29)) {
              break;
            }
            if (v27 > 0xFFFFFFFFFFFFFFFBLL || v27 + 4 > v28) {
              *(unsigned char *)(a2 + v29) = 1;
            }
            else {
              unint64_t *v26 = v27 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xBu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v30 = (unint64_t *)(a2 + *v3);
            unint64_t v31 = *v30;
            unint64_t v32 = *(void *)(a2 + *v4);
            if (*v30 >= v32) {
              break;
            }
            uint64_t v33 = *v5;
            if (*(unsigned char *)(a2 + v33)) {
              break;
            }
            if (v31 > 0xFFFFFFFFFFFFFFFBLL || v31 + 4 > v32) {
              *(unsigned char *)(a2 + v33) = 1;
            }
            else {
              unint64_t *v30 = v31 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xCu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v34 = (unint64_t *)(a2 + *v3);
            unint64_t v35 = *v34;
            unint64_t v36 = *(void *)(a2 + *v4);
            if (*v34 >= v36) {
              break;
            }
            uint64_t v37 = *v5;
            if (*(unsigned char *)(a2 + v37)) {
              break;
            }
            if (v35 > 0xFFFFFFFFFFFFFFFBLL || v35 + 4 > v36) {
              *(unsigned char *)(a2 + v37) = 1;
            }
            else {
              unint64_t *v34 = v35 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xDu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v38 = (unint64_t *)(a2 + *v3);
            unint64_t v39 = *v38;
            unint64_t v40 = *(void *)(a2 + *v4);
            if (*v38 >= v40) {
              break;
            }
            uint64_t v41 = *v5;
            if (*(unsigned char *)(a2 + v41)) {
              break;
            }
            if (v39 > 0xFFFFFFFFFFFFFFFBLL || v39 + 4 > v40) {
              *(unsigned char *)(a2 + v41) = 1;
            }
            else {
              unint64_t *v38 = v39 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xEu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v42 = (unint64_t *)(a2 + *v3);
            unint64_t v43 = *v42;
            unint64_t v44 = *(void *)(a2 + *v4);
            if (*v42 >= v44) {
              break;
            }
            uint64_t v45 = *v5;
            if (*(unsigned char *)(a2 + v45)) {
              break;
            }
            if (v43 > 0xFFFFFFFFFFFFFFFBLL || v43 + 4 > v44) {
              *(unsigned char *)(a2 + v45) = 1;
            }
            else {
              unint64_t *v42 = v43 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0xFu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v46 = (unint64_t *)(a2 + *v3);
            unint64_t v47 = *v46;
            unint64_t v48 = *(void *)(a2 + *v4);
            if (*v46 >= v48) {
              break;
            }
            uint64_t v49 = *v5;
            if (*(unsigned char *)(a2 + v49)) {
              break;
            }
            if (v47 > 0xFFFFFFFFFFFFFFFBLL || v47 + 4 > v48) {
              *(unsigned char *)(a2 + v49) = 1;
            }
            else {
              unint64_t *v46 = v47 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x10u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 680;
          goto LABEL_293;
        case 0x11u:
          v19 = objc_alloc_init(OTABMUResistance);
          objc_storeStrong((id *)(a1 + 760), v19);
          if (!PBReaderPlaceMark() || !OTABMUResistanceReadFrom((uint64_t)v19, a2)) {
            goto LABEL_355;
          }
          goto LABEL_295;
        case 0x12u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
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
              char v56 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
              *(void *)(a2 + v53) = v55;
              v52 |= (unint64_t)(v56 & 0x7F) << v50;
              if (v56 < 0)
              {
                v50 += 7;
                BOOL v14 = v51++ >= 9;
                if (v14)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_330;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v52) = 0;
          }
LABEL_330:
          uint64_t v158 = 768;
          goto LABEL_335;
        case 0x13u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v57 = (unint64_t *)(a2 + *v3);
            unint64_t v58 = *v57;
            unint64_t v59 = *(void *)(a2 + *v4);
            if (*v57 >= v59) {
              break;
            }
            uint64_t v60 = *v5;
            if (*(unsigned char *)(a2 + v60)) {
              break;
            }
            if (v58 > 0xFFFFFFFFFFFFFFFBLL || v58 + 4 > v59) {
              *(unsigned char *)(a2 + v60) = 1;
            }
            else {
              unint64_t *v57 = v58 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x14u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 704;
          goto LABEL_293;
        case 0x15u:
          *(unsigned char *)(a1 + 868) |= 8u;
          uint64_t v61 = *v3;
          unint64_t v62 = *(void *)(a2 + v61);
          if (v62 <= 0xFFFFFFFFFFFFFFFBLL && v62 + 4 <= *(void *)(a2 + *v4))
          {
            int v63 = *(_DWORD *)(*(void *)(a2 + *v7) + v62);
            *(void *)(a2 + v61) = v62 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v63 = 0;
          }
          uint64_t v161 = 780;
          goto LABEL_351;
        case 0x16u:
          *(unsigned char *)(a1 + 868) |= 0x10u;
          uint64_t v64 = *v3;
          unint64_t v65 = *(void *)(a2 + v64);
          if (v65 <= 0xFFFFFFFFFFFFFFFBLL && v65 + 4 <= *(void *)(a2 + *v4))
          {
            int v63 = *(_DWORD *)(*(void *)(a2 + *v7) + v65);
            *(void *)(a2 + v64) = v65 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v63 = 0;
          }
          uint64_t v161 = 784;
          goto LABEL_351;
        case 0x17u:
          *(unsigned char *)(a1 + 868) |= 1u;
          uint64_t v66 = *v3;
          unint64_t v67 = *(void *)(a2 + v66);
          if (v67 <= 0xFFFFFFFFFFFFFFFBLL && v67 + 4 <= *(void *)(a2 + *v4))
          {
            int v63 = *(_DWORD *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v67 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v63 = 0;
          }
          uint64_t v161 = 752;
          goto LABEL_351;
        case 0x18u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v68 = (unint64_t *)(a2 + *v3);
            unint64_t v69 = *v68;
            unint64_t v70 = *(void *)(a2 + *v4);
            if (*v68 >= v70) {
              break;
            }
            uint64_t v71 = *v5;
            if (*(unsigned char *)(a2 + v71)) {
              break;
            }
            if (v69 > 0xFFFFFFFFFFFFFFFBLL || v69 + 4 > v70) {
              *(unsigned char *)(a2 + v71) = 1;
            }
            else {
              unint64_t *v68 = v69 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x19u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v72 = (unint64_t *)(a2 + *v3);
            unint64_t v73 = *v72;
            unint64_t v74 = *(void *)(a2 + *v4);
            if (*v72 >= v74) {
              break;
            }
            uint64_t v75 = *v5;
            if (*(unsigned char *)(a2 + v75)) {
              break;
            }
            if (v73 > 0xFFFFFFFFFFFFFFFBLL || v73 + 4 > v74) {
              *(unsigned char *)(a2 + v75) = 1;
            }
            else {
              unint64_t *v72 = v73 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x1Au:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v76 = (unint64_t *)(a2 + *v3);
            unint64_t v77 = *v76;
            unint64_t v78 = *(void *)(a2 + *v4);
            if (*v76 >= v78) {
              break;
            }
            uint64_t v79 = *v5;
            if (*(unsigned char *)(a2 + v79)) {
              break;
            }
            if (v77 > 0xFFFFFFFFFFFFFFFBLL || v77 + 4 > v78) {
              *(unsigned char *)(a2 + v79) = 1;
            }
            else {
              unint64_t *v76 = v77 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x1Bu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v80 = (unint64_t *)(a2 + *v3);
            unint64_t v81 = *v80;
            unint64_t v82 = *(void *)(a2 + *v4);
            if (*v80 >= v82) {
              break;
            }
            uint64_t v83 = *v5;
            if (*(unsigned char *)(a2 + v83)) {
              break;
            }
            if (v81 > 0xFFFFFFFFFFFFFFFBLL || v81 + 4 > v82) {
              *(unsigned char *)(a2 + v83) = 1;
            }
            else {
              unint64_t *v80 = v81 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x1Cu:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 816;
          goto LABEL_293;
        case 0x1Du:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 848;
          goto LABEL_293;
        case 0x1Eu:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 712;
          goto LABEL_293;
        case 0x1Fu:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 720;
          goto LABEL_293;
        case 0x20u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 728;
          goto LABEL_293;
        case 0x21u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 736;
          goto LABEL_293;
        case 0x22u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 744;
          goto LABEL_293;
        case 0x23u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v84 = (unint64_t *)(a2 + *v3);
            unint64_t v85 = *v84;
            unint64_t v86 = *(void *)(a2 + *v4);
            if (*v84 >= v86) {
              break;
            }
            uint64_t v87 = *v5;
            if (*(unsigned char *)(a2 + v87)) {
              break;
            }
            if (v85 > 0xFFFFFFFFFFFFFFFBLL || v85 + 4 > v86) {
              *(unsigned char *)(a2 + v87) = 1;
            }
            else {
              unint64_t *v84 = v85 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x24u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v88 = (unint64_t *)(a2 + *v3);
            unint64_t v89 = *v88;
            unint64_t v90 = *(void *)(a2 + *v4);
            if (*v88 >= v90) {
              break;
            }
            uint64_t v91 = *v5;
            if (*(unsigned char *)(a2 + v91)) {
              break;
            }
            if (v89 > 0xFFFFFFFFFFFFFFFBLL || v89 + 4 > v90) {
              *(unsigned char *)(a2 + v91) = 1;
            }
            else {
              unint64_t *v88 = v89 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x25u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v92 = (unint64_t *)(a2 + *v3);
            unint64_t v93 = *v92;
            unint64_t v94 = *(void *)(a2 + *v4);
            if (*v92 >= v94) {
              break;
            }
            uint64_t v95 = *v5;
            if (*(unsigned char *)(a2 + v95)) {
              break;
            }
            if (v93 > 0xFFFFFFFFFFFFFFFBLL || v93 + 4 > v94) {
              *(unsigned char *)(a2 + v95) = 1;
            }
            else {
              unint64_t *v92 = v93 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x26u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v96 = (unint64_t *)(a2 + *v3);
            unint64_t v97 = *v96;
            unint64_t v98 = *(void *)(a2 + *v4);
            if (*v96 >= v98) {
              break;
            }
            uint64_t v99 = *v5;
            if (*(unsigned char *)(a2 + v99)) {
              break;
            }
            if (v97 > 0xFFFFFFFFFFFFFFFBLL || v97 + 4 > v98) {
              *(unsigned char *)(a2 + v99) = 1;
            }
            else {
              unint64_t *v96 = v97 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x27u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v100 = (unint64_t *)(a2 + *v3);
            unint64_t v101 = *v100;
            unint64_t v102 = *(void *)(a2 + *v4);
            if (*v100 >= v102) {
              break;
            }
            uint64_t v103 = *v5;
            if (*(unsigned char *)(a2 + v103)) {
              break;
            }
            if (v101 > 0xFFFFFFFFFFFFFFFBLL || v101 + 4 > v102) {
              *(unsigned char *)(a2 + v103) = 1;
            }
            else {
              unint64_t *v100 = v101 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x28u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v104 = (unint64_t *)(a2 + *v3);
            unint64_t v105 = *v104;
            unint64_t v106 = *(void *)(a2 + *v4);
            if (*v104 >= v106) {
              break;
            }
            uint64_t v107 = *v5;
            if (*(unsigned char *)(a2 + v107)) {
              break;
            }
            if (v105 > 0xFFFFFFFFFFFFFFFBLL || v105 + 4 > v106) {
              *(unsigned char *)(a2 + v107) = 1;
            }
            else {
              unint64_t *v104 = v105 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x29u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v108 = (unint64_t *)(a2 + *v3);
            unint64_t v109 = *v108;
            unint64_t v110 = *(void *)(a2 + *v4);
            if (*v108 >= v110) {
              break;
            }
            uint64_t v111 = *v5;
            if (*(unsigned char *)(a2 + v111)) {
              break;
            }
            if (v109 > 0xFFFFFFFFFFFFFFFBLL || v109 + 4 > v110) {
              *(unsigned char *)(a2 + v111) = 1;
            }
            else {
              unint64_t *v108 = v109 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x2Au:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v112 = (unint64_t *)(a2 + *v3);
            unint64_t v113 = *v112;
            unint64_t v114 = *(void *)(a2 + *v4);
            if (*v112 >= v114) {
              break;
            }
            uint64_t v115 = *v5;
            if (*(unsigned char *)(a2 + v115)) {
              break;
            }
            if (v113 > 0xFFFFFFFFFFFFFFFBLL || v113 + 4 > v114) {
              *(unsigned char *)(a2 + v115) = 1;
            }
            else {
              unint64_t *v112 = v113 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x2Bu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v116 = (unint64_t *)(a2 + *v3);
            unint64_t v117 = *v116;
            unint64_t v118 = *(void *)(a2 + *v4);
            if (*v116 >= v118) {
              break;
            }
            uint64_t v119 = *v5;
            if (*(unsigned char *)(a2 + v119)) {
              break;
            }
            if (v117 > 0xFFFFFFFFFFFFFFFBLL || v117 + 4 > v118) {
              *(unsigned char *)(a2 + v119) = 1;
            }
            else {
              unint64_t *v116 = v117 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x2Cu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v120 = (unint64_t *)(a2 + *v3);
            unint64_t v121 = *v120;
            unint64_t v122 = *(void *)(a2 + *v4);
            if (*v120 >= v122) {
              break;
            }
            uint64_t v123 = *v5;
            if (*(unsigned char *)(a2 + v123)) {
              break;
            }
            if (v121 > 0xFFFFFFFFFFFFFFFBLL || v121 + 4 > v122) {
              *(unsigned char *)(a2 + v123) = 1;
            }
            else {
              unint64_t *v120 = v121 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x2Du:
          char v124 = 0;
          unsigned int v125 = 0;
          uint64_t v52 = 0;
          *(unsigned char *)(a1 + 868) |= 2u;
          while (2)
          {
            uint64_t v126 = *v3;
            uint64_t v127 = *(void *)(a2 + v126);
            unint64_t v128 = v127 + 1;
            if (v127 == -1 || v128 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v129 = *(unsigned char *)(*(void *)(a2 + *v7) + v127);
              *(void *)(a2 + v126) = v128;
              v52 |= (unint64_t)(v129 & 0x7F) << v124;
              if (v129 < 0)
              {
                v124 += 7;
                BOOL v14 = v125++ >= 9;
                if (v14)
                {
                  LODWORD(v52) = 0;
                  goto LABEL_334;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v52) = 0;
          }
LABEL_334:
          uint64_t v158 = 772;
LABEL_335:
          *(_DWORD *)(a1 + v158) = v52;
          goto LABEL_352;
        case 0x2Eu:
          *(unsigned char *)(a1 + 868) |= 0x20u;
          uint64_t v130 = *v3;
          unint64_t v131 = *(void *)(a2 + v130);
          if (v131 <= 0xFFFFFFFFFFFFFFFBLL && v131 + 4 <= *(void *)(a2 + *v4))
          {
            int v63 = *(_DWORD *)(*(void *)(a2 + *v7) + v131);
            *(void *)(a2 + v130) = v131 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v63 = 0;
          }
          uint64_t v161 = 864;
          goto LABEL_351;
        case 0x2Fu:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v132 = (unint64_t *)(a2 + *v3);
            unint64_t v133 = *v132;
            unint64_t v134 = *(void *)(a2 + *v4);
            if (*v132 >= v134) {
              break;
            }
            uint64_t v135 = *v5;
            if (*(unsigned char *)(a2 + v135)) {
              break;
            }
            if (v133 > 0xFFFFFFFFFFFFFFFBLL || v133 + 4 > v134) {
              *(unsigned char *)(a2 + v135) = 1;
            }
            else {
              unint64_t *v132 = v133 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x30u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v136 = (unint64_t *)(a2 + *v3);
            unint64_t v137 = *v136;
            unint64_t v138 = *(void *)(a2 + *v4);
            if (*v136 >= v138) {
              break;
            }
            uint64_t v139 = *v5;
            if (*(unsigned char *)(a2 + v139)) {
              break;
            }
            if (v137 > 0xFFFFFFFFFFFFFFFBLL || v137 + 4 > v138) {
              *(unsigned char *)(a2 + v139) = 1;
            }
            else {
              unint64_t *v136 = v137 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x31u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v140 = (unint64_t *)(a2 + *v3);
            unint64_t v141 = *v140;
            unint64_t v142 = *(void *)(a2 + *v4);
            if (*v140 >= v142) {
              break;
            }
            uint64_t v143 = *v5;
            if (*(unsigned char *)(a2 + v143)) {
              break;
            }
            if (v141 > 0xFFFFFFFFFFFFFFFBLL || v141 + 4 > v142) {
              *(unsigned char *)(a2 + v143) = 1;
            }
            else {
              unint64_t *v140 = v141 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x32u:
          v19 = objc_alloc_init(OTAResistanceData);
          uint64_t v20 = 856;
LABEL_293:
          objc_storeStrong((id *)(a1 + v20), v19);
          if (!PBReaderPlaceMark() || (OTAResistanceDataReadFrom((uint64_t)v19, a2) & 1) == 0)
          {
LABEL_355:

            return 0;
          }
LABEL_295:
          PBReaderRecallMark();

LABEL_352:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
        case 0x33u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v144 = (unint64_t *)(a2 + *v3);
            unint64_t v145 = *v144;
            unint64_t v146 = *(void *)(a2 + *v4);
            if (*v144 >= v146) {
              break;
            }
            uint64_t v147 = *v5;
            if (*(unsigned char *)(a2 + v147)) {
              break;
            }
            if (v145 > 0xFFFFFFFFFFFFFFFBLL || v145 + 4 > v146) {
              *(unsigned char *)(a2 + v147) = 1;
            }
            else {
              unint64_t *v144 = v145 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x34u:
          if (v17 != 2) {
            goto LABEL_336;
          }
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            v148 = (unint64_t *)(a2 + *v3);
            unint64_t v149 = *v148;
            unint64_t v150 = *(void *)(a2 + *v4);
            if (*v148 >= v150) {
              break;
            }
            uint64_t v151 = *v5;
            if (*(unsigned char *)(a2 + v151)) {
              break;
            }
            if (v149 > 0xFFFFFFFFFFFFFFFBLL || v149 + 4 > v150) {
              *(unsigned char *)(a2 + v151) = 1;
            }
            else {
              unint64_t *v148 = v149 + 4;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_323;
        case 0x35u:
          if (v17 == 2)
          {
            uint64_t result = PBReaderPlaceMark();
            if (!result) {
              return result;
            }
            uint64_t v152 = *v3;
            unint64_t v153 = *(void *)(a2 + v152);
            for (unint64_t i = *(void *)(a2 + *v4); v153 < i; unint64_t i = *(void *)(a2 + *v4))
            {
              uint64_t v155 = *v5;
              if (*(unsigned char *)(a2 + v155)) {
                break;
              }
              if (v153 <= 0xFFFFFFFFFFFFFFFBLL && v153 + 4 <= i) {
                *(void *)(a2 + (int)v152) = v153 + 4;
              }
              else {
                *(unsigned char *)(a2 + v155) = 1;
              }
              PBRepeatedFloatAdd();
              uint64_t v152 = *v3;
              unint64_t v153 = *(void *)(a2 + v152);
            }
LABEL_323:
            PBReaderRecallMark();
          }
          else
          {
LABEL_336:
            uint64_t v159 = *v3;
            unint64_t v160 = *(void *)(a2 + v159);
            if (v160 <= 0xFFFFFFFFFFFFFFFBLL && v160 + 4 <= *(void *)(a2 + *v4)) {
              *(void *)(a2 + v159) = v160 + 4;
            }
            else {
              *(unsigned char *)(a2 + v15) = 1;
            }
            PBRepeatedFloatAdd();
          }
          goto LABEL_352;
        case 0x36u:
          *(unsigned char *)(a1 + 868) |= 4u;
          uint64_t v156 = *v3;
          unint64_t v157 = *(void *)(a2 + v156);
          if (v157 <= 0xFFFFFFFFFFFFFFFBLL && v157 + 4 <= *(void *)(a2 + *v4))
          {
            int v63 = *(_DWORD *)(*(void *)(a2 + *v7) + v157);
            *(void *)(a2 + v156) = v157 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v63 = 0;
          }
          uint64_t v161 = 776;
LABEL_351:
          *(_DWORD *)(a1 + v161) = v63;
          goto LABEL_352;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_352;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL OTABMUResistanceReadFrom(uint64_t a1, uint64_t a2)
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
          *(_WORD *)(a1 + 44) |= 0x80u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__traceResistance25C;
          goto LABEL_66;
        case 2u:
          *(_WORD *)(a1 + 44) |= 0x100u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__traceResistanceTemperatureCoeff;
          goto LABEL_66;
        case 3u:
          *(_WORD *)(a1 + 44) |= 0x40u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__systemEquivalentResistance;
          goto LABEL_66;
        case 4u:
          *(_WORD *)(a1 + 44) |= 1u;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__downstreamCommonResistance;
          goto LABEL_66;
        case 5u:
          *(_WORD *)(a1 + 44) |= 2u;
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__downstreamNorthResistance;
          goto LABEL_66;
        case 6u:
          *(_WORD *)(a1 + 44) |= 8u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFFBLL && v30 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__resistanceGGToVcut;
          goto LABEL_66;
        case 7u:
          *(_WORD *)(a1 + 44) |= 0x10u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFFBLL && v32 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__resistancePMUToVcut;
          goto LABEL_66;
        case 8u:
          *(_WORD *)(a1 + 44) |= 0x20u;
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__resistanceVcutToPmax;
          goto LABEL_66;
        case 9u:
          *(_WORD *)(a1 + 44) |= 4u;
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(void *)(a2 + *v4))
          {
            int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v20 = 0;
          }
          uint64_t v37 = &OBJC_IVAR___OTABMUResistance__resistanceCellTabToGG;
LABEL_66:
          *(_DWORD *)(a1 + *v37) = v20;
          goto LABEL_67;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_67:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x270F58558]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
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

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x270F58648]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x270F58650]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x270F58658]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x270F58660]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x270F58668]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x270F58670]();
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
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

void objc_storeStrong(id *location, id obj)
{
}