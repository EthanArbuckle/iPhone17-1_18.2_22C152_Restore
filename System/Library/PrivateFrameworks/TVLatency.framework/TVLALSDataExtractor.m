@interface TVLALSDataExtractor
+ (id)extractALSCalibrationData;
+ (unsigned)_displayID;
+ (void)extract:(unint64_t)a3 ALSReadings:(id)a4;
+ (void)extractALSCalibrationData;
+ (void)extractALSData:(id)a3;
- (TVLALSDataExtractor)init;
- (void)dealloc;
@end

@implementation TVLALSDataExtractor

- (TVLALSDataExtractor)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVLALSDataExtractor;
  v2 = [(TVLALSDataExtractor *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    results = v2->_results;
    v2->_results = v3;
  }
  return v2;
}

- (void)dealloc
{
  _UnregisterHIDSystemClient(self);
  v3.receiver = self;
  v3.super_class = (Class)TVLALSDataExtractor;
  [(TVLALSDataExtractor *)&v3 dealloc];
}

+ (id)extractALSCalibrationData
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  CFDataRef v3 = (const __CFData *)AMFDRSealingMapCopyLocalDataForClass();
  CFIndex Length = CFDataGetLength(v3);
  if (Length == 10440)
  {
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    v5 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C7FF000, v5, OS_LOG_TYPE_INFO, "Found HmClData_VD6287", buf, 2u);
    }
    CFDataGetBytePtr(v3);
    CFDataRef v6 = convertNighthawkHmClv1Tov3();
    if (v6)
    {
      CFDataRef v7 = v6;
      CFRelease(v3);
      CFIndex v8 = CFDataGetLength(v7);
      if (_TVLLogDefault_onceToken_2 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
      }
      v9 = _TVLLogDefault_log_2;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        CFIndex v104 = v8;
        _os_log_impl(&dword_22C7FF000, v9, OS_LOG_TYPE_INFO, "FDR calibration data converted from v1 to v3. New size = %ld\n", buf, 0xCu);
      }
      CFDataRef v3 = v7;
    }
    else
    {
      CFIndex v8 = 10440;
    }
  }
  else
  {
    CFIndex v8 = Length;
  }
  v10 = objc_alloc_init(TVLALSCalibrationData);
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "_displayID"));
  [(TVLALSCalibrationData *)v10 setDisplayID:v11];

  if (v8 > 10235)
  {
    if (v8 == 10348)
    {
      if (_TVLLogDefault_onceToken_2 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
      }
      v74 = _TVLLogDefault_log_2;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C7FF000, v74, OS_LOG_TYPE_INFO, "Found HmClData_VD6287_v3", buf, 2u);
      }
      BytePtr = (UInt8 *)CFDataGetBytePtr(v3);
      if (isInternalBuild_onceToken != -1) {
        dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_52);
      }
      if (isInternalBuild_internalBuild)
      {
        if (_TVLLogDefault_onceToken_2 != -1) {
          dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
        }
        print_HmCl_VD6287_v3(BytePtr, (os_log_t)_TVLLogDefault_log_2);
      }
      if (BytePtr[10] != 2)
      {
        if (_TVLLogDefault_onceToken_2 != -1) {
          dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
        }
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR)) {
          +[TVLALSDataExtractor extractALSCalibrationData].cold.4();
        }
        goto LABEL_130;
      }
      if (BytePtr[5214] != 1)
      {
        if (_TVLLogDefault_onceToken_2 != -1) {
          dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
        }
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR)) {
          +[TVLALSDataExtractor extractALSCalibrationData]();
        }
        goto LABEL_130;
      }
      v101 = BytePtr + 5218;
      if (BytePtr[5218] == 5)
      {
        [(TVLALSCalibrationData *)v10 setVersion:&unk_26DFE9210];
        v76 = [NSNumber numberWithInt:BytePtr[5218]];
        [(TVLALSCalibrationData *)v10 setChannels:v76];

        v77 = [NSNumber numberWithInt:*(unsigned __int16 *)(BytePtr + 5443)];
        [(TVLALSCalibrationData *)v10 setWavelengthStartVisible:v77];

        v78 = [NSNumber numberWithInt:*(unsigned __int16 *)(BytePtr + 5445)];
        [(TVLALSCalibrationData *)v10 setWavelengthStartNIR:v78];

        v79 = [NSNumber numberWithInt:*(unsigned __int16 *)(BytePtr + 5447)];
        [(TVLALSCalibrationData *)v10 setWavelengthEnd:v79];

        v80 = [NSNumber numberWithInt:BytePtr[5449]];
        [(TVLALSCalibrationData *)v10 setWavelengthStep:v80];

        v81 = [NSNumber numberWithInt:*(unsigned int *)(BytePtr + 5415)];
        [(TVLALSCalibrationData *)v10 setNormalizationFactor:v81];

        int v82 = *(unsigned __int16 *)(BytePtr + 5447);
        int v83 = *(unsigned __int16 *)(BytePtr + 5443);
        int v84 = BytePtr[5449];
        id v102 = objc_alloc_init(MEMORY[0x263EFF980]);
        if (!BytePtr[5218]) {
          goto LABEL_50;
        }
        CFDataRef v97 = v3;
        v98 = v10;
        unint64_t v85 = 0;
        int v86 = (~v83 + v82 + v84) / v84;
        v87 = BytePtr + 5452;
        do
        {
          id v88 = objc_alloc_init(MEMORY[0x263EFF980]);
          v89 = v87;
          uint64_t v90 = (v86 & ~(v86 >> 31)) + 1;
          if ((v86 & 0x80000000) == 0)
          {
            do
            {
              unsigned int v91 = *(__int16 *)v89;
              v89 += 2;
              v92 = [NSNumber numberWithInt:v91];
              [v88 addObject:v92];

              --v90;
            }
            while (v90);
          }
          v93 = [MEMORY[0x263EFF8C0] arrayWithArray:v88];
          [v102 addObject:v93];

          ++v85;
          v87 += 802;
        }
        while (v85 < *v101);
        goto LABEL_49;
      }
      v95 = _TVLLogDefault();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
        +[TVLALSDataExtractor extractALSCalibrationData]();
      }
      goto LABEL_129;
    }
    if (v8 == 10236)
    {
      if (_TVLLogDefault_onceToken_2 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
      }
      v32 = _TVLLogDefault_log_2;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C7FF000, v32, OS_LOG_TYPE_INFO, "Found HmClData", buf, 2u);
      }
      v33 = CFDataGetBytePtr(v3);
      if (isInternalBuild_onceToken != -1) {
        dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_52);
      }
      if (isInternalBuild_internalBuild)
      {
        if (_TVLLogDefault_onceToken_2 != -1) {
          dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
        }
        print_HmClData((uint64_t)v33, (os_log_t)_TVLLogDefault_log_2);
      }
      [(TVLALSCalibrationData *)v10 setVersion:&unk_26DFE91F8];
      v34 = [NSNumber numberWithInt:v33[80]];
      [(TVLALSCalibrationData *)v10 setChannels:v34];

      v35 = [NSNumber numberWithInt:*((unsigned __int16 *)v33 + 168)];
      [(TVLALSCalibrationData *)v10 setWavelengthStartVisible:v35];

      v36 = [NSNumber numberWithInt:*((unsigned __int16 *)v33 + 169)];
      [(TVLALSCalibrationData *)v10 setWavelengthStartNIR:v36];

      v37 = [NSNumber numberWithInt:*((unsigned __int16 *)v33 + 170)];
      [(TVLALSCalibrationData *)v10 setWavelengthEnd:v37];

      v38 = [NSNumber numberWithInt:v33[342]];
      [(TVLALSCalibrationData *)v10 setWavelengthStep:v38];

      v39 = [NSNumber numberWithInt:*((unsigned int *)v33 + 74)];
      [(TVLALSCalibrationData *)v10 setNormalizationFactor:v39];

      int v40 = *((unsigned __int16 *)v33 + 170);
      int v41 = *((unsigned __int16 *)v33 + 168);
      int v42 = v33[342];
      id v102 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (!v33[80]) {
        goto LABEL_50;
      }
      CFDataRef v97 = v3;
      v98 = v10;
      unint64_t v43 = 0;
      int v44 = (~v41 + v40 + v42) / v42;
      v45 = v33 + 344;
      do
      {
        id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
        v47 = v45;
        uint64_t v48 = (v44 & ~(v44 >> 31)) + 1;
        if ((v44 & 0x80000000) == 0)
        {
          do
          {
            unsigned int v49 = *(__int16 *)v47;
            v47 += 2;
            v50 = [NSNumber numberWithInt:v49];
            [v46 addObject:v50];

            --v48;
          }
          while (v48);
        }
        v51 = [MEMORY[0x263EFF8C0] arrayWithArray:v46];
        [v102 addObject:v51];

        ++v43;
        v45 += 802;
      }
      while (v43 < v33[80]);
      goto LABEL_49;
    }
    goto LABEL_87;
  }
  if (v8 == 8672)
  {
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    v54 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C7FF000, v54, OS_LOG_TYPE_INFO, "Found HmClData_VD6287_v4", buf, 2u);
    }
    v55 = CFDataGetBytePtr(v3);
    if (strncmp((const char *)v55, "lCmH", 5uLL))
    {
      if (v55[4] == 4)
      {
        if (v55[10] == 2)
        {
          if (v55[4376] == 1)
          {
            v100 = (unsigned __int8 *)(v55 + 4380);
            if (v55[4380] == 5)
            {
              [(TVLALSCalibrationData *)v10 setVersion:&unk_26DFE9210];
              v56 = [NSNumber numberWithInt:v55[4380]];
              [(TVLALSCalibrationData *)v10 setChannels:v56];

              v57 = [NSNumber numberWithInt:*(unsigned __int16 *)(v55 + 4571)];
              [(TVLALSCalibrationData *)v10 setWavelengthStartVisible:v57];

              v58 = [NSNumber numberWithInt:*(unsigned __int16 *)(v55 + 4573)];
              [(TVLALSCalibrationData *)v10 setWavelengthStartNIR:v58];

              v59 = [NSNumber numberWithInt:*(unsigned __int16 *)(v55 + 4575)];
              [(TVLALSCalibrationData *)v10 setWavelengthEnd:v59];

              v60 = [NSNumber numberWithInt:v55[4577]];
              [(TVLALSCalibrationData *)v10 setWavelengthStep:v60];

              v61 = [NSNumber numberWithInt:*(unsigned int *)(v55 + 4547)];
              [(TVLALSCalibrationData *)v10 setNormalizationFactor:v61];

              int v62 = *(unsigned __int16 *)(v55 + 4575);
              int v63 = *(unsigned __int16 *)(v55 + 4571);
              int v64 = v55[4577];
              id v102 = objc_alloc_init(MEMORY[0x263EFF980]);
              if (!v55[4380]) {
                goto LABEL_50;
              }
              CFDataRef v97 = v3;
              v98 = v10;
              unint64_t v65 = 0;
              int v66 = (~v63 + v62 + v64) / v64;
              v67 = v55 + 4578;
              do
              {
                id v68 = objc_alloc_init(MEMORY[0x263EFF980]);
                v69 = v67;
                uint64_t v70 = (v66 & ~(v66 >> 31)) + 1;
                if ((v66 & 0x80000000) == 0)
                {
                  do
                  {
                    unsigned int v71 = *(__int16 *)v69;
                    v69 += 2;
                    v72 = [NSNumber numberWithInt:v71];
                    [v68 addObject:v72];

                    --v70;
                  }
                  while (v70);
                }
                v73 = [MEMORY[0x263EFF8C0] arrayWithArray:v68];
                [v102 addObject:v73];

                ++v65;
                v67 += 802;
              }
              while (v65 < *v100);
              goto LABEL_49;
            }
            v95 = _TVLLogDefault();
            if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
              goto LABEL_129;
            }
            goto LABEL_128;
          }
          v95 = _TVLLogDefault();
          if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
LABEL_129:

            goto LABEL_130;
          }
LABEL_122:
          +[TVLALSDataExtractor extractALSCalibrationData]();
          goto LABEL_129;
        }
        v95 = _TVLLogDefault();
        if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
          goto LABEL_129;
        }
LABEL_116:
        +[TVLALSDataExtractor extractALSCalibrationData].cold.4();
        goto LABEL_129;
      }
      if (_TVLLogDefault_onceToken_2 != -1) {
        dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
      }
      if (!os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_130;
      }
      goto LABEL_106;
    }
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    if (!os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_130;
    }
LABEL_98:
    +[TVLALSDataExtractor extractALSCalibrationData].cold.5();
LABEL_130:
    v53 = 0;
    goto LABEL_131;
  }
  if (v8 != 8760)
  {
LABEL_87:
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    v94 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_FAULT)) {
      +[TVLALSDataExtractor extractALSCalibrationData];
    }
    goto LABEL_130;
  }
  if (_TVLLogDefault_onceToken_2 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
  }
  v12 = _TVLLogDefault_log_2;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C7FF000, v12, OS_LOG_TYPE_INFO, "Found HmClData_VD6287_v4_od", buf, 2u);
  }
  v13 = CFDataGetBytePtr(v3);
  if (!strncmp((const char *)v13, "lCmH", 5uLL))
  {
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    if (!os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_130;
    }
    goto LABEL_98;
  }
  if (v13[4] != 4)
  {
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    if (!os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_130;
    }
LABEL_106:
    +[TVLALSDataExtractor extractALSCalibrationData].cold.9();
    goto LABEL_130;
  }
  if (v13[10] != 2)
  {
    v95 = _TVLLogDefault();
    if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
      goto LABEL_129;
    }
    goto LABEL_116;
  }
  if (v13[4420] != 1)
  {
    v95 = _TVLLogDefault();
    if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
      goto LABEL_129;
    }
    goto LABEL_122;
  }
  v99 = (unsigned __int8 *)(v13 + 4424);
  if (v13[4424] != 5)
  {
    v95 = _TVLLogDefault();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
LABEL_128:
      +[TVLALSDataExtractor extractALSCalibrationData].cold.6();
      goto LABEL_129;
    }
    goto LABEL_129;
  }
  [(TVLALSCalibrationData *)v10 setVersion:&unk_26DFE9210];
  v14 = [NSNumber numberWithInt:v13[4424]];
  [(TVLALSCalibrationData *)v10 setChannels:v14];

  v15 = [NSNumber numberWithInt:*(unsigned __int16 *)(v13 + 4657)];
  [(TVLALSCalibrationData *)v10 setWavelengthStartVisible:v15];

  v16 = [NSNumber numberWithInt:*(unsigned __int16 *)(v13 + 4659)];
  [(TVLALSCalibrationData *)v10 setWavelengthStartNIR:v16];

  v17 = [NSNumber numberWithInt:*(unsigned __int16 *)(v13 + 4661)];
  [(TVLALSCalibrationData *)v10 setWavelengthEnd:v17];

  v18 = [NSNumber numberWithInt:v13[4663]];
  [(TVLALSCalibrationData *)v10 setWavelengthStep:v18];

  v19 = [NSNumber numberWithInt:*(unsigned int *)(v13 + 4591)];
  [(TVLALSCalibrationData *)v10 setNormalizationFactor:v19];

  int v20 = *(unsigned __int16 *)(v13 + 4661);
  int v21 = *(unsigned __int16 *)(v13 + 4657);
  int v22 = v13[4663];
  id v102 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v13[4424])
  {
    CFDataRef v97 = v3;
    v98 = v10;
    unint64_t v23 = 0;
    int v24 = (~v21 + v20 + v22) / v22;
    v25 = v13 + 4664;
    do
    {
      id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
      v27 = v25;
      uint64_t v28 = (v24 & ~(v24 >> 31)) + 1;
      if ((v24 & 0x80000000) == 0)
      {
        do
        {
          unsigned int v29 = *(__int16 *)v27;
          v27 += 2;
          v30 = [NSNumber numberWithInt:v29];
          [v26 addObject:v30];

          --v28;
        }
        while (v28);
      }
      v31 = [MEMORY[0x263EFF8C0] arrayWithArray:v26];
      [v102 addObject:v31];

      ++v23;
      v25 += 802;
    }
    while (v23 < *v99);
LABEL_49:
    CFDataRef v3 = v97;
    v10 = v98;
  }
LABEL_50:
  v52 = [MEMORY[0x263EFF8C0] arrayWithArray:v102];
  [(TVLALSCalibrationData *)v10 setSpectrumNom:v52];

  if (v3) {
    CFRelease(v3);
  }
  v53 = v10;
LABEL_131:

  return v53;
}

+ (unsigned)_displayID
{
  *(void *)mainPort = 0;
  if (!IOMasterPort(0, mainPort))
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(mainPort[0], "IODeviceTree:/arm-io/disp0");
    if (v2)
    {
      io_object_t v3 = v2;
      CFDataRef v4 = (const __CFData *)IORegistryEntrySearchCFProperty(v2, "IODeviceTree", @"color-accuracy-index", (CFAllocatorRef)*MEMORY[0x263EFFB08], 1u);
      if (v4)
      {
        CFDataRef v5 = v4;
        v8.location = 0;
        v8.length = 4;
        CFDataGetBytes(v4, v8, (UInt8 *)&mainPort[1]);
        CFRelease(v5);
      }
      IOObjectRelease(v3);
    }
    if (mainPort[0]) {
      mach_port_deallocate(*MEMORY[0x263EF8960], mainPort[0]);
    }
  }
  return mainPort[1];
}

+ (void)extractALSData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__TVLALSDataExtractor_extractALSData___block_invoke;
  v6[3] = &unk_26491E8C8;
  id v7 = v4;
  id v5 = v4;
  [a1 extract:1 ALSReadings:v6];
}

void __38__TVLALSDataExtractor_extractALSData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

+ (void)extract:(unint64_t)a3 ALSReadings:(id)a4
{
  id v5 = a4;
  CFDataRef v6 = objc_alloc_init(TVLALSDataExtractor);
  [(NSTimer *)v6->_timer invalidate];
  v6->_readCount = a3;
  objc_initWeak(&location, v6);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke;
  v25[3] = &unk_26491E918;
  objc_copyWeak(&v27, &location);
  id v7 = v5;
  id v26 = v7;
  uint64_t v8 = MEMORY[0x230F6CE70](v25);
  id completion = v6->_completion;
  v6->_id completion = (id)v8;

  v10 = v6;
  v11 = (void *)MEMORY[0x263EFFA20];
  double v12 = (double)v6->_readCount * 1.5;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  int v22 = __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_3;
  unint64_t v23 = &unk_26491E940;
  v13 = v10;
  int v24 = v13;
  uint64_t v14 = [v11 timerWithTimeInterval:0 repeats:&v20 block:v12];
  timer = v6->_timer;
  v6->_timer = (NSTimer *)v14;

  v16 = objc_msgSend(MEMORY[0x263EFF9F0], "mainRunLoop", v20, v21, v22, v23);
  [v16 addTimer:v6->_timer forMode:*MEMORY[0x263EFF588]];

  v17 = v13;
  if (!v17->_ioHIDSystemClient)
  {
    if (_TVLLogDefault_onceToken_2 != -1) {
      dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
    }
    v18 = _TVLLogDefault_log_2;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C7FF000, v18, OS_LOG_TYPE_INFO, "ScheduleHIDEventSystemClient", buf, 2u);
    }
    uint64_t v19 = IOHIDEventSystemClientCreateWithType();
    IOHIDEventSystemClientRegisterEventCallback();
    CFRunLoopGetMain();
    IOHIDEventSystemClientScheduleWithRunLoop();
    v17->_ioHIDSystemClient = (__IOHIDEventSystemClient *)v19;
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    _UnregisterHIDSystemClient(WeakRetained);
    [v5[5] invalidate];
    id v6 = v5[5];
    v5[5] = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_2;
  v9[3] = &unk_26491E8F0;
  id v7 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_TVLLogDefault_onceToken_2 != -1) {
    dispatch_once(&_TVLLogDefault_onceToken_2, &__block_literal_global_2);
  }
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_2, OS_LOG_TYPE_ERROR)) {
    __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_3_cold_1();
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_results, 0);

  objc_storeStrong(&self->_completion, 0);
}

+ (void)extractALSCalibrationData
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22C7FF000, v0, OS_LOG_TYPE_ERROR, "Calibration version_major=%u, expected=%u\n", v1, 0xEu);
}

void __43__TVLALSDataExtractor_extract_ALSReadings___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_22C7FF000, v0, v1, "TVLALSDataExtractor timed out to receive HID events", v2, v3, v4, v5, v6);
}

@end