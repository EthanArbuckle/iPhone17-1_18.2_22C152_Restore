void sub_1000025AC(uint64_t a1)
{
  CFDictionaryRef v2;
  io_service_t MatchingService;
  id v4;
  NSData *v5;
  NSData *v6;
  CFTypeRef v7;
  CFTypeRef v8;
  const void *v9;
  BOOL v10;
  CFTypeID v11;
  CFTypeID v12;
  const UInt8 *BytePtr;
  const char *v14;
  const UInt8 *v15;
  const char *v16;
  id v17;
  id v18;
  NSData *v19;
  NSData *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char __str[1024];

  v24 = 255;
  v2 = IOServiceNameMatching("AppleH10CamIn");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  v23 = 0;
  v4 = [[+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor") copyPathForPersonalizedData:0 error:&v23];
  v5 = +[NSData dataWithContentsOfFile:@"/private/var/tmp/usr/standalone/firmware/Savage/SavagePatch.DAT"];
  if (a1)
  {
    v6 = v5;
    if (sub_10001BA04(a1, &v24))
    {
      if (v6)
      {
        NSLog(@"Found Savage override DAT file, which takes precedence over all others - %@", @"/private/var/tmp/usr/standalone/firmware/Savage/SavagePatch.DAT");
        v9 = 0;
        v7 = 0;
      }
      else
      {
        if (!v4)
        {
          NSLog(@"Personalized firmware root path accessor not found");
          return;
        }
        v7 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"SavageDeviceRev", kCFAllocatorDefault, 0);
        v8 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"SavageMNS", kCFAllocatorDefault, 0);
        v9 = v8;
        if (v7) {
          v10 = v8 == 0;
        }
        else {
          v10 = 1;
        }
        if (v10)
        {
          NSLog(@"IR sensor not detected");
          v21 = 0;
          if (!v9) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        v11 = CFGetTypeID(v7);
        if (v11 != CFDataGetTypeID()) {
          goto LABEL_37;
        }
        v12 = CFGetTypeID(v9);
        if (v12 != CFDataGetTypeID()) {
          goto LABEL_37;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)v7);
        v14 = "B3";
        if (BytePtr && (*BytePtr & 0xF0) == 0xA0) {
          v14 = "BA";
        }
        v15 = CFDataGetBytePtr((CFDataRef)v9);
        v16 = "Dev";
        if (v15 && *v15 == 10) {
          v16 = "Prod";
        }
        snprintf(__str, 0x400uLL, "Savage/SavagePatch%s%s.DAT", v14, v16);
        v17 = [v4 stringByAppendingPathComponent:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str)];
        NSLog(@"DAT file for unprovisioned Savage - %@", v17);
        v18 = [v4 stringByAppendingPathComponent:@"/Savage/SavagePatch.DAT"];
        NSLog(@"DAT file for provisioned Savage - %@", v18);
        v19 = +[NSData dataWithContentsOfFile:v17];
        if (!v19)
        {
          v20 = +[NSData dataWithContentsOfFile:v18];
          if (v20)
          {
            v6 = v20;
            goto LABEL_20;
          }
          NSLog(@"No DAT file for Savage found");
LABEL_37:
          v21 = 0;
LABEL_23:
          CFRelease(v9);
LABEL_24:
          if (v7) {
            CFRelease(v7);
          }
          if (v21) {
            free(v21);
          }
          goto LABEL_28;
        }
        v6 = v19;
        NSLog(@"Loading DAT file for unprovisioned Savage");
      }
LABEL_20:
      v21 = malloc_type_calloc([(NSData *)v6 length], 1uLL, 0x76D7A76FuLL);
      if (v21)
      {
        [(NSData *)v6 getBytes:v21 length:[(NSData *)v6 length]];
        v22 = sub_10001B81C(a1, v24 | 0x80000000, (uint64_t)v21, [(NSData *)v6 length], 5u);
        NSLog(@"Load Savage DAT File: Size = %ld; Status = %08x", [(NSData *)v6 length], v22);
      }
      if (!v9) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
LABEL_28:
  if (v4) {
}
  }

void sub_100002928(uint64_t a1)
{
  int v30 = 255;
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH10CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  uint64_t v29 = 0;
  id v4 = [[+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor") copyPathForPersonalizedData:0 error:&v29];
  v5 = +[NSData dataWithContentsOfFile:@"/private/var/tmp/usr/standalone/firmware/Yonkers/YonkersPatch.DAT"];
  if (a1)
  {
    v6 = v5;
    BOOL v7 = sub_10001B9A8(a1, &v30);
    if (v6)
    {
      NSLog(@"Found Yonkers override DAT file, which takes precedence over all others - %@", @"/private/var/tmp/usr/standalone/firmware/Yonkers/YonkersPatch.DAT");
      CFDataRef v10 = 0;
      CFTypeRef v8 = 0;
      goto LABEL_28;
    }
    if (v7)
    {
      if (!v4)
      {
        NSLog(@"Personalized firmware root path accessor not found");
        return;
      }
      CFTypeRef v8 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"YonkersFabRevision", kCFAllocatorDefault, 0);
      CFDataRef v9 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"YonkersMNS", kCFAllocatorDefault, 0);
      CFDataRef v10 = v9;
      if (v9) {
        BOOL v11 = v8 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        NSLog(@"Secure RGB sensor not detected");
        v27 = 0;
        if (!v10) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      CFTypeID v12 = CFGetTypeID(v9);
      if (v12 != CFDataGetTypeID()) {
        goto LABEL_45;
      }
      CFTypeID v13 = CFGetTypeID(v8);
      if (v13 != CFDataGetTypeID()) {
        goto LABEL_45;
      }
      BytePtr = CFDataGetBytePtr((CFDataRef)v8);
      if (!BytePtr
        || ((int v15 = __rev16(*(unsigned __int16 *)BytePtr), v16 = 1, v15 > 59904)
          ? (BOOL v17 = v15 == 59905, v18 = 61953)
          : (BOOL v17 = v15 == 54529, v18 = 56577),
            !v17 ? (BOOL v19 = v15 == v18) : (BOOL v19 = 1),
            !v19))
      {
        int v16 = 0;
      }
      v20 = CFDataGetBytePtr(v10);
      v21 = "Dev";
      if (v20 && *v20 == 8) {
        v21 = "Prod";
      }
      v22 = "Ymgt";
      if (!v16) {
        v22 = "Ngsk";
      }
      snprintf(__str, 0x400uLL, "Yonkers/YonkersPatch%s%s.DAT", v22, v21);
      id v23 = [[v4 stringByAppendingPathComponent:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str)];
      NSLog(@"DAT file for unprovisioned Yonkers - %@", v23);
      id v24 = [v4 stringByAppendingPathComponent:@"/Yonkers/YonkersPatch.DAT"];
      NSLog(@"DAT file for provisioned Yonkers - %@", v24);
      v25 = +[NSData dataWithContentsOfFile:v23];
      if (!v25)
      {
        v26 = +[NSData dataWithContentsOfFile:v24];
        if (v26)
        {
          v6 = v26;
          goto LABEL_28;
        }
        NSLog(@"No DAT file for Yonkers found");
LABEL_45:
        v27 = 0;
LABEL_31:
        CFRelease(v10);
LABEL_32:
        if (v8) {
          CFRelease(v8);
        }
        if (v27) {
          free(v27);
        }
        goto LABEL_36;
      }
      v6 = v25;
      NSLog(@"Loading DAT file for unprovisioned Yonkers");
LABEL_28:
      v27 = malloc_type_calloc([(NSData *)v6 length], 1uLL, 0x5BBDADB3uLL);
      if (v27)
      {
        [(NSData *)v6 getBytes:v27 length:[(NSData *)v6 length]];
        uint64_t v28 = sub_10001B81C(a1, v30 | 0x80000000, (uint64_t)v27, [(NSData *)v6 length], 5u);
        NSLog(@"Load Yonkers DAT File: Size = %ld; Status = %08x", [(NSData *)v6 length], v28);
      }
      if (!v10) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
LABEL_36:
  if (v4) {
}
  }

void sub_100002CDC(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    sub_10001CF98();
  }
  if (!a2) {
    sub_10001CFC4();
  }
  bzero((void *)(a2 + 469800), 0x4424uLL);
  *(_DWORD *)(a2 + 469796) = *(_DWORD *)(a2 + 284);
  switch(*(_DWORD *)(a2 + 4))
  {
    case 0:
      sub_10001D01C();
    case 1:
      sub_10001D048();
    case 2:
      v75[0] = 0uLL;
      v73[0] = a1;
      v73[1] = 0;
      sub_10000323C((uint64_t)v75, (uint64_t)v73, a2);
      return;
    case 3:
      sub_10001D074();
    case 4:
      if (!*(_DWORD *)(a2 + 688)) {
        return;
      }
      uint64_t v4 = *(unsigned __int16 *)(a2 + 32);
      uint64_t v5 = *(unsigned __int16 *)(a2 + 34);
      if ((v5 * v4) >= 0x81) {
        sub_10001D0A0();
      }
      bzero((void *)(a2 + 427300), 0x3800uLL);
      int v7 = *(unsigned __int16 *)(a2 + 250) - *(unsigned __int16 *)(a2 + 246);
      if (!v7)
      {
        __int16 v14 = *(_WORD *)(a2 + 704);
        if (!v5) {
          goto LABEL_72;
        }
LABEL_33:
        uint64_t v32 = 0;
        float v33 = *(float *)(a2 + 288);
        float v34 = *(float *)(a2 + 292);
        float v35 = *(float *)(a2 + 296);
        float v36 = (float)v14;
        LOWORD(v6) = *(_WORD *)(a2 + 706);
        float v37 = (float)v6 * 0.000030518;
        float v38 = (float)(100 - *(_DWORD *)(a2 + 700)) / 200.0;
        unint64_t v39 = (unint64_t)*(unsigned __int16 *)(a2 + 708) >> 1;
        uint64_t v40 = -(uint64_t)v39;
        uint64_t v72 = a2 + 112 * (int)v39 * (uint64_t)~v4 + 427300;
        uint64_t v41 = 112 * v4;
        float v42 = 1.0 - v38;
        while (!v4)
        {
LABEL_71:
          ++v32;
          ++v40;
          v72 += v41;
          if (v32 == v5) {
            goto LABEL_72;
          }
        }
        uint64_t v43 = 0;
        unsigned int v44 = *(_DWORD *)(a2 + 696);
        uint64_t v45 = -(uint64_t)v39;
        uint64_t v46 = v72;
        while (1)
        {
          uint64_t v47 = v46;
          uint64_t v48 = v40;
          memset(v75, 0, sizeof(v75));
          do
          {
            if (v48 < v5)
            {
              uint64_t v49 = v47;
              uint64_t v50 = v45;
              do
              {
                if (v50 < v4)
                {
                  for (uint64_t i = 0; i != 112; i += 8)
                    *(int32x2_t *)((char *)v75 + i) = vadd_s32(*(int32x2_t *)((char *)v75 + i), *(int32x2_t *)(v49 + i));
                }
                v49 += 112;
                BOOL v52 = v50++ < (uint64_t)(v43 + v39);
              }
              while (v52);
            }
            v47 += v41;
            BOOL v52 = v48++ < (uint64_t)(v32 + v39);
          }
          while (v52);
          float v53 = (float)DWORD1(v75[0]);
          *(float *)v73 = (float)DWORD1(v75[0]);
          v54 = (unsigned int *)v75 + 3;
          for (uint64_t j = 4; j != 56; j += 4)
          {
            unsigned int v56 = *v54;
            v54 += 2;
            float v53 = v53 + (float)v56;
            *(float *)((char *)v73 + j) = v53;
          }
          if (v74 != 0.0)
          {
            for (uint64_t k = 0; k != 56; k += 4)
              *(float *)((char *)v73 + k) = *(float *)((char *)v73 + k) / v74;
          }
          uint64_t v58 = 0;
          __int16 v59 = 0;
          __int16 v60 = 13;
          do
          {
            float v61 = *((float *)v73 + v58);
            if (v61 <= v38 && *((float *)v73 + v58 + 1) > v38) {
              __int16 v59 = v58 + 1;
            }
            if (v61 < v42 && *((float *)v73 + v58 + 1) >= v42) {
              __int16 v60 = v58 + 1;
            }
            ++v58;
          }
          while (v58 != 13);
          if (v59 > v60) {
            break;
          }
          unsigned int v62 = 0;
          uint64_t v63 = v60 - (uint64_t)v59 + 1;
          v64 = (int *)v75 + 2 * v59 + 1;
          float v65 = 0.0;
          do
          {
            float v65 = v65 + (float)*(v64 - 1);
            int v66 = *v64;
            v64 += 2;
            v62 += v66;
            --v63;
          }
          while (v63);
          if (!v62) {
            goto LABEL_63;
          }
          float v67 = -(float)((float)((float)(v65 / (float)v62) + v36) * v37);
LABEL_64:
          float v68 = v34 * (float)(v67 - v33);
          if (v62 >= v44) {
            int v69 = 0x3FFF;
          }
          else {
            int v69 = 0;
          }
          *(_DWORD *)(a2 + 52 * (v43 + v32 * v4) + 480040) = v62;
          *(_DWORD *)(a2 + 52 * (v43 + v32 * v4) + 480044) = v69;
          float v70 = v35 * v68;
          if (v62 >= v44) {
            char v71 = -96;
          }
          else {
            char v71 = -120;
          }
          *(float *)(a2 + 52 * (v43 + v32 * v4) + 480048) = v70;
          *(_DWORD *)(a2 + 52 * (v43 + v32 * v4) + 480052) = 0;
          *(_DWORD *)(a2 + 52 * (v43 + v32 * v4) + 480056) = 0;
          *(unsigned char *)(a2 + 52 * (v43 + v32 * v4) + 480060) = v71;
          ++v43;
          ++v45;
          v46 += 112;
          if (v43 == v4) {
            goto LABEL_71;
          }
        }
        unsigned int v62 = 0;
LABEL_63:
        float v67 = 0.0;
        goto LABEL_64;
      }
      int v8 = 0;
      int v9 = *(unsigned __int16 *)(a2 + 254);
      uint64_t v10 = *(unsigned __int16 *)(a2 + 252);
      int v11 = *(unsigned __int16 *)(a2 + 248) - *(unsigned __int16 *)(a2 + 244);
      uint64_t v12 = a1 + *(unsigned __int16 *)(a2 + 246) * v10 + 2 * *(unsigned __int16 *)(a2 + 244);
      int v13 = *(__int16 *)(a2 + 704);
      __int16 v14 = *(_WORD *)(a2 + 704);
      uint64_t v15 = a2 + 427300 + 112 * -(int)v4;
      int v16 = *(unsigned __int16 *)(a2 + 256);
      do
      {
        if (v8)
        {
          unsigned int v17 = 0;
        }
        else
        {
          int v8 = v16;
          unsigned int v17 = v4;
        }
        v15 += 112 * v17;
        if (v11 >= 1)
        {
          uint64_t v18 = 0;
          int v19 = 0;
          uint64_t v20 = v15 - 112;
          int v21 = v11 + 1;
          do
          {
            BOOL v22 = v19 == 0;
            if (!v19) {
              int v19 = v9;
            }
            v20 += 112 * v22;
            int v23 = *(unsigned __int16 *)(v12 + v18);
            if (v23 != 0x3FFF)
            {
              int v24 = v23 + v13;
              unsigned int v25 = v24 ^ (v24 >> 31);
              unsigned int v26 = 32 - __clz(v25);
              if (v25) {
                unsigned int v27 = v26;
              }
              else {
                unsigned int v27 = 0;
              }
              int v28 = v27 ^ (v24 >> 31);
              if (v28 >= 6) {
                int v29 = 6;
              }
              else {
                int v29 = v28;
              }
              int v30 = v29 + 7;
              if (v28 >= -7) {
                unsigned int v31 = v30;
              }
              else {
                unsigned int v31 = 0;
              }
              *(int32x2_t *)(v20 + 8 * v31) = vadd_s32(*(int32x2_t *)(v20 + 8 * v31), (int32x2_t)(*(unsigned __int16 *)(v12 + v18) | 0x100000000));
            }
            --v19;
            --v21;
            v18 += 2;
          }
          while (v21 > 1);
        }
        v12 += v10;
        --v8;
        --v7;
      }
      while (v7);
      if (v5) {
        goto LABEL_33;
      }
LABEL_72:
      sub_100009A40(a2);
      return;
    default:
      sub_10001CFF0();
  }
}

uint64_t sub_10000323C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned __int16 *)(a3 + 34) * *(unsigned __int16 *)(a3 + 32) >= 0x81) {
    sub_10001D0CC();
  }
  unsigned int v4 = *(_DWORD *)(a3 + 8);
  if (v4 >= 2) {
    sub_10001D7B0();
  }
  v1043 = (unsigned int *)(a3 + 487244);
  unint64_t v7 = a3 + 12;
  unsigned int v8 = *(_DWORD *)(a3 + 4);
  v1037 = (int16x8_t *)(a3 + 12);
  int v1163 = *(_DWORD *)(a3 + 8);
  __dst = (void *)a2;
  if (v8 < 2)
  {
    uint64_t v1074 = a1;
    sub_10000A000(v7, a1, a2, (uint64_t)&v1177);
    unsigned int v1157 = *(unsigned __int16 *)(a3 + 32);
    if (v4 != 1)
    {
      unsigned int v67 = *(_DWORD *)(a3 + 12);
      if (v67 > 4) {
        sub_10001D150();
      }
      uint64_t v68 = a3 + 6948;
      if (v67 != 2)
      {
        int v69 = *(_DWORD *)(a3 + 20);
        int v70 = *(_DWORD *)(a3 + 28);
        v1168.i32[0] = 0;
        int v71 = 2 * v69;
        int v1134 = 2 * v70;
        switch(v67)
        {
          case 0u:
            if (v71)
            {
              int8x8_t v72 = (int8x8_t)vdup_n_s32(0x7FF8u);
              int v73 = 2 * v70;
              do
              {
                int v74 = v1179;
                int v75 = *(_DWORD *)(a3 + 16);
                if (v75 >= 1)
                {
                  int v76 = 0;
                  int v77 = *(_DWORD *)(a3 + 24);
                  uint64_t v78 = v68 - 404;
                  v80 = (unsigned __int16 *)*((void *)&v1180 + 1);
                  v79 = (unsigned __int16 *)v1181[0];
                  v81 = (unsigned __int16 *)v1185[3];
                  v82 = (unsigned __int16 *)v1185[4];
                  char v83 = *(unsigned char *)(a3 + 304);
                  int v84 = v1185[1];
                  int v85 = v75 + 1;
                  int v86 = DWORD2(v1179);
                  int v87 = v1185[0];
                  do
                  {
                    if (!v74)
                    {
                      int v74 = v87;
                      int v86 = v84;
                      v79 = v82;
                      v80 = v81;
                    }
                    BOOL v88 = v76 == 0;
                    if (!v76) {
                      int v76 = v77;
                    }
                    uint64_t v89 = v78 + 404 * v88;
                    unsigned int v90 = *v80;
                    unint64_t v91 = (unint64_t)v80[1] >> 4;
                    unsigned int v92 = *v79;
                    ++*(_DWORD *)(v89 + 384);
                    *(void *)(v89 + 388) += v91;
                    *(void *)(v89 + 396) += v91 * (unint64_t)v91;
                    if ((v92 & 4) == 0)
                    {
                      int v93 = (__int16)v79[1];
                      unsigned int v94 = v93 & 7;
                      if ((v92 & 1) != 0 || (((v93 & 7u) < 6) & (v92 >> 1)) != 0)
                      {
                        v109 = (_DWORD *)(v78 + 404 * v88 + 12 * v86);
                        ++v109[84];
                        v109[85] += v91;
                        v109[86] += v90 >> 4;
                      }
                      else
                      {
                        __int16 v95 = v94 > 5;
                        unsigned int v96 = v79[2];
                        uint64_t v97 = (v96 & 0xF) + 1;
                        unsigned int v98 = v96 >> 4;
                        int v99 = (__int16)v92 >> 3;
                        int v100 = v93 >> 3;
                        if (v93 < 0) {
                          int v100 = -v100;
                        }
                        if (v99 < 0) {
                          int v99 = -v99;
                        }
                        unsigned __int16 v101 = v94 - v95;
                        unsigned int v102 = (16 * (v100 & 0xFFFu)) >> v95;
                        unsigned int v103 = (v97 >> 1) * v98;
                        int v104 = 8 * v99;
                        if (((v93 ^ v92) & 0x8000u) == 0) {
                          unsigned __int16 v105 = v101 + 7;
                        }
                        else {
                          unsigned __int16 v105 = v101;
                        }
                        uint64_t v106 = v89 + 24 * v105;
                        v65.i32[0] = v102;
                        v107.i32[0] = vshr_n_u32(*(uint32x2_t *)v65.i8, 1uLL).u32[0];
                        v65.i32[1] = v104;
                        v107.i32[1] = vand_s8(*(int8x8_t *)&v65, v72).i32[1];
                        signed int v108 = (v107.i32[0] * v103) >> 15 << v83;
                        if (v108 <= -32768) {
                          signed int v108 = -32768;
                        }
                        if (v108 >= 0x7FFF) {
                          signed int v108 = 0x7FFF;
                        }
                        *(void *)v106 += v97;
                        uint64x2_t v65 = vaddw_u32(*(uint64x2_t *)(v106 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v108), v107), 0xFuLL));
                        *(uint64x2_t *)(v106 + 8) = v65;
                      }
                    }
                    v80 += 2;
                    v79 += 3;
                    --v74;
                    --v76;
                    ++v1168.i32[0];
                    v86 ^= 1u;
                    --v85;
                    uint64_t v78 = v89;
                  }
                  while (v85 > 1);
                }
                if (v74) {
                  sub_10001D414();
                }
                sub_10000AA54((uint64_t)&v1177);
                sub_10000AA54((uint64_t)&v1183);
                unsigned int v110 = v1157;
                if (v73 != 1) {
                  unsigned int v110 = 0;
                }
                v68 += 404 * v110;
                if (v73 == 1) {
                  int v73 = v1134;
                }
                else {
                  --v73;
                }
                --v71;
              }
              while (v71);
            }
            goto LABEL_847;
          case 1u:
            if (v71)
            {
              int v521 = 2 * v70;
              int v522 = -2 * v69;
              while (2)
              {
                sub_10000AB64((uint64_t)v1037, a3 + 300, 1, (int *)&v1179, (int *)v1185, v68, &v1168, *(double *)v65.i64, v66);
                sub_10000AA54((uint64_t)&v1177);
                sub_10000AA54((uint64_t)&v1183);
                sub_10000AB64((uint64_t)v1037, a3 + 300, 0, (int *)&v1181[1], (int *)&v1185[5], v68, &v1168, v523, v524);
                switch((int)v1177)
                {
                  case 0:
                  case 2:
                    sub_10001D46C();
                  case 1:
                  case 3:
                    *(void *)&long long v1182 = v1182 + 2 * (v1178 + *((void *)&v1177 + 1));
                    if (v1181[3])
                    {
                      --v1181[3];
                      uint64_t v525 = 2 * *((void *)&v1178 + 1);
                    }
                    else
                    {
                      uint64_t v525 = *((void *)&v1178 + 1);
                    }
                    *((void *)&v1182 + 1) += 2 * v525;
                    LODWORD(v526) = vadd_s32(*(int32x2_t *)((char *)&v1181[1] + 4), (int32x2_t)0x200000002).u32[0];
                    HIDWORD(v526) = veor_s8(*(int8x8_t *)(v1181 + 12), (int8x8_t)0x100000001).i32[1];
                    *(void *)((char *)&v1181[1] + 4) = v526;
                    switch((int)v1183)
                    {
                      case 0:
                      case 2:
                        sub_10001D46C();
                      case 1:
                      case 3:
                        *(void *)&long long v1186 = v1186 + 2 * (v1184 + *((void *)&v1183 + 1));
                        if (v1185[7])
                        {
                          --v1185[7];
                          uint64_t v527 = 2 * *((void *)&v1184 + 1);
                        }
                        else
                        {
                          uint64_t v527 = *((void *)&v1184 + 1);
                        }
                        *((void *)&v1186 + 1) += 2 * v527;
                        v66.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1185[5] + 4), (int32x2_t)0x200000002).u32[0];
                        *(int8x8_t *)v65.i8 = veor_s8(*(int8x8_t *)((char *)&v1185[5] + 4), (int8x8_t)0x100000001);
                        v66.n128_u32[1] = v65.u32[1];
                        *(void *)((char *)&v1185[5] + 4) = v66.n128_u64[0];
                        unsigned int v528 = v1157;
                        if (v521 != 2) {
                          unsigned int v528 = 0;
                        }
                        v68 += 404 * v528;
                        if (v521 == 2) {
                          int v521 = v1134;
                        }
                        else {
                          v521 -= 2;
                        }
                        v522 += 2;
                        if (!v522) {
                          goto LABEL_847;
                        }
                        continue;
                      case 4:
                        sub_10001D498();
                      default:
                        sub_10001D440();
                    }
                  case 4:
                    sub_10001D498();
                  default:
                    sub_10001D440();
                }
              }
            }
            goto LABEL_847;
          case 2u:
            goto LABEL_266;
          case 3u:
            if (v71)
            {
              int v529 = 2 * v70;
              int v530 = -2 * v69;
              while (2)
              {
                sub_10000AB64((uint64_t)v1037, a3 + 300, 0, (int *)&v1181[1], (int *)&v1185[5], v68, &v1168, *(double *)v65.i64, v66);
                switch((int)v1177)
                {
                  case 0:
                  case 2:
                    sub_10001D46C();
                  case 1:
                  case 3:
                    *(void *)&long long v1182 = v1182 + 2 * (v1178 + *((void *)&v1177 + 1));
                    if (v1181[3])
                    {
                      --v1181[3];
                      uint64_t v532 = 2 * *((void *)&v1178 + 1);
                    }
                    else
                    {
                      uint64_t v532 = *((void *)&v1178 + 1);
                    }
                    *((void *)&v1182 + 1) += 2 * v532;
                    LODWORD(v533) = vadd_s32(*(int32x2_t *)((char *)&v1181[1] + 4), (int32x2_t)0x200000002).u32[0];
                    HIDWORD(v533) = veor_s8(*(int8x8_t *)(v1181 + 12), (int8x8_t)0x100000001).i32[1];
                    *(void *)((char *)&v1181[1] + 4) = v533;
                    switch((int)v1183)
                    {
                      case 0:
                      case 2:
                        sub_10001D46C();
                      case 1:
                      case 3:
                        *(void *)&long long v1186 = v1186 + 2 * (v1184 + *((void *)&v1183 + 1));
                        if (v1185[7])
                        {
                          --v1185[7];
                          uint64_t v534 = 2 * *((void *)&v1184 + 1);
                        }
                        else
                        {
                          uint64_t v534 = *((void *)&v1184 + 1);
                        }
                        *((void *)&v1186 + 1) += 2 * v534;
                        v531.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1185[5] + 4), (int32x2_t)0x200000002).u32[0];
                        double v535 = COERCE_DOUBLE(veor_s8(*(int8x8_t *)((char *)&v1185[5] + 4), (int8x8_t)0x100000001));
                        v531.n128_u32[1] = HIDWORD(v535);
                        *(void *)((char *)&v1185[5] + 4) = v531.n128_u64[0];
                        sub_10000AB64((uint64_t)v1037, a3 + 300, 1, (int *)&v1179, (int *)v1185, v68, &v1168, v535, v531);
                        sub_10000AA54((uint64_t)&v1177);
                        sub_10000AA54((uint64_t)&v1183);
                        unsigned int v536 = v1157;
                        if (v529 != 2) {
                          unsigned int v536 = 0;
                        }
                        v68 += 404 * v536;
                        if (v529 == 2) {
                          int v529 = v1134;
                        }
                        else {
                          v529 -= 2;
                        }
                        v530 += 2;
                        if (!v530) {
                          goto LABEL_847;
                        }
                        continue;
                      case 4:
                        sub_10001D498();
                      default:
                        sub_10001D440();
                    }
                  case 4:
                    sub_10001D498();
                  default:
                    sub_10001D440();
                }
              }
            }
            goto LABEL_847;
          case 4u:
            if (v71) {
              sub_10001D4F0();
            }
            goto LABEL_847;
          default:
            sub_10001D17C();
        }
      }
      int v71 = *(_DWORD *)(a3 + 20);
      int v1134 = *(_DWORD *)(a3 + 28);
      v1168.i32[0] = 0;
LABEL_266:
      if (v71)
      {
        int8x8_t v298 = (int8x8_t)vdup_n_s32(0x7FF8u);
        int v299 = v1134;
        do
        {
          int v300 = 2 * v1179;
          int v301 = 2 * *(_DWORD *)(a3 + 16);
          if (v301 >= 1)
          {
            int v302 = 0;
            int v303 = 2 * *(_DWORD *)(a3 + 24);
            uint64_t v304 = v68 - 404;
            v305 = (unsigned __int16 *)*((void *)&v1180 + 1);
            v306 = (unsigned __int16 *)(v1181[0] + 6);
            char v307 = *(unsigned char *)(a3 + 304);
            int v308 = v301 + 2;
            do
            {
              if (!v300)
              {
                int v300 = 2 * LODWORD(v1185[0]);
                v306 = (unsigned __int16 *)(v1185[4] + 6);
                v305 = (unsigned __int16 *)v1185[3];
              }
              BOOL v309 = v302 == 0;
              if (!v302) {
                int v302 = v303;
              }
              uint64_t v310 = v304 + 404 * v309;
              unsigned int v311 = *v305;
              v312.i32[0] = v305[1];
              v312.i32[1] = v305[2];
              int32x2_t v313 = (int32x2_t)vshr_n_u32(v312, 4uLL);
              unsigned int v314 = *v306;
              ++*(_DWORD *)(v310 + 384);
              *(void *)(v310 + 388) += v313.u32[0];
              *(void *)(v310 + 396) += v313.u32[0] * (unint64_t)v313.u32[0];
              if ((v314 & 4) == 0)
              {
                int v315 = (__int16)v306[1];
                unsigned int v316 = v315 & 7;
                if ((v314 & 1) != 0 || (((v315 & 7u) < 6) & (v314 >> 1)) != 0)
                {
                  uint64_t v331 = v304 + 404 * v309;
                  v332.i32[0] = 1;
                  v332.i32[3] = 1;
                  v332.i32[1] = v313.i32[0];
                  v332.i32[2] = v311 >> 4;
                  *(int32x4_t *)(v331 + 336) = vaddq_s32(*(int32x4_t *)(v331 + 336), v332);
                  *(int32x2_t *)(v331 + 352) = vadd_s32(*(int32x2_t *)(v331 + 352), v313);
                }
                else
                {
                  __int16 v317 = v316 > 5;
                  unsigned int v318 = v306[2];
                  uint64_t v319 = (v318 & 0xF) + 1;
                  unsigned int v320 = v318 >> 4;
                  int v321 = (__int16)v314 >> 3;
                  int v322 = v315 >> 3;
                  if (v315 < 0) {
                    int v322 = -v322;
                  }
                  if (v321 < 0) {
                    int v321 = -v321;
                  }
                  unsigned __int16 v323 = v316 - v317;
                  unsigned int v324 = (16 * (v322 & 0xFFFu)) >> v317;
                  unsigned int v325 = (v319 >> 1) * v320;
                  int v326 = 8 * v321;
                  if (((v315 ^ v314) & 0x8000u) == 0) {
                    unsigned __int16 v327 = v323 + 7;
                  }
                  else {
                    unsigned __int16 v327 = v323;
                  }
                  uint64_t v328 = v310 + 24 * v327;
                  v313.i32[0] = v324;
                  v329.i32[0] = vshr_n_u32((uint32x2_t)v313, 1uLL).u32[0];
                  v313.i32[1] = v326;
                  v329.i32[1] = vand_s8(*(int8x8_t *)&v313, v298).i32[1];
                  signed int v330 = (v329.i32[0] * v325) >> 15 << v307;
                  if (v330 <= -32768) {
                    signed int v330 = -32768;
                  }
                  if (v330 >= 0x7FFF) {
                    signed int v330 = 0x7FFF;
                  }
                  *(void *)v328 += v319;
                  *(uint64x2_t *)(v328 + 8) = vaddw_u32(*(uint64x2_t *)(v328 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v330), v329), 0xFuLL));
                }
              }
              v305 += 4;
              v306 += 6;
              v300 -= 2;
              v302 -= 2;
              ++v1168.i32[0];
              v308 -= 2;
              uint64_t v304 = v310;
            }
            while (v308 > 2);
          }
          if (v300) {
            sub_10001D4C4();
          }
          sub_10000AA54((uint64_t)&v1177);
          sub_10000AA54((uint64_t)&v1183);
          unsigned int v333 = v1157;
          if (v299 != 1) {
            unsigned int v333 = 0;
          }
          v68 += 404 * v333;
          if (v299 == 1) {
            int v299 = v1134;
          }
          else {
            --v299;
          }
          --v71;
        }
        while (v71);
      }
LABEL_847:
      if (*(_DWORD *)(a3 + 608))
      {
        sub_10000A000((unint64_t)v1037, v1074, (uint64_t)__dst, (uint64_t)&v1177);
        uint64_t v1159 = a3 + 608;
        switch(v1037->i32[0])
        {
          case 0:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
              sub_10001D360();
            }
            if (*(_DWORD *)(a3 + 156))
            {
              unsigned int v699 = 0;
              v700 = (unsigned __int16 *)(a3 + 487308 + *v1043);
              v701 = (unsigned __int16 *)(a3 + 487308 + v1043[3]);
              v1145 = (char *)(a3 + 487308 + v1043[9]);
              v1124 = (_WORD *)(a3 + 487308 + v1043[12]);
              v1104 = (_WORD *)(a3 + 487308 + v1043[6]);
              int v702 = *(_DWORD *)(a3 + 20);
              do
              {
                unsigned int v703 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v699 % *(_DWORD *)(a3 + 132)) + 8);
                v704 = v1043 + 1;
                uint64_t v705 = 5;
                do
                {
                  bzero((void *)(a3 + 487308 + *(v704 - 1)), *v704);
                  v704 += 3;
                  --v705;
                }
                while (v705);
                if ((unsigned __int16)v702 >= v703) {
                  unint64_t v706 = v703;
                }
                else {
                  unint64_t v706 = (unsigned __int16)v702;
                }
                sub_10000B17C(a3, v706, (uint64_t)&v1177, v700, v701, v1104);
                sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1159, v700, v701, v1145, v1124, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v699);
                LOWORD(v702) = v702 - v703;
                ++v699;
              }
              while (v699 < *(_DWORD *)(a3 + 156));
            }
            break;
          case 1:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
              sub_10001D360();
            }
            uint64_t v707 = a3 + 487308;
            v708 = v1043;
            uint64_t v709 = *v1043;
            uint64_t v710 = v1043[3];
            uint64_t v711 = v1043[9];
            uint64_t v712 = v1043[12];
            uint64_t v713 = v1043[6];
            if (*(_DWORD *)(a3 + 156))
            {
              unsigned int v714 = 0;
              v715 = (unsigned __int16 *)(v707 + v709);
              v716 = (unsigned __int16 *)(v707 + v710);
              v1125 = (_WORD *)(v707 + v712);
              v1146 = (char *)(v707 + v711);
              v1105 = (_WORD *)(v707 + v713);
              int v717 = *(_DWORD *)(a3 + 20);
              do
              {
                unsigned int v718 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v714 % *(_DWORD *)(a3 + 132)) + 8);
                v719 = v1043 + 1;
                uint64_t v720 = 5;
                do
                {
                  bzero((void *)(v707 + *(v719 - 1)), *v719);
                  v719 += 3;
                  --v720;
                }
                while (v720);
                if ((unsigned __int16)v717 >= v718) {
                  unint64_t v721 = v718;
                }
                else {
                  unint64_t v721 = (unsigned __int16)v717;
                }
                sub_10000B17C(a3, v721, (uint64_t)&v1177, v715, v716, v1105);
                sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1159, v715, v716, v1146, v1125, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v714);
                LOWORD(v717) = v717 - v718;
                ++v714;
              }
              while (v714 < *(_DWORD *)(a3 + 156));
              v708 = v1043;
              uint64_t v709 = *v1043;
              uint64_t v710 = v1043[3];
              uint64_t v711 = v1043[9];
              uint64_t v712 = v1043[12];
              uint64_t v713 = v1043[6];
            }
            if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216)) {
              sub_10001D38C();
            }
            if (*(_DWORD *)(a3 + 212))
            {
              unsigned int v722 = 0;
              int v723 = 0;
              v724 = (unsigned __int16 *)(v707 + v709);
              v725 = (unsigned __int16 *)(v707 + v710);
              v1126 = (_WORD *)(v707 + v712);
              v1147 = (char *)(v707 + v711);
              v1106 = (_WORD *)(v707 + v713);
              int v726 = *(_DWORD *)(a3 + 16);
              v1081 = v708 + 1;
              do
              {
                unsigned int v727 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v722 % *(_DWORD *)(a3 + 188)) + 8);
                v728 = v1081;
                uint64_t v729 = 5;
                do
                {
                  bzero((void *)(v707 + *(v728 - 1)), *v728);
                  v728 += 3;
                  --v729;
                }
                while (v729);
                if ((unsigned __int16)v726 >= v727) {
                  unint64_t v730 = v727;
                }
                else {
                  unint64_t v730 = (unsigned __int16)v726;
                }
                sub_10000BBE4(a3, v723, v730, (int *)&v1177, v724, v725, v1106);
                sub_10000B304(v1163, (unsigned int *)(a3 + 188), v1159, v724, v725, v1147, v1126, a3 + 360 * *(_DWORD *)(a3 + 240) * v722 + 242980);
                v723 += v727;
                LOWORD(v726) = v726 - v727;
                ++v722;
              }
              while (v722 < *(_DWORD *)(a3 + 212));
            }
            break;
          case 2:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
              sub_10001D360();
            }
            if (*(_DWORD *)(a3 + 156))
            {
              unsigned int v731 = 0;
              v732 = (unsigned __int16 *)(a3 + 487308 + *v1043);
              v733 = (unsigned __int16 *)(a3 + 487308 + v1043[3]);
              v1148 = (char *)(a3 + 487308 + v1043[9]);
              v1127 = (_WORD *)(a3 + 487308 + v1043[12]);
              int v734 = *(_DWORD *)(a3 + 20);
              do
              {
                unsigned int v735 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v731 % *(_DWORD *)(a3 + 132)) + 8);
                v736 = v1043 + 1;
                uint64_t v737 = 5;
                do
                {
                  bzero((void *)(a3 + 487308 + *(v736 - 1)), *v736);
                  v736 += 3;
                  --v737;
                }
                while (v737);
                if ((unsigned __int16)v734 >= v735) {
                  unsigned int v738 = v735;
                }
                else {
                  unsigned int v738 = (unsigned __int16)v734;
                }
                sub_10000BE60((uint64_t)v1037, v738, (uint64_t)&v1177, v732, v733);
                sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1159, v732, v733, v1148, v1127, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v731);
                LOWORD(v734) = v734 - v735;
                ++v731;
              }
              while (v731 < *(_DWORD *)(a3 + 156));
            }
            break;
          case 3:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
              sub_10001D360();
            }
            uint64_t v739 = a3 + 487308;
            v740 = v1043;
            uint64_t v741 = *v1043;
            uint64_t v742 = v1043[3];
            uint64_t v743 = v1043[9];
            uint64_t v744 = v1043[12];
            uint64_t v745 = v1043[6];
            if (*(_DWORD *)(a3 + 156))
            {
              unsigned int v746 = 0;
              v747 = (unsigned __int16 *)(v739 + v741);
              v748 = (unsigned __int16 *)(v739 + v742);
              v1128 = (_WORD *)(v739 + v744);
              v1149 = (char *)(v739 + v743);
              v1107 = (_WORD *)(v739 + v745);
              int v749 = *(_DWORD *)(a3 + 20);
              do
              {
                unsigned int v750 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v746 % *(_DWORD *)(a3 + 132)) + 8);
                v751 = v1043 + 1;
                uint64_t v752 = 5;
                do
                {
                  bzero((void *)(v739 + *(v751 - 1)), *v751);
                  v751 += 3;
                  --v752;
                }
                while (v752);
                if ((unsigned __int16)v749 >= v750) {
                  unint64_t v753 = v750;
                }
                else {
                  unint64_t v753 = (unsigned __int16)v749;
                }
                sub_10000B17C(a3, v753, (uint64_t)&v1177, v747, v748, v1107);
                sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1159, v747, v748, v1149, v1128, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v746);
                LOWORD(v749) = v749 - v750;
                ++v746;
              }
              while (v746 < *(_DWORD *)(a3 + 156));
              v740 = v1043;
              uint64_t v741 = *v1043;
              uint64_t v742 = v1043[3];
              uint64_t v743 = v1043[9];
              uint64_t v744 = v1043[12];
              uint64_t v745 = v1043[6];
            }
            if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216)) {
              sub_10001D38C();
            }
            if (*(_DWORD *)(a3 + 212))
            {
              unsigned int v754 = 0;
              int v755 = 0;
              v756 = (unsigned __int16 *)(v739 + v741);
              v757 = (unsigned __int16 *)(v739 + v742);
              v1129 = (_WORD *)(v739 + v744);
              v1150 = (char *)(v739 + v743);
              v1108 = (_WORD *)(v739 + v745);
              int v758 = *(_DWORD *)(a3 + 16);
              v1082 = v740 + 1;
              do
              {
                unsigned int v759 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v754 % *(_DWORD *)(a3 + 188)) + 8);
                v760 = v1082;
                uint64_t v761 = 5;
                do
                {
                  bzero((void *)(v739 + *(v760 - 1)), *v760);
                  v760 += 3;
                  --v761;
                }
                while (v761);
                if ((unsigned __int16)v758 >= v759) {
                  unint64_t v762 = v759;
                }
                else {
                  unint64_t v762 = (unsigned __int16)v758;
                }
                sub_10000BBE4(a3, v755, v762, (int *)&v1177, v756, v757, v1108);
                sub_10000B304(v1163, (unsigned int *)(a3 + 188), v1159, v756, v757, v1150, v1129, a3 + 360 * *(_DWORD *)(a3 + 240) * v754 + 242980);
                v755 += v759;
                LOWORD(v758) = v758 - v759;
                ++v754;
              }
              while (v754 < *(_DWORD *)(a3 + 212));
            }
            break;
          case 4:
            if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
              sub_10001D360();
            }
            uint64_t v763 = a3 + 487308;
            if (*(_DWORD *)(a3 + 156))
            {
              unsigned int v764 = 0;
              v765 = (unsigned __int16 *)(v763 + *v1043);
              v766 = (unsigned __int16 *)(v763 + v1043[3]);
              v1151 = (char *)(v763 + v1043[9]);
              v1130 = (_WORD *)(v763 + v1043[12]);
              int v767 = *(_DWORD *)(a3 + 20);
              do
              {
                unsigned int v768 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v764 % *(_DWORD *)(a3 + 132)) + 8);
                v769 = v1043 + 1;
                uint64_t v770 = 5;
                do
                {
                  bzero((void *)(v763 + *(v769 - 1)), *v769);
                  v769 += 3;
                  --v770;
                }
                while (v770);
                if ((unsigned __int16)v767 >= v768) {
                  unsigned int v771 = v768;
                }
                else {
                  unsigned int v771 = (unsigned __int16)v767;
                }
                sub_10000BE60((uint64_t)v1037, v771, (uint64_t)&v1177, v765, v766);
                sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1159, v765, v766, v1151, v1130, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v764);
                LOWORD(v767) = v767 - v768;
                ++v764;
              }
              while (v764 < *(_DWORD *)(a3 + 156));
            }
            if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216)) {
              sub_10001D38C();
            }
            if (*(_DWORD *)(a3 + 212)) {
              sub_10001D3B8(a3, a3 + 487308);
            }
            return result;
          default:
            sub_10001D334();
        }
      }
      goto LABEL_920;
    }
    unsigned int v180 = *(_DWORD *)(a3 + 12);
    if (v180 > 4) {
      sub_10001D150();
    }
    uint64_t v181 = a3 + 6948;
    if (v180 != 2)
    {
      int v182 = *(_DWORD *)(a3 + 20);
      int v183 = *(_DWORD *)(a3 + 28);
      int v1167 = 0;
      int v184 = 2 * v182;
      int v1136 = 2 * v183;
      switch(v180)
      {
        case 0u:
          if (!v184) {
            goto LABEL_847;
          }
          int v185 = 2 * v183;
          break;
        case 1u:
          if (v184)
          {
            int v685 = 2 * v183;
            int v686 = -2 * v182;
            while (2)
            {
              sub_10000AD98((uint64_t)v1037, a3 + 300, 1, (uint64_t)&v1179, (uint64_t)v1185, v181, &v1167);
              sub_10000AA54((uint64_t)&v1177);
              sub_10000AA54((uint64_t)&v1183);
              sub_10000AD98((uint64_t)v1037, a3 + 300, 0, (uint64_t)&v1181[1], (uint64_t)&v1185[5], v181, &v1167);
              switch((int)v1177)
              {
                case 0:
                case 2:
                  sub_10001D46C();
                case 1:
                case 3:
                  *(void *)&long long v1182 = v1182 + 2 * (v1178 + *((void *)&v1177 + 1));
                  if (v1181[3])
                  {
                    --v1181[3];
                    uint64_t v687 = 2 * *((void *)&v1178 + 1);
                  }
                  else
                  {
                    uint64_t v687 = *((void *)&v1178 + 1);
                  }
                  *((void *)&v1182 + 1) += 2 * v687;
                  LODWORD(v688) = vadd_s32(*(int32x2_t *)((char *)&v1181[1] + 4), (int32x2_t)0x200000002).u32[0];
                  HIDWORD(v688) = veor_s8(*(int8x8_t *)(v1181 + 12), (int8x8_t)0x100000001).i32[1];
                  *(void *)((char *)&v1181[1] + 4) = v688;
                  switch((int)v1183)
                  {
                    case 0:
                    case 2:
                      sub_10001D46C();
                    case 1:
                    case 3:
                      *(void *)&long long v1186 = v1186 + 2 * (v1184 + *((void *)&v1183 + 1));
                      if (v1185[7])
                      {
                        --v1185[7];
                        uint64_t v689 = 2 * *((void *)&v1184 + 1);
                      }
                      else
                      {
                        uint64_t v689 = *((void *)&v1184 + 1);
                      }
                      *((void *)&v1186 + 1) += 2 * v689;
                      LODWORD(v690) = vadd_s32(*(int32x2_t *)((char *)&v1185[5] + 4), (int32x2_t)0x200000002).u32[0];
                      HIDWORD(v690) = veor_s8(*(int8x8_t *)(v1185 + 44), (int8x8_t)0x100000001).i32[1];
                      *(void *)((char *)&v1185[5] + 4) = v690;
                      unsigned int v691 = v1157;
                      if (v685 != 2) {
                        unsigned int v691 = 0;
                      }
                      v181 += 404 * v691;
                      if (v685 == 2) {
                        int v685 = v1136;
                      }
                      else {
                        v685 -= 2;
                      }
                      v686 += 2;
                      if (!v686) {
                        goto LABEL_847;
                      }
                      continue;
                    case 4:
                      sub_10001D498();
                    default:
                      sub_10001D440();
                  }
                case 4:
                  sub_10001D498();
                default:
                  sub_10001D440();
              }
            }
          }
          goto LABEL_847;
        case 2u:
          goto LABEL_369;
        case 3u:
          if (v184)
          {
            int v692 = 2 * v183;
            int v693 = -2 * v182;
            while (2)
            {
              sub_10000AD98((uint64_t)v1037, a3 + 300, 0, (uint64_t)&v1181[1], (uint64_t)&v1185[5], v181, &v1167);
              switch((int)v1177)
              {
                case 0:
                case 2:
                  sub_10001D46C();
                case 1:
                case 3:
                  *(void *)&long long v1182 = v1182 + 2 * (v1178 + *((void *)&v1177 + 1));
                  if (v1181[3])
                  {
                    --v1181[3];
                    uint64_t v694 = 2 * *((void *)&v1178 + 1);
                  }
                  else
                  {
                    uint64_t v694 = *((void *)&v1178 + 1);
                  }
                  *((void *)&v1182 + 1) += 2 * v694;
                  LODWORD(v695) = vadd_s32(*(int32x2_t *)((char *)&v1181[1] + 4), (int32x2_t)0x200000002).u32[0];
                  HIDWORD(v695) = veor_s8(*(int8x8_t *)(v1181 + 12), (int8x8_t)0x100000001).i32[1];
                  *(void *)((char *)&v1181[1] + 4) = v695;
                  switch((int)v1183)
                  {
                    case 0:
                    case 2:
                      sub_10001D46C();
                    case 1:
                    case 3:
                      *(void *)&long long v1186 = v1186 + 2 * (v1184 + *((void *)&v1183 + 1));
                      if (v1185[7])
                      {
                        --v1185[7];
                        uint64_t v696 = 2 * *((void *)&v1184 + 1);
                      }
                      else
                      {
                        uint64_t v696 = *((void *)&v1184 + 1);
                      }
                      *((void *)&v1186 + 1) += 2 * v696;
                      LODWORD(v697) = vadd_s32(*(int32x2_t *)((char *)&v1185[5] + 4), (int32x2_t)0x200000002).u32[0];
                      HIDWORD(v697) = veor_s8(*(int8x8_t *)(v1185 + 44), (int8x8_t)0x100000001).i32[1];
                      *(void *)((char *)&v1185[5] + 4) = v697;
                      sub_10000AD98((uint64_t)v1037, a3 + 300, 1, (uint64_t)&v1179, (uint64_t)v1185, v181, &v1167);
                      sub_10000AA54((uint64_t)&v1177);
                      sub_10000AA54((uint64_t)&v1183);
                      unsigned int v698 = v1157;
                      if (v692 != 2) {
                        unsigned int v698 = 0;
                      }
                      v181 += 404 * v698;
                      if (v692 == 2) {
                        int v692 = v1136;
                      }
                      else {
                        v692 -= 2;
                      }
                      v693 += 2;
                      if (!v693) {
                        goto LABEL_847;
                      }
                      continue;
                    case 4:
                      sub_10001D498();
                    default:
                      sub_10001D440();
                  }
                case 4:
                  sub_10001D498();
                default:
                  sub_10001D440();
              }
            }
          }
          goto LABEL_847;
        case 4u:
          if (v184) {
            sub_10001D5CC();
          }
          goto LABEL_847;
        default:
          sub_10001D51C();
      }
      while (1)
      {
        int v1113 = v185;
        int v186 = v1179;
        int v187 = *(_DWORD *)(a3 + 16);
        if (v187 >= 1) {
          break;
        }
LABEL_202:
        if (v186) {
          sub_10001D548();
        }
        sub_10000AA54((uint64_t)&v1177);
        sub_10000AA54((uint64_t)&v1183);
        int v185 = v1113 - 1;
        unsigned int v247 = v1157;
        if (v1113 != 1) {
          unsigned int v247 = 0;
        }
        v181 += 404 * v247;
        if (v1113 == 1) {
          int v185 = v1136;
        }
        if (!--v184) {
          goto LABEL_847;
        }
      }
      int v188 = 0;
      int16x8_t v189 = vdupq_n_s16(*(char *)(a3 + 304));
      int v190 = *(_DWORD *)(a3 + 24);
      v191 = (int *)&v1185[1];
      if (v1179) {
        v191 = (int *)&v1179 + 2;
      }
      int v192 = *v191;
      uint64_t v193 = v181 - 404;
      v195 = (const __int16 *)*((void *)&v1180 + 1);
      v194 = (const __int16 *)v1181[0];
LABEL_175:
      v196 = (const __int16 *)v1185[3];
      v197 = (const __int16 *)v1185[4];
      int v198 = v1185[0];
      if (!v186)
      {
        int v186 = v1185[0];
        v194 = (const __int16 *)v1185[4];
        v195 = (const __int16 *)v1185[3];
      }
      if (v186 <= 7)
      {
        int v199 = v187;
        if (v186 != v187)
        {
          if (v186 < 1) {
            sub_10001D574();
          }
          unint64_t v200 = 0;
          uint64_t v201 = 2 * v186;
          do
          {
            v202 = (__int16 *)&v195[v200];
            v1168.i16[v200 / 2] = *v202;
            v1176.i16[v200 / 2] = v202[1];
            v1175.i16[v200 / 2] = *v194;
            v1174.i16[v200 / 2] = v194[1];
            v1173.i16[v200 / 2] = v194[2];
            v200 += 2;
            v194 += 3;
          }
          while (v201 != v200);
          if (v187 >= 8) {
            int v203 = 8;
          }
          else {
            int v203 = v187;
          }
          if (v186 < v203)
          {
            uint64_t v204 = 0;
            v205 = &v1173.i8[v201];
            v206 = &v1174.i8[v201];
            v207 = &v1175.i8[v201];
            v208 = &v1176.i8[v201];
            v209 = &v1168.i8[v201];
            int v210 = v186;
            v211 = v196;
            do
            {
              v212 = &v196[v204];
              *(_WORD *)&v209[v204] = *v212;
              *(_WORD *)&v208[v204] = v212[1];
              *(_WORD *)&v207[v204] = *v197;
              *(_WORD *)&v206[v204] = v197[1];
              *(_WORD *)&v205[v204] = v197[2];
              v213 = v211;
              v197 += 3;
              ++v210;
              v204 += 2;
              v211 = v212 + 2;
            }
            while (v203 > v210);
            v196 = v213 + 2;
          }
          v1197.val[0] = (int16x8_t)v1168;
          v1197.val[1] = v1176;
          v1198.val[1] = v1174;
          v1198.val[0] = v1175;
          v186 += v198 - v203;
          v194 = v197;
          v195 = v196;
          v1198.val[2] = v1173;
LABEL_192:
          uint64_t v214 = 0;
          v215.i64[0] = 0x2000200020002;
          v215.i64[1] = 0x2000200020002;
          v216.i64[0] = 0x4000400040004;
          v216.i64[1] = 0x4000400040004;
          int8x16_t v217 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v1198.val[0], v216));
          v218.i64[0] = 0x7000700070007;
          v218.i64[1] = 0x7000700070007;
          int16x8_t v219 = (int16x8_t)vandq_s8((int8x16_t)v1198.val[1], v218);
          v220.i64[0] = 0xF000F000F000FLL;
          v220.i64[1] = 0xF000F000F000FLL;
          int8x16_t v221 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1197.val[0], 4uLL);
          int8x16_t v222 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1197.val[1], 4uLL);
          v223.i64[0] = 0x5000500050005;
          v223.i64[1] = 0x5000500050005;
          int8x16_t v224 = (int8x16_t)vcgtq_u16((uint16x8_t)v219, v223);
          int8x16_t v225 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v1198.val[1], 3uLL)), 4uLL);
          uint16x8_t v226 = vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v1198.val[0], 3uLL)), 4uLL);
          int8x16_t v227 = vorrq_s8(v224, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v1198.val[0], v215)));
          v228.i64[0] = -1;
          v228.i64[1] = -1;
          int16x8_t v229 = (int16x8_t)vbslq_s8(v224, (int8x16_t)vaddq_s16(v219, v228), (int8x16_t)v219);
          uint16x8_t v230 = (uint16x8_t)vbslq_s8(v224, (int8x16_t)vshrq_n_u16((uint16x8_t)v225, 1uLL), v225);
          v224.i64[0] = 0x1000100010001;
          v224.i64[1] = 0x1000100010001;
          int16x8_t v231 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v1198.val[2], v220), (int16x8_t)vbicq_s8(v224, (int8x16_t)v1198.val[0])), v227);
          int16x8_t v232 = vaddq_s16(v229, (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v1198.val[0]), (int8x16_t)vcgtq_s16(v1198.val[1], v228)), v218));
          int16x8_t v233 = (int16x8_t)vshrq_n_u16(v230, 1uLL);
          int16x8_t v234 = vqshlq_s16(vqdmulhq_s16(v233, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v231, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v1198.val[2], 4uLL))), v189);
          int8x16_t v235 = (int8x16_t)vceqzq_s16(v231);
          int8x16_t v1168 = (int8x16_t)v232;
          int8x16_t v1169 = vornq_s8(vandq_s8((int8x16_t)v231, v217), v217);
          int8x16_t v1170 = vbslq_s8(v235, v222, (int8x16_t)vqdmulhq_s16(v234, v233));
          int8x16_t v1171 = vbslq_s8(v235, v221, (int8x16_t)vqdmulhq_s16(v234, (int16x8_t)vshrq_n_u16(v226, 1uLL)));
          int16x8_t v1176 = (int16x8_t)v222;
          v236 = &v1170;
          while (1)
          {
            BOOL v237 = v188 == 0;
            if (!v188) {
              int v188 = v190;
            }
            uint64_t v238 = v193 + 404 * v237;
            unsigned int v239 = v236[-2].u16[0];
            uint64_t v240 = v236[-1].u16[0];
            uint64_t v241 = v236->u16[0];
            uint64_t v242 = v236[1].u16[0];
            ++*(_DWORD *)(v238 + 384);
            uint64_t v243 = v1176.u16[v214];
            *(void *)(v238 + 388) += v243;
            *(void *)(v238 + 396) += v243 * (unint64_t)v243;
            if (v240)
            {
              if (v240 != 0xFFFF)
              {
                v244 = (void *)(v238 + 24 * v239);
                uint64_t v245 = v244[1];
                *v244 += v240;
                v244[1] = v245 + v241;
                v244[2] += v242;
              }
            }
            else
            {
              v246 = (_DWORD *)(v193 + 404 * v237 + 12 * v192);
              ++v246[84];
              v246[85] += v241;
              v246[86] += v242;
            }
            ++v1167;
            if (v187 - 1 == v214) {
              goto LABEL_202;
            }
            v236 = (int8x16_t *)((char *)v236 + 2);
            v192 ^= 1u;
            --v188;
            ++v214;
            uint64_t v193 = v238;
            if (v214 == 8)
            {
              v187 -= 8;
              uint64_t v193 = v238;
              if (v187 + 1 > 1) {
                goto LABEL_175;
              }
              goto LABEL_202;
            }
          }
        }
      }
      else
      {
        int v199 = 8;
      }
      int16x8x2_t v1197 = vld2q_s16(v195);
      v195 += 16;
      v186 -= v199;
      int16x8x3_t v1198 = vld3q_s16(v194);
      v194 += 24;
      goto LABEL_192;
    }
    int v184 = *(_DWORD *)(a3 + 20);
    int v1136 = *(_DWORD *)(a3 + 28);
    int v1167 = 0;
LABEL_369:
    if (!v184) {
      goto LABEL_847;
    }
    int v412 = v1136;
    while (1)
    {
      int v413 = 2 * *(_DWORD *)(a3 + 16);
      if (v413 >= 1) {
        break;
      }
LABEL_407:
      sub_10000AA54((uint64_t)&v1177);
      sub_10000AA54((uint64_t)&v1183);
      unsigned int v480 = v1157;
      if (v412 != 1) {
        unsigned int v480 = 0;
      }
      v181 += 404 * v480;
      if (v412 == 1) {
        int v412 = v1136;
      }
      else {
        --v412;
      }
      if (!--v184) {
        goto LABEL_847;
      }
    }
    int v414 = 0;
    int16x8_t v415 = vdupq_n_s16(*(char *)(a3 + 304));
    int v416 = 2 * *(_DWORD *)(a3 + 24);
    int v417 = 2 * v1179;
    uint64_t v418 = v181 - 404;
    v419 = (__int16 *)*((void *)&v1180 + 1);
    v420 = (_WORD *)v1181[0];
    int v421 = v413 - 2;
LABEL_373:
    v422 = (__int16 *)v1185[3];
    v423 = (_WORD *)v1185[4];
    int v424 = v1185[0];
    BOOL v425 = v417 == 0;
    if (v417)
    {
      v426 = v420;
    }
    else
    {
      int v417 = 2 * LODWORD(v1185[0]);
      v426 = (_WORD *)v1185[4];
    }
    if (v425) {
      v419 = (__int16 *)v1185[3];
    }
    if (v417 < 16)
    {
      int v427 = v413;
      if (v417 != v413)
      {
        BOOL v432 = v417 == 1;
        if (v417 < 1) {
          sub_10001D5A0();
        }
        uint64_t v433 = v417 >> 1;
        if (!v432)
        {
          if (v433 <= 1) {
            uint64_t v434 = 1;
          }
          else {
            uint64_t v434 = v433;
          }
          v435 = v426 + 5;
          v436 = &v1172;
          v437 = &v1173;
          v438 = &v1174;
          v439 = &v1175;
          v440 = &v1176;
          v441 = &v1168;
          do
          {
            v441->i16[0] = *v419;
            v441 = (int8x16_t *)((char *)v441 + 2);
            v440->i16[0] = v419[1];
            v440 = (int16x8_t *)((char *)v440 + 2);
            v439->i16[0] = v419[2];
            v439 = (int16x8_t *)((char *)v439 + 2);
            v438->i16[0] = *(v435 - 2);
            v438 = (int16x8_t *)((char *)v438 + 2);
            v437->i16[0] = *(v435 - 1);
            v437 = (int16x8_t *)((char *)v437 + 2);
            __int16 v442 = *v435;
            v435 += 6;
            v436->i16[0] = v442;
            v436 = (int8x16_t *)((char *)v436 + 2);
            v419 += 4;
            --v434;
          }
          while (v434);
        }
        LODWORD(v443) = v413 >> 1;
        if (v413 <= 15) {
          uint64_t v443 = v443;
        }
        else {
          uint64_t v443 = 8;
        }
        if (v433 < v443)
        {
          uint64_t v444 = v433;
          do
          {
            v1168.i16[v444] = *v422;
            v1176.i16[v444] = v422[1];
            v1175.i16[v444] = v422[2];
            v1174.i16[v444] = v423[3];
            v1173.i16[v444] = v423[4];
            v1172.i16[v444] = v423[5];
            v422 += 4;
            v423 += 6;
            ++v444;
          }
          while (v443 != v444);
        }
        v1201.val[0] = (int16x8_t)v1168;
        v1201.val[1] = v1176;
        int16x8_t v429 = v1174;
        v1201.val[2] = v1175;
        int8x16_t v431 = v1172;
        int16x8_t v430 = v1173;
        int v417 = 2 * (v424 - v443 + v433);
        v420 = v423;
        v419 = v422;
LABEL_396:
        uint64_t v445 = 0;
        v446.i64[0] = 0x2000200020002;
        v446.i64[1] = 0x2000200020002;
        v447.i64[0] = 0x4000400040004;
        v447.i64[1] = 0x4000400040004;
        int8x16_t v448 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v429, v447));
        v449.i64[0] = 0x7000700070007;
        v449.i64[1] = 0x7000700070007;
        int16x8_t v450 = (int16x8_t)vandq_s8((int8x16_t)v430, v449);
        v451.i64[0] = 0xF000F000F000FLL;
        v451.i64[1] = 0xF000F000F000FLL;
        int16x8_t v452 = (int16x8_t)vandq_s8(v431, v451);
        int8x16_t v453 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1201.val[0], 4uLL);
        int8x16_t v454 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1201.val[1], 4uLL);
        int8x16_t v455 = (int8x16_t)vshrq_n_u16((uint16x8_t)v1201.val[2], 4uLL);
        int16x8_t v456 = (int16x8_t)vshrq_n_u16((uint16x8_t)v431, 4uLL);
        v457.i64[0] = 0x5000500050005;
        v457.i64[1] = 0x5000500050005;
        int8x16_t v458 = (int8x16_t)vcgtq_u16((uint16x8_t)v450, v457);
        int8x16_t v459 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v430, 3uLL)), 4uLL);
        int8x16_t v460 = vorrq_s8(v458, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v429, v446)));
        v461.i64[0] = -1;
        v461.i64[1] = -1;
        int16x8_t v462 = (int16x8_t)vbslq_s8(v458, (int8x16_t)vaddq_s16(v450, v461), (int8x16_t)v450);
        uint16x8_t v463 = (uint16x8_t)vbslq_s8(v458, (int8x16_t)vshrq_n_u16((uint16x8_t)v459, 1uLL), v459);
        v458.i64[0] = 0x1000100010001;
        v458.i64[1] = 0x1000100010001;
        int16x8_t v464 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16(v452, (int16x8_t)vbicq_s8(v458, (int8x16_t)v429)), v460);
        int16x8_t v465 = (int16x8_t)vshrq_n_u16(v463, 1uLL);
        int16x8_t v466 = vqshlq_s16(vqdmulhq_s16(v465, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v464, 1uLL), v456)), v415);
        int8x16_t v467 = (int8x16_t)vqdmulhq_s16(v466, v465);
        int8x16_t v468 = (int8x16_t)vqdmulhq_s16(v466, (int16x8_t)vshrq_n_u16(vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v429, 3uLL)), 4uLL), 1uLL));
        int8x16_t v469 = (int8x16_t)vceqzq_s16(v464);
        int16x8_t v1176 = (int16x8_t)v454;
        int8x16_t v1168 = vornq_s8(vandq_s8((int8x16_t)v464, v448), v448);
        int8x16_t v1169 = vbslq_s8(v469, v454, v467);
        int8x16_t v1170 = vbslq_s8(v469, v453, v468);
        int8x16_t v1171 = vbslq_s8(v469, v455, (int8x16_t)vaddq_s16(v462, (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v429), (int8x16_t)vcgtq_s16(v430, v461)), v449)));
        while (1)
        {
          BOOL v470 = v414 == 0;
          if (!v414) {
            int v414 = v416;
          }
          uint64_t v471 = v418 + 404 * v470;
          uint64_t v472 = v1168.u16[v445];
          ++*(_DWORD *)(v471 + 384);
          uint64_t v473 = v1176.u16[v445];
          *(void *)(v471 + 388) += v473;
          *(void *)(v471 + 396) += v473 * (unint64_t)v473;
          if (v472)
          {
            if (v472 != 0xFFFF)
            {
              uint64_t v474 = v1170.u16[v445];
              v475 = (void *)(v471 + 24 * v1171.u16[v445]);
              uint64_t v476 = v475[1] + *(unsigned __int16 *)((char *)&v1168 + v445 * 2 + 16);
              *v475 += v472;
              v475[1] = v476;
              v475[2] += v474;
            }
          }
          else
          {
            int v477 = v1171.u16[v445];
            v478 = (int32x4_t *)(v418 + 404 * v470);
            v479.i32[0] = 1;
            v479.i32[3] = 1;
            v479.i32[1] = *(unsigned __int16 *)((char *)&v1168 + v445 * 2 + 16);
            v479.i32[2] = v1170.u16[v445];
            v478[21] = vaddq_s32(v478[21], v479);
            v478[22].i32[0] += v479.i32[1];
            v478[22].i32[1] += v477;
          }
          ++v1167;
          if (v421 == (v445 * 2)) {
            goto LABEL_407;
          }
          v414 -= 2;
          ++v445;
          uint64_t v418 = v471;
          if (v445 == 8)
          {
            v421 -= 16;
            uint64_t v418 = v471;
            BOOL v902 = v413 <= 16;
            v413 -= 16;
            if (v902) {
              goto LABEL_407;
            }
            goto LABEL_373;
          }
        }
      }
    }
    else
    {
      int v427 = 16;
    }
    int16x8x4_t v1201 = vld4q_s16(v419);
    v419 += 32;
    v428 = v426;
    int16x8x3_t v1199 = vld3q_s16(v428);
    v428 += 24;
    int16x8x3_t v1200 = vld3q_s16(v428);
    int16x8_t v429 = vuzp2q_s16(v1199.val[0], v1200.val[0]);
    int16x8_t v430 = vuzp2q_s16(v1199.val[1], v1200.val[1]);
    int8x16_t v431 = (int8x16_t)vuzp2q_s16(v1199.val[2], v1200.val[2]);
    v420 = v426 + 48;
    v417 -= v427;
    goto LABEL_396;
  }
  if (v8 - 2 >= 2)
  {
    if (v8 == 4) {
      sub_10001D784();
    }
    sub_10001D0F8();
  }
  sub_10000A4D8(v7, a2, (uint64_t)&v1177);
  unsigned int v1156 = *(unsigned __int16 *)(a3 + 32);
  if (v4 == 1)
  {
    unsigned int v111 = *(_DWORD *)(a3 + 12);
    if (v111 > 4) {
      sub_10001D150();
    }
    uint64_t v112 = a3 + 6948;
    if (v111 != 2)
    {
      int v113 = *(_DWORD *)(a3 + 20);
      int v114 = *(_DWORD *)(a3 + 28);
      int v1167 = 0;
      int v115 = 2 * v113;
      int v1135 = 2 * v114;
      switch(v111)
      {
        case 0u:
          if (!v115) {
            goto LABEL_707;
          }
          int16x8_t v116 = vdupq_n_s16(*(char *)(a3 + 304));
          int v117 = *(_DWORD *)(a3 + 24);
          int v1054 = *(_DWORD *)(a3 + 16);
          v118 = (const __int16 *)*((void *)&v1179 + 1);
          uint64_t v119 = v1179;
          uint64_t v120 = v1183;
          int v121 = DWORD1(v1182);
          uint64_t v1023 = *((void *)&v1177 + 1);
          uint64_t v1019 = 2 * *((void *)&v1177 + 1);
          uint64_t v1021 = v1181[3];
          uint64_t v1017 = 2 * v1181[3];
          v122.i64[0] = 0x1000100010001;
          v122.i64[1] = 0x1000100010001;
          v123.i64[0] = -1;
          v123.i64[1] = -1;
          v124.i64[0] = 0x2000200020002;
          v124.i64[1] = 0x2000200020002;
          v125.i64[0] = 0x4000400040004;
          v125.i64[1] = 0x4000400040004;
          v126.i64[0] = 0x7000700070007;
          v126.i64[1] = 0x7000700070007;
          v127.i64[0] = 0xF000F000F000FLL;
          v127.i64[1] = 0xF000F000F000FLL;
          v128.i64[0] = 0x5000500050005;
          v128.i64[1] = 0x5000500050005;
          int v1048 = v1178;
          int v129 = 2 * v114;
          int v130 = DWORD1(v1178);
          int v1028 = v1181[2];
          int v1033 = v1177;
LABEL_110:
          int __srca = v129;
          int v1095 = v130;
          uint64_t v1075 = v120;
          int v1086 = v121;
          *(void *)v1112 = v119;
          int v131 = v1048;
          if (v1054 < 1) {
            goto LABEL_143;
          }
          v12.i32[0] = 0;
          int v132 = 0;
          v133 = (char *)&v1182 + 8;
          int v131 = v1048;
          if (v1048) {
            v133 = (char *)&v1178 + 8;
          }
          int v134 = *(_DWORD *)v133;
          v13.i32[0] = *(_DWORD *)v133 & 1;
          int8x8_t v135 = (int8x8_t)vdup_lane_s32(vceq_s32(*(int32x2_t *)v13.i8, v12), 0);
          int32x2_t v12 = (int32x2_t)vorr_s8((int8x8_t)(*(void *)&v135 & 0xFF00FF00FF00FF00), (int8x8_t)(*(void *)&vmvn_s8(v135) & 0xFF00FF00FF00FFLL));
          uint64_t v136 = v112 - 404;
          v137 = v118;
          int v138 = v1054;
          break;
        case 1u:
          if (v115)
          {
            int v537 = 2 * v114;
            int v538 = -2 * v113;
            while (2)
            {
              sub_10000C40C(v1037, a3 + 300, 1, (uint64_t)&v1178, (uint64_t)&v1182, v112, &v1167, v9, (int32x4_t)v10);
              switch((int)v1177)
              {
                case 0:
                  *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                  v540.i32[0] = vadd_s32(*(int32x2_t *)((char *)&v1178 + 4), (int32x2_t)0x100000001).u32[0];
                  *(int8x8_t *)v539.i8 = veor_s8(*(int8x8_t *)((char *)&v1178 + 4), (int8x8_t)0x100000001);
                  v540.i32[1] = v539.i32[1];
                  *(void *)((char *)&v1178 + 4) = v540.i64[0];
                  goto LABEL_589;
                case 1:
                case 3:
                case 4:
                  if ((void)v1179)
                  {
                    *(void *)&long long v1179 = v1179 - 1;
                    uint64_t v541 = *((void *)&v1177 + 1);
                  }
                  else
                  {
                    uint64_t v541 = 2 * *((void *)&v1177 + 1);
                  }
                  *((void *)&v1179 + 1) += 2 * v541;
                  int v542 = DWORD1(v1178) + 2;
                  goto LABEL_588;
                case 2:
                  *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                  int v542 = DWORD1(v1178) + 1;
LABEL_588:
                  DWORD1(v1178) = v542;
LABEL_589:
                  switch(LODWORD(v1181[2]))
                  {
                    case 0:
                      *((void *)&v1183 + 1) += 2 * v1181[3];
                      v540.i32[0] = vadd_s32(*(int32x2_t *)((char *)&v1182 + 4), (int32x2_t)0x100000001).u32[0];
                      *(int8x8_t *)v539.i8 = veor_s8(*(int8x8_t *)((char *)&v1182 + 4), (int8x8_t)0x100000001);
                      v540.i32[1] = v539.i32[1];
                      *(void *)((char *)&v1182 + 4) = v540.i64[0];
                      goto LABEL_597;
                    case 1:
                    case 3:
                    case 4:
                      if ((void)v1183)
                      {
                        *(void *)&long long v1183 = v1183 - 1;
                        uint64_t v543 = v1181[3];
                      }
                      else
                      {
                        uint64_t v543 = 2 * v1181[3];
                      }
                      *((void *)&v1183 + 1) += 2 * v543;
                      int v544 = DWORD1(v1182) + 2;
                      goto LABEL_596;
                    case 2:
                      *((void *)&v1183 + 1) += 2 * v1181[3];
                      int v544 = DWORD1(v1182) + 1;
LABEL_596:
                      DWORD1(v1182) = v544;
LABEL_597:
                      sub_10000C40C(v1037, a3 + 300, 0, (uint64_t)&v1180, (uint64_t)&v1184, v112, &v1167, v539, v540);
                      switch((int)v1177)
                      {
                        case 0:
                        case 2:
                          sub_10001D650();
                        case 1:
                        case 3:
                          if (v1181[0])
                          {
                            --v1181[0];
                            uint64_t v545 = 2 * *((void *)&v1177 + 1);
                          }
                          else
                          {
                            uint64_t v545 = *((void *)&v1177 + 1);
                          }
                          v1181[1] += 2 * v545;
                          v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1180 + 4), (int32x2_t)0x200000002).u32[0];
                          *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1180 + 4), (int8x8_t)0x100000001);
                          v10.n128_u32[1] = v9.u32[1];
                          *(void *)((char *)&v1180 + 4) = v10.n128_u64[0];
                          break;
                        case 4:
                          if (v1181[0])
                          {
                            --v1181[0];
                            uint64_t v546 = 2 * *((void *)&v1177 + 1);
                          }
                          else
                          {
                            uint64_t v546 = *((void *)&v1177 + 1);
                          }
                          v1181[1] += 2 * v546;
                          DWORD1(v1180) += 2;
                          break;
                        default:
                          sub_10001D624();
                      }
                      switch(LODWORD(v1181[2]))
                      {
                        case 0:
                        case 2:
                          sub_10001D650();
                        case 1:
                        case 3:
                          if (v1185[0])
                          {
                            --v1185[0];
                            uint64_t v547 = 2 * v1181[3];
                          }
                          else
                          {
                            uint64_t v547 = v1181[3];
                          }
                          v1185[1] += 2 * v547;
                          v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1184 + 4), (int32x2_t)0x200000002).u32[0];
                          *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1184 + 4), (int8x8_t)0x100000001);
                          v10.n128_u32[1] = v9.u32[1];
                          *(void *)((char *)&v1184 + 4) = v10.n128_u64[0];
                          break;
                        case 4:
                          if (v1185[0])
                          {
                            --v1185[0];
                            uint64_t v548 = 2 * v1181[3];
                          }
                          else
                          {
                            uint64_t v548 = v1181[3];
                          }
                          v1185[1] += 2 * v548;
                          DWORD1(v1184) += 2;
                          break;
                        default:
                          sub_10001D624();
                      }
                      unsigned int v549 = v1156;
                      if (v537 != 2) {
                        unsigned int v549 = 0;
                      }
                      v112 += 404 * v549;
                      if (v537 == 2) {
                        int v537 = v1135;
                      }
                      else {
                        v537 -= 2;
                      }
                      v538 += 2;
                      if (!v538) {
                        goto LABEL_707;
                      }
                      continue;
                    default:
                      sub_10001D67C();
                  }
                default:
                  sub_10001D67C();
              }
            }
          }
          goto LABEL_707;
        case 2u:
          goto LABEL_300;
        case 3u:
          if (v115)
          {
            int v550 = 2 * v114;
            int v551 = -2 * v113;
            while (2)
            {
              sub_10000C40C(v1037, a3 + 300, 0, (uint64_t)&v1180, (uint64_t)&v1184, v112, &v1167, v9, (int32x4_t)v10);
              switch((int)v1177)
              {
                case 0:
                case 2:
                  sub_10001D650();
                case 1:
                case 3:
                  if (v1181[0])
                  {
                    --v1181[0];
                    uint64_t v554 = 2 * *((void *)&v1177 + 1);
                  }
                  else
                  {
                    uint64_t v554 = *((void *)&v1177 + 1);
                  }
                  v1181[1] += 2 * v554;
                  v553.i32[0] = vadd_s32(*(int32x2_t *)((char *)&v1180 + 4), (int32x2_t)0x200000002).u32[0];
                  *(int8x8_t *)v552.i8 = veor_s8(*(int8x8_t *)((char *)&v1180 + 4), (int8x8_t)0x100000001);
                  v553.i32[1] = v552.i32[1];
                  *(void *)((char *)&v1180 + 4) = v553.i64[0];
                  break;
                case 4:
                  if (v1181[0])
                  {
                    --v1181[0];
                    uint64_t v555 = 2 * *((void *)&v1177 + 1);
                  }
                  else
                  {
                    uint64_t v555 = *((void *)&v1177 + 1);
                  }
                  v1181[1] += 2 * v555;
                  DWORD1(v1180) += 2;
                  break;
                default:
                  sub_10001D624();
              }
              switch(LODWORD(v1181[2]))
              {
                case 0:
                case 2:
                  sub_10001D650();
                case 1:
                case 3:
                  if (v1185[0])
                  {
                    --v1185[0];
                    uint64_t v556 = 2 * v1181[3];
                  }
                  else
                  {
                    uint64_t v556 = v1181[3];
                  }
                  v1185[1] += 2 * v556;
                  v553.i32[0] = vadd_s32(*(int32x2_t *)((char *)&v1184 + 4), (int32x2_t)0x200000002).u32[0];
                  *(int8x8_t *)v552.i8 = veor_s8(*(int8x8_t *)((char *)&v1184 + 4), (int8x8_t)0x100000001);
                  v553.i32[1] = v552.i32[1];
                  *(void *)((char *)&v1184 + 4) = v553.i64[0];
                  break;
                case 4:
                  if (v1185[0])
                  {
                    --v1185[0];
                    uint64_t v557 = 2 * v1181[3];
                  }
                  else
                  {
                    uint64_t v557 = v1181[3];
                  }
                  v1185[1] += 2 * v557;
                  DWORD1(v1184) += 2;
                  break;
                default:
                  sub_10001D624();
              }
              sub_10000C40C(v1037, a3 + 300, 1, (uint64_t)&v1178, (uint64_t)&v1182, v112, &v1167, v552, v553);
              switch((int)v1177)
              {
                case 0:
                  *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                  v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1178 + 4), (int32x2_t)0x100000001).u32[0];
                  *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1178 + 4), (int8x8_t)0x100000001);
                  v10.n128_u32[1] = v9.u32[1];
                  *(void *)((char *)&v1178 + 4) = v10.n128_u64[0];
                  goto LABEL_650;
                case 1:
                case 3:
                case 4:
                  if ((void)v1179)
                  {
                    *(void *)&long long v1179 = v1179 - 1;
                    uint64_t v558 = *((void *)&v1177 + 1);
                  }
                  else
                  {
                    uint64_t v558 = 2 * *((void *)&v1177 + 1);
                  }
                  *((void *)&v1179 + 1) += 2 * v558;
                  int v559 = DWORD1(v1178) + 2;
                  goto LABEL_649;
                case 2:
                  *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                  int v559 = DWORD1(v1178) + 1;
LABEL_649:
                  DWORD1(v1178) = v559;
LABEL_650:
                  switch(LODWORD(v1181[2]))
                  {
                    case 0:
                      *((void *)&v1183 + 1) += 2 * v1181[3];
                      v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1182 + 4), (int32x2_t)0x100000001).u32[0];
                      *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1182 + 4), (int8x8_t)0x100000001);
                      v10.n128_u32[1] = v9.u32[1];
                      *(void *)((char *)&v1182 + 4) = v10.n128_u64[0];
                      goto LABEL_658;
                    case 1:
                    case 3:
                    case 4:
                      if ((void)v1183)
                      {
                        *(void *)&long long v1183 = v1183 - 1;
                        uint64_t v560 = v1181[3];
                      }
                      else
                      {
                        uint64_t v560 = 2 * v1181[3];
                      }
                      *((void *)&v1183 + 1) += 2 * v560;
                      int v561 = DWORD1(v1182) + 2;
                      goto LABEL_657;
                    case 2:
                      *((void *)&v1183 + 1) += 2 * v1181[3];
                      int v561 = DWORD1(v1182) + 1;
LABEL_657:
                      DWORD1(v1182) = v561;
LABEL_658:
                      unsigned int v562 = v1156;
                      if (v550 != 2) {
                        unsigned int v562 = 0;
                      }
                      v112 += 404 * v562;
                      if (v550 == 2) {
                        int v550 = v1135;
                      }
                      else {
                        v550 -= 2;
                      }
                      v551 += 2;
                      if (!v551) {
                        goto LABEL_707;
                      }
                      continue;
                    default:
                      sub_10001D67C();
                  }
                default:
                  sub_10001D67C();
              }
            }
          }
          goto LABEL_707;
        case 4u:
          if (v115)
          {
            int v563 = 2 * v114;
            int v564 = -2 * v113;
            while (2)
            {
              sub_10000C7F0((uint64_t)v1037, a3 + 300, (int *)&v1180, (int *)&v1184, v112, &v1167);
              switch((int)v1177)
              {
                case 0:
                case 2:
                  sub_10001D650();
                case 1:
                case 3:
                  if (v1181[0])
                  {
                    --v1181[0];
                    uint64_t v565 = 2 * *((void *)&v1177 + 1);
                  }
                  else
                  {
                    uint64_t v565 = *((void *)&v1177 + 1);
                  }
                  v1181[1] += 2 * v565;
                  LODWORD(v567) = vadd_s32(*(int32x2_t *)((char *)&v1180 + 4), (int32x2_t)0x200000002).u32[0];
                  HIDWORD(v567) = veor_s8(*(int8x8_t *)(&v1180 + 4), (int8x8_t)0x100000001).i32[1];
                  *(void *)((char *)&v1180 + 4) = v567;
                  break;
                case 4:
                  if (v1181[0])
                  {
                    --v1181[0];
                    uint64_t v566 = 2 * *((void *)&v1177 + 1);
                  }
                  else
                  {
                    uint64_t v566 = *((void *)&v1177 + 1);
                  }
                  v1181[1] += 2 * v566;
                  DWORD1(v1180) += 2;
                  break;
                default:
                  sub_10001D624();
              }
              switch(LODWORD(v1181[2]))
              {
                case 0:
                case 2:
                  sub_10001D650();
                case 1:
                case 3:
                  if (v1185[0])
                  {
                    --v1185[0];
                    uint64_t v568 = 2 * v1181[3];
                  }
                  else
                  {
                    uint64_t v568 = v1181[3];
                  }
                  v1185[1] += 2 * v568;
                  LODWORD(v570) = vadd_s32(*(int32x2_t *)((char *)&v1184 + 4), (int32x2_t)0x200000002).u32[0];
                  HIDWORD(v570) = veor_s8(*(int8x8_t *)(&v1184 + 4), (int8x8_t)0x100000001).i32[1];
                  *(void *)((char *)&v1184 + 4) = v570;
                  break;
                case 4:
                  if (v1185[0])
                  {
                    --v1185[0];
                    uint64_t v569 = 2 * v1181[3];
                  }
                  else
                  {
                    uint64_t v569 = v1181[3];
                  }
                  v1185[1] += 2 * v569;
                  DWORD1(v1184) += 2;
                  break;
                default:
                  sub_10001D624();
              }
              sub_10000C7F0((uint64_t)v1037, a3 + 300, (int *)&v1178, (int *)&v1182, v112, &v1167);
              switch((int)v1177)
              {
                case 0:
                  *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                  LODWORD(v573) = vadd_s32(*(int32x2_t *)((char *)&v1178 + 4), (int32x2_t)0x100000001).u32[0];
                  HIDWORD(v573) = veor_s8(*(int8x8_t *)(&v1178 + 4), (int8x8_t)0x100000001).i32[1];
                  *(void *)((char *)&v1178 + 4) = v573;
                  goto LABEL_693;
                case 1:
                case 3:
                case 4:
                  if ((void)v1179)
                  {
                    *(void *)&long long v1179 = v1179 - 1;
                    uint64_t v571 = *((void *)&v1177 + 1);
                  }
                  else
                  {
                    uint64_t v571 = 2 * *((void *)&v1177 + 1);
                  }
                  *((void *)&v1179 + 1) += 2 * v571;
                  int v572 = DWORD1(v1178) + 2;
                  goto LABEL_692;
                case 2:
                  *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                  int v572 = DWORD1(v1178) + 1;
LABEL_692:
                  DWORD1(v1178) = v572;
LABEL_693:
                  switch(LODWORD(v1181[2]))
                  {
                    case 0:
                      *((void *)&v1183 + 1) += 2 * v1181[3];
                      LODWORD(v576) = vadd_s32(*(int32x2_t *)((char *)&v1182 + 4), (int32x2_t)0x100000001).u32[0];
                      HIDWORD(v576) = veor_s8(*(int8x8_t *)(&v1182 + 4), (int8x8_t)0x100000001).i32[1];
                      *(void *)((char *)&v1182 + 4) = v576;
                      goto LABEL_701;
                    case 1:
                    case 3:
                    case 4:
                      if ((void)v1183)
                      {
                        *(void *)&long long v1183 = v1183 - 1;
                        uint64_t v574 = v1181[3];
                      }
                      else
                      {
                        uint64_t v574 = 2 * v1181[3];
                      }
                      *((void *)&v1183 + 1) += 2 * v574;
                      int v575 = DWORD1(v1182) + 2;
                      goto LABEL_700;
                    case 2:
                      *((void *)&v1183 + 1) += 2 * v1181[3];
                      int v575 = DWORD1(v1182) + 1;
LABEL_700:
                      DWORD1(v1182) = v575;
LABEL_701:
                      unsigned int v577 = v1156;
                      if (v563 != 2) {
                        unsigned int v577 = 0;
                      }
                      v112 += 404 * v577;
                      if (v563 == 2) {
                        int v563 = v1135;
                      }
                      else {
                        v563 -= 2;
                      }
                      v564 += 2;
                      if (!v564) {
                        goto LABEL_707;
                      }
                      continue;
                    default:
                      sub_10001D67C();
                  }
                default:
                  sub_10001D67C();
              }
            }
          }
          goto LABEL_707;
        default:
          sub_10001D51C();
      }
      while (1)
      {
        v139 = (const __int16 *)*((void *)&v1183 + 1);
        int v140 = v1182;
        if (v131) {
          int v141 = v131;
        }
        else {
          int v141 = v1182;
        }
        if (!v131) {
          v137 = (const __int16 *)*((void *)&v1183 + 1);
        }
        if (v141 <= 7)
        {
          int v142 = v138;
          if (v141 != v138)
          {
            if (v141 < 1) {
              sub_10001D72C();
            }
            unint64_t v143 = 0;
            uint64_t v144 = 2 * v141;
            do
            {
              v1168.i16[v143 / 2] = *v137;
              v1176.i16[v143 / 2] = v137[1];
              v1175.i16[v143 / 2] = v137[2];
              v1174.i16[v143 / 2] = v137[3];
              v143 += 2;
              v137 += 4;
            }
            while (v144 != v143);
            if (v138 >= 8) {
              int v145 = 8;
            }
            else {
              int v145 = v138;
            }
            if (v141 < v145)
            {
              v146 = &v1174.i16[(unint64_t)v144 / 2];
              v147 = &v1175.i16[(unint64_t)v144 / 2];
              v148 = &v1176.i16[(unint64_t)v144 / 2];
              v149 = &v1168.i16[(unint64_t)v144 / 2];
              int v150 = v141;
              do
              {
                *v149++ = *v139;
                *v148++ = v139[1];
                *v147++ = v139[2];
                *v146++ = v139[3];
                v139 += 4;
                ++v150;
              }
              while (v145 > v150);
            }
            int16x8_t v13 = (int16x8_t)v1168;
            v1202.val[1] = v1176;
            v1202.val[3] = v1174;
            v1202.val[2] = v1175;
            int v131 = v140 - v145 + v141;
            v137 = v139;
            goto LABEL_133;
          }
        }
        else
        {
          int v142 = 8;
        }
        int v131 = v141 - v142;
        *(int16x8x4_t *)v13.i8 = vld4q_s16(v137);
        v137 += 32;
LABEL_133:
        uint64_t v151 = 0;
        int8x16_t v152 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v13, v125));
        int16x8_t v153 = (int16x8_t)vandq_s8((int8x16_t)v1202.val[1], v126);
        int16x8_t v154 = vshrq_n_s16(v13, 3uLL);
        int8x16_t v155 = (int8x16_t)vaddq_s16(v1202.val[3], (int16x8_t)vbslq_s8((int8x16_t)vcltzq_s16(vshlq_n_s16((int16x8_t)vmovl_u8((uint8x8_t)v12), 0xFuLL)), (int8x16_t)vnegq_s16(v154), (int8x16_t)v154));
        int8x16_t v156 = (int8x16_t)vcgtq_u16((uint16x8_t)v153, v128);
        int8x16_t v157 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v1202.val[1], 3uLL)), 4uLL);
        int16x8_t v158 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v1202.val[2], v127), (int16x8_t)vbicq_s8(v122, (int8x16_t)v13)), vorrq_s8(v156, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v13, v124))));
        int16x8_t v159 = vaddq_s16((int16x8_t)vbslq_s8(v156, (int8x16_t)vaddq_s16(v153, v123), (int8x16_t)v153), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v13), (int8x16_t)vcgtq_s16(v1202.val[1], v123)), v126));
        int16x8_t v160 = (int16x8_t)vshrq_n_u16((uint16x8_t)vbslq_s8(v156, (int8x16_t)vshrq_n_u16((uint16x8_t)v157, 1uLL), v157), 1uLL);
        int16x8_t v161 = vqshlq_s16(vqdmulhq_s16(v160, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v158, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v1202.val[2], 4uLL))), v116);
        int8x16_t v162 = (int8x16_t)vqdmulhq_s16(v161, v160);
        int8x16_t v163 = (int8x16_t)vqdmulhq_s16(v161, (int16x8_t)vshrq_n_u16(vqshlq_n_u16((uint16x8_t)vabsq_s16(v154), 4uLL), 1uLL));
        int8x16_t v164 = (int8x16_t)vceqzq_s16(v158);
        int8x16_t v1168 = (int8x16_t)v159;
        int8x16_t v1169 = vornq_s8(vandq_s8((int8x16_t)v158, v152), v152);
        int8x16_t v1170 = vbslq_s8(v164, v155, v162);
        int8x16_t v1171 = vbslq_s8(v164, (int8x16_t)v1202.val[3], v163);
        int16x8_t v1176 = (int16x8_t)v155;
        v165 = &v1170;
        do
        {
          BOOL v166 = v132 == 0;
          if (!v132) {
            int v132 = v117;
          }
          uint64_t v167 = v136 + 404 * v166;
          unsigned int v168 = v165[-2].u16[0];
          uint64_t v169 = v165[-1].u16[0];
          uint64_t v170 = v165->u16[0];
          uint64_t v171 = v165[1].u16[0];
          ++*(_DWORD *)(v167 + 384);
          uint64_t v172 = v1176.u16[v151];
          *(void *)(v167 + 388) += v172;
          *(void *)(v167 + 396) += v172 * (unint64_t)v172;
          if (v169)
          {
            if (v169 != 0xFFFF)
            {
              v173 = (void *)(v167 + 24 * v168);
              uint64_t v174 = v173[1];
              *v173 += v169;
              v173[1] = v174 + v170;
              v173[2] += v171;
            }
          }
          else
          {
            v175 = (_DWORD *)(v136 + 404 * v166 + 12 * v134);
            ++v175[84];
            v175[85] += v170;
            v175[86] += v171;
          }
          ++v1167;
          if (v138 - 1 == v151) {
            goto LABEL_143;
          }
          v165 = (int8x16_t *)((char *)v165 + 2);
          v134 ^= 1u;
          --v132;
          ++v151;
          uint64_t v136 = v167;
        }
        while (v151 != 8);
        v138 -= 8;
        uint64_t v136 = v167;
        if (v138 + 1 <= 1)
        {
LABEL_143:
          if (!v131)
          {
            uint64_t v119 = *(void *)v1112;
            switch(v1033)
            {
              case 0:
                v118 += v1023;
                *((void *)&v1179 + 1) = v118;
                int v130 = v1095 + 1;
                *(void *)((char *)&v1178 + 4) = __PAIR64__(DWORD2(v1178), v1095 + 1) ^ 0x100000000;
                goto LABEL_152;
              case 1:
              case 3:
              case 4:
                if (*(void *)v1112)
                {
                  uint64_t v119 = *(void *)v1112 - 1;
                  *(void *)&long long v1179 = *(void *)v1112 - 1;
                  uint64_t v176 = v1023;
                }
                else
                {
                  uint64_t v176 = v1019;
                }
                v118 += v176;
                *((void *)&v1179 + 1) = v118;
                int v130 = v1095 + 2;
                goto LABEL_151;
              case 2:
                v118 += v1023;
                *((void *)&v1179 + 1) = v118;
                int v130 = v1095 + 1;
LABEL_151:
                DWORD1(v1178) = v130;
LABEL_152:
                switch(v1028)
                {
                  case 0:
                    *((void *)&v1183 + 1) += 2 * v1021;
                    int v121 = v1086 + 1;
                    DWORD1(v1182) = v1086 + 1;
                    DWORD2(v1182) ^= 1u;
                    goto LABEL_159;
                  case 1:
                  case 3:
                  case 4:
                    uint64_t v120 = v1075;
                    if (v1075)
                    {
                      uint64_t v120 = v1075 - 1;
                      *(void *)&long long v1183 = v1075 - 1;
                      uint64_t v177 = v1021;
                    }
                    else
                    {
                      uint64_t v177 = v1017;
                    }
                    int v178 = __srca;
                    *((void *)&v1183 + 1) += 2 * v177;
                    int v121 = v1086 + 2;
                    DWORD1(v1182) = v1086 + 2;
                    goto LABEL_160;
                  case 2:
                    *((void *)&v1183 + 1) += 2 * v1021;
                    int v121 = v1086 + 1;
                    DWORD1(v1182) = v1086 + 1;
LABEL_159:
                    uint64_t v120 = v1075;
                    int v178 = __srca;
LABEL_160:
                    int v129 = v178 - 1;
                    unsigned int v179 = v1156;
                    if (v178 != 1) {
                      unsigned int v179 = 0;
                    }
                    v112 += 404 * v179;
                    if (v178 == 1) {
                      int v129 = v1135;
                    }
                    if (!--v115) {
                      goto LABEL_707;
                    }
                    goto LABEL_110;
                  default:
                    sub_10001D67C();
                }
              default:
                sub_10001D67C();
            }
          }
          sub_10001D700();
        }
      }
    }
    int v115 = *(_DWORD *)(a3 + 20);
    int v1135 = *(_DWORD *)(a3 + 28);
    int v1167 = 0;
LABEL_300:
    if (!v115) {
      goto LABEL_707;
    }
    int16x8_t v334 = vdupq_n_s16(*(char *)(a3 + 304));
    int v335 = 2 * *(_DWORD *)(a3 + 24);
    int v336 = 2 * *(_DWORD *)(a3 + 16);
    v338 = (__int16 *)*((void *)&v1179 + 1);
    v337 = (char *)v1179;
    int v339 = DWORD1(v1178);
    int v1020 = DWORD2(v1178);
    int v1030 = v1178;
    int v1025 = 2 * v1178;
    uint64_t v1039 = *((void *)&v1177 + 1);
    uint64_t v1015 = 2 * *((void *)&v1177 + 1);
    uint64_t v1034 = v1181[3];
    uint64_t v1014 = 2 * v1181[3];
    uint64_t v340 = v1183;
    int v1016 = v336;
    int v1018 = DWORD2(v1182);
    int v1022 = v336 - 2;
    v341.i64[0] = 0x1000100010001;
    v341.i64[1] = 0x1000100010001;
    v342.i64[0] = -1;
    v342.i64[1] = -1;
    v343.i64[0] = 0x2000200020002;
    v343.i64[1] = 0x2000200020002;
    v344.i64[0] = 0x4000400040004;
    v344.i64[1] = 0x4000400040004;
    v345.i64[0] = 0x7000700070007;
    v345.i64[1] = 0x7000700070007;
    v346.i64[0] = 0xF000F000F000FLL;
    v346.i64[1] = 0xF000F000F000FLL;
    v347.i64[0] = 0x5000500050005;
    v347.i64[1] = 0x5000500050005;
    int v348 = v1135;
    int v349 = DWORD1(v1182);
    int v1050 = v1181[2];
    int v1056 = v1177;
LABEL_302:
    int v1077 = v349;
    *(void *)v1088 = v340;
    v1097 = v337;
    int v1115 = v339;
    if (v336 < 1) {
      goto LABEL_345;
    }
    int v350 = 0;
    v351 = (char *)&v1182 + 8;
    uint64_t v352 = v112 - 404;
    if (v1030) {
      v351 = (char *)&v1178 + 8;
    }
    uint64_t v353 = *(int *)v351;
    int v354 = v1022;
    v355 = v338;
    int v356 = v1025;
    int v357 = v336;
    __srcc = v338;
LABEL_306:
    v358 = (__int16 *)*((void *)&v1183 + 1);
    int v359 = v1182;
    if (v356) {
      int v360 = v356;
    }
    else {
      int v360 = 2 * v1182;
    }
    if (v356) {
      v361 = v355;
    }
    else {
      v361 = (__int16 *)*((void *)&v1183 + 1);
    }
    if (v360 < 16)
    {
      int v362 = v357;
      if (v360 != v357)
      {
        if (v360 <= 0) {
          sub_10001D758();
        }
        uint64_t v370 = v360 >> 1;
        if (v360 != 1)
        {
          if (v370 <= 1) {
            uint64_t v371 = 1;
          }
          else {
            uint64_t v371 = v370;
          }
          v372 = v361 + 4;
          v373 = &v1173;
          v374 = &v1172;
          v375 = &v1174;
          v376 = &v1175;
          v377 = &v1176;
          v378 = &v1168;
          do
          {
            v378->i16[0] = *v372;
            v378 = (int8x16_t *)((char *)v378 + 2);
            v377->i16[0] = v372[1];
            v377 = (int16x8_t *)((char *)v377 + 2);
            v376->i16[0] = v372[2];
            v376 = (int16x8_t *)((char *)v376 + 2);
            v375->i16[0] = v372[3];
            v375 = (int16x8_t *)((char *)v375 + 2);
            __int16 v379 = *(v372 - 1);
            v374->i16[0] = v379;
            v374 = (int8x16_t *)((char *)v374 + 2);
            v373->i16[0] = v379 - (*(v372 - 4) >> 3);
            v373 = (int16x8_t *)((char *)v373 + 2);
            v372 += 8;
            --v371;
          }
          while (v371);
        }
        LODWORD(v380) = v357 >> 1;
        if (v357 <= 15) {
          uint64_t v380 = v380;
        }
        else {
          uint64_t v380 = 8;
        }
        if (v370 >= v380)
        {
          int v336 = v1016;
        }
        else
        {
          uint64_t v381 = v370;
          int v336 = v1016;
          do
          {
            v1168.i16[v381] = v358[4];
            v1176.i16[v381] = v358[5];
            v1175.i16[v381] = v358[6];
            v1174.i16[v381] = v358[7];
            __int16 v382 = v358[3];
            v1172.i16[v381] = v382;
            v1173.i16[v381] = v382 - (*v358 >> 3);
            v358 += 8;
            ++v381;
          }
          while (v380 != v381);
        }
        int16x8_t v364 = (int16x8_t)v1168;
        int16x8_t v365 = v1176;
        int8x16_t v368 = (int8x16_t)v1174;
        int8x16_t v366 = (int8x16_t)v1175;
        int16x8_t v367 = (int16x8_t)v1172;
        int8x16_t v369 = (int8x16_t)v1173;
        int v356 = 2 * (v359 - v380 + v370);
        v355 = v358;
        goto LABEL_332;
      }
    }
    else
    {
      int v362 = 16;
    }
    v363 = v361;
    int16x8x4_t v1203 = vld4q_s16(v363);
    v363 += 32;
    int16x8x4_t v1204 = vld4q_s16(v363);
    int16x8_t v364 = vuzp2q_s16(v1203.val[0], v1204.val[0]);
    int16x8_t v365 = vuzp2q_s16(v1203.val[1], v1204.val[1]);
    int8x16_t v366 = (int8x16_t)vuzp2q_s16(v1203.val[2], v1204.val[2]);
    int16x8_t v367 = vuzp1q_s16(v1203.val[3], v1204.val[3]);
    int8x16_t v368 = (int8x16_t)vuzp2q_s16(v1203.val[3], v1204.val[3]);
    int8x16_t v369 = (int8x16_t)vsraq_n_s16(v367, vuzp1q_s16(v1203.val[0], v1204.val[0]), 3uLL);
    v355 = v361 + 64;
    int v356 = v360 - v362;
LABEL_332:
    uint64_t v383 = 0;
    int8x16_t v384 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v364, v344));
    int16x8_t v385 = (int16x8_t)vandq_s8((int8x16_t)v365, v345);
    int8x16_t v386 = (int8x16_t)vcgtq_u16((uint16x8_t)v385, v347);
    int8x16_t v387 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v365, 3uLL)), 4uLL);
    uint16x8_t v388 = vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v364, 3uLL)), 4uLL);
    int16x8_t v389 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8(v366, v346), (int16x8_t)vbicq_s8(v341, (int8x16_t)v364)), vorrq_s8(v386, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v364, v343))));
    int8x16_t v390 = (int8x16_t)vaddq_s16((int16x8_t)vbslq_s8(v386, (int8x16_t)vaddq_s16(v385, v342), (int8x16_t)v385), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v364), (int8x16_t)vcgtq_s16(v365, v342)), v345));
    int16x8_t v391 = vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v389, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v366, 4uLL));
    int16x8_t v392 = (int16x8_t)vshrq_n_u16((uint16x8_t)vbslq_s8(v386, (int8x16_t)vshrq_n_u16((uint16x8_t)v387, 1uLL), v387), 1uLL);
    int16x8_t v393 = vqshlq_s16(vqdmulhq_s16(v392, v391), v334);
    int8x16_t v394 = (int8x16_t)vceqzq_s16(v389);
    int16x8_t v1176 = (int16x8_t)v369;
    int8x16_t v1168 = vornq_s8(vandq_s8((int8x16_t)v389, v384), v384);
    int8x16_t v1169 = vbslq_s8(v394, v369, (int8x16_t)vqdmulhq_s16(v393, v392));
    int8x16_t v1170 = vbslq_s8(v394, (int8x16_t)v367, (int8x16_t)vqdmulhq_s16(v393, (int16x8_t)vshrq_n_u16(v388, 1uLL)));
    int8x16_t v1171 = vbslq_s8(v394, v368, v390);
    while (1)
    {
      BOOL v395 = v350 == 0;
      if (!v350) {
        int v350 = v335;
      }
      uint64_t v396 = v352 + 404 * v395;
      uint64_t v397 = v1168.u16[v383];
      ++*(_DWORD *)(v396 + 384);
      uint64_t v398 = v1176.u16[v383];
      *(void *)(v396 + 388) += v398;
      *(void *)(v396 + 396) += v398 * (unint64_t)v398;
      if (v397)
      {
        if (v397 != 0xFFFF)
        {
          uint64_t v399 = v1170.u16[v383];
          v400 = (void *)(v396 + 24 * v1171.u16[v383]);
          uint64_t v401 = v400[1] + *(unsigned __int16 *)((char *)&v1168 + v383 * 2 + 16);
          *v400 += v397;
          v400[1] = v401;
          v400[2] += v399;
        }
      }
      else
      {
        int v402 = *(unsigned __int16 *)((char *)&v1168 + v383 * 2 + 16);
        int v403 = v1170.u16[v383];
        int v404 = v1171.u16[v383];
        uint64_t v405 = v352 + 404 * v395 + 336;
        v406 = (_DWORD *)(v405 + 12 * (int)v353);
        int v407 = v406[1] + v402;
        ++*v406;
        v406[1] = v407;
        v406[2] += v403;
        v408 = (_DWORD *)(v405 + 12 * (v353 + 1));
        LODWORD(v406) = v408[1];
        ++*v408;
        v408[1] = v406 + v402;
        v408[2] += v404;
      }
      ++v1167;
      if (v354 == (v383 * 2)) {
        break;
      }
      v350 -= 2;
      ++v383;
      uint64_t v352 = v396;
      if (v383 == 8)
      {
        v354 -= 16;
        uint64_t v352 = v396;
        BOOL v902 = v357 <= 16;
        v357 -= 16;
        v338 = __srcc;
        if (!v902) {
          goto LABEL_306;
        }
LABEL_345:
        v337 = v1097;
        switch(v1056)
        {
          case 0:
            v338 += v1039;
            *((void *)&v1179 + 1) = v338;
            int v339 = v1115 + 1;
            DWORD1(v1178) = v1115 + 1;
            v1020 ^= 1u;
            DWORD2(v1178) = v1020;
            goto LABEL_353;
          case 1:
          case 3:
          case 4:
            if (v1097)
            {
              v337 = v1097 - 1;
              *(void *)&long long v1179 = v1097 - 1;
              uint64_t v409 = v1039;
            }
            else
            {
              uint64_t v409 = v1015;
            }
            v338 += v409;
            *((void *)&v1179 + 1) = v338;
            int v339 = v1115 + 2;
            goto LABEL_352;
          case 2:
            v338 += v1039;
            *((void *)&v1179 + 1) = v338;
            int v339 = v1115 + 1;
LABEL_352:
            DWORD1(v1178) = v339;
LABEL_353:
            switch(v1050)
            {
              case 0:
                *((void *)&v1183 + 1) += 2 * v1034;
                ++v349;
                DWORD1(v1182) = v1077 + 1;
                v1018 ^= 1u;
                DWORD2(v1182) = v1018;
                goto LABEL_360;
              case 1:
              case 3:
              case 4:
                uint64_t v340 = *(void *)v1088;
                if (*(void *)v1088)
                {
                  uint64_t v340 = *(void *)v1088 - 1;
                  *(void *)&long long v1183 = *(void *)v1088 - 1;
                  uint64_t v410 = v1034;
                }
                else
                {
                  uint64_t v410 = v1014;
                }
                *((void *)&v1183 + 1) += 2 * v410;
                v349 += 2;
                DWORD1(v1182) = v1077 + 2;
                goto LABEL_361;
              case 2:
                *((void *)&v1183 + 1) += 2 * v1034;
                ++v349;
                DWORD1(v1182) = v1077 + 1;
LABEL_360:
                uint64_t v340 = *(void *)v1088;
LABEL_361:
                unsigned int v411 = v1156;
                if (v348 != 1) {
                  unsigned int v411 = 0;
                }
                v112 += 404 * v411;
                if (v348 == 1) {
                  int v348 = v1135;
                }
                else {
                  --v348;
                }
                if (!--v115) {
                  goto LABEL_707;
                }
                goto LABEL_302;
              default:
                sub_10001D67C();
            }
          default:
            sub_10001D67C();
        }
      }
    }
    v338 = __srcc;
    goto LABEL_345;
  }
  unsigned int v14 = *(_DWORD *)(a3 + 12);
  if (v14 > 4) {
    sub_10001D150();
  }
  uint64_t v15 = a3 + 6948;
  if (v14 != 2)
  {
    int v16 = *(_DWORD *)(a3 + 20);
    int v17 = *(_DWORD *)(a3 + 28);
    v1168.i32[0] = 0;
    int v18 = 2 * v16;
    int v1133 = 2 * v17;
    switch(v14)
    {
      case 0u:
        if (v18)
        {
          int v19 = *(_DWORD *)(a3 + 24);
          uint64_t v20 = (unsigned __int16 *)*((void *)&v1179 + 1);
          uint64_t v21 = v1179;
          int v1073 = DWORD2(v1178);
          int v22 = DWORD1(v1178);
          uint64_t v23 = v1183;
          uint64_t v1053 = *((void *)&v1177 + 1);
          uint64_t v1047 = v1181[3];
          uint64_t v1027 = 2 * v1181[3];
          uint64_t v1032 = 2 * *((void *)&v1177 + 1);
          int __src = *(_DWORD *)(a3 + 16);
          int v1085 = v1178;
          int v24 = v1177;
          int8x8_t v25 = (int8x8_t)vdup_n_s32(0x7FF8u);
          int v26 = 2 * v17;
          int v27 = DWORD1(v1182);
          int v28 = v1181[2];
          while (2)
          {
            int v1094 = v27;
            *(void *)v1111 = v23;
            int v29 = v1085;
            if (__src >= 1)
            {
              int v30 = 0;
              uint64_t v31 = v15 - 404;
              char v32 = *(unsigned char *)(a3 + 304);
              int v33 = __src + 1;
              float v34 = v20;
              int v35 = v1073;
              int v29 = v1085;
              do
              {
                if (v29) {
                  int v36 = v29;
                }
                else {
                  int v36 = v1182;
                }
                if (v29) {
                  int v37 = v35;
                }
                else {
                  int v37 = DWORD2(v1182);
                }
                if (v29) {
                  float v38 = v34;
                }
                else {
                  float v38 = (unsigned __int16 *)*((void *)&v1183 + 1);
                }
                BOOL v39 = v30 == 0;
                if (v30) {
                  int v40 = v30;
                }
                else {
                  int v40 = v19;
                }
                uint64_t v41 = v31 + 404 * (v30 == 0);
                unsigned int v42 = *v38;
                int v43 = (__int16)v42 >> 3;
                int v44 = v38[3];
                if (v37) {
                  int v45 = -v43;
                }
                else {
                  LOWORD(v45) = (__int16)v42 >> 3;
                }
                unsigned __int16 v46 = v45 + v44;
                ++*(_DWORD *)(v41 + 384);
                *(void *)(v41 + 388) += (unsigned __int16)(v45 + v44);
                *(void *)(v41 + 396) += (unsigned __int16)(v45 + v44)
                                        * (unint64_t)(unsigned __int16)(v45 + v44);
                if ((v42 & 4) == 0)
                {
                  int v47 = (__int16)v38[1];
                  unsigned int v48 = v47 & 7;
                  if ((v42 & 1) != 0 || (((v47 & 7u) < 6) & (v42 >> 1)) != 0)
                  {
                    float v61 = (_DWORD *)(v31 + 404 * v39 + 12 * v37);
                    ++v61[84];
                    v61[85] += v46;
                    v61[86] += v44;
                  }
                  else
                  {
                    __int16 v49 = v48 > 5;
                    unsigned int v50 = v38[2];
                    uint64_t v51 = (v50 & 0xF) + 1;
                    unsigned int v52 = v50 >> 4;
                    int v53 = v47 >> 3;
                    if (v47 < 0) {
                      int v53 = -v53;
                    }
                    if (v43 < 0) {
                      int v43 = -v43;
                    }
                    unsigned __int16 v54 = v48 - v49;
                    unsigned int v55 = (16 * (v53 & 0xFFFu)) >> v49;
                    unsigned int v56 = (v51 >> 1) * v52;
                    int v57 = 8 * v43;
                    if (((v47 ^ v42) & 0x8000u) == 0) {
                      v54 += 7;
                    }
                    uint64_t v58 = v41 + 24 * v54;
                    v10.n128_u32[0] = v55;
                    v59.i32[0] = vshr_n_u32((uint32x2_t)v10.n128_u64[0], 1uLL).u32[0];
                    v10.n128_u32[1] = v57;
                    v59.i32[1] = vand_s8(*(int8x8_t *)&v10, v25).i32[1];
                    signed int v60 = (v59.i32[0] * v56) >> 15 << v32;
                    if (v60 <= -32768) {
                      signed int v60 = -32768;
                    }
                    if (v60 >= 0x7FFF) {
                      signed int v60 = 0x7FFF;
                    }
                    *(void *)v58 += v51;
                    __n128 v10 = (__n128)vaddw_u32(*(uint64x2_t *)(v58 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v60), v59), 0xFuLL));
                    *(__n128 *)(v58 + 8) = v10;
                  }
                }
                float v34 = v38 + 4;
                int v29 = v36 - 1;
                int v30 = v40 - 1;
                ++v1168.i32[0];
                int v35 = v37 ^ 1;
                --v33;
                uint64_t v31 = v41;
              }
              while (v33 > 1);
            }
            if (!v29)
            {
              switch(v24)
              {
                case 0:
                  v20 += v1053;
                  *((void *)&v1179 + 1) = v20;
                  DWORD1(v1178) = ++v22;
                  v1073 ^= 1u;
                  DWORD2(v1178) = v1073;
                  goto LABEL_53;
                case 1:
                case 3:
                case 4:
                  if (v21)
                  {
                    *(void *)&long long v1179 = --v21;
                    uint64_t v62 = v1053;
                  }
                  else
                  {
                    uint64_t v62 = v1032;
                  }
                  v20 += v62;
                  *((void *)&v1179 + 1) = v20;
                  v22 += 2;
                  goto LABEL_52;
                case 2:
                  v20 += v1053;
                  *((void *)&v1179 + 1) = v20;
                  ++v22;
LABEL_52:
                  DWORD1(v1178) = v22;
LABEL_53:
                  switch(v28)
                  {
                    case 0:
                      *((void *)&v1183 + 1) += 2 * v1047;
                      int v27 = v1094 + 1;
                      DWORD1(v1182) = v1094 + 1;
                      DWORD2(v1182) ^= 1u;
                      goto LABEL_60;
                    case 1:
                    case 3:
                    case 4:
                      uint64_t v23 = *(void *)v1111;
                      if (*(void *)v1111)
                      {
                        uint64_t v23 = *(void *)v1111 - 1;
                        *(void *)&long long v1183 = *(void *)v1111 - 1;
                        uint64_t v63 = v1047;
                      }
                      else
                      {
                        uint64_t v63 = v1027;
                      }
                      *((void *)&v1183 + 1) += 2 * v63;
                      int v27 = v1094 + 2;
                      DWORD1(v1182) = v1094 + 2;
                      goto LABEL_61;
                    case 2:
                      *((void *)&v1183 + 1) += 2 * v1047;
                      int v27 = v1094 + 1;
                      DWORD1(v1182) = v1094 + 1;
LABEL_60:
                      uint64_t v23 = *(void *)v1111;
LABEL_61:
                      unsigned int v64 = v1156;
                      if (v26 != 1) {
                        unsigned int v64 = 0;
                      }
                      v15 += 404 * v64;
                      if (v26 == 1) {
                        int v26 = v1133;
                      }
                      else {
                        --v26;
                      }
                      if (!--v18) {
                        goto LABEL_707;
                      }
                      continue;
                    default:
                      sub_10001D67C();
                  }
                default:
                  sub_10001D67C();
              }
            }
            break;
          }
          sub_10001D6A8();
        }
        goto LABEL_707;
      case 1u:
        if (v18)
        {
          int v481 = 2 * v17;
          int v482 = -2 * v16;
          while (2)
          {
            sub_10000BF70((uint64_t)v1037, a3 + 300, 1, (int *)&v1178, (int *)&v1182, v15, &v1168, *(double *)v9.i64, v10);
            switch((int)v1177)
            {
              case 0:
                *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                v484.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1178 + 4), (int32x2_t)0x100000001).u32[0];
                int8x8_t v483 = veor_s8(*(int8x8_t *)((char *)&v1178 + 4), (int8x8_t)0x100000001);
                v484.n128_u32[1] = v483.u32[1];
                *(void *)((char *)&v1178 + 4) = v484.n128_u64[0];
                goto LABEL_424;
              case 1:
              case 3:
              case 4:
                if ((void)v1179)
                {
                  *(void *)&long long v1179 = v1179 - 1;
                  uint64_t v485 = *((void *)&v1177 + 1);
                }
                else
                {
                  uint64_t v485 = 2 * *((void *)&v1177 + 1);
                }
                *((void *)&v1179 + 1) += 2 * v485;
                int v486 = DWORD1(v1178) + 2;
                goto LABEL_423;
              case 2:
                *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                int v486 = DWORD1(v1178) + 1;
LABEL_423:
                DWORD1(v1178) = v486;
LABEL_424:
                switch(LODWORD(v1181[2]))
                {
                  case 0:
                    *((void *)&v1183 + 1) += 2 * v1181[3];
                    v484.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1182 + 4), (int32x2_t)0x100000001).u32[0];
                    int8x8_t v483 = veor_s8(*(int8x8_t *)((char *)&v1182 + 4), (int8x8_t)0x100000001);
                    v484.n128_u32[1] = v483.u32[1];
                    *(void *)((char *)&v1182 + 4) = v484.n128_u64[0];
                    goto LABEL_432;
                  case 1:
                  case 3:
                  case 4:
                    if ((void)v1183)
                    {
                      *(void *)&long long v1183 = v1183 - 1;
                      uint64_t v487 = v1181[3];
                    }
                    else
                    {
                      uint64_t v487 = 2 * v1181[3];
                    }
                    *((void *)&v1183 + 1) += 2 * v487;
                    int v488 = DWORD1(v1182) + 2;
                    goto LABEL_431;
                  case 2:
                    *((void *)&v1183 + 1) += 2 * v1181[3];
                    int v488 = DWORD1(v1182) + 1;
LABEL_431:
                    DWORD1(v1182) = v488;
LABEL_432:
                    sub_10000BF70((uint64_t)v1037, a3 + 300, 0, (int *)&v1180, (int *)&v1184, v15, &v1168, *(double *)&v483, v484);
                    switch((int)v1177)
                    {
                      case 0:
                      case 2:
                        sub_10001D650();
                      case 1:
                      case 3:
                        if (v1181[0])
                        {
                          --v1181[0];
                          uint64_t v489 = 2 * *((void *)&v1177 + 1);
                        }
                        else
                        {
                          uint64_t v489 = *((void *)&v1177 + 1);
                        }
                        v1181[1] += 2 * v489;
                        v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1180 + 4), (int32x2_t)0x200000002).u32[0];
                        *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1180 + 4), (int8x8_t)0x100000001);
                        v10.n128_u32[1] = v9.u32[1];
                        *(void *)((char *)&v1180 + 4) = v10.n128_u64[0];
                        break;
                      case 4:
                        if (v1181[0])
                        {
                          --v1181[0];
                          uint64_t v490 = 2 * *((void *)&v1177 + 1);
                        }
                        else
                        {
                          uint64_t v490 = *((void *)&v1177 + 1);
                        }
                        v1181[1] += 2 * v490;
                        DWORD1(v1180) += 2;
                        break;
                      default:
                        sub_10001D624();
                    }
                    switch(LODWORD(v1181[2]))
                    {
                      case 0:
                      case 2:
                        sub_10001D650();
                      case 1:
                      case 3:
                        if (v1185[0])
                        {
                          --v1185[0];
                          uint64_t v491 = 2 * v1181[3];
                        }
                        else
                        {
                          uint64_t v491 = v1181[3];
                        }
                        v1185[1] += 2 * v491;
                        v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1184 + 4), (int32x2_t)0x200000002).u32[0];
                        *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1184 + 4), (int8x8_t)0x100000001);
                        v10.n128_u32[1] = v9.u32[1];
                        *(void *)((char *)&v1184 + 4) = v10.n128_u64[0];
                        break;
                      case 4:
                        if (v1185[0])
                        {
                          --v1185[0];
                          uint64_t v492 = 2 * v1181[3];
                        }
                        else
                        {
                          uint64_t v492 = v1181[3];
                        }
                        v1185[1] += 2 * v492;
                        DWORD1(v1184) += 2;
                        break;
                      default:
                        sub_10001D624();
                    }
                    unsigned int v493 = v1156;
                    if (v481 != 2) {
                      unsigned int v493 = 0;
                    }
                    v15 += 404 * v493;
                    if (v481 == 2) {
                      int v481 = v1133;
                    }
                    else {
                      v481 -= 2;
                    }
                    v482 += 2;
                    if (!v482) {
                      goto LABEL_707;
                    }
                    continue;
                  default:
                    sub_10001D67C();
                }
              default:
                sub_10001D67C();
            }
          }
        }
        goto LABEL_707;
      case 2u:
        goto LABEL_210;
      case 3u:
        if (v18)
        {
          int v494 = 2 * v17;
          int v495 = -2 * v16;
          while (2)
          {
            sub_10000BF70((uint64_t)v1037, a3 + 300, 0, (int *)&v1180, (int *)&v1184, v15, &v1168, *(double *)v9.i64, v10);
            switch((int)v1177)
            {
              case 0:
              case 2:
                sub_10001D650();
              case 1:
              case 3:
                if (v1181[0])
                {
                  --v1181[0];
                  uint64_t v498 = 2 * *((void *)&v1177 + 1);
                }
                else
                {
                  uint64_t v498 = *((void *)&v1177 + 1);
                }
                v1181[1] += 2 * v498;
                v497.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1180 + 4), (int32x2_t)0x200000002).u32[0];
                int8x8_t v496 = veor_s8(*(int8x8_t *)((char *)&v1180 + 4), (int8x8_t)0x100000001);
                v497.n128_u32[1] = v496.u32[1];
                *(void *)((char *)&v1180 + 4) = v497.n128_u64[0];
                break;
              case 4:
                if (v1181[0])
                {
                  --v1181[0];
                  uint64_t v499 = 2 * *((void *)&v1177 + 1);
                }
                else
                {
                  uint64_t v499 = *((void *)&v1177 + 1);
                }
                v1181[1] += 2 * v499;
                DWORD1(v1180) += 2;
                break;
              default:
                sub_10001D624();
            }
            switch(LODWORD(v1181[2]))
            {
              case 0:
              case 2:
                sub_10001D650();
              case 1:
              case 3:
                if (v1185[0])
                {
                  --v1185[0];
                  uint64_t v500 = 2 * v1181[3];
                }
                else
                {
                  uint64_t v500 = v1181[3];
                }
                v1185[1] += 2 * v500;
                v497.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1184 + 4), (int32x2_t)0x200000002).u32[0];
                int8x8_t v496 = veor_s8(*(int8x8_t *)((char *)&v1184 + 4), (int8x8_t)0x100000001);
                v497.n128_u32[1] = v496.u32[1];
                *(void *)((char *)&v1184 + 4) = v497.n128_u64[0];
                break;
              case 4:
                if (v1185[0])
                {
                  --v1185[0];
                  uint64_t v501 = 2 * v1181[3];
                }
                else
                {
                  uint64_t v501 = v1181[3];
                }
                v1185[1] += 2 * v501;
                DWORD1(v1184) += 2;
                break;
              default:
                sub_10001D624();
            }
            sub_10000BF70((uint64_t)v1037, a3 + 300, 1, (int *)&v1178, (int *)&v1182, v15, &v1168, *(double *)&v496, v497);
            switch((int)v1177)
            {
              case 0:
                *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1178 + 4), (int32x2_t)0x100000001).u32[0];
                *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1178 + 4), (int8x8_t)0x100000001);
                v10.n128_u32[1] = v9.u32[1];
                *(void *)((char *)&v1178 + 4) = v10.n128_u64[0];
                goto LABEL_485;
              case 1:
              case 3:
              case 4:
                if ((void)v1179)
                {
                  *(void *)&long long v1179 = v1179 - 1;
                  uint64_t v502 = *((void *)&v1177 + 1);
                }
                else
                {
                  uint64_t v502 = 2 * *((void *)&v1177 + 1);
                }
                *((void *)&v1179 + 1) += 2 * v502;
                int v503 = DWORD1(v1178) + 2;
                goto LABEL_484;
              case 2:
                *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                int v503 = DWORD1(v1178) + 1;
LABEL_484:
                DWORD1(v1178) = v503;
LABEL_485:
                switch(LODWORD(v1181[2]))
                {
                  case 0:
                    *((void *)&v1183 + 1) += 2 * v1181[3];
                    v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1182 + 4), (int32x2_t)0x100000001).u32[0];
                    *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1182 + 4), (int8x8_t)0x100000001);
                    v10.n128_u32[1] = v9.u32[1];
                    *(void *)((char *)&v1182 + 4) = v10.n128_u64[0];
                    goto LABEL_493;
                  case 1:
                  case 3:
                  case 4:
                    if ((void)v1183)
                    {
                      *(void *)&long long v1183 = v1183 - 1;
                      uint64_t v504 = v1181[3];
                    }
                    else
                    {
                      uint64_t v504 = 2 * v1181[3];
                    }
                    *((void *)&v1183 + 1) += 2 * v504;
                    int v505 = DWORD1(v1182) + 2;
                    goto LABEL_492;
                  case 2:
                    *((void *)&v1183 + 1) += 2 * v1181[3];
                    int v505 = DWORD1(v1182) + 1;
LABEL_492:
                    DWORD1(v1182) = v505;
LABEL_493:
                    unsigned int v506 = v1156;
                    if (v494 != 2) {
                      unsigned int v506 = 0;
                    }
                    v15 += 404 * v506;
                    if (v494 == 2) {
                      int v494 = v1133;
                    }
                    else {
                      v494 -= 2;
                    }
                    v495 += 2;
                    if (!v495) {
                      goto LABEL_707;
                    }
                    continue;
                  default:
                    sub_10001D67C();
                }
              default:
                sub_10001D67C();
            }
          }
        }
        goto LABEL_707;
      case 4u:
        if (v18)
        {
          int v507 = 2 * v17;
          int v508 = -2 * v16;
          while (2)
          {
            sub_10000C1A0((uint64_t)v1037, a3 + 300, (uint64_t)&v1180, (uint64_t)&v1184, v15, &v1168, *(double *)v9.i64, v10.n128_f64[0], v11);
            switch((int)v1177)
            {
              case 0:
              case 2:
                sub_10001D650();
              case 1:
              case 3:
                if (v1181[0])
                {
                  --v1181[0];
                  uint64_t v512 = 2 * *((void *)&v1177 + 1);
                }
                else
                {
                  uint64_t v512 = *((void *)&v1177 + 1);
                }
                v1181[1] += 2 * v512;
                LODWORD(v510) = vadd_s32(*(int32x2_t *)((char *)&v1180 + 4), (int32x2_t)0x200000002).u32[0];
                int8x8_t v509 = veor_s8(*(int8x8_t *)((char *)&v1180 + 4), (int8x8_t)0x100000001);
                HIDWORD(v510) = v509.i32[1];
                *(double *)((char *)&v1180 + 4) = v510;
                break;
              case 4:
                if (v1181[0])
                {
                  --v1181[0];
                  uint64_t v513 = 2 * *((void *)&v1177 + 1);
                }
                else
                {
                  uint64_t v513 = *((void *)&v1177 + 1);
                }
                v1181[1] += 2 * v513;
                DWORD1(v1180) += 2;
                break;
              default:
                sub_10001D624();
            }
            switch(LODWORD(v1181[2]))
            {
              case 0:
              case 2:
                sub_10001D650();
              case 1:
              case 3:
                if (v1185[0])
                {
                  --v1185[0];
                  uint64_t v514 = 2 * v1181[3];
                }
                else
                {
                  uint64_t v514 = v1181[3];
                }
                v1185[1] += 2 * v514;
                LODWORD(v510) = vadd_s32(*(int32x2_t *)((char *)&v1184 + 4), (int32x2_t)0x200000002).u32[0];
                int8x8_t v509 = veor_s8(*(int8x8_t *)((char *)&v1184 + 4), (int8x8_t)0x100000001);
                HIDWORD(v510) = v509.i32[1];
                *(double *)((char *)&v1184 + 4) = v510;
                break;
              case 4:
                if (v1185[0])
                {
                  --v1185[0];
                  uint64_t v515 = 2 * v1181[3];
                }
                else
                {
                  uint64_t v515 = v1181[3];
                }
                v1185[1] += 2 * v515;
                DWORD1(v1184) += 2;
                break;
              default:
                sub_10001D624();
            }
            sub_10000C1A0((uint64_t)v1037, a3 + 300, (uint64_t)&v1178, (uint64_t)&v1182, v15, &v1168, *(double *)&v509, v510, v511);
            switch((int)v1177)
            {
              case 0:
                *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1178 + 4), (int32x2_t)0x100000001).u32[0];
                *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1178 + 4), (int8x8_t)0x100000001);
                v10.n128_u32[1] = v9.u32[1];
                *(void *)((char *)&v1178 + 4) = v10.n128_u64[0];
                goto LABEL_528;
              case 1:
              case 3:
              case 4:
                if ((void)v1179)
                {
                  *(void *)&long long v1179 = v1179 - 1;
                  uint64_t v516 = *((void *)&v1177 + 1);
                }
                else
                {
                  uint64_t v516 = 2 * *((void *)&v1177 + 1);
                }
                *((void *)&v1179 + 1) += 2 * v516;
                int v517 = DWORD1(v1178) + 2;
                goto LABEL_527;
              case 2:
                *((void *)&v1179 + 1) += 2 * *((void *)&v1177 + 1);
                int v517 = DWORD1(v1178) + 1;
LABEL_527:
                DWORD1(v1178) = v517;
LABEL_528:
                switch(LODWORD(v1181[2]))
                {
                  case 0:
                    *((void *)&v1183 + 1) += 2 * v1181[3];
                    v10.n128_u32[0] = vadd_s32(*(int32x2_t *)((char *)&v1182 + 4), (int32x2_t)0x100000001).u32[0];
                    *(int8x8_t *)v9.i8 = veor_s8(*(int8x8_t *)((char *)&v1182 + 4), (int8x8_t)0x100000001);
                    v10.n128_u32[1] = v9.u32[1];
                    *(void *)((char *)&v1182 + 4) = v10.n128_u64[0];
                    goto LABEL_536;
                  case 1:
                  case 3:
                  case 4:
                    if ((void)v1183)
                    {
                      *(void *)&long long v1183 = v1183 - 1;
                      uint64_t v518 = v1181[3];
                    }
                    else
                    {
                      uint64_t v518 = 2 * v1181[3];
                    }
                    *((void *)&v1183 + 1) += 2 * v518;
                    int v519 = DWORD1(v1182) + 2;
                    goto LABEL_535;
                  case 2:
                    *((void *)&v1183 + 1) += 2 * v1181[3];
                    int v519 = DWORD1(v1182) + 1;
LABEL_535:
                    DWORD1(v1182) = v519;
LABEL_536:
                    unsigned int v520 = v1156;
                    if (v507 != 2) {
                      unsigned int v520 = 0;
                    }
                    v15 += 404 * v520;
                    if (v507 == 2) {
                      int v507 = v1133;
                    }
                    else {
                      v507 -= 2;
                    }
                    v508 += 2;
                    if (!v508) {
                      goto LABEL_707;
                    }
                    continue;
                  default:
                    sub_10001D67C();
                }
              default:
                sub_10001D67C();
            }
          }
        }
        goto LABEL_707;
      default:
        sub_10001D17C();
    }
  }
  int v18 = *(_DWORD *)(a3 + 20);
  int v1133 = *(_DWORD *)(a3 + 28);
  v1168.i32[0] = 0;
LABEL_210:
  if (v18)
  {
    int v248 = 2 * *(_DWORD *)(a3 + 24);
    int v249 = v1177;
    int v1038 = v1178;
    int v1076 = 2 * v1178;
    uint64_t v251 = *((void *)&v1179 + 1);
    uint64_t v250 = v1179;
    uint64_t v252 = v1183;
    int v253 = DWORD1(v1182);
    uint64_t v1055 = *((void *)&v1177 + 1);
    uint64_t v1049 = v1181[3];
    uint64_t v1024 = 2 * v1181[3];
    uint64_t v1029 = 2 * *((void *)&v1177 + 1);
    int __srcb = 2 * *(_DWORD *)(a3 + 16);
    int8x8_t v254 = (int8x8_t)vdup_n_s32(0x7FF8u);
    int v255 = v1133;
    int v256 = DWORD1(v1178);
    int v257 = v1181[2];
    while (2)
    {
      int v1114 = v256;
      *(void *)v1087 = v252;
      int v1096 = v253;
      int v258 = v1076;
      if (__srcb >= 1)
      {
        int v259 = 0;
        uint64_t v260 = v15 - 404;
        v261 = (char *)&v1182 + 8;
        v262 = (unsigned __int16 *)(v251 + 8);
        char v263 = *(unsigned char *)(a3 + 304);
        if (v1038) {
          v261 = (char *)&v1178 + 8;
        }
        uint64_t v264 = *(int *)v261;
        int v265 = __srcb + 2;
        int v258 = v1076;
        do
        {
          if (v258) {
            int v266 = v258;
          }
          else {
            int v266 = 2 * v1182;
          }
          if (v258) {
            v267 = v262;
          }
          else {
            v267 = (unsigned __int16 *)(*((void *)&v1183 + 1) + 8);
          }
          BOOL v268 = v259 == 0;
          if (!v259) {
            int v259 = v248;
          }
          uint64_t v269 = v260 + 404 * v268;
          int v270 = *(v267 - 1);
          unsigned int v271 = v267[3];
          unsigned int v272 = v270 + ((__int16)*(v267 - 4) >> 3);
          unsigned int v273 = *v267;
          ++*(_DWORD *)(v269 + 384);
          *(void *)(v269 + 388) += (unsigned __int16)v272;
          *(void *)(v269 + 396) += (unsigned __int16)v272 * (unint64_t)(unsigned __int16)v272;
          if ((v273 & 4) == 0)
          {
            int v274 = (__int16)v267[1];
            unsigned int v275 = v274 & 7;
            if ((v273 & 1) != 0 || (((v274 & 7u) < 6) & (v273 >> 1)) != 0)
            {
              uint64_t v290 = v260 + 404 * v268 + 336;
              v291 = (int32x2_t *)(v290 + 12 * (int)v264);
              int32x2_t v292 = (int32x2_t)vand_s8((int8x8_t)__PAIR64__(v271, v272), (int8x8_t)0xFFFF0000FFFFLL);
              v293.i32[0] = 1;
              v293.i32[1] = v292.i32[0];
              int32x2_t *v291 = vadd_s32(*v291, v293);
              v291[1].i32[0] += v270;
              uint64_t v294 = v290 + 12 * (v264 + 1);
              ++*(_DWORD *)v294;
              v11.n128_u64[0] = (unint64_t)vadd_s32(*(int32x2_t *)(v294 + 4), v292);
              *(void *)(v294 + 4) = v11.n128_u64[0];
            }
            else
            {
              __int16 v276 = v275 > 5;
              unsigned int v277 = v267[2];
              uint64_t v278 = (v277 & 0xF) + 1;
              unsigned int v279 = v277 >> 4;
              int v280 = (__int16)v273 >> 3;
              int v281 = v274 >> 3;
              if (v274 < 0) {
                int v281 = -v281;
              }
              if (v280 < 0) {
                int v280 = -v280;
              }
              unsigned __int16 v282 = v275 - v276;
              unsigned int v283 = (16 * (v281 & 0xFFFu)) >> v276;
              unsigned int v284 = (v278 >> 1) * v279;
              int v285 = 8 * v280;
              if (((v274 ^ v273) & 0x8000u) == 0) {
                unsigned __int16 v286 = v282 + 7;
              }
              else {
                unsigned __int16 v286 = v282;
              }
              uint64_t v287 = v269 + 24 * v286;
              v11.n128_u32[0] = v283;
              v288.i32[0] = vshr_n_u32((uint32x2_t)v11.n128_u64[0], 1uLL).u32[0];
              v11.n128_u32[1] = v285;
              v288.i32[1] = vand_s8(*(int8x8_t *)&v11, v254).i32[1];
              signed int v289 = (v288.i32[0] * v284) >> 15 << v263;
              if (v289 <= -32768) {
                signed int v289 = -32768;
              }
              if (v289 >= 0x7FFF) {
                signed int v289 = 0x7FFF;
              }
              *(void *)v287 += v278;
              __n128 v11 = (__n128)vaddw_u32(*(uint64x2_t *)(v287 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v289), v288), 0xFuLL));
              *(__n128 *)(v287 + 8) = v11;
            }
          }
          v262 = v267 + 8;
          int v258 = v266 - 2;
          v259 -= 2;
          ++v1168.i32[0];
          v265 -= 2;
          uint64_t v260 = v269;
        }
        while (v265 > 2);
      }
      if (!v258)
      {
        switch(v249)
        {
          case 0:
            v251 += 2 * v1055;
            *((void *)&v1179 + 1) = v251;
            int v256 = v1114 + 1;
            *(void *)((char *)&v1178 + 4) = __PAIR64__(DWORD2(v1178), v1114 + 1) ^ 0x100000000;
            goto LABEL_250;
          case 1:
          case 3:
          case 4:
            if (v250)
            {
              *(void *)&long long v1179 = --v250;
              uint64_t v295 = v1055;
            }
            else
            {
              uint64_t v295 = v1029;
            }
            v251 += 2 * v295;
            *((void *)&v1179 + 1) = v251;
            int v256 = v1114 + 2;
            goto LABEL_249;
          case 2:
            v251 += 2 * v1055;
            *((void *)&v1179 + 1) = v251;
            int v256 = v1114 + 1;
LABEL_249:
            DWORD1(v1178) = v256;
LABEL_250:
            switch(v257)
            {
              case 0:
                *((void *)&v1183 + 1) += 2 * v1049;
                int v253 = v1096 + 1;
                DWORD1(v1182) = v1096 + 1;
                DWORD2(v1182) ^= 1u;
                goto LABEL_257;
              case 1:
              case 3:
              case 4:
                uint64_t v252 = *(void *)v1087;
                if (*(void *)v1087)
                {
                  uint64_t v252 = *(void *)v1087 - 1;
                  *(void *)&long long v1183 = *(void *)v1087 - 1;
                  uint64_t v296 = v1049;
                }
                else
                {
                  uint64_t v296 = v1024;
                }
                *((void *)&v1183 + 1) += 2 * v296;
                int v253 = v1096 + 2;
                DWORD1(v1182) = v1096 + 2;
                goto LABEL_258;
              case 2:
                *((void *)&v1183 + 1) += 2 * v1049;
                int v253 = v1096 + 1;
                DWORD1(v1182) = v1096 + 1;
LABEL_257:
                uint64_t v252 = *(void *)v1087;
LABEL_258:
                unsigned int v297 = v1156;
                if (v255 != 1) {
                  unsigned int v297 = 0;
                }
                v15 += 404 * v297;
                if (v255 == 1) {
                  int v255 = v1133;
                }
                else {
                  --v255;
                }
                if (!--v18) {
                  goto LABEL_707;
                }
                continue;
              default:
                sub_10001D67C();
            }
          default:
            sub_10001D67C();
        }
      }
      break;
    }
    sub_10001D6D4();
  }
LABEL_707:
  if (*(_DWORD *)(a3 + 608))
  {
    sub_10000A4D8((unint64_t)v1037, (uint64_t)__dst, (uint64_t)&v1177);
    uint64_t v1158 = a3 + 608;
    switch(v1037->i32[0])
    {
      case 0:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
          sub_10001D360();
        }
        if (*(_DWORD *)(a3 + 156))
        {
          unsigned int v578 = 0;
          v579 = (unsigned __int16 *)(a3 + 487308 + *v1043);
          v580 = (unsigned __int16 *)(a3 + 487308 + v1043[3]);
          v1137 = (char *)(a3 + 487308 + v1043[9]);
          v1116 = (_WORD *)(a3 + 487308 + v1043[12]);
          v1098 = (_WORD *)(a3 + 487308 + v1043[6]);
          int v581 = *(_DWORD *)(a3 + 20);
          do
          {
            unsigned int v582 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v578 % *(_DWORD *)(a3 + 132)) + 8);
            v583 = v1043 + 1;
            uint64_t v584 = 5;
            do
            {
              bzero((void *)(a3 + 487308 + *(v583 - 1)), *v583);
              v583 += 3;
              --v584;
            }
            while (v584);
            if ((unsigned __int16)v581 >= v582) {
              unint64_t v585 = v582;
            }
            else {
              unint64_t v585 = (unsigned __int16)v581;
            }
            sub_10000CC44((unsigned int *)a3, v585, (int *)&v1177, v579, v580, v1098);
            sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1158, v579, v580, v1137, v1116, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v578);
            LOWORD(v581) = v581 - v582;
            ++v578;
          }
          while (v578 < *(_DWORD *)(a3 + 156));
        }
        break;
      case 1:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
          sub_10001D360();
        }
        uint64_t v586 = a3 + 487308;
        v587 = v1043;
        uint64_t v588 = *v1043;
        uint64_t v589 = v1043[3];
        uint64_t v590 = v1043[9];
        uint64_t v591 = v1043[12];
        uint64_t v592 = v1043[6];
        if (*(_DWORD *)(a3 + 156))
        {
          unsigned int v593 = 0;
          v594 = (unsigned __int16 *)(v586 + v588);
          v595 = (unsigned __int16 *)(v586 + v589);
          v1117 = (_WORD *)(v586 + v591);
          v1138 = (char *)(v586 + v590);
          v1099 = (_WORD *)(v586 + v592);
          int v596 = *(_DWORD *)(a3 + 20);
          do
          {
            unsigned int v597 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v593 % *(_DWORD *)(a3 + 132)) + 8);
            v598 = v1043 + 1;
            uint64_t v599 = 5;
            do
            {
              bzero((void *)(v586 + *(v598 - 1)), *v598);
              v598 += 3;
              --v599;
            }
            while (v599);
            if ((unsigned __int16)v596 >= v597) {
              unint64_t v600 = v597;
            }
            else {
              unint64_t v600 = (unsigned __int16)v596;
            }
            sub_10000CC44((unsigned int *)a3, v600, (int *)&v1177, v594, v595, v1099);
            sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1158, v594, v595, v1138, v1117, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v593);
            LOWORD(v596) = v596 - v597;
            ++v593;
          }
          while (v593 < *(_DWORD *)(a3 + 156));
          v587 = v1043;
          uint64_t v588 = *v1043;
          uint64_t v589 = v1043[3];
          uint64_t v590 = v1043[9];
          uint64_t v591 = v1043[12];
          uint64_t v592 = v1043[6];
        }
        if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216)) {
          sub_10001D38C();
        }
        if (*(_DWORD *)(a3 + 212))
        {
          unsigned int v601 = 0;
          int v602 = 0;
          v603 = (unsigned __int16 *)(v586 + v588);
          v604 = (unsigned __int16 *)(v586 + v589);
          v1118 = (_WORD *)(v586 + v591);
          v1139 = (char *)(v586 + v590);
          v1100 = (_WORD *)(v586 + v592);
          int v605 = *(_DWORD *)(a3 + 16);
          v1078 = v587 + 1;
          do
          {
            unsigned int v606 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v601 % *(_DWORD *)(a3 + 188)) + 8);
            v607 = v1078;
            uint64_t v608 = 5;
            do
            {
              bzero((void *)(v586 + *(v607 - 1)), *v607);
              v607 += 3;
              --v608;
            }
            while (v608);
            if ((unsigned __int16)v605 >= v606) {
              unint64_t v609 = v606;
            }
            else {
              unint64_t v609 = (unsigned __int16)v605;
            }
            sub_10000CF30((unsigned int *)a3, v602, v609, (int *)&v1177, v603, v604, v1100);
            sub_10000B304(v1163, (unsigned int *)(a3 + 188), v1158, v603, v604, v1139, v1118, a3 + 360 * *(_DWORD *)(a3 + 240) * v601 + 242980);
            v602 += v606;
            LOWORD(v605) = v605 - v606;
            ++v601;
          }
          while (v601 < *(_DWORD *)(a3 + 212));
        }
        break;
      case 2:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
          sub_10001D360();
        }
        if (*(_DWORD *)(a3 + 156))
        {
          unsigned int v610 = 0;
          v611 = (unsigned __int16 *)(a3 + 487308 + *v1043);
          v612 = (unsigned __int16 *)(a3 + 487308 + v1043[3]);
          v1140 = (char *)(a3 + 487308 + v1043[9]);
          v1119 = (_WORD *)(a3 + 487308 + v1043[12]);
          int v613 = *(_DWORD *)(a3 + 20);
          do
          {
            unsigned int v614 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v610 % *(_DWORD *)(a3 + 132)) + 8);
            v615 = v1043 + 1;
            uint64_t v616 = 5;
            do
            {
              bzero((void *)(a3 + 487308 + *(v615 - 1)), *v615);
              v615 += 3;
              --v616;
            }
            while (v616);
            if ((unsigned __int16)v613 >= v614) {
              unsigned int v617 = v614;
            }
            else {
              unsigned int v617 = (unsigned __int16)v613;
            }
            sub_10000D184((uint64_t)v1037, v617, (int *)&v1177, v611, v612);
            sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1158, v611, v612, v1140, v1119, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v610);
            LOWORD(v613) = v613 - v614;
            ++v610;
          }
          while (v610 < *(_DWORD *)(a3 + 156));
        }
        break;
      case 3:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
          sub_10001D360();
        }
        uint64_t v618 = a3 + 487308;
        v619 = v1043;
        uint64_t v620 = *v1043;
        uint64_t v621 = v1043[3];
        uint64_t v622 = v1043[9];
        uint64_t v623 = v1043[12];
        uint64_t v624 = v1043[6];
        if (*(_DWORD *)(a3 + 156))
        {
          unsigned int v625 = 0;
          v626 = (unsigned __int16 *)(v618 + v620);
          v627 = (unsigned __int16 *)(v618 + v621);
          v1120 = (_WORD *)(v618 + v623);
          v1141 = (char *)(v618 + v622);
          v1101 = (_WORD *)(v618 + v624);
          int v628 = *(_DWORD *)(a3 + 20);
          do
          {
            unsigned int v629 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v625 % *(_DWORD *)(a3 + 132)) + 8);
            v630 = v1043 + 1;
            uint64_t v631 = 5;
            do
            {
              bzero((void *)(v618 + *(v630 - 1)), *v630);
              v630 += 3;
              --v631;
            }
            while (v631);
            if ((unsigned __int16)v628 >= v629) {
              unint64_t v632 = v629;
            }
            else {
              unint64_t v632 = (unsigned __int16)v628;
            }
            sub_10000CC44((unsigned int *)a3, v632, (int *)&v1177, v626, v627, v1101);
            sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1158, v626, v627, v1141, v1120, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v625);
            LOWORD(v628) = v628 - v629;
            ++v625;
          }
          while (v625 < *(_DWORD *)(a3 + 156));
          v619 = v1043;
          uint64_t v620 = *v1043;
          uint64_t v621 = v1043[3];
          uint64_t v622 = v1043[9];
          uint64_t v623 = v1043[12];
          uint64_t v624 = v1043[6];
        }
        if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216)) {
          sub_10001D38C();
        }
        if (*(_DWORD *)(a3 + 212))
        {
          unsigned int v633 = 0;
          int v634 = 0;
          v635 = (unsigned __int16 *)(v618 + v620);
          v636 = (unsigned __int16 *)(v618 + v621);
          v1121 = (_WORD *)(v618 + v623);
          v1142 = (char *)(v618 + v622);
          v1102 = (_WORD *)(v618 + v624);
          int v637 = *(_DWORD *)(a3 + 16);
          v1079 = v619 + 1;
          do
          {
            unsigned int v638 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v633 % *(_DWORD *)(a3 + 188)) + 8);
            v639 = v1079;
            uint64_t v640 = 5;
            do
            {
              bzero((void *)(v618 + *(v639 - 1)), *v639);
              v639 += 3;
              --v640;
            }
            while (v640);
            if ((unsigned __int16)v637 >= v638) {
              unint64_t v641 = v638;
            }
            else {
              unint64_t v641 = (unsigned __int16)v637;
            }
            sub_10000CF30((unsigned int *)a3, v634, v641, (int *)&v1177, v635, v636, v1102);
            sub_10000B304(v1163, (unsigned int *)(a3 + 188), v1158, v635, v636, v1142, v1121, a3 + 360 * *(_DWORD *)(a3 + 240) * v633 + 242980);
            v634 += v638;
            LOWORD(v637) = v637 - v638;
            ++v633;
          }
          while (v633 < *(_DWORD *)(a3 + 212));
        }
        break;
      case 4:
        if (*(_DWORD *)(a3 + 16) != *(_DWORD *)(a3 + 160)) {
          sub_10001D360();
        }
        uint64_t v642 = a3 + 487308;
        v643 = v1043;
        uint64_t v644 = *v1043;
        uint64_t v645 = v1043[3];
        uint64_t v646 = v1043[9];
        uint64_t v647 = v1043[12];
        if (*(_DWORD *)(a3 + 156))
        {
          unsigned int v648 = 0;
          v649 = (unsigned __int16 *)(v642 + v644);
          v650 = (unsigned __int16 *)(v642 + v645);
          v1143 = (char *)(v642 + v646);
          v1122 = (_WORD *)(v642 + v647);
          int v651 = *(_DWORD *)(a3 + 20);
          do
          {
            unsigned int v652 = *(unsigned __int16 *)(a3 + 132 + 4 * (unsigned __int16)(v648 % *(_DWORD *)(a3 + 132)) + 8);
            v653 = v1043 + 1;
            uint64_t v654 = 5;
            do
            {
              bzero((void *)(v642 + *(v653 - 1)), *v653);
              v653 += 3;
              --v654;
            }
            while (v654);
            if ((unsigned __int16)v651 >= v652) {
              unsigned int v655 = v652;
            }
            else {
              unsigned int v655 = (unsigned __int16)v651;
            }
            sub_10000D184((uint64_t)v1037, v655, (int *)&v1177, v649, v650);
            sub_10000B304(v1163, (unsigned int *)(a3 + 132), v1158, v649, v650, v1143, v1122, a3 + 58660 + 360 * *(_DWORD *)(a3 + 184) * v648);
            LOWORD(v651) = v651 - v652;
            ++v648;
          }
          while (v648 < *(_DWORD *)(a3 + 156));
          v643 = v1043;
          uint64_t v644 = *v1043;
          uint64_t v645 = v1043[3];
          uint64_t v646 = v1043[9];
          uint64_t v647 = v1043[12];
        }
        if (*(_DWORD *)(a3 + 20) != *(_DWORD *)(a3 + 216)) {
          sub_10001D38C();
        }
        if (*(_DWORD *)(a3 + 212))
        {
          unsigned int v656 = 0;
          int v657 = 0;
          int v658 = *(_DWORD *)(a3 + 16);
          __srcd = (unsigned __int16 *)(v642 + v644);
          uint64_t v659 = *((void *)&v1177 + 1);
          v1123 = (unsigned __int16 *)(v642 + v645);
          __dsta = (char *)(v642 + v646);
          v1057 = (_WORD *)(v642 + v647);
          int v660 = v1177;
          int v1044 = v1180;
          uint64_t v1040 = v1181[0];
          uint64_t v661 = v1181[3];
          int v662 = v1181[2];
          int v663 = v1184;
          v1080 = v643 + 1;
          uint64_t v1031 = v1185[0];
          uint64_t v1035 = v1181[1];
          uint64_t v1026 = v1185[1];
          do
          {
            int v1103 = v658;
            int v1089 = v657;
            unsigned int v1144 = *(unsigned __int16 *)(a3 + 188 + 4 * (unsigned __int16)(v656 % *(_DWORD *)(a3 + 188)) + 8);
            v664 = v1080;
            uint64_t v665 = 5;
            do
            {
              bzero((void *)(v642 + *(v664 - 1)), *v664);
              v664 += 3;
              --v665;
            }
            while (v665);
            if ((unsigned __int16)v1103 >= v1144) {
              unint64_t v666 = v1144;
            }
            else {
              unint64_t v666 = (unsigned __int16)v1103;
            }
            if (!v666) {
              sub_10001D5F8();
            }
            uint64_t v667 = *(unsigned int *)(a3 + 20);
            if (v667)
            {
              uint64_t v668 = 0;
              int v669 = v1044 - v1089;
              if (v1044 - v1089 >= 1) {
                int v670 = 0;
              }
              else {
                int v670 = v663;
              }
              int v671 = v670 + v669;
              v672 = v1123;
              v673 = __srcd;
              uint64_t v675 = v1026;
              uint64_t v674 = v1031;
              uint64_t v676 = v1035;
              uint64_t v677 = v1040;
              do
              {
                uint64_t v678 = v675 + -16 * v669;
                if (v669 >= 1) {
                  uint64_t v678 = v676 + 2 * (8 * v1089);
                }
                unint64_t v679 = v666;
                int v680 = v671;
                do
                {
                  if (!v680)
                  {
                    uint64_t v678 = v675;
                    int v680 = v663;
                  }
                  *v673 += *(_WORD *)(v678 + 6) >> 2;
                  *v672 += *(_WORD *)(v678 + 14) >> 2;
                  v678 += 16;
                  --v680;
                  --v679;
                }
                while (v679);
                if ((v660 - 3) >= 2 && v660 != 1)
                {
                  if (v660 == 2 || !v660) {
                    sub_10001D650();
                  }
                  sub_10001D624();
                }
                if ((v662 - 3) >= 2 && v662 != 1)
                {
                  if (v662 == 2 || !v662) {
                    sub_10001D650();
                  }
                  sub_10001D624();
                }
                v676 += 2 * (v659 << (v677 != 0));
                BOOL v811 = v677-- != 0;
                if (!v811) {
                  uint64_t v677 = 0;
                }
                uint64_t v681 = v674 - 1;
                if (!v674) {
                  uint64_t v681 = 0;
                }
                v675 += 2 * (v661 << (v674 != 0));
                ++v673;
                ++v672;
                ++v668;
                uint64_t v674 = v681;
              }
              while (v668 != v667);
              v682 = __srcd;
              v683 = v1123;
              unint64_t v684 = 0x80 / v666;
              do
              {
                unsigned __int16 *v682 = (*v682 * v684) >> 5;
                ++v682;
                unsigned __int16 *v683 = (*v683 * v684) >> 5;
                ++v683;
                --v667;
              }
              while (v667);
            }
            sub_10000B304(v1163, (unsigned int *)(a3 + 188), v1158, __srcd, v1123, __dsta, v1057, a3 + 360 * *(_DWORD *)(a3 + 240) * v656 + 242980);
            int v657 = v1144 + v1089;
            int v658 = v1103 - v1144;
            ++v656;
          }
          while (v656 < *(_DWORD *)(a3 + 212));
        }
        break;
      default:
        sub_10001D334();
    }
  }
LABEL_920:
  if (*(_DWORD *)(a3 + 608))
  {
    unsigned int v772 = *(_DWORD *)(a3 + 12);
    if (v772 >= 5) {
      sub_10001D308();
    }
    int v1109 = 0;
    int v1045 = *(_DWORD *)(a3 + 676);
    float v773 = *(float *)(a3 + 684);
    float v1036 = *(float *)(a3 + 288);
    float v774 = *(float *)(a3 + 292);
    float v775 = *(float *)(a3 + 296);
    unsigned int v776 = 8;
    switch(v772)
    {
      case 0u:
      case 2u:
        goto LABEL_926;
      case 1u:
      case 4u:
        goto LABEL_924;
      case 3u:
        unsigned int v776 = 4;
LABEL_924:
        if (8u / *(_DWORD *)(a3 + 164) != v776 / *(_DWORD *)(a3 + 220)) {
          sub_10001D2DC();
        }
        int v1109 = 1;
LABEL_926:
        unsigned int v1058 = 8u / *(_DWORD *)(a3 + 164);
        unsigned int __srce = *(unsigned __int16 *)(a3 + 656);
        int v1090 = *(_DWORD *)(a3 + 680);
        uint64_t v1083 = a3 + 284;
        v1176.i32[0] = 0;
        v1175.i32[0] = 0;
        int v777 = *(unsigned __int8 *)(a3 + 664);
        if (*(unsigned char *)(a3 + 664))
        {
          uint64_t v778 = 0;
          unsigned int v779 = *(_DWORD *)(a3 + 668);
          float v780 = *(float *)(a3 + 672);
          do
          {
            uint64_t v1152 = v778;
            uint64_t v781 = a3 + 56 * v778;
            *(void *)v1164 = *(unsigned int *)(v781 + 156);
            if (v1164[0])
            {
              uint64_t v782 = 0;
              uint64_t v783 = a3 + 184320 * v778 + 58660;
              unsigned int v1160 = *(_DWORD *)(v781 + 184);
              do
              {
                if (v1160)
                {
                  uint64_t v784 = 0;
                  float v785 = (float)*(int *)(a3 + 620);
                  do
                  {
                    v786 = (_DWORD *)(v783 + v784);
                    LODWORD(v1177) = 0;
                    v1168.i32[0] = 0;
                    unsigned int v787 = *(_DWORD *)(v783 + v784 + 340);
                    float v788 = (float)v787;
                    if (v787) {
                      float v789 = (float)v787;
                    }
                    else {
                      float v789 = 1.0;
                    }
                    float v790 = *(float *)(v783 + v784 + 160) / v789;
                    float v791 = *(float *)(v783 + v784 + 168) / v789;
                    float v792 = v790 * v788;
                    float v793 = (float)(v790 * v788) * v785;
                    float v794 = v791 * v788;
                    float v795 = v794 * v785;
                    float v796 = *(float *)(v783 + v784 + 164) - (float)(v792 * v790);
                    if (v793 == 0.0) {
                      float v797 = 1.0;
                    }
                    else {
                      float v797 = v793;
                    }
                    float v798 = v796 / v797;
                    float v799 = *(float *)(v783 + v784 + 176) - (float)(v794 * v791);
                    if (v795 == 0.0) {
                      float v800 = 1.0;
                    }
                    else {
                      float v800 = v795;
                    }
                    v786[88] = fmaxf((float)(v798 + (float)(v799 / v800)) * 65536.0, 0.0);
                    sub_10000D3C8(v1083, v783 + v784, (float *)v1168.i32, (float *)&v1177);
                    float v801 = *(float *)&v1177;
                    v786[86] = v1177;
                    v786[87] = v1168.i32[0];
                    if (v801 >= v780 && v786[88] >= v779) {
                      *(unsigned char *)(v783 + v784 + 356) = 1;
                    }
                    v784 += 360;
                  }
                  while (360 * v1160 != v784);
                  v783 += v784;
                }
                ++v782;
              }
              while (v782 != *(void *)v1164);
            }
            uint64_t v778 = v1152 + 1;
          }
          while (v1152 != v1109);
        }
        *(unsigned char *)(a3 + 636) = 0;
        *(void *)v1131 = *(unsigned __int16 *)(a3 + 34);
        if (*(_WORD *)(a3 + 34))
        {
          __dstb = 0;
          int v802 = (__int16)(__srce + (__srce >> 15));
          int v803 = -(v802 >> 1);
          float v1041 = (float)(v1045 - v1090);
          if (v773 == 1.0) {
            float v804 = 1.0;
          }
          else {
            float v804 = 1.0 - v773;
          }
          float v805 = (float)(v1058 >> 1);
          int v1051 = v802 >> 1;
          if (v803 <= v802 >> 1) {
            int v806 = v802 >> 1;
          }
          else {
            int v806 = -(v802 >> 1);
          }
          int v1165 = v806;
          uint64_t v1153 = *(unsigned __int16 *)(a3 + 32);
          int __srcf = -(v802 >> 1);
          do
          {
            if (v1153)
            {
              *(void *)v1161 = 0;
              uint64_t v1059 = (void)__dstb * v1153;
              do
              {
                uint64_t v1195 = 0;
                long long v1193 = 0u;
                long long v1194 = 0u;
                long long v1191 = 0u;
                long long v1192 = 0u;
                long long v1189 = 0u;
                long long v1190 = 0u;
                long long v1187 = 0u;
                long long v1188 = 0u;
                long long v1186 = 0u;
                long long v1184 = 0u;
                memset(v1185, 0, sizeof(v1185));
                long long v1182 = 0u;
                long long v1183 = 0u;
                memset(v1181, 0, sizeof(v1181));
                long long v1179 = 0u;
                long long v1180 = 0u;
                long long v1177 = 0u;
                long long v1178 = 0u;
                if (v803 <= v1051)
                {
                  int v808 = 0;
                  unsigned int v807 = 0;
                  int v809 = v803;
                  do
                  {
                    int v1091 = v809;
                    unsigned int v810 = v809 + __dstb;
                    do
                    {
                      BOOL v811 = v803 + v1161[0] >= v1153 || v810 >= v1131[0];
                      if (!v811)
                      {
                        uint64_t v812 = 0;
                        float v813 = (float)*(int *)(a3 + 660);
                        uint64_t v814 = a3 + 58676;
                        do
                        {
                          uint64_t v815 = a3 + 56 * v812;
                          if (v812) {
                            __int16 v816 = v803 + LOWORD(v1161[0]);
                          }
                          else {
                            __int16 v816 = v810;
                          }
                          __int16 v817 = *(_WORD *)(v815 + 132);
                          unsigned __int16 v818 = v816 * v817;
                          LODWORD(v819) = (unsigned __int16)(v817 + v816 * v817);
                          unsigned int v820 = *(unsigned __int16 *)(v815 + 156);
                          if (v819 >= v820) {
                            uint64_t v819 = v820;
                          }
                          else {
                            uint64_t v819 = v819;
                          }
                          if (v819 > v818)
                          {
                            if (v812) {
                              unsigned __int16 v821 = v810;
                            }
                            else {
                              unsigned __int16 v821 = v803 + LOWORD(v1161[0]);
                            }
                            unsigned int v822 = *(_DWORD *)(a3 + 56 * v812 + 184);
                            if ((unsigned __int16)(v821 + 1) >= (unsigned __int16)v822) {
                              uint64_t v823 = (unsigned __int16)v822;
                            }
                            else {
                              uint64_t v823 = (unsigned __int16)(v821 + 1);
                            }
                            uint64_t v824 = v818;
                            unsigned int v825 = v822 * v818 + v821;
                            uint64_t v826 = a3 + 184320 * v812 + 360 * v825 + 58660;
                            uint64_t v827 = v814 + 360 * v825;
                            do
                            {
                              uint64_t v828 = v827;
                              uint64_t v829 = v821;
                              uint64_t v830 = v826;
                              if (v821 < v823)
                              {
                                do
                                {
                                  if (!v777 || *(unsigned char *)(v830 + 356) == 1)
                                  {
                                    uint64_t v831 = 0;
                                    unsigned int v832 = *(_DWORD *)(v830 + 340);
                                    do
                                    {
                                      v833 = (float32x4_t *)((char *)&v1177 + v831);
                                      float32x4_t *v833 = vaddq_f32(*(float32x4_t *)(v830 + v831), *(float32x4_t *)((char *)&v1177 + v831));
                                      v833[1].f32[0] = *(float *)(v828 + v831) + *(float *)((char *)&v1177 + v831 + 16);
                                      v831 += 20;
                                    }
                                    while (v831 != 340);
                                    v808 += v832;
                                    float v834 = (float)*(int *)(a3 + 620);
                                    float v835 = (float)v832;
                                    if (v832) {
                                      float v836 = (float)v832;
                                    }
                                    else {
                                      float v836 = 1.0;
                                    }
                                    float v837 = *(float *)(v830 + 160) / v836;
                                    float v838 = *(float *)(v830 + 168) / v836;
                                    float v839 = v837 * v835;
                                    float v840 = (float)(v837 * v835) * v834;
                                    float v841 = v838 * v835;
                                    float v842 = v841 * v834;
                                    float v843 = *(float *)(v830 + 164) - (float)(v839 * v837);
                                    if (v840 == 0.0) {
                                      float v844 = 1.0;
                                    }
                                    else {
                                      float v844 = v840;
                                    }
                                    float v845 = v843 / v844;
                                    float v846 = *(float *)(v830 + 176) - (float)(v841 * v838);
                                    if (v842 == 0.0) {
                                      float v842 = 1.0;
                                    }
                                    v807 += fmaxf((float)(v845 + (float)(v846 / v842)) * v813, 0.0);
                                  }
                                  v830 += 360;
                                  ++v829;
                                  v828 += 360;
                                }
                                while (v829 != v823);
                              }
                              v826 += 360 * v822;
                              ++v824;
                              v827 += 360 * v822;
                            }
                            while (v824 != v819);
                          }
                          ++v812;
                          v814 += 184320;
                        }
                        while (v812 != v1109 + 1);
                      }
                      BOOL v425 = v803++ == v1165;
                    }
                    while (!v425);
                    int v809 = v1091 + 1;
                    int v803 = __srcf;
                  }
                  while (v1091 != v1165);
                  DWORD1(v1194) = v808;
                }
                else
                {
                  unsigned int v807 = 0;
                }
                sub_10000D3C8(v1083, (uint64_t)&v1177, (float *)v1175.i32, (float *)v1176.i32);
                BOOL v847 = *(float *)v1176.i32 <= v773
                    || v807 <= v1045
                             - (float)((float)((float)(*(float *)v1176.i32 - v773) * v1041) / v804);
                int v803 = __srcf;
                float v848 = v774 * (float)((float)(v805 * *(float *)v1175.i32) - v1036);
                uint64_t v849 = *(void *)v1161;
                BOOL v850 = !v847;
                if (v847) {
                  unsigned int v851 = 0;
                }
                else {
                  unsigned int v851 = v807;
                }
                uint64_t v852 = a3 + 52 * (*(void *)v1161 + v1059) + 480040;
                *(_DWORD *)(v852 + 24) = (float)(*(float *)v1176.i32 * 1000.0);
                *(_DWORD *)(v852 + 28) = v851;
                if (v850) {
                  char v853 = -96;
                }
                else {
                  char v853 = -120;
                }
                *(float *)(a3 + 52 * (*(void *)v1161 + v1059) + 480072) = v775 * v848;
                *(_DWORD *)(a3 + 52 * (*(void *)v1161 + v1059) + 480076) = 0;
                *(_DWORD *)(a3 + 52 * (*(void *)v1161 + v1059) + 480080) = 0;
                *(unsigned char *)(a3 + 52 * (*(void *)v1161 + v1059) + 480084) = v853;
                ++*(void *)v1161;
              }
              while (v849 + 1 != v1153);
            }
            __dstb = (char *)__dstb + 1;
          }
          while (__dstb != *(void **)v1131);
        }
        int v854 = v1131[0];
        break;
      default:
        sub_10001D2B0();
    }
  }
  else
  {
    float v1036 = *(float *)(a3 + 288);
    int v854 = *(unsigned __int16 *)(a3 + 34);
  }
  unsigned int v855 = *(unsigned __int16 *)(a3 + 32);
  int v856 = v854 * v855;
  if (v854 * v855)
  {
    uint64_t v857 = a3 + 6948;
    uint64_t v858 = a3 + 7092;
    unint64_t v859 = vcvts_n_s32_f32(v1036, 0xCuLL);
    v860 = (uint64_t *)(a3 + 6964);
    do
    {
      uint64_t v861 = 0;
      uint64_t v862 = v857;
      uint64_t v863 = v858;
      do
      {
        for (uint64_t i = 0; i != 24; i += 8)
        {
          uint64_t v865 = *(void *)(v862 + i);
          *(void *)(v862 + i) = *(void *)(v863 + i);
          *(void *)(v863 + i) = v865;
        }
        ++v861;
        v863 -= 24;
        v862 += 24;
      }
      while (v861 != 3);
      uint64_t v866 = 0;
      v867 = v860;
      do
      {
        uint64_t v868 = *(v867 - 1);
        int v869 = dword_100022320[v866];
        uint64_t v870 = ((*v867 << dword_1000222B0[v866]) * dword_1000222E8[v866] - ((uint64_t)(v868 * v859 + 2048) >> 12)) << v869;
        *(v867 - 1) = v868 << v869;
        uint64_t *v867 = v870;
        ++v866;
        v867 += 3;
      }
      while (v866 != 14);
      v857 += 404;
      v858 += 404;
      v860 = (uint64_t *)((char *)v860 + 404);
      --v856;
    }
    while (v856);
  }
  signed int v871 = a3 + 463652;
  bzero((void *)(a3 + 441636), 0x6E00uLL);
  if (v854)
  {
    float v872 = *(float *)(a3 + 292) * *(float *)(a3 + 296);
    float v873 = *(float *)(a3 + 308);
    uint64_t v874 = a3 + 6948;
    uint64_t v875 = a3 + 463668;
    uint64_t v876 = a3 + 441636;
    do
    {
      if (v855)
      {
        v877 = (void *)(v874 + 16);
        v878 = (_DWORD *)v875;
        unsigned int v879 = v855;
        uint64_t v880 = v876;
        do
        {
          uint64_t v881 = 0;
          unint64_t v882 = 0;
          uint64_t v883 = 0;
          v884 = (void *)(v874 + 388);
          v885 = v877;
          do
          {
            uint64_t v886 = *(v885 - 1);
            unsigned int v887 = (float)((float)v886 / v873);
            if (v887)
            {
              float v888 = v872 * (float)((float)((*v885 << 8) / v886) * 0.0039062);
              if (v888 < 0.0) {
                float v889 = -0.5;
              }
              else {
                float v889 = 0.5;
              }
              int v890 = (int)(float)(v888 + v889);
              uint64_t v891 = *((unsigned int *)v885 - 4);
            }
            else
            {
              int v890 = 0;
              uint64_t v891 = 0;
            }
            v892 = (_DWORD *)(v880 + v881 * 4);
            _DWORD *v892 = v891;
            v892[14] = v887;
            v892[28] = v890;
            v883 += dword_100022358[v881] * v887;
            v882 += v891;
            ++v881;
            v885 += 3;
          }
          while (v881 != 14);
          uint64_t v893 = *(unsigned int *)(v874 + 384);
          if (v893 && *v884)
          {
            unint64_t v894 = 0;
            uint64_t v895 = *v884 * *v884;
            unint64_t v896 = 16 * v883;
            if (v882 <= 1) {
              unint64_t v897 = 1;
            }
            else {
              unint64_t v897 = v882;
            }
            v898 = (unsigned __int16 *)(a3 + 326);
            int64_t v899 = v896 / v897;
            do
            {
              int v901 = *v898;
              v898 += 2;
              int v900 = v901;
              if (v894 > 2) {
                break;
              }
              ++v894;
              BOOL v902 = v900 == 0xFFFF || v899 < (__int16)v900;
            }
            while (!v902);
            BOOL v903 = 10000 * (*(void *)(v874 + 396) * v893 - v895) / v895 > (__int16)*(v898 - 1);
          }
          else
          {
            BOOL v903 = 0;
          }
          *(unsigned char *)(v880 + 168) = v903;
          v904 = v878;
          for (uint64_t j = 344; j != 392; j += 12)
          {
            *(v904 - 4) = *(_DWORD *)(v874 + j - 8);
            _DWORD *v904 = *(_DWORD *)(v874 + j - 4);
            v904[4] = *(_DWORD *)(v874 + j);
            ++v904;
          }
          v874 += 404;
          v880 += 172;
          v877 = (void *)((char *)v877 + 404);
          v878 += 12;
          --v879;
        }
        while (v879);
      }
      v876 += 172 * v855;
      v875 += 48 * v855;
      --v854;
    }
    while (v854);
  }
  if (*(_DWORD *)(a3 + 312) != 1) {
    sub_10001D284();
  }
  uint64_t v906 = 0;
  v1092 = (_WORD *)(a3 + 486696);
  char v907 = 1;
  do
  {
    char v1154 = v907;
    int v908 = *(_DWORD *)(a3 + 4 * v906 + 312);
    if (v908 >= 1)
    {
      uint64_t v909 = a3 + (v906 << 11) + 469800;
      signed int v910 = *(unsigned __int16 *)(a3 + 32);
      int v911 = *(unsigned __int16 *)(a3 + 34);
      if (v908 == 1)
      {
        int v912 = v911 * v910;
        if (v911 * v910)
        {
          uint64_t v913 = a3 + 441636;
          do
          {
            sub_10000D704(a3 + 284, v913, v909);
            v913 += 172;
            v909 += 16;
            --v912;
          }
          while (v912);
        }
      }
      else
      {
        int v914 = 0;
        if (v910 >= v908) {
          signed int v871 = v908;
        }
        else {
          signed int v871 = *(unsigned __int16 *)(a3 + 32);
        }
        if (v911 >= v908) {
          int v915 = v908;
        }
        else {
          int v915 = *(unsigned __int16 *)(a3 + 34);
        }
        do
        {
          if (v871 <= v910)
          {
            int v916 = 0;
            do
            {
              unsigned int v917 = v916 + v910 * v914;
              long long v1184 = 0u;
              memset(v1185, 0, 28);
              long long v1182 = 0u;
              long long v1183 = 0u;
              memset(v1181, 0, sizeof(v1181));
              long long v1179 = 0u;
              long long v1180 = 0u;
              long long v1177 = 0u;
              long long v1178 = 0u;
              if (v915)
              {
                char v918 = 0;
                int v919 = 0;
                uint64_t v920 = a3 + 441636 + 172 * v917;
                unsigned int v921 = v910;
                uint64_t v922 = a3 + 441748 + 172 * (v916 + v914 * v910);
                uint64_t v923 = 172 * v910;
                int v924 = v915;
                do
                {
                  uint64_t v925 = v922;
                  signed int v926 = v871;
                  for (uint64_t k = v920; v926; --v926)
                  {
                    if (*(unsigned char *)(k + 168))
                    {
                      for (uint64_t m = 0; m != 56; m += 4)
                      {
                        *(_DWORD *)((char *)&v1177 + m) += *(_DWORD *)(v925 + m - 112);
                        int v929 = *(_DWORD *)(v925 + m - 56);
                        v930 = (_DWORD *)((char *)&v1181[-1] + m);
                        _DWORD *v930 = *(_DWORD *)((char *)&v1181[-1] + m) + v929;
                        v930[14] = *(_DWORD *)((char *)&v1183 + m) + *(_DWORD *)(v925 + m) * v929;
                      }
                      char v918 = ++v919;
                    }
                    k += 172;
                    v925 += 172;
                  }
                  v920 += 172 * v921;
                  v922 += v923;
                  --v924;
                }
                while (v924);
                LOBYTE(v1185[3]) = v918;
              }
              uint64_t v931 = 0;
              uint64_t v932 = v909 + 16 * v917;
              do
              {
                v933 = (char *)&v1177 + v931;
                int v934 = *(_DWORD *)((char *)&v1181[-1] + v931);
                if (v934)
                {
                  int v935 = *((_DWORD *)v933 + 28);
                  int v936 = v934 >> 1;
                  if (v935 < 0) {
                    int v936 = -v936;
                  }
                  *((_DWORD *)v933 + 28) = (v936 + v935) / v934;
                }
                v931 += 4;
              }
              while (v931 != 56);
              sub_10000D704(a3 + 284, (uint64_t)&v1177, v932);
              signed int v910 = *(unsigned __int16 *)(a3 + 32);
              BOOL v902 = v916++ < v910 - v871;
            }
            while (v902);
            int v911 = *(unsigned __int16 *)(a3 + 34);
          }
          BOOL v902 = v914++ < v911 - v915;
        }
        while (v902);
      }
    }
    char v907 = 0;
    uint64_t v906 = 1;
  }
  while ((v1154 & 1) != 0);
  uint64_t v937 = *(int *)(a3 + 12);
  if (v937 >= 5) {
    sub_10001D258();
  }
  int v938 = *(unsigned __int16 *)(a3 + 34);
  int v939 = v938 * *(unsigned __int16 *)(a3 + 32);
  v940 = (_DWORD *)(a3 + 463652);
  if (v939)
  {
    uint64_t v941 = qword_1000223F0[v937];
    int v942 = v938 * *(unsigned __int16 *)(a3 + 32);
    do
    {
      v943 = v940;
      uint64_t v944 = v941;
      do
      {
        v943[2561] = *v943;
        v943[2565] = v943[4];
        v943[2569] = v943[8];
        ++v943;
        --v944;
      }
      while (v944);
      v940 += 12;
      --v942;
    }
    while (v942);
  }
  *(_DWORD *)(a3 + 487232) = *(_DWORD *)(a3 + 6861);
  *(unsigned char *)(a3 + 487236) = *(unsigned char *)(a3 + 6865);
  if (*(unsigned char *)(a3 + 6860))
  {
    uint64_t v945 = (unsigned __int16)*v1092;
    if (v939 && v945 <= 0x7F)
    {
      v946 = (float *)(a3 + 486700 + 4 * v945);
      int v947 = v939 - 1;
      uint64_t v948 = a3 + 473896;
      do
      {
        sub_10000D96C(v1037->u32[0], v948);
        LOWORD(v945) = *v1092;
        if (v949 >= 0.0)
        {
          *v946++ = v949;
          LOWORD(v945) = v945 + 1;
          _WORD *v1092 = v945;
        }
        if (!v947) {
          break;
        }
        v948 += 48;
        --v947;
      }
      while ((unsigned __int16)v945 < 0x80u);
    }
    if ((_WORD)v945)
    {
      qsort((void *)(a3 + 486700), (unsigned __int16)v945, 4uLL, (int (__cdecl *)(const void *, const void *))sub_10000DAF8);
      uint64_t v950 = 0;
      unsigned int v951 = (unsigned __int16)*v1092;
      do
      {
        unint64_t v952 = (42949673 * (unint64_t)(*(unsigned __int8 *)(a3 + 487232 + v950) * v951 + 50)) >> 32;
        if (v952 >= v951) {
          LODWORD(v952) = v951 - 1;
        }
        *(_DWORD *)(a3 + 487212 + 4 * v950++) = *(_DWORD *)&v1092[2 * (int)v952 + 2];
      }
      while (v950 != 5);
    }
    uint64_t v953 = 0;
    uint64_t v954 = a3 + 6868;
    while (2)
    {
      unint64_t v955 = 0;
      do
      {
        float v956 = *(float *)(v954 + 4 * v955);
        if (v956 < 0.0) {
          goto LABEL_1117;
        }
        float v957 = *(float *)(a3 + 487212 + 4 * v955);
        if (v955 > 3) {
          break;
        }
        ++v955;
      }
      while (v956 <= v957);
      if (v956 > v957)
      {
LABEL_1117:
        if (*(unsigned __int8 *)(a3 + 487240) >= 5u) {
          sub_10001D22C();
        }
        break;
      }
      *(unsigned char *)(a3 + 487240) = ++v953;
      v954 += 20;
      if (v953 != 4) {
        continue;
      }
      break;
    }
  }
  if (*(unsigned char *)(a3 + 400))
  {
    float v958 = *(float *)(a3 + 404);
    if (*(unsigned char *)(a3 + 487240) && v958 > *(float *)(a3 + 408)) {
      float v958 = *(float *)(a3 + 408);
    }
  }
  else
  {
    float v958 = 0.0;
  }
  uint64_t v959 = 0;
  float v960 = (float)((float)(*(float *)(a3 + 292) * *(float *)(a3 + 288)) * *(float *)(a3 + 296)) * -0.5;
  char v961 = 1;
  do
  {
    char v1166 = v961;
    int v962 = *(_DWORD *)(a3 + 4 * v959 + 312);
    if (v962 >= 1)
    {
      unsigned int v963 = *(unsigned __int16 *)(a3 + 34);
      unsigned int v964 = v963 - v962;
      if (v963 >= v962)
      {
        int v965 = 0;
        float v966 = (float)*(int *)(a3 + 469796);
        uint64_t v967 = a3 + (v959 << 11) + 469800;
        uint64_t v968 = a3 + 20 * v959;
        v1162 = (unsigned char *)(v968 + 360);
        unsigned int v969 = *(unsigned __int16 *)(a3 + 32);
        v1110 = (unsigned int *)(v968 + 372);
        v1132 = (_DWORD *)(v968 + 368);
        v1084 = (unsigned int *)(v968 + 364);
        v1093 = (unsigned int *)(v968 + 376);
        char v970 = (_BYTE)v959 << 6;
        unsigned int v1155 = v969 - v962;
        uint64_t v971 = *(unsigned __int16 *)(a3 + 32);
        uint64_t v973 = a3 + 480040;
        uint64_t v972 = a3 + 473896;
        unsigned int v1046 = v964;
        unsigned int v1042 = v969;
        while (v969 < v962)
        {
LABEL_1188:
          v972 += 48 * v971;
          v967 += 16 * v971;
          v973 += 52 * v971;
          BOOL v425 = v965++ == v964;
          if (v425) {
            goto LABEL_1190;
          }
        }
        int __srcg = v965;
        int v974 = 0;
        uint64_t v1052 = v973;
        uint64_t v1060 = v972;
        __dstc = (void *)v967;
        while (1)
        {
          sub_10000D96C(*(unsigned int *)(a3 + 12), v972);
          unsigned int v976 = *(unsigned char *)(a3 + 344) ? v871 & 0xFFFFFFFE | (*(unsigned char *)(v967 + 12) == 0) : v871 & 0xFFFFFFFE;
          if (*(unsigned char *)(a3 + 348))
          {
            int v977 = *(_DWORD *)(v967 + 8);
            float v978 = (float)((float)v977 * 0.0625) + v966;
            float v979 = (float)*(int *)(a3 + 356);
            unsigned int v980 = v976 & 0xFFFFFFFB | (4 * (v978 >= v979));
            if (v977 >= -1024 && v978 < v979) {
              unsigned int v980 = v976 & 0xFFFFFFFB | (4 * (v978 <= (float)*(int *)(a3 + 352)));
            }
          }
          else
          {
            unsigned int v980 = v976 & 0xFFFFFFFB;
          }
          if (*v1162)
          {
            unsigned int v981 = *v1084;
            if (*v1084 <= 1) {
              unsigned int v981 = 1;
            }
            unsigned int v982 = *(_DWORD *)(v967 + 4);
            unsigned int v983 = *(_DWORD *)v967 / v981;
            float v984 = (float)((float)*(int *)(v967 + 8) * 0.0625) - v960;
            if (v984 < 0.0) {
              float v984 = -v984;
            }
            float v985 = (float)((float)(1.0 - (float)((float)(v984 + -16.0) * 0.0625)) * 20.0)
                 + (float)((float)((float)(v984 + -16.0) * 0.0625) * 10.0);
            if (v984 > 32.0) {
              float v985 = 10.0;
            }
            if (v984 <= 16.0) {
              float v985 = (float)((float)(1.0 - (float)((float)(v984 + -8.0) * 0.125)) * 40.0)
            }
                   + (float)((float)((float)(v984 + -8.0) * 0.125) * 20.0);
            float v986 = v984 > 8.0 ? v985 : 40.0;
            unsigned int v987 = (*v1132 * (float)((float)(fabsf(sqrtf((float)v983)) * v986) + 0.5)) >> 8;
            BOOL v988 = v983 >= *v1093 || v982 >= *v1110;
            BOOL v989 = v988 && v982 >= v987;
            int v990 = v989 ? 0 : 8;
            unsigned int v991 = v990 | v980 & 0xFFFFFFF7;
          }
          else
          {
            unsigned int v991 = v980 & 0xFFFFFFF7;
          }
          unsigned int v992 = *(unsigned char *)(a3 + 400) ? v991 & 0xFFFFFFEF | (16 * (v975 >= v958)) : v991 & 0xFFFFFFEF;
          signed int v871 = v992 & 0xFFFFFFDD;
          float v993 = (float)*(int *)(v967 + 8) * 0.0625;
          if (v962 != 1) {
            break;
          }
          if ((v1166 & 1) == 0) {
            sub_10001D1A8();
          }
          *(void *)uint64_t v973 = *(void *)v967;
          *(float *)(v973 + 8) = v993;
          *(float *)(v973 + 12) = v975;
          *(_DWORD *)(v973 + 16) = 0;
          *(_DWORD *)(v973 + 20) = v992 & 0xDD;
          *(unsigned char *)(v973 + 20) = v970 | (32 * ((v992 & 0x1D) == 0)) | v992 & 0x1D;
LABEL_1185:
          v967 += 16;
          v972 += 48;
          v973 += 52;
          BOOL v425 = v974++ == v1155;
          if (v425)
          {
            uint64_t v971 = *(unsigned __int16 *)(a3 + 32);
            unsigned int v964 = v1046;
            int v965 = __srcg;
            uint64_t v972 = v1060;
            uint64_t v967 = (uint64_t)__dstc;
            unsigned int v969 = v1042;
            uint64_t v973 = v1052;
            goto LABEL_1188;
          }
        }
        if (v1166) {
          sub_10001D1D4();
        }
        if ((v992 & 0xD) != 0) {
          goto LABEL_1185;
        }
        unsigned int v994 = *(unsigned __int8 *)(v967 + 12);
        int v995 = v962;
        uint64_t v996 = v973;
LABEL_1170:
        v997 = (float *)(v996 + 20);
        int v998 = v962;
        while (1)
        {
          char v999 = *(unsigned char *)v997;
          if (((*(unsigned char *)v997 & 0x10) != 0 || (*(unsigned char *)v997 & 1) != 0 && (v962 * v962) >> 1 >= v994)
            && !*(unsigned char *)(a3 + 324))
          {
            goto LABEL_1183;
          }
          if (*(unsigned char *)(a3 + 342) == 1)
          {
            if ((*(unsigned char *)v997 & 0x20) != 0 && *(v997 - 3) <= v993) {
              goto LABEL_1183;
            }
          }
          else
          {
            if (*(unsigned char *)(a3 + 342)) {
              sub_10001D200();
            }
            if ((*(unsigned char *)v997 & 0x20) != 0 && *(v997 - 3) >= v993) {
              goto LABEL_1183;
            }
          }
          *(void *)(v997 - 5) = *(void *)v967;
          *(v997 - 3) = v993;
          *(unsigned char *)v997 = v970 | v999 & 0x33 | 0x20;
LABEL_1183:
          v997 += 13;
          if (!--v998)
          {
            v996 += 52 * *(unsigned __int16 *)(a3 + 32);
            if (!--v995) {
              goto LABEL_1185;
            }
            goto LABEL_1170;
          }
        }
      }
    }
LABEL_1190:
    char v961 = 0;
    uint64_t v959 = 1;
  }
  while ((v1166 & 1) != 0);
  if (*(unsigned char *)(a3 + 412))
  {
    if (*(_DWORD *)(a3 + 608))
    {
      int v1000 = *(unsigned __int16 *)(a3 + 34) * *(unsigned __int16 *)(a3 + 32);
      if (v1000)
      {
        uint64_t v1001 = a3 + 480048;
        do
        {
          if (*(unsigned char *)(a3 + 413) && (*(unsigned char *)(v1001 + 36) & 0x20) == 0) {
            *(unsigned char *)(v1001 + 12) = *(unsigned char *)(v1001 + 12) & 0xDD | 2;
          }
          if ((*(unsigned char *)(v1001 + 12) & 0x20) != 0)
          {
            float v1002 = *(float *)v1001;
            if ((*(float *)v1001 <= 0.0 || *(float *)(v1001 + 24) >= 0.0)
              && (v1002 >= 0.0 || *(float *)(v1001 + 24) <= 0.0))
            {
              float v1003 = -v1002;
              if (v1002 >= 0.0) {
                float v1003 = *(float *)v1001;
              }
              if (v1003 > 1.0)
              {
                float v1004 = *(float *)(v1001 + 24);
                float v1005 = -v1004;
                if (v1004 >= 0.0) {
                  float v1005 = *(float *)(v1001 + 24);
                }
                if (v1005 <= v1003) {
                  uint64_t v1006 = a3 + 480;
                }
                else {
                  uint64_t v1006 = a3 + 544;
                }
                if (v1005 <= v1003) {
                  float v1007 = v1005;
                }
                else {
                  float v1007 = v1003;
                }
                if (v1005 <= v1003) {
                  float v1008 = v1003;
                }
                else {
                  float v1008 = v1005;
                }
                float v1009 = sub_10000DB10(v1006, v1003);
                if (v1007 == 0.0) {
                  float v1010 = 1.0;
                }
                else {
                  float v1010 = v1007;
                }
                float v1011 = powf(v1008 / v1010, v1009);
                float v1012 = sub_10000DB10(a3 + 416, (float)*(unsigned int *)(v1001 + 16)) * v1011;
                *(float *)uint64_t v1001 = (float)(v1004 * v1012) + (float)(v1002 * (float)(1.0 - v1012));
                *(float *)(v1001 + 8) = v1012;
              }
            }
          }
          v1001 += 52;
          --v1000;
        }
        while (v1000);
      }
    }
  }

  return sub_100009A40(a3);
}

uint64_t sub_100009A40(uint64_t result)
{
  if (*(unsigned char *)(result + 712))
  {
    unsigned int v1 = *(unsigned __int8 *)(result + 713);
    int v2 = *(unsigned __int8 *)(result + 714) == v1 ? 1 : *(unsigned __int8 *)(result + 714) - v1;
    int v3 = *(unsigned __int16 *)(result + 34);
    if (*(_WORD *)(result + 34))
    {
      int v4 = 0;
      int v5 = *(_DWORD *)(result + 272);
      uint64_t v6 = result + 480040;
      int v7 = *(_DWORD *)(result + 280);
      unsigned int v8 = *(unsigned __int16 *)(result + 262);
      int v32 = *(_DWORD *)(result + 268);
      int v9 = *(unsigned __int16 *)(result + 32);
      int v10 = (((v2 + ((unsigned __int16)(v2 & 0x8000) >> 15)) >> 1) + 0x10000) / v2;
      do
      {
        int v11 = v7 + v5;
        unsigned int v12 = (v5 >> 8) & ~(v5 >> 31);
        if (v12 >= v8) {
          unsigned int v12 = v8;
        }
        unsigned int v13 = ((v11 + 255) >> 8) & ~((v11 + 255) >> 31);
        if (v13 >= v8) {
          unsigned int v13 = v8;
        }
        int v14 = v13 - v12;
        if (v13 < v12) {
          int v14 = 0;
        }
        if (v9)
        {
          int v15 = 0;
          int v16 = *(_DWORD *)(result + 276);
          unsigned int v17 = *(unsigned __int16 *)(result + 260);
          uint64_t v18 = *(unsigned __int16 *)(result + 264);
          int v19 = v32;
          do
          {
            int v20 = 0;
            unsigned int v21 = (v19 >> 8) & ~(v19 >> 31);
            v19 += v16;
            if (v21 >= v17) {
              unsigned int v21 = v17;
            }
            unsigned int v22 = ((v19 + 255) >> 8) & ~((v19 + 255) >> 31);
            if (v22 >= v17) {
              unsigned int v22 = v17;
            }
            unsigned int v23 = v22 - v21;
            if (v22 < v21) {
              unsigned int v23 = 0;
            }
            if (v13 > v12)
            {
              int v20 = 0;
              uint64_t v24 = result + 715 + v12 * v18 + v21;
              if (v23 <= 1) {
                uint64_t v25 = 1;
              }
              else {
                uint64_t v25 = v23;
              }
              int v26 = v14;
              do
              {
                if (v22 > v21)
                {
                  for (uint64_t i = 0; i != v25; ++i)
                  {
                    unsigned int v28 = *(unsigned __int8 *)(v24 + i);
                    if (v28 <= v1) {
                      unsigned int v28 = v1;
                    }
                    v20 += v28;
                  }
                }
                v24 += v18;
                BOOL v29 = __OFSUB__(v26--, 1);
              }
              while (!((v26 < 0) ^ v29 | (v26 == 0)));
              if (v22 > v21) {
                v20 /= (int)(v23 * v14);
              }
            }
            int v30 = (v20 - v1) * v10;
            if (v30 >= 0x10000) {
              char v31 = -1;
            }
            else {
              char v31 = BYTE1(v30) & ~(v30 >> 31);
            }
            *(unsigned char *)(v6 + 48) = v31;
            v6 += 52;
            ++v15;
          }
          while (v15 != v9);
        }
        ++v4;
        int v5 = v11;
      }
      while (v4 != v3);
    }
  }
  return result;
}

uint64_t sub_100009BFC(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a1) {
    sub_10001D7DC();
  }
  if (!a2) {
    sub_10001D808();
  }
  if (!a3) {
    sub_10001D834();
  }
  bzero(a3 + 117450, 0x4424uLL);
  a3[117449] = a3[71];
  switch(a3[1])
  {
    case 0:
      uint64_t v9 = a1;
      uint64_t v10 = 0;
      uint64_t v7 = a2;
      uint64_t v8 = 0;
      break;
    case 1:
      sub_10001D88C();
    case 2:
      sub_10001D8B8();
    case 3:
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v7 = a1;
      uint64_t v8 = a2;
      break;
    case 4:
      sub_10001D8E4();
    default:
      sub_10001D860();
  }
  return sub_10000323C((uint64_t)&v9, (uint64_t)&v7, (uint64_t)a3);
}

void sub_100009D0C(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          bzero(a4 + 117450, 0x4424uLL);
          a4[117449] = a4[71];
          switch(a4[1])
          {
            case 0:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5331, "false");
            case 1:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5335, "false");
            case 2:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5339, "false");
            case 3:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5343, "false");
            case 4:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5347, "false");
            default:
              __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5351, "false");
          }
        }
        __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5326, "pContext != nullptr");
      }
      __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5325, "pIn2 != nullptr");
    }
    __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5324, "pIn1 != nullptr");
  }
  __assert_rtn("Process_x3", "PDAFPixelEngine.cpp", 5323, "pIn0 != nullptr");
}

uint64_t sub_100009ED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  if (!a1) {
    sub_10001D910();
  }
  if (!a2) {
    sub_10001D93C();
  }
  if (!a3) {
    sub_10001D968();
  }
  if (!a4) {
    sub_10001D994();
  }
  if (!a5) {
    sub_10001D9C0();
  }
  bzero(a5 + 117450, 0x4424uLL);
  a5[117449] = a5[71];
  int v10 = a5[1];
  if (v10 != 1)
  {
    switch(v10)
    {
      case 0:
        sub_10001DA18();
      case 2:
        sub_10001DA44();
      case 3:
        sub_10001DA70();
      case 4:
        sub_10001DA9C();
      default:
        sub_10001D9EC();
    }
  }
  v13[0] = a1;
  v13[1] = a3;
  v12[0] = a2;
  v12[1] = a4;
  return sub_10000323C((uint64_t)v13, (uint64_t)v12, (uint64_t)a5);
}

unint64_t sub_10000A000(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = (unsigned int *)result;
  int v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  long long v9 = 0uLL;
  char v10 = 1;
  do
  {
    uint64_t v11 = a4 + 112 * v7;
    *(_OWORD *)(v11 + 96) = v9;
    *(_OWORD *)(v11 + 48) = v9;
    *(_OWORD *)(v11 + 64) = v9;
    *(_OWORD *)(v11 + 80) = v9;
    unsigned int v12 = (int *)(v11 + 80);
    *(_OWORD *)(v11 + 32) = v9;
    unsigned int v13 = (_DWORD *)(v11 + 32);
    *(_OWORD *)uint64_t v11 = v9;
    *(_OWORD *)(v11 + 16) = v9;
    unsigned int v14 = *v5;
    int v15 = &v5[12 * v7];
    *(void *)(v11 + 36) = -1;
    int v16 = (_DWORD *)(v11 + 36);
    *(_DWORD *)uint64_t v11 = v14;
    *(void *)(v11 + 76) = -1;
    unsigned int v17 = (_DWORD *)(v11 + 76);
    unsigned int v20 = v15[9];
    int v19 = v15 + 9;
    unsigned int v18 = v20;
    char v21 = v10;
    unsigned int v22 = *(v19 - 1);
    unsigned int v24 = v19[1];
    unsigned int v23 = v19[2];
    int v25 = v24 - v22;
    if (v24 > v22 && v23 > v18)
    {
      unsigned int v27 = v23 - v18;
      *(_DWORD *)(a4 + 112 * v7 + 4) = v27;
      unsigned int v28 = (unsigned int *)(v11 + 40);
      BOOL v29 = (_DWORD *)(v11 + 72);
      switch(v14)
      {
        case 0u:
          unsigned int v30 = v5[12 * v7 + 12];
          if (v30 >= 2) {
            sub_10001DAF4();
          }
          if (v5[12 * v7 + 13] != -1) {
            sub_10001DD04();
          }
          goto LABEL_20;
        case 1u:
        case 3u:
          unsigned int v30 = v5[12 * v7 + 12];
          if (v30 >= 2) {
            sub_10001DD30();
          }
          int v31 = v5[12 * v7 + 13];
          if ((v31 - 4) <= 0xFFFFFFFD) {
            sub_10001DD5C();
          }
          switch(v14)
          {
            case 1u:
              *unsigned int v13 = v25;
              *int v16 = 0;
              *unsigned int v28 = v30;
              *BOOL v29 = v25;
              *unsigned int v17 = 1;
              int v32 = v25;
              *unsigned int v12 = v31;
              break;
            case 3u:
LABEL_24:
              *BOOL v29 = v25;
              *unsigned int v17 = 0;
              *unsigned int v12 = v31;
              *unsigned int v13 = v25;
              *int v16 = 1;
              int v32 = v25;
              *unsigned int v28 = v30;
              break;
            case 2u:
LABEL_20:
              int v32 = 0;
              *unsigned int v13 = v25;
              *int v16 = 0;
              *unsigned int v28 = v30;
              *(void *)BOOL v29 = 0xFFFFFFFF00000000;
              *unsigned int v12 = -1;
              break;
            default:
              sub_10001DD88();
          }
          if (v27 != v5[2]) {
            sub_10001DCD8();
          }
          uint64_t v33 = *(void *)(a2 + 8 * v7);
          if (!v33) {
            sub_10001DB20();
          }
          uint32x2_t v34 = *(uint32x2_t *)&v5[12 * v7 + 16];
          uint32x2_t v35 = vshr_n_u32(v34, 1uLL);
          *(void *)&long long v36 = v35.u32[0];
          *((void *)&v36 + 1) = v35.u32[1];
          *(_OWORD *)(a4 + 112 * v7 + 8) = v36;
          if (v34.i32[0] <= 1u) {
            sub_10001DB4C();
          }
          if (v34.i32[1] <= 1u) {
            sub_10001DB78();
          }
          switch(v14)
          {
            case 0u:
            case 2u:
              uint64_t v37 = a4 + 112 * v7;
              *(void *)(v37 + 56) = v33 + v5[12 * v7 + 15];
              *(void *)(v37 + 96) = 0;
              break;
            case 1u:
              uint64_t v38 = v33 + v5[12 * v7 + 15];
              uint64_t v39 = a4 + 112 * v7;
              *(void *)(v39 + 56) = v38;
              *(void *)(v39 + 96) = v38 + 2 * v35.u32[0];
              break;
            case 3u:
              uint64_t v40 = v33 + v5[12 * v7 + 15];
              uint64_t v41 = a4 + 112 * v7;
              *(void *)(v41 + 96) = v40;
              *(void *)(v41 + 56) = v40 + 2 * v35.u32[0];
              break;
            case 4u:
              sub_10001DCAC();
            default:
              sub_10001DBA4();
          }
          uint64_t v42 = *(void *)(a3 + 8 * v7);
          if (!v42) {
            sub_10001DBD0();
          }
          int v53 = v32;
          int v54 = v25;
          char v55 = v21;
          int v56 = v6;
          uint64_t v58 = 0;
          unint64_t v59 = 0;
          uint64_t v57 = 0;
          sub_10000A89C(v14, v19 - 3, 6, (uint64_t *)&v59, &v58, &v57);
          uint64_t v43 = a4 + 112 * v7;
          *(void *)(v43 + 24) = v59 >> 1;
          int v44 = (void *)(v43 + 24);
          v44[3] = 0;
          v44[8] = 0;
          uint64_t result = sub_10000AA28(v14);
          long long v9 = 0uLL;
          switch(v14)
          {
            case 0u:
            case 2u:
              uint64_t v45 = 0;
              *(void *)(a4 + 112 * v7 + 64) = v42 + v58;
              break;
            case 1u:
            case 3u:
              unint64_t v46 = *v19;
              if (result > v46) {
                v44[3] = result - v46;
              }
              unint64_t v47 = v5[12 * v7 + 7] + ~result;
              BOOL v48 = v47 >= v46;
              uint64_t v49 = v47 - v46;
              if (v48) {
                v44[8] = v49;
              }
              *(void *)(a4 + 112 * v7 + 64) = v42 + v58;
              uint64_t v45 = v42 + v57;
              break;
            default:
              sub_10001DBFC();
          }
          *(void *)(a4 + 112 * v7 + 104) = v45;
          if (!*v44) {
            sub_10001DC28();
          }
          v8 += v53;
          char v21 = v55;
          int v6 = v54 + v56;
          break;
        case 2u:
          if (v5[12 * v7 + 12]) {
            sub_10001DDE0();
          }
          if (v5[12 * v7 + 13] != -1) {
            sub_10001DDB4();
          }
          unsigned int v30 = 0;
          goto LABEL_20;
        case 4u:
          if (v5[12 * v7 + 12]) {
            sub_10001DE38();
          }
          if (v5[12 * v7 + 13] != 2) {
            sub_10001DE0C();
          }
          unsigned int v30 = 0;
          int v31 = 2;
          goto LABEL_24;
        default:
          sub_10001DAC8();
      }
    }
    char v10 = 0;
    uint64_t v7 = 1;
  }
  while ((v21 & 1) != 0);
  unsigned int v50 = v5[1];
  if (v6 && v6 != v50) {
    sub_10001DC54();
  }
  if (v8)
  {
    if (v8 != v50) {
      sub_10001DC80();
    }
  }
  return result;
}

unint64_t sub_10000A4D8(unint64_t result, uint64_t a2, uint64_t a3)
{
  int v4 = (unsigned int *)result;
  int v5 = 0;
  uint64_t v6 = 0;
  int v7 = 0;
  long long v8 = 0uLL;
  char v9 = 1;
  do
  {
    uint64_t v10 = a3 + 80 * v6;
    *(_OWORD *)(v10 + 64) = v8;
    *(_OWORD *)(v10 + 32) = v8;
    *(_OWORD *)(v10 + 48) = v8;
    uint64_t v11 = (_DWORD *)(v10 + 48);
    *(_OWORD *)(v10 + 16) = v8;
    unsigned int v12 = (_DWORD *)(v10 + 16);
    *(_OWORD *)uint64_t v10 = v8;
    unsigned int v13 = *v4;
    unsigned int v14 = &v4[12 * v6];
    *(void *)(v10 + 20) = -1;
    int v15 = (_DWORD *)(v10 + 20);
    *(_DWORD *)uint64_t v10 = v13;
    *(void *)(v10 + 52) = -1;
    int v16 = (_DWORD *)(v10 + 52);
    unsigned int v19 = v14[9];
    unsigned int v18 = v14 + 9;
    unsigned int v17 = v19;
    char v20 = v9;
    unsigned int v21 = *(v18 - 1);
    unsigned int v23 = v18[1];
    unsigned int v22 = v18[2];
    int v24 = v23 - v21;
    if (v23 > v21 && v22 > v17)
    {
      unsigned int v26 = v22 - v17;
      *(_DWORD *)(a3 + 80 * v6 + 4) = v26;
      unsigned int v27 = (unsigned int *)(v10 + 24);
      unsigned int v28 = (int *)(v10 + 56);
      switch(v13)
      {
        case 0u:
          unsigned int v29 = v4[12 * v6 + 12];
          if (v29 >= 2) {
            sub_10001DAF4();
          }
          if (v4[12 * v6 + 13] != -1) {
            sub_10001DD04();
          }
          goto LABEL_20;
        case 1u:
        case 3u:
          unsigned int v29 = v4[12 * v6 + 12];
          if (v29 >= 2) {
            sub_10001DD30();
          }
          int v30 = v4[12 * v6 + 13];
          if ((v30 - 4) <= 0xFFFFFFFD) {
            sub_10001DD5C();
          }
          switch(v13)
          {
            case 1u:
              *unsigned int v12 = v24;
              *int v15 = 0;
              unsigned int *v27 = v29;
              *uint64_t v11 = v24;
              *int v16 = 1;
              int v31 = v24;
              *unsigned int v28 = v30;
              break;
            case 3u:
LABEL_24:
              *uint64_t v11 = v24;
              *int v16 = 0;
              *unsigned int v28 = v30;
              *unsigned int v12 = v24;
              *int v15 = 1;
              int v31 = v24;
              unsigned int *v27 = v29;
              break;
            case 2u:
LABEL_20:
              int v31 = 0;
              *unsigned int v12 = v24;
              *int v15 = 0;
              unsigned int *v27 = v29;
              *(void *)uint64_t v11 = 0xFFFFFFFF00000000;
              *unsigned int v28 = -1;
              break;
            default:
              sub_10001DD88();
          }
          if (v26 != v4[2]) {
            sub_10001DEBC();
          }
          uint64_t v32 = *(void *)(a2 + 8 * v6);
          if (!v32) {
            sub_10001DBD0();
          }
          int v42 = v31;
          int v43 = v24;
          char v44 = v20;
          int v45 = v5;
          uint64_t v47 = 0;
          unint64_t v48 = 0;
          uint64_t v46 = 0;
          sub_10000A89C(v13, v18 - 3, 8, (uint64_t *)&v48, &v47, &v46);
          uint64_t v33 = a3 + 80 * v6;
          *(void *)(v33 + 8) = v48 >> 1;
          uint32x2_t v34 = (void *)(v33 + 8);
          v34[3] = 0;
          v34[7] = 0;
          uint64_t result = sub_10000AA28(v13);
          if (v13 > 4) {
            sub_10001DBFC();
          }
          long long v8 = 0uLL;
          if (((1 << v13) & 0x1A) != 0)
          {
            unint64_t v35 = *v18;
            if (result > v35) {
              v34[3] = result - v35;
            }
            unint64_t v36 = v4[12 * v6 + 7] + ~result;
            BOOL v37 = v36 >= v35;
            uint64_t v38 = v36 - v35;
            if (v37) {
              v34[7] = v38;
            }
            *(void *)(a3 + 80 * v6 + 40) = v32 + v47;
            uint64_t v39 = v32 + v46;
          }
          else
          {
            uint64_t v39 = 0;
            *(void *)(a3 + 80 * v6 + 40) = v32 + v47;
          }
          *(void *)(a3 + 80 * v6 + 72) = v39;
          if (!*v34) {
            sub_10001DC28();
          }
          v7 += v42;
          char v20 = v44;
          int v5 = v43 + v45;
          break;
        case 2u:
          if (v4[12 * v6 + 12]) {
            sub_10001DDE0();
          }
          if (v4[12 * v6 + 13] != -1) {
            sub_10001DDB4();
          }
          unsigned int v29 = 0;
          goto LABEL_20;
        case 4u:
          if (v4[12 * v6 + 12]) {
            sub_10001DE38();
          }
          if (v4[12 * v6 + 13] != 2) {
            sub_10001DE0C();
          }
          unsigned int v29 = 0;
          int v30 = 2;
          goto LABEL_24;
        default:
          sub_10001DAC8();
      }
    }
    char v9 = 0;
    uint64_t v6 = 1;
  }
  while ((v20 & 1) != 0);
  unsigned int v40 = v4[1];
  if (v5 && v5 != v40) {
    sub_10001DE64();
  }
  if (v7)
  {
    if (v7 != v40) {
      sub_10001DE90();
    }
  }
  return result;
}

unint64_t sub_10000A89C(unsigned int a1, unsigned int *a2, uint64_t a3, uint64_t *a4, uint64_t *a5, void *a6)
{
  unint64_t result = sub_10000AA28(a1);
  switch(a1)
  {
    case 0u:
      uint64_t v22 = 0;
      uint64_t v23 = *a2 * a3;
      *a4 = v23;
      uint64_t v24 = a2[2] * a3 + v23 * 2 * a2[3];
      goto LABEL_11;
    case 1u:
    case 3u:
    case 4u:
      unsigned int v13 = a2[1];
      if (v13 <= 3) {
        sub_10001DF14();
      }
      unint64_t v14 = a2[3];
      if (v14 >= v13) {
        sub_10001DF40();
      }
      uint64_t v15 = a3 << (a1 == 4);
      *a4 = v15 * *a2;
      *a5 = 0;
      unint64_t v16 = 2 * v14 - result;
      if (result > v14) {
        unint64_t v16 = v14;
      }
      *a5 = *a4 * v16;
      unint64_t v17 = v13 + ~v14;
      uint64_t v18 = *a4 * (2 * v13 - 1);
      *a6 = v18;
      uint64_t v19 = v18 + *a4 * (result - 2 * v17);
      uint64_t v20 = v18 - *a4 * v17;
      if (result <= v17) {
        uint64_t v20 = v19;
      }
      *a6 = v20;
      uint64_t v21 = v15 * a2[2];
      *a5 += v21;
      uint64_t v22 = *a6 + v21;
      goto LABEL_12;
    case 2u:
      uint64_t v22 = 0;
      uint64_t v25 = 2 * a3 * *a2;
      *a4 = v25;
      uint64_t v24 = v25 * a2[3] + 2 * a2[2] * a3;
LABEL_11:
      *a5 = v24;
LABEL_12:
      *a6 = v22;
      return result;
    default:
      sub_10001DEE8();
  }
}

uint64_t sub_10000AA28(unsigned int a1)
{
  if (a1 >= 5) {
    sub_10001DF6C();
  }
  return qword_1000223C8[a1];
}

uint64_t sub_10000AA54(uint64_t result)
{
  switch(*(_DWORD *)result)
  {
    case 0:
      uint64_t v3 = *(void *)(result + 64) + 2 * *(void *)(result + 24);
      int32x2_t v4 = *(int32x2_t *)(result + 36);
      LODWORD(v5) = vadd_s32(v4, (int32x2_t)0x100000001).u32[0];
      *(void *)(result + 56) += 2 * *(void *)(result + 8 * (v4.i8[0] & 1) + 8);
      *(void *)(result + 64) = v3;
      HIDWORD(v5) = veor_s8(*(int8x8_t *)&v4, (int8x8_t)0x100000001).i32[1];
      *(void *)(result + 36) = v5;
      return result;
    case 1:
    case 3:
      uint64_t v1 = *(void *)(result + 48);
      *(void *)(result + 56) += 2 * (*(void *)(result + 16) + *(void *)(result + 8));
      if (v1)
      {
        *(void *)(result + 48) = v1 - 1;
        uint64_t v2 = *(void *)(result + 24);
      }
      else
      {
        uint64_t v2 = 2 * *(void *)(result + 24);
      }
      *(void *)(result + 64) += 2 * v2;
      int v8 = *(_DWORD *)(result + 36) + 2;
      goto LABEL_8;
    case 2:
      int v6 = *(_DWORD *)(result + 36);
      uint64_t v7 = *(void *)(result + 64) + 2 * *(void *)(result + 24);
      *(void *)(result + 56) += 2 * *(void *)(result + 8 * (v6 & 1) + 8);
      *(void *)(result + 64) = v7;
      int v8 = v6 + 1;
LABEL_8:
      *(_DWORD *)(result + 36) = v8;
      return result;
    case 4:
      sub_10001DFC4();
    default:
      sub_10001DF98();
  }
}

uint64_t sub_10000AB64(uint64_t result, uint64_t a2, int a3, int *a4, int *a5, uint64_t a6, _DWORD *a7, double a8, __n128 a9)
{
  int v9 = *a4;
  int v10 = *(_DWORD *)(result + 4);
  if (v10 >= 1)
  {
    int v11 = 0;
    int v12 = *(_DWORD *)(result + 12);
    uint64_t v13 = a6 - 404;
    int v14 = a4[2];
    unint64_t v16 = (unsigned __int16 *)*((void *)a4 + 3);
    uint64_t v15 = (unsigned __int16 *)*((void *)a4 + 4);
    int v17 = v10 + 1;
    uint64_t v18 = (unsigned __int16 *)*((void *)a5 + 3);
    uint64_t v19 = (unsigned __int16 *)*((void *)a5 + 4);
    unint64_t result = 24;
    int8x8_t v20 = (int8x8_t)vdup_n_s32(0x7FF8u);
    char v21 = *(unsigned char *)(a2 + 4);
    do
    {
      if (!v9)
      {
        int v14 = a5[2];
        int v9 = *a5;
        uint64_t v15 = v19;
        unint64_t v16 = v18;
      }
      BOOL v22 = v11 == 0;
      if (!v11) {
        int v11 = v12;
      }
      uint64_t v23 = v13 + 404 * v22;
      unsigned int v24 = *v16;
      unint64_t v25 = (unint64_t)v16[1] >> 4;
      unsigned int v26 = *v15;
      ++*(_DWORD *)(v23 + 384);
      *(void *)(v23 + 388) += v25;
      *(void *)(v23 + 396) += v25 * (unint64_t)v25;
      if ((v26 & 4) == 0)
      {
        int v27 = (__int16)v15[1];
        unsigned int v28 = v27 & 7;
        if ((v26 & 1) != 0 || (((v27 & 7u) < 6) & (v26 >> 1)) != 0)
        {
          int v43 = (_DWORD *)(v13 + 404 * v22 + 12 * v14);
          ++v43[84];
          v43[85] += v25;
          v43[86] += v24 >> 4;
        }
        else
        {
          __int16 v29 = v28 > 5;
          unsigned int v30 = v15[2];
          uint64_t v31 = (v30 & 0xF) + 1;
          unsigned int v32 = v30 >> 4;
          int v33 = (__int16)v26 >> 3;
          int v34 = v27 >> 3;
          if (v27 < 0) {
            int v34 = -v34;
          }
          if (v33 < 0) {
            int v33 = -v33;
          }
          unsigned __int16 v35 = v28 - v29;
          unsigned int v36 = (16 * (v34 & 0xFFFu)) >> v29;
          unsigned int v37 = (v31 >> 1) * v32;
          int v38 = 8 * v33;
          if (((v27 ^ v26) & 0x8000u) == 0) {
            unsigned __int16 v39 = v35 + 7;
          }
          else {
            unsigned __int16 v39 = v35;
          }
          uint64_t v40 = v23 + 24 * v39;
          a9.n128_u32[0] = v36;
          v41.i32[0] = vshr_n_u32((uint32x2_t)a9.n128_u64[0], 1uLL).u32[0];
          a9.n128_u32[1] = v38;
          v41.i32[1] = vand_s8(*(int8x8_t *)&a9, v20).i32[1];
          signed int v42 = (v41.i32[0] * v37) >> 15 << v21;
          if (v42 <= -32768) {
            signed int v42 = -32768;
          }
          if (v42 >= 0x7FFF) {
            signed int v42 = 0x7FFF;
          }
          *(void *)v40 += v31;
          a9 = (__n128)vaddw_u32(*(uint64x2_t *)(v40 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v42), v41), 0xFuLL));
          *(__n128 *)(v40 + 8) = a9;
        }
      }
      v16 += 2;
      v15 += 3;
      --v9;
      --v11;
      ++*a7;
      v14 ^= a3;
      --v17;
      uint64_t v13 = v23;
    }
    while (v17 > 1);
  }
  if (v9) {
    sub_10001D414();
  }
  return result;
}

void sub_10000AD98(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  int v7 = *(_DWORD *)a4;
  int v8 = *(_DWORD *)(a1 + 4);
  if (v8 < 1) {
    goto LABEL_33;
  }
  int v9 = 0;
  int16x8_t v10 = vdupq_n_s16(*(char *)(a2 + 4));
  int v11 = *(_DWORD *)(a1 + 12);
  if (v7) {
    uint64_t v12 = a4;
  }
  else {
    uint64_t v12 = a5;
  }
  int v13 = *(_DWORD *)(v12 + 8);
  uint64_t v14 = a6 - 404;
  unint64_t v16 = *(const __int16 **)(a4 + 24);
  uint64_t v15 = *(const __int16 **)(a4 + 32);
  v17.i64[0] = 0x1000100010001;
  v17.i64[1] = 0x1000100010001;
  v18.i64[0] = -1;
  v18.i64[1] = -1;
  v19.i64[0] = 0x2000200020002;
  v19.i64[1] = 0x2000200020002;
  v20.i64[0] = 0x4000400040004;
  v20.i64[1] = 0x4000400040004;
  v21.i64[0] = 0x7000700070007;
  v21.i64[1] = 0x7000700070007;
  v22.i64[0] = 0xF000F000F000FLL;
  v22.i64[1] = 0xF000F000F000FLL;
  v23.i64[0] = 0x5000500050005;
  v23.i64[1] = 0x5000500050005;
LABEL_6:
  unsigned int v24 = *(const __int16 **)(a5 + 24);
  unint64_t v25 = *(const __int16 **)(a5 + 32);
  int v26 = *(_DWORD *)a5;
  if (!v7)
  {
    int v7 = *(_DWORD *)a5;
    uint64_t v15 = *(const __int16 **)(a5 + 32);
    unint64_t v16 = *(const __int16 **)(a5 + 24);
  }
  if (v7 > 7)
  {
    int v27 = 8;
LABEL_11:
    int16x8x2_t v73 = vld2q_s16(v16);
    v16 += 16;
    v7 -= v27;
    int16x8x3_t v74 = vld3q_s16(v15);
    v15 += 24;
    goto LABEL_23;
  }
  int v27 = v8;
  if (v7 == v8) {
    goto LABEL_11;
  }
  if (v7 < 1) {
    sub_10001D574();
  }
  unint64_t v28 = 0;
  uint64_t v29 = 2 * v7;
  do
  {
    unsigned int v30 = &v16[v28];
    v67[0].i16[v28 / 2] = *v30;
    v72.i16[v28 / 2] = v30[1];
    v71.i16[v28 / 2] = *v15;
    v70.i16[v28 / 2] = v15[1];
    v69.i16[v28 / 2] = v15[2];
    v28 += 2;
    v15 += 3;
  }
  while (v29 != v28);
  if (v8 >= 8) {
    int v31 = 8;
  }
  else {
    int v31 = v8;
  }
  if (v7 < v31)
  {
    uint64_t v32 = 0;
    int v33 = &v69.i8[v29];
    int v34 = &v70.i8[v29];
    unsigned __int16 v35 = &v71.i8[v29];
    unsigned int v36 = &v72.i8[v29];
    unsigned int v37 = &v67[0].i8[v29];
    int v38 = v7;
    unsigned __int16 v39 = v24;
    do
    {
      uint64_t v40 = &v24[v32];
      *(_WORD *)&v37[v32] = *v40;
      *(_WORD *)&v36[v32] = v40[1];
      *(_WORD *)&v35[v32] = *v25;
      *(_WORD *)&v34[v32] = v25[1];
      *(_WORD *)&v33[v32] = v25[2];
      int32x2_t v41 = v39;
      v25 += 3;
      v32 += 2;
      ++v38;
      unsigned __int16 v39 = v40 + 2;
    }
    while (v31 > v38);
    unsigned int v24 = v41 + 2;
  }
  v73.val[0] = v67[0];
  v73.val[1] = v72;
  v74.val[1] = v70;
  v74.val[0] = v71;
  v7 += v26 - v31;
  uint64_t v15 = v25;
  unint64_t v16 = v24;
  v74.val[2] = v69;
LABEL_23:
  uint64_t v42 = 0;
  int8x16_t v43 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v74.val[0], v20));
  int16x8_t v44 = (int16x8_t)vandq_s8((int8x16_t)v74.val[1], v21);
  int8x16_t v45 = (int8x16_t)vshrq_n_u16((uint16x8_t)v73.val[0], 4uLL);
  int8x16_t v46 = (int8x16_t)vshrq_n_u16((uint16x8_t)v73.val[1], 4uLL);
  int8x16_t v47 = (int8x16_t)vcgtq_u16((uint16x8_t)v44, v23);
  int8x16_t v48 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v74.val[1], 3uLL)), 4uLL);
  uint16x8_t v49 = vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v74.val[0], 3uLL)), 4uLL);
  uint16x8_t v50 = (uint16x8_t)vbslq_s8(v47, (int8x16_t)vshrq_n_u16((uint16x8_t)v48, 1uLL), v48);
  int16x8_t v51 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v74.val[2], v22), (int16x8_t)vbicq_s8(v17, (int8x16_t)v74.val[0])), vorrq_s8(v47, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v74.val[0], v19))));
  int16x8_t v52 = vaddq_s16((int16x8_t)vbslq_s8(v47, (int8x16_t)vaddq_s16(v44, v18), (int8x16_t)v44), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v74.val[0]), (int8x16_t)vcgtq_s16(v74.val[1], v18)), v21));
  int16x8_t v53 = (int16x8_t)vshrq_n_u16(v50, 1uLL);
  int16x8_t v54 = vqshlq_s16(vqdmulhq_s16(v53, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v51, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v74.val[2], 4uLL))), v10);
  int8x16_t v55 = (int8x16_t)vceqzq_s16(v51);
  v67[0] = v52;
  v67[1] = (int16x8_t)vornq_s8(vandq_s8((int8x16_t)v51, v43), v43);
  v68[0] = vbslq_s8(v55, v46, (int8x16_t)vqdmulhq_s16(v54, v53));
  v68[1] = vbslq_s8(v55, v45, (int8x16_t)vqdmulhq_s16(v54, (int16x8_t)vshrq_n_u16(v49, 1uLL)));
  int16x8_t v72 = (int16x8_t)v46;
  int v56 = (unsigned __int16 *)v68;
  while (1)
  {
    BOOL v57 = v9 == 0;
    if (!v9) {
      int v9 = v11;
    }
    uint64_t v58 = v14 + 404 * v57;
    unsigned int v59 = *(v56 - 16);
    uint64_t v60 = *(v56 - 8);
    uint64_t v61 = *v56;
    uint64_t v62 = v56[8];
    ++*(_DWORD *)(v58 + 384);
    uint64_t v63 = v72.u16[v42];
    *(void *)(v58 + 388) += v63;
    *(void *)(v58 + 396) += v63 * (unint64_t)v63;
    if (v60)
    {
      if (v60 != 0xFFFF)
      {
        unsigned int v64 = (void *)(v58 + 24 * v59);
        uint64_t v65 = v64[1];
        *v64 += v60;
        v64[1] = v65 + v61;
        v64[2] += v62;
      }
    }
    else
    {
      __n128 v66 = (_DWORD *)(v14 + 404 * v57 + 12 * v13);
      ++v66[84];
      v66[85] += v61;
      v66[86] += v62;
    }
    ++*a7;
    if (v8 - 1 == v42) {
      break;
    }
    ++v56;
    v13 ^= a3;
    --v9;
    ++v42;
    v14 += 404 * v57;
    if (v42 == 8)
    {
      v8 -= 8;
      uint64_t v14 = v58;
      if (v8 + 1 > 1) {
        goto LABEL_6;
      }
      break;
    }
  }
LABEL_33:
  if (v7) {
    sub_10001D548();
  }
}

uint64_t sub_10000B17C(uint64_t a1, unint64_t a2, uint64_t a3, _WORD *a4, _WORD *a5, _WORD *a6)
{
  uint64_t v12 = *(unsigned int *)(a1 + 16);
  unsigned int v13 = *(unsigned __int16 *)(a1 + 628);
  bzero(a6, *(unsigned int *)(a1 + 487272));
  if (!a2) {
    sub_10001DFF0();
  }
  uint64_t v24 = a1;
  uint64_t v14 = 0;
  uint64_t v15 = 40;
  if (!*(_DWORD *)(a3 + 32)) {
    uint64_t v15 = 152;
  }
  int v23 = *(_DWORD *)(a3 + v15);
  do
  {
    int v16 = *(_DWORD *)(a3 + 32);
    if (v12)
    {
      int8x16_t v17 = *(unsigned __int16 **)(a3 + 56);
      uint64_t v18 = v12;
      int8x16_t v19 = a6;
      int8x16_t v20 = a5;
      int8x16_t v21 = a4;
      do
      {
        if (!v16)
        {
          int8x16_t v17 = *(unsigned __int16 **)(a3 + 168);
          int v16 = *(_DWORD *)(a3 + 144);
        }
        *v21 += *v17 >> 6;
        *v20 += v17[1] >> 6;
        if (v13 < *v17 || v13 < v17[1]) {
          ++*v19;
        }
        ++v19;
        v17 += 2;
        ++v21;
        ++v20;
        --v16;
        --v18;
      }
      while (v18);
    }
    sub_10000AA54(a3);
    sub_10000AA54(a3 + 112);
    if (v16) {
      sub_10001E01C();
    }
    ++v14;
  }
  while (v14 != a2);

  return sub_10000B598(v24 + 608, 0x80 / a2, v12, v23, a4, a5, a6);
}

void sub_10000B304(int a1, unsigned int *a2, uint64_t a3, unsigned __int16 *__src, unsigned __int16 *a5, char *__dst, _WORD *a7, uint64_t a8)
{
  unsigned int v15 = a2[8];
  switch(v15)
  {
    case 4u:
      sub_10000B68C(a2[7], __src, (uint64_t)__dst);
      sub_10000B68C(a2[7], a5, (uint64_t)a7);
      break;
    case 2u:
      sub_10000B62C(a2[7], __src, __dst);
      sub_10000B62C(a2[7], a5, a7);
      break;
    case 1u:
      memcpy(__dst, __src, 2 * a2[7]);
      memcpy(a7, a5, 2 * a2[7]);
      break;
    default:
      sub_10001E048();
  }
  if (a1 == 1)
  {
    if ((*(_DWORD *)(a3 + 4) & 0x80000000) == 0) {
      sub_10001E0F8();
    }
    if (*(int *)(a3 + 8) <= 0) {
      sub_10001E124();
    }
    if (a2[13])
    {
      unsigned int v38 = 0;
      unsigned int v39 = 0;
      unsigned int v40 = a2[10];
      do
      {
        if (a2[12] + v39 >= a2[11]) {
          unsigned int v39 = a2[11];
        }
        else {
          v39 += a2[12];
        }
        unsigned int v41 = (v39 - v40) & 0xFFFFFFF8;
        *(_DWORD *)(a8 + 340) = v41;
        uint64_t v42 = (int16x8_t *)&__dst[2 * v40];
        int8x16_t v43 = (int8x16_t *)&a7[v40];
        sub_10000B718(v41, v42, v43, a8);
        sub_10000B718(v41, v42, v43 + 1, a8 + 160);
        a8 += 360;
        ++v38;
        unsigned int v40 = v39;
      }
      while (v38 < a2[13]);
    }
  }
  else
  {
    if (a1) {
      sub_10001E074();
    }
    uint64_t v16 = *(int *)(a3 + 4);
    if ((v16 & 0x80000000) == 0) {
      sub_10001E0A0();
    }
    int v17 = *(_DWORD *)(a3 + 8);
    if (v17 <= 0) {
      sub_10001E0CC();
    }
    unsigned int v18 = a2[13];
    if (v18)
    {
      int v19 = 0;
      unsigned int v20 = 0;
      unsigned int v22 = a2[11];
      unsigned int v21 = a2[12];
      int v23 = v17 + 1;
      unsigned int v24 = a2[10];
      do
      {
        unint64_t v25 = &__dst[2 * v24];
        int v26 = &a7[v24];
        v20 += v21;
        if (v20 >= v22) {
          unsigned int v20 = v22;
        }
        unsigned int v27 = (v20 - v24) & 0xFFFFFFF8;
        *(_DWORD *)(a8 + 340) = v27;
        uint64_t v28 = v16;
        uint64_t v29 = (float32x4_t *)a8;
        do
        {
          unsigned int v30 = 0;
          int32x4_t v31 = 0uLL;
          if (v27)
          {
            unsigned int v32 = v27;
            int v33 = v25;
            int v34 = &v26[v28];
            do
            {
              int v35 = *(unsigned __int16 *)v33;
              if (v35 != 0xFFFF)
              {
                unsigned int v36 = *v34;
                if (v36 != 0xFFFF)
                {
                  v30 += v36 * v36;
                  v37.i32[0] = *(unsigned __int16 *)v33;
                  v37.i32[1] = v35 * v35;
                  v37.i64[1] = __PAIR64__(v36 * v35, v36);
                  int32x4_t v31 = vaddq_s32(v31, v37);
                }
              }
              v33 += 2;
              ++v34;
              --v32;
            }
            while (v32);
          }
          v29[1].f32[0] = v29[1].f32[0] + (float)v30;
          *uint64_t v29 = vaddq_f32(*v29, vcvtq_f32_u32((uint32x4_t)v31));
          uint64_t v29 = (float32x4_t *)((char *)v29 + 20);
          ++v28;
        }
        while (v23 != v28);
        ++v19;
        a8 += 360;
        unsigned int v24 = v20;
      }
      while (v19 != v18);
    }
  }
}

uint64_t sub_10000B598(uint64_t result, int a2, uint64_t a3, char a4, _WORD *a5, _WORD *a6, _WORD *a7)
{
  unsigned int v7 = *(unsigned __int16 *)(result + 24);
  if (!*(unsigned char *)(result + 16)) {
    unsigned int v7 = 0xFFFF;
  }
  for (; a3; --a3)
  {
    *a5 = ((unsigned __int16)*a5 * a2) >> 5;
    unsigned int v8 = (unsigned __int16)*a6 * a2;
    *a6 = v8 >> 5;
    unsigned int v9 = (unsigned __int16)*a5;
    unsigned int v10 = (v8 >> 4) & 0xFFFE;
    BOOL v11 = v10 >= v9;
    __int16 v12 = v10 - v9;
    if (!v11) {
      __int16 v12 = 0;
    }
    if (a4)
    {
      *a5 = v12;
      __int16 v12 = v9;
    }
    *a6 = v12;
    if (v7 <= (unsigned __int16)*a7)
    {
      *a7 = 1;
      *a5 = -1;
      *a6 = -1;
    }
    ++a7;
    ++a5;
    ++a6;
    a4 ^= 1u;
  }
  return result;
}

uint64_t sub_10000B62C(uint64_t result, unsigned __int16 *a2, _WORD *a3)
{
  uint64_t v3 = result - 1;
  if (result != 1)
  {
    do
    {
      *a3 = *a2;
      int v4 = *a2;
      if (v4 == 0xFFFF)
      {
        LOWORD(v6) = -1;
      }
      else
      {
        int v5 = a2[1];
        unsigned int v6 = (v4 + v5 + 1) >> 1;
        if (v5 == 0xFFFF) {
          LOWORD(v6) = -1;
        }
      }
      a3[1] = v6;
      ++a2;
      a3 += 2;
      --v3;
    }
    while (v3);
  }
  *a3 = *a2;
  return result;
}

uint64_t sub_10000B68C(uint64_t result, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3 = result - 1;
  if (result != 1)
  {
    do
    {
      int v4 = *a2;
      *(_WORD *)a3 = v4;
      int v5 = *a2;
      if (v5 == 0xFFFF || (int v6 = a2[1], v6 == 0xFFFF))
      {
        *(_DWORD *)(a3 + 2) = -1;
        LOWORD(v8) = -1;
      }
      else
      {
        unsigned int v7 = v5 + v6 + 1;
        *(_WORD *)(a3 + 4) = v7 >> 1;
        *(_WORD *)(a3 + 2) = (v4 + (v7 >> 1) + 1) >> 1;
        unsigned int v8 = (a2[1] + (v7 >> 1) + 1) >> 1;
      }
      *(_WORD *)(a3 + 6) = v8;
      ++a2;
      a3 += 8;
      --v3;
    }
    while (v3);
  }
  *(_WORD *)a3 = *a2;
  return result;
}

float sub_10000B718(int a1, int16x8_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (a1 < 1)
  {
    int32x4_t v21 = 0uLL;
    float v92 = 0.0;
    float v91 = 0.0;
    float v90 = 0.0;
    float v89 = 0.0;
    float v88 = 0.0;
    float v87 = 0.0;
    float v86 = 0.0;
    float v85 = 0.0;
    int32x4_t v20 = 0uLL;
    int32x4_t v19 = 0uLL;
    int32x4_t v18 = 0uLL;
    int32x4_t v17 = 0uLL;
    int32x4_t v16 = 0uLL;
    int32x4_t v14 = 0uLL;
    int32x4_t v12 = 0uLL;
  }
  else
  {
    unsigned int v4 = 0;
    unsigned int v5 = 0;
    unsigned int v6 = 0;
    unsigned int v7 = 0;
    unsigned int v8 = 0;
    unsigned int v9 = 0;
    unsigned int v10 = 0;
    unsigned int v11 = 0;
    int32x4_t v12 = 0uLL;
    v13.i64[0] = -1;
    v13.i64[1] = -1;
    int32x4_t v14 = 0uLL;
    unsigned int v15 = a1 + 8;
    int32x4_t v16 = 0uLL;
    int32x4_t v17 = 0uLL;
    int32x4_t v18 = 0uLL;
    int32x4_t v19 = 0uLL;
    int32x4_t v20 = 0uLL;
    int32x4_t v21 = 0uLL;
    do
    {
      int16x8_t v22 = (int16x8_t)a3[-1];
      int16x8_t v23 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 2uLL);
      int16x8_t v24 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 4uLL);
      int16x8_t v25 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 6uLL);
      int16x8_t v26 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 8uLL);
      int16x8_t v27 = *a2++;
      int16x8_t v28 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 0xAuLL);
      int16x8_t v29 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 0xCuLL);
      int16x8_t v30 = (int16x8_t)vextq_s8((int8x16_t)v22, *a3, 0xEuLL);
      uint16x8_t v31 = (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v27, v13));
      int32x4_t v32 = (int32x4_t)vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v22, v13)));
      int16x8_t v33 = (int16x8_t)vminq_u16((uint16x8_t)v27, (uint16x8_t)v32);
      int16x8_t v34 = (int16x8_t)vminq_u16((uint16x8_t)v22, (uint16x8_t)v32);
      int32x4_t v35 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v33.i8, *(uint16x4_t *)v33.i8), (uint16x8_t)v33, (uint16x8_t)v33);
      int32x4_t v36 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v34.i8, *(uint16x4_t *)v34.i8), (uint16x8_t)v34, (uint16x8_t)v34);
      int32x4_t v37 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v33.i8, *(uint16x4_t *)v34.i8), (uint16x8_t)v33, (uint16x8_t)v34);
      v32.i16[0] = vaddvq_s16(v33);
      v33.i16[0] = vaddvq_s16(v34);
      uint16x8_t v38 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v23, v13)));
      int16x8_t v39 = (int16x8_t)vminq_u16((uint16x8_t)v27, v38);
      int16x8_t v40 = (int16x8_t)vminq_u16((uint16x8_t)v23, v38);
      v32.i32[1] = v33.i32[0];
      int32x4_t v41 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v39.i8, *(uint16x4_t *)v39.i8), (uint16x8_t)v39, (uint16x8_t)v39);
      int32x4_t v42 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v40.i8, *(uint16x4_t *)v40.i8), (uint16x8_t)v40, (uint16x8_t)v40);
      int v43 = vaddvq_s32(v37);
      int32x4_t v44 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v39.i8, *(uint16x4_t *)v40.i8), (uint16x8_t)v39, (uint16x8_t)v40);
      v37.i16[0] = vaddvq_s16(v39);
      v40.i16[0] = vaddvq_s16(v40);
      v37.i32[1] = v40.i32[0];
      v39.i32[0] = vaddvq_s32(v35);
      int32x4_t v45 = (int32x4_t)vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v24, v13)));
      int16x8_t v46 = (int16x8_t)vminq_u16((uint16x8_t)v27, (uint16x8_t)v45);
      int v47 = vaddvq_s32(v44);
      int16x8_t v48 = (int16x8_t)vminq_u16((uint16x8_t)v24, (uint16x8_t)v45);
      int32x4_t v49 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v48.i8, *(uint16x4_t *)v48.i8), (uint16x8_t)v48, (uint16x8_t)v48);
      v45.i32[0] = vaddvq_s32(v41);
      int32x4_t v50 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v46.i8, *(uint16x4_t *)v48.i8), (uint16x8_t)v46, (uint16x8_t)v48);
      int v51 = vaddvq_s32(v50);
      v44.i16[0] = vaddvq_s16(v46);
      v50.i16[0] = vaddvq_s16(v48);
      int v52 = v43;
      v44.i32[1] = v50.i32[0];
      v46.i32[0] = vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v46.i8, *(uint16x4_t *)v46.i8), (uint16x8_t)v46, (uint16x8_t)v46));
      *(int8x8_t *)v32.i8 = vand_s8(*(int8x8_t *)v32.i8, (int8x8_t)0xFFFF0000FFFFLL);
      uint16x8_t v53 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v25, v13)));
      int16x8_t v54 = (int16x8_t)vminq_u16((uint16x8_t)v27, v53);
      int16x8_t v55 = (int16x8_t)vminq_u16((uint16x8_t)v25, v53);
      v32.i64[1] = __PAIR64__(vaddvq_s32(v36), v39.u32[0]);
      int32x4_t v56 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v54.i8, *(uint16x4_t *)v54.i8), (uint16x8_t)v54, (uint16x8_t)v54);
      int32x4_t v57 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v55.i8, *(uint16x4_t *)v55.i8), (uint16x8_t)v55, (uint16x8_t)v55);
      int v58 = v47;
      int32x4_t v59 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v54.i8, *(uint16x4_t *)v55.i8), (uint16x8_t)v54, (uint16x8_t)v55);
      v60.i32[0] = vaddvq_s32(v59);
      v54.i16[0] = vaddvq_s16(v54);
      v59.i16[0] = vaddvq_s16(v55);
      *(int8x8_t *)v55.i8 = vand_s8(*(int8x8_t *)v37.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v54.i32[1] = v59.i32[0];
      int v61 = v51;
      uint16x8_t v62 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v26, v13)));
      int16x8_t v63 = (int16x8_t)vminq_u16((uint16x8_t)v27, v62);
      int16x8_t v64 = (int16x8_t)vminq_u16((uint16x8_t)v26, v62);
      int32x4_t v65 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v63.i8, *(uint16x4_t *)v63.i8), (uint16x8_t)v63, (uint16x8_t)v63);
      *(int8x8_t *)v26.i8 = vand_s8(*(int8x8_t *)v44.i8, (int8x8_t)0xFFFF0000FFFFLL);
      int32x4_t v66 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v64.i8, *(uint16x4_t *)v64.i8), (uint16x8_t)v64, (uint16x8_t)v64);
      int v67 = vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v63.i8, *(uint16x4_t *)v64.i8), (uint16x8_t)v63, (uint16x8_t)v64));
      __int32 v68 = v60.i32[0];
      v60.i16[0] = vaddvq_s16(v63);
      v64.i16[0] = vaddvq_s16(v64);
      v60.i32[1] = v64.i32[0];
      *(int8x8_t *)v64.i8 = vand_s8(*(int8x8_t *)v54.i8, (int8x8_t)0xFFFF0000FFFFLL);
      uint16x8_t v69 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v28, v13)));
      int16x8_t v70 = (int16x8_t)vminq_u16((uint16x8_t)v27, v69);
      int16x8_t v71 = (int16x8_t)vminq_u16((uint16x8_t)v28, v69);
      int v72 = v67;
      v55.i64[1] = __PAIR64__(vaddvq_s32(v42), v45.u32[0]);
      int v73 = vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v70.i8, *(uint16x4_t *)v71.i8), (uint16x8_t)v70, (uint16x8_t)v71));
      int32x4_t v74 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v71.i8, *(uint16x4_t *)v71.i8), (uint16x8_t)v71, (uint16x8_t)v71);
      v26.i64[1] = __PAIR64__(vaddvq_s32(v49), v46.u32[0]);
      v46.i16[0] = vaddvq_s16(v70);
      v71.i16[0] = vaddvq_s16(v71);
      v46.i32[1] = v71.i32[0];
      v64.i64[1] = __PAIR64__(vaddvq_s32(v57), vaddvq_s32(v56));
      v4 += v52;
      *(int8x8_t *)v45.i8 = vand_s8(v60, (int8x8_t)0xFFFF0000FFFFLL);
      v45.i64[1] = __PAIR64__(vaddvq_s32(v66), vaddvq_s32(v65));
      v5 += v58;
      v6 += v61;
      *(int8x8_t *)v71.i8 = vand_s8(*(int8x8_t *)v46.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v71.i64[1] = __PAIR64__(vaddvq_s32(v74), vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v70.i8, *(uint16x4_t *)v70.i8), (uint16x8_t)v70, (uint16x8_t)v70)));
      v7 += v68;
      v8 += v72;
      v9 += v73;
      uint16x8_t v75 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v29, v13)));
      int16x8_t v76 = (int16x8_t)vminq_u16((uint16x8_t)v27, v75);
      int16x8_t v77 = (int16x8_t)vminq_u16((uint16x8_t)v29, v75);
      int32x4_t v78 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v76.i8, *(uint16x4_t *)v76.i8), (uint16x8_t)v76, (uint16x8_t)v76);
      int32x4_t v79 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v77.i8, *(uint16x4_t *)v77.i8), (uint16x8_t)v77, (uint16x8_t)v77);
      v10 += vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v76.i8, *(uint16x4_t *)v77.i8), (uint16x8_t)v76, (uint16x8_t)v77));
      v76.i16[0] = vaddvq_s16(v76);
      v77.i16[0] = vaddvq_s16(v77);
      v76.i32[1] = v77.i32[0];
      *(int8x8_t *)v76.i8 = vand_s8(*(int8x8_t *)v76.i8, (int8x8_t)0xFFFF0000FFFFLL);
      int32x4_t v12 = vaddq_s32(v32, v12);
      v76.i64[1] = __PAIR64__(vaddvq_s32(v79), vaddvq_s32(v78));
      int32x4_t v14 = vaddq_s32((int32x4_t)v55, v14);
      uint16x8_t v80 = vminq_u16(v31, (uint16x8_t)vmvnq_s8((int8x16_t)vceqq_s16(v30, v13)));
      int16x8_t v81 = (int16x8_t)vminq_u16((uint16x8_t)v27, v80);
      int32x4_t v16 = vaddq_s32((int32x4_t)v26, v16);
      int16x8_t v82 = (int16x8_t)vminq_u16((uint16x8_t)v30, v80);
      int32x4_t v83 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v81.i8, *(uint16x4_t *)v81.i8), (uint16x8_t)v81, (uint16x8_t)v81);
      int32x4_t v84 = (int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v82.i8, *(uint16x4_t *)v82.i8), (uint16x8_t)v82, (uint16x8_t)v82);
      int32x4_t v17 = vaddq_s32((int32x4_t)v64, v17);
      v11 += vaddvq_s32((int32x4_t)vmlal_high_u16(vmull_u16(*(uint16x4_t *)v81.i8, *(uint16x4_t *)v82.i8), (uint16x8_t)v81, (uint16x8_t)v82));
      int32x4_t v18 = vaddq_s32(v45, v18);
      v81.i16[0] = vaddvq_s16(v81);
      v82.i16[0] = vaddvq_s16(v82);
      v81.i32[1] = v82.i32[0];
      int32x4_t v19 = vaddq_s32((int32x4_t)v71, v19);
      *(int8x8_t *)v81.i8 = vand_s8(*(int8x8_t *)v81.i8, (int8x8_t)0xFFFF0000FFFFLL);
      v81.i64[1] = __PAIR64__(vaddvq_s32(v84), vaddvq_s32(v83));
      int32x4_t v20 = vaddq_s32((int32x4_t)v76, v20);
      v15 -= 8;
      ++a3;
      int32x4_t v21 = vaddq_s32((int32x4_t)v81, v21);
    }
    while (v15 > 8);
    float v85 = (float)v4;
    float v86 = (float)v5;
    float v87 = (float)v6;
    float v88 = (float)v7;
    float v89 = (float)v8;
    float v90 = (float)v9;
    float v91 = (float)v10;
    float v92 = (float)v11;
  }
  *(float32x2_t *)a4 = vcvt_f32_u32((uint32x2_t)vzip1_s32(*(int32x2_t *)v12.i8, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL)));
  *(float *)(a4 + 8) = (float)v12.u32[1];
  *(float *)(a4 + 12) = v85;
  *(float32x4_t *)(a4 + 16) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v12, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v12, v14), v14), 0xCuLL));
  *(float *)(a4 + 32) = v86;
  *(float32x4_t *)(a4 + 36) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v14, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v14, v16), v16), 0xCuLL));
  *(float *)(a4 + 52) = v87;
  *(float32x4_t *)(a4 + 56) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v16, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v16, v17), v17), 0xCuLL));
  *(float *)(a4 + 72) = v88;
  *(float32x4_t *)(a4 + 76) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v17, v18), v18), 0xCuLL));
  *(float *)(a4 + 92) = v89;
  *(float32x4_t *)(a4 + 96) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v18, v19), v19), 0xCuLL));
  *(float *)(a4 + 112) = v90;
  *(float32x4_t *)(a4 + 116) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v19, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v19, v20), v20), 0xCuLL));
  *(float *)(a4 + 132) = v91;
  *(float32x4_t *)(a4 + 136) = vcvtq_f32_u32((uint32x4_t)vextq_s8((int8x16_t)v20, (int8x16_t)vuzp2q_s32(vtrn1q_s32(v20, v21), v21), 0xCuLL));
  *(float *)v21.i32 = (float)v21.u32[3];
  *(float *)(a4 + 152) = v92;
  *(float *)(a4 + 156) = (float)v21.u32[3];
  return *(float *)v21.i32;
}

uint64_t sub_10000BBE4(uint64_t a1, int a2, unint64_t a3, int *a4, _WORD *a5, _WORD *a6, _WORD *a7)
{
  uint64_t v9 = *(unsigned int *)(a1 + 20);
  int v10 = *a4;
  uint64_t v34 = *((void *)a4 + 2);
  uint64_t v35 = *((void *)a4 + 1);
  int v30 = a4[18];
  uint64_t v11 = *((void *)a4 + 12);
  int v12 = a4[28];
  uint64_t v33 = *((void *)a4 + 15);
  uint64_t v31 = *((void *)a4 + 16);
  int v13 = a4[46];
  int32x4_t v14 = (unsigned __int16 *)*((void *)a4 + 26);
  unsigned int v15 = *(unsigned __int16 *)(a1 + 628);
  bzero(a7, *(unsigned int *)(a1 + 487272));
  if (!a3) {
    sub_10001E150();
  }
  uint64_t v17 = 20;
  if (!a4[18]) {
    uint64_t v17 = 48;
  }
  int v18 = a4[v17];
  if (v9)
  {
    uint64_t v19 = 0;
    int v20 = v30 - a2;
    if (v30 - a2 >= 1) {
      int v21 = 0;
    }
    else {
      int v21 = v13;
    }
    int v22 = v21 + v20;
    int16x8_t v23 = a7;
    int16x8_t v24 = a6;
    int16x8_t v25 = a5;
LABEL_9:
    if (v20 >= 1) {
      int16x8_t v26 = (unsigned __int16 *)(v11 + 4 * a2);
    }
    else {
      int16x8_t v26 = &v14[-2 * v20];
    }
    unint64_t v27 = a3;
    int v28 = v22;
    while (1)
    {
      if (!v28)
      {
        int16x8_t v26 = v14;
        int v28 = v13;
      }
      *v25 += *v26 >> 6;
      *v24 += v26[1] >> 6;
      if (v15 < *v26 || v15 < v26[1]) {
        ++*v23;
      }
      v26 += 2;
      --v28;
      if (!--v27)
      {
        switch(v10)
        {
          case 0:
          case 2:
            sub_10001D46C();
          case 1:
          case 3:
            switch(v12)
            {
              case 0:
              case 2:
                sub_10001D46C();
              case 1:
              case 3:
                v11 += 2 * (v34 + v35);
                v14 += v31 + v33;
                ++v25;
                ++v24;
                ++v23;
                if (++v19 == v9) {
                  goto LABEL_22;
                }
                goto LABEL_9;
              case 4:
                sub_10001D498();
              default:
                sub_10001D440();
            }
          case 4:
            sub_10001D498();
          default:
            sub_10001D440();
        }
      }
    }
  }
LABEL_22:

  return sub_10000B598(a1 + 608, 0x80 / a3, v9, v18, a5, a6, a7);
}

uint64_t sub_10000BE60(uint64_t a1, unsigned int a2, uint64_t a3, _WORD *a4, _WORD *a5)
{
  if (!a2) {
    sub_10001E17C();
  }
  int v10 = 0;
  uint64_t v11 = *(unsigned int *)(a1 + 4);
  uint64_t v12 = a3 + 112;
  do
  {
    int v13 = *(_DWORD *)(a3 + 32);
    uint64_t v14 = *(unsigned int *)(a1 + 4);
    if (v14)
    {
      unsigned int v15 = *(_WORD **)(a3 + 56);
      int32x4_t v16 = a5;
      uint64_t v17 = a4;
      do
      {
        if (!v13)
        {
          unsigned int v15 = *(_WORD **)(a3 + 168);
          int v13 = *(_DWORD *)(a3 + 144);
        }
        *v17++ += *v15 >> 6;
        *v16++ += v15[2] >> 6;
        v15 += 4;
        --v13;
        --v14;
      }
      while (v14);
    }
    sub_10000AA54(a3);
    uint64_t result = sub_10000AA54(v12);
    if (v13) {
      sub_10001E1A8();
    }
    ++v10;
  }
  while (v10 != a2);
  if (v11)
  {
    unsigned int v19 = 0x80 / a2;
    do
    {
      *a4 = (v19 * (unsigned __int16)*a4) >> 5;
      ++a4;
      *a5 = (v19 * (unsigned __int16)*a5) >> 5;
      ++a5;
      --v11;
    }
    while (v11);
  }
  return result;
}

uint64_t sub_10000BF70(uint64_t result, uint64_t a2, int a3, int *a4, int *a5, uint64_t a6, _DWORD *a7, double a8, __n128 a9)
{
  int v9 = *a4;
  int v10 = *(_DWORD *)(result + 4);
  if (v10 >= 1)
  {
    int v11 = 0;
    int v12 = *(_DWORD *)(result + 12);
    uint64_t v13 = a6 - 404;
    int v14 = a4[2];
    int v15 = v10 + 1;
    int32x4_t v16 = (unsigned __int16 *)*((void *)a4 + 3);
    char v17 = *(unsigned char *)(a2 + 4);
    int8x8_t v18 = (int8x8_t)vdup_n_s32(0x7FF8u);
    do
    {
      int v19 = *a5;
      if (v9) {
        int v19 = v9;
      }
      else {
        int v14 = a5[2];
      }
      if (!v9) {
        int32x4_t v16 = (unsigned __int16 *)*((void *)a5 + 3);
      }
      BOOL v20 = v11 == 0;
      if (v11) {
        int v21 = v11;
      }
      else {
        int v21 = v12;
      }
      uint64_t v22 = v13 + 404 * (v11 == 0);
      unsigned int v23 = *v16;
      int v24 = (__int16)v23 >> 3;
      int v25 = v16[3];
      if (v14) {
        int v26 = -v24;
      }
      else {
        int v26 = (__int16)v23 >> 3;
      }
      unsigned __int16 v27 = v26 + v25;
      ++*(_DWORD *)(v22 + 384);
      *(void *)(v22 + 388) += v27;
      *(void *)(v22 + 396) += v27 * (unint64_t)v27;
      if ((v23 & 4) == 0)
      {
        int v28 = (__int16)v16[1];
        unsigned int v29 = v28 & 7;
        if ((v23 & 1) != 0 || (((v28 & 7u) < 6) & (v23 >> 1)) != 0)
        {
          int v43 = (_DWORD *)(v13 + 404 * v20 + 12 * v14);
          ++v43[84];
          v43[85] += v27;
          v43[86] += v25;
        }
        else
        {
          __int16 v30 = v29 > 5;
          unsigned int v31 = v16[2];
          uint64_t v32 = (v31 & 0xF) + 1;
          unsigned int v33 = v31 >> 4;
          int v34 = v28 >> 3;
          if (v28 < 0) {
            int v34 = -v34;
          }
          if (v24 < 0) {
            int v24 = -v24;
          }
          unsigned __int16 v35 = v29 - v30;
          unsigned int v36 = (16 * (v34 & 0xFFFu)) >> v30;
          unsigned int v37 = (v32 >> 1) * v33;
          int v38 = 8 * v24;
          if (((v28 ^ v23) & 0x8000u) == 0) {
            unsigned __int16 v39 = v35 + 7;
          }
          else {
            unsigned __int16 v39 = v35;
          }
          uint64_t v40 = v22 + 24 * v39;
          a9.n128_u32[0] = v36;
          v41.i32[0] = vshr_n_u32((uint32x2_t)a9.n128_u64[0], 1uLL).u32[0];
          a9.n128_u32[1] = v38;
          v41.i32[1] = vand_s8(*(int8x8_t *)&a9, v18).i32[1];
          signed int v42 = (v41.i32[0] * v37) >> 15 << v17;
          if (v42 <= -32768) {
            signed int v42 = -32768;
          }
          if (v42 >= 0x7FFF) {
            signed int v42 = 0x7FFF;
          }
          *(void *)v40 += v32;
          a9 = (__n128)vaddw_u32(*(uint64x2_t *)(v40 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v42), v41), 0xFuLL));
          *(__n128 *)(v40 + 8) = a9;
        }
      }
      v16 += 4;
      int v9 = v19 - 1;
      int v11 = v21 - 1;
      uint64_t result = (*a7 + 1);
      *a7 = result;
      v14 ^= a3;
      --v15;
      uint64_t v13 = v22;
    }
    while (v15 > 1);
  }
  if (v9) {
    sub_10001D6A8();
  }
  return result;
}

uint64_t sub_10000C1A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, double a7, double a8, __n128 a9)
{
  int v9 = 2 * *(_DWORD *)a3;
  int v10 = 2 * *(_DWORD *)(result + 4);
  if (v10 >= 1)
  {
    int v11 = 0;
    int v12 = 2 * *(_DWORD *)(result + 12);
    uint64_t v13 = a5 - 404;
    if (*(_DWORD *)a3) {
      uint64_t v14 = a3;
    }
    else {
      uint64_t v14 = a4;
    }
    uint64_t v15 = *(int *)(v14 + 8);
    int32x4_t v16 = *(unsigned __int16 **)(a3 + 24);
    char v17 = *(unsigned char *)(a2 + 4);
    int v18 = v10 + 2;
    int8x8_t v19 = (int8x8_t)vdup_n_s32(0x7FF8u);
    do
    {
      int v20 = 2 * *(_DWORD *)a4;
      if (v9) {
        int v20 = v9;
      }
      else {
        int32x4_t v16 = *(unsigned __int16 **)(a4 + 24);
      }
      BOOL v21 = v11 == 0;
      if (v11) {
        int v22 = v11;
      }
      else {
        int v22 = v12;
      }
      uint64_t result = v13 + 404 * (v11 == 0);
      unsigned int v23 = v16[3];
      int v24 = v16[7];
      unsigned int v25 = v24 - ((__int16)v16[4] >> 3);
      unsigned int v26 = *v16;
      ++*(_DWORD *)(result + 384);
      *(void *)(result + 388) += (unsigned __int16)v25;
      *(void *)(result + 396) += (unsigned __int16)v25 * (unint64_t)(unsigned __int16)v25;
      if ((v26 & 4) == 0)
      {
        int v27 = (__int16)v16[1];
        unsigned int v28 = v27 & 7;
        if ((v26 & 1) != 0 || (((v27 & 7u) < 6) & (v26 >> 1)) != 0)
        {
          uint64_t v43 = v13 + 404 * v21 + 336;
          uint64_t v44 = v43 + 12 * (int)v15;
          ++*(_DWORD *)v44;
          a9.n128_u64[0] = (unint64_t)vand_s8((int8x8_t)__PAIR64__(v23, v25), (int8x8_t)0xFFFF0000FFFFLL);
          *(int32x2_t *)(v44 + 4) = vadd_s32(*(int32x2_t *)(v44 + 4), (int32x2_t)a9.n128_u64[0]);
          int32x4_t v45 = (_DWORD *)(v43 + 12 * (v15 + 1));
          unsigned __int32 v46 = v45[1] + a9.n128_u32[0];
          ++*v45;
          v45[1] = v46;
          v45[2] += v24;
        }
        else
        {
          __int16 v29 = v28 > 5;
          unsigned int v30 = v16[2];
          uint64_t v31 = (v30 & 0xF) + 1;
          unsigned int v32 = v30 >> 4;
          int v33 = (__int16)v26 >> 3;
          int v34 = v27 >> 3;
          if (v27 < 0) {
            int v34 = -v34;
          }
          if (v33 < 0) {
            int v33 = -v33;
          }
          unsigned __int16 v35 = v28 - v29;
          unsigned int v36 = (16 * (v34 & 0xFFFu)) >> v29;
          unsigned int v37 = (v31 >> 1) * v32;
          int v38 = 8 * v33;
          if (((v27 ^ v26) & 0x8000u) == 0) {
            unsigned __int16 v39 = v35 + 7;
          }
          else {
            unsigned __int16 v39 = v35;
          }
          uint64_t v40 = result + 24 * v39;
          a9.n128_u32[0] = v36;
          v41.i32[0] = vshr_n_u32((uint32x2_t)a9.n128_u64[0], 1uLL).u32[0];
          a9.n128_u32[1] = v38;
          v41.i32[1] = vand_s8(*(int8x8_t *)&a9, v19).i32[1];
          signed int v42 = (v41.i32[0] * v37) >> 15 << v17;
          if (v42 <= -32768) {
            signed int v42 = -32768;
          }
          if (v42 >= 0x7FFF) {
            signed int v42 = 0x7FFF;
          }
          *(void *)v40 += v31;
          a9 = (__n128)vaddw_u32(*(uint64x2_t *)(v40 + 8), (uint32x2_t)vshr_n_s32(vmul_s32(vdup_n_s32(v42), v41), 0xFuLL));
          *(__n128 *)(v40 + 8) = a9;
        }
      }
      v16 += 8;
      int v9 = v20 - 2;
      int v11 = v22 - 2;
      ++*a6;
      v18 -= 2;
      uint64_t v13 = result;
    }
    while (v18 > 2);
  }
  if (v9) {
    sub_10001D6D4();
  }
  return result;
}

int16x8_t *sub_10000C40C(int16x8_t *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, int32x4_t a8, int32x4_t a9)
{
  int v9 = *(_DWORD *)a4;
  if (*(_DWORD *)a4) {
    uint64_t v10 = a4;
  }
  else {
    uint64_t v10 = a5;
  }
  int v11 = *(_DWORD *)(v10 + 8);
  int v12 = result->i32[1];
  if (a3)
  {
    a8.i32[0] = 0;
    a9.i32[0] = v11 & 1;
    int8x16_t v13 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(a9, a8), 0);
    v14.i64[0] = 0xFFFF0000FFFFLL;
    v14.i64[1] = 0xFFFF0000FFFFLL;
    v15.i64[0] = 0xFFFF0000FFFF0000;
    v15.i64[1] = 0xFFFF0000FFFF0000;
    int8x16_t v16 = vbslq_s8(v13, v15, v14);
  }
  else
  {
    int8x16_t v16 = (int8x16_t)vdupq_n_s16(-(v11 & 1));
  }
  if (v12 < 1) {
    goto LABEL_35;
  }
  __int32 v17 = 0;
  int v18 = *(const __int16 **)(a4 + 24);
  uint64_t v19 = a6 - 404;
  int16x8_t v20 = vdupq_n_s16(*(char *)(a2 + 4));
  __int32 v21 = result->i32[3];
  int v22 = v68;
  v23.i64[0] = 0x1000100010001;
  v23.i64[1] = 0x1000100010001;
  v24.i64[0] = -1;
  v24.i64[1] = -1;
  v25.i64[0] = 0x2000200020002;
  v25.i64[1] = 0x2000200020002;
  v26.i64[0] = 0x4000400040004;
  v26.i64[1] = 0x4000400040004;
  v27.i64[0] = 0x7000700070007;
  v27.i64[1] = 0x7000700070007;
  v28.i64[0] = 0xF000F000F000FLL;
  v28.i64[1] = 0xF000F000F000FLL;
  v29.i64[0] = 0x5000500050005;
  v29.i64[1] = 0x5000500050005;
  uint64_t result = &v70;
LABEL_9:
  unsigned int v30 = *(const __int16 **)(a5 + 24);
  int v31 = *(_DWORD *)a5;
  if (!v9)
  {
    int v9 = *(_DWORD *)a5;
    int v18 = *(const __int16 **)(a5 + 24);
  }
  if (v9 > 7)
  {
    int v32 = 8;
LABEL_14:
    v9 -= v32;
    int16x8x4_t v72 = vld4q_s16(v18);
    v18 += 32;
    goto LABEL_25;
  }
  int v32 = v12;
  if (v9 == v12) {
    goto LABEL_14;
  }
  if (v9 < 1) {
    sub_10001D72C();
  }
  unint64_t v33 = 0;
  uint64_t v34 = 2 * v9;
  do
  {
    v67[0].i16[v33 / 2] = *v18;
    v71.i16[v33 / 2] = v18[1];
    v70.i16[v33 / 2] = v18[2];
    v69.i16[v33 / 2] = v18[3];
    v33 += 2;
    v18 += 4;
  }
  while (v34 != v33);
  if (v12 >= 8) {
    int v35 = 8;
  }
  else {
    int v35 = v12;
  }
  if (v9 < v35)
  {
    unsigned int v36 = &v69.i16[(unint64_t)v34 / 2];
    unsigned int v37 = &v70.i16[(unint64_t)v34 / 2];
    int v38 = &v71.i16[(unint64_t)v34 / 2];
    unsigned __int16 v39 = &v67[0].i16[(unint64_t)v34 / 2];
    int v40 = v9;
    do
    {
      *v39++ = *v30;
      *v38++ = v30[1];
      *v37++ = v30[2];
      *v36++ = v30[3];
      v30 += 4;
      ++v40;
    }
    while (v35 > v40);
  }
  v72.val[0] = v67[0];
  v72.val[2] = v70;
  v72.val[1] = v71;
  v72.val[3] = v69;
  v9 += v31 - v35;
  int v18 = v30;
LABEL_25:
  uint64_t v41 = 0;
  int8x16_t v42 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v72.val[0], v26));
  int16x8_t v43 = (int16x8_t)vandq_s8((int8x16_t)v72.val[1], v27);
  int16x8_t v44 = vshrq_n_s16(v72.val[0], 3uLL);
  int8x16_t v45 = (int8x16_t)vaddq_s16(v72.val[3], (int16x8_t)vbslq_s8(v16, (int8x16_t)vnegq_s16(v44), (int8x16_t)v44));
  int8x16_t v46 = (int8x16_t)vcgtq_u16((uint16x8_t)v43, v29);
  int8x16_t v47 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v72.val[1], 3uLL)), 4uLL);
  int16x8_t v48 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v72.val[2], v28), (int16x8_t)vbicq_s8(v23, (int8x16_t)v72.val[0])), vorrq_s8(v46, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v72.val[0], v25))));
  int16x8_t v49 = vaddq_s16((int16x8_t)vbslq_s8(v46, (int8x16_t)vaddq_s16(v43, v24), (int8x16_t)v43), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v72.val[0]), (int8x16_t)vcgtq_s16(v72.val[1], v24)), v27));
  int16x8_t v50 = (int16x8_t)vshrq_n_u16((uint16x8_t)vbslq_s8(v46, (int8x16_t)vshrq_n_u16((uint16x8_t)v47, 1uLL), v47), 1uLL);
  int16x8_t v51 = vqshlq_s16(vqdmulhq_s16(v50, vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v48, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v72.val[2], 4uLL))), v20);
  int8x16_t v52 = (int8x16_t)vqdmulhq_s16(v51, v50);
  int8x16_t v53 = (int8x16_t)vqdmulhq_s16(v51, (int16x8_t)vshrq_n_u16(vqshlq_n_u16((uint16x8_t)vabsq_s16(v44), 4uLL), 1uLL));
  int8x16_t v54 = (int8x16_t)vceqzq_s16(v48);
  v67[0] = v49;
  v67[1] = (int16x8_t)vornq_s8(vandq_s8((int8x16_t)v48, v42), v42);
  v68[0] = vbslq_s8(v54, v45, v52);
  v68[1] = vbslq_s8(v54, (int8x16_t)v72.val[3], v53);
  int16x8_t v71 = (int16x8_t)v45;
  int16x8_t v55 = v22;
  int32x4_t v56 = (unsigned __int16 *)v22;
  while (1)
  {
    BOOL v57 = v17 == 0;
    if (!v17) {
      __int32 v17 = v21;
    }
    uint64_t v58 = v19 + 404 * v57;
    unsigned int v59 = *(v56 - 16);
    uint64_t v60 = *(v56 - 8);
    uint64_t v61 = *v56;
    uint64_t v62 = v56[8];
    ++*(_DWORD *)(v58 + 384);
    uint64_t v63 = v71.u16[v41];
    *(void *)(v58 + 388) += v63;
    *(void *)(v58 + 396) += v63 * (unint64_t)v63;
    if (v60)
    {
      if (v60 != 0xFFFF)
      {
        int16x8_t v64 = (void *)(v58 + 24 * v59);
        uint64_t v65 = v64[1] + v61;
        *v64 += v60;
        v64[1] = v65;
        v64[2] += v62;
      }
    }
    else
    {
      int32x4_t v66 = (_DWORD *)(v19 + 404 * v57 + 12 * v11);
      ++v66[84];
      v66[85] += v61;
      v66[86] += v62;
    }
    ++*a7;
    if (v12 - 1 == v41) {
      break;
    }
    ++v56;
    v11 ^= a3;
    --v17;
    ++v41;
    v19 += 404 * v57;
    if (v41 == 8)
    {
      v12 -= 8;
      uint64_t v19 = v58;
      int v22 = v55;
      if (v12 + 1 > 1) {
        goto LABEL_9;
      }
      break;
    }
  }
LABEL_35:
  if (v9) {
    sub_10001D700();
  }
  return result;
}

uint64_t sub_10000C7F0(uint64_t result, uint64_t a2, int *a3, int *a4, uint64_t a5, _DWORD *a6)
{
  int v6 = 2 * *(_DWORD *)(result + 4);
  if (v6 < 1) {
    return result;
  }
  int v7 = 0;
  int16x8_t v8 = vdupq_n_s16(*(char *)(a2 + 4));
  int v9 = 2 * *(_DWORD *)(result + 12);
  if (*a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = a4;
  }
  uint64_t v11 = v10[2];
  int v12 = 2 * *a3;
  uint64_t v13 = a5 - 404;
  int8x16_t v14 = (const __int16 *)*((void *)a3 + 3);
  int v15 = v6 - 2;
  v16.i64[0] = 0x1000100010001;
  v16.i64[1] = 0x1000100010001;
  v17.i64[0] = -1;
  v17.i64[1] = -1;
  v18.i64[0] = 0x2000200020002;
  v18.i64[1] = 0x2000200020002;
  v19.i64[0] = 0x4000400040004;
  v19.i64[1] = 0x4000400040004;
  v20.i64[0] = 0x7000700070007;
  v20.i64[1] = 0x7000700070007;
  v21.i64[0] = 0xF000F000F000FLL;
  v21.i64[1] = 0xF000F000F000FLL;
  uint64_t result = 24;
  v22.i64[0] = 0x5000500050005;
  v22.i64[1] = 0x5000500050005;
LABEL_6:
  int8x16_t v23 = (const __int16 *)*((void *)a4 + 3);
  int v24 = *a4;
  int v25 = 2 * *a4;
  if (v12) {
    int v25 = v12;
  }
  else {
    int8x16_t v14 = (const __int16 *)*((void *)a4 + 3);
  }
  if (v25 > 15)
  {
    int v26 = 16;
LABEL_12:
    int8x16_t v27 = v14;
    int16x8x4_t v78 = vld4q_s16(v27);
    v27 += 32;
    int16x8x4_t v79 = vld4q_s16(v27);
    int16x8_t v28 = vuzp1q_s16(v78.val[0], v79.val[0]);
    int16x8_t v29 = vuzp1q_s16(v78.val[1], v79.val[1]);
    int8x16_t v30 = (int8x16_t)vuzp1q_s16(v78.val[2], v79.val[2]);
    int8x16_t v31 = (int8x16_t)vuzp1q_s16(v78.val[3], v79.val[3]);
    int16x8_t v32 = vuzp2q_s16(v78.val[3], v79.val[3]);
    int8x16_t v33 = (int8x16_t)vsubq_s16(v32, vshrq_n_s16(vuzp2q_s16(v78.val[0], v79.val[0]), 3uLL));
    v14 += 64;
    int v12 = v25 - v26;
    goto LABEL_27;
  }
  int v26 = v6;
  if (v25 == v6) {
    goto LABEL_12;
  }
  if (v25 <= 0) {
    sub_10001D758();
  }
  unsigned int v34 = v25 >> 1;
  if (v25 != 1)
  {
    if (v34 <= 1) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = v34;
    }
    unsigned int v36 = &v74;
    unsigned int v37 = &v73;
    int v38 = &v75;
    unsigned __int16 v39 = &v76;
    int v40 = &v77;
    uint64_t v41 = (__int16 *)v72;
    do
    {
      *v41++ = *v14;
      v40->i16[0] = v14[1];
      int v40 = (int16x8_t *)((char *)v40 + 2);
      v39->i16[0] = v14[2];
      unsigned __int16 v39 = (int8x16_t *)((char *)v39 + 2);
      v38->i16[0] = v14[3];
      int v38 = (int8x16_t *)((char *)v38 + 2);
      __int16 v42 = v14[7];
      v37->i16[0] = v42;
      unsigned int v37 = (int16x8_t *)((char *)v37 + 2);
      v36->i16[0] = v42 + (v14[4] >> 3);
      unsigned int v36 = (int8x16_t *)((char *)v36 + 2);
      v14 += 8;
      --v35;
    }
    while (v35);
  }
  if (v6 <= 15) {
    uint64_t v43 = v6 >> 1;
  }
  else {
    uint64_t v43 = 8;
  }
  if (v34 < v43)
  {
    uint64_t v44 = 0;
    do
    {
      *((_WORD *)v72 + v34 + v44) = *v23;
      v77.i16[v34 + v44] = v23[1];
      v76.i16[v34 + v44] = v23[2];
      v75.i16[v34 + v44] = v23[3];
      __int16 v45 = v23[7];
      v73.i16[v34 + v44] = v45;
      v74.i16[v34 + v44] = v45 + (v23[4] >> 3);
      v23 += 8;
      ++v44;
    }
    while (v43 - v34 != v44);
  }
  int16x8_t v28 = (int16x8_t)v72[0];
  int16x8_t v29 = v77;
  int8x16_t v31 = v75;
  int8x16_t v30 = v76;
  int16x8_t v32 = v73;
  int8x16_t v33 = v74;
  int v12 = 2 * (v24 - v43 + v34);
  int8x16_t v14 = v23;
LABEL_27:
  unint64_t v46 = 0;
  int8x16_t v47 = (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v28, v19));
  int16x8_t v48 = (int16x8_t)vandq_s8((int8x16_t)v29, v20);
  int8x16_t v49 = (int8x16_t)vcgtq_u16((uint16x8_t)v48, v22);
  int8x16_t v50 = (int8x16_t)vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v29, 3uLL)), 4uLL);
  uint16x8_t v51 = vqshlq_n_u16((uint16x8_t)vabsq_s16(vshrq_n_s16(v28, 3uLL)), 4uLL);
  int16x8_t v52 = (int16x8_t)vandq_s8((int8x16_t)vaddq_s16((int16x8_t)vandq_s8(v30, v21), (int16x8_t)vbicq_s8(v16, (int8x16_t)v28)), vorrq_s8(v49, (int8x16_t)vceqzq_s16((int16x8_t)vandq_s8((int8x16_t)v28, v18))));
  int8x16_t v53 = (int8x16_t)vaddq_s16((int16x8_t)vbslq_s8(v49, (int8x16_t)vaddq_s16(v48, v17), (int8x16_t)v48), (int16x8_t)vandq_s8(veorq_s8((int8x16_t)vcltzq_s16(v28), (int8x16_t)vcgtq_s16(v29, v17)), v20));
  int16x8_t v54 = vmulq_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v52, 1uLL), (int16x8_t)vshrq_n_u16((uint16x8_t)v30, 4uLL));
  int16x8_t v55 = (int16x8_t)vshrq_n_u16((uint16x8_t)vbslq_s8(v49, (int8x16_t)vshrq_n_u16((uint16x8_t)v50, 1uLL), v50), 1uLL);
  int16x8_t v56 = vqshlq_s16(vqdmulhq_s16(v55, v54), v8);
  int8x16_t v57 = (int8x16_t)vceqzq_s16(v52);
  int16x8_t v77 = (int16x8_t)v33;
  v72[0] = vornq_s8(vandq_s8((int8x16_t)v52, v47), v47);
  v72[1] = vbslq_s8(v57, v33, (int8x16_t)vqdmulhq_s16(v56, v55));
  v72[2] = vbslq_s8(v57, v31, (int8x16_t)vqdmulhq_s16(v56, (int16x8_t)vshrq_n_u16(v51, 1uLL)));
  v72[3] = vbslq_s8(v57, (int8x16_t)v32, v53);
  v6 -= 16;
  while (1)
  {
    BOOL v58 = v7 == 0;
    if (!v7) {
      int v7 = v9;
    }
    uint64_t v59 = v13 + 404 * v58;
    uint64_t v60 = *(unsigned __int16 *)((char *)v72 + v46);
    ++*(_DWORD *)(v59 + 384);
    uint64_t v61 = v77.u16[v46 / 2];
    *(void *)(v59 + 388) += v61;
    *(void *)(v59 + 396) += v61 * (unint64_t)v61;
    if (v60)
    {
      if (v60 != 0xFFFF)
      {
        uint64_t v62 = *(unsigned __int16 *)((char *)&v72[2] + v46);
        uint64_t v63 = (void *)(v59 + 24 * *(unsigned __int16 *)((char *)&v72[3] + v46));
        uint64_t v64 = v63[1] + *(unsigned __int16 *)((char *)&v72[1] + v46);
        *v63 += v60;
        v63[1] = v64;
        v63[2] += v62;
      }
    }
    else
    {
      int v65 = *(unsigned __int16 *)((char *)&v72[1] + v46);
      int v66 = *(unsigned __int16 *)((char *)&v72[2] + v46);
      int v67 = *(unsigned __int16 *)((char *)&v72[3] + v46);
      uint64_t v68 = v13 + 404 * v58 + 336;
      int16x8_t v69 = (_DWORD *)(v68 + 12 * (int)v11);
      int v70 = v69[1] + v65;
      ++*v69;
      v69[1] = v70;
      v69[2] += v66;
      int16x8_t v71 = (_DWORD *)(v68 + 12 * (v11 + 1));
      LODWORD(v69) = v71[1];
      ++*v71;
      v71[1] = v69 + v65;
      v71[2] += v67;
    }
    ++*a6;
    if (v15 == v46) {
      return result;
    }
    v7 -= 2;
    v46 += 2;
    uint64_t v13 = v59;
    if (v46 == 16)
    {
      v15 -= 16;
      uint64_t v13 = v59;
      if (v6 > 0) {
        goto LABEL_6;
      }
      return result;
    }
  }
}

uint64_t sub_10000CC44(unsigned int *a1, unint64_t a2, int *a3, _WORD *a4, _WORD *a5, _WORD *a6)
{
  uint64_t v12 = a1[4];
  unsigned int v13 = a1[157];
  bzero(a6, a1[121818]);
  if (!a2) {
    sub_10001E1D4();
  }
  uint64_t v14 = 0;
  int v15 = a3[4];
  uint64_t v16 = 6;
  if (!v15) {
    uint64_t v16 = 26;
  }
  int v17 = a3[v16];
  int v18 = *a3;
  int8x16_t v19 = (__int16 *)*((void *)a3 + 5);
  int v20 = a3[6];
  unsigned int v21 = (unsigned __int16)(v13 >> 4);
  while (2)
  {
    int v22 = v15;
    uint64_t v23 = v12;
    int v24 = a6;
    int v25 = a5;
    int v26 = a4;
    LOBYTE(v27) = v20;
    int16x8_t v28 = v19;
    if (v12)
    {
      do
      {
        if (!v22)
        {
          int16x8_t v28 = (__int16 *)*((void *)a3 + 15);
          int v22 = a3[24];
          int v27 = a3[26];
        }
        int v29 = *v28 >> 3;
        unsigned int v30 = (unsigned __int16)v28[3];
        if (v27) {
          int v29 = -v29;
        }
        unsigned int v31 = (unsigned __int16)(v29 + v30);
        *v26 += (unsigned __int16)v28[3] >> 2;
        *v25 += v31 >> 2;
        if (v21 < v30 || v21 < v31) {
          ++*v24;
        }
        ++v24;
        v28 += 4;
        ++v26;
        ++v25;
        --v22;
        LOBYTE(v27) = v27 ^ 1;
        --v23;
      }
      while (v23);
    }
    switch(v18)
    {
      case 0:
        v19 += *((void *)a3 + 1);
        *((void *)a3 + 5) = v19;
        v20 ^= 1u;
        ++a3[5];
        a3[6] = v20;
        goto LABEL_24;
      case 1:
      case 3:
      case 4:
        uint64_t v33 = *((void *)a3 + 4);
        if (v33)
        {
          *((void *)a3 + 4) = v33 - 1;
          uint64_t v34 = *((void *)a3 + 1);
        }
        else
        {
          uint64_t v34 = 2 * *((void *)a3 + 1);
        }
        v19 += v34;
        *((void *)a3 + 5) = v19;
        int v35 = a3[5] + 2;
        goto LABEL_23;
      case 2:
        v19 += *((void *)a3 + 1);
        *((void *)a3 + 5) = v19;
        int v35 = a3[5] + 1;
LABEL_23:
        a3[5] = v35;
LABEL_24:
        switch(a3[20])
        {
          case 0:
            *((void *)a3 + 15) += 2 * *((void *)a3 + 11);
            int32x2_t v39 = *(int32x2_t *)(a3 + 25);
            LODWORD(v40) = vadd_s32(v39, (int32x2_t)0x100000001).u32[0];
            HIDWORD(v40) = veor_s8(*(int8x8_t *)&v39, (int8x8_t)0x100000001).i32[1];
            *(void *)(a3 + 25) = v40;
            goto LABEL_32;
          case 1:
          case 3:
          case 4:
            uint64_t v36 = *((void *)a3 + 14);
            if (v36)
            {
              *((void *)a3 + 14) = v36 - 1;
              uint64_t v37 = *((void *)a3 + 11);
            }
            else
            {
              uint64_t v37 = 2 * *((void *)a3 + 11);
            }
            *((void *)a3 + 15) += 2 * v37;
            int v38 = a3[25] + 2;
            goto LABEL_31;
          case 2:
            *((void *)a3 + 15) += 2 * *((void *)a3 + 11);
            int v38 = a3[25] + 1;
LABEL_31:
            a3[25] = v38;
LABEL_32:
            if (v22) {
              sub_10001E200();
            }
            if (++v14 != a2) {
              continue;
            }
            return sub_10000B598((uint64_t)(a1 + 152), 0x80 / a2, v12, v17, a4, a5, a6);
          default:
            sub_10001D67C();
        }
      default:
        sub_10001D67C();
    }
  }
}

uint64_t sub_10000CF30(unsigned int *a1, int a2, unint64_t a3, int *a4, _WORD *a5, _WORD *a6, _WORD *a7)
{
  uint64_t v9 = a1[5];
  int v10 = *a4;
  int v37 = a4[12];
  uint64_t v11 = *((void *)a4 + 8);
  uint64_t v12 = *((void *)a4 + 9);
  int v13 = a4[20];
  uint64_t v43 = *((void *)a4 + 11);
  uint64_t v44 = *((void *)a4 + 1);
  int v14 = a4[32];
  uint64_t v16 = *((void *)a4 + 18);
  int v15 = (__int16 *)*((void *)a4 + 19);
  unsigned int v36 = a1[157];
  bzero(a7, a1[121818]);
  if (!a3) {
    sub_10001E22C();
  }
  uint64_t v17 = 14;
  if (!a4[12]) {
    uint64_t v17 = 34;
  }
  int v18 = a4[v17];
  if (v9)
  {
    uint64_t v19 = 0;
    int v20 = v37 - a2;
    if (v37 - a2 >= 1) {
      int v21 = 0;
    }
    else {
      int v21 = v14;
    }
    int v22 = v21 + v20;
    unsigned int v23 = (unsigned __int16)(v36 >> 4);
    int v24 = a5;
    int v25 = a6;
    char v26 = v18;
    int v27 = a7;
    do
    {
      if (v20 >= 1) {
        int16x8_t v28 = (__int16 *)(v12 + 8 * a2);
      }
      else {
        int16x8_t v28 = &v15[-4 * v20];
      }
      unint64_t v29 = a3;
      int v30 = v22;
      do
      {
        if (!v30)
        {
          int16x8_t v28 = v15;
          int v30 = v14;
        }
        int v31 = *v28 >> 3;
        unsigned int v32 = (unsigned __int16)v28[3];
        if (v26) {
          int v31 = -v31;
        }
        *v24 += (unsigned __int16)v28[3] >> 2;
        *v25 += (unsigned __int16)(v31 + v32) >> 2;
        if (v23 < v32 || v23 < (unsigned __int16)(v31 + v32)) {
          ++*v27;
        }
        v28 += 4;
        --v30;
        --v29;
      }
      while (v29);
      if ((v10 - 3) >= 2 && v10 != 1)
      {
        if (v10 == 2 || !v10) {
          sub_10001D650();
        }
        sub_10001D624();
      }
      if ((v13 - 3) >= 2 && v13 != 1)
      {
        if (v13 == 2 || !v13) {
          sub_10001D650();
        }
        sub_10001D624();
      }
      v12 += 2 * (v44 << (v11 != 0));
      if (v11) {
        --v11;
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v34 = v16 - 1;
      if (!v16) {
        uint64_t v34 = 0;
      }
      v15 += v43 << (v16 != 0);
      ++v24;
      ++v25;
      ++v27;
      v26 ^= 1u;
      ++v19;
      uint64_t v16 = v34;
    }
    while (v19 != v9);
  }

  return sub_10000B598((uint64_t)(a1 + 152), 0x80 / a3, v9, v18, a5, a6, a7);
}

uint64_t sub_10000D184(uint64_t result, unsigned int a2, int *a3, _WORD *a4, _WORD *a5)
{
  if (!a2) {
    sub_10001E258();
  }
  int v5 = 0;
  uint64_t v6 = *(unsigned int *)(result + 4);
  int v7 = a3[4];
  int v8 = *a3;
  uint64_t v9 = *((void *)a3 + 5);
  while (2)
  {
    int v10 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = a5;
    int v13 = a4;
    uint64_t v14 = v9;
    if (v6)
    {
      do
      {
        if (!v10)
        {
          uint64_t v14 = *((void *)a3 + 15);
          int v10 = a3[24];
        }
        *v13++ += *(_WORD *)(v14 + 6) >> 2;
        int v15 = (unsigned __int16)*v12;
        uint64_t result = v15 + (*(unsigned __int16 *)(v14 + 14) >> 2);
        *v12++ = v15 + (*(_WORD *)(v14 + 14) >> 2);
        v14 += 16;
        --v10;
        --v11;
      }
      while (v11);
    }
    switch(v8)
    {
      case 0:
        v9 += 2 * *((void *)a3 + 1);
        *((void *)a3 + 5) = v9;
        int32x2_t v19 = *(int32x2_t *)(a3 + 5);
        LODWORD(v20) = vadd_s32(v19, (int32x2_t)0x100000001).u32[0];
        HIDWORD(v20) = veor_s8(*(int8x8_t *)&v19, (int8x8_t)0x100000001).i32[1];
        *(void *)(a3 + 5) = v20;
        goto LABEL_15;
      case 1:
      case 3:
      case 4:
        uint64_t v16 = *((void *)a3 + 4);
        if (v16)
        {
          *((void *)a3 + 4) = v16 - 1;
          uint64_t v17 = *((void *)a3 + 1);
        }
        else
        {
          uint64_t v17 = 2 * *((void *)a3 + 1);
        }
        v9 += 2 * v17;
        *((void *)a3 + 5) = v9;
        int v18 = a3[5] + 2;
        goto LABEL_14;
      case 2:
        v9 += 2 * *((void *)a3 + 1);
        *((void *)a3 + 5) = v9;
        int v18 = a3[5] + 1;
LABEL_14:
        a3[5] = v18;
LABEL_15:
        switch(a3[20])
        {
          case 0:
            *((void *)a3 + 15) += 2 * *((void *)a3 + 11);
            int32x2_t v24 = *(int32x2_t *)(a3 + 25);
            LODWORD(v25) = vadd_s32(v24, (int32x2_t)0x100000001).u32[0];
            HIDWORD(v25) = veor_s8(*(int8x8_t *)&v24, (int8x8_t)0x100000001).i32[1];
            *(void *)(a3 + 25) = v25;
            goto LABEL_23;
          case 1:
          case 3:
          case 4:
            uint64_t v21 = *((void *)a3 + 14);
            if (v21)
            {
              *((void *)a3 + 14) = v21 - 1;
              uint64_t v22 = *((void *)a3 + 11);
            }
            else
            {
              uint64_t v22 = 2 * *((void *)a3 + 11);
            }
            *((void *)a3 + 15) += 2 * v22;
            int v23 = a3[25] + 2;
            goto LABEL_22;
          case 2:
            *((void *)a3 + 15) += 2 * *((void *)a3 + 11);
            int v23 = a3[25] + 1;
LABEL_22:
            a3[25] = v23;
LABEL_23:
            if (v10) {
              sub_10001E284();
            }
            if (++v5 != a2) {
              continue;
            }
            if (v6)
            {
              unsigned int v26 = 0x80 / a2;
              do
              {
                *a4 = (v26 * (unsigned __int16)*a4) >> 5;
                ++a4;
                *a5 = (v26 * (unsigned __int16)*a5) >> 5;
                ++a5;
                --v6;
              }
              while (v6);
            }
            return result;
          default:
            sub_10001D67C();
        }
      default:
        sub_10001D67C();
    }
  }
}

uint64_t sub_10000D3C8(uint64_t result, uint64_t a2, float *a3, float *a4)
{
  uint64_t v4 = 0;
  float v5 = (float)*(unsigned int *)(a2 + 340);
  uint64_t v6 = (float *)(a2 + 8);
  do
  {
    float v7 = *(v6 - 2);
    float v8 = (float)(*(v6 - 1) * v5) - (float)(v7 * v7);
    float v9 = 0.0;
    if (v8 >= 0.0)
    {
      float v10 = *v6;
      float v11 = (float)(v6[2] * v5) - (float)(v10 * v10);
      if (v11 >= 0.0)
      {
        double v12 = (float)((float)(v10 * (float)-v7) + (float)(v6[1] * v5));
        double v13 = sqrt(v8) * sqrt(v11);
        if (v13 == 0.0) {
          double v13 = 1.0;
        }
        float v9 = v12 / v13;
      }
    }
    v49[v4++] = v9;
    v6 += 5;
  }
  while (v4 != 17);
  int v14 = *(_DWORD *)(result + 332) - *(_DWORD *)(result + 328);
  int v15 = v14 + 2;
  if (v14 >= -1) {
    int v15 = v14 + 1;
  }
  int v16 = v15 >> 1;
  if (v14 < 0)
  {
    float v19 = -1.0;
    float v18 = 1.0;
    int v20 = v16;
  }
  else
  {
    uint64_t v17 = 0;
    float v18 = 1.0;
    float v19 = -1.0;
    int v20 = v16;
    do
    {
      float v21 = v49[v17];
      if (v19 < v21)
      {
        int v20 = v17;
        float v19 = v49[v17];
      }
      if (v18 > v21) {
        float v18 = v49[v17];
      }
      ++v17;
    }
    while (v14 + 1 != v17);
  }
  char v22 = *(unsigned char *)(result + 352);
  if (!v22) {
    goto LABEL_46;
  }
  if (v20 > 0xF || ((1 << v20) & 0x8101) == 0)
  {
    float v24 = *(float *)(result + 356);
    if (v20 >= 8) {
      unint64_t v25 = 7;
    }
    else {
      unint64_t v25 = 14;
    }
    if (v20 >= 8) {
      unint64_t v26 = 1;
    }
    else {
      unint64_t v26 = 9;
    }
    int v27 = &v49[v26];
    BOOL v28 = v25 >= v26;
    unint64_t v29 = v25 - v26;
    if (!v28) {
      unint64_t v29 = 0;
    }
    unint64_t v30 = v29 + 1;
    float v31 = -1.0;
    do
    {
      float v32 = *v27;
      if (v31 < *v27 && *(v27 - 1) < (float)(v24 + v32) && v27[1] < (float)(v24 + v32)) {
        float v31 = *v27;
      }
      ++v27;
      --v30;
    }
    while (v30);
    char v22 = (float)(v19 - v31) < *(float *)(result + 360);
  }
  else
  {
    char v22 = 0;
  }
  BOOL v33 = 0;
  if (v20 < 2 || v20 >= v14 - 1) {
    goto LABEL_47;
  }
  float v34 = v49[v20];
  float v35 = *(float *)(result + 364);
  if (v34 >= (float)(v35 + v49[v20 - 1]) || v34 >= (float)(v35 + v49[v20 + 1]))
  {
LABEL_46:
    BOOL v33 = 0;
    goto LABEL_47;
  }
  if (v34 < (float)(v35 + v49[v20 - 2]))
  {
LABEL_59:
    *a4 = 0.0;
    float v38 = 0.0;
    goto LABEL_64;
  }
  BOOL v33 = v34 < (float)(v35 + v49[v20 + 2]);
LABEL_47:
  if ((float)(v19 - v18) < *(float *)(result + 368) || (v22 & 1) != 0 || v33) {
    goto LABEL_59;
  }
  if (v19 < 0.0) {
    float v19 = 0.0;
  }
  if (v19 > 1.0) {
    float v19 = 1.0;
  }
  *a4 = v19;
  if (v20) {
    BOOL v36 = v20 < v14;
  }
  else {
    BOOL v36 = 0;
  }
  if (v36)
  {
    uint64_t v39 = v20 - 1;
    float v40 = (float)v20;
    uint64_t v41 = v20 + 1;
    float v42 = v49[v39];
    float v43 = v49[v20];
    float v44 = v49[v41];
    float v45 = v43 - v42;
    float v46 = v42 - v44;
    float v47 = v44 - v43;
    float v48 = (float)((float)(v46 * (float)v20) + (float)((float)(int)v41 * v45)) + (float)((float)(int)v39 * v47);
    if (v48 != 0.0) {
      float v40 = (float)((float)((float)((float)(v40 * v40) * v46) + (float)((float)((float)(int)v41 * (float)(int)v41) * v45))
    }
                  + (float)((float)((float)(int)v39 * (float)(int)v39) * v47))
          / (float)(v48 + v48);
    float v37 = v40 - (float)v16;
  }
  else
  {
    float v37 = (float)(v20 - v16);
  }
  float v38 = v37 * -2.0;
LABEL_64:
  *a3 = v38;
  return result;
}

uint64_t sub_10000D704(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  int32x2_t v4 = 0;
  float v5 = 0.0;
  do
  {
    float v6 = (float)*(unsigned int *)(a2 + v3 * 4);
    float v7 = *(float *)&dword_100022390[v3] * v6;
    *(float *)v4.i32 = *(float *)v4.i32 + (float)(v6 - v7);
    float v5 = v5 + v7;
    ++v3;
  }
  while (v3 != 14);
  if (v5 == 0.0) {
    float v8 = 1.0;
  }
  else {
    float v8 = v5;
  }
  float v9 = (float)(*(float *)v4.i32 / v8) + -1.0;
  if (*(float *)v4.i32 == 0.0) {
    float v10 = 1.0;
  }
  else {
    float v10 = *(float *)v4.i32;
  }
  if (v5 <= *(float *)v4.i32) {
    float v11 = 1.0 - (float)(v5 / v10);
  }
  else {
    float v11 = v9;
  }
  if (v11 >= 0.0) {
    float v12 = v11;
  }
  else {
    float v12 = -v11;
  }
  float v13 = 0.0;
  if (v12 > 0.2)
  {
    float v13 = 1.0;
    if (v12 < 0.6) {
      float v13 = (float)(v12 + -0.2) / 0.4;
    }
  }
  uint64_t v14 = 0;
  if (v11 >= 0.0) {
    *(float *)v4.i32 = v13 * *(float *)(result + 36);
  }
  else {
    *(float *)v4.i32 = -(float)(v13 * *(float *)(result + 36));
  }
  float v15 = (float)(*(float *)v4.i32 + 1.0) * 0.5;
  *(float *)v4.i32 = 1.0 - v15;
  float32x4_t v16 = (float32x4_t)vdupq_lane_s32(v4, 0);
  uint64_t v17 = a2 + 116;
  float32x4_t v18 = (float32x4_t)vdupq_n_s32(0x3A800000u);
  int32x4_t v19 = 0uLL;
  v20.i64[0] = 0x7F0000007FLL;
  v20.i64[1] = 0x7F0000007FLL;
  int8x16_t v21 = (int8x16_t)vdupq_n_s32(0x7F800000u);
  __asm { FMOV            V16.4S, #1.0 }
  int32x4_t v27 = 0uLL;
  int32x4_t v28 = 0uLL;
  int32x4_t v29 = 0uLL;
  int32x4_t v30 = 0uLL;
  do
  {
    int32x4_t v31 = *(int32x4_t *)(v17 + v14 * 4 - 112);
    float32x4_t v32 = vmulq_f32(vcvtq_f32_u32((uint32x4_t)v31), v18);
    float32x4_t v33 = (float32x4_t)vbslq_s8((int8x16_t)vceqq_f32(v32, v20), v21, (int8x16_t)vabsq_f32(vsqrtq_f32(v32)));
    float32x4_t v34 = vmulq_f32(vmulq_f32(vcvtq_f32_u32(*(uint32x4_t *)(v17 + v14 * 4 - 56)), vcvtq_f32_u32(*(uint32x4_t *)&dword_100022358[v14 + 1])), (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v33, _Q16), (int8x16_t)_Q16, (int8x16_t)v33));
    int32x4_t v35 = (int32x4_t)vcvtq_u32_f32(v34);
    int32x4_t v36 = (int32x4_t)vcvtq_u32_f32(vmulq_f32(vmlaq_f32(vmulq_n_f32(vsubq_f32(_Q16, *(float32x4_t *)&dword_100022390[v14 + 1]), v15), v16, *(float32x4_t *)&dword_100022390[v14 + 1]), v34));
    int32x4_t v29 = vaddq_s32(v29, v35);
    int32x4_t v28 = vaddq_s32(v28, v36);
    int32x4_t v30 = vaddq_s32(v31, v30);
    int32x4_t v37 = *(int32x4_t *)(v17 + v14 * 4);
    int32x4_t v27 = vmlaq_s32(v27, v37, v35);
    int32x4_t v19 = vmlaq_s32(v19, v37, v36);
    v14 += 4;
  }
  while (v14 != 12);
  int v38 = vaddvq_s32(v29);
  int v39 = vaddvq_s32(v28);
  int v40 = vaddvq_s32(v27);
  int v41 = vaddvq_s32(v19);
  if (v38) {
    int v40 = 16 * v40 / v38;
  }
  int v42 = v41;
  if (v39) {
    int v42 = 16 * v41 / v39;
  }
  *(unsigned char *)(a3 + 12) = *(unsigned char *)(a2 + 168);
  if (v38)
  {
    *(_DWORD *)a3 = (vaddvq_s32(v30) + 8) >> 4;
    *(_DWORD *)(a3 + 4) = v38;
    *(_DWORD *)(a3 + 8) = v40;
    if (v39)
    {
      if (v42 >= 0) {
        unsigned int v43 = v42;
      }
      else {
        unsigned int v43 = -v42;
      }
      if (v43 >= 0xA1)
      {
        if (v43 < 0x140) {
          *(_DWORD *)(a3 + 8) = (int)(((v43 << 10) - 163840) / 0xA0 * v42 + (1024 - ((v43 << 10) - 163840) / 0xA0) * v40) >> 10;
        }
        else {
          *(_DWORD *)(a3 + 8) = v42;
        }
      }
    }
  }
  else
  {
    *(_DWORD *)(a3 + 8) = 0;
    *(void *)a3 = 0;
  }
  return result;
}

uint64_t sub_10000D96C(uint64_t result, uint64_t a2)
{
  if (result >= 5) {
    sub_10001D258();
  }
  uint64_t v2 = qword_1000223F0[(int)result];
  switch((int)result)
  {
    case 0:
    case 1:
    case 3:
      uint64_t v3 = (unsigned int *)(a2 + 32);
      float v4 = -1.0;
      do
      {
        unsigned int v5 = *(v3 - 4);
        if (v5 && *v3 && *(v3 - 8) >= 0x41)
        {
          float v6 = (float)((float)v5 / (float)*v3) + -1.0;
          if (v6 < 0.0) {
            float v6 = -v6;
          }
          if (v6 > v4 || v4 < 0.0) {
            float v4 = v6;
          }
        }
        ++v3;
        --v2;
      }
      while (v2);
      break;
    case 2:
      return result;
    case 4:
      uint64_t v8 = 0;
      float v9 = -1.0;
      do
      {
        if ((v8 & 0x7FFFFFFD) != 0)
        {
          uint64_t v10 = a2 + 4 * v8;
          unsigned int v11 = *(_DWORD *)(v10 + 16);
          if (v11)
          {
            unsigned int v12 = *(_DWORD *)(v10 + 32);
            if (v12)
            {
              if (*(_DWORD *)(a2 + 4 * v8) >= 0x41u)
              {
                float v13 = (float)((float)v11 / (float)v12) + -1.0;
                if (v13 < 0.0) {
                  float v13 = -v13;
                }
                if (v13 > v9 || v9 < 0.0) {
                  float v9 = v13;
                }
              }
            }
          }
        }
        ++v8;
      }
      while (v2 != v8);
      break;
    default:
      sub_10001E2B0();
  }
  return result;
}

uint64_t sub_10000DAF8(float *a1, float *a2)
{
  if (*a1 >= *a2) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = -1;
  }
  if (*a1 > *a2) {
    return 1;
  }
  else {
    return v2;
  }
}

float sub_10000DB10(uint64_t a1, float a2)
{
  unsigned int v2 = (float *)(a1 + 8);
  for (unint64_t i = 1; i != 8; ++i)
  {
    if (*v2 > a2) {
      break;
    }
    v2 += 2;
  }
  if (i >= 7) {
    unint64_t i = 7;
  }
  float v4 = (float *)(a1 + 8 * i);
  float v5 = *(v4 - 2);
  if (*v4 == v5) {
    return *(v4 - 1);
  }
  float v7 = (float)(a2 - v5) / (float)(*v4 - v5);
  if (v7 <= 1.0) {
    float v8 = v7;
  }
  else {
    float v8 = 1.0;
  }
  BOOL v9 = v7 < 0.0;
  float v10 = 0.0;
  if (!v9) {
    float v10 = v8;
  }
  return (float)((float)(1.0 - v10) * *(v4 - 1)) + (float)(v10 * v4[1]);
}

void start()
{
}

void sub_10000DCC0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000DCD4(void *a1)
{
}

const void **sub_10000DCE8(const void **a1)
{
  unsigned int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t sub_10000DD20()
{
  return 0;
}

uint64_t sub_10000DD28()
{
  return 0;
}

uint64_t sub_10000DD30(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 8;
    if (!*(void *)(result + 24)) {
      *(void *)(result + 48) = os_transaction_create();
    }
    float v5 = operator new(0x18uLL);
    v5[1] = v4;
    v5[2] = a2;
    uint64_t v6 = *(void *)(v3 + 8);
    void *v5 = v6;
    *(void *)(v6 + 8) = v5;
    *(void *)(v3 + 8) = v5;
    ++*(void *)(v3 + 24);
    if (*(_DWORD *)(a2 + 8) == 1) {
      xpc_connection_get_pid(*(xpc_connection_t *)a2);
    }
    sub_10000DE28(3);
    kdebug_trace();
    return sub_10000DE28(3);
  }
  return result;
}

uint64_t sub_10000DE28(uint64_t result)
{
  if (result <= 5) {
    operator new[]();
  }
  return result;
}

void sub_10000DF10(uint64_t a1, void *a2)
{
  __p = a2;
  if (a2)
  {
    sub_10000DFFC(a1 + 8, &__p);
    if (*((_DWORD *)__p + 2) == 1 && xpc_connection_get_pid(*(xpc_connection_t *)__p))
    {
      xpc_release(*(xpc_object_t *)__p);
      sub_10000DE28(3);
    }
    else
    {
      sub_10000DE28(3);
    }
    sub_10000DE28(3);
    if (!*(void *)(a1 + 24))
    {
      os_release(*(void **)(a1 + 48));
      *(void *)(a1 + 48) = 0;
    }
    kdebug_trace();
    if (__p) {
      operator delete(__p);
    }
  }
}

void *sub_10000DFFC(uint64_t a1, void *a2)
{
  v10[0] = (uint64_t)v10;
  v10[1] = (uint64_t)v10;
  v10[2] = 0;
  unsigned int v2 = *(void **)(a1 + 8);
  if (v2 != (void *)a1)
  {
    do
    {
      uint64_t v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          uint64_t v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            uint64_t v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        sub_10000F224((uint64_t)v10, v10, a1, v2, v6);
        if (!v8) {
          uint64_t v6 = (void *)v6[1];
        }
      }
      unsigned int v2 = v6;
    }
    while (v6 != (void *)a1);
  }
  return sub_10000F1C0(v10);
}

void sub_10000E0B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000F1C0((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_10000E0CC(void *a1)
{
  unsigned int v2 = a1 + 1;
  for (unint64_t i = (void *)a1[2]; i != v2; unint64_t i = (void *)i[1])
  {
    uint64_t v4 = i[2];
    if (*(_DWORD *)(v4 + 8) == 1)
    {
      xpc_release(*(xpc_object_t *)v4);
      uint64_t v4 = i[2];
      if (!v4) {
        continue;
      }
    }
    operator delete((void *)v4);
  }
  sub_10000F1C0(v2);
  uint64_t v5 = (void *)a1[6];
  if (v5)
  {
    os_release(v5);
    a1[6] = 0;
  }
}

uint64_t sub_10000E148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000DE28(3);
  kdebug_trace();
  if (*(_DWORD *)a3 == 1)
  {
    uint64_t v7 = 0;
  }
  else if (*(_DWORD *)a3 == 2)
  {
    uint64_t v6 = *(unsigned int *)(a3 + 8);
    if (v6 <= 5)
    {
      char v8 = *(unsigned char *)(a3 + 12);
      if (!v8)
      {
        sub_100010D50(*(void *)(a1 + 80));
        sub_100010D50(*(void *)(a1 + 88));
      }
      uint64_t v7 = 0;
      *(unsigned char *)(a2 + v6 + 12) = v8;
    }
    else
    {
      uint64_t v7 = 3758097084;
    }
  }
  else
  {
    uint64_t v7 = 3758097084;
  }
  sub_10000DE28(3);
  kdebug_trace();
  return v7;
}

uint64_t sub_10000E268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000DE28(3);
  kdebug_trace();
  if (*(_DWORD *)a3 == 5)
  {
    uint64_t v4 = 0;
    *(unsigned char *)(a3 + 8) = sub_1000166C8(0, (time_t *)(a3 + 16));
  }
  else
  {
    uint64_t v4 = 3758097084;
  }
  sub_10000DE28(3);
  kdebug_trace();
  return v4;
}

void sub_10000E334(uint64_t a1, xpc_connection_t *a2, xpc_object_t xdict)
{
  size_t length = 0;
  int uint64 = xpc_dictionary_get_uint64(xdict, "H10ISPServicesRemoteTypeKey");
  data = xpc_dictionary_get_data(xdict, "H10ISPServicesRemoteDataKey", &length);
  if (uint64) {
    BOOL v8 = data == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || length == 0) {
    return;
  }
  if (uint64 == 1 && length == 13136)
  {
    int v10 = sub_10000E148(a1, (uint64_t)a2, (uint64_t)data);
LABEL_14:
    int v13 = v10;
    goto LABEL_16;
  }
  if (uint64 == 2 && length == 3680)
  {
    unsigned int v11 = memcpy(__dst, data, sizeof(__dst));
    int v10 = sub_10000E268((uint64_t)v11, v12, (uint64_t)__dst);
    goto LABEL_14;
  }
  xpc_connection_get_pid(*a2);
  sub_10000DE28(3);
  int v13 = -536870212;
LABEL_16:
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (reply)
  {
    float v15 = reply;
    remote_connection = xpc_dictionary_get_remote_connection(reply);
    xpc_connection_get_pid(*a2);
    if (remote_connection)
    {
      xpc_dictionary_set_int64(v15, "H10ISPServicesRemoteReturnKey", v13);
      if (uint64 == 2) {
        xpc_dictionary_set_data(v15, "H10ISPServicesRemoteDataKey", __dst, length);
      }
      xpc_connection_send_message(remote_connection, v15);
    }
    else
    {
      sub_10000DE28(3);
    }
    xpc_release(v15);
  }
  else
  {
    xpc_connection_get_pid(*a2);
    sub_10000DE28(3);
  }
}

uint64_t sub_10000E4D4(uint64_t a1, xpc_connection_t *a2)
{
  xpc_connection_get_pid(*a2);
  sub_10000DE28(3);
  uint64_t v4 = *(uint64_t (**)(uint64_t, xpc_connection_t *))(*(void *)a1 + 48);

  return v4(a1, a2);
}

void sub_10000E5D0()
{
}

uint64_t sub_10000E6C8(uint64_t a1, xpc_object_t object)
{
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    BOOL v8 = *(xpc_connection_t **)(a1 + 40);
    return sub_10000E4D4(v4, v8);
  }
  else
  {
    uint64_t v6 = *(xpc_connection_t **)(a1 + 40);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      BOOL v9 = *(uint64_t (**)(uint64_t, xpc_connection_t *, xpc_object_t))(*(void *)v4 + 64);
      return v9(v4, v6, object);
    }
    else
    {
      xpc_connection_get_pid(*v6);
      return sub_10000DE28(3);
    }
  }
}

const char *sub_10000E7C4(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(a1 + 16);
    if (v5 == a1 + 8)
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      do
      {
        uint64_t v8 = v5 + 8;
        uint64_t v5 = *(void *)(v5 + 8);
        uint64_t v7 = *(void *)(v8 + 8);
        if (!*(_DWORD *)(v7 + 8)) {
          uint64_t v6 = v7;
        }
      }
      while (v5 != a1 + 8);
    }
    size_t v9 = strlen(*(const char **)(a1 + 168));
    uint64_t result = (const char *)strncmp(v4, *(const char **)(a1 + 168), v9);
    if (result)
    {
      size_t v10 = strlen(*(const char **)(a1 + 176));
      uint64_t result = (const char *)strncmp(v4, *(const char **)(a1 + 176), v10);
      if (result)
      {
        return (const char *)sub_10000DE28(3);
      }
      else if (v6)
      {
        unsigned int v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 48);
        return (const char *)v11(a1, v6);
      }
    }
    else if (!v6)
    {
      operator new();
    }
  }
  return result;
}

uint64_t sub_10000E960(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2) {
    return 3758097101;
  }
  if (sub_10001B7C4(v2)) {
    return 0;
  }
  if (sub_1000182A4(*(void *)(a1 + 72)))
  {
    do
    {
      usleep(0x186A0u);
      sub_10000DE28(3);
    }
    while ((sub_1000182A4(*(void *)(a1 + 72)) & 1) != 0);
  }
  *(void *)(a1 + 48) = os_transaction_create();
  uint64_t v3 = sub_10001A2A8(*(void *)(a1 + 72));
  os_release(*(void **)(a1 + 48));
  if (v3) {
    sub_10000DE28(3);
  }
  return v3;
}

uint64_t sub_10000EA28(void *a1)
{
  kdebug_trace();
  uint64_t v2 = sub_10001CA1C(a1 + 8, (uint64_t)sub_10000DD20, 0);
  uint64_t v3 = (CFArrayRef *)a1[8];
  if (!v3)
  {
    uint64_t v4 = 3758097088;
LABEL_16:
    sub_10000DE28(3);
    goto LABEL_18;
  }
  uint64_t v4 = v2;
  if (CFArrayGetCount(*v3))
  {
    unint64_t v5 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)a1[8], v5);
      a1[9] = ValueAtIndex;
      uint64_t v4 = sub_100018E50((uint64_t)ValueAtIndex, (uint64_t)sub_10000DD28, (uint64_t)a1);
      if (!v4) {
        break;
      }
      a1[9] = 0;
      ++v5;
    }
    while (v5 < CFArrayGetCount(*(CFArrayRef *)a1[8]));
  }
  if (!a1[9])
  {
    sub_10000DE28(3);
    if (!v4) {
      goto LABEL_19;
    }
LABEL_18:
    (*(void (**)(void *))(*a1 + 24))(a1);
    goto LABEL_19;
  }
  uint64_t v4 = sub_10000E960((uint64_t)a1);
  if (v4) {
    goto LABEL_18;
  }
  uint64_t v7 = 0;
  char v8 = 1;
  do
  {
    char v9 = v8;
    uint64_t v10 = a1[9];
    unsigned int v11 = &a1[v7 + 10];
    v15[0] = v11;
    v15[1] = v10;
    uint64_t v12 = sub_100010D94((uint64_t)v15);
    if (v12)
    {
      uint64_t v4 = v12;
      goto LABEL_16;
    }
    uint64_t v13 = sub_100010B24(*v11);
    if (v13)
    {
      uint64_t v4 = v13;
      goto LABEL_16;
    }
    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
  if (sub_10001A124(a1[9], 10)) {
    sub_10000DE28(3);
  }
  uint64_t v4 = 0;
LABEL_19:
  kdebug_trace();
  return v4;
}

uint64_t sub_10000EC34(void *a1)
{
  uint64_t v2 = (const void **)a1[12];
  if (v2)
  {
    uint64_t v3 = sub_10000DD1C(v2);
    operator delete(v3);
    a1[12] = 0;
  }
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    uint64_t v7 = &a1[v4];
    uint64_t v10 = v7[10];
    char v9 = v7 + 10;
    uint64_t v8 = v10;
    if (v10)
    {
      sub_100010940(v8);
      sub_100010F60(*v9);
      *char v9 = 0;
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  uint64_t v11 = a1[9];
  if (v11)
  {
    sub_100018C78(v11);
    a1[9] = 0;
  }
  uint64_t v12 = a1[8];
  if (v12)
  {
    sub_10001CBD0(v12);
    a1[8] = 0;
  }
  return 0;
}

uint64_t sub_10000ECC8(uint64_t a1)
{
  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (v2)
  {
    uint64_t v4 = v2;
    dispatch_source_set_event_handler(v2, &stru_100024740);
    dispatch_resume(v4);
    mach_service = xpc_connection_create_mach_service(*(const char **)(a1 + 144), *(dispatch_queue_t *)(a1 + 40), 1uLL);
    *(void *)(a1 + 32) = mach_service;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_10000EE30;
    handler[3] = &unk_100024760;
    handler[4] = a1;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 32));
    char v6 = *(NSObject **)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = sub_10000EEF0;
    v7[3] = &unk_100024780;
    v7[4] = a1;
    xpc_set_event_stream_handler("com.apple.iokit.matching", v6, v7);
    dispatch_main();
  }
  sub_10000DE28(3);
  return 3758097086;
}

void sub_10000EE0C(id a1)
{
}

xpc_type_t sub_10000EE30(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    char v5 = *(uint64_t (**)(uint64_t, xpc_object_t))(*(void *)v3 + 32);
    return (xpc_type_t)v5(v3, object);
  }
  else
  {
    xpc_type_t result = xpc_get_type(object);
    if (result == (xpc_type_t)&_xpc_type_error)
    {
      return (xpc_type_t)sub_10000DE28(3);
    }
  }
  return result;
}

xpc_type_t sub_10000EEF0(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    char v5 = *(uint64_t (**)(uint64_t, xpc_object_t))(*(void *)v3 + 72);
    return (xpc_type_t)v5(v3, object);
  }
  else
  {
    xpc_type_t result = xpc_get_type(object);
    if (result == (xpc_type_t)&_xpc_type_error
      && (object == &_xpc_error_termination_imminent
       || object == &_xpc_error_connection_invalid
       || object == &_xpc_error_connection_interrupted))
    {
      return (xpc_type_t)sub_10000DE28(3);
    }
  }
  return result;
}

uint64_t sub_10000EFF8(uint64_t a1)
{
  *(void *)a1 = off_1000247B0;
  *(void *)(a1 + 8) = a1 + 8;
  *(void *)(a1 + 16) = a1 + 8;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 48) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 144) = "com.apple.dietapplecamerad";
  *(void *)(a1 + 152) = "com.apple.dietapplecamerad.writer";
  *(void *)(a1 + 160) = "com.apple.dietapplecamerad.assistant_active";
  *(void *)(a1 + 168) = "com.apple.dietapplecamerad.launch";
  *(void *)(a1 + 176) = "com.apple.dietapplecamerad.destroy";
  *(void *)(a1 + 184) = "com.apple.dietapplecamerad.firmware_loading";
  *(void *)(a1 + 40) = dispatch_queue_create("com.apple.dietapplecamerad", 0);
  *(void *)(a1 + 56) = dispatch_queue_create(*(const char **)(a1 + 152), 0);
  sub_10001CC30(@"EnableHawking", @"com.apple.coremedia", 1);
  sub_10000DE28(3);
  return a1;
}

void sub_10000F0D4(_Unwind_Exception *a1)
{
  sub_10000F1C0(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F0EC(uint64_t a1)
{
  *(void *)a1 = off_1000247B0;
  sub_10000DE28(3);
  (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  dispatch_sync(*(dispatch_queue_t *)(a1 + 56), &stru_100024820);
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  sub_10000F1C0((void *)(a1 + 8));
  return a1;
}

void sub_10000F198(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10000F0EC(a1);

  operator delete(v1);
}

void *sub_10000F1C0(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    xpc_type_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        xpc_type_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

uint64_t sub_10000F224(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    char v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        uint64_t v7 = a4;
        do
        {
          uint64_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

uint64_t sub_10000F29C(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 1)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    if (v3 == 208) {
      operator new[]();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8.st_dev = 136315650;
      *(void *)&v8.st_mode = "RPCFileInfo";
      WORD2(v8.st_ino) = 2048;
      *(__darwin_ino64_t *)((char *)&v8.st_ino + 6) = 208;
      HIWORD(v8.st_gid) = 2048;
      *(void *)&v8.st_rdev = v3;
      char v5 = "%s: Buffer size does not match expected value (expected %ld, recv %lld)";
      uint32_t v6 = 32;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8.st_dev = 136315394;
    *(void *)&v8.st_mode = "RPCFileInfo";
    WORD2(v8.st_ino) = 1024;
    *(_DWORD *)((char *)&v8.st_ino + 6) = a3;
    char v5 = "%s: Number of buffers is not 1 (%d)";
    uint32_t v6 = 18;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v6);
  }
  return 3;
}

uint64_t sub_10000F4E4(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 2)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    if (v3 == 208) {
      operator new[]();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = "RPCFileRead";
      __int16 v10 = 2048;
      uint64_t v11 = 208;
      __int16 v12 = 2048;
      uint64_t v13 = v3;
      char v5 = "%s: Buffer size does not match expected value (expected %ld, recv %lld)";
      uint32_t v6 = 32;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "RPCFileRead";
    __int16 v10 = 1024;
    LODWORD(v11) = a3;
    char v5 = "%s: Number of buffers is not 2 (%d)";
    uint32_t v6 = 18;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v6);
  }
  return 3;
}

uint64_t sub_10000F858(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 2)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    if (v3 == 208) {
      operator new[]();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = "RPCFileWrite";
      __int16 v10 = 2048;
      uint64_t v11 = 208;
      __int16 v12 = 2048;
      uint64_t v13 = v3;
      char v5 = "%s: Buffer size does not match expected value (expected %ld, recv %lld)\n";
      uint32_t v6 = 32;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "RPCFileWrite";
    __int16 v10 = 1024;
    LODWORD(v11) = a3;
    char v5 = "%s: Number of buffers is not 2 (%d)\n";
    uint32_t v6 = 18;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v6);
  }
  return 3;
}

uint64_t sub_10000FBD8(uint64_t a1, uint64_t *a2, int a3)
{
  if (a3 != 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      uint64_t v9 = "PDAFProcessX1Wrapper";
      __int16 v10 = 1024;
      int v11 = a3;
      uint64_t v4 = "%s: Number of buffers is not 2 (%d)\n";
      uint32_t v5 = 18;
      goto LABEL_7;
    }
    return 3;
  }
  unint64_t v3 = a2[4];
  if (v3 <= 0x7EF8B)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = "PDAFProcessX1Wrapper";
      __int16 v10 = 1024;
      int v11 = 520076;
      __int16 v12 = 2048;
      unint64_t v13 = v3;
      uint64_t v4 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      uint32_t v5 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v5);
      return 3;
    }
    return 3;
  }
  sub_100002CDC(*a2, a2[3]);
  return 0;
}

uint64_t sub_10000FD38(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 != 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      uint64_t v9 = "PDAFProcessX2Wrapper";
      __int16 v10 = 1024;
      int v11 = a3;
      uint64_t v4 = "%s: Number of buffers is not 3 (%d)\n";
      uint32_t v5 = 18;
      goto LABEL_7;
    }
    return 3;
  }
  unint64_t v3 = *(void *)(a2 + 56);
  if (v3 <= 0x7EF8B)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = "PDAFProcessX2Wrapper";
      __int16 v10 = 1024;
      int v11 = 520076;
      __int16 v12 = 2048;
      unint64_t v13 = v3;
      uint64_t v4 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      uint32_t v5 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v5);
      return 3;
    }
    return 3;
  }
  sub_100009BFC(*(void *)a2, *(void *)(a2 + 24), *(_DWORD **)(a2 + 48));
  return 0;
}

uint64_t sub_10000FE9C(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 4)
  {
    unint64_t v3 = *(void *)(a2 + 80);
    if (v3 > 0x7EF8B) {
      sub_100009D0C(*(void *)a2, *(void *)(a2 + 24), *(void *)(a2 + 48), *(_DWORD **)(a2 + 72));
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = "PDAFProcessX3Wrapper";
      __int16 v10 = 1024;
      int v11 = 520076;
      __int16 v12 = 2048;
      unint64_t v13 = v3;
      uint64_t v4 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      uint32_t v5 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v5);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "PDAFProcessX3Wrapper";
    __int16 v10 = 1024;
    int v11 = a3;
    uint64_t v4 = "%s: Number of buffers is not 4 (%d)\n";
    uint32_t v5 = 18;
    goto LABEL_7;
  }
  return 3;
}

uint64_t sub_100010004(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 != 5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      uint64_t v9 = "PDAFProcessX4Wrapper";
      __int16 v10 = 1024;
      int v11 = a3;
      uint64_t v4 = "%s: Number of buffers is not 5 (%d)\n";
      uint32_t v5 = 18;
      goto LABEL_7;
    }
    return 3;
  }
  unint64_t v3 = *(void *)(a2 + 104);
  if (v3 <= 0x7EF8B)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = "PDAFProcessX4Wrapper";
      __int16 v10 = 1024;
      int v11 = 520076;
      __int16 v12 = 2048;
      unint64_t v13 = v3;
      uint64_t v4 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      uint32_t v5 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, v5);
      return 3;
    }
    return 3;
  }
  sub_100009ED0(*(void *)a2, *(void *)(a2 + 24), *(void *)(a2 + 48), *(void *)(a2 + 72), *(_DWORD **)(a2 + 96));
  return 0;
}

uint64_t sub_100010170(uint64_t a1, uint64_t a2, int a3)
{
  memset(v18, 0, sizeof(v18));
  if (a3 == 4)
  {
    uint64_t v3 = 0;
    uint32_t v5 = (uint64_t *)(a2 + 24);
    uint64_t v4 = *(int **)a2;
    do
    {
      uint64_t v6 = *v5;
      v5 += 3;
      v18[v3++] = v6;
    }
    while (v3 != 3);
    uint64_t v7 = *(void *)(a2 + 8);
    if (v7 == 591796)
    {
      sub_100014918(v4, (uint64_t)v18);
      return 0;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      unint64_t v13 = "BlurMProcessWrapper";
      __int16 v14 = 1024;
      int v15 = 591796;
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      __int16 v10 = "%s: Buffer size does not match expected value (expected %d, recv %lld)\n";
      uint32_t v11 = 28;
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    unint64_t v13 = "BlurMProcessWrapper";
    __int16 v14 = 1024;
    int v15 = 4;
    __int16 v16 = 1024;
    LODWORD(v17) = a3;
    __int16 v10 = "%s: Number of buffers is not %d (%d)\n";
    uint32_t v11 = 24;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, v11);
  }
  return 3;
}

uint64_t sub_1000102FC(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v4 = byte_1002C57E0;
  if (*(_DWORD *)(a2 + 20))
  {
    unint64_t v7 = 0;
    int v8 = (uint64_t *)(a2 + 472);
    uint64_t v9 = (int *)(a2 + 76);
    do
    {
      int v10 = *v9;
      if (v4)
      {
        uint32_t v11 = *(void **)(a1 + 8 * *(v9 - 13));
        if (v11) {
          sub_100011014(v11);
        }
      }
      *a3 = 0;
      uint64_t v12 = kdebug_trace();
      int v13 = 5;
      switch(*(v9 - 13))
      {
        case 4:
          int v14 = sub_10000F29C(v12, (uint64_t)v8, v10);
          goto LABEL_10;
        case 5:
          int v14 = sub_10000F4E4(v12, (uint64_t)v8, v10);
          goto LABEL_10;
        case 6:
          int v14 = sub_10000F858(v12, (uint64_t)v8, v10);
LABEL_10:
          int v13 = v14;
          *a3 = 1;
          break;
        case 14:
          int v15 = sub_10000FBD8(v12, v8, v10);
          goto LABEL_16;
        case 15:
          int v15 = sub_10000FD38(v12, (uint64_t)v8, v10);
          goto LABEL_16;
        case 16:
          int v15 = sub_10000FE9C(v12, (uint64_t)v8, v10);
          goto LABEL_16;
        case 17:
          int v15 = sub_100010004(v12, (uint64_t)v8, v10);
          goto LABEL_16;
        case 18:
          int v15 = sub_100010170(v12, (uint64_t)v8, v10);
LABEL_16:
          int v13 = v15;
          break;
        default:
          break;
      }
      kdebug_trace();
      *(v9 - 10) = v13;
      int v4 = byte_1002C57E0;
      if (byte_1002C57E0)
      {
        __int16 v16 = *(uint64_t **)(a1 + 8 * *(v9 - 13));
        if (v16)
        {
          sub_10001104C(v16);
          int v4 = byte_1002C57E0;
        }
        else
        {
          int v4 = 1;
        }
      }
      ++*(_DWORD *)(a1 + 152);
      ++v7;
      v8 += 24;
      v9 += 14;
    }
    while (v7 < *(unsigned int *)(a2 + 20));
  }
  if (v4 && *(_DWORD *)(a1 + 152) >= 0x400u)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*** Metrics report for firmware work processor ***", buf, 2u);
    }
    for (uint64_t i = 0; i != 19; ++i)
    {
      float32x4_t v18 = *(_DWORD **)(a1 + 8 * i);
      if (v18)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v21 = i;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*** Metrics for command %d ***", buf, 8u);
          float32x4_t v18 = *(_DWORD **)(a1 + 8 * i);
        }
        sub_10001123C(v18);
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*** End report ***", buf, 2u);
    }
    *(_DWORD *)(a1 + 152) = 0;
  }
  return 0;
}

uint64_t sub_10001064C(uint64_t a1)
{
  *(_DWORD *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 0;
  int v2 = sub_10001CC30(@"FirmwareWorkMetrics", @"com.apple.coremedia", 0);
  byte_1002C57E0 = v2 != 0;
  if (v2) {
    operator new();
  }
  return a1;
}

void sub_1000106E4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000106FC(uint64_t a1)
{
  if (byte_1002C57E0)
  {
    for (uint64_t i = 0; i != 152; i += 8)
    {
      uint64_t v3 = *(void ***)(a1 + i);
      if (v3)
      {
        int v4 = sub_100011504(v3);
        operator delete(v4);
      }
    }
  }
  uint32_t v5 = *(void **)(a1 + 160);
  if (v5)
  {
    operator delete(v5);
    *(void *)(a1 + 160) = 0;
  }
  return a1;
}

void sub_100010760(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 216) = 0;
  *(_DWORD *)(a1 + 224) = 0;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 240) = a2;
  uint64_t v3 = (uint64_t *)(a1 + 240);
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0x4000000000000000;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 16), 0);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 144), 0);
  *(void *)(a1 + 208) = 0;
  pthread_mutexattr_init(&v5);
  pthread_mutexattr_settype(&v5, 2);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 80), &v5);
  pthread_mutexattr_destroy(&v5);
  int v4 = 0;
  sub_100018390(*v3, &v4, (double *)(a1 + 256));
  mach_timebase_info((mach_timebase_info_t)(a1 + 264));
  operator new();
}

void sub_10001085C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100010878(uint64_t a1)
{
  if (*(_DWORD *)a1) {
    sub_100010940(a1);
  }
  if (*(void *)(a1 + 232)) {
    sub_1000109D0(a1);
  }
  uint64_t v2 = *(void *)(a1 + 272);
  if (v2)
  {
    uint64_t v3 = *(__CFRunLoop **)(a1 + 8);
    int v4 = sub_10001CE30(v2);
    CFRunLoopRemoveSource(v3, v4, kCFRunLoopDefaultMode);
    uint64_t v5 = *(void *)(a1 + 272);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
    *(void *)(a1 + 272) = 0;
  }
  if (*(void *)(a1 + 288))
  {
    uint64_t v6 = (void *)sub_10001075C();
    operator delete(v6);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 80));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 144));
  return a1;
}

uint64_t sub_100010940(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)a1)
  {
    sub_100010C94(a1);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    *(unsigned char *)(a1 + 248) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 80));
    uint64_t v3 = sub_10001B57C(*(void *)(a1 + 240), *(_DWORD *)(a1 + 224));
    *(unsigned char *)(a1 + 248) = 0;
    *(_DWORD *)a1 = 0;
  }
  else
  {
    uint64_t v3 = 3758097122;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void sub_1000109D0(uint64_t a1)
{
  uint64_t v2 = *(__CFRunLoopSource **)(a1 + 232);
  if (v2)
  {
    CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 8), v2, kCFRunLoopDefaultMode);
    CFRelease(*(CFTypeRef *)(a1 + 232));
    *(void *)(a1 + 232) = 0;
  }
  uint64_t v3 = *(__CFMachPort **)(a1 + 216);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 216));
    *(void *)(a1 + 216) = 0;
  }
  mach_port_name_t v4 = *(_DWORD *)(a1 + 224);
  if (v4)
  {
    mach_port_mod_refs(mach_task_self_, v4, 1u, -1);
    *(_DWORD *)(a1 + 224) = 0;
  }
}

uint64_t sub_100010A54(uint64_t a1)
{
  uint64_t v2 = IOCreateReceivePort(0x39u, (mach_port_t *)(a1 + 224));
  if (!v2)
  {
    uint64_t v2 = 3758097085;
    Boolean shouldFreeInfo = 0;
    context.version = 1;
    context.info = (void *)a1;
    memset(&context.retain, 0, 24);
    uint64_t v3 = CFMachPortCreateWithPort(kCFAllocatorDefault, *(_DWORD *)(a1 + 224), (CFMachPortCallBack)&IODispatchCalloutFromMessage, &context, &shouldFreeInfo);
    *(void *)(a1 + 216) = v3;
    if (v3)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, v3, 0);
      *(void *)(a1 + 232) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 8), RunLoopSource, kCFRunLoopDefaultMode);
        return 0;
      }
    }
  }
  return v2;
}

uint64_t sub_100010B24(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(_DWORD *)a1 == 1)
  {
    pthread_mutex_unlock(v2);
    return 3758097122;
  }
  else
  {
    *(unsigned char *)(a1 + 248) = 0;
    *(_DWORD *)a1 = 1;
    inputStruct[0] = sub_100010BB8;
    inputStruct[1] = a1;
    int v6 = *(_DWORD *)(a1 + 224);
    uint64_t v3 = sub_10001B4E8(*(void *)(a1 + 240), inputStruct);
    pthread_mutex_unlock(v2);
  }
  return v3;
}

void sub_100010BB8()
{
}

uint64_t sub_100010C94(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 144);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 144));
  uint64_t v3 = *(__CFRunLoopTimer **)(a1 + 208);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 208));
    *(void *)(a1 + 208) = 0;
  }

  return pthread_mutex_unlock(v2);
}

uint64_t sub_100010CEC(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 144);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 144));
  uint64_t v3 = *(__CFRunLoopTimer **)(a1 + 208);
  if (v3)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v3, Current + *(double *)(a1 + 280));
  }

  return pthread_mutex_unlock(v2);
}

uint64_t sub_100010D50(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  sub_10001B738(*(void *)(a1 + 240), *(_DWORD *)(a1 + 224));
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t sub_100010D94(uint64_t a1)
{
  pthread_t v5 = 0;
  sub_100011574(&v7);
  uint64_t v2 = *(void *)(a1 + 8);
  v6[0] = 0;
  v6[1] = v2;
  v6[2] = &v7;
  pthread_attr_init(&v8);
  pthread_attr_setdetachstate(&v8, 2);
  pthread_create(&v5, &v8, (void *(__cdecl *)(void *))sub_100010E98, v6);
  pthread_attr_destroy(&v8);
  sub_1000115B8(&v7);
  **(void **)a1 = v6[0];
  if (v6[0]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 3758097084;
  }
  sub_1000115B0(&v7);
  return v3;
}

void sub_100010E7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void sub_100010E98(uint64_t a1)
{
}

void sub_100010F4C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100010F60(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  CFRetain(v2);
  uint64_t v3 = (void *)sub_100010878(a1);
  operator delete(v3);
  CFRunLoopStop((CFRunLoopRef)v2);
  CFRelease(v2);
  return 0;
}

double sub_100010FAC(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *a1;
  double result = 0.0;
  if (a2 - 1 < a3 && v3 != 0)
  {
    uint64_t v6 = *((unsigned int *)a1 + 4);
    *(void *)(v3 + 8 * v6) = a3 - a2;
    unsigned int v8 = *((_DWORD *)a1 + 2);
    unsigned int v7 = *((_DWORD *)a1 + 3);
    *((_DWORD *)a1 + 4) = ((int)v6 + 1) % v8;
    if (v7 < v8) {
      *((_DWORD *)a1 + 3) = v7 + 1;
    }
    return (double)((a3 - a2) * *((unsigned int *)a1 + 8) / *((unsigned int *)a1 + 9)) / 1000000.0;
  }
  return result;
}

void *sub_100011014(void *result)
{
  if (*result)
  {
    uint64_t v1 = result;
    if (!result[3])
    {
      double result = (void *)mach_absolute_time();
      v1[3] = result;
    }
  }
  return result;
}

double sub_10001104C(uint64_t *a1)
{
  uint64_t v1 = a1[3];
  if (!v1) {
    return 0.0;
  }
  uint64_t v3 = mach_absolute_time();
  double result = sub_100010FAC(a1, v1, v3);
  a1[3] = 0;
  return result;
}

double sub_100011094(_DWORD *a1, uint64_t a2)
{
  if (a2)
  {
    *(void *)(a2 + 48) = 0;
    double result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    int v4 = a1[2];
    int v3 = a1[3];
    *(_DWORD *)a2 = v3;
    *(_DWORD *)(a2 + 4) = v4;
    *(_DWORD *)(a2 + 8) = a1[4];
    if (v3) {
      operator new[]();
    }
  }
  return result;
}

void sub_10001123C(_DWORD *a1)
{
  sub_100011094(a1, (uint64_t)v1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v8) = v1[0];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Number of samples: %d", buf, 8u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v8) = v1[1];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Maximum samples:   %d", buf, 8u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Minimum time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Maximum time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Average time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Median time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " Standard deviation (ms): %.3f", buf, 0xCu);
  }
}

void sub_1000114B0(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 8) = a2;
  *(void *)(a1 + 24) = 0;
  operator new[]();
}

void **sub_100011504(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    operator delete[](v2);
  }
  return a1;
}

uint64_t sub_100011534(uint64_t a1)
{
  return a1;
}

uint64_t sub_100011578(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000115B8(pthread_mutex_t *a1)
{
  return pthread_cond_wait((pthread_cond_t *)&a1[1], a1);
}

uint64_t sub_1000115C4(uint64_t a1)
{
  pthread_cond_signal((pthread_cond_t *)(a1 + 64));

  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

void sub_100011600(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v32 = a2;
  unsigned int v7 = (__int16 *)(a1 + 2 * a6 * a3 + 2 * a2);
  uint64_t v31 = a4;
  uint64_t v8 = a6;
  uint64_t v9 = 2 * a6;
  uint64_t v10 = 2 * a4 - 4;
  uint64_t v11 = 4;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *v7;
      int v13 = v7[1];
      int v14 = v7[2];
      int v15 = v7[3];
      int v16 = *(__int16 *)((char *)v7 + v10 - 4);
      int v17 = *(__int16 *)((char *)v7 + v10 - 2);
      int v18 = *(__int16 *)((char *)v7 + v10);
      int v19 = *(__int16 *)((char *)v7 + v10 + 2);
      *(_DWORD *)buf = 67110912;
      int v36 = v12;
      __int16 v37 = 1024;
      int v38 = v13;
      __int16 v39 = 1024;
      int v40 = v14;
      __int16 v41 = 1024;
      int v42 = v15;
      __int16 v43 = 1024;
      int v44 = v16;
      __int16 v45 = 1024;
      int v46 = v17;
      __int16 v47 = 1024;
      int v48 = v18;
      __int16 v49 = 1024;
      int v50 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%6d %6d %6d %6d ... %6d %6d %6d %6d]\n", buf, 0x32u);
    }
    unsigned int v7 = (__int16 *)((char *)v7 + v9);
    --v11;
  }
  while (v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [...... ...... ...... ...... ... ...... ...... ...... ......]\n", buf, 2u);
  }
  float32x4_t v20 = (__int16 *)(a1 + 2 * (a3 + (uint64_t)a5 - 4) * v8 + 2 * v32);
  uint64_t v21 = 2 * v31 - 4;
  uint64_t v22 = 4;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = *v20;
      int v24 = v20[1];
      int v25 = v20[2];
      int v26 = v20[3];
      int v27 = *(__int16 *)((char *)v20 + v21 - 4);
      int v28 = *(__int16 *)((char *)v20 + v21 - 2);
      int v29 = *(__int16 *)((char *)v20 + v21);
      int v30 = *(__int16 *)((char *)v20 + v21 + 2);
      *(_DWORD *)buf = 67110912;
      int v36 = v23;
      __int16 v37 = 1024;
      int v38 = v24;
      __int16 v39 = 1024;
      int v40 = v25;
      __int16 v41 = 1024;
      int v42 = v26;
      __int16 v43 = 1024;
      int v44 = v27;
      __int16 v45 = 1024;
      int v46 = v28;
      __int16 v47 = 1024;
      int v48 = v29;
      __int16 v49 = 1024;
      int v50 = v30;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%6d %6d %6d %6d ... %6d %6d %6d %6d]\n", buf, 0x32u);
    }
    v20 += v8;
    --v22;
  }
  while (v22);
}

void sub_1000118A4(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v8 = a6;
  uint64_t v30 = a2;
  uint64_t v9 = (unsigned __int8 *)(a1 + a6 * (uint64_t)a3 + a2);
  uint64_t v10 = a4 - 2;
  uint64_t v11 = 4;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *v9;
      int v13 = v9[1];
      int v14 = v9[2];
      int v15 = v9[3];
      int v16 = v9[v10 - 2];
      int v17 = v9[v10 - 1];
      int v18 = v9[v10];
      int v19 = v9[v10 + 1];
      *(_DWORD *)buf = 67110912;
      int v33 = v12;
      __int16 v34 = 1024;
      int v35 = v13;
      __int16 v36 = 1024;
      int v37 = v14;
      __int16 v38 = 1024;
      int v39 = v15;
      __int16 v40 = 1024;
      int v41 = v16;
      __int16 v42 = 1024;
      int v43 = v17;
      __int16 v44 = 1024;
      int v45 = v18;
      __int16 v46 = 1024;
      int v47 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%3d %3d %3d %3d ... %3d %3d %3d %3d]\n", buf, 0x32u);
    }
    v9 += v8;
    --v11;
  }
  while (v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [... ... ... ... ... ... ... ... ...]\n", buf, 2u);
  }
  float32x4_t v20 = (unsigned __int8 *)(a1 + (a3 + (uint64_t)a5 - 4) * v8 + v30);
  uint64_t v21 = 4;
  do
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = *v20;
      int v23 = v20[1];
      int v24 = v20[2];
      int v25 = v20[3];
      int v26 = v20[v10 - 2];
      int v27 = v20[v10 - 1];
      int v28 = v20[v10];
      int v29 = v20[v10 + 1];
      *(_DWORD *)buf = 67110912;
      int v33 = v22;
      __int16 v34 = 1024;
      int v35 = v23;
      __int16 v36 = 1024;
      int v37 = v24;
      __int16 v38 = 1024;
      int v39 = v25;
      __int16 v40 = 1024;
      int v41 = v26;
      __int16 v42 = 1024;
      int v43 = v27;
      __int16 v44 = 1024;
      int v45 = v28;
      __int16 v46 = 1024;
      int v47 = v29;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%3d %3d %3d %3d ... %3d %3d %3d %3d]\n", buf, 0x32u);
    }
    v20 += v8;
    --v21;
  }
  while (v21);
}

void sub_100011B24(int16x8_t *a1, int a2, int a3, _WORD *a4, char a5)
{
  uint64_t v6 = a1;
  uint64_t v7 = (a3 * a2);
  if (a5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 67109120;
      int v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: size_t length = %d\n", (uint8_t *)&v29, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x = [\n", (uint8_t *)&v29, 2u);
    }
    sub_100011600((uint64_t)v6, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)&v29,
        2u);
    }
    unint64_t v15 = v7 & 0xFFFFFFF8;
    if ((int)v15 < 1)
    {
      int32x4_t v17 = 0uLL;
    }
    else
    {
      unint64_t v16 = 0;
      int32x4_t v17 = 0uLL;
      int v18 = v6;
      do
      {
        int16x8_t v19 = *v18++;
        int32x4_t v17 = vaddw_high_s16(vaddw_s16(v17, *(int16x4_t *)v19.i8), v19);
        v16 += 8;
      }
      while (v16 < v15);
    }
    float32x2_t v24 = vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v17, (int8x16_t)v17, 8uLL));
    int v25 = (int)(float)(v24.f32[1] + (float)(int)v24.f32[0]);
    if ((int)v7 >= 1)
    {
      uint64_t v26 = v7;
      do
      {
        int v27 = v6->i16[0];
        uint64_t v6 = (int16x8_t *)((char *)v6 + 2);
        v25 += v27;
        --v26;
      }
      while (v26);
    }
    int v28 = v25 / (int)v7;
    *a4 = v25 / (int)v7;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 67109120;
      int v30 = (__int16)v28;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: mean(x) = %d\n", (uint8_t *)&v29, 8u);
    }
  }
  else
  {
    unint64_t v8 = v7 & 0xFFFFFFF8;
    if ((int)v8 < 1)
    {
      int32x4_t v10 = 0uLL;
    }
    else
    {
      unint64_t v9 = 0;
      int32x4_t v10 = 0uLL;
      uint64_t v11 = a1;
      do
      {
        int16x8_t v12 = *v11++;
        int32x4_t v10 = vaddw_high_s16(vaddw_s16(v10, *(int16x4_t *)v12.i8), v12);
        v9 += 8;
      }
      while (v9 < v8);
    }
    float32x2_t v20 = vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v10, (int8x16_t)v10, 8uLL));
    int v21 = (int)(float)(v20.f32[1] + (float)(int)v20.f32[0]);
    if ((int)v7 >= 1)
    {
      uint64_t v22 = (a3 * a2);
      do
      {
        int v23 = v6->i16[0];
        uint64_t v6 = (int16x8_t *)((char *)v6 + 2);
        v21 += v23;
        --v22;
      }
      while (v22);
    }
    *a4 = v21 / (int)v7;
  }
}

void sub_100011DC4(void *__src, int a2, int a3, __int16 *a4, __int16 *a5, __int16 *a6, int16x8_t *__dst, char a8)
{
  uint64_t v16 = (a3 * a2);
  memcpy(__dst, __src, 2 * (int)v16);
  if (a8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: size_t length = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = *a4;
      *(_DWORD *)buf = 67109120;
      int v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_mean = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x = [\n", buf, 2u);
    }
    sub_100011600((uint64_t)__src, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    unsigned int v23 = *a4;
    unint64_t v24 = v16 & 0xFFFFFFF8;
    if ((int)v24 < 1)
    {
      LODWORD(v25) = 0;
    }
    else
    {
      unint64_t v25 = 0;
      int16x8_t v26 = vdupq_n_s16(v23);
      int v27 = __dst;
      do
      {
        int16x8_t *v27 = vabdq_s16(*v27, v26);
        ++v27;
        v25 += 8;
      }
      while (v25 < v24);
    }
    if ((int)v25 < (int)v16)
    {
      uint64_t v31 = v16 - v25;
      uint64_t v32 = &__dst->i16[v25];
      do
      {
        int v33 = *v32 - v23;
        if (v33 < 0) {
          LOWORD(v33) = v23 - *v32;
        }
        *v32++ = v33;
        --v31;
      }
      while (v31);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v39 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: size_t length = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: abs(x-mean(x)) = [\n", buf, 2u);
    }
    sub_100011600((uint64_t)__dst, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    unsigned int v17 = *a4;
    unint64_t v18 = v16 & 0xFFFFFFF8;
    if ((int)v18 < 1)
    {
      LODWORD(v19) = 0;
    }
    else
    {
      unint64_t v19 = 0;
      int16x8_t v20 = vdupq_n_s16(v17);
      int v21 = __dst;
      do
      {
        int16x8_t *v21 = vabdq_s16(*v21, v20);
        ++v21;
        v19 += 8;
      }
      while (v19 < v18);
    }
    if ((int)v19 < (int)v16)
    {
      uint64_t v28 = v16 - v19;
      int v29 = &__dst->i16[v19];
      do
      {
        int v30 = *v29 - v17;
        if (v30 < 0) {
          LOWORD(v30) = v17 - *v29;
        }
        *v29++ = v30;
        --v28;
      }
      while (v28);
    }
  }
  __int16 v37 = 0;
  sub_100011B24(__dst, a2, a3, &v37, a8);
  int v34 = v37;
  *a5 = v37;
  *a6 = (5 * v34) >> 2;
  if (a8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v39 = v34;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_tmp_mean = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = *a5;
      *(_DWORD *)buf = 67109120;
      int v39 = v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_mad_mean = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = *a6;
      *(_DWORD *)buf = 67109120;
      int v39 = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_mad_sigma = %d\n", buf, 8u);
    }
  }
}

void sub_100012270(uint64_t a1, int a2, int a3, __int16 *a4, __int16 *a5, __int16 *a6, __int16 *a7, uint64_t a8, char a9)
{
  uint64_t v11 = (a3 * a2);
  __int16 v12 = *a4 + (*a7 >> *a5);
  *a6 = v12;
  if (a9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = 67109120;
      int v47 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: size_t length = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = *a4;
      int v46 = 67109120;
      int v47 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_median = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = *a5;
      int v46 = 67109120;
      int v47 = v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: noise_factor = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = *a7;
      int v46 = 67109120;
      int v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_sigma = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = *a6;
      int v46 = 67109120;
      int v47 = v28;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: sft_thr = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x = [\n", (uint8_t *)&v46, 2u);
    }
    sub_100011600(a1, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)&v46,
        2u);
    }
    signed int v29 = *a6;
    unint64_t v30 = v11 & 0xFFFFFFF8;
    if ((int)v30 < 1)
    {
      LODWORD(v31) = 0;
    }
    else
    {
      unint64_t v31 = 0;
      int16x8_t v32 = vdupq_n_s16(v29);
      int v33 = (int16x8_t *)a1;
      int v34 = (int8x16_t *)a8;
      do
      {
        int16x8_t v35 = *v33++;
        *v34++ = vandq_s8((int8x16_t)vsubq_s16(v35, v32), (int8x16_t)vcgtq_s16(v35, v32));
        v31 += 8;
      }
      while (v31 < v30);
    }
    if ((int)v31 < (int)v11)
    {
      uint64_t v41 = v11 - v31;
      __int16 v42 = (_WORD *)(a8 + 2 * v31);
      int v43 = (__int16 *)(a1 + 2 * v31);
      do
      {
        int v44 = *v43++;
        __int16 v45 = v44 - v29;
        if (v44 <= v29) {
          __int16 v45 = 0;
        }
        *v42++ = v45;
        --v41;
      }
      while (v41);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = 67109120;
      int v47 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: size_t length = %d\n", (uint8_t *)&v46, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: x_th = [\n", (uint8_t *)&v46, 2u);
    }
    sub_100011600(a8, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v46) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)&v46,
        2u);
    }
  }
  else
  {
    unint64_t v13 = v11 & 0xFFFFFFF8;
    if ((int)v13 < 1)
    {
      LODWORD(v14) = 0;
    }
    else
    {
      unint64_t v14 = 0;
      int16x8_t v15 = vdupq_n_s16(v12);
      uint64_t v16 = (int16x8_t *)a1;
      unsigned int v17 = (int8x16_t *)a8;
      do
      {
        int16x8_t v18 = *v16++;
        *v17++ = vandq_s8((int8x16_t)vsubq_s16(v18, v15), (int8x16_t)vcgtq_s16(v18, v15));
        v14 += 8;
      }
      while (v14 < v13);
    }
    if ((int)v14 < (int)v11)
    {
      uint64_t v36 = v11 - v14;
      __int16 v37 = (_WORD *)(a8 + 2 * v14);
      __int16 v38 = (__int16 *)(a1 + 2 * v14);
      do
      {
        int v39 = *v38++;
        __int16 v40 = v39 - v12;
        if (v39 <= v12) {
          __int16 v40 = 0;
        }
        *v37++ = v40;
        --v36;
      }
      while (v36);
    }
  }
}

void sub_10001270C(uint64_t a1, int a2, int a3, int *a4, uint64_t a5, int a6, const __int16 *a7, char a8)
{
  uint64_t v11 = *a4;
  if (a3 - (int)v11 + 1 >= 0)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = (v11 * v11);
    unint64_t v15 = v14 & 0x7FFFFFF8;
    uint64_t v16 = a2 - (int)v11 + 1;
    uint64_t v17 = a6;
    uint64_t v18 = 2 * v11;
    do
    {
      uint64_t v19 = v13 + v11;
      if ((v16 & 0x80000000) == 0)
      {
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = a1;
        do
        {
          if ((int)v11 >= 1)
          {
            unsigned int v23 = a7;
            uint64_t v24 = v22;
            uint64_t v25 = v13;
            do
            {
              uint64_t v26 = 0;
              do
              {
                v23[v26] = *(_WORD *)(v24 + 2 * v26);
                ++v26;
              }
              while (v21 + v26 < v21 + v11);
              ++v25;
              v24 += 2 * a2;
              unsigned int v23 = (const __int16 *)((char *)v23 + v18);
            }
            while (v25 < v19);
          }
          int16x8_t v27 = vld1q_dup_s16(a7);
          if (v15)
          {
            unint64_t v28 = 0;
            signed int v29 = (int16x8_t *)a7;
            do
            {
              int16x8_t v30 = *v29++;
              int16x8_t v27 = vmaxq_s16(v30, v27);
              v28 += 8;
            }
            while (v28 < v15);
            unsigned int v31 = ((v15 - 1) & 0xFFFFFFF8) + 8;
          }
          else
          {
            unsigned int v31 = 0;
          }
          __int16 v32 = vmaxv_s16(vmax_s16(*(int16x4_t *)v27.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL)));
          if ((int)v31 < (int)v14)
          {
            uint64_t v33 = v14 - v31;
            int v34 = &a7[v31];
            do
            {
              int v36 = *v34++;
              __int16 v35 = v36;
              if (v32 <= v36) {
                __int16 v32 = v35;
              }
              --v33;
            }
            while (v33);
          }
          *(_WORD *)(a5 + 2 * (v20 + v12 * v17)) = v32;
          ++v20;
          v21 += v11;
          v22 += v18;
        }
        while (v21 <= v16);
      }
      ++v12;
      a1 += 2 * (int)v11 * (uint64_t)a2;
      v13 += v11;
    }
    while (v19 <= (a3 - v11 + 1));
  }
  if (a8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: xmax = [\n", buf, 2u);
    }
    if (a2 >= 0) {
      int v37 = a2;
    }
    else {
      int v37 = a2 + 1;
    }
    int v38 = v37 >> 1;
    if (a3 >= 0) {
      int v39 = a3;
    }
    else {
      int v39 = a3 + 1;
    }
    sub_100011600(a5, 0, 0, v38, v39 >> 1, v38);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v40[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)v40,
        2u);
    }
  }
}

void sub_100012950(int16x8_t *a1, int a2, int a3, float *a4, char a5)
{
  uint64_t v5 = (a3 * a2);
  unint64_t v6 = v5 & 0xFFFFFFF8;
  if ((int)v6 < 1)
  {
    LODWORD(v7) = 0;
    int32x4_t v11 = 0uLL;
    int32x4_t v10 = 0uLL;
  }
  else
  {
    unint64_t v7 = 0;
    v8.i64[0] = 0x1000100010001;
    v8.i64[1] = 0x1000100010001;
    unint64_t v9 = a1;
    int32x4_t v10 = 0uLL;
    int32x4_t v11 = 0uLL;
    do
    {
      int16x8_t v12 = *v9++;
      uint16x8_t v13 = (uint16x8_t)vmaxq_s16(v12, (int16x8_t)0);
      uint16x8_t v14 = (uint16x8_t)vandq_s8((int8x16_t)vcgtzq_s16(v12), v8);
      int32x4_t v10 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v10, *(uint16x4_t *)v13.i8), v13);
      int32x4_t v11 = (int32x4_t)vaddw_high_u16(vaddw_u16((uint32x4_t)v11, *(uint16x4_t *)v14.i8), v14);
      v7 += 8;
    }
    while (v7 < v6);
  }
  int v15 = vaddvq_s32(v10);
  int v16 = vaddvq_s32(v11);
  if ((int)v7 < (int)v5)
  {
    uint64_t v17 = v5 - v7;
    uint64_t v18 = &a1->i16[v7];
    do
    {
      int v20 = *v18++;
      int v19 = v20;
      if (v20 > 0) {
        ++v16;
      }
      v15 += v19 & ~(v19 >> 31);
      --v17;
    }
    while (v17);
  }
  float v21 = (float)((float)v15 * 0.0625) / (float)v16;
  *a4 = v21;
  if ((a5 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    double v23 = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: sharpness = %f\n", (uint8_t *)&v22, 0xCu);
  }
}

float32x2_t sub_100012AB0(int16x8_t *a1, int16x8_t *a2, int a3, int a4, float *a5, float *a6, float *a7, char a8)
{
  uint64_t v10 = (a4 * a3);
  signed int v11 = (int)*a5;
  unint64_t v12 = v10 & 0xFFFFFFF8;
  if ((int)v12 < 1)
  {
    LODWORD(v13) = 0;
    int16x8_t v21 = 0uLL;
    int16x8_t v20 = 0uLL;
    int16x8_t v19 = 0uLL;
    int16x8_t v15 = 0uLL;
  }
  else
  {
    unint64_t v13 = 0;
    int16x8_t v14 = vdupq_n_s16(v11);
    int16x8_t v15 = 0uLL;
    v16.i64[0] = 0x2000200020002;
    v16.i64[1] = 0x2000200020002;
    uint64_t v17 = a1;
    uint64_t v18 = a2;
    int16x8_t v19 = 0uLL;
    int16x8_t v20 = 0uLL;
    int16x8_t v21 = 0uLL;
    do
    {
      int16x8_t v22 = *v17++;
      int16x8_t v23 = v22;
      int16x8_t v24 = *v18++;
      int16x8_t v25 = vshrq_n_s16(v23, 4uLL);
      int16x8_t v26 = vshrq_n_s16(v24, 4uLL);
      int16x8_t v27 = vcgtq_s16(vmaxq_s16(v25, v26), v14);
      int16x8_t v15 = vsubq_s16(v15, v27);
      int16x8_t v19 = vsubq_s16(v19, (int16x8_t)vandq_s8((int8x16_t)v27, (int8x16_t)vcgtq_s16(v25, v26)));
      int16x8_t v28 = (int16x8_t)vandq_s8((int8x16_t)v27, vandq_s8((int8x16_t)vcgtq_s16(v26, v25), v16));
      int16x8_t v20 = vaddq_s16(v28, v20);
      int16x8_t v21 = vaddq_s16((int16x8_t)vandq_s8((int8x16_t)v28, (int8x16_t)vcgtq_s16(v14, v25)), v21);
      v13 += 8;
    }
    while (v13 < v12);
  }
  int8x16_t v29 = (int8x16_t)vmovl_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v15.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v15, (int8x16_t)v15, 8uLL)));
  int8x16_t v30 = (int8x16_t)vmovl_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v19.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v19, (int8x16_t)v19, 8uLL)));
  int32x2_t v31 = (int32x2_t)vand_s8((int8x8_t)vzip1_s32(*(int32x2_t *)v30.i8, *(int32x2_t *)v29.i8), (int8x8_t)0xFFFF0000FFFFLL);
  int32x2_t v32 = (int32x2_t)vand_s8((int8x8_t)vzip2_s32(*(int32x2_t *)v30.i8, *(int32x2_t *)v29.i8), (int8x8_t)0xFFFF0000FFFFLL);
  v29.i64[0] = vextq_s8(v29, v29, 8uLL).u64[0];
  v30.i64[0] = vextq_s8(v30, v30, 8uLL).u64[0];
  int32x2_t v33 = vadd_s32(vadd_s32(vadd_s32(v32, v31), (int32x2_t)vand_s8((int8x8_t)vzip1_s32(*(int32x2_t *)v30.i8, *(int32x2_t *)v29.i8), (int8x8_t)0xFFFF0000FFFFLL)), (int32x2_t)vand_s8((int8x8_t)vzip2_s32(*(int32x2_t *)v30.i8, *(int32x2_t *)v29.i8), (int8x8_t)0xFFFF0000FFFFLL));
  int v34 = vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v20.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v20, (int8x16_t)v20, 8uLL))));
  int v35 = vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)vadd_s16(*(int16x4_t *)v21.i8, (int16x4_t)*(_OWORD *)&vextq_s8((int8x16_t)v21, (int8x16_t)v21, 8uLL))));
  if ((int)v13 < (int)v10)
  {
    float v36 = (float)v11;
    uint64_t v37 = v10 - v13;
    int v38 = &a2->i16[v13];
    int v39 = &a1->i16[v13];
    do
    {
      int v40 = *v39++;
      float v41 = (float)(v40 >> 4);
      int v42 = *v38++;
      int v43 = v42 >> 4;
      float v44 = (float)(v42 >> 4);
      if (v44 <= v41) {
        float v45 = v41;
      }
      else {
        float v45 = (float)v43;
      }
      if (v45 > v36)
      {
        int32x2_t v33 = vadd_s32(v33, (int32x2_t)((v41 > v44) | 0x100000000));
        if (v44 > v41)
        {
          v34 += 2;
          if (v41 < v36) {
            v35 += 2;
          }
        }
      }
      --v37;
    }
    while (v37);
  }
  __int32 v46 = v33.i32[1];
  if (v33.i32[1])
  {
    float32x2_t v47 = vcvt_f32_s32(v33);
    float32x2_t result = vdiv_f32(v47, (float32x2_t)vdup_lane_s32((int32x2_t)v47, 1));
  }
  else
  {
    float32x2_t result = 0;
  }
  *a6 = result.f32[0];
  if (v34) {
    result.f32[0] = (float)v35 / (float)v34;
  }
  else {
    result.i32[0] = 1.0;
  }
  *a7 = result.f32[0];
  if (a8)
  {
    __int32 v52 = v33.i32[0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v46;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Nedge      = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v49) = 67109120;
      HIDWORD(v49) = v52;
      *(void *)buf = v49;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Nda        = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Nrg        = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Nbrg       = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double v50 = *a6;
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v50;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: blurConf   = %f\n", buf, 0xCu);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double v51 = *a7;
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v51;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: blurExtent = %f\n", buf, 0xCu);
    }
  }
  return result;
}

void sub_100012EB8(int16x8_t *a1, int16x8_t *a2, int16x8_t *a3, int a4, int a5, uint64_t a6, char a7)
{
  uint64_t v10 = (a5 * a4);
  unint64_t v11 = v10 & 0xFFFFFFF8;
  if ((int)v11 < 1)
  {
    LODWORD(v12) = 0;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v13 = a1;
    int16x8_t v14 = a2;
    int16x8_t v15 = a3;
    int8x16_t v16 = (int16x8_t *)a6;
    do
    {
      int16x8_t v17 = *v13++;
      int16x8_t v18 = v17;
      int16x8_t v19 = *v14++;
      int16x8_t v20 = v19;
      int16x8_t v21 = *v15++;
      int16x8_t v22 = v21;
      int32x4_t v23 = vmull_s16(*(int16x4_t *)v20.i8, *(int16x4_t *)v20.i8);
      int32x4_t v24 = vmlal_high_s16(vmlal_high_s16(vmull_high_s16(v20, v20), v18, v18), v22, v22);
      float32x4_t v25 = vcvtq_f32_s32(vmlal_s16(vmlal_s16(v23, *(int16x4_t *)v18.i8, *(int16x4_t *)v18.i8), *(int16x4_t *)v22.i8, *(int16x4_t *)v22.i8));
      float32x4_t v26 = vrsqrteq_f32(v25);
      float32x4_t v27 = vcvtq_f32_s32(v24);
      float32x4_t v28 = vmulq_f32(vmulq_f32(v26, vrsqrtsq_f32(vmulq_f32(v26, v25), v26)), v25);
      float32x4_t v29 = vrsqrteq_f32(v27);
      *v16++ = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(v28), (int16x8_t)vcvtq_s32_f32(vmulq_f32(vmulq_f32(v29, vrsqrtsq_f32(vmulq_f32(v29, v27), v29)), v27)));
      v12 += 8;
    }
    while (v12 < v11);
  }
  if ((int)v12 < (int)v10)
  {
    uint64_t v30 = v10 - v12;
    int32x2_t v31 = (_WORD *)(a6 + 2 * v12);
    int32x2_t v32 = &a3->i16[v12];
    int32x2_t v33 = &a2->i16[v12];
    int v34 = &a1->i16[v12];
    do
    {
      int v35 = *v34++;
      int v36 = v35 * v35;
      int v37 = *v33++;
      int v38 = v36 + v37 * v37;
      int v39 = *v32++;
      *v31++ = (int)sqrt((double)(v38 + v39 * v39));
      --v30;
    }
    while (v30);
  }
  if (a7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: calcEmap\n", (uint8_t *)&v40, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 67109120;
      int v41 = a5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height=%d\n", (uint8_t *)&v40, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 67109120;
      int v41 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width=%d\n", (uint8_t *)&v40, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: emap = [\n", (uint8_t *)&v40, 2u);
    }
    sub_100011600(a6, 0, 0, a4, a5, a4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
        (uint8_t *)&v40,
        2u);
    }
  }
}

void sub_100013178(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int16x8_t *__src, int16x8_t *a9, char a10)
{
  uint64_t v10 = __src;
  int16x8_t v15 = a9;
  if (a10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: hlwt2\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height=%d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width=%d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: img_data = [\n", buf, 2u);
    }
    sub_100011600(a1, 0, 0, a2, a3, a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if (a3 >= 1)
    {
      uint64_t v24 = 0;
      uint64_t v25 = (int)(a2 & 0xFFFFFFF8);
      uint64_t v26 = 2 * (a2 >> 1);
      float32x4_t v27 = v10;
      uint64_t v28 = (uint64_t)a9;
      do
      {
        if ((int)v25 < 1)
        {
          uint64_t v29 = 0;
        }
        else
        {
          uint64_t v29 = 0;
          uint64_t v30 = (const __int16 *)a1;
          do
          {
            int16x4x2_t v130 = vld2_s16(v30);
            v30 += 8;
            *(uint64_t *)((char *)v27->i64 + v29) = (uint64_t)v130.val[0];
            *(int16x4_t *)(v28 + v29) = v130.val[1];
            v29 += 8;
          }
          while (v29 < v25);
          uint64_t v29 = v29;
        }
        if ((int)v29 < a2)
        {
          do
          {
            if (v29) {
              uint64_t v31 = (uint64_t)a9;
            }
            else {
              uint64_t v31 = (uint64_t)v10;
            }
            *(_WORD *)(v31 + 2 * (int)((int)v24 * a2 / 2 + (v29 >> 1))) = *(_WORD *)(a1 + 2 * v29);
            ++v29;
          }
          while (a2 != v29);
        }
        ++v24;
        v28 += v26;
        float32x4_t v27 = (int16x8_t *)((char *)v27 + v26);
        a1 += 2 * a2;
      }
      while (v24 != a3);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Splitting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: L = [\n", buf, 2u);
    }
    if (a2 >= 0) {
      int v32 = a2;
    }
    else {
      int v32 = a2 + 1;
    }
    sub_100011600((uint64_t)v10, 0, 0, v32 >> 1, a3, v32 >> 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    if (a3 < 1) {
      goto LABEL_60;
    }
    uint64_t v16 = 0;
    uint64_t v17 = (int)(a2 & 0xFFFFFFF8);
    uint64_t v18 = 2 * (a2 >> 1);
    int16x8_t v19 = __src;
    uint64_t v20 = (uint64_t)a9;
    do
    {
      if ((int)v17 < 1)
      {
        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v21 = 0;
        int16x8_t v22 = (const __int16 *)a1;
        do
        {
          int16x4x2_t v129 = vld2_s16(v22);
          v22 += 8;
          *(uint64_t *)((char *)v19->i64 + v21) = (uint64_t)v129.val[0];
          *(int16x4_t *)(v20 + v21) = v129.val[1];
          v21 += 8;
        }
        while (v21 < v17);
        uint64_t v21 = v21;
      }
      if ((int)v21 < a2)
      {
        do
        {
          if (v21) {
            int32x4_t v23 = a9;
          }
          else {
            int32x4_t v23 = __src;
          }
          v23->i16[(int)v16 * a2 / 2 + (v21 >> 1)] = *(_WORD *)(a1 + 2 * v21);
          ++v21;
        }
        while (a2 != v21);
      }
      ++v16;
      v20 += v18;
      int16x8_t v19 = (int16x8_t *)((char *)v19 + v18);
      a1 += 2 * a2;
    }
    while (v16 != a3);
  }
  if (a10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: H = [\n", buf, 2u);
    }
    if (a2 >= 0) {
      int v33 = a2;
    }
    else {
      int v33 = a2 + 1;
    }
    sub_100011600((uint64_t)a9, 0, 0, v33 >> 1, a3, v33 >> 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
LABEL_60:
  if (a2 >= 0) {
    int v34 = a2;
  }
  else {
    int v34 = a2 + 1;
  }
  int v35 = v34 >> 1;
  uint64_t v36 = ((v34 >> 1) * a3);
  unint64_t v37 = v36 & 0xFFFFFFF8;
  if ((int)v37 < 1)
  {
    LODWORD(v38) = 0;
  }
  else
  {
    unint64_t v38 = 0;
    int v39 = a9;
    int v40 = v10;
    do
    {
      int16x8_t v41 = *v40++;
      *int v39 = vsubq_s16(*v39, v41);
      ++v39;
      v38 += 8;
    }
    while (v38 < v37);
  }
  if ((int)v38 < (int)v36)
  {
    uint64_t v42 = v36 - v38;
    int v43 = &v10->i8[2 * v38];
    float v44 = &a9->i16[v38];
    do
    {
      __int16 v45 = *(_WORD *)v43;
      v43 += 2;
      *v44++ -= v45;
      --v42;
    }
    while (v42);
  }
  if (a10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Lifting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: H = [\n", buf, 2u);
    }
    sub_100011600((uint64_t)a9, 0, 0, v35, a3, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if ((int)v37 < 1)
    {
      LODWORD(v50) = 0;
    }
    else
    {
      unint64_t v50 = 0;
      double v51 = a9;
      __int32 v52 = v10;
      do
      {
        int16x8_t v53 = vshrq_n_s16(*v51, 1uLL);
        *__int32 v52 = vsraq_n_s16(*v52, *v51, 1uLL);
        ++v52;
        *v51++ = v53;
        v50 += 8;
      }
      while (v50 < v37);
    }
    if ((int)v50 < (int)v36)
    {
      uint64_t v58 = v36 - v50;
      uint64_t v59 = &v10->i8[2 * v50];
      uint64_t v60 = &a9->i16[v50];
      do
      {
        int v61 = *v60;
        *v60++ >>= 1;
        *(_WORD *)v59 += v61 >> 1;
        v59 += 2;
        --v58;
      }
      while (v58);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: L = [\n", buf, 2u);
    }
    sub_100011600((uint64_t)v10, 0, 0, v35, a3, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    if ((int)v37 < 1)
    {
      LODWORD(v46) = 0;
    }
    else
    {
      unint64_t v46 = 0;
      float32x2_t v47 = a9;
      int v48 = v10;
      do
      {
        int16x8_t v49 = vshrq_n_s16(*v47, 1uLL);
        *int v48 = vsraq_n_s16(*v48, *v47, 1uLL);
        ++v48;
        *v47++ = v49;
        v46 += 8;
      }
      while (v46 < v37);
    }
    if ((int)v46 < (int)v36)
    {
      uint64_t v54 = v36 - v46;
      int16x8_t v55 = &v10->i8[2 * v46];
      int16x8_t v56 = &a9->i16[v46];
      do
      {
        int v57 = *v56;
        *v56++ >>= 1;
        *(_WORD *)v55 += v57 >> 1;
        v55 += 2;
        --v54;
      }
      while (v54);
    }
  }
  if (a3 < 1)
  {
    int v65 = a3;
    int v64 = 0;
    int v63 = 0;
  }
  else
  {
    uint64_t v62 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = a3;
    do
    {
      if (v62)
      {
        memcpy((void *)(a5 + 2 * v63 * v35), v10, 2 * v35);
        ++v63;
      }
      else
      {
        memcpy((void *)(a4 + 2 * v64 * v35), v10, 2 * v35);
        ++v64;
      }
      ++v62;
      uint64_t v10 = (int16x8_t *)((char *)v10 + 2 * v35);
    }
    while (a3 != v62);
  }
  if (a10)
  {
    int v66 = v65;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Splitting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v64;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: a = [\n", buf, 2u);
    }
    if (v65 >= 0) {
      int v69 = v65;
    }
    else {
      int v69 = v65 + 1;
    }
    int v68 = v69 >> 1;
    sub_100011600(a4, 0, 0, v35, v69 >> 1, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h = [\n", buf, 2u);
    }
    sub_100011600(a5, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    int v63 = 0;
    int v66 = v65;
    if (v65 >= 0) {
      int v67 = v65;
    }
    else {
      int v67 = v65 + 1;
    }
    int v68 = v67 >> 1;
  }
  uint64_t v70 = (v68 * v35);
  unint64_t v71 = v70 & 0xFFFFFFF8;
  if ((int)v71 < 1)
  {
    LODWORD(v72) = 0;
  }
  else
  {
    unint64_t v72 = 0;
    int16x8_t v73 = (int16x8_t *)a5;
    int8x16_t v74 = (int16x8_t *)a4;
    do
    {
      int16x8_t v75 = *v74++;
      *int16x8_t v73 = vsubq_s16(*v73, v75);
      ++v73;
      v72 += 8;
    }
    while (v72 < v71);
  }
  if ((int)v72 < (int)v70)
  {
    uint64_t v76 = v70 - v72;
    int16x8_t v77 = (__int16 *)(a4 + 2 * v72);
    int16x8x4_t v78 = (_WORD *)(a5 + 2 * v72);
    do
    {
      __int16 v79 = *v77++;
      *v78++ -= v79;
      --v76;
    }
    while (v76);
  }
  if (a10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Lifting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h = [\n", buf, 2u);
    }
    sub_100011600(a5, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if ((int)v71 < 1)
    {
      LODWORD(v84) = 0;
    }
    else
    {
      unint64_t v84 = 0;
      float v85 = (int16x8_t *)a4;
      float v86 = (int16x8_t *)a5;
      do
      {
        int16x8_t v87 = *v86++;
        *float v85 = vaddq_s16(vaddq_s16(*v85, *v85), v87);
        ++v85;
        v84 += 8;
      }
      while (v84 < v71);
    }
    if ((int)v84 < (int)v70)
    {
      uint64_t v92 = v70 - v84;
      int v93 = (__int16 *)(a5 + 2 * v84);
      unsigned int v94 = (_WORD *)(a4 + 2 * v84);
      do
      {
        __int16 v95 = *v93++;
        *unsigned int v94 = v95 + 2 * *v94;
        ++v94;
        --v92;
      }
      while (v92);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: a = [\n", buf, 2u);
    }
    sub_100011600(a4, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    if ((int)v71 < 1)
    {
      LODWORD(v80) = 0;
    }
    else
    {
      unint64_t v80 = 0;
      int16x8_t v81 = (int16x8_t *)a4;
      int16x8_t v82 = (int16x8_t *)a5;
      do
      {
        int16x8_t v83 = *v82++;
        int16x8_t *v81 = vaddq_s16(vaddq_s16(*v81, *v81), v83);
        ++v81;
        v80 += 8;
      }
      while (v80 < v71);
    }
    if ((int)v80 < (int)v70)
    {
      uint64_t v88 = v70 - v80;
      float v89 = (__int16 *)(a5 + 2 * v80);
      float v90 = (_WORD *)(a4 + 2 * v80);
      do
      {
        __int16 v91 = *v89++;
        *float v90 = v91 + 2 * *v90;
        ++v90;
        --v88;
      }
      while (v88);
    }
  }
  uint64_t v124 = (v68 * v35);
  if (v66 < 1)
  {
    int v98 = 0;
    int v97 = 0;
  }
  else
  {
    uint64_t v96 = 0;
    int v97 = 0;
    int v98 = 0;
    do
    {
      if (v96)
      {
        memcpy((void *)(a7 + 2 * v97 * v35), v15, 2 * v35);
        ++v97;
      }
      else
      {
        memcpy((void *)(a6 + 2 * v98 * v35), v15, 2 * v35);
        ++v98;
      }
      ++v96;
      int16x8_t v15 = (int16x8_t *)((char *)v15 + 2 * v35);
    }
    while (v66 != v96);
  }
  if (a10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Splitting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v98;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v = [\n", buf, 2u);
    }
    sub_100011600(a6, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v97;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d = [\n", buf, 2u);
    }
    sub_100011600(a7, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    int v63 = v97;
  }
  if ((int)v71 < 1)
  {
    LODWORD(v99) = 0;
  }
  else
  {
    unint64_t v99 = 0;
    unsigned __int16 v101 = (int16x8_t *)a6;
    int v100 = (int16x8_t *)a7;
    do
    {
      int16x8_t v102 = *v101++;
      *int v100 = vsubq_s16(*v100, v102);
      ++v100;
      v99 += 8;
    }
    while (v99 < v71);
  }
  if ((int)v99 < (int)v124)
  {
    uint64_t v103 = v124 - v99;
    int v104 = (__int16 *)(a6 + 2 * v99);
    unsigned __int16 v105 = (_WORD *)(a7 + 2 * v99);
    do
    {
      __int16 v106 = *v104++;
      *v105++ -= v106;
      --v103;
    }
    while (v103);
  }
  if (a10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Lifting\n", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d = [\n", buf, 2u);
    }
    sub_100011600(a7, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
    if ((int)v71 < 1)
    {
      LODWORD(v111) = 0;
    }
    else
    {
      unint64_t v111 = 0;
      int v113 = (int16x8_t *)a6;
      uint64_t v112 = (int16x8_t *)a7;
      do
      {
        int16x8_t v114 = vshrq_n_s16(*v112, 1uLL);
        *int v113 = vsraq_n_s16(*v113, *v112, 1uLL);
        ++v113;
        *v112++ = v114;
        v111 += 8;
      }
      while (v111 < v71);
    }
    if ((int)v111 < (int)v124)
    {
      uint64_t v119 = v124 - v111;
      uint64_t v120 = (_WORD *)(a6 + 2 * v111);
      int v121 = (__int16 *)(a7 + 2 * v111);
      do
      {
        int v122 = *v121;
        *v121++ >>= 1;
        *v120++ += v122 >> 1;
        --v119;
      }
      while (v119);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v = [\n", buf, 2u);
    }
    sub_100011600(a6, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
  else
  {
    if ((int)v71 < 1)
    {
      LODWORD(v107) = 0;
    }
    else
    {
      unint64_t v107 = 0;
      v109 = (int16x8_t *)a6;
      signed int v108 = (int16x8_t *)a7;
      do
      {
        int16x8_t v110 = vshrq_n_s16(*v108, 1uLL);
        int16x8_t *v109 = vsraq_n_s16(*v109, *v108, 1uLL);
        ++v109;
        *v108++ = v110;
        v107 += 8;
      }
      while (v107 < v71);
    }
    if ((int)v107 < (int)v124)
    {
      uint64_t v115 = v124 - v107;
      int16x8_t v116 = (_WORD *)(a6 + 2 * v107);
      int v117 = (__int16 *)(a7 + 2 * v107);
      do
      {
        int v118 = *v117;
        *v117++ >>= 1;
        *v116++ += v118 >> 1;
        --v115;
      }
      while (v115);
    }
  }
  if (a10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = v63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: v_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v128 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: h_cnt_split = %d\n", buf, 8u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d = [\n", buf, 2u);
    }
    sub_100011600(a7, 0, 0, v35, v68, v35);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n", buf, 2u);
    }
  }
}

void sub_100014918(int *a1, uint64_t a2)
{
  if (!a1) {
    sub_10001E2DC();
  }
  uint64_t v2 = a1;
  int v3 = *a1;
  if (*a1 == 1)
  {
    uint64_t v136 = (unsigned __int8 *)(a1 + 1144);
    unsigned __int16 v101 = (unsigned __int8 *)(a1 + 2531);
    char v104 = *((unsigned char *)a1 + 4608);
    if (v104)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = v2[4];
        int v6 = v2[1169];
        int v7 = v2[1170];
        int v8 = v2[1153];
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)int8x16_t v157 = v5;
        *(_WORD *)&v157[4] = 1024;
        *(_DWORD *)&v157[6] = v6;
        LOWORD(v158) = 1024;
        *(_DWORD *)((char *)&v158 + 2) = v7;
        HIWORD(v158) = 1024;
        *(_DWORD *)int16x8_t v159 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: #%08d (%4d x %4d) inputCount = %d\n", buf, 0x1Au);
      }
      if (v2[1153])
      {
        unint64_t v9 = 0;
        do
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            double v10 = *(double *)(a2 + 8 * v9);
            unint64_t v11 = &v2[5 * v9];
            int v12 = *((unsigned __int8 *)v11 + 4616);
            int v13 = v11[1155];
            int v14 = v11[1156];
            int v15 = v11[1158];
            LODWORD(v11) = v11[1157];
            *(_DWORD *)buf = 134219520;
            *(void *)int8x16_t v157 = v9;
            *(_WORD *)&v157[8] = 2048;
            double v158 = v10;
            *(_WORD *)int16x8_t v159 = 1024;
            *(_DWORD *)&v159[2] = v12;
            *(_WORD *)int16x8_t v160 = 1024;
            *(_DWORD *)&v160[2] = v13;
            *(_WORD *)int16x8_t v161 = 1024;
            *(_DWORD *)&v161[2] = v14;
            *(_WORD *)int8x16_t v162 = 1024;
            *(_DWORD *)&v162[2] = v15;
            LOWORD(v163[0]) = 1024;
            *(_DWORD *)((char *)v163 + 2) = v11;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: input[%zu] = %p (level = %d) %d x %d, stride = %d, size = %d\n", buf, 0x34u);
          }
          uint64_t v16 = *(unsigned __int8 **)(a2 + 8 * v9);
          if (v16)
          {
            uint64_t v17 = &v2[5 * v9];
            uint64_t v18 = v17[1155];
            if (v18)
            {
              int16x8_t v19 = &v2[5 * v9];
              if (v19[1156])
              {
                int v140 = v17 + 1155;
                int v138 = v19 + 1156;
                uint64_t v20 = &v16[v18 - 1];
                uint64_t v21 = &v2[5 * v9 + 1158];
                uint64_t v22 = 4;
                do
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    int v23 = *v16;
                    int v24 = v16[1];
                    int v25 = v16[2];
                    int v26 = v16[3];
                    int v27 = *(v20 - 3);
                    int v28 = *(v20 - 2);
                    int v29 = *(v20 - 1);
                    int v30 = *v20;
                    *(_DWORD *)buf = 67110912;
                    *(_DWORD *)int8x16_t v157 = v23;
                    *(_WORD *)&v157[4] = 1024;
                    *(_DWORD *)&v157[6] = v24;
                    LOWORD(v158) = 1024;
                    *(_DWORD *)((char *)&v158 + 2) = v25;
                    HIWORD(v158) = 1024;
                    *(_DWORD *)int16x8_t v159 = v26;
                    *(_WORD *)&v159[4] = 1024;
                    *(_DWORD *)int16x8_t v160 = v27;
                    *(_WORD *)&v160[4] = 1024;
                    *(_DWORD *)int16x8_t v161 = v28;
                    *(_WORD *)&v161[4] = 1024;
                    *(_DWORD *)int8x16_t v162 = v29;
                    *(_WORD *)&v162[4] = 1024;
                    v163[0] = v30;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: %3d %3d %3d %3d ... %3d %3d %3d %3d\n", buf, 0x32u);
                  }
                  uint64_t v31 = *v21;
                  v16 += v31;
                  v20 += v31;
                  --v22;
                }
                while (v22);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ... ... ... ... ... ... ... ... ...\n", buf, 2u);
                  uint64_t v31 = *v21;
                }
                int v32 = (unsigned __int8 *)(*(void *)(a2 + 8 * v9) + (*v138 - 4) * v31);
                int v33 = &v32[*v140 - 1];
                uint64_t v34 = 4;
                do
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    int v35 = *v32;
                    int v36 = v32[1];
                    int v37 = v32[2];
                    int v38 = v32[3];
                    int v39 = *(v33 - 3);
                    int v40 = *(v33 - 2);
                    int v41 = *(v33 - 1);
                    int v42 = *v33;
                    *(_DWORD *)buf = 67110912;
                    *(_DWORD *)int8x16_t v157 = v35;
                    *(_WORD *)&v157[4] = 1024;
                    *(_DWORD *)&v157[6] = v36;
                    LOWORD(v158) = 1024;
                    *(_DWORD *)((char *)&v158 + 2) = v37;
                    HIWORD(v158) = 1024;
                    *(_DWORD *)int16x8_t v159 = v38;
                    *(_WORD *)&v159[4] = 1024;
                    *(_DWORD *)int16x8_t v160 = v39;
                    *(_WORD *)&v160[4] = 1024;
                    *(_DWORD *)int16x8_t v161 = v40;
                    *(_WORD *)&v161[4] = 1024;
                    *(_DWORD *)int8x16_t v162 = v41;
                    *(_WORD *)&v162[4] = 1024;
                    v163[0] = v42;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: %3d %3d %3d %3d ... %3d %3d %3d %3d\n", buf, 0x32u);
                    uint64_t v31 = *v21;
                  }
                  v32 += v31;
                  v33 += v31;
                  --v34;
                }
                while (v34);
              }
            }
          }
          ++v9;
        }
        while (v9 < v2[1153]);
      }
    }
    uint64_t v114 = a2;
    int v43 = v2 + 40;
    float v44 = v136;
    int v45 = *v136;
    unint64_t v111 = (float *)(v2 + 1171);
    bzero(v2 + 1171, 0x400uLL);
    int v100 = v2 + 1427;
    memcpy(v2 + 1427, v2 + 40, 0x1160uLL);
    unint64_t v46 = 0;
    __dst = (char *)(v2 + 35309);
    uint64_t v47 = (uint64_t)(v2 + 51693);
    uint64_t v134 = (uint64_t)(v2 + 84461);
    int16x4x2_t v129 = (int16x8_t *)(v2 + 100845);
    int16x4x2_t v130 = (int16x8_t *)(v2 + 92653);
    int8x16_t v127 = (int16x8_t *)(v2 + 27117);
    int v128 = (int16x8_t *)(v2 + 18925);
    int8x16_t v126 = (int16x8_t *)(v2 + 10731);
    int8x16_t v125 = (int16x8_t *)(v2 + 133613);
    unint64_t v107 = (const __int16 *)(v2 + 18923);
    uint64_t v108 = (uint64_t)(v2 + 125421);
    uint64_t v118 = (uint64_t)(v2 + 135661);
    uint64_t v119 = (int16x8_t *)(v2 + 117229);
    int16x8_t v116 = (int16x8_t *)(v2 + 139757);
    int v117 = (int16x8_t *)(v2 + 137709);
    uint64_t v115 = (int16x8_t *)(v2 + 141805);
    unint64_t v99 = v2;
    unsigned __int16 v105 = (int16x8_t *)(v2 + 145901);
    __int16 v106 = (int16x8_t *)(v2 + 143853);
    char v48 = v104;
    v109 = v2 + 40;
    int v113 = &v2[5 * v45 + 1158];
    int v121 = v2 + 51693;
    int __src = (int16x8_t *)(v2 + 109037);
    do
    {
      if (v43[368 * *v44 + 360 + (void)v46] == 1)
      {
        int16x8_t v49 = &v43[368 * *v44];
        uint64_t v102 = v49[(void)v46 + 84];
        if ((int)v102 >= 1)
        {
          uint64_t v120 = 0;
          int v50 = 0;
          double v51 = (double *)&v49[2 * (void)v46];
          uint64_t v52 = (int)v51[48];
          uint64_t v53 = (int)v51[44];
          uint64_t v112 = v43[368 * *v44 + 80 + (void)v46];
          int16x8_t v110 = &v111[(void)v46];
          if ((int)v53 >= 0) {
            int v54 = (int)v51[44];
          }
          else {
            int v54 = v53 + 1;
          }
          int v55 = v53 + 3;
          if ((int)v53 >= 0) {
            int v55 = v53;
          }
          if ((int)v52 >= 0) {
            int v56 = v52;
          }
          else {
            int v56 = v52 + 1;
          }
          int v141 = v56 >> 1;
          int v57 = v54 >> 1;
          int v139 = v55 >> 2;
          int v137 = (int)v52 / 4;
          uint64_t v122 = v52;
          int v142 = v54 >> 1;
          int16x8_t v123 = v46;
          do
          {
            if ((int)v112 >= 1)
            {
              uint64_t v58 = 0;
              uint64_t v59 = v50;
              do
              {
                uint64_t v124 = v59;
                uint64_t v60 = (uint64_t)&v43[368 * *v44 + 104 + 64 * (void)v46];
                int v132 = (int)*(double *)(v60 + 8 * v120 + 128);
                uint64_t v133 = v58;
                int v131 = (int)*(double *)(v60 + 8 * v58);
                if ((int)v52 >= 1)
                {
                  uint64_t v61 = v52;
                  uint64_t v62 = __dst;
                  unint64_t v46 = v44;
                  int v63 = (int)*(double *)(v60 + 8 * v120 + 128);
                  do
                  {
                    memcpy(v62, (const void *)(*(void *)(v114 + 8 * *v46) + v131 + (*v113 * v63++)), (int)v53);
                    v62 += (int)v53;
                    --v61;
                  }
                  while (v61);
                  uint64_t v64 = 0;
                  uint64_t v47 = (uint64_t)v121;
                  LODWORD(v52) = v122;
                  int v65 = v121;
                  int v66 = (unsigned __int8 *)__dst;
                  float v44 = v46;
                  char v48 = v104;
                  LODWORD(v46) = v123;
                  int v57 = v142;
                  do
                  {
                    if ((int)v53 >= 1)
                    {
                      uint64_t v67 = v53;
                      int v68 = v65;
                      int v69 = v66;
                      do
                      {
                        __int16 v70 = *v69++;
                        *v68++ = 16 * v70;
                        --v67;
                      }
                      while (v67);
                    }
                    ++v64;
                    v66 += (int)v53;
                    v65 += (int)v53;
                  }
                  while (v64 != v122);
                }
                if (v48)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67110144;
                    *(_DWORD *)int8x16_t v157 = v53;
                    *(_WORD *)&v157[4] = 1024;
                    *(_DWORD *)&v157[6] = v52;
                    LOWORD(v158) = 1024;
                    *(_DWORD *)((char *)&v158 + 2) = v46;
                    HIWORD(v158) = 1024;
                    *(_DWORD *)int16x8_t v159 = v120;
                    *(_WORD *)&v159[4] = 1024;
                    *(_DWORD *)int16x8_t v160 = v133;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: PYRYU8[%dx%df][OBJ=%d][Y=%d][X=%d]=[\n", buf, 0x20u);
                  }
                  sub_1000118A4(*(void *)(v114 + 8 * *v44), v131, v132, v53, v52, *v113);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67110144;
                    *(_DWORD *)int8x16_t v157 = v53;
                    *(_WORD *)&v157[4] = 1024;
                    *(_DWORD *)&v157[6] = v52;
                    LOWORD(v158) = 1024;
                    *(_DWORD *)((char *)&v158 + 2) = v46;
                    HIWORD(v158) = 1024;
                    *(_DWORD *)int16x8_t v159 = v120;
                    *(_WORD *)&v159[4] = 1024;
                    *(_DWORD *)int16x8_t v160 = v133;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ROIS16[%dx%df][OBJ=%d][Y=%d][X=%d]=[\n", buf, 0x20u);
                  }
                  sub_100011600(v47, 0, 0, v53, v52, v53);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  sub_100013178(v47, v53, v52, v134, (uint64_t)v130, (uint64_t)v129, (uint64_t)__src, v128, v127, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v141;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height_l1 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v57;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width_l1 = %d\n", buf, 8u);
                  }
                  unint64_t v71 = v44;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: a1 = [\n", buf, 2u);
                  }
                  sub_100011600(v134, 0, 0, v142, v141, v142);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                }
                else
                {
                  unint64_t v71 = v44;
                  sub_100013178(v47, v53, v52, v134, (uint64_t)v130, (uint64_t)v129, (uint64_t)__src, v128, v127, v48);
                }
                int v72 = v142;
                int v73 = v141;
                sub_100012EB8(v130, v129, __src, v142, v141, (uint64_t)v119, v48);
                __int16 v155 = 0;
                sub_100011B24(__src, v142, v141, &v155, v48);
                if (v48)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v155;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d1_median = %d\n", buf, 8u);
                  }
                  uint64_t v75 = (uint64_t)v119;
                  int v76 = v137;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v141;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height_d1 = %d\n", buf, 8u);
                  }
                  int v72 = v142;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v142;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width_d1 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d1 = [\n", buf, 2u);
                  }
                  sub_100011600((uint64_t)__src, 0, 0, v142, v141, v142);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  int v154 = 0;
                  sub_100011DC4(__src, v142, v141, &v155, (__int16 *)&v154 + 1, (__int16 *)&v154, v126, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = SHIWORD(v154);
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d1_mad_median = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = (__int16)v154;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d1_mad_sigma = %d\n", buf, 8u);
                  }
                  int8x16_t v74 = v71;
                  __int16 v153 = 0;
                  int v73 = v141;
                  sub_100011B24(v119, v142, v141, &v153, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v153;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: emap1_median = %d\n", buf, 8u);
                  }
                }
                else
                {
                  int8x16_t v74 = v71;
                  int v154 = 0;
                  sub_100011DC4(__src, v142, v141, &v155, (__int16 *)&v154 + 1, (__int16 *)&v154, v126, v48);
                  __int16 v153 = 0;
                  sub_100011B24(v119, v142, v141, &v153, v48);
                  uint64_t v75 = (uint64_t)v119;
                  int v76 = v137;
                }
                __int16 v152 = 1;
                __int16 v151 = 0;
                sub_100012270(v75, v72, v73, &v153, &v152, &v151, (__int16 *)&v154, v108, v48);
                int v150 = 2;
                sub_10001270C(v108, v72, v73, &v150, (uint64_t)v125, v139, v107, v48);
                float v149 = 0.0;
                sub_100012950(v125, v139, v76, &v149, v48);
                sub_100013178(v134, v72, v73, v118, (uint64_t)v117, (uint64_t)v116, (uint64_t)v115, v128, v127, v48);
                if (v48)
                {
                  uint64_t v47 = (uint64_t)v121;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v76;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height_l2 = %d\n", buf, 8u);
                  }
                  float v44 = v74;
                  uint64_t v77 = (uint64_t)v106;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v139;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width_l2 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: a2 = [\n", buf, 2u);
                  }
                  sub_100011600(v118, 0, 0, v139, v76, v139);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  int v76 = v137;
                  sub_100012EB8(v117, v116, v115, v139, v137, (uint64_t)v106, v48);
                  __int16 v148 = 0;
                  sub_100011B24(v115, v139, v137, &v148, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v148;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d2_median = %d\n", buf, 8u);
                  }
                  uint64_t v79 = v124;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v137;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: height_d2 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v139;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: width_d2 = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d2 = [\n", buf, 2u);
                  }
                  sub_100011600((uint64_t)v115, 0, 0, v139, v137, v139);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
                      buf,
                      2u);
                  }
                  int v147 = 0;
                  int v78 = v139;
                  sub_100011DC4(v115, v139, v137, &v148, (__int16 *)&v147 + 1, (__int16 *)&v147, v126, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = SHIWORD(v147);
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d2_mad_median = %d\n", buf, 8u);
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = (__int16)v147;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: d2_mad_sigma = %d\n", buf, 8u);
                  }
                  __int16 v146 = 0;
                  sub_100011B24(v106, v139, v137, &v146, v48);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int8x16_t v157 = v146;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: emap2_median = %d\n", buf, 8u);
                  }
                }
                else
                {
                  uint64_t v77 = (uint64_t)v106;
                  sub_100012EB8(v117, v116, v115, v139, v76, (uint64_t)v106, v48);
                  __int16 v148 = 0;
                  sub_100011B24(v115, v139, v76, &v148, v48);
                  int v147 = 0;
                  sub_100011DC4(v115, v139, v76, &v148, (__int16 *)&v147 + 1, (__int16 *)&v147, v126, v48);
                  __int16 v146 = 0;
                  sub_100011B24(v106, v139, v76, &v146, v48);
                  uint64_t v47 = (uint64_t)v121;
                  float v44 = v74;
                  int v78 = v139;
                  uint64_t v79 = v124;
                }
                __int16 v145 = 0;
                sub_100012270(v77, v78, v76, &v146, &v152, &v145, (__int16 *)&v147, (uint64_t)v105, v48);
                *(_DWORD *)buf = 0;
                sub_100012950(v105, v78, v137, (float *)buf, v48);
                int v43 = v109;
                float v144 = *(float *)&v109[368 * *v44 + 364 + (void)v123];
                uint64_t v143 = 0;
                unint64_t v46 = v123;
                sub_100012AB0(v125, v105, v78, v137, &v144, (float *)&v143 + 1, (float *)&v143, v48);
                v110[16 * v79] = v149;
                unint64_t v80 = &v111[16 * v79 + (void)v123];
                v80[4] = *(float *)buf;
                v80[8] = *((float *)&v143 + 1);
                *((_DWORD *)v80 + 12) = v143;
                uint64_t v59 = v79 + 1;
                uint64_t v58 = v133 + 1;
                uint64_t v52 = v122;
                int v57 = v142;
              }
              while (v133 + 1 != v112);
              int v50 = v59;
            }
            ++v120;
          }
          while (v120 != v102);
        }
      }
      ++v46;
    }
    while (v46 != (unsigned __int8 *)4);
    if (v44[32])
    {
      uint64_t v81 = 0;
      int16x8_t v82 = (float *)(v99 + 1175);
      int16x8_t v83 = (float *)(v99 + 1179);
      unint64_t v84 = (float *)(v99 + 1183);
      do
      {
        if (v100[368 * *v101 + 360 + v81] == 1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            float v85 = "OTHER";
            if ((unsigned __int16)v81 <= 2u) {
              float v85 = off_100024850[(__int16)v81];
            }
            *(_DWORD *)buf = 136315138;
            *(void *)int8x16_t v157 = v85;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: Output[OBJ=%s]:\n", buf, 0xCu);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: sharpnessL1 = [\n", buf, 2u);
          }
          uint64_t v86 = 0;
          int16x8_t v87 = v111;
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              double v88 = *v87;
              *(_DWORD *)buf = 134218240;
              *(void *)int8x16_t v157 = v86;
              *(_WORD *)&v157[8] = 2048;
              double v158 = v88;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%2zu %010.6f];\n",
                buf,
                0x16u);
            }
            ++v86;
            v87 += 16;
          }
          while (v86 != 16);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
              buf,
              2u);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: sharpnessL2 = [\n", buf, 2u);
          }
          uint64_t v89 = 0;
          float v90 = v82;
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              double v91 = *v90;
              *(_DWORD *)buf = 134218240;
              *(void *)int8x16_t v157 = v89;
              *(_WORD *)&v157[8] = 2048;
              double v158 = v91;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%2zu %010.6f];\n",
                buf,
                0x16u);
            }
            ++v89;
            v90 += 16;
          }
          while (v89 != 16);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
              buf,
              2u);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: blurConf = [\n", buf, 2u);
          }
          uint64_t v92 = 0;
          int v93 = v83;
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              double v94 = *v93;
              *(_DWORD *)buf = 134218240;
              *(void *)int8x16_t v157 = v92;
              *(_WORD *)&v157[8] = 2048;
              double v158 = v94;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%2zu %010.6f];\n",
                buf,
                0x16u);
            }
            ++v92;
            v93 += 16;
          }
          while (v92 != 16);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
              buf,
              2u);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: blurExtent = [\n", buf, 2u);
          }
          uint64_t v95 = 0;
          uint64_t v96 = v84;
          do
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              double v97 = *v96;
              *(_DWORD *)buf = 134218240;
              *(void *)int8x16_t v157 = v95;
              *(_WORD *)&v157[8] = 2048;
              double v158 = v97;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: [%2zu %010.6f];\n",
                buf,
                0x16u);
            }
            ++v95;
            v96 += 16;
          }
          while (v95 != 16);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: ];\n",
              buf,
              2u);
          }
        }
        ++v81;
        ++v111;
        ++v82;
        ++v83;
        ++v84;
      }
      while (v81 != 4);
    }
    int v98 = 0;
    uint64_t v2 = v99;
  }
  else if (a1[1152])
  {
    int v98 = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)int8x16_t v157 = 1;
      *(_WORD *)&v157[4] = 1024;
      *(_DWORD *)&v157[6] = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BlurM: incompatible context version (expected %d, got %d)\n", buf, 0xEu);
    }
  }
  else
  {
    int v98 = 1;
  }
  v2[2] = v98;
}

uint64_t sub_100016154(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, int a5, char a6, const char *a7)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 64) = a3;
  *(void *)(a1 + 72) = a4;
  *(_DWORD *)(a1 + 80) = a5;
  *(unsigned char *)(a1 + 84) = a6;
  strncpy((char *)a1, a2, 0x20uLL);
  if (a7)
  {
    strncpy((char *)(a1 + 32), a7, 0x20uLL);
    *(unsigned char *)(a1 + 63) = 0;
  }
  return a1;
}

BOOL sub_1000161B8(uint64_t a1, const char *a2)
{
  int __ptr = 2;
  strncpy(v9, (const char *)(a1 + 32), 0x20uLL);
  strncpy(v10, (const char *)a1, 0x20uLL);
  long long v11 = *(_OWORD *)(a1 + 64);
  int v4 = *(unsigned __int8 *)(a1 + 84);
  int v12 = *(_DWORD *)(a1 + 80);
  int v13 = v4;
  uint64_t v5 = qword_100031000;
  if ((unint64_t)qword_100031000 <= 0x5B)
  {
    do
    {
      v9[v5 - 4] ^= byte_1000224A0[v5 & 7];
      ++v5;
    }
    while (v5 != 92);
  }
  int v6 = fopen(a2, "w");
  if (v6)
  {
    fwrite(&__ptr, 1uLL, 0x5CuLL, v6);
    fclose(v6);
  }
  return v6 != 0;
}

uint64_t sub_1000162CC(uint64_t a1, char *__filename)
{
  uint64_t result = (uint64_t)fopen(__filename, "r");
  if (result)
  {
    int v4 = (FILE *)result;
    BOOL v5 = fread(&__ptr, 1uLL, 0x24uLL, (FILE *)result) == 36 && __ptr == 2;
    if (v5 && fread(&v9[qword_100031000 - 4], 1uLL, 0x38uLL, v4) == 56)
    {
      uint64_t v6 = qword_100031000;
      if ((unint64_t)qword_100031000 <= 0x5B)
      {
        do
        {
          v9[v6 - 4] ^= byte_1000224A0[v6 & 7];
          ++v6;
        }
        while (v6 != 92);
      }
      strncpy((char *)a1, v10, 0x20uLL);
      *(_OWORD *)(a1 + 64) = v11;
      int v7 = v13;
      *(_DWORD *)(a1 + 80) = v12;
      *(unsigned char *)(a1 + 84) = v7 != 0;
      strncpy((char *)(a1 + 32), v9, 0x20uLL);
      *(unsigned char *)(a1 + 63) = 0;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100016418()
{
  v0 = +[NSFileManager defaultManager];
  uint64_t v1 = +[NSString stringWithUTF8String:"/var/mobile/Documents/Pearl/ProjectorValid.bin"];
  if ([(NSFileManager *)v0 fileExistsAtPath:v1]
    && (id v11 = 0, ![(NSFileManager *)v0 removeItemAtPath:v1 error:&v11]))
  {
    NSLog(@"Failed to remove %s token: %@", "Pearl", [v11 description]);
    return 0;
  }
  else
  {
    sub_1000164C4("token was removed", v2, v3, v4, v5, v6, v7, v8, v10);
    return 1;
  }
}

void sub_1000164C4(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char v10 = objc_opt_new();
  [v10 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  int v11 = snprintf(__str, 0x800uLL, "[%s] ", (const char *)[v10 stringFromDate:[NSDate date]]);

  uint64_t v12 = vsnprintf(&__str[v11], 0x800uLL, a1, &a9) + (uint64_t)v11;
  v15[0] = 0;
  v15[1] = &a9;
  if (vasprintf(v15, a1, &a9) >= 1) {
    NSLog(@"%s", v15[0]);
  }
  if (v15[0])
  {
    free(v15[0]);
    v15[0] = 0;
  }
  *(_WORD *)&__str[v12] = 10;
  int v13 = fopen("/var/mobile/Documents/Tokens.log", "a");
  if (v13)
  {
    int v14 = v13;
    fwrite(__str, v12 + 1, 1uLL, v13);
    fclose(v14);
  }
  else
  {
    NSLog(@"Failed to open token log file.");
  }
}

BOOL sub_10001663C(char *a1)
{
  CFNumberRef v2 = (const __CFNumber *)MGCopyAnswer();
  CFNumberRef v3 = v2;
  if (v2)
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue(v2, kCFNumberSInt64Type, &valuePtr);
    sprintf(a1, "%lld", valuePtr);
    CFRelease(v3);
  }
  else
  {
    NSLog(@"Failed to read unique chip identifier");
  }
  return v3 != 0;
}

uint64_t sub_1000166C8(uint64_t a1, time_t *a2)
{
  if (![+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:+[NSString stringWithUTF8String:"/var/mobile/Documents/Pearl/ProjectorValid.bin"]])
  {
    double v51 = "Pearl";
    int v27 = "Can't activate %s projector: no projector token found";
LABEL_6:
    sub_1000164C4(v27, v3, v4, v5, v6, v7, v8, v9, (char)v51);
    return 0;
  }
  uint64_t v10 = nullsub_3(__s2);
  if ((sub_1000162CC(v10, "/var/mobile/Documents/Pearl/ProjectorValid.bin") & 1) == 0)
  {
    sub_1000164C4("Failed to read %s projector token file. Token will be removed.", v11, v12, v13, v14, v15, v16, v17, (char)"Pearl");
    goto LABEL_14;
  }
  time_t v18 = time(0);
  time_t v26 = v58;
  if (v18 > v58)
  {
    sub_1000164C4("%s token timeout was reached (current time %ld). Token will be removed.", v19, v20, v21, v22, v23, v24, v25, (char)"Pearl");
LABEL_14:
    sub_100016418();
    return 0;
  }
  if (v18 > v57 + 43200)
  {
    sub_1000164C4("%s token has exceeded max allowed timeout. Token will be removed.", v19, v20, v21, v22, v23, v24, v25, (char)"Pearl");
    goto LABEL_14;
  }
  if (!sub_10001663C(__s1))
  {
    int v27 = "Failed to read unique chip ID";
    goto LABEL_6;
  }
  if (strcmp(__s1, __s2))
  {
    sub_1000164C4("%s token does not match device. Token will be removed.", v28, v29, v30, v31, v32, v33, v34, (char)"Pearl");
    goto LABEL_14;
  }
  if (v60)
  {
    uint64_t v36 = sub_100016940();
    if (v36 == -1 || v36 > v57)
    {
      sub_1000164C4("System performed boot since %s token creation (boot time: %ld). Token will be removed.", v28, v29, v30, v31, v32, v33, v34, (char)"Pearl");
      goto LABEL_14;
    }
  }
  if (!v59)
  {
    sub_1000164C4("Number of allowed activations has reached zero. %s token will be removed.", v28, v29, v30, v31, v32, v33, v34, (char)"Pearl");
    goto LABEL_14;
  }
  if (v59 >= 1)
  {
    sub_1000161B4(v52, __s2, v57, v58, (v59 - 1), v60, &v56);
    if (v53)
    {
      if (!sub_1000161B8((uint64_t)v52, "/var/mobile/Documents/Pearl/ProjectorValid.bin"))
      {
        sub_1000164C4("Failed to update %s token file. Will return false so someone looks at that...", v44, v45, v46, v47, v48, v49, v50, (char)"Pearl");
        return 0;
      }
      sub_1000164C4("%s token activation count updated to %d", v44, v45, v46, v47, v48, v49, v50, (char)"Pearl");
    }
    else
    {
      sub_1000164C4("Using last allowed activation. %s token will be removed.", v37, v38, v39, v40, v41, v42, v43, (char)"Pearl");
      sub_100016418();
    }
  }
  if (a2) {
    *a2 = v26;
  }
  return 1;
}

uint64_t sub_100016940()
{
  *(void *)uint64_t v4 = 0x1500000001;
  size_t v2 = 16;
  if (sysctl(v4, 2u, &v3, &v2, 0, 0) || (uint64_t result = v3) == 0)
  {
    uint64_t v1 = __error();
    NSLog(@"Failed to read boot time. errno %d", *v1);
    return -1;
  }
  return result;
}

double sub_1000169E0(double *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = (a3 - a2) / a6 - (a4 - a2) / (a6 + a7);
  double v9 = (a4 - a3) / a7;
  *(float *)&double v8 = v9 + v8;
  float v10 = (a5 - a4) / a8 + v9 - (a5 - a3) / (a7 + a8);
  *(float *)&double v8 = *(float *)&v8 * a7;
  float v11 = v10 * a7;
  double v12 = *(float *)&v8;
  double v13 = v11;
  *a1 = a3;
  a1[1] = v12;
  double v14 = a4 * 3.0 + a3 * -3.0 + v12 * -2.0 - v13;
  double result = a4 * -2.0 + a3 * 2.0 + v12 + v13;
  a1[2] = v14;
  a1[3] = result;
  return result;
}

double sub_100016A84(double *a1, double *a2, double a3)
{
  sub_1000169E0(v5, *a1, a1[1], a1[2], a1[3], a2[1] - *a2, a2[2] - a2[1], a2[3] - a2[2]);
  return v5[0] + a3 * (v5[1] + a3 * (v5[2] + v5[3] * a3));
}

void sub_100016AE4(double *a1, double *a2, double *a3, double a4, double a5)
{
  v10[0] = sub_100016A84(a1, a3, a5);
  v10[1] = sub_100016A84(a1 + 4, a3, a5);
  v10[2] = sub_100016A84(a1 + 8, a3, a5);
  uint64_t v10[3] = sub_100016A84(a1 + 12, a3, a5);
  sub_100016A84(v10, a2, a4);
}

void sub_100016BB4(unsigned __int16 *a1, long double *a2, unsigned int a3)
{
  uint64_t v3 = a1[7];
  if (a1[7])
  {
    int v6 = 0;
    uint64_t v7 = a1[6];
    double v8 = (double)(*a1 + 1) * 0.5;
    double v9 = (double)(a1[1] + 1) * 0.5;
    double v10 = 0.0;
    do
    {
      if (a1[6])
      {
        unsigned int v11 = a1[4];
        double v12 = (double)(a1[5] + v6 * a1[3]) - v9;
        double v13 = v12 * v12;
        int v14 = a1[6];
        do
        {
          double v15 = sqrt(((double)v11 - v8) * ((double)v11 - v8) + v13);
          if (v15 > v10) {
            double v10 = v15;
          }
          v11 += a1[2];
          --v14;
        }
        while (v14);
      }
      ++v6;
    }
    while (v6 != v3);
    long double v16 = pow((double)a3 / 100.0, 0.25);
    uint64_t v17 = 0;
    do
    {
      if (v7)
      {
        unsigned int v18 = a1[4];
        int v19 = a1[2];
        unsigned int v20 = a1[5] + v17 * a1[3];
        double v21 = ((double)v20 - v9) * ((double)v20 - v9);
        long double v22 = acos(v16);
        uint64_t v23 = v7;
        uint64_t v24 = a2;
        double v25 = v10 / tan(v22);
        do
        {
          long double v26 = atan(sqrt(((double)v18 - v8) * ((double)v18 - v8) + v21) / v25);
          long double v27 = cos(v26);
          *v24++ = pow(v27, 4.0);
          v18 += v19;
          --v23;
        }
        while (v23);
      }
      ++v17;
      a2 += v7;
    }
    while (v17 != v3);
  }
}

void sub_100016D4C(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4, int a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  uint64_t v72 = a3[7];
  if (a3[7])
  {
    int v71 = a3[3];
    int v15 = a3[2];
    int v70 = a3[5];
    uint64_t v16 = a4 + 56;
    uint64_t v17 = a4 + 140;
    int v18 = a3[4];
    uint64_t v19 = a3[6];
    int v76 = v18;
    uint64_t v77 = a2 - 2;
    uint64_t v75 = v19;
    uint64_t v73 = 0;
    int v74 = v15;
    while (!v19)
    {
LABEL_44:
      if (++v73 == v72) {
        return;
      }
    }
    uint64_t v20 = 0;
    double v21 = (double)(v70 + v73 * v71);
    uint64_t v22 = *(unsigned __int16 *)(a4 + 40);
    uint64_t v23 = *(unsigned __int16 *)(a4 + 42);
    uint64_t v24 = v73 * v19;
    while (1)
    {
      double v25 = (double)(v18 + v20 * v15);
      if (v22)
      {
        uint64_t v26 = 0;
        LOWORD(a7) = *(_WORD *)a4;
        *(float *)&a7 = (float)LODWORD(a7);
        while (v25 >= (float)(*(float *)(v16 + 4 * v26) * *(float *)&a7))
        {
          if (v22 == ++v26)
          {
            LOWORD(v26) = v22;
            if (v23) {
              goto LABEL_12;
            }
            goto LABEL_17;
          }
        }
        if (v23) {
          goto LABEL_12;
        }
      }
      else
      {
        LOWORD(v26) = 0;
        if (v23)
        {
LABEL_12:
          uint64_t v27 = 0;
          LOWORD(a7) = *(_WORD *)(a4 + 2);
          *(float *)&a7 = (float)LODWORD(a7);
          while (v21 >= (float)(*(float *)(v17 + 4 * v27) * *(float *)&a7))
          {
            if (v23 == ++v27)
            {
              unsigned __int16 v28 = v23;
              goto LABEL_19;
            }
          }
          unsigned __int16 v28 = v27;
          goto LABEL_19;
        }
      }
LABEL_17:
      unsigned __int16 v28 = 0;
LABEL_19:
      uint64_t v29 = (unsigned __int16)v26;
      uint64_t v30 = (unsigned __int16)v26 - 1;
      double v31 = (double)(int)v30;
      unsigned int v32 = v28;
      uint64_t v33 = v28 - 1;
      double v34 = (double)(int)v33;
      if (v29 < 2
        || (signed int v35 = v32 - 2, v32 < 2)
        || ((double)v22 + -3.0 >= v31 ? (BOOL v36 = a5 == 0) : (BOOL v36 = 1),
            !v36 ? (BOOL v37 = (double)v23 + -3.0 < v34) : (BOOL v37 = 1),
            v37))
      {
        if (!v29) {
          double v31 = 0.0;
        }
        if (!v32) {
          double v34 = 0.0;
        }
        if (v31 >= (double)((int)v22 - 2)) {
          double v31 = (double)((int)v22 - 2);
        }
        unsigned int v52 = vcvtmd_u64_f64(v31);
        if (v34 >= (double)((int)v23 - 2)) {
          double v53 = (double)((int)v23 - 2);
        }
        else {
          double v53 = v34;
        }
        unsigned int v54 = vcvtmd_u64_f64(v53);
        unsigned int v55 = v52 + v54 * v22;
        LOBYTE(v53) = *(unsigned char *)(a2 + v55);
        double v56 = *(double *)(a4 + 48);
        double v57 = (double)*(unint64_t *)&v53 / v56;
        LOBYTE(a9) = *(unsigned char *)(a2 + v55 + 1);
        double v58 = (double)*(unint64_t *)&a9 / v56;
        unsigned int v59 = v52 + (v54 + 1) * v22;
        LOBYTE(a10) = *(unsigned char *)(a2 + v59);
        double v60 = (double)*(unint64_t *)&a10 / v56;
        LOBYTE(a11) = *(unsigned char *)(a2 + v59 + 1);
        double v61 = (double)*(unint64_t *)&a11 / v56;
        LOWORD(a12) = *(_WORD *)a4;
        float v62 = (float)LODWORD(a12);
        float v63 = roundf(*(float *)(a4 + 56 + 4 * v52) * v62);
        LOWORD(v12) = *(_WORD *)(a4 + 2);
        float v64 = (float)LODWORD(v12);
        double v65 = roundf(*(float *)(a4 + 140 + 4 * v54) * v64);
        a12 = roundf(*(float *)(a4 + 56 + 4 * (v52 + 1)) * v62);
        double v12 = roundf(*(float *)(a4 + 140 + 4 * (v54 + 1)) * v64);
        a11 = v25 - v63;
        double v66 = a12 - v25;
        double v67 = v60 * v66 + a11 * v61;
        a10 = a11 + v66;
        double v68 = v67 / (a11 + v66);
        double v69 = (v57 * v66 + a11 * v58) / (a11 + v66);
        a9 = v12 - v21;
        a7 = v21 - v65 + v12 - v21;
        *(double *)(a1 + 8 * (v24 + v20)) = fmax(fmin(((v12 - v21) * v69 + (v21 - v65) * v68) / a7, 1.0), 0.0);
      }
      else
      {
        uint64_t v38 = 0;
        double v39 = *(double *)(a4 + 48);
        uint64_t v40 = v35;
        uint64_t v41 = (unsigned char *)(v77 + v29 + (int)v22 * (uint64_t)v35);
        uint64_t v42 = v82;
        do
        {
          uint64_t v43 = 0;
          v81[v38] = *(float *)(a4 + 4 * (v38 + (int)v29 - 2) + 56);
          double v44 = *(float *)(a4 + 4 * (v38 + v40) + 140);
          v80[v38] = v44;
          uint64_t v45 = v41;
          do
          {
            LOBYTE(v44) = *v45;
            double v44 = (double)*(unint64_t *)&v44 / v39;
            v42[v43] = v44;
            v45 += v22;
            ++v43;
          }
          while (v43 != 4);
          ++v38;
          ++v41;
          v42 += 4;
        }
        while (v38 != 4);
        LOWORD(v39) = *(_WORD *)a4;
        double v46 = v25 / (double)*(unint64_t *)&v39;
        float v47 = *(float *)(a4 + 56 + 4 * v30);
        double v48 = v46 - v47;
        *(double *)&unint64_t v49 = (float)(*(float *)(a4 + 56 + 4 * v29) - v47);
        double v50 = v48 / *(double *)&v49;
        LOWORD(v49) = *(_WORD *)(a4 + 2);
        sub_100016AE4(v82, v81, v80, v50, (v21 / (double)v49 - *(float *)(a4 + 140 + 4 * v33))/ (float)(*(float *)(a4 + 140 + 4 * v32) - *(float *)(a4 + 140 + 4 * v33)));
        *(void *)(a1 + 8 * (v24 + v20)) = v51;
        int v15 = v74;
        uint64_t v19 = v75;
        int v18 = v76;
      }
      if (++v20 == v19) {
        goto LABEL_44;
      }
    }
  }
}

uint64_t sub_100017198(uint64_t result, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, int a7)
{
  unsigned int v7 = *(unsigned __int16 *)(a5 + 14);
  if (*(_WORD *)(a5 + 14))
  {
    unsigned __int16 v8 = 0;
    unsigned int v9 = 0;
    unsigned int v10 = *(unsigned __int16 *)(a5 + 12);
    do
    {
      if (v10)
      {
        for (unsigned int i = 0; i < v10; ++i)
        {
          uint64_t v12 = i + v9 * v10;
          int v13 = 1 << a6;
          if (a7 != 2) {
            LOWORD(v13) = llround(fmin(*(double *)(a3 + 8 * v12) / *(double *)(a4 + 8 * v12) * (double)(1 << a6), 65535.0));
          }
          *(_WORD *)(result + 2 * v12) = v13;
          if ((unsigned __int16)v13 > v8) {
            unsigned __int16 v8 = v13;
          }
          unsigned int v10 = *(unsigned __int16 *)(a5 + 12);
        }
        unsigned int v7 = *(unsigned __int16 *)(a5 + 14);
      }
      ++v9;
    }
    while (v9 < v7);
  }
  else
  {
    unsigned __int16 v8 = 0;
  }
  *a2 = v8;
  return result;
}

void sub_100017234(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(unsigned __int16 *)(a1 + 14) >> 1;
  __int16 v23 = *(_WORD *)(a1 + 14) >> 1;
  int v9 = *(unsigned __int16 *)(a1 + 16) >> 1;
  __int16 v24 = *(_WORD *)(a1 + 16) >> 1;
  if (a3)
  {
    int v10 = 0;
    do
    {
      v22[v10] = *(_DWORD *)(a7 + 4 * v10);
      ++v10;
    }
    while (a3 > v10);
  }
  if (a4)
  {
    int v11 = 0;
    do
    {
      v22[v11 + 21] = *(_DWORD *)(a8 + 4 * v11);
      ++v11;
    }
    while (a4 > v11);
  }
  uint64_t v29 = a1 + 18;
  uint64_t v30 = a1 + 36;
  uint64_t v31 = a1 + 54;
  uint64_t v32 = a1 + 72;
  __int16 v15 = v8;
  __int16 v16 = v9;
  int64x2_t v17 = vdupq_n_s64(0x3F847AE147AE147BuLL);
  __int16 v19 = a3;
  __int16 v20 = a4;
  int32x2_t v12 = vadd_s32((int32x2_t)__PAIR64__(a4, a3), (int32x2_t)-1);
  v13.i64[0] = v12.i32[0];
  v13.i64[1] = v12.i32[1];
  float64x2_t v18 = vdivq_f64((float64x2_t)vdupq_n_s64(0x3FEF5C28F5C28F5CuLL), vcvtq_f64_s64(v13));
  uint64_t v21 = 0x406F400000000000;
  int v14 = *(_DWORD *)(a1 + 28);
  int v25 = *(_DWORD *)(a1 + 20);
  int v26 = v14;
  __int16 v27 = *(_WORD *)(a1 + 32);
  __int16 v28 = *(_WORD *)(a1 + 34);
  operator new[]();
}

uint64_t sub_1000174A8(uint64_t result)
{
  uint64_t v1 = 0;
  v9[0] = result + 18;
  v9[1] = result + 36;
  v9[2] = result + 54;
  v9[3] = result + 72;
  do
  {
    size_t v2 = (unsigned __int16 *)v9[v1];
    int64_t v3 = ((unint64_t)(v2[7] * v2[8]) << 32) - 0x100000000;
    if (v3 >= 1)
    {
      uint64_t v4 = v2[3];
      uint64_t v5 = (_WORD *)(result + 92 + 2 * v4);
      unint64_t v6 = result + 90 + (((unint64_t)v3 >> 31) & 0x1FFFFFFFELL) + 2 * v4;
      do
      {
        __int16 v7 = *(_WORD *)(v6 + 2);
        *(_WORD *)(v6 + 2) = *v5;
        *v5++ = v7;
        BOOL v8 = v6 > (unint64_t)v5;
        v6 -= 2;
      }
      while (v8);
    }
    ++v1;
  }
  while (v1 != 4);
  return result;
}

void sub_10001757C()
{
}

unint64_t sub_10001770C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  uint64_t v4 = a1[1] * *a1;
  uint64_t v5 = (v4 - 1);
  uint64_t v6 = a2 + v5;
  __int16 v7 = a1 + 156;
  BOOL v8 = &a1[v5 + 156];
  do
  {
    int v9 = v7;
    int v10 = v8;
    uint64_t v11 = a2;
    uint64_t v12 = v6;
    do
    {
      *(unsigned char *)(v11 + v2) = v10[v2];
      unint64_t result = v11 + v2 + 1;
      *(unsigned char *)(v12 + v2) = v9[v2];
      --v12;
      ++v11;
      --v10;
      ++v9;
    }
    while (v12 + v2 >= result);
    ++v3;
    v2 += v4;
  }
  while (v3 != 4);
  return result;
}

unsigned __int16 *sub_100017784(unsigned __int16 *result)
{
  int v1 = result[16];
  if (v1 != result[43]) {
    sub_10001E334();
  }
  int v2 = result[17];
  if (v2 != result[44]) {
    sub_10001E308();
  }
  unsigned int v3 = v2 * v1;
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = &result[result[39] + 46];
    uint64_t v6 = &result[result[12] + 46];
    do
    {
      unsigned int v7 = (*v5 + *v6) >> 1;
      *v6++ = v7;
      *v5++ = v7;
      ++v4;
    }
    while (v3 > (unsigned __int16)v4);
  }
  return result;
}

uint64_t sub_100017804(uint64_t a1, uint64_t a2, double a3)
{
  LOWORD(a3) = *(_WORD *)(a2 + 14);
  *(double *)&unint64_t v5 = (double)*(unint64_t *)&a3;
  double v6 = *(double *)&v5 * 0.5;
  LOWORD(v5) = *(_WORD *)(a2 + 16);
  double v7 = (double)v5 * 0.5;
  memset(v45, 0, 32);
  bzero(v44, 0x808uLL);
  uint64_t v8 = 0;
  float v9 = v6;
  v43[0] = a2 + 18;
  v43[1] = a2 + 36;
  v43[2] = a2 + 54;
  v43[3] = a2 + 72;
  do
  {
    v45[v8] = a2 + 92 + 2 * *(unsigned __int16 *)(v43[v8] + 6);
    ++v8;
  }
  while (v8 != 4);
  float v10 = v7;
  float v11 = sqrt(v9 * v9 + v10 * v10);
  float v12 = log2f(v11 * 0.0039062);
  uint64_t v16 = 0;
  *(_WORD *)(a1 + 12) = vcvtps_s32_f32(v12);
  do
  {
    uint64_t v17 = 0;
    float64x2_t v18 = (unsigned __int16 *)v43[v16];
    unsigned int v19 = v18[1];
    unsigned int v20 = v18[2];
    int v21 = v18[7];
    double v22 = (double)(v18[8] - 2);
    uint64_t result = v45[v16];
    do
    {
      uint64_t v24 = 0;
      float v25 = (float)dword_1000224B0[v17];
      float v26 = (float)dword_1000224C0[v17];
      do
      {
        float v27 = (float)(v11 * (float)v24) * 0.0039062;
        double v28 = (float)(v9 + (float)(v25 * (float)((float)(v9 / v11) * v27))) * 0.5;
        double v29 = (float)(v10 + (float)(v26 * (float)((float)(v10 / v11) * v27))) * 0.5;
        if (v28 < 0.0) {
          double v28 = 0.0;
        }
        if (v29 < 0.0) {
          double v29 = 0.0;
        }
        unsigned int v30 = (v29 / (double)v20);
        double v31 = (double)(v28 / (double)v19);
        if (v31 >= (double)(v21 - 2)) {
          double v31 = (double)(v21 - 2);
        }
        unsigned int v32 = v31;
        double v33 = (double)v30;
        if ((double)v30 >= v22) {
          double v33 = v22;
        }
        unsigned int v34 = v33;
        signed int v35 = (_WORD *)(result + 2 * v33 * v21 + 2 * v32);
        LOWORD(v33) = *v35;
        LOWORD(v13) = v35[1];
        double v13 = (float)((float)LODWORD(v13) * 0.00012207);
        BOOL v36 = (_WORD *)(result + 2 * (v34 + 1) * v21 + 2 * v32);
        LOWORD(v14) = *v36;
        LOWORD(v15) = v36[1];
        unsigned int v37 = v32 * v19;
        double v38 = v28 - (double)v37;
        double v39 = (double)(v19 + v37) - v28;
        double v40 = v39 * (float)((float)LODWORD(v14) * 0.00012207) + v38 * (float)((float)LODWORD(v15) * 0.00012207);
        double v15 = v38 + v39;
        double v14 = v40 / (v38 + v39);
        v44[v24] = v44[v24]
                 + 1.0
                 / sqrt((((double)((v34 + 1) * v20) - v29)* ((v39 * (float)((float)LODWORD(v33) * 0.00012207) + v38 * v13)/ (v38 + v39))+ (v29 - (double)(v34 * v20)) * v14)/ (v29 - (double)(v34 * v20) + (double)((v34 + 1) * v20) - v29));
        ++v24;
      }
      while (v24 != 257);
      ++v17;
    }
    while (v17 != 4);
    ++v16;
  }
  while (v16 != 4);
  for (uint64_t i = 0; i != 257; ++i)
  {
    double v42 = v44[i] * 0.0625;
    v44[i] = v42;
    *(_WORD *)(a1 + 14 + 2 * i) = vcvtd_n_s64_f64(v42, 0xCuLL);
  }
  return result;
}

uint64_t sub_100017B38(uint64_t a1, _DWORD *a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 96);
  if (!v2) {
    return 3758097084;
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(v2, 0x27u, 0, 0, &output, &outputCnt);
  if (!result) {
    *a2 = output;
  }
  return result;
}

uint64_t sub_100017BA4(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 416)) {
    return 3758097112;
  }
  __src[0] = 0x300000000uLL;
  DWORD2(__src[1]) = 0;
  *(void *)&__src[1] = 0;
  uint64_t v2 = sub_100017F64(a1, (uint64_t)__src, 0x1Cu, 0, 0xFFFFFFFF);
  if (!v2)
  {
    *(_OWORD *)(a1 + 376) = __src[0];
    *(_OWORD *)(a1 + 388) = *(_OWORD *)((char *)__src + 12);
    printf("H10ISP: maxChannels=%d, timeStampFrequency=%d\n", HIDWORD(__src[0]), DWORD2(__src[0]));
    if (!*(void *)(a1 + 408)) {
      operator new[]();
    }
    LODWORD(v3) = *(_DWORD *)(a1 + 416);
    if (!v3)
    {
LABEL_23:
      uint64_t v2 = 0;
      *(_DWORD *)(a1 + 368) = v3;
      *(unsigned char *)(a1 + 372) = 1;
      return v2;
    }
    unint64_t v4 = 0;
    while (1)
    {
      long long v23 = 0u;
      memset(v24, 0, sizeof(v24));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v12 = 0u;
      memset(__src, 0, sizeof(__src));
      WORD2(__src[0]) = 269;
      DWORD2(__src[0]) = v4;
      uint64_t v2 = sub_100017F64(a1, (uint64_t)__src, 0xFCu, 0, 0xFFFFFFFF);
      if (v2) {
        break;
      }
      unint64_t v5 = (_DWORD *)(*(void *)(a1 + 408) + 280 * v4);
      _DWORD *v5 = v16;
      memmove(v5 + 6, __src, 0xFCuLL);
      uint64_t v6 = *(void *)(a1 + 408);
      if (*(_DWORD *)(v6 + 280 * v4))
      {
        if (!*(void *)(v6 + 280 * v4 + 8) && !*(void *)(v6 + 280 * v4 + 16)) {
          operator new[]();
        }
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        unint64_t v9 = 0;
        while (1)
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          __src[1] = 0u;
          long long v12 = 0u;
          *(void *)&__src[0] = 0x10600000000;
          *((void *)&__src[0] + 1) = __PAIR64__(v9, v4);
          uint64_t v2 = sub_100017F64(a1, (uint64_t)__src, 0xB0u, 0, 0xFFFFFFFF);
          if (v2) {
            break;
          }
          if ((BYTE12(__src[1]) & 0x80) != 0) {
            WORD6(__src[1]) = (WORD6(__src[1]) & 0xFF00) + 256;
          }
          memmove((void *)(*(void *)(*(void *)(a1 + 408) + 280 * v4 + 8) + v8), &__src[1], 0xA0uLL);
          *(void *)&__src[0] = 0x14200000000;
          __src[1] = 0u;
          long long v12 = 0u;
          long long v13 = 0u;
          *(void *)&long long v14 = 0;
          *((void *)&__src[0] + 1) = __PAIR64__(v9, v4);
          uint64_t v2 = sub_100017F64(a1, (uint64_t)__src, 0x48u, 0, 0xFFFFFFFF);
          if (v2) {
            break;
          }
          memmove((void *)(*(void *)(*(void *)(a1 + 408) + 280 * v4 + 16) + v7), __src, 0x48uLL);
          ++v9;
          v8 += 160;
          v7 += 72;
          if (v9 >= *(unsigned int *)(*(void *)(a1 + 408) + 280 * v4)) {
            goto LABEL_20;
          }
        }
      }
      else
      {
LABEL_20:
        uint64_t v2 = 0;
      }
      ++v4;
      unint64_t v3 = *(unsigned int *)(a1 + 416);
      if (v4 >= v3)
      {
        if (v2) {
          break;
        }
        goto LABEL_23;
      }
    }
  }
  sub_10001805C(a1);
  return v2;
}

uint64_t sub_100017F64(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  kdebug_trace();
  mach_port_t v10 = *(_DWORD *)(a1 + 96);
  if (v10)
  {
    input[0] = a2;
    input[1] = a3;
    input[2] = a4;
    input[3] = a5;
    uint64_t v11 = IOConnectCallScalarMethod(v10, 0xAu, input, 4u, 0, 0);
  }
  else
  {
    uint64_t v11 = 3758097084;
  }
  kdebug_trace();
  return v11;
}

uint64_t sub_10001805C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 372))
  {
    *(unsigned char *)(a1 + 372) = 0;
    *(_DWORD *)(a1 + 368) = 0;
    uint64_t v2 = *(void **)(a1 + 408);
    if (v2)
    {
      if (!*(_DWORD *)(a1 + 416)) {
        goto LABEL_11;
      }
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = *(void *)(a1 + 408);
        uint64_t v6 = *(void **)(v5 + v3 + 8);
        if (v6)
        {
          operator delete[](v6);
          uint64_t v5 = *(void *)(a1 + 408);
          *(void *)(v5 + v3 + 8) = 0;
        }
        uint64_t v7 = *(void **)(v5 + v3 + 16);
        if (v7)
        {
          operator delete[](v7);
          uint64_t v5 = *(void *)(a1 + 408);
          *(void *)(v5 + v3 + 16) = 0;
        }
        uint64_t v8 = v5 + v3;
        *(_DWORD *)uint64_t v8 = 0;
        *(_OWORD *)(v8 + 40) = 0u;
        *(_OWORD *)(v8 + 56) = 0u;
        *(_OWORD *)(v8 + 72) = 0u;
        *(_OWORD *)(v8 + 88) = 0u;
        *(_OWORD *)(v8 + 104) = 0u;
        *(_OWORD *)(v8 + 120) = 0u;
        *(_OWORD *)(v8 + 136) = 0u;
        *(_OWORD *)(v8 + 152) = 0u;
        *(_OWORD *)(v8 + 168) = 0u;
        *(_OWORD *)(v8 + 184) = 0u;
        *(_OWORD *)(v8 + 200) = 0u;
        *(_OWORD *)(v8 + 216) = 0u;
        *(_OWORD *)(v8 + 232) = 0u;
        *(_OWORD *)(v8 + 248) = 0u;
        *(_OWORD *)(v8 + 24) = 0u;
        *(_OWORD *)(v8 + 260) = 0u;
        ++v4;
        v3 += 280;
      }
      while (v4 < *(unsigned int *)(a1 + 416));
      uint64_t v2 = *(void **)(a1 + 408);
      if (v2) {
LABEL_11:
      }
        operator delete[](v2);
      *(void *)(a1 + 408) = 0;
    }
  }
  return 0;
}

uint64_t sub_10001815C(uint64_t a1, void *a2)
{
  uint64_t v2 = 3758097085;
  CFErrorRef err = 0;
  uint64_t result = 3758097090;
  if (a2 && !*a2)
  {
    CFURLRef v5 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/usr/local/share/firmware/isp/ISPUnitInfo.plist", kCFURLPOSIXPathStyle, 0);
    if (v5)
    {
      CFURLRef v6 = v5;
      CFPropertyListFormat format = 0;
      uint64_t v7 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v5);
      if (v7)
      {
        uint64_t v8 = v7;
        if (CFReadStreamOpen(v7))
        {
          fwrite("Parsing ISPUnitInfo.plist \n", 0x1BuLL, 1uLL, __stderrp);
          CFPropertyListRef v9 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v8, 0, 0, &format, &err);
          if (err)
          {
            puts("Failure loading override ISPUnitInfo property list : CFPropertyListCreateWithStream failed ");
            CFStringRef v10 = CFErrorCopyDescription(err);
            if (v10)
            {
              CFStringRef v11 = v10;
              CFShow(v10);
              CFRelease(v11);
            }
          }
          else
          {
            uint64_t v2 = 0;
            *a2 = v9;
          }
        }
        else
        {
          uint64_t v2 = 3758097136;
        }
        CFReadStreamClose(v8);
        CFRelease(v8);
      }
      CFRelease(v6);
      return v2;
    }
    else
    {
      return 3758097085;
    }
  }
  return result;
}

uint64_t sub_1000182A4(uint64_t a1)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = *(unsigned int *)(a1 + 96);
  if (result) {
    return !IOConnectCallScalarMethod(result, 5u, 0, 0, &output, &outputCnt) && output == 1;
  }
  return result;
}

uint64_t sub_1000182FC(uint64_t a1, unsigned int a2, void *outputStruct)
{
  size_t v5 = 1688;
  mach_port_t v3 = *(_DWORD *)(a1 + 96);
  if (!v3) {
    return 3758097084;
  }
  uint64_t input = a2;
  return IOConnectCallMethod(v3, 0xEu, &input, 1u, 0, 0, 0, 0, outputStruct, &v5);
}

uint64_t sub_100018390(uint64_t a1, _DWORD *a2, double *a3)
{
  if (!*(unsigned char *)(a1 + 372)) {
    return 3758097112;
  }
  mach_timebase_info(&info);
  uint64_t result = 0;
  *a2 = *(_DWORD *)(a1 + 384);
  LODWORD(v7) = *(_DWORD *)(a1 + 384);
  LODWORD(v8) = info.numer;
  *a3 = 1.0 / (double)v7 * 1000000000.0 * ((double)(info.denom | 0x41CDCD6500000000uLL) / (double)v8);
  return result;
}

uint64_t sub_100018424(uint64_t a1, int a2, int a3, int a4, unsigned int a5)
{
  uint64_t v12 = 0x12200000000;
  int v13 = a2;
  int v14 = a3;
  int v15 = a4;
  uint64_t v7 = sub_100017F64(a1, (uint64_t)&v12, 0x14u, 0, a5);
  uint64_t v8 = v7;
  if (a3 == 6914 && !v7)
  {
    if (*(_DWORD *)(a1 + 416))
    {
      unsigned int v9 = 0;
      while (1)
      {
        uint64_t v10 = sub_1000184DC(a1, v9);
        if (v10) {
          break;
        }
        if (++v9 >= *(_DWORD *)(a1 + 416)) {
          return 0;
        }
      }
      uint64_t v8 = v10;
      printf("WritePropertyValue - UpdateChannelConfigCache channel %d error: 0x%08X\n", v9, v10);
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

uint64_t sub_1000184DC(uint64_t a1, unsigned int a2)
{
  memset(v6, 0, 252);
  WORD2(v6[0]) = 269;
  DWORD2(v6[0]) = a2;
  uint64_t v4 = sub_100017F64(a1, (uint64_t)v6, 0xFCu, 0, 0xFFFFFFFF);
  if (!v4) {
    memmove((void *)(*(void *)(a1 + 408) + 280 * a2 + 24), v6, 0xFCuLL);
  }
  return v4;
}

uint64_t sub_1000185AC(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = 3758097090;
  if (*(_DWORD *)(a1 + 416) > a2 && a3 <= 0x40)
  {
    memset(v8, 0, sizeof(v8));
    WORD2(v8[0]) = 1285;
    DWORD2(v8[0]) = a2;
    WORD6(v8[0]) = a3;
    if (a3)
    {
      for (uint64_t i = 0; i != a3; ++i)
      {
        *((_WORD *)v8 + i + 7) = *(_WORD *)(a4 + 2 * i);
        *((unsigned char *)&v8[8] + i + 14) = *(unsigned char *)(a5 + i);
      }
    }
    return sub_100017F64(a1, (uint64_t)v8, 0xD0u, 0, 0xFFFFFFFF);
  }
  return v5;
}

uint64_t sub_100018690(uint64_t a1, uint64_t a2, io_registry_entry_t a3)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 168) = 0;
  *(unsigned char *)(a1 + 372) = 0;
  *(void *)(a1 + 408) = 0;
  *(_DWORD *)(a1 + 368) = 0;
  uint64_t v5 = (_DWORD *)(a1 + 416);
  *(_DWORD *)(a1 + 416) = 0;
  *(_DWORD *)(a1 + 88) = a3;
  *(void *)a1 = 0;
  CFURLRef v6 = &byte_1002C57E9;
  byte_1002C5814 = sub_10001CC30(@"LsInterpMode", @"com.apple.coremedia", 1);
  dword_1002C5818 = sub_10001CC30(@"LsBypassVerify", @"com.apple.coremedia", 0);
  byte_1002C581C = sub_10001CC30(@"LsEnableGreenAvg", @"com.apple.coremedia", 1) != 0;
  byte_1002C581D = sub_10001CC30(@"RadialGainEnable", @"com.apple.coremedia", 1) != 0;
  uint64_t v7 = 0;
  dword_1002C5820 = sub_10001CC30(@"UnitInfoNVMChannelMask", @"com.apple.coremedia", 0xFFFFFFFFLL);
  do
  {
    CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"LsAdjustEnableCam%d", v7);
    *(_DWORD *)(v6 - 5) = sub_10001CC30(v8, @"com.apple.coremedia", 0xFFFFFFFFLL);
    CFRelease(v8);
    CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"LsAdjustInvertCam%d", v7);
    *(v6 - 1) = sub_10001CC30(v9, @"com.apple.coremedia", 0) != 0;
    CFRelease(v9);
    CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"LsIdealPctCam%d", v7);
    char *v6 = sub_10001CC30(v10, @"com.apple.coremedia", 0xFFFFFFFFLL);
    v6 += 8;
    CFRelease(v10);
    ++v7;
  }
  while (v7 != 6);
  CFDataRef v11 = (const __CFData *)IORegistryEntrySearchCFProperty(a3, "IOService", @"sensor-type", kCFAllocatorDefault, 3u);
  if (v11)
  {
    CFDataRef v12 = v11;
    BytePtr = CFDataGetBytePtr(v11);
    if (BytePtr) {
      int v14 = *BytePtr;
    }
    else {
      int v14 = -1;
    }
    *(_DWORD *)(a1 + 48) = v14;
    CFRelease(v12);
    int v15 = *(_DWORD *)(a1 + 48);
  }
  else
  {
    int v15 = -1;
    *(_DWORD *)(a1 + 48) = -1;
  }
  long long v16 = &dword_1000249A8;
  *(void *)(a1 + 56) = &dword_1000249A8;
  int v17 = 32;
  while (*v16 != v15)
  {
    v16 += 222;
    if (!--v17)
    {
      printf("H10ISPDevice - Did not find platform-info for platform:%d. Defaulting to 0.\n", v15);
      goto LABEL_14;
    }
  }
  *(void *)(a1 + 56) = v16;
LABEL_14:
  pthread_mutexattr_init(&v19);
  pthread_mutexattr_settype(&v19, 2);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 104), &v19);
  pthread_mutexattr_destroy(&v19);
  sub_1000189B0(a1);
  sub_10001805C(a1);
  *(_DWORD *)(a1 + 248) = 0;
  *(_WORD *)(a1 + 252) = 0;
  *(_DWORD *)(a1 + 328) = 0;
  *(_WORD *)(a1 + 332) = 0;
  *(unsigned char *)(a1 + 340) = 0;
  *(unsigned char *)(a1 + 348) = 0;
  *(unsigned char *)(a1 + 356) = 0;
  *(_DWORD *)(a1 + 360) = 0;
  if (sub_1000182A4(a1) && !sub_100017B38(a1, v5)) {
    sub_100017BA4(a1);
  }
  return a1;
}

uint64_t sub_1000189B0(uint64_t refCon)
{
  if (!*(_DWORD *)(refCon + 92)) {
    return IOServiceAddInterestNotification(*(IONotificationPortRef *)(*(void *)(refCon + 16) + 16), *(_DWORD *)(refCon + 88), "IOGeneralInterest", (IOServiceInterestCallback)sub_100018E30, (void *)refCon, (io_object_t *)(refCon + 92));
  }
  return refCon;
}

uint64_t sub_1000189F0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 96)) {
    sub_100018C78(a1);
  }
  io_object_t v2 = *(_DWORD *)(a1 + 92);
  if (v2)
  {
    IOObjectRelease(v2);
    *(_DWORD *)(a1 + 92) = 0;
  }
  sub_10001805C(a1);
  for (uint64_t i = 0; i != 6; ++i)
  {
    if (*(unsigned char *)(a1 + i + 248))
    {
      uint64_t v4 = *(NSObject **)(*(void *)(a1 + 16) + 72);
      if (v4)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_100018D28;
        block[3] = &unk_100024868;
        block[4] = a1;
        int v17 = i;
        dispatch_sync(v4, block);
      }
    }
    if (*(unsigned char *)(a1 + i + 328))
    {
      uint64_t v5 = *(NSObject **)(*(void *)(a1 + 16) + 72);
      if (v5)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 0x40000000;
        v14[2] = sub_100018D68;
        v14[3] = &unk_100024888;
        v14[4] = a1;
        int v15 = i;
        dispatch_sync(v5, v14);
      }
    }
  }
  if (*(unsigned char *)(a1 + 340))
  {
    CFURLRef v6 = *(NSObject **)(*(void *)(a1 + 16) + 72);
    if (v6)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 0x40000000;
      void v13[2] = sub_100018DA8;
      v13[3] = &unk_1000248A8;
      v13[4] = a1;
      dispatch_sync(v6, v13);
    }
  }
  if (*(unsigned char *)(a1 + 348))
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 16) + 72);
    if (v7)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 0x40000000;
      void v12[2] = sub_100018DD4;
      v12[3] = &unk_1000248C8;
      v12[4] = a1;
      dispatch_sync(v7, v12);
    }
  }
  if (*(unsigned char *)(a1 + 356))
  {
    CFStringRef v8 = *(NSObject **)(*(void *)(a1 + 16) + 72);
    if (v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 0x40000000;
      v11[2] = sub_100018E00;
      v11[3] = &unk_1000248E8;
      v11[4] = a1;
      dispatch_sync(v8, v11);
    }
  }
  CFStringRef v9 = *(const void **)(a1 + 24);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(a1 + 24) = 0;
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 104));
  return a1;
}

uint64_t sub_100018C78(uint64_t a1)
{
  io_object_t v2 = (pthread_mutex_t *)(a1 + 104);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 104));
  uint64_t v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 4u, 0, 0, 0, 0);
  io_connect_t v4 = *(_DWORD *)(a1 + 96);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 96) = 0;
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
  else
  {
    uint64_t v3 = 3758097101;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t sub_100018CF8(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 92);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 92) = 0;
  }
  return result;
}

uint64_t sub_100018D28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = notify_cancel(*(_DWORD *)(v2 + 4 * *(unsigned int *)(a1 + 40) + 224));
  *(unsigned char *)(v2 + *(unsigned int *)(a1 + 40) + 248) = 0;
  return result;
}

uint64_t sub_100018D68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = notify_cancel(*(_DWORD *)(v2 + 4 * *(unsigned int *)(a1 + 40) + 304));
  *(unsigned char *)(v2 + *(unsigned int *)(a1 + 40) + 328) = 0;
  return result;
}

uint64_t sub_100018DA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_cancel(*(_DWORD *)(v1 + 336));
  *(unsigned char *)(v1 + 340) = 0;
  return result;
}

uint64_t sub_100018DD4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_cancel(*(_DWORD *)(v1 + 344));
  *(unsigned char *)(v1 + 348) = 0;
  return result;
}

uint64_t sub_100018E00(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_cancel(*(_DWORD *)(v1 + 352));
  *(unsigned char *)(v1 + 356) = 0;
  return result;
}

uint64_t sub_100018E30(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))result)(result, a3, a4, *(void *)(result + 8));
  }
  return result;
}

uint64_t sub_100018E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFURLRef v6 = (pthread_mutex_t *)(a1 + 104);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 104));
  if (*(_DWORD *)(a1 + 96))
  {
    pthread_mutex_unlock(v6);
    return 3758097093;
  }
  else
  {
    unsigned int v8 = IOServiceOpen(*(_DWORD *)(a1 + 88), mach_task_self_, 0x2Au, (io_connect_t *)(a1 + 96));
    mach_port_t v9 = *(_DWORD *)(a1 + 96);
    if (v9) {
      uint64_t v7 = v8;
    }
    else {
      uint64_t v7 = 3758097084;
    }
    if (!v7)
    {
      uint64_t v11 = 0;
      uint64_t v7 = IOConnectCallScalarMethod(v9, 3u, &v11, 1u, 0, 0);
      if (!v7)
      {
        *(void *)a1 = a2;
        *(void *)(a1 + 8) = a3;
        sub_100018F60(a1, (_DWORD *)(a1 + 64));
      }
    }
    pthread_mutex_unlock(v6);
  }
  return v7;
}

uint64_t sub_100018F60(uint64_t a1, _DWORD *a2)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 96);
  if (!v2) {
    return 3758097084;
  }
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = IOConnectCallScalarMethod(v2, 0x26u, 0, 0, &output, &outputCnt);
  if (!result) {
    *a2 = output;
  }
  return result;
}

uint64_t sub_100018FCC(uint64_t a1)
{
  kdebug_trace();
  uint64_t v2 = 3758097084;
  if (!*(_DWORD *)(a1 + 96)) {
    goto LABEL_6;
  }
  if ((sub_1000182A4(a1) & 1) == 0 && *(unsigned char *)(a1 + 372)) {
    sub_10001805C(a1);
  }
  uint64_t v2 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 0xBu, 0, 0, 0, 0);
  if (v2)
  {
LABEL_6:
    uint64_t v41 = v2;
    if (*(_DWORD *)(a1 + 416))
    {
      unint64_t v3 = 0;
      io_connect_t v4 = (const char **)(a1 + 256);
      uint64_t v5 = a1 + 176;
      uint64_t v6 = 16;
      do
      {
        int v7 = *(_DWORD *)(*(void *)(a1 + 56) + v6);
        if (v7 <= 1919246705)
        {
          if (v7 == 1718775412 || v7 == 1718776695)
          {
            unsigned int v8 = "com.apple.isp.frontcamerapower";
            mach_port_t v9 = "com.apple.isp.frontcamerasensorconfig";
            goto LABEL_21;
          }
        }
        else
        {
          switch(v7)
          {
            case 1919246706:
              unsigned int v8 = "com.apple.isp.backcamerapower";
              mach_port_t v9 = "com.apple.isp.backcamerasensorconfig";
              goto LABEL_21;
            case 1919251319:
              unsigned int v8 = "com.apple.isp.backsuperwidecamerapower";
              mach_port_t v9 = "com.apple.isp.backsuperwidesensorconfig";
LABEL_21:
              *(v4 - 10) = v8;
              *io_connect_t v4 = v9;
              if (*(unsigned char *)(v5 + v3 + 72)) {
                goto LABEL_98;
              }
              CFDataRef v12 = *(NSObject **)(*(void *)(a1 + 16) + 72);
              if (!v12
                || (v48[0] = _NSConcreteStackBlock,
                    v48[1] = 0x40000000,
                    v48[2] = sub_100019FD0,
                    v48[3] = &unk_100024908,
                    v48[4] = a1,
                    int v49 = v3,
                    dispatch_sync(v12, v48),
                    *v4))
              {
LABEL_98:
                if (!*(unsigned char *)(v5 + v3 + 152))
                {
                  uint64_t v11 = *(NSObject **)(*(void *)(a1 + 16) + 72);
                  if (v11)
                  {
                    block[0] = _NSConcreteStackBlock;
                    block[1] = 0x40000000;
                    block[2] = sub_10001A020;
                    block[3] = &unk_100024928;
                    block[4] = a1;
                    int v47 = v3;
                    dispatch_sync(v11, block);
                  }
                }
              }
              goto LABEL_29;
            case 1919251564:
              unsigned int v8 = "com.apple.isp.backtelecamerapower";
              mach_port_t v9 = "com.apple.isp.backtelecamerasensorconfig";
              goto LABEL_21;
          }
        }
        *(v4 - 10) = 0;
        *io_connect_t v4 = 0;
LABEL_29:
        ++v3;
        ++v4;
        v6 += 128;
      }
      while (v3 < *(unsigned int *)(a1 + 416));
    }
    if (!*(unsigned char *)(a1 + 340))
    {
      int v13 = *(NSObject **)(*(void *)(a1 + 16) + 72);
      if (v13)
      {
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 0x40000000;
        v45[2] = sub_10001A070;
        v45[3] = &unk_100024948;
        v45[4] = a1;
        dispatch_sync(v13, v45);
      }
    }
    if (!*(unsigned char *)(a1 + 348))
    {
      int v14 = *(NSObject **)(*(void *)(a1 + 16) + 72);
      if (v14)
      {
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 0x40000000;
        v44[2] = sub_10001A0AC;
        v44[3] = &unk_100024968;
        v44[4] = a1;
        dispatch_sync(v14, v44);
      }
    }
    if (!*(unsigned char *)(a1 + 356))
    {
      int v15 = *(NSObject **)(*(void *)(a1 + 16) + 72);
      if (v15)
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 0x40000000;
        v43[2] = sub_10001A0E8;
        v43[3] = &unk_100024988;
        void v43[4] = a1;
        dispatch_sync(v15, v43);
      }
    }
    if (!sub_1000182A4(a1) || !*(unsigned char *)(a1 + 372) || v41 || !*(_DWORD *)(a1 + 416)) {
      goto LABEL_73;
    }
    uint64_t v16 = 0;
    char v42 = 0;
    unsigned int v17 = 0;
    unsigned int v18 = 0;
LABEL_44:
    sprintf(__filename.i8, "/usr/local/share/firmware/isp/cam%dclocks.txt", v16);
    pthread_mutexattr_t v19 = fopen(__filename.i8, "r");
    if (!v19) {
      goto LABEL_72;
    }
    printf("Found camera clock override information file for camera channel %d\n");
    while (1)
    {
      if (!fgets(__str, 40, v19))
      {
        fclose(v19);
        if (v42)
        {
          mach_port_t v32 = *(_DWORD *)(a1 + 96);
          if (v32 && (input[0] = v16, input[1] = v17, !IOConnectCallScalarMethod(v32, 0x1Eu, input, 2u, 0, 0))) {
            printf("Successfully set camera %d clock divider over-ride: 0x%08X\n");
          }
          else {
            printf("Error: ISP_OverrideSensorClockFrequency returned an error: 0x%08X\n");
          }
        }
        if (v18)
        {
          if (sub_1000185AC(a1, v16, v18, (uint64_t)&__dst, (uint64_t)v52)) {
            printf("Error: SetSensorCustomSettings returned an error: 0x%08X\n");
          }
          else {
            printf("Successfully sent camera %d sensor register over-ride values for %d registers\n");
          }
        }
LABEL_72:
        if (++v16 >= *(unsigned int *)(a1 + 416))
        {
LABEL_73:
          kdebug_trace();
          return v41;
        }
        goto LABEL_44;
      }
      long long v20 = strtok(__str, "=");
      if (!v20) {
        break;
      }
      long long v21 = v20;
      if (!strncmp(v20, "clockdiv", 8uLL))
      {
        float v26 = strtok(0, " \n");
        if (!v26) {
          break;
        }
        unsigned int v17 = strtoul(v26, 0, 0);
        printf("Set clock divider reg to 0x%08X\n", v17);
        char v42 = 1;
      }
      else if (!strncmp(v21, "property", 8uLL))
      {
        float v27 = strtok(0, " :");
        if (!v27) {
          break;
        }
        int v28 = strtoul(v27, 0, 0);
        double v29 = strtok(0, " \n");
        if (!v29) {
          break;
        }
        int v30 = strtoul(v29, 0, 0);
        printf("Setting FW property 0x%08x to 0x%08X\n", v28, v30);
        if (sub_100018424(a1, v16, v28, v30, 0xFFFFFFFF)) {
          printf("Error setting FW property: 0x%08x\n");
        }
      }
      else
      {
        int v22 = strtoul(v21, 0, 0);
        long long v23 = strtok(0, " \n");
        if (!v23) {
          break;
        }
        if (v18 > 0x3F)
        {
          double v31 = "Error: too many camera sensor register over-rides in file";
LABEL_60:
          puts(v31);
        }
        else
        {
          int v24 = strtoul(v23, 0, 0);
          char v25 = v24;
          printf("Set sensor reg 0x%08x to val 0x%08X\n", v22, v24);
          *((_WORD *)v52 + v18 + 708) = v22;
          v52[v18++] = v25;
        }
      }
    }
    double v31 = "Error parsing camera clock override file";
    goto LABEL_60;
  }
  mach_port_t v34 = *(_DWORD *)(a1 + 96);
  if (!v34) {
    return 3758097084;
  }
  __filename.i64[0] = 63;
  uint64_t result = IOConnectCallScalarMethod(v34, 0x3Eu, (const uint64_t *)&__filename, 1u, 0, 0);
  if (!result)
  {
    double v40 = (_DWORD *)(a1 + 416);
    if (!*(_DWORD *)(a1 + 416))
    {
      int v35 = sub_100017B38(a1, v40);
      if (v35) {
        printf("ISP_PowerOnCamera - ISP_GetNumChannels failed with 0x%08x\n", v35);
      }
    }
    mach_port_t v36 = *(_DWORD *)(a1 + 96);
    if (v36)
    {
      int64x2_t __filename = vdupq_n_s64(1uLL);
      IOConnectCallScalarMethod(v36, 0x23u, (const uint64_t *)&__filename, 2u, 0, 0);
    }
    if (*v40)
    {
      unint64_t v37 = 0;
      double v38 = &byte_1002C57E9;
      do
      {
        bzero(&__filename, 0x698uLL);
        sub_1000182FC(a1, v37, &__filename);
        if (__filename.i8[4]) {
          BOOL v39 = __filename.u8[12] == 0;
        }
        else {
          BOOL v39 = 0;
        }
        if (v39) {
          operator new();
        }
        ++v37;
        v38 += 8;
      }
      while (v37 < *v40);
    }
    if (!*(unsigned char *)(a1 + 372)) {
      sub_100017BA4(a1);
    }
    uint64_t v2 = 0;
    goto LABEL_6;
  }
  return result;
}

void sub_100019FB4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100019FD0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = notify_register_check(*(const char **)(v2 + 8 * *(unsigned int *)(a1 + 40) + 176), (int *)(v2 + 4 * *(unsigned int *)(a1 + 40) + 224));
  *(unsigned char *)(v2 + *(unsigned int *)(a1 + 40) + 248) = result == 0;
  return result;
}

uint64_t sub_10001A020(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = notify_register_check(*(const char **)(v2 + 8 * *(unsigned int *)(a1 + 40) + 256), (int *)(v2 + 4 * *(unsigned int *)(a1 + 40) + 304));
  *(unsigned char *)(v2 + *(unsigned int *)(a1 + 40) + 328) = result == 0;
  return result;
}

uint64_t sub_10001A070(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_register_check("com.apple.isp.cameratorch", (int *)(v1 + 336));
  *(unsigned char *)(v1 + 340) = result == 0;
  return result;
}

uint64_t sub_10001A0AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_register_check("com.apple.isp.cameratorchcoolcurrent", (int *)(v1 + 344));
  *(unsigned char *)(v1 + 348) = result == 0;
  return result;
}

uint64_t sub_10001A0E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = notify_register_check("com.apple.isp.cameratorchwarmcurrent", (int *)(v1 + 352));
  *(unsigned char *)(v1 + 356) = result == 0;
  return result;
}

uint64_t sub_10001A124(uint64_t a1, int a2)
{
  if (!a2)
  {
    int v5 = 0;
    BOOL v6 = 0;
    uint64_t v7 = 3758097084;
    goto LABEL_12;
  }
  int v2 = a2;
  while (1)
  {
    uint64_t v4 = sub_100018FCC(a1);
    if (v4 != -536870187) {
      break;
    }
    --v2;
    usleep(0x493E0u);
    if (!v2)
    {
      int v5 = 0;
      BOOL v6 = 0;
      uint64_t v7 = 3758097109;
      goto LABEL_12;
    }
  }
  uint64_t v7 = v4;
  if (v4)
  {
LABEL_11:
    int v5 = 0;
    BOOL v6 = 0;
    goto LABEL_12;
  }
  if (!sub_1000182A4(a1))
  {
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = sub_10001A218(a1);
  BOOL v6 = v7 == 0;
  int v5 = 1;
LABEL_12:
  printf("%s - poweredOn=%d, poweredOff=%d, res=0x%08X\n", "ISP_PowerCycle", v5, v6, v7);
  return v7;
}

uint64_t sub_10001A218(uint64_t a1)
{
  kdebug_trace();
  mach_port_t v2 = *(_DWORD *)(a1 + 96);
  if (v2) {
    uint64_t v3 = IOConnectCallScalarMethod(v2, 0xCu, 0, 0, 0, 0);
  }
  else {
    uint64_t v3 = 3758097084;
  }
  kdebug_trace();
  return v3;
}

uint64_t sub_10001A2A8(uint64_t a1)
{
  uint64_t v2 = sub_10001A5A4(a1);
  if (v2)
  {
    uint64_t v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "ISP_LoadFirmware";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Failed to load Bin-format firmware binary: %#08x\n", buf, 0x12u);
    }
  }
  else
  {
    sub_1000025AC(a1);
    sub_100002928(a1);
    sub_10001A934(a1);
    sub_10001B078();
    CFDictionaryRef theDict = 0;
    sub_10001815C(v4, &theDict);
    if (theDict)
    {
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"ChannelArray");
      if (Value && (CFArrayRef v6 = Value, CFArrayGetCount(Value) >= 1))
      {
        CFIndex v7 = 0;
        uint64_t v3 = 0;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v7);
          if (ValueAtIndex)
          {
            CFDataRef v9 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"NVM");
            if (v9)
            {
              if ((dword_1002C5820 >> v7))
              {
                CFDataRef v10 = v9;
                int Length = CFDataGetLength(v9);
                printf("sending camera channel %d over-ride NVM bytes to kernel (%d bytes)\n", v7, Length);
                *(void *)buf = CFDataGetBytePtr(v10);
                *(void *)&buf[8] = CFDataGetLength(v10);
                *(void *)&uint8_t buf[16] = v7;
                uint64_t v3 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 0x1Au, (const uint64_t *)buf, 3u, 0, 0);
                if (v3) {
                  printf("error sending camera channel %d over-ride NVM bytes to kernel: 0x%08X\n");
                }
              }
              else
              {
                printf("bypassing sending over-ride NVM bypass from unit-info plist for channel %d (mask bit not set)\n");
              }
            }
          }
          ++v7;
        }
        while (CFArrayGetCount(v6) > v7);
      }
      else
      {
        uint64_t v3 = 0;
      }
      if (theDict)
      {
        CFDataRef v12 = (const __CFData *)CFDictionaryGetValue(theDict, @"MultiCameraCalWide");
        if (v12)
        {
          CFDataRef v13 = v12;
          *(void *)buf = CFDataGetLength(v12);
          *(_OWORD *)&buf[8] = (unint64_t)CFDataGetBytePtr(v13);
          uint64_t v14 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 0x4Fu, (const uint64_t *)buf, 3u, 0, 0);
          uint64_t v3 = v14;
          if (v14) {
            printf("error sending multi camera w calibration to kernel: 0x%08X\n", v14);
          }
        }
        if (theDict)
        {
          CFDataRef v15 = (const __CFData *)CFDictionaryGetValue(theDict, @"MultiCameraCalSwide");
          if (v15)
          {
            CFDataRef v16 = v15;
            *(void *)buf = CFDataGetLength(v15);
            *(void *)&buf[8] = CFDataGetBytePtr(v16);
            *(void *)&uint8_t buf[16] = 1;
            uint64_t v17 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 0x4Fu, (const uint64_t *)buf, 3u, 0, 0);
            uint64_t v3 = v17;
            if (v17) {
              printf("error sending multi camera sw calibration to kernel: 0x%08X\n", v17);
            }
          }
          if (theDict) {
            CFRelease(theDict);
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_10001A5A4(uint64_t a1)
{
  *(void *)outputStructCnt = 24;
  mach_port_t v2 = *(_DWORD *)(a1 + 96);
  if (v2 && (IOConnectCallStructMethod(v2, 0xFu, 0, 0, outputStruct, (size_t *)outputStructCnt), outputStruct[20]))
  {
    *(void *)outputStructCnt = 0;
    *(void *)&outputStructCnt[8] = 0;
    *(void *)&outputStructCnt[16] = *(unsigned int *)(a1 + 48);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFDataRef v13 = "LoadFirmwareBinary";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: CTRR still call the kernel to make fISPCPUFirmwareLoaded true\n", buf, 0xCu);
    }
    return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 7u, (const uint64_t *)outputStructCnt, 3u, 0, 0);
  }
  else
  {
    int v4 = *(_DWORD *)(a1 + 64);
    if (v4 == 10)
    {
      int v5 = 0;
      CFArrayRef v6 = "/usr/local/share/firmware/isp/h12_isp_fw.bin";
    }
    else if (v4 == 9)
    {
      if (**(_DWORD **)(a1 + 56) == 178) {
        int v5 = "/usr/local/share/firmware/isp/adc-oceanus.bin";
      }
      else {
        int v5 = 0;
      }
      CFArrayRef v6 = "/usr/local/share/firmware/isp/h11_isp_fw.bin";
    }
    else
    {
      int v5 = 0;
      if (v4 == 8) {
        CFArrayRef v6 = "/usr/local/share/firmware/isp/h10_isp_fw.bin";
      }
      else {
        CFArrayRef v6 = 0;
      }
    }
    CFIndex v7 = fopen(v5, "rb");
    unsigned int v8 = fopen(v6, "rb");
    if (v8)
    {
      CFDataRef v9 = v8;
      if (v7) {
        fclose(v7);
      }
    }
    else
    {
      CFDataRef v9 = v7;
      CFArrayRef v6 = v5;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136315394;
      *(void *)&outputStructCnt[4] = "LoadFirmwareBinary";
      *(_WORD *)&outputStructCnt[12] = 2080;
      *(void *)&outputStructCnt[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Load firmware from %s\n", outputStructCnt, 0x16u);
    }
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)outputStructCnt = 136315138;
        *(void *)&outputStructCnt[4] = "LoadFirmwareBinary";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: (Bin) Using ISPCPU firmware override file\n", outputStructCnt, 0xCu);
      }
      fseeko(v9, 0, 2);
      ftello(v9);
      fseeko(v9, 0, 0);
      operator new[]();
    }
    perror("error loading ISPCPU firmware");
    *(void *)outputStructCnt = 0;
    *(void *)&outputStructCnt[8] = 0;
    *(void *)&outputStructCnt[16] = *(unsigned int *)(a1 + 48);
    return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 96), 7u, (const uint64_t *)outputStructCnt, 3u, 0, 0);
  }
}

void sub_10001A934(uint64_t a1)
{
  CFDictionaryRef v2 = IOServiceNameMatching("AppleH10CamIn");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v2);
  CFTypeRef v4 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"FrontCameraModuleSerialNumString", kCFAllocatorDefault, 3u);
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      long long v23 = "LoadFCClDataFile";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: FrontCameraModuleSerialNumString exists - load FDR FCCl calibration data\n", buf, 0xCu);
    }
    CFRelease(v4);
    uint64_t v6 = 0;
    CFIndex v7 = (_DWORD *)(*(void *)(a1 + 56) + 16);
    while (1)
    {
      if (*(v7 - 2))
      {
        if (*v7 == 1718775412 || *v7 == 1718776695) {
          break;
        }
      }
      v7 += 32;
      if (++v6 == 6)
      {
        LODWORD(v6) = 0;
        break;
      }
    }
    CFDataRef v9 = fopen("/usr/local/share/firmware/isp/FCCl-Override.DAT", "rb");
    if (v9)
    {
      CFDataRef v10 = v9;
      fseeko(v9, 0, 2);
      ftello(v10);
      fseeko(v10, 0, 0);
      operator new[]();
    }
    CFStringRef v11 = CFStringCreateWithCString(kCFAllocatorDefault, "FCCl", 0x8000100u);
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, @"CopyAllowUnsealed", kCFBooleanTrue);
    AMFDRLogSetHandler();
    CFDataRef v13 = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
    if (!v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v23 = "LoadFCClDataFile";
      __int16 v24 = 1024;
      int v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: AMFDRSealingMapCopyLocalDataForClass failed! channel:%u\n", buf, 0x12u);
    }
    if (v13 || !*(unsigned char *)(*(void *)(a1 + 56) + 881)) {
      goto LABEL_27;
    }
    CFDataRef v13 = (const __CFData *)AMFDRSealingManifestCopyLocalDataForClass();
    BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136315394;
        long long v23 = "LoadFCClDataFile";
        __int16 v24 = 1024;
        int v25 = v6;
        CFDataRef v15 = "%s: Unauthorized swap detected! channel:%u\n";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 0x12u);
      }
    }
    else if (v14)
    {
      *(_DWORD *)buf = 136315394;
      long long v23 = "LoadFCClDataFile";
      __int16 v24 = 1024;
      int v25 = v6;
      CFDataRef v15 = "%s: AMFDRSealingManifestCopyLocalDataForClass failed! channel:%u\n";
      goto LABEL_26;
    }
LABEL_27:
    if (v13)
    {
      BytePtr = CFDataGetBytePtr(v13);
      unsigned int Length = CFDataGetLength(v13);
      int v18 = sub_10001B81C(a1, v6 | 0x80000000, (uint64_t)BytePtr, Length, 0x300u);
      CFStringRef v19 = CFCopyDescription(v13);
      if (v19)
      {
        CFStringRef v20 = v19;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          CStringPtr = CFStringGetCStringPtr(v20, 0);
          *(_DWORD *)buf = 136315906;
          long long v23 = "LoadFCClDataFile";
          __int16 v24 = 1024;
          int v25 = v6;
          __int16 v26 = 1024;
          int v27 = v18;
          __int16 v28 = 2080;
          double v29 = CStringPtr;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: channel = %u, status = %#08x, FCCl data = %s\n", buf, 0x22u);
        }
        CFRelease(v20);
      }
      CFRelease(v13);
    }
    else
    {
      sub_10001B81C(a1, v6 | 0x80000000, 0, 0, 0x300u);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v23 = "LoadFCClDataFile";
        __int16 v24 = 1024;
        int v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: channel = %u; No module or No FCCl data (perhaps cuz the device does not support FCCl)\n",
          buf,
          0x12u);
      }
    }
    if (v11) {
      CFRelease(v11);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    return;
  }
  if (v5)
  {
    *(_DWORD *)buf = 136315138;
    long long v23 = "LoadFCClDataFile";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s : Couldn't read front camera module serial number. Sensor is hosed/disconnected. Skip loading FDR FCCl calibration data \n", buf, 0xCu);
  }
}

void sub_10001B078()
{
  CFStringRef v0 = (const __CFString *)MGCopyAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    CFIndex Length = CFStringGetLength(v0);
    if (CFStringHasSuffix(v1, @"AP"))
    {
      v3.size_t length = Length - 2;
    }
    else
    {
      if (!CFStringHasSuffix(v1, @"DEV"))
      {
        CFAllocatorRef v6 = kCFAllocatorDefault;
        goto LABEL_12;
      }
      v3.size_t length = Length - 3;
    }
    CFAllocatorRef v6 = kCFAllocatorDefault;
    if (v3.length >= 1)
    {
      v3.location = 0;
      CFStringRef v7 = CFStringCreateWithSubstring(kCFAllocatorDefault, v1, v3);
      CFRelease(v1);
      CFStringRef v1 = v7;
    }
LABEL_12:
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v6, 0, v1);
    CFStringLowercase(MutableCopy, 0);
    CFShow(MutableCopy);
    CFRelease(v1);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    memset(buf, 0, sizeof(buf));
    strcat((char *)buf, "/System/Library/Isp/afpp/");
    CStringPtr = CFStringGetCStringPtr(MutableCopy, 0x8000100u);
    strcat((char *)buf, CStringPtr);
    strcat((char *)buf, "/ispane.afpp");
    CFRelease(MutableCopy);
    CFDataRef v10 = fopen((const char *)buf, "rb");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      BOOL v14 = buf;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loading file for ISP-ANE networks - %s \n", (uint8_t *)&v13, 0xCu);
    }
    CFStringRef v11 = fopen("/usr/local/share/firmware/isp/ispane.afpp", "rb");
    if (v11)
    {
      CFDataRef v12 = v11;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using override ISP-ANE AFPP file \n", (uint8_t *)&v13, 2u);
      }
      if (v10) {
        fclose(v10);
      }
      CFDataRef v10 = v12;
LABEL_21:
      fseeko(v10, 0, 2);
      ftello(v10);
      fseeko(v10, 0, 0);
      operator new[]();
    }
    if (v10) {
      goto LABEL_21;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      CFTypeRef v4 = "Error opening ISP-ANE networks file. \n";
      BOOL v5 = (uint8_t *)&v13;
      goto LABEL_6;
    }
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    CFTypeRef v4 = "Failed to copy model string from MobileGestalt";
    BOOL v5 = buf;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
  }
}

uint64_t sub_10001B4E8(uint64_t a1, _DWORD *inputStruct)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 96);
  if (!v2) {
    return 3758097084;
  }
  long long v5 = 0u;
  return IOConnectCallAsyncMethod(v2, 0x2Bu, inputStruct[4], &reference, 8u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
}

uint64_t sub_10001B57C(uint64_t a1, mach_port_t wake_port)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 96);
  if (!v2) {
    return 3758097084;
  }
  long long v5 = 0u;
  return IOConnectCallAsyncMethod(v2, 0x2Cu, wake_port, &reference, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10001B608(uint64_t a1, mach_port_t wake_port, uint64_t a3)
{
  mach_port_t v3 = *(_DWORD *)(a1 + 96);
  if (!v3) {
    return 3758097084;
  }
  input[0] = a3;
  input[1] = 2008;
  long long v6 = 0u;
  return IOConnectCallAsyncMethod(v3, 0x2Du, wake_port, &reference, 8u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10001B6A0(uint64_t a1, mach_port_t wake_port, uint64_t a3)
{
  mach_port_t v3 = *(_DWORD *)(a1 + 96);
  if (!v3) {
    return 3758097084;
  }
  input[0] = a3;
  input[1] = 2008;
  long long v6 = 0u;
  return IOConnectCallAsyncMethod(v3, 0x2Eu, wake_port, &reference, 8u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10001B738(uint64_t a1, mach_port_t wake_port)
{
  mach_port_t v2 = *(_DWORD *)(a1 + 96);
  if (!v2) {
    return 3758097084;
  }
  long long v5 = 0u;
  return IOConnectCallAsyncMethod(v2, 0x32u, wake_port, &reference, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t sub_10001B7C4(uint64_t a1)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t result = *(unsigned int *)(a1 + 96);
  if (result) {
    return !IOConnectCallScalarMethod(result, 0x3Du, 0, 0, &output, &outputCnt) && output == 1;
  }
  return result;
}

uint64_t sub_10001B81C(uint64_t a1, int a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  mach_port_t v7 = *(_DWORD *)(a1 + 96);
  if (v7)
  {
    input[0] = a3;
    input[1] = a4;
    uint64_t input[2] = a2;
    input[3] = a5;
    uint64_t v8 = IOConnectCallScalarMethod(v7, 0x28u, input, 4u, 0, 0);
  }
  else
  {
    uint64_t v8 = 3758097084;
  }
  CFDataRef v9 = "true";
  if (a2 >= 0) {
    CFDataRef v9 = "false";
  }
  printf("Load data file: channel: %d, type: %d, isEarlyBootDataFile: %s, status: %08x\n", a2 & 0x7FFFFFFF, a5, v9, v8);
  return v8;
}

void sub_10001B8F4(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    CFTypeRef v4 = "fdrLogMessages";
    __int16 v5 = 2080;
    uint64_t v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: %s \n", (uint8_t *)&v3, 0x16u);
  }
}

BOOL sub_10001B9A8(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = *(unsigned __int8 *)(v3 + 843);
  for (uint64_t i = (_DWORD *)(v3 + 16); ; i += 32)
  {
    if (*(i - 2))
    {
      if (*i == 1718776695 || *i == 1718775412) {
        break;
      }
    }
    if (++v2 == 6) {
      return v4 != 0;
    }
  }
  *a2 = v2;
  return v4 != 0;
}

BOOL sub_10001BA04(uint64_t a1, _DWORD *a2)
{
  unint64_t v2 = 0;
  uint64_t v3 = (_DWORD *)(*(void *)(a1 + 56) + 16);
  BOOL v4 = 1;
  while (*v3 != 1718186595 || *(v3 - 2) != 1)
  {
    BOOL v4 = v2 < 5;
    v3 += 32;
    if (++v2 == 6) {
      return 0;
    }
  }
  *a2 = v2;
  return v4;
}

__n128 sub_10001BA64(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8, int a9, unsigned int a10)
{
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 12) = 0;
  if (a2 > 1028)
  {
    if (a2 > 1554)
    {
      if (a2 > 3413)
      {
        switch(a2)
        {
          case 3414:
            if (a3 == 2)
            {
              *(void *)a1 = &unk_100091000;
              *(_DWORD *)(a1 + 8) = 7040;
              CFDataRef v10 = "/usr/local/share/firmware/isp/6222_01XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_10008F000;
              *(_DWORD *)(a1 + 8) = 7040;
              CFDataRef v10 = "/usr/local/share/firmware/isp/6221_01XX.dat";
            }
            break;
          case 26384:
            *(void *)a1 = &unk_1002C4000;
            *(_DWORD *)(a1 + 8) = 6112;
            CFDataRef v10 = "/usr/local/share/firmware/isp/6920_01XX.dat";
            break;
          case 38754:
            if (a3 == 3)
            {
              *(void *)a1 = &unk_1002B3000;
              *(_DWORD *)(a1 + 8) = 48148;
              CFDataRef v10 = "/usr/local/share/firmware/isp/7153_02XX.dat";
            }
            else if (a3 == 2)
            {
              *(void *)a1 = &unk_1002A7000;
              *(_DWORD *)(a1 + 8) = 48148;
              CFDataRef v10 = "/usr/local/share/firmware/isp/7152_02XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_10029B000;
              *(_DWORD *)(a1 + 8) = 48148;
              CFDataRef v10 = "/usr/local/share/firmware/isp/7151_02XX.dat";
            }
            break;
          default:
            return result;
        }
      }
      else
      {
        switch(a2)
        {
          case 1555:
            *(void *)a1 = &unk_100277000;
            *(_DWORD *)(a1 + 8) = 38072;
            CFDataRef v10 = "/usr/local/share/firmware/isp/4920_01XX.dat";
            break;
          case 1556:
            *(void *)a1 = &unk_10028C000;
            *(_DWORD *)(a1 + 8) = 60780;
            CFDataRef v10 = "/usr/local/share/firmware/isp/2921_11XX.dat";
            break;
          case 1812:
            *(void *)a1 = &unk_100281000;
            *(_DWORD *)(a1 + 8) = 41368;
            CFDataRef v10 = "/usr/local/share/firmware/isp/2021_01XX.dat";
            break;
          default:
            return result;
        }
      }
    }
    else if (a2 > 1284)
    {
      switch(a2)
      {
        case 1285:
          *(void *)a1 = &unk_100264000;
          *(_DWORD *)(a1 + 8) = 35480;
          CFDataRef v10 = "/usr/local/share/firmware/isp/3911_01XX.dat";
          break;
        case 1300:
          if (a5 == 175)
          {
            *(void *)a1 = &unk_10020E000;
            *(_DWORD *)(a1 + 8) = 41368;
            CFDataRef v10 = "/usr/local/share/firmware/isp/2851_02XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_100219000;
            *(_DWORD *)(a1 + 8) = 41368;
            CFDataRef v10 = "/usr/local/share/firmware/isp/2851_01XX.dat";
          }
          break;
        case 1539:
          *(void *)a1 = &unk_10026D000;
          *(_DWORD *)(a1 + 8) = 38136;
          CFDataRef v10 = "/usr/local/share/firmware/isp/7920_01XX.dat";
          break;
        default:
          return result;
      }
    }
    else
    {
      switch(a2)
      {
        case 1029:
          if ((a5 & 0xFFFFFFFC) == 0x50)
          {
            if (a10 > 2)
            {
              *(void *)a1 = &unk_100197000;
              *(_DWORD *)(a1 + 8) = 39168;
              CFDataRef v10 = "/usr/local/share/firmware/isp/9711_04XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_10018D000;
              *(_DWORD *)(a1 + 8) = 39096;
              CFDataRef v10 = "/usr/local/share/firmware/isp/9711_03XX.dat";
            }
          }
          else if (a10 > 2)
          {
            *(void *)a1 = &unk_1001A6000;
            *(_DWORD *)(a1 + 8) = 38628;
            CFDataRef v10 = "/usr/local/share/firmware/isp/9711_02XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_1001A1000;
            *(_DWORD *)(a1 + 8) = 18364;
            CFDataRef v10 = "/usr/local/share/firmware/isp/9711_01XX.dat";
          }
          break;
        case 1044:
          if (a9)
          {
            *(void *)a1 = &unk_100135000;
            *(_DWORD *)(a1 + 8) = 41516;
            CFDataRef v10 = "/usr/local/share/firmware/isp/2561_01XX.dat";
          }
          else if (a5 == 196)
          {
            if (a10 > 5)
            {
              *(void *)a1 = &unk_10014B000;
              *(_DWORD *)(a1 + 8) = 41996;
              CFDataRef v10 = "/usr/local/share/firmware/isp/2561_06XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_100140000;
              *(_DWORD *)(a1 + 8) = 41604;
              CFDataRef v10 = "/usr/local/share/firmware/isp/2561_05XX.dat";
            }
          }
          else if ((a5 - 167) > 3)
          {
            if ((a5 & 0xFFFFFFFC) == 0x50)
            {
              *(void *)a1 = &unk_10016C000;
              *(_DWORD *)(a1 + 8) = 42052;
              CFDataRef v10 = "/usr/local/share/firmware/isp/2561_09XX.dat";
            }
            else if (a10 > 5)
            {
              *(void *)a1 = &unk_100182000;
              *(_DWORD *)(a1 + 8) = 41996;
              CFDataRef v10 = "/usr/local/share/firmware/isp/2561_04XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_100177000;
              *(_DWORD *)(a1 + 8) = 41604;
              CFDataRef v10 = "/usr/local/share/firmware/isp/2561_02XX.dat";
            }
          }
          else if (a10 > 5)
          {
            *(void *)a1 = &unk_100161000;
            *(_DWORD *)(a1 + 8) = 41996;
            CFDataRef v10 = "/usr/local/share/firmware/isp/2561_08XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_100156000;
            *(_DWORD *)(a1 + 8) = 41604;
            CFDataRef v10 = "/usr/local/share/firmware/isp/2561_07XX.dat";
          }
          break;
        case 1283:
          if (a3 == 3)
          {
            if (a5 == 178)
            {
              *(void *)a1 = &unk_1001F6000;
              *(_DWORD *)(a1 + 8) = 45980;
              CFDataRef v10 = "/usr/local/share/firmware/isp/7811_82XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_100202000;
              *(_DWORD *)(a1 + 8) = 45720;
              CFDataRef v10 = "/usr/local/share/firmware/isp/7811_02XX.dat";
            }
          }
          else if (a3 == 2)
          {
            if (a5 == 178)
            {
              *(void *)a1 = &unk_1001DE000;
              *(_DWORD *)(a1 + 8) = 45980;
              CFDataRef v10 = "/usr/local/share/firmware/isp/7811_83XX.dat";
            }
            else
            {
              *(void *)a1 = &unk_1001EA000;
              *(_DWORD *)(a1 + 8) = 45720;
              CFDataRef v10 = "/usr/local/share/firmware/isp/7811_03XX.dat";
            }
          }
          else if (a5 == 178)
          {
            *(void *)a1 = &unk_1001C6000;
            *(_DWORD *)(a1 + 8) = 45980;
            CFDataRef v10 = "/usr/local/share/firmware/isp/7811_81XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_1001D2000;
            *(_DWORD *)(a1 + 8) = 45720;
            CFDataRef v10 = "/usr/local/share/firmware/isp/7811_01XX.dat";
          }
          break;
        default:
          return result;
      }
    }
    goto LABEL_147;
  }
  if (a2 <= 834)
  {
    if (a2 <= 770)
    {
      if (a2 == 553)
      {
        if (a3 == 2)
        {
          *(void *)a1 = &unk_1001BB000;
          *(_DWORD *)(a1 + 8) = 41872;
          CFDataRef v10 = "/usr/local/share/firmware/isp/8522_01XX.dat";
        }
        else
        {
          *(void *)a1 = &unk_1001B0000;
          *(_DWORD *)(a1 + 8) = 41872;
          CFDataRef v10 = "/usr/local/share/firmware/isp/8521_01XX.dat";
        }
      }
      else
      {
        if (a2 != 584) {
          return result;
        }
        *(void *)a1 = &unk_1002BF000;
        *(_DWORD *)(a1 + 8) = 17428;
        CFDataRef v10 = "/usr/local/share/firmware/isp/1820_01XX.dat";
      }
    }
    else
    {
      switch(a2)
      {
        case 771:
          if (a4 == 2)
          {
            *(void *)a1 = &unk_10003D000;
            *(_DWORD *)(a1 + 8) = 18552;
            CFDataRef v10 = "/usr/local/share/firmware/isp/5121_01XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_100042000;
            *(_DWORD *)(a1 + 8) = 18552;
            CFDataRef v10 = "/usr/local/share/firmware/isp/5111_01XX.dat";
          }
          break;
        case 787:
          if (a3 == 1)
          {
            *(void *)a1 = &unk_100047000;
            *(_DWORD *)(a1 + 8) = 18532;
            CFDataRef v10 = "/usr/local/share/firmware/isp/4121_01XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_10004C000;
            *(_DWORD *)(a1 + 8) = 18532;
            CFDataRef v10 = "/usr/local/share/firmware/isp/4123_01XX.dat";
          }
          break;
        case 788:
          *(void *)a1 = &unk_100032000;
          *(_DWORD *)(a1 + 8) = 42440;
          CFDataRef v10 = "/usr/local/share/firmware/isp/9151_01XX.dat";
          break;
        default:
          return result;
      }
    }
  }
  else
  {
    if (a2 <= 853)
    {
      if (a2 == 835)
      {
        if (a5 == 162)
        {
          *(void *)a1 = &unk_100051000;
          *(_DWORD *)(a1 + 8) = 18656;
          CFDataRef v10 = "/usr/local/share/firmware/isp/5221_01XX.dat";
        }
        else
        {
          *(void *)a1 = &unk_100056000;
          *(_DWORD *)(a1 + 8) = 18544;
          CFDataRef v10 = "/usr/local/share/firmware/isp/5221_02XX.dat";
        }
        goto LABEL_147;
      }
      if (a2 != 851)
      {
        if (a2 != 852) {
          return result;
        }
        if (a5 == 162)
        {
          *(void *)a1 = &unk_10006F000;
          *(_DWORD *)(a1 + 8) = 42420;
          CFDataRef v10 = "/usr/local/share/firmware/isp/9251_01XX.dat";
        }
        else
        {
          *(void *)a1 = &unk_10007A000;
          *(_DWORD *)(a1 + 8) = 42476;
          CFDataRef v10 = "/usr/local/share/firmware/isp/9251_02XX.dat";
        }
        goto LABEL_147;
      }
      if (a5 == 161) {
        goto LABEL_102;
      }
      if (a5 == 162)
      {
        *(void *)a1 = &unk_10005B000;
        *(_DWORD *)(a1 + 8) = 18656;
        CFDataRef v10 = "/usr/local/share/firmware/isp/4221_01XX.dat";
        goto LABEL_147;
      }
      if ((a5 & 0xFFFFFFFE) != 0xC2)
      {
LABEL_102:
        *(void *)a1 = &unk_100060000;
        *(_DWORD *)(a1 + 8) = 18544;
        CFDataRef v10 = "/usr/local/share/firmware/isp/4221_02XX.dat";
        goto LABEL_147;
      }
      if (a8 != 5)
      {
        *(void *)a1 = &unk_10006A000;
        *(_DWORD *)(a1 + 8) = 18708;
        CFDataRef v10 = "/usr/local/share/firmware/isp/4521_02XX.dat";
        goto LABEL_147;
      }
LABEL_101:
      *(void *)a1 = &unk_100065000;
      *(_DWORD *)(a1 + 8) = 18724;
      CFDataRef v10 = "/usr/local/share/firmware/isp/4521_01XX.dat";
      goto LABEL_147;
    }
    if (a2 == 854)
    {
      if ((a5 - 172) <= 0x36 && ((1 << (a5 + 84)) & 0x40000000000003) != 0)
      {
        *(void *)a1 = &unk_100085000;
        *(_DWORD *)(a1 + 8) = 37660;
        CFDataRef v10 = "/usr/local/share/firmware/isp/4811_01XX.dat";
        goto LABEL_147;
      }
      goto LABEL_101;
    }
    if (a2 == 882)
    {
      if (a5 == 94)
      {
        *(void *)a1 = &unk_100244000;
        *(_DWORD *)(a1 + 8) = 63416;
        CFDataRef v10 = "/usr/local/share/firmware/isp/3811_61XX.dat";
      }
      else if (a5 == 178)
      {
        if (a7 && *(unsigned __int8 *)(a7 + 4) <= 0x12u)
        {
          *(void *)a1 = &unk_100224000;
          *(_DWORD *)(a1 + 8) = 65188;
          CFDataRef v10 = "/usr/local/share/firmware/isp/3811_91XX.dat";
        }
        else
        {
          *(void *)a1 = &unk_100234000;
          *(_DWORD *)(a1 + 8) = 65244;
          CFDataRef v10 = "/usr/local/share/firmware/isp/3811_81XX.dat";
        }
      }
      else
      {
        *(void *)a1 = &unk_100254000;
        *(_DWORD *)(a1 + 8) = 64936;
        CFDataRef v10 = "/usr/local/share/firmware/isp/3811_01XX.dat";
      }
      goto LABEL_147;
    }
    if (a2 != 1027) {
      return result;
    }
    if ((a5 & 0xFFFFFFFE) == 0x5E)
    {
      *(void *)a1 = &unk_100093000;
      *(_DWORD *)(a1 + 8) = 37644;
      CFDataRef v10 = "/usr/local/share/firmware/isp/7521_51XX.dat";
    }
    else if (a8 == 4)
    {
      *(void *)a1 = &unk_100130000;
      *(_DWORD *)(a1 + 8) = 18932;
      CFDataRef v10 = "/usr/local/share/firmware/isp/7521_02XX.dat";
    }
    else
    {
      if (a8 != 5) {
        goto LABEL_114;
      }
      if (a10 > 1)
      {
        if (a3 == 3)
        {
          if (a5 == 178)
          {
            *(void *)a1 = &unk_100115000;
            *(_DWORD *)(a1 + 8) = 66548;
            CFDataRef v10 = "/usr/local/share/firmware/isp/7521_99XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_100126000;
            *(_DWORD *)(a1 + 8) = 39268;
            CFDataRef v10 = "/usr/local/share/firmware/isp/7521_09XX.dat";
          }
        }
        else if (a3 == 2)
        {
          if (a5 == 178)
          {
            *(void *)a1 = &unk_1000FA000;
            *(_DWORD *)(a1 + 8) = 66548;
            CFDataRef v10 = "/usr/local/share/firmware/isp/7521_98XX.dat";
          }
          else
          {
            *(void *)a1 = &unk_10010B000;
            *(_DWORD *)(a1 + 8) = 39268;
            CFDataRef v10 = "/usr/local/share/firmware/isp/7521_08XX.dat";
          }
        }
        else if (a3 == 1 && a5 == 178)
        {
          *(void *)a1 = &unk_1000DF000;
          *(_DWORD *)(a1 + 8) = 66548;
          CFDataRef v10 = "/usr/local/share/firmware/isp/7521_97XX.dat";
        }
        else
        {
          *(void *)a1 = &unk_1000F0000;
          *(_DWORD *)(a1 + 8) = 39268;
          CFDataRef v10 = "/usr/local/share/firmware/isp/7521_07XX.dat";
        }
        goto LABEL_147;
      }
      if (a3 == 3)
      {
        if (a5 == 178)
        {
          *(void *)a1 = &unk_1000C9000;
          *(_DWORD *)(a1 + 8) = 66548;
          CFDataRef v10 = "/usr/local/share/firmware/isp/7521_93XX.dat";
        }
        else
        {
          *(void *)a1 = &unk_1000DA000;
          *(_DWORD *)(a1 + 8) = 19004;
          CFDataRef v10 = "/usr/local/share/firmware/isp/7521_03XX.dat";
        }
        goto LABEL_147;
      }
      if (a3 == 2)
      {
        if (a5 == 178)
        {
          *(void *)a1 = &unk_1000B3000;
          *(_DWORD *)(a1 + 8) = 66548;
          CFDataRef v10 = "/usr/local/share/firmware/isp/7521_95XX.dat";
        }
        else
        {
          *(void *)a1 = &unk_1000C4000;
          *(_DWORD *)(a1 + 8) = 19004;
          CFDataRef v10 = "/usr/local/share/firmware/isp/7521_05XX.dat";
        }
        goto LABEL_147;
      }
      if (a3 == 1 && a5 == 178)
      {
        *(void *)a1 = &unk_10009D000;
        *(_DWORD *)(a1 + 8) = 66548;
        CFDataRef v10 = "/usr/local/share/firmware/isp/7521_91XX.dat";
      }
      else
      {
LABEL_114:
        *(void *)a1 = &unk_1000AE000;
        *(_DWORD *)(a1 + 8) = 19004;
        CFDataRef v10 = "/usr/local/share/firmware/isp/7521_01XX.dat";
      }
    }
  }
LABEL_147:
  long long v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)(a1 + 12) = *(_OWORD *)v10;
  *(_OWORD *)(a1 + 28) = v11;
  __n128 result = *(__n128 *)(v10 + 28);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

double sub_10001C5C8(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, int a8, int a9, unsigned int a10)
{
  *(void *)&double result = sub_10001BA64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10).n128_u64[0];
  return result;
}

uint64_t sub_10001C5D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 56) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = a2;
  *(void *)(a1 + 40) = a3;
  *(void *)(a1 + 64) = pthread_self();
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  *(void *)(a1 + 48) = CFRetain(Current);
  *(void *)(a1 + 72) = 0;
  return a1;
}

uint64_t sub_10001C620(uint64_t a1)
{
  for (unint64_t i = 0; i < CFArrayGetCount(*(CFArrayRef *)a1); ++i)
  {
    CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)a1, i);
    sub_100018CF8((uint64_t)ValueAtIndex);
  }
  io_object_t v4 = *(_DWORD *)(a1 + 56);
  if (v4) {
    IOObjectRelease(v4);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  __int16 v5 = *(IONotificationPort **)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = *(__CFRunLoopSource **)(a1 + 24);
    if (v6)
    {
      CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 48), v6, kCFRunLoopDefaultMode);
      *(void *)(a1 + 24) = 0;
      __int16 v5 = *(IONotificationPort **)(a1 + 16);
    }
    IONotificationPortDestroy(v5);
  }
  mach_port_t v7 = *(NSObject **)(a1 + 72);
  if (v7)
  {
    dispatch_sync(v7, &stru_10002B8C8);
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
    *(void *)(a1 + 72) = 0;
  }
  uint64_t v8 = *(const void **)(a1 + 48);
  if (v8) {
    CFRelease(v8);
  }
  return a1;
}

uint64_t sub_10001C6F4(uint64_t a1)
{
  callBacks.version = 0;
  callBacks.retain = 0;
  callBacks.copyDescription = 0;
  callBacks.equal = 0;
  callBacks.release = (CFArrayReleaseCallBack)sub_10001C8F8;
  CFMutableArrayRef v2 = CFArrayCreateMutable(0, 0, &callBacks);
  *(void *)a1 = v2;
  if (!v2) {
    return 3758097085;
  }
  uint64_t result = IOMasterPort(bootstrap_port, (mach_port_t *)(a1 + 8));
  if (result) {
    return result;
  }
  CFDictionaryRef v4 = IOServiceMatching("AppleH10CamIn");
  __int16 v5 = IONotificationPortCreate(*(_DWORD *)(a1 + 8));
  *(void *)(a1 + 16) = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFDataRef v9 = "IOReturn H10ISP::H10ISPDeviceController::SetupDeviceController()";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: IONotificationPortCreate returned NULL ", buf, 0xCu);
    }
    return 3758097086;
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v5);
  *(void *)(a1 + 24) = RunLoopSource;
  if (!RunLoopSource)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CFDataRef v9 = "IOReturn H10ISP::H10ISPDeviceController::SetupDeviceController()";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: IONotificationPortGetRunLoopSource returned NULL ", buf, 0xCu);
    }
    IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    return 3758097086;
  }
  CFRunLoopAddSource(*(CFRunLoopRef *)(a1 + 48), RunLoopSource, kCFRunLoopDefaultMode);
  uint64_t result = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 16), "IOServiceMatched", v4, (IOServiceMatchingCallback)sub_10001C92C, (void *)a1, (io_iterator_t *)(a1 + 56));
  if (!result)
  {
    *(void *)(a1 + 72) = dispatch_queue_create("com.apple.h10ispdevicecontroller.notifications.queue", 0);
    sub_10001C92C((CFArrayRef *)a1, *(_DWORD *)(a1 + 56));
    return 0;
  }
  return result;
}

void sub_10001C8F8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CFMutableArrayRef v2 = (void *)sub_100018E2C(a2);
    operator delete(v2);
  }
}

uint64_t sub_10001C92C(CFArrayRef *a1, io_iterator_t iterator)
{
  CFMutableDictionaryRef properties = 0;
  while (1)
  {
    uint64_t result = IOIteratorNext(iterator);
    if (!result) {
      break;
    }
    if (!IORegistryEntryCreateCFProperties(result, &properties, kCFAllocatorDefault, 0))
    {
      if (!CFArrayGetCount(*a1)) {
        operator new();
      }
      CFRelease(properties);
    }
  }
  return result;
}

void sub_10001CA08(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CA1C(void *a1, uint64_t a2, uint64_t a3)
{
  pthread_t v8 = 0;
  sub_100011574(&v10);
  v9[0] = 0;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = &v10;
  sched_param v7 = (sched_param)48;
  pthread_attr_init(&v11);
  pthread_attr_setschedparam(&v11, &v7);
  pthread_attr_setdetachstate(&v11, 1);
  pthread_create(&v8, &v11, (void *(__cdecl *)(void *))sub_10001CB28, v9);
  pthread_attr_destroy(&v11);
  sub_1000115B8(&v10);
  *a1 = v9[0];
  sub_1000115B0(&v10);
  return 0;
}

void sub_10001CB0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_10001CB28(uint64_t a1)
{
}

void sub_10001CBBC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CBD0(uint64_t a1)
{
  CFMutableArrayRef v2 = (__CFRunLoop *)CFRetain(*(CFTypeRef *)(a1 + 48));
  CFRunLoopStop(v2);
  __int16 v5 = 0;
  pthread_join(*(pthread_t *)(a1 + 64), &v5);
  uint64_t v3 = (void *)sub_10001C6F0(a1);
  operator delete(v3);
  CFRelease(v2);
  return 0;
}

uint64_t sub_10001CC30(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyValue(a1, a2, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v4)
  {
    CFStringRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      CFTypeID v10 = CFGetTypeID(v5);
      if (v10 == CFNumberGetTypeID())
      {
        unsigned int valuePtr = 0;
        if (CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr)) {
          IntCFArrayRef Value = valuePtr;
        }
        else {
          IntCFArrayRef Value = a3;
        }
      }
      else
      {
        CFTypeID v11 = CFGetTypeID(v5);
        IntCFArrayRef Value = a3;
        if (v11 == CFBooleanGetTypeID()) {
          IntCFArrayRef Value = CFEqual(v5, kCFBooleanTrue);
        }
      }
      goto LABEL_19;
    }
    IntCFArrayRef Value = CFStringGetIntValue(v5);
    if (!IntValue)
    {
      CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
      CStringPtr = CFStringGetCStringPtr(v5, SystemEncoding);
      if (!CStringPtr) {
        goto LABEL_7;
      }
      IntCFArrayRef Value = strtol(CStringPtr, 0, 0);
    }
    if ((int)IntValue > 0)
    {
LABEL_19:
      CFRelease(v5);
      return IntValue;
    }
LABEL_7:
    IntCFArrayRef Value = 1;
    if (CFStringCompare(v5, @"true", 1uLL))
    {
      IntCFArrayRef Value = 1;
      if (CFStringCompare(v5, @"yes", 1uLL))
      {
        if (CFStringCompare(v5, @"false", 1uLL) == kCFCompareEqualTo
          || CFStringCompare(v5, @"no", 1uLL) == kCFCompareEqualTo
          || (IntCFArrayRef Value = a3, CFStringCompare(v5, @"0", 1uLL) == kCFCompareEqualTo))
        {
          IntCFArrayRef Value = 0;
        }
      }
    }
    goto LABEL_19;
  }
  return a3;
}

unsigned int *sub_10001CDE4(uint64_t a1, uint64_t a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 16);
  if (v3)
  {
    CFStringRef v4 = (unsigned int *)(a1 + 20);
    do
    {
      uint64_t v5 = *v4;
      if ((unint64_t)v4 + v5 > a1 + a2) {
        break;
      }
      if (*((unsigned __int16 *)v4 + 4) == a3) {
        return v4 + 1;
      }
      CFStringRef v4 = (unsigned int *)((char *)v4 + (v5 + 4));
      --v3;
    }
    while (v3);
  }
  return 0;
}

CFRunLoopSourceRef sub_10001CE30(uint64_t a1)
{
  CFRunLoopSourceRef result = *(CFRunLoopSourceRef *)(a1 + 16);
  if (!result)
  {
    CFRunLoopSourceRef result = CFMessagePortCreateRunLoopSource(0, *(CFMessagePortRef *)(a1 + 8), 0);
    *(void *)(a1 + 16) = result;
  }
  return result;
}

uint64_t sub_10001CE68(thread_act_t a1, int a2)
{
  integer_t v8 = 0;
  pid_t v4 = getpid();
  if (proc_pidinfo(v4, 2, 0, buffer, 232) <= 0)
  {
    fwrite("H10ISPSetMachThreadPriority - proc_pidinfo() failed\n", 0x34uLL, 1uLL, __stderrp);
    return 0xFFFFFFFFLL;
  }
  else
  {
    policy_mach_timebase_info info = a2 - v11;
    uint64_t v5 = thread_policy_set(a1, 3u, &policy_info, 1u);
    if (v5)
    {
      uint64_t v6 = v5;
      fprintf(__stderrp, "H10ISPSetMachThreadPriority - thread_policy_set(...,THREAD_PRECEDENCE_POLICY,...) failed, err=%d\n", v5);
    }
    else
    {
      uint64_t v6 = thread_policy_set(a1, 1u, &v8, 1u);
      if (v6) {
        fprintf(__stderrp, "H10ISPSetMachThreadPriority - thread_policy_set(...,THREAD_EXTENDED_POLICY,...) failed, err=%d\n", v6);
      }
    }
  }
  return v6;
}

void sub_10001CF98()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5228, "pIn0 != nullptr");
}

void sub_10001CFC4()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5229, "pContext != nullptr");
}

void sub_10001CFF0()
{
}

void sub_10001D01C()
{
}

void sub_10001D048()
{
}

void sub_10001D074()
{
}

void sub_10001D0A0()
{
  __assert_rtn("Process_x1", "PDAFPixelEngine.cpp", 5257, "pContext->geometry.tile.countX * pContext->geometry.tile.countY <= NTILES");
}

void sub_10001D0CC()
{
  __assert_rtn("Process", "PDAFPixelEngine.cpp", 5140, "pContext->geometry.tile.countX * pContext->geometry.tile.countY <= NTILES");
}

void sub_10001D0F8()
{
}

void sub_10001D124()
{
}

void sub_10001D150()
{
}

void sub_10001D17C()
{
}

void sub_10001D1A8()
{
  __assert_rtn("FlowOutputLevel", "PDAFPixelEngine.cpp", 3086, "level == 0");
}

void sub_10001D1D4()
{
}

void sub_10001D200()
{
}

void sub_10001D22C()
{
  __assert_rtn("FlareEstimate", "PDAFPixelEngine.cpp", 2960, "flare.intensity <= Params::Flare::NINTENSITIES");
}

void sub_10001D258()
{
}

void sub_10001D284()
{
  __assert_rtn("FlowPostProcess", "PDAFPixelEngine.cpp", 3229, "pContext->params.flow.levels[0] == 1");
}

void sub_10001D2B0()
{
}

void sub_10001D2DC()
{
  __assert_rtn("CorrPostProcess", "PDAFPixelEngine.cpp", 4840, "SamplingH == SamplingV");
}

void sub_10001D308()
{
}

void sub_10001D334()
{
}

void sub_10001D360()
{
  __assert_rtn("CorrProfile", "PDAFPixelEngine.cpp", 4380, "pContext->geometry.roi.cellCountX == geometryCorr.profileSize");
}

void sub_10001D38C()
{
  __assert_rtn("CorrProfile", "PDAFPixelEngine.cpp", 4386, "pContext->geometry.roi.cellCountY == geometryCorr.profileSize");
}

void sub_10001D3B8(uint64_t a1, uint64_t a2)
{
  int v3 = (unsigned int *)(a1 + 487248);
  uint64_t v4 = 5;
  do
  {
    bzero((void *)(a2 + *(v3 - 1)), *v3);
    v3 += 3;
    --v4;
  }
  while (v4);
  __assert_rtn("CorrProfileSumCols2x1V", "PDAFPixelEngine.cpp", 4247, "false");
}

void sub_10001D414()
{
  __assert_rtn("FlowAccumulateRow1x1Scalar", "PDAFPixelEngine.cpp", 1007, "pixelInBuffer == 0");
}

void sub_10001D440()
{
}

void sub_10001D46C()
{
}

void sub_10001D498()
{
}

void sub_10001D4C4()
{
  __assert_rtn("FlowAccumulateRow2x1Scalar", "PDAFPixelEngine.cpp", 1569, "pixelInBuffer == 0");
}

void sub_10001D4F0()
{
}

void sub_10001D51C()
{
}

void sub_10001D548()
{
  __assert_rtn("FlowAccumulateRow1x1Neon64", "PDAFPixelEngine.cpp", 1281, "pixelInBuffer == 0");
}

void sub_10001D574()
{
}

void sub_10001D5A0()
{
}

void sub_10001D5CC()
{
}

void sub_10001D5F8()
{
  __assert_rtn("CorrProfileSumCols2x1V", "PDAFPixelEngine.cpp", 4267, "pixelInRow != 0");
}

void sub_10001D624()
{
}

void sub_10001D650()
{
}

void sub_10001D67C()
{
}

void sub_10001D6A8()
{
  __assert_rtn("FlowAccumulateRow1x1Scalar", "PDAFPixelEngine.cpp", 1114, "pixelInBuffer == 0");
}

void sub_10001D6D4()
{
  __assert_rtn("FlowAccumulateRow2x1Scalar", "PDAFPixelEngine.cpp", 1680, "pixelInBuffer == 0");
}

void sub_10001D700()
{
  __assert_rtn("FlowAccumulateRow1x1Neon64", "PDAFPixelEngine.cpp", 1455, "pixelInBuffer == 0");
}

void sub_10001D72C()
{
}

void sub_10001D758()
{
}

void sub_10001D784()
{
}

void sub_10001D7B0()
{
}

void sub_10001D7DC()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5278, "pIn0 != nullptr");
}

void sub_10001D808()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5279, "pIn1 != nullptr");
}

void sub_10001D834()
{
  __assert_rtn("Process_x2", "PDAFPixelEngine.cpp", 5280, "pContext != nullptr");
}

void sub_10001D860()
{
}

void sub_10001D88C()
{
}

void sub_10001D8B8()
{
}

void sub_10001D8E4()
{
}

void sub_10001D910()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5366, "pIn0 != nullptr");
}

void sub_10001D93C()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5367, "pIn1 != nullptr");
}

void sub_10001D968()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5368, "pIn2 != nullptr");
}

void sub_10001D994()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5369, "pIn3 != nullptr");
}

void sub_10001D9C0()
{
  __assert_rtn("Process_x4", "PDAFPixelEngine.cpp", 5370, "pContext != nullptr");
}

void sub_10001D9EC()
{
}

void sub_10001DA18()
{
}

void sub_10001DA44()
{
}

void sub_10001DA70()
{
}

void sub_10001DA9C()
{
}

void sub_10001DAC8()
{
}

void sub_10001DAF4()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 652, "afeGeom.initH == 0 || afeGeom.initH == 1");
}

void sub_10001DB20()
{
  __assert_rtn("GetInputFPC", "PDAFPixelEngine.cpp", 726, "fpc != nullptr");
}

void sub_10001DB4C()
{
}

void sub_10001DB78()
{
}

void sub_10001DBA4()
{
}

void sub_10001DBD0()
{
  __assert_rtn("GetInputAFE", "PDAFPixelEngine.cpp", 773, "afe != nullptr");
}

void sub_10001DBFC()
{
}

void sub_10001DC28()
{
}

void sub_10001DC54()
{
  __assert_rtn("FPCAFEGetInputs", "PDAFPixelEngine.cpp", 858, "(cellCountXH == 0) || (cellCountXH == (signed)geometry.roi.cellCountX)");
}

void sub_10001DC80()
{
  __assert_rtn("FPCAFEGetInputs", "PDAFPixelEngine.cpp", 860, "(cellCountXV == 0) || (cellCountXV == (signed)geometry.roi.cellCountX)");
}

void sub_10001DCAC()
{
}

void sub_10001DCD8()
{
  __assert_rtn("FPCAFEGetInputs", "PDAFPixelEngine.cpp", 843, "inputs[k].cellCountY == (signed)geometry.roi.cellCountY");
}

void sub_10001DD04()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 653, "afeGeom.initV == -1");
}

void sub_10001DD30()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 658, "afeGeom.initH == 0 || afeGeom.initH == 1");
}

void sub_10001DD5C()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 659, "afeGeom.initV == 2 || afeGeom.initV == 3");
}

void sub_10001DD88()
{
}

void sub_10001DDB4()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 664, "afeGeom.initV == -1");
}

void sub_10001DDE0()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 663, "afeGeom.initH == 0");
}

void sub_10001DE0C()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 669, "afeGeom.initV == 2");
}

void sub_10001DE38()
{
  __assert_rtn("GetInputBase", "PDAFPixelEngine.cpp", 668, "afeGeom.initH == 0");
}

void sub_10001DE64()
{
  __assert_rtn("AFEGetInputs", "PDAFPixelEngine.cpp", 895, "(cellCountXH == 0) || (cellCountXH == (signed)geometry.roi.cellCountX)");
}

void sub_10001DE90()
{
  __assert_rtn("AFEGetInputs", "PDAFPixelEngine.cpp", 897, "(cellCountXV == 0) || (cellCountXV == (signed)geometry.roi.cellCountX)");
}

void sub_10001DEBC()
{
  __assert_rtn("AFEGetInputs", "PDAFPixelEngine.cpp", 886, "inputs[k].cellCountY == (signed)geometry.roi.cellCountY");
}

void sub_10001DEE8()
{
}

void sub_10001DF14()
{
  __assert_rtn("GetAFEAddress", "PDAFPixelEngine.cpp", 415, "afeGeom.cellCountY >= 4");
}

void sub_10001DF40()
{
}

void sub_10001DF6C()
{
}

void sub_10001DF98()
{
}

void sub_10001DFC4()
{
}

void sub_10001DFF0()
{
  __assert_rtn("CorrProfileSumRows1x1H", "PDAFPixelEngine.cpp", 3917, "pixelInCol != 0");
}

void sub_10001E01C()
{
  __assert_rtn("CorrProfileSumRows1x1H", "PDAFPixelEngine.cpp", 3946, "cellInBuffer == 0");
}

void sub_10001E048()
{
}

void sub_10001E074()
{
}

void sub_10001E0A0()
{
}

void sub_10001E0CC()
{
}

void sub_10001E0F8()
{
}

void sub_10001E124()
{
}

void sub_10001E150()
{
  __assert_rtn("CorrProfileSumCols1x1V", "PDAFPixelEngine.cpp", 4046, "pixelInRow != 0");
}

void sub_10001E17C()
{
  __assert_rtn("CorrProfileSumRows2x1H", "PDAFPixelEngine.cpp", 4168, "pixelInCol != 0");
}

void sub_10001E1A8()
{
  __assert_rtn("CorrProfileSumRows2x1H", "PDAFPixelEngine.cpp", 4187, "cellInBuffer == 0");
}

void sub_10001E1D4()
{
  __assert_rtn("CorrProfileSumRows1x1H", "PDAFPixelEngine.cpp", 3975, "pixelInCol != 0");
}

void sub_10001E200()
{
  __assert_rtn("CorrProfileSumRows1x1H", "PDAFPixelEngine.cpp", 4010, "cellInBuffer == 0");
}

void sub_10001E22C()
{
  __assert_rtn("CorrProfileSumCols1x1V", "PDAFPixelEngine.cpp", 4111, "pixelInRow != 0");
}

void sub_10001E258()
{
  __assert_rtn("CorrProfileSumRows2x1H", "PDAFPixelEngine.cpp", 4207, "pixelInCol != 0");
}

void sub_10001E284()
{
  __assert_rtn("CorrProfileSumRows2x1H", "PDAFPixelEngine.cpp", 4226, "cellInBuffer == 0");
}

void sub_10001E2B0()
{
}

void sub_10001E2DC()
{
  __assert_rtn("Process", "BlurM.cpp", 1751, "pContext != 0");
}

void sub_10001E308()
{
  __assert_rtn("LSCAverageGreenApple", "LSCComputeFromNVM.cpp", 780, "pLSCConfig->channelGR.gridCountY == pLSCConfig->channelGB.gridCountY");
}

void sub_10001E334()
{
  __assert_rtn("LSCAverageGreenApple", "LSCComputeFromNVM.cpp", 779, "pLSCConfig->channelGR.gridCountX == pLSCConfig->channelGB.gridCountX");
}

uint64_t AMFDRLogSetHandler()
{
  return _AMFDRLogSetHandler();
}

uint64_t AMFDRSealingManifestCopyLocalDataForClass()
{
  return _AMFDRSealingManifestCopyLocalDataForClass();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return _AMFDRSealingMapCopyLocalDataForClass();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
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

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMachPortCreateWithPort(allocator, portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFRunLoopSourceRef CFMessagePortCreateRunLoopSource(CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order)
{
  return _CFMessagePortCreateRunLoopSource(allocator, local, order);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallAsyncMethod(connection, selector, wake_port, reference, referenceCnt, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOCreateReceivePort(uint32_t msgType, mach_port_t *recvPort)
{
  return _IOCreateReceivePort(msgType, recvPort);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
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

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  return _acos(__x);
}

long double atan(long double __x)
{
  return _atan(__x);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  return _cos(__x);
}

char *__cdecl dirname(char *a1)
{
  return _dirname(a1);
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return _fseeko(__stream, a2, __whence);
}

off_t ftello(FILE *__stream)
{
  return _ftello(__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

float log2f(float a1)
{
  return _log2f(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void perror(const char *a1)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return _pthread_attr_setschedparam(a1, a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return _pthread_mach_thread_np(a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_destroy(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return _strcat(__s1, __s2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return _strncat(__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return _strtok(__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

long double tan(long double __x)
{
  return _tan(__x);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return [a1 sharedDataAccessor];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}