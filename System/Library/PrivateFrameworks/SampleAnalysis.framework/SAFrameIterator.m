@interface SAFrameIterator
- (BOOL)assumeUserBinaryLoadInfosContainMainBinary;
- (BOOL)checkLR;
- (BOOL)hasKernelStack;
- (BOOL)hasStack;
- (BOOL)hasSwiftAsyncStack;
- (BOOL)hasUserStack;
- (BOOL)isKernelStackTruncated;
- (BOOL)isSwiftAsyncStackTruncated;
- (BOOL)isUserStackTruncated;
- (NSArray)kernelBinaryLoadInfos;
- (NSArray)userBinaryLoadInfos;
- (NSMutableDictionary)addressTranslations;
- (NSString)debugDescription;
- (SAFrameIterator)init;
- (SASharedCache)sharedCache;
- (uint64_t)addressForStackDepth:(uint64_t *)a3 frames:(uint64_t)a4 numFrames:(int)a5 isUserspace:(int)a6 isSwiftAsync:(BOOL *)a7 isLeaf:(_DWORD *)a8 frameIndexUsed:;
- (uint64_t)translatedAddressForNativeAddress:(uint64_t)a1;
- (unint64_t)backtracer;
- (unint64_t)continuation;
- (unint64_t)kernelFrames;
- (unint64_t)swiftAsyncFrames;
- (unint64_t)userFrames;
- (unsigned)exclaveInsertionIndex;
- (unsigned)numKernelFrames;
- (unsigned)numSwiftAsyncFrames;
- (unsigned)numUserFrames;
- (unsigned)swiftAsyncStitchIndex;
- (void)binaryLoadInfoForUserAddress:(void *)a1;
- (void)clearTaskData;
- (void)clearThreadData;
- (void)dealloc;
- (void)iterateFramesWithBacktraceStyle:(unint64_t)a3 block:(id)a4;
- (void)setAddressTranslations:(id)a3;
- (void)setAssumeUserBinaryLoadInfosContainMainBinary:(BOOL)a3;
- (void)setBacktracer:(unint64_t)a3;
- (void)setCheckLR:(BOOL)a3;
- (void)setContinuation:(unint64_t)a3;
- (void)setExclaveInsertionIndex:(unsigned int)a3;
- (void)setIsKernelStackTruncated:(BOOL)a3;
- (void)setIsSwiftAsyncStackTruncated:(BOOL)a3;
- (void)setIsUserStackTruncated:(BOOL)a3;
- (void)setKernelBinaryLoadInfos:(id)a3;
- (void)setKernelFrames:(unint64_t *)a3;
- (void)setNumKernelFrames:(unsigned int)a3;
- (void)setNumSwiftAsyncFrames:(unsigned int)a3;
- (void)setNumUserFrames:(unsigned int)a3;
- (void)setSharedCache:(id)a3;
- (void)setSwiftAsyncFrames:(unint64_t *)a3;
- (void)setSwiftAsyncStitchIndex:(unsigned int)a3;
- (void)setUserBinaryLoadInfos:(id)a3;
- (void)setUserFrames:(unint64_t *)a3;
@end

@implementation SAFrameIterator

- (void)setSharedCache:(id)a3
{
}

- (void)setBacktracer:(unint64_t)a3
{
  self->_backtracer = a3;
}

- (void)setUserBinaryLoadInfos:(id)a3
{
}

- (SAFrameIterator)init
{
  v9.receiver = self;
  v9.super_class = (Class)SAFrameIterator;
  v2 = [(SAFrameIterator *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(SAFrame);
    frame = v2->_frame;
    v2->_frame = v3;

    v5 = (SAExclaveFrame *)-[SAExclaveFrame initWithExclave:]([SAExclaveFrame alloc], 0);
    exclaveFrame = v2->_exclaveFrame;
    v2->_exclaveFrame = v5;

    v7 = v2->_exclaveFrame;
    if (v7) {
      v7->super._BOOLs.bits |= 8u;
    }
    v2->_exclaveInsertionIndex = -1;
  }
  return v2;
}

- (void)binaryLoadInfoForUserAddress:(void *)a1
{
  if (a1)
  {
    a1 = +[SABinaryLoadInfo binaryLoadInfoForAddress:a2 inBinaryLoadInfos:a1[8] libraryCache:a1[10]];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)translatedAddressForNativeAddress:(uint64_t)a1
{
  uint64_t v2 = a2;
  v3 = *(void **)(a1 + 120);
  if (v3)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:a2];
    v6 = [v3 objectForKeyedSubscript:v5];

    if (v6)
    {
      uint64_t v7 = [v6 unsignedLongLongValue];
      if (v7)
      {
LABEL_7:

        return v7;
      }
    }
    else
    {
      v8 = [NSNumber numberWithUnsignedLongLong:0];
      objc_super v9 = *(void **)(a1 + 120);
      v10 = [NSNumber numberWithUnsignedLongLong:v2];
      [v9 setObject:v8 forKeyedSubscript:v10];
    }
    uint64_t v7 = v2;
    goto LABEL_7;
  }
  return v2;
}

- (uint64_t)addressForStackDepth:(uint64_t *)a3 frames:(uint64_t)a4 numFrames:(int)a5 isUserspace:(int)a6 isSwiftAsync:(BOOL *)a7 isLeaf:(_DWORD *)a8 frameIndexUsed:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!a3 || (uint64_t v9 = a4, !a4))
  {
    int v25 = *__error();
    v26 = _sa_logt();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v26, OS_LOG_TYPE_ERROR, "No frames", buf, 2u);
    }

    *__error() = v25;
    _SASetCrashLogMessage(643, "No frames", v27, v28, v29, v30, v31, v32, v41);
    _os_crash();
    __break(1u);
LABEL_63:
    int v33 = *__error();
    v34 = _sa_logt();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v43 = v8;
      __int16 v44 = 1024;
      int v45 = v9;
      _os_log_error_impl(&dword_1BF22B000, v34, OS_LOG_TYPE_ERROR, "stack depth %d, but only %d frames", buf, 0xEu);
    }

    *__error() = v33;
    _SASetCrashLogMessage(644, "stack depth %d, but only %d frames", v35, v36, v37, v38, v39, v40, v8);
    _os_crash();
    __break(1u);
  }
  unsigned int v8 = a2;
  if (a2 >= a4) {
    goto LABEL_63;
  }
  if (a6)
  {
    int v12 = ~a2 + a4;
    if (!a8) {
      return a3[v12];
    }
    goto LABEL_29;
  }
  switch(*(void *)(a1 + 56))
  {
    case 0:
      goto LABEL_28;
    case 1:
      int v15 = a4 - 1;
      if (a4 - 1 == a2)
      {
        if (a4 != 1) {
          goto LABEL_44;
        }
        *a7 = 1;
        if (a8) {
          *a8 = 0;
        }
        if (!a5 || !*(void *)(a1 + 120)) {
          return *a3;
        }
LABEL_21:
        uint64_t v16 = *a3;
        return -[SAFrameIterator translatedAddressForNativeAddress:](a1, v16);
      }
      int v12 = a4 - 2 - a2;
      *a7 = a4 - 2 == a2;
      if (a8) {
        *a8 = v12;
      }
      if (a5 && a4 - 2 == a2 && *(void *)(a1 + 120))
      {
        uint64_t v20 = *a3;
        uint64_t v9 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
        if (v9 == v20)
        {
          if (*(unsigned char *)(a1 + 28))
          {
            uint64_t v21 = a3[v15];
            uint64_t v22 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, v21);
            if (v22 == v21) {
              return v20;
            }
            else {
              return v22;
            }
          }
          else
          {
            return v20;
          }
        }
        return v9;
      }
      return a3[v12];
    case 2:
      int v12 = ~a2 + a4;
      *a7 = v12 == 0;
      if (a8) {
        *a8 = v12;
      }
      if (!a5 || v12 || !*(void *)(a1 + 120)) {
        return a3[v12];
      }
      goto LABEL_21;
    case 3:
      if (!a5 || !*(void *)(a1 + 120) || (int v18 = a4 - 2, v19 = a4 - 1, a4 - 2 != a2) && v19 != a2)
      {
LABEL_28:
        int v12 = ~a2 + a4;
        *a7 = v12 == 0;
        if (!a8) {
          return a3[v12];
        }
LABEL_29:
        *a8 = v12;
        return a3[v12];
      }
      uint64_t v9 = *a3;
      uint64_t v23 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, *a3);
      if (v23 != v9)
      {
        if (v18 == v8)
        {
          *a7 = 0;
          if (a8) {
            *a8 = 1;
          }
          return a3[1];
        }
        *a7 = 1;
        if (a8) {
          *a8 = 0;
        }
        return v23;
      }
      if (v19 != v8)
      {
        *a7 = 1;
        uint64_t v24 = a3[1];
        uint64_t v23 = -[SAFrameIterator translatedAddressForNativeAddress:](a1, v24);
        if (v23 == v24)
        {
          if (a8) {
            *a8 = 0;
          }
          return v9;
        }
        if (a8) {
          *a8 = 1;
        }
        return v23;
      }
LABEL_44:
      if (!a8) {
        return 0;
      }
      uint64_t v9 = 0;
      *a8 = -1;
      return v9;
    default:
      return v9;
  }
}

- (void)iterateFramesWithBacktraceStyle:(unint64_t)a3 block:(id)a4
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  unsigned int v8 = (void (**)(id, SAFrame *))a4;
  if ((a3 & 2) != 0) {
    goto LABEL_70;
  }
  if ((a3 & 8) != 0 && (a3 & 0x14) != 0)
  {
    int v63 = *__error();
    _sa_logt();
    self = (SAFrameIterator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v122 = a3;
      _os_log_error_impl(&dword_1BF22B000, &self->super, OS_LOG_TYPE_ERROR, "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx", buf, 0xCu);
    }

    *__error() = v63;
    _SASetCrashLogMessage(850, "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx", v64, v65, v66, v67, v68, v69, a3);
    _os_crash();
    __break(1u);
    goto LABEL_115;
  }
  unsigned int numUserFrames = self->_numUserFrames;
  unint64_t backtracer = self->_backtracer;
  if (backtracer - 2 < 2) {
    goto LABEL_7;
  }
  if (backtracer == 1)
  {
    BOOL v11 = numUserFrames >= 2;
    unsigned int v12 = numUserFrames - 2;
LABEL_9:
    if (v11) {
      LODWORD(v4) = v12;
    }
    else {
      LODWORD(v4) = 0;
    }
    goto LABEL_12;
  }
  if (!backtracer)
  {
LABEL_7:
    BOOL v11 = numUserFrames != 0;
    unsigned int v12 = numUserFrames - 1;
    goto LABEL_9;
  }
LABEL_12:
  if (self->_numSwiftAsyncFrames) {
    unsigned int isSwiftAsyncStackTruncated = 1;
  }
  else {
    unsigned int isSwiftAsyncStackTruncated = self->_isSwiftAsyncStackTruncated;
  }
  int v13 = 1;
  if ((a3 & 0x10) == 0
    && isSwiftAsyncStackTruncated
    && ((a3 & 4) == 0 || v4 < self->_swiftAsyncStitchIndex))
  {
    [(SAFrame *)self->_frame reset];
    frame = self->_frame;
    if (frame) {
      frame->_BOOLs.bits |= 2u;
    }
    if (self->_isSwiftAsyncStackTruncated)
    {
      int v15 = self->_frame;
      if (v15)
      {
        v15->_BOOLs.bits |= 8u;
        uint64_t v16 = self->_frame;
      }
      else
      {
        uint64_t v16 = 0;
      }
      v8[2](v8, v16);
      v17 = self->_frame;
      if (v17) {
        v17->_BOOLs.bits &= ~8u;
      }
    }
    uint64_t numSwiftAsyncFrames = self->_numSwiftAsyncFrames;
    if (numSwiftAsyncFrames)
    {
      unsigned int v19 = 0;
      do
      {
        uint64_t v20 = -[SAFrameIterator addressForStackDepth:frames:numFrames:isUserspace:isSwiftAsync:isLeaf:frameIndexUsed:]((uint64_t)self, v19, (uint64_t *)self->_swiftAsyncFrames, numSwiftAsyncFrames, 1, 1, (BOOL *)buf, 0);
        uint64_t v21 = self->_frame;
        if (v21) {
          v21->_address = v20;
        }
        uint64_t v22 = -[SAFrameIterator binaryLoadInfoForUserAddress:](self, v20);
        uint64_t v23 = self->_frame;
        if (v23) {
          objc_storeWeak((id *)&v23->_binaryLoadInfo, v22);
        }

        v8[2](v8, self->_frame);
        ++v19;
        uint64_t numSwiftAsyncFrames = self->_numSwiftAsyncFrames;
      }
      while (v19 < numSwiftAsyncFrames);
    }
    int v13 = 0;
  }
  if ((a3 & 0x18) != 0) {
    unsigned int v24 = isSwiftAsyncStackTruncated;
  }
  else {
    unsigned int v24 = 0;
  }
  if (self->_swiftAsyncStitchIndex > self->_numUserFrames)
  {
LABEL_115:
    int v70 = *__error();
    v71 = _sa_logt();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      unsigned int swiftAsyncStitchIndex = self->_swiftAsyncStitchIndex;
      LODWORD(v4) = self->_numUserFrames;
      id v73 = [(SAFrameIterator *)self debugDescription];
      uint64_t v74 = [v73 UTF8String];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v122 = swiftAsyncStitchIndex;
      *(_WORD *)&v122[4] = 1024;
      *(_DWORD *)&v122[6] = v4;
      __int16 v123 = 2080;
      unint64_t v124 = v74;
      _os_log_error_impl(&dword_1BF22B000, v71, OS_LOG_TYPE_ERROR, "_swiftAsyncStitchIndex %u, _numUserFrames %u: %s", buf, 0x18u);
    }
    *__error() = v70;
    unsigned int v75 = self->_swiftAsyncStitchIndex;
    self = [(SAFrameIterator *)self debugDescription];
    [(SAFrameIterator *)self UTF8String];
    _SASetCrashLogMessage(884, "_swiftAsyncStitchIndex %u, _numUserFrames %u: %s", v76, v77, v78, v79, v80, v81, v75);

    _os_crash();
    __break(1u);
LABEL_118:
    int v82 = *__error();
    v83 = _sa_logt();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      unsigned int numKernelFrames = self->_numKernelFrames;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v122 = numKernelFrames;
      _os_log_error_impl(&dword_1BF22B000, v83, OS_LOG_TYPE_ERROR, "%d _numKernelFrames", buf, 8u);
    }

    *__error() = v82;
    _SASetCrashLogMessage(948, "%d _numKernelFrames", v85, v86, v87, v88, v89, v90, self->_numKernelFrames);
    _os_crash();
    __break(1u);
    goto LABEL_121;
  }
  if ((v13 | v24 ^ 1) != 1) {
    goto LABEL_70;
  }
  [(SAFrame *)self->_frame reset];
  char v25 = v13 ^ 1;
  if (!self->_isUserStackTruncated) {
    char v25 = 1;
  }
  if ((v25 & 1) == 0)
  {
    v26 = self->_frame;
    if (v26)
    {
      v26->_BOOLs.bits |= 8u;
      uint64_t v27 = self->_frame;
    }
    else
    {
      uint64_t v27 = 0;
    }
    v8[2](v8, v27);
    uint64_t v28 = self->_frame;
    if (v28) {
      v28->_BOOLs.bits &= ~8u;
    }
  }
  userFrames = self->_userFrames;
  if (!userFrames) {
    goto LABEL_70;
  }
  if (!self->_numUserFrames)
  {
LABEL_121:
    a3 = *__error();
    v91 = _sa_logt();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      unsigned int v92 = self->_numUserFrames;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v122 = v92;
      _os_log_error_impl(&dword_1BF22B000, v91, OS_LOG_TYPE_ERROR, "%d _numUserFrames", buf, 8u);
    }

    *__error() = a3;
    _SASetCrashLogMessage(900, "%d _numUserFrames", v93, v94, v95, v96, v97, v98, self->_numUserFrames);
    _os_crash();
    __break(1u);
    goto LABEL_124;
  }
  unsigned int isSwiftAsyncStackTruncated = v4 + 1;
  if (!self->_assumeUserBinaryLoadInfosContainMainBinary) {
    goto LABEL_52;
  }
  uint64_t v30 = [(NSArray *)self->_userBinaryLoadInfos firstObject];
  uint64_t v31 = [v30 loadAddress];

  if (!v31)
  {
    userFrames = self->_userFrames;
LABEL_52:
    if (*((_DWORD *)userFrames + 1)) {
      unint64_t v33 = 0x100000000;
    }
    else {
      unint64_t v33 = *MEMORY[0x1E4F14B00];
    }
    goto LABEL_55;
  }
  uint64_t v32 = [(NSArray *)self->_userBinaryLoadInfos firstObject];
  unint64_t v33 = [v32 loadAddress];

LABEL_55:
  unsigned int v34 = self->_swiftAsyncStitchIndex;
  if (v34 > isSwiftAsyncStackTruncated)
  {
LABEL_124:
    int v99 = *__error();
    v100 = _sa_logt();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      unsigned int v101 = self->_swiftAsyncStitchIndex;
      a3 = [(SAFrameIterator *)self debugDescription];
      uint64_t v102 = [(id)a3 UTF8String];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v122 = v101;
      *(_WORD *)&v122[4] = 1024;
      *(_DWORD *)&v122[6] = v4;
      __int16 v123 = 2080;
      unint64_t v124 = v102;
      _os_log_error_impl(&dword_1BF22B000, v100, OS_LOG_TYPE_ERROR, "_swiftAsyncStitchIndex %u, maxDepth %u: %s", buf, 0x18u);
    }
    *__error() = v99;
    unsigned int v103 = self->_swiftAsyncStitchIndex;
    self = [(SAFrameIterator *)self debugDescription];
    [(SAFrameIterator *)self UTF8String];
    _SASetCrashLogMessage(915, "_swiftAsyncStitchIndex %u, maxDepth %u: %s", v104, v105, v106, v107, v108, v109, v103);

    _os_crash();
    __break(1u);
LABEL_127:
    int v110 = *__error();
    v111 = _sa_logt();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      unsigned int v112 = self->_numUserFrames;
      unsigned int v113 = self->_swiftAsyncStitchIndex;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v122 = isSwiftAsyncStackTruncated;
      *(_WORD *)&v122[4] = 1024;
      *(_DWORD *)&v122[6] = v112;
      __int16 v123 = 2048;
      unint64_t v124 = a3;
      __int16 v125 = 1024;
      unsigned int v126 = v113;
      _os_log_error_impl(&dword_1BF22B000, v111, OS_LOG_TYPE_ERROR, "endingDepth %u, numUserFrames %u, backtraceStyle 0x%llx, stitchIndex %u", buf, 0x1Eu);
    }

    *__error() = v110;
    _SASetCrashLogMessage(920, "endingDepth %u, numUserFrames %u, backtraceStyle 0x%llx, stitchIndex %u", v114, v115, v116, v117, v118, v119, isSwiftAsyncStackTruncated);
    _os_crash();
    __break(1u);
  }
  unsigned int v35 = v4 - v34;
  if (v13) {
    unsigned int v36 = 0;
  }
  else {
    unsigned int v36 = v35 + 1;
  }
  unsigned int isSwiftAsyncStackTruncated = self->_numUserFrames;
  if (v24)
  {
    unsigned int isSwiftAsyncStackTruncated = v35 + 1;
    if (v35 + 1 > self->_numUserFrames) {
      goto LABEL_127;
    }
  }
  if (v36 < isSwiftAsyncStackTruncated)
  {
    do
    {
      buf[0] = 0;
      unint64_t v37 = -[SAFrameIterator addressForStackDepth:frames:numFrames:isUserspace:isSwiftAsync:isLeaf:frameIndexUsed:]((uint64_t)self, v36, (uint64_t *)self->_userFrames, self->_numUserFrames, 1, 0, (BOOL *)buf, 0);
      LOBYTE(v13) = v13 & (v37 < v33);
      if ((v13 & 1) == 0)
      {
        int v38 = buf[0];
        uint64_t v39 = self->_frame;
        if (v39)
        {
          v39->_BOOLs.bits = (v39->_BOOLs.bits & 0xFE | buf[0]) ^ 1;
          uint64_t v40 = self->_frame;
          if (v40) {
            v40->_address = v37;
          }
        }
        v4 = -[SAFrameIterator binaryLoadInfoForUserAddress:](self, v37);
        char v41 = self->_frame;
        if (v41) {
          objc_storeWeak((id *)&v41->_binaryLoadInfo, v4);
        }

        v8[2](v8, self->_frame);
        if (v38) {
          break;
        }
      }
      ++v36;
    }
    while (isSwiftAsyncStackTruncated != v36);
  }
LABEL_70:
  if ((a3 & 0x19) != 0) {
    goto LABEL_111;
  }
  [(SAFrame *)self->_frame reset];
  v42 = self->_frame;
  if (v42) {
    v42->_BOOLs.bits |= 4u;
  }
  if (self->_kernelFrames)
  {
    if (self->_numKernelFrames)
    {
      if (self->_isKernelStackTruncated)
      {
        unsigned int v43 = self->_frame;
        if (v43)
        {
          v43->_BOOLs.bits |= 8u;
          __int16 v44 = self->_frame;
        }
        else
        {
          __int16 v44 = 0;
        }
        v8[2](v8, v44);
        int v45 = self->_frame;
        if (v45) {
          v45->_BOOLs.bits &= ~8u;
        }
      }
      uint64_t v46 = self->_numKernelFrames;
      if (self->_exclaveInsertionIndex == -1) {
        int v47 = 1;
      }
      else {
        int v47 = (a3 >> 5) & 1;
      }
      if (*((_DWORD *)self->_kernelFrames + 1)) {
        unint64_t v48 = 0xFFFFFFFFLL;
      }
      else {
        unint64_t v48 = *MEMORY[0x1E4F14B00] - 1;
      }
      if (v46)
      {
        unsigned int v49 = 0;
        int v50 = 0;
        char v51 = 1;
        do
        {
          BOOL v120 = 0;
          *(_DWORD *)buf = -1;
          unint64_t v52 = -[SAFrameIterator addressForStackDepth:frames:numFrames:isUserspace:isSwiftAsync:isLeaf:frameIndexUsed:]((uint64_t)self, v49, (uint64_t *)self->_kernelFrames, v46, 0, 0, &v120, buf);
          if (((v47 | v50) & 1) == 0)
          {
            if (*(_DWORD *)buf >= self->_exclaveInsertionIndex)
            {
              int v50 = 0;
            }
            else
            {
              v8[2](v8, &self->_exclaveFrame->super);
              int v50 = 1;
            }
          }
          v51 &= v52 < v48;
          if ((v51 & 1) == 0)
          {
            BOOL v53 = v120;
            v54 = self->_frame;
            if (v54)
            {
              v54->_BOOLs.bits = (v54->_BOOLs.bits & 0xFE | v120) ^ 1;
              v55 = self->_frame;
              if (v55) {
                v55->_address = v52;
              }
            }
            v56 = +[SABinaryLoadInfo binaryLoadInfoForAddress:v52 inBinaryLoadInfos:self->_kernelBinaryLoadInfos libraryCache:0];
            v57 = self->_frame;
            if (v57) {
              objc_storeWeak((id *)&v57->_binaryLoadInfo, v56);
            }

            v8[2](v8, self->_frame);
            if (v53) {
              break;
            }
          }
          ++v49;
          uint64_t v46 = self->_numKernelFrames;
        }
        while (v49 < v46);
      }
      else
      {
        int v50 = 0;
      }
      if (((v47 | v50) & 1) == 0)
      {
        exclaveFrame = self->_exclaveFrame;
LABEL_110:
        v8[2](v8, &exclaveFrame->super);
        goto LABEL_111;
      }
      goto LABEL_111;
    }
    goto LABEL_118;
  }
  unint64_t continuation = self->_continuation;
  if (continuation)
  {
    v59 = self->_frame;
    if (v59) {
      v59->_address = continuation;
    }
    v60 = +[SABinaryLoadInfo binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:](SABinaryLoadInfo, "binaryLoadInfoForAddress:inBinaryLoadInfos:libraryCache:");
    v61 = self->_frame;
    if (v61) {
      objc_storeWeak((id *)&v61->_binaryLoadInfo, v60);
    }

    exclaveFrame = (SAExclaveFrame *)self->_frame;
    goto LABEL_110;
  }
LABEL_111:
}

- (void)clearThreadData
{
  userFrames = self->_userFrames;
  if (userFrames) {
    free(userFrames);
  }
  self->_userFrames = 0;
  self->_unsigned int numUserFrames = 0;
  self->_isUserStackTruncated = 0;
  swiftAsyncFrames = self->_swiftAsyncFrames;
  if (swiftAsyncFrames) {
    free(swiftAsyncFrames);
  }
  self->_swiftAsyncFrames = 0;
  self->_unsigned int isSwiftAsyncStackTruncated = 0;
  self->_uint64_t numSwiftAsyncFrames = 0;
  self->_unsigned int swiftAsyncStitchIndex = 0;
  kernelFrames = self->_kernelFrames;
  if (kernelFrames) {
    free(kernelFrames);
  }
  self->_kernelFrames = 0;
  self->_unint64_t continuation = 0;
  *(void *)&self->_unsigned int numKernelFrames = 0xFFFFFFFF00000000;
  *(_WORD *)&self->_isKernelStackTruncated = 0;
}

- (void)clearTaskData
{
  userBinaryLoadInfos = self->_userBinaryLoadInfos;
  self->_userBinaryLoadInfos = 0;

  self->_assumeUserBinaryLoadInfosContainMainBinary = 0;
  sharedCache = self->_sharedCache;
  self->_sharedCache = 0;

  addressTranslations = self->_addressTranslations;
  self->_addressTranslations = 0;
}

- (BOOL)hasStack
{
  if ([(SAFrameIterator *)self hasUserStack]) {
    return 1;
  }
  return [(SAFrameIterator *)self hasKernelStack];
}

- (BOOL)hasUserStack
{
  return self->_numUserFrames != 0;
}

- (BOOL)hasSwiftAsyncStack
{
  return self->_numSwiftAsyncFrames || self->_isSwiftAsyncStackTruncated;
}

- (BOOL)hasKernelStack
{
  return self->_numKernelFrames || self->_continuation != 0;
}

- (void)dealloc
{
  [(SAFrameIterator *)self clearThreadData];
  v3.receiver = self;
  v3.super_class = (Class)SAFrameIterator;
  [(SAFrameIterator *)&v3 dealloc];
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t numKernelFrames = self->_numKernelFrames;
  if (numKernelFrames) {
    unint64_t v5 = *self->_kernelFrames;
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t numUserFrames = self->_numUserFrames;
  if (numUserFrames) {
    unint64_t v7 = *self->_userFrames;
  }
  else {
    unint64_t v7 = 0;
  }
  uint64_t numSwiftAsyncFrames = self->_numSwiftAsyncFrames;
  if (numSwiftAsyncFrames) {
    unint64_t v9 = *self->_swiftAsyncFrames;
  }
  else {
    unint64_t v9 = 0;
  }
  v10 = (void *)[v3 initWithFormat:@"stack with %d kernel frames (leaf 0x%llx), %d user (leaf 0x%llx), %d swift async (leaf 0x%llx), backtracer %llu, exclave@%u", numKernelFrames, v5, numUserFrames, v7, numSwiftAsyncFrames, v9, self->_backtracer, self->_exclaveInsertionIndex];
  return (NSString *)v10;
}

- (unint64_t)backtracer
{
  return self->_backtracer;
}

- (BOOL)assumeUserBinaryLoadInfosContainMainBinary
{
  return self->_assumeUserBinaryLoadInfosContainMainBinary;
}

- (void)setAssumeUserBinaryLoadInfosContainMainBinary:(BOOL)a3
{
  self->_assumeUserBinaryLoadInfosContainMainBinary = a3;
}

- (NSArray)userBinaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)kernelBinaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKernelBinaryLoadInfos:(id)a3
{
}

- (SASharedCache)sharedCache
{
  return (SASharedCache *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)userFrames
{
  return self->_userFrames;
}

- (void)setUserFrames:(unint64_t *)a3
{
  self->_userFrames = a3;
}

- (unsigned)numUserFrames
{
  return self->_numUserFrames;
}

- (void)setNumUserFrames:(unsigned int)a3
{
  self->_uint64_t numUserFrames = a3;
}

- (BOOL)isUserStackTruncated
{
  return self->_isUserStackTruncated;
}

- (void)setIsUserStackTruncated:(BOOL)a3
{
  self->_isUserStackTruncated = a3;
}

- (unint64_t)swiftAsyncFrames
{
  return self->_swiftAsyncFrames;
}

- (void)setSwiftAsyncFrames:(unint64_t *)a3
{
  self->_swiftAsyncFrames = a3;
}

- (unsigned)numSwiftAsyncFrames
{
  return self->_numSwiftAsyncFrames;
}

- (void)setNumSwiftAsyncFrames:(unsigned int)a3
{
  self->_uint64_t numSwiftAsyncFrames = a3;
}

- (unsigned)swiftAsyncStitchIndex
{
  return self->_swiftAsyncStitchIndex;
}

- (void)setSwiftAsyncStitchIndex:(unsigned int)a3
{
  self->_unsigned int swiftAsyncStitchIndex = a3;
}

- (BOOL)isSwiftAsyncStackTruncated
{
  return self->_isSwiftAsyncStackTruncated;
}

- (void)setIsSwiftAsyncStackTruncated:(BOOL)a3
{
  self->_unsigned int isSwiftAsyncStackTruncated = a3;
}

- (unint64_t)kernelFrames
{
  return self->_kernelFrames;
}

- (void)setKernelFrames:(unint64_t *)a3
{
  self->_kernelFrames = a3;
}

- (unsigned)numKernelFrames
{
  return self->_numKernelFrames;
}

- (void)setNumKernelFrames:(unsigned int)a3
{
  self->_uint64_t numKernelFrames = a3;
}

- (unint64_t)continuation
{
  return self->_continuation;
}

- (void)setContinuation:(unint64_t)a3
{
  self->_unint64_t continuation = a3;
}

- (unsigned)exclaveInsertionIndex
{
  return self->_exclaveInsertionIndex;
}

- (void)setExclaveInsertionIndex:(unsigned int)a3
{
  self->_exclaveInsertionIndex = a3;
}

- (BOOL)isKernelStackTruncated
{
  return self->_isKernelStackTruncated;
}

- (void)setIsKernelStackTruncated:(BOOL)a3
{
  self->_isKernelStackTruncated = a3;
}

- (NSMutableDictionary)addressTranslations
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAddressTranslations:(id)a3
{
}

- (BOOL)checkLR
{
  return self->_checkLR;
}

- (void)setCheckLR:(BOOL)a3
{
  self->_checkLR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressTranslations, 0);
  objc_storeStrong((id *)&self->_sharedCache, 0);
  objc_storeStrong((id *)&self->_kernelBinaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_userBinaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_exclaveFrame, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

@end