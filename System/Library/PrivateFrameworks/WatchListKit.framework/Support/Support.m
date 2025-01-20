void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004F7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000510C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000537C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id obj,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000063E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL WLDConnectionHasBoolValueForEntitlement(void *a1, uint64_t a2)
{
  v2 = [a1 valueForEntitlement:a2];
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && ([v2 BOOLValue] & 1) != 0;

  return v3;
}

void sub_1000071D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t UWLPlayEventReadFrom(uint64_t a1, uint64_t a2)
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
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 56;
        goto LABEL_85;
      case 2u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 96;
        goto LABEL_85;
      case 3u:
        char v14 = 0;
        unsigned int v15 = 0;
        uint64_t v16 = 0;
        while (2)
        {
          unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v17 == -1 || v17 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if (v18 < 0)
            {
              v14 += 7;
              BOOL v9 = v15++ >= 9;
              if (v9)
              {
                uint64_t v16 = 0;
                goto LABEL_122;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_122:
        uint64_t v72 = 40;
        goto LABEL_169;
      case 4u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v16 = 0;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v16 |= (unint64_t)(v22 & 0x7F) << v19;
            if (v22 < 0)
            {
              v19 += 7;
              BOOL v9 = v20++ >= 9;
              if (v9)
              {
                uint64_t v16 = 0;
                goto LABEL_126;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_126:
        uint64_t v72 = 32;
        goto LABEL_169;
      case 5u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(_WORD *)(a1 + 168) |= 0x100u;
        while (2)
        {
          unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                uint64_t v25 = 0;
                goto LABEL_130;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v25 = 0;
        }
LABEL_130:
        BOOL v73 = v25 != 0;
        uint64_t v74 = 163;
        goto LABEL_160;
      case 6u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 104;
        goto LABEL_85;
      case 7u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v16 = 0;
        *(_WORD *)(a1 + 168) |= 4u;
        while (2)
        {
          unint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v30 == -1 || v30 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
            v16 |= (unint64_t)(v31 & 0x7F) << v28;
            if (v31 < 0)
            {
              v28 += 7;
              BOOL v9 = v29++ >= 9;
              if (v9)
              {
                uint64_t v16 = 0;
                goto LABEL_134;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_134:
        uint64_t v72 = 24;
        goto LABEL_169;
      case 8u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0;
        *(_WORD *)(a1 + 168) |= 0x10u;
        while (2)
        {
          unint64_t v35 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v35 == -1 || v35 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v35);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v35 + 1;
            v34 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v9 = v33++ >= 9;
              if (v9)
              {
                LODWORD(v34) = 0;
                goto LABEL_138;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v34) = 0;
        }
LABEL_138:
        uint64_t v75 = 144;
        goto LABEL_151;
      case 9u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 152;
        goto LABEL_85;
      case 0xAu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 48;
        goto LABEL_85;
      case 0xBu:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v39 = 0;
        *(_WORD *)(a1 + 168) |= 0x80u;
        while (2)
        {
          unint64_t v40 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v40 == -1 || v40 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v40);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v40 + 1;
            v39 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              BOOL v9 = v38++ >= 9;
              if (v9)
              {
                uint64_t v39 = 0;
                goto LABEL_142;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v39 = 0;
        }
LABEL_142:
        BOOL v73 = v39 != 0;
        uint64_t v74 = 162;
        goto LABEL_160;
      case 0xCu:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v44 = 0;
        *(_WORD *)(a1 + 168) |= 0x200u;
        while (2)
        {
          unint64_t v45 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v45 == -1 || v45 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v46 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v45);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v45 + 1;
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              BOOL v9 = v43++ >= 9;
              if (v9)
              {
                uint64_t v44 = 0;
                goto LABEL_146;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v44 = 0;
        }
LABEL_146:
        BOOL v73 = v44 != 0;
        uint64_t v74 = 164;
        goto LABEL_160;
      case 0xDu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 64;
        goto LABEL_85;
      case 0xEu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 80;
        goto LABEL_85;
      case 0xFu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 112;
        goto LABEL_85;
      case 0x10u:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v34 = 0;
        *(_WORD *)(a1 + 168) |= 8u;
        while (2)
        {
          unint64_t v49 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v49 == -1 || v49 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v49);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v49 + 1;
            v34 |= (unint64_t)(v50 & 0x7F) << v47;
            if (v50 < 0)
            {
              v47 += 7;
              BOOL v9 = v48++ >= 9;
              if (v9)
              {
                LODWORD(v34) = 0;
                goto LABEL_150;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v34) = 0;
        }
LABEL_150:
        uint64_t v75 = 88;
LABEL_151:
        *(_DWORD *)(a1 + v75) = v34;
        goto LABEL_170;
      case 0x11u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 72;
        goto LABEL_85;
      case 0x12u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 120;
        goto LABEL_85;
      case 0x13u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 128;
LABEL_85:
        v51 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_170;
      case 0x14u:
        char v52 = 0;
        unsigned int v53 = 0;
        uint64_t v54 = 0;
        *(_WORD *)(a1 + 168) |= 0x40u;
        while (2)
        {
          unint64_t v55 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v55 == -1 || v55 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v56 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v55);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v55 + 1;
            v54 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              BOOL v9 = v53++ >= 9;
              if (v9)
              {
                uint64_t v54 = 0;
                goto LABEL_155;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v54 = 0;
        }
LABEL_155:
        BOOL v73 = v54 != 0;
        uint64_t v74 = 161;
        goto LABEL_160;
      case 0x15u:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v59 = 0;
        *(_WORD *)(a1 + 168) |= 0x20u;
        while (2)
        {
          unint64_t v60 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v60 == -1 || v60 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v61 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v60);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v60 + 1;
            v59 |= (unint64_t)(v61 & 0x7F) << v57;
            if (v61 < 0)
            {
              v57 += 7;
              BOOL v9 = v58++ >= 9;
              if (v9)
              {
                uint64_t v59 = 0;
                goto LABEL_159;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v59 = 0;
        }
LABEL_159:
        BOOL v73 = v59 != 0;
        uint64_t v74 = 160;
LABEL_160:
        *(unsigned char *)(a1 + v74) = v73;
        goto LABEL_170;
      case 0x16u:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v16 = 0;
        *(_WORD *)(a1 + 168) |= 1u;
        while (2)
        {
          unint64_t v64 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v64 == -1 || v64 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v65 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v64);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v64 + 1;
            v16 |= (unint64_t)(v65 & 0x7F) << v62;
            if (v65 < 0)
            {
              v62 += 7;
              BOOL v9 = v63++ >= 9;
              if (v9)
              {
                uint64_t v16 = 0;
                goto LABEL_164;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_164:
        uint64_t v72 = 8;
        goto LABEL_169;
      case 0x17u:
        char v66 = 0;
        unsigned int v67 = 0;
        uint64_t v16 = 0;
        *(_WORD *)(a1 + 168) |= 2u;
        while (2)
        {
          unint64_t v68 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v68 == -1 || v68 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v68);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v68 + 1;
            v16 |= (unint64_t)(v69 & 0x7F) << v66;
            if (v69 < 0)
            {
              v66 += 7;
              BOOL v9 = v67++ >= 9;
              if (v9)
              {
                uint64_t v16 = 0;
                goto LABEL_168;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_168:
        uint64_t v72 = 16;
LABEL_169:
        *(void *)(a1 + v72) = v16;
        goto LABEL_170;
      case 0x34u:
        v71 = objc_alloc_init(UWLSectionInfo);
        objc_storeStrong((id *)(a1 + 136), v71);
        if PBReaderPlaceMark() && (UWLSectionInfoReadFrom((uint64_t)v71, a2))
        {
          PBReaderRecallMark();

LABEL_170:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_170;
    }
  }
}

void sub_10000A73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C3BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t UWLLiveActivityEventReadFrom(uint64_t a1, uint64_t a2)
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
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 32;
        goto LABEL_64;
      case 2u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 88) |= 4u;
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
                uint64_t v17 = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v17 = 0;
        }
LABEL_68:
        uint64_t v39 = 24;
        goto LABEL_81;
      case 3u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 80;
        goto LABEL_64;
      case 4u:
        unsigned int v20 = objc_alloc_init(UWLLiveActivityEventChannel);
        objc_storeStrong((id *)(a1 + 48), v20);
        if (!PBReaderPlaceMark() || !UWLLiveActivityEventChannelReadFrom((uint64_t)v20, a2)) {
          goto LABEL_89;
        }
        goto LABEL_34;
      case 5u:
        unsigned int v20 = objc_alloc_init(UWLLiveActivityEventContent);
        objc_storeStrong((id *)(a1 + 56), v20);
        if PBReaderPlaceMark() && (UWLLiveActivityEventContentReadFrom((uint64_t)v20, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_87:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_89:

        return 0;
      case 6u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 88) |= 8u;
        while (2)
        {
          unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1 || v24 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v23 |= (unint64_t)(v25 & 0x7F) << v21;
            if (v25 < 0)
            {
              v21 += 7;
              BOOL v9 = v22++ >= 9;
              if (v9)
              {
                LODWORD(v23) = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_72:
        uint64_t v40 = 40;
        goto LABEL_86;
      case 7u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 88) |= 2u;
        while (2)
        {
          unint64_t v28 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v28 == -1 || v28 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v28);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
            v17 |= (unint64_t)(v29 & 0x7F) << v26;
            if (v29 < 0)
            {
              v26 += 7;
              BOOL v9 = v27++ >= 9;
              if (v9)
              {
                uint64_t v17 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v17 = 0;
        }
LABEL_76:
        uint64_t v39 = 16;
        goto LABEL_81;
      case 8u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 88) |= 1u;
        while (2)
        {
          unint64_t v32 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v32 == -1 || v32 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v32);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
            v17 |= (unint64_t)(v33 & 0x7F) << v30;
            if (v33 < 0)
            {
              v30 += 7;
              BOOL v9 = v31++ >= 9;
              if (v9)
              {
                uint64_t v17 = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v17 = 0;
        }
LABEL_80:
        uint64_t v39 = 8;
LABEL_81:
        *(void *)(a1 + v39) = v17;
        goto LABEL_87;
      case 9u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 88) |= 0x10u;
        while (2)
        {
          unint64_t v36 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v36 == -1 || v36 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v36);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v36 + 1;
            v23 |= (unint64_t)(v37 & 0x7F) << v34;
            if (v37 < 0)
            {
              v34 += 7;
              BOOL v9 = v35++ >= 9;
              if (v9)
              {
                LODWORD(v23) = 0;
                goto LABEL_85;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_85:
        uint64_t v40 = 64;
LABEL_86:
        *(_DWORD *)(a1 + v40) = v23;
        goto LABEL_87;
      case 0xAu:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 72;
LABEL_64:
        unsigned int v38 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

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

void sub_10000F7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t WLDBundleHasBoolValueForEntitlement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (![v3 isEqualToString:@"com.apple.tv"]
    || ([v4 isEqualToString:WLKEntitlementPlaybackReport] & 1) == 0)
  {
    id v14 = 0;
    unint64_t v6 = +[LSBundleRecord bundleRecordWithApplicationIdentifier:v3 error:&v14];
    id v7 = v14;
    if (v7)
    {

      id v13 = 0;
      char v8 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v13];
      id v9 = v13;

      if (v9)
      {
        uint64_t v5 = 0;
LABEL_10:

        goto LABEL_11;
      }
      unint64_t v6 = v8;
    }
    else
    {
      char v8 = v6;
    }
    int v10 = [v6 entitlements];
    v11 = [v10 objectForKey:v4 ofClass:objc_opt_class()];

    uint64_t v5 = (uint64_t)[v11 BOOLValue];
    id v9 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = 1;
LABEL_11:

  return v5;
}

BOOL MapEntryReadFrom(uint64_t a1, uint64_t a2)
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
        uint64_t v13 = 8;
LABEL_21:
        id v14 = *(void **)(a1 + v13);
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
    uint64_t v12 = PBReaderReadString();
    uint64_t v13 = 16;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100010B28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010DC4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100011B54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100011E98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1000122D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012890(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t UWLOptOutEventReadFrom(uint64_t a1, uint64_t a2)
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
      uint64_t v12 = PBReaderReadString();
      uint64_t v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
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

uint64_t UWLOptInEventReadFrom(uint64_t a1, uint64_t a2)
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
      uint64_t v12 = PBReaderReadString();
      uint64_t v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
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

void sub_100013FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NSXPCInterface *WLKWatchlistSuppressNotificationsXPCConnectionInterface()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WLKWatchlistSuppressNotificationsXPCConnectionProtocol];
}

id WLDOperationQueue()
{
  if (WLDOperationQueue_onceToken != -1) {
    dispatch_once(&WLDOperationQueue_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)WLDOperationQueue___opQueue;

  return v0;
}

id WLDDispatchQueue()
{
  if (WLDDispatchQueue_onceToken != -1) {
    dispatch_once(&WLDDispatchQueue_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)WLDDispatchQueue___queue;

  return v0;
}

uint64_t UWLErrorResponseReadFrom(uint64_t a1, uint64_t a2)
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
    if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
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
          goto LABEL_28;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_30;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_30:
      *(_DWORD *)(a1 + 8) = v14;
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

BOOL UWLLiveActivityEventChannelReadFrom(uint64_t a1, uint64_t a2)
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
      switch((v6 >> 3))
      {
        case 1u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 16;
          goto LABEL_24;
        case 2u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 8;
          goto LABEL_24;
        case 3u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 24;
          goto LABEL_24;
        case 4u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 32;
LABEL_24:
          uint64_t v14 = *(void **)(a1 + v13);
          *(void *)(a1 + v13) = v12;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t UWLMessageWireEnvelopeReadFrom(uint64_t a1, uint64_t a2)
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
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
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
            goto LABEL_45;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_47:
        *(_DWORD *)(a1 + 48) = v14;
        goto LABEL_42;
      case 2u:
        unint64_t v18 = objc_alloc_init(UWLMessageHeaders);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark() || (UWLMessageHeadersReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_49;
        }
        goto LABEL_41;
      case 3u:
        unint64_t v18 = objc_alloc_init(UWLPlayEvent);
        [(id)a1 addPlayEvents:v18];
        if (!PBReaderPlaceMark() || (UWLPlayEventReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_49;
        }
        goto LABEL_41;
      case 4u:
        unint64_t v18 = objc_alloc_init(UWLOptInEvent);
        [(id)a1 addOptInEvents:v18];
        if (!PBReaderPlaceMark() || (UWLOptInEventReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_49;
        }
        goto LABEL_41;
      case 5u:
        unint64_t v18 = objc_alloc_init(UWLOptOutEvent);
        [(id)a1 addOptOutEvents:v18];
        if (!PBReaderPlaceMark() || (UWLOptOutEventReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_49;
        }
        goto LABEL_41;
      case 6u:
        unint64_t v18 = objc_alloc_init(UWLLiveActivityEvent);
        [(id)a1 addLiveActivityEvents:v18];
        if PBReaderPlaceMark() && (UWLLiveActivityEventReadFrom((uint64_t)v18, a2))
        {
LABEL_41:
          PBReaderRecallMark();

LABEL_42:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
LABEL_49:

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

void sub_100017DE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001901C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019868(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019E28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A094(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
}

void sub_10001B484(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001B99C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001BA2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001BADC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001BB84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001BC1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001BE64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C068(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C354(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_10001C4A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001C84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001CA90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

int main(int argc, const char **argv, const char **envp)
{
  char v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v4, &__block_literal_global_6);
  dispatch_resume(v4);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_5);

  unsigned int v5 = +[WLDServer server];
  [v5 start];

  unint64_t v6 = +[NSRunLoop currentRunLoop];
  [v6 run];

  return 0;
}

void __main_block_invoke(id a1)
{
}

void __main_block_invoke_2(id a1, OS_xpc_object *a2)
{
  id v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a2, _xpc_event_key_name)];
  NSLog(@"Got notifyd launch notification: %@", v3);
  if ([v3 isEqualToString:@"com.apple.VideoSubscriberAccount.DidRegisterSubscription"])
  {
    uint64_t v2 = +[WLDServer server];
    [v2 handleSubscriptionRegistration];
LABEL_9:

    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"com.apple.AppleMediaServices.deviceOffersChanged"])
  {
    uint64_t v2 = +[WLDServer server];
    [v2 handleAMSDeviceOffer];
    goto LABEL_9;
  }
  if (([v3 isEqualToString:@"com.apple.VideosUI.StoreAcquisitionCrossProcessNotification"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"com.apple.VideosUI.UpNextRequestDidFinishNotification") & 1) != 0|| objc_msgSend(v3, "isEqualToString:", @"com.apple.VideosUI.PlayHistoryUpdatedNotification"))
  {
    uint64_t v2 = +[WLDServer server];
    [v2 handleVideosUIInvalidationNotification:v3];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"com.apple.tv.TVWidgetExtension.Register"])
  {
    uint64_t v2 = +[WLDServer server];
    [v2 handleUNWidgetRegistration];
    goto LABEL_9;
  }
LABEL_10:
}

void sub_10001EC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001EE98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000203C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak((id *)(v28 - 112));
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_100022568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

id WLKPlatformStringFromDictionary(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "wlk_stringForKey:", @"Ios_Live");
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "wlk_stringForKey:", @"Ios");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  unsigned int v5 = v4;

  return v5;
}

void sub_100022AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  v5[0] = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = __SetupAssistantLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = off_100045990;
    uint64_t v7 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (SetupAssistantLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t UWLLiveActivityEventContentReadFrom(uint64_t a1, uint64_t a2)
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
        uint64_t v13 = 24;
        goto LABEL_38;
      case 2u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 16;
        goto LABEL_38;
      case 3u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 32;
        goto LABEL_38;
      case 4u:
        char v15 = 0;
        unsigned int v16 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)(a1 + 52) |= 1u;
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
                uint64_t v17 = 0;
                goto LABEL_42;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v17 = 0;
        }
LABEL_42:
        *(void *)(a1 + 8) = v17;
        continue;
      case 5u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 52) |= 2u;
        break;
      case 6u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 40;
LABEL_38:
        char v25 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

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
      unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
      v22 |= (unint64_t)(v24 & 0x7F) << v20;
      if ((v24 & 0x80) == 0) {
        goto LABEL_44;
      }
      v20 += 7;
      BOOL v9 = v21++ >= 9;
      if (v9)
      {
        uint64_t v22 = 0;
        goto LABEL_46;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v22 = 0;
    }
LABEL_46:
    *(unsigned char *)(a1 + 48) = v22 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1000247B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100024938(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t UWLMessageHeadersReadFrom(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  char v4 = &selRef__activePlayerPathsDidChangeNotification_;
  unsigned int v5 = &selRef__activePlayerPathsDidChangeNotification_;
  unint64_t v6 = &selRef__activePlayerPathsDidChangeNotification_;
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v7 = 0;
    unsigned int v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      unint64_t v10 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v10 == -1 || v10 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v11 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v10);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v10 + 1;
      v9 |= (unint64_t)(v11 & 0x7F) << v7;
      if ((v11 & 0x80) == 0) {
        goto LABEL_12;
      }
      v7 += 7;
      BOOL v12 = v8++ >= 9;
      if (v12)
      {
        unint64_t v9 = 0;
        int v13 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_12:
    int v13 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v9 = 0;
    }
LABEL_14:
    if (v13 || (v9 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v9 >> 3))
    {
      case 1u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = *((int *)v4 + 137);
        goto LABEL_31;
      case 2u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = *((int *)v5 + 138);
        goto LABEL_31;
      case 3u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = *((int *)v6 + 139);
        goto LABEL_31;
      case 4u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 56;
        goto LABEL_31;
      case 6u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 72;
        goto LABEL_31;
      case 7u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 64;
        goto LABEL_31;
      case 8u:
        unint64_t v18 = v6;
        char v19 = v5;
        char v20 = v4;
        unsigned int v21 = objc_alloc_init(MapEntry);
        [(id)a1 addCookies:v21];
        if (PBReaderPlaceMark() && MapEntryReadFrom((uint64_t)v21, a2))
        {
          PBReaderRecallMark();

          char v4 = v20;
          unsigned int v5 = v19;
          unint64_t v6 = v18;
LABEL_32:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      case 0xBu:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 24;
LABEL_31:
        uint64_t v22 = *(void **)(a1 + v16);
        *(void *)(a1 + v16) = v15;

        goto LABEL_32;
      case 0xCu:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 80) |= 1u;
        while (2)
        {
          unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v12 = v24++ >= 9;
              if (v12)
              {
                LODWORD(v25) = 0;
                goto LABEL_44;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v25) = 0;
        }
LABEL_44:
        *(_DWORD *)(a1 + 8) = v25;
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

void sub_100027764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_100028334(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100029070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10002952C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000297C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029E0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _BagObserverLog()
{
  if (_BagObserverLog_onceToken != -1) {
    dispatch_once(&_BagObserverLog_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)_BagObserverLog_log;

  return v0;
}

void sub_10002B3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t UWLSectionInfoReadFrom(uint64_t a1, uint64_t a2)
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
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 36) |= 4u;
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
            goto LABEL_43;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_45:
        *(unsigned char *)(a1 + 32) = v14 != 0;
        continue;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                uint64_t v20 = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v20 = 0;
        }
LABEL_49:
        uint64_t v29 = 16;
        goto LABEL_54;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        break;
      case 4u:
        uint64_t v27 = PBReaderReadString();
        uint64_t v28 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v27;

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
      unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v25 == -1 || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
      v20 |= (unint64_t)(v26 & 0x7F) << v23;
      if ((v26 & 0x80) == 0) {
        goto LABEL_51;
      }
      v23 += 7;
      BOOL v9 = v24++ >= 9;
      if (v9)
      {
        uint64_t v20 = 0;
        goto LABEL_53;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_51:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v20 = 0;
    }
LABEL_53:
    uint64_t v29 = 8;
LABEL_54:
    *(void *)(a1 + v29) = v20;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return _CPCopyBundleIdentifierAndTeamFromAuditToken();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MRMediaRemoteGetActivePlayerPathsForOrigin()
{
  return _MRMediaRemoteGetActivePlayerPathsForOrigin();
}

uint64_t MRMediaRemoteGetNowPlayingInfoForPlayer()
{
  return _MRMediaRemoteGetNowPlayingInfoForPlayer();
}

uint64_t MRMediaRemoteGetPlaybackStateForPlayer()
{
  return _MRMediaRemoteGetPlaybackStateForPlayer();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return _MRMediaRemoteRegisterForNowPlayingNotifications();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return _MRMediaRemoteUnregisterForNowPlayingNotifications();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
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

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
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

uint64_t SBSUIActivateRemoteAlertWithLifecycleNotifications()
{
  return _SBSUIActivateRemoteAlertWithLifecycleNotifications();
}

uint64_t SBSUIIsNamedRemoteAlertCurrentlyActive()
{
  return _SBSUIIsNamedRemoteAlertCurrentlyActive();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t WLKConnectionClientInterface()
{
  return _WLKConnectionClientInterface();
}

uint64_t WLKConnectionServerInterface()
{
  return _WLKConnectionServerInterface();
}

uint64_t WLKCurrentProtocolVersion()
{
  return _WLKCurrentProtocolVersion();
}

uint64_t WLKDefaultSupportPath()
{
  return _WLKDefaultSupportPath();
}

uint64_t WLKError()
{
  return _WLKError();
}

uint64_t WLKHTTPStatusCodeForAMSError()
{
  return _WLKHTTPStatusCodeForAMSError();
}

uint64_t WLKNetworkSignpostLogObject()
{
  return _WLKNetworkSignpostLogObject();
}

uint64_t WLKPlaybackTrackingLogObject()
{
  return _WLKPlaybackTrackingLogObject();
}

uint64_t WLKPushNotificationsLogObject()
{
  return _WLKPushNotificationsLogObject();
}

uint64_t WLKStartupSignpostLogObject()
{
  return _WLKStartupSignpostLogObject();
}

uint64_t WLKSubscriptionIdentifierForBundleID()
{
  return _WLKSubscriptionIdentifierForBundleID();
}

uint64_t WLKSubscriptionSyncLogObject()
{
  return _WLKSubscriptionSyncLogObject();
}

uint64_t WLKSystemLogObject()
{
  return _WLKSystemLogObject();
}

uint64_t WLKTVAppBundleID()
{
  return _WLKTVAppBundleID();
}

uint64_t WLKTVAppEnabledOverride()
{
  return _WLKTVAppEnabledOverride();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_activate(dispatch_object_t object)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return [a1 ID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__addToken(void *a1, const char *a2, ...)
{
  return [a1 _addToken];
}

id objc_msgSend__cachedMetadataByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _cachedMetadataByIdentifier];
}

id objc_msgSend__cachedNotFoundIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _cachedNotFoundIdentifiers];
}

id objc_msgSend__claimToken(void *a1, const char *a2, ...)
{
  return [a1 _claimToken];
}

id objc_msgSend__clearBDTimer(void *a1, const char *a2, ...)
{
  return [a1 _clearBDTimer];
}

id objc_msgSend__coalescedCompletion(void *a1, const char *a2, ...)
{
  return [a1 _coalescedCompletion];
}

id objc_msgSend__didInvalidate(void *a1, const char *a2, ...)
{
  return [a1 _didInvalidate];
}

id objc_msgSend__enqueuePendingReports(void *a1, const char *a2, ...)
{
  return [a1 _enqueuePendingReports];
}

id objc_msgSend__fetchActivePlayerPaths(void *a1, const char *a2, ...)
{
  return [a1 _fetchActivePlayerPaths];
}

id objc_msgSend__forceFetchNowPlayingInfofromActivePlayers(void *a1, const char *a2, ...)
{
  return [a1 _forceFetchNowPlayingInfofromActivePlayers];
}

id objc_msgSend__getActivePlayerPaths(void *a1, const char *a2, ...)
{
  return [a1 _getActivePlayerPaths];
}

id objc_msgSend__getAppRunningState(void *a1, const char *a2, ...)
{
  return [a1 _getAppRunningState];
}

id objc_msgSend__getSubscriptionDataMaxAge(void *a1, const char *a2, ...)
{
  return [a1 _getSubscriptionDataMaxAge];
}

id objc_msgSend__identifier(void *a1, const char *a2, ...)
{
  return [a1 _identifier];
}

id objc_msgSend__inflightCoalescingID(void *a1, const char *a2, ...)
{
  return [a1 _inflightCoalescingID];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__invalidateTimer(void *a1, const char *a2, ...)
{
  return [a1 _invalidateTimer];
}

id objc_msgSend__invalidateWidgets(void *a1, const char *a2, ...)
{
  return [a1 _invalidateWidgets];
}

id objc_msgSend__isAnyAppPlaying(void *a1, const char *a2, ...)
{
  return [a1 _isAnyAppPlaying];
}

id objc_msgSend__isDirectPlaybackReportingDisabled(void *a1, const char *a2, ...)
{
  return [a1 _isDirectPlaybackReportingDisabled];
}

id objc_msgSend__isPad(void *a1, const char *a2, ...)
{
  return [a1 _isPad];
}

id objc_msgSend__queueDir(void *a1, const char *a2, ...)
{
  return [a1 _queueDir];
}

id objc_msgSend__readFromDisk(void *a1, const char *a2, ...)
{
  return [a1 _readFromDisk];
}

id objc_msgSend__registerOpportunisticTopics(void *a1, const char *a2, ...)
{
  return [a1 _registerOpportunisticTopics];
}

id objc_msgSend__reportAMSDeviceOfferMetrics(void *a1, const char *a2, ...)
{
  return [a1 _reportAMSDeviceOfferMetrics];
}

id objc_msgSend__scanForPendingReports(void *a1, const char *a2, ...)
{
  return [a1 _scanForPendingReports];
}

id objc_msgSend__shouldFetchFreshCopy(void *a1, const char *a2, ...)
{
  return [a1 _shouldFetchFreshCopy];
}

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return [a1 _startObserving];
}

id objc_msgSend__stopObserving(void *a1, const char *a2, ...)
{
  return [a1 _stopObserving];
}

id objc_msgSend__stubbedDataPath(void *a1, const char *a2, ...)
{
  return [a1 _stubbedDataPath];
}

id objc_msgSend__supportPath(void *a1, const char *a2, ...)
{
  return [a1 _supportPath];
}

id objc_msgSend__unsupportedMediaTypes(void *a1, const char *a2, ...)
{
  return [a1 _unsupportedMediaTypes];
}

id objc_msgSend_accessStatus(void *a1, const char *a2, ...)
{
  return [a1 accessStatus];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return [a1 accountID];
}

id objc_msgSend_accountIDAsNumber(void *a1, const char *a2, ...)
{
  return [a1 accountIDAsNumber];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_adamId(void *a1, const char *a2, ...)
{
  return [a1 adamId];
}

id objc_msgSend_allAppBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allAppBundleIdentifiers];
}

id objc_msgSend_allAppProxiesPerCategory(void *a1, const char *a2, ...)
{
  return [a1 allAppProxiesPerCategory];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_app(void *a1, const char *a2, ...)
{
  return [a1 app];
}

id objc_msgSend_appAdamID(void *a1, const char *a2, ...)
{
  return [a1 appAdamID];
}

id objc_msgSend_appBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 appBundleIDs];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_canonicalID(void *a1, const char *a2, ...)
{
  return [a1 canonicalID];
}

id objc_msgSend_canonicalShowID(void *a1, const char *a2, ...)
{
  return [a1 canonicalShowID];
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return [a1 channelID];
}

id objc_msgSend_checkPendingReports(void *a1, const char *a2, ...)
{
  return [a1 checkPendingReports];
}

id objc_msgSend_clearCookies(void *a1, const char *a2, ...)
{
  return [a1 clearCookies];
}

id objc_msgSend_clearLiveActivityEvents(void *a1, const char *a2, ...)
{
  return [a1 clearLiveActivityEvents];
}

id objc_msgSend_clearOptInEvents(void *a1, const char *a2, ...)
{
  return [a1 clearOptInEvents];
}

id objc_msgSend_clearOptOutEvents(void *a1, const char *a2, ...)
{
  return [a1 clearOptOutEvents];
}

id objc_msgSend_clearPlayEvents(void *a1, const char *a2, ...)
{
  return [a1 clearPlayEvents];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_completionState(void *a1, const char *a2, ...)
{
  return [a1 completionState];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_consentedBrands(void *a1, const char *a2, ...)
{
  return [a1 consentedBrands];
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return [a1 contentID];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_cookiesCount(void *a1, const char *a2, ...)
{
  return [a1 cookiesCount];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentBadgeNumber(void *a1, const char *a2, ...)
{
  return [a1 currentBadgeNumber];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return [a1 currentEnvironment];
}

id objc_msgSend_currentPlaybackDate(void *a1, const char *a2, ...)
{
  return [a1 currentPlaybackDate];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultAppLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultAppLibrary];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultChannelManager(void *a1, const char *a2, ...)
{
  return [a1 defaultChannelManager];
}

id objc_msgSend_defaultLocationManager(void *a1, const char *a2, ...)
{
  return [a1 defaultLocationManager];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultOfferManager(void *a1, const char *a2, ...)
{
  return [a1 defaultOfferManager];
}

id objc_msgSend_deniedBrands(void *a1, const char *a2, ...)
{
  return [a1 deniedBrands];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_deviceOffers(void *a1, const char *a2, ...)
{
  return [a1 deviceOffers];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_displayCriteria(void *a1, const char *a2, ...)
{
  return [a1 displayCriteria];
}

id objc_msgSend_doOperation(void *a1, const char *a2, ...)
{
  return [a1 doOperation];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return [a1 elapsedTime];
}

id objc_msgSend_encoder(void *a1, const char *a2, ...)
{
  return [a1 encoder];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_expiry(void *a1, const char *a2, ...)
{
  return [a1 expiry];
}

id objc_msgSend_externalContentID(void *a1, const char *a2, ...)
{
  return [a1 externalContentID];
}

id objc_msgSend_externalProfileID(void *a1, const char *a2, ...)
{
  return [a1 externalProfileID];
}

id objc_msgSend_failureReason(void *a1, const char *a2, ...)
{
  return [a1 failureReason];
}

id objc_msgSend_featureDuration(void *a1, const char *a2, ...)
{
  return [a1 featureDuration];
}

id objc_msgSend_featureElapsedTime(void *a1, const char *a2, ...)
{
  return [a1 featureElapsedTime];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_handleAMSDeviceOffer(void *a1, const char *a2, ...)
{
  return [a1 handleAMSDeviceOffer];
}

id objc_msgSend_handleRefreshCacheNotification(void *a1, const char *a2, ...)
{
  return [a1 handleRefreshCacheNotification];
}

id objc_msgSend_handleSubscriptionRegistration(void *a1, const char *a2, ...)
{
  return [a1 handleSubscriptionRegistration];
}

id objc_msgSend_handleSyncSettingChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 handleSyncSettingChangedNotification];
}

id objc_msgSend_handleUNWidgetRegistration(void *a1, const char *a2, ...)
{
  return [a1 handleUNWidgetRegistration];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_httpResponse(void *a1, const char *a2, ...)
{
  return [a1 httpResponse];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_installedAppBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 installedAppBundleIdentifiers];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isConsented(void *a1, const char *a2, ...)
{
  return [a1 isConsented];
}

id objc_msgSend_isDowngrading(void *a1, const char *a2, ...)
{
  return [a1 isDowngrading];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return [a1 isExecuting];
}

id objc_msgSend_isFromActivePlayerPath(void *a1, const char *a2, ...)
{
  return [a1 isFromActivePlayerPath];
}

id objc_msgSend_isGDPRAccepted(void *a1, const char *a2, ...)
{
  return [a1 isGDPRAccepted];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isLiveType(void *a1, const char *a2, ...)
{
  return [a1 isLiveType];
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return [a1 isLocal];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return [a1 isNetworkReachable];
}

id objc_msgSend_isPresenting(void *a1, const char *a2, ...)
{
  return [a1 isPresenting];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isSubscribed(void *a1, const char *a2, ...)
{
  return [a1 isSubscribed];
}

id objc_msgSend_isTVPlusSubscriber(void *a1, const char *a2, ...)
{
  return [a1 isTVPlusSubscriber];
}

id objc_msgSend_isTimerDerived(void *a1, const char *a2, ...)
{
  return [a1 isTimerDerived];
}

id objc_msgSend_isUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isUnlocked];
}

id objc_msgSend_isWatchListEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWatchListEnabled];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_lastSummary(void *a1, const char *a2, ...)
{
  return [a1 lastSummary];
}

id objc_msgSend_ledger(void *a1, const char *a2, ...)
{
  return [a1 ledger];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_liveActivityEventsCount(void *a1, const char *a2, ...)
{
  return [a1 liveActivityEventsCount];
}

id objc_msgSend_livePlayEvents(void *a1, const char *a2, ...)
{
  return [a1 livePlayEvents];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_matchTime(void *a1, const char *a2, ...)
{
  return [a1 matchTime];
}

id objc_msgSend_metadataByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 metadataByIdentifier];
}

id objc_msgSend_metricsController(void *a1, const char *a2, ...)
{
  return [a1 metricsController];
}

id objc_msgSend_migrateToNewBadgingSystemIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 migrateToNewBadgingSystemIfNeeded];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextExpectedReportMillis(void *a1, const char *a2, ...)
{
  return [a1 nextExpectedReportMillis];
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return [a1 notificationSettings];
}

id objc_msgSend_notificationSettingsForTopics(void *a1, const char *a2, ...)
{
  return [a1 notificationSettingsForTopics];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nowPlayingObserver(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingObserver];
}

id objc_msgSend_nowPlayingPassThrough(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingPassThrough];
}

id objc_msgSend_nowPlayingSummaries(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingSummaries];
}

id objc_msgSend_offerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 offerIdentifier];
}

id objc_msgSend_offerType(void *a1, const char *a2, ...)
{
  return [a1 offerType];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_opportunisticTopics(void *a1, const char *a2, ...)
{
  return [a1 opportunisticTopics];
}

id objc_msgSend_optInEventsCount(void *a1, const char *a2, ...)
{
  return [a1 optInEventsCount];
}

id objc_msgSend_optOutEventsCount(void *a1, const char *a2, ...)
{
  return [a1 optOutEventsCount];
}

id objc_msgSend_optedIn(void *a1, const char *a2, ...)
{
  return [a1 optedIn];
}

id objc_msgSend_origin(void *a1, const char *a2, ...)
{
  return [a1 origin];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return [a1 performAuthentication];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_playEvents(void *a1, const char *a2, ...)
{
  return [a1 playEvents];
}

id objc_msgSend_playEventsCount(void *a1, const char *a2, ...)
{
  return [a1 playEventsCount];
}

id objc_msgSend_playbackRate(void *a1, const char *a2, ...)
{
  return [a1 playbackRate];
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return [a1 playbackState];
}

id objc_msgSend_playbackType(void *a1, const char *a2, ...)
{
  return [a1 playbackType];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_prewarm(void *a1, const char *a2, ...)
{
  return [a1 prewarm];
}

id objc_msgSend_privateModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 privateModeEnabled];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_processDeviceOffers(void *a1, const char *a2, ...)
{
  return [a1 processDeviceOffers];
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return [a1 publicToken];
}

id objc_msgSend_punchoutTime(void *a1, const char *a2, ...)
{
  return [a1 punchoutTime];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rateLimit(void *a1, const char *a2, ...)
{
  return [a1 rateLimit];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_registerOpportunisticTopics(void *a1, const char *a2, ...)
{
  return [a1 registerOpportunisticTopics];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestInvalidation(void *a1, const char *a2, ...)
{
  return [a1 requestInvalidation];
}

id objc_msgSend_requestReload(void *a1, const char *a2, ...)
{
  return [a1 requestReload];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return [a1 responseDictionary];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeTimeSeconds(void *a1, const char *a2, ...)
{
  return [a1 resumeTimeSeconds];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sanitizedCopy(void *a1, const char *a2, ...)
{
  return [a1 sanitizedCopy];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_serialNumbers(void *a1, const char *a2, ...)
{
  return [a1 serialNumbers];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serviceID(void *a1, const char *a2, ...)
{
  return [a1 serviceID];
}

id objc_msgSend_sharedFederatedPunchoutReporter(void *a1, const char *a2, ...)
{
  return [a1 sharedFederatedPunchoutReporter];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedInstanceFiltered(void *a1, const char *a2, ...)
{
  return [a1 sharedInstanceFiltered];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedObserver];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedSettings];
}

id objc_msgSend_sharedTracker(void *a1, const char *a2, ...)
{
  return [a1 sharedTracker];
}

id objc_msgSend_sharedUtilities(void *a1, const char *a2, ...)
{
  return [a1 sharedUtilities];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return [a1 shortDescription];
}

id objc_msgSend_shouldTrackPlayActivity(void *a1, const char *a2, ...)
{
  return [a1 shouldTrackPlayActivity];
}

id objc_msgSend_signpostIdentifier(void *a1, const char *a2, ...)
{
  return [a1 signpostIdentifier];
}

id objc_msgSend_siriActionsCategories(void *a1, const char *a2, ...)
{
  return [a1 siriActionsCategories];
}

id objc_msgSend_sportsScoreSpoilersAllowed(void *a1, const char *a2, ...)
{
  return [a1 sportsScoreSpoilersAllowed];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return [a1 startObserving];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateMonitor(void *a1, const char *a2, ...)
{
  return [a1 stateMonitor];
}

id objc_msgSend_states(void *a1, const char *a2, ...)
{
  return [a1 states];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return [a1 stopObserving];
}

id objc_msgSend_storedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 storedConfiguration];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subscribedAppBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 subscribedAppBundleIdentifiers];
}

id objc_msgSend_suppressedSportsEventIDs(void *a1, const char *a2, ...)
{
  return [a1 suppressedSportsEventIDs];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_ttl(void *a1, const char *a2, ...)
{
  return [a1 ttl];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return [a1 underlyingQueue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateAppVisibility(void *a1, const char *a2, ...)
{
  return [a1 updateAppVisibility];
}

id objc_msgSend_updateHandler(void *a1, const char *a2, ...)
{
  return [a1 updateHandler];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vppaState(void *a1, const char *a2, ...)
{
  return [a1 vppaState];
}

id objc_msgSend_wlkDefaultQueue(void *a1, const char *a2, ...)
{
  return [a1 wlkDefaultQueue];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}