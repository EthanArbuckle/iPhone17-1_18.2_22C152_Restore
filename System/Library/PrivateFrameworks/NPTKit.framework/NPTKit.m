void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_2194180D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
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

void sub_2194181E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_219418984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_219419204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_sync_exit(v24);
  _Block_object_dispose(&a24, 8);
  objc_destroyWeak(v25);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__249(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__250(uint64_t a1)
{
}

void sub_219419950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_219419DC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21941A0DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21941A414(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21941B160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21941CE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
}

__CFString *indicatorToString(unsigned int a1)
{
  if (a1 > 0x11) {
    return @"unknown";
  }
  else {
    return off_2643A1898[a1];
  }
}

__CFString *wirelessAccessTechnologyToString(unsigned int a1)
{
  if (a1 > 0xA) {
    return @"unknown";
  }
  else {
    return off_2643A1928[a1];
  }
}

__CFString *dataBearerTechnologyToString(int a1)
{
  if ((a1 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_2643A1980[a1 - 1];
  }
}

__CFString *ctReasonToString(int a1)
{
  if ((a1 - 1) > 0xA) {
    return @"Unknown";
  }
  else {
    return off_2643A19B0[a1 - 1];
  }
}

void sub_21942252C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219422664(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_219422780(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2194256A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219425834(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_219427094(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_219428428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2194286A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21942909C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21942A4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
}

uint64_t AWDNetworkPerformanceMetricReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
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
          *(_DWORD *)(a1 + 1684) |= 1u;
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
              goto LABEL_412;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_414;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_412:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_414:
          *(void *)(a1 + 8) = v19;
          continue;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 16;
          goto LABEL_408;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 24;
          goto LABEL_408;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 32;
          goto LABEL_408;
        case 5u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(_DWORD *)(a1 + 1684) |= 4u;
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
                  goto LABEL_418;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v27 = 0;
          }
LABEL_418:
          BOOL v177 = v27 != 0;
          uint64_t v178 = 1657;
          goto LABEL_515;
        case 6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 40;
          goto LABEL_408;
        case 7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 48;
          goto LABEL_408;
        case 8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
          goto LABEL_408;
        case 9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 64;
          goto LABEL_408;
        case 0xBu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 72;
          goto LABEL_408;
        case 0xCu:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          *(_DWORD *)(a1 + 1684) |= 8u;
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
                  goto LABEL_422;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v34 = 0;
          }
LABEL_422:
          BOOL v177 = v34 != 0;
          uint64_t v178 = 1658;
          goto LABEL_515;
        case 0xDu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x10u;
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
                  goto LABEL_426;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v40 = 0;
          }
LABEL_426:
          BOOL v177 = v40 != 0;
          uint64_t v178 = 1659;
          goto LABEL_515;
        case 0xEu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x20u;
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
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                BOOL v14 = v45++ >= 9;
                if (v14)
                {
                  uint64_t v46 = 0;
                  goto LABEL_430;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v46 = 0;
          }
LABEL_430:
          BOOL v177 = v46 != 0;
          uint64_t v178 = 1660;
          goto LABEL_515;
        case 0xFu:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x40u;
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
                  goto LABEL_434;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v52 = 0;
          }
LABEL_434:
          BOOL v177 = v52 != 0;
          uint64_t v178 = 1661;
          goto LABEL_515;
        case 0x10u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
          goto LABEL_408;
        case 0x11u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 88;
          goto LABEL_408;
        case 0x12u:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v58 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x80u;
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
                  goto LABEL_438;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v58 = 0;
          }
LABEL_438:
          BOOL v177 = v58 != 0;
          uint64_t v178 = 1662;
          goto LABEL_515;
        case 0x13u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 112;
          goto LABEL_408;
        case 0x14u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 120;
          goto LABEL_408;
        case 0x15u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 128;
          goto LABEL_408;
        case 0x16u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 136;
          goto LABEL_408;
        case 0x17u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 152;
          goto LABEL_408;
        case 0x18u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 160;
          goto LABEL_408;
        case 0x19u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 168;
          goto LABEL_408;
        case 0x1Au:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 176;
          goto LABEL_408;
        case 0x1Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 184;
          goto LABEL_408;
        case 0x1Cu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 192;
          goto LABEL_408;
        case 0x1Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 200;
          goto LABEL_408;
        case 0x1Eu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 208;
          goto LABEL_408;
        case 0x1Fu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 232;
          goto LABEL_408;
        case 0x20u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 240;
          goto LABEL_408;
        case 0x21u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 296;
          goto LABEL_408;
        case 0x22u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 304;
          goto LABEL_408;
        case 0x23u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 312;
          goto LABEL_408;
        case 0x24u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 320;
          goto LABEL_408;
        case 0x25u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 328;
          goto LABEL_408;
        case 0x26u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 336;
          goto LABEL_408;
        case 0x27u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 344;
          goto LABEL_408;
        case 0x28u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 352;
          goto LABEL_408;
        case 0x29u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 360;
          goto LABEL_408;
        case 0x2Au:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 368;
          goto LABEL_408;
        case 0x2Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 376;
          goto LABEL_408;
        case 0x2Cu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 384;
          goto LABEL_408;
        case 0x2Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 392;
          goto LABEL_408;
        case 0x2Eu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 400;
          goto LABEL_408;
        case 0x2Fu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 408;
          goto LABEL_408;
        case 0x30u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 424;
          goto LABEL_408;
        case 0x31u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 440;
          goto LABEL_408;
        case 0x32u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 448;
          goto LABEL_408;
        case 0x33u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 456;
          goto LABEL_408;
        case 0x34u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 488;
          goto LABEL_408;
        case 0x35u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 496;
          goto LABEL_408;
        case 0x36u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 504;
          goto LABEL_408;
        case 0x37u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 512;
          goto LABEL_408;
        case 0x38u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 520;
          goto LABEL_408;
        case 0x39u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 528;
          goto LABEL_408;
        case 0x3Au:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 536;
          goto LABEL_408;
        case 0x3Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 552;
          goto LABEL_408;
        case 0x3Cu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 568;
          goto LABEL_408;
        case 0x3Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 576;
          goto LABEL_408;
        case 0x3Eu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 584;
          goto LABEL_408;
        case 0x3Fu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 592;
          goto LABEL_408;
        case 0x40u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 600;
          goto LABEL_408;
        case 0x41u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 616;
          goto LABEL_408;
        case 0x42u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 624;
          goto LABEL_408;
        case 0x43u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 640;
          goto LABEL_408;
        case 0x44u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 672;
          goto LABEL_408;
        case 0x45u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 680;
          goto LABEL_408;
        case 0x46u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 688;
          goto LABEL_408;
        case 0x47u:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v64 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x200u;
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
              v64 |= (unint64_t)(v67 & 0x7F) << v62;
              if (v67 < 0)
              {
                v62 += 7;
                BOOL v14 = v63++ >= 9;
                if (v14)
                {
                  uint64_t v64 = 0;
                  goto LABEL_442;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v64 = 0;
          }
LABEL_442:
          BOOL v177 = v64 != 0;
          uint64_t v178 = 1664;
          goto LABEL_515;
        case 0x48u:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v70 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x400u;
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
                  goto LABEL_446;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v70 = 0;
          }
LABEL_446:
          BOOL v177 = v70 != 0;
          uint64_t v178 = 1665;
          goto LABEL_515;
        case 0x49u:
          char v74 = 0;
          unsigned int v75 = 0;
          uint64_t v76 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x800u;
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
                  goto LABEL_450;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v76 = 0;
          }
LABEL_450:
          BOOL v177 = v76 != 0;
          uint64_t v178 = 1666;
          goto LABEL_515;
        case 0x4Au:
          char v80 = 0;
          unsigned int v81 = 0;
          uint64_t v82 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x1000u;
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
                  goto LABEL_454;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v82 = 0;
          }
LABEL_454:
          BOOL v177 = v82 != 0;
          uint64_t v178 = 1667;
          goto LABEL_515;
        case 0x4Bu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x2000u;
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
                  goto LABEL_458;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v88 = 0;
          }
LABEL_458:
          BOOL v177 = v88 != 0;
          uint64_t v178 = 1668;
          goto LABEL_515;
        case 0x4Cu:
          char v92 = 0;
          unsigned int v93 = 0;
          uint64_t v94 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x4000u;
          while (2)
          {
            uint64_t v95 = *v3;
            unint64_t v96 = *(void *)(a2 + v95);
            if (v96 == -1 || v96 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v97 = *(unsigned char *)(*(void *)(a2 + *v7) + v96);
              *(void *)(a2 + v95) = v96 + 1;
              v94 |= (unint64_t)(v97 & 0x7F) << v92;
              if (v97 < 0)
              {
                v92 += 7;
                BOOL v14 = v93++ >= 9;
                if (v14)
                {
                  uint64_t v94 = 0;
                  goto LABEL_462;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v94 = 0;
          }
LABEL_462:
          BOOL v177 = v94 != 0;
          uint64_t v178 = 1669;
          goto LABEL_515;
        case 0x4Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 704;
          goto LABEL_408;
        case 0x4Eu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 712;
          goto LABEL_408;
        case 0x4Fu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 720;
          goto LABEL_408;
        case 0x50u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 728;
          goto LABEL_408;
        case 0x51u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 736;
          goto LABEL_408;
        case 0x52u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 744;
          goto LABEL_408;
        case 0x53u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 752;
          goto LABEL_408;
        case 0x54u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 760;
          goto LABEL_408;
        case 0x55u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 792;
          goto LABEL_408;
        case 0x56u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 800;
          goto LABEL_408;
        case 0x57u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 808;
          goto LABEL_408;
        case 0x58u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 832;
          goto LABEL_408;
        case 0x59u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 848;
          goto LABEL_408;
        case 0x5Au:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 856;
          goto LABEL_408;
        case 0x5Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 872;
          goto LABEL_408;
        case 0x5Cu:
          char v98 = 0;
          unsigned int v99 = 0;
          uint64_t v100 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x8000u;
          while (2)
          {
            uint64_t v101 = *v3;
            unint64_t v102 = *(void *)(a2 + v101);
            if (v102 == -1 || v102 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v102);
              *(void *)(a2 + v101) = v102 + 1;
              v100 |= (unint64_t)(v103 & 0x7F) << v98;
              if (v103 < 0)
              {
                v98 += 7;
                BOOL v14 = v99++ >= 9;
                if (v14)
                {
                  uint64_t v100 = 0;
                  goto LABEL_466;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v100 = 0;
          }
LABEL_466:
          BOOL v177 = v100 != 0;
          uint64_t v178 = 1670;
          goto LABEL_515;
        case 0x5Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 880;
          goto LABEL_408;
        case 0x5Eu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 888;
          goto LABEL_408;
        case 0x60u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 968;
          goto LABEL_408;
        case 0x61u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 976;
          goto LABEL_408;
        case 0x62u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 984;
          goto LABEL_408;
        case 0x63u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1016;
          goto LABEL_408;
        case 0x64u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1024;
          goto LABEL_408;
        case 0x65u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1032;
          goto LABEL_408;
        case 0x66u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1040;
          goto LABEL_408;
        case 0x67u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1048;
          goto LABEL_408;
        case 0x68u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1056;
          goto LABEL_408;
        case 0x69u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1064;
          goto LABEL_408;
        case 0x6Au:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1072;
          goto LABEL_408;
        case 0x6Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1080;
          goto LABEL_408;
        case 0x6Cu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1088;
          goto LABEL_408;
        case 0x6Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1096;
          goto LABEL_408;
        case 0x6Eu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1104;
          goto LABEL_408;
        case 0x6Fu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1112;
          goto LABEL_408;
        case 0x70u:
          char v104 = 0;
          unsigned int v105 = 0;
          uint64_t v106 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x10000u;
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
              v106 |= (unint64_t)(v109 & 0x7F) << v104;
              if (v109 < 0)
              {
                v104 += 7;
                BOOL v14 = v105++ >= 9;
                if (v14)
                {
                  uint64_t v106 = 0;
                  goto LABEL_470;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v106 = 0;
          }
LABEL_470:
          BOOL v177 = v106 != 0;
          uint64_t v178 = 1671;
          goto LABEL_515;
        case 0x71u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1120;
          goto LABEL_408;
        case 0x72u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1128;
          goto LABEL_408;
        case 0x73u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1136;
          goto LABEL_408;
        case 0x74u:
          char v110 = 0;
          unsigned int v111 = 0;
          uint64_t v112 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x20000u;
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
                  goto LABEL_474;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v112 = 0;
          }
LABEL_474:
          BOOL v177 = v112 != 0;
          uint64_t v178 = 1672;
          goto LABEL_515;
        case 0x75u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1144;
          goto LABEL_408;
        case 0x76u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1152;
          goto LABEL_408;
        case 0x77u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1160;
          goto LABEL_408;
        case 0x78u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1168;
          goto LABEL_408;
        case 0x79u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1176;
          goto LABEL_408;
        case 0x7Au:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1184;
          goto LABEL_408;
        case 0x7Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1200;
          goto LABEL_408;
        case 0x7Cu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1208;
          goto LABEL_408;
        case 0x7Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1224;
          goto LABEL_408;
        case 0x7Eu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1256;
          goto LABEL_408;
        case 0x7Fu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1264;
          goto LABEL_408;
        case 0x80u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1272;
          goto LABEL_408;
        case 0x81u:
          char v116 = 0;
          unsigned int v117 = 0;
          uint64_t v118 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x40000u;
          while (2)
          {
            uint64_t v119 = *v3;
            unint64_t v120 = *(void *)(a2 + v119);
            if (v120 == -1 || v120 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v121 = *(unsigned char *)(*(void *)(a2 + *v7) + v120);
              *(void *)(a2 + v119) = v120 + 1;
              v118 |= (unint64_t)(v121 & 0x7F) << v116;
              if (v121 < 0)
              {
                v116 += 7;
                BOOL v14 = v117++ >= 9;
                if (v14)
                {
                  uint64_t v118 = 0;
                  goto LABEL_478;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v118 = 0;
          }
LABEL_478:
          BOOL v177 = v118 != 0;
          uint64_t v178 = 1673;
          goto LABEL_515;
        case 0x82u:
          char v122 = 0;
          unsigned int v123 = 0;
          uint64_t v124 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x80000u;
          while (2)
          {
            uint64_t v125 = *v3;
            unint64_t v126 = *(void *)(a2 + v125);
            if (v126 == -1 || v126 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v127 = *(unsigned char *)(*(void *)(a2 + *v7) + v126);
              *(void *)(a2 + v125) = v126 + 1;
              v124 |= (unint64_t)(v127 & 0x7F) << v122;
              if (v127 < 0)
              {
                v122 += 7;
                BOOL v14 = v123++ >= 9;
                if (v14)
                {
                  uint64_t v124 = 0;
                  goto LABEL_482;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v124 = 0;
          }
LABEL_482:
          BOOL v177 = v124 != 0;
          uint64_t v178 = 1674;
          goto LABEL_515;
        case 0x83u:
          char v128 = 0;
          unsigned int v129 = 0;
          uint64_t v130 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x100000u;
          while (2)
          {
            uint64_t v131 = *v3;
            unint64_t v132 = *(void *)(a2 + v131);
            if (v132 == -1 || v132 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v133 = *(unsigned char *)(*(void *)(a2 + *v7) + v132);
              *(void *)(a2 + v131) = v132 + 1;
              v130 |= (unint64_t)(v133 & 0x7F) << v128;
              if (v133 < 0)
              {
                v128 += 7;
                BOOL v14 = v129++ >= 9;
                if (v14)
                {
                  uint64_t v130 = 0;
                  goto LABEL_486;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v130 = 0;
          }
LABEL_486:
          BOOL v177 = v130 != 0;
          uint64_t v178 = 1675;
          goto LABEL_515;
        case 0x84u:
          char v134 = 0;
          unsigned int v135 = 0;
          uint64_t v136 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x200000u;
          while (2)
          {
            uint64_t v137 = *v3;
            unint64_t v138 = *(void *)(a2 + v137);
            if (v138 == -1 || v138 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v139 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
              *(void *)(a2 + v137) = v138 + 1;
              v136 |= (unint64_t)(v139 & 0x7F) << v134;
              if (v139 < 0)
              {
                v134 += 7;
                BOOL v14 = v135++ >= 9;
                if (v14)
                {
                  uint64_t v136 = 0;
                  goto LABEL_490;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v136 = 0;
          }
LABEL_490:
          BOOL v177 = v136 != 0;
          uint64_t v178 = 1676;
          goto LABEL_515;
        case 0x85u:
          char v140 = 0;
          unsigned int v141 = 0;
          uint64_t v142 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x400000u;
          while (2)
          {
            uint64_t v143 = *v3;
            unint64_t v144 = *(void *)(a2 + v143);
            if (v144 == -1 || v144 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v145 = *(unsigned char *)(*(void *)(a2 + *v7) + v144);
              *(void *)(a2 + v143) = v144 + 1;
              v142 |= (unint64_t)(v145 & 0x7F) << v140;
              if (v145 < 0)
              {
                v140 += 7;
                BOOL v14 = v141++ >= 9;
                if (v14)
                {
                  uint64_t v142 = 0;
                  goto LABEL_494;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v142 = 0;
          }
LABEL_494:
          BOOL v177 = v142 != 0;
          uint64_t v178 = 1677;
          goto LABEL_515;
        case 0x86u:
          char v146 = 0;
          unsigned int v147 = 0;
          uint64_t v148 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x800000u;
          while (2)
          {
            uint64_t v149 = *v3;
            unint64_t v150 = *(void *)(a2 + v149);
            if (v150 == -1 || v150 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v151 = *(unsigned char *)(*(void *)(a2 + *v7) + v150);
              *(void *)(a2 + v149) = v150 + 1;
              v148 |= (unint64_t)(v151 & 0x7F) << v146;
              if (v151 < 0)
              {
                v146 += 7;
                BOOL v14 = v147++ >= 9;
                if (v14)
                {
                  uint64_t v148 = 0;
                  goto LABEL_498;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v148 = 0;
          }
LABEL_498:
          BOOL v177 = v148 != 0;
          uint64_t v178 = 1678;
          goto LABEL_515;
        case 0x87u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1288;
          goto LABEL_408;
        case 0x88u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1296;
          goto LABEL_408;
        case 0x89u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1304;
          goto LABEL_408;
        case 0x8Au:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1312;
          goto LABEL_408;
        case 0x8Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1320;
          goto LABEL_408;
        case 0x8Cu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1328;
          goto LABEL_408;
        case 0x8Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1336;
          goto LABEL_408;
        case 0x8Eu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1344;
          goto LABEL_408;
        case 0x8Fu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1376;
          goto LABEL_408;
        case 0x90u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1384;
          goto LABEL_408;
        case 0x91u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1392;
          goto LABEL_408;
        case 0x92u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1416;
          goto LABEL_408;
        case 0x93u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1432;
          goto LABEL_408;
        case 0x94u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1440;
          goto LABEL_408;
        case 0x95u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1456;
          goto LABEL_408;
        case 0x96u:
          char v152 = 0;
          unsigned int v153 = 0;
          uint64_t v154 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x1000000u;
          while (2)
          {
            uint64_t v155 = *v3;
            unint64_t v156 = *(void *)(a2 + v155);
            if (v156 == -1 || v156 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v157 = *(unsigned char *)(*(void *)(a2 + *v7) + v156);
              *(void *)(a2 + v155) = v156 + 1;
              v154 |= (unint64_t)(v157 & 0x7F) << v152;
              if (v157 < 0)
              {
                v152 += 7;
                BOOL v14 = v153++ >= 9;
                if (v14)
                {
                  uint64_t v154 = 0;
                  goto LABEL_502;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v154 = 0;
          }
LABEL_502:
          BOOL v177 = v154 != 0;
          uint64_t v178 = 1679;
          goto LABEL_515;
        case 0x97u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1472;
          goto LABEL_408;
        case 0x98u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1480;
          goto LABEL_408;
        case 0x99u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1488;
          goto LABEL_408;
        case 0x9Au:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1496;
          goto LABEL_408;
        case 0x9Bu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1504;
          goto LABEL_408;
        case 0x9Cu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1512;
          goto LABEL_408;
        case 0x9Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1520;
          goto LABEL_408;
        case 0x9Fu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1544;
          goto LABEL_408;
        case 0xA0u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1552;
          goto LABEL_408;
        case 0xA1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1560;
          goto LABEL_408;
        case 0xA2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1568;
          goto LABEL_408;
        case 0xA3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1576;
          goto LABEL_408;
        case 0xA4u:
          char v158 = 0;
          unsigned int v159 = 0;
          uint64_t v160 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x2000000u;
          while (2)
          {
            uint64_t v161 = *v3;
            unint64_t v162 = *(void *)(a2 + v161);
            if (v162 == -1 || v162 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v163 = *(unsigned char *)(*(void *)(a2 + *v7) + v162);
              *(void *)(a2 + v161) = v162 + 1;
              v160 |= (unint64_t)(v163 & 0x7F) << v158;
              if (v163 < 0)
              {
                v158 += 7;
                BOOL v14 = v159++ >= 9;
                if (v14)
                {
                  uint64_t v160 = 0;
                  goto LABEL_506;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v160 = 0;
          }
LABEL_506:
          BOOL v177 = v160 != 0;
          uint64_t v178 = 1680;
          goto LABEL_515;
        case 0xA5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1584;
          goto LABEL_408;
        case 0xA6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1592;
          goto LABEL_408;
        case 0xA7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1600;
          goto LABEL_408;
        case 0xA8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1608;
          goto LABEL_408;
        case 0xA9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1616;
          goto LABEL_408;
        case 0xAAu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1624;
          goto LABEL_408;
        case 0xABu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1632;
          goto LABEL_408;
        case 0xACu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1640;
          goto LABEL_408;
        case 0xADu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1648;
          goto LABEL_408;
        case 0xAEu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 144;
          goto LABEL_408;
        case 0xAFu:
          char v164 = 0;
          unsigned int v165 = 0;
          uint64_t v166 = 0;
          *(_DWORD *)(a1 + 1684) |= 2u;
          while (2)
          {
            uint64_t v167 = *v3;
            unint64_t v168 = *(void *)(a2 + v167);
            if (v168 == -1 || v168 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v169 = *(unsigned char *)(*(void *)(a2 + *v7) + v168);
              *(void *)(a2 + v167) = v168 + 1;
              v166 |= (unint64_t)(v169 & 0x7F) << v164;
              if (v169 < 0)
              {
                v164 += 7;
                BOOL v14 = v165++ >= 9;
                if (v14)
                {
                  uint64_t v166 = 0;
                  goto LABEL_510;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v166 = 0;
          }
LABEL_510:
          BOOL v177 = v166 != 0;
          uint64_t v178 = 1656;
          goto LABEL_515;
        case 0xB0u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 952;
          goto LABEL_408;
        case 0xB1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 96;
          goto LABEL_408;
        case 0xB2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 104;
          goto LABEL_408;
        case 0xB3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 216;
          goto LABEL_408;
        case 0xB4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 224;
          goto LABEL_408;
        case 0xB5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 248;
          goto LABEL_408;
        case 0xB6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 256;
          goto LABEL_408;
        case 0xB7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 264;
          goto LABEL_408;
        case 0xB8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 272;
          goto LABEL_408;
        case 0xB9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 280;
          goto LABEL_408;
        case 0xBAu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 288;
          goto LABEL_408;
        case 0xBBu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 416;
          goto LABEL_408;
        case 0xBCu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 432;
          goto LABEL_408;
        case 0xBDu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 464;
          goto LABEL_408;
        case 0xBEu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 544;
          goto LABEL_408;
        case 0xBFu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 560;
          goto LABEL_408;
        case 0xC0u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 864;
          goto LABEL_408;
        case 0xC1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 632;
          goto LABEL_408;
        case 0xC2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 896;
          goto LABEL_408;
        case 0xC3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 904;
          goto LABEL_408;
        case 0xC4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1448;
          goto LABEL_408;
        case 0xC5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1216;
          goto LABEL_408;
        case 0xC6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 648;
          goto LABEL_408;
        case 0xC7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 920;
          goto LABEL_408;
        case 0xC8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 912;
          goto LABEL_408;
        case 0xC9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 960;
          goto LABEL_408;
        case 0xCAu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 944;
          goto LABEL_408;
        case 0xCBu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1464;
          goto LABEL_408;
        case 0xCCu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1232;
          goto LABEL_408;
        case 0xCDu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1248;
          goto LABEL_408;
        case 0xCEu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1240;
          goto LABEL_408;
        case 0xCFu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 664;
          goto LABEL_408;
        case 0xD0u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 656;
          goto LABEL_408;
        case 0xD1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 992;
          goto LABEL_408;
        case 0xD2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1008;
          goto LABEL_408;
        case 0xD3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1000;
          goto LABEL_408;
        case 0xD4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 936;
          goto LABEL_408;
        case 0xD5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 928;
          goto LABEL_408;
        case 0xD6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 472;
          goto LABEL_408;
        case 0xD7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 480;
          goto LABEL_408;
        case 0xD8u:
          char v170 = 0;
          unsigned int v171 = 0;
          uint64_t v172 = 0;
          *(_DWORD *)(a1 + 1684) |= 0x100u;
          break;
        case 0xD9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 840;
          goto LABEL_408;
        case 0xDAu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 608;
          goto LABEL_408;
        case 0xDBu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 696;
          goto LABEL_408;
        case 0xDCu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1424;
          goto LABEL_408;
        case 0xDDu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1192;
          goto LABEL_408;
        case 0xDEu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1280;
          goto LABEL_408;
        case 0xDFu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 768;
          goto LABEL_408;
        case 0xE0u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 776;
          goto LABEL_408;
        case 0xE1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 784;
          goto LABEL_408;
        case 0xE2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 816;
          goto LABEL_408;
        case 0xE3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 824;
          goto LABEL_408;
        case 0xE4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1352;
          goto LABEL_408;
        case 0xE5u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1360;
          goto LABEL_408;
        case 0xE6u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1368;
          goto LABEL_408;
        case 0xE7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1400;
          goto LABEL_408;
        case 0xE8u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1408;
          goto LABEL_408;
        case 0xE9u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1528;
          goto LABEL_408;
        case 0xEAu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 1536;
LABEL_408:
          v176 = *(void **)(a1 + v24);
          *(void *)(a1 + v24) = v23;

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
        uint64_t v173 = *v3;
        unint64_t v174 = *(void *)(a2 + v173);
        if (v174 == -1 || v174 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v175 = *(unsigned char *)(*(void *)(a2 + *v7) + v174);
        *(void *)(a2 + v173) = v174 + 1;
        v172 |= (unint64_t)(v175 & 0x7F) << v170;
        if ((v175 & 0x80) == 0) {
          goto LABEL_512;
        }
        v170 += 7;
        BOOL v14 = v171++ >= 9;
        if (v14)
        {
          uint64_t v172 = 0;
          goto LABEL_514;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_512:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v172 = 0;
      }
LABEL_514:
      BOOL v177 = v172 != 0;
      uint64_t v178 = 1663;
LABEL_515:
      *(unsigned char *)(a1 + v178) = v177;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_2194452B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2194454B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_219445E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void SocketReadCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    SocketReadCallback_cold_5();
  }
  if ([v9 socket] != a1) {
    SocketReadCallback_cold_4();
  }
  if (a2 != 1) {
    SocketReadCallback_cold_3();
  }
  if (a3) {
    SocketReadCallback_cold_2();
  }
  if (a4) {
    SocketReadCallback_cold_1();
  }
  [v9 readData];
}

void HostResolveCallback(uint64_t a1, int a2, void *a3, void *a4)
{
  unint64_t v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    HostResolveCallback_cold_3();
  }
  if ([(dispatch_source_t *)v10 host] != a1) {
    HostResolveCallback_cold_2();
  }
  if (a2) {
    HostResolveCallback_cold_1();
  }
  v7 = v10;
  char v8 = v10[1];
  if (v8 && (intptr_t v9 = dispatch_source_testcancel(v10[1]), v7 = v10, !v9))
  {
    dispatch_source_cancel(v8);
    v7 = v10;
    if (!a3) {
      goto LABEL_10;
    }
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  if (*a3)
  {
    -[dispatch_source_t didFailWithHostStreamError:](v7, "didFailWithHostStreamError:", *a3, a3[1]);
    goto LABEL_11;
  }
LABEL_10:
  [(dispatch_source_t *)v7 hostResolutionDone];
LABEL_11:
}

void sub_219448EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

void sub_21944A0C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21944B9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,id a57,char a58)
{
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

void sub_21944BCF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21944C01C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21944C128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21944CCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21944CEA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_219451B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219451D4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SocketReadCallback_cold_1()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 632, "data == nil");
}

void SocketReadCallback_cold_2()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 630, "address == nil");
}

void SocketReadCallback_cold_3()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 628, "type == kCFSocketReadCallBack");
}

void SocketReadCallback_cold_4()
{
  __assert_rtn("SocketReadCallback", "SimplePing.m", 626, "s == obj.socket");
}

void SocketReadCallback_cold_5()
{
}

void HostResolveCallback_cold_1()
{
  __assert_rtn("HostResolveCallback", "SimplePing.m", 778, "typeInfo == kCFHostAddresses");
}

void HostResolveCallback_cold_2()
{
  __assert_rtn("HostResolveCallback", "SimplePing.m", 776, "theHost == obj.host");
}

void HostResolveCallback_cold_3()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFHostRef CFHostCreateWithName(CFAllocatorRef allocator, CFStringRef hostname)
{
  return (CFHostRef)MEMORY[0x270EE28D8](allocator, hostname);
}

CFArrayRef CFHostGetAddressing(CFHostRef theHost, Boolean *hasBeenResolved)
{
  return (CFArrayRef)MEMORY[0x270EE28E0](theHost, hasBeenResolved);
}

void CFHostScheduleWithRunLoop(CFHostRef theHost, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

Boolean CFHostSetClient(CFHostRef theHost, CFHostClientCallBack clientCB, CFHostClientContext *clientContext)
{
  return MEMORY[0x270EE28F0](theHost, clientCB, clientContext);
}

Boolean CFHostStartInfoResolution(CFHostRef theHost, CFHostInfoType info, CFStreamError *error)
{
  return MEMORY[0x270EE28F8](theHost, *(void *)&info, error);
}

void CFHostUnscheduleFromRunLoop(CFHostRef theHost, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4FC8](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x270EE4FD0](allocator, *(void *)&sock, callBackTypes, callout, context);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return MEMORY[0x270EE4FE8](s);
}

CFOptionFlags CFSocketGetSocketFlags(CFSocketRef s)
{
  return MEMORY[0x270EE4FF0](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x270EF4930]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x270EF4948]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

uint64_t W5DescriptionForAWDLScheduleState()
{
  return MEMORY[0x270F85858]();
}

uint64_t W5DescriptionForAWDLSyncChannelSequence()
{
  return MEMORY[0x270F85860]();
}

uint64_t W5DescriptionForAWDLSyncState()
{
  return MEMORY[0x270F85868]();
}

uint64_t W5DescriptionForBTCMode()
{
  return MEMORY[0x270F85870]();
}

uint64_t W5DescriptionForBatteryWarningLevel()
{
  return MEMORY[0x270F85878]();
}

uint64_t W5DescriptionForChainAck()
{
  return MEMORY[0x270F85880]();
}

uint64_t W5DescriptionForDesense()
{
  return MEMORY[0x270F85888]();
}

uint64_t W5DescriptionForEAPOLControlMode()
{
  return MEMORY[0x270F85890]();
}

uint64_t W5DescriptionForEAPOLSupplicantState()
{
  return MEMORY[0x270F85898]();
}

uint64_t W5DescriptionForOpMode()
{
  return MEMORY[0x270F858A0]();
}

uint64_t W5DescriptionForPHYMode()
{
  return MEMORY[0x270F858A8]();
}

uint64_t W5DescriptionForPower()
{
  return MEMORY[0x270F858B0]();
}

uint64_t W5DescriptionForPowerSourceType()
{
  return MEMORY[0x270F858B8]();
}

uint64_t W5DescriptionForPowerStateCaps()
{
  return MEMORY[0x270F858C0]();
}

uint64_t W5DescriptionForSecurity()
{
  return MEMORY[0x270F858C8]();
}

uint64_t WISPostMetric()
{
  return MEMORY[0x270F858E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x270EE87B0]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x270EE8808]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint64_t ne_session_create()
{
  return MEMORY[0x270EDA630]();
}

uint64_t ne_session_get_info()
{
  return MEMORY[0x270EDA638]();
}

uint64_t ne_session_get_status()
{
  return MEMORY[0x270EDA640]();
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x270EF7998]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x270EF79A8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x270EF79C8]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x270EF7A10]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x270EF7A28]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x270EF83A0](interface);
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

uint64_t nw_path_get_estimated_download_throughput()
{
  return MEMORY[0x270EF88D0]();
}

uint64_t nw_path_get_estimated_upload_throughput()
{
  return MEMORY[0x270EF88D8]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

nw_path_monitor_t nw_path_monitor_create_with_type(nw_interface_type_t required_interface_type)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A10](*(void *)&required_interface_type);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x270EDB198](*(void *)&a1, a2, a3, *(void *)&a4, a5, a6);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x270EDB3C0](*(void *)&a1, a2, a3, *(void *)&a4, a5, *(void *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}