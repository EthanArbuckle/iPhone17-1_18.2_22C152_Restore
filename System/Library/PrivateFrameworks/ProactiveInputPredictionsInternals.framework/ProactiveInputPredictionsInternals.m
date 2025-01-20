void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23EAAEFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v22 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_23EAAF398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v20 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t PSGPBTypingSpeedReadFrom(uint64_t a1, uint64_t a2)
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
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 56;
          goto LABEL_28;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 64;
          goto LABEL_28;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 72;
          goto LABEL_28;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_28;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_28;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 48;
          goto LABEL_28;
        case 7u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
LABEL_28:
          uint64_t v20 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 8u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 80) |= 1u;
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
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_53:
          uint64_t v37 = 16;
          goto LABEL_62;
        case 9u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 80) |= 2u;
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
                  LODWORD(v23) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_57:
          uint64_t v37 = 20;
          goto LABEL_62;
        case 0xAu:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 80) |= 4u;
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
        uint64_t v34 = *v3;
        unint64_t v35 = *(void *)(a2 + v34);
        if (v35 == -1 || v35 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
        *(void *)(a2 + v34) = v35 + 1;
        v23 |= (unint64_t)(v36 & 0x7F) << v32;
        if ((v36 & 0x80) == 0) {
          goto LABEL_59;
        }
        v32 += 7;
        BOOL v14 = v33++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_61;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_59:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_61:
      uint64_t v37 = 24;
LABEL_62:
      *(_DWORD *)(a1 + v37) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PSGPBImpressionReadFrom(uint64_t a1, uint64_t a2)
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
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_89;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 88;
          goto LABEL_89;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 96;
          goto LABEL_89;
        case 6u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 148) |= 0x200u;
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
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_121:
          BOOL v87 = v22 != 0;
          uint64_t v88 = 142;
          goto LABEL_162;
        case 7u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(_WORD *)(a1 + 148) |= 0x800u;
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
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_125:
          BOOL v87 = v28 != 0;
          uint64_t v88 = 144;
          goto LABEL_162;
        case 8u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(_WORD *)(a1 + 148) |= 0x400u;
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
                  uint64_t v34 = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_129:
          BOOL v87 = v34 != 0;
          uint64_t v88 = 143;
          goto LABEL_162;
        case 9u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 72;
          goto LABEL_89;
        case 0xAu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_89;
        case 0xBu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_89;
        case 0xCu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 8u;
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
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_133:
          uint64_t v89 = 56;
          goto LABEL_167;
        case 0xDu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 4u;
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
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v40 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_137:
          uint64_t v89 = 52;
          goto LABEL_167;
        case 0xEu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_89;
        case 0xFu:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x20u;
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
              v40 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                BOOL v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_141;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_141:
          uint64_t v89 = 64;
          goto LABEL_167;
        case 0x10u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 80;
          goto LABEL_89;
        case 0x11u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x10u;
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
              v40 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                BOOL v14 = v55++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_145;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_145:
          uint64_t v89 = 60;
          goto LABEL_167;
        case 0x12u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x40u;
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
              v40 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                BOOL v14 = v60++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_149;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_149:
          uint64_t v89 = 136;
          goto LABEL_167;
        case 0x13u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 128;
          goto LABEL_89;
        case 0x14u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 120;
          goto LABEL_89;
        case 0x15u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 112;
          goto LABEL_89;
        case 0x16u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 104;
LABEL_89:
          v64 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 0x17u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          *(_WORD *)(a1 + 148) |= 0x80u;
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
                  goto LABEL_153;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v67 = 0;
          }
LABEL_153:
          BOOL v87 = v67 != 0;
          uint64_t v88 = 140;
          goto LABEL_162;
        case 0x18u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 2u;
          while (2)
          {
            uint64_t v73 = *v3;
            unint64_t v74 = *(void *)(a2 + v73);
            if (v74 == -1 || v74 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v74);
              *(void *)(a2 + v73) = v74 + 1;
              v40 |= (unint64_t)(v75 & 0x7F) << v71;
              if (v75 < 0)
              {
                v71 += 7;
                BOOL v14 = v72++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_157;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_157:
          uint64_t v89 = 48;
          goto LABEL_167;
        case 0x19u:
          char v76 = 0;
          unsigned int v77 = 0;
          uint64_t v78 = 0;
          *(_WORD *)(a1 + 148) |= 0x100u;
          while (2)
          {
            uint64_t v79 = *v3;
            unint64_t v80 = *(void *)(a2 + v79);
            if (v80 == -1 || v80 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v81 = *(unsigned char *)(*(void *)(a2 + *v7) + v80);
              *(void *)(a2 + v79) = v80 + 1;
              v78 |= (unint64_t)(v81 & 0x7F) << v76;
              if (v81 < 0)
              {
                v76 += 7;
                BOOL v14 = v77++ >= 9;
                if (v14)
                {
                  uint64_t v78 = 0;
                  goto LABEL_161;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v78 = 0;
          }
LABEL_161:
          BOOL v87 = v78 != 0;
          uint64_t v88 = 141;
LABEL_162:
          *(unsigned char *)(a1 + v88) = v87;
          continue;
        case 0x1Au:
          char v82 = 0;
          unsigned int v83 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 1u;
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
        uint64_t v84 = *v3;
        unint64_t v85 = *(void *)(a2 + v84);
        if (v85 == -1 || v85 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v86 = *(unsigned char *)(*(void *)(a2 + *v7) + v85);
        *(void *)(a2 + v84) = v85 + 1;
        v40 |= (unint64_t)(v86 & 0x7F) << v82;
        if ((v86 & 0x80) == 0) {
          goto LABEL_164;
        }
        v82 += 7;
        BOOL v14 = v83++ >= 9;
        if (v14)
        {
          LODWORD(v40) = 0;
          goto LABEL_166;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_164:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v40) = 0;
      }
LABEL_166:
      uint64_t v89 = 16;
LABEL_167:
      *(_DWORD *)(a1 + v89) = v40;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_23EABBF7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23EABCDDC(_Unwind_Exception *a1)
{
}

uint64_t PSGPBPredictionReadFrom(uint64_t a1, uint64_t a2)
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
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_89;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 88;
          goto LABEL_89;
        case 6u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 96;
          goto LABEL_89;
        case 7u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(_WORD *)(a1 + 148) |= 0x200u;
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
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_135:
          BOOL v99 = v22 != 0;
          uint64_t v100 = 142;
          goto LABEL_184;
        case 8u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(_WORD *)(a1 + 148) |= 0x800u;
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
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_139:
          BOOL v99 = v28 != 0;
          uint64_t v100 = 144;
          goto LABEL_184;
        case 9u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(_WORD *)(a1 + 148) |= 0x400u;
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
                  uint64_t v34 = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_143:
          BOOL v99 = v34 != 0;
          uint64_t v100 = 143;
          goto LABEL_184;
        case 0xAu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 72;
          goto LABEL_89;
        case 0xBu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_89;
        case 0xCu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_89;
        case 0xDu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 8u;
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
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_147;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_147:
          uint64_t v101 = 56;
          goto LABEL_189;
        case 0xEu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 4u;
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
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v40 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_151;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_151:
          uint64_t v101 = 52;
          goto LABEL_189;
        case 0xFu:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_89;
        case 0x10u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x20u;
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
              v40 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                BOOL v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_155;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_155:
          uint64_t v101 = 64;
          goto LABEL_189;
        case 0x11u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 80;
          goto LABEL_89;
        case 0x12u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x10u;
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
              v40 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                BOOL v14 = v55++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_159;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_159:
          uint64_t v101 = 60;
          goto LABEL_189;
        case 0x13u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x40u;
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
              v40 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                BOOL v14 = v60++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_163;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_163:
          uint64_t v101 = 136;
          goto LABEL_189;
        case 0x14u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 128;
          goto LABEL_89;
        case 0x15u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 120;
          goto LABEL_89;
        case 0x16u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 112;
          goto LABEL_89;
        case 0x17u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 104;
LABEL_89:
          v64 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        case 0x18u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          *(_WORD *)(a1 + 148) |= 0x1000u;
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
                  goto LABEL_167;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v67 = 0;
          }
LABEL_167:
          BOOL v99 = v67 != 0;
          uint64_t v100 = 145;
          goto LABEL_184;
        case 0x19u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v73 = 0;
          *(_WORD *)(a1 + 148) |= 0x2000u;
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
              v73 |= (unint64_t)(v76 & 0x7F) << v71;
              if (v76 < 0)
              {
                v71 += 7;
                BOOL v14 = v72++ >= 9;
                if (v14)
                {
                  uint64_t v73 = 0;
                  goto LABEL_171;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v73 = 0;
          }
LABEL_171:
          BOOL v99 = v73 != 0;
          uint64_t v100 = 146;
          goto LABEL_184;
        case 0x1Au:
          char v77 = 0;
          unsigned int v78 = 0;
          uint64_t v79 = 0;
          *(_WORD *)(a1 + 148) |= 0x80u;
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
              v79 |= (unint64_t)(v82 & 0x7F) << v77;
              if (v82 < 0)
              {
                v77 += 7;
                BOOL v14 = v78++ >= 9;
                if (v14)
                {
                  uint64_t v79 = 0;
                  goto LABEL_175;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v79 = 0;
          }
LABEL_175:
          BOOL v99 = v79 != 0;
          uint64_t v100 = 140;
          goto LABEL_184;
        case 0x1Bu:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 2u;
          while (2)
          {
            uint64_t v85 = *v3;
            unint64_t v86 = *(void *)(a2 + v85);
            if (v86 == -1 || v86 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v87 = *(unsigned char *)(*(void *)(a2 + *v7) + v86);
              *(void *)(a2 + v85) = v86 + 1;
              v40 |= (unint64_t)(v87 & 0x7F) << v83;
              if (v87 < 0)
              {
                v83 += 7;
                BOOL v14 = v84++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_179;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_179:
          uint64_t v101 = 48;
          goto LABEL_189;
        case 0x1Cu:
          char v88 = 0;
          unsigned int v89 = 0;
          uint64_t v90 = 0;
          *(_WORD *)(a1 + 148) |= 0x100u;
          while (2)
          {
            uint64_t v91 = *v3;
            unint64_t v92 = *(void *)(a2 + v91);
            if (v92 == -1 || v92 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v93 = *(unsigned char *)(*(void *)(a2 + *v7) + v92);
              *(void *)(a2 + v91) = v92 + 1;
              v90 |= (unint64_t)(v93 & 0x7F) << v88;
              if (v93 < 0)
              {
                v88 += 7;
                BOOL v14 = v89++ >= 9;
                if (v14)
                {
                  uint64_t v90 = 0;
                  goto LABEL_183;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v90 = 0;
          }
LABEL_183:
          BOOL v99 = v90 != 0;
          uint64_t v100 = 141;
LABEL_184:
          *(unsigned char *)(a1 + v100) = v99;
          continue;
        case 0x1Du:
          char v94 = 0;
          unsigned int v95 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 1u;
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
        uint64_t v96 = *v3;
        unint64_t v97 = *(void *)(a2 + v96);
        if (v97 == -1 || v97 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v98 = *(unsigned char *)(*(void *)(a2 + *v7) + v97);
        *(void *)(a2 + v96) = v97 + 1;
        v40 |= (unint64_t)(v98 & 0x7F) << v94;
        if ((v98 & 0x80) == 0) {
          goto LABEL_186;
        }
        v94 += 7;
        BOOL v14 = v95++ >= 9;
        if (v14)
        {
          LODWORD(v40) = 0;
          goto LABEL_188;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_186:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v40) = 0;
      }
LABEL_188:
      uint64_t v101 = 16;
LABEL_189:
      *(_DWORD *)(a1 + v101) = v40;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_23EAC1BA4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_23EAC1CDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23EAC1DC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PSGPBErrorReadFrom(uint64_t a1, uint64_t a2)
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
        case 2u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 132) |= 1u;
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
              goto LABEL_104;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_106;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_104:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_106:
          uint64_t v77 = 16;
          goto LABEL_144;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
          goto LABEL_102;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_102;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
          goto LABEL_102;
        case 6u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(_WORD *)(a1 + 132) |= 0x80u;
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
                  goto LABEL_110;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_110:
          BOOL v78 = v28 != 0;
          uint64_t v79 = 126;
          goto LABEL_139;
        case 7u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(_WORD *)(a1 + 132) |= 0x200u;
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
                  uint64_t v34 = 0;
                  goto LABEL_114;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_114:
          BOOL v78 = v34 != 0;
          uint64_t v79 = 128;
          goto LABEL_139;
        case 8u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 132) |= 0x100u;
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
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_118;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_118:
          BOOL v78 = v40 != 0;
          uint64_t v79 = 127;
          goto LABEL_139;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 64;
          goto LABEL_102;
        case 0xAu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 40;
          goto LABEL_102;
        case 0xBu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 8;
          goto LABEL_102;
        case 0xCu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 132) |= 8u;
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
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v19 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
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
          uint64_t v77 = 56;
          goto LABEL_144;
        case 0xDu:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 132) |= 4u;
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
              v19 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                BOOL v14 = v50++ >= 9;
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
          uint64_t v77 = 52;
          goto LABEL_144;
        case 0xEu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32;
          goto LABEL_102;
        case 0xFu:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v56 = 0;
          *(_WORD *)(a1 + 132) |= 0x20u;
          while (2)
          {
            uint64_t v57 = *v3;
            unint64_t v58 = *(void *)(a2 + v57);
            if (v58 == -1 || v58 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
              *(void *)(a2 + v57) = v58 + 1;
              v56 |= (unint64_t)(v59 & 0x7F) << v54;
              if (v59 < 0)
              {
                v54 += 7;
                BOOL v14 = v55++ >= 9;
                if (v14)
                {
                  uint64_t v56 = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v56 = 0;
          }
LABEL_130:
          BOOL v78 = v56 != 0;
          uint64_t v79 = 124;
          goto LABEL_139;
        case 0x10u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 132) |= 2u;
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
              v19 |= (unint64_t)(v64 & 0x7F) << v60;
              if (v64 < 0)
              {
                v60 += 7;
                BOOL v14 = v61++ >= 9;
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
          uint64_t v77 = 48;
          goto LABEL_144;
        case 0x11u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          *(_WORD *)(a1 + 132) |= 0x40u;
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
          BOOL v78 = v67 != 0;
          uint64_t v79 = 125;
LABEL_139:
          *(unsigned char *)(a1 + v79) = v78;
          continue;
        case 0x12u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 132) |= 0x10u;
          break;
        case 0x13u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 112;
          goto LABEL_102;
        case 0x14u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 104;
          goto LABEL_102;
        case 0x15u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 96;
          goto LABEL_102;
        case 0x16u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 88;
LABEL_102:
          char v76 = *(void **)(a1 + v25);
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
        uint64_t v73 = *v3;
        unint64_t v74 = *(void *)(a2 + v73);
        if (v74 == -1 || v74 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v74);
        *(void *)(a2 + v73) = v74 + 1;
        v19 |= (unint64_t)(v75 & 0x7F) << v71;
        if ((v75 & 0x80) == 0) {
          goto LABEL_141;
        }
        v71 += 7;
        BOOL v14 = v72++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_143;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_141:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_143:
      uint64_t v77 = 120;
LABEL_144:
      *(_DWORD *)(a1 + v77) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PSGPBEngagementReadFrom(uint64_t a1, uint64_t a2)
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
        case 2u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x40u;
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
              goto LABEL_126;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_128;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_126:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_128:
          uint64_t v92 = 68;
          goto LABEL_178;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 24;
          goto LABEL_96;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 88;
          goto LABEL_96;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 96;
          goto LABEL_96;
        case 6u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(_WORD *)(a1 + 148) |= 0x400u;
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
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_132:
          BOOL v93 = v28 != 0;
          uint64_t v94 = 142;
          goto LABEL_173;
        case 7u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(_WORD *)(a1 + 148) |= 0x1000u;
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
                  uint64_t v34 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_136:
          BOOL v93 = v34 != 0;
          uint64_t v94 = 144;
          goto LABEL_173;
        case 8u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 148) |= 0x800u;
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
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_140:
          BOOL v93 = v40 != 0;
          uint64_t v94 = 143;
          goto LABEL_173;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_96;
        case 0xAu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 40;
          goto LABEL_96;
        case 0xBu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 8;
          goto LABEL_96;
        case 0xCu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 8u;
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
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v19 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_144:
          uint64_t v92 = 56;
          goto LABEL_178;
        case 0xDu:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 4u;
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
              v19 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                BOOL v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_148:
          uint64_t v92 = 52;
          goto LABEL_178;
        case 0xEu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 32;
          goto LABEL_96;
        case 0xFu:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x20u;
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
              v19 |= (unint64_t)(v58 & 0x7F) << v54;
              if (v58 < 0)
              {
                v54 += 7;
                BOOL v14 = v55++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_152:
          uint64_t v92 = 64;
          goto LABEL_178;
        case 0x10u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
          goto LABEL_96;
        case 0x11u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x10u;
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
              v19 |= (unint64_t)(v63 & 0x7F) << v59;
              if (v63 < 0)
              {
                v59 += 7;
                BOOL v14 = v60++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_156:
          uint64_t v92 = 60;
          goto LABEL_178;
        case 0x12u:
          char v64 = 0;
          unsigned int v65 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 0x80u;
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
              v19 |= (unint64_t)(v68 & 0x7F) << v64;
              if (v68 < 0)
              {
                v64 += 7;
                BOOL v14 = v65++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_160:
          uint64_t v92 = 136;
          goto LABEL_178;
        case 0x13u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 128;
          goto LABEL_96;
        case 0x14u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 120;
          goto LABEL_96;
        case 0x15u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 112;
          goto LABEL_96;
        case 0x16u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 104;
LABEL_96:
          unint64_t v69 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        case 0x17u:
          char v70 = 0;
          unsigned int v71 = 0;
          uint64_t v72 = 0;
          *(_WORD *)(a1 + 148) |= 0x100u;
          while (2)
          {
            uint64_t v73 = *v3;
            unint64_t v74 = *(void *)(a2 + v73);
            if (v74 == -1 || v74 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v74);
              *(void *)(a2 + v73) = v74 + 1;
              v72 |= (unint64_t)(v75 & 0x7F) << v70;
              if (v75 < 0)
              {
                v70 += 7;
                BOOL v14 = v71++ >= 9;
                if (v14)
                {
                  uint64_t v72 = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v72 = 0;
          }
LABEL_164:
          BOOL v93 = v72 != 0;
          uint64_t v94 = 140;
          goto LABEL_173;
        case 0x18u:
          char v76 = 0;
          unsigned int v77 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 2u;
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
              v19 |= (unint64_t)(v80 & 0x7F) << v76;
              if (v80 < 0)
              {
                v76 += 7;
                BOOL v14 = v77++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_168:
          uint64_t v92 = 48;
          goto LABEL_178;
        case 0x19u:
          char v81 = 0;
          unsigned int v82 = 0;
          uint64_t v83 = 0;
          *(_WORD *)(a1 + 148) |= 0x200u;
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
                  goto LABEL_172;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v83 = 0;
          }
LABEL_172:
          BOOL v93 = v83 != 0;
          uint64_t v94 = 141;
LABEL_173:
          *(unsigned char *)(a1 + v94) = v93;
          continue;
        case 0x1Au:
          char v87 = 0;
          unsigned int v88 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 148) |= 1u;
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
        uint64_t v89 = *v3;
        unint64_t v90 = *(void *)(a2 + v89);
        if (v90 == -1 || v90 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v91 = *(unsigned char *)(*(void *)(a2 + *v7) + v90);
        *(void *)(a2 + v89) = v90 + 1;
        v19 |= (unint64_t)(v91 & 0x7F) << v87;
        if ((v91 & 0x80) == 0) {
          goto LABEL_175;
        }
        v87 += 7;
        BOOL v14 = v88++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_177;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_175:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_177:
      uint64_t v92 = 16;
LABEL_178:
      *(_DWORD *)(a1 + v92) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PSGPBQueryReadFrom(uint64_t a1, uint64_t a2)
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
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 88) |= 0x20u;
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
              goto LABEL_86;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_88;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_86:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_88:
          BOOL v67 = v19 != 0;
          uint64_t v68 = 82;
          goto LABEL_118;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 88) |= 0x80u;
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
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v26 = 0;
          }
LABEL_92:
          BOOL v67 = v26 != 0;
          uint64_t v68 = 84;
          goto LABEL_118;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          *(unsigned char *)(a1 + 88) |= 0x40u;
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
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                BOOL v14 = v31++ >= 9;
                if (v14)
                {
                  uint64_t v32 = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v32 = 0;
          }
LABEL_96:
          BOOL v67 = v32 != 0;
          uint64_t v68 = 83;
          goto LABEL_118;
        case 4u:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 56;
          goto LABEL_63;
        case 5u:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 32;
          goto LABEL_63;
        case 6u:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 8;
          goto LABEL_63;
        case 7u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 88) |= 4u;
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
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_100:
          uint64_t v69 = 48;
          goto LABEL_113;
        case 8u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 88) |= 2u;
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
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v40 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_104:
          uint64_t v69 = 44;
          goto LABEL_113;
        case 9u:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 24;
          goto LABEL_63;
        case 0xAu:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 16;
          goto LABEL_63;
        case 0xBu:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 64;
          goto LABEL_63;
        case 0xCu:
          uint64_t v36 = PBReaderReadString();
          uint64_t v37 = 72;
LABEL_63:
          char v49 = *(void **)(a1 + v37);
          *(void *)(a1 + v37) = v36;

          continue;
        case 0xDu:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(unsigned char *)(a1 + 88) |= 8u;
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
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                BOOL v14 = v51++ >= 9;
                if (v14)
                {
                  uint64_t v52 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v52 = 0;
          }
LABEL_108:
          BOOL v67 = v52 != 0;
          uint64_t v68 = 80;
          goto LABEL_118;
        case 0xEu:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v40 = 0;
          *(unsigned char *)(a1 + 88) |= 1u;
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
              v40 |= (unint64_t)(v60 & 0x7F) << v56;
              if (v60 < 0)
              {
                v56 += 7;
                BOOL v14 = v57++ >= 9;
                if (v14)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v40) = 0;
          }
LABEL_112:
          uint64_t v69 = 40;
LABEL_113:
          *(_DWORD *)(a1 + v69) = v40;
          continue;
        case 0xFu:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          *(unsigned char *)(a1 + 88) |= 0x10u;
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
        uint64_t v64 = *v3;
        unint64_t v65 = *(void *)(a2 + v64);
        if (v65 == -1 || v65 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v65);
        *(void *)(a2 + v64) = v65 + 1;
        v63 |= (unint64_t)(v66 & 0x7F) << v61;
        if ((v66 & 0x80) == 0) {
          goto LABEL_115;
        }
        v61 += 7;
        BOOL v14 = v62++ >= 9;
        if (v14)
        {
          uint64_t v63 = 0;
          goto LABEL_117;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_115:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v63 = 0;
      }
LABEL_117:
      BOOL v67 = v63 != 0;
      uint64_t v68 = 81;
LABEL_118:
      *(unsigned char *)(a1 + v68) = v67;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PSGPBTriggerReadFrom(uint64_t a1, uint64_t a2)
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
        case 2u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 124) |= 8u;
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
              goto LABEL_97;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_99;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_97:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_99:
          uint64_t v72 = 112;
          goto LABEL_128;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 104;
          goto LABEL_74;
        case 5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 16;
          goto LABEL_74;
        case 6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 64;
          goto LABEL_74;
        case 7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 72;
          goto LABEL_74;
        case 8u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(_WORD *)(a1 + 124) |= 0x40u;
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
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_103:
          BOOL v73 = v28 != 0;
          uint64_t v74 = 118;
          goto LABEL_133;
        case 9u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(_WORD *)(a1 + 124) |= 0x100u;
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
                  uint64_t v34 = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_107:
          BOOL v73 = v34 != 0;
          uint64_t v74 = 120;
          goto LABEL_133;
        case 0xAu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(_WORD *)(a1 + 124) |= 0x80u;
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
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  uint64_t v40 = 0;
                  goto LABEL_111;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_111:
          BOOL v73 = v40 != 0;
          uint64_t v74 = 119;
          goto LABEL_133;
        case 0xBu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_74;
        case 0xCu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 32;
          goto LABEL_74;
        case 0xDu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 8;
          goto LABEL_74;
        case 0xEu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 124) |= 4u;
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
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
              *(void *)(a2 + v46) = v47 + 1;
              v19 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
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
          uint64_t v72 = 48;
          goto LABEL_128;
        case 0xFu:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 124) |= 2u;
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
              v19 |= (unint64_t)(v53 & 0x7F) << v49;
              if (v53 < 0)
              {
                v49 += 7;
                BOOL v14 = v50++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_119:
          uint64_t v72 = 44;
          goto LABEL_128;
        case 0x10u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 24;
          goto LABEL_74;
        case 0x11u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 96;
          goto LABEL_74;
        case 0x12u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 88;
          goto LABEL_74;
        case 0x13u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
LABEL_74:
          unint64_t v54 = *(void **)(a1 + v24);
          *(void *)(a1 + v24) = v23;

          continue;
        case 0x14u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v57 = 0;
          *(_WORD *)(a1 + 124) |= 0x10u;
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
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v57 = 0;
          }
LABEL_123:
          BOOL v73 = v57 != 0;
          uint64_t v74 = 116;
          goto LABEL_133;
        case 0x15u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v19 = 0;
          *(_WORD *)(a1 + 124) |= 1u;
          while (2)
          {
            uint64_t v63 = *v3;
            unint64_t v64 = *(void *)(a2 + v63);
            if (v64 == -1 || v64 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)(a2 + *v7) + v64);
              *(void *)(a2 + v63) = v64 + 1;
              v19 |= (unint64_t)(v65 & 0x7F) << v61;
              if (v65 < 0)
              {
                v61 += 7;
                BOOL v14 = v62++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_127:
          uint64_t v72 = 40;
LABEL_128:
          *(_DWORD *)(a1 + v72) = v19;
          continue;
        case 0x16u:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v68 = 0;
          *(_WORD *)(a1 + 124) |= 0x20u;
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
        uint64_t v69 = *v3;
        unint64_t v70 = *(void *)(a2 + v69);
        if (v70 == -1 || v70 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v71 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
        *(void *)(a2 + v69) = v70 + 1;
        v68 |= (unint64_t)(v71 & 0x7F) << v66;
        if ((v71 & 0x80) == 0) {
          goto LABEL_130;
        }
        v66 += 7;
        BOOL v14 = v67++ >= 9;
        if (v14)
        {
          uint64_t v68 = 0;
          goto LABEL_132;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_130:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v68 = 0;
      }
LABEL_132:
      BOOL v73 = v68 != 0;
      uint64_t v74 = 117;
LABEL_133:
      *(unsigned char *)(a1 + v74) = v73;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PRERecordMeasurementState()
{
  return MEMORY[0x270F57868]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t pre_signpost_handle()
{
  return MEMORY[0x270F57870]();
}

uint64_t psg_default_log_handle()
{
  return MEMORY[0x270F57878]();
}