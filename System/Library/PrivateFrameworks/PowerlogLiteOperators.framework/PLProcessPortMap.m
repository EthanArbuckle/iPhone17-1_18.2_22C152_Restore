@interface PLProcessPortMap
+ (id)sharedInstance;
- (BOOL)isAddressIPV4:(id)a3;
- (NSMutableDictionary)ipAddrLookupMap;
- (NSMutableDictionary)lenientLookupMap;
- (NSMutableDictionary)localPortOnlyLookupMap;
- (NSMutableDictionary)strictLookupMap;
- (OS_dispatch_queue)workQueue;
- (PLProcessPortMap)init;
- (id)dictFromNetPortInfo:(net_port_info *)a3;
- (id)getLookupKeys:(id)a3;
- (id)keyForIPAddrLookup:(id)a3 withSourceAddress:(id)a4;
- (id)keyForlenientLookup:(id)a3 withPort:(id)a4 withProtocol:(id)a5;
- (id)keyForlocalPortLookup:(id)a3 withProtocol:(id)a4;
- (id)keyFromAddress:(id)a3 withPort:(id)a4 withSourceAddress:(id)a5 withSourcePort:(id)a6 withProtocol:(id)a7;
- (id)pidAndProcessNameForDestAddress:(id)a3 withDestPort:(id)a4 withSourceAddress:(id)a5 withSourcePort:(id)a6 withProtocol:(id)a7;
- (void)clearPortMap;
- (void)clearPortMapInternal;
- (void)dealloc;
- (void)reconstructPortMap;
- (void)reconstructPortMapInternal;
- (void)setIpAddrLookupMap:(id)a3;
- (void)setLenientLookupMap:(id)a3;
- (void)setLocalPortOnlyLookupMap:(id)a3;
- (void)setStrictLookupMap:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation PLProcessPortMap

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PLProcessPortMap_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EBD5BCE8 != -1) {
    dispatch_once(&qword_1EBD5BCE8, block);
  }
  v2 = (void *)qword_1EBD5BCE0;
  return v2;
}

uint64_t __34__PLProcessPortMap_sharedInstance__block_invoke()
{
  objc_opt_class();
  qword_1EBD5BCE0 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (PLProcessPortMap)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLProcessPortMap;
  v2 = [(PLProcessPortMap *)&v11 init];
  v3 = v2;
  if (v2)
  {
    strictLookupMap = v2->_strictLookupMap;
    v2->_strictLookupMap = 0;

    lenientLookupMap = v3->_lenientLookupMap;
    v3->_lenientLookupMap = 0;

    localPortOnlyLookupMap = v3->_localPortOnlyLookupMap;
    v3->_localPortOnlyLookupMap = 0;

    ipAddrLookupMap = v3->_ipAddrLookupMap;
    v3->_ipAddrLookupMap = 0;

    uint64_t v8 = [MEMORY[0x1E4F92A88] workQueueForClass:objc_opt_class()];
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PLProcessPortMap;
  [(PLProcessPortMap *)&v2 dealloc];
}

- (void)reconstructPortMap
{
  v3 = [(PLProcessPortMap *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__PLProcessPortMap_reconstructPortMap__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_async_and_wait(v3, block);
}

uint64_t __38__PLProcessPortMap_reconstructPortMap__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reconstructPortMapInternal];
}

- (void)clearPortMap
{
  v3 = [(PLProcessPortMap *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PLProcessPortMap_clearPortMap__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_async_and_wait(v3, block);
}

uint64_t __32__PLProcessPortMap_clearPortMap__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearPortMapInternal];
}

- (id)pidAndProcessNameForDestAddress:(id)a3 withDestPort:(id)a4 withSourceAddress:(id)a5 withSourcePort:(id)a6 withProtocol:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  v17 = [(PLProcessPortMap *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke;
  block[3] = &unk_1E692B228;
  block[4] = self;
  id v26 = v16;
  id v27 = v12;
  id v28 = v14;
  id v30 = v15;
  v31 = &v32;
  id v29 = v13;
  id v18 = v15;
  id v19 = v13;
  id v20 = v14;
  id v21 = v12;
  id v22 = v16;
  dispatch_async_and_wait(v17, block);

  id v23 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke(uint64_t a1)
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [*(id *)(a1 + 32) strictLookupMap];

  if (!v2)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      v133[0] = MEMORY[0x1E4F143A8];
      v133[1] = 3221225472;
      v133[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_2;
      v133[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v133[4] = v3;
      if (qword_1EBD5BCF0 != -1) {
        dispatch_once(&qword_1EBD5BCF0, v133);
      }
      if (_MergedGlobals_84)
      {
        v4 = [NSString stringWithFormat:@"reconstructing the port map"];
        v5 = (void *)MEMORY[0x1E4F929B8];
        v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
        v7 = [v6 lastPathComponent];
        uint64_t v8 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke"];
        [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:92];

        v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v135 = v4;
          _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [*(id *)(a1 + 32) reconstructPortMapInternal];
  }
  int v10 = [*(id *)(a1 + 40) isEqualToString:@"ESP"];
  objc_super v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);
  if (v10)
  {
    id v13 = [v11 keyForIPAddrLookup:v12 withSourceAddress:*(void *)(a1 + 56)];
    id v14 = [*(id *)(a1 + 32) ipAddrLookupMap];
    uint64_t v15 = [v14 objectForKeyedSubscript:v13];
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v18 = objc_opt_class();
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_80;
      v132[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v132[4] = v18;
      if (qword_1EBD5BCF8 != -1) {
        dispatch_once(&qword_1EBD5BCF8, v132);
      }
      if (byte_1EBD5BCC9)
      {
        id v19 = [NSString stringWithFormat:@"ESP protocol key %@ and pid and process %@", v13, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
        id v20 = (void *)MEMORY[0x1E4F929B8];
        id v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
        id v22 = [v21 lastPathComponent];
        id v23 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:100];

        v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v135 = v19;
LABEL_99:
          _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_89;
        }
        goto LABEL_89;
      }
    }
    goto LABEL_90;
  }
  id v13 = [v11 keyFromAddress:v12 withPort:*(void *)(a1 + 64) withSourceAddress:*(void *)(a1 + 56) withSourcePort:*(void *)(a1 + 72) withProtocol:*(void *)(a1 + 40)];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v25 = objc_opt_class();
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_87;
    v131[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v131[4] = v25;
    if (qword_1EBD5BD00 != -1) {
      dispatch_once(&qword_1EBD5BD00, v131);
    }
    if (byte_1EBD5BCCA)
    {
      id v26 = [NSString stringWithFormat:@"looking up %@", v13];
      id v27 = (void *)MEMORY[0x1E4F929B8];
      id v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      id v29 = [v28 lastPathComponent];
      id v30 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
      [v27 logMessage:v26 fromFile:v29 fromFunction:v30 fromLineNumber:104];

      v31 = PLLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v135 = v26;
        _os_log_debug_impl(&dword_1D2690000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v32 = objc_opt_class();
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_93;
    v130[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v130[4] = v32;
    if (qword_1EBD5BD08 != -1) {
      dispatch_once(&qword_1EBD5BD08, v130);
    }
    if (byte_1EBD5BCCB)
    {
      v33 = NSString;
      uint64_t v34 = [*(id *)(a1 + 32) strictLookupMap];
      v35 = [v33 stringWithFormat:@"strictLookupMap=%@", v34];

      v36 = (void *)MEMORY[0x1E4F929B8];
      id v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      v38 = [v37 lastPathComponent];
      v39 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
      [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:105];

      v40 = PLLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v135 = v35;
        _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v41 = [*(id *)(a1 + 32) strictLookupMap];
  uint64_t v42 = [v41 objectForKeyedSubscript:v13];
  uint64_t v43 = *(void *)(*(void *)(a1 + 80) + 8);
  v44 = *(void **)(v43 + 40);
  *(void *)(v43 + 40) = v42;

  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    if ([*(id *)(a1 + 32) isAddressIPV4:*(void *)(a1 + 48)]) {
      v52 = @"0.0.0.0";
    }
    else {
      v52 = @"::";
    }
    v46 = [*(id *)(a1 + 32) keyFromAddress:v52 withPort:*(void *)(a1 + 64) withSourceAddress:v52 withSourcePort:*(void *)(a1 + 72) withProtocol:*(void *)(a1 + 40)];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v53 = objc_opt_class();
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_99;
      v129[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v129[4] = v53;
      if (qword_1EBD5BD10 != -1) {
        dispatch_once(&qword_1EBD5BD10, v129);
      }
      if (byte_1EBD5BCCC)
      {
        v54 = [NSString stringWithFormat:@"The search key is %@", v46];
        v55 = (void *)MEMORY[0x1E4F929B8];
        v56 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
        v57 = [v56 lastPathComponent];
        v58 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
        [v55 logMessage:v54 fromFile:v57 fromFunction:v58 fromLineNumber:119];

        v59 = PLLogCommon();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v135 = v54;
          _os_log_debug_impl(&dword_1D2690000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v60 = [*(id *)(a1 + 32) strictLookupMap];
    uint64_t v61 = [v60 objectForKeyedSubscript:v46];
    uint64_t v62 = *(void *)(*(void *)(a1 + 80) + 8);
    v63 = *(void **)(v62 + 40);
    *(void *)(v62 + 40) = v61;

    if (!v61)
    {
      uint64_t v64 = [*(id *)(a1 + 32) keyFromAddress:@"*" withPort:*(void *)(a1 + 64) withSourceAddress:@"*" withSourcePort:*(void *)(a1 + 72) withProtocol:*(void *)(a1 + 40)];

      v65 = [*(id *)(a1 + 32) strictLookupMap];
      uint64_t v66 = [v65 objectForKeyedSubscript:v64];
      uint64_t v67 = *(void *)(*(void *)(a1 + 80) + 8);
      v68 = *(void **)(v67 + 40);
      *(void *)(v67 + 40) = v66;

      v46 = v64;
    }
    uint64_t v69 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    int v70 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (v69)
    {
      if (!v70) {
        goto LABEL_82;
      }
      uint64_t v71 = objc_opt_class();
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_123;
      v125[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v125[4] = v71;
      if (qword_1EBD5BD30 != -1) {
        dispatch_once(&qword_1EBD5BD30, v125);
      }
      if (!byte_1EBD5BCD0) {
        goto LABEL_82;
      }
      v51 = [NSString stringWithFormat:@"Wild card match succeeded!"];
      v72 = (void *)MEMORY[0x1E4F929B8];
      v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      v74 = [v73 lastPathComponent];
      v75 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
      [v72 logMessage:v51 fromFile:v74 fromFunction:v75 fromLineNumber:143];

      v76 = PLLogCommon();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v135 = v51;
        _os_log_debug_impl(&dword_1D2690000, v76, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    else
    {
      if (v70)
      {
        uint64_t v77 = objc_opt_class();
        v128[0] = MEMORY[0x1E4F143A8];
        v128[1] = 3221225472;
        v128[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_105;
        v128[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v128[4] = v77;
        if (qword_1EBD5BD18 != -1) {
          dispatch_once(&qword_1EBD5BD18, v128);
        }
        if (byte_1EBD5BCCD)
        {
          v78 = NSString;
          v79 = [*(id *)(a1 + 32) lenientLookupMap];
          v80 = [v78 stringWithFormat:@"Lenient Map = %@", v79];

          v81 = (void *)MEMORY[0x1E4F929B8];
          v82 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
          v83 = [v82 lastPathComponent];
          v84 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
          [v81 logMessage:v80 fromFile:v83 fromFunction:v84 fromLineNumber:128];

          v85 = PLLogCommon();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v135 = v80;
            _os_log_debug_impl(&dword_1D2690000, v85, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v51 = [*(id *)(a1 + 32) keyForlenientLookup:*(void *)(a1 + 48) withPort:*(void *)(a1 + 64) withProtocol:*(void *)(a1 + 40)];
      v86 = [*(id *)(a1 + 32) lenientLookupMap];
      uint64_t v87 = [v86 objectForKeyedSubscript:v51];
      uint64_t v88 = *(void *)(*(void *)(a1 + 80) + 8);
      v89 = *(void **)(v88 + 40);
      *(void *)(v88 + 40) = v87;

      uint64_t v90 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      int v91 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v90)
      {
        if (!v91) {
          goto LABEL_81;
        }
        uint64_t v92 = objc_opt_class();
        v126[0] = MEMORY[0x1E4F143A8];
        v126[1] = 3221225472;
        v126[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_117;
        v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v126[4] = v92;
        if (qword_1EBD5BD28 != -1) {
          dispatch_once(&qword_1EBD5BD28, v126);
        }
        if (!byte_1EBD5BCCF) {
          goto LABEL_81;
        }
        v76 = [NSString stringWithFormat:@"3 tuple match succeeded!"];
        v93 = (void *)MEMORY[0x1E4F929B8];
        v94 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
        v95 = [v94 lastPathComponent];
        v96 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
        [v93 logMessage:v76 fromFile:v95 fromFunction:v96 fromLineNumber:140];

        v97 = PLLogCommon();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v135 = v76;
          _os_log_debug_impl(&dword_1D2690000, v97, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
      else
      {
        if (v91)
        {
          uint64_t v98 = objc_opt_class();
          v127[0] = MEMORY[0x1E4F143A8];
          v127[1] = 3221225472;
          v127[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_111;
          v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v127[4] = v98;
          if (qword_1EBD5BD20 != -1) {
            dispatch_once(&qword_1EBD5BD20, v127);
          }
          if (byte_1EBD5BCCE)
          {
            v99 = NSString;
            v100 = [*(id *)(a1 + 32) localPortOnlyLookupMap];
            v101 = [v99 stringWithFormat:@"Local Port Only Map =%@", v100];

            v102 = (void *)MEMORY[0x1E4F929B8];
            v103 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
            v104 = [v103 lastPathComponent];
            v105 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
            [v102 logMessage:v101 fromFile:v104 fromFunction:v105 fromLineNumber:135];

            v106 = PLLogCommon();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v135 = v101;
              _os_log_debug_impl(&dword_1D2690000, v106, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        v76 = [*(id *)(a1 + 32) keyForlocalPortLookup:*(void *)(a1 + 64) withProtocol:*(void *)(a1 + 40)];
        v97 = [*(id *)(a1 + 32) localPortOnlyLookupMap];
        uint64_t v107 = [v97 objectForKeyedSubscript:v76];
        uint64_t v108 = *(void *)(*(void *)(a1 + 80) + 8);
        v109 = *(void **)(v108 + 40);
        *(void *)(v108 + 40) = v107;
      }
    }

LABEL_81:
LABEL_82:

    goto LABEL_83;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v45 = objc_opt_class();
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_129;
    v124[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v124[4] = v45;
    if (qword_1EBD5BD38 != -1) {
      dispatch_once(&qword_1EBD5BD38, v124);
    }
    if (byte_1EBD5BCD1)
    {
      v46 = [NSString stringWithFormat:@"5 tuple match succeeded!"];
      v47 = (void *)MEMORY[0x1E4F929B8];
      v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      v49 = [v48 lastPathComponent];
      v50 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
      [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:146];

      v51 = PLLogCommon();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v135 = v46;
        _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_81;
    }
  }
LABEL_83:
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
    && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v110 = objc_opt_class();
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_135;
    v123[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v123[4] = v110;
    if (qword_1EBD5BD40 != -1) {
      dispatch_once(&qword_1EBD5BD40, v123);
    }
    if (byte_1EBD5BCD2)
    {
      id v19 = [NSString stringWithFormat:@"lookup failed at all stages. Protocol %@ Dest Port %@", *(void *)(a1 + 40), *(void *)(a1 + 64)];
      v111 = (void *)MEMORY[0x1E4F929B8];
      v112 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      v113 = [v112 lastPathComponent];
      v114 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
      [v111 logMessage:v19 fromFile:v113 fromFunction:v114 fromLineNumber:150];

      v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v135 = v19;
        goto LABEL_99;
      }
LABEL_89:
    }
  }
LABEL_90:

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v115 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_141;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v115;
    if (qword_1EBD5BD48 != -1) {
      dispatch_once(&qword_1EBD5BD48, block);
    }
    if (byte_1EBD5BCD3)
    {
      v116 = [NSString stringWithFormat:@"pidAndProcessName=%@", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      v117 = (void *)MEMORY[0x1E4F929B8];
      v118 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      v119 = [v118 lastPathComponent];
      v120 = [NSString stringWithUTF8String:"-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2"];
      [v117 logMessage:v116 fromFile:v119 fromFunction:v120 fromLineNumber:153];

      v121 = PLLogCommon();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v135 = v116;
        _os_log_debug_impl(&dword_1D2690000, v121, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_84 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_80(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCC9 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_87(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCCA = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_93(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCCB = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_99(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCCC = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_105(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCCD = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_111(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCCE = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_117(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCCF = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_123(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD0 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_129(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD1 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_135(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD2 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_141(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD3 = result;
  return result;
}

- (BOOL)isAddressIPV4:(id)a3
{
  return [a3 containsString:@"."];
}

- (id)keyFromAddress:(id)a3 withPort:(id)a4 withSourceAddress:(id)a5 withSourcePort:(id)a6 withProtocol:(id)a7
{
  return (id)[NSString stringWithFormat:@"%@:%@_%@_%@_%@", a7, a3, a4, a5, a6];
}

- (id)keyForlenientLookup:(id)a3 withPort:(id)a4 withProtocol:(id)a5
{
  return (id)[NSString stringWithFormat:@"%@:%@_%@", a5, a3, a4];
}

- (id)keyForlocalPortLookup:(id)a3 withProtocol:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@:%@", a4, a3];
}

- (id)keyForIPAddrLookup:(id)a3 withSourceAddress:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@_%@", a3, a4];
}

- (id)dictFromNetPortInfo:(net_port_info *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned __int16 var1 = a3->var1;
  if (var1)
  {
    inet_ntop(2, &a3->var6, v18, 0x2Eu);
    p_var7 = &a3->var7;
    int v6 = 2;
  }
  else
  {
    if ((var1 & 2) == 0)
    {
      v18[0] = 0;
      v17[0] = 0;
      goto LABEL_7;
    }
    inet_ntop(30, &a3->var6, v18, 0x2Eu);
    p_var7 = &a3->var7;
    int v6 = 30;
  }
  inet_ntop(v6, p_var7, v17, 0x2Eu);
LABEL_7:
  v7 = [NSString stringWithUTF8String:v18];
  uint64_t v8 = [NSString stringWithUTF8String:v17];
  v9 = [NSNumber numberWithUnsignedShort:bswap32(a3->var4) >> 16];
  int v10 = [NSNumber numberWithUnsignedShort:bswap32(a3->var5) >> 16];
  if ((a3->var1 & 4) != 0) {
    objc_super v11 = @"TCP";
  }
  else {
    objc_super v11 = @"UDP";
  }
  uint64_t v12 = v11;
  id v13 = objc_opt_new();
  [v13 setObject:v7 forKeyedSubscript:@"destIP"];
  [v13 setObject:v8 forKeyedSubscript:@"sourceIP"];
  id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue"));
  [v13 setObject:v14 forKeyedSubscript:@"destPort"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue"));
  [v13 setObject:v15 forKeyedSubscript:@"sourcePort"];

  [v13 setObject:v12 forKeyedSubscript:@"protocol"];
  return v13;
}

- (id)getLookupKeys:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  int v6 = [v4 objectForKeyedSubscript:@"destIP"];
  v7 = [v4 objectForKeyedSubscript:@"sourceIP"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"destPort"];
  v9 = [v4 objectForKeyedSubscript:@"sourcePort"];
  int v10 = [v4 objectForKeyedSubscript:@"protocol"];

  objc_super v11 = [(PLProcessPortMap *)self keyFromAddress:v6 withPort:v8 withSourceAddress:v7 withSourcePort:v9 withProtocol:v10];
  uint64_t v12 = [(PLProcessPortMap *)self keyForlenientLookup:v6 withPort:v8 withProtocol:v10];
  id v13 = [(PLProcessPortMap *)self keyForlocalPortLookup:v8 withProtocol:v10];
  id v14 = [(PLProcessPortMap *)self keyForIPAddrLookup:v6 withSourceAddress:v7];
  [v5 setObject:v11 forKeyedSubscript:@"strictLookupKey"];
  [v5 setObject:v12 forKeyedSubscript:@"lenientLookupKey"];
  [v5 setObject:v13 forKeyedSubscript:@"localPortLookupKey"];
  [v5 setObject:v14 forKeyedSubscript:@"ipAddrLookupKey"];

  return v5;
}

- (void)clearPortMapInternal
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __40__PLProcessPortMap_clearPortMapInternal__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v3;
    if (qword_1EBD5BD50 != -1) {
      dispatch_once(&qword_1EBD5BD50, &block);
    }
    if (byte_1EBD5BCD4)
    {
      id v4 = [NSString stringWithFormat:@"Clearing Pid:ProcPID map, old one: %@", self->_strictLookupMap, block, v15, v16, v17, v18];
      v5 = (void *)MEMORY[0x1E4F929B8];
      int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLProcessPortMap clearPortMapInternal]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:253];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  strictLookupMap = self->_strictLookupMap;
  self->_strictLookupMap = 0;

  lenientLookupMap = self->_lenientLookupMap;
  self->_lenientLookupMap = 0;

  localPortOnlyLookupMap = self->_localPortOnlyLookupMap;
  self->_localPortOnlyLookupMap = 0;

  ipAddrLookupMap = self->_ipAddrLookupMap;
  self->_ipAddrLookupMap = 0;
}

uint64_t __40__PLProcessPortMap_clearPortMapInternal__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD4 = result;
  return result;
}

- (void)reconstructPortMapInternal
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD5BD58 != -1) {
      dispatch_once(&qword_1EBD5BD58, block);
    }
    if (byte_1EBD5BCD5)
    {
      id v4 = [NSString stringWithFormat:@"Starting rebuilding of Port Map"];
      v5 = (void *)MEMORY[0x1E4F929B8];
      int v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLProcessPortMap reconstructPortMapInternal]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:262];

      v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)out = 138412290;
        *(void *)&out[4] = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", out, 0xCu);
      }
    }
  }
  size_t v71 = 0;
  size_t v72 = 0;
  if (sysctlbyname("net.link.generic.system.port_used.list", 0, &v71, 0, 0))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_180;
      v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v70[4] = v10;
      if (qword_1EBD5BD60 != -1) {
        dispatch_once(&qword_1EBD5BD60, v70);
      }
      if (byte_1EBD5BCD6)
      {
        objc_super v11 = [NSString stringWithFormat:@"Failed to read buffer size, errno: %d", *__error()];
        uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
        id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
        id v14 = [v13 lastPathComponent];
        uint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessPortMap reconstructPortMapInternal]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:269];

        uint64_t v16 = PLLogCommon();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
LABEL_14:

          return;
        }
        *(_DWORD *)out = 138412290;
        *(void *)&out[4] = v11;
LABEL_55:
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", out, 0xCu);
        goto LABEL_14;
      }
    }
    return;
  }
  v17 = (unsigned __int8 *)malloc_type_malloc(v71, 0x2175978DuLL);
  if (v17)
  {
    uint64_t v18 = v17;
    size_t v72 = v71;
    if (sysctlbyname("net.link.generic.system.port_used.list", v17, &v72, 0, 0))
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_52;
      }
      uint64_t v19 = objc_opt_class();
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_192;
      v68[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v68[4] = v19;
      if (qword_1EBD5BD70 != -1) {
        dispatch_once(&qword_1EBD5BD70, v68);
      }
      if (!byte_1EBD5BCD8) {
        goto LABEL_52;
      }
      id v20 = [NSString stringWithFormat:@"Failed to populate buffer, errno: %d", *__error()];
      uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
      id v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      id v23 = [v22 lastPathComponent];
      v24 = [NSString stringWithUTF8String:"-[PLProcessPortMap reconstructPortMapInternal]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:281];

      uint64_t v25 = PLLogCommon();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_22;
      }
      *(_DWORD *)out = 138412290;
      *(void *)&out[4] = v20;
    }
    else
    {
      v31 = (NSMutableDictionary *)objc_opt_new();
      strictLookupMap = self->_strictLookupMap;
      self->_strictLookupMap = v31;

      v33 = (NSMutableDictionary *)objc_opt_new();
      lenientLookupMap = self->_lenientLookupMap;
      self->_lenientLookupMap = v33;

      v35 = (NSMutableDictionary *)objc_opt_new();
      localPortOnlyLookupMap = self->_localPortOnlyLookupMap;
      self->_localPortOnlyLookupMap = v35;

      id v37 = (NSMutableDictionary *)objc_opt_new();
      ipAddrLookupMap = self->_ipAddrLookupMap;
      self->_ipAddrLookupMap = v37;

      if (*((_DWORD *)v18 + 2))
      {
        if (v18 + 172 <= &v18[v72])
        {
          unsigned int v39 = 1;
          v40 = v18;
          do
          {
            memset(out, 0, 37);
            uuid_unparse(v40 + 44, (char *)out);
            uint64_t v41 = *((unsigned int *)v40 + 25);
            uint64_t v42 = [NSString stringWithUTF8String:v40 + 121];
            uint64_t v43 = objc_opt_new();
            v44 = [NSNumber numberWithInt:v41];
            [v43 setPid:v44];

            [v43 setProcessName:v42];
            if (!v41
              && (*((_WORD *)v40 + 17) & 8) != 0
              && (unsigned __int16)((bswap32(*((unsigned __int16 *)v40 + 30)) >> 16) - 319) <= 1u)
            {
              [v43 setProcessName:@"TimeSync"];
            }
            uint64_t v45 = [(PLProcessPortMap *)self dictFromNetPortInfo:v40 + 32];
            v46 = [(PLProcessPortMap *)self getLookupKeys:v45];
            if (v46)
            {
              v47 = [(PLProcessPortMap *)self strictLookupMap];
              v48 = [v46 objectForKeyedSubscript:@"strictLookupKey"];
              [v47 setObject:v43 forKeyedSubscript:v48];

              v49 = [(PLProcessPortMap *)self lenientLookupMap];
              v50 = [v46 objectForKeyedSubscript:@"lenientLookupKey"];
              [v49 setObject:v43 forKeyedSubscript:v50];

              v51 = [(PLProcessPortMap *)self localPortOnlyLookupMap];
              v52 = [v46 objectForKeyedSubscript:@"localPortLookupKey"];
              [v51 setObject:v43 forKeyedSubscript:v52];

              uint64_t v53 = [(PLProcessPortMap *)self ipAddrLookupMap];
              v54 = [v46 objectForKeyedSubscript:@"ipAddrLookupKey"];
              [v53 setObject:v43 forKeyedSubscript:v54];
            }
            if (v39 >= *((_DWORD *)v18 + 2)) {
              break;
            }
            v55 = (unsigned __int8 *)(v40 + 312);
            v40 += 140;
            ++v39;
          }
          while (v55 <= &v18[v72]);
        }
        free(v18);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v56 = objc_opt_class();
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_208;
          v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v66[4] = v56;
          if (qword_1EBD5BD80 != -1) {
            dispatch_once(&qword_1EBD5BD80, v66);
          }
          if (byte_1EBD5BCDA)
          {
            objc_super v11 = [NSString stringWithFormat:@"Completed rebuilding Port Map"];
            v57 = (void *)MEMORY[0x1E4F929B8];
            v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
            v59 = [v58 lastPathComponent];
            v60 = [NSString stringWithUTF8String:"-[PLProcessPortMap reconstructPortMapInternal]"];
            [v57 logMessage:v11 fromFile:v59 fromFunction:v60 fromLineNumber:340];

            uint64_t v16 = PLLogCommon();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_14;
            }
            *(_DWORD *)out = 138412290;
            *(void *)&out[4] = v11;
            goto LABEL_55;
          }
        }
        return;
      }
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_52;
      }
      uint64_t v61 = objc_opt_class();
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_198;
      v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v67[4] = v61;
      if (qword_1EBD5BD78 != -1) {
        dispatch_once(&qword_1EBD5BD78, v67);
      }
      if (!byte_1EBD5BCD9)
      {
LABEL_52:
        free(v18);
        return;
      }
      id v20 = [NSString stringWithFormat:@"Port map is empty!"];
      uint64_t v62 = (void *)MEMORY[0x1E4F929B8];
      v63 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      uint64_t v64 = [v63 lastPathComponent];
      v65 = [NSString stringWithUTF8String:"-[PLProcessPortMap reconstructPortMapInternal]"];
      [v62 logMessage:v20 fromFile:v64 fromFunction:v65 fromLineNumber:296];

      uint64_t v25 = PLLogCommon();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
LABEL_22:

        goto LABEL_52;
      }
      *(_DWORD *)out = 138412290;
      *(void *)&out[4] = v20;
    }
    _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", out, 0xCu);
    goto LABEL_22;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v26 = objc_opt_class();
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_186;
    v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v69[4] = v26;
    if (qword_1EBD5BD68 != -1) {
      dispatch_once(&qword_1EBD5BD68, v69);
    }
    if (byte_1EBD5BCD7)
    {
      objc_super v11 = [NSString stringWithFormat:@"Failed to allocate buffer"];
      id v27 = (void *)MEMORY[0x1E4F929B8];
      id v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m"];
      id v29 = [v28 lastPathComponent];
      id v30 = [NSString stringWithUTF8String:"-[PLProcessPortMap reconstructPortMapInternal]"];
      [v27 logMessage:v11 fromFile:v29 fromFunction:v30 fromLineNumber:275];

      uint64_t v16 = PLLogCommon();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      *(_DWORD *)out = 138412290;
      *(void *)&out[4] = v11;
      goto LABEL_55;
    }
  }
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD5 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_180(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD6 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_186(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD7 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_192(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD8 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_198(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCD9 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_208(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5BCDA = result;
  return result;
}

- (NSMutableDictionary)strictLookupMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStrictLookupMap:(id)a3
{
}

- (NSMutableDictionary)lenientLookupMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLenientLookupMap:(id)a3
{
}

- (NSMutableDictionary)localPortOnlyLookupMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalPortOnlyLookupMap:(id)a3
{
}

- (NSMutableDictionary)ipAddrLookupMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIpAddrLookupMap:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ipAddrLookupMap, 0);
  objc_storeStrong((id *)&self->_localPortOnlyLookupMap, 0);
  objc_storeStrong((id *)&self->_lenientLookupMap, 0);
  objc_storeStrong((id *)&self->_strictLookupMap, 0);
}

@end